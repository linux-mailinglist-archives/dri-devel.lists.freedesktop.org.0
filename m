Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B53C238558
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 09:44:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AAE889A9F;
	Fri,  7 Jun 2019 07:43:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DF0A89A9F;
 Fri,  7 Jun 2019 02:54:41 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5cf9d1df0000>; Thu, 06 Jun 2019 19:54:25 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Thu, 06 Jun 2019 19:54:40 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Thu, 06 Jun 2019 19:54:40 -0700
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 7 Jun
 2019 02:54:34 +0000
Subject: Re: [PATCH v2 hmm 04/11] mm/hmm: Simplify hmm_get_or_create and make
 it reliable
To: Jason Gunthorpe <jgg@ziepe.ca>, Jerome Glisse <jglisse@redhat.com>, "Ralph
 Campbell" <rcampbell@nvidia.com>, <Felix.Kuehling@amd.com>
References: <20190606184438.31646-1-jgg@ziepe.ca>
 <20190606184438.31646-5-jgg@ziepe.ca>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <f02db2c8-8639-2142-bb1d-df33240e376c@nvidia.com>
Date: Thu, 6 Jun 2019 19:54:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190606184438.31646-5-jgg@ziepe.ca>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL108.nvidia.com (172.18.146.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Approved-At: Fri, 07 Jun 2019 07:43:40 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1559876066; bh=3huOKZv8HXfSbCtVJDMPY1F6+DxRnSCZ3RkJ5zBunYk=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=VAlAdXP/WVpIOzRKqOZX3nzrP9LNlYjaF6jw7eNfW115o3TuUHozNL7b6/KHHaB8s
 wcjJXlYEc82ETwQGSetT3w5PLrLzdGK5DH8/MtZeqVnz8NiLSQTH8cIigI2+ZFf7oC
 zzbPSf+EnlWzzpjD8iw+IujfhuihOEgfmMQdY6nnIJoFMdysXo//Z0Z1DbyQazuu/A
 LOcBgzViceNSzbV6lMQX4DtVeQumKafO1rxrdA8+57JmvZv1rfOC80ArBgyGKGUtHr
 93DBAhjbe1QCT6BsjcSnkJy6C9QQqCcliCytXT7tlXmLx+gIDkr/IhwP2dv5/MkvsA
 Cy7uig1VG9zeg==
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
R3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgo+IAo+IEFzIGNvZGVkIHRoaXMgZnVuY3Rpb24g
Y2FuIGZhbHNlLWZhaWwgaW4gdmFyaW91cyByYWN5IHNpdHVhdGlvbnMuIE1ha2UgaXQKPiByZWxp
YWJsZSBieSBydW5uaW5nIG9ubHkgdW5kZXIgdGhlIHdyaXRlIHNpZGUgb2YgdGhlIG1tYXBfc2Vt
IGFuZCBhdm9pZGluZwo+IHRoZSBmYWxzZS1mYWlsaW5nIGNvbXBhcmUvZXhjaGFuZ2UgcGF0dGVy
bi4KPiAKPiBBbHNvIG1ha2UgdGhlIGxvY2tpbmcgdmVyeSBlYXN5IHRvIHVuZGVyc3RhbmQgYnkg
b25seSBldmVyIHJlYWRpbmcgb3IKPiB3cml0aW5nIG1tLT5obW0gd2hpbGUgaG9sZGluZyB0aGUg
d3JpdGUgc2lkZSBvZiB0aGUgbW1hcF9zZW0uCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFzb24gR3Vu
dGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgo+IC0tLQo+IHYyOgo+IC0gRml4IGVycm9yIHVud2lu
ZCBvZiBtbWdyYWIgKEplcm9tZSkKPiAtIFVzZSBobW0gbG9jYWwgaW5zdGVhZCBvZiAybmQgY29u
dGFpbmVyX29mIChKZXJvbWUpCj4gLS0tCj4gIG1tL2htbS5jIHwgODAgKysrKysrKysrKysrKysr
KysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDI5IGluc2VydGlvbnMoKyksIDUxIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9t
bS9obW0uYyBiL21tL2htbS5jCj4gaW5kZXggY2M3YzI2ZmRhMzMwMGUuLmRjMzBlZGFkOWE4YTAy
IDEwMDY0NAo+IC0tLSBhL21tL2htbS5jCj4gKysrIGIvbW0vaG1tLmMKPiBAQCAtNDAsMTYgKzQw
LDYgQEAKPiAgI2lmIElTX0VOQUJMRUQoQ09ORklHX0hNTV9NSVJST1IpCj4gIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgbW11X25vdGlmaWVyX29wcyBobW1fbW11X25vdGlmaWVyX29wczsKPiAgCj4gLXN0
YXRpYyBpbmxpbmUgc3RydWN0IGhtbSAqbW1fZ2V0X2htbShzdHJ1Y3QgbW1fc3RydWN0ICptbSkK
PiAtewo+IC0Jc3RydWN0IGhtbSAqaG1tID0gUkVBRF9PTkNFKG1tLT5obW0pOwo+IC0KPiAtCWlm
IChobW0gJiYga3JlZl9nZXRfdW5sZXNzX3plcm8oJmhtbS0+a3JlZikpCj4gLQkJcmV0dXJuIGht
bTsKPiAtCj4gLQlyZXR1cm4gTlVMTDsKPiAtfQo+IC0KPiAgLyoqCj4gICAqIGhtbV9nZXRfb3Jf
Y3JlYXRlIC0gcmVnaXN0ZXIgSE1NIGFnYWluc3QgYW4gbW0gKEhNTSBpbnRlcm5hbCkKPiAgICoK
PiBAQCAtNjQsMTEgKzU0LDIwIEBAIHN0YXRpYyBpbmxpbmUgc3RydWN0IGhtbSAqbW1fZ2V0X2ht
bShzdHJ1Y3QgbW1fc3RydWN0ICptbSkKPiAgICovCj4gIHN0YXRpYyBzdHJ1Y3QgaG1tICpobW1f
Z2V0X29yX2NyZWF0ZShzdHJ1Y3QgbW1fc3RydWN0ICptbSkKPiAgewo+IC0Jc3RydWN0IGhtbSAq
aG1tID0gbW1fZ2V0X2htbShtbSk7Cj4gLQlib29sIGNsZWFudXAgPSBmYWxzZTsKPiArCXN0cnVj
dCBobW0gKmhtbTsKPiAgCj4gLQlpZiAoaG1tKQo+IC0JCXJldHVybiBobW07Cj4gKwlsb2NrZGVw
X2Fzc2VydF9oZWxkX2V4Y2x1c2l2ZSgmbW0tPm1tYXBfc2VtKTsKPiArCj4gKwlpZiAobW0tPmht
bSkgewo+ICsJCWlmIChrcmVmX2dldF91bmxlc3NfemVybygmbW0tPmhtbS0+a3JlZikpCj4gKwkJ
CXJldHVybiBtbS0+aG1tOwo+ICsJCS8qCj4gKwkJICogVGhlIGhtbSBpcyBiZWluZyBmcmVlZCBi
eSBzb21lIG90aGVyIENQVSBhbmQgaXMgcGVuZGluZyBhCj4gKwkJICogUkNVIGdyYWNlIHBlcmlv
ZCwgYnV0IHRoaXMgQ1BVIGNhbiBOVUxMIG5vdyBpdCBzaW5jZSB3ZQo+ICsJCSAqIGhhdmUgdGhl
IG1tYXBfc2VtLgo+ICsJCSAqLwo+ICsJCW1tLT5obW0gPSBOVUxMOwo+ICsJfQo+ICAKPiAgCWht
bSA9IGttYWxsb2Moc2l6ZW9mKCpobW0pLCBHRlBfS0VSTkVMKTsKPiAgCWlmICghaG1tKQo+IEBA
IC04Myw1NyArODIsMzYgQEAgc3RhdGljIHN0cnVjdCBobW0gKmhtbV9nZXRfb3JfY3JlYXRlKHN0
cnVjdCBtbV9zdHJ1Y3QgKm1tKQo+ICAJaG1tLT5ub3RpZmllcnMgPSAwOwo+ICAJaG1tLT5kZWFk
ID0gZmFsc2U7Cj4gIAlobW0tPm1tID0gbW07Cj4gLQltbWdyYWIoaG1tLT5tbSk7Cj4gLQo+IC0J
c3Bpbl9sb2NrKCZtbS0+cGFnZV90YWJsZV9sb2NrKTsKPiAtCWlmICghbW0tPmhtbSkKPiAtCQlt
bS0+aG1tID0gaG1tOwo+IC0JZWxzZQo+IC0JCWNsZWFudXAgPSB0cnVlOwo+IC0Jc3Bpbl91bmxv
Y2soJm1tLT5wYWdlX3RhYmxlX2xvY2spOwo+ICAKPiAtCWlmIChjbGVhbnVwKQo+IC0JCWdvdG8g
ZXJyb3I7Cj4gLQo+IC0JLyoKPiAtCSAqIFdlIHNob3VsZCBvbmx5IGdldCBoZXJlIGlmIGhvbGQg
dGhlIG1tYXBfc2VtIGluIHdyaXRlIG1vZGUgaWUgb24KPiAtCSAqIHJlZ2lzdHJhdGlvbiBvZiBm
aXJzdCBtaXJyb3IgdGhyb3VnaCBobW1fbWlycm9yX3JlZ2lzdGVyKCkKPiAtCSAqLwo+ICAJaG1t
LT5tbXVfbm90aWZpZXIub3BzID0gJmhtbV9tbXVfbm90aWZpZXJfb3BzOwo+IC0JaWYgKF9fbW11
X25vdGlmaWVyX3JlZ2lzdGVyKCZobW0tPm1tdV9ub3RpZmllciwgbW0pKQo+IC0JCWdvdG8gZXJy
b3JfbW07Cj4gKwlpZiAoX19tbXVfbm90aWZpZXJfcmVnaXN0ZXIoJmhtbS0+bW11X25vdGlmaWVy
LCBtbSkpIHsKPiArCQlrZnJlZShobW0pOwo+ICsJCXJldHVybiBOVUxMOwo+ICsJfQo+ICAKPiAr
CW1tZ3JhYihobW0tPm1tKTsKPiArCW1tLT5obW0gPSBobW07Cj4gIAlyZXR1cm4gaG1tOwo+IC0K
PiAtZXJyb3JfbW06Cj4gLQlzcGluX2xvY2soJm1tLT5wYWdlX3RhYmxlX2xvY2spOwo+IC0JaWYg
KG1tLT5obW0gPT0gaG1tKQo+IC0JCW1tLT5obW0gPSBOVUxMOwo+IC0Jc3Bpbl91bmxvY2soJm1t
LT5wYWdlX3RhYmxlX2xvY2spOwo+IC1lcnJvcjoKPiAtCW1tZHJvcChobW0tPm1tKTsKPiAtCWtm
cmVlKGhtbSk7Cj4gLQlyZXR1cm4gTlVMTDsKPiAgfQo+ICAKPiAgc3RhdGljIHZvaWQgaG1tX2Zy
ZWVfcmN1KHN0cnVjdCByY3VfaGVhZCAqcmN1KQo+ICB7Cj4gLQlrZnJlZShjb250YWluZXJfb2Yo
cmN1LCBzdHJ1Y3QgaG1tLCByY3UpKTsKPiArCXN0cnVjdCBobW0gKmhtbSA9IGNvbnRhaW5lcl9v
ZihyY3UsIHN0cnVjdCBobW0sIHJjdSk7Cj4gKwo+ICsJZG93bl93cml0ZSgmaG1tLT5tbS0+bW1h
cF9zZW0pOwo+ICsJaWYgKGhtbS0+bW0tPmhtbSA9PSBobW0pCj4gKwkJaG1tLT5tbS0+aG1tID0g
TlVMTDsKPiArCXVwX3dyaXRlKCZobW0tPm1tLT5tbWFwX3NlbSk7Cj4gKwltbWRyb3AoaG1tLT5t
bSk7Cj4gKwo+ICsJa2ZyZWUoaG1tKTsKPiAgfQo+ICAKPiAgc3RhdGljIHZvaWQgaG1tX2ZyZWUo
c3RydWN0IGtyZWYgKmtyZWYpCj4gIHsKPiAgCXN0cnVjdCBobW0gKmhtbSA9IGNvbnRhaW5lcl9v
ZihrcmVmLCBzdHJ1Y3QgaG1tLCBrcmVmKTsKPiAtCXN0cnVjdCBtbV9zdHJ1Y3QgKm1tID0gaG1t
LT5tbTsKPiAtCj4gLQltbXVfbm90aWZpZXJfdW5yZWdpc3Rlcl9ub19yZWxlYXNlKCZobW0tPm1t
dV9ub3RpZmllciwgbW0pOwo+ICAKPiAtCXNwaW5fbG9jaygmbW0tPnBhZ2VfdGFibGVfbG9jayk7
Cj4gLQlpZiAobW0tPmhtbSA9PSBobW0pCj4gLQkJbW0tPmhtbSA9IE5VTEw7Cj4gLQlzcGluX3Vu
bG9jaygmbW0tPnBhZ2VfdGFibGVfbG9jayk7Cj4gLQo+IC0JbW1kcm9wKGhtbS0+bW0pOwo+ICsJ
bW11X25vdGlmaWVyX3VucmVnaXN0ZXJfbm9fcmVsZWFzZSgmaG1tLT5tbXVfbm90aWZpZXIsIGht
bS0+bW0pOwo+ICAJbW11X25vdGlmaWVyX2NhbGxfc3JjdSgmaG1tLT5yY3UsIGhtbV9mcmVlX3Jj
dSk7Cj4gIH0KPiAgCj4gCgpZZXMuCgogICAgUmV2aWV3ZWQtYnk6IEpvaG4gSHViYmFyZCA8amh1
YmJhcmRAbnZpZGlhLmNvbT4KCgp0aGFua3MsCi0tIApKb2huIEh1YmJhcmQKTlZJRElBCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
