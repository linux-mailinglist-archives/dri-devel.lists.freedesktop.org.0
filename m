Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B07EEFBC4F
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 00:14:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F7916EE94;
	Wed, 13 Nov 2019 23:14:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD5316EE94
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 23:14:48 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dcc8e6b0000>; Wed, 13 Nov 2019 15:14:51 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Wed, 13 Nov 2019 15:14:48 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Wed, 13 Nov 2019 15:14:48 -0800
Received: from [10.2.160.107] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 13 Nov
 2019 23:14:47 +0000
Subject: Re: [PATCH v4 02/23] mm/gup: factor out duplicate code from four
 routines
To: Jan Kara <jack@suse.cz>
References: <20191113042710.3997854-1-jhubbard@nvidia.com>
 <20191113042710.3997854-3-jhubbard@nvidia.com>
 <20191113111521.GI6367@quack2.suse.cz>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <56a575ac-c090-4063-67fc-c6cb24109442@nvidia.com>
Date: Wed, 13 Nov 2019 15:12:02 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191113111521.GI6367@quack2.suse.cz>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1573686891; bh=9LRqaiCXGyssScdgi2q8tAszCMUWmamss75JnSCD7Rw=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=A51eKIWPld+4B5s2mm0c+AftPX6dpBjqpWkYujEzQW8kVLlFqmGjocd27BfsONHAP
 mmPJsbiq51gzeODte2X2C/uPkzYNTjtPJH03F4HVdvsPm9WWyPO3mCuFy2qZ+53ojk
 w6MdkTLmNoJEsvjJ1mHPlZG7UOzdlPWuN7wE/1LLT4AJNdQe+bbFVcAcD30SjuESOC
 HMOwl+XnOLJvxdKZ8WjJigzroAhsM6sSwkk0PcI+BOHfFZzPS0NsqTuAU0nk8z5SAy
 WgcifEMQlIH1QeCvlXON5hCNNd97lHyEHTXJRg5VuAfoyXIGForJZxdZ7GM5/XPnDu
 zIFH0GBGYNRaQ==
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
Cc: Michal Hocko <mhocko@suse.com>, kvm@vger.kernel.org,
 linux-doc@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Dave Chinner <david@fromorbit.com>, dri-devel@lists.freedesktop.org,
 LKML <linux-kernel@vger.kernel.org>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, linux-kselftest@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Christoph Hellwig <hch@lst.de>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 "Aneesh Kumar
 K . V" <aneesh.kumar@linux.ibm.com>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTEvMTMvMTkgMzoxNSBBTSwgSmFuIEthcmEgd3JvdGU6Cj4gT24gVHVlIDEyLTExLTE5IDIw
