Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5627EAFC1D
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2019 14:04:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA8666EAC6;
	Wed, 11 Sep 2019 12:04:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FD606EAC8
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2019 12:04:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C0D2CB613;
 Wed, 11 Sep 2019 12:04:29 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kraxel@redhat.com, daniel@ffwll.ch, airlied@linux.ie, sam@ravnborg.org,
 yc_chen@aspeedtech.com
Subject: [PATCH 3/3] drm/mgag200: Use drm_gem_vram_{vmap,
 vunmap}() to map cursor source BO
Date: Wed, 11 Sep 2019 14:03:52 +0200
Message-Id: <20190911120352.20084-4-tzimmermann@suse.de>
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
ZSBpbiBtZ2FnMjAwIGN1cnNvciBoYW5kbGluZy4KClNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1t
ZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tZ2FnMjAw
L21nYWcyMDBfY3Vyc29yLmMgfCAyMiArKysrKysrLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hh
bmdlZCwgNyBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX2N1cnNvci5jIGIvZHJpdmVycy9ncHUvZHJtL21n
YWcyMDAvbWdhZzIwMF9jdXJzb3IuYwppbmRleCAyODljZTNlMjkwMzIuLjg5ZjYxNTczYTQ5NyAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9jdXJzb3IuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX2N1cnNvci5jCkBAIC04NSwxNyArODUs
MTIgQEAgaW50IG1nYV9jcnRjX2N1cnNvcl9zZXQoc3RydWN0IGRybV9jcnRjICpjcnRjLAogCWlm
ICghb2JqKQogCQlyZXR1cm4gLUVOT0VOVDsKIAlnYm8gPSBkcm1fZ2VtX3ZyYW1fb2ZfZ2VtKG9i
aik7Ci0JcmV0ID0gZHJtX2dlbV92cmFtX3BpbihnYm8sIDApOwotCWlmIChyZXQpIHsKLQkJZGV2
X2VycigmZGV2LT5wZGV2LT5kZXYsICJmYWlsZWQgdG8gbG9jayB1c2VyIGJvXG4iKTsKLQkJZ290
byBlcnJfZHJtX2dlbV9vYmplY3RfcHV0X3VubG9ja2VkOwotCX0KLQlzcmMgPSBkcm1fZ2VtX3Zy
YW1fa21hcChnYm8sIHRydWUsIE5VTEwpOworCXNyYyA9IGRybV9nZW1fdnJhbV92bWFwKGdibyk7
CiAJaWYgKElTX0VSUihzcmMpKSB7CiAJCXJldCA9IFBUUl9FUlIoc3JjKTsKIAkJZGV2X2Vycigm
ZGV2LT5wZGV2LT5kZXYsCi0JCQkiZmFpbGVkIHRvIGttYXAgdXNlciBidWZmZXIgdXBkYXRlc1xu
Iik7Ci0JCWdvdG8gZXJyX2RybV9nZW1fdnJhbV91bnBpbl9zcmM7CisJCQkiZmFpbGVkIHRvIG1h
cCB1c2VyIGJ1ZmZlciB1cGRhdGVzXG4iKTsKKwkJZ290byBlcnJfZHJtX2dlbV9vYmplY3RfcHV0
X3VubG9ja2VkOwogCX0KIAogCS8qIFBpbiBhbmQgbWFwIHVwLWNvbWluZyBidWZmZXIgdG8gd3Jp
dGUgY29sb3VyIGluZGljZXMgKi8KQEAgLTEwMyw3ICs5OCw3IEBAIGludCBtZ2FfY3J0Y19jdXJz
b3Jfc2V0KHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKIAlpZiAocmV0KSB7CiAJCWRldl9lcnIoJmRl
di0+cGRldi0+ZGV2LAogCQkJImZhaWxlZCB0byBwaW4gY3Vyc29yIGJ1ZmZlcjogJWRcbiIsIHJl
dCk7Ci0JCWdvdG8gZXJyX2RybV9nZW1fdnJhbV9rdW5tYXBfc3JjOworCQlnb3RvIGVycl9kcm1f
Z2VtX3ZyYW1fdnVubWFwOwogCX0KIAlkc3QgPSBkcm1fZ2VtX3ZyYW1fa21hcChwaXhlbHNfbmV4
dCwgdHJ1ZSwgTlVMTCk7CiAJaWYgKElTX0VSUihkc3QpKSB7CkBAIC0yMTMsOCArMjA4LDcgQEAg
aW50IG1nYV9jcnRjX2N1cnNvcl9zZXQoc3RydWN0IGRybV9jcnRjICpjcnRjLAogCW1kZXYtPmN1
cnNvci5waXhlbHNfY3VycmVudCA9IHBpeGVsc19uZXh0OwogCiAJZHJtX2dlbV92cmFtX2t1bm1h
cChwaXhlbHNfbmV4dCk7Ci0JZHJtX2dlbV92cmFtX2t1bm1hcChnYm8pOwotCWRybV9nZW1fdnJh
bV91bnBpbihnYm8pOworCWRybV9nZW1fdnJhbV92dW5tYXAoZ2JvLCBzcmMpOwogCWRybV9nZW1f
b2JqZWN0X3B1dF91bmxvY2tlZChvYmopOwogCiAJcmV0dXJuIDA7CkBAIC0yMjMsMTAgKzIxNyw4
IEBAIGludCBtZ2FfY3J0Y19jdXJzb3Jfc2V0KHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKIAlkcm1f
Z2VtX3ZyYW1fa3VubWFwKHBpeGVsc19uZXh0KTsKIGVycl9kcm1fZ2VtX3ZyYW1fdW5waW5fZHN0
OgogCWRybV9nZW1fdnJhbV91bnBpbihwaXhlbHNfbmV4dCk7Ci1lcnJfZHJtX2dlbV92cmFtX2t1
bm1hcF9zcmM6Ci0JZHJtX2dlbV92cmFtX2t1bm1hcChnYm8pOwotZXJyX2RybV9nZW1fdnJhbV91
bnBpbl9zcmM6Ci0JZHJtX2dlbV92cmFtX3VucGluKGdibyk7CitlcnJfZHJtX2dlbV92cmFtX3Z1
bm1hcDoKKwlkcm1fZ2VtX3ZyYW1fdnVubWFwKGdibywgc3JjKTsKIGVycl9kcm1fZ2VtX29iamVj
dF9wdXRfdW5sb2NrZWQ6CiAJZHJtX2dlbV9vYmplY3RfcHV0X3VubG9ja2VkKG9iaik7CiAJcmV0
dXJuIHJldDsKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
