Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ADA2347549
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 11:05:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 209F46E9A0;
	Wed, 24 Mar 2021 10:05:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E03A6E9A0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 10:05:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id EFF9F3F3B2;
 Wed, 24 Mar 2021 11:05:44 +0100 (CET)
Authentication-Results: ste-pvt-msa1.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=R6CVz1lG; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uBylAn-1dOM1; Wed, 24 Mar 2021 11:05:43 +0100 (CET)
Received: by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 7CBCD3F496;
 Wed, 24 Mar 2021 11:05:42 +0100 (CET)
Received: from [192.168.0.209] (unknown [192.198.151.43])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 1AA393605CC;
 Wed, 24 Mar 2021 11:05:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1616580342; bh=buvsm/mpmVDWeMogh3TWH4oG8ngAhMEnBYvFmnLpFqA=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=R6CVz1lGUwvmcBG5/P7NEW33eeLoNMuVheHxOWPjYptl1W8DUEHMFsmkyCF/3TIEC
 fbNDH7kQbxC/sOuzyj5g4HaZj5x+iNL3UQ6SW/p3hVGJEdBQR0PTpWiUpfFWqf1M/U
 6L3EXD8z4yyoOuweLsLQfulwKE5AijpvaXq8RqYg=
Subject: Re: [RFC PATCH 1/2] mm,drm/ttm: Block fast GUP to TTM huge pages
To: "Williams, Dan J" <dan.j.williams@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "jgg@nvidia.com" <jgg@nvidia.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>
References: <20210321184529.59006-1-thomas_os@shipmail.org>
 <20210321184529.59006-2-thomas_os@shipmail.org>
 <ec99146c7abc35d16b245816aba3e9d14862e624.camel@intel.com>
 <c2239da2-c514-2c88-c671-918909cdba6b@shipmail.org>
 <YFsNRIUYrwVQanVF@phenom.ffwll.local>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <a1fa7fa2-914b-366d-9902-e5b784e8428c@shipmail.org>
