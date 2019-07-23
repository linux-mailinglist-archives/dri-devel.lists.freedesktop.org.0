Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D718728AA
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 08:55:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E26D6E478;
	Wed, 24 Jul 2019 06:55:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F41089467
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 23:24:25 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d3797290000>; Tue, 23 Jul 2019 16:24:25 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 23 Jul 2019 16:24:24 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 23 Jul 2019 16:24:24 -0700
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 23 Jul
 2019 23:24:24 +0000
Subject: Re: [PATCH 3/3] net/xdp: convert put_page() to put_user_page*()
To: Ira Weiny <ira.weiny@intel.com>
References: <20190722223415.13269-1-jhubbard@nvidia.com>
 <20190722223415.13269-4-jhubbard@nvidia.com>
 <20190723002534.GA10284@iweiny-DESK2.sc.intel.com>
 <a4e9b293-11f8-6b3c-cf4d-308e3b32df34@nvidia.com>
 <20190723180612.GB29729@iweiny-DESK2.sc.intel.com>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <69540e85-b527-0252-7b29-8932660af72d@nvidia.com>
Date: Tue, 23 Jul 2019 16:24:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190723180612.GB29729@iweiny-DESK2.sc.intel.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Approved-At: Wed, 24 Jul 2019 06:54:25 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1563924265; bh=Dc+54X4TKuVoIQ6IGOnhUFUhE0Dy4dW4jkSZ2LHVHns=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=FMl+YlnDhGCsZKKh1L0ErV+31siNAXGqpbM4Ti099eQ263WNqONoZoDhA6w28dloW
 DANKq7E2Y7kdWPUACeMGcsz7IGCwEWqiwPgDnX3E9DHqqaxxYj9TrmIKWYGcLWA8z9
 HaYbTpYicIHv06kxhQ58/gdGYse2x3h25DFKRTKYtQq+80JPY4IzGMpBTYSaFvHkoA
 7F9/p/2HEcQ7syxo9toMK0sf5uUtUlNauO/KxNX+D2TkcJKNWZP3//+ZXgl5mcNywg
 K1EWHc3E5G7xnnEUtcQBaKfZD5VJFBdwU+bLpLJtcvUt/rKIgSGElbmpHYwBZFPLKu
 YnW6V/fpJl4Ag==
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
Cc: Boaz Harrosh <boaz@plexistor.com>, Jan Kara <jack@suse.cz>,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Christoph Hellwig <hch@lst.de>, Sage Weil <sage@redhat.com>,
 Miklos Szeredi <miklos@szeredi.hu>, linux-rdma@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Johannes Thumshirn <jthumshirn@suse.de>, Ilya Dryomov <idryomov@gmail.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 Santosh Shilimkar <santosh.shilimkar@oracle.com>, john.hubbard@gmail.com,
 Ming Lei <ming.lei@redhat.com>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Dan Williams <dan.j.williams@intel.com>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Yan Zheng <zyan@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNy8yMy8xOSAxMTowNiBBTSwgSXJhIFdlaW55IHdyb3RlOgo+IE9uIE1vbiwgSnVsIDIyLCAy
MDE5IGF0IDA5OjQxOjM0UE0gLTA3MDAsIEpvaG4gSHViYmFyZCB3cm90ZToKPj4gT24gNy8yMi8x
OSA1OjI1IFBNLCBJcmEgV2Vpbnkgd3JvdGU6Cj4+PiBPbiBNb24sIEp1bCAyMiwgMjAxOSBhdCAw
MzozNDoxNVBNIC0wNzAwLCBqb2huLmh1YmJhcmRAZ21haWwuY29tIHdyb3RlOgouLi4KPj4gT2J2
aW91c2x5LCB0aGlzIHN0dWZmIGlzIGFsbCBzdWJqZWN0IHRvIGEgY2VydGFpbiBhbW91bnQgb2Yg
b3BpbmlvbiwgYnV0IEkKPj4gdGhpbmsgSSdtIG9uIHJlYWxseSBzb2xpZCBncm91bmQgYXMgZmFy
IGFzIHByZWNlZGVudCBnb2VzLiBTbyBJJ20gcHVzaGluZwo+PiBiYWNrIG9uIHRoZSBOQUsuLi4g
OikKPiAKPiBGYWlyIGVub3VnaC4uLiAgSG93ZXZlciwgd2UgaGF2ZSBkaXNjdXNzZWQgaW4gdGhl
IHBhc3QgaG93IEdVUCBjYW4gYmUgYQo+IGNvbmZ1c2luZyBpbnRlcmZhY2UgdG8gdXNlLgo+IAo+
IFNvIEknZCBsaWtlIHRvIHNlZSBpdCBiZSBtb3JlIGRpcmVjdGVkLiAgT25seSB1c2luZyB0aGUg
X19wdXRfdXNlcl9wYWdlcygpCj4gdmVyc2lvbiBhbGxvd3MgdXMgdG8gSUQgY2FsbGVycyBlYXNp
ZXIgdGhyb3VnaCBhIGdyZXAgb2YgUFVQX0ZMQUdTX0RJUlRZX0xPQ0sKPiBpbiBhZGRpdGlvbiB0
byBkaXJlY3RpbmcgdXNlcnMgdG8gdXNlIHRoYXQgaW50ZXJmYWNlIHJhdGhlciB0aGFuIGhhdmlu
ZyB0byByZWFkCj4gdGhlIEdVUCBjb2RlIHRvIGZpZ3VyZSBvdXQgdGhhdCB0aGUgMiBjYWxscyBh
Ym92ZSBhcmUgZXF1YWwuICBJdCBpcyBub3QgYSBodWdlCj4gZGVhbCBidXQuLi4KPiAKCk9LLCBj
b21iaW5pbmcgYWxsIHRoZSBmZWVkYmFjayB0byBkYXRlLCB3aGljaCBpczoKCiogdGhlIGxlYWRp
bmcgZG91YmxlIHVuZGVyc2NvcmUgaXMgdW5sb3ZlZCwKCiogc2V0X3BhZ2VfZGlydHkoKSBpcyB1
bmRlciBpbnZlc3RpZ2F0aW9uLCBidXQgbGlrZWx5IGd1aWx0eSBvZiBpbmNpdGVtZW50CiAgdG8g
Y2F1c2UgYnVncywKCgouLi53ZSBlbmQgdXAgd2l0aCB0aGlzOgoKdm9pZCBwdXRfdXNlcl9wYWdl
c19kaXJ0eV9sb2NrKHN0cnVjdCBwYWdlICoqcGFnZXMsIHVuc2lnbmVkIGxvbmcgbnBhZ2VzLAoJ
CQkgICAgICAgYm9vbCBtYWtlX2RpcnR5KQoKLi4ud2hpY2ggSSBoYXZlIGEgdjIgcGF0Y2hzZXQg
Zm9yLCByZWFkeSB0byBzZW5kIG91dC4gSXQgbWFrZXMgSUIgYWxsIHByZXR0eSAKdG9vLiA6KQoK
CnRoYW5rcywKLS0gCkpvaG4gSHViYmFyZApOVklESUEKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
