Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 941D779CAF
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 01:18:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BBE189E2A;
	Mon, 29 Jul 2019 23:18:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87F0389E2A;
 Mon, 29 Jul 2019 23:18:22 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d3f7eba0000>; Mon, 29 Jul 2019 16:18:18 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 29 Jul 2019 16:18:17 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 29 Jul 2019 16:18:17 -0700
Received: from rcampbell-dev.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 29 Jul
 2019 23:18:13 +0000
Subject: Re: [PATCH 2/9] nouveau: reset dma_nr in
 nouveau_dmem_migrate_alloc_and_copy
To: Christoph Hellwig <hch@lst.de>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?=
 <jglisse@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs
 <bskeggs@redhat.com>
References: <20190729142843.22320-1-hch@lst.de>
 <20190729142843.22320-3-hch@lst.de>
X-Nvconfidentiality: public
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <26260dd4-f28d-f962-9e38-8bde45335099@nvidia.com>
Date: Mon, 29 Jul 2019 16:18:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190729142843.22320-3-hch@lst.de>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1564442298; bh=wffttBld7HfMmTsUtcVoraIE8ihlJ8+LyvWPe1N6NlM=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=qJYB6wAPLve6SzMmp5MpWUWQdHoVK+fKim4roGerZZ+H77Co/BQ9+sH3W3tA6tGo6
 Qw/ilm9/0g7HpgRfqMM+KqB6PldKNV2/X0EkW+vFmEjKH+/0MNIWB6wXrj1YRUXzwL
 RCt1HZmcafUvz8j6lns2XXyvcNxg18HpUEpVLEIFOxdtlbLEFvJd6EcuvIHmAssuwk
 Cu4w6L02s0iaeg0/0OBAUj/7DCbe0uWiSDRevgQpB8N02P0daSKT5OUL6ZfFrUxc/w
 HIneiuZFGw8uM87zuhdk7izVmIFJFBcoLp4P1KO4Qcu2x+7vZZLRIMwj2jxvykh/K3
 cvQCTOyBkvhYA==
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
 dri-devel@lists.freedesktop.org, Bharata B Rao <bharata@linux.ibm.com>,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDcvMjkvMTkgNzoyOCBBTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gV2hlbiB3ZSBz
dGFydCBhIG5ldyBiYXRjaCBvZiBkbWFfbWFwIG9wZXJhdGlvbnMgd2UgbmVlZCB0byByZXNldCBk
bWFfbnIsCj4gYXMgd2Ugc3RhcnQgZmlsbGluZyBhIG5ld2x5IGFsbG9jYXRlZCBhcnJheS4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KClJldmlld2Vk
LWJ5OiBSYWxwaCBDYW1wYmVsbCA8cmNhbXBiZWxsQG52aWRpYS5jb20+Cgo+IC0tLQo+ICAgZHJp
dmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kbWVtLmMgfCAxICsKPiAgIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91
dmVhdS9ub3V2ZWF1X2RtZW0uYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZG1l
bS5jCj4gaW5kZXggMzg0MTY3OThhYmQ0Li5lNjk2MTU3Zjc3MWUgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kbWVtLmMKPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vbm91dmVhdS9ub3V2ZWF1X2RtZW0uYwo+IEBAIC02ODIsNiArNjgyLDcgQEAgbm91dmVhdV9k
bWVtX21pZ3JhdGVfYWxsb2NfYW5kX2NvcHkoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsCj4g
ICAJbWlncmF0ZS0+ZG1hID0ga21hbGxvYyhzaXplb2YoKm1pZ3JhdGUtPmRtYSkgKiBucGFnZXMs
IEdGUF9LRVJORUwpOwo+ICAgCWlmICghbWlncmF0ZS0+ZG1hKQo+ICAgCQlnb3RvIGVycm9yOwo+
ICsJbWlncmF0ZS0+ZG1hX25yID0gMDsKPiAgIAo+ICAgCS8qIENvcHkgdGhpbmdzIG92ZXIgKi8K
PiAgIAljb3B5ID0gZHJtLT5kbWVtLT5taWdyYXRlLmNvcHlfZnVuYzsKPiAKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
