Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0868115F0C
	for <lists+dri-devel@lfdr.de>; Sat,  7 Dec 2019 23:25:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EBD16E262;
	Sat,  7 Dec 2019 22:24:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFD956E262
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Dec 2019 22:24:57 +0000 (UTC)
Received: from ziggy.de (unknown [95.169.229.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0B76424677;
 Sat,  7 Dec 2019 22:24:52 +0000 (UTC)
From: matthias.bgg@kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, ck.hu@mediatek.com,
 p.zabel@pengutronix.de, airlied@linux.ie, mturquette@baylibre.com,
 sboyd@codeaurora.org, ulrich.hecht+renesas@gmail.com,
 laurent.pinchart@ideasonboard.com, enric.balletbo@collabora.com
Subject: [PATCH v6 06/12] clk: mediatek: mt2701: switch mmsys to platform
 device probing
Date: Sat,  7 Dec 2019 23:23:43 +0100
Message-Id: <20191207222349.23161-7-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191207222349.23161-1-matthias.bgg@kernel.org>
References: <20191207222349.23161-1-matthias.bgg@kernel.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1575757497;
 bh=FAUVKc3LCu1hHsC00k/MW/ZDjSgvalsHfSMYXaOWuAo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UCVT5Frm8oiSOjPjJKrImLyQEpqFfMP8vThjy4aI+HDoqMfBvL/8fW7yAHmREc3B7
 3xcR1NB4HWwCpSByUSFtBqAW3UiTK+w2Jpr/5PqJBd5w02bnTc/HKuZeLFjWIusSVi
 gUtwIoaskz72ss8TxMvE+pjXyDQnlJuKv2F95rCw=
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
ZyBmb3IgdGhlIE1NU1lTIHRvIHN1cHBvcnQgaW52b2NhdGlvbiB0byBhIHBsYWluCnBhbHRmb3Jt
IGRldmljZS4gVGhlIGRyaXZlciB3aWxsIGJlIHByb2JlZCBieSB0aGUgRFJNIHN1YnN5c3RlbS4K
ClNpZ25lZC1vZmYtYnk6IE1hdHRoaWFzIEJydWdnZXIgPG1icnVnZ2VyQHN1c2UuY29tPgotLS0K
IGRyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDI3MDEtbW0uYyB8IDQxICsrKysrKysrKysrKysr
KysrKysrLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspLCAxMiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQyNzAxLW1t
LmMgYi9kcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQyNzAxLW1tLmMKaW5kZXggMDU0YjU5N2Q0
YTczLi40YTk0MzNjMmIyYjggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1t
dDI3MDEtbW0uYworKysgYi9kcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQyNzAxLW1tLmMKQEAg
LTQsMTQgKzQsMjAgQEAKICAqIEF1dGhvcjogU2h1bmxpIFdhbmcgPHNodW5saS53YW5nQG1lZGlh
dGVrLmNvbT4KICAqLwogCisjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+CiAjaW5jbHVkZSA8bGlu
dXgvY2xrLXByb3ZpZGVyLmg+CiAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+Cisj
aW5jbHVkZSA8bGludXgvc2xhYi5oPgogCiAjaW5jbHVkZSAiY2xrLW10ay5oIgogI2luY2x1ZGUg
ImNsay1nYXRlLmgiCiAKICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9jbG9jay9tdDI3MDEtY2xrLmg+
CiAKK3N0cnVjdCBjbGtfbXQyNzAxX21tX3ByaXYgeworCXN0cnVjdCBjbGtfb25lY2VsbF9kYXRh
ICpjbGtfZGF0YTsKK307CisKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2dhdGVfcmVncyBkaXNw
MF9jZ19yZWdzID0gewogCS5zZXRfb2ZzID0gMHgwMTA0LAogCS5jbHJfb2ZzID0gMHgwMTA4LApA
QCAtNzksMjMgKzg1LDI1IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2dhdGUgbW1fY2xrc1td
ID0gewogCUdBVEVfRElTUDEoQ0xLX01NX1RWRV9GTU0sICJtbV90dmVfZm1tIiwgIm1tX3NlbCIs
IDE0KSwKIH07CiAKLXN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG9mX21hdGNoX2Ns
a19tdDI3MDFfbW1bXSA9IHsKLQl7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10MjcwMS1tbXN5
cyIsIH0sCi0Je30KLX07Ci0KIHN0YXRpYyBpbnQgY2xrX210MjcwMV9tbV9wcm9iZShzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2KQogewotCXN0cnVjdCBjbGtfb25lY2VsbF9kYXRhICpjbGtf
ZGF0YTsKIAlpbnQgcjsKLQlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUgPSBwZGV2LT5kZXYub2Zf
bm9kZTsKKwlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUgPSBwZGV2LT5kZXYucGFyZW50LT5vZl9u
b2RlOworCXN0cnVjdCBjbGtfbXQyNzAxX21tX3ByaXYgKnByaXZhdGU7CisKKwlwcml2YXRlID0g
ZGV2bV9remFsbG9jKCZwZGV2LT5kZXYsIHNpemVvZigqcHJpdmF0ZSksIEdGUF9LRVJORUwpOwor
CWlmICghcHJpdmF0ZSkKKwkJcmV0dXJuIC1FTk9NRU07CiAKLQljbGtfZGF0YSA9IG10a19hbGxv
Y19jbGtfZGF0YShDTEtfTU1fTlIpOworCXByaXZhdGUtPmNsa19kYXRhID0gbXRrX2FsbG9jX2Ns
a19kYXRhKENMS19NTV9OUik7CisKKwlwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCBwcml2YXRl
KTsKIAogCW10a19jbGtfcmVnaXN0ZXJfZ2F0ZXMobm9kZSwgbW1fY2xrcywgQVJSQVlfU0laRSht
bV9jbGtzKSwKLQkJCQkJCWNsa19kYXRhKTsKKwkJCQkJcHJpdmF0ZS0+Y2xrX2RhdGEpOwogCi0J
ciA9IG9mX2Nsa19hZGRfcHJvdmlkZXIobm9kZSwgb2ZfY2xrX3NyY19vbmVjZWxsX2dldCwgY2xr
X2RhdGEpOworCXIgPSBvZl9jbGtfYWRkX3Byb3ZpZGVyKG5vZGUsIG9mX2Nsa19zcmNfb25lY2Vs
bF9nZXQsCisJCQkJCXByaXZhdGUtPmNsa19kYXRhKTsKIAlpZiAocikKIAkJZGV2X2VycigmcGRl
di0+ZGV2LAogCQkJImNvdWxkIG5vdCByZWdpc3RlciBjbG9jayBwcm92aWRlcjogJXM6ICVkXG4i
LApAQCAtMTA0LDEyICsxMTIsMjEgQEAgc3RhdGljIGludCBjbGtfbXQyNzAxX21tX3Byb2JlKHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJcmV0dXJuIHI7CiB9CiAKK3N0YXRpYyBpbnQg
Y2xrX210MjcwMV9tbV9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKK3sKKwlz
dHJ1Y3QgY2xrX210MjcwMV9tbV9wcml2ICpwcml2YXRlID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEo
cGRldik7CisKKwlrZnJlZShwcml2YXRlLT5jbGtfZGF0YSk7CisKKwlyZXR1cm4gMDsKK30KKwog
c3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgY2xrX210MjcwMV9tbV9kcnYgPSB7CiAJLnBy
b2JlID0gY2xrX210MjcwMV9tbV9wcm9iZSwKKwkucmVtb3ZlID0gY2xrX210MjcwMV9tbV9yZW1v
dmUsCiAJLmRyaXZlciA9IHsKIAkJLm5hbWUgPSAiY2xrLW10MjcwMS1tbSIsCi0JCS5vZl9tYXRj
aF90YWJsZSA9IG9mX21hdGNoX2Nsa19tdDI3MDFfbW0sCiAJfSwKIH07CiAKLWJ1aWx0aW5fcGxh
dGZvcm1fZHJpdmVyKGNsa19tdDI3MDFfbW1fZHJ2KTsKK21vZHVsZV9wbGF0Zm9ybV9kcml2ZXIo
Y2xrX210MjcwMV9tbV9kcnYpOwotLSAKMi4yNC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
