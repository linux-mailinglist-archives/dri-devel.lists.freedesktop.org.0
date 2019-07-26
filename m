Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1313E76EA9
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 18:11:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC4056EDC0;
	Fri, 26 Jul 2019 16:11:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C41E6EDC0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 16:11:37 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D1249218EA
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 16:11:36 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id v22so39413392qkj.8
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 09:11:36 -0700 (PDT)
X-Gm-Message-State: APjAAAWeIu7AnyQEK94Cjw1p08zeFyC8kNhyPNCyQs3KevJK4lP3J0v3
 Ov214gRkMw+VEr7sIWLIkQI5tUkOgbSjQP6/DQ==
X-Google-Smtp-Source: APXvYqwHWAUcpWIG9xylf8ty9pntJ3t1gq2+Skkoo5fSxrAmEHhMDLAdTy1JZnyenNyQuqps63fQn0lLkInJBNnpLb4=
X-Received: by 2002:a37:a48e:: with SMTP id
 n136mr64874774qke.223.1564157496007; 
 Fri, 26 Jul 2019 09:11:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190725011003.30837-1-robh@kernel.org>
 <20190725011003.30837-7-robh@kernel.org>
 <552e3ef7-7a2f-b4c1-69f2-3c1b9fea827d@arm.com>
 <CAL_JsqJZ-dBgAq45F_Q_BrKo4XhHXjUeALn0oqBr6yWd_kTK9A@mail.gmail.com>
 <15bdc38a-5f15-e333-7d91-724a283ef12a@arm.com>
