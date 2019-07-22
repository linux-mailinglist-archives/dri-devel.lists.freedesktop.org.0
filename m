Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B01571267
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 09:14:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC95B89255;
	Tue, 23 Jul 2019 07:14:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D25B89DFA
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 19:11:01 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d360a4c0000>; Mon, 22 Jul 2019 12:11:08 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 22 Jul 2019 12:11:00 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 22 Jul 2019 12:11:00 -0700
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 22 Jul
 2019 19:11:00 +0000
Subject: Re: [PATCH 1/3] drivers/gpu/drm/via: convert put_page() to
 put_user_page*()
To: Matthew Wilcox <willy@infradead.org>
References: <20190722043012.22945-1-jhubbard@nvidia.com>
 <20190722043012.22945-2-jhubbard@nvidia.com> <20190722093355.GB29538@lst.de>
 <397ff3e4-e857-037a-1aee-ff6242e024b2@nvidia.com>
 <20190722190722.GF363@bombadil.infradead.org>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <14ac5f41-c27e-c5a7-e16a-4bd3cec0d31f@nvidia.com>
Date: Mon, 22 Jul 2019 12:10:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190722190722.GF363@bombadil.infradead.org>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Approved-At: Tue, 23 Jul 2019 07:14:10 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1563822668; bh=83PVez7k7U0Zqxj86oJddwWoO6j61lIp1H42K6LCjdM=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=D7LBjEJY+k3NOupyUsz3QkjUUcPJWsBWTBbYyETUfk0uHH7d3QLbvQ+9RZH/28ZUE
 sJfBT4O7QJ8wM9JX4nHRXKapNOpAYRi9LOgtrRHvxKHk2NLSGEB1ERlJVKKI3k/JJy
 7S/lE/NB7MHjzQXMBBvvHctHDvo+mZLnO7Aio3aCrObQZB+awPaHKMVSROauRYPr3X
 BJA/hGGdnsjgC4xdOAmvtDqjNiZJqnIwrrWggp9zNKGaVihgNE1edJSfqnrDSygNyO
 Yzm74sohYm7Fi77+N0T5ApyjJHRiN3SgO4JJxNpSypLaSrrE54eHRmL/LyJAWG2MRa
 b+Oe1FCWdve2g==
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
 Jason Gunthorpe <jgg@ziepe.ca>, Johannes Thumshirn <jthumshirn@suse.de>,
 Ilya Dryomov <idryomov@gmail.com>,
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

T24gNy8yMi8xOSAxMjowNyBQTSwgTWF0dGhldyBXaWxjb3ggd3JvdGU6Cj4gT24gTW9uLCBKdWwg
MjIsIDIwMTkgYXQgMTE6NTM6NTRBTSAtMDcwMCwgSm9obiBIdWJiYXJkIHdyb3RlOgo+PiBPbiA3
LzIyLzE5IDI6MzMgQU0sIENocmlzdG9waCBIZWxsd2lnIHdyb3RlOgo+Pj4gT24gU3VuLCBKdWwg
MjEsIDIwMTkgYXQgMDk6MzA6MTBQTSAtMDcwMCwgam9obi5odWJiYXJkQGdtYWlsLmNvbSB3cm90
ZToKPj4+PiAgCQlmb3IgKGkgPSAwOyBpIDwgdnNnLT5udW1fcGFnZXM7ICsraSkgewo+Pj4+ICAJ
CQlpZiAoTlVMTCAhPSAocGFnZSA9IHZzZy0+cGFnZXNbaV0pKSB7Cj4+Pj4gIAkJCQlpZiAoIVBh
Z2VSZXNlcnZlZChwYWdlKSAmJiAoRE1BX0ZST01fREVWSUNFID09IHZzZy0+ZGlyZWN0aW9uKSkK
Pj4+PiAtCQkJCQlTZXRQYWdlRGlydHkocGFnZSk7Cj4+Pj4gLQkJCQlwdXRfcGFnZShwYWdlKTsK
Pj4+PiArCQkJCQlwdXRfdXNlcl9wYWdlc19kaXJ0eSgmcGFnZSwgMSk7Cj4+Pj4gKwkJCQllbHNl
Cj4+Pj4gKwkJCQkJcHV0X3VzZXJfcGFnZShwYWdlKTsKPj4+PiAgCQkJfQo+Pj4KPj4+IENhbid0
IGp1c3QgcGFzcyBhIGRpcnR5IGFyZ3VtZW50IHRvIHB1dF91c2VyX3BhZ2VzPyAgQWxzbyBkbyB3
ZSByZWFsbHkKPj4KPj4gWWVzLCBhbmQgaW4gZmFjdCB0aGF0IHdvdWxkIGhlbHAgYSBsb3QgbW9y
ZSB0aGFuIHRoZSBzaW5nbGUgcGFnZSBjYXNlLAo+PiB3aGljaCBpcyByZWFsbHkganVzdCBjb3Nt
ZXRpYyBhZnRlciBhbGwuCj4+Cj4+PiBuZWVkIGEgc2VwYXJhdGUgcHV0X3VzZXJfcGFnZSBmb3Ig
dGhlIHNpbmdsZSBwYWdlIGNhc2U/Cj4+PiBwdXRfdXNlcl9wYWdlc19kaXJ0eT8KPj4KPj4gTm90
IHJlYWxseS4gSSdtIHN0aWxsIHplcm9pbmcgaW4gb24gdGhlIGlkZWFsIEFQSSBmb3IgYWxsIHRo
ZXNlIGNhbGwgc2l0ZXMsCj4+IGFuZCBJIGFncmVlIHRoYXQgdGhlIGFwcHJvYWNoIGJlbG93IGlz
IGNsZWFuZXIuCj4gCj4gc28gZW51bSB7IENMRUFOID0gMCwgRElSVFkgPSAxLCBMT0NLID0gMiwg
RElSVFlfTE9DSyA9IDMgfTsKPiA/Cj4gCgpTdXJlLiBJbiBmYWN0LCBJIGp1c3QgYXBwbGllZCBz
b21ldGhpbmcgc2ltaWxhciB0byBiaW9fcmVsZWFzZV9wYWdlcygpCmxvY2FsbHksIGluIG9yZGVy
IHRvIHJlY29uY2lsZSBDaHJpc3RvcGgncyBhbmQgSmVyb21lJ3MgYXBwcm9hY2hlcyAKKHRoZXkg
ZWFjaCBuZWVkZWQgdG8gYWRkIGEgYm9vbCBhcmcpLCBzbyBJJ20gYWxsIGFib3V0IHRoZSBlbnVt
cyBpbiB0aGUKYXJnIGxpc3RzLiA6KQoKSSdtIGdvaW5nIHRvIHBvc3QgdGhhdCBvbmUgc2hvcnRs
eSwgbGV0J3Mgc2VlIGhvdyBpdCBnb2VzIG92ZXIuIGhlaC4KCnRoYW5rcywKLS0gCkpvaG4gSHVi
YmFyZApOVklESUEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
