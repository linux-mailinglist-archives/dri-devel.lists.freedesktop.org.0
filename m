Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 965319D5BC
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 20:21:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E214D6E296;
	Mon, 26 Aug 2019 18:21:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE19B6E293;
 Mon, 26 Aug 2019 18:21:53 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d6423430000>; Mon, 26 Aug 2019 11:21:55 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Mon, 26 Aug 2019 11:21:53 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Mon, 26 Aug 2019 11:21:53 -0700
Received: from rcampbell-dev.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 26 Aug
 2019 18:21:49 +0000
Subject: Re: [PATCH 1/2] mm/hmm: hmm_range_fault() NULL pointer bug
To: Jason Gunthorpe <jgg@mellanox.com>
References: <20190823221753.2514-1-rcampbell@nvidia.com>
 <20190823221753.2514-2-rcampbell@nvidia.com> <20190824223754.GA21891@lst.de>
 <e2ecc1a7-0d2f-5957-e6cb-b3c86c085d80@nvidia.com>
 <20190826180937.GI27031@mellanox.com>
From: Ralph Campbell <rcampbell@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <9351886a-34b4-4d6f-95b0-d25007a38e61@nvidia.com>
Date: Mon, 26 Aug 2019 11:21:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190826180937.GI27031@mellanox.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1566843715; bh=SGzNXU9OUMJ4sxgAgwF2vBiAW3WFDK29f9kkvuUtX/U=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=iRJskzvc2xmRxSFweduukFPXuLO46IayfypAROJ04qHuHouqTkdxRWJBjEvfWz26t
 nH11/K1bIcpCtfQ3PCzTwQ7OjiV89AbFCKVp2GG/u7oavfNQjSfTIN9Ay9sY6QisRX
 Lw8C5CzNnDbqQDuqVHy8esNTkALJED132k9sS3BGQHah1iO+M08Lear0RteTgH3Plb
 +ypJuyFZ7wu0/IIAGodcN57KhvsrhSSHhMSpq1VtFDlL1oWxG7Yp0WVpo+rUHAmyWi
 mHRx0pP0zK6O9mcrC5LbmewxrhxFYmw5xcF/RjJ6Svoenp5d4wFxOGfjSn8PYeN7b2
 yZgNdr/Pbptmw==
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
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDgvMjYvMTkgMTE6MDkgQU0sIEphc29uIEd1bnRob3JwZSB3cm90ZToKPiBPbiBNb24sIEF1
ZyAyNiwgMjAxOSBhdCAxMTowMjoxMkFNIC0wNzAwLCBSYWxwaCBDYW1wYmVsbCB3cm90ZToKPj4K
Pj4gT24gOC8yNC8xOSAzOjM3IFBNLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPj4+IE9uIEZy
aSwgQXVnIDIzLCAyMDE5IGF0IDAzOjE3OjUyUE0gLTA3MDAsIFJhbHBoIENhbXBiZWxsIHdyb3Rl
Ogo+Pj4+IEFsdGhvdWdoIGhtbV9yYW5nZV9mYXVsdCgpIGNhbGxzIGZpbmRfdm1hKCkgdG8gbWFr
ZSBzdXJlIHRoYXQgYSB2bWEgZXhpc3RzCj4+Pj4gYmVmb3JlIGNhbGxpbmcgd2Fsa19wYWdlX3Jh
bmdlKCksIGhtbV92bWFfd2Fsa19ob2xlKCkgY2FuIHN0aWxsIGJlIGNhbGxlZAo+Pj4+IHdpdGgg
d2Fsay0+dm1hID09IE5VTEwgaWYgdGhlIHN0YXJ0IGFuZCBlbmQgYWRkcmVzcyBhcmUgbm90IGNv
bnRhaW5lZAo+Pj4+IHdpdGhpbiB0aGUgdm1hIHJhbmdlLgo+Pj4KPj4+IFNob3VsZCB3ZSBjb252
ZXJ0IHRvIHdhbGtfdm1hX3JhbmdlIGluc3RlYWQ/ICBPciBrZWVwIHdhbGtfcGFnZV9yYW5nZQo+
Pj4gYnV0IGRyb3Agc2VhcmNoaW5nIHRoZSB2bWEgb3Vyc2VsdmVzPwo+Pj4KPj4+IEV4Y2VwdCBm
b3IgdGhhdCB0aGUgcGF0Y2ggbG9va3MgZ29vZCB0byBtZToKPj4+Cj4+PiBSZXZpZXdlZC1ieTog
Q2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4+Pgo+Pgo+PiBJIHRoaW5rIGtlZXBpbmcg
dGhlIGNhbGwgdG8gd2Fsa19wYWdlX3JhbmdlKCkgbWFrZXMgc2Vuc2UuCj4+IEphc29uIGlzIGhv
cGluZyB0byBiZSBhYmxlIHRvIHNuYXBzaG90IGEgcmFuZ2Ugd2l0aCAmIHdpdGhvdXQgdm1hcwo+
PiBhbmQgaGF2ZSB0aGUgcGZuc1tdIGZpbGxlZCB3aXRoIGVtcHR5L3ZhbGlkIGVudHJpZXMgYXMg
YXBwcm9wcmlhdGUuCj4+Cj4+IEkgcGxhbiB0byByZXBvc3QgbXkgcGF0Y2ggY2hhbmdpbmcgaG1t
X3JhbmdlX2ZhdWx0KCkgdG8gdXNlCj4+IHdhbGsudGVzdF93YWxrIHdoaWNoIHdpbGwgcmVtb3Zl
IHRoZSBjYWxsIHRvIGZpbmRfdm1hKCkuCj4+IEphc29uIGhhZCBzb21lIGNvbmNlcm5zIGFib3V0
IHRlc3RpbmcgaXQgc28gdGhhdCdzIHdoeSBJIGhhdmUKPj4gYmVlbiB3b3JraW5nIG9uIHNvbWUg
SE1NIHNlbGYgdGVzdHMgYmVmb3JlIHJlc2VuZGluZyBpdC4KPiAKPiBJJ20gcmVhbGx5IGV4Y2l0
ZWQgdG8gc2VlIHRlc3RzIGZvciBobW1fcmFuZ2VfZmF1bHQoKSEKPiAKPiBEaWQgeW91IGZpbmQg
dGhpcyBidWcgd2l0aCB0aGUgdGVzdHM/Pwo+IAo+IEphc29uCj4gCgpZZXMsIEkgZm91bmQgYm90
aCBidWdzIHdpdGggdGhlIHRlc3RzLgpJIHN0YXJ0ZWQgd2l0aCBKZXJvbWUncyBobW1fZHVtbXkg
ZHJpdmVyIGFuZCB1c2VyIGxldmVsIHRlc3QgY29kZS4KSG9wZWZ1bGx5IEkgY2FuIHNlbmQgaXQg
b3V0IHRoaXMgd2Vlay4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
