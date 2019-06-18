Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F1049FD3
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 13:55:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0209B6E159;
	Tue, 18 Jun 2019 11:55:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E98136E14E;
 Tue, 18 Jun 2019 11:54:59 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id 207so2936513wma.1;
 Tue, 18 Jun 2019 04:54:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SCmQnmcY4NzqY/5Bf7A5cP+mrIFdJrWjkKa1PaxVDnc=;
 b=srltVMNPztRnEXS+LQNp4QInG86n9cQ4gTS0FOLn6gHKXoD8empROHJJWBhbQsaqx6
 ejgEPkdzjY8YYgeA+bE0ej9Ekfk1ZpUlpUetBwtdCEIYVD/uOaH3bRXHKwdntLifzwcx
 ctM4/t4N2phlllWJvgApz/HwP0VUhtZBYCLF9rvWpOElBsj9nMgVFYpZ10u09A/lZ9wF
 keYo/2fYGCbOa8mknmrN5UQn4sNlF9uMt9lfAj46q0dWfHQJCcZbbk/bb/KafLvY+UJ7
 10Fb1eJk+Jbm9MjvwFj2bRce6PAdcD1xmEm5lhLhtkhfjOSYvB3niB3bPTp+QKFSISPz
 DcTQ==
X-Gm-Message-State: APjAAAVZFUeyxCHTmmKdi25PSccdcl0jJzUWAI9PiLEOYYURUO8PO1ty
 ycnEP53l/6zCz7qBg4JuR8j1GPMt
X-Google-Smtp-Source: APXvYqzL2TZQ3gtF55ci/kRnyjY5L8uNTKCxobPc+nS8Wzo8MxvMxg/ig57UTAO5IXmEMojiTAskyg==
X-Received: by 2002:a1c:e0c4:: with SMTP id x187mr3143826wmg.177.1560858898435; 
 Tue, 18 Jun 2019 04:54:58 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:88da:f390:6b90:ca6c])
 by smtp.gmail.com with ESMTPSA id l19sm1441963wmj.33.2019.06.18.04.54.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 18 Jun 2019 04:54:58 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH 3/6] drm/ttm: use the parent resv for ghost objects v2
Date: Tue, 18 Jun 2019 13:54:52 +0200
Message-Id: <20190618115455.1253-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190618115455.1253-1-christian.koenig@amd.com>
References: <20190618115455.1253-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=SCmQnmcY4NzqY/5Bf7A5cP+mrIFdJrWjkKa1PaxVDnc=;
 b=Rb16caAwZroheUDSnXz+JDTv6hNbfHxzZ4Bc3dgBprOlDhexjKMjKrYeLoVLpMhrWI
 q/KA0ktAR+PuBVo1Cz/nuqfk1XCSiwpF4+EbMZEyJUibuWwyZeLhZ5W3YIquxJaFqZiZ
 ii6IhC8kpw4gbdNrhDiDiamG4HLaHvgOKVTV1qhVhVGuxqWBAVpKk8KxTOL+hpd+TeL9
 EDyWO/jTpjXhbHkm4geDowmo9v2im5pfp0bt8YhReuge8nsoCo5hybtMce/0+9y5NFV/
 /d+YoVw/RR1rKDw2zCRKy+LE1S9yVgqeyMDv9+1p2KjlSzIqY2coy6Q9xeeQBNltLPIE
 c3Fg==
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

