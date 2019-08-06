Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA195845CC
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 09:27:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6D006E665;
	Wed,  7 Aug 2019 07:26:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D99B06E556
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2019 20:43:44 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d49e6890000>; Tue, 06 Aug 2019 13:43:53 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 06 Aug 2019 13:43:43 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 06 Aug 2019 13:43:43 -0700
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 6 Aug
 2019 20:43:43 +0000
Subject: Re: [PATCH v6 1/3] mm/gup: add make_dirty arg to
 put_user_pages_dirty_lock()
To: Ira Weiny <ira.weiny@intel.com>, <john.hubbard@gmail.com>
References: <20190804214042.4564-1-jhubbard@nvidia.com>
 <20190804214042.4564-2-jhubbard@nvidia.com>
 <20190806174017.GB4748@iweiny-DESK2.sc.intel.com>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <662e3f1e-b63e-ce80-274b-cb407bce6f78@nvidia.com>
Date: Tue, 6 Aug 2019 13:43:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190806174017.GB4748@iweiny-DESK2.sc.intel.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL104.nvidia.com (172.18.146.11) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Approved-At: Wed, 07 Aug 2019 07:26:18 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1565124233; bh=69F2w6W//D6RGOmiznV0xApH922IMQ0bjLWukK3Y3fM=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=ap4Gh4eAjhabzOCGXg03MlGS3E39LbT2CXYDFUwj2rPlbF7hC6RWG9GhsJ2iB7VW/
 iYlQoSLezyw7mHlxXl/fKIiZ8rXughCfKjTKN4/Z6IMCoXcHiVjqfWI1NEleGSaZ1D
 nb/98DcL6LZnWfzY2lODnRbMeV4rL6NENctX00s/9WgBVnL9OMB/MDykHOE9G7K2wL
 YOLJ7T/SYKJKGHtGsae2JANuXCcr7t7WsPen/yG+U/cLlENdGZ/NhUeRG2cxaPNVG0
 iSR9G6EBnJbeu0s0AK9qSs5J/PxhKEARuOdUaS2rM7tLFwOLC4PrmECrXiOHXA9ve3
 yBfnp2wxB5hBA==
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
 Santosh Shilimkar <santosh.shilimkar@oracle.com>,
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

