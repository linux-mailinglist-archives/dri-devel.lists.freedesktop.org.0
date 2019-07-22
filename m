Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7517126B
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 09:14:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B28B889612;
	Tue, 23 Jul 2019 07:14:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BD1489DDF
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 19:07:38 +0000 (UTC)
Received: from willy by bombadil.infradead.org with local (Exim 4.92 #3 (Red
 Hat Linux)) id 1hpdec-0003Jj-Kf; Mon, 22 Jul 2019 19:07:22 +0000
Date: Mon, 22 Jul 2019 12:07:22 -0700
From: Matthew Wilcox <willy@infradead.org>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH 1/3] drivers/gpu/drm/via: convert put_page() to
 put_user_page*()
Message-ID: <20190722190722.GF363@bombadil.infradead.org>
References: <20190722043012.22945-1-jhubbard@nvidia.com>
 <20190722043012.22945-2-jhubbard@nvidia.com>
 <20190722093355.GB29538@lst.de>
 <397ff3e4-e857-037a-1aee-ff6242e024b2@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <397ff3e4-e857-037a-1aee-ff6242e024b2@nvidia.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Approved-At: Tue, 23 Jul 2019 07:14:10 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IHo0jd60OP5WBABQOSv1YQjEJDC3NFfuLVsurLyCzEY=; b=TDn8HmOOJ96erQpia/yNOR+Am
 YGQqQ9dQArre0h0KZDDqf99IHdkb/l0SKklOSbgpgKBBxoLsCLryfEj6RWfmx4DzDPt+rxYgB9uoK
 HlzC/qR3epIN5Zp+2mm2Eh0h566b5uvbDMvD60Z2twrJFWDp7fp+Y0MF9aRcqi0ggM2m4pI6GTB0F
 6GBuIKdZlIWXZn2ybmmbcZjqZg/bV1BEe0awYSuqo9n0vP+IZcIp86Izotrk4G6zHjQTWmvczaFIT
 hUgoONnHg9OZ1x5tDD7cxZKUiNLBZmS2Qv10sjaF766RSkLhz9Cy0Hzyo1vHTA41Aojb86W2/vC4z
 idOs2SARg==;
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
 =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@intel.com>,
 Santosh Shilimkar <santosh.shilimkar@oracle.com>, john.hubbard@gmail.com,
 Ming Lei <ming.lei@redhat.com>,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
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

T24gTW9uLCBKdWwgMjIsIDIwMTkgYXQgMTE6NTM6NTRBTSAtMDcwMCwgSm9obiBIdWJiYXJkIHdy
b3RlOgo+IE9uIDcvMjIvMTkgMjozMyBBTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gPiBP
biBTdW4sIEp1bCAyMSwgMjAxOSBhdCAwOTozMDoxMFBNIC0wNzAwLCBqb2huLmh1YmJhcmRAZ21h
aWwuY29tIHdyb3RlOgo+ID4+ICAJCWZvciAoaSA9IDA7IGkgPCB2c2ctPm51bV9wYWdlczsgKytp
KSB7Cj4gPj4gIAkJCWlmIChOVUxMICE9IChwYWdlID0gdnNnLT5wYWdlc1tpXSkpIHsKPiA+PiAg
CQkJCWlmICghUGFnZVJlc2VydmVkKHBhZ2UpICYmIChETUFfRlJPTV9ERVZJQ0UgPT0gdnNnLT5k
aXJlY3Rpb24pKQo+ID4+IC0JCQkJCVNldFBhZ2VEaXJ0eShwYWdlKTsKPiA+PiAtCQkJCXB1dF9w
YWdlKHBhZ2UpOwo+ID4+ICsJCQkJCXB1dF91c2VyX3BhZ2VzX2RpcnR5KCZwYWdlLCAxKTsKPiA+
PiArCQkJCWVsc2UKPiA+PiArCQkJCQlwdXRfdXNlcl9wYWdlKHBhZ2UpOwo+ID4+ICAJCQl9Cj4g
PiAKPiA+IENhbid0IGp1c3QgcGFzcyBhIGRpcnR5IGFyZ3VtZW50IHRvIHB1dF91c2VyX3BhZ2Vz
PyAgQWxzbyBkbyB3ZSByZWFsbHkKPiAKPiBZZXMsIGFuZCBpbiBmYWN0IHRoYXQgd291bGQgaGVs
cCBhIGxvdCBtb3JlIHRoYW4gdGhlIHNpbmdsZSBwYWdlIGNhc2UsCj4gd2hpY2ggaXMgcmVhbGx5
IGp1c3QgY29zbWV0aWMgYWZ0ZXIgYWxsLgo+IAo+ID4gbmVlZCBhIHNlcGFyYXRlIHB1dF91c2Vy
X3BhZ2UgZm9yIHRoZSBzaW5nbGUgcGFnZSBjYXNlPwo+ID4gcHV0X3VzZXJfcGFnZXNfZGlydHk/
Cj4gCj4gTm90IHJlYWxseS4gSSdtIHN0aWxsIHplcm9pbmcgaW4gb24gdGhlIGlkZWFsIEFQSSBm
b3IgYWxsIHRoZXNlIGNhbGwgc2l0ZXMsCj4gYW5kIEkgYWdyZWUgdGhhdCB0aGUgYXBwcm9hY2gg
YmVsb3cgaXMgY2xlYW5lci4KCnNvIGVudW0geyBDTEVBTiA9IDAsIERJUlRZID0gMSwgTE9DSyA9
IDIsIERJUlRZX0xPQ0sgPSAzIH07Cj8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
