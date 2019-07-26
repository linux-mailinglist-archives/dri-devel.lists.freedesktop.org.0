Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABD676282
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 11:49:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C1186ECED;
	Fri, 26 Jul 2019 09:49:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 685E76ECED
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 09:49:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id E25F2FB02;
 Fri, 26 Jul 2019 11:49:15 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TtfFpcmoz3Q8; Fri, 26 Jul 2019 11:49:13 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 0D36F46AA0; Fri, 26 Jul 2019 11:49:12 +0200 (CEST)
From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To: Robert Chiras <robert.chiras@nxp.com>, Marek Vasut <marex@denx.de>,
 Stefan Agner <stefan@agner.ch>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] drm/mxsfb: Read bus flags from bridge if present
Date: Fri, 26 Jul 2019 11:49:12 +0200
Message-Id: <9390060f65f94722cb13101d4835d9048037f7a0.1564134488.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1564134488.git.agx@sigxcpu.org>
References: <cover.1564134488.git.agx@sigxcpu.org>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGJyaWRnZSBtaWdodCBoYXZlIHNwZWNpYWwgcmVxdWlybWVudGVzIG9uIHRoZSBpbnB1dCBi
dXMuIFRoaXMKaXMgZS5nLiB1c2VkIGJ5IHRoZSBpbXgtbndsIGJyaWRnZS4KClNpZ25lZC1vZmYt
Ynk6IEd1aWRvIEfDvG50aGVyIDxhZ3hAc2lneGNwdS5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L214c2ZiL214c2ZiX2NydGMuYyB8IDUgKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXhzZmIv
bXhzZmJfY3J0Yy5jIGIvZHJpdmVycy9ncHUvZHJtL214c2ZiL214c2ZiX2NydGMuYwppbmRleCBl
ODRiYWMzYTU0MWQuLjNiOGViM2FjMTNiNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL214
c2ZiL214c2ZiX2NydGMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJfY3J0Yy5j
CkBAIC0yMTUsNyArMjE1LDcgQEAgc3RhdGljIHZvaWQgbXhzZmJfY3J0Y19tb2RlX3NldF9ub2Zi
KHN0cnVjdCBteHNmYl9kcm1fcHJpdmF0ZSAqbXhzZmIpCiB7CiAJc3RydWN0IGRybV9kZXZpY2Ug
KmRybSA9IG14c2ZiLT5waXBlLmNydGMuZGV2OwogCXN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICpt
ID0gJm14c2ZiLT5waXBlLmNydGMuc3RhdGUtPmFkanVzdGVkX21vZGU7Ci0JY29uc3QgdTMyIGJ1
c19mbGFncyA9IG14c2ZiLT5jb25uZWN0b3ItPmRpc3BsYXlfaW5mby5idXNfZmxhZ3M7CisJdTMy
IGJ1c19mbGFncyA9IG14c2ZiLT5jb25uZWN0b3ItPmRpc3BsYXlfaW5mby5idXNfZmxhZ3M7CiAJ
dTMyIHZkY3RybDAsIHZzeW5jX3B1bHNlX2xlbiwgaHN5bmNfcHVsc2VfbGVuOwogCWludCBlcnI7
CiAKQEAgLTIzOSw2ICsyMzksOSBAQCBzdGF0aWMgdm9pZCBteHNmYl9jcnRjX21vZGVfc2V0X25v
ZmIoc3RydWN0IG14c2ZiX2RybV9wcml2YXRlICpteHNmYikKIAogCWNsa19zZXRfcmF0ZShteHNm
Yi0+Y2xrLCBtLT5jcnRjX2Nsb2NrICogMTAwMCk7CiAKKwlpZiAobXhzZmItPmJyaWRnZSAmJiBt
eHNmYi0+YnJpZGdlLT50aW1pbmdzKQorCQlidXNfZmxhZ3MgPSBteHNmYi0+YnJpZGdlLT50aW1p
bmdzLT5pbnB1dF9idXNfZmxhZ3M7CisKIAlEUk1fREVWX0RFQlVHX0RSSVZFUihkcm0tPmRldiwg
IlBpeGVsIGNsb2NrOiAlZGtIeiAoYWN0dWFsOiAlZGtIeilcbiIsCiAJCQkgICAgIG0tPmNydGNf
Y2xvY2ssCiAJCQkgICAgIChpbnQpKGNsa19nZXRfcmF0ZShteHNmYi0+Y2xrKSAvIDEwMDApKTsK
LS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
