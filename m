Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8265E8E6E8
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:37:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A638A6E94E;
	Thu, 15 Aug 2019 08:35:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B57396E883;
 Thu, 15 Aug 2019 00:49:14 +0000 (UTC)
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id 70E1D3EA0B;
 Thu, 15 Aug 2019 00:49:13 +0000 (UTC)
From: Brian Masney <masneyb@onstation.org>
To: bjorn.andersson@linaro.org, robh+dt@kernel.org, agross@kernel.org,
 a.hajda@samsung.com, narmstrong@baylibre.com, robdclark@gmail.com,
 sean@poorly.run
Subject: [PATCH 04/11] drm/bridge: analogix-anx78xx: convert to
 i2c_new_dummy_device
Date: Wed, 14 Aug 2019 20:48:47 -0400
Message-Id: <20190815004854.19860-5-masneyb@onstation.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190815004854.19860-1-masneyb@onstation.org>
References: <20190815004854.19860-1-masneyb@onstation.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 15 Aug 2019 08:34:58 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1565830154;
 bh=W1RhsccQye1UHlHsDlLQw0ZtaFOCOLeutTy9qm6UT1g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ljOjdnDfnnO2M7fWsgp2VIsd/s4cfZhi8GnD7ImjQsf55GctyEVH8TzpHZ8SwEnj1
 piyfyWPRBQc1ONqs1OLJW5qnMgQpws6bAUpZoNDjhkkurHtZT38o0szI4uBi6mLZot
 vCbWhMGGKK0OEEe6YtmwXnHvWIQUdgoHluIGXRso=
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, jernej.skrabec@siol.net,
 jonas@kwiboo.se, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Laurent.pinchart@ideasonboard.com, enric.balletbo@collabora.com,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGkyY19uZXdfZHVtbXkoKSBmdW5jdGlvbiBpcyBkZXByZWNhdGVkIHNpbmNlIGl0IHJldHVy
bnMgTlVMTCBvbgplcnJvci4gQ2hhbmdlIHRoaXMgdG8gdXNlIHRoZSByZWNvbW1lbmRlZCByZXBs
YWNlbWVudAppMmNfbmV3X2R1bW15X2RldmljZSgpIHRoYXQgcmV0dXJucyBhbiBlcnJvciBjb2Rl
IHRoYXQgY2FuIGJlIHJlYWQgd2l0aApQVFJfRVJSKCkgYW5kIGZyaWVuZHMuCgpTaWduZWQtb2Zm
LWJ5OiBCcmlhbiBNYXNuZXkgPG1hc25leWJAb25zdGF0aW9uLm9yZz4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL2FuYWxvZ2l4LWFueDc4eHguYyB8IDE1ICsrKysrKysrKy0tLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4LWFueDc4eHguYyBiL2RyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvYW5hbG9naXgtYW54Nzh4eC5jCmluZGV4IDYyZGZjZWQ5MTM4NC4uOGRhZWU2
YjFmYTg4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4LWFueDc4
eHguYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4LWFueDc4eHguYwpAQCAt
MTM1NSwxNSArMTM1NSwxOCBAQCBzdGF0aWMgaW50IGFueDc4eHhfaTJjX3Byb2JlKHN0cnVjdCBp
MmNfY2xpZW50ICpjbGllbnQsCiAKIAkvKiBNYXAgc2xhdmUgYWRkcmVzc2VzIG9mIEFOWDc4MTQg
Ki8KIAlmb3IgKGkgPSAwOyBpIDwgSTJDX05VTV9BRERSRVNTRVM7IGkrKykgewotCQlhbng3OHh4
LT5pMmNfZHVtbXlbaV0gPSBpMmNfbmV3X2R1bW15KGNsaWVudC0+YWRhcHRlciwKLQkJCQkJCWFu
eDc4eHhfaTJjX2FkZHJlc3Nlc1tpXSA+PiAxKTsKLQkJaWYgKCFhbng3OHh4LT5pMmNfZHVtbXlb
aV0pIHsKLQkJCWVyciA9IC1FTk9NRU07Ci0JCQlEUk1fRVJST1IoIkZhaWxlZCB0byByZXNlcnZl
IEkyQyBidXMgJTAyeFxuIiwKLQkJCQkgIGFueDc4eHhfaTJjX2FkZHJlc3Nlc1tpXSk7CisJCXN0
cnVjdCBpMmNfY2xpZW50ICppMmNfZHVtbXk7CisKKwkJaTJjX2R1bW15ID0gaTJjX25ld19kdW1t
eV9kZXZpY2UoY2xpZW50LT5hZGFwdGVyLAorCQkJCQkJIGFueDc4eHhfaTJjX2FkZHJlc3Nlc1tp
XSA+PiAxKTsKKwkJaWYgKElTX0VSUihpMmNfZHVtbXkpKSB7CisJCQllcnIgPSBQVFJfRVJSKGky
Y19kdW1teSk7CisJCQlEUk1fRVJST1IoIkZhaWxlZCB0byByZXNlcnZlIEkyQyBidXMgJTAyeDog
JWRcbiIsCisJCQkJICBhbng3OHh4X2kyY19hZGRyZXNzZXNbaV0sIGVycik7CiAJCQlnb3RvIGVy
cl91bnJlZ2lzdGVyX2kyYzsKIAkJfQogCisJCWFueDc4eHgtPmkyY19kdW1teVtpXSA9IGkyY19k
dW1teTsKIAkJYW54Nzh4eC0+bWFwW2ldID0gZGV2bV9yZWdtYXBfaW5pdF9pMmMoYW54Nzh4eC0+
aTJjX2R1bW15W2ldLAogCQkJCQkJICAgICAgICZhbng3OHh4X3JlZ21hcF9jb25maWcpOwogCQlp
ZiAoSVNfRVJSKGFueDc4eHgtPm1hcFtpXSkpIHsKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
