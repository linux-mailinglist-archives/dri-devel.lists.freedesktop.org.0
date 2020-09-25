Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA1127874B
	for <lists+dri-devel@lfdr.de>; Fri, 25 Sep 2020 14:33:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CA636ECCF;
	Fri, 25 Sep 2020 12:33:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1876A6ECCD;
 Fri, 25 Sep 2020 12:33:20 +0000 (UTC)
IronPort-SDR: t5gSjt+5P6NC6JA8gMtmmaiiLGePEnE3WF9pQ17f3o2CWnW2MdvGAzljAH/fVFZfw166/wB2Bu
 5OVZhbGzdRaw==
X-IronPort-AV: E=McAfee;i="6000,8403,9754"; a="158903034"
X-IronPort-AV: E=Sophos;i="5.77,302,1596524400"; d="scan'208";a="158903034"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2020 05:33:19 -0700
IronPort-SDR: hAAv+KjG+5EErAYnMJaScqJ3YYAs2Mc/2dUArWSDmx65J8EzpBWhcriotwbsqsU6JaoLkiPuAa
 UlmbgTVp8fFA==
X-IronPort-AV: E=Sophos;i="5.77,302,1596524400"; d="scan'208";a="455809154"
Received: from mlevy2-mobl.ger.corp.intel.com (HELO [10.251.176.131])
 ([10.251.176.131])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2020 05:33:15 -0700
Subject: Re: [Intel-gfx] [PATCH rdma-next v3 1/2] lib/scatterlist: Add support
 in dynamic allocation of SG table from pages
To: Maor Gottlieb <maorg@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Leon Romanovsky <leon@kernel.org>
References: <20200922083958.2150803-1-leon@kernel.org>
 <20200922083958.2150803-2-leon@kernel.org>
 <118a03ef-d160-e202-81cc-16c9c39359fc@linux.intel.com>
 <20200925071330.GA2280698@unreal> <20200925115544.GY9475@nvidia.com>
 <65ca566b-7a5e-620f-13a4-c59eb836345a@nvidia.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <33942b10-8eef-9180-44c5-b7379b92b824@linux.intel.com>
Date: Fri, 25 Sep 2020 13:33:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <65ca566b-7a5e-620f-13a4-c59eb836345a@nvidia.com>
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
Cc: linux-rdma@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Roland Scheidegger <sroland@vmware.com>, dri-devel@lists.freedesktop.org,
 Maor Gottlieb <maorg@mellanox.com>, David Airlie <airlied@linux.ie>,
 Doug Ledford <dledford@redhat.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Christoph Hellwig <hch@lst.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDI1LzA5LzIwMjAgMTM6MTgsIE1hb3IgR290dGxpZWIgd3JvdGU6Cj4gT24gOS8yNS8yMDIw
