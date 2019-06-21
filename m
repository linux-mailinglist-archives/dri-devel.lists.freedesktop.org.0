Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CFC4E12B
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 09:23:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5410C6E836;
	Fri, 21 Jun 2019 07:23:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BE786E7EC
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 01:58:05 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id v129so2822860vsb.11
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2019 18:58:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v0FbC0Xdnnb68PWmVlA2vC7ih6OKam4biQiJRuW8orc=;
 b=qURIcDYfbzhF6FRkal1mxkxbkSEf69puzqMstPOuCmTurYorpfK4wZUvWVSuNUKgnT
 rLMYPmgo/p6ZzWLxxvrutaUdcSmcxud+Q2/7SzEhWp69L4Fmpzklx0NPZqiMv493aZ+p
 /SVY8VJnyTMOhyfqMcjIZbxlCBIMKuWaWPGWrhyB9LvHW6nSzOPJ1rBmE7D37+7PL/C0
 NljKb44FEtKrFr4lxGsPF7HxC9Zu0cckE2VaeD2g7pvb26uj7i85v2CreAaPdBmMhp01
 31yaMTdY/Kq+XHszfCp0QE3AeevpfzZB1Ze/py3yYG6iy1BHlekNUFUfDFx/mzDbferB
 KMEw==
X-Gm-Message-State: APjAAAWaZ6J3fc/+OChYptNPqMRAuObj6RcCKXfii3+8VjHzwtbegfQV
 bBVUcnsYTdyx2X9VA798dkYyNKwnx3820Hp3obLueQ==
X-Google-Smtp-Source: APXvYqynIpC8UeAIAKmqGg7+BnEM5kPsN/6M+239KLGUtn+uDjwNBpvvs8RYiwSGVVeN8P2fBnGv1nECg5lE54nmZWg=
X-Received: by 2002:a67:7d13:: with SMTP id y19mr53842535vsc.232.1561082283839; 
 Thu, 20 Jun 2019 18:58:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190611040350.90064-1-dbasehore@chromium.org>
 <20190611040350.90064-4-dbasehore@chromium.org>
 <20190611085722.GX21222@phenom.ffwll.local>
 <CAGAzgsr2sh5B1xi_ztQPN0xoQsZd26DDXwWT_qqJ68XeKReJ_Q@mail.gmail.com>
In-Reply-To: <CAGAzgsr2sh5B1xi_ztQPN0xoQsZd26DDXwWT_qqJ68XeKReJ_Q@mail.gmail.com>
From: "dbasehore ." <dbasehore@chromium.org>
Date: Thu, 20 Jun 2019 18:57:52 -0700
Message-ID: <CAGAzgsoE5CgkQVhU_LSsetBRistMnuRqO7Sh+cuycMJa7QXzDg@mail.gmail.com>
Subject: Re: [PATCH 3/5] drm/panel: Add attach/detach callbacks
To: Derek Basehore <dbasehore@chromium.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 devicetree@vger.kernel.org, Intel Graphics <intel-gfx@lists.freedesktop.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-Mailman-Approved-At: Fri, 21 Jun 2019 07:22:42 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=v0FbC0Xdnnb68PWmVlA2vC7ih6OKam4biQiJRuW8orc=;
 b=Szp2IOTt8MAH66bTRQ2mDk2Pfo0wUi0/7oMQgyfH6fEs59PGr+WL6otSTZ2TvBj84Y
 9zhl+I1aG4XDrcYPISzPSKY2t+lFsNawmZ+y/3eCwhkS/Qscgfohk/FjGrZlkr29kFXw
 TVx/+qhcv8lRwAP/98l1vJWFnhtUIalJBrsa4=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SWYgd2Ugd2FudCB0byBxdWVyeSB0aGUgZGV2aWNlIHRyZWUgb3V0c2lkZSBvZiB0aGUgcGFuZWwg
