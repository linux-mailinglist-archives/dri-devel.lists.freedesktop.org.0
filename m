Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E06FF115F0F
	for <lists+dri-devel@lfdr.de>; Sat,  7 Dec 2019 23:25:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C8946E264;
	Sat,  7 Dec 2019 22:25:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9E2F6E264
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Dec 2019 22:25:02 +0000 (UTC)
Received: from ziggy.de (unknown [95.169.229.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0BA972467A;
 Sat,  7 Dec 2019 22:24:57 +0000 (UTC)
From: matthias.bgg@kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, ck.hu@mediatek.com,
 p.zabel@pengutronix.de, airlied@linux.ie, mturquette@baylibre.com,
 sboyd@codeaurora.org, ulrich.hecht+renesas@gmail.com,
 laurent.pinchart@ideasonboard.com, enric.balletbo@collabora.com
Subject: [PATCH v6 07/12] clk: mediatek: mt2712e: switch to platform device
 probing
Date: Sat,  7 Dec 2019 23:23:44 +0100
Message-Id: <20191207222349.23161-8-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191207222349.23161-1-matthias.bgg@kernel.org>
References: <20191207222349.23161-1-matthias.bgg@kernel.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1575757502;
 bh=auWyY9ONWyopnTa7jwZEHJgz7lHXT4cKj+bG2jBUqvU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=o2cYWX7XYwqfasgRwBzONZXnGSG79B7RJcVEYVIuszy/TFDcXPT1rcAZ0y+gZfEq0
 aViL0R5MtDtN3RwE2tC4t73mCKE6ZSeVb5PfQoOqzXroHT2BrO5Ot5rF47vJIW0Orq
 XnH+BckYHxugym2U9RzAfKVCwtzgiFYIvPWXdPbk=
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
Cc: devicetree@vger.kernel.org, rdunlap@infradead.org, frank-w@public-files.de,
 sean.wang@mediatek.com, linux-kernel@vger.kernel.org,
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
IGRyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDI3MTItbW0uYyB8IDM5ICsrKysrKysrKysrKysr
KysrKystLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspLCAxMiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQyNzEyLW1t
LmMgYi9kcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQyNzEyLW1tLmMKaW5kZXggMWM1OTQ4YmUz
NWYzLi5kMDE4ZGI1NjgyNjMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1t
dDI3MTItbW0uYworKysgYi9kcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQyNzEyLW1tLmMKQEAg
LTQsMTQgKzQsMjAgQEAKICAqIEF1dGhvcjogV2VpeWkgTHUgPHdlaXlpLmx1QG1lZGlhdGVrLmNv
bT4KICAqLwogCisjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+CiAjaW5jbHVkZSA8bGludXgvY2xr
LXByb3ZpZGVyLmg+CiAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+CisjaW5jbHVk
ZSA8bGludXgvc2xhYi5oPgogCiAjaW5jbHVkZSAiY2xrLW10ay5oIgogI2luY2x1ZGUgImNsay1n
YXRlLmgiCiAKICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9jbG9jay9tdDI3MTItY2xrLmg+CiAKK3N0
cnVjdCBjbGtfbXQyNzEyX21tX3ByaXYgeworCXN0cnVjdCBjbGtfb25lY2VsbF9kYXRhICpjbGtf
ZGF0YTsKK307CisKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2dhdGVfcmVncyBtbTBfY2dfcmVn
cyA9IHsKIAkuc2V0X29mcyA9IDB4MTA0LAogCS5jbHJfb2ZzID0gMHgxMDgsCkBAIC0xMjgsMTYg
KzEzNCwyMiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG10a19nYXRlIG1tX2Nsa3NbXSA9IHsKIAog
c3RhdGljIGludCBjbGtfbXQyNzEyX21tX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpCiB7Ci0Jc3RydWN0IGNsa19vbmVjZWxsX2RhdGEgKmNsa19kYXRhOwogCWludCByOwotCXN0
cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZSA9IHBkZXYtPmRldi5vZl9ub2RlOworCXN0cnVjdCBkZXZp
Y2Vfbm9kZSAqbm9kZSA9IHBkZXYtPmRldi5wYXJlbnQtPm9mX25vZGU7CisJc3RydWN0IGNsa19t
dDI3MTJfbW1fcHJpdiAqcHJpdmF0ZTsKKworCXByaXZhdGUgPSBkZXZtX2t6YWxsb2MoJnBkZXYt
PmRldiwgc2l6ZW9mKCpwcml2YXRlKSwgR0ZQX0tFUk5FTCk7CisJaWYgKCFwcml2YXRlKQorCQly
ZXR1cm4gLUVOT01FTTsKIAotCWNsa19kYXRhID0gbXRrX2FsbG9jX2Nsa19kYXRhKENMS19NTV9O
Ul9DTEspOworCXByaXZhdGUtPmNsa19kYXRhID0gbXRrX2FsbG9jX2Nsa19kYXRhKENMS19NTV9O
Ul9DTEspOworCXBsYXRmb3JtX3NldF9kcnZkYXRhKHBkZXYsIHByaXZhdGUpOwogCiAJbXRrX2Ns
a19yZWdpc3Rlcl9nYXRlcyhub2RlLCBtbV9jbGtzLCBBUlJBWV9TSVpFKG1tX2Nsa3MpLAotCQkJ
Y2xrX2RhdGEpOworCQkJcHJpdmF0ZS0+Y2xrX2RhdGEpOwogCi0JciA9IG9mX2Nsa19hZGRfcHJv
dmlkZXIobm9kZSwgb2ZfY2xrX3NyY19vbmVjZWxsX2dldCwgY2xrX2RhdGEpOworCXIgPSBvZl9j
bGtfYWRkX3Byb3ZpZGVyKG5vZGUsIG9mX2Nsa19zcmNfb25lY2VsbF9nZXQsCisJCQlwcml2YXRl
LT5jbGtfZGF0YSk7CiAKIAlpZiAociAhPSAwKQogCQlwcl9lcnIoIiVzKCk6IGNvdWxkIG5vdCBy
ZWdpc3RlciBjbG9jayBwcm92aWRlcjogJWRcbiIsCkBAIC0xNDYsMTcgKzE1OCwyMCBAQCBzdGF0
aWMgaW50IGNsa19tdDI3MTJfbW1fcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikK
IAlyZXR1cm4gcjsKIH0KIAotc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgb2ZfbWF0
Y2hfY2xrX210MjcxMl9tbVtdID0gewotCXsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQyNzEy
LW1tc3lzIiwgfSwKLQl7fQotfTsKK3N0YXRpYyBpbnQgY2xrX210MjcxMl9tbV9yZW1vdmUoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKK3sKKwlzdHJ1Y3QgY2xrX210MjcxMl9tbV9wcml2
ICpwcml2YXRlID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEocGRldik7CisKKwlrZnJlZShwcml2YXRl
LT5jbGtfZGF0YSk7CisKKwlyZXR1cm4gMDsKK30KIAogc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9k
cml2ZXIgY2xrX210MjcxMl9tbV9kcnYgPSB7CiAJLnByb2JlID0gY2xrX210MjcxMl9tbV9wcm9i
ZSwKKwkucmVtb3ZlID0gY2xrX210MjcxMl9tbV9yZW1vdmUsCiAJLmRyaXZlciA9IHsKIAkJLm5h
bWUgPSAiY2xrLW10MjcxMi1tbSIsCi0JCS5vZl9tYXRjaF90YWJsZSA9IG9mX21hdGNoX2Nsa19t
dDI3MTJfbW0sCiAJfSwKIH07Ci0KLWJ1aWx0aW5fcGxhdGZvcm1fZHJpdmVyKGNsa19tdDI3MTJf
bW1fZHJ2KTsKK21vZHVsZV9wbGF0Zm9ybV9kcml2ZXIoY2xrX210MjcxMl9tbV9kcnYpOwotLSAK
Mi4yNC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
