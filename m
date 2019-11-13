Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65907FBC04
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 23:59:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 151E16EE91;
	Wed, 13 Nov 2019 22:59:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24B5D6E0F5
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 22:59:44 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dcc8ade0000>; Wed, 13 Nov 2019 14:59:43 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Wed, 13 Nov 2019 14:59:43 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Wed, 13 Nov 2019 14:59:43 -0800
Received: from [10.2.160.107] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 13 Nov
 2019 22:59:43 +0000
Subject: Re: [PATCH v4 04/23] mm: devmap: refactor 1-based refcounting for
 ZONE_DEVICE pages
To: Dan Williams <dan.j.williams@intel.com>
References: <20191113042710.3997854-1-jhubbard@nvidia.com>
 <20191113042710.3997854-5-jhubbard@nvidia.com>
 <CAPcyv4gGu=G-c1czSAYJ3joTYS_ZYOJ6i9umKzCQEFzpwZMiiA@mail.gmail.com>
 <CAPcyv4hr64b-k4j7ZY796+k-+Dy11REMcvPJ+QjTsyJ3vSdfKg@mail.gmail.com>
 <00148078-1795-da3e-916e-3ae2dcdd553d@nvidia.com>
 <CAPcyv4iwG4V+sNLcOX4x-TA7W8MWNSEaZzupDgKh8btZMytoqg@mail.gmail.com>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <8b887222-a1b4-c5ce-527a-5a6f2a73f943@nvidia.com>
Date: Wed, 13 Nov 2019 14:56:58 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAPcyv4iwG4V+sNLcOX4x-TA7W8MWNSEaZzupDgKh8btZMytoqg@mail.gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1573685983; bh=+Rmtc3S/dpjDCjZWKcpDoRZBPDTDBQ2pKKlWpjZisAo=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=mYe+MJkxrgNR137Q2ejzje6pRuep2M18oTZCivJor/Aq8akkqynarSLzze5gBAR6e
 Qbgg3D7fCX2h5Zp1bm8UCD5jTXu5RgNW/1wytp5sIWhpcH1/XVit7/Hqo1FuECTgjG
 jaeg32K4uRKA3UWevFbdUUXyjiUNrk/AfZUXltrSNK7fGabRHXeRaGFfre96i3rq7X
 ouT4NLlcMG8uUv2YW1+St8ZRhZhMfIq0xvEzPkblzu397MrZASgjNbz6jsR8uW1MwV
 7mOV3InoZ3RXAMS6XnUTdXbtUPhzTvW8KfaZYgbYIJ5ILNS37evrPk9qlwTKM1SE3y
 Yu1anxljvu1OQ==
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
 Ralph Campbell <rcampbell@nvidia.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Linux MM <linux-mm@kvack.org>, Paul
 Mackerras <paulus@samba.org>, linux-kselftest@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma <linux-rdma@vger.kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 "Linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Shuah Khan <shuah@kernel.org>, linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 Netdev <netdev@vger.kernel.org>, Alex Williamson <alex.williamson@redhat.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTEvMTMvMTkgMjo1NSBQTSwgRGFuIFdpbGxpYW1zIHdyb3RlOgo+IE9uIFdlZCwgTm92IDEz
