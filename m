Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41BF1AFC1E
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2019 14:04:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A70F6EAC9;
	Wed, 11 Sep 2019 12:04:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9582E6EAC9
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2019 12:04:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C4924B61B;
 Wed, 11 Sep 2019 12:04:29 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kraxel@redhat.com, daniel@ffwll.ch, airlied@linux.ie, sam@ravnborg.org,
 yc_chen@aspeedtech.com
Subject: [PATCH 2/3] drm/ast: Use drm_gem_vram_{vmap,
 vunmap}() to map cursor source BO
Date: Wed, 11 Sep 2019 14:03:51 +0200
Message-Id: <20190911120352.20084-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190911120352.20084-1-tzimmermann@suse.de>
References: <20190911120352.20084-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIFZSQU0gaGVscGVyJ3Mgdm1hcCBpbnRlcmZhY2VzIHByb3ZpZGUgcGlubmluZyBhbmQgbWFw
cGluZyBvZiBCTwptZW1vcnkuIFRoaXMgcGF0Y2ggcmVwbGFjZXMgdGhlIHJlc3BlY3RpdmUgY29k
ZSBpbiBhc3QgY3Vyc29yIGhhbmRsaW5nLgoKU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1h
bm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbW9k
ZS5jIHwgMjEgKysrKysrKy0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRp
b25zKCspLCAxNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXN0
L2FzdF9tb2RlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tb2RlLmMKaW5kZXggZDM0OWM3
MjE1MDFjLi41ZjRkZTAzZmY5ZGUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0
X21vZGUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tb2RlLmMKQEAgLTExNzksMjYg
KzExNzksMjIgQEAgc3RhdGljIGludCBhc3RfY3Vyc29yX3NldChzdHJ1Y3QgZHJtX2NydGMgKmNy
dGMsCiAJCXJldHVybiAtRU5PRU5UOwogCX0KIAlnYm8gPSBkcm1fZ2VtX3ZyYW1fb2ZfZ2VtKG9i
aik7Ci0KLQlyZXQgPSBkcm1fZ2VtX3ZyYW1fcGluKGdibywgMCk7Ci0JaWYgKHJldCkKLQkJZ290
byBlcnJfZHJtX2dlbV9vYmplY3RfcHV0X3VubG9ja2VkOwotCXNyYyA9IGRybV9nZW1fdnJhbV9r
bWFwKGdibywgdHJ1ZSwgTlVMTCk7CisJc3JjID0gZHJtX2dlbV92cmFtX3ZtYXAoZ2JvKTsKIAlp
ZiAoSVNfRVJSKHNyYykpIHsKIAkJcmV0ID0gUFRSX0VSUihzcmMpOwotCQlnb3RvIGVycl9kcm1f
Z2VtX3ZyYW1fdW5waW47CisJCWdvdG8gZXJyX2RybV9nZW1fb2JqZWN0X3B1dF91bmxvY2tlZDsK
IAl9CiAKIAlkc3QgPSBkcm1fZ2VtX3ZyYW1fa21hcChkcm1fZ2VtX3ZyYW1fb2ZfZ2VtKGFzdC0+
Y3Vyc29yX2NhY2hlKSwKIAkJCQlmYWxzZSwgTlVMTCk7CiAJaWYgKElTX0VSUihkc3QpKSB7CiAJ
CXJldCA9IFBUUl9FUlIoZHN0KTsKLQkJZ290byBlcnJfZHJtX2dlbV92cmFtX2t1bm1hcDsKKwkJ
Z290byBlcnJfZHJtX2dlbV92cmFtX3Z1bm1hcDsKIAl9CiAJZHN0X2dwdSA9IGRybV9nZW1fdnJh
bV9vZmZzZXQoZHJtX2dlbV92cmFtX29mX2dlbShhc3QtPmN1cnNvcl9jYWNoZSkpOwogCWlmIChk
c3RfZ3B1IDwgMCkgewogCQlyZXQgPSAoaW50KWRzdF9ncHU7Ci0JCWdvdG8gZXJyX2RybV9nZW1f
dnJhbV9rdW5tYXA7CisJCWdvdG8gZXJyX2RybV9nZW1fdnJhbV92dW5tYXA7CiAJfQogCiAJZHN0
ICs9IChBU1RfSFdDX1NJWkUgKyBBU1RfSFdDX1NJR05BVFVSRV9TSVpFKSphc3QtPm5leHRfY3Vy
c29yOwpAQCAtMTIzMywxNiArMTIyOSwxMyBAQCBzdGF0aWMgaW50IGFzdF9jdXJzb3Jfc2V0KHN0
cnVjdCBkcm1fY3J0YyAqY3J0YywKIAogCWFzdF9zaG93X2N1cnNvcihjcnRjKTsKIAotCWRybV9n
ZW1fdnJhbV9rdW5tYXAoZ2JvKTsKLQlkcm1fZ2VtX3ZyYW1fdW5waW4oZ2JvKTsKKwlkcm1fZ2Vt
X3ZyYW1fdnVubWFwKGdibywgc3JjKTsKIAlkcm1fZ2VtX29iamVjdF9wdXRfdW5sb2NrZWQob2Jq
KTsKIAogCXJldHVybiAwOwogCi1lcnJfZHJtX2dlbV92cmFtX2t1bm1hcDoKLQlkcm1fZ2VtX3Zy
YW1fa3VubWFwKGdibyk7Ci1lcnJfZHJtX2dlbV92cmFtX3VucGluOgotCWRybV9nZW1fdnJhbV91
bnBpbihnYm8pOworZXJyX2RybV9nZW1fdnJhbV92dW5tYXA6CisJZHJtX2dlbV92cmFtX3Z1bm1h
cChnYm8sIHNyYyk7CiBlcnJfZHJtX2dlbV9vYmplY3RfcHV0X3VubG9ja2VkOgogCWRybV9nZW1f
b2JqZWN0X3B1dF91bmxvY2tlZChvYmopOwogCXJldHVybiByZXQ7Ci0tIAoyLjIzLjAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
