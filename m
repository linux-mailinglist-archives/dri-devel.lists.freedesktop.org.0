Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF42E3A599
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jun 2019 14:54:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C1B8892A5;
	Sun,  9 Jun 2019 12:54:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0630B89DE3;
 Fri,  7 Jun 2019 18:12:17 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5cfaa8f10000>; Fri, 07 Jun 2019 11:12:02 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Fri, 07 Jun 2019 11:12:17 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Fri, 07 Jun 2019 11:12:17 -0700
Received: from rcampbell-dev.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 7 Jun
 2019 18:12:14 +0000
Subject: Re: [PATCH v2 hmm 01/11] mm/hmm: fix use after free with struct hmm
 in the mmu notifiers
To: Jason Gunthorpe <jgg@ziepe.ca>, Jerome Glisse <jglisse@redhat.com>, "John
 Hubbard" <jhubbard@nvidia.com>, <Felix.Kuehling@amd.com>
References: <20190606184438.31646-1-jgg@ziepe.ca>
 <20190606184438.31646-2-jgg@ziepe.ca>
X-Nvconfidentiality: public
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <377cadfa-180e-9a6a-49df-0c2c27ae6fb3@nvidia.com>
Date: Fri, 7 Jun 2019 11:12:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.0
MIME-Version: 1.0
In-Reply-To: <20190606184438.31646-2-jgg@ziepe.ca>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL104.nvidia.com (172.18.146.11) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Approved-At: Sun, 09 Jun 2019 12:54:16 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1559931122; bh=yvViGcleFu6fAY5Z1ueRI2Sd+W1uzOgNJahahekeWt4=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=GwkD8xsCGHW0KQ7XDbv8wawHd+SJN+lRqrAQpT/q6IxU90uItm8+7KTvX+8unVVF7
 Vz00qV1V8aOiQueD3BHPHHGFZQnANCqbwbnRRbBFwh3oJhF3aWr4/aVmfy0TkhKL+W
 lmrPKNeaNFVPyriJVct/0VeUfyZ1MufFzoGvniQz+6lRXlnYRx5V3xeqPhkXlq2I54
 ZO79+tNGlAT4Ihs91XWeiX8VLNCv226zJTLdk0nY1y9xEBj/6xZQqrOC13Y2hVUrI/
 ZBcxJUBuG8iMwDX7QBnuTnYytNPULKEzM6tmkNK9OnPziujs0OLxsvUVUEuBUQVLdA
 TOS8OF+mbpUPw==
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

