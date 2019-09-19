Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40269B7F6F
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2019 18:55:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F2B16F53A;
	Thu, 19 Sep 2019 16:55:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FA516F537
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 16:55:20 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C55B12196E
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 16:55:19 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id y144so4083893qkb.7
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 09:55:19 -0700 (PDT)
X-Gm-Message-State: APjAAAXRS7qtMAPCpsfOV76raMUhtJ0diSzTc5W479RabiMbzfVaJl57
 +0sKSCZKkMooHjismLrxOtG9z0VH5yOsqyNn1w==
X-Google-Smtp-Source: APXvYqyA0BiAMvX3zTZbbq53YgidUsvY1WbDgee1ttXB8Fr0C05ojiHENMNUnVFgowSopR38svpPqH0ezqJzDiyexzg=
X-Received: by 2002:a37:682:: with SMTP id 124mr3783029qkg.393.1568912118989; 
 Thu, 19 Sep 2019 09:55:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190904123032.23263-1-broonie@kernel.org>
 <ccd81530-2dbd-3c02-ca0a-1085b00663b5@arm.com>
 <CAL_JsqKWEe=+X5AYRJ-_8peTzfrOrRBfFWgk8c6h3TN6f0ZHtA@mail.gmail.com>
 <3e3a2c8a-b4fc-8af6-39e1-b26160db2c7c@arm.com>
