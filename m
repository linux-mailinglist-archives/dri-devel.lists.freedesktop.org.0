Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E679B270
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 16:50:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DB4A6ECB2;
	Fri, 23 Aug 2019 14:50:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2D1376ECB2
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 14:50:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B5AD828;
 Fri, 23 Aug 2019 07:50:55 -0700 (PDT)
Received: from [10.1.31.94] (unknown [10.1.31.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BF1343F718;
 Fri, 23 Aug 2019 07:50:53 -0700 (PDT)
Subject: Re: [PATCH v2 1/8] drm/panfrost: Fix possible suspend in
 panfrost_remove
To: Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org
References: <20190823021216.5862-1-robh@kernel.org>
 <20190823021216.5862-2-robh@kernel.org>
From: Steven Price <steven.price@arm.com>
Message-ID: <b1600c03-56f9-0291-24ee-a70f86b66d91@arm.com>
Date: Fri, 23 Aug 2019 15:50:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190823021216.5862-2-robh@kernel.org>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Robin Murphy <robin.murphy@arm.com>,
 David Airlie <airlied@linux.ie>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Sean Paul <sean@poorly.run>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjMvMDgvMjAxOSAwMzoxMiwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gQ2FsbHMgdG8gcGFuZnJv
c3RfZGV2aWNlX2ZpbmkoKSBhY2Nlc3MgdGhlIGgvdywgYnV0IHdlIGFscmVhZHkgZG9uZSBhCj4g
cG1fcnVudGltZV9wdXRfc3luY19hdXRvc3VzcGVuZCgpIGJlZm9yZWhhbmQuIFRoaXMgb25seSB3
b3JrcyBpZiB0aGUKPiBhdXRvc3VzcGVuZCBkZWxheSBpcyBsb25nIGVub3VnaC4gQSAwbXMgZGVs
YXkgd2lsbCBoYW5nIHRoZSBzeXN0ZW0gd2hlbgo+IHJlbW92aW5nIHRoZSBkZXZpY2UuIEZpeCB0
aGlzIGJ5IG1vdmluZyB0aGUgcG1fcnVudGltZV9wdXRfc3luY19zdXNwZW5kKCkKPiBhZnRlciB0
aGUgcGFuZnJvc3RfZGV2aWNlX2ZpbmkoKSBjYWxsLgo+IAo+IENjOiBUb21ldSBWaXpvc28gPHRv
bWV1LnZpem9zb0Bjb2xsYWJvcmEuY29tPgo+IENjOiBTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5wcmlj
ZUBhcm0uY29tPgo+IENjOiBBbHlzc2EgUm9zZW56d2VpZyA8YWx5c3NhLnJvc2VuendlaWdAY29s
bGFib3JhLmNvbT4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+IENjOiBE
YW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gU2lnbmVkLW9mZi1ieTogUm9iIEhlcnJp
bmcgPHJvYmhAa2VybmVsLm9yZz4KClJldmlld2VkLWJ5OiBTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5w
cmljZUBhcm0uY29tPgoKPiAtLS0KPiB2MjogbmV3IHBhdGNoCj4gCj4gICBkcml2ZXJzL2dwdS9k
cm0vcGFuZnJvc3QvcGFuZnJvc3RfZHJ2LmMgfCA2ICsrKystLQo+ICAgMSBmaWxlIGNoYW5nZWQs
IDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZy
b3N0L3BhbmZyb3N0X2Rydi5jCj4gaW5kZXggNDRhNTU4YzZlMTdlLi5kNzQ0NDJkNzEwNDggMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Rydi5jCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Rydi5jCj4gQEAgLTU3MCwxMSAr
NTcwLDEzIEBAIHN0YXRpYyBpbnQgcGFuZnJvc3RfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UgKnBkZXYpCj4gICAKPiAgIAlkcm1fZGV2X3VucmVnaXN0ZXIoZGRldik7Cj4gICAJcGFuZnJv
c3RfZ2VtX3Nocmlua2VyX2NsZWFudXAoZGRldik7Cj4gKwo+ICAgCXBtX3J1bnRpbWVfZ2V0X3N5
bmMocGZkZXYtPmRldik7Cj4gLQlwbV9ydW50aW1lX3B1dF9zeW5jX2F1dG9zdXNwZW5kKHBmZGV2
LT5kZXYpOwo+IC0JcG1fcnVudGltZV9kaXNhYmxlKHBmZGV2LT5kZXYpOwo+ICAgCXBhbmZyb3N0
X2RldmZyZXFfZmluaShwZmRldik7Cj4gICAJcGFuZnJvc3RfZGV2aWNlX2ZpbmkocGZkZXYpOwo+
ICsJcG1fcnVudGltZV9wdXRfc3luY19zdXNwZW5kKHBmZGV2LT5kZXYpOwo+ICsJcG1fcnVudGlt
ZV9kaXNhYmxlKHBmZGV2LT5kZXYpOwo+ICsKPiAgIAlkcm1fZGV2X3B1dChkZGV2KTsKPiAgIAly
ZXR1cm4gMDsKPiAgIH0KPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
