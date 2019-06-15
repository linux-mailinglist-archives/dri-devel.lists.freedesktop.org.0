Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E9B47510
	for <lists+dri-devel@lfdr.de>; Sun, 16 Jun 2019 16:03:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F359F892A0;
	Sun, 16 Jun 2019 14:02:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 174B7896DD
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jun 2019 00:43:22 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id u124so2872199vsu.2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 17:43:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l6kNs3vEbtZJz4gwMNE28MUy8volKIouYnWugvC1QNU=;
 b=HH7al/qQbbskGUsYuVhuLRyY2e6UIReruTpNa+akGDhpOuq38s2SgkPjakcl8W5SGp
 C03Mkq3i7WIAFB5adnfLEvBCY2OBQBUBOyOKek1GFxzXQKfGFMw8xeqEdLss6psep+75
 IkALbzMfdbLnBb7GHyCmKw5e1Rlv1cyZJDqS2uB2mPgpOlUVxQv0m7teBmWCUT+l3c7l
 GYcUOpYpAnvPrO8MDLlj+xIkV/8GYf88NOPoVDgO62mVpTabCBbeJ0MFeOCyVZGPFlCb
 KNuAjDBHfnWB/rKZE/5gJaLk/SNjFiXnMGc0fAuW7QFsK+kPCHpCpWlgewMhPaLc1tA2
 NaQQ==
X-Gm-Message-State: APjAAAXhEHybiu5gqYLRc3lCW4WKyz6qRHL7wj/bDE1XcZ4yYQhqQ4bf
 d5fOwFmpaxKRdZr2dbdCz1dfXdxh77ObZt2+crMfWA==
X-Google-Smtp-Source: APXvYqyINzqLgoly97nAXbatYBIej847145lvC8l1Nj5Kjy8R4NBcmHdKvzptibuPr0Xq13NWsmWUIGgZWXDsSkN+Eo=
X-Received: by 2002:a67:7d13:: with SMTP id y19mr35490665vsc.232.1560559400933; 
 Fri, 14 Jun 2019 17:43:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190611040350.90064-1-dbasehore@chromium.org>
 <20190611040350.90064-2-dbasehore@chromium.org>
 <20190612211807.GA13155@ravnborg.org>
In-Reply-To: <20190612211807.GA13155@ravnborg.org>
From: "dbasehore ." <dbasehore@chromium.org>
Date: Fri, 14 Jun 2019 17:43:09 -0700
Message-ID: <CAGAzgsqgbr5rWpyWB1H_66=kxBRb7kw4wE7h34TJfE7eJ1mSQQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] drm/panel: Add helper for reading DT rotation
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Approved-At: Sun, 16 Jun 2019 14:01:48 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=l6kNs3vEbtZJz4gwMNE28MUy8volKIouYnWugvC1QNU=;
 b=TJKsD2z1z6LHWkhgoQw49uj/KvYdTS4zbFAkQsUSVUQ3JEk20zJgrxRzVBZUGXky+U
 05mj3xF2RM3pjz4JVDJMHlBOWviTHw/Ksu/cCWRuiKqbTVSm3IQC/+NKQaFD89Z7owt4
 inHctQiUqxK3dyWeKKUR0/v4aWFYvh8U5FlKo=
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
 David Airlie <airlied@linux.ie>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Sean Paul <sean@poorly.run>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMTIsIDIwMTkgYXQgMjoxOCBQTSBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9y
