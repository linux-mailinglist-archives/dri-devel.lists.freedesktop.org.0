Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE250F3319
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 16:31:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB0D26F6F2;
	Thu,  7 Nov 2019 15:31:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 107209 seconds by postgrey-1.36 at gabe;
 Thu, 07 Nov 2019 15:31:00 UTC
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ADDD6F6F2
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 15:31:00 +0000 (UTC)
Received: from localhost.localdomain
 (lfbn-tou-1-421-123.w86-206.abo.wanadoo.fr [86.206.246.123])
 (Authenticated sender: paul.kocialkowski@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id DF367200011;
 Thu,  7 Nov 2019 15:30:55 +0000 (UTC)
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/gma500: Fixup fbdev stolen size usage evaluation
Date: Thu,  7 Nov 2019 16:30:48 +0100
Message-Id: <20191107153048.843881-1-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.23.0
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
Cc: David Airlie <airlied@linux.ie>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

cHNiZmJfcHJvYmUgcGVyZm9ybXMgYW4gZXZhbHVhdGlvbiBvZiB0aGUgcmVxdWlyZWQgc2l6ZSBm
cm9tIHRoZSBzdG9sZW4KR1RUIG1lbW9yeSwgYnV0IGdldHMgaXQgd3JvbmcgaW4gdHdvIGRpc3Rp
bmN0IHdheXM6Ci0gVGhlIHJlc3VsdGluZyBzaXplIG11c3QgYmUgcGFnZS1zaXplLWFsaWduZWQ7
Ci0gVGhlIHNpemUgdG8gYWxsb2NhdGUgaXMgZGVyaXZlZCBmcm9tIHRoZSBzdXJmYWNlIGRpbWVu
c2lvbnMsIG5vdCB0aGUgZmIKICBkaW1lbnNpb25zLgoKV2hlbiB0d28gY29ubmVjdG9ycyBhcmUg
Y29ubmVjdGVkIHdpdGggZGlmZmVyZW50IG1vZGVzLCB0aGUgc21hbGxlc3Qgd2lsbApiZSBzdG9y
ZWQgaW4gdGhlIGZiIGRpbWVuc2lvbnMsIGJ1dCB0aGUgc2l6ZSB0aGF0IG5lZWRzIHRvIGJlIGFs
bG9jYXRlZCBtdXN0Cm1hdGNoIHRoZSBsYXJnZXN0IChzdXJmYWNlKSBkaW1lbnNpb25zLiBUaGlz
IGlzIHdoYXQgaXMgdXNlZCBpbiB0aGUgYWN0dWFsCmFsbG9jYXRpb24gY29kZS4KCkZpeCB0aGlz
IGJ5IGNvcnJlY3RpbmcgdGhlIGV2YWx1YXRpb24gdG8gY29uZm9ybSB0byB0aGUgdHdvIHBvaW50
cyBhYm92ZS4KSXQgYWxsb3dzIGNvcnJlY3RseSBzd2l0Y2hpbmcgdG8gMTZicHAgd2hlbiBvbmUg
Y29ubmVjdG9yIGlzIGUuZy4gMTkyMHgxMDgwCmFuZCB0aGUgb3RoZXIgaXMgMTAyNHg3NjguCgpT
aWduZWQtb2ZmLWJ5OiBQYXVsIEtvY2lhbGtvd3NraSA8cGF1bC5rb2NpYWxrb3dza2lAYm9vdGxp
bi5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9mcmFtZWJ1ZmZlci5jIHwgOCArKysr
KystLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL2ZyYW1lYnVmZmVyLmMgYi9kcml2ZXJz
L2dwdS9kcm0vZ21hNTAwL2ZyYW1lYnVmZmVyLmMKaW5kZXggMjE4ZjNiYjE1Mjc2Li45MDIzN2Fi
ZWUwODggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9nbWE1MDAvZnJhbWVidWZmZXIuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL2ZyYW1lYnVmZmVyLmMKQEAgLTQ2Miw2ICs0NjIs
NyBAQCBzdGF0aWMgaW50IHBzYmZiX3Byb2JlKHN0cnVjdCBkcm1fZmJfaGVscGVyICpoZWxwZXIs
CiAJCWNvbnRhaW5lcl9vZihoZWxwZXIsIHN0cnVjdCBwc2JfZmJkZXYsIHBzYl9mYl9oZWxwZXIp
OwogCXN0cnVjdCBkcm1fZGV2aWNlICpkZXYgPSBwc2JfZmJkZXYtPnBzYl9mYl9oZWxwZXIuZGV2
OwogCXN0cnVjdCBkcm1fcHNiX3ByaXZhdGUgKmRldl9wcml2ID0gZGV2LT5kZXZfcHJpdmF0ZTsK
Kwl1bnNpZ25lZCBpbnQgZmJfc2l6ZTsKIAlpbnQgYnl0ZXNwcDsKIAogCWJ5dGVzcHAgPSBzaXpl
cy0+c3VyZmFjZV9icHAgLyA4OwpAQCAtNDcxLDggKzQ3MiwxMSBAQCBzdGF0aWMgaW50IHBzYmZi
X3Byb2JlKHN0cnVjdCBkcm1fZmJfaGVscGVyICpoZWxwZXIsCiAJLyogSWYgdGhlIG1vZGUgd2ls
bCBub3QgZml0IGluIDMyYml0IHRoZW4gc3dpdGNoIHRvIDE2Yml0IHRvIGdldAogCSAgIGEgY29u
c29sZSBvbiBmdWxsIHJlc29sdXRpb24uIFRoZSBYIG1vZGUgc2V0dGluZyBzZXJ2ZXIgd2lsbAog
CSAgIGFsbG9jYXRlIGl0cyBvd24gMzJiaXQgR0VNIGZyYW1lYnVmZmVyICovCi0JaWYgKEFMSUdO
KHNpemVzLT5mYl93aWR0aCAqIGJ5dGVzcHAsIDY0KSAqIHNpemVzLT5mYl9oZWlnaHQgPgotCSAg
ICAgICAgICAgICAgICBkZXZfcHJpdi0+dnJhbV9zdG9sZW5fc2l6ZSkgeworCWZiX3NpemUgPSBB
TElHTihzaXplcy0+c3VyZmFjZV93aWR0aCAqIGJ5dGVzcHAsIDY0KSAqCisJCSAgc2l6ZXMtPnN1
cmZhY2VfaGVpZ2h0OworCWZiX3NpemUgPSBBTElHTihmYl9zaXplLCBQQUdFX1NJWkUpOworCisJ
aWYgKGZiX3NpemUgPiBkZXZfcHJpdi0+dnJhbV9zdG9sZW5fc2l6ZSkgewogICAgICAgICAgICAg
ICAgIHNpemVzLT5zdXJmYWNlX2JwcCA9IDE2OwogICAgICAgICAgICAgICAgIHNpemVzLT5zdXJm
YWNlX2RlcHRoID0gMTY7CiAgICAgICAgIH0KLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
