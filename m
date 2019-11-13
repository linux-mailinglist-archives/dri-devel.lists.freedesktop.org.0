Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 280B9FAC82
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 10:04:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CCBA6E092;
	Wed, 13 Nov 2019 09:04:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F0346E092
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 09:04:49 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dcbc7300000>; Wed, 13 Nov 2019 01:04:48 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Wed, 13 Nov 2019 01:04:48 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Wed, 13 Nov 2019 01:04:48 -0800
Received: from [10.2.160.173] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 13 Nov
 2019 09:04:48 +0000
Subject: Re: [PATCH v3 00/23] mm/gup: track dma-pinned pages: FOLL_PIN,
 FOLL_LONGTERM
To: Daniel Vetter <daniel@ffwll.ch>
References: <20191112000700.3455038-1-jhubbard@nvidia.com>
 <20191112203802.GD5584@ziepe.ca>
 <02fa935c-3469-b766-b691-5660084b60b9@nvidia.com>
 <CAKMK7uHvk+ti00mCCF2006U003w1dofFg9nSfmZ4bS2Z2pEDNQ@mail.gmail.com>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <7b671bf9-4d94-f2cc-8453-863acd5a1115@nvidia.com>
Date: Wed, 13 Nov 2019 01:02:02 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uHvk+ti00mCCF2006U003w1dofFg9nSfmZ4bS2Z2pEDNQ@mail.gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1573635888; bh=WuCLw1mNhRSSrQbzE2XtsJC46JZuOt82gJ5Z6A5sU6M=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=qgoX2qy8q+Pz4xwaUpJCPUDYqLc7AOyeowDXx94iSygezEmzpCR7ZZxo0cljsfswu
 ukE0Cm+f0R483iPntRfn/ABXBRqJdTjYQOd5BMk3/+ahH8sNYpooo8xojMC+j2QKMp
 YnZN0Muwss41C3UGdYFy5MS6hRmL0789DFptbHHfPd5vitO0CxsRYBJyPt01+pG4cX
 6cPdl9NwtrthmFzBA5/mOnD1+FGwYZl+/Gsvcsk8njJ9ZjDk+S/T82e3qWgu+CaLxi
 GAWOKJgmoqYLWXc9CemtInbG0/tG5R+23jPdDf2TY9FLXzVWhi+Ia12J1oxABZoP9Y
 i24f/CxZw1J0Q==
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
Cc: Michal Hocko <mhocko@suse.com>, Jan Kara <jack@suse.cz>,
 kvm@vger.kernel.org, Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>, "open
 list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Ira Weiny <ira.weiny@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>, "open
 list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 Shuah Khan <shuah@kernel.org>, linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf <bpf@vger.kernel.org>,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev <netdev@vger.kernel.org>, Alex Williamson <alex.williamson@redhat.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTEvMTMvMTkgMTI6MjIgQU0sIERhbmllbCBWZXR0ZXIgd3JvdGU6Ci4uLgo+Pj4gV2h5IGFy
