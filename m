Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 117A085BD2
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 09:46:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A53A66E795;
	Thu,  8 Aug 2019 07:46:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F3BF6E3FE;
 Thu,  8 Aug 2019 03:46:52 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d4b9b2c0000>; Wed, 07 Aug 2019 20:46:53 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Wed, 07 Aug 2019 20:46:51 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Wed, 07 Aug 2019 20:46:51 -0700
Received: from ngvpn01-164-84.dyn.scz.us.nvidia.com (172.20.13.39) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1473.3; Thu, 8 Aug 2019 03:46:50 +0000
Subject: Re: [PATCH 00/34] put_user_pages(): miscellaneous call sites
To: Ira Weiny <ira.weiny@intel.com>, Michal Hocko <mhocko@kernel.org>
References: <20190802022005.5117-1-jhubbard@nvidia.com>
 <20190802091244.GD6461@dhcp22.suse.cz>
 <20190802124146.GL25064@quack2.suse.cz>
 <20190802142443.GB5597@bombadil.infradead.org>
 <20190802145227.GQ25064@quack2.suse.cz>
 <076e7826-67a5-4829-aae2-2b90f302cebd@nvidia.com>
 <20190807083726.GA14658@quack2.suse.cz>
 <20190807084649.GQ11812@dhcp22.suse.cz>
 <20190808023637.GA1508@iweiny-DESK2.sc.intel.com>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <e648a7f3-6a1b-c9ea-1121-7ab69b6b173d@nvidia.com>
Date: Wed, 7 Aug 2019 20:46:50 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190808023637.GA1508@iweiny-DESK2.sc.intel.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Approved-At: Thu, 08 Aug 2019 07:46:20 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1565236013; bh=oa/UlzMF1BY8hfwSUK2E34E4BK86wv0rI2GL87o8kWQ=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=caNdsK+H718e8IaMHboxAo7N5kSDjdO0aPPP7qMD/uXC6LIuseTU5yocCYztoyhLS
 A8theOeNn9DFbaKSyltNZVy/0B3VPZPEr/7HwHnfipqBI1W9E/1RXgk4cYboMCcd2v
 K1AubOjDxM7RJmlTd1q1ZO/DARZkbUQqfdDa7AtzCGn8CgjUMfboXlhtit5supcfVJ
 t3SF5BlWoOZ+ktHQ+Gy0QbysjhXaepl4K0zI9Pv3YsYauPp0cOOqMsTfKIdJYZp847
 qDjXLEk745BEl9a58mwF6yYg4Z7StCZBL718mfzBDBCPCwNZsIoTbJbWCkazTDd50+
 NvHzitKycTv2g==
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
 amd-gfx@lists.freedesktop.org, sparclinux@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>, devel@driverdev.osuosl.org,
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, x86@kernel.org,
 Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, xen-devel@lists.xenproject.org,
 devel@lists.orangefs.org, linux-media@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, ceph-devel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOC83LzE5IDc6MzYgUE0sIElyYSBXZWlueSB3cm90ZToKPiBPbiBXZWQsIEF1ZyAwNywgMjAx
