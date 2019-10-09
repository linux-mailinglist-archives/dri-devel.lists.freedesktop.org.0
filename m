Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E22D140F
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 18:32:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD9576E131;
	Wed,  9 Oct 2019 16:32:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F5B36E131
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2019 16:32:40 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id c4so2634686edl.0
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Oct 2019 09:32:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=AsRzV/el8Z6unpKMWQXs9f6o4tkguJYdwjPl71MzeO4=;
 b=qQaHag2tjW5Qge8sG+lV/mfDJO30owRRCat2WGNZ2fbnh47pv0+hEPBv/Z9VkxkXMd
 Qo6jW1oqZHJuQQQbh5rczWtK7UhtURCV+kmjpmcGwVvTLmpedpzy+SwIkgV2ieFWZahL
 cVbw5E/EIbTwFRlsSDkmIMpHGGn/a7s7m2NYaMeYHgr1auWCE2qJ50tXz32B9NlRCY3/
 poe/pzJt9PUknLtAk/6dTopLgyKuEy4gxIdy1zj8lIWZSGDVxHAgAJfY7fiJdi2GWCjW
 1QhbiKBOvh2Kx2nPGSM6TGuy6wBy35TKIuY8hPIJL24Y15Vt0IazmgOzBTNuT1q1n54j
 CzYQ==
X-Gm-Message-State: APjAAAXHaNUoZo9hTfROYShwerRvTP4bLZ5fBhfFhhC4IuDVWT/Ln3Z2
 SLCWv+HrVWU26kW3Zwu6dUNu2A==
X-Google-Smtp-Source: APXvYqzwQw06TGxsSqHcjDC/wNFmpzXbSCEbJZ3820d/3Ps2IPTfJXCgo1jOu1txUjeab2Rpd2iaBQ==
X-Received: by 2002:a17:907:4150:: with SMTP id
 od24mr3627781ejb.135.1570638758954; 
 Wed, 09 Oct 2019 09:32:38 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id h7sm425812edn.73.2019.10.09.09.32.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2019 09:32:37 -0700 (PDT)