Date: Wed, 24 Mar 2021 11:05:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YFsNRIUYrwVQanVF@phenom.ffwll.local>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDMvMjQvMjEgMTA6NTggQU0sIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gT24gVHVlLCBNYXIg
MjMsIDIwMjEgYXQgMDk6NDI6MThQTSArMDEwMCwgVGhvbWFzIEhlbGxzdHLDtm0gKEludGVsKSB3
cm90ZToKPj4gT24gMy8yMy8yMSA4OjUyIFBNLCBXaWxsaWFtcywgRGFuIEogd3JvdGU6Cj4+PiBP
biBTdW4sIDIwMjEtMDMtMjEgYXQgMTk6NDUgKzAxMDAsIFRob21hcyBIZWxsc3Ryw7ZtIChJbnRl
bCkgd3JvdGU6Cj4+Pj4gVFRNIHNldHMgdXAgaHVnZSBwYWdlLXRhYmxlLWVudHJpZXMgYm90aCB0
byBzeXN0ZW0tIGFuZCBkZXZpY2UKPj4+PiBtZW1vcnksCj4+Pj4gYW5kIHdlIGRvbid0IHdhbnQg
Z3VwIHRvIGFzc3VtZSB0aGVyZSBhcmUgYWx3YXlzIHZhbGlkIGJhY2tpbmcgc3RydWN0Cj4+Pj4g
cGFnZXMgZm9yIHRoZXNlLiBGb3IgUFRFcyB0aGlzIGlzIGhhbmRsZWQgYnkgc2V0dGluZyB0aGUg
cHRlX3NwZWNpYWwKPj4+PiBiaXQsCj4+Pj4gYnV0IGZvciB0aGUgaHVnZSBQVURzIGFuZCBQTURz
LCB3ZSBoYXZlIG5laXRoZXIgcG1kX3NwZWNpYWwgbm9yCj4+Pj4gcHVkX3NwZWNpYWwuIE5vcm1h
bGx5LCBodWdlIFRUTSBlbnRyaWVzIGFyZSBpZGVudGlmaWVkIGJ5IGxvb2tpbmcgYXQKPj4+PiB2
bWFfaXNfc3BlY2lhbF9odWdlKCksIGJ1dCBmYXN0IGd1cCBjYW4ndCBkbyB0aGF0LCBzbyBhcyBh
bgo+Pj4+IGFsdGVybmF0aXZlCj4+Pj4gZGVmaW5lIF9kZXZtYXAgZW50cmllcyBmb3Igd2hpY2gg
dGhlcmUgYXJlIG5vIGJhY2tpbmcgZGV2X3BhZ2VtYXAgYXMKPj4+PiBzcGVjaWFsLCB1cGRhdGUg
ZG9jdW1lbnRhdGlvbiBhbmQgbWFrZSBodWdlIFRUTSBlbnRyaWVzIF9kZXZtYXAsCj4+Pj4gYWZ0
ZXIKPj4+PiB2ZXJpZnlpbmcgdGhhdCB0aGVyZSBpcyBubyBiYWNraW5nIGRldl9wYWdlbWFwLgo+
Pj4gUGxlYXNlIGRvIG5vdCBhYnVzZSBwe20sdX1kX2Rldm1hcCBsaWtlIHRoaXMuIEknbSBpbiB0
aGUgcHJvY2VzcyBvZgo+Pj4gcmVtb3ZpbmcgZ2V0X2RldnBhZ2VtYXAoKSBmcm9tIHRoZSBndXAt
ZmFzdCBwYXRoIFsxXS4gSW5zdGVhZCB0aGVyZQo+Pj4gc2hvdWxkIGJlIHNwYWNlIGZvciBwe20s
dX1kX3NwZWNpYWwgaW4gdGhlIHBhZ2UgdGFibGUgZW50cmllcyAoYXQgbGVhc3QKPj4+IGZvciB4
ODYtNjQpLiBTbyB0aGUgZml4IGlzIHRvIHJlbW92ZSB0aGF0IG9sZCBhc3N1bXB0aW9uIHRoYXQg
aHVnZQo+Pj4gcGFnZXMgY2FuIG5ldmVyIGJlIHNwZWNpYWwuCj4+Pgo+Pj4gWzFdOgo+Pj4gaHR0
cDovL2xvcmUua2VybmVsLm9yZy9yLzE2MTYwNDA1MDg2Ni4xNDYzNzQyLjc3NTk1MjE1MTAzODM1
NTEwNTUuc3RnaXRAZHdpbGxpYTItZGVzazMuYW1yLmNvcnAuaW50ZWwuY29tCj4+Pgo+PiBIbW0s
IHllcyB3aXRoIHRoYXQgcGF0Y2ggaXQgd2lsbCBvYnZpb3VzbHkgbm90IHdvcmsgYXMgaW50ZW5k
ZWQuCj4+Cj4+IEdpdmVuIHRoYXQsIEkgdGhpbmsgd2UnbGwgbmVlZCB0byBkaXNhYmxlIHRoZSBU
VE0gaHVnZSBwYWdlcyBmb3Igbm93IHVudGlsCj4+IHdlIGNhbiBzb3J0IG91dCBhbmQgYWdyZWUg
b24gdXNpbmcgYSBwYWdlIHRhYmxlIGVudHJ5IGJpdC4KPiBZZWFoIDotLwo+Cj4gSSB0aGluayBn
b2luZyBmdWxsIHB1ZC9wbWRfbWtzcGVjaWFsIHNob3VsZCB0aGVuIGFsc28gbWVzaCB3ZWxsIHdp
dGgKPiBKYXNvbidzIHJlcXVlc3QgdG8gd3JhcCBpdCBhbGwgdXAgaW50byBhIHZtZl9pbnNlcnRf
KiBoZWxwZXIsIHNvIGF0IGxlYXN0Cj4gaXQgd291bGQgYWxsIGxvb2sgcmF0aGVyIHByZXR0eSBp
biB0aGUgZW5kLgoKWWVzLCBJIGFncmVlLiBTZWVtcyBsaWtlIHRoZSBzcGVjaWFsIChTVzEpIGlz
IGF2YWlsYWJsZSBhbHNvIGZvciBodWdlIApwYWdlIHRhYmxlIGVudHJpZXMgb24geDg2IEFGQUlD
VCwgYWx0aG91Z2gganVzdCBub3QgaW1wbGVtZW50ZWQuIApPdGhlcndpc2UgdGhlIFNXIGJpdHMg
YXBwZWFyIGNvbXBsZXRlbHkgdXNlZCB1cC4KClRoZSBQVEUgc2l6ZSB2bWZfaW5zZXJ0X3Bmbl9f
eHh4IGZ1bmN0aW9ucyBlaXRoZXIgaW5zZXJ0IG9uZSBvZiBkZXZtYXAgCm9yIHNwZWNpYWwuwqAg
SSB0aGluayB0aGUgb25seSB1c2VycyBvZiB0aGUgaHVnZSBpbnNlcnQgZnVuY3Rpb25zIGFwYXJ0
IApmb3JtIFRUTSBjdXJyZW50bHkgaW5zZXJ0IGRldm1hcCBzbyB3ZSBzaG91bGQgcHJvYmFibHkg
YmUgYWJsZSB0byBkbyB0aGUgCnNhbWUsIGFuZCB0aGVuIERSTSAvIFRUTSB3b3VsZG4ndCBuZWVk
IHRvIGNhcmUgYXQgYWxsIGFib3V0IHNwZWNpYWwgb3Igbm90LgoKL1Rob21hcwoKCgo+IC1EYW5p
ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
