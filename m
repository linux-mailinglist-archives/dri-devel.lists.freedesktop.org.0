Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E6E6E187
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 09:16:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A83D6E5A6;
	Fri, 19 Jul 2019 07:16:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 37AEB6E3F9
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 15:03:41 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E0B8A344;
 Thu, 18 Jul 2019 08:03:40 -0700 (PDT)
Received: from [10.1.196.133] (e112269-lin.cambridge.arm.com [10.1.196.133])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1C7D23F71F;
 Thu, 18 Jul 2019 08:03:39 -0700 (PDT)
Subject: Re: [PATCH 2/5] drm/panfrost: Split panfrost_mmu_map SG list mapping
 to its own function
To: Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org
References: <20190717183352.22519-1-robh@kernel.org>
 <20190717183352.22519-2-robh@kernel.org>
From: Steven Price <steven.price@arm.com>
Message-ID: <44966e0e-ce9a-0dd9-b205-3fcbb667521e@arm.com>
Date: Thu, 18 Jul 2019 16:03:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190717183352.22519-2-robh@kernel.org>
Content-Language: en-GB
X-Mailman-Approved-At: Fri, 19 Jul 2019 07:16:02 +0000
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTcvMDcvMjAxOSAxOTozMywgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gSW4gcHJlcGFyYXRpb24g
dG8gY3JlYXRlIHBhcnRpYWwgR1BVIG1hcHBpbmdzIG9mIEJPcyBvbiBwYWdlIGZhdWx0cywKPiBz
cGxpdCBvdXQgdGhlIFNHIGxpc3QgaGFuZGxpbmcgb2YgcGFuZnJvc3RfbW11X21hcCgpLgo+IAo+
IENjOiBUb21ldSBWaXpvc28gPHRvbWV1LnZpem9zb0Bjb2xsYWJvcmEuY29tPgo+IENjOiBCb3Jp
cyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPgo+IENjOiBSb2JpbiBN
dXJwaHkgPHJvYmluLm11cnBoeUBhcm0uY29tPgo+IENjOiBTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5w
cmljZUBhcm0uY29tPgo+IENjOiBBbHlzc2EgUm9zZW56d2VpZyA8YWx5c3NhQHJvc2VuendlaWcu
aW8+Cj4gU2lnbmVkLW9mZi1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KClJldmll
d2VkLWJ5OiBTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5wcmljZUBhcm0uY29tPgoKPiAtLS0KPiAgZHJp
dmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X21tdS5jIHwgNTIgKysrKysrKysrKysrKysr
LS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygrKSwgMjEgZGVsZXRp
b25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9z
dF9tbXUuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9tbXUuYwo+IGluZGV4
IGY1MDJlOTFiZTQyYS4uNTM4M2I4MzdmMDRiIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9wYW5mcm9zdC9wYW5mcm9zdF9tbXUuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9z
dC9wYW5mcm9zdF9tbXUuYwo+IEBAIC0xNjcsMjcgKzE2NywxMyBAQCBzdGF0aWMgc2l6ZV90IGdl
dF9wZ3NpemUodTY0IGFkZHIsIHNpemVfdCBzaXplKQo+ICAJcmV0dXJuIFNaXzJNOwo+ICB9Cj4g
IAo+IC1pbnQgcGFuZnJvc3RfbW11X21hcChzdHJ1Y3QgcGFuZnJvc3RfZ2VtX29iamVjdCAqYm8p
Cj4gK3N0YXRpYyBpbnQgbW11X21hcF9zZyhzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRldiwg
dTY0IGlvdmEsCj4gKwkJICAgICAgaW50IHByb3QsIHN0cnVjdCBzZ190YWJsZSAqc2d0KQo+ICB7
Cj4gLQlzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiA9ICZiby0+YmFzZS5iYXNlOwo+IC0Jc3Ry
dWN0IHBhbmZyb3N0X2RldmljZSAqcGZkZXYgPSB0b19wYW5mcm9zdF9kZXZpY2Uob2JqLT5kZXYp
Owo+IC0Jc3RydWN0IGlvX3BndGFibGVfb3BzICpvcHMgPSBwZmRldi0+bW11LT5wZ3RibF9vcHM7
Cj4gLQl1NjQgaW92YSA9IGJvLT5ub2RlLnN0YXJ0IDw8IFBBR0VfU0hJRlQ7Cj4gIAl1bnNpZ25l
ZCBpbnQgY291bnQ7Cj4gIAlzdHJ1Y3Qgc2NhdHRlcmxpc3QgKnNnbDsKPiAtCXN0cnVjdCBzZ190
YWJsZSAqc2d0Owo+IC0JaW50IHJldDsKPiAtCj4gLQlpZiAoV0FSTl9PTihiby0+aXNfbWFwcGVk
KSkKPiAtCQlyZXR1cm4gMDsKPiAtCj4gLQlzZ3QgPSBkcm1fZ2VtX3NobWVtX2dldF9wYWdlc19z
Z3Qob2JqKTsKPiAtCWlmIChXQVJOX09OKElTX0VSUihzZ3QpKSkKPiAtCQlyZXR1cm4gUFRSX0VS
UihzZ3QpOwo+IC0KPiAtCXJldCA9IHBtX3J1bnRpbWVfZ2V0X3N5bmMocGZkZXYtPmRldik7Cj4g
LQlpZiAocmV0IDwgMCkKPiAtCQlyZXR1cm4gcmV0Owo+ICsJc3RydWN0IGlvX3BndGFibGVfb3Bz
ICpvcHMgPSBwZmRldi0+bW11LT5wZ3RibF9vcHM7Cj4gKwl1NjQgc3RhcnRfaW92YSA9IGlvdmE7
Cj4gIAo+ICAJbXV0ZXhfbG9jaygmcGZkZXYtPm1tdS0+bG9jayk7Cj4gIAo+IEBAIC0yMDAsMTgg
KzE4Niw0MiBAQCBpbnQgcGFuZnJvc3RfbW11X21hcChzdHJ1Y3QgcGFuZnJvc3RfZ2VtX29iamVj
dCAqYm8pCj4gIAkJd2hpbGUgKGxlbikgewo+ICAJCQlzaXplX3QgcGdzaXplID0gZ2V0X3Bnc2l6
ZShpb3ZhIHwgcGFkZHIsIGxlbik7Cj4gIAo+IC0JCQlvcHMtPm1hcChvcHMsIGlvdmEsIHBhZGRy
LCBwZ3NpemUsIElPTU1VX1dSSVRFIHwgSU9NTVVfUkVBRCk7Cj4gKwkJCW9wcy0+bWFwKG9wcywg
aW92YSwgcGFkZHIsIHBnc2l6ZSwgcHJvdCk7Cj4gIAkJCWlvdmEgKz0gcGdzaXplOwo+ICAJCQlw
YWRkciArPSBwZ3NpemU7Cj4gIAkJCWxlbiAtPSBwZ3NpemU7Cj4gIAkJfQo+ICAJfQo+ICAKPiAt
CW1tdV9od19kb19vcGVyYXRpb24ocGZkZXYsIDAsIGJvLT5ub2RlLnN0YXJ0IDw8IFBBR0VfU0hJ
RlQsCj4gLQkJCSAgICBiby0+bm9kZS5zaXplIDw8IFBBR0VfU0hJRlQsIEFTX0NPTU1BTkRfRkxV
U0hfUFQpOwo+ICsJbW11X2h3X2RvX29wZXJhdGlvbihwZmRldiwgMCwgc3RhcnRfaW92YSwgaW92
YSAtIHN0YXJ0X2lvdmEsCj4gKwkJCSAgICBBU19DT01NQU5EX0ZMVVNIX1BUKTsKPiAgCj4gIAlt
dXRleF91bmxvY2soJnBmZGV2LT5tbXUtPmxvY2spOwo+ICAKPiArCXJldHVybiAwOwo+ICt9Cj4g
Kwo+ICtpbnQgcGFuZnJvc3RfbW11X21hcChzdHJ1Y3QgcGFuZnJvc3RfZ2VtX29iamVjdCAqYm8p
Cj4gK3sKPiArCXN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqID0gJmJvLT5iYXNlLmJhc2U7Cj4g
KwlzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRldiA9IHRvX3BhbmZyb3N0X2RldmljZShvYmot
PmRldik7Cj4gKwlzdHJ1Y3Qgc2dfdGFibGUgKnNndDsKPiArCWludCByZXQ7Cj4gKwlpbnQgcHJv
dCA9IElPTU1VX1JFQUQgfCBJT01NVV9XUklURTsKPiArCj4gKwlpZiAoV0FSTl9PTihiby0+aXNf
bWFwcGVkKSkKPiArCQlyZXR1cm4gMDsKPiArCj4gKwlzZ3QgPSBkcm1fZ2VtX3NobWVtX2dldF9w
YWdlc19zZ3Qob2JqKTsKPiArCWlmIChXQVJOX09OKElTX0VSUihzZ3QpKSkKPiArCQlyZXR1cm4g
UFRSX0VSUihzZ3QpOwo+ICsKPiArCXJldCA9IHBtX3J1bnRpbWVfZ2V0X3N5bmMocGZkZXYtPmRl
dik7Cj4gKwlpZiAocmV0IDwgMCkKPiArCQlyZXR1cm4gcmV0Owo+ICsKPiArCW1tdV9tYXBfc2co
cGZkZXYsIGJvLT5ub2RlLnN0YXJ0IDw8IFBBR0VfU0hJRlQsIHByb3QsIHNndCk7Cj4gKwo+ICAJ
cG1fcnVudGltZV9tYXJrX2xhc3RfYnVzeShwZmRldi0+ZGV2KTsKPiAgCXBtX3J1bnRpbWVfcHV0
X2F1dG9zdXNwZW5kKHBmZGV2LT5kZXYpOwo+ICAJYm8tPmlzX21hcHBlZCA9IHRydWU7Cj4gCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
