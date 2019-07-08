Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4943361E98
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 14:41:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12EDF89CB2;
	Mon,  8 Jul 2019 12:41:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B65FB89CB2
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2019 12:41:32 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.pengutronix.de.)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1hkSxW-0007Cq-AE; Mon, 08 Jul 2019 14:41:30 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>
Subject: [PATCH v2] backlight: rave-sp: don't touch initial state and register
 with correct device
Date: Mon,  8 Jul 2019 14:41:29 +0200
Message-Id: <20190708124129.5664-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org,
 patchwork-lst@pengutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyB3YXkgdGhlIGJhY2tsaWdodCBjYW4gYmUgcmVmZXJlbmNlZCB0aHJvdWdoIGl0cyBkZXZp
Y2Ugbm9kZSBhbmQKZW5hYmxpbmcvZGlzYWJsaW5nIGNhbiBiZSBtYW5hZ2VkIHRocm91Z2ggdGhl
IHBhbmVsIGRyaXZlci4KClNpZ25lZC1vZmYtYnk6IEx1Y2FzIFN0YWNoIDxsLnN0YWNoQHBlbmd1
dHJvbml4LmRlPgotLS0KIGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3JhdmUtc3AtYmFja2xpZ2h0
LmMgfCAxMCArKysrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3JhdmUtc3At
YmFja2xpZ2h0LmMgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9yYXZlLXNwLWJhY2tsaWdodC5j
CmluZGV4IDQ2MmYxNGExYjE5ZC4uMDViNWYwMDNhM2QxIDEwMDY0NAotLS0gYS9kcml2ZXJzL3Zp
ZGVvL2JhY2tsaWdodC9yYXZlLXNwLWJhY2tsaWdodC5jCisrKyBiL2RyaXZlcnMvdmlkZW8vYmFj
a2xpZ2h0L3JhdmUtc3AtYmFja2xpZ2h0LmMKQEAgLTQ4LDE0ICs0OCwyMCBAQCBzdGF0aWMgaW50
IHJhdmVfc3BfYmFja2xpZ2h0X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJ
c3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRldjsKIAlzdHJ1Y3QgYmFja2xpZ2h0X2Rldmlj
ZSAqYmQ7CiAKLQliZCA9IGRldm1fYmFja2xpZ2h0X2RldmljZV9yZWdpc3RlcihkZXYsIHBkZXYt
Pm5hbWUsIGRldi0+cGFyZW50LAorCWJkID0gZGV2bV9iYWNrbGlnaHRfZGV2aWNlX3JlZ2lzdGVy
KGRldiwgcGRldi0+bmFtZSwgZGV2LAogCQkJCQkgICAgZGV2X2dldF9kcnZkYXRhKGRldi0+cGFy
ZW50KSwKIAkJCQkJICAgICZyYXZlX3NwX2JhY2tsaWdodF9vcHMsCiAJCQkJCSAgICAmcmF2ZV9z
cF9iYWNrbGlnaHRfcHJvcHMpOwogCWlmIChJU19FUlIoYmQpKQogCQlyZXR1cm4gUFRSX0VSUihi
ZCk7CiAKLQliYWNrbGlnaHRfdXBkYXRlX3N0YXR1cyhiZCk7CisJLyoKKwkgKiBJZiB0aGVyZSBp
cyBhIHBoYW5kbGUgcG9pbnRpbmcgdG8gdGhlIGRldmljZSBub2RlIHdlIGNhbgorCSAqIGFzc3Vt
ZSB0aGF0IGFub3RoZXIgZGV2aWNlIHdpbGwgbWFuYWdlIHRoZSBzdGF0dXMgY2hhbmdlcy4KKwkg
KiBJZiBub3Qgd2UgbWFrZSBzdXJlIHRoZSBiYWNrbGlnaHQgaXMgaW4gYSBjb25zaXN0ZW50IHN0
YXRlLgorCSAqLworCWlmICghZGV2LT5vZl9ub2RlLT5waGFuZGxlKQorCQliYWNrbGlnaHRfdXBk
YXRlX3N0YXR1cyhiZCk7CiAKIAlyZXR1cm4gMDsKIH0KLS0gCjIuMjAuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
