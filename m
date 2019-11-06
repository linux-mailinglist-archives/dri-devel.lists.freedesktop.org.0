Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D0AF1FA9
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 21:22:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A17D6E054;
	Wed,  6 Nov 2019 20:22:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com
 [IPv6:2607:f8b0:4864:20::b44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F02596E054
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 20:22:40 +0000 (UTC)
Received: by mail-yb1-xb44.google.com with SMTP id i15so16840ybq.0
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Nov 2019 12:22:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=0HP9L4DD3fM5HSK3sU2Mzfonjn2MP/05ReBABvgOO6Y=;
 b=pK9AsWt8zFlAqdx2rlSkjKYtOUnSAQ2cpBtemOL72nLGZagm+9zTpe6eoUH2+4nSFL
 QmPOtHbH8Xd/V7JQU+0ZVT/uMHAnyQGVG4EiYOqW+cng3vVBB+Uo3kbFs21eV2GXPUHX
 5qjhHaZ7lklE5/xpECGSantPhnxj034HegSFCdGL0SS7seQNXTkKcG+MauL/fJRBJ6vd
 rc6xMVHvyFqbjcJOgNZF51Pdl1dkdgnhLgFhcWw8v8HYFVuBJTDJxvDj1rsaAoQ3OqP6
 aKGjxSMvJAlUumRR51wqHDCtJh0bQ7STqjwE57ws7dZKdeY6/Bm5FN7Y0F1WDq7w5s0L
 gA2g==
X-Gm-Message-State: APjAAAW4cswmbIAXncCnnA2LMhxX2oNL/8uJFdTBW/4sao1hkX3uhZ18
 irSJXmXyqs2gEbG78AFLBcCqrw==
X-Google-Smtp-Source: APXvYqwDVnReo2cZeVLAtnkuiyjmh50MT+y/Kb3hg1z2V0RFYr4xBIY66YHUN+2dw6/zgHlhRGOkig==
X-Received: by 2002:a25:4258:: with SMTP id p85mr3996725yba.417.1573071759932; 
 Wed, 06 Nov 2019 12:22:39 -0800 (PST)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id b201sm10570967ywe.2.2019.11.06.12.22.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2019 12:22:39 -0800 (PST)
Date: Wed, 6 Nov 2019 15:22:38 -0500
From: Sean Paul <sean@poorly.run>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH] drm/mst: Fix up u64 division
Message-ID: <20191106202238.GE63329@art_vandelay>
References: <20191106182813.GV1208@intel.com>
 <20191106194121.164458-1-sean@poorly.run>
 <20191106201434.GW1208@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191106201434.GW1208@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=0HP9L4DD3fM5HSK3sU2Mzfonjn2MP/05ReBABvgOO6Y=;
 b=Y/pRi6H861rnE7pPDpeedLUqsrzogZsy7vIsJnqS6aihKzl0bVe97N09tK3avexSk8
 LDVmJSR/e+qb3t1bB8NRLbUPrzvf3X7lVE1xqI6ATaAeyUQzhblctoGCasCX27zCno1J
 TryALRM+Yty8zwOGakn/+GORS/CMARPIvmBYSuml5HCFyB4mUEbxQNmz9j6SpPXIYfe1
 eGqB/YeyqttrSVb8S/kCQfYoryPiZS228IOSMgI+nhLM3zgFzTerwpBR2yYUAdC8Zlze
 br07u6lRN45aZzZL34TGdPNfgder/0uqpy2lKf1TDy23hj/KK2yBI+ucp4ifC/X9D39O
 RTNA==
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
Cc: David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
 dri-devel@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Harry Wentland <hwentlan@amd.com>,
 Juston Li <juston.li@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMDYsIDIwMTkgYXQgMTA6MTQ6MzRQTSArMDIwMCwgVmlsbGUgU3lyasOkbMOk
