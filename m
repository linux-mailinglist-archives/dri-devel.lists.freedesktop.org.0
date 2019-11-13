Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 294B3FA336
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 03:09:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A2776EC5B;
	Wed, 13 Nov 2019 02:09:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AF046EC5B
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 02:09:10 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dcb65c50002>; Tue, 12 Nov 2019 18:09:09 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Tue, 12 Nov 2019 18:09:09 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Tue, 12 Nov 2019 18:09:09 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 13 Nov
 2019 02:09:09 +0000
Subject: Re: [PATCH v3 08/23] vfio, mm: fix get_user_pages_remote() and
 FOLL_LONGTERM
To: Dan Williams <dan.j.williams@intel.com>
References: <20191112000700.3455038-1-jhubbard@nvidia.com>
 <20191112000700.3455038-9-jhubbard@nvidia.com>
 <20191112204338.GE5584@ziepe.ca>
 <0db36e86-b779-01af-77e7-469af2a2e19c@nvidia.com>
 <CAPcyv4hAEgw6ySNS+EFRS4yNRVGz9A3Fu1vOk=XtpjYC64kQJw@mail.gmail.com>
 <20191112234250.GA19615@ziepe.ca>
 <CAPcyv4hwFKmsQpp04rS6diCmZwGtbnriCjfY2ofWV485qT9kzg@mail.gmail.com>
 <28355eb0-4ee5-3418-b430-59302d15b478@nvidia.com>
 <CAPcyv4hdYZ__3+KJHh+0uX--f-U=pLiZfdO0JDhyBE-nZ=i4FQ@mail.gmail.com>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <c6f035f5-8290-2bc0-a645-d63e3a47f588@nvidia.com>
Date: Tue, 12 Nov 2019 18:09:08 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAPcyv4hdYZ__3+KJHh+0uX--f-U=pLiZfdO0JDhyBE-nZ=i4FQ@mail.gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1573610949; bh=B6pkyHmGh6yhjKCidrVzgID/vhDeCAvfXP4nK4Pk4sU=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=RV5dPXEXGk2wPs6itxn+ysd+tryNIcHtFe7cNPEDa6fUJR+mqhDFmpWJh1cxUznfM
 u/dSVfFdxe/eLLU3UZJsFyG0KQve3tMf4SbX/eLAZ3PsvXvDC9d9Vo1jj5Z6rn0Yor
 1EXyMK0mBMr99qCD9+AZ++P4gO+L3VPJHPXksjDueAgSTRvM0AvLDqBIchBRO93HWN
 flXai7XrgmMwanL4FueloUnCWoIRpUo5voQGwqOd0jdXOidJNNwAYlQZLipkiht6xZ
 1PIwF7tPrWLfM+J/GXeR6mCfSxY22FrqYpx7yQ6peaaRvxPNUSU6UqLCTPNv27OnhW
 6xjI9w2mLclog==
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
 KVM list <kvm@vger.kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>, linux-kselftest@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma <linux-rdma@vger.kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 "Linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Shuah Khan <shuah@kernel.org>, linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 bpf@vger.kernel.org, Magnus Karlsson <magnus.karlsson@intel.com>,
 Jens Axboe <axboe@kernel.dk>, Netdev <netdev@vger.kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTEvMTIvMTkgNTozNSBQTSwgRGFuIFdpbGxpYW1zIHdyb3RlOgo+IE9uIFR1ZSwgTm92IDEy
