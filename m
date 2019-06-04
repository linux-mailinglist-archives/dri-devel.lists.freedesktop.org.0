Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 821FD34C7D
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 17:42:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 931FB89A72;
	Tue,  4 Jun 2019 15:42:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CC1989A62
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2019 15:42:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7D2BAAEFC;
 Tue,  4 Jun 2019 15:42:06 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kraxel@redhat.com, airlied@redhat.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, maxime.ripard@bootlin.com,
 sean@poorly.run, sam@ravnborg.org, christian.koenig@amd.com
Subject: [PATCH 5/8] drm/mgag200: Pin framebuffer BO during dirty update
Date: Tue,  4 Jun 2019 17:41:58 +0200
Message-Id: <20190604154201.14460-6-tzimmermann@suse.de>
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
ZWQgaW4gbWdhZzIwMCdzCmZyYW1lYnVmZmVyIHVwZGF0ZSBjb2RlLiBJbnN0ZWFkIG9mIGxvY2tp
bmcgdGhlIEJPLCB3ZSBwaW4gaXQgdG8gd2hlcmV2ZXIKaXQgaXMuCgpTaWduZWQtb2ZmLWJ5OiBU
aG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vbWdhZzIwMC9tZ2FnMjAwX2ZiLmMgfCAyNiArKysrKysrKysrKysrKy0tLS0tLS0tLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfZmIuYyBiL2RyaXZlcnMvZ3B1
L2RybS9tZ2FnMjAwL21nYWcyMDBfZmIuYwppbmRleCA5N2M1NzVhOWE4NmYuLmRiY2YxNzlhMTIw
YyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9mYi5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfZmIuYwpAQCAtMjYsNyArMjYsNyBAQCBz
dGF0aWMgdm9pZCBtZ2FfZGlydHlfdXBkYXRlKHN0cnVjdCBtZ2FfZmJkZXYgKm1mYmRldiwKIAlz
dHJ1Y3QgZHJtX2dlbV92cmFtX29iamVjdCAqZ2JvOwogCWludCBzcmNfb2Zmc2V0LCBkc3Rfb2Zm
c2V0OwogCWludCBicHAgPSBtZmJkZXYtPm1mYi5iYXNlLmZvcm1hdC0+Y3BwWzBdOwotCWludCBy
ZXQgPSAtRUJVU1k7CisJaW50IHJldDsKIAl1OCAqZHN0OwogCWJvb2wgdW5tYXAgPSBmYWxzZTsK
IAlib29sIHN0b3JlX2Zvcl9sYXRlciA9IGZhbHNlOwpAQCAtMzYsMTggKzM2LDIwIEBAIHN0YXRp
YyB2b2lkIG1nYV9kaXJ0eV91cGRhdGUoc3RydWN0IG1nYV9mYmRldiAqbWZiZGV2LAogCW9iaiA9
IG1mYmRldi0+bWZiLm9iajsKIAlnYm8gPSBkcm1fZ2VtX3ZyYW1fb2ZfZ2VtKG9iaik7CiAKLQkv
KiBUcnkgdG8gbG9jayB0aGUgQk8uIElmIHdlIGZhaWwgd2l0aCAtRUJVU1kgdGhlbgotCSAqIHRo
ZSBCTyBpcyBiZWluZyBtb3ZlZCBhbmQgd2Ugc2hvdWxkIHN0b3JlIHVwIHRoZQotCSAqIGRhbWFn
ZSB1bnRpbCBsYXRlci4KKwkvKiBXZSBwaW4gdGhlIEJPIHRvIHN5c3RlbSBtZW1vcnkgc28gaXQg
d29uJ3QgYmUgbW92ZWQgZHVyaW5nCisJICogdGhlIHVwZGF0ZSBhbmQgZG9lc24ndCB3YXN0ZSB2
aWRlbyByYW0uIElmIHRoZSBCTyBpcyBhbHJlYWR5CisJICogbG9jYXRlZCBpbiBWUkFNLCB0aGUg
cGluIG9wZXJhdGlvbiB3aWxsIHNpbXBseSBpbmNyZW1lbnQgdGhlCisJICogcGluIGNvdW50Lgog
CSAqLwotCWlmIChkcm1fY2FuX3NsZWVwKCkpCi0JCXJldCA9IGRybV9nZW1fdnJhbV9sb2NrKGdi
bywgdHJ1ZSk7Ci0JaWYgKHJldCkgewotCQlpZiAocmV0ICE9IC1FQlVTWSkKLQkJCXJldHVybjsK
LQorCWlmIChkcm1fY2FuX3NsZWVwKCkpIHsKKwkJcmV0ID0gZHJtX2dlbV92cmFtX3BpbihnYm8s
IFRUTV9QTF9GTEFHX1NZU1RFTSk7CisJCWlmIChyZXQpIHsKKwkJCWlmIChyZXQgIT0gLUVCVVNZ
KQorCQkJCXJldHVybjsKKwkJCXN0b3JlX2Zvcl9sYXRlciA9IHRydWU7CisJCX0KKwl9IGVsc2UK
IAkJc3RvcmVfZm9yX2xhdGVyID0gdHJ1ZTsKLQl9CiAKIAl4MiA9IHggKyB3aWR0aCAtIDE7CiAJ
eTIgPSB5ICsgaGVpZ2h0IC0gMTsKQEAgLTEwMCw3ICsxMDIsNyBAQCBzdGF0aWMgdm9pZCBtZ2Ff
ZGlydHlfdXBkYXRlKHN0cnVjdCBtZ2FfZmJkZXYgKm1mYmRldiwKIAkJZHJtX2dlbV92cmFtX2t1
bm1hcChnYm8pOwogCiBvdXQ6Ci0JZHJtX2dlbV92cmFtX3VubG9jayhnYm8pOworCWRybV9nZW1f
dnJhbV91bnBpbihnYm8pOwogfQogCiBzdGF0aWMgdm9pZCBtZ2FfZmlsbHJlY3Qoc3RydWN0IGZi
X2luZm8gKmluZm8sCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