T24gOC82LzE5IDEwOjQwIEFNLCBJcmEgV2Vpbnkgd3JvdGU6Cj4gT24gU3VuLCBBdWcgMDQsIDIw
MTkgYXQgMDI6NDA6NDBQTSAtMDcwMCwgam9obi5odWJiYXJkQGdtYWlsLmNvbSB3cm90ZToKPj4g
RnJvbTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgo+Pgo+PiBQcm92aWRlIGEg
bW9yZSBjYXBhYmxlIHZhcmlhdGlvbiBvZiBwdXRfdXNlcl9wYWdlc19kaXJ0eV9sb2NrKCksCj4+
IGFuZCBkZWxldGUgcHV0X3VzZXJfcGFnZXNfZGlydHkoKS4gVGhpcyBpcyBiYXNlZCBvbiB0aGUK
Pj4gZm9sbG93aW5nOgo+Pgo+PiAxLiBMb3RzIG9mIGNhbGwgc2l0ZXMgYmVjb21lIHNpbXBsZXIg
aWYgYSBib29sIGlzIHBhc3NlZAo+PiBpbnRvIHB1dF91c2VyX3BhZ2UqKCksIGluc3RlYWQgb2Yg
bWFraW5nIHRoZSBjYWxsIHNpdGUKPj4gY2hvb3NlIHdoaWNoIHB1dF91c2VyX3BhZ2UqKCkgdmFy
aWFudCB0byBjYWxsLgo+Pgo+PiAyLiBDaHJpc3RvcGggSGVsbHdpZydzIG9ic2VydmF0aW9uIHRo
YXQgc2V0X3BhZ2VfZGlydHlfbG9jaygpCj4+IGlzIHVzdWFsbHkgY29ycmVjdCwgYW5kIHNldF9w
YWdlX2RpcnR5KCkgaXMgdXN1YWxseSBhCj4+IGJ1Zywgb3IgYXQgbGVhc3QgcXVlc3Rpb25hYmxl
LCB3aXRoaW4gYSBwdXRfdXNlcl9wYWdlKigpCj4+IGNhbGxpbmcgY2hhaW4uCj4+Cj4+IFRoaXMg
bGVhZHMgdG8gdGhlIGZvbGxvd2luZyBBUEkgY2hvaWNlczoKPj4KPj4gICAgICogcHV0X3VzZXJf
cGFnZXNfZGlydHlfbG9jayhwYWdlLCBucGFnZXMsIG1ha2VfZGlydHkpCj4+Cj4+ICAgICAqIFRo
ZXJlIGlzIG5vIHB1dF91c2VyX3BhZ2VzX2RpcnR5KCkuIFlvdSBoYXZlIHRvCj4+ICAgICAgIGhh
bmQgY29kZSB0aGF0LCBpbiB0aGUgcmFyZSBjYXNlIHRoYXQgaXQncwo+PiAgICAgICByZXF1aXJl
ZC4KPj4KPj4gUmV2aWV3ZWQtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+PiBD
YzogTWF0dGhldyBXaWxjb3ggPHdpbGx5QGluZnJhZGVhZC5vcmc+Cj4+IENjOiBKYW4gS2FyYSA8
amFja0BzdXNlLmN6Pgo+PiBDYzogSXJhIFdlaW55IDxpcmEud2VpbnlAaW50ZWwuY29tPgo+PiBD
YzogSmFzb24gR3VudGhvcnBlIDxqZ2dAemllcGUuY2E+Cj4+IFNpZ25lZC1vZmYtYnk6IEpvaG4g
SHViYmFyZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4KPiAKPiBJIGFzc3VtZSB0aGlzIGlzIHN1cGVy
c2VkZWQgYnkgdGhlIHBhdGNoIGluIHRoZSBsYXJnZSBzZXJpZXM/Cj4gCgpBY3R1YWxseSwgaXQn
cyB0aGUgb3RoZXIgd2F5IGFyb3VuZCAodGhlcmUgaXMgYSBub3RlIHRoYXQgdGhhdCBlZmZlY3QK
aW4gdGhlIGFkbWl0dGVkbHkgd2FsbC1vZi10ZXh0IGNvdmVyIGxldHRlciBbMV0gaW4gdGhlIDM0
LXBhdGNoIHNlcmllcy4KCkhvd2V2ZXIsIEknbSB0cnlpbmcgaGFyZCB0byBlbnN1cmUgdGhhdCBp
dCBkb2Vzbid0IGFjdHVhbGx5IG1hdHRlcjoKCiogUGF0Y2ggMSBpbiB0aGUgbGF0ZXN0IG9mIGVh
Y2ggcGF0Y2ggc2VyaWVzLCBpcyBpZGVudGljYWwKCiogSSdtIHJlcG9zdGluZyB0aGUgdHdvIHNl
cmllcyB0b2dldGhlci4KCi4uLmFuZCB5ZXMsIGl0IG1pZ2h0IGhhdmUgYmVlbiBiZXR0ZXIgdG8g
bWVyZ2UgdGhlIHR3byBwYXRjaHNldHMsIGJ1dAp0aGUgc21hbGxlciBvbmUgaXMgbW9yZSByZXZp
ZXdhYmxlLiBBbmQgYXMgYSByZXN1bHQsIEFuZHJldyBoYXMgYWxyZWFkeQptZXJnZWQgaXQgaW50
byB0aGUgYWtwbSB0cmVlLgoKClsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMTkwODA0
MjI0OTE1LjI4NjY5LTEtamh1YmJhcmRAbnZpZGlhLmNvbQoKdGhhbmtzLAotLSAKSm9obiBIdWJi
YXJkCk5WSURJQQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
