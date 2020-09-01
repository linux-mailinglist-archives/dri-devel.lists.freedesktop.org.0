Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9EA025A1BA
	for <lists+dri-devel@lfdr.de>; Wed,  2 Sep 2020 00:59:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B29C6E037;
	Tue,  1 Sep 2020 22:59:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8909D6E037
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 22:59:27 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 183B12100A
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 22:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599001167;
 bh=6+prf8hd/dD/hqUCmuKJ8TIy6p+8/B1mAtJifqlir+A=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=w3AXvs40WAjhXqbXqQI1GI9Yf7hMmKxb/eEPBdI1ctXxmiKOG5KwrJHt7sbbu9Re4
 4sgXHSx9tWBEQYbqv9Pjkq506kssAi0Zcp7Cv+il7ZTLRd/z6hHjzlDnpX/M0hpjIY
 EmThNZ/vhzh/HMmvip5IgkrHvzr7gvSKWbKBXIAc=
Received: by mail-ej1-f51.google.com with SMTP id a26so3983347ejc.2
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Sep 2020 15:59:27 -0700 (PDT)
X-Gm-Message-State: AOAM533VQWDEfc5GVEKeuRFGhPIlsHs78TfCOEdZYqLj6jKEh/nIerAt
 L+AHPVfqjil5abvSGMFGCEbztE/5GIw/WWsrZw==
X-Google-Smtp-Source: ABdhPJzjHDOXSGz7glhl+6OiZP2SWKZjyjWU9LL5WqhptcI1ntuiSPhKiGIOKRXMhN7HiiRtHc6HA76qv/dWjb/Q6CM=
X-Received: by 2002:a17:906:7492:: with SMTP id
 e18mr3598885ejl.375.1599001165547; 
 Tue, 01 Sep 2020 15:59:25 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20200826063533eucas1p1fad2f2afb117b026081468d2d840ab0f@eucas1p1.samsung.com>
 <20200826063316.23486-1-m.szyprowski@samsung.com>
 <20200826063316.23486-11-m.szyprowski@samsung.com>
In-Reply-To: <20200826063316.23486-11-m.szyprowski@samsung.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 2 Sep 2020 06:59:14 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9=GFMW2QQKjxWHeZLYTDo3+=j=wZ62t9LrSkfD79ji9A@mail.gmail.com>
Message-ID: <CAAOTY_9=GFMW2QQKjxWHeZLYTDo3+=j=wZ62t9LrSkfD79ji9A@mail.gmail.com>
Subject: Re: [PATCH v9 10/32] drm: mediatek: use common helper for a
 scatterlist contiguity check
