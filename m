Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E20A8135A
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 09:35:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F25D46E29C;
	Mon,  5 Aug 2019 07:34:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D3916EF55;
 Fri,  2 Aug 2019 19:15:48 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d448be40000>; Fri, 02 Aug 2019 12:15:49 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Fri, 02 Aug 2019 12:15:47 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Fri, 02 Aug 2019 12:15:47 -0700
Received: from [10.2.171.217] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 2 Aug
 2019 19:15:46 +0000
Subject: Re: [PATCH 00/34] put_user_pages(): miscellaneous call sites
To: Jan Kara <jack@suse.cz>, Matthew Wilcox <willy@infradead.org>
References: <20190802022005.5117-1-jhubbard@nvidia.com>
 <20190802091244.GD6461@dhcp22.suse.cz>
 <20190802124146.GL25064@quack2.suse.cz>
 <20190802142443.GB5597@bombadil.infradead.org>
 <20190802145227.GQ25064@quack2.suse.cz>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <076e7826-67a5-4829-aae2-2b90f302cebd@nvidia.com>
Date: Fri, 2 Aug 2019 12:14:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190802145227.GQ25064@quack2.suse.cz>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Approved-At: Mon, 05 Aug 2019 07:34:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1564773349; bh=Ykr8zuBl8qD6qRk+6CuJmCvWs6y/6SnwmHdkeYBJDDI=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=dIZIhWEtL/6DtZGzemgJsDJsVLyADAMaN//lJ1grJLFkCmFOkzTj/rs0FvLfEl2Hi
 oGzaotnI6n/OU/9zhZLMfdrrUHRJGxX7AYLyG2WZvgX4Lg54c2pU4PjbkWrNUgOXfI
 uv8TTyv/DF3hYu24iq7PnVxsiQftZ7SHYqoH7NBkU536G72MURkyt2TZuU0HsMwqx1
 3Glf+aCLRqZtZbMei0ZGioStTFz2Vyclh08xm02uGWhgBmLM1you/SeWFTun4O+4QV
 968ZBWSTwuYIseJKnsPYve06ID75kz8N2rJE61L933vzLxD+Ru7sU6sLx/7LpcpGPg
 O3OFkZJZEBCjA==
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
Cc: linux-fbdev@vger.kernel.org, kvm@vger.kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, sparclinux@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Dan Williams <dan.j.williams@intel.com>,
 devel@driverdev.osuosl.org, rds-devel@oss.oracle.com,
 linux-rdma@vger.kernel.org, x86@kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 john.hubbard@gmail.com, linux-block@vger.kernel.org,
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

