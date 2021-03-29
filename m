Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDAB34E12D
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 08:26:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95C236E84D;
	Tue, 30 Mar 2021 06:26:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mengyan1223.wang (mengyan1223.wang [89.208.246.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DAAF6E508;
 Mon, 29 Mar 2021 19:40:27 +0000 (UTC)
Received: from [IPv6:240e:35a:1037:8a00:70b2:e35d:833c:af3e] (unknown
 [IPv6:240e:35a:1037:8a00:70b2:e35d:833c:af3e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-384))
 (Client did not present a certificate)
 (Authenticated sender: xry111@mengyan1223.wang)
 by mengyan1223.wang (Postfix) with ESMTPSA id 4312765B2D;
 Mon, 29 Mar 2021 15:40:17 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mengyan1223.wang;
 s=mail; t=1617046827;
 bh=687Ppfrnu+qUdbeUIYIFSXDsMzZ8iILj4Dx2KqtjW/U=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=ZyKImvXezPMBrMUDK328o5CRlvO1WgAh8QkuK2OCykIvMmTRr+oS1bLeC6W0MEP1J
 5B9dudutLUFa2t6IaopBJqtO4LaB6K57CCJoMfMWsgD2gafm5wup9G/+yS5WbwD0lg
 PVZxAfRjQARxthGpJpDfw/g4d4CEornm6bquK5TNFtsAHQfbs6V0A1g56dPYx7xoXf
 K0IH4KlBINJuPCwsLFNFKe2Jn+WwfOmviM/KvHx5gmarPHTyFz3mkcdQ53d0Nf81K0
 Vv+RAP3JgC3PJTrDfsUiTQj9KVA/QEqfkLaeq7eGM9X50KBnai7tsOchwRVH0P3VWb
 zexHnusJZ01KQ==
Message-ID: <368b9b1b7343e35b446bb1028ccf0ae75dc2adc4.camel@mengyan1223.wang>
Subject: Re: [PATCH] drm/amdgpu: fix an underflow on non-4KB-page systems
From: Xi Ruoyao <xry111@mengyan1223.wang>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 Alex Deucher <alexander.deucher@amd.com>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Date: Tue, 30 Mar 2021 03:40:04 +0800
In-Reply-To: <7701fb71-9243-2d90-e1e1-d347a53b7d77@gmail.com>
References: <20210329175348.26859-1-xry111@mengyan1223.wang>
 <d192e2a8-8baf-0a8c-93a9-9abbad992c7d@gmail.com>
 <be9042b9294bda450659d3cd418c5e8759d57319.camel@mengyan1223.wang>
 <9a11c873-a362-b5d1-6d9c-e937034e267d@gmail.com>
 <bf9e05d4a6ece3e8bf1f732b011d3e54bbf8000e.camel@mengyan1223.wang>
 <84b3911173ad6beb246ba0a77f93d888ee6b393e.camel@mengyan1223.wang>
 <97c520ce107aa4d5fd96e2c380c8acdb63d45c37.camel@mengyan1223.wang>
 <7701fb71-9243-2d90-e1e1-d347a53b7d77@gmail.com>
User-Agent: Evolution 3.40.0 
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 30 Mar 2021 06:26:26 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: David Airlie <airlied@linux.ie>, Felix Kuehling <Felix.Kuehling@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Dan =?ISO-8859-1?Q?Hor=E1k?= <dan@danny.cz>, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMS0wMy0yOSAyMTozNiArMDIwMCwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPiBBbSAy
OS4wMy4yMSB1bSAyMToyNyBzY2hyaWViIFhpIFJ1b3lhbzoKPiA+IEhpIENocmlzdGlhbiwKPiA+
IAo+ID4gSSBkb24ndCB0aGluayB0aGVyZSBpcyBhbnkgY29uc3RyYWludCBpbXBsZW1lbnRlZCB0
byBlbnN1cmUgYG51bV9lbnRyaWVzICUKPiA+IEFNREdQVV9HUFVfUEFHRVNfSU5fQ1BVX1BBR0Ug
PT0gMGAuwqAgRm9yIGV4YW1wbGUsIGluIGBhbWRncHVfdm1fYm9fbWFwKClgOgo+ID4gCj4gPiDC
oMKgwqDCoMKgwqDCoMKgIC8qIHZhbGlkYXRlIHRoZSBwYXJhbWV0ZXJzICovCj4gPiDCoMKgwqDC
oMKgwqDCoMKgIGlmIChzYWRkciAmIEFNREdQVV9HUFVfUEFHRV9NQVNLIHx8IG9mZnNldCAmIEFN
REdQVV9HUFVfUEFHRV9NQVNLCj4gPiB8fAo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNp
emUgPT0gMCB8fCBzaXplICYgQU1ER1BVX0dQVV9QQUdFX01BU0spCj4gPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJTlZBTDsKPiA+IAo+ID4gLyogc25pcCAqLwo+
ID4gCj4gPiDCoMKgwqDCoMKgwqDCoMKgIHNhZGRyIC89IEFNREdQVV9HUFVfUEFHRV9TSVpFOwo+
ID4gwqDCoMKgwqDCoMKgwqDCoCBlYWRkciAvPSBBTURHUFVfR1BVX1BBR0VfU0laRTsKPiA+IAo+
ID4gLyogc25pcCAqLwo+ID4gCj4gPiDCoMKgwqDCoMKgwqDCoMKgIG1hcHBpbmctPnN0YXJ0ID0g
c2FkZHI7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgIG1hcHBpbmctPmxhc3QgPSBlYWRkcjsKPiA+IAo+
ID4gCj4gPiBJZiB3ZSByZWFsbHkgd2FudCB0byBlbnN1cmUgKG1hcHBpbmctPmxhc3QgLSBtYXBw
aW5nLT5zdGFydCArIDEpICUKPiA+IEFNREdQVV9HUFVfUEFHRVNfSU5fQ1BVX1BBR0UgPT0gMCwg
dGhlbiB3ZSBzaG91bGQgcmVwbGFjZQo+ID4gIkFNREdQVV9HUFVfUEFHRV9NQVNLIgo+ID4gaW4g
InZhbGlkYXRlIHRoZSBwYXJhbWV0ZXJzIiB3aXRoICJQQUdFX01BU0siLgo+IAo+IFllYWgsIGdv
b2QgcG9pbnQuCj4gCj4gPiBJIHRyaWVkIGl0IGFuZCBpdCBicm9rZSB1c2Vyc3BhY2U6IFhvcmcg
c3RhcnR1cCBmYWlscyB3aXRoIEVJTlZBTCB3aXRoIHRoaXMKPiA+IGNoYW5nZS4KPiAKPiBXZWxs
IGluIHRoZW9yeSBpdCBpcyBwb3NzaWJsZSB0aGF0IHdlIGFsd2F5cyBmaWxsIHRoZSBHUFVWTSBv
biBhIDRrIAo+IGJhc2lzIHdoaWxlIHRoZSBuYXRpdmUgcGFnZSBzaXplIG9mIHRoZSBDUFUgaXMg
bGFyZ2VyLiBMZXQgbWUgZG91YmxlIAo+IGNoZWNrIHRoZSBjb2RlLgo+IAo+IEJUVzogV2hhdCBj
b2RlIGJhc2UgYXJlIHlvdSBiYXNlZCBvbj8gVGhlIGNvZGUgeW91ciBwb3N0IGhlcmUgaXMgcXVp
dGUgCj4gb3V0ZGF0ZWQuCgpMaW51cycgdHJlZS4KCkknbGwgZ28gdG8gc2xlZXAgbm93IChpdCdz
IDAzOjM5IGhlcmUgOiggKSwgd2hlbiBJIHdha2UgdXAgSSBjYW4gdHJ5IHRvIGZldGNoCmRybS1u
ZXh0IG9yIHNvbWV0aGluZy4KLS0gClhpIFJ1b3lhbyA8eHJ5MTExQG1lbmd5YW4xMjIzLndhbmc+
ClNjaG9vbCBvZiBBZXJvc3BhY2UgU2NpZW5jZSBhbmQgVGVjaG5vbG9neSwgWGlkaWFuIFVuaXZl
cnNpdHkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
