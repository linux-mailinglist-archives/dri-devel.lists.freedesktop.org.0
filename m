Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7CF265D9
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 16:35:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C829989ABA;
	Wed, 22 May 2019 14:35:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CD31896F7
 for <dri-devel@lists.freedesktop.org>; Sat, 18 May 2019 14:45:28 +0000 (UTC)
Received: by mail-yb1-xb41.google.com with SMTP id k128so2207475ybf.0
 for <dri-devel@lists.freedesktop.org>; Sat, 18 May 2019 07:45:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=77OQ/lkmsml6JIGkNy6mI1RRxZHIM2FsvrIfk0LDVxY=;
 b=CRZ0sYl8FnTmKSwb+NUvW6masIzOyAPb+a6deBfl0R0UXDEuibBRnocIGHGa64mDVL
 RsHyDi3EypXoAR8Sa7ax9ZEZZosI7pmAGbTR+s82RknbD8Ycsbj56lVjQXb5Nl6nCv26
 j9bk9OyTZasGxBwS4eOkQRN0NENb/l6pK9R5RF8kFWG12yldeL2+E0h2a+OhRFMqsDem
 pBjzULU4UfNUlnhCrG0gCUTUZLoxwT4AypdtPETPtj7ygpNvh2RvwQKkA+9MfvOqWijO
 QWCrshqLmqQy35YDe5+2Q7Eyp867qENHJPA8yHf1Wu64jr+DZPuYw7BFPNMgGPLrGkY/
 CPZA==
X-Gm-Message-State: APjAAAVRuFbMW+xVE52HieV2GS3Oo3wNDPiFTMDqkTmSZ0sXRNV0dmo4
 lM0O33pT7H+yQJjEYxwvjPSWNEZUg2xnbP3p99s=
X-Google-Smtp-Source: APXvYqz8Ud0fDXY9JxGkS+dy5NJLMTqLdeb9pIIxVKprfYnVIb0d0/+pRo/C+qYP+AaKVJMDPptDy2GlVYMckN6N6oE=
X-Received: by 2002:a25:b10f:: with SMTP id g15mr10782445ybj.82.1558190727257; 
 Sat, 18 May 2019 07:45:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190517184659.18828-1-peron.clem@gmail.com>
 <20190517184659.18828-2-peron.clem@gmail.com>
 <CAL_JsqKPazGn+g1zS4NMwvQZ_6GcAm0tgcOTqyQA0dz0+2dp3g@mail.gmail.com>
 <CAJiuCcdMxXAXYk=QpRwsvBUW0tvBVMqXvgx0Y7fAKP=ouyBnKQ@mail.gmail.com>
 <CAL_JsqJgo8NpK00ApBcdtYGW24yuqU=4EMna+r_07=dqceZyyg@mail.gmail.com>
In-Reply-To: <CAL_JsqJgo8NpK00ApBcdtYGW24yuqU=4EMna+r_07=dqceZyyg@mail.gmail.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Sat, 18 May 2019 16:45:10 +0200
Message-ID: <CAJiuCcfjEqS8BdYdwD22W4hhD27TTs7DPsiEErF_Xt+5Gdkewg@mail.gmail.com>
Subject: Re: [PATCH v5 1/6] drm: panfrost: add optional bus_clock
To: Rob Herring <robh+dt@kernel.org>
X-Mailman-Approved-At: Wed, 22 May 2019 14:35:24 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=77OQ/lkmsml6JIGkNy6mI1RRxZHIM2FsvrIfk0LDVxY=;
 b=AdfBwGcWiRp4t6iFzrle+NFQHOHvRbIYZrm7PG3CY9l5UcF25lNq5vlnLeAfP2591b
 G/yZTVDvUCuwq4ZxuLok25gP1xkPMFYYLWfKQ1D9Ehx09f3Lhk6tXhAU3tQNo083NFB8
 qnyP08CcF7XzMcjiJclm7q90np3/pNgT8uzZYfUzrqk6hfmiYU292fvtjB5dyI2OHe86
 4GGnQgRt88WUNSzckjwnDrhZlDw8p47U/U1Idw1JUZ0BjkFWXKO5HM9IUQsLOkKeXyrT
 rr809uMQ85jA3zuC2J0S6ZMZJ4KwFrgUE/dPyY8t8Eo+S/Z9710uagbZD2xSt4Cp5RP2
 WJQQ==
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
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

