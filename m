Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A66CA1094C3
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2019 21:47:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A19716E059;
	Mon, 25 Nov 2019 20:47:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B0C389C21
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2019 20:46:58 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ddc3dc40000>; Mon, 25 Nov 2019 12:47:00 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 25 Nov 2019 12:46:58 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 25 Nov 2019 12:46:58 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 25 Nov
 2019 20:46:57 +0000
Subject: Re: [PATCH 17/19] powerpc: book3s64: convert to pin_user_pages() and
 put_user_page()
To: Jan Kara <jack@suse.cz>
References: <20191125042011.3002372-1-jhubbard@nvidia.com>
 <20191125042011.3002372-18-jhubbard@nvidia.com>
 <20191125085915.GB1797@quack2.suse.cz>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <9abfd0bf-ffb9-9fad-848c-caff4a490773@nvidia.com>
Date: Mon, 25 Nov 2019 12:46:56 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191125085915.GB1797@quack2.suse.cz>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1574714820; bh=7Gmrre2tneNEWRU9G5+DIn5rrxtRLBtJ55Uj7bfaWRw=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=Vc2WP6DAAbNZStXBl+ln2+kB/EuUuvRZHzMpZNW80Fm3ZctGnvM4O+tZRCgS3669B
 /qldmeczkVi9pQJMXYF/4i2XGVt4Gm+gOJ/tFv/RnDb4dopV+tz5b0cyQc9YOTVtBS
 P/yYNUzd4pjDhuvvDyZmybC/J7abTjT/ntYJJMbyGr8NCKnGXhEtDqS5T7TKRE2hwU
 dbPgyN9eu9VXPtG/lD5Uk37zf69kjzXTl/JkUlunTht14kOdHqRRRORI90fFcZ/kGC
 NFhCuK40TfQ4yRLkmLaKp7qlIx6xeGOy5CzKXKx/3W33foWMDjA/xuDpoO/15JsFQy
 0FiT0Aycu6K+g==
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
 Ira Weiny <ira.weiny@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-block@vger.kernel.org,
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

