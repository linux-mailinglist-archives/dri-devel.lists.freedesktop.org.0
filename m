Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DA3AB80E
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 14:21:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C9316E281;
	Fri,  6 Sep 2019 12:21:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 406576E282
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2019 12:21:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3BABBB667;
 Fri,  6 Sep 2019 12:21:00 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, noralf@tronnes.org, airlied@linux.ie,
 rong.a.chen@intel.com, feng.tang@intel.com, ying.huang@intel.com,
 sean@poorly.run, maxime.ripard@bootlin.com,
 maarten.lankhorst@linux.intel.com, dave@stgolabs.net, kraxel@redhat.com
Subject: [PATCH v4 3/4] drm/vram: Add infrastructure for move_notify()
Date: Fri,  6 Sep 2019 14:20:55 +0200
Message-Id: <20190906122056.32018-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190906122056.32018-1-tzimmermann@suse.de>
References: <20190906122056.32018-1-tzimmermann@suse.de>
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

VGhpcyBwYXRjaCBwcmVwYXJlcyBWUkFNIGhlbHBlcnMgZm9yIGxhenkgdW5tYXBwaW5nIG9mIGJ1
ZmZlciBvYmplY3RzLgoKU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJt
YW5uQHN1c2UuZGU+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV92cmFtX21tX2hlbHBlci5jIHwg
MTIgKysrKysrKysrKysrCiBpbmNsdWRlL2RybS9kcm1fdnJhbV9tbV9oZWxwZXIuaCAgICAgfCAg
NCArKysrCiAyIGZpbGVzIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vZHJtX3ZyYW1fbW1faGVscGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJt
X3ZyYW1fbW1faGVscGVyLmMKaW5kZXggYzkxMTc4MWQ2NzI4Li4zMTk4NDY5MGQ1ZjMgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fdnJhbV9tbV9oZWxwZXIuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vZHJtX3ZyYW1fbW1faGVscGVyLmMKQEAgLTk4LDYgKzk4LDE3IEBAIHN0YXRpYyBp
bnQgYm9fZHJpdmVyX3ZlcmlmeV9hY2Nlc3Moc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywK
IAlyZXR1cm4gdm1tLT5mdW5jcy0+dmVyaWZ5X2FjY2VzcyhibywgZmlscCk7CiB9CiAKK3N0YXRp
YyB2b2lkIGJvX2RyaXZlcl9tb3ZlX25vdGlmeShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJv
LAorCQkJCSAgYm9vbCBldmljdCwKKwkJCQkgIHN0cnVjdCB0dG1fbWVtX3JlZyAqbmV3X21lbSkK
K3sKKwlzdHJ1Y3QgZHJtX3ZyYW1fbW0gKnZtbSA9IGRybV92cmFtX21tX29mX2JkZXYoYm8tPmJk
ZXYpOworCisJaWYgKCF2bW0tPmZ1bmNzIHx8ICF2bW0tPmZ1bmNzLT5tb3ZlX25vdGlmeSkKKwkJ
cmV0dXJuOworCXZtbS0+ZnVuY3MtPm1vdmVfbm90aWZ5KGJvLCBldmljdCwgbmV3X21lbSk7Cit9
CisKIHN0YXRpYyBpbnQgYm9fZHJpdmVyX2lvX21lbV9yZXNlcnZlKHN0cnVjdCB0dG1fYm9fZGV2
aWNlICpiZGV2LAogCQkJCSAgICBzdHJ1Y3QgdHRtX21lbV9yZWcgKm1lbSkKIHsKQEAgLTE0MCw2
ICsxNTEsNyBAQCBzdGF0aWMgc3RydWN0IHR0bV9ib19kcml2ZXIgYm9fZHJpdmVyID0gewogCS5l
dmljdGlvbl92YWx1YWJsZSA9IHR0bV9ib19ldmljdGlvbl92YWx1YWJsZSwKIAkuZXZpY3RfZmxh
Z3MgPSBib19kcml2ZXJfZXZpY3RfZmxhZ3MsCiAJLnZlcmlmeV9hY2Nlc3MgPSBib19kcml2ZXJf
dmVyaWZ5X2FjY2VzcywKKwkubW92ZV9ub3RpZnkgPSBib19kcml2ZXJfbW92ZV9ub3RpZnksCiAJ
LmlvX21lbV9yZXNlcnZlID0gYm9fZHJpdmVyX2lvX21lbV9yZXNlcnZlLAogCS5pb19tZW1fZnJl
ZSA9IGJvX2RyaXZlcl9pb19tZW1fZnJlZSwKIH07CmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9k
cm1fdnJhbV9tbV9oZWxwZXIuaCBiL2luY2x1ZGUvZHJtL2RybV92cmFtX21tX2hlbHBlci5oCmlu
ZGV4IDJhYWNmYjFjY2ZhZS4uN2ZiODcwMGY0NWZlIDEwMDY0NAotLS0gYS9pbmNsdWRlL2RybS9k
cm1fdnJhbV9tbV9oZWxwZXIuaAorKysgYi9pbmNsdWRlL2RybS9kcm1fdnJhbV9tbV9oZWxwZXIu
aApAQCAtMTUsNiArMTUsOCBAQCBzdHJ1Y3QgZHJtX2RldmljZTsKIAkmdHRtX2JvX2RyaXZlci5l
dmljdF9mbGFncwogICogQHZlcmlmeV9hY2Nlc3M6CVByb3ZpZGVzIGFuIGltcGxlbWVudGF0aW9u
IGZvciBcCiAJc3RydWN0ICZ0dG1fYm9fZHJpdmVyLnZlcmlmeV9hY2Nlc3MKKyAqIEBtb3ZlX25v
dGlmeToJUHJvdmlkZXMgYW4gaW1wbGVtZW50YXRpb24gZm9yCisgKgkJCXN0cnVjdCAmdHRtX2Jv
X2RyaXZlci5tb3ZlX25vdGlmeQogICoKICAqIFRoZXNlIGNhbGxiYWNrIGZ1bmN0aW9uIGludGVn
cmF0ZSBWUkFNIE1NIHdpdGggVFRNIGJ1ZmZlciBvYmplY3RzLiBOZXcKICAqIGZ1bmN0aW9ucyBj
YW4gYmUgYWRkZWQgaWYgbmVjZXNzYXJ5LgpAQCAtMjMsNiArMjUsOCBAQCBzdHJ1Y3QgZHJtX3Zy
YW1fbW1fZnVuY3MgewogCXZvaWQgKCpldmljdF9mbGFncykoc3RydWN0IHR0bV9idWZmZXJfb2Jq
ZWN0ICpibywKIAkJCSAgICBzdHJ1Y3QgdHRtX3BsYWNlbWVudCAqcGxhY2VtZW50KTsKIAlpbnQg
KCp2ZXJpZnlfYWNjZXNzKShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLCBzdHJ1Y3QgZmls
ZSAqZmlscCk7CisJdm9pZCAoKm1vdmVfbm90aWZ5KShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3Qg
KmJvLCBib29sIGV2aWN0LAorCQkJICAgIHN0cnVjdCB0dG1fbWVtX3JlZyAqbmV3X21lbSk7CiB9
OwogCiAvKioKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
