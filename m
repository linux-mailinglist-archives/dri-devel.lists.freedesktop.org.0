Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0203A5AF
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jun 2019 14:55:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 777CC8930C;
	Sun,  9 Jun 2019 12:54:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 312 seconds by postgrey-1.36 at gabe;
 Fri, 07 Jun 2019 18:57:50 UTC
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C61589E43;
 Fri,  7 Jun 2019 18:57:50 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5cfab2730000>; Fri, 07 Jun 2019 11:52:35 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Fri, 07 Jun 2019 11:52:37 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Fri, 07 Jun 2019 11:52:37 -0700
Received: from rcampbell-dev.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 7 Jun
 2019 18:52:33 +0000
Subject: Re: [PATCH v2 hmm 04/11] mm/hmm: Simplify hmm_get_or_create and make
 it reliable
To: Jason Gunthorpe <jgg@ziepe.ca>, Jerome Glisse <jglisse@redhat.com>, "John
 Hubbard" <jhubbard@nvidia.com>, <Felix.Kuehling@amd.com>
References: <20190606184438.31646-1-jgg@ziepe.ca>
 <20190606184438.31646-5-jgg@ziepe.ca>
X-Nvconfidentiality: public
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <b4a65f1c-3c77-4d87-ef73-105a228ef5c5@nvidia.com>
Date: Fri, 7 Jun 2019 11:52:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.0
MIME-Version: 1.0
In-Reply-To: <20190606184438.31646-5-jgg@ziepe.ca>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Approved-At: Sun, 09 Jun 2019 12:54:16 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1559933556; bh=JqPVjfnMUsVeriG51gkWP6yZJVSw9KGyEZqOWsZkh5s=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=Tpulx8QkbwDQeS3neMg+ibT5HeaXuku1Pxc7buSmSIz/TNgnao7w68vNfmatqvB2M
 AgtHUcKcZh3Xuo2Ny8PJR41gFpEm6jJSG4Xp5OzJGD8I0wBrjNhpcuTEdJXQROyDx1
 Obf1mXyzGWh5QwRl/b4a94JMrFD11lYkxielcNCoIPqq4nPv+09O+Lzf2BGIIa40jU
 t5eId2yhHtjCrZGN6s5tw9xiyE2PFiZEg0rjirX8CV6PFDQqqYcDbQUUJqri/d7tRJ
 SARSXaf5PJ2fRkgzBJXtSta2m8cMpAscDIQuo+Y1tzO9vqjuERMYgQ2cP8VdowNlQS
 3+Cg0uokafFaw==
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
IEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4KPiAKPiBBcyBjb2RlZCB0aGlzIGZ1bmN0aW9u
IGNhbiBmYWxzZS1mYWlsIGluIHZhcmlvdXMgcmFjeSBzaXR1YXRpb25zLiBNYWtlIGl0Cj4gcmVs
aWFibGUgYnkgcnVubmluZyBvbmx5IHVuZGVyIHRoZSB3cml0ZSBzaWRlIG9mIHRoZSBtbWFwX3Nl
bSBhbmQgYXZvaWRpbmcKPiB0aGUgZmFsc2UtZmFpbGluZyBjb21wYXJlL2V4Y2hhbmdlIHBhdHRl
cm4uCj4gCj4gQWxzbyBtYWtlIHRoZSBsb2NraW5nIHZlcnkgZWFzeSB0byB1bmRlcnN0YW5kIGJ5
IG9ubHkgZXZlciByZWFkaW5nIG9yCj4gd3JpdGluZyBtbS0+aG1tIHdoaWxlIGhvbGRpbmcgdGhl
IHdyaXRlIHNpZGUgb2YgdGhlIG1tYXBfc2VtLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEphc29uIEd1
bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4KClJldmlld2VkLWJ5OiBSYWxwaCBDYW1wYmVsbCA8
cmNhbXBiZWxsQG52aWRpYS5jb20+Cgo+IC0tLQo+IHYyOgo+IC0gRml4IGVycm9yIHVud2luZCBv
ZiBtbWdyYWIgKEplcm9tZSkKPiAtIFVzZSBobW0gbG9jYWwgaW5zdGVhZCBvZiAybmQgY29udGFp
bmVyX29mIChKZXJvbWUpCj4gLS0tCj4gICBtbS9obW0uYyB8IDgwICsrKysrKysrKysrKysrKysr
KysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gICAxIGZpbGUgY2hhbmdl
ZCwgMjkgaW5zZXJ0aW9ucygrKSwgNTEgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL21t
L2htbS5jIGIvbW0vaG1tLmMKPiBpbmRleCBjYzdjMjZmZGEzMzAwZS4uZGMzMGVkYWQ5YThhMDIg
MTAwNjQ0Cj4gLS0tIGEvbW0vaG1tLmMKPiArKysgYi9tbS9obW0uYwo+IEBAIC00MCwxNiArNDAs
NiBAQAo+ICAgI2lmIElTX0VOQUJMRUQoQ09ORklHX0hNTV9NSVJST1IpCj4gICBzdGF0aWMgY29u
c3Qgc3RydWN0IG1tdV9ub3RpZmllcl9vcHMgaG1tX21tdV9ub3RpZmllcl9vcHM7Cj4gICAKPiAt
c3RhdGljIGlubGluZSBzdHJ1Y3QgaG1tICptbV9nZXRfaG1tKHN0cnVjdCBtbV9zdHJ1Y3QgKm1t
KQo+IC17Cj4gLQlzdHJ1Y3QgaG1tICpobW0gPSBSRUFEX09OQ0UobW0tPmhtbSk7Cj4gLQo+IC0J
aWYgKGhtbSAmJiBrcmVmX2dldF91bmxlc3NfemVybygmaG1tLT5rcmVmKSkKPiAtCQlyZXR1cm4g
aG1tOwo+IC0KPiAtCXJldHVybiBOVUxMOwo+IC19Cj4gLQo+ICAgLyoqCj4gICAgKiBobW1fZ2V0
X29yX2NyZWF0ZSAtIHJlZ2lzdGVyIEhNTSBhZ2FpbnN0IGFuIG1tIChITU0gaW50ZXJuYWwpCj4g
ICAgKgo+IEBAIC02NCwxMSArNTQsMjAgQEAgc3RhdGljIGlubGluZSBzdHJ1Y3QgaG1tICptbV9n
ZXRfaG1tKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tKQo+ICAgICovCj4gICBzdGF0aWMgc3RydWN0IGht
bSAqaG1tX2dldF9vcl9jcmVhdGUoc3RydWN0IG1tX3N0cnVjdCAqbW0pCj4gICB7Cj4gLQlzdHJ1
Y3QgaG1tICpobW0gPSBtbV9nZXRfaG1tKG1tKTsKPiAtCWJvb2wgY2xlYW51cCA9IGZhbHNlOwo+
ICsJc3RydWN0IGhtbSAqaG1tOwo+ICAgCj4gLQlpZiAoaG1tKQo+IC0JCXJldHVybiBobW07Cj4g
Kwlsb2NrZGVwX2Fzc2VydF9oZWxkX2V4Y2x1c2l2ZSgmbW0tPm1tYXBfc2VtKTsKPiArCj4gKwlp
ZiAobW0tPmhtbSkgewo+ICsJCWlmIChrcmVmX2dldF91bmxlc3NfemVybygmbW0tPmhtbS0+a3Jl
ZikpCj4gKwkJCXJldHVybiBtbS0+aG1tOwo+ICsJCS8qCj4gKwkJICogVGhlIGhtbSBpcyBiZWlu
ZyBmcmVlZCBieSBzb21lIG90aGVyIENQVSBhbmQgaXMgcGVuZGluZyBhCj4gKwkJICogUkNVIGdy
YWNlIHBlcmlvZCwgYnV0IHRoaXMgQ1BVIGNhbiBOVUxMIG5vdyBpdCBzaW5jZSB3ZQo+ICsJCSAq
IGhhdmUgdGhlIG1tYXBfc2VtLgo+ICsJCSAqLwo+ICsJCW1tLT5obW0gPSBOVUxMOwo+ICsJfQo+
ICAgCj4gICAJaG1tID0ga21hbGxvYyhzaXplb2YoKmhtbSksIEdGUF9LRVJORUwpOwo+ICAgCWlm
ICghaG1tKQo+IEBAIC04Myw1NyArODIsMzYgQEAgc3RhdGljIHN0cnVjdCBobW0gKmhtbV9nZXRf
b3JfY3JlYXRlKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tKQo+ICAgCWhtbS0+bm90aWZpZXJzID0gMDsK
PiAgIAlobW0tPmRlYWQgPSBmYWxzZTsKPiAgIAlobW0tPm1tID0gbW07Cj4gLQltbWdyYWIoaG1t
LT5tbSk7Cj4gLQo+IC0Jc3Bpbl9sb2NrKCZtbS0+cGFnZV90YWJsZV9sb2NrKTsKPiAtCWlmICgh
bW0tPmhtbSkKPiAtCQltbS0+aG1tID0gaG1tOwo+IC0JZWxzZQo+IC0JCWNsZWFudXAgPSB0cnVl
Owo+IC0Jc3Bpbl91bmxvY2soJm1tLT5wYWdlX3RhYmxlX2xvY2spOwo+ICAgCj4gLQlpZiAoY2xl
YW51cCkKPiAtCQlnb3RvIGVycm9yOwo+IC0KPiAtCS8qCj4gLQkgKiBXZSBzaG91bGQgb25seSBn
ZXQgaGVyZSBpZiBob2xkIHRoZSBtbWFwX3NlbSBpbiB3cml0ZSBtb2RlIGllIG9uCj4gLQkgKiBy
ZWdpc3RyYXRpb24gb2YgZmlyc3QgbWlycm9yIHRocm91Z2ggaG1tX21pcnJvcl9yZWdpc3Rlcigp
Cj4gLQkgKi8KPiAgIAlobW0tPm1tdV9ub3RpZmllci5vcHMgPSAmaG1tX21tdV9ub3RpZmllcl9v
cHM7Cj4gLQlpZiAoX19tbXVfbm90aWZpZXJfcmVnaXN0ZXIoJmhtbS0+bW11X25vdGlmaWVyLCBt
bSkpCj4gLQkJZ290byBlcnJvcl9tbTsKPiArCWlmIChfX21tdV9ub3RpZmllcl9yZWdpc3Rlcigm
aG1tLT5tbXVfbm90aWZpZXIsIG1tKSkgewo+ICsJCWtmcmVlKGhtbSk7Cj4gKwkJcmV0dXJuIE5V
TEw7Cj4gKwl9Cj4gICAKPiArCW1tZ3JhYihobW0tPm1tKTsKPiArCW1tLT5obW0gPSBobW07Cj4g
ICAJcmV0dXJuIGhtbTsKPiAtCj4gLWVycm9yX21tOgo+IC0Jc3Bpbl9sb2NrKCZtbS0+cGFnZV90
YWJsZV9sb2NrKTsKPiAtCWlmIChtbS0+aG1tID09IGhtbSkKPiAtCQltbS0+aG1tID0gTlVMTDsK
PiAtCXNwaW5fdW5sb2NrKCZtbS0+cGFnZV90YWJsZV9sb2NrKTsKPiAtZXJyb3I6Cj4gLQltbWRy
b3AoaG1tLT5tbSk7Cj4gLQlrZnJlZShobW0pOwo+IC0JcmV0dXJuIE5VTEw7Cj4gICB9Cj4gICAK
PiAgIHN0YXRpYyB2b2lkIGhtbV9mcmVlX3JjdShzdHJ1Y3QgcmN1X2hlYWQgKnJjdSkKPiAgIHsK
PiAtCWtmcmVlKGNvbnRhaW5lcl9vZihyY3UsIHN0cnVjdCBobW0sIHJjdSkpOwo+ICsJc3RydWN0
IGhtbSAqaG1tID0gY29udGFpbmVyX29mKHJjdSwgc3RydWN0IGhtbSwgcmN1KTsKPiArCj4gKwlk
b3duX3dyaXRlKCZobW0tPm1tLT5tbWFwX3NlbSk7Cj4gKwlpZiAoaG1tLT5tbS0+aG1tID09IGht
bSkKPiArCQlobW0tPm1tLT5obW0gPSBOVUxMOwo+ICsJdXBfd3JpdGUoJmhtbS0+bW0tPm1tYXBf
c2VtKTsKPiArCW1tZHJvcChobW0tPm1tKTsKPiArCj4gKwlrZnJlZShobW0pOwo+ICAgfQo+ICAg
Cj4gICBzdGF0aWMgdm9pZCBobW1fZnJlZShzdHJ1Y3Qga3JlZiAqa3JlZikKPiAgIHsKPiAgIAlz
dHJ1Y3QgaG1tICpobW0gPSBjb250YWluZXJfb2Yoa3JlZiwgc3RydWN0IGhtbSwga3JlZik7Cj4g
LQlzdHJ1Y3QgbW1fc3RydWN0ICptbSA9IGhtbS0+bW07Cj4gLQo+IC0JbW11X25vdGlmaWVyX3Vu
cmVnaXN0ZXJfbm9fcmVsZWFzZSgmaG1tLT5tbXVfbm90aWZpZXIsIG1tKTsKPiAgIAo+IC0Jc3Bp
bl9sb2NrKCZtbS0+cGFnZV90YWJsZV9sb2NrKTsKPiAtCWlmIChtbS0+aG1tID09IGhtbSkKPiAt
CQltbS0+aG1tID0gTlVMTDsKPiAtCXNwaW5fdW5sb2NrKCZtbS0+cGFnZV90YWJsZV9sb2NrKTsK
PiAtCj4gLQltbWRyb3AoaG1tLT5tbSk7Cj4gKwltbXVfbm90aWZpZXJfdW5yZWdpc3Rlcl9ub19y
ZWxlYXNlKCZobW0tPm1tdV9ub3RpZmllciwgaG1tLT5tbSk7Cj4gICAJbW11X25vdGlmaWVyX2Nh
bGxfc3JjdSgmaG1tLT5yY3UsIGhtbV9mcmVlX3JjdSk7Cj4gICB9Cj4gICAKPiAKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