T24gOC8yLzE5IDc6NTIgQU0sIEphbiBLYXJhIHdyb3RlOgo+IE9uIEZyaSAwMi0wOC0xOSAwNzoy
NDo0MywgTWF0dGhldyBXaWxjb3ggd3JvdGU6Cj4+IE9uIEZyaSwgQXVnIDAyLCAyMDE5IGF0IDAy
OjQxOjQ2UE0gKzAyMDAsIEphbiBLYXJhIHdyb3RlOgo+Pj4gT24gRnJpIDAyLTA4LTE5IDExOjEy
OjQ0LCBNaWNoYWwgSG9ja28gd3JvdGU6Cj4+Pj4gT24gVGh1IDAxLTA4LTE5IDE5OjE5OjMxLCBq
b2huLmh1YmJhcmRAZ21haWwuY29tIHdyb3RlOgo+Pj4+IFsuLi5dCj4+Pj4+IDIpIENvbnZlcnQg
YWxsIG9mIHRoZSBjYWxsIHNpdGVzIGZvciBnZXRfdXNlcl9wYWdlcyooKSwgdG8KPj4+Pj4gaW52
b2tlIHB1dF91c2VyX3BhZ2UqKCksIGluc3RlYWQgb2YgcHV0X3BhZ2UoKS4gVGhpcyBpbnZvbHZl
cyBkb3plbnMgb2YKPj4+Pj4gY2FsbCBzaXRlcywgYW5kIHdpbGwgdGFrZSBzb21lIHRpbWUuCj4+
Pj4KPj4+PiBIb3cgZG8gd2UgbWFrZSBzdXJlIHRoaXMgaXMgdGhlIGNhc2UgYW5kIGl0IHdpbGwg
cmVtYWluIHRoZSBjYXNlIGluIHRoZQo+Pj4+IGZ1dHVyZT8gVGhlcmUgbXVzdCBiZSBzb21lIGF1
dG9tYWdpYyB0byBlbmZvcmNlL2NoZWNrIHRoYXQuIEl0IGlzIHNpbXBseQo+Pj4+IG5vdCBtYW5h
Z2VhYmxlIHRvIGRvIGl0IGV2ZXJ5IG5vdyBhbmQgdGhlbiBiZWNhdXNlIHRoZW4gMykgd2lsbCBz
aW1wbHkKPj4+PiBiZSBuZXZlciBzYWZlLgo+Pj4+Cj4+Pj4gSGF2ZSB5b3UgY29uc2lkZXJlZCBj
b2NjaW5lbGUgb3Igc29tZSBvdGhlciBzY3JpcHRlZCB3YXkgdG8gZG8gdGhlCj4+Pj4gdHJhbnNp
dGlvbj8gSSBoYXZlIG5vIGlkZWEgaG93IHRvIGRlYWwgd2l0aCBmdXR1cmUgY2hhbmdlcyB0aGF0
IHdvdWxkCj4+Pj4gYnJlYWsgdGhlIGJhbGFuY2UgdGhvdWdoLgoKSGkgTWljaGFsLAoKWWVzLCBJ
J3ZlIHRob3VnaHQgYWJvdXQgaXQsIGFuZCBjb2NjaW5lbGxlIGZhbGxzIGEgYml0IHNob3J0IChp
dCdzIG5vdCBzbWFydAplbm91Z2ggdG8ga25vdyB3aGljaCBwdXRfcGFnZSgpJ3MgdG8gY29udmVy
dCkuIEhvd2V2ZXIsIHRoZXJlIGlzIGEgZGVidWcKb3B0aW9uIHBsYW5uZWQ6IGEgeWV0LXRvLWJl
LXBvc3RlZCBjb21taXQgWzFdIHVzZXMgc3RydWN0IHBhZ2UgZXh0ZW5zaW9ucwoob2J2aW91c2x5
IHByb3RlY3RlZCBieSBDT05GSUdfREVCVUdfR0VUX1VTRVJfUEFHRVNfUkVGRVJFTkNFUykgdG8g
YWRkCmEgcmVkdW5kYW50IGNvdW50ZXIuIFRoYXQgYWxsb3dzOgoKdm9pZCBfX3B1dF9wYWdlKHN0
cnVjdCBwYWdlICpwYWdlKQp7CgkuLi4KCS8qIFNvbWVvbmUgY2FsbGVkIHB1dF9wYWdlKCkgaW5z
dGVhZCBvZiBwdXRfdXNlcl9wYWdlKCkgKi8KCVdBUk5fT05fT05DRShhdG9taWNfcmVhZCgmcGFn
ZV9leHQtPnBpbl9jb3VudCkgPiAwKTsKCj4+Pgo+Pj4gWWVhaCwgdGhhdCdzIHdoeSBJJ3ZlIGJl
ZW4gc3VnZ2VzdGluZyBhdCBMU0YvTU0gdGhhdCB3ZSBtYXkgbmVlZCB0byBjcmVhdGUKPj4+IGEg
Z3VwIHdyYXBwZXIgLSBzYXkgdmFkZHJfcGluX3BhZ2VzKCkgLSBhbmQgdHJhY2sgd2hpY2ggc2l0
ZXMgZHJvcHBpbmcKPj4+IHJlZmVyZW5jZXMgZ290IGNvbnZlcnRlZCBieSB1c2luZyB0aGlzIHdy
YXBwZXIgaW5zdGVhZCBvZiBndXAuIFRoZQo+Pj4gY291bnRlcnBhcnQgd291bGQgdGhlbiBiZSBt
b3JlIGxvZ2ljYWxseSBuYW1lZCBhcyB1bnBpbl9wYWdlKCkgb3Igd2hhdGV2ZXIKPj4+IGluc3Rl
YWQgb2YgcHV0X3VzZXJfcGFnZSgpLiAgU3VyZSB0aGlzIGlzIG5vdCBjb21wbGV0ZWx5IGZvb2xw
cm9vZiAoeW91IGNhbgo+Pj4gY3JlYXRlIG5ldyBjYWxsc2l0ZSB1c2luZyB2YWRkcl9waW5fcGFn
ZXMoKSBhbmQgdGhlbiBqdXN0IGRyb3AgcmVmcyB1c2luZwo+Pj4gcHV0X3BhZ2UoKSkgYnV0IEkg
c3VwcG9zZSBpdCB3b3VsZCBiZSBhIGhpZ2ggZW5vdWdoIGJhcnJpZXIgZm9yIG1pc3NlZAo+Pj4g
Y29udmVyc2lvbnMuLi4gVGhvdWdodHM/CgpUaGUgZGVidWcgb3B0aW9uIGFib3ZlIGlzIHN0aWxs
IGEgYml0IHNpbXBsaXN0aWMgaW4gaXRzIGltcGxlbWVudGF0aW9uIChhbmQgbWF5YmUKbm90IHRh
a2luZyBmdWxsIGFkdmFudGFnZSBvZiB0aGUgZGF0YSBpdCBoYXMpLCBidXQgSSB0aGluayBpdCdz
IHByZWZlcmFibGUsCmJlY2F1c2UgaXQgbW9uaXRvcnMgdGhlICJjb3JlIiBhbmQgV0FSTnMuCgpJ
bnN0ZWFkIG9mIHRoZSB3cmFwcGVyLCBJJ20gdGhpbmtpbmc6IGRvY3VtZW50YXRpb24gYW5kIHRo
ZSBwYXNzYWdlIG9mIHRpbWUsCnBsdXMgdGhlIGRlYnVnIG9wdGlvbiAocGVyaGFwcyBlbmhhbmNl
ZC0tcHJvYmFibHkgb25jZSBJIHBvc3QgaXQgc29tZW9uZSB3aWxsCm5vdGljZSBvcHBvcnR1bml0
aWVzKSwgeWVzPwoKPj4KPj4gSSB0aGluayB0aGUgQVBJIHdlIHJlYWxseSBuZWVkIGlzIGdldF91
c2VyX2J2ZWMoKSAvIHB1dF91c2VyX2J2ZWMoKSwKPj4gYW5kIEkga25vdyBDaHJpc3RvcGggaGFz
IGJlZW4gcHV0dGluZyBzb21lIHdvcmsgaW50byB0aGF0LiAgVGhhdCBhdm9pZHMKPj4gZG9pbmcg
cmVmY291bnQgb3BlcmF0aW9ucyBvbiBodW5kcmVkcyBvZiBwYWdlcyBpZiB0aGUgcGFnZSBpbiBx
dWVzdGlvbiBpcwo+PiBhIGh1Z2UgcGFnZS4gIE9uY2UgcGVvcGxlIGFyZSBzd2l0Y2hlZCBvdmVy
IHRvIHRoYXQsIHRoZXkgd29uJ3QgYmUgdGVtcHRlZAo+PiB0byBtYW51YWxseSBjYWxsIHB1dF9w
YWdlKCkgb24gdGhlIGluZGl2aWR1YWwgY29uc3RpdHVlbnQgcGFnZXMgb2YgYSBidmVjLgo+IAo+
IFdlbGwsIGdldF91c2VyX2J2ZWMoKSBpcyBjZXJ0YWlubHkgYSBnb29kIEFQSSBmb3Igb25lIGNs
YXNzIG9mIHVzZXJzIGJ1dAo+IGp1c3QgbG9va2luZyBhdCB0aGUgYWJvdmUgc2VyaWVzLCB5b3Un
bGwgc2VlIHRoZXJlIGFyZSAqbWFueSogcGxhY2VzIHRoYXQKPiBqdXN0IGRvbid0IHdvcmsgd2l0
aCBidmVjcyBhdCBhbGwgYW5kIHlvdSBuZWVkIHNvbWV0aGluZyBmb3IgdGhvc2UuCj4gCgpZZXMs
IHRoZXJlIGFyZSBxdWl0ZSBhIGZldyBwbGFjZXMgdGhhdCBkb24ndCBpbnZvbHZlIF9idmVjLCBh
cyB3ZSBjYW4gc2VlCnJpZ2h0IGhlcmUuIFNvIHdlIG5lZWQgc29tZXRoaW5nLiBBbmRyZXcgYXNr
ZWQgZm9yIGEgZGVidWcgb3B0aW9uIHNvbWUgdGltZQphZ28sIGFuZCBzZXZlcmFsIHBlb3BsZSAo
RGF2ZSBIYW5zZW4sIERhbiBXaWxsaWFtcywgSmVyb21lKSBoYWQgdGhlIGlkZWEKb2Ygdm1hcC1p
bmcgZ3VwIHBhZ2VzIHNlcGFyYXRlbHksIHNvIHlvdSBjYW4gZGVmaW5pdGVseSB0ZWxsIHdoZXJl
IGVhY2gKcGFnZSBjYW1lIGZyb20uIEknbSBob3Bpbmcgbm90IHRvIGhhdmUgdG8gZ28gdG8gdGhh
dCBsZXZlbCBvZiBjb21wbGV4aXR5CnRob3VnaC4KCgpbMV0gIm1tL2d1cDogZGVidWcgdHJhY2tp
bmcgb2YgZ2V0X3VzZXJfcGFnZXMoKSByZWZlcmVuY2VzIiA6Cmh0dHBzOi8vZ2l0aHViLmNvbS9q
b2huaHViYmFyZC9saW51eC9jb21taXQvMjFmZjdkNjE2MWVjMmExNGQzZjlkMTdjOThhYmIwMGNj
OTY5ZDRkNgoKdGhhbmtzLAotLSAKSm9obiBIdWJiYXJkCk5WSURJQQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
