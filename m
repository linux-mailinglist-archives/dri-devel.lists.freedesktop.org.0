Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A5CB135B
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 19:17:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 290A06EDD7;
	Thu, 12 Sep 2019 17:16:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 102786EDD7;
 Thu, 12 Sep 2019 17:16:58 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d7a7d8d0000>; Thu, 12 Sep 2019 10:17:01 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 12 Sep 2019 10:16:57 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 12 Sep 2019 10:16:57 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 12 Sep
 2019 17:16:57 +0000
Received: from rcampbell-dev.nvidia.com (172.20.13.39) by
 DRHQMAIL107.nvidia.com (10.27.9.16) with Microsoft SMTP Server (TLS) id
 15.0.1473.3; Thu, 12 Sep 2019 17:16:51 +0000
Subject: Re: [PATCH 1/4] mm/hmm: make full use of walk_page_range()
To: Christoph Hellwig <hch@lst.de>
References: <20190911222829.28874-1-rcampbell@nvidia.com>
 <20190911222829.28874-2-rcampbell@nvidia.com> <20190912082613.GA14368@lst.de>
X-Nvconfidentiality: public
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <973b7159-513f-0776-668d-8ba1adf87f1c@nvidia.com>
Date: Thu, 12 Sep 2019 10:16:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190912082613.GA14368@lst.de>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1568308621; bh=0I/msTXMK3oeVIVr50/e/aSOEcjBKVeKIFb7hH02Hio=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=kRrrpximNrle4ueUTW3i6O9Mb0HqYE3SBDqBD8uvc6Pk1mWY4I5cAXt9LeMFFnbUQ
 rPbvrrX80AI7hACgTF3cHGGmoLyY1fF8xdUTnIpP57+U+5o/qmkuje1REYgxux/tHo
 epw+5Jl8KJNz5hkr0Slxr8vkyWnuGEIaql8P7F2UXYkothY48LnIZ30eP/FQjOB6pB
 gAObbpf2n5+xP6fIRhEHSJ7RZnSaexO5cHoQ8IIegdQ59WsiLu29hkDVFSJQTAzeIv
 fw996tl3wwsXISYoWQd9OcLICHrROIYQbJsIdSGB0yVRwkRzQcW03EG0Zg+rQLB2ol
 UxoOO/UNTLxSQ==
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

Ck9uIDkvMTIvMTkgMToyNiBBTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4+ICtzdGF0aWMg
aW50IGhtbV9wZm5zX2ZpbGwodW5zaWduZWQgbG9uZyBhZGRyLAo+PiArCQkJIHVuc2lnbmVkIGxv
bmcgZW5kLAo+PiArCQkJIHN0cnVjdCBobW1fcmFuZ2UgKnJhbmdlLAo+PiArCQkJIGVudW0gaG1t
X3Bmbl92YWx1ZV9lIHZhbHVlKQo+IAo+IE5pdDogY2FuIHdlIHVzZSB0aGUgc3BhY2UgYSBsaXR0
bGUgbW9yZSBlZmZpY2llbnQsIGUuZy46Cj4gCj4gc3RhdGljIGludCBobW1fcGZuc19maWxsKHVu
c2lnbmVkIGxvbmcgYWRkciwgdW5zaWduZWQgbG9uZyBlbmQsCj4gCQlzdHJ1Y3QgaG1tX3Jhbmdl
ICpyYW5nZSwgZW51bSBobW1fcGZuX3ZhbHVlX2UgdmFsdWUpCj4gCj4+ICtzdGF0aWMgaW50IGht
bV92bWFfd2Fsa190ZXN0KHVuc2lnbmVkIGxvbmcgc3RhcnQsCj4+ICsJCQkgICAgIHVuc2lnbmVk
IGxvbmcgZW5kLAo+PiArCQkJICAgICBzdHJ1Y3QgbW1fd2FsayAqd2FsaykKPiAKPiBTYW1lIGhl
cmUuCj4gCj4+ICsJaWYgKCEodm1hLT52bV9mbGFncyAmIFZNX1JFQUQpKSB7Cj4+ICsJCSh2b2lk
KSBobW1fcGZuc19maWxsKHN0YXJ0LCBlbmQsIHJhbmdlLCBITU1fUEZOX05PTkUpOwo+IAo+IFRo
ZXJlIHNob3VsZCBiZSBubyBuZWVkIGZvciB0aGUgdm9pZCBjYXN0IGhlcmUuCj4gCgpPSy4gSSds
bCBwb3N0IGEgdjIgd2l0aCB0aGUgdGhlc2UgY2hhbmdlcy4KVGhhbmtzIGZvciB0aGUgcmV2aWV3
cy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