VGhpcyB3YXkgd2UgY2FuIGV2ZW4gcGlwZWxpbmUgaW1wb3J0ZWQgQk8gZXZpY3Rpb25zLgoKdjI6
IExpbWl0IHRoaXMgdG8gb25seSBjYXNlcyB3aGVuIHRoZSBwYXJlbnQgb2JqZWN0IHVzZXMgYSBz
ZXBhcmF0ZQogICAgcmVzZXJ2YXRpb24gb2JqZWN0IGFzIHdlbGwuIFRoaXMgZml4ZXMgYW5vdGhl
ciBPT00gcHJvYmxlbS4KClNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlh
bi5rb2VuaWdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib191dGlsLmMg
fCAyMCArKysrKysrKysrKy0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMo
KyksIDkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1f
Ym9fdXRpbC5jIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdXRpbC5jCmluZGV4IDg5NWQ3
N2Q3OTllNC4uOTVmNDdkNjg1OTIxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0
bV9ib191dGlsLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdXRpbC5jCkBAIC01
MTcsOSArNTE3LDExIEBAIHN0YXRpYyBpbnQgdHRtX2J1ZmZlcl9vYmplY3RfdHJhbnNmZXIoc3Ry
dWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywKIAlrcmVmX2luaXQoJmZiby0+YmFzZS5rcmVmKTsK
IAlmYm8tPmJhc2UuZGVzdHJveSA9ICZ0dG1fdHJhbnNmZXJlZF9kZXN0cm95OwogCWZiby0+YmFz
ZS5hY2Nfc2l6ZSA9IDA7Ci0JZmJvLT5iYXNlLnJlc3YgPSAmZmJvLT5iYXNlLnR0bV9yZXN2Owot
CXJlc2VydmF0aW9uX29iamVjdF9pbml0KGZiby0+YmFzZS5yZXN2KTsKLQlyZXQgPSByZXNlcnZh
dGlvbl9vYmplY3RfdHJ5bG9jayhmYm8tPmJhc2UucmVzdik7CisJaWYgKGJvLT5yZXN2ID09ICZi
by0+dHRtX3Jlc3YpCisJCWZiby0+YmFzZS5yZXN2ID0gJmZiby0+YmFzZS50dG1fcmVzdjsKKwor
CXJlc2VydmF0aW9uX29iamVjdF9pbml0KCZmYm8tPmJhc2UudHRtX3Jlc3YpOworCXJldCA9IHJl
c2VydmF0aW9uX29iamVjdF90cnlsb2NrKCZmYm8tPmJhc2UudHRtX3Jlc3YpOwogCVdBUk5fT04o
IXJldCk7CiAKIAkqbmV3X29iaiA9ICZmYm8tPmJhc2U7CkBAIC03MTYsNyArNzE4LDcgQEAgaW50
IHR0bV9ib19tb3ZlX2FjY2VsX2NsZWFudXAoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywK
IAkJaWYgKHJldCkKIAkJCXJldHVybiByZXQ7CiAKLQkJcmVzZXJ2YXRpb25fb2JqZWN0X2FkZF9l
eGNsX2ZlbmNlKGdob3N0X29iai0+cmVzdiwgZmVuY2UpOworCQlyZXNlcnZhdGlvbl9vYmplY3Rf
YWRkX2V4Y2xfZmVuY2UoJmdob3N0X29iai0+dHRtX3Jlc3YsIGZlbmNlKTsKIAogCQkvKioKIAkJ
ICogSWYgd2UncmUgbm90IG1vdmluZyB0byBmaXhlZCBtZW1vcnksIHRoZSBUVE0gb2JqZWN0CkBA
IC03MjksNyArNzMxLDcgQEAgaW50IHR0bV9ib19tb3ZlX2FjY2VsX2NsZWFudXAoc3RydWN0IHR0
bV9idWZmZXJfb2JqZWN0ICpibywKIAkJZWxzZQogCQkJYm8tPnR0bSA9IE5VTEw7CiAKLQkJdHRt
X2JvX3VucmVzZXJ2ZShnaG9zdF9vYmopOworCQlyZXNlcnZhdGlvbl9vYmplY3RfdW5sb2NrKCZn
aG9zdF9vYmotPnR0bV9yZXN2KTsKIAkJdHRtX2JvX3B1dChnaG9zdF9vYmopOwogCX0KIApAQCAt
NzcyLDcgKzc3NCw3IEBAIGludCB0dG1fYm9fcGlwZWxpbmVfbW92ZShzdHJ1Y3QgdHRtX2J1ZmZl
cl9vYmplY3QgKmJvLAogCQlpZiAocmV0KQogCQkJcmV0dXJuIHJldDsKIAotCQlyZXNlcnZhdGlv
bl9vYmplY3RfYWRkX2V4Y2xfZmVuY2UoZ2hvc3Rfb2JqLT5yZXN2LCBmZW5jZSk7CisJCXJlc2Vy
dmF0aW9uX29iamVjdF9hZGRfZXhjbF9mZW5jZSgmZ2hvc3Rfb2JqLT50dG1fcmVzdiwgZmVuY2Up
OwogCiAJCS8qKgogCQkgKiBJZiB3ZSdyZSBub3QgbW92aW5nIHRvIGZpeGVkIG1lbW9yeSwgdGhl
IFRUTSBvYmplY3QKQEAgLTc4NSw3ICs3ODcsNyBAQCBpbnQgdHRtX2JvX3BpcGVsaW5lX21vdmUo
c3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywKIAkJZWxzZQogCQkJYm8tPnR0bSA9IE5VTEw7
CiAKLQkJdHRtX2JvX3VucmVzZXJ2ZShnaG9zdF9vYmopOworCQlyZXNlcnZhdGlvbl9vYmplY3Rf
dW5sb2NrKCZnaG9zdF9vYmotPnR0bV9yZXN2KTsKIAkJdHRtX2JvX3B1dChnaG9zdF9vYmopOwog
CiAJfSBlbHNlIGlmIChmcm9tLT5mbGFncyAmIFRUTV9NRU1UWVBFX0ZMQUdfRklYRUQpIHsKQEAg
LTg0MSw3ICs4NDMsNyBAQCBpbnQgdHRtX2JvX3BpcGVsaW5lX2d1dHRpbmcoc3RydWN0IHR0bV9i
dWZmZXJfb2JqZWN0ICpibykKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwogCi0JcmV0ID0gcmVz
ZXJ2YXRpb25fb2JqZWN0X2NvcHlfZmVuY2VzKGdob3N0LT5yZXN2LCBiby0+cmVzdik7CisJcmV0
ID0gcmVzZXJ2YXRpb25fb2JqZWN0X2NvcHlfZmVuY2VzKCZnaG9zdC0+dHRtX3Jlc3YsIGJvLT5y
ZXN2KTsKIAkvKiBMYXN0IHJlc29ydCwgd2FpdCBmb3IgdGhlIEJPIHRvIGJlIGlkbGUgd2hlbiB3
ZSBhcmUgT09NICovCiAJaWYgKHJldCkKIAkJdHRtX2JvX3dhaXQoYm8sIGZhbHNlLCBmYWxzZSk7
CkBAIC04NTAsNyArODUyLDcgQEAgaW50IHR0bV9ib19waXBlbGluZV9ndXR0aW5nKHN0cnVjdCB0
dG1fYnVmZmVyX29iamVjdCAqYm8pCiAJYm8tPm1lbS5tZW1fdHlwZSA9IFRUTV9QTF9TWVNURU07
CiAJYm8tPnR0bSA9IE5VTEw7CiAKLQl0dG1fYm9fdW5yZXNlcnZlKGdob3N0KTsKKwlyZXNlcnZh
dGlvbl9vYmplY3RfdW5sb2NrKCZnaG9zdC0+dHRtX3Jlc3YpOwogCXR0bV9ib19wdXQoZ2hvc3Qp
OwogCiAJcmV0dXJuIDA7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
