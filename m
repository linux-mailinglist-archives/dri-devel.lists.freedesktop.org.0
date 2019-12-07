Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9897D115F8E
	for <lists+dri-devel@lfdr.de>; Sat,  7 Dec 2019 23:48:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E2156E28A;
	Sat,  7 Dec 2019 22:48:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 819366E28A
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Dec 2019 22:48:48 +0000 (UTC)
Received: from ziggy.de (unknown [95.169.229.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BA4EB24679;
 Sat,  7 Dec 2019 22:48:43 +0000 (UTC)
From: matthias.bgg@kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, ck.hu@mediatek.com,
 p.zabel@pengutronix.de, airlied@linux.ie, mturquette@baylibre.com,
 sboyd@kernel.org, ulrich.hecht+renesas@gmail.com,
 laurent.pinchart@ideasonboard.com, enric.balletbo@collabora.com
Subject: [resend PATCH v6 09/12] clk: mediatek: mt6797: switch to platform
 device probing
Date: Sat,  7 Dec 2019 23:47:37 +0100
Message-Id: <20191207224740.24536-10-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191207224740.24536-1-matthias.bgg@kernel.org>
References: <20191207224740.24536-1-matthias.bgg@kernel.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1575758928;
 bh=3FbY01Yo8wuTVmQw8dJE0UXjIQE+PrPmANVZvznNVUY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FHzctaPDg7dmplUogi7XCryhwqRMNZFXIBlR7oUmI2XAavnPHKo+bUlcIw4ffAhRL
 SSbhYLgM5RvNv3cYTgPLykvDmvIsjb+G+Wy4Z4mEQ7Upw/9o/g2hp/MD/IjGayc4Qd
 LCyQ/IyloH7OqNCHkU87vJ1ntXqRV2lf8ahzp3NE=
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

RnJvbTogTWF0dGhpYXMgQnJ1Z2dlciA8bWJydWdnZXJAc3VzZS5jb20+CgpTd2l0Y2ggcHJvYmlu
ZyBmb3IgdGhlIE1NU1lTIHRvIHN1cHBvcnQgaW52b2NhdGlvbiB0byBhCnBsYWluIHBhbHRmb3Jt
IGRldmljZS4gVGhlIGRyaXZlciB3aWxsIGJlIHByb2JlZCBieSB0aGUgRFJNIHN1YnN5c3RlbS4K
ClNpZ25lZC1vZmYtYnk6IE1hdHRoaWFzIEJydWdnZXIgPG1icnVnZ2VyQHN1c2UuY29tPgotLS0K
IGRyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDY3OTctbW0uYyB8IDQzICsrKysrKysrKysrKysr
KysrKystLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspLCAxNCBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ2Nzk3LW1t
LmMgYi9kcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ2Nzk3LW1tLmMKaW5kZXggOGYwNTY1M2Iz
ODdkLi4xYWVhNGY4ZDVhOWQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1t
dDY3OTctbW0uYworKysgYi9kcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ2Nzk3LW1tLmMKQEAg
LTQsMTMgKzQsMTkgQEAKICAqIEF1dGhvcjogS2V2aW4gQ2hlbiA8a2V2aW4tY3cuY2hlbkBtZWRp
YXRlay5jb20+CiAgKi8KIAorI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgogI2luY2x1ZGUgPGxp
bnV4L2Nsay1wcm92aWRlci5oPgogI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPgor
I2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4KICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9jbG9jay9tdDY3
OTctY2xrLmg+CiAKICNpbmNsdWRlICJjbGstbXRrLmgiCiAjaW5jbHVkZSAiY2xrLWdhdGUuaCIK
IAorc3RydWN0IGNsa19tdDY3OTdfbW1fcHJpdiB7CisJc3RydWN0IGNsa19vbmVjZWxsX2RhdGEg
KmNsa19kYXRhOworfTsKKwogc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfZ2F0ZV9yZWdzIG1tMF9j
Z19yZWdzID0gewogCS5zZXRfb2ZzID0gMHgwMTA0LAogCS5jbHJfb2ZzID0gMHgwMTA4LApAQCAt
OTIsMjMgKzk4LDI0IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2dhdGUgbW1fY2xrc1tdID0g
ewogCQkgImNsazI2bSIsIDMpLAogfTsKIAotc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2Vf
aWQgb2ZfbWF0Y2hfY2xrX210Njc5N19tbVtdID0gewotCXsgLmNvbXBhdGlibGUgPSAibWVkaWF0
ZWssbXQ2Nzk3LW1tc3lzIiwgfSwKLQl7fQotfTsKLQogc3RhdGljIGludCBjbGtfbXQ2Nzk3X21t
X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiB7Ci0Jc3RydWN0IGNsa19vbmVj
ZWxsX2RhdGEgKmNsa19kYXRhOworCXN0cnVjdCBjbGtfbXQ2Nzk3X21tX3ByaXYgKnByaXZhdGU7
CiAJaW50IHI7Ci0Jc3RydWN0IGRldmljZV9ub2RlICpub2RlID0gcGRldi0+ZGV2Lm9mX25vZGU7
CisJc3RydWN0IGRldmljZSAqcGFyZW50ID0gcGRldi0+ZGV2LnBhcmVudDsKKworCXByaXZhdGUg
PSBkZXZtX2t6YWxsb2MoJnBkZXYtPmRldiwgc2l6ZW9mKCpwcml2YXRlKSwgR0ZQX0tFUk5FTCk7
CisJaWYgKCFwcml2YXRlKQorCQlyZXR1cm4gLUVOT01FTTsKIAotCWNsa19kYXRhID0gbXRrX2Fs
bG9jX2Nsa19kYXRhKENMS19NTV9OUik7CisJcHJpdmF0ZS0+Y2xrX2RhdGEgPSBtdGtfYWxsb2Nf
Y2xrX2RhdGEoQ0xLX01NX05SKTsKKwlwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCBwcml2YXRl
KTsKIAotCW10a19jbGtfcmVnaXN0ZXJfZ2F0ZXMobm9kZSwgbW1fY2xrcywgQVJSQVlfU0laRSht
bV9jbGtzKSwKLQkJCSAgICAgICBjbGtfZGF0YSk7CisJbXRrX2Nsa19yZWdpc3Rlcl9nYXRlcyhw
YXJlbnQtPm9mX25vZGUsIG1tX2Nsa3MsIEFSUkFZX1NJWkUobW1fY2xrcyksCisJCQkgICAgICAg
cHJpdmF0ZS0+Y2xrX2RhdGEpOwogCi0JciA9IG9mX2Nsa19hZGRfcHJvdmlkZXIobm9kZSwgb2Zf
Y2xrX3NyY19vbmVjZWxsX2dldCwgY2xrX2RhdGEpOworCXIgPSBvZl9jbGtfYWRkX3Byb3ZpZGVy
KHBhcmVudC0+b2Zfbm9kZSwgb2ZfY2xrX3NyY19vbmVjZWxsX2dldCwKKwkJCXByaXZhdGUtPmNs
a19kYXRhKTsKIAlpZiAocikKIAkJZGV2X2VycigmcGRldi0+ZGV2LAogCQkJImNvdWxkIG5vdCBy
ZWdpc3RlciBjbG9jayBwcm92aWRlcjogJXM6ICVkXG4iLApAQCAtMTE3LDEyICsxMjQsMjAgQEAg
c3RhdGljIGludCBjbGtfbXQ2Nzk3X21tX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpCiAJcmV0dXJuIHI7CiB9CiAKK3N0YXRpYyBpbnQgY2xrX210Njc5N19tbV9yZW1vdmUoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKK3sKKwlzdHJ1Y3QgY2xrX210Njc5N19tbV9wcml2
ICpwcml2YXRlID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEocGRldik7CisKKwlrZnJlZShwcml2YXRl
LT5jbGtfZGF0YSk7CisKKwlyZXR1cm4gMDsKK30KKwogc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9k
cml2ZXIgY2xrX210Njc5N19tbV9kcnYgPSB7CiAJLnByb2JlID0gY2xrX210Njc5N19tbV9wcm9i
ZSwKKwkucmVtb3ZlID0gY2xrX210Njc5N19tbV9yZW1vdmUsCiAJLmRyaXZlciA9IHsKIAkJLm5h
bWUgPSAiY2xrLW10Njc5Ny1tbSIsCi0JCS5vZl9tYXRjaF90YWJsZSA9IG9mX21hdGNoX2Nsa19t
dDY3OTdfbW0sCiAJfSwKIH07Ci0KLWJ1aWx0aW5fcGxhdGZvcm1fZHJpdmVyKGNsa19tdDY3OTdf
bW1fZHJ2KTsKK21vZHVsZV9wbGF0Zm9ybV9kcml2ZXIoY2xrX210Njc5N19tbV9kcnYpOwotLSAK
Mi4yNC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
