FROM ruby:3.1.2-slim
ARG RUBYGEMS_VERSION=3.1.2

RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev nodejs \
    git libmariadb-dev mariadb-client
RUN gem install bundler
RUN mkdir /app
WORKDIR /app
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN bundle install
ADD . /app
