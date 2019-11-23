Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2D9107C2D
	for <lists+dri-devel@lfdr.de>; Sat, 23 Nov 2019 01:54:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECA566F595;
	Sat, 23 Nov 2019 00:54:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C8F26F595;
 Sat, 23 Nov 2019 00:54:12 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dd883360002>; Fri, 22 Nov 2019 16:54:14 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Fri, 22 Nov 2019 16:54:11 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Fri, 22 Nov 2019 16:54:11 -0800
Received: from rcampbell-dev.nvidia.com (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Sat, 23 Nov 2019 00:54:09 +0000
Subject: Re: [PATCH v3 02/14] mm/mmu_notifier: add an interval tree notifier
To: Jason Gunthorpe <jgg@mellanox.com>, Christoph Hellwig <hch@infradead.org>
References: <20191112202231.3856-1-jgg@ziepe.ca>
 <20191112202231.3856-3-jgg@ziepe.ca> <20191113135952.GB20531@infradead.org>
 <20191113164620.GG21728@mellanox.com>
X-Nvconfidentiality: public
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <cc5d4d76-df30-af7f-931c-eed8a7ada122@nvidia.com>
Date: Fri, 22 Nov 2019 16:54:08 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20191113164620.GG21728@mellanox.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1574470455; bh=bqXekT37QvQAiJj5unYfuv1fXYv5e9H7W3TE2f93DwM=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=GMQ2nBly/CsGkp3ClF3KTIJ1E88XFlogU0CKPbHKGfneOIgU32/QzyXGWCpi3ck0H
 UKmUjmgchhEpox9obaO4j3qQTTw6eSQygxCGNnxcaBK+BVpFaWRZVbrcittwqkbErs
 WJejHNJfQFwe6vLEnMD7C7HfZFs1YXQJh9yBGuilTWYTnXvxIDNykws8BWZk+SAp+S
 d+PBZV9+4/p5SkfIZLXh92wH6ivVMDsbJ2ewuKYIY2bfdn7qLRuC5hVl19t8Vx8dG/
 mVxeh0/CSHrPHgSQLh5+W8xVMKh8hIouqwSbqQwT0va/zbM7kkP01A2Fu3LxQSm5r1
 PfohngEf3JGCQ==
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
Cc: Juergen Gross <jgross@suse.com>,
 Mike Marciniszyn <mike.marciniszyn@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Philip Yang <Philip.Yang@amd.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 John Hubbard <jhubbard@nvidia.com>,
 "Felix.Kuehling@amd.com" <Felix.Kuehling@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jerome Glisse <jglisse@redhat.com>,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Petr Cvek <petrcvekcz@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDExLzEzLzE5IDg6NDYgQU0sIEphc29uIEd1bnRob3JwZSB3cm90ZToKPiBPbiBXZWQsIE5v
diAxMywgMjAxOSBhdCAwNTo1OTo1MkFNIC0wODAwLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToK
Pj4+ICtpbnQgbW11X2ludGVydmFsX25vdGlmaWVyX2luc2VydChzdHJ1Y3QgbW11X2ludGVydmFs
X25vdGlmaWVyICptbmksCj4+PiArCQkJCSAgICAgIHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCB1bnNp
Z25lZCBsb25nIHN0YXJ0LAo+Pj4gKwkJCQkgICAgICB1bnNpZ25lZCBsb25nIGxlbmd0aCwKPj4+
ICsJCQkJICAgICAgY29uc3Qgc3RydWN0IG1tdV9pbnRlcnZhbF9ub3RpZmllcl9vcHMgKm9wcyk7
Cj4+PiAraW50IG1tdV9pbnRlcnZhbF9ub3RpZmllcl9pbnNlcnRfbG9ja2VkKAo+Pj4gKwlzdHJ1
Y3QgbW11X2ludGVydmFsX25vdGlmaWVyICptbmksIHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLAo+Pj4g
Kwl1bnNpZ25lZCBsb25nIHN0YXJ0LCB1bnNpZ25lZCBsb25nIGxlbmd0aCwKPj4+ICsJY29uc3Qg
c3RydWN0IG1tdV9pbnRlcnZhbF9ub3RpZmllcl9vcHMgKm9wcyk7Cj4+Cj4+IFZlcnkgaW5jb25z
aXN0ZW50IGluZGVudGF0aW9uIGJldHdlZW4gdGhlc2UgdHdvIHJlbGF0ZWQgZnVuY3Rpb25zLgo+
IAo+IGNsYW5nLWZvcm1hdC4uIFRoZSBrZXJuZWwgY29uZmlnIGlzIHNldCB0byBwcmVmZXIgYSBs
aW5lIHVwIHVuZGVyIHRoZQo+ICggaWYgYWxsIHRoZSBhcmd1bWVudHMgd2lsbCBmaXQgd2l0aGlu
IHRoZSA4MCBjb2xzIG90aGVyd2lzZSBpdCBkb2VzIGEKPiAxIHRhYiBjb250aW51YXRpb24gaW5k
ZW50Lgo+IAo+Pj4gKwkvKgo+Pj4gKwkgKiBUaGUgaW52X2VuZCBpbmNvcnBvcmF0ZXMgYSBkZWZl
cnJlZCBtZWNoYW5pc20gbGlrZQo+Pj4gKwkgKiBydG5sX3VubG9jaygpLiBBZGRzIGFuZCByZW1v
dmVzIGFyZSBxdWV1ZWQgdW50aWwgdGhlIGZpbmFsIGludl9lbmQKPj4+ICsJICogaGFwcGVucyB0
aGVuIHRoZXkgYXJlIHByb2dyZXNzZWQuIFRoaXMgYXJyYW5nZW1lbnQgZm9yIHRyZWUgdXBkYXRl
cwo+Pj4gKwkgKiBpcyB1c2VkIHRvIGF2b2lkIHVzaW5nIGEgYmxvY2tpbmcgbG9jayBkdXJpbmcK
Pj4+ICsJICogaW52YWxpZGF0ZV9yYW5nZV9zdGFydC4KPj4KPj4gTml0cGljazogIFRoYXQgY29t
bWVudCBjYW4gYmUgY29uZGVuc2VkIGludG8gb25lIGxlc3MgbGluZToKPiAKPiBUaGUgcnRubF91
bmxvY2sgY2FuIG1vdmUgdXAgYSBsaW5lIHRvby4gTXkgZWRpdG9yIGlzIGZhaWxpbmcgbWUgb24K
PiB0aGlzLgo+IAo+Pj4gKwkvKgo+Pj4gKwkgKiBUT0RPOiBTaW5jZSB3ZSBhbHJlYWR5IGhhdmUg
YSBzcGlubG9jayBhYm92ZSwgdGhpcyB3b3VsZCBiZSBmYXN0ZXIKPj4+ICsJICogYXMgd2FrZV91
cF9xCj4+PiArCSAqLwo+Pj4gKwlpZiAobmVlZF93YWtlKQo+Pj4gKwkJd2FrZV91cF9hbGwoJm1t
bl9tbS0+d3EpOwo+Pgo+PiBTbyB3aHkgaXMgdGhpcyBpbXBvcnRhbnQgZW5vdWdoIGZvciBhIFRP
RE8gY29tbWVudCwgYnV0IG5vdCBpbXBvcnRhbnQKPj4gZW5vdWdoIHRvIGRvIHJpZ2h0IGF3YXk/
Cj4gCj4gTGV0cyBkcm9wIHRoZSBjb21tZW50LCBJJ20gbm90byBzdXJlIHdha2VfdXBfcSBpcyBl
dmVuIGEgZnVuY3Rpb24gdGhpcwo+IGxheWVyIHNob3VsZCBiZSBjYWxsaW5nLgoKQWN0dWFsbHks
IEkgdGhpbmsgeW91IGNhbiByZW1vdmUgdGhlICJuZWVkX3dha2UiIHZhcmlhYmxlIHNpbmNlIGl0
IGlzCnVuY29uZGl0aW9uYWxseSBzZXQgdG8gInRydWUiLgoKQWxzbywgdGhlIGNvbW1lbnQgaW5f
X21tdV9pbnRlcnZhbF9ub3RpZmllcl9pbnNlcnQoKSBzYXlzCiJtbmktPm1yX2ludmFsaWRhdGVf
c2VxIiBhbmQgSSB0aGluayB0aGF0IHNob3VsZCBiZQoibW5pLT5pbnZhbGlkYXRlX3NlcSIuCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