Zy5vcmc+IHdyb3RlOgo+Cj4gSGkgRGVyZWsuCj4KPiBPbiBNb24sIEp1biAxMCwgMjAxOSBhdCAw
OTowMzo0NlBNIC0wNzAwLCBEZXJlayBCYXNlaG9yZSB3cm90ZToKPiA+IFRoaXMgYWRkcyBhIGhl
bHBlciBmdW5jdGlvbiBmb3IgcmVhZGluZyB0aGUgcm90YXRpb24gKHBhbmVsCj4gPiBvcmllbnRh
dGlvbikgZnJvbSB0aGUgZGV2aWNlIHRyZWUuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogRGVyZWsg
QmFzZWhvcmUgPGRiYXNlaG9yZUBjaHJvbWl1bS5vcmc+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2dw
dS9kcm0vZHJtX3BhbmVsLmMgfCA0MSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrCj4gPiAgaW5jbHVkZS9kcm0vZHJtX3BhbmVsLmggICAgIHwgIDcgKysrKysrKwo+ID4gIDIg
ZmlsZXMgY2hhbmdlZCwgNDggaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vZHJtX3BhbmVsLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3BhbmVsLmMKPiA+
IGluZGV4IGRiZDViODczZThmMi4uM2I2ODljZTRhNTFhIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2RybV9wYW5lbC5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3BhbmVs
LmMKPiA+IEBAIC0xNzIsNiArMTcyLDQ3IEBAIHN0cnVjdCBkcm1fcGFuZWwgKm9mX2RybV9maW5k
X3BhbmVsKGNvbnN0IHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnApCj4gPiAgICAgICByZXR1cm4gRVJS
X1BUUigtRVBST0JFX0RFRkVSKTsKPiA+ICB9Cj4gPiAgRVhQT1JUX1NZTUJPTChvZl9kcm1fZmlu
ZF9wYW5lbCk7Cj4gPiArCj4gPiArLyoqCj4gPiArICogb2ZfZHJtX2dldF9wYW5lbF9vcmllbnRh
dGlvbiAtIGxvb2sgdXAgdGhlIHJvdGF0aW9uIG9mIHRoZSBwYW5lbCB1c2luZyBhCj4gPiArICog
ZGV2aWNlIHRyZWUgbm9kZQo+ID4gKyAqIEBucDogZGV2aWNlIHRyZWUgbm9kZSBvZiB0aGUgcGFu
ZWwKPiA+ICsgKiBAb3JpZW50YXRpb246IG9yaWVudGF0aW9uIGVudW0gdG8gYmUgZmlsbGVkIGlu
Cj4gVGhlIGNvbW1lbnQgc2F5cyAiZW51bSIgYnV0IHRoZSB0eXBlIHVzZWQgaXMgYW4gaW50Lgo+
IFdoeSBub3QgdXNlIGVudW0gZHJtX3BhbmVsX29yaWVudGF0aW9uPwo+CgpUaGUgYmluZGluZyBp
cyBqdXN0IGFuIGludCB2YWx1ZSwgYnV0IEkgY2FuIGNoYW5nZSBpdCB0byB0aGUgZW51bS4KCj4g
PiArICoKPiA+ICsgKiBMb29rcyB1cCB0aGUgcm90YXRpb24gb2YgYSBwYW5lbCBpbiB0aGUgZGV2
aWNlIHRyZWUuIFRoZSByb3RhdGlvbiBpbiB0aGUKPiA+ICsgKiBkZXZpY2UgdHJlZSBpcyBjb3Vu
dGVyIGNsb2Nrd2lzZS4KPiA+ICsgKgo+ID4gKyAqIFJldHVybjogMCB3aGVuIGEgdmFsaWQgcm90
YXRpb24gdmFsdWUgKDAsIDkwLCAxODAsIG9yIDI3MCkgaXMgcmVhZCBvciB0aGUKPiA+ICsgKiBy
b3RhdGlvbiBwcm9wZXJ0eSBkb2Vzbid0IGV4aXN0LiAtRUVSUk9SIG90aGVyd2lzZS4KPiA+ICsg
Ki8KPiBJbml0aWFsbHkgSSByZWFkIC1FRVJPT1IgYXMgYSBzcGVjaWZpYyBlcnJvciBjb2RlLgo+
IEJ1dCBJIGd1ZXMgdGhlIHNlbWFudGljIGlzIHRvIHNheSB0aGF0IGEgbmVnYXRpdmUgZXJyb3Ig
Y29kZSBpcyByZXR1cm5lZAo+IGlmIHNvbWV0aGluZyB3YXMgd3JvbmcuCj4gQXMgd2UgZG8gbm90
IHVzZSB0aGUgIi1FRVJST1IiIHN5bnRheCBhbnl3aGVyZSBlbHNlIGluIGRybSwgcGxlYXNlCj4g
cmV3b3JkIGxpa2Ugd2UgZG8gaW4gb3RoZXIgcGxhY2VzLgo+Cj4KPiBBbHNvIC0gaXQgaXMgd29y
dGggdG8gbWVudGlvbiB0aGF0IHRoZSByb3RhdGlvbiByZXR1cm5lZCBpcwo+IERSTV9NT0RFX1BB
TkVMX09SSUVOVEFUSU9OX1VOS05PV04gaWYgdGhlIHByb3BlcnR5IGlzIG5vdCBzcGVjaWZpZWQu
Cj4gSSB3b25kZXIgaWYgdGhpcyBpcyBjb3JyZWN0LCBhcyBubyBwcm9wZXJ0eSBjb3VsZCBhbHNv
IGJlZW4KPiBpbnRlcnByZXRhdGVkIGFzIERSTV9NT0RFX1BBTkVMX09SSUVOVEFUSU9OX05PUk1B
TC4KPiBBbmQgaW4gbW9zdCBjYXNlcyB0aGUgcm9hdGlvbiBwcm9wZXJ0eSBpcyBvcHRpb25hbCwg
c28gb25lIGNvdWxkCj4gYXNzdW1lIHRoYXQgbm8gcHJvcGVydHkgZXF1YWxzIDAgZGVncmVlLgo+
Cj4KPiAgICAgICAgIFNhbQo+Cj4gPiAraW50IG9mX2RybV9nZXRfcGFuZWxfb3JpZW50YXRpb24o
Y29uc3Qgc3RydWN0IGRldmljZV9ub2RlICpucCwgaW50ICpvcmllbnRhdGlvbikKPiA+ICt7Cj4g
PiArICAgICBpbnQgcm90YXRpb24sIHJldDsKPiA+ICsKPiA+ICsgICAgIHJldCA9IG9mX3Byb3Bl
cnR5X3JlYWRfdTMyKG5wLCAicm90YXRpb24iLCAmcm90YXRpb24pOwo+ID4gKyAgICAgaWYgKHJl
dCA9PSAtRUlOVkFMKSB7Cj4gPiArICAgICAgICAgICAgIC8qIERvbid0IHJldHVybiBhbiBlcnJv
ciBpZiB0aGVyZSdzIG5vIHJvdGF0aW9uIHByb3BlcnR5LiAqLwo+ID4gKyAgICAgICAgICAgICAq
b3JpZW50YXRpb24gPSBEUk1fTU9ERV9QQU5FTF9PUklFTlRBVElPTl9VTktOT1dOOwo+ID4gKyAg
ICAgICAgICAgICByZXR1cm4gMDsKPiA+ICsgICAgIH0KPiA+ICsKPiA+ICsgICAgIGlmIChyZXQg
PCAwKQo+ID4gKyAgICAgICAgICAgICByZXR1cm4gcmV0Owo+ID4gKwo+ID4gKyAgICAgaWYgKHJv
dGF0aW9uID09IDApCj4gPiArICAgICAgICAgICAgICpvcmllbnRhdGlvbiA9IERSTV9NT0RFX1BB
TkVMX09SSUVOVEFUSU9OX05PUk1BTDsKPiA+ICsgICAgIGVsc2UgaWYgKHJvdGF0aW9uID09IDkw
KQo+ID4gKyAgICAgICAgICAgICAqb3JpZW50YXRpb24gPSBEUk1fTU9ERV9QQU5FTF9PUklFTlRB
VElPTl9SSUdIVF9VUDsKPiA+ICsgICAgIGVsc2UgaWYgKHJvdGF0aW9uID09IDE4MCkKPiA+ICsg
ICAgICAgICAgICAgKm9yaWVudGF0aW9uID0gRFJNX01PREVfUEFORUxfT1JJRU5UQVRJT05fQk9U
VE9NX1VQOwo+ID4gKyAgICAgZWxzZSBpZiAocm90YXRpb24gPT0gMjcwKQo+ID4gKyAgICAgICAg
ICAgICAqb3JpZW50YXRpb24gPSBEUk1fTU9ERV9QQU5FTF9PUklFTlRBVElPTl9MRUZUX1VQOwo+
ID4gKyAgICAgZWxzZQo+ID4gKyAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiA+ICsKPiA+
ICsgICAgIHJldHVybiAwOwo+ID4gK30KPiA+ICtFWFBPUlRfU1lNQk9MKG9mX2RybV9nZXRfcGFu
ZWxfb3JpZW50YXRpb24pOwo+ID4gICNlbmRpZgo+ID4KPiA+ICBNT0RVTEVfQVVUSE9SKCJUaGll
cnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPiIpOwo+ID4gZGlmZiAtLWdpdCBhL2luY2x1
ZGUvZHJtL2RybV9wYW5lbC5oIGIvaW5jbHVkZS9kcm0vZHJtX3BhbmVsLmgKPiA+IGluZGV4IDhj
NzM4YzBlNmU5Zi4uMTM2MzFiMmVmYmFhIDEwMDY0NAo+ID4gLS0tIGEvaW5jbHVkZS9kcm0vZHJt
X3BhbmVsLmgKPiA+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9wYW5lbC5oCj4gPiBAQCAtMTk3LDEx
ICsxOTcsMTggQEAgaW50IGRybV9wYW5lbF9kZXRhY2goc3RydWN0IGRybV9wYW5lbCAqcGFuZWwp
Owo+ID4KPiA+ICAjaWYgZGVmaW5lZChDT05GSUdfT0YpICYmIGRlZmluZWQoQ09ORklHX0RSTV9Q
QU5FTCkKPiA+ICBzdHJ1Y3QgZHJtX3BhbmVsICpvZl9kcm1fZmluZF9wYW5lbChjb25zdCBzdHJ1
Y3QgZGV2aWNlX25vZGUgKm5wKTsKPiA+ICtpbnQgb2ZfZHJtX2dldF9wYW5lbF9vcmllbnRhdGlv
bihjb25zdCBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wLAo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGludCAqb3JpZW50YXRpb24pOwo+ID4gICNlbHNlCj4gPiAgc3RhdGljIGlubGlu
ZSBzdHJ1Y3QgZHJtX3BhbmVsICpvZl9kcm1fZmluZF9wYW5lbChjb25zdCBzdHJ1Y3QgZGV2aWNl
X25vZGUgKm5wKQo+ID4gIHsKPiA+ICAgICAgIHJldHVybiBFUlJfUFRSKC1FTk9ERVYpOwo+ID4g
IH0KPiA+ICtpbnQgb2ZfZHJtX2dldF9wYW5lbF9vcmllbnRhdGlvbihjb25zdCBzdHJ1Y3QgZGV2
aWNlX25vZGUgKm5wLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGludCAqb3Jp
ZW50YXRpb24pCj4gPiArewo+ID4gKyAgICAgcmV0dXJuIC1FTk9ERVY7Cj4gPiArfQo+ID4gICNl
bmRpZgo+ID4KPiA+ICAjZW5kaWYKPiA+IC0tCj4gPiAyLjIyLjAucmMyLjM4My5nZjRmYmJmMzBj
Mi1nb29nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
