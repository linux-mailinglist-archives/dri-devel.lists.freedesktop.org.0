Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9340C34A75B
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 13:33:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CABC06E1D3;
	Fri, 26 Mar 2021 12:33:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CCC06E1D5
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 12:33:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 860423FAE7;
 Fri, 26 Mar 2021 13:33:35 +0100 (CET)
Authentication-Results: ste-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=lImiUJbV; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Authentication-Results: ste-ftg-msa2.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8mseWCPLjN5N; Fri, 26 Mar 2021 13:33:34 +0100 (CET)
Received: by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id D68353FA0A;
 Fri, 26 Mar 2021 13:33:32 +0100 (CET)
Received: from [10.249.254.17] (unknown [192.198.151.44])
 by mail1.shipmail.org (Postfix) with ESMTPSA id A1D6F360060;
 Fri, 26 Mar 2021 13:33:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1616762012; bh=PzQwASPwsFfyMyzuI1D/RjQZilyjqX+o1nNIMEz2WeQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=lImiUJbVa/5KNadlW6pW8lJ/UxWXtxu1+OkemcRAKpcMmJkaFDhkFmF+4D8OFEsRn
 N+dkOUZAzJumsXzhTU1lZy6HuElM8OuQwJ4ODgl8kPDzRD5u+0s4YAzxpY7+68Bbil
 8J9mRO6RIFFDcWLrkX/8RsAIYaWJzYniOudaBv1Q=
Subject: Re: [RFC PATCH 1/2] mm,drm/ttm: Block fast GUP to TTM huge pages
To: Jason Gunthorpe <jgg@nvidia.com>
References: <YFsNRIUYrwVQanVF@phenom.ffwll.local>
 <a1fa7fa2-914b-366d-9902-e5b784e8428c@shipmail.org>
 <75423f64-adef-a2c4-8e7d-2cb814127b18@intel.com>
 <e5199438-9a0d-2801-f9f6-ceb13d7a9c61@shipmail.org>
 <6b0de827-738d-b3c5-fc79-8ca9047bad35@intel.com>
 <9f789d64-940f-c728-8d5e-aab74d562fb6@shipmail.org>
 <20210325175504.GH2356281@nvidia.com>
 <1ed48d99-1cd9-d87b-41dd-4169afc77f70@shipmail.org>
 <20210325182442.GI2356281@nvidia.com>
 <1eda588b-ae51-9b69-4bd4-da37b2aa1e4b@shipmail.org>
 <20210326114654.GL2356281@nvidia.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <a30e4116-4d51-9143-3195-791fc1e70e87@shipmail.org>
Date: Fri, 26 Mar 2021 13:33:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210326114654.GL2356281@nvidia.com>
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
Cc: "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Dave Hansen <dave.hansen@intel.com>, Nick Piggin <npiggin@gmail.com>,
 "Williams, Dan J" <dan.j.williams@intel.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDMvMjYvMjEgMTI6NDYgUE0sIEphc29uIEd1bnRob3JwZSB3cm90ZToKPiBPbiBGcmksIE1h