In-Reply-To: <3e3a2c8a-b4fc-8af6-39e1-b26160db2c7c@arm.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 19 Sep 2019 11:55:08 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKTJE=PURj_CJGXgR+=K=vn6YGfD4FJ6wuwNzvs=fOBQQ@mail.gmail.com>
Message-ID: <CAL_JsqKTJE=PURj_CJGXgR+=K=vn6YGfD4FJ6wuwNzvs=fOBQQ@mail.gmail.com>
Subject: Re: [PATCH] drm/panfrost: Fix regulator_get_optional() misuse
To: Steven Price <steven.price@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1568912119;
 bh=5rVjIPHL2cnlL1gfY8saDq0zSQ2lRGBAEHD4oLsuXQY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=fjoeJ4FZTnG/THhXTEtMWSn8XpndCUl/IjvLFRu3quQ+4snlo6kqL7vxTMUdmvCRT
 XD8n5v5BcKnQt2iKeOJ2avf35XY75Jh95sLZzdJd1fOf+22BFR9WDHj/QrDjG+Xgyh
 rdEvz9EWHvjwEJDWQfKCpc9hqugR0JQsO3ACQpps=
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>, Mark Brown <broonie@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBTZXAgOSwgMjAxOSBhdCAxMToyMiBBTSBTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5wcmlj
ZUBhcm0uY29tPiB3cm90ZToKPgo+IE9uIDA5LzA5LzIwMTkgMTY6NDEsIFJvYiBIZXJyaW5nIHdy
b3RlOgo+ID4gT24gRnJpLCBTZXAgNiwgMjAxOSBhdCA0OjIzIFBNIFN0ZXZlbiBQcmljZSA8c3Rl
dmVuLnByaWNlQGFybS5jb20+IHdyb3RlOgo+ID4+Cj4gPj4gT24gMDQvMDkvMjAxOSAxMzozMCwg
TWFyayBCcm93biB3cm90ZToKPiA+Pj4gVGhlIHBhbmZyb3N0IGRyaXZlciByZXF1ZXN0cyBhIHN1
cHBseSB1c2luZyByZWd1bGF0b3JfZ2V0X29wdGlvbmFsKCkKPiA+Pj4gYnV0IGJvdGggdGhlIG5h
bWUgb2YgdGhlIHN1cHBseSBhbmQgdGhlIHVzYWdlIHBhdHRlcm4gc3VnZ2VzdCB0aGF0IGl0IGlz
Cj4gPj4+IGJlaW5nIHVzZWQgZm9yIHRoZSBtYWluIHBvd2VyIGZvciB0aGUgZGV2aWNlIGFuZCBp
cyBub3QgYXQgYWxsIG9wdGlvbmFsCj4gPj4+IGZvciB0aGUgZGV2aWNlIGZvciBmdW5jdGlvbiwg
dGhlcmUgaXMgbm8gbWVhbmluZ2Z1bCBoYW5kbGluZyBmb3IgYWJzZW50Cj4gPj4+IHN1cHBsaWVz
LiAgU3VjaCByZWd1bGF0b3JzIHNob3VsZCB1c2UgdGhlIHZhbmlsbGEgcmVndWxhdG9yX2dldCgp
Cj4gPj4+IGludGVyZmFjZSwgaXQgd2lsbCBlbnN1cmUgdGhhdCBldmVuIGlmIGEgc3VwcGx5IGlz
IG5vdCBkZXNjcmliZWQgaW4gdGhlCj4gPj4+IHN5c3RlbSBpbnRlZ3JhdGlvbiBvbmUgd2lsbCBi
ZSBwcm92aWRlZCBpbiBzb2Z0d2FyZS4KPiA+Pj4KPiA+Pj4gU2lnbmVkLW9mZi1ieTogTWFyayBC
cm93biA8YnJvb25pZUBrZXJuZWwub3JnPgo+ID4+Cj4gPj4gVGVzdGVkLWJ5OiBTdGV2ZW4gUHJp
Y2UgPHN0ZXZlbi5wcmljZUBhcm0uY29tPgo+ID4+Cj4gPj4gTG9va3MgbGlrZSBteSBhcHByb2Fj
aCB0byB0aGlzIHdhcyB3cm9uZyAtIHNvIHdlIHNob3VsZCBhbHNvIHJldmVydCB0aGUKPiA+PiBj
aGFuZ2VzIEkgbWFkZSBwcmV2aW91c2x5Lgo+ID4+Cj4gPj4gLS0tLTg8LS0tLQo+ID4+IEZyb20g
ZmUyMGY4YWJjZGU4NDQ0YmI0MWE4ZjcyZmIzNWRlOTQzYTI3ZWM1YyBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKPiA+PiBGcm9tOiBTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5wcmljZUBhcm0uY29tPgo+
ID4+IERhdGU6IEZyaSwgNiBTZXAgMjAxOSAxNToyMDo1MyArMDEwMAo+ID4+IFN1YmplY3Q6IFtQ
QVRDSF0gZHJtL3BhbmZyb3N0OiBSZXZlcnQgY2hhbmdlcyB0byBjb3BlIHdpdGggTlVMTCByZWd1
bGF0b3IKPiA+Pgo+ID4+IEhhbmRsaW5nIGEgTlVMTCByZXR1cm4gZnJvbSBkZXZtX3JlZ3VsYXRv
cl9nZXRfb3B0aW9uYWwoKSBkb2Vzbid0IHNlZW0KPiA+PiBsaWtlIHRoZSBjb3JyZWN0IHdheSBv
ZiBoYW5kbGluZyB0aGlzLiBJbnN0ZWFkIHJldmVydCB0aGUgY2hhbmdlcyBpbgo+ID4+IGZhdm91
ciBvZiBzd2l0Y2hpbmcgdG8gdXNpbmcgZGV2bV9yZWd1bGF0b3JfZ2V0KCkgd2hpY2ggd2lsbCBy
ZXR1cm4gYQo+ID4+IGR1bW15IHJlZ3VsYXRvciBpbnN0ZWFkLgo+ID4+Cj4gPj4gUmV2ZXJ0cyBj
b21taXQgNTIyODIxNjNkZmE2ICgiZHJtL3BhbmZyb3N0OiBBZGQgbWlzc2luZyBjaGVjayBmb3Ig
cGZkZXYtPnJlZ3VsYXRvciIpCj4gPj4gUmV2ZXJ0cyBjb21taXQgZTIxZGQyOTA4ODFiICgiZHJt
L3BhbmZyb3N0OiBFbmFibGUgZGV2ZnJlcSB0byB3b3JrIHdpdGhvdXQgcmVndWxhdG9yIikKPiA+
Cj4gPiBEb2VzIGEgc3RyYWlnaHQgcmV2ZXJ0IG9mIHRoZXNlIDIgcGF0Y2hlcyBub3Qgd29yaz8g
SWYgaXQgZG9lcyB3b3JrLAo+ID4gY2FuIHlvdSBkbyB0aGF0IGFuZCBzZW5kIHRvIHRoZSBsaXN0
LiBJIGRvbid0IHdhbnQgbXkgaGFuZCBzbGFwcGVkCj4gPiBhZ2FpbiByZXZlcnRpbmcgdGhpbmdz
Lgo+Cj4gSSB3YXNuJ3Qgc3VyZSB3aGF0IHdhcyBiZXN0IGhlcmUgLSA1MjI4MjE2M2RmYTYgaXMg
YSBidWcgZml4LCBzbwo+IHJldmVydGluZyB0aGF0IGZvbGxvd2VkIGJ5IGUyMWRkMjkwODgxYiB3
b3VsZCAocmUtKWludHJvZHVjZSBhCj4gcmVncmVzc2lvbiBmb3IgdGhhdCBvbmUgY29tbWl0IChp
LmUuIG5vdCBjb21wbGV0ZWx5IGJpc2VjdGFibGUpLgo+IFJldmVydGluZyBpbiB0aGUgb3RoZXIg
b3JkZXIgd291bGQgd29yaywgYnV0IHNlZW1zIGEgbGl0dGxlIG9kZC4KPiBTcXVhc2hpbmcgdGhl
IHJldmVydHMgc2VlbWVkIHRoZSBuZWF0ZXN0IG9wdGlvbiAtIGJ1dCBpdCdzIG5vdCBteSBoYW5k
Cj4gYXQgcmlzay4uLiA6KQo+Cj4gUGVyaGFwcyBpdCB3b3VsZCBiZSBiZXN0IHRvIHNpbXBseSBh
cHBseSBNYXJrJ3MgY2hhbmdlIGZvbGxvd2VkIGJ5Cj4gc29tZXRoaW5nIGxpa2UgdGhlIGZvbGxv
d2luZy4gVGhhdCB3YXkgaXQncyBub3QgYWN0dWFsbHkgYSByZXZlcnQhCj4gSXQgYWxzbyBhdm9p
ZHMgKHJlLSlhZGRpbmcgdGhlIG5vdyByZWR1bmRhbnQgY2hlY2sgaW4KPiBwYW5mcm9zdF9kZXZm
cmVxX2luaXQoKS4KPgo+IFN0ZXZlCj4KPiAtLS04PC0tLS0KPiBGcm9tIGZiMjk1NmFjZGY0NmNh
MDQwOTVlZjExMzYzYzEzNmRjOTRhMWFiMTggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCj4gRnJv
bTogU3RldmVuIFByaWNlIDxzdGV2ZW4ucHJpY2VAYXJtLmNvbT4KPiBEYXRlOiBGcmksIDYgU2Vw
IDIwMTkgMTU6MjA6NTMgKzAxMDAKPiBTdWJqZWN0OiBbUEFUQ0hdIGRybS9wYW5mcm9zdDogUmVt
b3ZlIE5VTEwgY2hlY2tzIGZvciByZWd1bGF0b3IKPgo+IGRldm1fcmVndWxhdG9yX2dldCgpIGlz
IG5vdyB1c2VkIHRvIHBvcHVsYXRlIHBmZGV2LT5yZWd1bGF0b3Igd2hpY2gKPiBlbnN1cmVzIHRo
YXQgdGhpcyBjYW5ub3QgYmUgTlVMTCAoYSBkdW1teSByZWd1bGF0b3Igd2lsbCBiZSByZXR1cm5l
ZCBpZgo+IG5lY2Vzc2FyeSkuIFNvIHJlbW92ZSB0aGUgY2hlY2tzIGluIHBhbmZyb3N0X2RldmZy
ZXFfdGFyZ2V0KCkuCj4KPiBTaWduZWQtb2ZmLWJ5OiBTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5wcmlj
ZUBhcm0uY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2
ZnJlcS5jIHwgMTAgKysrKy0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCsp
LCA2IGRlbGV0aW9ucygtKQoKT2theSwgSSd2ZSBnb25lIHRoaXMgcm91dGUgYW5kIGFwcGxpZWQg
TWFyaydzIHBhdGNoIGFuZCB0aGlzIG9uZS4KClJvYgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
