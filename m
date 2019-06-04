Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8166D34C7E
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 17:42:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BE6289A77;
	Tue,  4 Jun 2019 15:42:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD15C89A4B
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2019 15:42:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2EC00AEC8;
 Tue,  4 Jun 2019 15:42:06 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kraxel@redhat.com, airlied@redhat.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, maxime.ripard@bootlin.com,
 sean@poorly.run, sam@ravnborg.org, christian.koenig@amd.com
Subject: [PATCH 4/8] drm/ast: Pin framebuffer BO during dirty update
Date: Tue,  4 Jun 2019 17:41:57 +0200
Message-Id: <20190604154201.14460-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190604154201.14460-1-tzimmermann@suse.de>
References: <20190604154201.14460-1-tzimmermann@suse.de>
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

QW5vdGhlciBleHBsaWNpdCBsb2NrIG9wZXJhdGlvbiBvZiBhIEdFTSBWUkFNIEJPIGlzIGxvY2F0
ZWQgaW4gQVNUJ3MKZnJhbWVidWZmZXIgdXBkYXRlIGNvZGUuIEluc3RlYWQgb2YgbG9ja2luZyB0
aGUgQk8sIHdlIHBpbiBpdCB0byB3aGVyZXZlcgppdCBpcy4KClNpZ25lZC1vZmYtYnk6IFRob21h
cyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9h
c3QvYXN0X2ZiLmMgfCAzMCArKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBj
aGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9mYi5jIGIvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfZmIu
YwppbmRleCAwNWY0NTIyMmI3MDIuLjdkOTExMzkxYzljZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FzdC9hc3RfZmIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9mYi5jCkBA
IC00OCwzMiArNDgsMzIgQEAgc3RhdGljIHZvaWQgYXN0X2RpcnR5X3VwZGF0ZShzdHJ1Y3QgYXN0
X2ZiZGV2ICphZmJkZXYsCiAJCQkgICAgIGludCB4LCBpbnQgeSwgaW50IHdpZHRoLCBpbnQgaGVp
Z2h0KQogewogCWludCBpOwotCXN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqOwogCXN0cnVjdCBk
cm1fZ2VtX3ZyYW1fb2JqZWN0ICpnYm87CiAJaW50IHNyY19vZmZzZXQsIGRzdF9vZmZzZXQ7CiAJ
aW50IGJwcCA9IGFmYmRldi0+YWZiLmJhc2UuZm9ybWF0LT5jcHBbMF07Ci0JaW50IHJldCA9IC1F
QlVTWTsKKwlpbnQgcmV0OwogCXU4ICpkc3Q7CiAJYm9vbCB1bm1hcCA9IGZhbHNlOwogCWJvb2wg
c3RvcmVfZm9yX2xhdGVyID0gZmFsc2U7CiAJaW50IHgyLCB5MjsKIAl1bnNpZ25lZCBsb25nIGZs
YWdzOwogCi0Jb2JqID0gYWZiZGV2LT5hZmIub2JqOwotCWdibyA9IGRybV9nZW1fdnJhbV9vZl9n
ZW0ob2JqKTsKKwlnYm8gPSBkcm1fZ2VtX3ZyYW1fb2ZfZ2VtKGFmYmRldi0+YWZiLm9iaik7CiAK
LQkvKiBUcnkgdG8gbG9jayB0aGUgQk8uIElmIHdlIGZhaWwgd2l0aCAtRUJVU1kgdGhlbgotCSAq
IHRoZSBCTyBpcyBiZWluZyBtb3ZlZCBhbmQgd2Ugc2hvdWxkIHN0b3JlIHVwIHRoZQotCSAqIGRh
bWFnZSB1bnRpbCBsYXRlci4KKwkvKiBXZSBwaW4gdGhlIEJPIHRvIHN5c3RlbSBtZW1vcnkgc28g
aXQgd29uJ3QgYmUgbW92ZWQgZHVyaW5nCisJICogdGhlIHVwZGF0ZSBhbmQgZG9lc24ndCB3YXN0
ZSB2aWRlbyByYW0uIElmIHRoZSBCTyBpcyBhbHJlYWR5CisJICogbG9jYXRlZCBpbiBWUkFNLCB0
aGUgcGluIG9wZXJhdGlvbiB3aWxsIHNpbXBseSBpbmNyZW1lbnQgdGhlCisJICogcGluIGNvdW50
LgogCSAqLwotCWlmIChkcm1fY2FuX3NsZWVwKCkpCi0JCXJldCA9IGRybV9nZW1fdnJhbV9sb2Nr
KGdibywgdHJ1ZSk7Ci0JaWYgKHJldCkgewotCQlpZiAocmV0ICE9IC1FQlVTWSkKLQkJCXJldHVy
bjsKLQorCWlmIChkcm1fY2FuX3NsZWVwKCkpIHsKKwkJcmV0ID0gZHJtX2dlbV92cmFtX3Bpbihn
Ym8sIFRUTV9QTF9GTEFHX1NZU1RFTSk7CisJCWlmIChyZXQpIHsKKwkJCWlmIChyZXQgIT0gLUVC
VVNZKQorCQkJCXJldHVybjsKKwkJCXN0b3JlX2Zvcl9sYXRlciA9IHRydWU7CisJCX0KKwl9IGVs
c2UKIAkJc3RvcmVfZm9yX2xhdGVyID0gdHJ1ZTsKLQl9CiAKIAl4MiA9IHggKyB3aWR0aCAtIDE7
CiAJeTIgPSB5ICsgaGVpZ2h0IC0gMTsKQEAgLTEyNiw3ICsxMjYsNyBAQCBzdGF0aWMgdm9pZCBh
c3RfZGlydHlfdXBkYXRlKHN0cnVjdCBhc3RfZmJkZXYgKmFmYmRldiwKIAkJZHJtX2dlbV92cmFt
X2t1bm1hcChnYm8pOwogCiBvdXQ6Ci0JZHJtX2dlbV92cmFtX3VubG9jayhnYm8pOworCWRybV9n
ZW1fdnJhbV91bnBpbihnYm8pOwogfQogCiBzdGF0aWMgdm9pZCBhc3RfZmlsbHJlY3Qoc3RydWN0
IGZiX2luZm8gKmluZm8sCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
