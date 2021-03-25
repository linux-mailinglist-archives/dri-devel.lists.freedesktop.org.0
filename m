Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D94349315
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 14:31:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC8916ED6B;
	Thu, 25 Mar 2021 13:31:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 721016ED6B
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 13:31:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 9C0E83FEFF;
 Thu, 25 Mar 2021 14:31:28 +0100 (CET)
Authentication-Results: ste-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=Mdg8AKwx; 
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
 with ESMTP id 9qCSgkHCCOe7; Thu, 25 Mar 2021 14:31:26 +0100 (CET)
Received: by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 2D72E3FFA0;
 Thu, 25 Mar 2021 14:31:23 +0100 (CET)
Received: from [10.249.254.165] (unknown [192.198.151.44])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 1F61C3600A8;
 Thu, 25 Mar 2021 14:31:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1616679083; bh=XL8BQAJQEgz/HLXrzxugZdd/kAGy1RzLvj1mQCzDRCE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Mdg8AKwxGQ6V9ZBKUXVtboLF2eXHKU4JPoHnip24gLaK3C4SzHyvsdQrTgwIx3H12
 //oJQ3EAvuZ6AsyBKb8g7S5z/CB5gVqkdUJoVB9PX/F4eR+WeBp/o12nWyHtUX1mLu
 ZFIriU2fBftCSzwXnUdi8riG3/KApf6l9HFkBiBk=
Subject: Re: [RFC PATCH 1/2] mm,drm/ttm: Block fast GUP to TTM huge pages
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Jason Gunthorpe <jgg@nvidia.com>
References: <0b984f96-00fb-5410-bb16-02e12b2cc024@shipmail.org>
 <20210324163812.GJ2356281@nvidia.com>
 <08f19e80-d6cb-8858-0c5d-67d2e2723f72@amd.com>
 <730eb2ff-ba98-2393-6d42-61735e3c6b83@shipmail.org>
 <20210324231419.GR2356281@nvidia.com>
 <607ecbeb-e8a5-66e9-6fe2-9a8d22f12bc2@shipmail.org>
 <fb74efd9-55be-9a8d-95b0-6103e263aab8@amd.com>
 <15da5784-96ca-25e5-1485-3ce387ee6695@shipmail.org>
 <20210325113023.GT2356281@nvidia.com>
 <afad3159-9aa8-e052-3bef-d00dee1ba51e@shipmail.org>
 <20210325120103.GV2356281@nvidia.com>
 <a0d0ffd7-3c34-5002-f4fe-cb9d4ba0279e@amd.com>
 <d8c5b688-ede1-b952-1bc9-f2aae870a7a6@shipmail.org>
 <fc548803-7e12-83d7-10b8-4774cae4747f@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <9e924f37-c638-afc7-0354-7258836772b1@shipmail.org>
