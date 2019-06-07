Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07EC238592
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 09:46:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E73689BAE;
	Fri,  7 Jun 2019 07:44:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 300 seconds by postgrey-1.36 at gabe;
 Fri, 07 Jun 2019 02:34:13 UTC
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5EAD89ACD;
 Fri,  7 Jun 2019 02:34:13 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5cf9cbf60000>; Thu, 06 Jun 2019 19:29:11 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 06 Jun 2019 19:29:12 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 06 Jun 2019 19:29:12 -0700
Received: from [10.110.48.28] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 7 Jun
 2019 02:29:09 +0000
Subject: Re: [PATCH v2 hmm 01/11] mm/hmm: fix use after free with struct hmm
 in the mmu notifiers
To: Jason Gunthorpe <jgg@ziepe.ca>, Jerome Glisse <jglisse@redhat.com>, "Ralph
 Campbell" <rcampbell@nvidia.com>, <Felix.Kuehling@amd.com>
References: <20190606184438.31646-1-jgg@ziepe.ca>
 <20190606184438.31646-2-jgg@ziepe.ca>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <9c72d18d-2924-cb90-ea44-7cd4b10b5bc2@nvidia.com>
Date: Thu, 6 Jun 2019 19:29:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190606184438.31646-2-jgg@ziepe.ca>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL103.nvidia.com (172.20.187.11) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Approved-At: Fri, 07 Jun 2019 07:43:40 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1559874551; bh=R2R56MRPrIqjPZeEw7fbzIpQNK89LlEqC86AIWezMqg=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=E08PdBQW7QWns3XtneChNvM+k4Mj3Hpm1wXqD3gC80a5hnrfSkAEsTdHcVOcgJ3Yd
 RStazpAX7nsLBehKZIY9KjtLbbYBPd7OAF3nseh/PvkL2ME60LVIFHybN8vj6Trf4U
 dLwYzLYgYQU4rUtkBtix+3NPH4uSNsbVbyeM+7Wn1dWfOK1pt5v2MY4HDk+oyMmBP5
 TUsaNSUmRSRUai6Q/fjo61dBOSS1erxVXoD5J/7LK+KN3HTQM8d74GteYBBe9oLAF1
 3TRo7f7ZZTZMKXtoHKhN8D1sjWGzh/qBy8UCc7s9EMXW8gxwHDTHscWUr55x7x71m4
 x+QGJnhZ6PhJQ==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNi82LzE5IDExOjQ0IEFNLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4gRnJvbTogSmFzb24g
