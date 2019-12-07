Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F48A115F22
	for <lists+dri-devel@lfdr.de>; Sat,  7 Dec 2019 23:25:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ED1A6E26C;
	Sat,  7 Dec 2019 22:25:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B47276E267
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Dec 2019 22:25:17 +0000 (UTC)
Received: from ziggy.de (unknown [95.169.229.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 119172467D;
 Sat,  7 Dec 2019 22:25:12 +0000 (UTC)
From: matthias.bgg@kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, ck.hu@mediatek.com,
 p.zabel@pengutronix.de, airlied@linux.ie, mturquette@baylibre.com,
 sboyd@codeaurora.org, ulrich.hecht+renesas@gmail.com,
 laurent.pinchart@ideasonboard.com, enric.balletbo@collabora.com
Subject: [PATCH v6 10/12] clk: mediatek: mt8183: switch mmsys to platform
 device probing
Date: Sat,  7 Dec 2019 23:23:47 +0100
Message-Id: <20191207222349.23161-11-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191207222349.23161-1-matthias.bgg@kernel.org>
References: <20191207222349.23161-1-matthias.bgg@kernel.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1575757517;
 bh=q7YR4HMuFuPvR0RHWH0ycHC5MCSJKPZtTtyErowzU74=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oHJd7SdyDsbnvS03itu1WhPFsk4qurb84v+sPFd/yCQrRsses75DkrsP4CqtSwZ4r
 h66S1OXeCi9jHDllgCSigCY1JNe0ZQTl1dTJ2O36tflUPF9hsdq+woH8SpI+Q5glTP
 0LUv3CeTPapswzJXohRsOc4+LD5TmKNERxpzgPKg=
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
ClNpbmdlZC1vZmYtYnk6IE1hdHRoaWFzIEJydWdnZXIgPG1icnVnZ2VyQHN1c2UuY29tPgotLS0K
IGRyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDgxODMtbW0uYyB8IDM5ICsrKysrKysrKysrKysr
KysrKystLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspLCAxMiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ4MTgzLW1t
LmMgYi9kcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ4MTgzLW1tLmMKaW5kZXggNzIwYzY5NmI1
MDZkLi5lNmRjYWQxOGQ4MWEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1t
dDgxODMtbW0uYworKysgYi9kcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ4MTgzLW1tLmMKQEAg
LTMsMTQgKzMsMjAgQEAKIC8vIENvcHlyaWdodCAoYykgMjAxOCBNZWRpYVRlayBJbmMuCiAvLyBB
dXRob3I6IFdlaXlpIEx1IDx3ZWl5aS5sdUBtZWRpYXRlay5jb20+CiAKKyNpbmNsdWRlIDxsaW51
eC9tb2R1bGUuaD4KICNpbmNsdWRlIDxsaW51eC9jbGstcHJvdmlkZXIuaD4KICNpbmNsdWRlIDxs
aW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4KKyNpbmNsdWRlIDxsaW51eC9zbGFiLmg+CiAKICNpbmNs
dWRlICJjbGstbXRrLmgiCiAjaW5jbHVkZSAiY2xrLWdhdGUuaCIKIAogI2luY2x1ZGUgPGR0LWJp
bmRpbmdzL2Nsb2NrL210ODE4My1jbGsuaD4KIAorc3RydWN0IGNsa19tdDgxODNfbW1fcHJpdiB7
CisJc3RydWN0IGNsa19vbmVjZWxsX2RhdGEgKmNsa19kYXRhOworfTsKKwogc3RhdGljIGNvbnN0
IHN0cnVjdCBtdGtfZ2F0ZV9yZWdzIG1tMF9jZ19yZWdzID0gewogCS5zZXRfb2ZzID0gMHgxMDQs
CiAJLmNscl9vZnMgPSAweDEwOCwKQEAgLTg0LDI4ICs5MCwzNyBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IG10a19nYXRlIG1tX2Nsa3NbXSA9IHsKIAogc3RhdGljIGludCBjbGtfbXQ4MTgzX21tX3By
b2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiB7Ci0Jc3RydWN0IGNsa19vbmVjZWxs
X2RhdGEgKmNsa19kYXRhOwotCXN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZSA9IHBkZXYtPmRldi5v
Zl9ub2RlOworCXN0cnVjdCBjbGtfbXQ4MTgzX21tX3ByaXYgKnByaXZhdGU7CisJc3RydWN0IGRl
dmljZV9ub2RlICpub2RlID0gcGRldi0+ZGV2LnBhcmVudC0+b2Zfbm9kZTsKKworCXByaXZhdGUg
PSBkZXZtX2t6YWxsb2MoJnBkZXYtPmRldiwgc2l6ZW9mKCpwcml2YXRlKSwgR0ZQX0tFUk5FTCk7
CisJaWYgKCFwcml2YXRlKQorCQlyZXR1cm4gLUVOT01FTTsKIAotCWNsa19kYXRhID0gbXRrX2Fs
bG9jX2Nsa19kYXRhKENMS19NTV9OUl9DTEspOworCXByaXZhdGUtPmNsa19kYXRhID0gbXRrX2Fs
bG9jX2Nsa19kYXRhKENMS19NTV9OUl9DTEspOworCXBsYXRmb3JtX3NldF9kcnZkYXRhKHBkZXYs
IHByaXZhdGUpOwogCiAJbXRrX2Nsa19yZWdpc3Rlcl9nYXRlcyhub2RlLCBtbV9jbGtzLCBBUlJB
WV9TSVpFKG1tX2Nsa3MpLAotCQkJY2xrX2RhdGEpOworCQkJcHJpdmF0ZS0+Y2xrX2RhdGEpOwog
Ci0JcmV0dXJuIG9mX2Nsa19hZGRfcHJvdmlkZXIobm9kZSwgb2ZfY2xrX3NyY19vbmVjZWxsX2dl
dCwgY2xrX2RhdGEpOworCXJldHVybiBvZl9jbGtfYWRkX3Byb3ZpZGVyKG5vZGUsIG9mX2Nsa19z
cmNfb25lY2VsbF9nZXQsCisJCQlwcml2YXRlLT5jbGtfZGF0YSk7CiB9CiAKLXN0YXRpYyBjb25z
dCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG9mX21hdGNoX2Nsa19tdDgxODNfbW1bXSA9IHsKLQl7IC5j
b21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE4My1tbXN5cyIsIH0sCi0Je30KLX07CitzdGF0aWMg
aW50IGNsa19tdDgxODNfbW1fcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCit7
CisJc3RydWN0IGNsa19tdDgxODNfbW1fcHJpdiAqcHJpdmF0ZSA9IHBsYXRmb3JtX2dldF9kcnZk
YXRhKHBkZXYpOworCisJa2ZyZWUocHJpdmF0ZS0+Y2xrX2RhdGEpOworCisJcmV0dXJuIDA7Cit9
CiAKIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIGNsa19tdDgxODNfbW1fZHJ2ID0gewog
CS5wcm9iZSA9IGNsa19tdDgxODNfbW1fcHJvYmUsCisJLnJlbW92ZSA9IGNsa19tdDgxODNfbW1f
cmVtb3ZlLAogCS5kcml2ZXIgPSB7CiAJCS5uYW1lID0gImNsay1tdDgxODMtbW0iLAotCQkub2Zf
bWF0Y2hfdGFibGUgPSBvZl9tYXRjaF9jbGtfbXQ4MTgzX21tLAogCX0sCiB9OwotCi1idWlsdGlu
X3BsYXRmb3JtX2RyaXZlcihjbGtfbXQ4MTgzX21tX2Rydik7Cittb2R1bGVfcGxhdGZvcm1fZHJp
dmVyKGNsa19tdDgxODNfbW1fZHJ2KTsKLS0gCjIuMjQuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
