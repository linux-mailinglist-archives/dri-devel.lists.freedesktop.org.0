Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E7B7129E
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 09:16:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1B346E143;
	Tue, 23 Jul 2019 07:16:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 663B389D2E
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 16:29:16 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1B8C428;
 Mon, 22 Jul 2019 09:29:16 -0700 (PDT)
Received: from [10.1.196.133] (e112269-lin.cambridge.arm.com [10.1.196.133])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 48E213F694;
 Mon, 22 Jul 2019 09:29:15 -0700 (PDT)
Subject: Re: [PATCH 3/5] drm/panfrost: Add a no execute flag for BO allocations
To: Rob Herring <robh@kernel.org>, Robin Murphy <robin.murphy@arm.com>
References: <20190717183352.22519-1-robh@kernel.org>
 <20190717183352.22519-3-robh@kernel.org>
 <ecde43d2-45cc-d00a-9635-cb56a67263d4@arm.com>
 <CAL_JsqLfnMwibCMU8_PqqYj0C895wuW9DNPirFo-LRChxJA-fA@mail.gmail.com>
 <896cada5-580a-7637-2884-f0c616314ea4@arm.com>
 <CAL_Jsq+ygY64WP6GP2LB4WRt2_BCXMMWxQSyhazY=jWfCyOkLg@mail.gmail.com>
 <4b7fc0b4-aa5b-06ba-ad4a-5b959e265e67@arm.com>
 <d52430aa-972e-f730-ee5a-44137f87e066@arm.com>
 <0bf616f7-023a-e1e3-dbf6-9a98155f6bf9@arm.com>
 <07a47ad9-cda9-b8dc-8bab-e9f065ae7229@arm.com>
 <76670d13-0292-1fa1-9e20-f193c01c14c6@arm.com>
 <CAL_JsqK0KtyAdm9gVPoY8O9+5P5kAq-Cf2UwNGFqwdOddFRKyg@mail.gmail.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <42463f2b-ab39-e2f2-3d51-5c0ed365af6a@arm.com>
Date: Mon, 22 Jul 2019 17:29:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqK0KtyAdm9gVPoY8O9+5P5kAq-Cf2UwNGFqwdOddFRKyg@mail.gmail.com>
Content-Language: en-GB
X-Mailman-Approved-At: Tue, 23 Jul 2019 07:14:10 +0000
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjIvMDcvMjAxOSAxNzoxOCwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gT24gTW9uLCBKdWwgMjIs
IDIwMTkgYXQgNzoyNSBBTSBSb2JpbiBNdXJwaHkgPHJvYmluLm11cnBoeUBhcm0uY29tPiB3cm90
ZToKPj4KPj4gT24gMjIvMDcvMjAxOSAxMzoxOSwgU3RldmVuIFByaWNlIHdyb3RlOgo+PiBbLi4u
XQo+Pj4gSW5kZWVkLCB0aGF0IGNhc2Ugd2FzIGp1c3Qgb2NjdXJyaW5nIHRvIG1lIHRvbyEgSG93
IGFib3V0Ogo+Pj4KPj4+ICAgICAgIHU2NCBuZXh0X3NlZyA9IEFMSUdOKCpzdGFydCwgUEZOXzRH
KTsKPj4+Cj4+PiAgICAgICBpZiAobmV4dF9zZWcgLSAqc3RhcnQgPD0gUEZOXzE2TSkKPj4+ICAg
ICAgICAgICAgICAgKnN0YXJ0ID0gbmV4dF9zZWcgKyAxOwo+IAo+IFRoaXMgY291bGQgbWFrZSBz
dGFydCA+IGVuZC4uLgoKQnV0IG9ubHkgaW4gdGhlIGNhc2Ugd2hlcmUgKCplbmQgLSAqc3RhcnQg
PCAxNk1CKSAtIGkuZS4gdGhpcyByZWdpb24Kd2Fzbid0IGJpZyBlbm91Z2guIFRoZSBnZW5lcmlj
IGNvZGUgd2lsbCBkZWFsIHdpdGggdGhhdCBhbmQgcmVqZWN0IHRoZSBob2xlLgoKPiBJdCBhbHNv
IGRvZXNuJ3QgaGFuZGxlIG5vdCBzdGFydGluZyBvbiBhIDRHIGJvdW5kYXJ5IChvciB3YXMgdGhh
dAo+IGNvbmRpdGlvbiBjaGVjayBzdXBwb3NlZCB0byBiZSBpbmNsdWRlZCBzdGlsbCkuCgpJIHdh
cyBhc3N1bWluZyB3ZSBzdGlsbCBoYWQgdGhpcyBiZWZvcmUgdGhhdCBjb2RlOgoKCWlmICgoKnN0
YXJ0ICYgUEZOXzRHX01BU0spID09IDApCgkJKCpzdGFydCkrKzsKCglpZiAoKCplbmQgJiBQRk5f
NEdfTUFTSykgPT0gMCkKCQkoKmVuZCktLTsKCkFuZCB3aGVuIGJ1bXBpbmcgKnN0YXJ0IHRvIG5l
eHRfc2VnLCB0aGVyZSdzIGEgKzEgdG8gZGVhbCB3aXRoIHRoZSA0R0IKYm91bmRhcnkgY2FzZS4K
ClN0ZXZlCgo+Pj4KPj4+ICAgICAgICplbmQgPSBtaW4oKmVuZCwgQUxJR04oKnN0YXJ0LCBQRk5f
NEcpIC0gMSk7Cj4+Pgo+Pj4gU28gYWx3YXlzIGFsbG9jYXRlIGF0IHRoZSBiZWdpbm5pbmcsIGJ1
dCBza2lwIHBhc3QgdGhlIG5leHQgNEdCIGJvdW5kYXJ5Cj4+PiBpZiB0aGVyZSdzIGxlc3MgdGhh
biAxNk1CIGxlZnQgKG9yIGVxdWFsIHRvIGF2b2lkIHRoZSA0R0IgYm91bmRhcnkpLgo+Pgo+PiBB
aCwgdGhlcmUgaXQgaXMhIEkgdGhpbmsgaXQgZ2VuZXJhbGlzZXMgZXZlbiBmdXJ0aGVyIGJ5IGp1
c3QgY2hhbmdpbmcKPj4gdGhlIGNvbmRpdGlvbiB0byAiaWYgKG5leHRfc2VnIC0gKnN0YXJ0IDwg
KmVuZCAtIG5leHRfc2VnKSIsIGFsdGhvdWdoCj4+IHdlJ2QgbmVlZCB0byBlbnN1cmUgYSBzaWdu
ZWQgY29tcGFyaXNvbiB0byBjb3ZlciB0aGUgY2FzZSB3aGVyZSBzdGFydAo+PiBhbmQgZW5kIGFy
ZSBhbHJlYWR5IGluIHRoZSBzYW1lIHNlZ21lbnQuCj4gCj4gSU1PLCByZWx5aW5nIG9uIHNpZ25l
ZCBjb21wYXJzaW9uIGRvZXNuJ3QgcmVhbGx5IGltcHJvdmUgdGhlIHJlYWRhYmlsaXR5Li4uCj4g
Cj4gUm9iCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
PiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
