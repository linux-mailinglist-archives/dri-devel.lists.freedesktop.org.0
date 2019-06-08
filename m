Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 788333A5C3
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jun 2019 14:55:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3795089321;
	Sun,  9 Jun 2019 12:54:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0260F891D9;
 Sat,  8 Jun 2019 01:13:47 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5cfb0bc90000>; Fri, 07 Jun 2019 18:13:45 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Fri, 07 Jun 2019 18:13:47 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Fri, 07 Jun 2019 18:13:47 -0700
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 8 Jun
 2019 01:13:46 +0000
Subject: Re: [PATCH v2 hmm 01/11] mm/hmm: fix use after free with struct hmm
 in the mmu notifiers
To: Jason Gunthorpe <jgg@ziepe.ca>
References: <20190606184438.31646-1-jgg@ziepe.ca>
 <20190606184438.31646-2-jgg@ziepe.ca>
 <9c72d18d-2924-cb90-ea44-7cd4b10b5bc2@nvidia.com>
 <20190607123432.GB14802@ziepe.ca>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <1b3916b8-fcf0-3a11-1cd8-223fc8e60ac1@nvidia.com>
Date: Fri, 7 Jun 2019 18:13:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190607123432.GB14802@ziepe.ca>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL104.nvidia.com (172.18.146.11) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Approved-At: Sun, 09 Jun 2019 12:54:17 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1559956425; bh=uiPsFTVMNBBi8QlzP+NhgiuB1J/ANB5gJR02GD6ywIc=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=SzYmAOHzQcQHZcZQepC2C4sEoMsTl8f1jPKE1PnsyZJ/ap9CeBbaoX8p4Uqwe7fjw
 iL8f8FtsIZMdEtfURvHBm68zj3tCm+12mMLKimRtnuE4YhAitzFOU5MKDwXRyjCeYO
 5deRY3zjyiX3Ix5CKxv9aSy7KMe+7ccCCysTafCkZ4U1HBhk4PPIWSgCSrdZB6YXq1
 IDqqkAglq+MdtTdF0Ow6aPH2DHxVbL8zqacY9v6JH+nR8KPh5yDkgmGKO2SHsst6Cz
 aVmO18nZ4ypXY18hqKo0R9gDDhJ/FscYVwyWlur4hC5L38VcU2aI3sq/un5/chhvEL
 vIvvlsKGNdDuQ==
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
 Ralph Campbell <rcampbell@nvidia.com>, linux-rdma@vger.kernel.org,
 Felix.Kuehling@amd.com, dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Jerome Glisse <jglisse@redhat.com>, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNi83LzE5IDU6MzQgQU0sIEphc29uIEd1bnRob3JwZSB3cm90ZToKPiBPbiBUaHUsIEp1biAw
