Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CC8B133F
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 19:08:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4641D6EDD9;
	Thu, 12 Sep 2019 17:08:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB9FC6EDD7;
 Thu, 12 Sep 2019 17:08:32 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d7a7b940001>; Thu, 12 Sep 2019 10:08:36 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 12 Sep 2019 10:08:31 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 12 Sep 2019 10:08:31 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 12 Sep
 2019 17:08:31 +0000
Received: from rcampbell-dev.nvidia.com (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 12 Sep 2019 17:08:29 +0000
Subject: Re: [PATCH 2/4] mm/hmm: allow snapshot of the special zero page
To: Christoph Hellwig <hch@lst.de>
References: <20190911222829.28874-1-rcampbell@nvidia.com>
 <20190911222829.28874-3-rcampbell@nvidia.com> <20190912082648.GB14368@lst.de>
X-Nvconfidentiality: public
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <6b124c6d-0fac-2a34-0542-7516de939b9e@nvidia.com>
Date: Thu, 12 Sep 2019 10:08:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190912082648.GB14368@lst.de>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1568308116; bh=+GKH1AipM7oG/s2bgF7S7KajVnJGTKEgPflQKyI5DSM=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=NCPYwAbJfj+jlzLC4k7UA+8/QOE9h0v6qDvzE/V1RnbUxex1B9SEAY36Efl5u+3ZO
 zvZ51eidxCdXZ8HFCWMCw5hGNa/lMPoiNFy6j4+wo/LscvqWd28kSyWnS9/xCu5bu/
 jF21AcFwtWR6yW5/o4oHKOVT9hVbzCALReGwp4U0JeF9BnD5rGRF+bURQvnTnBf//7
 lCdky8a8sTXbWPLyS5Wjzz1rNTZXp6xGu/k+nvAHrd2GO1cvnh91cCbK3/0ajr8c/A
 tjaFNJZ2graB7u7BnkySgeqpV77zRY2GPSHJkizUsXRqwsDz5aOvedaOvDPbx2Grvp
 +ZGSkOgtPseUA==
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, amd-gfx@lists.freedesktop.org,
 Andrew Morton <akpm@linux-foundation.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDkvMTIvMTkgMToyNiBBTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gT24gV2VkLCBT
ZXAgMTEsIDIwMTkgYXQgMDM6Mjg6MjdQTSAtMDcwMCwgUmFscGggQ2FtcGJlbGwgd3JvdGU6Cj4+
IEFsbG93IGhtbV9yYW5nZV9mYXVsdCgpIHRvIHJldHVybiBzdWNjZXNzICgwKSB3aGVuIHRoZSBD
UFUgcGFnZXRhYmxlCj4+IGVudHJ5IHBvaW50cyB0byB0aGUgc3BlY2lhbCBzaGFyZWQgemVybyBw
YWdlLgo+PiBUaGUgY2FsbGVyIGNhbiB0aGVuIGhhbmRsZSB0aGUgemVybyBwYWdlIGJ5IHBvc3Np
Ymx5IGNsZWFyaW5nIGRldmljZQo+PiBwcml2YXRlIG1lbW9yeSBpbnN0ZWFkIG9mIERNQWluZyBh
IHplcm8gcGFnZS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogUmFscGggQ2FtcGJlbGwgPHJjYW1wYmVs
bEBudmlkaWEuY29tPgo+PiBDYzogIkrDqXLDtG1lIEdsaXNzZSIgPGpnbGlzc2VAcmVkaGF0LmNv
bT4KPj4gQ2M6IEphc29uIEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4KPj4gQ2M6IENocmlz
dG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+PiAtLS0KPj4gICBtbS9obW0uYyB8IDIgKy0KPj4g
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlm
ZiAtLWdpdCBhL21tL2htbS5jIGIvbW0vaG1tLmMKPj4gaW5kZXggMDYwNDFkNDM5OWZmLi43MjE3
OTEyYmVmMTMgMTAwNjQ0Cj4+IC0tLSBhL21tL2htbS5jCj4+ICsrKyBiL21tL2htbS5jCj4+IEBA
IC01MzIsNyArNTMyLDcgQEAgc3RhdGljIGludCBobW1fdm1hX2hhbmRsZV9wdGUoc3RydWN0IG1t
X3dhbGsgKndhbGssIHVuc2lnbmVkIGxvbmcgYWRkciwKPj4gICAJCQlyZXR1cm4gLUVCVVNZOwo+
PiAgIAl9IGVsc2UgaWYgKElTX0VOQUJMRUQoQ09ORklHX0FSQ0hfSEFTX1BURV9TUEVDSUFMKSAm
JiBwdGVfc3BlY2lhbChwdGUpKSB7Cj4+ICAgCQkqcGZuID0gcmFuZ2UtPnZhbHVlc1tITU1fUEZO
X1NQRUNJQUxdOwo+PiAtCQlyZXR1cm4gLUVGQVVMVDsKPj4gKwkJcmV0dXJuIGlzX3plcm9fcGZu
KHB0ZV9wZm4ocHRlKSkgPyAwIDogLUVGQVVMVDsKPiAKPiBBbnkgY2hhbmNlIHRvIGp1c3QgdXNl
IGEgbm9ybWFsIGlmIGhlcmU6Cj4gCj4gCQlpZiAoIWlzX3plcm9fcGZuKHB0ZV9wZm4ocHRlKSkp
Cj4gCQkJcmV0dXJuIC1FRkFVTFQ7Cj4gCQlyZXR1cm4gMDsKPiAKClN1cmUsIG5vIHByb2JsZW0u
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
