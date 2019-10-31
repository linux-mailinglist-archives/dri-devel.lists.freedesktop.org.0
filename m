Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86EFAEBEEC
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 09:10:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88A466F750;
	Fri,  1 Nov 2019 08:09:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FAF86F69A
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2019 23:43:18 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dbb719b0000>; Thu, 31 Oct 2019 16:43:23 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 31 Oct 2019 16:43:17 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 31 Oct 2019 16:43:17 -0700
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 31 Oct
 2019 23:43:17 +0000
Subject: Re: [PATCH 05/19] mm/gup: introduce pin_user_pages*() and FOLL_PIN
To: Ira Weiny <ira.weiny@intel.com>
References: <20191030224930.3990755-1-jhubbard@nvidia.com>
 <20191030224930.3990755-6-jhubbard@nvidia.com>
 <20191031231503.GF14771@iweiny-DESK2.sc.intel.com>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <f37f7727-4e19-2488-4db8-91feb72ace12@nvidia.com>
Date: Thu, 31 Oct 2019 16:43:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191031231503.GF14771@iweiny-DESK2.sc.intel.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Approved-At: Fri, 01 Nov 2019 08:09:55 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1572565404; bh=PrJ35wWczmWpdy8SkgccuWUsoQYieyO1GnA2qpEHC/A=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=jdmRTzxkMV9CoXYSBfQkRrB505DxRkvKsmMjhxtic/4rnjw1uyev4QUJ7n2T77ngS
 u9KDHACIs4qVEll4SSVMVTw6yYHxGih9FVdVEWMfhPVvgei5+sXlJlE8ei89BTA0YT
 1UQ7Tze6RtKHpvOUcoCGjgdlMZFneyrguVffaQgJmE5/2dSPP5EZ+W+GJ2tm109Me8
 pSU4R6u79kUNv1QXeOTrE8zTZU16eT0k2FBBXk/PiWwKZ/3SeXektKB8iNqiz8oFHG
 A0cIy6n8aFK8h1IDbs5nvzh4lo0n9DMlYT3NFxJOwoK+uEmdsGN0kC8J/DGP/krRts
 BqTCeIqEnO+5Q==
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
 kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, linux-block@vger.kernel.org,
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

