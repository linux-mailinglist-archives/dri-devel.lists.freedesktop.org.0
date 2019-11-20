Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6B11034F8
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 08:17:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18A6D6E05D;
	Wed, 20 Nov 2019 07:17:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 246416E05D
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 07:17:18 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dd4e87e0000>; Tue, 19 Nov 2019 23:17:18 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 19 Nov 2019 23:17:17 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 19 Nov 2019 23:17:17 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 20 Nov
 2019 07:17:16 +0000
Subject: Re: [PATCH v6 17/24] mm/gup: track FOLL_PIN pages
To: Jan Kara <jack@suse.cz>
References: <20191119081643.1866232-1-jhubbard@nvidia.com>
 <20191119081643.1866232-18-jhubbard@nvidia.com>
 <20191119113746.GD25605@quack2.suse.cz>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <92d0385a-90be-e900-e5ec-1eeafd24ff81@nvidia.com>
Date: Tue, 19 Nov 2019 23:17:16 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191119113746.GD25605@quack2.suse.cz>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1574234238; bh=XS1elsnwWY0rNKRca94CapnxJDsibdDqnD818d/G+io=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=cgfFkxVckFKph83JpaLozX1BPV67pcDvc4zYdLq9ggt/6dUFhjSjEUfkPlJ6YS85y
 Tzbfkd2Ssh+1cnbHZVu22ZxAYWyCv1b8X10VXVS5hS2byaCvY0Vg9ipA7x3Fo3odW9
 mJ8QOlZhdrlbORb/tooq8lEuT6AxTt5cVxDPZE9pOLHClbe3whACaJnf15veA5FbxQ
 N7Z3c9PH3VSrAZwjy0whi7ko1Q5RU1C8PJUljAOR0JzSWQ7k8UX3NdOtoVh+QLcZ15
 DmGFCQcpIJbV8FkJKisaDhzEEJcucwABlIhBeXVZln5jK7XEYXo5n/Z8Yardu3zdea
 jFCxWfbFbwpdA==
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

