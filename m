Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB104C053B
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2019 14:34:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD4246E105;
	Fri, 27 Sep 2019 12:34:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D881F6E105;
 Fri, 27 Sep 2019 12:34:28 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id r5so2508603wrm.12;
 Fri, 27 Sep 2019 05:34:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o19sxLpk3Hj8r2gNIAnSqFIx2xnFxafBWLCAbODLwys=;
 b=Gsa9Na30l52u+shPBNP2YUH+uqzxXETYSwZ3nwMMAN+qLuS7qFZlnRwMKpjmFdDACY
 KhUcWwmh434fo+9y+3P8a2zt7ohTABE06k9x0bSe6qK9QOvOM7qzwBJEELtzzRv7udKE
 FEVip321Kntdwg/bU2Ox8qCDW6NlD2u6iKIystdT4qd2ucTMkY2jL6ZVF/Q2/ZM4BTIk
 QOzSmQmQGh/GqXh5jrSS78kFfBtNS0R1YsB81zbbVvTtY6X/tRfFdtibeg7yZzOguI3T
 QBfcWTp3fWO4MzmGvNv2rRCWG4LSFq+VUia56kkdDu7zHXsuYaqw7TMplDVGiaRBm4xM
 3vnA==
X-Gm-Message-State: APjAAAVHJwiKa567yzCN50VFHwTSdRgTEOW7pzGERZ7NLlOsiL7r6cQ/
 Ud0HbK0kL0zx4EfCyd0tg3gqr3qE
X-Google-Smtp-Source: APXvYqwdPPsN5i8vP8QSaG6dmYSPmx0VwAptoD8GohIbGm3K9LzAzTEoXijVmmWlfIrdvEH824TIRw==
X-Received: by 2002:a5d:62c8:: with SMTP id o8mr2750877wrv.350.1569587667353; 
 Fri, 27 Sep 2019 05:34:27 -0700 (PDT)
Received: from baker.fritz.box ([2a02:908:1252:fb60:2d04:d861:e9c6:56ab])
 by smtp.gmail.com with ESMTPSA id w7sm4639887wmd.22.2019.09.27.05.34.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 27 Sep 2019 05:34:27 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/radeon: finally fix the racy VMA setup
Date: Fri, 27 Sep 2019 14:34:25 +0200
Message-Id: <20190927123425.17513-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20190927123425.17513-1-christian.koenig@amd.com>
References: <20190927123425.17513-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=o19sxLpk3Hj8r2gNIAnSqFIx2xnFxafBWLCAbODLwys=;
 b=MXBtdmuxwmx2iDYs9bkYOIleddYrUBfHVNKhe8K3VUed3E3pRkXX5pTYgf5q+XXuqb
 KWD5dBY2j7UD2fkVinyH7BV+AvEllOeV6254HeFe/1Psb2MnNJccTRQTZNnx6aqpbdG6
 Fv2wZQb/o1hfeNp9BhwuD291De8USwYt+0lPR5PFEGuxYuw9vReGSMeWAiBzH3q/mqkX
 cJgK5OE8Tuhr2QQWdJOypsbRnBDkW8KVtDNxI9Nmg4/pTUokYZCUgIAcvxvQg9uRQrDQ
 jhquxyZLejr8GRpSCBX/EsQausL6URoEwutqsOCwhCVN6EKlpF2vZWKVUUUzC1DHxOEN
 FkoQ==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RmluYWxseSBjbGVhbiB1cCB0aGUgVk1BIHNldHVwIGZvciByYWRlb24gbm93IHRoYXQgVFRNIGV4
