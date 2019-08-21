Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6228598D51
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 10:16:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D1A96EAC0;
	Thu, 22 Aug 2019 08:15:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9102F6E949
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 10:16:28 +0000 (UTC)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 4D7641A01DF;
 Wed, 21 Aug 2019 12:16:27 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 410131A0045;
 Wed, 21 Aug 2019 12:16:27 +0200 (CEST)
Received: from fsr-ub1664-120.ea.freescale.net
 (fsr-ub1664-120.ea.freescale.net [10.171.82.81])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 91F8C205D3;
 Wed, 21 Aug 2019 12:16:26 +0200 (CEST)
From: Robert Chiras <robert.chiras@nxp.com>
To: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v3 15/15] drm/mxsfb: Add support for live pixel format change
Date: Wed, 21 Aug 2019 13:15:55 +0300
Message-Id: <1566382555-12102-16-git-send-email-robert.chiras@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566382555-12102-1-git-send-email-robert.chiras@nxp.com>
References: <1566382555-12102-1-git-send-email-robert.chiras@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Thu, 22 Aug 2019 08:14:56 +0000
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBJUCByZXF1aXJlcyBmdWxsIHN0b3AgYW5kIHJlLXN0YXJ0IHdoZW4gY2hhbmdpbmcgZGlz
cGxheSB0aW1pbmdzLApidXQgd2UgY2FuIGNoYW5nZSB0aGUgcGl4ZWwgZm9ybWF0IHdoaWxlIHJ1
bm5pbmcuCgpTaWduZWQtb2ZmLWJ5OiBSb2JlcnQgQ2hpcmFzIDxyb2JlcnQuY2hpcmFzQG54cC5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL214c2ZiL214c2ZiX2NydGMuYyB8IDE2ICsrKysrKysr
KysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL214c2ZiL214c2ZiX2NydGMuYyBiL2RyaXZl
cnMvZ3B1L2RybS9teHNmYi9teHNmYl9jcnRjLmMKaW5kZXggMzE3NTc1ZS4uNTYwN2ZjMCAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL214c2ZiL214c2ZiX2NydGMuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vbXhzZmIvbXhzZmJfY3J0Yy5jCkBAIC00OTQsNiArNDk0LDcgQEAgdm9pZCBteHNm
Yl9wbGFuZV9hdG9taWNfdXBkYXRlKHN0cnVjdCBteHNmYl9kcm1fcHJpdmF0ZSAqbXhzZmIsCiAJ
c3RydWN0IGRybV9jcnRjICpjcnRjID0gJnBpcGUtPmNydGM7CiAJc3RydWN0IGRybV9wbGFuZV9z
dGF0ZSAqbmV3X3N0YXRlID0gcGlwZS0+cGxhbmUuc3RhdGU7CiAJc3RydWN0IGRybV9mcmFtZWJ1
ZmZlciAqZmIgPSBwaXBlLT5wbGFuZS5zdGF0ZS0+ZmI7CisJc3RydWN0IGRybV9mcmFtZWJ1ZmZl
ciAqb2xkX2ZiID0gc3RhdGUtPmZiOwogCXN0cnVjdCBkcm1fcGVuZGluZ192YmxhbmtfZXZlbnQg
KmV2ZW50OwogCXUzMiBmYl9hZGRyLCBzcmNfb2ZmLCBzcmNfdywgc3RyaWRlLCBjcHAgPSAwOwog
CkBAIC01MTAsNyArNTExLDcgQEAgdm9pZCBteHNmYl9wbGFuZV9hdG9taWNfdXBkYXRlKHN0cnVj
dCBteHNmYl9kcm1fcHJpdmF0ZSAqbXhzZmIsCiAJfQogCXNwaW5fdW5sb2NrX2lycSgmY3J0Yy0+
ZGV2LT5ldmVudF9sb2NrKTsKIAotCWlmICghZmIpCisJaWYgKCFmYiB8fCAhb2xkX2ZiKQogCQly
ZXR1cm47CiAKIAlmYl9hZGRyID0gbXhzZmJfZ2V0X2ZiX3BhZGRyKG14c2ZiKTsKQEAgLTUzMyw0
ICs1MzQsMTcgQEAgdm9pZCBteHNmYl9wbGFuZV9hdG9taWNfdXBkYXRlKHN0cnVjdCBteHNmYl9k
cm1fcHJpdmF0ZSAqbXhzZmIsCiAJCXNyY193ID0gbmV3X3N0YXRlLT5zcmNfdyA+PiAxNjsKIAkJ
bXhzZmJfc2V0X2ZiX2hjcm9wKG14c2ZiLCBzcmNfdywgc3RyaWRlKTsKIAl9CisKKwlpZiAob2xk
X2ZiLT5mb3JtYXQtPmZvcm1hdCAhPSBmYi0+Zm9ybWF0LT5mb3JtYXQpIHsKKwkJc3RydWN0IGRy
bV9mb3JtYXRfbmFtZV9idWYgb2xkX2ZtdF9idWY7CisJCXN0cnVjdCBkcm1fZm9ybWF0X25hbWVf
YnVmIG5ld19mbXRfYnVmOworCisJCURSTV9ERVZfREVCVUdfRFJJVkVSKGNydGMtPmRldi0+ZGV2
LAorCQkJCSJTd2l0Y2hpbmcgcGl4ZWwgZm9ybWF0OiAlcyAtPiAlc1xuIiwKKwkJCQlkcm1fZ2V0
X2Zvcm1hdF9uYW1lKG9sZF9mYi0+Zm9ybWF0LT5mb3JtYXQsCisJCQkJCQkgICAgJm9sZF9mbXRf
YnVmKSwKKwkJCQlkcm1fZ2V0X2Zvcm1hdF9uYW1lKGZiLT5mb3JtYXQtPmZvcm1hdCwKKwkJCQkJ
CSAgICAmbmV3X2ZtdF9idWYpKTsKKwkJbXhzZmJfc2V0X3BpeGVsX2ZtdChteHNmYiwgdHJ1ZSk7
CisJfQogfQotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