OjI2OjQ5LCBKb2huIEh1YmJhcmQgd3JvdGU6Cj4+IFRoZXJlIGFyZSBmb3VyIGxvY2F0aW9ucyBp
biBndXAuYyB0aGF0IGhhdmUgYSBmYWlyIGFtb3VudCBvZiBjb2RlCj4+IGR1cGxpY2F0aW9uLiBU
aGlzIG1lYW5zIHRoYXQgY2hhbmdpbmcgb25lIHJlcXVpcmVzIG1ha2luZyB0aGUgc2FtZQo+PiBj
aGFuZ2VzIGluIGZvdXIgcGxhY2VzLCBub3QgdG8gbWVudGlvbiByZWFkaW5nIHRoZSBzYW1lIGNv
ZGUgZm91cgo+PiB0aW1lcywgYW5kIHdvbmRlcmluZyBpZiB0aGVyZSBhcmUgc3VidGxlIGRpZmZl
cmVuY2VzLgo+Pgo+PiBGYWN0b3Igb3V0IHRoZSBjb21tb24gY29kZSBpbnRvIHN0YXRpYyBmdW5j
dGlvbnMsIHRodXMgcmVkdWNpbmcgdGhlCj4+IG92ZXJhbGwgbGluZSBjb3VudCBhbmQgdGhlIGNv
ZGUncyBjb21wbGV4aXR5Lgo+Pgo+PiBBbHNvLCB0YWtlIHRoZSBvcHBvcnR1bml0eSB0byBzbGln
aHRseSBpbXByb3ZlIHRoZSBlZmZpY2llbmN5IG9mIHRoZQo+PiBlcnJvciBjYXNlcywgYnkgZG9p
bmcgYSBtYXNzIHN1YnRyYWN0aW9uIG9mIHRoZSByZWZjb3VudCwgc3Vycm91bmRlZAo+PiBieSBn
ZXRfcGFnZSgpL3B1dF9wYWdlKCkuCj4+Cj4+IEFsc28sIGZ1cnRoZXIgc2ltcGxpZnkgKHNsaWdo
dGx5KSwgYnkgd2FpdGluZyB1bnRpbCB0aGUgdGhlIHN1Y2Nlc3NmdWwKPj4gZW5kIG9mIGVhY2gg
cm91dGluZSwgdG8gaW5jcmVtZW50ICpuci4KPj4KPj4gUmV2aWV3ZWQtYnk6IErDqXLDtG1lIEds
aXNzZSA8amdsaXNzZUByZWRoYXQuY29tPgo+PiBDYzogSXJhIFdlaW55IDxpcmEud2VpbnlAaW50
ZWwuY29tPgo+PiBDYzogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4+IENjOiBBbmVl
c2ggS3VtYXIgSy5WIDxhbmVlc2gua3VtYXJAbGludXguaWJtLmNvbT4KPj4gU2lnbmVkLW9mZi1i
eTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgo+IAo+PiBkaWZmIC0tZ2l0IGEv
bW0vZ3VwLmMgYi9tbS9ndXAuYwo+PiBpbmRleCA4NWNhZjc2YjMwMTIuLjE5OWRhOTllOGZmYyAx
MDA2NDQKPj4gLS0tIGEvbW0vZ3VwLmMKPj4gKysrIGIvbW0vZ3VwLmMKPj4gQEAgLTE5NjksNiAr
MTk2OSwzNCBAQCBzdGF0aWMgaW50IF9fZ3VwX2RldmljZV9odWdlX3B1ZChwdWRfdCBwdWQsIHB1
ZF90ICpwdWRwLCB1bnNpZ25lZCBsb25nIGFkZHIsCj4+ICAgfQo+PiAgICNlbmRpZgo+PiAgIAo+
PiArc3RhdGljIGludCBfX3JlY29yZF9zdWJwYWdlcyhzdHJ1Y3QgcGFnZSAqcGFnZSwgdW5zaWdu
ZWQgbG9uZyBhZGRyLAo+PiArCQkJICAgICB1bnNpZ25lZCBsb25nIGVuZCwgc3RydWN0IHBhZ2Ug
KipwYWdlcywgaW50IG5yKQo+PiArewo+PiArCWludCBucl9yZWNvcmRlZF9wYWdlcyA9IDA7Cj4+
ICsKPj4gKwlkbyB7Cj4+ICsJCXBhZ2VzW25yXSA9IHBhZ2U7Cj4+ICsJCW5yKys7Cj4+ICsJCXBh
Z2UrKzsKPj4gKwkJbnJfcmVjb3JkZWRfcGFnZXMrKzsKPj4gKwl9IHdoaWxlIChhZGRyICs9IFBB
R0VfU0laRSwgYWRkciAhPSBlbmQpOwo+PiArCXJldHVybiBucl9yZWNvcmRlZF9wYWdlczsKPj4g
K30KPiAKPiBXaHkgZG9uJ3QgeW91IHBhc3MgaW4gYWxyZWFkeSBwYWdlcyArIG5yPwoKQWhhLCB0
aGF0IGRvZXMgc2F2ZSBhIGZ1bmN0aW9uIGFyZ3VtZW50LiBXaWxsIGRvLgoKLi4uCj4+ICtzdGF0
aWMgdm9pZCBfX2h1Z2VfcHRfZG9uZShzdHJ1Y3QgcGFnZSAqaGVhZCwgaW50IG5yX3JlY29yZGVk
X3BhZ2VzLCBpbnQgKm5yKQo+PiArewo+PiArCSpuciArPSBucl9yZWNvcmRlZF9wYWdlczsKPj4g
KwlTZXRQYWdlUmVmZXJlbmNlZChoZWFkKTsKPj4gK30KPiAKPiBJIGRvbid0IGZpbmQgdGhpcyBs
YXN0IGhlbHBlciB2ZXJ5IHVzZWZ1bC4gSXQgc2VlbXMgdG8gbXVkZHkgd2F0ZXIgbW9yZQo+IHRo
YW4gbmVjZXNzYXJ5Li4uCgpZZXMsIEkgc3VzcGVjdCBpdCdzIHJhdGhlciB1bmxvdmVkLCBhbmQg
dGhlIGZhY3QgdGhhdCBpdCB3YXMgaGFyZCB0byBhY2N1cmF0ZWx5Cm5hbWUgc2hvdWxkIGhhdmUg
YmVlbiBhIGJpZyBoaW50IHRvIG5vdCBkbyBpdC4gSSdsbCByZW1vdmUgdGhlIGhlbHBlciBhbmQK
cHV0IHRoZSBsaW5lcyBiYWNrIGluIGRpcmVjdGx5LgoKCnRoYW5rcywKLS0gCkpvaG4gSHViYmFy
ZApOVklESUEKCj4gCj4gT3RoZXIgdGhhbiB0aGF0IHRoZSBjbGVhbnVwIGxvb2tzIG5pY2UgdG8g
bWUuCj4gCj4gCQkJCQkJCQlIb256YQo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
