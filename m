Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 122853A5C5
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jun 2019 14:56:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAB5E8938C;
	Sun,  9 Jun 2019 12:54:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1654289E3F;
 Fri,  7 Jun 2019 18:41:23 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5cfaafd20001>; Fri, 07 Jun 2019 11:41:22 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Fri, 07 Jun 2019 11:41:22 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Fri, 07 Jun 2019 11:41:22 -0700
Received: from rcampbell-dev.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 7 Jun
 2019 18:41:21 +0000
Subject: Re: [PATCH v2 hmm 03/11] mm/hmm: Hold a mmgrab from hmm to mm
To: Jason Gunthorpe <jgg@ziepe.ca>, Jerome Glisse <jglisse@redhat.com>, "John
 Hubbard" <jhubbard@nvidia.com>, <Felix.Kuehling@amd.com>
References: <20190606184438.31646-1-jgg@ziepe.ca>
 <20190606184438.31646-4-jgg@ziepe.ca>
From: Ralph Campbell <rcampbell@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <605172dc-5c66-123f-61a3-8e6880678aef@nvidia.com>
Date: Fri, 7 Jun 2019 11:41:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.0
MIME-Version: 1.0
In-Reply-To: <20190606184438.31646-4-jgg@ziepe.ca>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Approved-At: Sun, 09 Jun 2019 12:54:16 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1559932882; bh=BXL7/wF1685JXXTrRB3MzSSsbcW5afztk5Rzsz/BPwQ=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=Wkrw1snfHAMLfoxwtDrAaK5NrPSHE8tbm/7LuFI2XQAtYTox/3q2xrehM2lJJL18q
 P/lK/orwO3+mod6CKV0QZm78jJRxIKuvbNOsQZhdd+1yRIPKKDJpL5YWOhc9vnhKch
 UWKavQ8B/OXpV8YxtD2Qxuz8CaPCy8NIu1DMnM0y/udqNHlRe/2PVTqjEHpPLOTT8Z
 m2SvCKaGpDUPdJbPo5rTpLyBiA5MJ07nzuPSxth9C5xwlF0gz+O9RKbQZjerlG99CH
 yhyMU5sdcUbqnd3nDCzFo4CZyHozRpUrUPNHp9dYtOryQgA8jcqcd5zND+0Xlcs0Xq
 ulL1B4XzCIYwA==
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
IEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4KPiAKPiBTbyBsb25nIGEgYSBzdHJ1Y3QgaG1t
IHBvaW50ZXIgZXhpc3RzLCBzbyBzaG91bGQgdGhlIHN0cnVjdCBtbSBpdCBpcwoKcy9hIGEvYXMg
YS8KCj4gbGlua2VkIHRvby4gSG9sZCB0aGUgbW1ncmFiKCkgYXMgc29vbiBhcyBhIGhtbSBpcyBj
cmVhdGVkLCBhbmQgbW1kcm9wKCkgaXQKPiBvbmNlIHRoZSBobW0gcmVmY291bnQgZ29lcyB0byB6
ZXJvLgo+IAo+IFNpbmNlIG1tZHJvcCgpIChpZSBhIDAga3JlZiBvbiBzdHJ1Y3QgbW0pIGlzIG5v
dyBpbXBvc3NpYmxlIHdpdGggYSAhTlVMTAo+IG1tLT5obW0gZGVsZXRlIHRoZSBobW1faG1tX2Rl
c3Ryb3koKS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYXNvbiBHdW50aG9ycGUgPGpnZ0BtZWxsYW5v
eC5jb20+Cj4gUmV2aWV3ZWQtYnk6IErDqXLDtG1lIEdsaXNzZSA8amdsaXNzZUByZWRoYXQuY29t
PgoKUmV2aWV3ZWQtYnk6IFJhbHBoIENhbXBiZWxsIDxyY2FtcGJlbGxAbnZpZGlhLmNvbT4KCj4g
LS0tCj4gdjI6Cj4gICAtIEZpeCBlcnJvciB1bndpbmQgcGF0aHMgaW4gaG1tX2dldF9vcl9jcmVh
dGUgKEplcm9tZS9KYXNvbikKPiAtLS0KPiAgIGluY2x1ZGUvbGludXgvaG1tLmggfCAgMyAtLS0K
PiAgIGtlcm5lbC9mb3JrLmMgICAgICAgfCAgMSAtCj4gICBtbS9obW0uYyAgICAgICAgICAgIHwg
MjIgKysrKy0tLS0tLS0tLS0tLS0tLS0tLQo+ICAgMyBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlv
bnMoKyksIDIyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2ht
bS5oIGIvaW5jbHVkZS9saW51eC9obW0uaAo+IGluZGV4IDJkNTE5Nzk3Y2IxMzRhLi40ZWUzYWNh
YmU1ZWQyMiAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L2htbS5oCj4gKysrIGIvaW5jbHVk
ZS9saW51eC9obW0uaAo+IEBAIC01ODYsMTQgKzU4NiwxMSBAQCBzdGF0aWMgaW5saW5lIGludCBo
bW1fdm1hX2ZhdWx0KHN0cnVjdCBobW1fbWlycm9yICptaXJyb3IsCj4gICB9Cj4gICAKPiAgIC8q
IEJlbG93IGFyZSBmb3IgSE1NIGludGVybmFsIHVzZSBvbmx5ISBOb3QgdG8gYmUgdXNlZCBieSBk
ZXZpY2UgZHJpdmVyISAqLwo+IC12b2lkIGhtbV9tbV9kZXN0cm95KHN0cnVjdCBtbV9zdHJ1Y3Qg
Km1tKTsKPiAtCj4gICBzdGF0aWMgaW5saW5lIHZvaWQgaG1tX21tX2luaXQoc3RydWN0IG1tX3N0
cnVjdCAqbW0pCj4gICB7Cj4gICAJbW0tPmhtbSA9IE5VTEw7Cj4gICB9Cj4gICAjZWxzZSAvKiBJ
U19FTkFCTEVEKENPTkZJR19ITU1fTUlSUk9SKSAqLwo+IC1zdGF0aWMgaW5saW5lIHZvaWQgaG1t
X21tX2Rlc3Ryb3koc3RydWN0IG1tX3N0cnVjdCAqbW0pIHt9Cj4gICBzdGF0aWMgaW5saW5lIHZv
aWQgaG1tX21tX2luaXQoc3RydWN0IG1tX3N0cnVjdCAqbW0pIHt9Cj4gICAjZW5kaWYgLyogSVNf
RU5BQkxFRChDT05GSUdfSE1NX01JUlJPUikgKi8KPiAgIAo+IGRpZmYgLS1naXQgYS9rZXJuZWwv
Zm9yay5jIGIva2VybmVsL2ZvcmsuYwo+IGluZGV4IGIyYjg3ZDQ1MGI4MGI1Li41ODhjNzY4YWU3
MjQ1MSAxMDA2NDQKPiAtLS0gYS9rZXJuZWwvZm9yay5jCj4gKysrIGIva2VybmVsL2ZvcmsuYwo+
IEBAIC02NzMsNyArNjczLDYgQEAgdm9pZCBfX21tZHJvcChzdHJ1Y3QgbW1fc3RydWN0ICptbSkK
PiAgIAlXQVJOX09OX09OQ0UobW0gPT0gY3VycmVudC0+YWN0aXZlX21tKTsKPiAgIAltbV9mcmVl
X3BnZChtbSk7Cj4gICAJZGVzdHJveV9jb250ZXh0KG1tKTsKPiAtCWhtbV9tbV9kZXN0cm95KG1t
KTsKPiAgIAltbXVfbm90aWZpZXJfbW1fZGVzdHJveShtbSk7Cj4gICAJY2hlY2tfbW0obW0pOwo+
ICAgCXB1dF91c2VyX25zKG1tLT51c2VyX25zKTsKPiBkaWZmIC0tZ2l0IGEvbW0vaG1tLmMgYi9t
bS9obW0uYwo+IGluZGV4IDg3OTY0NDcyOTkwMjNjLi5jYzdjMjZmZGEzMzAwZSAxMDA2NDQKPiAt
LS0gYS9tbS9obW0uYwo+ICsrKyBiL21tL2htbS5jCj4gQEAgLTI5LDYgKzI5LDcgQEAKPiAgICNp
bmNsdWRlIDxsaW51eC9zd2Fwb3BzLmg+Cj4gICAjaW5jbHVkZSA8bGludXgvaHVnZXRsYi5oPgo+
ICAgI2luY2x1ZGUgPGxpbnV4L21lbXJlbWFwLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9zY2hlZC9t
bS5oPgo+ICAgI2luY2x1ZGUgPGxpbnV4L2p1bXBfbGFiZWwuaD4KPiAgICNpbmNsdWRlIDxsaW51
eC9kbWEtbWFwcGluZy5oPgo+ICAgI2luY2x1ZGUgPGxpbnV4L21tdV9ub3RpZmllci5oPgo+IEBA
IC04Miw2ICs4Myw3IEBAIHN0YXRpYyBzdHJ1Y3QgaG1tICpobW1fZ2V0X29yX2NyZWF0ZShzdHJ1
Y3QgbW1fc3RydWN0ICptbSkKPiAgIAlobW0tPm5vdGlmaWVycyA9IDA7Cj4gICAJaG1tLT5kZWFk
ID0gZmFsc2U7Cj4gICAJaG1tLT5tbSA9IG1tOwo+ICsJbW1ncmFiKGhtbS0+bW0pOwo+ICAgCj4g
ICAJc3Bpbl9sb2NrKCZtbS0+cGFnZV90YWJsZV9sb2NrKTsKPiAgIAlpZiAoIW1tLT5obW0pCj4g
QEAgLTEwOSw2ICsxMTEsNyBAQCBzdGF0aWMgc3RydWN0IGhtbSAqaG1tX2dldF9vcl9jcmVhdGUo
c3RydWN0IG1tX3N0cnVjdCAqbW0pCj4gICAJCW1tLT5obW0gPSBOVUxMOwo+ICAgCXNwaW5fdW5s
b2NrKCZtbS0+cGFnZV90YWJsZV9sb2NrKTsKPiAgIGVycm9yOgo+ICsJbW1kcm9wKGhtbS0+bW0p
Owo+ICAgCWtmcmVlKGhtbSk7Cj4gICAJcmV0dXJuIE5VTEw7Cj4gICB9Cj4gQEAgLTEzMCw2ICsx
MzMsNyBAQCBzdGF0aWMgdm9pZCBobW1fZnJlZShzdHJ1Y3Qga3JlZiAqa3JlZikKPiAgIAkJbW0t
PmhtbSA9IE5VTEw7Cj4gICAJc3Bpbl91bmxvY2soJm1tLT5wYWdlX3RhYmxlX2xvY2spOwo+ICAg
Cj4gKwltbWRyb3AoaG1tLT5tbSk7Cj4gICAJbW11X25vdGlmaWVyX2NhbGxfc3JjdSgmaG1tLT5y
Y3UsIGhtbV9mcmVlX3JjdSk7Cj4gICB9Cj4gICAKPiBAQCAtMTM4LDI0ICsxNDIsNiBAQCBzdGF0
aWMgaW5saW5lIHZvaWQgaG1tX3B1dChzdHJ1Y3QgaG1tICpobW0pCj4gICAJa3JlZl9wdXQoJmht
bS0+a3JlZiwgaG1tX2ZyZWUpOwo+ICAgfQo+ICAgCj4gLXZvaWQgaG1tX21tX2Rlc3Ryb3koc3Ry
dWN0IG1tX3N0cnVjdCAqbW0pCj4gLXsKPiAtCXN0cnVjdCBobW0gKmhtbTsKPiAtCj4gLQlzcGlu
X2xvY2soJm1tLT5wYWdlX3RhYmxlX2xvY2spOwo+IC0JaG1tID0gbW1fZ2V0X2htbShtbSk7Cj4g
LQltbS0+aG1tID0gTlVMTDsKPiAtCWlmIChobW0pIHsKPiAtCQlobW0tPm1tID0gTlVMTDsKPiAt
CQlobW0tPmRlYWQgPSB0cnVlOwo+IC0JCXNwaW5fdW5sb2NrKCZtbS0+cGFnZV90YWJsZV9sb2Nr
KTsKPiAtCQlobW1fcHV0KGhtbSk7Cj4gLQkJcmV0dXJuOwo+IC0JfQo+IC0KPiAtCXNwaW5fdW5s
b2NrKCZtbS0+cGFnZV90YWJsZV9sb2NrKTsKPiAtfQo+IC0KPiAgIHN0YXRpYyB2b2lkIGhtbV9y
ZWxlYXNlKHN0cnVjdCBtbXVfbm90aWZpZXIgKm1uLCBzdHJ1Y3QgbW1fc3RydWN0ICptbSkKPiAg
IHsKPiAgIAlzdHJ1Y3QgaG1tICpobW0gPSBjb250YWluZXJfb2YobW4sIHN0cnVjdCBobW0sIG1t
dV9ub3RpZmllcik7Cj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
