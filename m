Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FD910EA39
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 13:50:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48F858933C;
	Mon,  2 Dec 2019 12:50:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id DED668933C
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2019 12:50:50 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 45F0A30E;
 Mon,  2 Dec 2019 04:50:50 -0800 (PST)
Received: from [10.1.196.37] (e121345-lin.cambridge.arm.com [10.1.196.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5C83A3F68E;
 Mon,  2 Dec 2019 04:50:49 -0800 (PST)
Subject: Re: [PATCH 8/8] drm/panfrost: Make sure the shrinker does not reclaim
 referenced BOs
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Steven Price <steven.price@arm.com>
References: <20191129135908.2439529-1-boris.brezillon@collabora.com>
 <20191129135908.2439529-9-boris.brezillon@collabora.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <7258aca4-115d-d511-4c0a-fb3ba142f382@arm.com>
Date: Mon, 2 Dec 2019 12:50:20 +0000
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191129135908.2439529-9-boris.brezillon@collabora.com>
Content-Language: en-GB
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
Cc: dri-devel@lists.freedesktop.org, stable@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjkvMTEvMjAxOSAxOjU5IHBtLCBCb3JpcyBCcmV6aWxsb24gd3JvdGU6Cj4gVXNlcnNwYWNl
IG1pZ2h0IHRhZyBhIEJPIHB1cmdlYWJsZSB3aGlsZSBpdCdzIHN0aWxsIHJlZmVyZW5jZWQgYnkg
R1BVCj4gam9icy4gV2UgbmVlZCB0byBtYWtlIHN1cmUgdGhlIHNocmlua2VyIGRvZXMgbm90IHB1
cmdlIHN1Y2ggQk9zIHVudGlsCj4gYWxsIGpvYnMgcmVmZXJlbmNpbmcgaXQgYXJlIGZpbmlzaGVk
LgoKTml0OiBmb3IgZXh0cmEgcm9idXN0bmVzcywgcGVyaGFwcyBpdCdzIHdvcnRoIHVzaW5nIHRo
ZSByZWZjb3VudF90IEFQSSAKcmF0aGVyIHRoYW4gYmFyZSBhdG9taWNfdD8KClJvYmluLgoKPiBG
aXhlczogMDEzYjY1MTAxMzE1ICgiZHJtL3BhbmZyb3N0OiBBZGQgbWFkdmlzZSBhbmQgc2hyaW5r
ZXIgc3VwcG9ydCIpCj4gQ2M6IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPgo+IFNpZ25lZC1vZmYt
Ynk6IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9yYS5jb20+Cj4gLS0t
Cj4gICBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZHJ2LmMgICAgICAgICAgfCAx
ICsKPiAgIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9nZW0uaCAgICAgICAgICB8
IDYgKysrKysrCj4gICBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZ2VtX3Nocmlu
a2VyLmMgfCAyICsrCj4gICBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3Rfam9iLmMg
ICAgICAgICAgfCA3ICsrKysrKy0KPiAgIDQgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJv
c3QvcGFuZnJvc3RfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZHJ2
LmMKPiBpbmRleCBiNDA2YjUyNDNiNDAuLjI5N2MwZTczMDRkMiAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZHJ2LmMKPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vcGFuZnJvc3QvcGFuZnJvc3RfZHJ2LmMKPiBAQCAtMTY2LDYgKzE2Niw3IEBAIHBhbmZyb3N0
X2xvb2t1cF9ib3Moc3RydWN0IGRybV9kZXZpY2UgKmRldiwKPiAgIAkJCWJyZWFrOwo+ICAgCQl9
Cj4gICAKPiArCQlhdG9taWNfaW5jKCZiby0+Z3B1X3VzZWNvdW50KTsKPiAgIAkJam9iLT5tYXBw
aW5nc1tpXSA9IG1hcHBpbmc7Cj4gICAJfQo+ICAgCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9nZW0uaCBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9w
YW5mcm9zdF9nZW0uaAo+IGluZGV4IGNhMWJjOTAxOTYwMC4uYjM1MTdmZjk2MzBjIDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9nZW0uaAo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9nZW0uaAo+IEBAIC0zMCw2ICszMCwxMiBA
QCBzdHJ1Y3QgcGFuZnJvc3RfZ2VtX29iamVjdCB7Cj4gICAJCXN0cnVjdCBtdXRleCBsb2NrOwo+
ICAgCX0gbWFwcGluZ3M7Cj4gICAKPiArCS8qCj4gKwkgKiBDb3VudCB0aGUgbnVtYmVyIG9mIGpv
YnMgcmVmZXJlbmNpbmcgdGhpcyBCTyBzbyB3ZSBkb24ndCBsZXQgdGhlCj4gKwkgKiBzaHJpbmtl
ciByZWNsYWltIHRoaXMgb2JqZWN0IHByZW1hdHVyZWx5Lgo+ICsJICovCj4gKwlhdG9taWNfdCBn
cHVfdXNlY291bnQ7Cj4gKwo+ICAgCWJvb2wgbm9leGVjCQk6MTsKPiAgIAlib29sIGlzX2hlYXAJ
CToxOwo+ICAgfTsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZy
b3N0X2dlbV9zaHJpbmtlci5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2dl
bV9zaHJpbmtlci5jCj4gaW5kZXggYjM2ZGYzMjZjODYwLi4yODhlNDZjNDA2NzMgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2dlbV9zaHJpbmtlci5jCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2dlbV9zaHJpbmtlci5jCj4g
QEAgLTQxLDYgKzQxLDggQEAgc3RhdGljIGJvb2wgcGFuZnJvc3RfZ2VtX3B1cmdlKHN0cnVjdCBk
cm1fZ2VtX29iamVjdCAqb2JqKQo+ICAgCXN0cnVjdCBkcm1fZ2VtX3NobWVtX29iamVjdCAqc2ht
ZW0gPSB0b19kcm1fZ2VtX3NobWVtX29iaihvYmopOwo+ICAgCXN0cnVjdCBwYW5mcm9zdF9nZW1f
b2JqZWN0ICpibyA9IHRvX3BhbmZyb3N0X2JvKG9iaik7Cj4gICAKPiArCWlmIChhdG9taWNfcmVh
ZCgmYm8tPmdwdV91c2Vjb3VudCkpCj4gKwkJcmV0dXJuIGZhbHNlOwo+ICAgCj4gICAJaWYgKCFt
dXRleF90cnlsb2NrKCZzaG1lbS0+cGFnZXNfbG9jaykpCj4gICAJCXJldHVybiBmYWxzZTsKPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2pvYi5jIGIvZHJp
dmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2pvYi5jCj4gaW5kZXggYzg1ZDQ1YmUzYjVl
Li4yYjEyYWE4N2ZmMzIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3Bh
bmZyb3N0X2pvYi5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2pv
Yi5jCj4gQEAgLTI3MCw4ICsyNzAsMTMgQEAgc3RhdGljIHZvaWQgcGFuZnJvc3Rfam9iX2NsZWFu
dXAoc3RydWN0IGtyZWYgKnJlZikKPiAgIAlkbWFfZmVuY2VfcHV0KGpvYi0+cmVuZGVyX2RvbmVf
ZmVuY2UpOwo+ICAgCj4gICAJaWYgKGpvYi0+bWFwcGluZ3MpIHsKPiAtCQlmb3IgKGkgPSAwOyBp
IDwgam9iLT5ib19jb3VudDsgaSsrKQo+ICsJCWZvciAoaSA9IDA7IGkgPCBqb2ItPmJvX2NvdW50
OyBpKyspIHsKPiArCQkJaWYgKCFqb2ItPm1hcHBpbmdzW2ldKQo+ICsJCQkJYnJlYWs7Cj4gKwo+
ICsJCQlhdG9taWNfZGVjKCZqb2ItPm1hcHBpbmdzW2ldLT5vYmotPmdwdV91c2Vjb3VudCk7Cj4g
ICAJCQlwYW5mcm9zdF9nZW1fbWFwcGluZ19wdXQoam9iLT5tYXBwaW5nc1tpXSk7Cj4gKwkJfQo+
ICAgCQlrdmZyZWUoam9iLT5tYXBwaW5ncyk7Cj4gICAJfQo+ICAgCj4gCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