SGksCgpPbiBTYXQsIDE4IE1heSAyMDE5IGF0IDAwOjE3LCBSb2IgSGVycmluZyA8cm9iaCtkdEBr
ZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIEZyaSwgTWF5IDE3LCAyMDE5IGF0IDU6MDggUE0gQ2zD
qW1lbnQgUMOpcm9uIDxwZXJvbi5jbGVtQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gSGkgUm9i
LAo+ID4KPiA+IE9uIEZyaSwgMTcgTWF5IDIwMTkgYXQgMjI6MDcsIFJvYiBIZXJyaW5nIDxyb2Jo
K2R0QGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiBGcmksIE1heSAxNywgMjAxOSBh
dCAxOjQ3IFBNIENsw6ltZW50IFDDqXJvbiA8cGVyb24uY2xlbUBnbWFpbC5jb20+IHdyb3RlOgo+
ID4gPiA+Cj4gPiA+ID4gQWxsd2lubmVyIEg2IGhhcyBhbiBBUk0gTWFsaS1UNzIwIE1QMiB3aGlj
aCByZXF1aXJlZCBhIGJ1c19jbG9jay4KPiA+ID4gPgo+ID4gPiA+IEFkZCBhbiBvcHRpb25hbCBi
dXNfY2xvY2sgYXQgdGhlIGluaXQgb2YgdGhlIHBhbmZyb3N0IGRyaXZlci4KPiA+ID4gPgo+ID4g
PiA+IFNpZ25lZC1vZmYtYnk6IENsw6ltZW50IFDDqXJvbiA8cGVyb24uY2xlbUBnbWFpbC5jb20+
Cj4gPiA+ID4gLS0tCj4gPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9k
ZXZpY2UuYyB8IDI1ICsrKysrKysrKysrKysrKysrKysrKy0KPiA+ID4gPiAgZHJpdmVycy9ncHUv
ZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmljZS5oIHwgIDEgKwo+ID4gPiA+ICAyIGZpbGVzIGNo
YW5nZWQsIDI1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+ID4gPgo+ID4gPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2aWNlLmMgYi9k
cml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2aWNlLmMKPiA+ID4gPiBpbmRleCAz
YjJiY2VkMWIwMTUuLjhkYTZlNjEyZDM4NCAxMDA2NDQKPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2aWNlLmMKPiA+ID4gPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2aWNlLmMKPiA+ID4gPiBAQCAtNDQsNyArNDQsOCBA
QCBzdGF0aWMgaW50IHBhbmZyb3N0X2Nsa19pbml0KHN0cnVjdCBwYW5mcm9zdF9kZXZpY2UgKnBm
ZGV2KQo+ID4gPiA+Cj4gPiA+ID4gICAgICAgICBwZmRldi0+Y2xvY2sgPSBkZXZtX2Nsa19nZXQo
cGZkZXYtPmRldiwgTlVMTCk7Cj4gPiA+ID4gICAgICAgICBpZiAoSVNfRVJSKHBmZGV2LT5jbG9j
aykpIHsKPiA+ID4gPiAtICAgICAgICAgICAgICAgZGV2X2VycihwZmRldi0+ZGV2LCAiZ2V0IGNs
b2NrIGZhaWxlZCAlbGRcbiIsIFBUUl9FUlIocGZkZXYtPmNsb2NrKSk7Cj4gPiA+ID4gKyAgICAg
ICAgICAgICAgIGRldl9lcnIocGZkZXYtPmRldiwgImdldCBjbG9jayBmYWlsZWQgJWxkXG4iLAo+
ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIFBUUl9FUlIocGZkZXYtPmNsb2NrKSk7Cj4g
PiA+Cj4gPiA+IFBsZWFzZSBkcm9wIHRoaXMgd2hpdGVzcGFjZSBjaGFuZ2UuCj4gPgo+ID4gU29y
cnksIEkgdGhvdWdodCBpdCB3YXMgb25seSBhIG1pc3Rha2UgaGVyZSwgSSB3aWxsIGRyb3AgaXQu
Cj4gPiBXaHkgYXJlIHRoZXkgc28gbWFueSBsaW5lcyBvdmVyIDgwIGNoYXJhY3RlcnM/Cj4KPiBJ
J2QgZ3Vlc3MgbW9zdCBhcmUgcHJpbnRzIGFuZC9vciBqdXN0IHNsaWdodGx5IG92ZXIuCj4KPiA+
IElzIHRoZXJlIGEgc3BlY2lmaWMgY29kaW5nIHN0eWxlIHRvIGZvbGxvdyA/Cj4KPiBZZXMsIGJ1
dCBnZW5lcmFsbHkgdGhlIDgwIGNoYXJhY3RlciB0aGluZyBpcyBtb3JlIGEgZ3VpZGFuY2UuIE5v
dAo+IGhhdmluZyB1bnJlbGF0ZWQgY2hhbmdlcyBpbiBhIHNpbmdsZSBjb21taXQgaXMgbW9yZSBv
ZiBhIGhhcmQgcnVsZS4KCk9rLCB0aGFua3MgZm9yIHRoZSBjbGFyaWZpY2F0aW9uLgoKQ2zDqW1l
bnQKCj4KPiBSb2IKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
