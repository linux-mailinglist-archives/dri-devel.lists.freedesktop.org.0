Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADC17B765
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 03:01:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C4A76E649;
	Wed, 31 Jul 2019 01:01:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3F506E647;
 Wed, 31 Jul 2019 01:01:14 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d40e8620000>; Tue, 30 Jul 2019 18:01:23 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Tue, 30 Jul 2019 18:01:14 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Tue, 30 Jul 2019 18:01:14 -0700
Received: from rcampbell-dev.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 31 Jul
 2019 01:01:11 +0000
Subject: Re: [PATCH 08/13] mm: remove the mask variable in
 hmm_vma_walk_hugetlb_entry
To: Christoph Hellwig <hch@lst.de>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?=
 <jglisse@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs
 <bskeggs@redhat.com>, Felix Kuehling <Felix.Kuehling@amd.com>
References: <20190730055203.28467-1-hch@lst.de>
 <20190730055203.28467-9-hch@lst.de>
X-Nvconfidentiality: public
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <5f8e6310-5e97-3e57-bfbf-5eef553b4d91@nvidia.com>
Date: Tue, 30 Jul 2019 18:01:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190730055203.28467-9-hch@lst.de>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1564534883; bh=OHyHSrA6JVDY2Oejcs6WpJIunzrly1fjS6RVFY7YqjM=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=ajEzn9uWQgkCJeHEaoBa1ebIKX456rMGd39kWLEC/7A9cOmd9kLxD/rfHhXnnzvtr
 p8dxFxMmc9Ht+btkwqvj95qMs6DnmoOqgpiDmTYwV4dQWlBWsw5Les1qXHiV0VM+pc
 6eLW+qk0O9HGG/H3cFIxfLKOcWS5roJB4JnQLeWEgBgvU0eJQEGHKIwFkwqHg8yEvK
 UqHAkGFEpMKcWKCnqFErM2grwMv5QR13mPLqhQIdIi6Nq4GCA2AI47+gTlrUlw3Bz/
 teNwUz4zv3BXuhvbEzfoJagndrzFIMXS9QDwkJi6PrOjJJZYCP5Xb7mMbAmAJq3QId
 Pp062/GoAjfpg==
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
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDcvMjkvMTkgMTA6NTEgUE0sIENocmlzdG9waCBIZWxsd2lnIHdyb3RlOgo+IFRoZSBwYWdl
d2FsayBjb2RlIGFscmVhZHkgcGFzc2VzIHRoZSB2YWx1ZSBhcyB0aGUgaG1hc2sgcGFyYW1ldGVy
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+IC0t
LQo+ICAgbW0vaG1tLmMgfCA3ICsrLS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDUgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL21tL2htbS5jIGIvbW0vaG1t
LmMKPiBpbmRleCBmMjZkNmFiYzRlZDIuLjg4Yjc3YTRhNmExZSAxMDA2NDQKPiAtLS0gYS9tbS9o
bW0uYwo+ICsrKyBiL21tL2htbS5jCj4gQEAgLTc3MSwxOSArNzcxLDE2IEBAIHN0YXRpYyBpbnQg
aG1tX3ZtYV93YWxrX2h1Z2V0bGJfZW50cnkocHRlX3QgKnB0ZSwgdW5zaWduZWQgbG9uZyBobWFz
aywKPiAgIAkJCQkgICAgICBzdHJ1Y3QgbW1fd2FsayAqd2FsaykKPiAgIHsKPiAgICNpZmRlZiBD
T05GSUdfSFVHRVRMQl9QQUdFCj4gLQl1bnNpZ25lZCBsb25nIGFkZHIgPSBzdGFydCwgaSwgcGZu
LCBtYXNrOwo+ICsJdW5zaWduZWQgbG9uZyBhZGRyID0gc3RhcnQsIGksIHBmbjsKPiAgIAlzdHJ1
Y3QgaG1tX3ZtYV93YWxrICpobW1fdm1hX3dhbGsgPSB3YWxrLT5wcml2YXRlOwo+ICAgCXN0cnVj
dCBobW1fcmFuZ2UgKnJhbmdlID0gaG1tX3ZtYV93YWxrLT5yYW5nZTsKPiAgIAlzdHJ1Y3Qgdm1f
YXJlYV9zdHJ1Y3QgKnZtYSA9IHdhbGstPnZtYTsKPiAtCXN0cnVjdCBoc3RhdGUgKmggPSBoc3Rh
dGVfdm1hKHZtYSk7Cj4gICAJdWludDY0X3Qgb3JpZ19wZm4sIGNwdV9mbGFnczsKPiAgIAlib29s
IGZhdWx0LCB3cml0ZV9mYXVsdDsKPiAgIAlzcGlubG9ja190ICpwdGw7Cj4gICAJcHRlX3QgZW50
cnk7Cj4gICAJaW50IHJldCA9IDA7Cj4gICAKPiAtCW1hc2sgPSBodWdlX3BhZ2Vfc2l6ZShoKSAt
IDE7Cj4gLQo+ICAgCXB0bCA9IGh1Z2VfcHRlX2xvY2soaHN0YXRlX3ZtYSh2bWEpLCB3YWxrLT5t
bSwgcHRlKTsKPiAgIAllbnRyeSA9IGh1Z2VfcHRlcF9nZXQocHRlKTsKPiAgIAo+IEBAIC03OTks
NyArNzk2LDcgQEAgc3RhdGljIGludCBobW1fdm1hX3dhbGtfaHVnZXRsYl9lbnRyeShwdGVfdCAq
cHRlLCB1bnNpZ25lZCBsb25nIGhtYXNrLAo+ICAgCQlnb3RvIHVubG9jazsKPiAgIAl9Cj4gICAK
PiAtCXBmbiA9IHB0ZV9wZm4oZW50cnkpICsgKChzdGFydCAmIG1hc2spID4+IFBBR0VfU0hJRlQp
Owo+ICsJcGZuID0gcHRlX3BmbihlbnRyeSkgKyAoKHN0YXJ0ICYgaG1hc2spID4+IFBBR0VfU0hJ
RlQpOwoKVGhpcyBuZWVkcyB0byBiZSAifmhtYXNrIiBzbyB0aGF0IHRoZSB1cHBlciBiaXRzIG9m
IHRoZSBzdGFydCBhZGRyZXNzCmFyZSBub3QgYWRkZWQgdG8gdGhlIHBmbi4gSXQncyB0aGUgbWlk
ZGxlIGJpdHMgb2YgdGhlIGFkZHJlc3MgdGhhdApvZmZzZXQgaW50byB0aGUgaHVnZSBwYWdlIHRo
YXQgYXJlIG5lZWRlZC4KCj4gICAJZm9yICg7IGFkZHIgPCBlbmQ7IGFkZHIgKz0gUEFHRV9TSVpF
LCBpKyssIHBmbisrKQo+ICAgCQlyYW5nZS0+cGZuc1tpXSA9IGhtbV9kZXZpY2VfZW50cnlfZnJv
bV9wZm4ocmFuZ2UsIHBmbikgfAo+ICAgCQkJCSBjcHVfZmxhZ3M7Cj4gCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
