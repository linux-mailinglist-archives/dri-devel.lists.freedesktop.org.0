Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 755A010D6F5
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2019 15:26:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F29446E06E;
	Fri, 29 Nov 2019 14:26:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 05AEE6E06E
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2019 14:26:11 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AE0471FB;
 Fri, 29 Nov 2019 06:26:10 -0800 (PST)
Received: from [10.1.194.43] (e112269-lin.cambridge.arm.com [10.1.194.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E421B3F52E;
 Fri, 29 Nov 2019 06:26:09 -0800 (PST)
Subject: Re: [PATCH 3/8] drm/panfrost: Fix a BO leak in
 panfrost_ioctl_mmap_bo()
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
References: <20191129135908.2439529-1-boris.brezillon@collabora.com>
 <20191129135908.2439529-4-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <ef2cb594-ade3-0f86-c17b-60917ac1e6b4@arm.com>
Date: Fri, 29 Nov 2019 14:26:08 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191129135908.2439529-4-boris.brezillon@collabora.com>
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

T24gMjkvMTEvMjAxOSAxMzo1OSwgQm9yaXMgQnJlemlsbG9uIHdyb3RlOgo+IFdlIHNob3VsZCBy
ZWxlYXNlIHRoZSByZWZlcmVuY2Ugd2UgZ3JhYmJlZCB3aGVuIGFuIGVycm9yIG9jY3Vycy4KPiAK
PiBGaXhlczogMTg3ZDI5MjkyMDZlICgiZHJtL3BhbmZyb3N0OiBBZGQgc3VwcG9ydCBmb3IgR1BV
IGhlYXAgYWxsb2NhdGlvbnMiKQo+IENjOiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4KPiBTaWdu
ZWQtb2ZmLWJ5OiBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29t
PgoKUmV2aWV3ZWQtYnk6IFN0ZXZlbiBQcmljZSA8c3RldmVuLnByaWNlQGFybS5jb20+Cgo+IC0t
LQo+ICBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZHJ2LmMgfCA5ICsrKysrKy0t
LQo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZHJ2LmMgYi9k
cml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZHJ2LmMKPiBpbmRleCBlZmMwYTI0ZDFm
NGMuLjI2MzBjNTAyN2M2MyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3Qv
cGFuZnJvc3RfZHJ2LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3Rf
ZHJ2LmMKPiBAQCAtMzAzLDE0ICszMDMsMTcgQEAgc3RhdGljIGludCBwYW5mcm9zdF9pb2N0bF9t
bWFwX2JvKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsCj4gIAl9Cj4gIAo+ICAJ
LyogRG9uJ3QgYWxsb3cgbW1hcHBpbmcgb2YgaGVhcCBvYmplY3RzIGFzIHBhZ2VzIGFyZSBub3Qg
cGlubmVkLiAqLwo+IC0JaWYgKHRvX3BhbmZyb3N0X2JvKGdlbV9vYmopLT5pc19oZWFwKQo+IC0J
CXJldHVybiAtRUlOVkFMOwo+ICsJaWYgKHRvX3BhbmZyb3N0X2JvKGdlbV9vYmopLT5pc19oZWFw
KSB7Cj4gKwkJcmV0ID0gLUVJTlZBTDsKPiArCQlnb3RvIG91dDsKPiArCX0KPiAgCj4gIAlyZXQg
PSBkcm1fZ2VtX2NyZWF0ZV9tbWFwX29mZnNldChnZW1fb2JqKTsKPiAgCWlmIChyZXQgPT0gMCkK
PiAgCQlhcmdzLT5vZmZzZXQgPSBkcm1fdm1hX25vZGVfb2Zmc2V0X2FkZHIoJmdlbV9vYmotPnZt
YV9ub2RlKTsKPiAtCWRybV9nZW1fb2JqZWN0X3B1dF91bmxvY2tlZChnZW1fb2JqKTsKPiAgCj4g
K291dDoKPiArCWRybV9nZW1fb2JqZWN0X3B1dF91bmxvY2tlZChnZW1fb2JqKTsKPiAgCXJldHVy
biByZXQ7Cj4gIH0KPiAgCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
