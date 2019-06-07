Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EC13A5D0
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jun 2019 14:56:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96D228945A;
	Sun,  9 Jun 2019 12:55:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06DB6899F2;
 Fri,  7 Jun 2019 20:49:08 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5cfacdc20001>; Fri, 07 Jun 2019 13:49:06 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Fri, 07 Jun 2019 13:49:08 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Fri, 07 Jun 2019 13:49:08 -0700
Received: from rcampbell-dev.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 7 Jun
 2019 20:49:06 +0000
Subject: Re: [PATCH v2 hmm 10/11] mm/hmm: Do not use list*_rcu() for
 hmm->ranges
To: Jason Gunthorpe <jgg@ziepe.ca>, Jerome Glisse <jglisse@redhat.com>, "John
 Hubbard" <jhubbard@nvidia.com>, <Felix.Kuehling@amd.com>
References: <20190606184438.31646-1-jgg@ziepe.ca>
 <20190606184438.31646-11-jgg@ziepe.ca>
X-Nvconfidentiality: public
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <57cf91db-bebe-24f0-29c3-64274f10d10b@nvidia.com>
Date: Fri, 7 Jun 2019 13:49:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.0
MIME-Version: 1.0
In-Reply-To: <20190606184438.31646-11-jgg@ziepe.ca>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL108.nvidia.com (172.18.146.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Approved-At: Sun, 09 Jun 2019 12:54:17 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1559940546; bh=oGeyU71GSCfi4k4k8mSueh4JEltagVCe/KlNbvsSutg=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=UJz2Qt1QfanMEhOyt/3R/g2DHXV8MDxZ8h5tNqHZXgifBkiWanoofMHj0WGWGojU3
 r7hVfwPkjuzgQD7LU06bneMH68aqOd5ZgdE2TfB1EmRGNULUoGCRnsfVCsdcub+iS1
 03SomttNcSlu+bgApB2KFIb/oMQ8U6aQKkg+bakwP+c+sQwjrKCDv8TUTDpkPUHIMr
 sGnkKrGR06RJOx8WxR7boji2N9rK6vQxJGwimzGESBTMzTX7Rla6rzRRhoGVTpbSc+
 pJlxWklk2KTdXTtn3LcrHxzebmMdPEOIuDL28O14ysFKMaSnkp4n1nQImnJoYkwMRl
 ITLcdbPEakgYg==
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, linux-rdma@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-mm@kvack.org,
 Jason Gunthorpe <jgg@mellanox.com>, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDYvNi8xOSAxMTo0NCBBTSwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+IEZyb206IEphc29u
IEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4KPiAKPiBUaGlzIGxpc3QgaXMgYWx3YXlzIHJl
YWQgYW5kIHdyaXR0ZW4gd2hpbGUgaG9sZGluZyBobW0tPmxvY2sgc28gdGhlcmUgaXMKPiBubyBu
ZWVkIGZvciB0aGUgY29uZnVzaW5nIF9yY3UgYW5ub3RhdGlvbnMuCj4gCj4gU2lnbmVkLW9mZi1i
eTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgo+IFJldmlld2VkLWJ5OiBKw6ly
w7RtZSBHbGlzc2UgPGpnbGlzc2VAcmVkaGF0LmNvbT4KClJldmlld2VkLWJ5OiBSYWxwaCBDYW1w
YmVsbCA8cmNhbXBiZWxsQG52aWRpYS5jb20+Cgo+IC0tLQo+ICAgbW0vaG1tLmMgfCA0ICsrLS0K
PiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhL21tL2htbS5jIGIvbW0vaG1tLmMKPiBpbmRleCBjMmZlY2IzZWNiMTFlMS4u
NzA5ZDEzOGRkNDkwMjcgMTAwNjQ0Cj4gLS0tIGEvbW0vaG1tLmMKPiArKysgYi9tbS9obW0uYwo+
IEBAIC05MTEsNyArOTExLDcgQEAgaW50IGhtbV9yYW5nZV9yZWdpc3RlcihzdHJ1Y3QgaG1tX3Jh
bmdlICpyYW5nZSwKPiAgIAltdXRleF9sb2NrKCZobW0tPmxvY2spOwo+ICAgCj4gICAJcmFuZ2Ut
PmhtbSA9IGhtbTsKPiAtCWxpc3RfYWRkX3JjdSgmcmFuZ2UtPmxpc3QsICZobW0tPnJhbmdlcyk7
Cj4gKwlsaXN0X2FkZCgmcmFuZ2UtPmxpc3QsICZobW0tPnJhbmdlcyk7Cj4gICAKPiAgIAkvKgo+
ICAgCSAqIElmIHRoZXJlIGFyZSBhbnkgY29uY3VycmVudCBub3RpZmllcnMgd2UgaGF2ZSB0byB3
YWl0IGZvciB0aGVtIGZvcgo+IEBAIC05NDEsNyArOTQxLDcgQEAgdm9pZCBobW1fcmFuZ2VfdW5y
ZWdpc3RlcihzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSkKPiAgIAkJcmV0dXJuOwo+ICAgCj4gICAJ
bXV0ZXhfbG9jaygmaG1tLT5sb2NrKTsKPiAtCWxpc3RfZGVsX3JjdSgmcmFuZ2UtPmxpc3QpOwo+
ICsJbGlzdF9kZWwoJnJhbmdlLT5saXN0KTsKPiAgIAltdXRleF91bmxvY2soJmhtbS0+bG9jayk7
Cj4gICAKPiAgIAkvKiBEcm9wIHJlZmVyZW5jZSB0YWtlbiBieSBobW1fcmFuZ2VfcmVnaXN0ZXIo
KSAqLwo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
