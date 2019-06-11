Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0783CC78
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 15:04:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31E12891F9;
	Tue, 11 Jun 2019 13:04:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48947891BA
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 13:03:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A30FAAEBB;
 Tue, 11 Jun 2019 13:03:49 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kraxel@redhat.com, airlied@redhat.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, maxime.ripard@bootlin.com,
 sean@poorly.run, sam@ravnborg.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 6/9] drm/mgag200: Pin framebuffer BO during dirty update
Date: Tue, 11 Jun 2019 15:03:41 +0200
Message-Id: <20190611130344.18988-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190611130344.18988-1-tzimmermann@suse.de>
References: <20190611130344.18988-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW5vdGhlciBleHBsaWNpdCBsb2NrIG9wZXJhdGlvbiBvZiBhIEdFTSBWUkFNIEJPIGlzIGxvY2F0
ZWQgaW4gbWdhZzIwMCdzCmZyYW1lYnVmZmVyIHVwZGF0ZSBjb2RlLiBJbnN0ZWFkIG9mIGxvY2tp
bmcgdGhlIEJPLCB3ZSBwaW4gaXQgdG8gd2hlcmV2ZXIKaXQgaXMuCgp2MjoKCSogdXBkYXRlIHdp
dGggcGluIGZsYWcgb2YgMAoKU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1t
ZXJtYW5uQHN1c2UuZGU+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9mYi5j
IHwgMjcgKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTQgaW5z
ZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L21nYWcyMDAvbWdhZzIwMF9mYi5jIGIvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9m
Yi5jCmluZGV4IDM3ZThiOGNmMzdlYS4uMjA3ZGJlZTQ5MzhlIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX2ZiLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21nYWcy
MDAvbWdhZzIwMF9mYi5jCkBAIC0yMyw3ICsyMyw3IEBAIHN0YXRpYyB2b2lkIG1nYV9kaXJ0eV91
cGRhdGUoc3RydWN0IG1nYV9mYmRldiAqbWZiZGV2LAogCXN0cnVjdCBkcm1fZ2VtX3ZyYW1fb2Jq
ZWN0ICpnYm87CiAJaW50IHNyY19vZmZzZXQsIGRzdF9vZmZzZXQ7CiAJaW50IGJwcCA9IG1mYmRl
di0+bWZiLmJhc2UuZm9ybWF0LT5jcHBbMF07Ci0JaW50IHJldCA9IC1FQlVTWTsKKwlpbnQgcmV0
OwogCXU4ICpkc3Q7CiAJYm9vbCB1bm1hcCA9IGZhbHNlOwogCWJvb2wgc3RvcmVfZm9yX2xhdGVy
ID0gZmFsc2U7CkBAIC0zMywxOCArMzMsMTkgQEAgc3RhdGljIHZvaWQgbWdhX2RpcnR5X3VwZGF0
ZShzdHJ1Y3QgbWdhX2ZiZGV2ICptZmJkZXYsCiAJb2JqID0gbWZiZGV2LT5tZmIub2JqOwogCWdi
byA9IGRybV9nZW1fdnJhbV9vZl9nZW0ob2JqKTsKIAotCS8qIFRyeSB0byBsb2NrIHRoZSBCTy4g
SWYgd2UgZmFpbCB3aXRoIC1FQlVTWSB0aGVuCi0JICogdGhlIEJPIGlzIGJlaW5nIG1vdmVkIGFu
ZCB3ZSBzaG91bGQgc3RvcmUgdXAgdGhlCi0JICogZGFtYWdlIHVudGlsIGxhdGVyLgotCSAqLwot
CWlmIChkcm1fY2FuX3NsZWVwKCkpCi0JCXJldCA9IGRybV9nZW1fdnJhbV9sb2NrKGdibywgdHJ1
ZSk7Ci0JaWYgKHJldCkgewotCQlpZiAocmV0ICE9IC1FQlVTWSkKLQkJCXJldHVybjsKLQorCWlm
IChkcm1fY2FuX3NsZWVwKCkpIHsKKwkJLyogV2UgcGluIHRoZSBCTyBzbyBpdCB3b24ndCBiZSBt
b3ZlZCBkdXJpbmcgdGhlCisJCSAqIHVwZGF0ZS4gVGhlIGFjdHVhbCBsb2NhdGlvbiwgdmlkZW8g
UkFNIG9yIHN5c3RlbQorCQkgKiBtZW1vcnksIGlzIG5vdCBpbXBvcnRhbnQuCisJCSAqLworCQly
ZXQgPSBkcm1fZ2VtX3ZyYW1fcGluKGdibywgMCk7CisJCWlmIChyZXQpIHsKKwkJCWlmIChyZXQg
IT0gLUVCVVNZKQorCQkJCXJldHVybjsKKwkJCXN0b3JlX2Zvcl9sYXRlciA9IHRydWU7CisJCX0K
Kwl9IGVsc2UKIAkJc3RvcmVfZm9yX2xhdGVyID0gdHJ1ZTsKLQl9CiAKIAl4MiA9IHggKyB3aWR0
aCAtIDE7CiAJeTIgPSB5ICsgaGVpZ2h0IC0gMTsKQEAgLTk3LDcgKzk4LDcgQEAgc3RhdGljIHZv
aWQgbWdhX2RpcnR5X3VwZGF0ZShzdHJ1Y3QgbWdhX2ZiZGV2ICptZmJkZXYsCiAJCWRybV9nZW1f
dnJhbV9rdW5tYXAoZ2JvKTsKIAogb3V0OgotCWRybV9nZW1fdnJhbV91bmxvY2soZ2JvKTsKKwlk
cm1fZ2VtX3ZyYW1fdW5waW4oZ2JvKTsKIH0KIAogc3RhdGljIHZvaWQgbWdhX2ZpbGxyZWN0KHN0
cnVjdCBmYl9pbmZvICppbmZvLAotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
