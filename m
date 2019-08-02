Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F1A802C0
	for <lists+dri-devel@lfdr.de>; Sat,  3 Aug 2019 00:32:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BAA06E030;
	Fri,  2 Aug 2019 22:32:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 849EE6E02C;
 Fri,  2 Aug 2019 22:32:38 +0000 (UTC)
Received: from tleilax.poochiereds.net (cpe-71-70-156-158.nc.res.rr.com
 [71.70.156.158])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 58F57206A3;
 Fri,  2 Aug 2019 22:32:34 +0000 (UTC)
Message-ID: <2f0d5993e9731808b73b0018f5fc4b3335fc6373.camel@kernel.org>
Subject: Re: [PATCH 03/34] net/ceph: convert put_page() to put_user_page*()
From: Jeff Layton <jlayton@kernel.org>
To: john.hubbard@gmail.com, Andrew Morton <akpm@linux-foundation.org>
Date: Fri, 02 Aug 2019 18:32:33 -0400
In-Reply-To: <20190802022005.5117-4-jhubbard@nvidia.com>
References: <20190802022005.5117-1-jhubbard@nvidia.com>
 <20190802022005.5117-4-jhubbard@nvidia.com>
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1564785158;
 bh=z6ytUlp+CIECyVYgzsmKAgNAlD3y+8CHq71PuCQ0D+c=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=cpjIBy8JqGDmfo2YvJ1zHX2H3F5SzV7XyBEUvKOoDGfZiHGtVeJHlsiNF8f/o/lw/
 1IriX/50tm1jxxFU6BHxnU7AmYr31cK1qfEIW7FiUI67JvLd42gEz50jymZEZTSESa
 2e28o/zwwAXm5Iq/SkAmipJbFc8z+f7/iU9PnXtA=
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
Cc: linux-fbdev@vger.kernel.org, Jan Kara <jack@suse.cz>, kvm@vger.kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 sparclinux@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 ceph-devel@vger.kernel.org, devel@driverdev.osuosl.org,
 rds-devel@oss.oracle.com, Sage Weil <sage@redhat.com>,
 linux-rdma@vger.kernel.org, x86@kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 xen-devel@lists.xenproject.org, Ilya Dryomov <idryomov@gmail.com>,
 devel@lists.orangefs.org, linux-media@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 linux-block@vger.kernel.org,
 =?ISO-8859-1?Q?J=E9r=F4me?= Glisse <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDE5LTA4LTAxIGF0IDE5OjE5IC0wNzAwLCBqb2huLmh1YmJhcmRAZ21haWwuY29t
IHdyb3RlOgo+IEZyb206IEpvaG4gSHViYmFyZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4KPiAKPiBG
b3IgcGFnZXMgdGhhdCB3ZXJlIHJldGFpbmVkIHZpYSBnZXRfdXNlcl9wYWdlcyooKSwgcmVsZWFz
ZSB0aG9zZSBwYWdlcwo+IHZpYSB0aGUgbmV3IHB1dF91c2VyX3BhZ2UqKCkgcm91dGluZXMsIGlu
c3RlYWQgb2YgdmlhIHB1dF9wYWdlKCkgb3IKPiByZWxlYXNlX3BhZ2VzKCkuCj4gCj4gVGhpcyBp
cyBwYXJ0IGEgdHJlZS13aWRlIGNvbnZlcnNpb24sIGFzIGRlc2NyaWJlZCBpbiBjb21taXQgZmMx
ZDhlN2NjYTJkCj4gKCJtbTogaW50cm9kdWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVy
IHZlcnNpb25zIikuCj4gCj4gQ2M6IElseWEgRHJ5b21vdiA8aWRyeW9tb3ZAZ21haWwuY29tPgo+
IENjOiBTYWdlIFdlaWwgPHNhZ2VAcmVkaGF0LmNvbT4KPiBDYzogRGF2aWQgUy4gTWlsbGVyIDxk
YXZlbUBkYXZlbWxvZnQubmV0Pgo+IENjOiBjZXBoLWRldmVsQHZnZXIua2VybmVsLm9yZwo+IENj
OiBuZXRkZXZAdmdlci5rZXJuZWwub3JnCj4gU2lnbmVkLW9mZi1ieTogSm9obiBIdWJiYXJkIDxq
aHViYmFyZEBudmlkaWEuY29tPgo+IC0tLQo+ICBuZXQvY2VwaC9wYWdldmVjLmMgfCA4ICstLS0t
LS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNyBkZWxldGlvbnMoLSkKPiAK
PiBkaWZmIC0tZ2l0IGEvbmV0L2NlcGgvcGFnZXZlYy5jIGIvbmV0L2NlcGgvcGFnZXZlYy5jCj4g
aW5kZXggNjQzMDVlNzA1NmExLi5jODhmZmYyYWI5YmQgMTAwNjQ0Cj4gLS0tIGEvbmV0L2NlcGgv
cGFnZXZlYy5jCj4gKysrIGIvbmV0L2NlcGgvcGFnZXZlYy5jCj4gQEAgLTEyLDEzICsxMiw3IEBA
Cj4gIAo+ICB2b2lkIGNlcGhfcHV0X3BhZ2VfdmVjdG9yKHN0cnVjdCBwYWdlICoqcGFnZXMsIGlu
dCBudW1fcGFnZXMsIGJvb2wgZGlydHkpCj4gIHsKPiAtCWludCBpOwo+IC0KPiAtCWZvciAoaSA9
IDA7IGkgPCBudW1fcGFnZXM7IGkrKykgewo+IC0JCWlmIChkaXJ0eSkKPiAtCQkJc2V0X3BhZ2Vf
ZGlydHlfbG9jayhwYWdlc1tpXSk7Cj4gLQkJcHV0X3BhZ2UocGFnZXNbaV0pOwo+IC0JfQo+ICsJ
cHV0X3VzZXJfcGFnZXNfZGlydHlfbG9jayhwYWdlcywgbnVtX3BhZ2VzLCBkaXJ0eSk7Cj4gIAlr
dmZyZWUocGFnZXMpOwo+ICB9Cj4gIEVYUE9SVF9TWU1CT0woY2VwaF9wdXRfcGFnZV92ZWN0b3Ip
OwoKVGhpcyBwYXRjaCBsb29rcyBzYW5lIGVub3VnaC4gQXNzdW1pbmcgdGhhdCB0aGUgZWFybGll
ciBwYXRjaGVzIGFyZSBPSzoKCkFja2VkLWJ5OiBKZWZmIExheXRvbiA8amxheXRvbkBrZXJuZWwu
b3JnPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
