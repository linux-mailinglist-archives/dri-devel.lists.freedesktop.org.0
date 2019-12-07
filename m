Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 671D9115F84
	for <lists+dri-devel@lfdr.de>; Sat,  7 Dec 2019 23:48:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38C7A6E288;
	Sat,  7 Dec 2019 22:48:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CB286E288
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Dec 2019 22:48:43 +0000 (UTC)
Received: from ziggy.de (unknown [95.169.229.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A49C924683;
 Sat,  7 Dec 2019 22:48:38 +0000 (UTC)
From: matthias.bgg@kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, ck.hu@mediatek.com,
 p.zabel@pengutronix.de, airlied@linux.ie, mturquette@baylibre.com,
 sboyd@kernel.org, ulrich.hecht+renesas@gmail.com,
 laurent.pinchart@ideasonboard.com, enric.balletbo@collabora.com
Subject: [resend PATCH v6 08/12] clk: mediatek: mt6779: switch mmsys to
 platform device probing
Date: Sat,  7 Dec 2019 23:47:36 +0100
Message-Id: <20191207224740.24536-9-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191207224740.24536-1-matthias.bgg@kernel.org>
References: <20191207224740.24536-1-matthias.bgg@kernel.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1575758923;
 bh=TiW6KdtW/ar4YbEgXwuzvM2malWSh9JMEZcRb2LrTeE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Hux5QYpp3mkEwbFwe+Kii29sd+ioU4lhHyQ0rKFT5mU4jtTxwGU6AFkcyMdeEhuFX
 xDCs4tBbHV59MO1GJZUGjjegMqsYKGlbC8MQ/+UOWmAUvNKT7omB0+gblSCmjcY/f4
 PaSo7GrV/K88iRpIRWGzTfueHmuv7BhxtvWYtEDo=
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
ClNpbmdlZC1vZmYtYnk6IE1hdHRoaWFzIEJydWdnZXIgPG1icnVnZ2VyQHN1c2UuY29tPgotLS0K
IGRyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDY3NzktbW0uYyB8IDQxICsrKysrKysrKysrKysr
KysrKystLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspLCAxMyBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ2Nzc5LW1t
LmMgYi9kcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ2Nzc5LW1tLmMKaW5kZXggZmI1ZmJiOGUz
ZTQxLi40MzllYzQ2MGMxNjYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1t
dDY3NzktbW0uYworKysgYi9kcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ2Nzc5LW1tLmMKQEAg
LTQsMTMgKzQsMTkgQEAKICAqIEF1dGhvcjogV2VuZGVsbCBMaW4gPHdlbmRlbGwubGluQG1lZGlh
dGVrLmNvbT4KICAqLwogCisjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+CiAjaW5jbHVkZSA8bGlu
dXgvY2xrLXByb3ZpZGVyLmg+CiAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+CiAj
aW5jbHVkZSA8ZHQtYmluZGluZ3MvY2xvY2svbXQ2Nzc5LWNsay5oPgorI2luY2x1ZGUgPGxpbnV4
L3NsYWIuaD4KIAogI2luY2x1ZGUgImNsay1tdGsuaCIKICNpbmNsdWRlICJjbGstZ2F0ZS5oIgog
CitzdHJ1Y3QgY2xrX210Njc3OV9tbV9wcml2IHsKKwlzdHJ1Y3QgY2xrX29uZWNlbGxfZGF0YSAq
Y2xrX2RhdGE7Cit9OworCiBzdGF0aWMgY29uc3Qgc3RydWN0IG10a19nYXRlX3JlZ3MgbW0wX2Nn
X3JlZ3MgPSB7CiAJLnNldF9vZnMgPSAweDAxMDQsCiAJLmNscl9vZnMgPSAweDAxMDgsCkBAIC04
NCwzMCArOTAsMzkgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfZ2F0ZSBtbV9jbGtzW10gPSB7
CiAJR0FURV9NTTEoQ0xLX01NX0RJU1BfT1ZMX0ZCREMsICJtbV9kaXNwX292bF9mYmRjIiwgIm1t
X3NlbCIsIDE2KSwKIH07CiAKLXN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG9mX21h
dGNoX2Nsa19tdDY3NzlfbW1bXSA9IHsKLQl7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10Njc3
OS1tbXN5cyIsIH0sCi0Je30KLX07Ci0KIHN0YXRpYyBpbnQgY2xrX210Njc3OV9tbV9wcm9iZShz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogewotCXN0cnVjdCBjbGtfb25lY2VsbF9kYXRh
ICpjbGtfZGF0YTsKLQlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUgPSBwZGV2LT5kZXYub2Zfbm9k
ZTsKKwlzdHJ1Y3QgY2xrX210Njc3OV9tbV9wcml2ICpwcml2YXRlOworCXN0cnVjdCBkZXZpY2Vf
bm9kZSAqbm9kZSA9IHBkZXYtPmRldi5wYXJlbnQtPm9mX25vZGU7CisKKwlwcml2YXRlID0gZGV2
bV9remFsbG9jKCZwZGV2LT5kZXYsIHNpemVvZigqcHJpdmF0ZSksIEdGUF9LRVJORUwpOworCWlm
ICghcHJpdmF0ZSkKKwkJcmV0dXJuIC1FTk9NRU07CiAKLQljbGtfZGF0YSA9IG10a19hbGxvY19j
bGtfZGF0YShDTEtfTU1fTlJfQ0xLKTsKKwlwcml2YXRlLT5jbGtfZGF0YSA9IG10a19hbGxvY19j
bGtfZGF0YShDTEtfTU1fTlJfQ0xLKTsKKwlwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCBwcml2
YXRlKTsKIAogCW10a19jbGtfcmVnaXN0ZXJfZ2F0ZXMobm9kZSwgbW1fY2xrcywgQVJSQVlfU0la
RShtbV9jbGtzKSwKLQkJCSAgICAgICBjbGtfZGF0YSk7CisJCQkgICAgICAgcHJpdmF0ZS0+Y2xr
X2RhdGEpOwogCi0JcmV0dXJuIG9mX2Nsa19hZGRfcHJvdmlkZXIobm9kZSwgb2ZfY2xrX3NyY19v
bmVjZWxsX2dldCwgY2xrX2RhdGEpOworCXJldHVybiBvZl9jbGtfYWRkX3Byb3ZpZGVyKG5vZGUs
IG9mX2Nsa19zcmNfb25lY2VsbF9nZXQsCisJCQkJCQlwcml2YXRlLT5jbGtfZGF0YSk7Cit9CisK
K3N0YXRpYyBpbnQgY2xrX210Njc3OV9tbV9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikKK3sKKwlzdHJ1Y3QgY2xrX210Njc3OV9tbV9wcml2ICpwcml2YXRlID0gcGxhdGZvcm1f
Z2V0X2RydmRhdGEocGRldik7CisKKwlrZnJlZShwcml2YXRlLT5jbGtfZGF0YSk7CisKKwlyZXR1
cm4gMDsKIH0KIAogc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgY2xrX210Njc3OV9tbV9k
cnYgPSB7CiAJLnByb2JlID0gY2xrX210Njc3OV9tbV9wcm9iZSwKKwkucmVtb3ZlID0gY2xrX210
Njc3OV9tbV9yZW1vdmUsCiAJLmRyaXZlciA9IHsKIAkJLm5hbWUgPSAiY2xrLW10Njc3OS1tbSIs
Ci0JCS5vZl9tYXRjaF90YWJsZSA9IG9mX21hdGNoX2Nsa19tdDY3NzlfbW0sCiAJfSwKIH07Ci0K
LWJ1aWx0aW5fcGxhdGZvcm1fZHJpdmVyKGNsa19tdDY3NzlfbW1fZHJ2KTsKK21vZHVsZV9wbGF0
Zm9ybV9kcml2ZXIoY2xrX210Njc3OV9tbV9kcnYpOwotLSAKMi4yNC4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