To: Marek Szyprowski <m.szyprowski@samsung.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 linaro-mm-sig@lists.linaro.org, iommu@lists.linux-foundation.org,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIE1hcmVrOgoKTWFyZWsgU3p5cHJvd3NraSA8bS5zenlwcm93c2tpQHNhbXN1bmcuY29tPiDm
lrwgMjAyMOW5tDjmnIgyNuaXpSDpgLHkuIkg5LiL5Y2IMjozNeWvq+mBk++8mgo+Cj4gVXNlIGNv
bW1vbiBoZWxwZXIgZm9yIGNoZWNraW5nIHRoZSBjb250aWd1aXR5IG9mIHRoZSBpbXBvcnRlZCBk
bWEtYnVmIGFuZAo+IGRvIHRoaXMgY2hlY2sgYmVmb3JlIGFsbG9jYXRpbmcgcmVzb3VyY2VzLCBz
byB0aGUgZXJyb3IgcGF0aCBpcyBzaW1wbGVyLgo+CgpBY2tlZC1ieTogQ2h1bi1LdWFuZyBIdSA8
Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cgo+IFNpZ25lZC1vZmYtYnk6IE1hcmVrIFN6eXByb3dz
a2kgPG0uc3p5cHJvd3NraUBzYW1zdW5nLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kcm1fZ2VtLmMgfCAyOCArKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAx
IGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAyMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9nZW0uYyBiL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2dlbS5jCj4gaW5kZXggNjE5MGNjM2I3YjBkLi4zNjU0
ZWM3MzIwMjkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1f
Z2VtLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9nZW0uYwo+IEBA
IC0yMTIsMzcgKzIxMiwyMSBAQCBzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm10a19nZW1fcHJpbWVf
aW1wb3J0X3NnX3RhYmxlKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgc3RydWN0IGRtYV9idWZfYXR0YWNobWVudCAqYXR0YWNoLCBzdHJ1Y3Qgc2dfdGFi
bGUgKnNnKQo+ICB7Cj4gICAgICAgICBzdHJ1Y3QgbXRrX2RybV9nZW1fb2JqICptdGtfZ2VtOwo+
IC0gICAgICAgaW50IHJldDsKPiAtICAgICAgIHN0cnVjdCBzY2F0dGVybGlzdCAqczsKPiAtICAg
ICAgIHVuc2lnbmVkIGludCBpOwo+IC0gICAgICAgZG1hX2FkZHJfdCBleHBlY3RlZDsKPgo+IC0g
ICAgICAgbXRrX2dlbSA9IG10a19kcm1fZ2VtX2luaXQoZGV2LCBhdHRhY2gtPmRtYWJ1Zi0+c2l6
ZSk7Cj4gKyAgICAgICAvKiBjaGVjayBpZiB0aGUgZW50cmllcyBpbiB0aGUgc2dfdGFibGUgYXJl
IGNvbnRpZ3VvdXMgKi8KPiArICAgICAgIGlmIChkcm1fcHJpbWVfZ2V0X2NvbnRpZ3VvdXNfc2l6
ZShzZykgPCBhdHRhY2gtPmRtYWJ1Zi0+c2l6ZSkgewo+ICsgICAgICAgICAgICAgICBEUk1fRVJS
T1IoInNnX3RhYmxlIGlzIG5vdCBjb250aWd1b3VzIik7Cj4gKyAgICAgICAgICAgICAgIHJldHVy
biBFUlJfUFRSKC1FSU5WQUwpOwo+ICsgICAgICAgfQo+Cj4gKyAgICAgICBtdGtfZ2VtID0gbXRr
X2RybV9nZW1faW5pdChkZXYsIGF0dGFjaC0+ZG1hYnVmLT5zaXplKTsKPiAgICAgICAgIGlmIChJ
U19FUlIobXRrX2dlbSkpCj4gICAgICAgICAgICAgICAgIHJldHVybiBFUlJfQ0FTVChtdGtfZ2Vt
KTsKPgo+IC0gICAgICAgZXhwZWN0ZWQgPSBzZ19kbWFfYWRkcmVzcyhzZy0+c2dsKTsKPiAtICAg
ICAgIGZvcl9lYWNoX3NnKHNnLT5zZ2wsIHMsIHNnLT5uZW50cywgaSkgewo+IC0gICAgICAgICAg
ICAgICBpZiAoIXNnX2RtYV9sZW4ocykpCj4gLSAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7
Cj4gLQo+IC0gICAgICAgICAgICAgICBpZiAoc2dfZG1hX2FkZHJlc3MocykgIT0gZXhwZWN0ZWQp
IHsKPiAtICAgICAgICAgICAgICAgICAgICAgICBEUk1fRVJST1IoInNnX3RhYmxlIGlzIG5vdCBj
b250aWd1b3VzIik7Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgcmV0ID0gLUVJTlZBTDsKPiAt
ICAgICAgICAgICAgICAgICAgICAgICBnb3RvIGVycl9nZW1fZnJlZTsKPiAtICAgICAgICAgICAg
ICAgfQo+IC0gICAgICAgICAgICAgICBleHBlY3RlZCA9IHNnX2RtYV9hZGRyZXNzKHMpICsgc2df
ZG1hX2xlbihzKTsKPiAtICAgICAgIH0KPiAtCj4gICAgICAgICBtdGtfZ2VtLT5kbWFfYWRkciA9
IHNnX2RtYV9hZGRyZXNzKHNnLT5zZ2wpOwo+ICAgICAgICAgbXRrX2dlbS0+c2cgPSBzZzsKPgo+
ICAgICAgICAgcmV0dXJuICZtdGtfZ2VtLT5iYXNlOwo+IC0KPiAtZXJyX2dlbV9mcmVlOgo+IC0g
ICAgICAga2ZyZWUobXRrX2dlbSk7Cj4gLSAgICAgICByZXR1cm4gRVJSX1BUUihyZXQpOwo+ICB9
Cj4KPiAgdm9pZCAqbXRrX2RybV9nZW1fcHJpbWVfdm1hcChzdHJ1Y3QgZHJtX2dlbV9vYmplY3Qg
Km9iaikKPiAtLQo+IDIuMTcuMQo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
