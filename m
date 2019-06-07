Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBAB3853E
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 09:44:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7949689A56;
	Fri,  7 Jun 2019 07:43:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9731189AC9;
 Fri,  7 Jun 2019 02:45:03 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5cf9cfac0000>; Thu, 06 Jun 2019 19:45:00 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Thu, 06 Jun 2019 19:45:02 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Thu, 06 Jun 2019 19:45:02 -0700
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 7 Jun
 2019 02:44:59 +0000
Subject: Re: [PATCH v2 hmm 03/11] mm/hmm: Hold a mmgrab from hmm to mm
To: Jason Gunthorpe <jgg@ziepe.ca>, Jerome Glisse <jglisse@redhat.com>, "Ralph
 Campbell" <rcampbell@nvidia.com>, <Felix.Kuehling@amd.com>
References: <20190606184438.31646-1-jgg@ziepe.ca>
 <20190606184438.31646-4-jgg@ziepe.ca>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <48fcaa19-6ac3-59d0-cd51-455abeca7cdb@nvidia.com>
Date: Thu, 6 Jun 2019 19:44:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190606184438.31646-4-jgg@ziepe.ca>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Approved-At: Fri, 07 Jun 2019 07:43:40 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1559875501; bh=CTx0CZF1eqGSR9YUaBnLK21ryxBUxrtYilDSKRTBU9s=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=WbdgepJxjCHukIhBJ337H26udHrSAKLUnbPQYX01omNSCrQ4fChLraSIVS8BdQztY
 y4HSS82fWGqhCo05fjhDYEDdSq1PaJ4ub4bBnNrfIjyV3AtMVD/rdGCLHbnXn7BVZr
 3EFPvF0FE7KTfTwY0aOOZ6HXEp2eoCLm3QlHH3PYW0iEfIIYDBMotKjfdI9+2mrboJ
 xcwswKfBDrDosV24wiz5GIj+6DDKbooE/KHh75+F17jnsGUKSVgHbYgV3D1Ho3yWOF
 ftxVH4bh2uBdUMQ7pou1FfierCA1ZvJnx2039/gk7jyWsEixyV9Daz6598bhPfjFsU
 yQqrp+fujdKEg==
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
R3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgo+IAo+IFNvIGxvbmcgYSBhIHN0cnVjdCBobW0g
cG9pbnRlciBleGlzdHMsIHNvIHNob3VsZCB0aGUgc3RydWN0IG1tIGl0IGlzCj4gbGlua2VkIHRv
by4gSG9sZCB0aGUgbW1ncmFiKCkgYXMgc29vbiBhcyBhIGhtbSBpcyBjcmVhdGVkLCBhbmQgbW1k
cm9wKCkgaXQKPiBvbmNlIHRoZSBobW0gcmVmY291bnQgZ29lcyB0byB6ZXJvLgo+IAo+IFNpbmNl
IG1tZHJvcCgpIChpZSBhIDAga3JlZiBvbiBzdHJ1Y3QgbW0pIGlzIG5vdyBpbXBvc3NpYmxlIHdp
dGggYSAhTlVMTAo+IG1tLT5obW0gZGVsZXRlIHRoZSBobW1faG1tX2Rlc3Ryb3koKS4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBKYXNvbiBHdW50aG9ycGUgPGpnZ0BtZWxsYW5veC5jb20+Cj4gUmV2aWV3
ZWQtYnk6IErDqXLDtG1lIEdsaXNzZSA8amdsaXNzZUByZWRoYXQuY29tPgo+IC0tLQo+IHYyOgo+
ICAtIEZpeCBlcnJvciB1bndpbmQgcGF0aHMgaW4gaG1tX2dldF9vcl9jcmVhdGUgKEplcm9tZS9K
YXNvbikKPiAtLS0KPiAgaW5jbHVkZS9saW51eC9obW0uaCB8ICAzIC0tLQo+ICBrZXJuZWwvZm9y
ay5jICAgICAgIHwgIDEgLQo+ICBtbS9obW0uYyAgICAgICAgICAgIHwgMjIgKysrKy0tLS0tLS0t
LS0tLS0tLS0tLQo+ICAzIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMjIgZGVsZXRp
b25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvaG1tLmggYi9pbmNsdWRlL2xp
bnV4L2htbS5oCj4gaW5kZXggMmQ1MTk3OTdjYjEzNGEuLjRlZTNhY2FiZTVlZDIyIDEwMDY0NAo+
IC0tLSBhL2luY2x1ZGUvbGludXgvaG1tLmgKPiArKysgYi9pbmNsdWRlL2xpbnV4L2htbS5oCj4g
QEAgLTU4NiwxNCArNTg2LDExIEBAIHN0YXRpYyBpbmxpbmUgaW50IGhtbV92bWFfZmF1bHQoc3Ry
dWN0IGhtbV9taXJyb3IgKm1pcnJvciwKPiAgfQo+ICAKPiAgLyogQmVsb3cgYXJlIGZvciBITU0g
aW50ZXJuYWwgdXNlIG9ubHkhIE5vdCB0byBiZSB1c2VkIGJ5IGRldmljZSBkcml2ZXIhICovCj4g
LXZvaWQgaG1tX21tX2Rlc3Ryb3koc3RydWN0IG1tX3N0cnVjdCAqbW0pOwo+IC0KPiAgc3RhdGlj
IGlubGluZSB2b2lkIGhtbV9tbV9pbml0KHN0cnVjdCBtbV9zdHJ1Y3QgKm1tKQo+ICB7Cj4gIAlt
bS0+aG1tID0gTlVMTDsKPiAgfQo+ICAjZWxzZSAvKiBJU19FTkFCTEVEKENPTkZJR19ITU1fTUlS
Uk9SKSAqLwo+IC1zdGF0aWMgaW5saW5lIHZvaWQgaG1tX21tX2Rlc3Ryb3koc3RydWN0IG1tX3N0
cnVjdCAqbW0pIHt9Cj4gIHN0YXRpYyBpbmxpbmUgdm9pZCBobW1fbW1faW5pdChzdHJ1Y3QgbW1f
c3RydWN0ICptbSkge30KPiAgI2VuZGlmIC8qIElTX0VOQUJMRUQoQ09ORklHX0hNTV9NSVJST1Ip
ICovCj4gIAo+IGRpZmYgLS1naXQgYS9rZXJuZWwvZm9yay5jIGIva2VybmVsL2ZvcmsuYwo+IGlu
ZGV4IGIyYjg3ZDQ1MGI4MGI1Li41ODhjNzY4YWU3MjQ1MSAxMDA2NDQKPiAtLS0gYS9rZXJuZWwv
Zm9yay5jCj4gKysrIGIva2VybmVsL2ZvcmsuYwo+IEBAIC02NzMsNyArNjczLDYgQEAgdm9pZCBf
X21tZHJvcChzdHJ1Y3QgbW1fc3RydWN0ICptbSkKPiAgCVdBUk5fT05fT05DRShtbSA9PSBjdXJy
ZW50LT5hY3RpdmVfbW0pOwo+ICAJbW1fZnJlZV9wZ2QobW0pOwo+ICAJZGVzdHJveV9jb250ZXh0
KG1tKTsKPiAtCWhtbV9tbV9kZXN0cm95KG1tKTsKCgpUaGlzIGlzIHBhcnRpY3VsYXJseSB3ZWxj
b21lLCBub3QgdG8gaGF2ZSBhbiAiSE1NIGlzIHNwZWNpYWwiIGNhc2UKaW4gc3VjaCBhIGNvcmUg
cGFydCBvZiBwcm9jZXNzL21tIGNvZGUuIAoKCj4gIAltbXVfbm90aWZpZXJfbW1fZGVzdHJveSht
bSk7Cj4gIAljaGVja19tbShtbSk7Cj4gIAlwdXRfdXNlcl9ucyhtbS0+dXNlcl9ucyk7Cj4gZGlm
ZiAtLWdpdCBhL21tL2htbS5jIGIvbW0vaG1tLmMKPiBpbmRleCA4Nzk2NDQ3Mjk5MDIzYy4uY2M3
YzI2ZmRhMzMwMGUgMTAwNjQ0Cj4gLS0tIGEvbW0vaG1tLmMKPiArKysgYi9tbS9obW0uYwo+IEBA
IC0yOSw2ICsyOSw3IEBACj4gICNpbmNsdWRlIDxsaW51eC9zd2Fwb3BzLmg+Cj4gICNpbmNsdWRl
IDxsaW51eC9odWdldGxiLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9tZW1yZW1hcC5oPgo+ICsjaW5j
bHVkZSA8bGludXgvc2NoZWQvbW0uaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2p1bXBfbGFiZWwuaD4K
PiAgI2luY2x1ZGUgPGxpbnV4L2RtYS1tYXBwaW5nLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9tbXVf
bm90aWZpZXIuaD4KPiBAQCAtODIsNiArODMsNyBAQCBzdGF0aWMgc3RydWN0IGhtbSAqaG1tX2dl
dF9vcl9jcmVhdGUoc3RydWN0IG1tX3N0cnVjdCAqbW0pCj4gIAlobW0tPm5vdGlmaWVycyA9IDA7
Cj4gIAlobW0tPmRlYWQgPSBmYWxzZTsKPiAgCWhtbS0+bW0gPSBtbTsKPiArCW1tZ3JhYihobW0t
Pm1tKTsKPiAgCj4gIAlzcGluX2xvY2soJm1tLT5wYWdlX3RhYmxlX2xvY2spOwo+ICAJaWYgKCFt
bS0+aG1tKQo+IEBAIC0xMDksNiArMTExLDcgQEAgc3RhdGljIHN0cnVjdCBobW0gKmhtbV9nZXRf
b3JfY3JlYXRlKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tKQo+ICAJCW1tLT5obW0gPSBOVUxMOwo+ICAJ
c3Bpbl91bmxvY2soJm1tLT5wYWdlX3RhYmxlX2xvY2spOwo+ICBlcnJvcjoKPiArCW1tZHJvcCho
bW0tPm1tKTsKPiAgCWtmcmVlKGhtbSk7Cj4gIAlyZXR1cm4gTlVMTDsKPiAgfQo+IEBAIC0xMzAs
NiArMTMzLDcgQEAgc3RhdGljIHZvaWQgaG1tX2ZyZWUoc3RydWN0IGtyZWYgKmtyZWYpCj4gIAkJ
bW0tPmhtbSA9IE5VTEw7Cj4gIAlzcGluX3VubG9jaygmbW0tPnBhZ2VfdGFibGVfbG9jayk7Cj4g
IAo+ICsJbW1kcm9wKGhtbS0+bW0pOwo+ICAJbW11X25vdGlmaWVyX2NhbGxfc3JjdSgmaG1tLT5y
Y3UsIGhtbV9mcmVlX3JjdSk7Cj4gIH0KPiAgCj4gQEAgLTEzOCwyNCArMTQyLDYgQEAgc3RhdGlj
IGlubGluZSB2b2lkIGhtbV9wdXQoc3RydWN0IGhtbSAqaG1tKQo+ICAJa3JlZl9wdXQoJmhtbS0+
a3JlZiwgaG1tX2ZyZWUpOwo+ICB9Cj4gIAo+IC12b2lkIGhtbV9tbV9kZXN0cm95KHN0cnVjdCBt
bV9zdHJ1Y3QgKm1tKQo+IC17Cj4gLQlzdHJ1Y3QgaG1tICpobW07Cj4gLQo+IC0Jc3Bpbl9sb2Nr
KCZtbS0+cGFnZV90YWJsZV9sb2NrKTsKPiAtCWhtbSA9IG1tX2dldF9obW0obW0pOwo+IC0JbW0t
PmhtbSA9IE5VTEw7Cj4gLQlpZiAoaG1tKSB7Cj4gLQkJaG1tLT5tbSA9IE5VTEw7Cj4gLQkJaG1t
LT5kZWFkID0gdHJ1ZTsKPiAtCQlzcGluX3VubG9jaygmbW0tPnBhZ2VfdGFibGVfbG9jayk7Cj4g
LQkJaG1tX3B1dChobW0pOwo+IC0JCXJldHVybjsKPiAtCX0KPiAtCj4gLQlzcGluX3VubG9jaygm
bW0tPnBhZ2VfdGFibGVfbG9jayk7Cj4gLX0KPiAtCj4gIHN0YXRpYyB2b2lkIGhtbV9yZWxlYXNl
KHN0cnVjdCBtbXVfbm90aWZpZXIgKm1uLCBzdHJ1Y3QgbW1fc3RydWN0ICptbSkKPiAgewo+ICAJ
c3RydWN0IGhtbSAqaG1tID0gY29udGFpbmVyX29mKG1uLCBzdHJ1Y3QgaG1tLCBtbXVfbm90aWZp
ZXIpOwo+IAoKRmFpbGVkIHRvIGZpbmQgYW55IHByb2JsZW1zIHdpdGggdGhpcy4gOikKCiAgICBS
ZXZpZXdlZC1ieTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKdGhhbmtzLAot
LSAKSm9obiBIdWJiYXJkCk5WSURJQQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
