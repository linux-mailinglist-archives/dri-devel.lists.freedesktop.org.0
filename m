Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD78F12D15
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 14:02:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE06589D5C;
	Fri,  3 May 2019 12:02:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-it1-x143.google.com (mail-it1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C5F889D5C
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 12:02:06 +0000 (UTC)
Received: by mail-it1-x143.google.com with SMTP id l140so8623746itb.0
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2019 05:02:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DJNh+GwLIqCtJ1NfTMyC3LYQdQLouQ7DiN4x1pur5dY=;
 b=bpCXXX1EOzUcPGCHqZ1fxBlsVoeUO3iT4TB2glugzrqvVL59hZC5gSBgYOVydaoI3k
 FCa887AsZvyv+sGSP5Ke/v9CnYk+CaBxGycyHn10epwZK/mV17Q0KdqtGfKWPsgGmeZt
 zLZMqXqqaevi411XbzWa3NmWBRcWtS6O7bvXHrRMXID0YPHR2xaXJgRJX4T9p6al4QIw
 xYFqDFscFTL/TG5VHx1WeC84fUWmshvRstx/KbBrOLwRKsCbC/fd/7b3JB1C2H/ZpAoq
 1eGl8Fquw1K1ICnHLqbWMlL8L0jy3sKBJeMLkl2PU2h5qLlOkve/2SXiRM2tyRtTjjEY
 KHKQ==
X-Gm-Message-State: APjAAAUbGQrGcU9AjpXBK1DyYP0pv5HlWaYKgFTZDHmZqFEw7eCTzoYM
 ziQGHgmzDt0WnNtsHTVxQSv8EPJl/bQHHm1wxVkvHQ==
X-Google-Smtp-Source: APXvYqwSl5gjr0r+E+qmVRmd7wSFQnGGCffNSq8aTfS2bKxuN9AQoUqicj4scVEE6ZhnKIAutC+WhpkWOt0XzvLdXlM=
X-Received: by 2002:a02:ca4a:: with SMTP id i10mr6730272jal.70.1556884925495; 
 Fri, 03 May 2019 05:02:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190429144341.12615-1-tzimmermann@suse.de>
 <20190429144341.12615-2-tzimmermann@suse.de>
 <20190429195855.GA6610@ravnborg.org>
 <1d14ef87-e1cd-4f4a-3632-bc045a1981c6@suse.de>
 <20190430092327.GA13757@ravnborg.org>
 <6e07e6c9-2ce7-c39f-8d55-46e811c61510@amd.com>
 <a2398439-3bb5-d1ef-db94-82f252f461c2@suse.de>
In-Reply-To: <a2398439-3bb5-d1ef-db94-82f252f461c2@suse.de>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 3 May 2019 14:01:53 +0200
Message-ID: <CAKMK7uGnUeeK-UPHZC+P5TsQTaOWPQd=LLV_Rr+VvPgNEEHhyg@mail.gmail.com>
Subject: Re: [PATCH v3 01/19] drm: Add |struct drm_gem_vram_object| and helpers
To: Thomas Zimmermann <tzimmermann@suse.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DJNh+GwLIqCtJ1NfTMyC3LYQdQLouQ7DiN4x1pur5dY=;
 b=gnunSpsxHUNUcVa/R+Jcc39ZB5vU7NqNJugVIG73+uVjR6O0udTtpj+mlL2uUxfDVj
 3pLVbY2Zgldg3BepdeNrcbSrS+iTPbSMZySRyz4bWDMybciblXaoVs2y/qoeV4LrMXtK
 Y9eFxdb96JGLoDCVSpuHGz2IBADSWfHaNMBIQ=
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
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "puck.chen@hisilicon.com" <puck.chen@hisilicon.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "z.liuxinliang@hisilicon.com" <z.liuxinliang@hisilicon.com>,
 "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "kong.kongxinwei@hisilicon.com" <kong.kongxinwei@hisilicon.com>, "Huang,
 Ray" <Ray.Huang@amd.com>, "kraxel@redhat.com" <kraxel@redhat.com>,
 "zourongrong@gmail.com" <zourongrong@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMywgMjAxOSBhdCAxMjoxNSBQTSBUaG9tYXMgWmltbWVybWFubiA8dHppbW1l
cm1hbm5Ac3VzZS5kZT4gd3JvdGU6Cj4KPiBIaSBDaHJpc3RpYW4sCj4KPiB3b3VsZCB5b3UgcmV2
aWV3IHRoZSB3aG9sZSBwYXRjaCBzZXQ/IERhbmllbCBtZW50aW9uZWQgdGhhdCBoZSdkIHByZWZl
cgo+IHRvIGxlYXZlIHRoZSByZXZpZXcgdG8gbWVtb3J5LW1nbXQgZGV2ZWxvcGVycy4KCkkgdGhp
bmsgTm9yYWxmIFRyb25uZXMgb3IgR2VyZCBIb2ZmbWFubiB3b3VsZCBhbHNvIG1ha2UgZ29vZCBy
ZXZpZXdlcnMKZm9yIHRoaXMsIGZhaXJseSBjbG9zZSB0byB3aGF0IHRoZXkndmUgYmVlbiB3b3Jr
aW5nIG9uIGluIHRoZSBwYXN0LgotRGFuaWVsCgo+Cj4gQmVzdCByZWdhcmRzCj4gVGhvbWFzCj4K
PiBBbSAzMC4wNC4xOSB1bSAxMTozNSBzY2hyaWViIEtvZW5pZywgQ2hyaXN0aWFuOgo+ID4gQW0g
MzAuMDQuMTkgdW0gMTE6MjMgc2NocmllYiBTYW0gUmF2bmJvcmc6Cj4gPj4gW0NBVVRJT046IEV4
dGVybmFsIEVtYWlsXQo+ID4+Cj4gPj4gSGkgVGhvbWFzLgo+ID4+Cj4gPj4+Pj4gKwo+ID4+Pj4+
ICsvKioKPiA+Pj4+PiArICogUmV0dXJucyB0aGUgY29udGFpbmVyIG9mIHR5cGUgJnN0cnVjdCBk
cm1fZ2VtX3ZyYW1fb2JqZWN0Cj4gPj4+Pj4gKyAqIGZvciBmaWVsZCBiby4KPiA+Pj4+PiArICog
QGJvOiAgICAgICAgICAgdGhlIFZSQU0gYnVmZmVyIG9iamVjdAo+ID4+Pj4+ICsgKiBSZXR1cm5z
OiAgICAgICBUaGUgY29udGFpbmluZyBHRU0gVlJBTSBvYmplY3QKPiA+Pj4+PiArICovCj4gPj4+
Pj4gK3N0YXRpYyBpbmxpbmUgc3RydWN0IGRybV9nZW1fdnJhbV9vYmplY3QqIGRybV9nZW1fdnJh
bV9vZl9ibygKPiA+Pj4+PiArICBzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvKQo+ID4+Pj4+
ICt7Cj4gPj4+Pj4gKyAgcmV0dXJuIGNvbnRhaW5lcl9vZihibywgc3RydWN0IGRybV9nZW1fdnJh
bV9vYmplY3QsIGJvKTsKPiA+Pj4+PiArfQo+ID4+Pj4gSW5kZW50IGZ1bm55LiBVU2Ugc2FtZSBp
bmRlbnQgYXMgdXNlZCBpbiBvdGhlciBwYXJ0cyBvZiBmaWxlIGZvcgo+ID4+Pj4gZnVuY3Rpb24g
YXJndW1lbnRzLgo+ID4+PiBJZiBJIHB1dCB0aGUgYXJndW1lbnQgbmV4dCB0byB0aGUgZnVuY3Rp
b24ncyBuYW1lLCBpdCB3aWxsIGV4Y2VlZCB0aGUKPiA+Pj4gODAtY2hhcmFjdGVyIGxpbWl0LiBG
cm9tIHRoZSBjb2Rpbmctc3R5bGUgZG9jdW1lbnQsIEkgY291bGQgbm90IHNlZSB3aGF0Cj4gPj4+
IHRvIGRvIGluIHRoaXMgY2FzZS4gT25lIHNvbHV0aW9uIHdvdWxkIG1vdmUgdGhlIHJldHVybiB0
eXBlIHRvIGEKPiA+Pj4gc2VwYXJhdGUgbGluZSBiZWZvcmUgdGhlIGZ1bmN0aW9uIG5hbWUuIEkn
dmUgbm90IHNlZW4gdGhhdCBhbnl3aGVyZSBpbgo+ID4+PiB0aGUgc291cmNlIGNvZGUsIHNvIG1v
dmluZyB0aGUgYXJndW1lbnQgb250byBhIHNlcGFyYXRlIGxpbmUgYW5kCj4gPj4+IGluZGVudGlu
ZyBieSBvbmUgdGFiIGFwcGVhcnMgdG8gYmUgdGhlIG5leHQgYmVzdCBzb2x1dGlvbi4gUGxlYXNl
IGxldCBtZQo+ID4+PiBrbm93IGlmIHRoZXJlJ3MgaWYgdGhlcmUncyBhIHByZWZlcnJlZCBzdHls
ZSBmb3IgY2FzZXMgbGlrZSB0aGlzIG9uZS4KPiA+PiBSZWFkYWJpbGl0eSBoYXMgSU1PIGhpZ2hl
ciBwcmlvcml0eSB0aGFuIHNvbWUgbGltaXQgb2YgODAgY2hhcnMuCj4gPj4gQW5kIGl0IGh1cnRz
IHJlYWRhYmlsaXR5IChhdCBsZWFzdCBteSBPQ0QpIHdoZW4gc3R5bGUgY2hhbmdlcwo+ID4+IGFz
IHlvdSBkbyB3aXRoIGluZGVudCBoZXJlLiBTbyBteSBwZXJzb25hbCBwcmVmZXJlbmNlIGlzIHRv
IGZpeAo+ID4+IGluZGVudCBhbmQgYWNjZWN0IGxvbmdlciBsaW5lcy4KPiA+Cj4gPiBJbiB0aGlz
IGNhc2UgdGhlIGFuIG9mdGVuIHVzZWQgY29udmVudGlvbiAod2hpY2ggaXMgYWxzbyBraW5kIG9m
Cj4gPiByZWFkYWJsZSkgaXMgdG8gYWRkIGEgbmV3bGluZSBhZnRlciB0aGUgcmV0dXJuIHZhbHVl
cywgYnV0IGJlZm9yZSB0aGUKPiA+IGZ1bmN0aW9uIG5hbWUuIEUuZy4gc29tZXRoaW5nIGxpa2Ug
dGhpczoKPiA+Cj4gPiBzdGF0aWMgaW5saW5lIHN0cnVjdCBkcm1fZ2VtX3ZyYW1fb2JqZWN0Kgo+
ID4gZHJtX2dlbV92cmFtX29mX2JvKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8pCj4gPgo+
ID4gUmVnYXJkcywKPiA+IENocmlzdGlhbi4KPiA+Cj4gPj4KPiA+PiBCdXQgeW91IGFzayBmb3Ig
YSBwcmVmZXJyZWQgc3R5bGUgLSB3aGljaCBJIGRvIG5vdCB0aGluayB3ZSBoYXZlIGluIHRoaXMK
PiA+PiBjYXNlLiBTbyBpdCBib2lscyBkb3duIHRvIHdoYXQgeW91IHByZWZlci4KPiA+Pgo+ID4+
IEVub3VnaCBiaWtlc2hlZGRpbmcsIHRoYW5rcyBmb3IgdGhlIHF1aWNrIHJlc3BvbnNlLgo+ID4+
Cj4gPj4gICAgICAgICAgU2FtCj4gPgo+Cj4gLS0KPiBUaG9tYXMgWmltbWVybWFubgo+IEdyYXBo
aWNzIERyaXZlciBEZXZlbG9wZXIKPiBTVVNFIExpbnV4IEdtYkgsIE1heGZlbGRzdHJhc3NlIDUs
IDkwNDA5IE51ZXJuYmVyZywgR2VybWFueQo+IEdGOiBGZWxpeCBJbWVuZMO2cmZmZXIsIE1hcnkg
SGlnZ2lucywgU3JpIFJhc2lhaAo+IEhSQiAyMTI4NCAoQUcgTsO8cm5iZXJnKQo+Cj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFp
bGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCgoKCi0tIApEYW5p
ZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgorNDEgKDApIDc5
IDM2NSA1NyA0OCAtIGh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
