Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF87767A82
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jul 2019 16:25:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A36D6E3EC;
	Sat, 13 Jul 2019 14:24:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.siol.net (mailoutvs57.siol.net [185.57.226.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D8C16E3CE
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Jul 2019 12:04:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Zimbra) with ESMTP id 5CF29520E52;
 Sat, 13 Jul 2019 14:03:59 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta12.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta12.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id bZRhldBXFahl; Sat, 13 Jul 2019 14:03:59 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Zimbra) with ESMTPS id 0566252059A;
 Sat, 13 Jul 2019 14:03:59 +0200 (CEST)
Received: from localhost.localdomain (cpe-194-152-11-237.cable.triera.net
 [194.152.11.237]) (Authenticated sender: 031275009)
 by mail.siol.net (Zimbra) with ESMTPSA id AC240520778;
 Sat, 13 Jul 2019 14:03:56 +0200 (CEST)
From: Jernej Skrabec <jernej.skrabec@siol.net>
To: maxime.ripard@bootlin.com,
	wens@csie.org
Subject: [PATCH 1/3] drm/sun4i: Introduce color encoding and range properties
Date: Sat, 13 Jul 2019 14:03:44 +0200
Message-Id: <20190713120346.30349-2-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190713120346.30349-1-jernej.skrabec@siol.net>
References: <20190713120346.30349-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 13 Jul 2019 14:24:23 +0000
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gb3JkZXIgdG8gY29ycmVjdGx5IGNvbnZlcnQgWVVWIGNvbG9yIHNwYWNlIHRvIFJHQiwgd2Ug
aGF2ZSB0byBrbm93CmNvbG9yIGVuY29kaW5nIGFuZCByYW5nZS4KCkludHJvZHVjZSB0aGVzZSB0
d28gcHJvcGVydGllcyB1c2luZyBoZWxwZXIgbWV0aG9kLgoKU2lnbmVkLW9mZi1ieTogSmVybmVq
IFNrcmFiZWMgPGplcm5lai5za3JhYmVjQHNpb2wubmV0PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9z
dW40aS9zdW44aV92aV9sYXllci5jIHwgMTcgKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFu
Z2VkLCAxNyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3N1bjRp
L3N1bjhpX3ZpX2xheWVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuOGlfdmlfbGF5ZXIu
YwppbmRleCBiZDBlNmE1MmQxZDguLjI0MGE4MDAyMTdkZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3N1bjRpL3N1bjhpX3ZpX2xheWVyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3N1bjRp
L3N1bjhpX3ZpX2xheWVyLmMKQEAgLTQ0MSw2ICs0NDEsNyBAQCBzdHJ1Y3Qgc3VuOGlfdmlfbGF5
ZXIgKnN1bjhpX3ZpX2xheWVyX2luaXRfb25lKHN0cnVjdCBkcm1fZGV2aWNlICpkcm0sCiAJCQkJ
CSAgICAgICBzdHJ1Y3Qgc3VuOGlfbWl4ZXIgKm1peGVyLAogCQkJCQkgICAgICAgaW50IGluZGV4
KQogeworCXUzMiBzdXBwb3J0ZWRfZW5jb2RpbmdzLCBzdXBwb3J0ZWRfcmFuZ2VzOwogCXN0cnVj
dCBzdW44aV92aV9sYXllciAqbGF5ZXI7CiAJdW5zaWduZWQgaW50IHBsYW5lX2NudDsKIAlpbnQg
cmV0OwpAQCAtNDY5LDYgKzQ3MCwyMiBAQCBzdHJ1Y3Qgc3VuOGlfdmlfbGF5ZXIgKnN1bjhpX3Zp
X2xheWVyX2luaXRfb25lKHN0cnVjdCBkcm1fZGV2aWNlICpkcm0sCiAJCXJldHVybiBFUlJfUFRS
KHJldCk7CiAJfQogCisJc3VwcG9ydGVkX2VuY29kaW5ncyA9IEJJVChEUk1fQ09MT1JfWUNCQ1Jf
QlQ2MDEpIHwKKwkJCSAgICAgIEJJVChEUk1fQ09MT1JfWUNCQ1JfQlQ3MDkpOworCisJc3VwcG9y
dGVkX3JhbmdlcyA9IEJJVChEUk1fQ09MT1JfWUNCQ1JfTElNSVRFRF9SQU5HRSkgfAorCQkJICAg
QklUKERSTV9DT0xPUl9ZQ0JDUl9GVUxMX1JBTkdFKTsKKworCXJldCA9IGRybV9wbGFuZV9jcmVh
dGVfY29sb3JfcHJvcGVydGllcygmbGF5ZXItPnBsYW5lLAorCQkJCQkJc3VwcG9ydGVkX2VuY29k
aW5ncywKKwkJCQkJCXN1cHBvcnRlZF9yYW5nZXMsCisJCQkJCQlEUk1fQ09MT1JfWUNCQ1JfQlQ3
MDksCisJCQkJCQlEUk1fQ09MT1JfWUNCQ1JfTElNSVRFRF9SQU5HRSk7CisJaWYgKHJldCkgewor
CQlkZXZfZXJyKGRybS0+ZGV2LCAiQ291bGRuJ3QgYWRkIGVuY29kaW5nIGFuZCByYW5nZSBwcm9w
ZXJ0aWVzIVxuIik7CisJCXJldHVybiBFUlJfUFRSKHJldCk7CisJfQorCiAJZHJtX3BsYW5lX2hl
bHBlcl9hZGQoJmxheWVyLT5wbGFuZSwgJnN1bjhpX3ZpX2xheWVyX2hlbHBlcl9mdW5jcyk7CiAJ
bGF5ZXItPm1peGVyID0gbWl4ZXI7CiAJbGF5ZXItPmNoYW5uZWwgPSBpbmRleDsKLS0gCjIuMjIu
MAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