ciAyNiwgMjAyMSBhdCAxMDowODowOUFNICswMTAwLCBUaG9tYXMgSGVsbHN0csO2bSAoSW50ZWwp
IHdyb3RlOgo+PiBPbiAzLzI1LzIxIDc6MjQgUE0sIEphc29uIEd1bnRob3JwZSB3cm90ZToKPj4+
IE9uIFRodSwgTWFyIDI1LCAyMDIxIGF0IDA3OjEzOjMzUE0gKzAxMDAsIFRob21hcyBIZWxsc3Ry
w7ZtIChJbnRlbCkgd3JvdGU6Cj4+Pj4gT24gMy8yNS8yMSA2OjU1IFBNLCBKYXNvbiBHdW50aG9y
cGUgd3JvdGU6Cj4+Pj4+IE9uIFRodSwgTWFyIDI1LCAyMDIxIGF0IDA2OjUxOjI2UE0gKzAxMDAs
IFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCkgd3JvdGU6Cj4+Pj4+PiBPbiAzLzI0LzIxIDk6MjUg
UE0sIERhdmUgSGFuc2VuIHdyb3RlOgo+Pj4+Pj4+IE9uIDMvMjQvMjEgMToyMiBQTSwgVGhvbWFz
IEhlbGxzdHLDtm0gKEludGVsKSB3cm90ZToKPj4+Pj4+Pj4+IFdlIGFsc28gaGF2ZSBub3QgYmVl
biBjYXJlZnVsIGF0ICphbGwqIGFib3V0IGhvdyBfUEFHRV9CSVRfU09GVFcqIGFyZQo+Pj4+Pj4+
Pj4gdXNlZC7CoCBJdCdzIHF1aXRlIHBvc3NpYmxlIHdlIGNhbiBlbmNvZGUgYW5vdGhlciB1c2Ug
ZXZlbiBpbiB0aGUKPj4+Pj4+Pj4+IGV4aXN0aW5nIGJpdHMuCj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4g
UGVyc29uYWxseSwgSSdkIGp1c3QgdHJ5Ogo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+ICNkZWZpbmUgX1BB
R0VfQklUX1NPRlRXNcKgwqDCoMKgwqDCoMKgIDU3wqDCoMKgwqDCoCAvKiBhdmFpbGFibGUgZm9y
IHByb2dyYW1tZXIgKi8KPj4+Pj4+Pj4+Cj4+Pj4+Pj4+IE9LLCBJJ2xsIGZvbGxvdyB5b3VyIGFk
dmlzZSBoZXJlLiBGV0lXIEkgZ3JlcHBlZCBmb3IgU1cxIGFuZCBpdCBzZWVtcwo+Pj4+Pj4+PiB1
c2VkIGluIGEgc2VsZnRlc3QsIGJ1dCBvbmx5IGZvciBQVEVzIEFGQUlDVC4KPj4+Pj4+Pj4KPj4+
Pj4+Pj4gT2gsIGFuZCB3ZSBkb24ndCBjYXJlIGFib3V0IDMyLWJpdCBtdWNoIGFueW1vcmU/Cj4+
Pj4+Pj4gT24geDg2LCB3ZSBoYXZlIDY0LWJpdCBQVEVzIHdoZW4gcnVubmluZyAzMi1iaXQga2Vy
bmVscyBpZiBQQUUgaXMKPj4+Pj4+PiBlbmFibGVkLiAgSU9XLCB3ZSBjYW4gaGFuZGxlIHRoZSBt
YWpvcml0eSBvZiAzMi1iaXQgQ1BVcyBvdXQgdGhlcmUuCj4+Pj4+Pj4KPj4+Pj4+PiBCdXQsIHll
YWgsIHdlIGRvbid0IGNhcmUgYWJvdXQgMzItYml0LiA6KQo+Pj4+Pj4gSG1tLAo+Pj4+Pj4KPj4+
Pj4+IEFjdHVhbGx5IGl0IG1ha2VzIHNvbWUgc2Vuc2UgdG8gdXNlIFNXMSwgdG8gbWFrZSBpdCBl
bmQgdXAgaW4gdGhlIHNhbWUgZHdvcmQKPj4+Pj4+IGFzIHRoZSBQU0UgYml0LCBhcyBmcm9tIHdo
YXQgSSBjYW4gdGVsbCwgcmVhZGluZyBvZiBhIDY0LWJpdCBwbWRfdCBvbiAzMi1iaXQKPj4+Pj4+
IFBBRSBpcyBub3QgYXRvbWljLCBzbyBpbiB0aGVvcnkgYSBodWdlIHBtZCBjb3VsZCBiZSBtb2Rp
ZmllZCB3aGlsZSByZWFkaW5nCj4+Pj4+PiB0aGUgcG1kX3QgbWFraW5nIHRoZSBkd29yZHMgaW5j
b25zaXN0ZW50Li4uLiBIb3cgZG9lcyB0aGF0IHdvcmsgd2l0aCBmYXN0Cj4+Pj4+PiBndXAgYW55
d2F5Pwo+Pj4+PiBJdCBsb29wcyB0byBnZXQgYW4gYXRvbWljIDY0IGJpdCB2YWx1ZSBpZiB0aGUg
YXJjaCBjYW4ndCBwcm92aWRlIGFuCj4+Pj4+IGF0b21pYyA2NCBiaXQgbG9hZAo+Pj4+IEhtbSwg
b2ssIEkgc2VlIGEgUkVBRF9PTkNFKCkgaW4gZ3VwX3BtZF9yYW5nZSgpLCBhbmQgdGhlbiB0aGUg
cmVzdWx0aW5nIHBtZAo+Pj4+IGlzIGRlcmVmZXJlbmNlZCBlaXRoZXIgaW4gdHJ5X2dyYWJfY29t
cG91bmRfaGVhZCgpIG9yIF9fZ3VwX2RldmljZV9odWdlKCksCj4+Pj4gYmVmb3JlIHRoZSBwbWQg
aXMgY29tcGFyZWQgdG8gdGhlIHZhbHVlIHRoZSBwb2ludGVyIGlzIGN1cnJlbnRseSBwb2ludGlu
Zwo+Pj4+IHRvLiBDb3VsZG4ndCB0aG9zZSBkZXJlZmVyZW5jZXMgYmUgb24gaW52YWxpZCBwb2lu
dGVycz8KPj4+IFVoaGhoaC4uIFRoYXQgZG9lcyBsb29rIHF1ZXN0aW9uYWJsZSwgeWVzLiBVbmxl
c3MgdGhlcmUgaXMgc29tZSB0cmlja3kKPj4+IHJlYXNvbiB3aHkgYSA2NCBiaXQgcG1kIGVudHJ5
IG9uIGEgMzIgYml0IGFyY2ggZWl0aGVyIGNhbid0IGV4aXN0IG9yCj4+PiBoYXMgYSBzdGFibGUg
dXBwZXIgMzIgYml0cy4uCj4+Pgo+Pj4gVGhlIHB0ZSBkb2VzIGl0IHdpdGggcHRlcF9nZXRfbG9j
a2xlc3MoKSwgd2UgcHJvYmFibHkgbmVlZCB0aGUgc2FtZQo+Pj4gZm9yIHRoZSBvdGhlciBsZXZl
bHMgdG9vIGluc3RlYWQgb2Ygb3BlbiBjb2RpbmcgYSBSRUFEX09OQ0U/Cj4+Pgo+Pj4gSmFzb24K
Pj4gVEJILCBwdGVwX2dldF9sb2NrbGVzcygpIGFsc28gbG9va3MgYSBiaXQgZmlzaHkuIGl0IHNh
eXMKPj4gIml0IHdpbGwgbm90IHN3aXRjaCB0byBhIGNvbXBsZXRlbHkgZGlmZmVyZW50IHByZXNl
bnQgcGFnZSB3aXRob3V0IGEgVExCCj4+IGZsdXNoIGluIGJldHdlZW4iLgo+Pgo+PiBXaGF0IGlm
IHRoZSBmb2xsb3dpbmcgaGFwcGVuczoKPj4KPj4gcHJvY2Vzc29yIDE6IFJlYWRzIGxvd2VyIGR3
b3JkIG9mIFBURS4KPj4gcHJvY2Vzc29yIDI6IFphcHMgUFRFLiBHZXRzIHN0dWNrIHdhaXRpbmcg
dG8gZG8gVExCIGZsdXNoCj4+IHByb2Nlc3NvciAxOiBSZWFkcyB1cHBlciBkd29yZCBvZiBQVEUs
IHdoaWNoIGlzIG5vdyB6ZXJvLgo+PiBwcm9jZXNzb3IgMzogSGl0cyBhIFRMQiBtaXNzLCByZWFk
cyBhbiB1bnBvcHVsYXRlZCBQVEUgYW5kIGZhdWx0cyBpbiBhIG5ldwo+PiBQVEUgdmFsdWUgd2hp
Y2ggaGFwcGVucyB0byBiZSB0aGUgc2FtZSBhcyB0aGUgb3JpZ2luYWwgb25lIGJlZm9yZSB0aGUg
emFwLgo+PiBwcm9jZXNzb3IgMTogUmVhZHMgdGhlIG5ld2x5IGZhdWx0ZWQgaW4gbG93ZXIgZHdv
cmQsIGNvbXBhcmVzIHRvIHRoZSBvbGQKPj4gb25lLCBnaXZlcyBhbiBPSyBhbmQgcmV0dXJucyBh
IGJvZ3VzIFBURS4KPiBTbyB5b3UgYXJlIHNheWluZyB0aGF0IHdoaWxlIHRoZSB6YXAgd2lsbCB3
YWl0IGZvciB0aGUgVExCIGZsdXNoIHRvCj4gZ2xvYmFsbHkgZmluaXNoIG9uY2UgaXQgZ2V0cyBz
dGFydGVkIGFueSBvdGhlciBwcm9jZXNzb3IgY2FuIHN0aWxsCj4gd3JpdGUgdG8gdGhlIHB0ZT8K
Pgo+IEkgY2FuJ3QgdGhpbmsgb2YgYW55IHNlcmlhbGl6YXRpb24gdGhhdCB3b3VsZCBjYXVzZSBm
YXVsdCB0byB3YWl0IGZvcgo+IHRoZSB6YXAvVExCIGZsdXNoLCBlc3BlY2lhbGx5IGlmIHRoZSB6
YXAgY29tZXMgZnJvbSB0aGUgYWRkcmVzc19zcGFjZQo+IGFuZCBkb2Vzbid0IGhvbGQgdGhlIG1t
YXAgbG9jay4KCkkgbWlnaHQgb2YgY291cnNlIGJlIGNvbXBsZXRlbHkgd3JvbmcsIGJ1dCBJdCBz
ZWVtcyB0aGVyZSBpcyBhbiAKYXNzdW1wdGlvbiBtYWRlIHRoYXQgYWxsIHBvdGVudGlhbGx5IGFm
ZmVjdGVkIHByb2Nlc3NvcnMgd291bGQgaGF2ZSBhIAp2YWxpZCBUTEIgZW50cnkgZm9yIHRoZSBQ
VEUuIFRoZW4gdGhlIGZhdWx0IHdvdWxkIG5vdCBoYXBwZW4gKHdlbGwgCnVubGVzcyBvZiBjb3Vy
c2UgdGhlIFRMQiBmbHVzaCBjb21wbGV0ZXMgb24gc29tZSBwcm9jZXNzb3JzIGJlZm9yZSAKZ2V0
dGluZyBzdHVjayBvbiB0aGUgbG9jYWxfaXJxX2Rpc2FibGUoKSBvbiBwcm9jZXNzb3IgMSkuCgor
Q0M6IE5pY2sgUGlnZ2luCgpTZWVtcyBsaWtlIE5pY2sgUGlnZ2luIGlzIHRoZSBvcmlnaW5hbCBh
dXRob3Igb2YgdGhlIGNvbW1lbnQuIFBlcmhhcHMgaGUgCmNhbiBjYW4gY2xhcmlmeSBhIGJpdC4K
Ci9UaG9tYXMKCgo+Cj4gU2VlbXMgd29ydGggYnJpbmdpbmcgdXAgaW4gYSBiaWdnZXIgdGhyZWFk
LCBtYXliZSBzb21lb25lIGVsc2Uga25vd3M/Cj4KPiBKYXNvbgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
