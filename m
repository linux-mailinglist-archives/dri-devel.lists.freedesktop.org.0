Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF4D38566
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 09:45:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2BC689A98;
	Fri,  7 Jun 2019 07:43:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 717CB899BC;
 Fri,  7 Jun 2019 02:36:18 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5cf9cd930000>; Thu, 06 Jun 2019 19:36:03 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Thu, 06 Jun 2019 19:36:17 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Thu, 06 Jun 2019 19:36:17 -0700
Received: from [10.110.48.28] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 7 Jun
 2019 02:36:16 +0000
Subject: Re: [PATCH v2 hmm 02/11] mm/hmm: Use hmm_mirror not mm as an argument
 for hmm_range_register
To: Jason Gunthorpe <jgg@ziepe.ca>, Jerome Glisse <jglisse@redhat.com>, "Ralph
 Campbell" <rcampbell@nvidia.com>, <Felix.Kuehling@amd.com>
References: <20190606184438.31646-1-jgg@ziepe.ca>
 <20190606184438.31646-3-jgg@ziepe.ca>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <7902a4fa-f789-de3f-e448-a8cfc412f40b@nvidia.com>
Date: Thu, 6 Jun 2019 19:36:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190606184438.31646-3-jgg@ziepe.ca>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL103.nvidia.com (172.20.187.11) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Approved-At: Fri, 07 Jun 2019 07:43:40 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1559874963; bh=VS+EJuXcHOl/Y4VTDcHn1QB4ZCx6paXXC66trO1FQ50=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=Al0TXJZBwEkVZOZLD+8oC+fGR+4awq+psveUro+gmkBw0ex9RNhYyL2afTzYC14Gr
 8zB5XgAXfiKt5Ff+657AS8ZHpALXU0H/KUEvYt9Mi7EarnemI51LhZ5vBL29ckj1zd
 HP+FGiZDyljWrHzzDBl3Uzj3nlWpgR9gxtx1fChJdV8n1uEp+pOMmXcSI4THVyOuz4
 n6AOMfvn4cvrqQMM4O9BBxmDqcFBYuAjgDD0zIF/AKUB6D3WrX7nk49LFB2nZf5tzU
 4H43m7RivZWoi8z1XfLcHDx2C0oWYchI7sQt2wgJByok8/0FGFOqi+QL4QrsnjcO0+
 EOVIBu40QOceA==
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
R3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgo+IAo+IFJhbHBoIG9ic2VydmVzIHRoYXQgaG1t
X3JhbmdlX3JlZ2lzdGVyKCkgY2FuIG9ubHkgYmUgY2FsbGVkIGJ5IGEgZHJpdmVyCj4gd2hpbGUg
YSBtaXJyb3IgaXMgcmVnaXN0ZXJlZC4gTWFrZSB0aGlzIGNsZWFyIGluIHRoZSBBUEkgYnkgcGFz
c2luZyBpbiB0aGUKPiBtaXJyb3Igc3RydWN0dXJlIGFzIGEgcGFyYW1ldGVyLgo+IAo+IFRoaXMg
YWxzbyBzaW1wbGlmaWVzIHVuZGVyc3RhbmRpbmcgdGhlIGxpZmV0aW1lIG1vZGVsIGZvciBzdHJ1
Y3QgaG1tLCBhcwo+IHRoZSBobW0gcG9pbnRlciBtdXN0IGJlIHZhbGlkIGFzIHBhcnQgb2YgYSBy
ZWdpc3RlcmVkIG1pcnJvciBzbyBhbGwgd2UKPiBuZWVkIGluIGhtbV9yZWdpc3Rlcl9yYW5nZSgp
IGlzIGEgc2ltcGxlIGtyZWZfZ2V0Lgo+IAo+IFN1Z2dlc3RlZC1ieTogUmFscGggQ2FtcGJlbGwg
PHJjYW1wYmVsbEBudmlkaWEuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEphc29uIEd1bnRob3JwZSA8
amdnQG1lbGxhbm94LmNvbT4KPiAtLS0KPiB2Mgo+IC0gSW5jbHVkZSB0aGUgb25lbGluZSBwYXRj
aCB0byBub3V2ZWF1X3N2bS5jCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZl
YXVfc3ZtLmMgfCAgMiArLQo+ICBpbmNsdWRlL2xpbnV4L2htbS5oICAgICAgICAgICAgICAgICAg
IHwgIDcgKysrKy0tLQo+ICBtbS9obW0uYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwg
MTUgKysrKysrLS0tLS0tLS0tCj4gIDMgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwg
MTMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1
L25vdXZlYXVfc3ZtLmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3N2bS5jCj4g
aW5kZXggOTNlZDQzYzQxM2YwYmIuLjhjOTIzNzRhZmNmMjI3IDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfc3ZtLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
bm91dmVhdS9ub3V2ZWF1X3N2bS5jCj4gQEAgLTY0OSw3ICs2NDksNyBAQCBub3V2ZWF1X3N2bV9m
YXVsdChzdHJ1Y3QgbnZpZl9ub3RpZnkgKm5vdGlmeSkKPiAgCQlyYW5nZS52YWx1ZXMgPSBub3V2
ZWF1X3N2bV9wZm5fdmFsdWVzOwo+ICAJCXJhbmdlLnBmbl9zaGlmdCA9IE5WSUZfVk1NX1BGTk1B
UF9WMF9BRERSX1NISUZUOwo+ICBhZ2FpbjoKPiAtCQlyZXQgPSBobW1fdm1hX2ZhdWx0KCZyYW5n
ZSwgdHJ1ZSk7Cj4gKwkJcmV0ID0gaG1tX3ZtYV9mYXVsdCgmc3ZtbS0+bWlycm9yLCAmcmFuZ2Us
IHRydWUpOwo+ICAJCWlmIChyZXQgPT0gMCkgewo+ICAJCQltdXRleF9sb2NrKCZzdm1tLT5tdXRl
eCk7Cj4gIAkJCWlmICghaG1tX3ZtYV9yYW5nZV9kb25lKCZyYW5nZSkpIHsKPiBkaWZmIC0tZ2l0
IGEvaW5jbHVkZS9saW51eC9obW0uaCBiL2luY2x1ZGUvbGludXgvaG1tLmgKPiBpbmRleCA2ODhj
NWNhNzA2ODc5NS4uMmQ1MTk3OTdjYjEzNGEgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9saW51eC9o
bW0uaAo+ICsrKyBiL2luY2x1ZGUvbGludXgvaG1tLmgKPiBAQCAtNTA1LDcgKzUwNSw3IEBAIHN0
YXRpYyBpbmxpbmUgYm9vbCBobW1fbWlycm9yX21tX2lzX2FsaXZlKHN0cnVjdCBobW1fbWlycm9y
ICptaXJyb3IpCj4gICAqIFBsZWFzZSBzZWUgRG9jdW1lbnRhdGlvbi92bS9obW0ucnN0IGZvciBo
b3cgdG8gdXNlIHRoZSByYW5nZSBBUEkuCj4gICAqLwo+ICBpbnQgaG1tX3JhbmdlX3JlZ2lzdGVy
KHN0cnVjdCBobW1fcmFuZ2UgKnJhbmdlLAo+IC0JCSAgICAgICBzdHJ1Y3QgbW1fc3RydWN0ICpt
bSwKPiArCQkgICAgICAgc3RydWN0IGhtbV9taXJyb3IgKm1pcnJvciwKPiAgCQkgICAgICAgdW5z
aWduZWQgbG9uZyBzdGFydCwKPiAgCQkgICAgICAgdW5zaWduZWQgbG9uZyBlbmQsCj4gIAkJICAg
ICAgIHVuc2lnbmVkIHBhZ2Vfc2hpZnQpOwo+IEBAIC01NDEsNyArNTQxLDggQEAgc3RhdGljIGlu
bGluZSBib29sIGhtbV92bWFfcmFuZ2VfZG9uZShzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSkKPiAg
fQo+ICAKPiAgLyogVGhpcyBpcyBhIHRlbXBvcmFyeSBoZWxwZXIgdG8gYXZvaWQgbWVyZ2UgY29u
ZmxpY3QgYmV0d2VlbiB0cmVlcy4gKi8KPiAtc3RhdGljIGlubGluZSBpbnQgaG1tX3ZtYV9mYXVs
dChzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSwgYm9vbCBibG9jaykKPiArc3RhdGljIGlubGluZSBp
bnQgaG1tX3ZtYV9mYXVsdChzdHJ1Y3QgaG1tX21pcnJvciAqbWlycm9yLAo+ICsJCQkJc3RydWN0
IGhtbV9yYW5nZSAqcmFuZ2UsIGJvb2wgYmxvY2spCj4gIHsKPiAgCWxvbmcgcmV0Owo+ICAKPiBA
QCAtNTU0LDcgKzU1NSw3IEBAIHN0YXRpYyBpbmxpbmUgaW50IGhtbV92bWFfZmF1bHQoc3RydWN0
IGhtbV9yYW5nZSAqcmFuZ2UsIGJvb2wgYmxvY2spCj4gIAlyYW5nZS0+ZGVmYXVsdF9mbGFncyA9
IDA7Cj4gIAlyYW5nZS0+cGZuX2ZsYWdzX21hc2sgPSAtMVVMOwo+ICAKPiAtCXJldCA9IGhtbV9y
YW5nZV9yZWdpc3RlcihyYW5nZSwgcmFuZ2UtPnZtYS0+dm1fbW0sCj4gKwlyZXQgPSBobW1fcmFu
Z2VfcmVnaXN0ZXIocmFuZ2UsIG1pcnJvciwKPiAgCQkJCSByYW5nZS0+c3RhcnQsIHJhbmdlLT5l
bmQsCj4gIAkJCQkgUEFHRV9TSElGVCk7Cj4gIAlpZiAocmV0KQo+IGRpZmYgLS1naXQgYS9tbS9o
bW0uYyBiL21tL2htbS5jCj4gaW5kZXggNTQ3MDAyZjU2YTE2M2QuLjg3OTY0NDcyOTkwMjNjIDEw
MDY0NAo+IC0tLSBhL21tL2htbS5jCj4gKysrIGIvbW0vaG1tLmMKPiBAQCAtOTI1LDEzICs5MjUs
MTMgQEAgc3RhdGljIHZvaWQgaG1tX3BmbnNfY2xlYXIoc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2Us
Cj4gICAqIFRyYWNrIHVwZGF0ZXMgdG8gdGhlIENQVSBwYWdlIHRhYmxlIHNlZSBpbmNsdWRlL2xp
bnV4L2htbS5oCj4gICAqLwo+ICBpbnQgaG1tX3JhbmdlX3JlZ2lzdGVyKHN0cnVjdCBobW1fcmFu
Z2UgKnJhbmdlLAo+IC0JCSAgICAgICBzdHJ1Y3QgbW1fc3RydWN0ICptbSwKPiArCQkgICAgICAg
c3RydWN0IGhtbV9taXJyb3IgKm1pcnJvciwKPiAgCQkgICAgICAgdW5zaWduZWQgbG9uZyBzdGFy
dCwKPiAgCQkgICAgICAgdW5zaWduZWQgbG9uZyBlbmQsCj4gIAkJICAgICAgIHVuc2lnbmVkIHBh
Z2Vfc2hpZnQpCj4gIHsKPiAgCXVuc2lnbmVkIGxvbmcgbWFzayA9ICgoMVVMIDw8IHBhZ2Vfc2hp
ZnQpIC0gMVVMKTsKPiAtCXN0cnVjdCBobW0gKmhtbTsKPiArCXN0cnVjdCBobW0gKmhtbSA9IG1p
cnJvci0+aG1tOwo+ICAKPiAgCXJhbmdlLT52YWxpZCA9IGZhbHNlOwo+ICAJcmFuZ2UtPmhtbSA9
IE5VTEw7Cj4gQEAgLTk0NSwxNSArOTQ1LDEyIEBAIGludCBobW1fcmFuZ2VfcmVnaXN0ZXIoc3Ry
dWN0IGhtbV9yYW5nZSAqcmFuZ2UsCj4gIAlyYW5nZS0+c3RhcnQgPSBzdGFydDsKPiAgCXJhbmdl
LT5lbmQgPSBlbmQ7Cj4gIAo+IC0JaG1tID0gaG1tX2dldF9vcl9jcmVhdGUobW0pOwo+IC0JaWYg
KCFobW0pCj4gLQkJcmV0dXJuIC1FRkFVTFQ7Cj4gLQo+ICAJLyogQ2hlY2sgaWYgaG1tX21tX2Rl
c3Ryb3koKSB3YXMgY2FsbC4gKi8KPiAtCWlmIChobW0tPm1tID09IE5VTEwgfHwgaG1tLT5kZWFk
KSB7Cj4gLQkJaG1tX3B1dChobW0pOwo+ICsJaWYgKGhtbS0+bW0gPT0gTlVMTCB8fCBobW0tPmRl
YWQpCj4gIAkJcmV0dXJuIC1FRkFVTFQ7Cj4gLQl9Cj4gKwo+ICsJcmFuZ2UtPmhtbSA9IGhtbTsK
PiArCWtyZWZfZ2V0KCZobW0tPmtyZWYpOwo+ICAKPiAgCS8qIEluaXRpYWxpemUgcmFuZ2UgdG8g
dHJhY2sgQ1BVIHBhZ2UgdGFibGUgdXBkYXRlcy4gKi8KPiAgCW11dGV4X2xvY2soJmhtbS0+bG9j
ayk7Cj4gCgpJJ20gbm90IGEgcXVhbGlmaWVkIE5vdXZlYXUgcmV2aWV3ZXIsIGJ1dCB0aGlzIGxv
b2tzIG9idmlvdXNseSBjb3JyZWN0LApzbzoKCiAgICBSZXZpZXdlZC1ieTogSm9obiBIdWJiYXJk
IDxqaHViYmFyZEBudmlkaWEuY29tPgoKCnRoYW5rcywKLS0gCkpvaG4gSHViYmFyZApOVklESUEK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
