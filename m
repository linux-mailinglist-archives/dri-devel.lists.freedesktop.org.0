Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAFDD28BCE
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2019 22:48:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B7166E084;
	Thu, 23 May 2019 20:48:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A514B6E069;
 Thu, 23 May 2019 20:48:14 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 96A1460CF1; Thu, 23 May 2019 20:48:14 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
 version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: jcrouse@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 5E70D60C8B;
 Thu, 23 May 2019 20:48:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5E70D60C8B
Date: Thu, 23 May 2019 14:48:11 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v2 3/6] drm/msm/a6xx: Check for ERR or NULL before iounmap
Message-ID: <20190523204811.GD18360@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Sean Paul <sean@poorly.run>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Sean Paul <seanpaul@chromium.org>, Rob Clark <robdclark@gmail.com>,
 linux-arm-msm@vger.kernel.org
References: <20190523171653.138678-1-sean@poorly.run>
 <20190523171653.138678-3-sean@poorly.run>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190523171653.138678-3-sean@poorly.run>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1558644494;
 bh=4TuohgVqmQxCRsZ+7gw9HTjTy00RE3POM+u7USaPAC4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OaiW14uC9Ny8xaPfJXYO0SZqRJpLhIVgNCZWKTi2TGZzqn0GS5s3tq5G6uiHxCEtD
 5BkOLRBtCMGzkv3mUO+NnYalmMzRuEJI9U7O7yyiWuWrG9UonOf9SXVqrE51q8ROMw
 +Bp9KXCdkH41PNyPwaJe4PsdGhrcD6q7vj9GZRyI=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1558644493;
 bh=4TuohgVqmQxCRsZ+7gw9HTjTy00RE3POM+u7USaPAC4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eBF6uzWh3T5vvnLrXEwob4rUpB1vkYkHRODmQTnqKcYa8aoMUao9R5bEGsMD4E8gL
 ihWgs44+0u17c4v3m2Krf9WNCQShvND5Qr0WBbNj5Rdg/q8AP7I3roIC+HOcYax5uJ
 lUEUwxKzKgjTXehMDNRGWTbAQHveDekZEM6O+1Jc=
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
Cc: Sean Paul <seanpaul@chromium.org>, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgMjMsIDIwMTkgYXQgMDE6MTY6NDJQTSAtMDQwMCwgU2VhbiBQYXVsIHdyb3Rl
Ogo+IEZyb206IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgo+IAo+IHBkY3B0ciBh
bmQgc2VxcHRyIGFyZW4ndCBuZWNlc3NhcmlseSB2YWxpZCwgY2hlY2sgdGhlbSBiZWZvcmUgdHJ5
aW5nIHRvCj4gdW5tYXAgdGhlbS4KPiAKPiBDaGFuZ2VzIGluIHYyOgo+IC0gTm9uZQo+IAo+IENj
OiBKb3JkYW4gQ3JvdXNlIDxqY3JvdXNlQGNvZGVhdXJvcmEub3JnPgo+IFNpZ25lZC1vZmYtYnk6
IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgoKSXQgaGFzIGFsd2F5cyBiZWVuIHNh
ZCB0byBtZSB0aGF0IGlvdW5tYXAoKSBoYXMgY2hvc2VuIHRvIG5vdCBjaGVjayBmb3IgTlVMTC4K
ClJldmlld2VkLWJ5OiBKb3JkYW4gQ3JvdXNlIDxqY3JvdXNlQGNvZGVhdXJvcmEub3JnPgo+IC0t
LQo+ICBkcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNnh4X2dtdS5jIHwgNiArKysrLS0KPiAg
MSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9nbXUuYyBiL2RyaXZlcnMv
Z3B1L2RybS9tc20vYWRyZW5vL2E2eHhfZ211LmMKPiBpbmRleCA3NDJjOGZmOWE2MWMuLjc0NjU0
MjNlOWI3MSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNnh4X2dt
dS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9nbXUuYwo+IEBAIC01
MDQsOCArNTA0LDEwIEBAIHN0YXRpYyB2b2lkIGE2eHhfZ211X3JwbWhfaW5pdChzdHJ1Y3QgYTZ4
eF9nbXUgKmdtdSkKPiAgCXdtYigpOwo+ICAKPiAgZXJyOgo+IC0JZGV2bV9pb3VubWFwKGdtdS0+
ZGV2LCBwZGNwdHIpOwo+IC0JZGV2bV9pb3VubWFwKGdtdS0+ZGV2LCBzZXFwdHIpOwo+ICsJaWYg
KCFJU19FUlJfT1JfTlVMTChwZGNwdHIpKQo+ICsJCWRldm1faW91bm1hcChnbXUtPmRldiwgcGRj
cHRyKTsKPiArCWlmICghSVNfRVJSX09SX05VTEwoc2VxcHRyKSkKPiArCQlkZXZtX2lvdW5tYXAo
Z211LT5kZXYsIHNlcXB0cik7Cj4gIH0KPiAgCj4gIC8qCj4gLS0gCj4gU2VhbiBQYXVsLCBTb2Z0
d2FyZSBFbmdpbmVlciwgR29vZ2xlIC8gQ2hyb21pdW0gT1MKPiAKCi0tIApUaGUgUXVhbGNvbW0g
SW5ub3ZhdGlvbiBDZW50ZXIsIEluYy4gaXMgYSBtZW1iZXIgb2YgQ29kZSBBdXJvcmEgRm9ydW0s
CmEgTGludXggRm91bmRhdGlvbiBDb2xsYWJvcmF0aXZlIFByb2plY3QKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
