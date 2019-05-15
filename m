Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9AA1FB0A
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2019 21:39:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18EFB89276;
	Wed, 15 May 2019 19:39:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B23389276;
 Wed, 15 May 2019 19:39:15 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id E314860A0A; Wed, 15 May 2019 19:39:14 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: jcrouse@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 70BFF6076A;
 Wed, 15 May 2019 19:39:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 70BFF6076A
Date: Wed, 15 May 2019 13:39:04 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH] drm/msm: Upgrade gxpd checks to IS_ERR_OR_NULL
Message-ID: <20190515193904.GE24137@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Sean Paul <sean@poorly.run>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Sean Paul <seanpaul@chromium.org>,
 Rob Clark <robdclark@chromium.org>, Rob Clark <robdclark@gmail.com>,
 linux-arm-msm@vger.kernel.org
References: <20190515170104.155525-1-sean@poorly.run>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190515170104.155525-1-sean@poorly.run>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1557949154;
 bh=IGrrCPh/FK/sDRXRKl9rNDJmBDTVZkTFJEPRx68pwrY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=leBupSBBupN4jzw02rAliC08fKKcfNTc0Jug4z8HpQE/A7qfpy/DNBUe06ih9PxNv
 rp2/48D/h1aCkHNhp3A2tZ9b6ZV4coXvjNfu7HxOb3Stq98nIFS3cEBJGq1fBOkeh1
 0xXw6b9cMUdNZfwFQpSWSI/+vVqthQqQ8Z99m9HA=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1557949147;
 bh=IGrrCPh/FK/sDRXRKl9rNDJmBDTVZkTFJEPRx68pwrY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fA409/S1vze2xiXW86p/7PVrMFTRS24/YVpi/us8Dt33o+vrs2EBd3s2SgeduQVTQ
 WsXiYCE2eTf9eYTEM4URbWKmkfTekQUS6WGvDbGbYEWaV58MoHdPX5Dw18cXvcsHYq
 1HsSr4N2sdbBB9+y1LJ/r+cgn7BbXU3n9T2JCthM=
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none)
 header.from=codeaurora.org
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none
 smtp.mailfrom=jcrouse@codeaurora.org
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgMTUsIDIwMTkgYXQgMDE6MDA6NTJQTSAtMDQwMCwgU2VhbiBQYXVsIHdyb3Rl
Ogo+IEZyb206IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgo+IAo+IGRldl9wbV9k
b21haW5fYXR0YWNoX2J5X25hbWUoKSBjYW4gcmV0dXJuIE5VTEwsIHNvIHdlIHNob3VsZCBjaGVj
ayBmb3IKPiB0aGF0IGNhc2Ugd2hlbiB3ZSdyZSBhYm91dCB0byBkZXJlZmVyZW5jZSBneHBkLgo+
IAo+IEZpeGVzOiA5MzI1ZDQyNjZhZmQgKCJkcm0vbXNtL2dwdTogQXR0YWNoIHRvIHRoZSBHUFUg
R1ggcG93ZXIgZG9tYWluIikKPiBDYzogSm9yZGFuIENyb3VzZSA8amNyb3VzZUBjb2RlYXVyb3Jh
Lm9yZz4KPiBDYzogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgo+IFNpZ25lZC1v
ZmYtYnk6IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgoKUmV2aWV3ZWQtYnk6IEpv
cmRhbiBDcm91c2UgPGpjcm91c2VAY29kZWF1b3JvcmEub3JnPgoKPiAtLS0KPiAgZHJpdmVycy9n
cHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9nbXUuYyB8IDYgKysrLS0tCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9tc20vYWRyZW5vL2E2eHhfZ211LmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Fk
cmVuby9hNnh4X2dtdS5jCj4gaW5kZXggOTE1NWRhZmFlMmE5MC4uMzhlMmNmYTljZWM3OSAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNnh4X2dtdS5jCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9nbXUuYwo+IEBAIC03NDcsNyArNzQ3LDcg
QEAgaW50IGE2eHhfZ211X3Jlc3VtZShzdHJ1Y3QgYTZ4eF9ncHUgKmE2eHhfZ3B1KQo+ICAJICog
d2lsbCBtYWtlIHN1cmUgdGhhdCB0aGUgcmVmY291bnRpbmcgaXMgY29ycmVjdCBpbiBjYXNlIHdl
IG5lZWQgdG8KPiAgCSAqIGJyaW5nIGRvd24gdGhlIEdYIGFmdGVyIGEgR01VIGZhaWx1cmUKPiAg
CSAqLwo+IC0JaWYgKCFJU19FUlIoZ211LT5neHBkKSkKPiArCWlmICghSVNfRVJSX09SX05VTEwo
Z211LT5neHBkKSkKPiAgCQlwbV9ydW50aW1lX2dldChnbXUtPmd4cGQpOwo+ICAKPiAgb3V0Ogo+
IEBAIC04NjMsNyArODYzLDcgQEAgaW50IGE2eHhfZ211X3N0b3Aoc3RydWN0IGE2eHhfZ3B1ICph
Nnh4X2dwdSkKPiAgCSAqIGRvbWFpbi4gVXN1YWxseSB0aGUgR01VIGRvZXMgdGhpcyBidXQgb25s
eSBpZiB0aGUgc2h1dGRvd24gc2VxdWVuY2UKPiAgCSAqIHdhcyBzdWNjZXNzZnVsCj4gIAkgKi8K
PiAtCWlmICghSVNfRVJSKGdtdS0+Z3hwZCkpCj4gKwlpZiAoIUlTX0VSUl9PUl9OVUxMKGdtdS0+
Z3hwZCkpCj4gIAkJcG1fcnVudGltZV9wdXRfc3luYyhnbXUtPmd4cGQpOwo+ICAKPiAgCWNsa19i
dWxrX2Rpc2FibGVfdW5wcmVwYXJlKGdtdS0+bnJfY2xvY2tzLCBnbXUtPmNsb2Nrcyk7Cj4gQEAg
LTEyMzQsNyArMTIzNCw3IEBAIHZvaWQgYTZ4eF9nbXVfcmVtb3ZlKHN0cnVjdCBhNnh4X2dwdSAq
YTZ4eF9ncHUpCj4gIAo+ICAJcG1fcnVudGltZV9kaXNhYmxlKGdtdS0+ZGV2KTsKPiAgCj4gLQlp
ZiAoIUlTX0VSUihnbXUtPmd4cGQpKSB7Cj4gKwlpZiAoIUlTX0VSUl9PUl9OVUxMKGdtdS0+Z3hw
ZCkpIHsKPiAgCQlwbV9ydW50aW1lX2Rpc2FibGUoZ211LT5neHBkKTsKPiAgCQlkZXZfcG1fZG9t
YWluX2RldGFjaChnbXUtPmd4cGQsIGZhbHNlKTsKPiAgCX0KPiAtLSAKPiBTZWFuIFBhdWwsIFNv
ZnR3YXJlIEVuZ2luZWVyLCBHb29nbGUgLyBDaHJvbWl1bSBPUwo+IAoKLS0gClRoZSBRdWFsY29t
bSBJbm5vdmF0aW9uIENlbnRlciwgSW5jLiBpcyBhIG1lbWJlciBvZiBDb2RlIEF1cm9yYSBGb3J1
bSwKYSBMaW51eCBGb3VuZGF0aW9uIENvbGxhYm9yYXRpdmUgUHJvamVjdApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
