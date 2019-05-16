Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 339BA20A42
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 16:56:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3CE78915A;
	Thu, 16 May 2019 14:55:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD1108916B
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 14:55:55 +0000 (UTC)
Received: from localhost.localdomain
 (aaubervilliers-681-1-43-46.w90-88.abo.wanadoo.fr [90.88.161.46])
 (Authenticated sender: paul.kocialkowski@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 3935720001A;
 Thu, 16 May 2019 14:55:53 +0000 (UTC)
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 1/4] drm/vc4: Reformat and the binner bo allocation helper
Date: Thu, 16 May 2019 16:55:41 +0200
Message-Id: <20190516145544.29051-2-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190516145544.29051-1-paul.kocialkowski@bootlin.com>
References: <20190516145544.29051-1-paul.kocialkowski@bootlin.com>
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Eben Upton <eben@raspberrypi.org>, David Airlie <airlied@linux.ie>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gcHJlcGFyYXRpb24gZm9yIHdyYXBwaW5nIHRoZSBiaW5uZXIgYm8gYWxsb2NhdGlvbiBoZWxw
ZXIgd2l0aApwdXQvZ2V0IGhlbHBlcnMsIHBhc3MgdGhlIHZjNCBkZXYgZGlyZWN0bHkgYW5kIGRy
b3AgdGhlIHZjNCBwcmVmaXguCgpTaWduZWQtb2ZmLWJ5OiBQYXVsIEtvY2lhbGtvd3NraSA8cGF1
bC5rb2NpYWxrb3dza2lAYm9vdGxpbi5jb20+ClJldmlld2VkLWJ5OiBFcmljIEFuaG9sdCA8ZXJp
Y0BhbmhvbHQubmV0PgotLS0KIGRyaXZlcnMvZ3B1L2RybS92YzQvdmM0X3YzZC5jIHwgMTEgKysr
KystLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfdjNkLmMgYi9kcml2ZXJzL2dw
dS9kcm0vdmM0L3ZjNF92M2QuYwppbmRleCBhNGI2ODU5ZTNhZjYuLjdjNDkwMTA2ZTE4NSAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfdjNkLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3ZjNC92YzRfdjNkLmMKQEAgLTIxMyw3ICsyMTMsNyBAQCBpbnQgdmM0X3YzZF9nZXRfYmlu
X3Nsb3Qoc3RydWN0IHZjNF9kZXYgKnZjNCkKIH0KIAogLyoqCi0gKiB2YzRfYWxsb2NhdGVfYmlu
X2JvKCkgLSBhbGxvY2F0ZXMgdGhlIG1lbW9yeSB0aGF0IHdpbGwgYmUgdXNlZCBmb3IKKyAqIGJp
bl9ib19hbGxvYygpIC0gYWxsb2NhdGVzIHRoZSBtZW1vcnkgdGhhdCB3aWxsIGJlIHVzZWQgZm9y
CiAgKiB0aWxlIGJpbm5pbmcuCiAgKgogICogVGhlIGJpbm5lciBoYXMgYSBsaW1pdGF0aW9uIHRo
YXQgdGhlIGFkZHJlc3NlcyBpbiB0aGUgdGlsZSBzdGF0ZQpAQCAtMjM0LDkgKzIzNCw4IEBAIGlu
dCB2YzRfdjNkX2dldF9iaW5fc2xvdChzdHJ1Y3QgdmM0X2RldiAqdmM0KQogICogb3ZlcmFsbCBD
TUEgcG9vbCBiZWZvcmUgdGhleSBtYWtlIHNjZW5lcyBjb21wbGljYXRlZCBlbm91Z2ggdG8gcnVu
CiAgKiBvdXQgb2YgYmluIHNwYWNlLgogICovCi1zdGF0aWMgaW50IHZjNF9hbGxvY2F0ZV9iaW5f
Ym8oc3RydWN0IGRybV9kZXZpY2UgKmRybSkKK3N0YXRpYyBpbnQgYmluX2JvX2FsbG9jKHN0cnVj
dCB2YzRfZGV2ICp2YzQpCiB7Ci0Jc3RydWN0IHZjNF9kZXYgKnZjNCA9IHRvX3ZjNF9kZXYoZHJt
KTsKIAlzdHJ1Y3QgdmM0X3YzZCAqdjNkID0gdmM0LT52M2Q7CiAJdWludDMyX3Qgc2l6ZSA9IDE2
ICogMTAyNCAqIDEwMjQ7CiAJaW50IHJldCA9IDA7CkBAIC0yNTEsNyArMjUwLDcgQEAgc3RhdGlj
IGludCB2YzRfYWxsb2NhdGVfYmluX2JvKHN0cnVjdCBkcm1fZGV2aWNlICpkcm0pCiAJSU5JVF9M
SVNUX0hFQUQoJmxpc3QpOwogCiAJd2hpbGUgKHRydWUpIHsKLQkJc3RydWN0IHZjNF9ibyAqYm8g
PSB2YzRfYm9fY3JlYXRlKGRybSwgc2l6ZSwgdHJ1ZSwKKwkJc3RydWN0IHZjNF9ibyAqYm8gPSB2
YzRfYm9fY3JlYXRlKHZjNC0+ZGV2LCBzaXplLCB0cnVlLAogCQkJCQkJICBWQzRfQk9fVFlQRV9C
SU4pOwogCiAJCWlmIChJU19FUlIoYm8pKSB7CkBAIC0zMzMsNyArMzMyLDcgQEAgc3RhdGljIGlu
dCB2YzRfdjNkX3J1bnRpbWVfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikKIAlzdHJ1Y3QgdmM0
X2RldiAqdmM0ID0gdjNkLT52YzQ7CiAJaW50IHJldDsKIAotCXJldCA9IHZjNF9hbGxvY2F0ZV9i
aW5fYm8odmM0LT5kZXYpOworCXJldCA9IGJpbl9ib19hbGxvYyh2YzQpOwogCWlmIChyZXQpCiAJ
CXJldHVybiByZXQ7CiAKQEAgLTQwMyw3ICs0MDIsNyBAQCBzdGF0aWMgaW50IHZjNF92M2RfYmlu
ZChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2UgKm1hc3Rlciwgdm9pZCAqZGF0YSkK
IAlpZiAocmV0ICE9IDApCiAJCXJldHVybiByZXQ7CiAKLQlyZXQgPSB2YzRfYWxsb2NhdGVfYmlu
X2JvKGRybSk7CisJcmV0ID0gYmluX2JvX2FsbG9jKHZjNCk7CiAJaWYgKHJldCkgewogCQljbGtf
ZGlzYWJsZV91bnByZXBhcmUodjNkLT5jbGspOwogCQlyZXR1cm4gcmV0OwotLSAKMi4yMS4wCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
