Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98AC6FE127
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2019 16:26:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D171C6E84B;
	Fri, 15 Nov 2019 15:26:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F8026E84B
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2019 15:26:26 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id n16so8942176oig.2
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2019 07:26:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rLv3ZX1dMeDKfstRqN3IcNtT0reDHnITnCMujRCJf3c=;
 b=mfjDBbXDDq2ZUcMugEnH0dR//+zBgoGT70FvJSnMrD+xBGvYykPi2uB7nIe0HJ3iHF
 FtB2BYVyFk5tHVpV3mFXqPwy1286QJb6KilWc2dOdto4oBbfyfwwp04eRuU6bYlZm5XR
 vfVfVXrlKwuQBhC0J8EZ0LQ+u88uOBYwd5aiL1N46et4YcfRDsRIXzEaGkmHNWbWfguX
 +TFJkZbNXBrOBJhHMeQ4TRTv70xedO+BzvYoPpXfaNhDt1ukFEpUBqAJmAEPuoF8wVMf
 3frVqaJ7lZlS+k6wzzBZK56JPKM3Xlf56JqprYWiDfZ6gVbE+Zvnfdnn22Iwuustt0lP
 2mVQ==
X-Gm-Message-State: APjAAAWTOKZa4wreekhiU5qAFpOp/kyBGX88cYHRNYC3el51VqTjhQ1z
 CnioFZRk5a11Wrn+xKbSPzAt4ElRvJcI5QkkMDpFIA==
X-Google-Smtp-Source: APXvYqyL2gXtS4ehQnOC/zaXVlukAdUlpmAMoPZcEPSFioXQDYXQwVoe0ijohRvjMh2jIbKCSu41q88yPhMti63Xsow=
X-Received: by 2002:aca:3889:: with SMTP id f131mr8410164oia.14.1573831585500; 
 Fri, 15 Nov 2019 07:26:25 -0800 (PST)
MIME-Version: 1.0
References: <20191115092120.4445-1-daniel.vetter@ffwll.ch>
 <20191115092120.4445-2-daniel.vetter@ffwll.ch>
 <20191115124411.GC1208@intel.com>