cG9ydHMgdGhlCm5lY2Vzc2FyeSBmdW5jdGlvbnMuCgpOb3QgZnVuY3Rpb25hbCBjaGFuZ2UsIGJ1
dCBvbmx5IGNvbXBpbGUgdGVzdGVkLgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8
Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFk
ZW9uX3R0bS5jIHwgMjkgKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCAxNCBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl90dG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24v
cmFkZW9uX3R0bS5jCmluZGV4IGEwNWUxMDcyNGQ0Ni4uZjNlZjMwNGE2N2VlIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl90dG0uYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vcmFkZW9uL3JhZGVvbl90dG0uYwpAQCAtODgwLDkgKzg4MCw2IEBAIHZvaWQgcmFkZW9uX3R0
bV9zZXRfYWN0aXZlX3ZyYW1fc2l6ZShzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldiwgdTY0IHNp
emUpCiAJbWFuLT5zaXplID0gc2l6ZSA+PiBQQUdFX1NISUZUOwogfQogCi1zdGF0aWMgc3RydWN0
IHZtX29wZXJhdGlvbnNfc3RydWN0IHJhZGVvbl90dG1fdm1fb3BzOwotc3RhdGljIGNvbnN0IHN0
cnVjdCB2bV9vcGVyYXRpb25zX3N0cnVjdCAqdHRtX3ZtX29wcyA9IE5VTEw7Ci0KIHN0YXRpYyB2
bV9mYXVsdF90IHJhZGVvbl90dG1fZmF1bHQoc3RydWN0IHZtX2ZhdWx0ICp2bWYpCiB7CiAJc3Ry
dWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibzsKQEAgLTg5MCwzNCArODg3LDM2IEBAIHN0YXRpYyB2
bV9mYXVsdF90IHJhZGVvbl90dG1fZmF1bHQoc3RydWN0IHZtX2ZhdWx0ICp2bWYpCiAJdm1fZmF1
bHRfdCByZXQ7CiAKIAlibyA9IChzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKil2bWYtPnZtYS0+
dm1fcHJpdmF0ZV9kYXRhOwotCWlmIChibyA9PSBOVUxMKSB7CisJaWYgKGJvID09IE5VTEwpCiAJ
CXJldHVybiBWTV9GQVVMVF9OT1BBR0U7Ci0JfQorCiAJcmRldiA9IHJhZGVvbl9nZXRfcmRldihi
by0+YmRldik7CiAJZG93bl9yZWFkKCZyZGV2LT5wbS5tY2xrX2xvY2spOwotCXJldCA9IHR0bV92
bV9vcHMtPmZhdWx0KHZtZik7CisJcmV0ID0gdHRtX2JvX3ZtX2ZhdWx0KHZtZik7CiAJdXBfcmVh
ZCgmcmRldi0+cG0ubWNsa19sb2NrKTsKIAlyZXR1cm4gcmV0OwogfQogCitzdGF0aWMgc3RydWN0
IHZtX29wZXJhdGlvbnNfc3RydWN0IHJhZGVvbl90dG1fdm1fb3BzID0geworCS5mYXVsdCA9IHJh
ZGVvbl90dG1fZmF1bHQsCisJLm9wZW4gPSB0dG1fYm9fdm1fb3BlbiwKKwkuY2xvc2UgPSB0dG1f
Ym9fdm1fY2xvc2UsCisJLmFjY2VzcyA9IHR0bV9ib192bV9hY2Nlc3MKK307CisKIGludCByYWRl
b25fbW1hcChzdHJ1Y3QgZmlsZSAqZmlscCwgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpCiB7
CiAJaW50IHI7CiAJc3RydWN0IGRybV9maWxlICpmaWxlX3ByaXYgPSBmaWxwLT5wcml2YXRlX2Rh
dGE7CiAJc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYgPSBmaWxlX3ByaXYtPm1pbm9yLT5kZXYt
PmRldl9wcml2YXRlOwogCi0JaWYgKHJkZXYgPT0gTlVMTCkgeworCWlmIChyZGV2ID09IE5VTEwp
CiAJCXJldHVybiAtRUlOVkFMOwotCX0KKwogCXIgPSB0dG1fYm9fbW1hcChmaWxwLCB2bWEsICZy
ZGV2LT5tbWFuLmJkZXYpOwotCWlmICh1bmxpa2VseShyICE9IDApKSB7CisJaWYgKHVubGlrZWx5
KHIgIT0gMCkpCiAJCXJldHVybiByOwotCX0KLQlpZiAodW5saWtlbHkodHRtX3ZtX29wcyA9PSBO
VUxMKSkgewotCQl0dG1fdm1fb3BzID0gdm1hLT52bV9vcHM7Ci0JCXJhZGVvbl90dG1fdm1fb3Bz
ID0gKnR0bV92bV9vcHM7Ci0JCXJhZGVvbl90dG1fdm1fb3BzLmZhdWx0ID0gJnJhZGVvbl90dG1f
ZmF1bHQ7Ci0JfQorCiAJdm1hLT52bV9vcHMgPSAmcmFkZW9uX3R0bV92bV9vcHM7CiAJcmV0dXJu
IDA7CiB9Ci0tIAoyLjE0LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
