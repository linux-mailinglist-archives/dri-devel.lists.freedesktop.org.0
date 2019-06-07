Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB21738587
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 09:46:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E066D89C1C;
	Fri,  7 Jun 2019 07:44:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A19B0899D5;
 Fri,  7 Jun 2019 03:06:58 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5cf9d4d00000>; Thu, 06 Jun 2019 20:06:56 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Thu, 06 Jun 2019 20:06:58 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Thu, 06 Jun 2019 20:06:58 -0700
Received: from [10.110.48.28] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 7 Jun
 2019 03:06:53 +0000
Subject: Re: [PATCH v2 hmm 05/11] mm/hmm: Remove duplicate condition test
 before wait_event_timeout
To: Jason Gunthorpe <jgg@ziepe.ca>, Jerome Glisse <jglisse@redhat.com>, "Ralph
 Campbell" <rcampbell@nvidia.com>, <Felix.Kuehling@amd.com>
References: <20190606184438.31646-1-jgg@ziepe.ca>
 <20190606184438.31646-6-jgg@ziepe.ca>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <86962e22-88b1-c1bf-d704-d5a5053fa100@nvidia.com>
Date: Thu, 6 Jun 2019 20:06:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190606184438.31646-6-jgg@ziepe.ca>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Approved-At: Fri, 07 Jun 2019 07:43:40 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1559876816; bh=70o7ZS6CN7LiHClrr+qrAlqXgM2IDbvgx4VtZ9W6MfI=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=rcX/eN6SVVb8ntWY1bOCeo2lBWMdj/N0N59oEGCkUxTi+CQysb8+Bm72YdWdznjXv
 uMOqdy7CCjAssMyL0E+Wpqk7VGurL+Y48RwVXOiE8ewwA1U8PM/9NZJE3xkitfRbtm
 2R0tTcKErsh4WABPJBiUUMm4qcT3D6UQGwZHfks5mqPWmj/hL5PzkvqZmoGIUzQXf3
 h9jcXai0x0Nv32FWsJ/50DqS9x6531hNChV2FjPMMCXA0i+ZaV8RiLIfBNHoaTVury
 k8sBx3IJeGnHRXFDISxYSujNyNbyr19jEa+rGYPb4C2q0guYMp9a4Ef1nDI5HcNP4z
 RX+XUhHxNd0JQ==
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
R3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgo+IAo+IFRoZSB3YWl0X2V2ZW50X3RpbWVvdXQg
bWFjcm8gYWxyZWFkeSB0ZXN0cyB0aGUgY29uZGl0aW9uIGFzIGl0cyBmaXJzdAo+IGFjdGlvbiwg
c28gdGhlcmUgaXMgbm8gcmVhc29uIHRvIG9wZW4gY29kZSBhbm90aGVyIHZlcnNpb24gb2YgdGhp
cywgYWxsCj4gdGhhdCBkb2VzIGlzIHNraXAgdGhlIG1pZ2h0X3NsZWVwKCkgZGVidWdnaW5nIGlu
IGNvbW1vbiBjYXNlcywgd2hpY2ggaXMKPiBub3QgaGVscGZ1bC4KPiAKPiBGdXJ0aGVyLCBiYXNl
ZCBvbiBwcmlvciBwYXRjaGVzLCB3ZSBjYW4gbm8gc2ltcGxpZnkgdGhlIHJlcXVpcmVkIGNvbmRp
dGlvbgoKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIm5vdyBzaW1w
bGlmeSIKCj4gdGVzdDoKPiAgLSBJZiByYW5nZSBpcyB2YWxpZCBtZW1vcnkgdGhlbiBzbyBpcyBy
YW5nZS0+aG1tCj4gIC0gSWYgaG1tX3JlbGVhc2UoKSBoYXMgcnVuIHRoZW4gcmFuZ2UtPnZhbGlk
IGlzIHNldCB0byBmYWxzZQo+ICAgIGF0IHRoZSBzYW1lIHRpbWUgYXMgZGVhZCwgc28gbm8gcmVh
c29uIHRvIGNoZWNrIGJvdGguCj4gIC0gQSB2YWxpZCBobW0gaGFzIGEgdmFsaWQgaG1tLT5tbS4K
PiAKPiBBbHNvLCBhZGQgdGhlIFJFQURfT05DRSBmb3IgcmFuZ2UtPnZhbGlkIGFzIHRoZXJlIGlz
IG5vIGxvY2sgaGVsZCBoZXJlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEphc29uIEd1bnRob3JwZSA8
amdnQG1lbGxhbm94LmNvbT4KPiBSZXZpZXdlZC1ieTogSsOpcsO0bWUgR2xpc3NlIDxqZ2xpc3Nl
QHJlZGhhdC5jb20+Cj4gLS0tCj4gIGluY2x1ZGUvbGludXgvaG1tLmggfCAxMiArKy0tLS0tLS0t
LS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCj4g
Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvaG1tLmggYi9pbmNsdWRlL2xpbnV4L2htbS5o
Cj4gaW5kZXggNGVlM2FjYWJlNWVkMjIuLjJhYjM1YjQwOTkyYjI0IDEwMDY0NAo+IC0tLSBhL2lu
Y2x1ZGUvbGludXgvaG1tLmgKPiArKysgYi9pbmNsdWRlL2xpbnV4L2htbS5oCj4gQEAgLTIxOCwx
NyArMjE4LDkgQEAgc3RhdGljIGlubGluZSB1bnNpZ25lZCBsb25nIGhtbV9yYW5nZV9wYWdlX3Np
emUoY29uc3Qgc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2UpCj4gIHN0YXRpYyBpbmxpbmUgYm9vbCBo
bW1fcmFuZ2Vfd2FpdF91bnRpbF92YWxpZChzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSwKPiAgCQkJ
CQkgICAgICB1bnNpZ25lZCBsb25nIHRpbWVvdXQpCj4gIHsKPiAtCS8qIENoZWNrIGlmIG1tIGlz
IGRlYWQgPyAqLwo+IC0JaWYgKHJhbmdlLT5obW0gPT0gTlVMTCB8fCByYW5nZS0+aG1tLT5kZWFk
IHx8IHJhbmdlLT5obW0tPm1tID09IE5VTEwpIHsKPiAtCQlyYW5nZS0+dmFsaWQgPSBmYWxzZTsK
PiAtCQlyZXR1cm4gZmFsc2U7Cj4gLQl9Cj4gLQlpZiAocmFuZ2UtPnZhbGlkKQo+IC0JCXJldHVy
biB0cnVlOwo+IC0Jd2FpdF9ldmVudF90aW1lb3V0KHJhbmdlLT5obW0tPndxLCByYW5nZS0+dmFs
aWQgfHwgcmFuZ2UtPmhtbS0+ZGVhZCwKPiArCXdhaXRfZXZlbnRfdGltZW91dChyYW5nZS0+aG1t
LT53cSwgcmFuZ2UtPnZhbGlkLAo+ICAJCQkgICBtc2Vjc190b19qaWZmaWVzKHRpbWVvdXQpKTsK
PiAtCS8qIFJldHVybiBjdXJyZW50IHZhbGlkIHN0YXR1cyBqdXN0IGluIGNhc2Ugd2UgZ2V0IGx1
Y2t5ICovCj4gLQlyZXR1cm4gcmFuZ2UtPnZhbGlkOwo+ICsJcmV0dXJuIFJFQURfT05DRShyYW5n
ZS0+dmFsaWQpOwoKSnVzdCB0byBlbnN1cmUgdGhhdCBJIGFjdHVhbGx5IHVuZGVyc3RhbmQgdGhl
IG1vZGVsOiBJJ20gYXNzdW1pbmcgdGhhdCB0aGUgClJFQURfT05DRSBpcyB0aGVyZSBzb2xlbHkg
dG8gZW5zdXJlIHRoYXQgcmFuZ2UtPnZhbGlkIGlzIHJlYWQgKmFmdGVyKiB0aGUKd2FpdF9ldmVu
dF90aW1lb3V0KCkgcmV0dXJucy4gSXMgdGhhdCBjb3JyZWN0PwoKCj4gIH0KPiAgCj4gIC8qCj4g
CgpJbiBhbnkgY2FzZSwgaXQgbG9va3MgZ29vZCwgc286CgogICAgUmV2aWV3ZWQtYnk6IEpvaG4g
SHViYmFyZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4KCnRoYW5rcywKLS0gCkpvaG4gSHViYmFyZApO
VklESUEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