NiwgMjAxOSBhdCAwNzoyOTowOFBNIC0wNzAwLCBKb2huIEh1YmJhcmQgd3JvdGU6Cj4+IE9uIDYv
Ni8xOSAxMTo0NCBBTSwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+Pj4gRnJvbTogSmFzb24gR3Vu
dGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgo+PiAuLi4KPj4+IGRpZmYgLS1naXQgYS9tbS9obW0u
YyBiL21tL2htbS5jCj4+PiBpbmRleCA4ZTc0MDNmMDgxZjQ0YS4uNTQ3MDAyZjU2YTE2M2QgMTAw
NjQ0Cj4+PiArKysgYi9tbS9obW0uYwo+PiAuLi4KPj4+IEBAIC0xMjUsNyArMTMwLDcgQEAgc3Rh
dGljIHZvaWQgaG1tX2ZyZWUoc3RydWN0IGtyZWYgKmtyZWYpCj4+PiAgCQltbS0+aG1tID0gTlVM
TDsKPj4+ICAJc3Bpbl91bmxvY2soJm1tLT5wYWdlX3RhYmxlX2xvY2spOwo+Pj4gIAo+Pj4gLQlr
ZnJlZShobW0pOwo+Pj4gKwltbXVfbm90aWZpZXJfY2FsbF9zcmN1KCZobW0tPnJjdSwgaG1tX2Zy
ZWVfcmN1KTsKPj4KPj4KPj4gSXQgb2NjdXJyZWQgdG8gbWUgdG8gd29uZGVyIGlmIGl0IGlzIGJl
c3QgdG8gdXNlIHRoZSBNTVUgbm90aWZpZXIncwo+PiBpbnN0YW5jZSBvZiBzcmN1LCBpbnN0ZWFk
IG9mIGNyZWF0aW5nIGEgc2VwYXJhdGUgaW5zdGFuY2UgZm9yIEhNTS4KPiAKPiBJdCAqaGFzKiB0
byBiZSB0aGUgTU1VIG5vdGlmaWVyIFNSQ1UgYmVjYXVzZSB3ZSBhcmUgc3luY2hvcm5pemluZwo+
IGFnYWluc3QgdGhlIHJlYWQgc2lkZSBvZiB0aGF0IFNSVSBpbnNpZGUgdGhlIG1tdSBub3RpZmll
ciBjb2RlLCBpZToKPiAKPiBpbnQgX19tbXVfbm90aWZpZXJfaW52YWxpZGF0ZV9yYW5nZV9zdGFy
dChzdHJ1Y3QgbW11X25vdGlmaWVyX3JhbmdlICpyYW5nZSkKPiAgICAgICAgIGlkID0gc3JjdV9y
ZWFkX2xvY2soJnNyY3UpOwo+ICAgICAgICAgaGxpc3RfZm9yX2VhY2hfZW50cnlfcmN1KG1uLCAm
cmFuZ2UtPm1tLT5tbXVfbm90aWZpZXJfbW0tPmxpc3QsIGhsaXN0KSB7Cj4gICAgICAgICAgICAg
ICAgIGlmIChtbi0+b3BzLT5pbnZhbGlkYXRlX3JhbmdlX3N0YXJ0KSB7Cj4gICAgICAgICAgICAg
ICAgICAgIF5eXl5eCj4gCj4gSGVyZSAnbW4nIGlzIHJlYWxseSBobW0gKGhtbSA9IGNvbnRhaW5l
cl9vZihtbiwgc3RydWN0IGhtbSwKPiBtbXVfbm90aWZpZXIpKSwgc28gd2UgbXVzdCBwcm90ZWN0
IHRoZSBtZW1vcnkgYWdhaW5zdCBmcmVlIGZvciB0aGUgbW11Cj4gbm90aWZpZXIgY29yZS4KPiAK
PiBUaHVzIHdlIGhhdmUgbm8gY2hvaWNlIGJ1dCB0byB1c2UgaXRzIFNSQ1UuCgpBaCByaWdodC4g
SXQncyBlbWJhcmFzc2luZ2x5IG9idmlvdXMgd2hlbiB5b3Ugc2F5IGl0IG91dCBsb3VkLiA6KSAK
VGhhbmtzIGZvciBleHBsYWluaW5nLgoKPiAKPiBDSCBhbHNvIHBvaW50ZWQgb3V0IGEgbW9yZSBl
bGVnYW50IHNvbHV0aW9uLCB3aGljaCBpcyB0byBnZXQgdGhlIHdyaXRlCj4gc2lkZSBvZiB0aGUg
bW1hcF9zZW0gZHVyaW5nIGhtbV9taXJyb3JfdW5yZWdpc3RlciAtIG5vIG5vdGlmaWVyCj4gY2Fs
bGJhY2sgY2FuIGJlIHJ1bm5pbmcgaW4gdGhpcyBjYXNlLiBUaGVuIHdlIGRlbGV0ZSB0aGUga3Jl
Ziwgc3JjdQo+IGFuZCBzbyBmb3J0aC4KPiAKPiBUaGlzIGlzIG11Y2ggY2xlYXJlci9zYW5lci9i
ZXR0ZXIsIGJ1dC4uIHJlcXVyaWVzIHRoZSBjYWxsZXJzIG9mCj4gaG1tX21pcnJvcl91bnJlZ2lz
dGVyIHRvIGJlIHNhZmUgdG8gZ2V0IHRoZSBtbWFwX3NlbSB3cml0ZSBzaWRlLgo+IAo+IEkgdGhp
bmsgdGhpcyBpcyB0cnVlLCBzbyBtYXliZSB0aGlzIHBhdGNoIHNob3VsZCBiZSBzd2l0Y2hlZCwg
d2hhdCBkbwo+IHlvdSB0aGluaz8KCk9LLCB5b3VyIGZvbGxvdy11cCBub3RlcyB0aGF0IHdlJ2xs
IGxlYXZlIGl0IGFzIGlzLCBnb3QgaXQuCgoKdGhhbmtzLAotLSAKSm9obiBIdWJiYXJkCk5WSURJ
QQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
