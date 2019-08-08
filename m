Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A3C86C64
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 23:29:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49BB66ECC6;
	Thu,  8 Aug 2019 21:29:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36F456ECC1;
 Thu,  8 Aug 2019 21:29:38 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d4c944b0002>; Thu, 08 Aug 2019 14:29:47 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 08 Aug 2019 14:29:37 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 08 Aug 2019 14:29:37 -0700
Received: from rcampbell-dev.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 8 Aug
 2019 21:29:35 +0000
Subject: Re: [PATCH] nouveau/hmm: map pages after migration
To: Christoph Hellwig <hch@lst.de>
References: <20190807150214.3629-1-rcampbell@nvidia.com>
 <20190808070701.GC29382@lst.de>
From: Ralph Campbell <rcampbell@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <0b96a8d8-86b5-3ce0-db95-669963c1f8a7@nvidia.com>
Date: Thu, 8 Aug 2019 14:29:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190808070701.GC29382@lst.de>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1565299788; bh=PhGH3Fz3U6BG9IYzpAywsfQn2QaZDVfO/PlIuALj3rM=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=imyK21vnfbacFOz83Jrr2VLxW8z4222CyhzpK2N6BW3XRBntrQvVoBWfEvTX1rh80
 Aq1w6w02fbXlG7qLx48AqbaoY8fcIZKnShuXspLAeA/naMqKpVE7Q5oVFFzM/J/nnJ
 NAt76x24jk8nVoyJedL+umDUbk2h+9j5ogjpXB2T6U0ckoQbozMovVy1cZ7bhVuWGc
 Rq+12ZPDBONolYln8SeNAFiJbjFcPuVtmX+GNw4blXA6UO7giTubf3Zu8g+mX9DIOH
 PC3lm586whLmab/xpH1OaJvjr/y0jOiGYNuzalgw5V+ACx81KOCagrGwO/eNVSkC3R
 nrXJcdlXwWBag==
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
 Ben Skeggs <bskeggs@redhat.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDgvOC8xOSAxMjowNyBBTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gT24gV2VkLCBB