T24gMTEvMTkvMTkgMzozNyBBTSwgSmFuIEthcmEgd3JvdGU6Cj4gT24gVHVlIDE5LTExLTE5IDAw
OjE2OjM2LCBKb2huIEh1YmJhcmQgd3JvdGU6Cj4+IEBAIC0yMDI1LDYgKzIxNDksMjAgQEAgc3Rh
dGljIGludCBfX3JlY29yZF9zdWJwYWdlcyhzdHJ1Y3QgcGFnZSAqcGFnZSwgdW5zaWduZWQgbG9u
ZyBhZGRyLAo+PiAgCXJldHVybiBucjsKPj4gIH0KPj4gIAo+PiArc3RhdGljIGJvb2wgX19waW5f
Y29tcG91bmRfaGVhZChzdHJ1Y3QgcGFnZSAqaGVhZCwgaW50IHJlZnMsIHVuc2lnbmVkIGludCBm
bGFncykKPj4gK3sKPiAKPiBJIGRvbid0IHF1aXRlIGxpa2UgdGhlIHByb2xpZmVyYXRpb24gb2Yg
bmFtZXMgc3RhcnRpbmcgd2l0aCBfXy4gSSBkb24ndAo+IHRoaW5rIHRoZXJlJ3MgYSBnb29kIHJl
YXNvbiBmb3IgdGhhdCwgcGFydGljdWxhcmx5IGluIHRoaXMgY2FzZS4gQWxzbyAncGluJwo+IGhl
cmUgaXMgc29tZXdoYXQgbWlzbGVhZGluZyBhcyB3ZSBhbHJlYWR5IHVzZSB0ZXJtICJwaW4iIGZv
ciB0aGUgcGFydGljdWxhcgo+IHdheSBvZiBwaW5uaW5nIHRoZSBwYWdlLiBXZSBjb3VsZCBoYXZl
IGdyYWJfY29tcG91bmRfaGVhZCgpIG9yIG1heWJlCj4gbmFpbF9jb21wb3VuZF9oZWFkKCkgOiks
IGJ1dCB5b3UncmUgbmF0aXZlIHNwZWFrZXIgc28geW91IG1heSBjb21lIHVwIHdpdGgKPiBiZXR0
ZXIgd29yZC4KCgpZZXMsIGl0IGlzIHVnbHkgbmFtaW5nLCBJJ2xsIGNoYW5nZSB0aGVzZSBhcyBm
b2xsb3dzOgoKICAgIF9fcGluX2NvbXBvdW5kX2hlYWQoKSAtLT4gZ3JhYl9jb21wb3VuZF9oZWFk
KCkgICAgCiAgICBfX3JlY29yZF9zdWJwYWdlcygpICAgLS0+IHJlY29yZF9zdWJwYWdlcygpCgpJ
IGxvdmVkIHRoZSAibmFpbF9jb21wb3VuZF9oZWFkKCkiIHN1Z2dlc3Rpb24sIGl0IGp1c3Qgc2Vl
bXMgdmVyeSB2aXZpZCwgYnV0CmluIHRoZSBlbmQsIEkgZmlndXJlZCBJJ2QgYmV0dGVyIGtlZXAg
aXQgcmVsYXRpdmVseSBkcmFiIGFuZCBjb2xvcmxlc3MuIDopCgo+IAo+PiArCWlmIChmbGFncyAm
IEZPTExfUElOKSB7Cj4+ICsJCWlmICh1bmxpa2VseSghdHJ5X3Bpbl9jb21wb3VuZF9oZWFkKGhl
YWQsIHJlZnMpKSkKPj4gKwkJCXJldHVybiBmYWxzZTsKPj4gKwl9IGVsc2Ugewo+PiArCQloZWFk
ID0gdHJ5X2dldF9jb21wb3VuZF9oZWFkKGhlYWQsIHJlZnMpOwo+PiArCQlpZiAoIWhlYWQpCj4+
ICsJCQlyZXR1cm4gZmFsc2U7Cj4+ICsJfQo+PiArCj4+ICsJcmV0dXJuIHRydWU7Cj4+ICt9Cj4+
ICsKPj4gIHN0YXRpYyB2b2lkIHB1dF9jb21wb3VuZF9oZWFkKHN0cnVjdCBwYWdlICpwYWdlLCBp
bnQgcmVmcykKPj4gIHsKPj4gIAkvKiBEbyBhIGdldF9wYWdlKCkgZmlyc3QsIGluIGNhc2UgcmVm
cyA9PSBwYWdlLT5fcmVmY291bnQgKi8KPiAKPiBwdXRfY29tcG91bmRfaGVhZCgpIG5lZWRzIHNp
bWlsYXIgdHJlYXRtZW50IGFzIHVuZG9fZGV2X3BhZ2VtYXAoKSwgZG9lc24ndAo+IGl0Pwo+IAoK
WWVzLCB3aWxsIGZpeCB0aGF0IHVwLgoKCj4+IEBAIC05NjgsNyArOTczLDE4IEBAIHN0cnVjdCBw
YWdlICpmb2xsb3dfZGV2bWFwX3BtZChzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwgdW5zaWdu
ZWQgbG9uZyBhZGRyLAo+PiAgCWlmICghKnBnbWFwKQo+PiAgCQlyZXR1cm4gRVJSX1BUUigtRUZB
VUxUKTsKPj4gIAlwYWdlID0gcGZuX3RvX3BhZ2UocGZuKTsKPj4gLQlnZXRfcGFnZShwYWdlKTsK
Pj4gKwo+PiArCWlmIChmbGFncyAmIEZPTExfR0VUKQo+PiArCQlnZXRfcGFnZShwYWdlKTsKPj4g
KwllbHNlIGlmIChmbGFncyAmIEZPTExfUElOKSB7Cj4+ICsJCS8qCj4+ICsJCSAqIHRyeV9waW5f
cGFnZSgpIGlzIG5vdCBhY3R1YWxseSBleHBlY3RlZCB0byBmYWlsIGhlcmUgYmVjYXVzZQo+PiAr
CQkgKiB3ZSBob2xkIHRoZSBwbWQgbG9jayBzbyBubyBvbmUgY2FuIHVubWFwIHRoZSBwbWQgYW5k
IGZyZWUgdGhlCj4+ICsJCSAqIHBhZ2UgdGhhdCBpdCBwb2ludHMgdG8uCj4+ICsJCSAqLwo+PiAr
CQlpZiAodW5saWtlbHkoIXRyeV9waW5fcGFnZShwYWdlKSkpCj4+ICsJCQlwYWdlID0gRVJSX1BU
UigtRUZBVUxUKTsKPj4gKwl9Cj4gCj4gVGhpcyBwYXR0ZXJuIGlzIHJhdGhlciBjb21tb24uIFNv
IG1heWJlIEknZCBhZGQgYSBoZWxwZXIgZ3JhYl9wYWdlKHBhZ2UsCj4gZmxhZ3MpIGRvaW5nCj4g
Cj4gCWlmIChmbGFncyAmIEZPTExfR0VUKQo+IAkJZ2V0X3BhZ2UocGFnZSk7Cj4gCWVsc2UgaWYg
KGZsYWdzICYgRk9MTF9QSU4pCj4gCQlyZXR1cm4gdHJ5X3Bpbl9wYWdlKHBhZ2UpOwo+IAlyZXR1
cm4gdHJ1ZTsKPiAKCk9LLgoKPiBPdGhlcndpc2UgdGhlIHBhdGNoIGxvb2tzIGdvb2QgdG8gbWUg
bm93Lgo+IAo+IAkJCQkJCQkJSG9uemEKCkdyZWF0ISBJIHRob3VnaHQgSSdkIGhhdmUgYSB2NyBv
dXQgdG9kYXksIGJ1dCBmYXRlIGRlY2lkZWQgdG8gaGF2ZSBtZSByZXBhaXIKbXkgdGVzdCBtYWNo
aW5lIGluc3RlYWQuIFNvLCBzb29uLiBoYS4gOikKCnRoYW5rcywKLS0gCkpvaG4gSHViYmFyZApO
VklESUEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
