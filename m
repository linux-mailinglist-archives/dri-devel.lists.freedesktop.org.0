Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1744C59D9D
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 16:18:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5448D6E92D;
	Fri, 28 Jun 2019 14:17:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A74966E92C
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 14:17:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: bbeckett) with ESMTPSA id 1BEF828A35D
From: Robert Beckett <bob.beckett@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 1/2] drm/vblank: warn on sending stale event
Date: Fri, 28 Jun 2019 15:15:35 +0100
Message-Id: <3d03364bc0ed9bce6219a14fd325820035f42e72.1561729581.git.bob.beckett@collabora.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1561729581.git.bob.beckett@collabora.com>
References: <cover.1561729581.git.bob.beckett@collabora.com>
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
Cc: Robert Beckett <bob.beckett@collabora.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>,
 David Airlie <airlied@linux.ie>,
 Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2FybiB3aGVuIGFib3V0IHRvIHNlbmQgc3RhbGUgdmJsYW5rIGluZm8gYW5kIGFkZCBhZHZpY2Ug
dG8KZG9jdW1lbnRhdGlvbiBvbiBob3cgdG8gYXZvaWQuCgpTaWduZWQtb2ZmLWJ5OiBSb2JlcnQg
QmVja2V0dCA8Ym9iLmJlY2tldHRAY29sbGFib3JhLmNvbT4KUmV2aWV3ZWQtYnk6IERhbmllbCBW
ZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV92
YmxhbmsuYyB8IDE4ICsrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDE4IGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3ZibGFuay5jIGIvZHJp
dmVycy9ncHUvZHJtL2RybV92YmxhbmsuYwppbmRleCA2MDNhYjEwNTEyNWQuLjkzOTViOGM2OTBi
OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV92YmxhbmsuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vZHJtX3ZibGFuay5jCkBAIC05MTgsNiArOTE4LDIwIEBAIEVYUE9SVF9TWU1CT0wo
ZHJtX2NydGNfYXJtX3ZibGFua19ldmVudCk7CiAgKgogICogU2VlIGRybV9jcnRjX2FybV92Ymxh
bmtfZXZlbnQoKSBmb3IgYSBoZWxwZXIgd2hpY2ggY2FuIGJlIHVzZWQgaW4gY2VydGFpbgogICog
c2l0dWF0aW9uLCBlc3BlY2lhbGx5IHRvIHNlbmQgb3V0IGV2ZW50cyBmb3IgYXRvbWljIGNvbW1p
dCBvcGVyYXRpb25zLgorICoKKyAqIENhcmUgc2hvdWxkIGJlIHRha2VuIHRvIGF2b2lkIHN0YWxl
IHRpbWVzdGFtcHMuIElmIGFsbCBvZiB0aGUgZm9sbG93aW5nIGFyZQorICogdHJ1ZToKKyAqICAg
LSB5b3VyIGRyaXZlciBoYXMgdmJsYW5rIHN1cHBvcnQgKGkuZS4gZGV2LT5udW1fY3J0Y3MgPiAw
KQorICogICAtIHRoZSB2YmxhbmsgaXJxIGlzIG9mZiAoaS5lLiBubyBvbmUgY2FsbGVkIGRybV9j
cnRjX3ZibGFua19nZXQoKSkKKyAqICAgLSBmcm9tIHRoZSB2YmxhbmsgY29kZSdzIHBvdiB0aGUg
cGlwZSBpcyBzdGlsbCBydW5uaW5nIChpLmUuIG5vdCBhZnRlciB0aGUKKyAqICAgICBjYWxsIHRv
IGRybV9jcnRjX3ZibGFua19vZmYoKSBidXQgYmVmb3JlIHRoZSBuZXh0IGNhbGwgdG8KKyAqICAg
ICBkcm1fY3J0Y192Ymxhbmtfb24oKSkKKyAqIHRoZW4gZHJtX2NydGNfc2VuZF92YmxhbmtfZXZl
bnQgaXMgZ29pbmcgdG8gZ2l2ZSB5b3UgYSBnYXJiYWdlIHRpbWVzdGFtcCBhbmQKKyAqIHNlcXVl
bmNlIG51bWJlciAodGhlIGxhc3QgcmVjb3JkZWQgYmVmb3JlIHRoZSBpcnEgd2FzIGRpc2FibGVk
KS4KKyAqCisgKiBEcml2ZXJzIG11c3QgZWl0aGVyIGhvbGQgYSB2YmxhbmsgcmVmZXJlbmNlIGFj
cXVpcmVkIHRocm91Z2gKKyAqIGRybV9jcnRjX3ZibGFua19nZXQoKSBvciB0aGUgdmJsYW5rIG11
c3QgaGF2ZSBiZWVuIHNodXQgb2ZmIGJ5IGNhbGxpbmcKKyAqIGRybV9jcnRjX3ZibGFua19vZmYo
KS4KICAqLwogdm9pZCBkcm1fY3J0Y19zZW5kX3ZibGFua19ldmVudChzdHJ1Y3QgZHJtX2NydGMg
KmNydGMsCiAJCQkJc3RydWN0IGRybV9wZW5kaW5nX3ZibGFua19ldmVudCAqZSkKQEAgLTkyNSw4
ICs5MzksMTIgQEAgdm9pZCBkcm1fY3J0Y19zZW5kX3ZibGFua19ldmVudChzdHJ1Y3QgZHJtX2Ny
dGMgKmNydGMsCiAJc3RydWN0IGRybV9kZXZpY2UgKmRldiA9IGNydGMtPmRldjsKIAl1NjQgc2Vx
OwogCXVuc2lnbmVkIGludCBwaXBlID0gZHJtX2NydGNfaW5kZXgoY3J0Yyk7CisJc3RydWN0IGRy
bV92YmxhbmtfY3J0YyAqdmJsYW5rID0gJmRldi0+dmJsYW5rW3BpcGVdOwogCWt0aW1lX3Qgbm93
OwogCisJV0FSTl9PTkNFKGRldi0+bnVtX2NydGNzID4gMCAmJiAhdmJsYW5rLT5lbmFibGVkICYm
ICF2YmxhbmstPmlubW9kZXNldCwKKwkJICAic2VuZGluZyBzdGFsZSB2YmxhbmsgaW5mb1xuIik7
CisKIAlpZiAoZGV2LT5udW1fY3J0Y3MgPiAwKSB7CiAJCXNlcSA9IGRybV92YmxhbmtfY291bnRf
YW5kX3RpbWUoZGV2LCBwaXBlLCAmbm93KTsKIAl9IGVsc2UgewotLSAKMi4xOC4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
