Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 341FB10D6FC
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2019 15:28:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1E386E075;
	Fri, 29 Nov 2019 14:28:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2938C6E075
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2019 14:28:36 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BFDB71FB;
 Fri, 29 Nov 2019 06:28:35 -0800 (PST)
Received: from [10.1.194.43] (e112269-lin.cambridge.arm.com [10.1.194.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E03153F52E;
 Fri, 29 Nov 2019 06:28:34 -0800 (PST)
Subject: Re: [PATCH 4/8] drm/panfrost: Fix a race in panfrost_gem_free_object()
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
References: <20191129135908.2439529-1-boris.brezillon@collabora.com>
 <20191129135908.2439529-5-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <a30a18c7-e9de-a90d-97b5-f8f386b7f35d@arm.com>
Date: Fri, 29 Nov 2019 14:28:33 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191129135908.2439529-5-boris.brezillon@collabora.com>
Content-Language: en-US
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjkvMTEvMjAxOSAxMzo1OSwgQm9yaXMgQnJlemlsbG9uIHdyb3RlOgo+IHBhbmZyb3N0X2dl
bV9zaHJpbmtlcl9zY2FuKCkgbWlnaHQgcHVyZ2UgYSBCTyAocmVsZWFzZSB0aGUgc2d0IGFuZAo+
IGtpbGwgdGhlIEdQVSBtYXBwaW5nKSB0aGF0J3MgYmVpbmcgZnJlZWQgYnkgcGFuZnJvc3RfZ2Vt
X2ZyZWVfb2JqZWN0KCkKPiBpZiB3ZSBkb24ndCByZW1vdmUgdGhlIEJPIGZyb20gdGhlIHNocmlu
a2VyIGxpc3QgYXQgdGhlIGJlZ2lubmluZyBvZgo+IHBhbmZyb3N0X2dlbV9mcmVlX29iamVjdCgp
Lgo+IAo+IEZpeGVzOiAwMTNiNjUxMDEzMTUgKCJkcm0vcGFuZnJvc3Q6IEFkZCBtYWR2aXNlIGFu
ZCBzaHJpbmtlciBzdXBwb3J0IikKPiBDYzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+Cj4gU2ln
bmVkLW9mZi1ieTogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNv
bT4KClJldmlld2VkLWJ5OiBTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5wcmljZUBhcm0uY29tPgoKPiAt
LS0KPiAgZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2dlbS5jIHwgMTUgKysrKysr
KysrKy0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9u
cygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3Rf
Z2VtLmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZ2VtLmMKPiBpbmRleCBh
Y2IwN2ZlMDY1ODAuLmRhZjRjNTVhMjg2MyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
cGFuZnJvc3QvcGFuZnJvc3RfZ2VtLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3Qv
cGFuZnJvc3RfZ2VtLmMKPiBAQCAtMTksNiArMTksMTYgQEAgc3RhdGljIHZvaWQgcGFuZnJvc3Rf
Z2VtX2ZyZWVfb2JqZWN0KHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqKQo+ICAJc3RydWN0IHBh
bmZyb3N0X2dlbV9vYmplY3QgKmJvID0gdG9fcGFuZnJvc3RfYm8ob2JqKTsKPiAgCXN0cnVjdCBw
YW5mcm9zdF9kZXZpY2UgKnBmZGV2ID0gb2JqLT5kZXYtPmRldl9wcml2YXRlOwo+ICAKPiArCS8q
Cj4gKwkgKiBNYWtlIHN1cmUgdGhlIEJPIGlzIG5vIGxvbmdlciBpbnNlcnRlZCBpbiB0aGUgc2hy
aW5rZXIgbGlzdCBiZWZvcmUKPiArCSAqIHRha2luZyBjYXJlIG9mIHRoZSBkZXN0cnVjdGlvbiBp
dHNlbGYuIElmIHdlIGRvbid0IGRvIHRoYXQgd2UgaGF2ZSBhCj4gKwkgKiByYWNlIGNvbmRpdGlv
biBiZXR3ZWVuIHRoaXMgZnVuY3Rpb24gYW5kIHdoYXQncyBkb25lIGluCj4gKwkgKiBwYW5mcm9z
dF9nZW1fc2hyaW5rZXJfc2NhbigpLgo+ICsJICovCj4gKwltdXRleF9sb2NrKCZwZmRldi0+c2hy
aW5rZXJfbG9jayk7Cj4gKwlsaXN0X2RlbF9pbml0KCZiby0+YmFzZS5tYWR2X2xpc3QpOwo+ICsJ
bXV0ZXhfdW5sb2NrKCZwZmRldi0+c2hyaW5rZXJfbG9jayk7Cj4gKwo+ICAJaWYgKGJvLT5zZ3Rz
KSB7Cj4gIAkJaW50IGk7Cj4gIAkJaW50IG5fc2d0ID0gYm8tPmJhc2UuYmFzZS5zaXplIC8gU1pf
Mk07Cj4gQEAgLTMzLDExICs0Myw2IEBAIHN0YXRpYyB2b2lkIHBhbmZyb3N0X2dlbV9mcmVlX29i
amVjdChzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaikKPiAgCQlrZnJlZShiby0+c2d0cyk7Cj4g
IAl9Cj4gIAo+IC0JbXV0ZXhfbG9jaygmcGZkZXYtPnNocmlua2VyX2xvY2spOwo+IC0JaWYgKCFs
aXN0X2VtcHR5KCZiby0+YmFzZS5tYWR2X2xpc3QpKQo+IC0JCWxpc3RfZGVsKCZiby0+YmFzZS5t
YWR2X2xpc3QpOwo+IC0JbXV0ZXhfdW5sb2NrKCZwZmRldi0+c2hyaW5rZXJfbG9jayk7Cj4gLQo+
ICAJZHJtX2dlbV9zaG1lbV9mcmVlX29iamVjdChvYmopOwo+ICB9Cj4gIAo+IAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
