Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48820873A5
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 10:00:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 686B66ED27;
	Fri,  9 Aug 2019 08:00:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id BC9996E586
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 12:57:35 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 263A215A2;
 Thu,  8 Aug 2019 05:57:35 -0700 (PDT)
Received: from [10.1.196.133] (e112269-lin.cambridge.arm.com [10.1.196.133])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B83853F694;
 Thu,  8 Aug 2019 05:57:33 -0700 (PDT)
Subject: Re: [PATCH v3 4/8] drm/panfrost: Split panfrost_mmu_map SG list
 mapping to its own function
To: Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org
References: <20190802195150.23207-1-robh@kernel.org>
 <20190802195150.23207-5-robh@kernel.org>
From: Steven Price <steven.price@arm.com>
Message-ID: <ef465540-0709-555f-99b2-d10aeb81c1fc@arm.com>
Date: Thu, 8 Aug 2019 13:57:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190802195150.23207-5-robh@kernel.org>
Content-Language: en-GB
X-Mailman-Approved-At: Fri, 09 Aug 2019 08:00:17 +0000
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Robin Murphy <robin.murphy@arm.com>,
 David Airlie <airlied@linux.ie>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDIvMDgvMjAxOSAyMDo1MSwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gSW4gcHJlcGFyYXRpb24g
