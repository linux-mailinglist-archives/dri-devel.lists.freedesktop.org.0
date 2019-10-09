Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA15D1A37
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 22:58:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A21FF6E832;
	Wed,  9 Oct 2019 20:58:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E7ED6E146
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2019 20:58:54 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id c10so2945277otd.9
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Oct 2019 13:58:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rPbqS3tT6apUPZNL8e9qPJ5+PJ+1PHYB4MklTNjcg7Q=;
 b=tT1OjtbprOu+ucjmxBGm8klctFiM+HKioyBt2kIqjn9CXEXBURjLQtr10f9HOlBi5G
 VOV+mbyRBdcu9PPp4qC6D9QleSY7K+vJGMUb/ExUPLQAbUT9FJ8/lEGPeaDsyUGNjlPP
 PemA2bog6pkIibYO0BgcaqNiLni3lAk91eu7Oy5E9PVT3uqSIg1WRMJd7d5mkK1R5V+h
 1CD0JP05izt4Kjw6Xw2A5Ufqxt9VbAurkaanDyCD4+Q66ZNbs+gD0B+wLeAdVM411bc3
 cj8NbCyIIhBsQUWXgTEuNuc4+O8YSN50c7F8lIATfpNIPC2Pkc4rX56ljnp5k9Q6WNNq
 m2Ig==
X-Gm-Message-State: APjAAAWF9lKmO6uCrhy6WFyfMSPQxAIWJu3ScjJ0MxJbETMcanR5D8Mc
 ilfkDQoE89P69vqgvA0w/L8Jw9SIQ7hvlPh9tJcqpA==
X-Google-Smtp-Source: APXvYqw7SNW6UiNehcwGcGcth3oBqtUprIQlt3rBUJYxzyaunZSWngUWFNWkMKJxlZHMmMHOdorEjCmd5hkIOtgYUYA=
X-Received: by 2002:a9d:2a88:: with SMTP id e8mr4915763otb.188.1570654733557; 
 Wed, 09 Oct 2019 13:58:53 -0700 (PDT)
MIME-Version: 1.0
References: <951eb7dc-bebe-5049-4998-f199e18b0bf3@canonical.com>
 <20191009163235.GT16989@phenom.ffwll.local>
 <a0d5f3a3-a2b3-5367-42f9-bde514571e25@amd.com>
 <CAKMK7uEtJRDhibWDv2TB2WrFzFooMWPSbveDD2N-rudAwvzVFA@mail.gmail.com>
 <c8f96b46-e81e-1e41-aafc-5f6ec236d66f@amd.com>