In-Reply-To: <20191115124411.GC1208@intel.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Fri, 15 Nov 2019 16:26:13 +0100
Message-ID: <CAKMK7uEj++XE-s+UeDiv5dzRoD-uA0+xEW0_LE073uT4BxNeZw@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 1/8] drm/fb: More paranoia in addfb checks
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rLv3ZX1dMeDKfstRqN3IcNtT0reDHnITnCMujRCJf3c=;
 b=jmkceq2soRaKM1YI5rWgf9ePnmPElaRGExtGUTMSrqTa1z9VBS4eKRVZgq10dFjhYl
 6mRljp4MOJuyzeJ5CMnnDbTJJXan8lJpI83ZlmY5yWhSmxxQnuuvxmWVpWVdtD5XzRQM
 NpFgQaSPWRrdu6gem86S+zpIuS2861/Q7MIII=
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Pekka Paalanen <pekka.paalanen@collabora.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMTUsIDIwMTkgYXQgMTo0NCBQTSBWaWxsZSBTeXJqw6Rsw6QKPHZpbGxlLnN5
cmphbGFAbGludXguaW50ZWwuY29tPiB3cm90ZToKPgo+IE9uIEZyaSwgTm92IDE1LCAyMDE5IGF0
IDEwOjIxOjEzQU0gKzAxMDAsIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gPiAtIE91ciBsaW1pdCBp
cyB1aW50MzJfdCwgbWFrZSB0aGF0IGV4cGxpY2l0Lgo+ID4KPiA+IC0gVW50YW5nbGUgdGhlIG9u
ZSBvdmVyZmxvdyBjaGVjaywgSSB0aGluayAoYnV0IG5vdCBzdXJlKSB0aGF0IHdpdGgKPiA+ICAg
YWxsIHRocmVlIHRvZ2V0aGVyIHlvdSBjb3VsZCBvdmVyZmxvdyB0aGUgdWludDY0X3QgYW5kIGl0
J2QgbG9vawo+ID4gICBjb29sIGFnYWluLgo+Cj4gSXQgY2FuJ3Qgb3ZlcmZsb3cuIEFsbCB0aGVy
ZWUgaW5wdXRzIGFyZSB1MzIgc28gdGhlIG1heCB2YWx1ZQo+IHlvdSBjYW4gZ2V0IGlzIDB4ZmZm
ZmZmZmYwMDAwMDAwMC4KCkhtIHJpZ2h0LCBJIGp1c3QgY2hlY2tlZCwgSSBndWVzcyBJIHNob3Vs
ZCBoYXZlIGJlZm9yZWhhbmQuCgo+ID4gSGVuY2UgdHdvIHN0ZXBzLiBBbHNvIGdvIHdpdGggdGhl
IG1vcmUgY29tbW9uIChhbmQgaW1vCj4gPiAgIHNhZmVyIGFwcHJvYWNoKQo+Cj4gQWxzbyByZXN1
bHRzIGluIG11bHRpcGxlIGRpdmlzaW9ucyB3aGljaCBpcyBuZWVkbGVzc2x5IGV4cGVuc2l2ZS4K
PiBUaGUgb3JpZ2luYWwgaXMganVzdCBtdWwrYWRkLgo+Cj4gPiBvZiByZWR1Y2luZyB0aGUgcmFu
Z2Ugd2UgYWNjZXB0LCBpbnN0ZWFkIG9mIHRyeWluZwo+ID4gICB0byBjb21wdXRlIHRoZSBvdmVy
ZmxvdyBpbiBoaWdoIGVub3VnaCBwcmVjaXNpb24uCj4gPgo+ID4gLSBUaGUgYWJvdmUgd291bGQg
YmxvdyB1cCBpZiB3ZSBnZXQgYSAwIHBpdGNoZXMsIHNvIGNoZWNrIGZvciB0aGF0Cj4gPiAgIHRv
bywgYnV0IG9ubHkgaWYgYmxvY2tfc2l6ZSBpcyBhIHRoaW5nLgo+ID4KPiA+IENjOiBQZWtrYSBQ
YWFsYW5lbiA8cGVra2EucGFhbGFuZW5AY29sbGFib3JhLmNvLnVrPgo+ID4gU2lnbmVkLW9mZi1i
eTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+Cj4gPiAtLS0KPiA+ICBk
cml2ZXJzL2dwdS9kcm0vZHJtX2ZyYW1lYnVmZmVyLmMgfCAxNyArKysrKysrKysrKy0tLS0tLQo+
ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+ID4K
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZyYW1lYnVmZmVyLmMgYi9kcml2
ZXJzL2dwdS9kcm0vZHJtX2ZyYW1lYnVmZmVyLmMKPiA+IGluZGV4IDU3NTY0MzE4Y2VlYS4uMzE0
MWM2ZWQ2ZGQyIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9mcmFtZWJ1ZmZl
ci5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZyYW1lYnVmZmVyLmMKPiA+IEBAIC0y
MTQsMTUgKzIxNCwyMCBAQCBzdGF0aWMgaW50IGZyYW1lYnVmZmVyX2NoZWNrKHN0cnVjdCBkcm1f
ZGV2aWNlICpkZXYsCj4gPiAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4g
PiAgICAgICAgICAgICAgIH0KPiA+Cj4gPiAtICAgICAgICAgICAgIGlmIChtaW5fcGl0Y2ggPiBV
SU5UX01BWCkKPiA+ICsgICAgICAgICAgICAgaWYgKG1pbl9waXRjaCA+IFU4X01BWCkKPgo+IFU4
PwoKT2ggZGVhciwgc29tZSBwYXRjaCBlZGl0aW5nIGdvbmUgcmVhbGx5IHdyb25nLiBJIHRoaW5r
IEknbGwgZHJvcCB0aGlzCm9uZSBoZXJlLCBub3QgZG9pbmcgYW55IGdvb2QgOi0pCi1EYW5pZWwK
Cj4KPiA+ICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVSQU5HRTsKPiA+Cj4gPiAtICAg
ICAgICAgICAgIGlmICgodWludDY0X3QpIGhlaWdodCAqIHItPnBpdGNoZXNbaV0gKyByLT5vZmZz
ZXRzW2ldID4gVUlOVF9NQVgpCj4gPiAtICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FUkFO
R0U7Cj4gPiArICAgICAgICAgICAgIGlmIChibG9ja19zaXplKSB7Cj4gPiArICAgICAgICAgICAg
ICAgICAgICAgaWYgKHItPnBpdGNoZXNbaV0gPCBtaW5fcGl0Y2gpIHsKPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIERSTV9ERUJVR19LTVMoImJhZCBwaXRjaCAldSBmb3IgcGxhbmUg
JWRcbiIsIHItPnBpdGNoZXNbaV0sIGkpOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgcmV0dXJuIC1FSU5WQUw7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgfQo+ID4KPiA+IC0g
ICAgICAgICAgICAgaWYgKGJsb2NrX3NpemUgJiYgci0+cGl0Y2hlc1tpXSA8IG1pbl9waXRjaCkg
ewo+ID4gLSAgICAgICAgICAgICAgICAgICAgIERSTV9ERUJVR19LTVMoImJhZCBwaXRjaCAldSBm
b3IgcGxhbmUgJWRcbiIsIHItPnBpdGNoZXNbaV0sIGkpOwo+ID4gLSAgICAgICAgICAgICAgICAg
ICAgIHJldHVybiAtRUlOVkFMOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGlmIChoZWlnaHQg
PiBVOF9NQVggLyByLT5waXRjaGVzW2ldKQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgcmV0dXJuIC1FUkFOR0U7Cj4gPiArCj4gPiArICAgICAgICAgICAgICAgICAgICAgaWYgKHIt
Pm9mZnNldHNbaV0gPiBVOF9NQVggLyByLT5waXRjaGVzW2ldIC0gaGVpZ2h0KQo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FUkFOR0U7Cj4gPiAgICAgICAgICAgICAg
IH0KPiA+Cj4gPiAgICAgICAgICAgICAgIGlmIChyLT5tb2RpZmllcltpXSAmJiAhKHItPmZsYWdz
ICYgRFJNX01PREVfRkJfTU9ESUZJRVJTKSkgewo+ID4gLS0KPiA+IDIuMjQuMAo+ID4KPiA+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiBJbnRlbC1n
ZnggbWFpbGluZyBsaXN0Cj4gPiBJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPiBo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdmeAo+
Cj4gLS0KPiBWaWxsZSBTeXJqw6Rsw6QKPiBJbnRlbAoKCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0
d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KKzQxICgwKSA3OSAzNjUgNTcgNDggLSBo
dHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
