Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEEDA5DE78
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2019 09:13:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 411F66E0D3;
	Wed,  3 Jul 2019 07:13:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D830898EE;
 Tue,  2 Jul 2019 20:11:33 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d1bba730000>; Tue, 02 Jul 2019 13:11:31 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 02 Jul 2019 13:11:32 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 02 Jul 2019 13:11:32 -0700
Received: from rcampbell-dev.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 2 Jul
 2019 20:11:28 +0000
Subject: Re: [RFC] mm/hmm: pass mmu_notifier_range to
 sync_cpu_device_pagetables
To: Jason Gunthorpe <jgg@mellanox.com>, Christoph Hellwig <hch@lst.de>
References: <20190608001452.7922-1-rcampbell@nvidia.com>
 <20190702195317.GT31718@mellanox.com>
X-Nvconfidentiality: public
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <b0252869-588f-0333-1878-1f90b8b0c17b@nvidia.com>
Date: Tue, 2 Jul 2019 13:11:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190702195317.GT31718@mellanox.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Approved-At: Wed, 03 Jul 2019 07:13:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1562098291; bh=pJF5x4345qO6YQIaFfIRkH4NCd5wxJwRshnLYN1SQEs=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=IUcePnf0Csnlm1B5f0YiScyxFBIq1oVLcXkX1R9Dzr/JAedpYocU+1YoARltFSzXL
 iLdan7eOA9VcM2WT0J99ARUqKv5co1QJpNjVJxlyi6VrWEaAa0ctcAejwHVY5FPzkK
 6qPdataKyAZrPuuUre4m/2Ync8rx0qmtlLizKB0GuEBNOc7D6cSYMtShRnxwP6YfbL
 3wiZCF40d0ZkSYRtNGF6wQbfuTiye4gz/az2kzjXcRQxdB6y8stFF9aKIkrjk41ZR6
 r8/YZuQpFxYBeyEUBl5MVMoyTkBxn2IdZdr2j6jfNvfE62puz7tcnkRFcL9kLfVfv5
 5CgD7awfl1YKw==
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
Cc: Andrea Arcangeli <aarcange@redhat.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 John Hubbard <jhubbard@nvidia.com>,
 "Felix.Kuehling@amd.com" <Felix.Kuehling@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jerome Glisse <jglisse@redhat.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDcvMi8xOSAxMjo1MyBQTSwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+IE9uIEZyaSwgSnVu
IDA3LCAyMDE5IGF0IDA1OjE0OjUyUE0gLTA3MDAsIFJhbHBoIENhbXBiZWxsIHdyb3RlOgo+PiBI
TU0gZGVmaW5lcyBpdHMgb3duIHN0cnVjdCBobW1fdXBkYXRlIHdoaWNoIGlzIHBhc3NlZCB0byB0
aGUKPj4gc3luY19jcHVfZGV2aWNlX3BhZ2V0YWJsZXMoKSBjYWxsYmFjayBmdW5jdGlvbi4gVGhp
cyBpcwo+PiBzdWZmaWNpZW50IHdoZW4gdGhlIG9ubHkgYWN0aW9uIGlzIHRvIGludmFsaWRhdGUu
IEhvd2V2ZXIsCj4+IGEgZGV2aWNlIG1heSB3YW50IHRvIGtub3cgdGhlIHJlYXNvbiBmb3IgdGhl
IGludmFsaWRhdGlvbiBhbmQKPj4gYmUgYWJsZSB0byBzZWUgdGhlIG5ldyBwZXJtaXNzaW9ucyBv
biBhIHJhbmdlLCB1cGRhdGUgZGV2aWNlIGFjY2Vzcwo+PiByaWdodHMgb3IgcmFuZ2Ugc3RhdGlz
dGljcy4gU2luY2Ugc3luY19jcHVfZGV2aWNlX3BhZ2V0YWJsZXMoKQo+PiBjYW4gYmUgY2FsbGVk
IGZyb20gdHJ5X3RvX3VubWFwKCksIHRoZSBtbWFwX3NlbSBtYXkgbm90IGJlIGhlbGQKPj4gYW5k
IGZpbmRfdm1hKCkgaXMgbm90IHNhZmUgdG8gYmUgY2FsbGVkLgo+PiBQYXNzIHRoZSBzdHJ1Y3Qg
bW11X25vdGlmaWVyX3JhbmdlIHRvIHN5bmNfY3B1X2RldmljZV9wYWdldGFibGVzKCkKPj4gdG8g
YWxsb3cgdGhlIGZ1bGwgaW52YWxpZGF0aW9uIGluZm9ybWF0aW9uIHRvIGJlIHVzZWQuCj4+Cj4+
IFNpZ25lZC1vZmYtYnk6IFJhbHBoIENhbXBiZWxsIDxyY2FtcGJlbGxAbnZpZGlhLmNvbT4KPj4g
LS0tCj4+Cj4+IEknbSBzZW5kaW5nIHRoaXMgb3V0IG5vdyBzaW5jZSB3ZSBhcmUgdXBkYXRpbmcg
bWFueSBvZiB0aGUgSE1NIEFQSXMKPj4gYW5kIEkgdGhpbmsgaXQgd2lsbCBiZSB1c2VmdWwuCj4g
Cj4gVGhpcyBtYWtlIHNvIG11Y2ggc2Vuc2UsIEknZCBsaWtlIHRvIGFwcGx5IHRoaXMgaW4gaG1t
LmdpdCwgaXMgdGhlcmUKPiBhbnkgb2JqZWN0aW9uPwo+IAo+IEphc29uCj4gCk5vdCBmcm9tIG1l
LiA6LSkKClRoYW5rcyEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