dWcgMDcsIDIwMTkgYXQgMDg6MDI6MTRBTSAtMDcwMCwgUmFscGggQ2FtcGJlbGwgd3JvdGU6Cj4+
IFdoZW4gbWVtb3J5IGlzIG1pZ3JhdGVkIHRvIHRoZSBHUFUgaXQgaXMgbGlrZWx5IHRvIGJlIGFj
Y2Vzc2VkIGJ5IEdQVQo+PiBjb2RlIHNvb24gYWZ0ZXJ3YXJkcy4gSW5zdGVhZCBvZiB3YWl0aW5n
IGZvciBhIEdQVSBmYXVsdCwgbWFwIHRoZQo+PiBtaWdyYXRlZCBtZW1vcnkgaW50byB0aGUgR1BV
IHBhZ2UgdGFibGVzIHdpdGggdGhlIHNhbWUgYWNjZXNzIHBlcm1pc3Npb25zCj4+IGFzIHRoZSBz
b3VyY2UgQ1BVIHBhZ2UgdGFibGUgZW50cmllcy4gVGhpcyBwcmVzZXJ2ZXMgY29weSBvbiB3cml0
ZQo+PiBzZW1hbnRpY3MuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFJhbHBoIENhbXBiZWxsIDxyY2Ft
cGJlbGxAbnZpZGlhLmNvbT4KPj4gQ2M6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+
PiBDYzogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgo+PiBDYzogIkrDqXLDtG1l
IEdsaXNzZSIgPGpnbGlzc2VAcmVkaGF0LmNvbT4KPj4gQ2M6IEJlbiBTa2VnZ3MgPGJza2VnZ3NA
cmVkaGF0LmNvbT4KPj4gLS0tCj4+Cj4+IFRoaXMgcGF0Y2ggaXMgYmFzZWQgb24gdG9wIG9mIENo
cmlzdG9waCBIZWxsd2lnJ3MgOSBwYXRjaCBzZXJpZXMKPj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvbGludXgtbW0vMjAxOTA3MjkyMzQ2MTEuR0M3MTcxQHJlZGhhdC5jb20vVC8jdQo+PiAidHVy
biB0aGUgaG1tIG1pZ3JhdGVfdm1hIHVwc2lkZSBkb3duIiBidXQgd2l0aG91dCBwYXRjaCA5Cj4+
ICJtbTogcmVtb3ZlIHRoZSB1bnVzZWQgTUlHUkFURV9QRk5fV1JJVEUiIGFuZCBhZGRzIGEgdXNl
IGZvciB0aGUgZmxhZy4KPiAKPiBUaGlzIGxvb2tzIHVzZWZ1bC4gIEkndmUgYWxyZWFkeSBkcm9w
cGVkIHRoYXQgcGF0Y2ggZm9yIHRoZSBwZW5kaW5nCj4gcmVzZW5kLgoKVGhhbmtzLgoKPiAKPj4g
ICBzdGF0aWMgdW5zaWduZWQgbG9uZyBub3V2ZWF1X2RtZW1fbWlncmF0ZV9jb3B5X29uZShzdHJ1
Y3Qgbm91dmVhdV9kcm0gKmRybSwKPj4gLQkJc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsIHVu
c2lnbmVkIGxvbmcgYWRkciwKPj4gLQkJdW5zaWduZWQgbG9uZyBzcmMsIGRtYV9hZGRyX3QgKmRt
YV9hZGRyKQo+PiArCQlzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwgdW5zaWduZWQgbG9uZyBz
cmMsCj4+ICsJCWRtYV9hZGRyX3QgKmRtYV9hZGRyLCB1NjQgKnBmbikKPiAKPiBJJ2xsIHBpY2sg
dXAgdGhlIHJlbW92YWwgb2YgdGhlIG5vdCBuZWVkZWQgYWRkciBhcmd1bWVudCBmb3IgdGhlIHBh
dGNoCj4gaW50cm9kdWNpbmcgbm91dmVhdV9kbWVtX21pZ3JhdGVfY29weV9vbmUsIHRoYW5rcywK
PiAKPj4gICBzdGF0aWMgdm9pZCBub3V2ZWF1X2RtZW1fbWlncmF0ZV9jaHVuayhzdHJ1Y3QgbWln
cmF0ZV92bWEgKmFyZ3MsCj4+IC0JCXN0cnVjdCBub3V2ZWF1X2RybSAqZHJtLCBkbWFfYWRkcl90
ICpkbWFfYWRkcnMpCj4+ICsJCXN0cnVjdCBub3V2ZWF1X2RybSAqZHJtLCBkbWFfYWRkcl90ICpk
bWFfYWRkcnMsIHU2NCAqcGZucykKPj4gICB7Cj4+ICAgCXN0cnVjdCBub3V2ZWF1X2ZlbmNlICpm
ZW5jZTsKPj4gICAJdW5zaWduZWQgbG9uZyBhZGRyID0gYXJncy0+c3RhcnQsIG5yX2RtYSA9IDAs
IGk7Cj4+ICAgCj4+ICAgCWZvciAoaSA9IDA7IGFkZHIgPCBhcmdzLT5lbmQ7IGkrKykgewo+PiAg
IAkJYXJncy0+ZHN0W2ldID0gbm91dmVhdV9kbWVtX21pZ3JhdGVfY29weV9vbmUoZHJtLCBhcmdz
LT52bWEsCj4+IC0JCQkJYWRkciwgYXJncy0+c3JjW2ldLCAmZG1hX2FkZHJzW25yX2RtYV0pOwo+
PiArCQkJCWFyZ3MtPnNyY1tpXSwgJmRtYV9hZGRyc1tucl9kbWFdLCAmcGZuc1tpXSk7Cj4gCj4g
Tml0OiBJIGZpbmQgdGhlICZwZm5zW2ldIHdheSB0byBwYXNzIHRoZSBhcmd1bWVudCBhIGxpdHRs
ZSB3ZWlyZCB0byByZWFkLgo+IFdoeSBub3QgInBmbnMgKyBpIj8KCk9LLCB3aWxsIGRvIGluIHYy
LgpTaG91bGQgSSBjb252ZXJ0IHRvICJkbWFfYWRkcnMgKyBucl9kbWEiIHRvbz8KCj4+ICt1NjQg
Kgo+PiArbm91dmVhdV9wZm5zX2FsbG9jKHVuc2lnbmVkIGxvbmcgbnBhZ2VzKQo+PiArewo+PiAr
CXN0cnVjdCBub3V2ZWF1X3Bmbm1hcF9hcmdzICphcmdzOwo+PiArCj4+ICsJYXJncyA9IGt6YWxs
b2Moc2l6ZW9mKCphcmdzKSArIG5wYWdlcyAqIHNpemVvZihhcmdzLT5wLnBoeXNbMF0pLAo+IAo+
IENhbiB3ZSB1c2Ugc3RydWN0X3NpemUgaGVyZT8KClllcywgZ29vZCBzdWdnZXN0aW9uLgoKPiAK
Pj4gKwlpbnQgcmV0Owo+PiArCj4+ICsJaWYgKCFzdm0pCj4+ICsJCXJldHVybjsKPj4gKwo+PiAr
CW11dGV4X2xvY2soJnN2bS0+bXV0ZXgpOwo+PiArCXN2bW0gPSBub3V2ZWF1X2ZpbmRfc3ZtbShz
dm0sIG1tKTsKPj4gKwlpZiAoIXN2bW0pIHsKPj4gKwkJbXV0ZXhfdW5sb2NrKCZzdm0tPm11dGV4
KTsKPj4gKwkJcmV0dXJuOwo+PiArCX0KPj4gKwltdXRleF91bmxvY2soJnN2bS0+bXV0ZXgpOwo+
IAo+IEdpdmVuIHRoYXQgbm91dmVhdV9maW5kX3N2bW0gZG9lc24ndCB0YWtlIGFueSBraW5kIG9m
IHJlZmVyZW5jZSwgd2hhdAo+IGd1cmFudGVlcyBzdm1tIGRvZXNuJ3QgZ28gYXdheSBhZnRlciBk
cm9wcGluZyB0aGUgbG9jaz8KCkkgYXNrZWQgQmVuIGFuZCBKZXJvbWUgYWJvdXQgdGhpcyB0b28u
CkknbSBzdGlsbCBsb29raW5nIGludG8gaXQuCgo+IAo+PiBAQCAtNDQsNSArNDksMTkgQEAgc3Rh
dGljIGlubGluZSBpbnQgbm91dmVhdV9zdm1tX2JpbmQoc3RydWN0IGRybV9kZXZpY2UgKmRldmlj
ZSwgdm9pZCAqcCwKPj4gICB7Cj4+ICAgCXJldHVybiAtRU5PU1lTOwo+PiAgIH0KPj4gKwo+PiAr
dTY0ICpub3V2ZWF1X3BmbnNfYWxsb2ModW5zaWduZWQgbG9uZyBucGFnZXMpCj4+ICt7Cj4+ICsJ
cmV0dXJuIE5VTEw7Cj4+ICt9Cj4+ICsKPj4gK3ZvaWQgbm91dmVhdV9wZm5zX2ZyZWUodTY0ICpw
Zm5zKQo+PiArewo+PiArfQo+PiArCj4+ICt2b2lkIG5vdXZlYXVfcGZuc19tYXAoc3RydWN0IG5v
dXZlYXVfZHJtICpkcm0sIHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLAo+PiArCQkgICAgICB1bnNpZ25l
ZCBsb25nIGFkZHIsIHU2NCAqcGZucywgdW5zaWduZWQgbG9uZyBucGFnZXMpCj4+ICt7Cj4+ICt9
Cj4+ICAgI2VuZGlmIC8qIElTX0VOQUJMRUQoQ09ORklHX0RSTV9OT1VWRUFVX1NWTSkgKi8KPiAK
PiBub3V2ZWF1X2RtZW0uYyBhbmQgbm91dmVhdV9zdm0uYyBhcmUgYm90aCBidWlsdCBjb25kaXRp
b25hbCBvbgo+IENPTkZJR19EUk1fTk9VVkVBVV9TVk0sIHNvIHRoZXJlIGlzIG5vIG5lZWQgZm9y
IHN0dWJzIGhlcmUuCj4gCgpHb29kIHBvaW50LiBJJ2xsIHJlbW92ZSB0aGVtIGluIHYyLgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