ZSB3ZSBkb2luZyB0aGlzPyBJIHRoaW5rIHRoaW5ncyBnb3QgY29uZnVzZWQgaGVyZSBzb21lcGxh
Y2UsIGFzCj4+Cj4+Cj4+IEJlY2F1c2U6Cj4+Cj4+IGEpIFRoZXNlIG5lZWQgcHV0X3BhZ2UoKSBj
YWxscywgIGFuZAo+Pgo+PiBiKSB0aGVyZSBpcyBubyBwdXRfcGFnZXMoKSBjYWxsLCBidXQgdGhl
cmUgaXMgYSByZWxlYXNlX3BhZ2VzKCkgY2FsbCB0aGF0Cj4+IGlzLCBhcmd1YWJseSwgd2hhdCBw
dXRfcGFnZXMoKSB3b3VsZCBiZS4KPj4KPj4KPj4+IHRoZSBjb21tZW50IHN0aWxsIHNheXM6Cj4+
Pgo+Pj4gLyoqCj4+PiAgICogcHV0X3VzZXJfcGFnZSgpIC0gcmVsZWFzZSBhIGd1cC1waW5uZWQg
cGFnZQo+Pj4gICAqIEBwYWdlOiAgICAgICAgICAgIHBvaW50ZXIgdG8gcGFnZSB0byBiZSByZWxl
YXNlZAo+Pj4gICAqCj4+PiAgICogUGFnZXMgdGhhdCB3ZXJlIHBpbm5lZCB2aWEgZ2V0X3VzZXJf
cGFnZXMqKCkgbXVzdCBiZSByZWxlYXNlZCB2aWEKPj4+ICAgKiBlaXRoZXIgcHV0X3VzZXJfcGFn
ZSgpLCBvciBvbmUgb2YgdGhlIHB1dF91c2VyX3BhZ2VzKigpIHJvdXRpbmVzCj4+PiAgICogYmVs
b3cuCj4+Cj4+Cj4+IE9oaGgsIEkgbWlzc2VkIHRob3NlIGNvbW1lbnRzLiBUaGV5IG5lZWQgdG8g
YWxsIGJlIGNoYW5nZWQgb3ZlciB0bwo+PiBzYXkgInBhZ2VzIHRoYXQgd2VyZSBwaW5uZWQgdmlh
IHBpbl91c2VyX3BhZ2VzKigpIG9yCj4+IHBpbl9sb25ndGVybV9wYWdlcyooKSBtdXN0IGJlIHJl
bGVhc2VkIHZpYSBwdXRfdXNlcl9wYWdlKigpLiIKPj4KPj4gVGhlIGdldF91c2VyX3BhZ2VzKigp
IHBhZ2VzIG11c3Qgc3RpbGwgYmUgcmVsZWFzZWQgdmlhIHB1dF9wYWdlLgo+Pgo+PiBUaGUgY2h1
cm4gaXMgZHVlIHRvIGEgZmFpcmx5IHNpZ25pZmljYW50IGNoYW5nZSBpbiBzdHJhdGVneSwgd2hp
cwo+PiBpczogaW5zdGVhZCBvZiBjaGFuZ2luZyBhbGwgZ2V0X3VzZXJfcGFnZXMqKCkgc2l0ZXMg
dG8gY2FsbAo+PiBwdXRfdXNlcl9wYWdlKCksIGNoYW5nZSBzZWxlY3RlZCBzaXRlcyB0byBjYWxs
IHBpbl91c2VyX3BhZ2VzKigpIG9yCj4+IHBpbl9sb25ndGVybV9wYWdlcyooKSwgcGx1cyBwdXRf
dXNlcl9wYWdlKCkuCj4gCj4gQ2FuJ3Qgd2UgY2FsbCB0aGlzIHVucGluX3VzZXJfcGFnZSB0aGVu
LCBmb3Igc29tZSBzeW1tZXRyeT8gT3IgaXMgdGhhdAo+IGV2ZW4gbW9yZSBjaHVybj8KPiAKPiBM
b29raW5nIGZyb20gYWZhciB0aGUgbmFtaW5nIGhlcmUgc2VlbXMgcmVhbGx5IGNvbmZ1c2luZy4K
CgpUaGF0IGxvb2sgZnJvbSBhZmFyIGlzIHZhbHVhYmxlLCBiZWNhdXNlIEknbSB0b28gY2xvc2Ug
dG8gdGhlIHByb2JsZW0gdG8gc2VlCmhvdyB0aGUgbmFtaW5nIGxvb2tzLiA6KQoKdW5waW5fdXNl
cl9wYWdlKCkgc291bmRzIHN5bW1ldHJpY2FsLiBJdCdzIHRydWUgdGhhdCBpdCB3b3VsZCBjYXVz
ZSBtb3JlCmNodXJuICh3aGljaCBpcyB3aHkgSSBzdGFydGVkIG9mZiB3aXRoIGEgcHJvcG9zYWwg
dGhhdCBhdm9pZHMgY2hhbmdpbmcgdGhlCm5hbWVzIG9mIHB1dF91c2VyX3BhZ2UqKCkgQVBJcyku
IEJ1dCBPVE9ILCB0aGUgYW1vdW50IG9mIGNodXJuIGlzIHByb3BvcnRpb25hbAp0byB0aGUgY2hh
bmdlIGluIGRpcmVjdGlvbiBoZXJlLCBhbmQgaXQncyByZWFsbHkgb25seSAxMCBvciAyMCBsaW5l
cyBjaGFuZ2VkLAppbiB0aGUgZW5kLgoKU28gSSdtIG9wZW4gdG8gY2hhbmdpbmcgdG8gdGhhdCBu
YW1pbmcuIEl0IHdvdWxkIGJlIG5pY2UgdG8gaGVhciB3aGF0IG90aGVycwpwcmVmZXIsIHRvby4u
LgoKCnRoYW5rcywKLS0gCkpvaG4gSHViYmFyZApOVklESUEKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
