Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7BB32DE1E
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 00:54:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA9D56EA96;
	Thu,  4 Mar 2021 23:54:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 008566EA96;
 Thu,  4 Mar 2021 23:54:54 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B6041734e0000>; Thu, 04 Mar 2021 15:54:54 -0800
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 4 Mar
 2021 23:54:54 +0000
Received: from nvdebian.localnet (172.20.145.6) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 4 Mar 2021
 23:54:51 +0000
From: Alistair Popple <apopple@nvidia.com>
To: Zi Yan <ziy@nvidia.com>
Subject: Re: [PATCH v3 4/8] mm/rmap: Split migration into its own function
Date: Fri, 5 Mar 2021 10:54:48 +1100
Message-ID: <84997524.IMQpRet0Aq@nvdebian>
In-Reply-To: <E93F89E1-3CE2-4CA3-97D9-6BCED78E1001@nvidia.com>
References: <20210226071832.31547-1-apopple@nvidia.com>
 <20210226071832.31547-5-apopple@nvidia.com>
 <E93F89E1-3CE2-4CA3-97D9-6BCED78E1001@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1614902094; bh=F3stMHCU+5ii6x1iy3omj83ayupI0P+Mr9dS1o5FIt0=;
 h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding:Content-Type:
 X-Originating-IP:X-ClientProxiedBy;
 b=NpU2unlnheR6/rs4Zkq9TpQwW8Ut3zxi8Pn9daVGKPN2Zf3wm0lvYJ/fXsPnTrJ2C
 8r6FecCuivTyRTi4tEnX/gdG9VaTETErNKJhNRJW79HRPU3l70FQFYUPIkhEgdY7tX
 YIlY/ILaZKek6pTrRHqTdQ0bbLwCKcvyZQIUXQp259KaTmOAv19PPuEro7v397+5Ru
 zN6MpkzlSUiIVTJVHly9G9jlXozppR3Xo1drI0n42SmVmEVacBDR8DiJef1PPXPiVo
 gD39vcJO1NY/MhM/r142FNOwKGLtl9ekatblvwVaSTLNgcdn4994m2D59bfjPvLnRH
 5WIgHVadyysng==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: rcampbell@nvidia.com, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hch@infradead.org, linux-mm@kvack.org,
 jglisse@redhat.com, bskeggs@redhat.com, jgg@nvidia.com, jhubbard@nvidia.com,
 akpm@linux-foundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkbmVzZGF5LCAzIE1hcmNoIDIwMjEgOTowODoxNSBBTSBBRURUIFppIFlhbiB3cm90ZToK