IDI6NTUgUE0sIEphc29uIEd1bnRob3JwZSB3cm90ZToKPj4gT24gRnJpLCBTZXAgMjUsIDIwMjAg
YXQgMTA6MTM6MzBBTSArMDMwMCwgTGVvbiBSb21hbm92c2t5IHdyb3RlOgo+Pj4+PiBkaWZmIC0t
Z2l0IGEvdG9vbHMvdGVzdGluZy9zY2F0dGVybGlzdC9tYWluLmMgCj4+Pj4+IGIvdG9vbHMvdGVz
dGluZy9zY2F0dGVybGlzdC9tYWluLmMKPj4+Pj4gaW5kZXggMGExNDY0MTgxMjI2Li40ODk5MzU5
YTMxYWMgMTAwNjQ0Cj4+Pj4+ICsrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2NhdHRlcmxpc3QvbWFpbi5j
Cj4+Pj4+IEBAIC01NSwxNCArNTUsMTMgQEAgaW50IG1haW4odm9pZCkKPj4+Pj4gwqDCoMKgwqDC
oMKgIGZvciAoaSA9IDAsIHRlc3QgPSB0ZXN0czsgdGVzdC0+ZXhwZWN0ZWRfc2VnbWVudHM7IHRl
c3QrKywgCj4+Pj4+IGkrKykgewo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgcGFn
ZSAqcGFnZXNbTUFYX1BBR0VTXTsKPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IHNn
X3RhYmxlIHN0Owo+Pj4+PiAtwqDCoMKgwqDCoMKgwqAgaW50IHJldDsKPj4+Pj4gK8KgwqDCoMKg
wqDCoMKgIHN0cnVjdCBzY2F0dGVybGlzdCAqc2c7Cj4+Pj4+Cj4+Pj4+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHNldF9wYWdlcyhwYWdlcywgdGVzdC0+cGZuLCB0ZXN0LT5udW1fcGFnZXMpOwo+Pj4+
Pgo+Pj4+PiAtwqDCoMKgwqDCoMKgwqAgcmV0ID0gX19zZ19hbGxvY190YWJsZV9mcm9tX3BhZ2Vz
KCZzdCwgcGFnZXMsIAo+Pj4+PiB0ZXN0LT5udW1fcGFnZXMsCj4+Pj4+IC3CoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAwLCB0ZXN0LT5zaXplLCB0ZXN0
LT5tYXhfc2VnLAo+Pj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgR0ZQX0tFUk5FTCk7Cj4+Pj4+IC3CoMKgwqDCoMKgwqDCoCBhc3NlcnQocmV0
ID09IHRlc3QtPmFsbG9jX3JldCk7Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBzZyA9IF9fc2dfYWxs
b2NfdGFibGVfZnJvbV9wYWdlcygmc3QsIHBhZ2VzLCAKPj4+Pj4gdGVzdC0+bnVtX3BhZ2VzLCAw
LAo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHRlc3QtPnNpemUsIHRlc3Qt
Pm1heF9zZWcsIE5VTEwsIDAsIEdGUF9LRVJORUwpOwo+Pj4+PiArwqDCoMKgwqDCoMKgwqAgYXNz
ZXJ0KFBUUl9FUlJfT1JfWkVSTyhzZykgPT0gdGVzdC0+YWxsb2NfcmV0KTsKPj4+PiBTb21lIHRl
c3QgY292ZXJhZ2UgZm9yIHJlbGF0aXZlbHkgY29tcGxleCBjb2RlIHdvdWxkIGJlIHZlcnkgCj4+
Pj4gd2VsY29tZWQuIFNpbmNlCj4+Pj4gdGhlIHRlc3RpbmcgZnJhbWV3b3JrIGlzIGFscmVhZHkg
dGhlcmUsIGV2ZW4gaWYgaXQgYml0LXJvdHRlZCBhIGJpdCwgCj4+Pj4gYnV0Cj4+Pj4gc2hvdWxk
bid0IGJlIGhhcmQgdG8gZml4Lgo+Pj4+Cj4+Pj4gQSBmZXcgdGVzdHMgdG8gY2hlY2sgYXBwZW5k
L2dyb3cgd29ya3MgYXMgZXhwZWN0ZWQsIGluIHRlcm1zIG9mIGhvdyAKPj4+PiB0aGUgZW5kCj4+
Pj4gdGFibGUgbG9va3MgbGlrZSBnaXZlbiB0aGUgaW5pdGlhbCBzdGF0ZSBhbmQgc29tZSBkaWZm
ZXJlbnQgcGFnZSAKPj4+PiBwYXR0ZXJucwo+Pj4+IGFkZGVkIHRvIGl0LiBBbmQgYm90aCBjcm9z
c2luZyBhbmQgbm90IGNyb3NzaW5nIGludG8gc2cgY2hhaW5pbmcgCj4+Pj4gc2NlbmFyaW9zLgo+
Pj4gVGhpcyBmdW5jdGlvbiBpcyBiYXNpYyBmb3IgYWxsIFJETUEgZGV2aWNlcyBhbmQgd2UgYXJl
IHByZXR0eSBjb25maWRlbnQKPj4+IHRoYXQgdGhlIG9sZCBhbmQgbmV3IGZsb3dzIGFyZSB0ZXN0
ZWQgdGhvcm91Z2hseS4KPj4gV2VsbCwgc2luY2UgMC1kYXkgaXMgcmVwb3J0aW5nIHRoYXQgX19p
OTE1X2dlbV91c2VycHRyX2FsbG9jX3BhZ2VzIGlzCj4+IGNyYXNoaW5nIG9uIHRoaXMsIGl0IHBy
b2JhYmx5IGRvZXMgbmVlZCBzb21lIHRlc3RzIDpcCj4+Cj4+IEphc29uCj4gCj4gSXQgaXMgY3Jh
c2hpbmcgaW4gdGhlIHJlZ3VsYXIgb2xkIGZsb3cgd2hpY2ggYWxyZWFkeSB0ZXN0ZWQuCj4gSG93
ZXZlciwgSSB3aWxsIGFkZCBtb3JlIHRlc3RzLgoKRG8geW91IHdhbnQgdG8gdGFrZSBzb21lIG9m
IHRoZSBjb21taXRzIGZyb20gCmdpdDovL3Blb3BsZS5mcmVlZGVza3RvcC5vcmcvfnR1cnN1bGlu
L2RybS1pbnRlbCBzZ3Rlc3Q/IEl0IHdvdWxkIGJlIApmaW5lIGJ5IG1lLiBJIGNhbiBjbGVhbiB1
cCB0aGUgY29tbWl0IG1lc3NhZ2VzIGlmIHlvdSB3YW50LgoKaHR0cHM6Ly9jZ2l0LmZyZWVkZXNr
dG9wLm9yZy9+dHVyc3VsaW4vZHJtLWludGVsL2NvbW1pdC8/aD1zZ3Rlc3QmaWQ9NzkxMDJmNGQ3
OTVjNDc2OTQzMWZjNDRhNmNmN2VkNWM1YjFiNTIxNCAKLSB0aGlzIG9uZSB1bmRvZXMgdGhlIGJp
dCByb3QgYW5kIG1ha2VzIHRoZSB0ZXN0IGp1c3Qgd29yayBvbiB0aGUgCmN1cnJlbnQga2VybmVs
LgoKaHR0cHM6Ly9jZ2l0LmZyZWVkZXNrdG9wLm9yZy9+dHVyc3VsaW4vZHJtLWludGVsL2NvbW1p
dC8/aD1zZ3Rlc3QmaWQ9YjA5YmZlODA0ODZjNGQ5M2VlMWQ4YWUxN2Q1YjQ2Mzk3YjFjNmVlMSAK
LSB0aGlzIG9uZSB5b3UgcHJvYmFibHkgc2hvdWxkIHNxdWFzaCBpbiB5b3VyIHBhdGNoLiBNaW51
cyB0aGUgemVyb2luZyAKb2Ygc3RydWN0IHNnX3N0YWJsZSBzaW5jZSB0aGF0IHdvdWxkIGhpZGUg
dGhlIGlzc3VlLgoKaHR0cHM6Ly9jZ2l0LmZyZWVkZXNrdG9wLm9yZy9+dHVyc3VsaW4vZHJtLWlu
dGVsL2NvbW1pdC8/aD1zZ3Rlc3QmaWQ9OTdmNWRmMzdlNjEyZjc5OGNlZDkwNTQxZWVjZTEzZTJl
ZjYzOTE4MSAKLSBmaW5hbCBjb21taXQgaXMgb3B0aW9uYWwgYnV0IEkgZ3Vlc3MgaGFuZHkgZm9y
IGRlYnVnZ2luZy4KClJlZ2FyZHMsCgpUdnJ0a28KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
