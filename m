Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 677E3B69CD
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2019 19:44:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBA996F5DE;
	Wed, 18 Sep 2019 17:44:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa2.bahnhof.se (pio-pvt-msa2.bahnhof.se [79.136.2.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5552E6F5E0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2019 17:44:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 87B663F712;
 Wed, 18 Sep 2019 19:44:09 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bGAvdWARNseX; Wed, 18 Sep 2019 19:44:05 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 8D1B63F3BA;
 Wed, 18 Sep 2019 19:44:03 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id D789636020A;
 Wed, 18 Sep 2019 19:44:02 +0200 (CEST)
Subject: Re: [PATCH 1/7] mm: Add write-protect and clean utilities for address
 space ranges
To: "Kirill A. Shutemov" <kirill@shutemov.name>
References: <20190918125914.38497-1-thomas_os@shipmail.org>
 <20190918125914.38497-2-thomas_os@shipmail.org>
 <20190918144102.jkukmhifmweagmwt@box>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <8b710686-af78-d85a-d8a9-e4d92be4be57@shipmail.org>
Date: Wed, 18 Sep 2019 19:44:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190918144102.jkukmhifmweagmwt@box>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1568828642; bh=GJRbag8de5OLyDKo8HWyVkbRJublreoNXwx3gXTOWdM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=msZ9svm4xkJZX+qV+94dYAuQRk1LlAJIYDeI17uYtpNt8JMLrQwI7n109FFlIW4BG
 fI+HNrYUbUA8iZJ313W6y2HYjGi3Md8g/Exh2KQzd9nyvwFFQbfhgPOnUfeJof6Syx
 IxmSAE+DNQB/TcE07nLEFbjFi7wDUUEDYkeLD7x4=
X-Mailman-Original-Authentication-Results: pio-pvt-msa2.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=msZ9svm4; 
 dkim-atps=neutral
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
Cc: =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Thomas Hellstrom <thellstrom@vmware.com>, Michal Hocko <mhocko@suse.com>,
 Rik van Riel <riel@surriel.com>, pv-drivers@vmware.com,
 Minchan Kim <minchan@kernel.org>, Will Deacon <will.deacon@arm.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Peter Zijlstra <peterz@infradead.org>,
 linux-graphics-maintainer@vmware.com, Matthew Wilcox <willy@infradead.org>,
 Huang Ying <ying.huang@intel.com>, Andrew Morton <akpm@linux-foundation.org>,
 Ralph Campbell <rcampbell@nvidia.com>, Souptick Joarder <jrdr.linux@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOS8xOC8xOSA0OjQxIFBNLCBLaXJpbGwgQS4gU2h1dGVtb3Ygd3JvdGU6Cj4gT24gV2VkLCBT
ZXAgMTgsIDIwMTkgYXQgMDI6NTk6MDhQTSArMDIwMCwgVGhvbWFzIEhlbGxzdHLDtm0gKFZNd2Fy
ZSkgd3JvdGU6Cj4+IEZyb206IFRob21hcyBIZWxsc3Ryb20gPHRoZWxsc3Ryb21Adm13YXJlLmNv
bT4KPj4KPj4gQWRkIHR3byB1dGlsaXRpZXMgdG8gYSkgd3JpdGUtcHJvdGVjdCBhbmQgYikgY2xl
YW4gYWxsIHB0ZXMgcG9pbnRpbmcgaW50bwo+PiBhIHJhbmdlIG9mIGFuIGFkZHJlc3Mgc3BhY2Uu
Cj4+IFRoZSB1dGlsaXRpZXMgYXJlIGludGVuZGVkIHRvIGFpZCBpbiB0cmFja2luZyBkaXJ0eSBw
YWdlcyAoZWl0aGVyCj4+IGRyaXZlci1hbGxvY2F0ZWQgc3lzdGVtIG1lbW9yeSBvciBwY2kgZGV2
aWNlIG1lbW9yeSkuCj4+IFRoZSB3cml0ZS1wcm90ZWN0IHV0aWxpdHkgc2hvdWxkIGJlIHVzZWQg
aW4gY29uanVuY3Rpb24gd2l0aAo+PiBwYWdlX21rd3JpdGUoKSBhbmQgcGZuX21rd3JpdGUoKSB0
byB0cmlnZ2VyIHdyaXRlIHBhZ2UtZmF1bHRzIG9uIHBhZ2UKPj4gYWNjZXNzZXMuIFR5cGljYWxs
eSBvbmUgd291bGQgd2FudCB0byB1c2UgdGhpcyBvbiBzcGFyc2UgYWNjZXNzZXMgaW50bwo+PiBs
YXJnZSBtZW1vcnkgcmVnaW9ucy4gVGhlIGNsZWFuIHV0aWxpdHkgc2hvdWxkIGJlIHVzZWQgdG8g
dXRpbGl6ZQo+PiBoYXJkd2FyZSBkaXJ0eWluZyBmdW5jdGlvbmFsaXR5IGFuZCBhdm9pZCB0aGUg
b3ZlcmhlYWQgb2YgcGFnZS1mYXVsdHMsCj4+IHR5cGljYWxseSBvbiBsYXJnZSBhY2Nlc3NlcyBp
bnRvIHNtYWxsIG1lbW9yeSByZWdpb25zLgo+Pgo+PiBUaGUgYWRkZWQgZmlsZSAiYXNfZGlydHlf
aGVscGVycy5jIiBpcyBpbml0aWFsbHkgbGlzdGVkIGFzIG1haW50YWluZWQgYnkKPj4gVk13YXJl
IHVuZGVyIG91ciBEUk0gZHJpdmVyLiBJZiBzb21lYm9keSB3b3VsZCBsaWtlIGl0IGVsc2V3aGVy
ZSwKPj4gdGhhdCdzIG9mIGNvdXJzZSBubyBwcm9ibGVtLgo+IEFmdGVyIHF1aWNrIGdsYW5jZSwg
aXQgbG9va3MgYSBsb3QgYXMgcm1hcCBjb2RlIGR1cGxpY2F0aW9uLiBXaHkgbm90Cj4gZXh0ZW5k
IHJtYXBfd2FsaygpIGludGVyZmFjZSBpbnN0ZWFkIHRvIGNvdmVyIHJhbmdlIG9mIHBhZ2VzPwoK
VGhlcmUgYXBwZWFycyB0byBleGlzdCBxdWl0ZSBhIGZldyBwYWdldGFibGUgd2Fsa3MgaW4gdGhl
IG1tIGNvZGUuICJUYWtlIAoxIiBvZiB0aGlzIHBhdGNoIHNlcmllcyBtb2RpZmllZCB0aGUgImFw
cGx5X3RvX3BhZ2VfcmFuZ2UiIGludGVyZmFjZSBhbmQgCnVzZWQgdGhhdC4gQnV0IHRoZSBpbnRl
cmZhY2UgbW9kaWZpY2F0aW9uIHdhcyBhY3R1YWxseSB3aGF0IGV2ZW50dWFsbHkgCmNhdXNlZCBM
aW51cyB0byByZWplY3QgdGhlIGNvZGUuIFdoaWxlIGl0IGlzIGVudGlyZWx5IHBvc3NpYmxlIHRv
IGRvIGEgCnByb3BlciBtb2RpZmljYXRpb24gZm9sbG93aW5nIExpbnVzJyBhbmQgQ2hyaXN0b3Bo
J3MgZ3VpZGVsaW5lcywgdGhhdCAKY29kZSBkb2Vzbid0IGFsbG93IGZvciBodWdlIHBhZ2VzIGFu
ZCBwb3B1bGF0ZXMgYWxsIHBhZ2UgdGFibGUgbGV2ZWxzLiAKV2Ugd2lsbCBzb29uIHByb2JhYmx5
IHdhbnQgdG8gc3VwcG9ydCBodWdlIHBhZ2VzIGFuZCBkbyBub3Qgd2FudCB0byAKcG9wdWxhdGUu
IFRoZSBudW1iZXIgb2YgYWx0ZXJlZCBjb2RlLXBhdGhzIGl0c2VsZiBJTU8gbW90aXZhdGVzIHll
dCAKYW5vdGhlciBwYWdldGFibGUgd2FsayBpbXBsZW1lbnRhdGlvbi4KClRoZSB3YWxrIGNvZGUg
Y3VycmVudGx5IHJlc2VtYmxpbmcgdGhlIHByZXNlbnQgcGF0Y2ggdGhlIG1vc3QgaXMgdGhlIAp1
bm1hcF9tYXBwaW5nX3JhbmdlKCkgaW1wbGVtZW50YXRpb24uCgpUaGUgcm1hcF93YWxrKCkgaXMg
bm90IHZlcnkgd2VsbCBzdWl0ZWQgc2luY2UgaXQgb3BlcmF0ZXMgb24gYSBzdHJ1Y3QgCnBhZ2Ug
YW5kIHRoZSBjb2RlIG9mIHRoaXMgcGF0Y2ggaGFzIG5vIG5vdGlvbiBvZiBzdHJ1Y3QgcGFnZXMu
CgpTbyBteSB0aG91Z2h0cyBvbiB0aGlzIGlzIHRoYXQgdGhlIGludGVyZmFjZSBzaG91bGQgaW4g
dGltZSBtb3ZlIHRvd2FyZHMgCnRoZSBjb2RlIGluIG1tL3BhZ2V3YWxrLmMuIElmIHdlIGV2ZW50
dWFsbHkgaGF2ZSBtb3JlIHVzZXJzIG9mIGFuIAphZGRyZXNzLXNwYWNlIHBhZ2V3YWxrIG9yIHdh
bnQgdG8gcmUtaW1wbGVtZW50IHVubWFwX21hcHBpbmdfcmFuZ2UoKSAKdXNpbmcgYSBnZW5lcmlj
IHBhZ2V3YWxrLCB3ZSBzaG91bGQgbW92ZSB0aGUgd2FsayB0byBwYWdld2Fsay5jIGFuZCAKcmV1
c2UgaXRzIHN0cnVjdHVyZXMsIGJ1dCBpbXBsZW1lbnQgc2VwYXJhdGUgY29kZSBmb3IgdGhlIHdh
bGsgc2luY2Ugd2UgCmNhbid0IHNwbGl0IGh1Z2UgcGFnZXMgYW5kIHdlIGNhbid0IHRha2UgdGhl
IG1tYXBfc2VtLiBNZWFud2hpbGUgd2UgCnNob3VsZCBrZWVwIHRoZSBjb2RlIHNlcGFyYXRlIGlu
IGFzX2RpcnR5X2hlbHBlcnMuYwoKPgo+PiBDYzogQW5kcmV3IE1vcnRvbiA8YWtwbUBsaW51eC1m
b3VuZGF0aW9uLm9yZz4KPj4gQ2M6IE1hdHRoZXcgV2lsY294IDx3aWxseUBpbmZyYWRlYWQub3Jn
Pgo+PiBDYzogV2lsbCBEZWFjb24gPHdpbGwuZGVhY29uQGFybS5jb20+Cj4+IENjOiBQZXRlciBa
aWpsc3RyYSA8cGV0ZXJ6QGluZnJhZGVhZC5vcmc+Cj4+IENjOiBSaWsgdmFuIFJpZWwgPHJpZWxA
c3VycmllbC5jb20+Cj4+IENjOiBNaW5jaGFuIEtpbSA8bWluY2hhbkBrZXJuZWwub3JnPgo+PiBD
YzogTWljaGFsIEhvY2tvIDxtaG9ja29Ac3VzZS5jb20+Cj4+IENjOiBIdWFuZyBZaW5nIDx5aW5n
Lmh1YW5nQGludGVsLmNvbT4KPj4gQ2M6IFNvdXB0aWNrIEpvYXJkZXIgPGpyZHIubGludXhAZ21h
aWwuY29tPgo+PiBDYzogIkrDqXLDtG1lIEdsaXNzZSIgPGpnbGlzc2VAcmVkaGF0LmNvbT4KPj4g
Q2M6IGxpbnV4LW1tQGt2YWNrLm9yZwo+PiBDYzogbGludXgta2VybmVsQHZnZXIua2VybmVsLm9y
Zwo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgSGVsbHN0cm9tIDx0aGVsbHN0cm9tQHZtd2Fy
ZS5jb20+Cj4+IFJldmlld2VkLWJ5OiBSYWxwaCBDYW1wYmVsbCA8cmNhbXBiZWxsQG52aWRpYS5j
b20+ICN2MQo+PiAtLS0KPj4gICBNQUlOVEFJTkVSUyAgICAgICAgICAgfCAgIDEgKwo+PiAgIGlu
Y2x1ZGUvbGludXgvbW0uaCAgICB8ICAxMyArLQo+PiAgIG1tL0tjb25maWcgICAgICAgICAgICB8
ICAgMyArCj4+ICAgbW0vTWFrZWZpbGUgICAgICAgICAgIHwgICAxICsKPj4gICBtbS9hc19kaXJ0
eV9oZWxwZXJzLmMgfCAzOTIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrCj4+ICAgNSBmaWxlcyBjaGFuZ2VkLCA0MDkgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQo+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBtbS9hc19kaXJ0eV9oZWxwZXJzLmMKPj4KPj4gZGlm
ZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMKPj4gaW5kZXggYzJkOTc1ZGE1NjFm
Li5iNTk2YzdjZjRhODUgMTAwNjQ0Cj4+IC0tLSBhL01BSU5UQUlORVJTCj4+ICsrKyBiL01BSU5U
QUlORVJTCj4+IEBAIC01Mjg3LDYgKzUyODcsNyBAQCBUOglnaXQgZ2l0Oi8vcGVvcGxlLmZyZWVk
ZXNrdG9wLm9yZy9+dGhvbWFzaC9saW51eAo+PiAgIFM6CVN1cHBvcnRlZAo+PiAgIEY6CWRyaXZl
cnMvZ3B1L2RybS92bXdnZngvCj4+ICAgRjoJaW5jbHVkZS91YXBpL2RybS92bXdnZnhfZHJtLmgK
Pj4gK0Y6CW1tL2FzX2RpcnR5X2hlbHBlcnMuYwo+IEVtbS4uIE5vLiBDb3JlIE1NIGZ1bmN0aW5h
bGl0eSBjYW5ub3QgYmVsb25nIHRvIHJhbmRvbSBkcml2ZXIuCgpPSy4gSSdsbCBwdXQgaXQgdW5k
ZXIgY29yZSBNTS4KCi9UaG9tYXMKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
