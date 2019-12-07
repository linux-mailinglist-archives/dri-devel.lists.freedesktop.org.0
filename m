Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 008FB115F74
	for <lists+dri-devel@lfdr.de>; Sat,  7 Dec 2019 23:48:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF5F86E286;
	Sat,  7 Dec 2019 22:48:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27F2D6E286
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Dec 2019 22:48:28 +0000 (UTC)
Received: from ziggy.de (unknown [95.169.229.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5E2592467E;
 Sat,  7 Dec 2019 22:48:23 +0000 (UTC)
From: matthias.bgg@kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, ck.hu@mediatek.com,
 p.zabel@pengutronix.de, airlied@linux.ie, mturquette@baylibre.com,
 sboyd@kernel.org, ulrich.hecht+renesas@gmail.com,
 laurent.pinchart@ideasonboard.com, enric.balletbo@collabora.com
Subject: [resend PATCH v6 05/12] media: mtk-mdp: Check return value of
 of_clk_get
Date: Sat,  7 Dec 2019 23:47:33 +0100
Message-Id: <20191207224740.24536-6-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191207224740.24536-1-matthias.bgg@kernel.org>
References: <20191207224740.24536-1-matthias.bgg@kernel.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1575758908;
 bh=T3/4wZPL9p7tEA69OL6cyT7PPtrc6Pr84n3ts0k0Pfo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CvYvGt3z/Sy+gpaY9YyraZYD2q3rsfkCdtc4BVBxEbD6975AhN+QnXfUMQt0i+ojx
 6S+x+4EoWlezGIT7geS9GrUahPX+e0uBpCR9m/QgZCWIXB3Vmkt62Qxx+uXBzb+e/8
 QBS35ZBCJ92daP1WH0ClM8d06l6/4I25cUotuXCE=
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
Cc: devicetree@vger.kernel.org, rdunlap@infradead.org, matthias.bgg@kernel.org,
 frank-w@public-files.de, sean.wang@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, sean.wang@kernel.org, wens@csie.org,
 drinkcat@chromium.org, linux-mediatek@lists.infradead.org, mbrugger@suse.com,
 hsinyi@chromium.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTWF0dGhpYXMgQnJ1Z2dlciA8bWJydWdnZXJAc3VzZS5jb20+CgpDaGVjayB0aGUgcmV0
dXJuIHZhbHVlIG9mIG9mX2Nsa19nZXQgYW5kIHByaW50IGFuIGVycm9yCm1lc3NhZ2UgaWYgbm90
IEVQUk9CRV9ERUZFUi4KClNpZ25lZC1vZmYtYnk6IE1hdHRoaWFzIEJydWdnZXIgPG1icnVnZ2Vy
QHN1c2UuY29tPgotLS0KIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLW1kcC9tdGtfbWRwX2Nv
bXAuYyB8IDYgKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstbWRwL210a19tZHBfY29tcC5jIGIvZHJp
dmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstbWRwL210a19tZHBfY29tcC5jCmluZGV4IDlhZmU4MTYx
YThjMC4uNGUyZmMxMzM3YjgwIDEwMDY0NAotLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210
ay1tZHAvbXRrX21kcF9jb21wLmMKKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstbWRw
L210a19tZHBfY29tcC5jCkBAIC0xMTAsNiArMTEwLDEyIEBAIGludCBtdGtfbWRwX2NvbXBfaW5p
dChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZSwKIAogCWZvciAo
aSA9IDA7IGkgPCBBUlJBWV9TSVpFKGNvbXAtPmNsayk7IGkrKykgewogCQljb21wLT5jbGtbaV0g
PSBvZl9jbGtfZ2V0KG5vZGUsIGkpOworCQlpZiAoSVNfRVJSKGNvbXAtPmNsa1tpXSlpKSB7CisJ
CQlpZiAoUFRSX0VSUihjb21wLT5jbGtbaV0gIT0gLUVQUk9CRV9ERUZFUikKKwkJCQkJZGV2X2Vy
cihkZXYsICJGYWlsZWQgdG8gZ2V0IGNsb2NrXG4iKTsKKworCQkJcmV0dXJuIFBUUl9FUlIoY29t
cC0+Y2xrW2ldKTsKKwkJfQogCiAJCS8qIE9ubHkgUkRNQSBuZWVkcyB0d28gY2xvY2tzICovCiAJ
CWlmIChjb21wLT50eXBlICE9IE1US19NRFBfUkRNQSkKLS0gCjIuMjQuMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
