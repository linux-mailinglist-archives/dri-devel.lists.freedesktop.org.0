Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 781E63CC77
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 15:04:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C5C9891EF;
	Tue, 11 Jun 2019 13:03:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DF20891BE
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 13:03:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5718EAEB7;
 Tue, 11 Jun 2019 13:03:49 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kraxel@redhat.com, airlied@redhat.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, maxime.ripard@bootlin.com,
 sean@poorly.run, sam@ravnborg.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 5/9] drm/ast: Pin framebuffer BO during dirty update
Date: Tue, 11 Jun 2019 15:03:40 +0200
Message-Id: <20190611130344.18988-6-tzimmermann@suse.de>
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
ZWQgaW4gQVNUJ3MKZnJhbWVidWZmZXIgdXBkYXRlIGNvZGUuIEluc3RlYWQgb2YgbG9ja2luZyB0
aGUgQk8sIHdlIHBpbiBpdCB0byB3aGVyZXZlcgppdCBpcy4KCnYyOgoJKiB1cGRhdGUgd2l0aCBw
aW4gZmxhZyBvZiAwCgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1h
bm5Ac3VzZS5kZT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9mYi5jIHwgMzMgKysrKysr
KysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9u
cygrKSwgMTcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FzdC9h
c3RfZmIuYyBiL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X2ZiLmMKaW5kZXggMDVmNDUyMjJiNzAy
Li5iNDA0YjUxYzJjNTUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X2ZiLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfZmIuYwpAQCAtNDgsMzIgKzQ4LDMxIEBAIHN0
YXRpYyB2b2lkIGFzdF9kaXJ0eV91cGRhdGUoc3RydWN0IGFzdF9mYmRldiAqYWZiZGV2LAogCQkJ
ICAgICBpbnQgeCwgaW50IHksIGludCB3aWR0aCwgaW50IGhlaWdodCkKIHsKIAlpbnQgaTsKLQlz
dHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iajsKIAlzdHJ1Y3QgZHJtX2dlbV92cmFtX29iamVjdCAq
Z2JvOwogCWludCBzcmNfb2Zmc2V0LCBkc3Rfb2Zmc2V0OwogCWludCBicHAgPSBhZmJkZXYtPmFm
Yi5iYXNlLmZvcm1hdC0+Y3BwWzBdOwotCWludCByZXQgPSAtRUJVU1k7CisJaW50IHJldDsKIAl1
OCAqZHN0OwogCWJvb2wgdW5tYXAgPSBmYWxzZTsKIAlib29sIHN0b3JlX2Zvcl9sYXRlciA9IGZh
bHNlOwogCWludCB4MiwgeTI7CiAJdW5zaWduZWQgbG9uZyBmbGFnczsKIAotCW9iaiA9IGFmYmRl
di0+YWZiLm9iajsKLQlnYm8gPSBkcm1fZ2VtX3ZyYW1fb2ZfZ2VtKG9iaik7Ci0KLQkvKiBUcnkg
dG8gbG9jayB0aGUgQk8uIElmIHdlIGZhaWwgd2l0aCAtRUJVU1kgdGhlbgotCSAqIHRoZSBCTyBp
cyBiZWluZyBtb3ZlZCBhbmQgd2Ugc2hvdWxkIHN0b3JlIHVwIHRoZQotCSAqIGRhbWFnZSB1bnRp
bCBsYXRlci4KLQkgKi8KLQlpZiAoZHJtX2Nhbl9zbGVlcCgpKQotCQlyZXQgPSBkcm1fZ2VtX3Zy
YW1fbG9jayhnYm8sIHRydWUpOwotCWlmIChyZXQpIHsKLQkJaWYgKHJldCAhPSAtRUJVU1kpCi0J
CQlyZXR1cm47Ci0KKwlnYm8gPSBkcm1fZ2VtX3ZyYW1fb2ZfZ2VtKGFmYmRldi0+YWZiLm9iaik7
CisKKwlpZiAoZHJtX2Nhbl9zbGVlcCgpKSB7CisJCS8qIFdlIHBpbiB0aGUgQk8gc28gaXQgd29u
J3QgYmUgbW92ZWQgZHVyaW5nIHRoZQorCQkgKiB1cGRhdGUuIFRoZSBhY3R1YWwgbG9jYXRpb24s
IHZpZGVvIFJBTSBvciBzeXN0ZW0KKwkJICogbWVtb3J5LCBpcyBub3QgaW1wb3J0YW50LgorCQkg
Ki8KKwkJcmV0ID0gZHJtX2dlbV92cmFtX3BpbihnYm8sIDApOworCQlpZiAocmV0KSB7CisJCQlp
ZiAocmV0ICE9IC1FQlVTWSkKKwkJCQlyZXR1cm47CisJCQlzdG9yZV9mb3JfbGF0ZXIgPSB0cnVl
OworCQl9CisJfSBlbHNlCiAJCXN0b3JlX2Zvcl9sYXRlciA9IHRydWU7Ci0JfQogCiAJeDIgPSB4
ICsgd2lkdGggLSAxOwogCXkyID0geSArIGhlaWdodCAtIDE7CkBAIC0xMjYsNyArMTI1LDcgQEAg
c3RhdGljIHZvaWQgYXN0X2RpcnR5X3VwZGF0ZShzdHJ1Y3QgYXN0X2ZiZGV2ICphZmJkZXYsCiAJ
CWRybV9nZW1fdnJhbV9rdW5tYXAoZ2JvKTsKIAogb3V0OgotCWRybV9nZW1fdnJhbV91bmxvY2so
Z2JvKTsKKwlkcm1fZ2VtX3ZyYW1fdW5waW4oZ2JvKTsKIH0KIAogc3RhdGljIHZvaWQgYXN0X2Zp
bGxyZWN0KHN0cnVjdCBmYl9pbmZvICppbmZvLAotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
