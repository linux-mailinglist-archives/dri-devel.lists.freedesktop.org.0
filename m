Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A83F98E02D
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 23:51:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 738656E85B;
	Wed, 14 Aug 2019 21:51:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11EC66E85B;
 Wed, 14 Aug 2019 21:51:10 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d54824f0003>; Wed, 14 Aug 2019 14:51:11 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Wed, 14 Aug 2019 14:51:09 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Wed, 14 Aug 2019 14:51:09 -0700
Received: from rcampbell-dev.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 14 Aug
 2019 21:51:02 +0000
Subject: Re: [PATCH v3 hmm 05/11] hmm: use mmu_notifier_get/put for 'struct
 hmm'
To: Jason Gunthorpe <jgg@ziepe.ca>, <linux-mm@kvack.org>
References: <20190806231548.25242-1-jgg@ziepe.ca>
 <20190806231548.25242-6-jgg@ziepe.ca>
From: Ralph Campbell <rcampbell@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <66053b82-18d8-217a-b8fd-91981f66f512@nvidia.com>
Date: Wed, 14 Aug 2019 14:51:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190806231548.25242-6-jgg@ziepe.ca>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1565819471; bh=P9RT5vwQ9P2MNi7AtBxwKiWdi93Rh+sGeCthaUvRAGA=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=KJ6GRRsAe+RAr5rTMPCCaxloTQYWmrR/WBzP+8kr7gip16nYfBHAmUHPXlbhEEm72
 FR+1qaXQZT7vWEhXvkKhupPjaHOEDSaXlGsl5ePt7QdDbrhYX1ZOOgzO3bUjs5eGS9
 +3p2cWPTV3vO98Xq4pfl3VknjdwX2ZPJG9es6I7cnO7o2mLiRqWlViag4cGHvpwwm6
 fRmMqyawH4eX8IYtQuk53VGwfUdLDby5fwgRdPtR6hKzhsePeybHVahWLcd8M89osz
 g43SKAfGSqwbLLkjdR3VJhZ4Z+aymGB3ltZywUlmcAZGnriaqzx9Dpc0q6MDtbY5EG
 961klO2uRvQ9A==
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
R3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgo+IAo+IFRoaXMgaXMgYSBzaWduaWZpY2FudCBz
aW1wbGlmaWNhdGlvbiwgaXQgZWxpbWluYXRlcyBhbGwgdGhlIHJlbWFpbmluZwo+ICdobW0nIHN0
dWZmIGluIG1tX3N0cnVjdCwgZWxpbWluYXRlcyBrcmVmaW5nIGFsb25nIHRoZSBjcml0aWNhbCBu
b3RpZmllcgo+IHBhdGhzLCBhbmQgdGFrZXMgYXdheSBhbGwgdGhlIHVnbHkgbG9ja2luZyBhbmQg
YWJ1c2Ugb2YgcGFnZV90YWJsZV9sb2NrLgo+IAo+IG1tdV9ub3RpZmllcl9nZXQoKSBwcm92aWRl
cyB0aGUgc2luZ2xlIHN0cnVjdCBobW0gcGVyIHN0cnVjdCBtbSB3aGljaAo+IGVsaW1pbmF0ZXMg
bW0tPmhtbS4KPiAKPiBJdCBhbHNvIGRpcmVjdGx5IGd1YXJhbnRlZXMgdGhhdCBubyBtbXVfbm90
aWZpZXIgb3AgY2FsbGJhY2sgaXMgY2FsbGFibGUKPiB3aGlsZSBjb25jdXJyZW50IGZyZWUgaXMg
cG9zc2libGUsIHRoaXMgZWxpbWluYXRlcyBhbGwgdGhlIGtyZWZzIGluc2lkZQo+IHRoZSBtbXVf
bm90aWZpZXIgY2FsbGJhY2tzLgo+IAo+IFRoZSByZW1haW5pbmcga3JlZnMgaW4gdGhlIHJhbmdl
IGNvZGUgd2VyZSBvdmVybHkgY2F1dGlvdXMsIGRyaXZlcnMgYXJlCj4gYWxyZWFkeSBub3QgcGVy
bWl0dGVkIHRvIGZyZWUgdGhlIG1pcnJvciB3aGlsZSBhIHJhbmdlIGV4aXN0cy4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBKYXNvbiBHdW50aG9ycGUgPGpnZ0BtZWxsYW5veC5jb20+CgpMb29rcyBnb29k
LgpSZXZpZXdlZC1ieTogUmFscGggQ2FtcGJlbGwgPHJjYW1wYmVsbEBudmlkaWEuY29tPgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