In-Reply-To: <c8f96b46-e81e-1e41-aafc-5f6ec236d66f@amd.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 9 Oct 2019 22:58:41 +0200
Message-ID: <CAKMK7uHr3aeJRqJAscDDfsuBBnVXCeN9SS36-1UGuK84NyOD5Q@mail.gmail.com>
Subject: Re: drm/amd/display: Add HDCP module - static analysis bug report
To: "Lakha, Bhawanpreet" <Bhawanpreet.Lakha@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=rPbqS3tT6apUPZNL8e9qPJ5+PJ+1PHYB4MklTNjcg7Q=;
 b=dQBWMf3H/PvQKnpQCE/xXFK5cdl6vgjIUZnFDnhYtxUeRUv5TAU237uS/UY4gEdaJ4
 evIak4UxlwBTDer2oj6m4t6VhITkuf9Np68sXJX3SFaxbactYYyJKsvlu1N6yk15qZ7q
 7+kzPwHZaDYRyj4+/q9irb16VkOCuflzKZG5Q=
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
Cc: "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 Colin Ian King <colin.king@canonical.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgOSwgMjAxOSBhdCAxMDo0NiBQTSBMYWtoYSwgQmhhd2FucHJlZXQKPEJoYXdh
bnByZWV0Lkxha2hhQGFtZC5jb20+IHdyb3RlOgo+Cj4gSSBtaXN1bmRlcnN0b29kIGFuZCB3YXMg
dGFsa2luZyBhYm91dCB0aGUga3N2IHZhbGlkYXRpb24gc3BlY2lmaWNhbGx5Cj4gKHVzYWdlIG9m
IGRybV9oZGNwX2NoZWNrX2tzdnNfcmV2b2tlZCgpKS4KCkhtIGZvciB0aGF0IHNwZWNpZmljYWxs
eSBJIHRoaW5rIHlvdSB3YW50IHRvIGRvIGJvdGgsIGkuZS4gYm90aApjb25zdWx0IHlvdXIgcHNw
LCBidXQgYWxzbyBjaGVjayBmb3IgcmV2b2tlZCBrc3ZzIHdpdGggdGhlIGNvcmUKaGVscGVyLiBB
dCBsZWFzdCBvbiBzb21lIHBsYXRmb3JtcyBvbmx5IHRoZSBjb3JlIGhlbHBlciBtaWdodCBoYXZl
IHRoZQp1cGRhdGVkIHJldm9rZSBsaXN0LgoKPiBGb3IgdGhlIGRlZmluZXMgSSB3aWxsIGNyZWF0
ZSBwYXRjaGVzIHRvIHVzZSBkcm1faGRjcCB3aGVyZSBpdCBpcyB1c2FibGUuCgpUaGFua3MgYSBs
b3QuIEltZSBvbmNlIHdlIGhhdmUgc2hhcmVkIGRlZmluaXRpb25zIGl0J3MgbXVjaCBlYXNpZXIg
dG8KYWxzbyBzaGFyZSBzb21lIGhlbHBlcnMsIHdoZXJlIGl0IG1ha2VzIHNlbnNlLgoKQXNpZGUg
SSB0aGluayB0aGUgaGRjcCBjb2RlIGNvdWxkIGFsc28gdXNlIGEgYml0IG9mIGRlbWlkbGF5ZXJp
bmcuIEF0CmxlYXN0IEknbSBub3QgdW5kZXJzdGFuZGluZyB3aHkgeW91IGFkZCBhIDJuZCBhYnN0
cmFjdGlvbiBsYXllciBmb3IKaTJjL2RwY2QsIGRtX2hlbHBlciBhbHJlYWR5IGhhcyB0aGF0LiBU
aGF0IHNlZW1zIGxpa2Ugb25lIGFic3RyYWN0aW9uCmxheWVyIHRvbyBtdWNoLgotRGFuaWVsCgo+
Cj4KPiBCaGF3YW4KPgo+IE9uIDIwMTktMTAtMDkgMjo0MyBwLm0uLCBEYW5pZWwgVmV0dGVyIHdy
b3RlOgo+ID4gT24gV2VkLCBPY3QgOSwgMjAxOSBhdCA4OjIzIFBNIExha2hhLCBCaGF3YW5wcmVl
dAo+ID4gPEJoYXdhbnByZWV0Lkxha2hhQGFtZC5jb20+IHdyb3RlOgo+ID4+IEhpLAo+ID4+Cj4g
Pj4gVGhlIHJlYXNvbiB3ZSBkb24ndCB1c2UgZHJtX2hkY3AgaXMgYmVjYXVzZSBvdXIgcG9saWN5
IGlzIHRvIGRvIGhkY3AKPiA+PiB2ZXJpZmljYXRpb24gdXNpbmcgUFNQL0hXIChvbmJvYXJkIHNl
Y3VyZSBwcm9jZXNzb3IpLgo+ID4gaTkxNSBhbHNvIHVzZXMgaHcgdG8gYXV0aCwgd2Ugc3RpbGwg
dXNlIHRoZSBwYXJ0cyBmcm9tIGRybV9oZGNwIC4uLgo+ID4gRGlkIHlvdSBhY3R1YWxseSBsb29r
IGF0IHdoYXQncyBpbiB0aGVyZT8gSXQncyBlc3NlbnRpYWxseSBqdXN0IHNoYXJlZAo+ID4gZGVm
aW5lcyBhbmQgZGF0YSBzdHJ1Y3R1cmVzIGZyb20gdGhlIHN0YW5kYXJkLCBwbHVzIGEgZmV3IG1p
bmltYWwKPiA+IGhlbHBlcnMgdG8gZW4vZGVjb2RlIHNvbWUgYml0cy4gSnVzdCBmcm9tIGEgcXVp
Y2sgcmVhZCB0aGUgZW50aXJlCj4gPiBwYXRjaCB2ZXJ5IG11Y2ggbG9va3MgbGlrZSBtaWRsYXll
ciBldmVyeXdoZXJlIGRlc2lnbiB0aGF0IHdlCj4gPiBkaXNjdXNzZWQgYmFjayB3aGVuIERDIGxh
bmRlZCAuLi4KPiA+IC1EYW5pZWwKPiA+Cj4gPj4gQmhhd2FuCj4gPj4KPiA+PiBPbiAyMDE5LTEw
LTA5IDEyOjMyIHAubS4sIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gPj4+IE9uIFRodSwgT2N0IDAz
LCAyMDE5IGF0IDExOjA4OjAzUE0gKzAxMDAsIENvbGluIElhbiBLaW5nIHdyb3RlOgo+ID4+Pj4g
SGksCj4gPj4+Pgo+ID4+Pj4gU3RhdGljIGFuYWx5c2lzIHdpdGggQ292ZXJpdHkgaGFzIGRldGVj
dGVkIGEgcG90ZW50aWFsIGlzc3VlIHdpdGgKPiA+Pj4+IGZ1bmN0aW9uIHZhbGlkYXRlX2Jrc3Yg
aW4KPiA+Pj4+IGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL2hkY3AvaGRjcDFf
ZXhlY3V0aW9uLmMgd2l0aCByZWNlbnQKPiA+Pj4+IGNvbW1pdDoKPiA+Pj4+Cj4gPj4+PiBjb21t
aXQgZWQ5ZDhlMmJjYjAwM2VjOTQ2NThjYWZlOWIxYmIzOTYwZTIxMzllYwo+ID4+Pj4gQXV0aG9y
OiBCaGF3YW5wcmVldCBMYWtoYSA8Qmhhd2FucHJlZXQuTGFraGFAYW1kLmNvbT4KPiA+Pj4+IERh
dGU6ICAgVHVlIEF1ZyA2IDE3OjUyOjAxIDIwMTkgLTA0MDAKPiA+Pj4+Cj4gPj4+PiAgICAgICBk
cm0vYW1kL2Rpc3BsYXk6IEFkZCBIRENQIG1vZHVsZQo+ID4+PiBJIHRoaW5rIHRoZSByZWFsIHF1
ZXN0aW9uIGhlcmUgaXMgLi4uIHdoeSBpcyB0aGlzIG5vdCB1c2luZyBkcm1faGRjcD8KPiA+Pj4g
LURhbmllbAo+ID4+Pgo+ID4+Pj4gVGhlIGFuYWx5c2lzIGlzIGFzIGZvbGxvd3M6Cj4gPj4+Pgo+
ID4+Pj4gICAgMjggc3RhdGljIGlubGluZSBlbnVtIG1vZF9oZGNwX3N0YXR1cyB2YWxpZGF0ZV9i
a3N2KHN0cnVjdCBtb2RfaGRjcCAqaGRjcCkKPiA+Pj4+ICAgIDI5IHsKPiA+Pj4+Cj4gPj4+PiBD
SUQgODk4NTIgKCMxIG9mIDEpOiBPdXQtb2YtYm91bmRzIHJlYWQgKE9WRVJSVU4pCj4gPj4+Pgo+
ID4+Pj4gMS4gb3ZlcnJ1bi1sb2NhbDoKPiA+Pj4+IE92ZXJydW5uaW5nIGFycmF5IG9mIDUgYnl0
ZXMgYXQgYnl0ZSBvZmZzZXQgNyBieSBkZXJlZmVyZW5jaW5nIHBvaW50ZXIKPiA+Pj4+ICh1aW50
NjRfdCAqKWhkY3AtPmF1dGgubXNnLmhkY3AxLmJrc3YuCj4gPj4+Pgo+ID4+Pj4gICAgMzAgICAg
ICAgIHVpbnQ2NF90IG4gPSAqKHVpbnQ2NF90ICopaGRjcC0+YXV0aC5tc2cuaGRjcDEuYmtzdjsK
PiA+Pj4+ICAgIDMxICAgICAgICB1aW50OF90IGNvdW50ID0gMDsKPiA+Pj4+ICAgIDMyCj4gPj4+
PiAgICAzMyAgICAgICAgd2hpbGUgKG4pIHsKPiA+Pj4+ICAgIDM0ICAgICAgICAgICAgICAgIGNv
dW50Kys7Cj4gPj4+PiAgICAzNSAgICAgICAgICAgICAgICBuICY9IChuIC0gMSk7Cj4gPj4+PiAg
ICAzNiAgICAgICAgfQo+ID4+Pj4KPiA+Pj4+IGhkY3AtPmF1dGgubXNnLmhkY3AxLmJrc3YgaXMg
YW4gYXJyYXkgb2YgNSB1aW50OF90IGFzIGRlZmluZWQgaW4KPiA+Pj4+IGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9tb2R1bGVzL2hkY3AvaGRjcC5oIGFzIGZvbGxvd3M6Cj4gPj4+Pgo+ID4+
Pj4gc3RydWN0IG1vZF9oZGNwX21lc3NhZ2VfaGRjcDEgewo+ID4+Pj4gICAgICAgICAgIHVpbnQ4
X3QgICAgICAgICBhbls4XTsKPiA+Pj4+ICAgICAgICAgICB1aW50OF90ICAgICAgICAgYWtzdls1
XTsKPiA+Pj4+ICAgICAgICAgICB1aW50OF90ICAgICAgICAgYWluZm87Cj4gPj4+PiAgICAgICAg
ICAgdWludDhfdCAgICAgICAgIGJrc3ZbNV07Cj4gPj4+PiAgICAgICAgICAgdWludDE2X3QgICAg
ICAgIHIwcDsKPiA+Pj4+ICAgICAgICAgICB1aW50OF90ICAgICAgICAgYmNhcHM7Cj4gPj4+PiAg
ICAgICAgICAgdWludDE2X3QgICAgICAgIGJzdGF0dXM7Cj4gPj4+PiAgICAgICAgICAgdWludDhf
dCAgICAgICAgIGtzdmxpc3RbNjM1XTsKPiA+Pj4+ICAgICAgICAgICB1aW50MTZfdCAgICAgICAg
a3N2bGlzdF9zaXplOwo+ID4+Pj4gICAgICAgICAgIHVpbnQ4X3QgICAgICAgICB2cFsyMF07Cj4g
Pj4+Pgo+ID4+Pj4gICAgICAgICAgIHVpbnQxNl90ICAgICAgICBiaW5mb19kcDsKPiA+Pj4+IH07
Cj4gPj4+Pgo+ID4+Pj4gdmFyaWFibGUgbiBpcyBnb2luZyB0byBjb250YWluIHRoZSBjb250YWlu
cyBvZiByMHAgYW5kIGJjYXBzLiBJJ20gbm90Cj4gPj4+PiBzdXJlIGlmIHRoYXQgaXMgaW50ZW50
aW9uYWwuIElmIG5vdCwgdGhlbiB0aGUgY291bnQgaXMgZ29pbmcgdG8gYmUKPiA+Pj4+IGluY29y
cmVjdCBpZiB0aGVzZSBhcmUgbm9uLXplcm8uCj4gPj4+Pgo+ID4+Pj4gQ29saW4KPiA+PiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4+IGRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKPiA+PiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPj4g
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
PiA+Cj4gPgoKCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29y
cG9yYXRpb24KKzQxICgwKSA3OSAzNjUgNTcgNDggLSBodHRwOi8vYmxvZy5mZndsbC5jaApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
