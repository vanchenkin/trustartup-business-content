FROM php:7.4-fpm-alpine

WORKDIR /var/www/html/

RUN apk --no-cache add oniguruma-dev postgresql-dev

# RUN docker-php-ext-install pdo pdo_pgsql mbstring openssl
RUN docker-php-ext-install pdo_pgsql

RUN php -r "readfile('http://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer

COPY . .

RUN composer install --no-dev