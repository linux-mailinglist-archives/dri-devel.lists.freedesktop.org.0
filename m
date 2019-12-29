Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA2512C064
	for <lists+dri-devel@lfdr.de>; Sun, 29 Dec 2019 05:33:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A3C789E5B;
	Sun, 29 Dec 2019 04:33:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89B5289E5B
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Dec 2019 04:33:35 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e082c900000>; Sat, 28 Dec 2019 20:33:21 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Sat, 28 Dec 2019 20:33:34 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Sat, 28 Dec 2019 20:33:34 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 29 Dec
 2019 04:33:33 +0000
Subject: Re: [PATCH v11 00/25] mm/gup: track dma-pinned pages: FOLL_PIN
From: John Hubbard <jhubbard@nvidia.com>
To: Leon Romanovsky <leon@kernel.org>
References: <20191216222537.491123-1-jhubbard@nvidia.com>
 <20191219132607.GA410823@unreal>
 <a4849322-8e17-119e-a664-80d9f95d850b@nvidia.com>
 <20191219210743.GN17227@ziepe.ca> <20191220182939.GA10944@unreal>
 <1001a5fc-a71d-9c0f-1090-546c4913d8a2@nvidia.com>
 <20191222132357.GF13335@unreal>
 <49d57efe-85e1-6910-baf5-c18df1382206@nvidia.com>
 <20191225052612.GA212002@unreal>
 <b879d191-a07c-e808-e48f-2b9bd8ba4fa3@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <612aa292-ec45-295c-b56c-c622876620fa@nvidia.com>
Date: Sat, 28 Dec 2019 20:33:32 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <b879d191-a07c-e808-e48f-2b9bd8ba4fa3@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1577594001; bh=CS/Y1CGyDS+9QLfc4LRardH5VS56W/PAJOyfRY2LjTc=;
 h=X-PGP-Universal:Subject:From:To:CC:References:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=n7iOptnwN3ZVsCu/0DXie5ShRcR4/jOzIn6W7P3uTBxVaZt8ko4Dms+OE9l2tNSxe
 95GOtrfVtIDr0VsAlD/d/zPWSpFCkJY5UP5Eb2ss2F3NEgv4iTUN6NL2VHU+RtQqVi
 nFPi4CTJq0hll0B94/tPBP/T736se/ycwi7dWWtNiIfcgsX/aG2ZU9RUFFoSuSYe5B
 fwPDB3yWJZmxzNFs+zKaKVZ1e+/lnxSIdtwRl5XP/Vm1rz2l41lunDXgCSZTy/8O/h
 ByGzcgSVg+SF9TRzjsSZ/pWRsIBTO2VIGDe+IjvB1qU+Q0EIsH+JijQJxdtnLBWoeO
 bb0/oQMKrQ56Q==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
 kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 linux-kselftest@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 Maor Gottlieb <maorg@mellanox.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>, Ran
 Rozenstein <ranro@mellanox.com>, linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTIvMjcvMTkgMTo1NiBQTSwgSm9obiBIdWJiYXJkIHdyb3RlOgouLi4KPj4gSXQgaXMgYW5j
