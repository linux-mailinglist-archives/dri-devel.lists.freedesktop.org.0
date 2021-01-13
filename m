Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F33E2F4E30
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 16:11:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C10A36EA68;
	Wed, 13 Jan 2021 15:11:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27A706EA68
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 15:11:31 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id x13so2439185oic.5
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 07:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=lO2AzbCpEKRRpTFwmOyWm6jYtC5/DngHQpsrg047nro=;
 b=k/K0p56Lo0PdiqpOy3Ggtw/vwJ7icAWMqFfs3QzyzW/mXjqq6VkyS9X1+/ZrbWPZdI
 7KthX2boHklcxZeolrZZgVt5bGxWvabZ7HdmtMW8iMFwlyBT00LDj5V3AvPSMH+8WPtN
 sT6I8+TyXf89OSbCb+hIGLnsrbkcOc0497Vvc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lO2AzbCpEKRRpTFwmOyWm6jYtC5/DngHQpsrg047nro=;
 b=CdcZPwErW/BjCzaXsBGlG+dY0aePWppOrZTBEgrhOHHFFGeoZ/5L248gTTBD6WzknM
 RPDIxd0PPkxZESWfJZOdhFtVmzIwCTCyLsBlsBAka+3XVSYoZZwVB81wrid2SOtJW6um
 78ll4zMDZi4Posw1v83GND7LNIr57ZOObxWdL15LNnk4kdiPDCBgEHRsDkhi3OFp1HEO
 QWxiSTdHW7WgK/RX9IOkM/R0yhI/vUy9Wdkjv97xlsrk8mO4teOGaW9zuw1dYvGLcION
 +1rXllop7Hu3bQSLSsQ/tCYsnJmQQvqPs/OrTqxHfyY/BHW91LWV9GTTpS5Z54StTGfq
 haPw==
X-Gm-Message-State: AOAM532Sr5Lx9AngiKATFS7vE4le1Hv5hC0g8z9YP61ronhToWdSHLqo
 EgFO9EAHw5MJM8D1KwXngMlK2wx731nr5PN4+sDD+EAm6X+M2g==
X-Google-Smtp-Source: ABdhPJzANqoZJwFEAS7Y7bA893zkj1dShiWSUcwYfUh0cLMZy/AwBLC+4L2lIbGbeDDtDDr9JdAyPgWEj2hVzD/3HsU=
X-Received: by 2002:aca:4e11:: with SMTP id c17mr1416158oib.14.1610550690531; 
 Wed, 13 Jan 2021 07:11:30 -0800 (PST)
MIME-Version: 1.0
References: <20210113131325.223511-1-christian.koenig@amd.com>
 <X/71UyN5bxZCr3pe@phenom.ffwll.local>
 <3e340506-79a6-1fb0-0632-aa2d4a0cc223@gmail.com>
