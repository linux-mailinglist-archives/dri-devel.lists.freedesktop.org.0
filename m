Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9B971265
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 09:14:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4581E891AF;
	Tue, 23 Jul 2019 07:14:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A3E889CF7
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 06:35:01 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d36aa920000>; Mon, 22 Jul 2019 23:34:58 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 22 Jul 2019 23:35:00 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 22 Jul 2019 23:35:00 -0700
Received: from [10.2.160.36] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 23 Jul
 2019 06:35:00 +0000
Subject: Re: [PATCH 1/3] mm/gup: introduce __put_user_pages()
To: Christoph Hellwig <hch@lst.de>, <john.hubbard@gmail.com>
References: <20190722223415.13269-1-jhubbard@nvidia.com>
 <20190722223415.13269-2-jhubbard@nvidia.com> <20190723055359.GC17148@lst.de>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <8ab4899c-ec12-a713-cac2-d951fff2a347@nvidia.com>
Date: Mon, 22 Jul 2019 23:33:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190723055359.GC17148@lst.de>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL104.nvidia.com (172.18.146.11) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Approved-At: Tue, 23 Jul 2019 07:14:10 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1563863698; bh=MYQG8fRNI4z6ZFJij9qzWoyJeD7sXuD24txEZDtHeVo=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=rtKKKX6s7ujNQbvClnxWqMxjAQN+orwb0XG6bE7MY9CBmVMoLos6YZJhDRHzOwcu7
 MgcwjgXGmxu08uFN3j7xmVuYQfp+YxGQWwPqbSk2XS0jFo6zkI7t0qFXNXXmSLtY3s
 DGCNjuilmS9RDcCRCHUhnaNFu0w5UNnZE0mpdDsgv5muKWSHcc/MN7abz3aSfjB2u5
 qlQsi1M3emKcIzuJhFxTyC574Iqg5IsJdZeBsu4z0jgKJGZ42JrJbgbbwRMmTsSxBC
 Tyyk+jkxxDt8HzFfD/xTR3nVTUPGoNCjGukvHrN0rnk9ywKCisRW6Y45T378RNPzwb
 ZYjYbcdp2Tx7w==
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
 Sage Weil <sage@redhat.com>, Miklos Szeredi <miklos@szeredi.hu>,
 linux-rdma@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Johannes Thumshirn <jthumshirn@suse.de>,
 Ilya Dryomov <idryomov@gmail.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 Santosh Shilimkar <santosh.shilimkar@oracle.com>,
 Ming Lei <ming.lei@redhat.com>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Dan Williams <dan.j.williams@intel.com>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Yan Zheng <zyan@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 "David S . Miller" <davem@davemloft.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNy8yMi8xOSAxMDo1MyBQTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gT24gTW9uLCBK
