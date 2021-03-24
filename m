Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA02C347CFB
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 16:50:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD11F6EA36;
	Wed, 24 Mar 2021 15:50:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa2.bahnhof.se (pio-pvt-msa2.bahnhof.se [79.136.2.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A50D6EA36
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 15:50:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 19BC23F4C3;
 Wed, 24 Mar 2021 16:50:10 +0100 (CET)
Authentication-Results: pio-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=P4M4/6D1; 
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
 with ESMTP id Yu7IkG0scZsZ; Wed, 24 Mar 2021 16:50:09 +0100 (CET)
Received: by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 1D9B73F4C0;
 Wed, 24 Mar 2021 16:50:07 +0100 (CET)
Received: from [10.249.254.166] (unknown [192.198.151.44])
 by mail1.shipmail.org (Postfix) with ESMTPSA id BEC513605CC;
 Wed, 24 Mar 2021 16:50:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1616601017; bh=LVYFmsFXj0e1zpHSjkB8DcFvTKZT5BbydC++etvHV1o=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=P4M4/6D1LgeNspLbb2o1Hp54DiW0ZNauP1DTjhNR3h+MUyHSzrWyvMYSi1sIGu+er
 R2R+O2pCd3UrThkwmu/7GYJhshjSIt+My1In3wYMF5pgI/WTEkbOv27oayzhL5GGIv
 ltOwfYUHBp3R1b3g9VhVSeW2Cd+h0VLlXj7AHJ/w=
Subject: Re: [RFC PATCH 1/2] mm,drm/ttm: Block fast GUP to TTM huge pages
To: Jason Gunthorpe <jgg@nvidia.com>
References: <20210321184529.59006-2-thomas_os@shipmail.org>
 <YFnST5VLcEgv9q+s@phenom.ffwll.local>
 <314fc020-d243-dbf0-acb3-ecfcc9c2443c@shipmail.org>
 <20210323163715.GJ2356281@nvidia.com>
 <5824b731-ca6a-92fd-e314-d986b6a7b101@shipmail.org>
 <YFsM23t2niJwhpM/@phenom.ffwll.local> <20210324122430.GW2356281@nvidia.com>
 <e12e2c49-afaf-dbac-b18c-272c93c83e06@shipmail.org>
 <20210324124127.GY2356281@nvidia.com>
 <6c9acb90-8e91-d8af-7abd-e762d9a901aa@shipmail.org>
 <20210324134833.GE2356281@nvidia.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <0b984f96-00fb-5410-bb16-02e12b2cc024@shipmail.org>
Date: Wed, 24 Mar 2021 16:50:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210324134833.GE2356281@nvidia.com>
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
 Christian Koenig <christian.koenig@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDMvMjQvMjEgMjo0OCBQTSwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+IE9uIFdlZCwgTWFy
IDI0LCAyMDIxIGF0IDAyOjM1OjM4UE0gKzAxMDAsIFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCkg
d3JvdGU6Cj4KPj4+IEluIGFuIGlkZWFsIHdvcmxkIHRoZSBjcmVhdGlvbi9kZXN0cnVjdGlvbiBv
ZiBwYWdlIHRhYmxlIGxldmVscyB3b3VsZAo+Pj4gYnkgZHluYW1pYyBhdCB0aGlzIHBvaW50LCBs
aWtlIFRIUC4KPj4gSG1tLCBidXQgSSdtIG5vdCBzdXJlIHdoYXQgcHJvYmxlbSB3ZSdyZSB0cnlp
bmcgdG8gc29sdmUgYnkgY2hhbmdpbmcgdGhlCj4+IGludGVyZmFjZSBpbiB0aGlzIHdheT8KPiBX
ZSBhcmUgdHJ5aW5nIHRvIG1ha2UgYSBzZW5zaWJsZSBkcml2ZXIgQVBJIHRvIGRlYWwgd2l0aCBo
dWdlIHBhZ2VzLgo+ICAgCj4+IEN1cnJlbnRseSBpZiB0aGUgY29yZSB2bSByZXF1ZXN0cyBhIGh1
Z2UgcHVkLCB3ZSBnaXZlIGl0IG9uZSwgYW5kIGlmIHdlCj4+IGNhbid0IG9yIGRvbid0IHdhbnQg
dG8gKGJlY2F1c2Ugb2YgZGlydHktdHJhY2tpbmcsIGZvciBleGFtcGxlLCB3aGljaCBpcwo+PiBh
bHdheXMgZG9uZSBvbiA0SyBwYWdlLWxldmVsKSB3ZSBqdXN0IHJldHVybiBWTV9GQVVMVF9GQUxM
QkFDSywgYW5kIHRoZQo+PiBmYXVsdCBpcyByZXRyaWVkIGF0IGEgbG93ZXIgbGV2ZWwuCj4gV2Vs
bCwgbXkgdGhvdWdodCB3b3VsZCBiZSB0byBtb3ZlIHRoZSBwdGUgcmVsYXRlZCBzdHVmZiBpbnRv
Cj4gdm1mX2luc2VydF9yYW5nZSBpbnN0ZWFkIG9mIHJlY3Vyc2luZyBiYWNrIHZpYSBWTV9GQVVM
VF9GQUxMQkFDSy4KPgo+IEkgZG9uJ3Qga25vdyBpZiB0aGUgbG9ja2luZyB3b3JrcyBvdXQsIGJ1
dCBpdCBmZWVscyBjbGVhbmVyIHRoYXQgdGhlCj4gZHJpdmVyIHRlbGxzIHRoZSB2bWYgaG93IGJp
ZyBhIHBhZ2UgaXQgY2FuIHN0dWZmIGluLCBub3QgdGhlIHZtCj4gdGVsbGluZyB0aGUgZHJpdmVy
IHRvIHN0dWZmIGluIGEgY2VydGFpbiBzaXplIHBhZ2Ugd2hpY2ggaXQgbWlnaHQgbm90Cj4gd2Fu
dCB0byBkby4KPgo+IFNvbWUgZGV2aWNlcyB3YW50IHRvIHdvcmsgb24gYSBpbi1iZXR3ZWVuIHBh
Z2Ugc2l6ZSBsaWtlIDY0ayBzbyB0aGV5Cj4gY2FuJ3QgZm9ybSAyTSBwYWdlcyBidXQgdGhleSBj
YW4gc3R1ZmYgNjRrIG9mIDRLIHBhZ2VzIGluIGEgYmF0Y2ggb24KPiBldmVyeSBmYXVsdC4KCkht
bSwgeWVzLCBidXQgd2Ugd291bGQgaW4gdGhhdCBjYXNlIGJlIGxpbWl0ZWQgYW55d2F5IHRvIGlu
c2VydCByYW5nZXMgCnNtYWxsZXIgdGhhbiBhbmQgZXF1YWwgdG8gdGhlIGZhdWx0IHNpemUgdG8g
YXZvaWQgZXh0ZW5zaXZlIGFuZCBwb3NzaWJseSAKdW5uZWNlc3NhcnkgY2hlY2tzIGZvciBjb250
aWdvdXMgbWVtb3J5LiBBbmQgdGhlbiBpZiB3ZSBjYW4ndCBzdXBwb3J0IAp0aGUgZnVsbCBmYXVs
dCBzaXplLCB3ZSdkIG5lZWQgdG8gZWl0aGVyIHByZXN1bWUgYSBzaXplIGFuZCBhbGlnbm1lbnQg
b2YgCnRoZSBuZXh0IGxldmVsIG9yIHNlYXJjaCBmb3IgY29udGlnb3VzIG1lbW9yeSBpbiBib3Ro
IGRpcmVjdGlvbnMgYXJvdW5kIAp0aGUgZmF1bHQgYWRkcmVzcywgcGVyaGFwcyB1bm5lY2Vzc2Fy
aWx5IGFzIHdlbGwuIEkgZG8gdGhpbmsgdGhlIGN1cnJlbnQgCmludGVyZmFjZSB3b3JrcyBvaywg
YXMgd2UncmUganVzdCBhY3Rpbmcgb24gd2hhdCB0aGUgY29yZSB2bSB0ZWxscyB1cyB0byBkby4K
Ci9UaG9tYXMKCj4KPiBUaGF0IGlkZWEgZG9lc24ndCBmaXQgbmF0dXJhbGx5IGlmIHRoZSBWTSBp
cyBkcml2aW5nIHRoZSBzaXplLgo+Cj4gSmFzb24KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
