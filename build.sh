#!/usr/bin/env bash
set -o errexit

pip install -r requirements.txt

python manage.py collectstatic --no-input

python manage.py migrate

python manage.py shell -c "from django.contrib.auth.hashers import make_password;from django.contrib.auth.models import User; admin = User(username='username', email='user@example.com', password=make_password('password'), is_superuser=True,is_staff=True);admin.save()"