R3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgouLi4KPiBkaWZmIC0tZ2l0IGEvbW0vaG1tLmMg
Yi9tbS9obW0uYwo+IGluZGV4IDhlNzQwM2YwODFmNDRhLi41NDcwMDJmNTZhMTYzZCAxMDA2NDQK
PiAtLS0gYS9tbS9obW0uYwo+ICsrKyBiL21tL2htbS5jCi4uLgo+IEBAIC0xMjUsNyArMTMwLDcg
QEAgc3RhdGljIHZvaWQgaG1tX2ZyZWUoc3RydWN0IGtyZWYgKmtyZWYpCj4gIAkJbW0tPmhtbSA9
IE5VTEw7Cj4gIAlzcGluX3VubG9jaygmbW0tPnBhZ2VfdGFibGVfbG9jayk7Cj4gIAo+IC0Ja2Zy
ZWUoaG1tKTsKPiArCW1tdV9ub3RpZmllcl9jYWxsX3NyY3UoJmhtbS0+cmN1LCBobW1fZnJlZV9y
Y3UpOwoKCkl0IG9jY3VycmVkIHRvIG1lIHRvIHdvbmRlciBpZiBpdCBpcyBiZXN0IHRvIHVzZSB0
aGUgTU1VIG5vdGlmaWVyJ3MKaW5zdGFuY2Ugb2Ygc3JjdSwgaW5zdGVhZCBvZiBjcmVhdGluZyBh
IHNlcGFyYXRlIGluc3RhbmNlIGZvciBITU0uCkJ1dCB0aGlzIHJlYWxseSBkb2VzIHNlZW0gYXBw
cm9wcmlhdGUsIHNpbmNlIHdlIGFyZSBhZnRlciBhbGwgdXNpbmcKdGhpcyB0byBzeW5jaHJvbml6
ZSB3aXRoIE1NVSBub3RpZmllciBjYWxsYmFja3MuIFNvLCBmaW5lLgoKCj4gIH0KPiAgCj4gIHN0
YXRpYyBpbmxpbmUgdm9pZCBobW1fcHV0KHN0cnVjdCBobW0gKmhtbSkKPiBAQCAtMTUzLDEwICsx
NTgsMTQgQEAgdm9pZCBobW1fbW1fZGVzdHJveShzdHJ1Y3QgbW1fc3RydWN0ICptbSkKPiAgCj4g
IHN0YXRpYyB2b2lkIGhtbV9yZWxlYXNlKHN0cnVjdCBtbXVfbm90aWZpZXIgKm1uLCBzdHJ1Y3Qg
bW1fc3RydWN0ICptbSkKPiAgewo+IC0Jc3RydWN0IGhtbSAqaG1tID0gbW1fZ2V0X2htbShtbSk7
Cj4gKwlzdHJ1Y3QgaG1tICpobW0gPSBjb250YWluZXJfb2YobW4sIHN0cnVjdCBobW0sIG1tdV9u
b3RpZmllcik7Cj4gIAlzdHJ1Y3QgaG1tX21pcnJvciAqbWlycm9yOwo+ICAJc3RydWN0IGhtbV9y
YW5nZSAqcmFuZ2U7Cj4gIAo+ICsJLyogaG1tIGlzIGluIHByb2dyZXNzIHRvIGZyZWUgKi8KCldl
bGwsIHNvbWV0aW1lcywgeWVzLiA6KQoKTWF5YmUgdGhpcyB3b3JkaW5nIGlzIGNsZWFyZXIgKGlm
IHdlIG5lZWQgYW55IGNvbW1lbnQgYXQgYWxsKToKCgkvKiBCYWlsIG91dCBpZiBobW0gaXMgaW4g
dGhlIHByb2Nlc3Mgb2YgYmVpbmcgZnJlZWQgKi8KCj4gKwlpZiAoIWtyZWZfZ2V0X3VubGVzc196
ZXJvKCZobW0tPmtyZWYpKQo+ICsJCXJldHVybjsKPiArCj4gIAkvKiBSZXBvcnQgdGhpcyBITU0g
YXMgZHlpbmcuICovCj4gIAlobW0tPmRlYWQgPSB0cnVlOwo+ICAKPiBAQCAtMTk0LDEzICsyMDMs
MTUgQEAgc3RhdGljIHZvaWQgaG1tX3JlbGVhc2Uoc3RydWN0IG1tdV9ub3RpZmllciAqbW4sIHN0
cnVjdCBtbV9zdHJ1Y3QgKm1tKQo+ICBzdGF0aWMgaW50IGhtbV9pbnZhbGlkYXRlX3JhbmdlX3N0
YXJ0KHN0cnVjdCBtbXVfbm90aWZpZXIgKm1uLAo+ICAJCQljb25zdCBzdHJ1Y3QgbW11X25vdGlm
aWVyX3JhbmdlICpucmFuZ2UpCj4gIHsKPiAtCXN0cnVjdCBobW0gKmhtbSA9IG1tX2dldF9obW0o
bnJhbmdlLT5tbSk7Cj4gKwlzdHJ1Y3QgaG1tICpobW0gPSBjb250YWluZXJfb2YobW4sIHN0cnVj
dCBobW0sIG1tdV9ub3RpZmllcik7Cj4gIAlzdHJ1Y3QgaG1tX21pcnJvciAqbWlycm9yOwo+ICAJ
c3RydWN0IGhtbV91cGRhdGUgdXBkYXRlOwo+ICAJc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2U7Cj4g
IAlpbnQgcmV0ID0gMDsKPiAgCj4gLQlWTV9CVUdfT04oIWhtbSk7Cj4gKwkvKiBobW0gaXMgaW4g
cHJvZ3Jlc3MgdG8gZnJlZSAqLwoKU2FtZSBoZXJlLgoKPiArCWlmICgha3JlZl9nZXRfdW5sZXNz
X3plcm8oJmhtbS0+a3JlZikpCj4gKwkJcmV0dXJuIDA7Cj4gIAo+ICAJdXBkYXRlLnN0YXJ0ID0g
bnJhbmdlLT5zdGFydDsKPiAgCXVwZGF0ZS5lbmQgPSBucmFuZ2UtPmVuZDsKPiBAQCAtMjQ1LDkg
KzI1NiwxMSBAQCBzdGF0aWMgaW50IGhtbV9pbnZhbGlkYXRlX3JhbmdlX3N0YXJ0KHN0cnVjdCBt
bXVfbm90aWZpZXIgKm1uLAo+ICBzdGF0aWMgdm9pZCBobW1faW52YWxpZGF0ZV9yYW5nZV9lbmQo
c3RydWN0IG1tdV9ub3RpZmllciAqbW4sCj4gIAkJCWNvbnN0IHN0cnVjdCBtbXVfbm90aWZpZXJf
cmFuZ2UgKm5yYW5nZSkKPiAgewo+IC0Jc3RydWN0IGhtbSAqaG1tID0gbW1fZ2V0X2htbShucmFu
Z2UtPm1tKTsKPiArCXN0cnVjdCBobW0gKmhtbSA9IGNvbnRhaW5lcl9vZihtbiwgc3RydWN0IGht
bSwgbW11X25vdGlmaWVyKTsKPiAgCj4gLQlWTV9CVUdfT04oIWhtbSk7Cj4gKwkvKiBobW0gaXMg
aW4gcHJvZ3Jlc3MgdG8gZnJlZSAqLwoKQW5kIGhlcmUuCgo+ICsJaWYgKCFrcmVmX2dldF91bmxl
c3NfemVybygmaG1tLT5rcmVmKSkKPiArCQlyZXR1cm47Cj4gIAo+ICAJbXV0ZXhfbG9jaygmaG1t
LT5sb2NrKTsKPiAgCWhtbS0+bm90aWZpZXJzLS07Cj4gCgpFbGVnYW50IGZpeC4gUmVnYXJkbGVz
cyBvZiB0aGUgYWJvdmUgY2hhdHRlciBJIGFkZGVkLCB5b3UgY2FuIGFkZDoKCiAgICBSZXZpZXdl
ZC1ieTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKCnRoYW5rcywKLS0gCkpv
aG4gSHViYmFyZApOVklESUEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
