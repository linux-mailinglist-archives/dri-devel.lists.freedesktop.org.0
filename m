Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 983FF21EDD
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2019 22:07:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B68BA89996;
	Fri, 17 May 2019 20:07:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B62B89996
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2019 20:07:47 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B695E217D8
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2019 20:07:46 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id h1so9511452qtp.1
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2019 13:07:46 -0700 (PDT)
X-Gm-Message-State: APjAAAXDmnQpss+O0AEntM8eT9mrm//XwspOyMoAJUgXn5uAuxpkV5ZA
 KiFvQB0ZXQim/EFtSirsvSdm+Cz5lTBEkww5jg==
X-Google-Smtp-Source: APXvYqyorKmxc+J4KVhOQBHBImhJm18kRJeWl2YZpK+ASt7DMCb593EYeTOi8eZBw90uGhvevJaQVOjh6CpzEWMWRDg=
X-Received: by 2002:ac8:2d48:: with SMTP id o8mr50643532qta.136.1558123665768; 
 Fri, 17 May 2019 13:07:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190517184659.18828-1-peron.clem@gmail.com>
 <20190517184659.18828-2-peron.clem@gmail.com>
In-Reply-To: <20190517184659.18828-2-peron.clem@gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 17 May 2019 15:07:32 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKPazGn+g1zS4NMwvQZ_6GcAm0tgcOTqyQA0dz0+2dp3g@mail.gmail.com>
Message-ID: <CAL_JsqKPazGn+g1zS4NMwvQZ_6GcAm0tgcOTqyQA0dz0+2dp3g@mail.gmail.com>
Subject: Re: [PATCH v5 1/6] drm: panfrost: add optional bus_clock
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1558123666;
 bh=IkVGNrM3mkdkCp1ruLguz7iPAsoAAPm6bhm62l6C0l4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=D7KoCjgNCYuzAKFnaeZMIowcKdNjhe/bHfunIg0phnFQGUNm7Si+IswAnpAuc8H6I
 6Juv7ClQ+lDWVypoiyNPgrHPlYddKlyshbbCP2el4CrhQiWah4/LMWx6fgC/bWtuFU
 E4aSZreYUPIbR5Wj7iA7bqvpJU7ENIrsynXOu2+M=
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Will Deacon <will.deacon@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>,
 Chen-Yu Tsai <wens@csie.org>, Linux IOMMU <iommu@lists.linux-foundation.org>,
 Robin Murphy <robin.murphy@arm.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMTcsIDIwMTkgYXQgMTo0NyBQTSBDbMOpbWVudCBQw6lyb24gPHBlcm9uLmNs
ZW1AZ21haWwuY29tPiB3cm90ZToKPgo+IEFsbHdpbm5lciBINiBoYXMgYW4gQVJNIE1hbGktVDcy
MCBNUDIgd2hpY2ggcmVxdWlyZWQgYSBidXNfY2xvY2suCj4KPiBBZGQgYW4gb3B0aW9uYWwgYnVz
X2Nsb2NrIGF0IHRoZSBpbml0IG9mIHRoZSBwYW5mcm9zdCBkcml2ZXIuCj4KPiBTaWduZWQtb2Zm
LWJ5OiBDbMOpbWVudCBQw6lyb24gPHBlcm9uLmNsZW1AZ21haWwuY29tPgo+IC0tLQo+ICBkcml2
ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2aWNlLmMgfCAyNSArKysrKysrKysrKysr
KysrKysrKystCj4gIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZpY2UuaCB8
ICAxICsKPiAgMiBmaWxlcyBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
Cj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Rldmlj
ZS5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmljZS5jCj4gaW5kZXgg
M2IyYmNlZDFiMDE1Li44ZGE2ZTYxMmQzODQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3BhbmZyb3N0L3BhbmZyb3N0X2RldmljZS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZy
b3N0L3BhbmZyb3N0X2RldmljZS5jCj4gQEAgLTQ0LDcgKzQ0LDggQEAgc3RhdGljIGludCBwYW5m
cm9zdF9jbGtfaW5pdChzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRldikKPgo+ICAgICAgICAg
cGZkZXYtPmNsb2NrID0gZGV2bV9jbGtfZ2V0KHBmZGV2LT5kZXYsIE5VTEwpOwo+ICAgICAgICAg
aWYgKElTX0VSUihwZmRldi0+Y2xvY2spKSB7Cj4gLSAgICAgICAgICAgICAgIGRldl9lcnIocGZk
ZXYtPmRldiwgImdldCBjbG9jayBmYWlsZWQgJWxkXG4iLCBQVFJfRVJSKHBmZGV2LT5jbG9jaykp
Owo+ICsgICAgICAgICAgICAgICBkZXZfZXJyKHBmZGV2LT5kZXYsICJnZXQgY2xvY2sgZmFpbGVk
ICVsZFxuIiwKPiArICAgICAgICAgICAgICAgICAgICAgICBQVFJfRVJSKHBmZGV2LT5jbG9jaykp
OwoKUGxlYXNlIGRyb3AgdGhpcyB3aGl0ZXNwYWNlIGNoYW5nZS4KCj4gICAgICAgICAgICAgICAg
IHJldHVybiBQVFJfRVJSKHBmZGV2LT5jbG9jayk7Cj4gICAgICAgICB9Cj4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