CgpPbiA2LzYvMTkgMTE6NDQgQU0sIEphc29uIEd1bnRob3JwZSB3cm90ZToKPiBGcm9tOiBKYXNv
biBHdW50aG9ycGUgPGpnZ0BtZWxsYW5veC5jb20+Cj4gCj4gbW11X25vdGlmaWVyX3VucmVnaXN0
ZXJfbm9fcmVsZWFzZSgpIGlzIG5vdCBhIGZlbmNlIGFuZCB0aGUgbW11X25vdGlmaWVyCj4gc3lz
dGVtIHdpbGwgY29udGludWUgdG8gcmVmZXJlbmNlIGhtbS0+bW4gdW50aWwgdGhlIHNyY3UgZ3Jh
Y2UgcGVyaW9kCj4gZXhwaXJlcy4KPiAKPiBSZXN1bHRpbmcgaW4gdXNlIGFmdGVyIGZyZWUgcmFj
ZXMgbGlrZSB0aGlzOgo+IAo+ICAgICAgICAgICBDUFUwICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIENQVTEKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBfX21tdV9ub3RpZmllcl9pbnZhbGlkYXRlX3JhbmdlX3N0YXJ0KCkKPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNyY3VfcmVhZF9s
b2NrCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBo
bGlzdF9mb3JfZWFjaCAoKQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAvLyBtbiA9PSBobW0tPm1uCj4gaG1tX21pcnJvcl91bnJlZ2lzdGVyKCkK
PiAgICBobW1fcHV0KCkKPiAgICAgIGhtbV9mcmVlKCkKPiAgICAgICAgbW11X25vdGlmaWVyX3Vu
cmVnaXN0ZXJfbm9fcmVsZWFzZSgpCj4gICAgICAgICAgIGhsaXN0X2RlbF9pbml0X3JjdShobW0t
bW4tPmxpc3QpCj4gCQkJICAgICAgICAgICAgICAgICAgICAgICAgICAgbW4tPm9wcy0+aW52YWxp
ZGF0ZV9yYW5nZV9zdGFydChtbiwgcmFuZ2UpOwo+IAkJCQkJICAgICAgICAgICAgIG1tX2dldF9o
bW0oKQo+ICAgICAgICBtbS0+aG1tID0gTlVMTDsKPiAgICAgICAga2ZyZWUoaG1tKQo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG11dGV4X2xv
Y2soJmhtbS0+bG9jayk7Cj4gCj4gVXNlIFNSQ1UgdG8ga2ZyZWUgdGhlIGhtbSBtZW1vcnkgc28g
dGhhdCB0aGUgbm90aWZpZXJzIGNhbiByZWx5IG9uIGhtbQo+IGV4aXN0aW5nLiBHZXQgdGhlIG5v
dy1zYWZlIGhtbSBzdHJ1Y3QgdGhyb3VnaCBjb250YWluZXJfb2YgYW5kIGRpcmVjdGx5Cj4gY2hl
Y2sga3JlZl9nZXRfdW5sZXNzX3plcm8gdG8gbG9jayBpdCBhZ2FpbnN0IGZyZWUuCj4gCj4gU2ln
bmVkLW9mZi1ieTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgoKWW91IGNhbiBh
ZGQKUmV2aWV3ZWQtYnk6IFJhbHBoIENhbXBiZWxsIDxyY2FtcGJlbGxAbnZpZGlhLmNvbT4KCj4g
LS0tCj4gdjI6Cj4gLSBTcGVsbCAnZnJlZScgcHJvcGVybHkgKEplcm9tZS9SYWxwaCkKPiAtLS0K
PiAgIGluY2x1ZGUvbGludXgvaG1tLmggfCAgMSArCj4gICBtbS9obW0uYyAgICAgICAgICAgIHwg
MjUgKysrKysrKysrKysrKysrKysrKy0tLS0tLQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAyMCBpbnNl
cnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4
L2htbS5oIGIvaW5jbHVkZS9saW51eC9obW0uaAo+IGluZGV4IDA5MmYwMjM0YmZlOTE3Li42ODhj
NWNhNzA2ODc5NSAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L2htbS5oCj4gKysrIGIvaW5j
bHVkZS9saW51eC9obW0uaAo+IEBAIC0xMDIsNiArMTAyLDcgQEAgc3RydWN0IGhtbSB7Cj4gICAJ
c3RydWN0IG1tdV9ub3RpZmllcgltbXVfbm90aWZpZXI7Cj4gICAJc3RydWN0IHJ3X3NlbWFwaG9y
ZQltaXJyb3JzX3NlbTsKPiAgIAl3YWl0X3F1ZXVlX2hlYWRfdAl3cTsKPiArCXN0cnVjdCByY3Vf
aGVhZAkJcmN1Owo+ICAgCWxvbmcJCQlub3RpZmllcnM7Cj4gICAJYm9vbAkJCWRlYWQ7Cj4gICB9
Owo+IGRpZmYgLS1naXQgYS9tbS9obW0uYyBiL21tL2htbS5jCj4gaW5kZXggOGU3NDAzZjA4MWY0
NGEuLjU0NzAwMmY1NmExNjNkIDEwMDY0NAo+IC0tLSBhL21tL2htbS5jCj4gKysrIGIvbW0vaG1t
LmMKPiBAQCAtMTEzLDYgKzExMywxMSBAQCBzdGF0aWMgc3RydWN0IGhtbSAqaG1tX2dldF9vcl9j
cmVhdGUoc3RydWN0IG1tX3N0cnVjdCAqbW0pCj4gICAJcmV0dXJuIE5VTEw7Cj4gICB9Cj4gICAK
PiArc3RhdGljIHZvaWQgaG1tX2ZyZWVfcmN1KHN0cnVjdCByY3VfaGVhZCAqcmN1KQo+ICt7Cj4g
KwlrZnJlZShjb250YWluZXJfb2YocmN1LCBzdHJ1Y3QgaG1tLCByY3UpKTsKPiArfQo+ICsKPiAg
IHN0YXRpYyB2b2lkIGhtbV9mcmVlKHN0cnVjdCBrcmVmICprcmVmKQo+ICAgewo+ICAgCXN0cnVj
dCBobW0gKmhtbSA9IGNvbnRhaW5lcl9vZihrcmVmLCBzdHJ1Y3QgaG1tLCBrcmVmKTsKPiBAQCAt
MTI1LDcgKzEzMCw3IEBAIHN0YXRpYyB2b2lkIGhtbV9mcmVlKHN0cnVjdCBrcmVmICprcmVmKQo+
ICAgCQltbS0+aG1tID0gTlVMTDsKPiAgIAlzcGluX3VubG9jaygmbW0tPnBhZ2VfdGFibGVfbG9j
ayk7Cj4gICAKPiAtCWtmcmVlKGhtbSk7Cj4gKwltbXVfbm90aWZpZXJfY2FsbF9zcmN1KCZobW0t
PnJjdSwgaG1tX2ZyZWVfcmN1KTsKPiAgIH0KPiAgIAo+ICAgc3RhdGljIGlubGluZSB2b2lkIGht
bV9wdXQoc3RydWN0IGhtbSAqaG1tKQo+IEBAIC0xNTMsMTAgKzE1OCwxNCBAQCB2b2lkIGhtbV9t
bV9kZXN0cm95KHN0cnVjdCBtbV9zdHJ1Y3QgKm1tKQo+ICAgCj4gICBzdGF0aWMgdm9pZCBobW1f
cmVsZWFzZShzdHJ1Y3QgbW11X25vdGlmaWVyICptbiwgc3RydWN0IG1tX3N0cnVjdCAqbW0pCj4g
ICB7Cj4gLQlzdHJ1Y3QgaG1tICpobW0gPSBtbV9nZXRfaG1tKG1tKTsKPiArCXN0cnVjdCBobW0g
KmhtbSA9IGNvbnRhaW5lcl9vZihtbiwgc3RydWN0IGhtbSwgbW11X25vdGlmaWVyKTsKPiAgIAlz
dHJ1Y3QgaG1tX21pcnJvciAqbWlycm9yOwo+ICAgCXN0cnVjdCBobW1fcmFuZ2UgKnJhbmdlOwo+
ICAgCj4gKwkvKiBobW0gaXMgaW4gcHJvZ3Jlc3MgdG8gZnJlZSAqLwo+ICsJaWYgKCFrcmVmX2dl
dF91bmxlc3NfemVybygmaG1tLT5rcmVmKSkKPiArCQlyZXR1cm47Cj4gKwo+ICAgCS8qIFJlcG9y
dCB0aGlzIEhNTSBhcyBkeWluZy4gKi8KPiAgIAlobW0tPmRlYWQgPSB0cnVlOwo+ICAgCj4gQEAg
LTE5NCwxMyArMjAzLDE1IEBAIHN0YXRpYyB2b2lkIGhtbV9yZWxlYXNlKHN0cnVjdCBtbXVfbm90
aWZpZXIgKm1uLCBzdHJ1Y3QgbW1fc3RydWN0ICptbSkKPiAgIHN0YXRpYyBpbnQgaG1tX2ludmFs
aWRhdGVfcmFuZ2Vfc3RhcnQoc3RydWN0IG1tdV9ub3RpZmllciAqbW4sCj4gICAJCQljb25zdCBz
dHJ1Y3QgbW11X25vdGlmaWVyX3JhbmdlICpucmFuZ2UpCj4gICB7Cj4gLQlzdHJ1Y3QgaG1tICpo
bW0gPSBtbV9nZXRfaG1tKG5yYW5nZS0+bW0pOwo+ICsJc3RydWN0IGhtbSAqaG1tID0gY29udGFp
bmVyX29mKG1uLCBzdHJ1Y3QgaG1tLCBtbXVfbm90aWZpZXIpOwo+ICAgCXN0cnVjdCBobW1fbWly
cm9yICptaXJyb3I7Cj4gICAJc3RydWN0IGhtbV91cGRhdGUgdXBkYXRlOwo+ICAgCXN0cnVjdCBo
bW1fcmFuZ2UgKnJhbmdlOwo+ICAgCWludCByZXQgPSAwOwo+ICAgCj4gLQlWTV9CVUdfT04oIWht
bSk7Cj4gKwkvKiBobW0gaXMgaW4gcHJvZ3Jlc3MgdG8gZnJlZSAqLwo+ICsJaWYgKCFrcmVmX2dl
dF91bmxlc3NfemVybygmaG1tLT5rcmVmKSkKPiArCQlyZXR1cm4gMDsKPiAgIAo+ICAgCXVwZGF0
ZS5zdGFydCA9IG5yYW5nZS0+c3RhcnQ7Cj4gICAJdXBkYXRlLmVuZCA9IG5yYW5nZS0+ZW5kOwo+
IEBAIC0yNDUsOSArMjU2LDExIEBAIHN0YXRpYyBpbnQgaG1tX2ludmFsaWRhdGVfcmFuZ2Vfc3Rh
cnQoc3RydWN0IG1tdV9ub3RpZmllciAqbW4sCj4gICBzdGF0aWMgdm9pZCBobW1faW52YWxpZGF0
ZV9yYW5nZV9lbmQoc3RydWN0IG1tdV9ub3RpZmllciAqbW4sCj4gICAJCQljb25zdCBzdHJ1Y3Qg
bW11X25vdGlmaWVyX3JhbmdlICpucmFuZ2UpCj4gICB7Cj4gLQlzdHJ1Y3QgaG1tICpobW0gPSBt
bV9nZXRfaG1tKG5yYW5nZS0+bW0pOwo+ICsJc3RydWN0IGhtbSAqaG1tID0gY29udGFpbmVyX29m
KG1uLCBzdHJ1Y3QgaG1tLCBtbXVfbm90aWZpZXIpOwo+ICAgCj4gLQlWTV9CVUdfT04oIWhtbSk7
Cj4gKwkvKiBobW0gaXMgaW4gcHJvZ3Jlc3MgdG8gZnJlZSAqLwo+ICsJaWYgKCFrcmVmX2dldF91
bmxlc3NfemVybygmaG1tLT5rcmVmKSkKPiArCQlyZXR1cm47Cj4gICAKPiAgIAltdXRleF9sb2Nr
KCZobW0tPmxvY2spOwo+ICAgCWhtbS0+bm90aWZpZXJzLS07Cj4gCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