dG8gY3JlYXRlIHBhcnRpYWwgR1BVIG1hcHBpbmdzIG9mIEJPcyBvbiBwYWdlIGZhdWx0cywKPiBz
cGxpdCBvdXQgdGhlIFNHIGxpc3QgaGFuZGxpbmcgb2YgcGFuZnJvc3RfbW11X21hcCgpLgo+IAo+
IENjOiBUb21ldSBWaXpvc28gPHRvbWV1LnZpem9zb0Bjb2xsYWJvcmEuY29tPgo+IENjOiBCb3Jp
cyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPgo+IENjOiBSb2JpbiBN
dXJwaHkgPHJvYmluLm11cnBoeUBhcm0uY29tPgo+IENjOiBTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5w
cmljZUBhcm0uY29tPgo+IEFja2VkLWJ5OiBBbHlzc2EgUm9zZW56d2VpZyA8YWx5c3NhLnJvc2Vu
endlaWdAY29sbGFib3JhLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBr
ZXJuZWwub3JnPgoKUmV2aWV3ZWQtYnk6IFN0ZXZlbiBQcmljZSA8c3RldmVuLnByaWNlQGFybS5j
b20+CgooQWx0aG91Z2ggSSBkb24ndCBzZWUgYSBjaGFuZ2UgZnJvbSB0aGUgcHJldmlvdXMgcG9z
dGluZyB3aGljaCBhbHJlYWR5CmhhZCBteSBSLWIpLgoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJt
L3BhbmZyb3N0L3BhbmZyb3N0X21tdS5jIHwgNTIgKysrKysrKysrKysrKysrLS0tLS0tLS0tLQo+
ICAxIGZpbGUgY2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygrKSwgMjEgZGVsZXRpb25zKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9tbXUuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9tbXUuYwo+IGluZGV4IDkyYWM5OTVkZDlj
Ni4uYjRhYzE0OWIyMzk5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9w
YW5mcm9zdF9tbXUuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9t
bXUuYwo+IEBAIC0xNDUsMjcgKzE0NSwxMyBAQCBzdGF0aWMgc2l6ZV90IGdldF9wZ3NpemUodTY0
IGFkZHIsIHNpemVfdCBzaXplKQo+ICAJcmV0dXJuIFNaXzJNOwo+ICB9Cj4gIAo+IC1pbnQgcGFu
ZnJvc3RfbW11X21hcChzdHJ1Y3QgcGFuZnJvc3RfZ2VtX29iamVjdCAqYm8pCj4gK3N0YXRpYyBp
bnQgbW11X21hcF9zZyhzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRldiwgdTY0IGlvdmEsCj4g
KwkJICAgICAgaW50IHByb3QsIHN0cnVjdCBzZ190YWJsZSAqc2d0KQo+ICB7Cj4gLQlzdHJ1Y3Qg
ZHJtX2dlbV9vYmplY3QgKm9iaiA9ICZiby0+YmFzZS5iYXNlOwo+IC0Jc3RydWN0IHBhbmZyb3N0
X2RldmljZSAqcGZkZXYgPSB0b19wYW5mcm9zdF9kZXZpY2Uob2JqLT5kZXYpOwo+IC0Jc3RydWN0
IGlvX3BndGFibGVfb3BzICpvcHMgPSBwZmRldi0+bW11LT5wZ3RibF9vcHM7Cj4gLQl1NjQgaW92
YSA9IGJvLT5ub2RlLnN0YXJ0IDw8IFBBR0VfU0hJRlQ7Cj4gIAl1bnNpZ25lZCBpbnQgY291bnQ7
Cj4gIAlzdHJ1Y3Qgc2NhdHRlcmxpc3QgKnNnbDsKPiAtCXN0cnVjdCBzZ190YWJsZSAqc2d0Owo+
IC0JaW50IHJldDsKPiAtCj4gLQlpZiAoV0FSTl9PTihiby0+aXNfbWFwcGVkKSkKPiAtCQlyZXR1
cm4gMDsKPiAtCj4gLQlzZ3QgPSBkcm1fZ2VtX3NobWVtX2dldF9wYWdlc19zZ3Qob2JqKTsKPiAt
CWlmIChXQVJOX09OKElTX0VSUihzZ3QpKSkKPiAtCQlyZXR1cm4gUFRSX0VSUihzZ3QpOwo+IC0K
PiAtCXJldCA9IHBtX3J1bnRpbWVfZ2V0X3N5bmMocGZkZXYtPmRldik7Cj4gLQlpZiAocmV0IDwg
MCkKPiAtCQlyZXR1cm4gcmV0Owo+ICsJc3RydWN0IGlvX3BndGFibGVfb3BzICpvcHMgPSBwZmRl
di0+bW11LT5wZ3RibF9vcHM7Cj4gKwl1NjQgc3RhcnRfaW92YSA9IGlvdmE7Cj4gIAo+ICAJbXV0
ZXhfbG9jaygmcGZkZXYtPm1tdS0+bG9jayk7Cj4gIAo+IEBAIC0xNzgsMTggKzE2NCw0MiBAQCBp
bnQgcGFuZnJvc3RfbW11X21hcChzdHJ1Y3QgcGFuZnJvc3RfZ2VtX29iamVjdCAqYm8pCj4gIAkJ
d2hpbGUgKGxlbikgewo+ICAJCQlzaXplX3QgcGdzaXplID0gZ2V0X3Bnc2l6ZShpb3ZhIHwgcGFk
ZHIsIGxlbik7Cj4gIAo+IC0JCQlvcHMtPm1hcChvcHMsIGlvdmEsIHBhZGRyLCBwZ3NpemUsIElP
TU1VX1dSSVRFIHwgSU9NTVVfUkVBRCk7Cj4gKwkJCW9wcy0+bWFwKG9wcywgaW92YSwgcGFkZHIs
IHBnc2l6ZSwgcHJvdCk7Cj4gIAkJCWlvdmEgKz0gcGdzaXplOwo+ICAJCQlwYWRkciArPSBwZ3Np
emU7Cj4gIAkJCWxlbiAtPSBwZ3NpemU7Cj4gIAkJfQo+ICAJfQo+ICAKPiAtCW1tdV9od19kb19v
cGVyYXRpb24ocGZkZXYsIDAsIGJvLT5ub2RlLnN0YXJ0IDw8IFBBR0VfU0hJRlQsCj4gLQkJCSAg
ICBiby0+bm9kZS5zaXplIDw8IFBBR0VfU0hJRlQsIEFTX0NPTU1BTkRfRkxVU0hfUFQpOwo+ICsJ
bW11X2h3X2RvX29wZXJhdGlvbihwZmRldiwgMCwgc3RhcnRfaW92YSwgaW92YSAtIHN0YXJ0X2lv
dmEsCj4gKwkJCSAgICBBU19DT01NQU5EX0ZMVVNIX1BUKTsKPiAgCj4gIAltdXRleF91bmxvY2so
JnBmZGV2LT5tbXUtPmxvY2spOwo+ICAKPiArCXJldHVybiAwOwo+ICt9Cj4gKwo+ICtpbnQgcGFu
ZnJvc3RfbW11X21hcChzdHJ1Y3QgcGFuZnJvc3RfZ2VtX29iamVjdCAqYm8pCj4gK3sKPiArCXN0
cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqID0gJmJvLT5iYXNlLmJhc2U7Cj4gKwlzdHJ1Y3QgcGFu
ZnJvc3RfZGV2aWNlICpwZmRldiA9IHRvX3BhbmZyb3N0X2RldmljZShvYmotPmRldik7Cj4gKwlz
dHJ1Y3Qgc2dfdGFibGUgKnNndDsKPiArCWludCByZXQ7Cj4gKwlpbnQgcHJvdCA9IElPTU1VX1JF
QUQgfCBJT01NVV9XUklURTsKPiArCj4gKwlpZiAoV0FSTl9PTihiby0+aXNfbWFwcGVkKSkKPiAr
CQlyZXR1cm4gMDsKPiArCj4gKwlzZ3QgPSBkcm1fZ2VtX3NobWVtX2dldF9wYWdlc19zZ3Qob2Jq
KTsKPiArCWlmIChXQVJOX09OKElTX0VSUihzZ3QpKSkKPiArCQlyZXR1cm4gUFRSX0VSUihzZ3Qp
Owo+ICsKPiArCXJldCA9IHBtX3J1bnRpbWVfZ2V0X3N5bmMocGZkZXYtPmRldik7Cj4gKwlpZiAo
cmV0IDwgMCkKPiArCQlyZXR1cm4gcmV0Owo+ICsKPiArCW1tdV9tYXBfc2cocGZkZXYsIGJvLT5u
b2RlLnN0YXJ0IDw8IFBBR0VfU0hJRlQsIHByb3QsIHNndCk7Cj4gKwo+ICAJcG1fcnVudGltZV9t
YXJrX2xhc3RfYnVzeShwZmRldi0+ZGV2KTsKPiAgCXBtX3J1bnRpbWVfcHV0X2F1dG9zdXNwZW5k
KHBmZGV2LT5kZXYpOwo+ICAJYm8tPmlzX21hcHBlZCA9IHRydWU7Cj4gCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