aWVudCB2ZXJpZmljYXRpb24gdGVzdCAofjEweSkgd2hpY2ggaXMgbm90IGFuIGVhc3kgdGFzayB0
bwo+PiBtYWtlIGl0IHVuZGVyc3RhbmRhYmxlIGFuZCBzdGFuZGFsb25lIDopLgo+Pgo+IAo+IElz
IHRoaXMgdGhlIG9ubHkgdGVzdCB0aGF0IGZhaWxzLCBidHc/IE5vIG90aGVyIHRlc3QgZmFpbHVy
ZXMgb3IgaGludHMgb2YKPiBwcm9ibGVtcz8KPiAKPiAoQWxzbywgbWF5YmUgaG9wZWxlc3MsIGJ1
dCBjYW4gKmFueW9uZSogb24gdGhlIFJETUEgbGlzdCBwcm92aWRlIHNvbWUKPiBjaGFyYWN0ZXJp
emF0aW9uIG9mIHRoZSB0ZXN0LCBzdWNoIGFzIGhvdyBtYW55IHBpbnMgcGVyIHBhZ2UsIHdoYXQg
cGFnZQo+IHNpemVzIGFyZSB1c2VkPyBJJ20gc3RpbGwgaG9waW5nIHRvIHdyaXRlIGEgdGVzdCB0
byB0cmlnZ2VyIHNvbWV0aGluZwo+IGNsb3NlIHRvIHRoaXMuLi4pCj4gCj4gSSBkbyBoYXZlIGEg
Y291cGxlIG1vcmUgaWRlYXMgZm9yIHRlc3QgcnVuczoKPiAKPiAxLiBSZWR1Y2UgR1VQX1BJTl9D
T1VOVElOR19CSUFTIHRvIDEuIFRoYXQgd291bGQgdHVybiB0aGUgd2hvbGUgb3ZlcnJpZGUgb2YK
PiBwYWdlLT5fcmVmY291bnQgaW50byBhIG5vLW9wLCBhbmQgc28gaWYgYWxsIGlzIHdlbGwgKGl0
IG1heSBub3QgYmUhKSB3aXRoIHRoZQo+IHJlc3Qgb2YgdGhlIHBhdGNoLCB0aGVuIHdlJ2QgZXhw
ZWN0IHRoaXMgcHJvYmxlbSB0byBub3QgcmVhcHBlYXIuCj4gCj4gMi4gQWN0aXZlIC9wcm9jL3Zt
c3RhdCAqZm9sbF9waW4qIHN0YXRpc3RpY3MgdW5jb25kaXRpb25hbGx5IChqdXN0IGZvciB0aGVz
ZQo+IHRlc3RzLCBvZiBjb3Vyc2UpLCBzbyB3ZSBjYW4gc2VlIGlmIHRoZXJlIGlzIGEgZ2V0L3B1
dCBtaXNtYXRjaC4gSG93ZXZlciwgdGhhdAo+IHdpbGwgY2hhbmdlIHRoZSB0aW1pbmcsIGFuZCBz
byBpdCBtdXN0IGJlIGF0dGVtcHRlZCBpbmRlcGVuZGVudGx5IG9mICgxKSwgaW4KPiBvcmRlciB0
byBzZWUgaWYgaXQgZW5kcyB1cCBoaWRpbmcgdGhlIHJlcHJvLgo+IAo+IEkndmUgdXBkYXRlZCB0
aGlzIGJyYW5jaCB0byBpbXBsZW1lbnQgKDEpLCBidXQgbm90ICgyKSwgaG9waW5nIHlvdSBjYW4g
Z2l2ZQo+IHRoaXMgb25lIGEgc3Bpbj8KPiAKPiDCoMKgwqAgZ2l0QGdpdGh1Yi5jb206am9obmh1
YmJhcmQvbGludXguZ2l0wqAgcGluX3VzZXJfcGFnZXNfdHJhY2tpbmdfdjExX3dpdGhfZGlhZ3MK
PiAKPiAKCkFsc28sIGxvb2tpbmcgYWhlYWQ6CgphKSBpZiB0aGUgcHJvYmxlbSBkaXNhcHBlYXJz
IHdpdGggdGhlIGxhdGVzdCBhYm92ZSB0ZXN0LCB0aGVuIHdlIGxpa2VseSBoYXZlCiAgIGEgaHVn
ZSBwYWdlIHJlZmNvdW50IG92ZXJmbG93LCBhbmQgdGhlcmUgYXJlIGEgY291cGxlIG9mIGRpZmZl
cmVudCB3YXlzIHRvCiAgIGZpeCBpdC4gCgpiKSBpZiBpdCBzdGlsbCByZXByb2R1Y2VzIHdpdGgg
dGhlIGFib3ZlLCB0aGVuIGl0J3Mgc29tZSBvdGhlciByYW5kb20gbWlzdGFrZSwKICAgYW5kIGlu
IHRoYXQgY2FzZSBJJ2QgYmUgaW5jbGluZWQgdG8gZG8gYSBzb3J0IG9mIGd1aWRlZCAob3IgY2xh
c3NpYywgdW5ndWlkZWQpCiAgIGdpdCBiaXNlY3Qgb2YgdGhlIHNlcmllcy4gQmVjYXVzZSBpdCBj
b3VsZCBiZSBhbnkgb2Ygc2V2ZXJhbCBwYXRjaGVzLgoKICAgSWYgdGhhdCdzIHRvbyBtdWNoIHRy
b3VibGUsIHRoZW4gSSdkIGhhdmUgdG8gZmFsbCBiYWNrIHRvIHN1Ym1pdHRpbmcgYSBmZXcKICAg
cGF0Y2hlcyBhdCBhIHRpbWUgYW5kIHdvcmtpbmcgbXkgd2F5IHVwIHRvIHRoZSB0cmFja2luZyBw
YXRjaC4uLgoKCnRoYW5rcywKLS0gCkpvaG4gSHViYmFyZApOVklESUEKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