PiBPbiAyNiBGZWIgMjAyMSwgYXQgMjoxOCwgQWxpc3RhaXIgUG9wcGxlIHdyb3RlOgoKPiA+IGRp
ZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3JtYXAuaCBiL2luY2x1ZGUvbGludXgvcm1hcC5oCj4g
PiBpbmRleCA3ZjFlZTQxMWJkN2IuLjc3ZmExN2RlNTFkNyAxMDA2NDQKPiA+IC0tLSBhL2luY2x1
ZGUvbGludXgvcm1hcC5oCj4gPiArKysgYi9pbmNsdWRlL2xpbnV4L3JtYXAuaAo+ID4gQEAgLTg2
LDggKzg2LDYgQEAgc3RydWN0IGFub25fdm1hX2NoYWluIHsKPiA+ICB9Owo+ID4KPiA+ICBlbnVt
IHR0dV9mbGFncyB7Cj4gPiAtCVRUVV9NSUdSQVRJT04JCT0gMHgxLAkvKiBtaWdyYXRpb24gbW9k
ZSAqLwo+ID4gLQo+ID4gIAlUVFVfU1BMSVRfSFVHRV9QTUQJPSAweDQsCS8qIHNwbGl0IGh1Z2Ug
UE1EIGlmIGFueSAqLwo+IAo+IEl0IGltcGxpZXMgZnJlZXplIGluIHRyeV90b19taWdyYXRlKCkg
YW5kIG5vIGZyZWV6ZSBpbiB0cnlfdG9fdW5tYXAoKS4gSSAKdGhpbmsKPiB3ZSBuZWVkIHNvbWUg
Y29tbWVudHMgaGVyZSwgYWJvdmUgdHJ5X3RvX21pZ3JhdGUoKSwgYW5kIGFib3ZlIHRyeV90b191
bm1hcCgpCj4gdG8gY2xhcmlmeSB0aGUgaW1wbGljYXRpb24uCgpTdXJlLiBUaGlzIGNvbmZ1c2Vk
IG1lIGZvciBhIGJpdCBhbmQgSSB3YXMgaW5pdGlhbGx5IHRlbXB0ZWQgdG8gbGVhdmUgClRUVV9T
UExJVF9GUkVFWkUgYXMgYSBzZXBhcmF0ZSBtb2RlIGZsYWcgYnV0IGxvb2tpbmcgYXQgd2hhdCBm
cmVlemUgYWN0dWFsbHkgCmRvZXMgaXQgbWFkZSBzZW5zZSB0byByZW1vdmUgaXQgYmVjYXVzZSB0
cnlfdG9fbWlncmF0ZSgpIGlzIGZvciBpbnN0YWxsaW5nIAptaWdyYXRpb24gZW50cmllcyAod2hp
Y2ggaXMgd2hhdCBmcmVlemUgZG9lcykgYW5kIHRyeV90b191bm1hcCgpIGp1c3QgdW5tYXBzLiAK
U28gSSdsbCBhZGQgc29tZSBjb21tZW50cyB0byB0aGF0IGVmZmVjdC4KIAo+ID4gIAlUVFVfSUdO
T1JFX01MT0NLCT0gMHg4LAkvKiBpZ25vcmUgbWxvY2sgKi8KPiA+ICAJVFRVX0lHTk9SRV9IV1BP
SVNPTgk9IDB4MjAsCS8qIGNvcnJ1cHRlZCBwYWdlIGlzIHJlY292ZXJhYmxlICovCj4gPiBAQCAt
OTYsNyArOTQsNiBAQCBlbnVtIHR0dV9mbGFncyB7Cj4gPiAgCQkJCQkgKiBkbyBhIGZpbmFsIGZs
dXNoIGlmIG5lY2Vzc2FyeSAqLwo+ID4gIAlUVFVfUk1BUF9MT0NLRUQJCT0gMHg4MCwJLyogZG8g
bm90IGdyYWIgcm1hcCBsb2NrOgo+ID4gIAkJCQkJICogY2FsbGVyIGhvbGRzIGl0ICovCj4gPiAt
CVRUVV9TUExJVF9GUkVFWkUJPSAweDEwMCwJCS8qIGZyZWV6ZSBwdGUgdW5kZXIgc3BsaXR0aW5n
IHRocCAqLwo+ID4gIH07Cj4gPgo+ID4gICNpZmRlZiBDT05GSUdfTU1VCj4gPiBAQCAtMTkzLDYg
KzE5MCw3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBwYWdlX2R1cF9ybWFwKHN0cnVjdCBwYWdlICpw
YWdlLCAKYm9vbCBjb21wb3VuZCkKPiA+ICBpbnQgcGFnZV9yZWZlcmVuY2VkKHN0cnVjdCBwYWdl
ICosIGludCBpc19sb2NrZWQsCj4gPiAgCQkJc3RydWN0IG1lbV9jZ3JvdXAgKm1lbWNnLCB1bnNp
Z25lZCBsb25nICp2bV9mbGFncyk7Cj4gPgo+ID4gK2Jvb2wgdHJ5X3RvX21pZ3JhdGUoc3RydWN0
IHBhZ2UgKnBhZ2UsIGVudW0gdHR1X2ZsYWdzIGZsYWdzKTsKPiA+ICBib29sIHRyeV90b191bm1h
cChzdHJ1Y3QgcGFnZSAqLCBlbnVtIHR0dV9mbGFncyBmbGFncyk7Cj4gPgo+ID4gIC8qIEF2b2lk
IHJhY3kgY2hlY2tzICovCj4gPiBkaWZmIC0tZ2l0IGEvbW0vaHVnZV9tZW1vcnkuYyBiL21tL2h1
Z2VfbWVtb3J5LmMKPiA+IGluZGV4IGQwMGI5M2RjMmQ5ZS4uMzU3MDUyYTQ1NjdiIDEwMDY0NAo+
ID4gLS0tIGEvbW0vaHVnZV9tZW1vcnkuYwo+ID4gKysrIGIvbW0vaHVnZV9tZW1vcnkuYwo+ID4g
QEAgLTIzNTEsMTYgKzIzNTEsMTYgQEAgdm9pZCB2bWFfYWRqdXN0X3RyYW5zX2h1Z2Uoc3RydWN0
IHZtX2FyZWFfc3RydWN0IAoqdm1hLAo+ID4KPiA+ICBzdGF0aWMgdm9pZCB1bm1hcF9wYWdlKHN0
cnVjdCBwYWdlICpwYWdlKQo+ID4gIHsKPiA+IC0JZW51bSB0dHVfZmxhZ3MgdHR1X2ZsYWdzID0g
VFRVX0lHTk9SRV9NTE9DSyB8Cj4gPiAtCQlUVFVfUk1BUF9MT0NLRUQgfCBUVFVfU1BMSVRfSFVH
RV9QTUQ7Cj4gPiArCWVudW0gdHR1X2ZsYWdzIHR0dV9mbGFncyA9IFRUVV9STUFQX0xPQ0tFRCB8
IFRUVV9TUExJVF9IVUdFX1BNRDsKPiA+ICAJYm9vbCB1bm1hcF9zdWNjZXNzOwo+ID4KPiA+ICAJ
Vk1fQlVHX09OX1BBR0UoIVBhZ2VIZWFkKHBhZ2UpLCBwYWdlKTsKPiA+Cj4gPiAgCWlmIChQYWdl
QW5vbihwYWdlKSkKPiA+IC0JCXR0dV9mbGFncyB8PSBUVFVfU1BMSVRfRlJFRVpFOwo+ID4gLQo+
ID4gLQl1bm1hcF9zdWNjZXNzID0gdHJ5X3RvX3VubWFwKHBhZ2UsIHR0dV9mbGFncyk7Cj4gPiAr
CQl1bm1hcF9zdWNjZXNzID0gdHJ5X3RvX21pZ3JhdGUocGFnZSwgdHR1X2ZsYWdzKTsKPiA+ICsJ
ZWxzZQo+ID4gKwkJdW5tYXBfc3VjY2VzcyA9IHRyeV90b191bm1hcChwYWdlLCB0dHVfZmxhZ3Mg
fAo+ID4gKwkJCQkJCVRUVV9JR05PUkVfTUxPQ0spOwo+IAo+IEkgdGhpbmsgd2UgbmVlZCBhIGNv
bW1lbnQgaGVyZSBhYm91dCB3aHkgYW5vbnltb3VzIHBhZ2VzIG5lZWQgCnRyeV90b19taWdyYXRl
KCkKPiBhbmQgb3RoZXJzIG5lZWQgdHJ5X3RvX3VubWFwKCkuCgpIaXN0b3JpY2FsbHkgdGhpcyBj
b21lcyBmcm9tIGJhYTM1NWZkMzMxNCAoInRocDogZmlsZSBwYWdlcyBzdXBwb3J0IGZvciAKc3Bs
aXRfaHVnZV9wYWdlKCkiKSB3aGljaCBzYXlzOgoKIldlIGRvbid0IHNldHVwIG1pZ3JhdGlvbiBl
bnRyaWVzLiBKdXN0IHVubWFwIHBhZ2VzLiBJdCBoZWxwcyBoYW5kbGluZyBjYXNlcyAKd2hlbiBp
X3NpemUgaXMgaW4gdGhlIG1pZGRsZSBvZiB0aGUgcGFnZTogbm8gbmVlZCBoYW5kbGUgdW5tYXAg
cGFnZXMgYmV5b25kIAppX3NpemUgbWFudWFsbHkuIgoKQnV0IEknbGwgYWRkIGEgY29tbWVudCBo
ZXJlLCB0aGFua3MuCgogLSBBbGlzdGFpcgoKPiBUaGFua3MuCj4gCj4g4oCUCj4gQmVzdCBSZWdh
cmRzLAo+IFlhbiBaaQoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