T24gMTEvMjUvMTkgMTI6NTkgQU0sIEphbiBLYXJhIHdyb3RlOgo+IE9uIFN1biAyNC0xMS0xOSAy
MDoyMDowOSwgSm9obiBIdWJiYXJkIHdyb3RlOgo+PiAxLiBDb252ZXJ0IGZyb20gZ2V0X3VzZXJf
cGFnZXMoKSB0byBwaW5fdXNlcl9wYWdlcygpLgo+Pgo+PiAyLiBBcyByZXF1aXJlZCBieSBwaW5f
dXNlcl9wYWdlcygpLCByZWxlYXNlIHRoZXNlIHBhZ2VzIHZpYQo+PiBwdXRfdXNlcl9wYWdlKCku
IEluIHRoaXMgY2FzZSwgZG8gc28gdmlhIHB1dF91c2VyX3BhZ2VzX2RpcnR5X2xvY2soKS4KPj4K
Pj4gVGhhdCBoYXMgdGhlIHNpZGUgZWZmZWN0IG9mIGNhbGxpbmcgc2V0X3BhZ2VfZGlydHlfbG9j
aygpLCBpbnN0ZWFkCj4+IG9mIHNldF9wYWdlX2RpcnR5KCkuIFRoaXMgaXMgcHJvYmFibHkgbW9y
ZSBhY2N1cmF0ZS4KPj4KPj4gQXMgQ2hyaXN0b3BoIEhlbGx3aWcgcHV0IGl0LCAic2V0X3BhZ2Vf
ZGlydHkoKSBpcyBvbmx5IHNhZmUgaWYgd2UgYXJlCj4+IGRlYWxpbmcgd2l0aCBhIGZpbGUgYmFj
a2VkIHBhZ2Ugd2hlcmUgd2UgaGF2ZSByZWZlcmVuY2Ugb24gdGhlIGlub2RlIGl0Cj4+IGhhbmdz
IG9mZi4iIFsxXQo+Pgo+PiAzLiBSZWxlYXNlIGVhY2ggcGFnZSBpbiBtZW0tPmhwYWdlc1tdIChp
bnN0ZWFkIG9mIG1lbS0+aHBhc1tdKSwgYmVjYXVzZQo+PiB0aGF0IGlzIHRoZSBhcnJheSB0aGF0
IHBpbl9sb25ndGVybV9wYWdlcygpIGZpbGxlZCBpbi4gVGhpcyBpcyBtb3JlCj4+IGFjY3VyYXRl
IGFuZCBzaG91bGQgYmUgYSBsaXR0bGUgc2FmZXIgZnJvbSBhIG1haW50ZW5hbmNlIHBvaW50IG9m
Cj4+IHZpZXcuCj4gCj4gRXhjZXB0IHRoYXQgdGhpcyBicmVha3MgdGhlIGNvZGUuIGhwYWdlcyBp
cyB1bmlvbmVkIHdpdGggaHBhcy4uLgo+IAoKT0suIAoKPj4gQEAgLTIxMiwxMCArMjExLDkgQEAg
c3RhdGljIHZvaWQgbW1faW9tbXVfdW5waW4oc3RydWN0IG1tX2lvbW11X3RhYmxlX2dyb3VwX21l
bV90ICptZW0pCj4+ICAJCWlmICghcGFnZSkKPj4gIAkJCWNvbnRpbnVlOwo+PiAgCj4+IC0JCWlm
IChtZW0tPmhwYXNbaV0gJiBNTV9JT01NVV9UQUJMRV9HUk9VUF9QQUdFX0RJUlRZKQo+PiAtCQkJ
U2V0UGFnZURpcnR5KHBhZ2UpOwo+PiArCQlwdXRfdXNlcl9wYWdlc19kaXJ0eV9sb2NrKCZtZW0t
PmhwYWdlc1tpXSwgMSwKPj4gKwkJCQkJICBNTV9JT01NVV9UQUJMRV9HUk9VUF9QQUdFX0RJUlRZ
KTsKPiAKPiBBbmQgdGhlIGRpcnR5aW5nIGNvbmRpdGlvbiBpcyB3cm9uZyBoZXJlIGFzIHdlbGwu
IEN1cnJlbnRseSBpdCBpcyBhbHdheXMKPiB0cnVlLgo+IAo+IAkJCQkJCQkJSG9uemEKPiAKClll
cy4gRml4ZWQgdXAgbG9jYWxseS4gVGhlIGZ1bmN0aW9uIG5vdyBsb29rcyBsaWtlIHRoaXMgKGZv
ciB0aGlzIHBhdGNoLCBub3QgZm9yCnRoZSBlbnRpcmUgc2VyaWVzLCB3aGljaCByZW5hbWVzICJw
dXQiIHRvICJ1bnBpbiIpOgoKCnN0YXRpYyB2b2lkIG1tX2lvbW11X3VucGluKHN0cnVjdCBtbV9p
b21tdV90YWJsZV9ncm91cF9tZW1fdCAqbWVtKQp7Cglsb25nIGk7CglzdHJ1Y3QgcGFnZSAqcGFn
ZSA9IE5VTEw7CgoJaWYgKCFtZW0tPmhwYXMpCgkJcmV0dXJuOwoKCWZvciAoaSA9IDA7IGkgPCBt
ZW0tPmVudHJpZXM7ICsraSkgewoJCWlmICghbWVtLT5ocGFzW2ldKQoJCQljb250aW51ZTsKCgkJ
cGFnZSA9IHBmbl90b19wYWdlKG1lbS0+aHBhc1tpXSA+PiBQQUdFX1NISUZUKTsKCQlpZiAoIXBh
Z2UpCgkJCWNvbnRpbnVlOwoKCQlwdXRfdXNlcl9wYWdlc19kaXJ0eV9sb2NrKCZwYWdlLCAxLAoJ
CQkJbWVtLT5ocGFzW2ldICYgTU1fSU9NTVVfVEFCTEVfR1JPVVBfUEFHRV9ESVJUWSk7CgoJCW1l
bS0+aHBhc1tpXSA9IDA7Cgl9Cn0KCnRoYW5rcywKLS0gCkpvaG4gSHViYmFyZApOVklESUEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