T24gMTAvMzEvMTkgNDoxNSBQTSwgSXJhIFdlaW55IHdyb3RlOgo+IE9uIFdlZCwgT2N0IDMwLCAy
MDE5IGF0IDAzOjQ5OjE2UE0gLTA3MDAsIEpvaG4gSHViYmFyZCB3cm90ZToKLi4uCj4+ICsgKiBG
T0xMX1BJTiBpbmRpY2F0ZXMgdGhhdCBhIHNwZWNpYWwga2luZCBvZiB0cmFja2luZyAobm90IGp1
c3QgcGFnZS0+X3JlZmNvdW50LAo+PiArICogYnV0IGFuIGFkZGl0aW9uYWwgcGluIGNvdW50aW5n
IHN5c3RlbSkgd2lsbCBiZSBpbnZva2VkLiBUaGlzIGlzIGludGVuZGVkIGZvcgo+PiArICogYW55
dGhpbmcgdGhhdCBnZXRzIGEgcGFnZSByZWZlcmVuY2UgYW5kIHRoZW4gdG91Y2hlcyBwYWdlIGRh
dGEgKGZvciBleGFtcGxlLAo+PiArICogRGlyZWN0IElPKS4gVGhpcyBsZXRzIHRoZSBmaWxlc3lz
dGVtIGtub3cgdGhhdCBzb21lIG5vbi1maWxlLXN5c3RlbSBlbnRpdHkgaXMKPj4gKyAqIHBvdGVu
dGlhbGx5IGNoYW5naW5nIHRoZSBwYWdlcycgZGF0YS4gSW4gY29udHJhc3QgdG8gRk9MTF9HRVQg
KHdob3NlIHBhZ2VzCj4+ICsgKiBhcmUgcmVsZWFzZWQgdmlhIHB1dF9wYWdlKCkpLCBGT0xMX1BJ
TiBwYWdlcyBtdXN0IGJlIHJlbGVhc2VkLCB1bHRpbWF0ZWx5LCBieQo+PiArICogYSBjYWxsIHRv
IHB1dF91c2VyX3BhZ2UoKS4KPj4gKyAqCj4+ICsgKiBGT0xMX1BJTiBpcyBzaW1pbGFyIHRvIEZP
TExfR0VUOiBib3RoIG9mIHRoZXNlIHBpbiBwYWdlcy4gVGhleSB1c2UgZGlmZmVyZW50Cj4+ICsg
KiBhbmQgc2VwYXJhdGUgcmVmY291bnRpbmcgbWVjaGFuaXNtcywgaG93ZXZlciwgYW5kIHRoYXQg
bWVhbnMgdGhhdCBlYWNoIGhhcwo+PiArICogaXRzIG93biBhY3F1aXJlIGFuZCByZWxlYXNlIG1l
Y2hhbmlzbXM6Cj4+ICsgKgo+PiArICogICAgIEZPTExfR0VUOiBnZXRfdXNlcl9wYWdlcyooKSB0
byBhY3F1aXJlLCBhbmQgcHV0X3BhZ2UoKSB0byByZWxlYXNlLgo+PiArICoKPj4gKyAqICAgICBG
T0xMX1BJTjogcGluX3VzZXJfcGFnZXMqKCkgb3IgcGluX2xvbmd0ZXJtX3BhZ2VzKigpIHRvIGFj
cXVpcmUsIGFuZAo+PiArICogICAgICAgICAgICAgICBwdXRfdXNlcl9wYWdlcyB0byByZWxlYXNl
Lgo+PiArICoKPj4gKyAqIEZPTExfUElOIGFuZCBGT0xMX0dFVCBhcmUgbXV0dWFsbHkgZXhjbHVz
aXZlLgo+IAo+IFlvdSBtZWFuIHRoZSBmbGFncyBhcmUgbXV0dWFsbHkgZXhjbHVzaXZlIGZvciBh
bnkgc2luZ2xlIGNhbGwsIGNvcnJlY3Q/Cj4gQmVjYXVzZSBteSBmaXJzdCB0aG91Z2h0IHdhcyB0
aGF0IHlvdSBtZWFudCB0aGF0IGEgcGFnZSB3aGljaCB3YXMgcGluJ2VkIGNhbid0Cj4gYmUgImdv
dCIuICBXaGljaCBJIGRvbid0IHRoaW5rIGlzIHRydWUgb3IgbmVjZXNzYXJ5Li4uCgpZZXMsIHlv
dSBhcmUgY29ycmVjdC4gQW5kIHllcyB5b3UgY2FuIGFic29sdXRlbHkgbWl4IGdldF91c2VyX3Bh
Z2VzKCkgYW5kIApwaW5fdXNlcl9wYWdlcygpIGNhbGxzIG9uIHRoZSBzYW1lIHBhZ2UocykuCgpP
SywgSSdsbCBjaGFuZ2UgdGhlIHdvcmRpbmcgdG8gIm11dHVhbGx5IGV4Y2x1c2l2ZSBmb3IgYSBn
aXZlbiBmdW5jdGlvbiBjYWxsIi4KCj4gCj4+ICsgKgo+PiArICogUGxlYXNlIHNlZSBEb2N1bWVu
dGF0aW9uL3ZtL3Bpbl91c2VyX3BhZ2VzLnJzdCBmb3IgbW9yZSBpbmZvcm1hdGlvbi4KPiAKPiBO
SVQ6IEkgdGhpbmsgd2Ugc2hvdWxkIGluY2x1ZGUgdGhpcyBmaWxlIGFzIHBhcnQgb2YgdGhpcyBw
YXRjaC4uLgoKaGVoLiBJIGtlcHQgaG9wcGluZyBiYWNrIGFuZCBmb3J0aCBvbiB0aGlzLCBiZWNh
dXNlIEkndmUgc2VlbiBvdGhlciBwYXRjaHNldHMgdGhhdApvZnRlbiBwdXQgRG9jdW1lbnRhdGlv
bi8gaW50byBpdHMgb3duIHBhdGNoLiBCdXQgeW91J3JlIHJpZ2h0LCBvZiBjb3Vyc2U6IGl0J3MK
bm90IHJpZ2h0IHRvIHJlZmVyIHRvIGl0ZW1zIHRoYXQgYXJlIG5vdCBoZXJlIHVudGlsIGEgbGF0
ZXIgcGF0Y2guIEknbGwgbWVyZ2UKcGF0Y2ggMTkgaW50byB0aGlzIG9uZSwgdGhlbi4KCi4uLgo+
PiBAQCAtMTYwMywxMSArMTYzMCwyNSBAQCBzdGF0aWMgX19hbHdheXNfaW5saW5lIGxvbmcgX19n
dXBfbG9uZ3Rlcm1fbG9ja2VkKHN0cnVjdCB0YXNrX3N0cnVjdCAqdHNrLAo+PiAgICogYW5kIG1t
IGJlaW5nIG9wZXJhdGVkIG9uIGFyZSB0aGUgY3VycmVudCB0YXNrJ3MgYW5kIGRvbid0IGFsbG93
Cj4+ICAgKiBwYXNzaW5nIG9mIGEgbG9ja2VkIHBhcmFtZXRlci4gIFdlIGFsc28gb2J2aW91c2x5
IGRvbid0IHBhc3MKPj4gICAqIEZPTExfUkVNT1RFIGluIGhlcmUuCj4+ICsgKgo+PiArICogQSBu
b3RlIG9uIGd1cF9mbGFnczogRk9MTF9QSU4gc2hvdWxkIG9ubHkgYmUgc2V0IGludGVybmFsbHkg
YnkgdGhlCj4+ICsgKiBwaW5fdXNlcl9wYWdlKigpIGFuZCBwaW5fbG9uZ3Rlcm1fKigpIEFQSXMs
IG5ldmVyIGRpcmVjdGx5IGJ5IHRoZSBjYWxsZXIuCj4+ICsgKiBUaGF0J3MgaW4gb3JkZXIgdG8g
aGVscCBhdm9pZCBtaXNtYXRjaGVzIHdoZW4gcmVsZWFzaW5nIHBhZ2VzOgo+PiArICogZ2V0X3Vz
ZXJfcGFnZXMqKCkgcGFnZXMgbXVzdCBiZSByZWxlYXNlZCB2aWEgcHV0X3BhZ2UoKSwgd2hpbGUK
Pj4gKyAqIHBpbl91c2VyX3BhZ2VzKigpIHBhZ2VzIG11c3QgYmUgcmVsZWFzZWQgdmlhIHB1dF91
c2VyX3BhZ2UoKS4KPiAKPiBSYXRoZXIgdGhhbiBwdXQgdGhpcyBoZXJlIHNob3VsZCB3ZSBwdXQg
aXQgbmV4dCB0byB0aGUgZGVmaW5pdGlvbiBvZiBGT0xMX1BJTj8KPiBCZWNhdXNlIG5vdyB3ZSBo
YXZlIHRoaXMgdGV4dCAyeC4uLiAgOi0vCj4gCgpPSywgSSdsbCBtb3ZlIGl0IHVwIG5leHQgdG8g
Rk9MTF9QSU4sIGFuZCBnZXQgcmlkIG9mIHRoZSAyeCBwbGFjZXMgaW4gZ3VwLmMKCgouLi4KPj4g
K2xvbmcgcGluX2xvbmd0ZXJtX3BhZ2VzX3JlbW90ZShzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRzaywg
c3RydWN0IG1tX3N0cnVjdCAqbW0sCj4+ICsJCQkgICAgICAgdW5zaWduZWQgbG9uZyBzdGFydCwg
dW5zaWduZWQgbG9uZyBucl9wYWdlcywKPj4gKwkJCSAgICAgICB1bnNpZ25lZCBpbnQgZ3VwX2Zs
YWdzLCBzdHJ1Y3QgcGFnZSAqKnBhZ2VzLAo+PiArCQkJICAgICAgIHN0cnVjdCB2bV9hcmVhX3N0
cnVjdCAqKnZtYXMsIGludCAqbG9ja2VkKQo+PiArewo+PiArCS8qIEZPTExfR0VUIGFuZCBGT0xM
X1BJTiBhcmUgbXV0dWFsbHkgZXhjbHVzaXZlLiAqLwo+PiArCWlmIChXQVJOX09OX09OQ0UoZ3Vw
X2ZsYWdzICYgRk9MTF9HRVQpKQo+PiArCQlyZXR1cm4gLUVJTlZBTDsKPj4gKwo+PiArCS8qCj4+
ICsJICogRklYTUU6IGFzIG5vdGVkIGluIHRoZSBnZXRfdXNlcl9wYWdlc19yZW1vdGUoKSBpbXBs
ZW1lbnRhdGlvbiwgaXQKPj4gKwkgKiBpcyBub3QgeWV0IHBvc3NpYmxlIHRvIHNhZmVseSBzZXQg
Rk9MTF9MT05HVEVSTSBoZXJlLiBGT0xMX0xPTkdURVJNCj4+ICsJICogbmVlZHMgdG8gYmUgc2V0
LCBidXQgZm9yIG5vdyB0aGUgYmVzdCB3ZSBjYW4gZG8gaXMgYSAiVE9ETyIgaXRlbS4KPj4gKwkg
Ki8KPiAKPiBXYWl0PyAgV2h5IGNhbid0IHdlIHNldCBGT0xMX0xPTkdURVJNIGhlcmU/ICBwaW5f
KiBhcmUgbmV3IGNhbGxzIHdoaWNoIGFyZSBub3QKPiB1c2VkIHlldCByaWdodD8KCk5vcGUsIG5v
dCBxdWl0ZSEgU2VlIHBhdGNoICMxNCAoInZmaW8sIG1tOiBwaW5fbG9uZ3Rlcm1fcGFnZXMgKEZP
TExfUElOKSBhbmQgCnB1dF91c2VyX3BhZ2UoKSBjb252ZXJzaW9uIiksIGluIHdoaWNoIEknbSBj
b252ZXJ0aW5nIGFuIGV4aXN0aW5nIApnZXRfdXNlcl9wYWdlc19yZW1vdGUoKSBjYWxsZXIuCgo+
IAo+IFlvdSBzZXQgaXQgaW4gdGhlIG90aGVyIG5ldyBwaW5fKiBmdW5jdGlvbnM/Cj4gCgpZZXMg
SSBkaWQuIEJlY2F1c2UgdGhvc2Ugd29yayBhbHJlYWR5IGluIHRoZWlyIGd1cCgpIGNvdW50ZXJw
YXJ0cy4KCnRoYW5rcywKCkpvaG4gSHViYmFyZApOVklESUEKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