IHdyb3RlOgo+IE9uIFdlZCwgTm92IDA2LCAyMDE5IGF0IDAyOjQxOjE1UE0gLTA1MDAsIFNlYW4g
UGF1bCB3cm90ZToKPiA+IEZyb206IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgo+
ID4gCj4gPiBDaGFuZ2UgcmVtX25zZWMgdG8gdTMyIHNpbmNlIHRoYXQncyB3aGF0IGRvX2RpdiBy
ZXR1cm5zLCB0aGlzIGF2b2lkcyB0aGUKPiA+IHU2NCBkaXZpZGUgaW4gdGhlIGRybV9wcmludCBh
cmdzLgo+ID4gCj4gPiBDaGFuZ2VzIGluIHYyOgo+ID4gLSBJbnN0ZWFkIG9mIGRvaW5nIGRvX2Rp
diBpbiBkcm1fcHJpbnQsIG1ha2UgcmVtX25zZWMgdTMyIChWaWxsZSkKPiA+IAo+ID4gTGluayB0
byB2MTogaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoL21zZ2lkLzIwMTkx
MTA2MTczNjIyLjE1NTczLTEtc2VhbkBwb29ybHkucnVuCj4gPiAKPiA+IEZpeGVzOiAxMmEyODBj
NzI4NjggKCJkcm0vZHBfbXN0OiBBZGQgdG9wb2xvZ3kgcmVmIGhpc3RvcnkgdHJhY2tpbmcgZm9y
IGRlYnVnZ2luZyIpCj4gPiBDYzogSnVzdG9uIExpIDxqdXN0b24ubGlAaW50ZWwuY29tPgo+ID4g
Q2M6IEltcmUgRGVhayA8aW1yZS5kZWFrQGludGVsLmNvbT4KPiA+IENjOiBWaWxsZSBTeXJqw6Rs
w6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgo+ID4gQ2M6IEhhcnJ5IFdlbnRsYW5k
IDxod2VudGxhbkBhbWQuY29tPgo+ID4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJA
ZmZ3bGwuY2g+Cj4gPiBDYzogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+Cj4gPiBDYzogTHl1
ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KPiA+IENjOiBNYWFydGVuIExhbmtob3JzdCA8bWFh
cnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgo+ID4gQ2M6IE1heGltZSBSaXBhcmQgPG1y
aXBhcmRAa2VybmVsLm9yZz4KPiA+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+
Cj4gPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+ID4gQ2M6IGRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+IFNpZ25lZC1vZmYtYnk6IFNlYW4gUGF1bCA8c2Vh
bnBhdWxAY2hyb21pdW0ub3JnPgo+IAo+IGxndG0KPiBSZXZpZXdlZC1ieTogVmlsbGUgU3lyasOk
bMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClRoYW5rcyBmb3IgdGhlIHF1aWNr
IHJldmlld3MsIEkndmUgcHVzaGVkIHRoaXMgdG8gZHJtLW1pc2MtbmV4dC1maXhlcy4KClNlYW4K
Cj4gCj4gPiAtLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jIHwg
NCArKy0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9s
b2d5LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCj4gPiBpbmRleCAx
MWFkYzRiNmNjZmUuLmFlNTgwOWExZjE5YSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBf
bXN0X3RvcG9sb2d5LmMKPiA+IEBAIC0xNTA3LDEyICsxNTA3LDEyIEBAIF9fZHVtcF90b3BvbG9n
eV9yZWZfaGlzdG9yeShzdHJ1Y3QgZHJtX2RwX21zdF90b3BvbG9neV9yZWZfaGlzdG9yeSAqaGlz
dG9yeSwKPiA+ICAJCXVsb25nICplbnRyaWVzOwo+ID4gIAkJdWludCBucl9lbnRyaWVzOwo+ID4g
IAkJdTY0IHRzX25zZWMgPSBlbnRyeS0+dHNfbnNlYzsKPiA+IC0JCXU2NCByZW1fbnNlYyA9IGRv
X2Rpdih0c19uc2VjLCAxMDAwMDAwMDAwKTsKPiA+ICsJCXUzMiByZW1fbnNlYyA9IGRvX2Rpdih0
c19uc2VjLCAxMDAwMDAwMDAwKTsKPiA+ICAKPiA+ICAJCW5yX2VudHJpZXMgPSBzdGFja19kZXBv
dF9mZXRjaChlbnRyeS0+YmFja3RyYWNlLCAmZW50cmllcyk7Cj4gPiAgCQlzdGFja190cmFjZV9z
bnByaW50KGJ1ZiwgUEFHRV9TSVpFLCBlbnRyaWVzLCBucl9lbnRyaWVzLCA0KTsKPiA+ICAKPiA+
IC0JCWRybV9wcmludGYoJnAsICIgICVkICVzcyAobGFzdCBhdCAlNWxsdS4lMDZsbHUpOlxuJXMi
LAo+ID4gKwkJZHJtX3ByaW50ZigmcCwgIiAgJWQgJXNzIChsYXN0IGF0ICU1bGx1LiUwNnUpOlxu
JXMiLAo+ID4gIAkJCSAgIGVudHJ5LT5jb3VudCwKPiA+ICAJCQkgICB0b3BvbG9neV9yZWZfdHlw
ZV90b19zdHIoZW50cnktPnR5cGUpLAo+ID4gIAkJCSAgIHRzX25zZWMsIHJlbV9uc2VjIC8gMTAw
MCwgYnVmKTsKPiA+IC0tIAo+ID4gU2VhbiBQYXVsLCBTb2Z0d2FyZSBFbmdpbmVlciwgR29vZ2xl
IC8gQ2hyb21pdW0gT1MKPiAKPiAtLSAKPiBWaWxsZSBTeXJqw6Rsw6QKPiBJbnRlbAoKLS0gClNl
YW4gUGF1bCwgU29mdHdhcmUgRW5naW5lZXIsIEdvb2dsZSAvIENocm9taXVtIE9TCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