LCAyMDE5IGF0IDU6MDggUE0gSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPiB3cm90
ZToKPj4KPj4gT24gMTEvMTIvMTkgNDo1OCBQTSwgRGFuIFdpbGxpYW1zIHdyb3RlOgo+PiAuLi4K
Pj4+Pj4gSXQncyBub3QgcmVkdW5kYW50IHJlbGF0aXZlIHRvIHVwc3RyZWFtIHdoaWNoIGRvZXMg
bm90IGRvIGFueXRoaW5nIHRoZQo+Pj4+PiBGT0xMX0xPTkdURVJNIGluIHRoZSBndXAtc2xvdyBw
YXRoLi4uIGJ1dCBJIGhhdmUgbm90IGxvb2tlZCBhdCBwYXRjaGVzCj4+Pj4+IDEtNyB0byBzZWUg
aWYgc29tZXRoaW5nIHRoZXJlIG1hZGUgaXQgcmVkdW5kYW50Lgo+Pj4+Cj4+Pj4gT2gsIHRoZSBo
dW5rIEpvaG4gaGFkIGJlbG93IGZvciBnZXRfdXNlcl9wYWdlc19yZW1vdGUoKSBhbHNvIG5lZWRz
IHRvCj4+Pj4gY2FsbCBfX2d1cF9sb25ndGVybV9sb2NrZWQoKSB3aGVuIEZPTExfTE9OR1RFUk0g
aXMgc3BlY2lmaWVkLCB0aGVuCj4+Pj4gdGhhdCBjYWxscyBjaGVja19kYXhfdm1hcygpIHdoaWNo
IGR1cGxpY2F0ZXMgdGhlIHZtYV9pc19mc2RheCgpIGNoZWNrCj4+Pj4gYWJvdmUuCj4+Pgo+Pj4g
T2ggdHJ1ZSwgZ29vZCBleWUuIEl0IGlzIHJlZHVuZGFudCBpZiBpdCBkb2VzIGFkZGl0aW9uYWxs
eSBjYWxsCj4+PiBfX2d1cF9sb25ndGVybV9sb2NrZWQoKSwgYW5kIGl0IG5lZWRzIHRvIGRvIHRo
YXQgb3RoZXJ3aXNlcyBpdCB1bmRvZXMKPj4+IHRoZSBDTUEgbWlncmF0aW9uIG1hZ2ljIHRoYXQg
QW5lZXNoIGFkZGVkLgo+Pj4KPj4KPj4gT0suIFNvIGp1c3QgdG8gYmUgY2xlYXIsIEknbGwgYmUg
cmVtb3ZpbmcgdGhpcyBmcm9tIHRoZSBwYXRjaDoKPj4KPj4gICAgICAgICAvKgo+PiAgICAgICAg
ICAqIFRoZSBsaWZldGltZSBvZiBhIHZhZGRyX2dldF9wZm4oKSBwYWdlIHBpbiBpcwo+PiAgICAg
ICAgICAqIHVzZXJzcGFjZS1jb250cm9sbGVkLiBJbiB0aGUgZnMtZGF4IGNhc2UgdGhpcyBjb3Vs
ZAo+PiAgICAgICAgICAqIGxlYWQgdG8gaW5kZWZpbml0ZSBzdGFsbHMgaW4gZmlsZXN5c3RlbSBv
cGVyYXRpb25zLgo+PiAgICAgICAgICAqIERpc2FsbG93IGF0dGVtcHRzIHRvIHBpbiBmcy1kYXgg
cGFnZXMgdmlhIHRoaXMKPj4gICAgICAgICAgKiBpbnRlcmZhY2UuCj4+ICAgICAgICAgICovCj4+
ICAgICAgICAgaWYgKHJldCA+IDAgJiYgdm1hX2lzX2ZzZGF4KHZtYXNbMF0pKSB7Cj4+ICAgICAg
ICAgICAgICAgICByZXQgPSAtRU9QTk9UU1VQUDsKPj4gICAgICAgICAgICAgICAgIHB1dF9wYWdl
KHBhZ2VbMF0pOwo+PiAgICAgICAgIH0KPj4KPj4gKGFuZCB0aGUgZGVjbGFyYXRpb24gb2YgInZt
YXMiLCBhcyB3ZWxsKS4KPiAKPiAuLi5hbmQgYWRkIGEgY2FsbCB0byBfX2d1cF9sb25ndGVybV9s
b2NrZWQgaW50ZXJuYWwgdG8KPiBnZXRfdXNlcl9wYWdlc19yZW1vdGUoKSwgcmlnaHQ/Cj4gCgpZ
ZXMsIGFuZCB0aGFua3MgZm9yIGRvdWJsZS1jaGVja2luZy4gSSB0aGluayBJIGdvdCBhIGxpdHRs
ZSBkaXp6eSBmb2xsb3dpbmcKdGhlIGNhbGwgc3RhY2sgdGhlcmUuIDopICBBbmQgbm93IEkgc2Vl
IHRoYXQgdGhpcyBhbHNvIGFmZmVjdHMgdGhlCmltcGxlbWVudGF0aW9uIG9mIHBpbl9sb25ndGVy
bV9wYWdlc19yZW1vdGUoKSwgYmVjYXVzZSB0aGF0IHdpbGwgbmVlZCB0aGUKc2FtZSBsb2dpYyB0
aGF0IGdldF91c2VyX3BhZ2VzX3JlbW90ZSgpIGhhcy4gCgoKCnRoYW5rcywKLS0gCkpvaG4gSHVi
YmFyZApOVklESUEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