In-Reply-To: <15bdc38a-5f15-e333-7d91-724a283ef12a@arm.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 26 Jul 2019 10:11:23 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKaTNmn_iSV9Uh7x_LFJEL=nzm_rphH0sOPBDF9n=61XA@mail.gmail.com>
Message-ID: <CAL_JsqKaTNmn_iSV9Uh7x_LFJEL=nzm_rphH0sOPBDF9n=61XA@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] drm/panfrost: Add support for GPU heap allocations
To: Steven Price <steven.price@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1564157497;
 bh=MCV+yU3TzVcdFGvqEWBId3bz3fyeZ8r+EBddomcFmzs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=a0b499u+Q5Dkp3CepTh8AskKRkCa0ym5FjIpkV7/gyH4mCO/5D3CBP5YgGTSx6CEl
 VpNI7RTEbgkgq+obquuQXVc2lEnN07Ue1BeYuilU4Oke/GYR7Df9uhafdi5Dx+4PhK
 4rnHyhuUsavy9RCOTICKYRxYSXqU9sOJHJadTWgA=
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
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgMjYsIDIwMTkgYXQgMzoxNSBBTSBTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5wcmlj
ZUBhcm0uY29tPiB3cm90ZToKPgo+IE9uIDI1LzA3LzIwMTkgMjI6MTEsIFJvYiBIZXJyaW5nIHdy
b3RlOgo+ID4gT24gVGh1LCBKdWwgMjUsIDIwMTkgYXQgNzowOCBBTSBSb2JpbiBNdXJwaHkgPHJv
YmluLm11cnBoeUBhcm0uY29tPiB3cm90ZToKPiA+Pgo+ID4+IEhpIFJvYiwKPiA+Pgo+ID4+IE9u
IDI1LzA3LzIwMTkgMDI6MTAsIFJvYiBIZXJyaW5nIHdyb3RlOgo+ID4+IFsuLi5dCj4gPj4+IEBA
IC0zMjgsNiArNDI3LDE4IEBAIHN0YXRpYyBpcnFyZXR1cm5fdCBwYW5mcm9zdF9tbXVfaXJxX2hh
bmRsZXIoaW50IGlycSwgdm9pZCAqZGF0YSkKPiA+Pj4gICAgICAgICAgICAgICAgYWNjZXNzX3R5
cGUgPSAoZmF1bHRfc3RhdHVzID4+IDgpICYgMHgzOwo+ID4+PiAgICAgICAgICAgICAgICBzb3Vy
Y2VfaWQgPSAoZmF1bHRfc3RhdHVzID4+IDE2KTsKPiA+Pj4KPiA+Pj4gKyAgICAgICAgICAgICAv
KiBQYWdlIGZhdWx0IG9ubHkgKi8KPiA+Pj4gKyAgICAgICAgICAgICBpZiAoKHN0YXR1cyAmIG1h
c2spID09IEJJVChpKSkgewo+ID4+PiArICAgICAgICAgICAgICAgICAgICAgV0FSTl9PTihleGNl
cHRpb25fdHlwZSA8IDB4QzEgfHwgZXhjZXB0aW9uX3R5cGUgPiAweEM0KTsKPiA+Pj4gKwo+ID4+
PiArICAgICAgICAgICAgICAgICAgICAgcmV0ID0gcGFuZnJvc3RfbW11X21hcF9mYXVsdF9hZGRy
KHBmZGV2LCBpLCBhZGRyKTsKPiA+Pj4gKyAgICAgICAgICAgICAgICAgICAgIGlmICghcmV0KSB7
Cj4gPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1tdV93cml0ZShwZmRldiwgTU1V
X0lOVF9DTEVBUiwgQklUKGkpKTsKPiA+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
c3RhdHVzICY9IH5tYXNrOwo+ID4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb250
aW51ZTsKPiA+Pj4gKyAgICAgICAgICAgICAgICAgICAgIH0KPiA+Pj4gKyAgICAgICAgICAgICB9
Cj4gPj4+ICsKPiA+Pj4gICAgICAgICAgICAgICAgLyogdGVybWluYWwgZmF1bHQsIHByaW50IGlu
Zm8gYWJvdXQgdGhlIGZhdWx0ICovCj4gPj4+ICAgICAgICAgICAgICAgIGRldl9lcnIocGZkZXYt
PmRldiwKPiA+Pj4gICAgICAgICAgICAgICAgICAgICAgICAiVW5oYW5kbGVkIFBhZ2UgZmF1bHQg
aW4gQVMlZCBhdCBWQSAweCUwMTZsbFhcbiIKPiA+Pj4gQEAgLTM2OCw4ICs0NzksOSBAQCBpbnQg
cGFuZnJvc3RfbW11X2luaXQoc3RydWN0IHBhbmZyb3N0X2RldmljZSAqcGZkZXYpCj4gPj4+ICAg
ICAgICBpZiAoaXJxIDw9IDApCj4gPj4+ICAgICAgICAgICAgICAgIHJldHVybiAtRU5PREVWOwo+
ID4+Pgo+ID4+PiAtICAgICBlcnIgPSBkZXZtX3JlcXVlc3RfaXJxKHBmZGV2LT5kZXYsIGlycSwg
cGFuZnJvc3RfbW11X2lycV9oYW5kbGVyLAo+ID4+PiAtICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIElSUUZfU0hBUkVELCAibW11IiwgcGZkZXYpOwo+ID4+PiArICAgICBlcnIgPSBkZXZtX3Jl
cXVlc3RfdGhyZWFkZWRfaXJxKHBmZGV2LT5kZXYsIGlycSwgTlVMTCwKPiA+Pj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYW5mcm9zdF9tbXVfaXJxX2hhbmRsZXIsCj4g
Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgSVJRRl9PTkVTSE9ULCAi
bW11IiwgcGZkZXYpOwo+ID4+Cj4gPj4gVGhlIGNoYW5nZSBvZiBmbGFncyBoZXJlIGJyZWFrcyBw
bGF0Zm9ybXMgdXNpbmcgYSBzaW5nbGUgc2hhcmVkCj4gPj4gaW50ZXJydXB0IGxpbmUuCj4gPgo+
ID4gRG8gdGhleSBleGlzdD8gSSB0aGluayB0aGlzIHdhcyBsYXJnZWx5IGNvcHktbi1wYXN0ZSBs
ZWZ0b3ZlciBmcm9tIHRoZQo+Cj4gR29vZCBxdWVzdGlvbiAtIG9mIHRoZSBwbGF0Zm9ybXMgSSBr
bm93IGFib3V0IHRoZXkgYWxsIGhhdmUgc2VwYXJhdGUKPiBJUlFzLCBidXQga2Jhc2UgZG9lcyBl
eHBsaWNpdGx5IGFsbG93IHNoYXJlZCBpbnRlcnJ1cHRzIHNvIGl0J3MgcXVpdGUKPiBwb3NzaWJs
ZSB0aGVyZSBpcyBhIHBsYXRmb3JtIG91dCB0aGVyZSB3aGljaCBkb2VzLgo+Cj4gPiBsaW1hIGRy
aXZlciB3aGVyZSB1dGdhcmQgaGFzIGEgYnVuY2ggb2YgaXJxcyBhbmQgc28gdGhleSBnZXQgY29t
YmluZWQuCj4gPiBXaGlsZSBpdCdzIHBvc3NpYmxlIGNlcnRhaW5seSwgSSdkIGxpa2UgdG8gYXZv
aWQgaGF2aW5nIHRvIGRvIGZ1cnRoZXIKPiA+IHJld29yayBlaXRoZXIgdG8gdXNlIGEgd29ya3F1
ZXVlIG9yIHdlIG5lZWQgYSBzaW5nbGUgZHJpdmVyIGhhbmRsZXIKPiA+IHdoaWNoIHRoZW4gZGlz
cGF0Y2hlcyB0aGUgc3ViIGhhbmRsZXJzLiBUaGUgcHJvYmxlbSBpcyB0aHJlYWRlZCBpcnEKPiA+
IGhhbmRsZXJzIGRvbid0IHdvcmsgd2l0aCBzaGFyZWQgaXJxcy4KPgo+IEl0IHNlZW1zIHJlYXNv
bmFibGUgdG8gbWUgdG8gYXQgbGVhc3Qgd2FpdCB1bnRpbCBzb21lb25lIGlkZW50aWZpZXMgYQo+
IHBsYXRmb3JtIHdoaWNoIG5lZWRzIHNoYXJlZCBpbnRlcnJ1cHRzIGJlZm9yZSBlbWJhcmtpbmcg
b24gdGhlIHJlZmFjdG9yaW5nLgoKQW5kIG5vdyBzb21lb25lIGhhcyBvbiBpcmMuLi4KCkl0IG1h
eSBub3QgYmUgYXMgbXVjaCByZXdvcmsgYXMgSSB0aG91Z2h0LiBXZSBoYXZlIHRvIHNldCBJUlFG
X09ORVNIT1QKYW5kIHRoZSByZXF1aXJlbWVudCBpcyBhbGwgc2hhcmVkIGhhbmRsZXJzJyBmbGFn
cyBoYXZlIHRvIG1hdGNoLiBUaGUKR1BVIGFuZCBqb2IgSVNScyBhcmUgbm90IGNyaXRpY2FsIHBh
dGhzLCBzbyB0aGV5IGNhbiBiZSB0aHJlYWRlZCB0b28uCkknbGwgdGVzdCB0aGlzIG91dC4KClJv
YgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
