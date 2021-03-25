Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E837349139
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 12:53:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64B446EC9F;
	Thu, 25 Mar 2021 11:53:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa2.bahnhof.se (pio-pvt-msa2.bahnhof.se [79.136.2.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6766E6EC9F
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 11:53:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id CBAB23F496;
 Thu, 25 Mar 2021 12:53:13 +0100 (CET)
Authentication-Results: pio-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=Jcr/8gpy; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kXkEWKiv6GtY; Thu, 25 Mar 2021 12:53:08 +0100 (CET)
Received: by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 8DE093F449;
 Thu, 25 Mar 2021 12:53:07 +0100 (CET)
Received: from [10.249.254.165] (unknown [192.198.151.44])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 223A33600A8;
 Thu, 25 Mar 2021 12:53:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1616673198; bh=pupAMitWznuoPQ8iF8iLtIylmNo+WPnV6Cb+xjHhIIo=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Jcr/8gpyXj0u86Gzp+qlCA5cbWu6753/rNa1t/ZkoJ7miw09xCznZ+N1NKGpMxI3M
 TG7URHg57VZESD4MKWvhYIB27SRltWGjrSd6DSqcXV+wv7VRd3ubYudSl/+ROMKf+4
 mSfSqOcOFKgCS4638DmDU0fRlp8Y8eXw5QJLnsls=
Subject: Re: [RFC PATCH 1/2] mm,drm/ttm: Block fast GUP to TTM huge pages
To: Jason Gunthorpe <jgg@nvidia.com>
References: <6c9acb90-8e91-d8af-7abd-e762d9a901aa@shipmail.org>
 <20210324134833.GE2356281@nvidia.com>
 <0b984f96-00fb-5410-bb16-02e12b2cc024@shipmail.org>
 <20210324163812.GJ2356281@nvidia.com>
 <08f19e80-d6cb-8858-0c5d-67d2e2723f72@amd.com>
 <730eb2ff-ba98-2393-6d42-61735e3c6b83@shipmail.org>
 <20210324231419.GR2356281@nvidia.com>
 <607ecbeb-e8a5-66e9-6fe2-9a8d22f12bc2@shipmail.org>
 <fb74efd9-55be-9a8d-95b0-6103e263aab8@amd.com>
 <15da5784-96ca-25e5-1485-3ce387ee6695@shipmail.org>
 <20210325113023.GT2356281@nvidia.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <afad3159-9aa8-e052-3bef-d00dee1ba51e@shipmail.org>
Date: Thu, 25 Mar 2021 12:53:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210325113023.GT2356281@nvidia.com>
Content-Language: en-US
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDMvMjUvMjEgMTI6MzAgUE0sIEphc29uIEd1bnRob3JwZSB3cm90ZToKPiBPbiBUaHUsIE1h
ciAyNSwgMjAyMSBhdCAxMDo1MTozNUFNICswMTAwLCBUaG9tYXMgSGVsbHN0csO2bSAoSW50ZWwp
IHdyb3RlOgo+Cj4+PiBQbGVhc2UgZXhwbGFpbiB0aGF0IGZ1cnRoZXIuIFdoeSBkbyB3ZSBuZWVk
IHRoZSBtbWFwIGxvY2sgdG8gaW5zZXJ0IFBNRHMKPj4+IGJ1dCBub3Qgd2hlbiBpbnNlcnQgUFRF
cz8KPj4gV2UgZG9uJ3QuIEJ1dCBvbmNlIHlvdSd2ZSBpbnNlcnRlZCBhIFBNRCBkaXJlY3Rvcnkg
eW91IGNhbid0IHJlbW92ZSBpdAo+PiB1bmxlc3MgeW91IGhhdmUgdGhlIG1tYXAgbG9jayAoYW5k
IHByb2JhYmx5IGFsc28gdGhlIGlfbW1hcF9sb2NrIGluIHdyaXRlCj4+IG1vZGUpLiBUaGF0IGZv
ciBleGFtcGxlIG1lYW5zIHRoYXQgaWYgeW91IGhhdmUgYSBWUkFNIHJlZ2lvbiBtYXBwZWQgd2l0
aAo+PiBodWdlIFBNRHMsIGFuZCB0aGVuIGl0IGdldHMgZXZpY3RlZCwgYW5kIHlvdSBoYXBwZW4g
dG8gcmVhZCBhIGJ5dGUgZnJvbSBpdAo+PiB3aGVuIGl0J3MgZXZpY3RlZCBhbmQgdGhlcmVmb3Jl
IHBvcHVsYXRlIHRoZSBmdWxsIHJlZ2lvbiB3aXRoIFBURXMgcG9pbnRpbmcKPj4gdG8gc3lzdGVt
IHBhZ2VzLCB5b3UgY2FuJ3QgZ28gYmFjayB0byBodWdlIFBNRHMgYWdhaW4gd2l0aG91dCBhIG11
bm1hcCgpIGluCj4+IGJldHdlZW4uCj4gVGhpcyBpcyBhbGwgYmFzaWNhbGx5IG1hZ2ljIHRvIG1l
IHN0aWxsLCBidXQgVEhQIGRvZXMgdGhpcwo+IHRyYW5zZm9ybWF0aW9uIGFuZCBJIHRoaW5rIHdo
YXQgaXQgZG9lcyBjb3VsZCB3b3JrIGhlcmUgdG9vLiBXZQo+IHByb2JhYmx5IHdvdWxkbid0IGJl
IGFibGUgdG8gdXBncmFkZSB3aGlsZSBoYW5kbGluZyBmYXVsdCwgYnV0IGF0IHRoZQo+IHNhbWUg
dGltZSwgdGhpcyBzaG91bGQgYmUgcXVpdGUgcmFyZSBhcyBpdCB3b3VsZCByZXF1aXJlIHRoZSBk
cml2ZXIgdG8KPiBoYXZlIHN1cHBsaWVkIGEgc21hbGwgcGFnZSBmb3IgdGhpcyBWTUEgYXQgc29t
ZSBwb2ludC4KCklJUkMgVEhQIGhhbmRsZXMgdGhpcyB1c2luZyBraHVnZXBhZ2VkLCBncmFiYmlu
ZyB0aGUgbG9jayBpbiB3cml0ZSBtb2RlIAp3aGVuIGNvYWxlc2NpbmcsIGFuZCB5ZWFoLCBJIGRv
bid0IHRoaW5rIGFueXRoaW5nIHByZXZlbnRzIGFueW9uZSBmcm9tIApleHRlbmRpbmcga2h1Z2Vw
YWdlZCBkb2luZyB0aGF0IGFsc28gZm9yIHNwZWNpYWwgaHVnZSBwYWdlIHRhYmxlIGVudHJpZXMu
Cgo+Cj4+PiBBcGFydCBmcm9tIHRoYXQgSSBzdGlsbCBkb24ndCBmdWxseSBnZXQgd2h5IHdlIG5l
ZWQgdGhpcyBpbiB0aGUgZmlyc3QKPj4+IHBsYWNlLgo+PiBCZWNhdXNlIHZpcnR1YWwgaHVnZSBw
YWdlIGFkZHJlc3MgYm91bmRhcmllcyBuZWVkIHRvIGJlIGFsaWduZWQgd2l0aAo+PiBwaHlzaWNh
bCBodWdlIHBhZ2UgYWRkcmVzcyBib3VuZGFyaWVzLCBhbmQgbW1hcCBjYW4gaGFwcGVuIGJlZm9y
ZSBib3MgYXJlCj4+IHBvcHVsYXRlZCBzbyB5b3UgaGF2ZSBubyB3YXkgb2Yga25vd2luZyBob3cg
cGh5c2ljYWwgaHVnZSBwYWdlCj4+IGFkZHJlc3MKPiBCdXQgdGhpcyBpcyBhIG1tYXAtdGltZSBw
cm9ibGVtLCBmYXVsdCBjYW4ndCBmaXggbW1hcCB1c2luZyB0aGUgd3JvbmcgVkEuCgpOb3BlLiBU
aGUgcG9pbnQgaGVyZSB3YXMgdGhhdCBpbiB0aGlzIGNhc2UsIHRvIG1ha2Ugc3VyZSBtbWFwIHVz
ZXMgdGhlIApjb3JyZWN0IFZBIHRvIGdpdmUgdXMgYSByZWFzb25hYmxlIGNoYW5jZSBvZiBhbGln
bmVtZW50LCB0aGUgZHJpdmVyIAptaWdodCBuZWVkIHRvIGJlIGF3YXJlIG9mIGFuZCBkbyB0cmlj
a2VyeSB3aXRoIHRoZSBodWdlIHBhZ2UtdGFibGUtZW50cnkgCnNpemVzIGFueXdheSwgYWx0aG91
Z2ggSSB0aGluayBpbiBtb3N0IGNhc2VzIGEgc3RhbmRhcmQgaGVscGVyIGZvciB0aGlzIApjYW4g
YmUgc3VwcGxpZWQuCgovVGhvbWFzCgoKPgo+Pj4gSSByZWFsbHkgZG9uJ3Qgc2VlIHRoYXQgZWl0
aGVyLiBXaGVuIGEgYnVmZmVyIGlzIGFjY2Vzc2VkIGJ5IHRoZSBDUFUgaXQKPj4+IGlzIGluID4g
OTAlIG9mIGFsbCBjYXNlcyBjb21wbGV0ZWx5IGFjY2Vzc2VkLiBOb3QgZmF1bHRpbmcgaW4gZnVs
bAo+Pj4gcmFuZ2VzIGlzIGp1c3Qgb3B0aW1pemluZyBmb3IgYSByZWFsbHkgdW5saWtlbHkgY2Fz
ZSBoZXJlLgo+PiBJdCBtaWdodCBiZSB0aGF0IHlvdSdyZSByaWdodCwgYnV0IGFyZSBhbGwgZHJp
dmVycyB3YW50aW5nIHRvIHVzZSB0aGlzIGxpa2UKPj4gZHJtIGluIHRoaXMgcmVzcGVjdD8gVXNp
bmcgdGhlIGludGVyZmFjZSB0byBmYXVsdCBpbiBhIDFHIHJhbmdlIGluIHRoZSBob3BlCj4+IGl0
IGNvdWxkIG1hcCBpdCB0byBhIGh1Z2UgcHVkIG1heSB1bmV4cGVjdGVkbHkgY29uc3VtZSBhbmQg
cG9wdWxhdGUgc29tZSAxNisKPj4gTUIgb2YgcGFnZSB0YWJsZXMuCj4gSWYgdGhlIHVuZGVybHlp
bmcgZGV2aWNlIGJsb2NrIHNpemUgaXMgc28gYmlnIHRoZW4gc3VyZSwgd2h5IG5vdD8gVGhlCj4g
InVuZXhwZWN0ZWRseSIgc2hvdWxkIGJlIHF1aXRlIHJhcmUvbm9uIGV4aXN0YW50IGFueWhvdy4K
Pgo+IEphc29uCj4gICAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