Date: Wed, 9 Oct 2019 18:32:35 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Colin Ian King <colin.king@canonical.com>
Subject: Re: drm/amd/display: Add HDCP module - static analysis bug report
Message-ID: <20191009163235.GT16989@phenom.ffwll.local>
Mail-Followup-To: Colin Ian King <colin.king@canonical.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <951eb7dc-bebe-5049-4998-f199e18b0bf3@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <951eb7dc-bebe-5049-4998-f199e18b0bf3@canonical.com>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=AsRzV/el8Z6unpKMWQXs9f6o4tkguJYdwjPl71MzeO4=;
 b=fB1vGK0Y8IInxFoNinBQl0U63Vrn/sGBs87QB1fHlAaA5THnBwVuB525lH71sSRqWR
 7u1F+4BGnXGpVDrX7Bmj2uK4hNBPzwIGfgKefHgP83Q/0Hj/fXjMRQbg9fNZeitUzVxK
 Vs+yuhtfDH6rElufVAUHv2i4AxeQ+P45uTWyY=
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
Cc: Leo Li <sunpeng.li@amd.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMDMsIDIwMTkgYXQgMTE6MDg6MDNQTSArMDEwMCwgQ29saW4gSWFuIEtpbmcg
d3JvdGU6Cj4gSGksCj4gCj4gU3RhdGljIGFuYWx5c2lzIHdpdGggQ292ZXJpdHkgaGFzIGRldGVj
dGVkIGEgcG90ZW50aWFsIGlzc3VlIHdpdGgKPiBmdW5jdGlvbiB2YWxpZGF0ZV9ia3N2IGluCj4g
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L21vZHVsZXMvaGRjcC9oZGNwMV9leGVjdXRpb24u
YyB3aXRoIHJlY2VudAo+IGNvbW1pdDoKPiAKPiBjb21taXQgZWQ5ZDhlMmJjYjAwM2VjOTQ2NThj
YWZlOWIxYmIzOTYwZTIxMzllYwo+IEF1dGhvcjogQmhhd2FucHJlZXQgTGFraGEgPEJoYXdhbnBy
ZWV0Lkxha2hhQGFtZC5jb20+Cj4gRGF0ZTogICBUdWUgQXVnIDYgMTc6NTI6MDEgMjAxOSAtMDQw
MAo+IAo+ICAgICBkcm0vYW1kL2Rpc3BsYXk6IEFkZCBIRENQIG1vZHVsZQoKSSB0aGluayB0aGUg
cmVhbCBxdWVzdGlvbiBoZXJlIGlzIC4uLiB3aHkgaXMgdGhpcyBub3QgdXNpbmcgZHJtX2hkY3A/
Ci1EYW5pZWwKCj4gCj4gCj4gVGhlIGFuYWx5c2lzIGlzIGFzIGZvbGxvd3M6Cj4gCj4gIDI4IHN0
YXRpYyBpbmxpbmUgZW51bSBtb2RfaGRjcF9zdGF0dXMgdmFsaWRhdGVfYmtzdihzdHJ1Y3QgbW9k
X2hkY3AgKmhkY3ApCj4gIDI5IHsKPiAKPiBDSUQgODk4NTIgKCMxIG9mIDEpOiBPdXQtb2YtYm91
bmRzIHJlYWQgKE9WRVJSVU4pCj4gCj4gMS4gb3ZlcnJ1bi1sb2NhbDoKPiBPdmVycnVubmluZyBh
cnJheSBvZiA1IGJ5dGVzIGF0IGJ5dGUgb2Zmc2V0IDcgYnkgZGVyZWZlcmVuY2luZyBwb2ludGVy
Cj4gKHVpbnQ2NF90ICopaGRjcC0+YXV0aC5tc2cuaGRjcDEuYmtzdi4KPiAKPiAgMzAgICAgICAg
IHVpbnQ2NF90IG4gPSAqKHVpbnQ2NF90ICopaGRjcC0+YXV0aC5tc2cuaGRjcDEuYmtzdjsKPiAg
MzEgICAgICAgIHVpbnQ4X3QgY291bnQgPSAwOwo+ICAzMgo+ICAzMyAgICAgICAgd2hpbGUgKG4p
IHsKPiAgMzQgICAgICAgICAgICAgICAgY291bnQrKzsKPiAgMzUgICAgICAgICAgICAgICAgbiAm
PSAobiAtIDEpOwo+ICAzNiAgICAgICAgfQo+IAo+IGhkY3AtPmF1dGgubXNnLmhkY3AxLmJrc3Yg
aXMgYW4gYXJyYXkgb2YgNSB1aW50OF90IGFzIGRlZmluZWQgaW4KPiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvbW9kdWxlcy9oZGNwL2hkY3AuaCBhcyBmb2xsb3dzOgo+IAo+IHN0cnVjdCBt
b2RfaGRjcF9tZXNzYWdlX2hkY3AxIHsKPiAgICAgICAgIHVpbnQ4X3QgICAgICAgICBhbls4XTsK
PiAgICAgICAgIHVpbnQ4X3QgICAgICAgICBha3N2WzVdOwo+ICAgICAgICAgdWludDhfdCAgICAg
ICAgIGFpbmZvOwo+ICAgICAgICAgdWludDhfdCAgICAgICAgIGJrc3ZbNV07Cj4gICAgICAgICB1
aW50MTZfdCAgICAgICAgcjBwOwo+ICAgICAgICAgdWludDhfdCAgICAgICAgIGJjYXBzOwo+ICAg
ICAgICAgdWludDE2X3QgICAgICAgIGJzdGF0dXM7Cj4gICAgICAgICB1aW50OF90ICAgICAgICAg
a3N2bGlzdFs2MzVdOwo+ICAgICAgICAgdWludDE2X3QgICAgICAgIGtzdmxpc3Rfc2l6ZTsKPiAg
ICAgICAgIHVpbnQ4X3QgICAgICAgICB2cFsyMF07Cj4gCj4gICAgICAgICB1aW50MTZfdCAgICAg
ICAgYmluZm9fZHA7Cj4gfTsKPiAKPiB2YXJpYWJsZSBuIGlzIGdvaW5nIHRvIGNvbnRhaW4gdGhl
IGNvbnRhaW5zIG9mIHIwcCBhbmQgYmNhcHMuIEknbSBub3QKPiBzdXJlIGlmIHRoYXQgaXMgaW50
ZW50aW9uYWwuIElmIG5vdCwgdGhlbiB0aGUgY291bnQgaXMgZ29pbmcgdG8gYmUKPiBpbmNvcnJl
Y3QgaWYgdGhlc2UgYXJlIG5vbi16ZXJvLgo+IAo+IENvbGluCgotLSAKRGFuaWVsIFZldHRlcgpT
b2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