dWwgMjIsIDIwMTkgYXQgMDM6MzQ6MTNQTSAtMDcwMCwgam9obi5odWJiYXJkQGdtYWlsLmNvbSB3
cm90ZToKPj4gK2VudW0gcHVwX2ZsYWdzX3Qgewo+PiArCVBVUF9GTEFHU19DTEVBTgkJPSAwLAo+
PiArCVBVUF9GTEFHU19ESVJUWQkJPSAxLAo+PiArCVBVUF9GTEFHU19MT0NLCQk9IDIsCj4+ICsJ
UFVQX0ZMQUdTX0RJUlRZX0xPQ0sJPSAzLAo+PiArfTsKPiAKPiBXZWxsLCB0aGUgZW51bSBkZWZl
YXRzIHRoZSBlYXNlIG9mIGp1c3QgYmVpbmcgYWJsZSB0byBwYXNzIGEgYm9vbGVhbgo+IGV4cHJl
c3Npb24gdG8gdGhlIGZ1bmN0aW9uLCB3aGljaCB3b3VsZCBzaW1wbGlmeSBhIGxvdCBvZiB0aGUg
Y2FsbGVyLAo+IHNvIGlmIHdlIG5lZWQgdG8gc3VwcG9ydCB0aGUgIWxvY2tlZCB2ZXJzaW9uIEkn
ZCByYXRoZXIgc2VlIHRoYXQgYXMKPiBhIHNlcGFyYXRlIGhlbHBlci4KPiAKPiBCdXQgZG8gd2Ug
YWN0dWFsbHkgaGF2ZSBjYWxsZXJzIHdoZXJlIG5vdCB1c2luZyB0aGUgX2xvY2sgdmVyc2lvbiBp
cwo+IG5vdCBhIGJ1Zz8gIHNldF9wYWdlX2RpcnR5IG1ha2VzIHNlbnNlIGluIHRoZSBjb250ZXh0
IG9mIGEgZmlsZSBzeXN0ZW1zCj4gdGhhdCBoYXZlIGEgcmVmZXJlbmNlIHRvIHRoZSBpbm9kZSB0
aGUgcGFnZSBoYW5ncyBvZmYsIGJ1dCB0aGF0IGlzCj4gKGFsbW9zdD8pIG5ldmVyIHRoZSBjYXNl
IGZvciBnZXRfdXNlcl9wYWdlcy4KPiAKCkknbSBzZWVpbmcgYWJvdXQgMTggcGxhY2VzIHdoZXJl
IHNldF9wYWdlX2RpcnR5KCkgaXMgdXNlZCwgaW4gdGhlIGNhbGwgc2l0ZQpjb252ZXJzaW9ucyBz
byBmYXIsIGFuZCBhYm91dCAyMCBwbGFjZXMgd2hlcmUgc2V0X3BhZ2VfZGlydHlfbG9jaygpIGlz
CnVzZWQuIFNvIHdpdGhvdXQga25vd2luZyBob3cgbWFueSBvZiB0aGUgZm9ybWVyIChpZiBhbnkp
IHJlcHJlc2VudCBidWdzLAp5b3UgY2FuIHNlZSB3aHkgdGhlIHByb3Bvc2FsIGhlcmUgc3VwcG9y
dHMgYm90aCBESVJUWSBhbmQgRElSVFlfTE9DSy4KCkFueXdheSwgeWVzLCBJIGNvdWxkIGNoYW5n
ZSBpdCwgYmFzZWQgb24geW91ciBlc3RpbWF0aW9uIHRoYXQgbW9zdCBvZiB0aGUgCnNldF9wYWdl
X2RpcnR5KCkgY2FsbHMgcmVhbGx5IHNob3VsZCBiZSBzZXRfcGFnZV9kaXJ0eV9sb2NrKCkuCklu
IHRoYXQgY2FzZSwgd2Ugd291bGQgZW5kIHVwIHdpdGggYXBwcm94aW1hdGVseSB0aGUgZm9sbG93
aW5nOgoKLyogSGVyZSwgImRpcnR5IiByZWFsbHkgbWVhbnMsICJjYWxsIHNldF9wYWdlX2RpcnR5
X2xvY2soKSI6ICovCnZvaWQgX19wdXRfdXNlcl9wYWdlcyhzdHJ1Y3QgcGFnZSAqKnBhZ2VzLCB1
bnNpZ25lZCBsb25nIG5wYWdlcywKCQkgICAgICBib29sIGRpcnR5KTsKCi8qIEhlcmUsICJkaXJ0
eSIgcmVhbGx5IG1lYW5zLCAiY2FsbCBzZXRfcGFnZV9kaXJ0eSgpIjogKi8Kdm9pZCBfX3B1dF91
c2VyX3BhZ2VzX3VubG9ja2VkKHN0cnVjdCBwYWdlICoqcGFnZXMsIHVuc2lnbmVkIGxvbmcgbnBh
Z2VzLAoJCQkgICAgICAgYm9vbCBkaXJ0eSk7Cgo/CgoKdGhhbmtzLAotLSAKSm9obiBIdWJiYXJk
Ck5WSURJQQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
