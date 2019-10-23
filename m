Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 689B0E1B3D
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 14:50:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 648136EA8B;
	Wed, 23 Oct 2019 12:50:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (unknown [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0CC936EA8E
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 12:50:16 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A15964A7;
 Wed, 23 Oct 2019 05:50:05 -0700 (PDT)
Received: from [192.168.1.123] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7A62D3F6C4;
 Wed, 23 Oct 2019 05:50:04 -0700 (PDT)
Subject: Re: [PATCH v2] panfrost: Properly undo pm_runtime_enable when
 deferring a probe
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-kernel@vger.kernel.org
References: <20191023120925.30668-1-tomeu.vizoso@collabora.com>
 <20191023122157.32067-1-tomeu.vizoso@collabora.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <6952956c-ba58-71de-05c9-fa39333484d9@arm.com>
Date: Wed, 23 Oct 2019 13:49:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <20191023122157.32067-1-tomeu.vizoso@collabora.com>
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
Cc: David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0xMC0yMyAxOjIxIHBtLCBUb21ldSBWaXpvc28gd3JvdGU6Cj4gV2hlbiBkZWZlcnJp
bmcgdGhlIHByb2JlIGJlY2F1c2Ugb2YgYSBtaXNzaW5nIHJlZ3VsYXRvciwgd2Ugd2VyZSBjYWxs
aW5nCj4gcG1fcnVudGltZV9kaXNhYmxlIGV2ZW4gaWYgcG1fcnVudGltZV9lbmFibGUgd2Fzbid0
IGNhbGxlZC4KPiAKPiBNb3ZlIHRoZSBjYWxsIHRvIHBtX3J1bnRpbWVfZGlzYWJsZSB0byB0aGUg
cmlnaHQgcGxhY2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogVG9tZXUgVml6b3NvIDx0b21ldS52aXpv
c29AY29sbGFib3JhLmNvbT4KPiBSZXBvcnRlZC1ieTogQ2hlbi1ZdSBUc2FpIDx3ZW5zQGNzaWUu
b3JnPgo+IENjOiBSb2JpbiBNdXJwaHkgPHJvYmluLm11cnBoeUBhcm0uY29tPgo+IEZpeGVzOiBm
NGEzYzZhNDRiMzUgKCJkcm0vcGFuZnJvc3Q6IERpc2FibGUgUE0gb24gcHJvYmUgZmFpbHVyZSIp
CgpJIHRoaW5rIHRoYXQgY29tbWl0IHdhcyByaWdodCBhdCB0aGUgdGltZSwgYnV0IGFjdHVhbGx5
IHdlIG1pc3NlZCAKcmVvcmRlcmluZyB0aGUgY2xlYW51cCBwYXRoIHRvIG1hdGNoIHRoZSBjaGFu
Z2UgaW4gNjM1NDMwNzk3ZDNmLiAKT3RoZXJ3aXNlLCB0aG91Z2gsCgpSZXZpZXdlZC1ieTogUm9i
aW4gTXVycGh5IDxyb2Jpbi5tdXJwaHlAYXJtLmNvbT4KCj4gLS0tCj4gICBkcml2ZXJzL2dwdS9k
cm0vcGFuZnJvc3QvcGFuZnJvc3RfZHJ2LmMgfCAyICstCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3Bh
bmZyb3N0X2Rydi5jCj4gaW5kZXggYmMyZGRlYjU1ZjVkLi5mMjFiYzhhN2VlM2EgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Rydi5jCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Rydi5jCj4gQEAgLTU1NiwxMSArNTU2LDEx
IEBAIHN0YXRpYyBpbnQgcGFuZnJvc3RfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikKPiAgIAlyZXR1cm4gMDsKPiAgIAo+ICAgZXJyX291dDI6Cj4gKwlwbV9ydW50aW1lX2Rpc2Fi
bGUocGZkZXYtPmRldik7Cj4gICAJcGFuZnJvc3RfZGV2ZnJlcV9maW5pKHBmZGV2KTsKPiAgIGVy
cl9vdXQxOgo+ICAgCXBhbmZyb3N0X2RldmljZV9maW5pKHBmZGV2KTsKPiAgIGVycl9vdXQwOgo+
IC0JcG1fcnVudGltZV9kaXNhYmxlKHBmZGV2LT5kZXYpOwo+ICAgCWRybV9kZXZfcHV0KGRkZXYp
Owo+ICAgCXJldHVybiBlcnI7Cj4gICB9Cj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