LCAyMDE5IGF0IDI6NDkgUE0gSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPiB3cm90
ZToKPj4KPj4gT24gMTEvMTMvMTkgMjowMCBQTSwgRGFuIFdpbGxpYW1zIHdyb3RlOgo+PiAuLi4K
Pj4+PiBVZ2gsIHdoZW4gZGlkIGFsbCB0aGlzIEhNTSBzcGVjaWZpYyBtYW5pcHVsYXRpb24gc25l
YWsgaW50byB0aGUKPj4+PiBnZW5lcmljIFpPTkVfREVWSUNFIHBhdGg/IEl0IHVzZWQgdG8gYmUg
Z2F0ZWQgYnkgcGdtYXAgdHlwZSB3aXRoIGl0cwo+Pj4+IG93biBwdXRfem9uZV9kZXZpY2VfcHJp
dmF0ZV9wYWdlKCkuIEZvciBleGFtcGxlIGl0J3MgY2VydGFpbmx5Cj4+Pj4gdW5uZWNlc3Nhcnkg
YW5kIG1pZ2h0IGJlIGJyb2tlbiAod291bGQgbmVlZCB0byBjaGVjaykgdG8gY2FsbAo+Pj4+IG1l
bV9jZ3JvdXBfdW5jaGFyZ2UoKSBvbiBhIERBWCBwYWdlLiBaT05FX0RFVklDRSB1c2VycyBhcmUg
bm90IGEKPj4+PiBtb25vbGl0aCBhbmQgdGhlIEhNTSB1c2UgY2FzZSBsZWFrcyBwYWdlcyBpbnRv
IGNvZGUgcGF0aHMgdGhhdCBEQVgKPj4+PiBleHBsaWNpdGx5IGF2b2lkcy4KPj4+Cj4+PiBJdCdz
IGJlZW4gdGhpcyB3YXkgZm9yIGEgd2hpbGUgYW5kIEkgZGlkIG5vdCByZWFjdCBwcmV2aW91c2x5
LAo+Pj4gYXBvbG9naWVzIGZvciB0aGF0LiBJIHRoaW5rIF9fQ2xlYXJQYWdlQWN0aXZlLCBfX0Ns
ZWFyUGFnZVdhaXRlcnMsIGFuZAo+Pj4gbWVtX2Nncm91cF91bmNoYXJnZSwgYmVsb25nIGJlaGlu
ZCBhIGRldmljZS1wcml2YXRlIGNvbmRpdGlvbmFsLiBUaGUKPj4+IGhpc3RvcnkgaGVyZSBpczoK
Pj4+Cj4+PiBNb3ZlIHNvbWUsIGJ1dCBub3QgYWxsIEhNTSBzcGVjaWZpY3MgdG8gaG1tX2Rldm1l
bV9mcmVlKCk6Cj4+PiAgICAgICAyZmExNDdiZGJmNjcgbW0sIGRldl9wYWdlbWFwOiBEbyBub3Qg
Y2xlYXIgLT5tYXBwaW5nIG9uIGZpbmFsIHB1dAo+Pj4KPj4+IFJlbW92ZSB0aGUgY2xlYXJpbmcg
b2YgbWFwcGluZyBzaW5jZSBubyB1cHN0cmVhbSBjb25zdW1lcnMgbmVlZGVkIGl0Ogo+Pj4gICAg
ICAgYjdhNTIzMTA5ZmI1IG1tOiBkb24ndCBjbGVhciAtPm1hcHBpbmcgaW4gaG1tX2Rldm1lbV9m
cmVlCj4+Pgo+Pj4gQWRkIGl0IGJhY2sgaW4gb25jZSBhbiB1cHN0cmVhbSBjb25zdW1lciBhcnJp
dmVkOgo+Pj4gICAgICAgN2FiMGFkMGU3NGY4IG1tL2htbTogZml4IFpPTkVfREVWSUNFIGFub24g
cGFnZSBtYXBwaW5nIHJldXNlCj4+Pgo+Pj4gV2UncmUgbm93IGFsbW9zdCBlbnRpcmVseSBmcmVl
IG9mIC0+cGFnZV9mcmVlIGNhbGxiYWNrcyBleGNlcHQgZm9yCj4+PiB0aGF0IHdlaXJkIG5vdXZl
YXUgY2FzZSwgY2FuIHRoYXQgRklYTUUgaW4gbm91dmVhdV9kbWVtX3BhZ2VfZnJlZSgpCj4+PiBh
bHNvIHJlc3VsdCBpbiBraWxsaW5nIHRoZSAtPnBhZ2VfZnJlZSgpIGNhbGxiYWNrIGFsdG9nZXRo
ZXI/IEluIHRoZQo+Pj4gbWVhbnRpbWUgSSdtIHByb3Bvc2luZyBhIGNsZWFudXAgbGlrZSB0aGlz
Ogo+Pgo+Pgo+PiBPSywgYXNzdW1pbmcgdGhpcyBpcyBhY2NlcHRhYmxlIChubyBvYnZpb3VzIHBy
b2JsZW1zIGp1bXAgb3V0IGF0IG1lLAo+PiBhbmQgd2UgY2FuIGFsc28gdGVzdCBpdCB3aXRoIEhN
TSksIHRoZW4gaG93IHdvdWxkIHlvdSBsaWtlIHRvIHByb2NlZWQsIGFzCj4+IGZhciBhcyBwYXRj
aGVzIGdvOiBhZGQgc3VjaCBhIHBhdGNoIGFzIHBhcnQgb2YgdGhpcyBzZXJpZXMgaGVyZSwgb3Ig
YXMgYQo+PiBzdGFuZC1hbG9uZSBwYXRjaCBlaXRoZXIgYmVmb3JlIG9yIGFmdGVyIHRoaXMgc2Vy
aWVzPyBPciBzb21ldGhpbmcgZWxzZT8KPj4gQW5kIGRpZCB5b3UgcGxhbiBvbiBzZW5kaW5nIGl0
IG91dCBhcyBzdWNoPwo+IAo+IEkgdGhpbmsgaXQgbWFrZXMgc2Vuc2UgdG8gaW5jbHVkZSBpdCBp
biB5b3VyIHNlcmllcyBzaW5jZSB5b3UncmUKPiBsb29raW5nIHRvIHJlZmFjdG9yIHRoZSBpbXBs
ZW1lbnRhdGlvbi4gSSBjYW4gc2VuZCB5b3Ugb25lIGJhc2VkIG9uCj4gY3VycmVudCBsaW51eC1u
ZXh0IGFzIGEgbGVhZC1pbiBjbGVhbnVwIGJlZm9yZSB0aGUgcmVmYWN0b3IuIERvZXMgdGhhdAo+
IHdvcmsgZm9yIHlvdT8KPiAKClRoYXQgd291bGQgYmUgcGVyZmVjdCEKCj4+Cj4+IEFsc28sIHRo
ZSBkaWZmcyBkaWRuJ3QgcXVpdGUgbWFrZSBpdCB0aHJvdWdoIGludGFjdCB0byBteSAiZ2l0IGFw
cGx5Iiwgc28KPj4gSSdtIHJlLXBvc3RpbmcgdGhlIGRpZmYgaW4gaG9wZXMgdGhhdCB0aGlzIHRp
bWUgaXQgc3Vydml2ZXM6Cj4gCj4gQXBvbG9naWVzIGZvciB0aGF0LiBGb3IgcXVpY2sgImhvdyBh
Ym91dCB0aGlzIiBwYXRjaCBleGFtcGxlcywgSSBqdXN0Cj4gY29weSBhbmQgcGFzdGUgaW50byBn
bWFpbCBhbmQgaXQgc29tZXRpbWVzIGNsb2JiZXJzIGl0Lgo+IAoKTm8gcHJvYmxlbSBhdCBhbGws
IEkgZG8gdGhlIHNhbWUgdGhpbmcgYW5kICp1c3VhbGx5KiBpdCB3b3Jrcy4gaGEuIEFuZAphcyB5
b3Ugc2F5LCBpdCdzIGdvb2QgZW5vdWdoIGZvciBkaXNjdXNzaW9ucy4KCgp0aGFua3MsCi0tIApK
b2huIEh1YmJhcmQKTlZJRElBCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