Y29kZSBpbgpoZWxwZXIgZnVuY3Rpb25zLCB3ZSBjYW4gZG8gdGhpcyB3aXRoIHRoZSBzdHJ1Y3Qg
YXMgaXMuIFRoZXJlJ3MKYWxyZWFkeSBhIGRldmljZSBzdHJ1Y3QgcG9pbnRlciBpbiBkcm1fcGFu
ZWwsIHNvIEkgdGhpbmsgd2UgY2FuIHB1bGwKZnJvbSB0aGF0LgoKT24gVHVlLCBKdW4gMTEsIDIw
MTkgYXQgNToyNSBQTSBkYmFzZWhvcmUgLiA8ZGJhc2Vob3JlQGNocm9taXVtLm9yZz4gd3JvdGU6
Cj4KPiBPbiBUdWUsIEp1biAxMSwgMjAxOSBhdCAxOjU3IEFNIERhbmllbCBWZXR0ZXIgPGRhbmll
bEBmZndsbC5jaD4gd3JvdGU6Cj4gPgo+ID4gT24gTW9uLCBKdW4gMTAsIDIwMTkgYXQgMDk6MDM6
NDhQTSAtMDcwMCwgRGVyZWsgQmFzZWhvcmUgd3JvdGU6Cj4gPiA+IFRoaXMgYWRkcyB0aGUgYXR0
YWNoL2RldGFjaCBjYWxsYmFja3MuIFRoZXNlIGFyZSBmb3Igc2V0dGluZyB1cAo+ID4gPiBpbnRl
cm5hbCBzdGF0ZSBmb3IgdGhlIGNvbm5lY3Rvci9wYW5lbCBwYWlyIHRoYXQgY2FuJ3QgYmUgZG9u
ZSBhdAo+ID4gPiBwcm9iZSAoc2luY2UgdGhlIGNvbm5lY3RvciBkb2Vzbid0IGV4aXN0KSBhbmQg
d2hpY2ggZG9uJ3QgbmVlZCB0byBiZQo+ID4gPiByZXBlYXRlZGx5IGRvbmUgZm9yIGV2ZXJ5IGdl
dC9tb2RlcywgcHJlcGFyZSwgb3IgZW5hYmxlIGNhbGxiYWNrLgo+ID4gPiBWYWx1ZXMgc3VjaCBh
cyB0aGUgcGFuZWwgb3JpZW50YXRpb24sIGFuZCBkaXNwbGF5IHNpemUgY2FuIGJlIGZpbGxlZAo+
ID4gPiBpbiBmb3IgdGhlIGNvbm5lY3Rvci4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogRGVy
ZWsgQmFzZWhvcmUgPGRiYXNlaG9yZUBjaHJvbWl1bS5vcmc+Cj4gPiA+IC0tLQo+ID4gPiAgZHJp
dmVycy9ncHUvZHJtL2RybV9wYW5lbC5jIHwgMTQgKysrKysrKysrKysrKysKPiA+ID4gIGluY2x1
ZGUvZHJtL2RybV9wYW5lbC5oICAgICB8ICA0ICsrKysKPiA+ID4gIDIgZmlsZXMgY2hhbmdlZCwg
MTggaW5zZXJ0aW9ucygrKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2RybV9wYW5lbC5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9wYW5lbC5jCj4gPiA+IGluZGV4IDNi
Njg5Y2U0YTUxYS4uNzJmNjc2NzhkOWQ1IDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vZHJtX3BhbmVsLmMKPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9wYW5lbC5jCj4g
PiA+IEBAIC0xMDQsMTIgKzEwNCwyMyBAQCBFWFBPUlRfU1lNQk9MKGRybV9wYW5lbF9yZW1vdmUp
Owo+ID4gPiAgICovCj4gPiA+ICBpbnQgZHJtX3BhbmVsX2F0dGFjaChzdHJ1Y3QgZHJtX3BhbmVs
ICpwYW5lbCwgc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikKPiA+ID4gIHsKPiA+ID4g
KyAgICAgaW50IHJldDsKPiA+ID4gKwo+ID4gPiAgICAgICBpZiAocGFuZWwtPmNvbm5lY3RvcikK
PiA+ID4gICAgICAgICAgICAgICByZXR1cm4gLUVCVVNZOwo+ID4gPgo+ID4gPiAgICAgICBwYW5l
bC0+Y29ubmVjdG9yID0gY29ubmVjdG9yOwo+ID4gPiAgICAgICBwYW5lbC0+ZHJtID0gY29ubmVj
dG9yLT5kZXY7Cj4gPiA+Cj4gPiA+ICsgICAgIGlmIChwYW5lbC0+ZnVuY3MtPmF0dGFjaCkgewo+
ID4gPiArICAgICAgICAgICAgIHJldCA9IHBhbmVsLT5mdW5jcy0+YXR0YWNoKHBhbmVsKTsKPiA+
ID4gKyAgICAgICAgICAgICBpZiAocmV0IDwgMCkgewo+ID4gPiArICAgICAgICAgICAgICAgICAg
ICAgcGFuZWwtPmNvbm5lY3RvciA9IE5VTEw7Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICBw
YW5lbC0+ZHJtID0gTlVMTDsKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgIHJldHVybiByZXQ7
Cj4gPiA+ICsgICAgICAgICAgICAgfQo+ID4gPiArICAgICB9Cj4gPgo+ID4gV2h5IGNhbid0IHdl
IGp1c3QgaW1wbGVtZW50IHRoaXMgaW4gdGhlIGRybSBoZWxwZXJzIGZvciBldmVyeW9uZSwgYnkg
ZS5nLgo+ID4gc3RvcmluZyBhIGR0IG5vZGUgaW4gZHJtX3BhbmVsPyBGZWVscyBhIGJpdCBvdmVy
a2lsbCB0byBoYXZlIHRoZXNlIG5ldwo+ID4gaG9va3MgaGVyZS4KPiA+Cj4gPiBBbHNvLCBteSB1
bmRlcnN0YW5kaW5nIGlzIHRoYXQgdGhpcyBkdCBzdHVmZiBpcyBzdXBwb3NlZCB0byBiZQo+ID4g
c3RhbmRhcmRpemVkLCBzbyB0aGlzIHNob3VsZCB3b3JrLgo+Cj4gU28gZG8geW91IHdhbnQgYWxs
IG9mIHRoaXMgaW5mb3JtYXRpb24gYWRkZWQgdG8gdGhlIGRybV9wYW5lbCBzdHJ1Y3Q/Cj4gSWYg
d2UgZG8gdGhhdCwgd2UgZG9uJ3QgbmVjZXNzYXJpbHkgZXZlbiBuZWVkIHRoZSBkcm0gaGVscGVy
IGZ1bmN0aW9uLgo+IFdlIGNvdWxkIGp1c3QgY29weSB0aGUgdmFsdWVzIG92ZXIgaGVyZSBpbiB0
aGUgZHJtX3BhbmVsX2F0dGFjaAo+IGZ1bmN0aW9uIChhbmQgY2xlYXIgdGhlbSBpbiBkcm1fcGFu
ZWxfZGV0YWNoKS4KPgo+ID4gLURhbmllbAo+ID4KPiA+ID4gKwo+ID4gPiAgICAgICByZXR1cm4g
MDsKPiA+ID4gIH0KPiA+ID4gIEVYUE9SVF9TWU1CT0woZHJtX3BhbmVsX2F0dGFjaCk7Cj4gPiA+
IEBAIC0xMjgsNiArMTM5LDkgQEAgRVhQT1JUX1NZTUJPTChkcm1fcGFuZWxfYXR0YWNoKTsKPiA+
ID4gICAqLwo+ID4gPiAgaW50IGRybV9wYW5lbF9kZXRhY2goc3RydWN0IGRybV9wYW5lbCAqcGFu
ZWwpCj4gPiA+ICB7Cj4gPiA+ICsgICAgIGlmIChwYW5lbC0+ZnVuY3MtPmRldGFjaCkKPiA+ID4g
KyAgICAgICAgICAgICBwYW5lbC0+ZnVuY3MtPmRldGFjaChwYW5lbCk7Cj4gPiA+ICsKPiA+ID4g
ICAgICAgcGFuZWwtPmNvbm5lY3RvciA9IE5VTEw7Cj4gPiA+ICAgICAgIHBhbmVsLT5kcm0gPSBO
VUxMOwo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX3BhbmVsLmggYi9p
bmNsdWRlL2RybS9kcm1fcGFuZWwuaAo+ID4gPiBpbmRleCAxMzYzMWIyZWZiYWEuLmUxMzZlM2Ez
Yzk5NiAxMDA2NDQKPiA+ID4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX3BhbmVsLmgKPiA+ID4gKysr
IGIvaW5jbHVkZS9kcm0vZHJtX3BhbmVsLmgKPiA+ID4gQEAgLTM3LDYgKzM3LDggQEAgc3RydWN0
IGRpc3BsYXlfdGltaW5nOwo+ID4gPiAgICogc3RydWN0IGRybV9wYW5lbF9mdW5jcyAtIHBlcmZv
cm0gb3BlcmF0aW9ucyBvbiBhIGdpdmVuIHBhbmVsCj4gPiA+ICAgKiBAZGlzYWJsZTogZGlzYWJs
ZSBwYW5lbCAodHVybiBvZmYgYmFjayBsaWdodCwgZXRjLikKPiA+ID4gICAqIEB1bnByZXBhcmU6
IHR1cm4gb2ZmIHBhbmVsCj4gPiA+ICsgKiBAZGV0YWNoOiBkZXRhY2ggcGFuZWwtPmNvbm5lY3Rv
ciAoY2xlYXIgaW50ZXJuYWwgc3RhdGUsIGV0Yy4pCj4gPiA+ICsgKiBAYXR0YWNoOiBhdHRhY2gg
cGFuZWwtPmNvbm5lY3RvciAodXBkYXRlIGludGVybmFsIHN0YXRlLCBldGMuKQo+ID4gPiAgICog
QHByZXBhcmU6IHR1cm4gb24gcGFuZWwgYW5kIHBlcmZvcm0gc2V0IHVwCj4gPiA+ICAgKiBAZW5h
YmxlOiBlbmFibGUgcGFuZWwgKHR1cm4gb24gYmFjayBsaWdodCwgZXRjLikKPiA+ID4gICAqIEBn
ZXRfbW9kZXM6IGFkZCBtb2RlcyB0byB0aGUgY29ubmVjdG9yIHRoYXQgdGhlIHBhbmVsIGlzIGF0
dGFjaGVkIHRvIGFuZAo+ID4gPiBAQCAtNzAsNiArNzIsOCBAQCBzdHJ1Y3QgZGlzcGxheV90aW1p
bmc7Cj4gPiA+ICBzdHJ1Y3QgZHJtX3BhbmVsX2Z1bmNzIHsKPiA+ID4gICAgICAgaW50ICgqZGlz
YWJsZSkoc3RydWN0IGRybV9wYW5lbCAqcGFuZWwpOwo+ID4gPiAgICAgICBpbnQgKCp1bnByZXBh
cmUpKHN0cnVjdCBkcm1fcGFuZWwgKnBhbmVsKTsKPiA+ID4gKyAgICAgdm9pZCAoKmRldGFjaCko
c3RydWN0IGRybV9wYW5lbCAqcGFuZWwpOwo+ID4gPiArICAgICBpbnQgKCphdHRhY2gpKHN0cnVj
dCBkcm1fcGFuZWwgKnBhbmVsKTsKPiA+ID4gICAgICAgaW50ICgqcHJlcGFyZSkoc3RydWN0IGRy
bV9wYW5lbCAqcGFuZWwpOwo+ID4gPiAgICAgICBpbnQgKCplbmFibGUpKHN0cnVjdCBkcm1fcGFu
ZWwgKnBhbmVsKTsKPiA+ID4gICAgICAgaW50ICgqZ2V0X21vZGVzKShzdHJ1Y3QgZHJtX3BhbmVs
ICpwYW5lbCk7Cj4gPiA+IC0tCj4gPiA+IDIuMjIuMC5yYzIuMzgzLmdmNGZiYmYzMGMyLWdvb2cK
PiA+ID4KPiA+Cj4gPiAtLQo+ID4gRGFuaWVsIFZldHRlcgo+ID4gU29mdHdhcmUgRW5naW5lZXIs
IEludGVsIENvcnBvcmF0aW9uCj4gPiBodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