OSBhdCAxMDo0Njo0OUFNICswMjAwLCBNaWNoYWwgSG9ja28gd3JvdGU6Cj4+IE9uIFdlZCAwNy0w
OC0xOSAxMDozNzoyNiwgSmFuIEthcmEgd3JvdGU6Cj4+PiBPbiBGcmkgMDItMDgtMTkgMTI6MTQ6
MDksIEpvaG4gSHViYmFyZCB3cm90ZToKPj4+PiBPbiA4LzIvMTkgNzo1MiBBTSwgSmFuIEthcmEg
d3JvdGU6Cj4+Pj4+IE9uIEZyaSAwMi0wOC0xOSAwNzoyNDo0MywgTWF0dGhldyBXaWxjb3ggd3Jv
dGU6Cj4+Pj4+PiBPbiBGcmksIEF1ZyAwMiwgMjAxOSBhdCAwMjo0MTo0NlBNICswMjAwLCBKYW4g
S2FyYSB3cm90ZToKPj4+Pj4+PiBPbiBGcmkgMDItMDgtMTkgMTE6MTI6NDQsIE1pY2hhbCBIb2Nr
byB3cm90ZToKPj4+Pj4+Pj4gT24gVGh1IDAxLTA4LTE5IDE5OjE5OjMxLCBqb2huLmh1YmJhcmRA
Z21haWwuY29tIHdyb3RlOgogIFsuLi5dCj4gQmVmb3JlIEkgZ28gb24sIEkgd291bGQgbGlrZSB0
byBzYXkgdGhhdCB0aGUgImltYmFsYW5jZSIgb2YgZ2V0X3VzZXJfcGFnZXMoKQo+IGFuZCBwdXRf
cGFnZSgpIGJvdGhlcnMgbWUgZnJvbSBhIHB1cmlzdCBzdGFuZHBvaW50Li4uICBIb3dldmVyLCBz
aW5jZSB0aGlzCj4gZGlzY3Vzc2lvbiBjcm9wcGVkIHVwIEkgd2VudCBhaGVhZCBhbmQgcG9ydGVk
IG15IHdvcmsgdG8gTGludXMnIGN1cnJlbnQgbWFzdGVyCj4gKDUuMy1yYzMrKSBhbmQgaW4gZG9p
bmcgc28gSSBvbmx5IGhhZCB0byBzdGVhbCBhIGJpdCBvZiBKb2hucyBjb2RlLi4uICBTb3JyeQo+
IEpvaG4uLi4gIDotKAo+IAo+IEkgZG9uJ3QgaGF2ZSB0aGUgY29tbWl0IG1lc3NhZ2VzIGFsbCBj
bGVhbmVkIHVwIGFuZCBJIGtub3cgdGhlcmUgbWF5IGJlIHNvbWUKPiBkaXNjdXNzaW9uIG9uIHRo
ZXNlIG5ldyBpbnRlcmZhY2VzIGJ1dCBJIHdhbnRlZCB0byB0aHJvdyB0aGlzIHNlcmllcyBvdXQg
dGhlcmUKPiBiZWNhdXNlIEkgdGhpbmsgaXQgbWF5IGJlIHdoYXQgSmFuIGFuZCBNaWNoYWwgYXJl
IGRyaXZpbmcgYXQgKG9yIGF0IGxlYXN0IGluCj4gdGhhdCBkaXJlY3Rpb24uCj4gCj4gUmlnaHQg
bm93IG9ubHkgUkRNQSBhbmQgREFYIEZTJ3MgYXJlIHN1cHBvcnRlZC4gIE90aGVyIHVzZXJzIG9m
IEdVUCB3aWxsIHN0aWxsCj4gZmFpbCBvbiBhIERBWCBmaWxlIGFuZCByZWd1bGFyIGZpbGVzIHdp
bGwgc3RpbGwgYmUgYXQgcmlzay5bMl0KPiAKPiBJJ3ZlIHB1c2hlZCB0aGlzIHdvcmsgKGJhc2Vk
IDUuMy1yYzMrICgzMzkyMGYxZWM1YmYpKSBoZXJlWzNdOgo+IAo+IGh0dHBzOi8vZ2l0aHViLmNv
bS93ZWlueTIvbGludXgta2VybmVsL3RyZWUvbGludXMtcmRtYWZzZGF4LWIwLXYzCj4gCj4gSSB0
aGluayB0aGUgbW9zdCByZWxldmFudCBwYXRjaCB0byB0aGlzIGNvbnZlcnNhdGlvbiBpczoKPiAK
PiBodHRwczovL2dpdGh1Yi5jb20vd2VpbnkyL2xpbnV4LWtlcm5lbC9jb21taXQvNWQzNzc2NTNi
YTVjZjExYzNiNzE2ZjkwNGIwNTdiZWU2NjQxYWFmNgo+IAoKb2hoaC4uLmNhbiB5b3UgcGxlYXNl
IGF2b2lkIHVzaW5nIHRoZSBvbGQgX19wdXRfdXNlcl9wYWdlc19kaXJ0eSgpCmZ1bmN0aW9uPyBJ
IHRob3VnaHQgSSdkIGNhdWdodCB0aGluZ3MgZWFybHkgZW5vdWdoIHRvIGdldCBhd2F5IHdpdGgK
dGhlIHJlbmFtZSBhbmQgZGVsZXRpb24gb2YgdGhhdC4gWW91IGNvdWxkIGVpdGhlcjoKCmEpIG9w
ZW4gY29kZSBhbiBpbXBsZW1lbnRhdGlvbiBvZiB2YWRkcl9wdXRfcGFnZXNfZGlydHlfbG9jaygp
IHRoYXQKZG9lc24ndCBjYWxsIGFueSBvZiB0aGUgKnB1dF91c2VyX3BhZ2VzX2RpcnR5KigpIHZh
cmlhbnRzLCBvcgoKYikgaW5jbHVkZSBteSBmaXJzdCBwYXRjaCAoIiIpIGFyZSBwYXJ0IG9mIHlv
dXIgc2VyaWVzLCBvcgoKYykgYmFzZSB0aGlzIG9uIEFuZHJld3MncyB0cmVlLCB3aGljaCBhbHJl
YWR5IGhhcyBtZXJnZWQgaW4gbXkgZmlyc3QgcGF0Y2guCgoKdGhhbmtzLAotLSAKSm9obiBIdWJi
YXJkCk5WSURJQQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