In-Reply-To: <3e340506-79a6-1fb0-0632-aa2d4a0cc223@gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 13 Jan 2021 16:11:19 +0100
Message-ID: <CAKMK7uG9TqgX_LJXwZRymaTF1t2WJg-DE85zGwb-0yd=orsooA@mail.gmail.com>
Subject: Re: [PATCH] drm/ttm: stop using GFP_TRANSHUGE_LIGHT
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Hans de Goede <hdegoede@redhat.com>, Huang Rui <ray.huang@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKYW4gMTMsIDIwMjEgYXQgMzo0NiBQTSBDaHJpc3RpYW4gS8O2bmlnCjxja29lbmln
LmxlaWNodHp1bWVya2VuQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBBbSAxMy4wMS4yMSB1bSAxNDoy
NyBzY2hyaWViIERhbmllbCBWZXR0ZXI6Cj4gPiBPbiBXZWQsIEphbiAxMywgMjAyMSBhdCAwMjox
MzoyNVBNICswMTAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+ID4+IFRoZSBvbmx5IGZsYWcg
d2UgcmVhbGx5IG5lZWQgaXMgX19HRlBfTk9NRU1BTExPQywgaGlnaG1lbSBkZXBlbmRzIG9uCj4g
Pj4gZG1hMzIgYW5kIG1vdmVhYmxlL2NvbXBvdW5kIHNob3VsZCBuZXZlciBiZSBzZXQgaW4gdGhl
IGZpcnN0IHBsYWNlLgo+ID4+Cj4gPj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8
Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+ID4gTmVlZHMgRml4ZXM6IGxpbmUgYW5kIFJlZmVy
ZW5jZXMgdG8gdGhlIEdGUF9UUkFOU0hVR0VfTElHSFQgcmVwb3J0IGZyb20KPiA+IEhhbnMgYW5k
IGZvciB0aGUgY2hyb21pdW0gcmVwb3J0IGZvciB0aGUgbW1hcCBmYWlsLgo+Cj4gV2hpY2ggdGFn
IHNob3VsZCBJIHVzZSBmb3IgdGhpcz8gSnVzdCBMaW5rOj8KCkxpbms6IGlzIGZvciB0aGUgcGF0
Y2ggc3VibWlzc2lvbiBpdHNlbGYgKHRvIGxpbmsgdG8gYXJjaGl2ZXMgd2l0aCB0aGUKcmV2aWV3
JmRpc2N1c3Npb25zKSwgdXN1YWxseSBpdCdzIFJlZmVyZW5jZXMgaXMgZm9yIGJ1ZyByZXBvcnRz
IGFuZAphbnl0aGluZyBlbHNlLiBJIHRoaW5rIGF0IGxlYXN0LiBZb3UgY2FuIGhhdmUgbXVsdGlw
bGUgTGluazogdGFncyB0b28sCmlmIHlvdSByZWNvcmQgYWxsIHRoZSBwcmV2aW91cyBzdWJtaXNz
aW9ucywgdGhhdCdzIGEgYml0IHVwIHRvCnN1YnN5c3RlbXMgYW5kIGhvdyB0aGV5IGFsbCByb2xs
LgotRGFuaWVsCgoKPiA+ICAgV2l0aCB0aG9zZToKPiA+Cj4gPiBSZXZpZXdlZC1ieTogRGFuaWVs
IFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KPiA+Cj4gPiBBbHNvIEkgZ3Vlc3MgcmVh
bGx5IHRpbWUgZm9yIG1lIHRvIHN0aXRjaCB0b2dldGhlciB0aGF0IGhhY2sgdG8gY2F0Y2gKPiA+
IGRtYS1idWYgc2dsaXN0IHN0cnVjdCBwYWdlIGFidXNlcnMgLi4uCj4KPiBPaCwgeWVzIHBsZWFz
ZS4KPgo+IENocmlzdGlhbi4KPgo+ID4gLURhbmllbAo+ID4KPiA+PiAtLS0KPiA+PiAgIGRyaXZl
cnMvZ3B1L2RybS90dG0vdHRtX3Bvb2wuYyB8IDExICsrKysrKy0tLS0tCj4gPj4gICAxIGZpbGUg
Y2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+ID4+Cj4gPj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3Bvb2wuYyBiL2RyaXZlcnMvZ3B1L2RybS90
dG0vdHRtX3Bvb2wuYwo+ID4+IGluZGV4IDhjZDc3NmFkYzU5Mi4uMTFlMDMxM2RiMGVhIDEwMDY0
NAo+ID4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3Bvb2wuYwo+ID4+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS90dG0vdHRtX3Bvb2wuYwo+ID4+IEBAIC03OSwxMiArNzksMTMgQEAgc3Rh
dGljIHN0cnVjdCBwYWdlICp0dG1fcG9vbF9hbGxvY19wYWdlKHN0cnVjdCB0dG1fcG9vbCAqcG9v
bCwgZ2ZwX3QgZ2ZwX2ZsYWdzLAo+ID4+ICAgICAgc3RydWN0IHBhZ2UgKnA7Cj4gPj4gICAgICB2
b2lkICp2YWRkcjsKPiA+Pgo+ID4+IC0gICAgaWYgKG9yZGVyKSB7Cj4gPj4gLSAgICAgICAgICAg
IGdmcF9mbGFncyB8PSBHRlBfVFJBTlNIVUdFX0xJR0hUIHwgX19HRlBfTk9SRVRSWSB8Cj4gPj4g
KyAgICAvKiBEb24ndCBzZXQgdGhlIF9fR0ZQX0NPTVAgZmxhZyBmb3IgaGlnaGVyIG9yZGVyIGFs
bG9jYXRpb25zLgo+ID4+ICsgICAgICogTWFwcGluZyBwYWdlcyBkaXJlY3RseSBpbnRvIGFuIHVz
ZXJzcGFjZSBwcm9jZXNzIGFuZCBjYWxsaW5nCj4gPj4gKyAgICAgKiBwdXRfcGFnZSgpIG9uIGEg
VFRNIGFsbG9jYXRlZCBwYWdlIGlzIGlsbGVnYWwuCj4gPj4gKyAgICAgKi8KPiA+PiArICAgIGlm
IChvcmRlcikKPiA+PiArICAgICAgICAgICAgZ2ZwX2ZsYWdzIHw9IF9fR0ZQX05PTUVNQUxMT0Mg
fCBfX0dGUF9OT1JFVFJZIHwKPiA+PiAgICAgICAgICAgICAgICAgICAgICBfX0dGUF9LU1dBUERf
UkVDTEFJTTsKPiA+PiAtICAgICAgICAgICAgZ2ZwX2ZsYWdzICY9IH5fX0dGUF9NT1ZBQkxFOwo+
ID4+IC0gICAgICAgICAgICBnZnBfZmxhZ3MgJj0gfl9fR0ZQX0NPTVA7Cj4gPj4gLSAgICB9Cj4g
Pj4KPiA+PiAgICAgIGlmICghcG9vbC0+dXNlX2RtYV9hbGxvYykgewo+ID4+ICAgICAgICAgICAg
ICBwID0gYWxsb2NfcGFnZXMoZ2ZwX2ZsYWdzLCBvcmRlcik7Cj4gPj4gLS0KPiA+PiAyLjI1LjEK
PiA+Pgo+CgoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBv
cmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