Date: Thu, 25 Mar 2021 14:31:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <fc548803-7e12-83d7-10b8-4774cae4747f@amd.com>
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
Cc: David Airlie <airlied@linux.ie>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiAzLzI1LzIxIDI6MDIgUE0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4KPgo+IEFt
IDI1LjAzLjIxIHVtIDEzOjM2IHNjaHJpZWIgVGhvbWFzIEhlbGxzdHLDtm0gKEludGVsKToKPj4K
Pj4gT24gMy8yNS8yMSAxOjA5IFBNLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+Pj4gQW0gMjUu
MDMuMjEgdW0gMTM6MDEgc2NocmllYiBKYXNvbiBHdW50aG9ycGU6Cj4+Pj4gT24gVGh1LCBNYXIg
MjUsIDIwMjEgYXQgMTI6NTM6MTVQTSArMDEwMCwgVGhvbWFzIEhlbGxzdHLDtm0gKEludGVsKSAK
Pj4+PiB3cm90ZToKPj4+Pgo+Pj4+PiBOb3BlLiBUaGUgcG9pbnQgaGVyZSB3YXMgdGhhdCBpbiB0
aGlzIGNhc2UsIHRvIG1ha2Ugc3VyZSBtbWFwIHVzZXMgCj4+Pj4+IHRoZQo+Pj4+PiBjb3JyZWN0
IFZBIHRvIGdpdmUgdXMgYSByZWFzb25hYmxlIGNoYW5jZSBvZiBhbGlnbmVtZW50LCB0aGUgCj4+
Pj4+IGRyaXZlciBtaWdodAo+Pj4+PiBuZWVkIHRvIGJlIGF3YXJlIG9mIGFuZCBkbyB0cmlja2Vy
eSB3aXRoIHRoZSBodWdlIHBhZ2UtdGFibGUtZW50cnkgCj4+Pj4+IHNpemVzCj4+Pj4+IGFueXdh
eSwgYWx0aG91Z2ggSSB0aGluayBpbiBtb3N0IGNhc2VzIGEgc3RhbmRhcmQgaGVscGVyIGZvciB0
aGlzIAo+Pj4+PiBjYW4gYmUKPj4+Pj4gc3VwcGxpZWQuCj4+Pj4gT2YgY291cnNlIHRoZSBkcml2
ZXIgbmVlZHMgc29tZSB3YXkgdG8gaW5mbHVlbmNlIHRoZSBWQSBtbWFwIHVzZXMsCj4+Pj4gZ2Vy
bmFsbHkgaXQgc2hvdWxkIGFsaWduIHRvIHRoZSBuYXR1cmFsIHBhZ2Ugc2l6ZSBvZiB0aGUgZGV2
aWNlCj4+Pgo+Pj4gV2VsbCBhIG1tYXAoKSBuZWVkcyB0byBiZSBhbGlnbmVkIHRvIHRoZSBwYWdl
IHNpemUgb2YgdGhlIENQVSwgYnV0IAo+Pj4gbm90IG5lY2Vzc2FyaWx5IHRvIHRoZSBvbmUgb2Yg
dGhlIGRldmljZS4KPj4+Cj4+PiBTbyBJJ20gcHJldHR5IHN1cmUgdGhlIGRldmljZSBkcml2ZXIg
c2hvdWxkIG5vdCBiZSBpbnZvbHZlZCBpbiBhbnkgCj4+PiB3YXkgdGhlIGNob29zaW5nIG9mIHRo
ZSBWQSBmb3IgdGhlIENQVSBtYXBwaW5nLgo+Pj4KPj4+IENocmlzdGlhbi4KPj4+Cj4+IFdlJ3Zl
IGhhZCB0aGlzIGRpc2N1c3Npb24gYmVmb3JlIGFuZCBhdCB0aGF0IHRpbWUgSSBtYW5hZ2VkIHRv
IAo+PiBjb252aW5jZSB5b3UgYnkgcG9pbnRpbmcgdG8gdGhlIHNobWVtIGhlbHBlciBmb3IgdGhp
cywgCj4+IHNobWVtX2dldF91bWFwcGVkX2FyZWEoKS4KPgo+IE5vLCB5b3UgZGlkbid0IGNvbnZp
bmNlZCBtZS4gSSB3YXMganVzdCBzdXJwcmlzZWQgdGhhdCB0aGlzIGlzIAo+IHNvbWV0aGluZyB1
bmRlciBkcml2ZXIgY29udHJvbC4KPgo+Pgo+PiBCYXNpY2FsbHkgdGhlcmUgYXJlIHR3byB3YXlz
IHRvIGRvIHRoaXMuIEVpdGhlciB1c2UgYSBzdGFuZGFyZCBoZWxwZXIgCj4+IHNpbWlsYXIgdG8g
c2htZW0ncywgYW5kIHRoZW4gdGhlIGRyaXZlciBuZWVkcyB0byBhbGlnbiBwaHlzaWNhbCAKPj4g
KGRldmljZSkgaHVnZSBwYWdlIGJvdW5kYXJpZXMgdG8gYWRkcmVzcyBzcGFjZSBvZmZzZXQgaHVn
ZSBwYWdlIAo+PiBib3VuZGFyaWVzLiBJZiB5b3UgZG9uJ3QgZG8gdGhhdCB5b3UgY2FuIGp1c3Qg
YXMgd2VsbCB1c2UgYSBjdXN0b20gCj4+IGZ1bmN0aW9uIHRoYXQgYWRqdXN0cyBmb3IgeW91IG5v
dCBkb2luZyB0aGF0IAo+PiAoZHJtX2dldF91bm1hcHBlZF9hcmVhKCkpLiBCb3RoIHJlcXVpcmUg
ZHJpdmVyIGtub3dsZWRnZSBvZiB0aGUgc2l6ZSAKPj4gb2YgaHVnZSBwYWdlcy4KPgo+IEFuZCBv
bmNlIG1vcmUsIGF0IGxlYXN0IGZvciBHUFUgZHJpdmVycyB0aGF0IGxvb2tzIGxpa2UgdGhlIHRv
dGFsbHkgCj4gd3JvbmcgYXBwcm9hY2ggdG8gbWUuCj4KPiBBbGlnbmluZyB0aGUgVk1BIHNvIHRo
YXQgaHVnZSBwYWdlIGFsbG9jYXRpb25zIGJlY29tZSBwb3NzaWJsZSBpcyB0aGUgCj4gam9iIG9m
IHRoZSBNTSBzdWJzeXN0ZW0gYW5kIG5vdCB0aGF0IG9mIHRoZSBkcml2ZXJzLgo+ClByZXZpb3Vz
IGRpc2N1c3Npb24gaGVyZQoKaHR0cHM6Ly93d3cuc3Bpbmljcy5uZXQvbGlzdHMvbGludXgtbW0v
bXNnMjA1MjkxLmh0bWwKCj4+Cj4+IFdpdGhvdXQgYSBmdW5jdGlvbiB0byBhZGp1c3QsIG1tYXAg
d2lsbCB1c2UgaXQncyBkZWZhdWx0ICgxNiBieXRlPykgCj4+IGFsaWdubWVudCBhbmQgY2hhbmNl
IG9mIGFsaWdubWVudCBiZWNvbWVzIHZlcnkgc21hbGwuCj4KPiBXZWxsIGl0J3MgNEtpQiBhdCBs
ZWFzdC4KWWVzIDovIC4uLgo+Cj4gUmVnYXJkcywKPiBDaHJpc3RpYW4uCj4KVGhhbmtzLAoKVGhv
bWFzCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
