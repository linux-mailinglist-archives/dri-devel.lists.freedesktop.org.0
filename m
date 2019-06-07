Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DA53A5BE
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jun 2019 14:55:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C7B38933C;
	Sun,  9 Jun 2019 12:54:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA18389DDF;
 Fri,  7 Jun 2019 18:24:47 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5cfaabef0000>; Fri, 07 Jun 2019 11:24:47 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Fri, 07 Jun 2019 11:24:47 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Fri, 07 Jun 2019 11:24:47 -0700
Received: from rcampbell-dev.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 7 Jun
 2019 18:24:44 +0000
Subject: Re: [PATCH v2 hmm 02/11] mm/hmm: Use hmm_mirror not mm as an argument
 for hmm_range_register
To: Jason Gunthorpe <jgg@ziepe.ca>, Jerome Glisse <jglisse@redhat.com>, "John
 Hubbard" <jhubbard@nvidia.com>, <Felix.Kuehling@amd.com>
References: <20190606184438.31646-1-jgg@ziepe.ca>
 <20190606184438.31646-3-jgg@ziepe.ca>
X-Nvconfidentiality: public
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <4a391bd4-287c-5f13-3bca-c6a46ff8d08c@nvidia.com>
Date: Fri, 7 Jun 2019 11:24:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.0
MIME-Version: 1.0
In-Reply-To: <20190606184438.31646-3-jgg@ziepe.ca>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL108.nvidia.com (172.18.146.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Approved-At: Sun, 09 Jun 2019 12:54:16 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1559931887; bh=xt8hRcHzLeQkLBeS1/P3+kfd7HxoS8TOq54zYdn437c=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=Jzl10aMIEyNyvMJQOea9/cem8BK3fdX7N7BBW39ZQ2ZTnhr3i9Bg45PYwohda1UY9
 LkcU8MB8OKdUMSj8b6yUghIjjinGIugW4aSBllEIx7TVCfwzbApXGQL3P9ClD/AN2z
 Yv3rNjAyUFe/mSLyYvWlzlYj8psKbq2qMRJzEB+cKi7ZRC9AQCwhtNhX/CDYSmifhd
 OgQAo1Xs1VMOWXccxd1U6MRqnzkHVOsG3cy4I45UtG8jiXu1hu6emUv1Z1CwQxFrGP
 /0qhySFwJdt1mao3BY0IXnmpWfz2Fu3UMQQ3D0H/L5X1ETwrAIQVgVzM8gB201RZnz
 ZlKK89hwVr+aw==
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
IEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4KPiAKPiBSYWxwaCBvYnNlcnZlcyB0aGF0IGht
bV9yYW5nZV9yZWdpc3RlcigpIGNhbiBvbmx5IGJlIGNhbGxlZCBieSBhIGRyaXZlcgo+IHdoaWxl
IGEgbWlycm9yIGlzIHJlZ2lzdGVyZWQuIE1ha2UgdGhpcyBjbGVhciBpbiB0aGUgQVBJIGJ5IHBh
c3NpbmcgaW4gdGhlCj4gbWlycm9yIHN0cnVjdHVyZSBhcyBhIHBhcmFtZXRlci4KPiAKPiBUaGlz
IGFsc28gc2ltcGxpZmllcyB1bmRlcnN0YW5kaW5nIHRoZSBsaWZldGltZSBtb2RlbCBmb3Igc3Ry
dWN0IGhtbSwgYXMKPiB0aGUgaG1tIHBvaW50ZXIgbXVzdCBiZSB2YWxpZCBhcyBwYXJ0IG9mIGEg
cmVnaXN0ZXJlZCBtaXJyb3Igc28gYWxsIHdlCj4gbmVlZCBpbiBobW1fcmVnaXN0ZXJfcmFuZ2Uo
KSBpcyBhIHNpbXBsZSBrcmVmX2dldC4KPiAKPiBTdWdnZXN0ZWQtYnk6IFJhbHBoIENhbXBiZWxs
IDxyY2FtcGJlbGxAbnZpZGlhLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBKYXNvbiBHdW50aG9ycGUg
PGpnZ0BtZWxsYW5veC5jb20+CgpZb3UgbWlnaHQgQ0MgQmVuIGZvciB0aGUgbm91dmVhdSBwYXJ0
LgpDQzogQmVuIFNrZWdncyA8YnNrZWdnc0ByZWRoYXQuY29tPgoKUmV2aWV3ZWQtYnk6IFJhbHBo
IENhbXBiZWxsIDxyY2FtcGJlbGxAbnZpZGlhLmNvbT4KCgo+IC0tLQo+IHYyCj4gLSBJbmNsdWRl
IHRoZSBvbmVsaW5lIHBhdGNoIHRvIG5vdXZlYXVfc3ZtLmMKPiAtLS0KPiAgIGRyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L25vdXZlYXVfc3ZtLmMgfCAgMiArLQo+ICAgaW5jbHVkZS9saW51eC9obW0u
aCAgICAgICAgICAgICAgICAgICB8ICA3ICsrKystLS0KPiAgIG1tL2htbS5jICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAxNSArKysrKystLS0tLS0tLS0KPiAgIDMgZmlsZXMgY2hhbmdl
ZCwgMTEgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfc3ZtLmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91
dmVhdS9ub3V2ZWF1X3N2bS5jCj4gaW5kZXggOTNlZDQzYzQxM2YwYmIuLjhjOTIzNzRhZmNmMjI3
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfc3ZtLmMKPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3N2bS5jCj4gQEAgLTY0OSw3ICs2
NDksNyBAQCBub3V2ZWF1X3N2bV9mYXVsdChzdHJ1Y3QgbnZpZl9ub3RpZnkgKm5vdGlmeSkKPiAg
IAkJcmFuZ2UudmFsdWVzID0gbm91dmVhdV9zdm1fcGZuX3ZhbHVlczsKPiAgIAkJcmFuZ2UucGZu
X3NoaWZ0ID0gTlZJRl9WTU1fUEZOTUFQX1YwX0FERFJfU0hJRlQ7Cj4gICBhZ2FpbjoKPiAtCQly
ZXQgPSBobW1fdm1hX2ZhdWx0KCZyYW5nZSwgdHJ1ZSk7Cj4gKwkJcmV0ID0gaG1tX3ZtYV9mYXVs
dCgmc3ZtbS0+bWlycm9yLCAmcmFuZ2UsIHRydWUpOwo+ICAgCQlpZiAocmV0ID09IDApIHsKPiAg
IAkJCW11dGV4X2xvY2soJnN2bW0tPm11dGV4KTsKPiAgIAkJCWlmICghaG1tX3ZtYV9yYW5nZV9k
b25lKCZyYW5nZSkpIHsKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9obW0uaCBiL2luY2x1
ZGUvbGludXgvaG1tLmgKPiBpbmRleCA2ODhjNWNhNzA2ODc5NS4uMmQ1MTk3OTdjYjEzNGEgMTAw
NjQ0Cj4gLS0tIGEvaW5jbHVkZS9saW51eC9obW0uaAo+ICsrKyBiL2luY2x1ZGUvbGludXgvaG1t
LmgKPiBAQCAtNTA1LDcgKzUwNSw3IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBobW1fbWlycm9yX21t
X2lzX2FsaXZlKHN0cnVjdCBobW1fbWlycm9yICptaXJyb3IpCj4gICAgKiBQbGVhc2Ugc2VlIERv
Y3VtZW50YXRpb24vdm0vaG1tLnJzdCBmb3IgaG93IHRvIHVzZSB0aGUgcmFuZ2UgQVBJLgo+ICAg
ICovCj4gICBpbnQgaG1tX3JhbmdlX3JlZ2lzdGVyKHN0cnVjdCBobW1fcmFuZ2UgKnJhbmdlLAo+
IC0JCSAgICAgICBzdHJ1Y3QgbW1fc3RydWN0ICptbSwKPiArCQkgICAgICAgc3RydWN0IGhtbV9t
aXJyb3IgKm1pcnJvciwKPiAgIAkJICAgICAgIHVuc2lnbmVkIGxvbmcgc3RhcnQsCj4gICAJCSAg
ICAgICB1bnNpZ25lZCBsb25nIGVuZCwKPiAgIAkJICAgICAgIHVuc2lnbmVkIHBhZ2Vfc2hpZnQp
Owo+IEBAIC01NDEsNyArNTQxLDggQEAgc3RhdGljIGlubGluZSBib29sIGhtbV92bWFfcmFuZ2Vf
ZG9uZShzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSkKPiAgIH0KPiAgIAo+ICAgLyogVGhpcyBpcyBh
IHRlbXBvcmFyeSBoZWxwZXIgdG8gYXZvaWQgbWVyZ2UgY29uZmxpY3QgYmV0d2VlbiB0cmVlcy4g
Ki8KPiAtc3RhdGljIGlubGluZSBpbnQgaG1tX3ZtYV9mYXVsdChzdHJ1Y3QgaG1tX3JhbmdlICpy
YW5nZSwgYm9vbCBibG9jaykKPiArc3RhdGljIGlubGluZSBpbnQgaG1tX3ZtYV9mYXVsdChzdHJ1
Y3QgaG1tX21pcnJvciAqbWlycm9yLAo+ICsJCQkJc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2UsIGJv
b2wgYmxvY2spCj4gICB7Cj4gICAJbG9uZyByZXQ7Cj4gICAKPiBAQCAtNTU0LDcgKzU1NSw3IEBA
IHN0YXRpYyBpbmxpbmUgaW50IGhtbV92bWFfZmF1bHQoc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2Us
IGJvb2wgYmxvY2spCj4gICAJcmFuZ2UtPmRlZmF1bHRfZmxhZ3MgPSAwOwo+ICAgCXJhbmdlLT5w
Zm5fZmxhZ3NfbWFzayA9IC0xVUw7Cj4gICAKPiAtCXJldCA9IGhtbV9yYW5nZV9yZWdpc3Rlcihy
YW5nZSwgcmFuZ2UtPnZtYS0+dm1fbW0sCj4gKwlyZXQgPSBobW1fcmFuZ2VfcmVnaXN0ZXIocmFu
Z2UsIG1pcnJvciwKPiAgIAkJCQkgcmFuZ2UtPnN0YXJ0LCByYW5nZS0+ZW5kLAo+ICAgCQkJCSBQ
QUdFX1NISUZUKTsKPiAgIAlpZiAocmV0KQo+IGRpZmYgLS1naXQgYS9tbS9obW0uYyBiL21tL2ht
bS5jCj4gaW5kZXggNTQ3MDAyZjU2YTE2M2QuLjg3OTY0NDcyOTkwMjNjIDEwMDY0NAo+IC0tLSBh
L21tL2htbS5jCj4gKysrIGIvbW0vaG1tLmMKPiBAQCAtOTI1LDEzICs5MjUsMTMgQEAgc3RhdGlj
IHZvaWQgaG1tX3BmbnNfY2xlYXIoc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2UsCj4gICAgKiBUcmFj
ayB1cGRhdGVzIHRvIHRoZSBDUFUgcGFnZSB0YWJsZSBzZWUgaW5jbHVkZS9saW51eC9obW0uaAo+
ICAgICovCj4gICBpbnQgaG1tX3JhbmdlX3JlZ2lzdGVyKHN0cnVjdCBobW1fcmFuZ2UgKnJhbmdl
LAo+IC0JCSAgICAgICBzdHJ1Y3QgbW1fc3RydWN0ICptbSwKPiArCQkgICAgICAgc3RydWN0IGht
bV9taXJyb3IgKm1pcnJvciwKPiAgIAkJICAgICAgIHVuc2lnbmVkIGxvbmcgc3RhcnQsCj4gICAJ
CSAgICAgICB1bnNpZ25lZCBsb25nIGVuZCwKPiAgIAkJICAgICAgIHVuc2lnbmVkIHBhZ2Vfc2hp
ZnQpCj4gICB7Cj4gICAJdW5zaWduZWQgbG9uZyBtYXNrID0gKCgxVUwgPDwgcGFnZV9zaGlmdCkg
LSAxVUwpOwo+IC0Jc3RydWN0IGhtbSAqaG1tOwo+ICsJc3RydWN0IGhtbSAqaG1tID0gbWlycm9y
LT5obW07Cj4gICAKPiAgIAlyYW5nZS0+dmFsaWQgPSBmYWxzZTsKPiAgIAlyYW5nZS0+aG1tID0g
TlVMTDsKPiBAQCAtOTQ1LDE1ICs5NDUsMTIgQEAgaW50IGhtbV9yYW5nZV9yZWdpc3RlcihzdHJ1
Y3QgaG1tX3JhbmdlICpyYW5nZSwKPiAgIAlyYW5nZS0+c3RhcnQgPSBzdGFydDsKPiAgIAlyYW5n
ZS0+ZW5kID0gZW5kOwo+ICAgCj4gLQlobW0gPSBobW1fZ2V0X29yX2NyZWF0ZShtbSk7Cj4gLQlp
ZiAoIWhtbSkKPiAtCQlyZXR1cm4gLUVGQVVMVDsKPiAtCj4gICAJLyogQ2hlY2sgaWYgaG1tX21t
X2Rlc3Ryb3koKSB3YXMgY2FsbC4gKi8KPiAtCWlmIChobW0tPm1tID09IE5VTEwgfHwgaG1tLT5k
ZWFkKSB7Cj4gLQkJaG1tX3B1dChobW0pOwo+ICsJaWYgKGhtbS0+bW0gPT0gTlVMTCB8fCBobW0t
PmRlYWQpCj4gICAJCXJldHVybiAtRUZBVUxUOwo+IC0JfQo+ICsKPiArCXJhbmdlLT5obW0gPSBo
bW07Cj4gKwlrcmVmX2dldCgmaG1tLT5rcmVmKTsKPiAgIAo+ICAgCS8qIEluaXRpYWxpemUgcmFu
Z2UgdG8gdHJhY2sgQ1BVIHBhZ2UgdGFibGUgdXBkYXRlcy4gKi8KPiAgIAltdXRleF9sb2NrKCZo
bW0tPmxvY2spOwo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
