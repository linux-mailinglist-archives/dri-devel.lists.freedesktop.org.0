Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCB38DEDA
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 22:32:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6DEB6E835;
	Wed, 14 Aug 2019 20:32:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC2C46E835;
 Wed, 14 Aug 2019 20:32:20 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d546fdf0001>; Wed, 14 Aug 2019 13:32:31 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Wed, 14 Aug 2019 13:32:20 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Wed, 14 Aug 2019 13:32:20 -0700
Received: from rcampbell-dev.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 14 Aug
 2019 20:32:13 +0000
Subject: Re: [PATCH v3 hmm 02/11] mm/mmu_notifiers: do not speculatively
 allocate a mmu_notifier_mm
To: Jason Gunthorpe <jgg@ziepe.ca>, <linux-mm@kvack.org>
References: <20190806231548.25242-1-jgg@ziepe.ca>
 <20190806231548.25242-3-jgg@ziepe.ca>
X-Nvconfidentiality: public
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <d2d8d6a8-7ac5-8f04-c11a-61140fccc5e1@nvidia.com>
Date: Wed, 14 Aug 2019 13:32:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190806231548.25242-3-jgg@ziepe.ca>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1565814751; bh=q5g/jOMKlOwEYLFivYM3g535tx3Zkm1ReT5LriUi6Cs=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=bWazUH1oIGAphw/LWLwGrPnKZAno5v5obKf5t/eNR0RapozA5skQevZ5NNUWMTqSs
 kQOZhem/RWC7YrXGqUQcoX9RNPOMaSjczbb19BupGsQlBWLQzrHehLyn5MRQxPoeRz
 uRp+VPoBZXaU5WWDPyHzy/zn86IiYdKiYmtZuXSgMvZILtqwXmEIOyiTigq4o1+c8b
 VlbXt4UAjtud+BNmrZDyOUAgEsUrePtigZDeaGw1BwQ9WQfGiUlfYRa7z7VO+ymAOg
 wk1HgI2Ck8lmve8YFdkbz1IbY9uFTOy/smB0ozBuN1+Xs3FmWnPICy4oobSEcCxgmw
 VWUvGnEtlLyrQ==
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, Dimitri Sivanich <sivanich@sgi.com>,
 Gavin Shan <shangw@linux.vnet.ibm.com>, Andrea Righi <andrea@betterlinux.com>,
 linux-rdma@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 iommu@lists.linux-foundation.org, amd-gfx@lists.freedesktop.org,
 Jason Gunthorpe <jgg@mellanox.com>, Alex
 Deucher <alexander.deucher@amd.com>, intel-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDgvNi8xOSA0OjE1IFBNLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4gRnJvbTogSmFzb24g
R3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgo+IAo+IEEgcHJpb3IgY29tbWl0IGUwZjNjM2Y3
OGRhMiAoIm1tL21tdV9ub3RpZmllcjogaW5pdCBub3RpZmllciBpZiBuZWNlc3NhcnkiKQo+IG1h
ZGUgYW4gYXR0ZW1wdCBhdCBkb2luZyB0aGlzLCBidXQgaGFkIHRvIGJlIHJldmVydGVkIGFzIGNh
bGxpbmcKPiB0aGUgR0ZQX0tFUk5FTCBhbGxvY2F0b3IgdW5kZXIgdGhlIGlfbW1hcF9tdXRleCBj
YXVzZXMgZGVhZGxvY2ssIHNlZQo+IGNvbW1pdCAzNWNmYTJiMGI0OTEgKCJtbS9tbXVfbm90aWZp
ZXI6IGFsbG9jYXRlIG1tdV9ub3RpZmllciBpbiBhZHZhbmNlIikuCj4gCj4gSG93ZXZlciwgd2Ug
Y2FuIGF2b2lkIHRoYXQgcHJvYmxlbSBieSBkb2luZyB0aGUgYWxsb2NhdGlvbiBvbmx5IHVuZGVy
Cj4gdGhlIG1tYXBfc2VtLCB3aGljaCBpcyBhbHJlYWR5IGhhcHBlbmluZy4KPiAKPiBTaW5jZSBh
bGwgd3JpdGVycyB0byBtbS0+bW11X25vdGlmaWVyX21tIGhvbGQgdGhlIHdyaXRlIHNpZGUgb2Yg
dGhlCj4gbW1hcF9zZW0gcmVhZGluZyBpdCB1bmRlciB0aGF0IHNlbSBpcyBkZXRlcm1pbmlzdGlj
IGFuZCB3ZSBjYW4gdXNlIHRoYXQgdG8KPiBkZWNpZGUgaWYgdGhlIGFsbG9jYXRpb24gcGF0aCBp
cyByZXF1aXJlZCwgd2l0aG91dCBzcGVjdWxhdGlvbi4KPiAKPiBUaGUgYWN0dWFsIHVwZGF0ZSB0
byBtbXVfbm90aWZpZXJfbW0gbXVzdCBzdGlsbCBiZSBkb25lIHVuZGVyIHRoZQo+IG1tX3Rha2Vf
YWxsX2xvY2tzKCkgdG8gZW5zdXJlIHJlYWQtc2lkZSBjb2hlcmVuY3kuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgoKTG9va3MgZ29vZCB0byBt
ZS4KUmV2aWV3ZWQtYnk6IFJhbHBoIENhbXBiZWxsIDxyY2FtcGJlbGxAbnZpZGlhLmNvbT4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
