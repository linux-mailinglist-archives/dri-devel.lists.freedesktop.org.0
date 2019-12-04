Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9AE51126BD
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 10:14:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 302466FB2D;
	Wed,  4 Dec 2019 09:14:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 826BC6FB21
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 09:14:23 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id j22so6182142oij.9
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Dec 2019 01:14:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fHOz5TSfapouz39S9hNND+9izstZdc+LQSoTcSIWxK8=;
 b=hY5h7PNVf9Mq9ls+B9Jer+HJ7UyGKjFz5n+yv/6QsdVFkUYjl1wrUcLbKCM85jjnVL
 xbik0USxOCAnFuWjO/ZYGcqmHAjdbEyM8OpA1aPh0RzgJ0InQD7ikSrr5mIlHZb7H2n0
 WlFJffdRmTXKzsqoQyOZ6GrPyH35ZKJq+US8b7qSqADZ5fmEVgD2OAwOir7xVaWAz7LV
 Iq3hP6vEw/Bbygwws/H2pWiVnOFndb+PwWwUQhg1aymJcKoRcyVy1WEJlWAJEdL3LPMC
 czf31cxoNW/0qnO9rTvBIRfcjfKIN5xJshHpYpHR5ZQU6m4KoRO2cj1fWJPJyA0qXP6Z
 FdIw==
X-Gm-Message-State: APjAAAW7RsUJPH7Czk+iIQ2cBueP8+kVDTL18Vbj+RENXamb+cK7ZKo9
 b7rU9PQmIIkptvfysexws6sK7cL04vaBCUEVbH6NGQ==
X-Google-Smtp-Source: APXvYqxED3cXAWzvduv5YQydTNk9iDVpoWk3eogUk4PnHpzzsb1FJpDybbJYpBt67pBhc/M3YI+bThDHBe85iN4012k=
X-Received: by 2002:aca:2812:: with SMTP id 18mr1728570oix.14.1575450862572;
 Wed, 04 Dec 2019 01:14:22 -0800 (PST)
MIME-Version: 1.0
References: <20191010204823.195540-1-sean@poorly.run>
 <242462f0-ac8d-ab8a-e567-74678da3f68f@suse.de>
 <20191015191156.GW85762@art_vandelay> <20191015200233.GK1208@intel.com>
 <CAKMK7uE_DiXH_Gz6JBObv_Fs7cUhkH1wTVw4LDx2GZVueqYAPA@mail.gmail.com>
 <20191016160557.73b634c9@eldfell.localdomain>
 <d6b47400-c254-4f6b-5fac-59693571dee0@suse.de>
 <20191017102216.20f98533@eldfell.localdomain>
 <20191203191054.GA162979@art_vandelay>
 <CAKMK7uF4F7WTHTvWmdrM+BBaPbvFtwVG0G7rSLx97NH5aEq+2w@mail.gmail.com>
 <20191204093326.57404495@eldfell.localdomain>
In-Reply-To: <20191204093326.57404495@eldfell.localdomain>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 4 Dec 2019 10:14:11 +0100
Message-ID: <CAKMK7uEUQu_M5fqoaiKdVKtdxoDZv49qgNB=w6+uvZL1bK0OwA@mail.gmail.com>
Subject: Re: [PATCH] drm: Funnel drm logs to tracepoints
To: Pekka Paalanen <ppaalanen@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=fHOz5TSfapouz39S9hNND+9izstZdc+LQSoTcSIWxK8=;
 b=MJ/m44d+AHBdbYE/bsUkgy951Be/QzXKEbYcjYf7RskfR4B4VZldUowxAj228Xpi/G
 LdvG0Y7i+DkLd5MI5z9nnPJo/HEkD8wD/DAq9w2yz+kDPLGjg9rbiUXshFaQcl28QBck
 aZIdWZGXTZ43mm3vmOaP52YKVNxY3uLicdFZ4=
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
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <seanpaul@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBEZWMgNCwgMjAxOSBhdCA4OjMzIEFNIFBla2thIFBhYWxhbmVuIDxwcGFhbGFuZW5A
Z21haWwuY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwgMyBEZWMgMjAxOSAyMjoyMDoxNCArMDEwMAo+
IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+IHdyb3RlOgo+Cj4gPiBPbiBU
dWUsIERlYyAzLCAyMDE5IGF0IDg6MTAgUE0gU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+IHdy
b3RlOgo+ID4gPgo+ID4gPiBPbiBUaHUsIE9jdCAxNywgMjAxOSBhdCAxMDoyMjoxNkFNICswMzAw
LCBQZWtrYSBQYWFsYW5lbiB3cm90ZToKPiA+ID4gPiBPbiBXZWQsIDE2IE9jdCAyMDE5IDE1OjIz
OjQ1ICswMjAwCj4gPiA+ID4gVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+
IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gPiBIaQo+ID4gPiA+ID4KPiA+ID4gPiA+IEFtIDE2LjEw
LjE5IHVtIDE1OjA1IHNjaHJpZWIgUGVra2EgUGFhbGFuZW46Cj4gPiA+ID4KPiA+ID4gPiA+ID4g
c3BlY2lmaWNhbGx5IGJlIGF2YWlsYWJsZSBpbiBwcm9kdWN0aW9uLiBTbyBhIG5ldyBmaWxlIGlu
IHNvbWUgZnMKPiA+ID4gPiA+ID4gc29tZXdoZXJlIGl0IHNob3VsZCBiZSwgYW5kIHVzZXJzcGFj
ZSBpbiBwcm9kdWN0aW9uIGNhbiByZWFkIGl0IGF0IHdpbGwKPiA+ID4gPiA+ID4gdG8gYXR0YWNo
IHRvIGEgYnVnIHJlcG9ydC4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gVGhvc2Ugc2VtYW50aWNz
LCAib25seSB1c2UgdGhpcyBjb250ZW50IGZvciBhdHRhY2hpbmcgaW50byBhIGJ1Zwo+ID4gPiA+
ID4gPiByZXBvcnQiIHNob3VsZCBiZSBtYWRlIHZlcnkgY2xlYXIgaW4gdGhlIFVBUEkuCj4gPiA+
ID4gPgo+ID4gPiA+ID4gSGFzIHRoaXMgZXZlciB3b3JrZWQ/IEFzIHNvb24gYXMgYSB1c2Vyc3Bh
Y2UgcHJvZ3JhbSBzdGFydHMgZGVwZW5kaW5nIG9uCj4gPiA+ID4gPiB0aGUgY29udGVudCBvZiB0
aGlzIGZpbGUsIGl0IGJlY29tZXMga2FiaS4gRnJvbSB0aGUgaW5jaWRlbnRzIEkga25vdywKPiA+
ID4gPiA+IExpbnVzIGhhcyBhbHdheXMgYmVlbiBxdWl0ZSBzdHJpY3QgYWJvdXQgdGhpcy4gRXZl
biBmb3IgYnJva2VuIGludGVyZmFjZXMuCj4gPiA+ID4KPiA+ID4gPiBUaGUga2VybmVsIGxvZyBj
b250ZW50IGlzIG5vdCBrYWJpLCBpcyBpdD8gSSd2ZSBzZWVuIGl0IGNoYW5nZSBwbGVudHkKPiA+
ID4gPiBkdXJpbmcgdGhlIHllYXJzLiBUaGlzIHdvdWxkIGJlIGp1c3QgYW5vdGhlciBzaW1pbGFy
IGxvZyB3aXRoIGZyZWUtZm9ybQo+ID4gPiA+IHRleHQuCj4gPiA+ID4KPiA+ID4KPiA+ID4gT2ss
IHNvIGdpdmVuIHRoZSBtb3JlIHN0cnVjdHVyZWQgdmVyc2lvbiBvZiB0aGlzIHNldCBbMV0gd2Fz
IG5vdCB3ZWxsIHJlY2VpdmVkLAo+ID4gPiBhcmUgd2UgYWxsIGNvbWZvcnRhYmxlIGdvaW5nIHdp
dGggdGhlIGZyZWVmb3JtIGFwcHJvYWNoIGluIHRoaXMgdmVyc2lvbj8KPiA+Cj4gPiBJbW8geWVz
LiBJdCdzIHN0aWxsIHVhYmksIHNvIHNvbWVvbmUgd2lsbCBoYXZlIHJlZ3JldHMgYWJvdXQgaXQu
IEJ1dAo+ID4gZ2l2ZW4gdGhhdCBkbWVzZyBoYXMgYmVlbiBhcm91bmQgZm9yZXZlciwgYW5kIGNh
dXNlcyByYXRoZXIgbGl0dGxlCj4gPiBicmVha2FnZSwgSSB0aGluayB3ZSBzaG91bGQgYmUgZmFp
cmx5IG9rLgo+ID4KPiA+IEkgc3RpbGwgdGhpbmsgdGhhdCBmaWd1cmluZyBvdXQgdGhlIGRybV9k
ZXYgbG9nZ2luZyBiaWtlc2hlZCBtaWdodCBiZQo+ID4gZ29vZCwgd2hpbGUgd2Ugbm9vZGxlIGFy
b3VuZCBpbiBoZXJlLgo+Cj4gSGksCj4KPiBvbmUgbW9yZSB3YWNreSBpZGVhOiBoYXZlIGEgZmxp
Z2h0IHJlY29yZGVyIGJ1ZmZlcihzKSBpbiB0aGUga2VybmVsLAo+IGJ1dCBkbyBub3QgZXhwb3Nl
IHRoZW0gYXMgaXMgdG8gdXNlcnNwYWNlLiBJbnN0ZWFkLCBjcmVhdGUgYSB0cmlnZ2VyCj4gc29t
ZXdoZXJlICgvcHJvYz8pIHRoYXQgY2F1c2VzIHRoZSBmbGlnaHQgcmVjb3JkZXIgYnVmZmVycyB0
byBiZQo+IGZsdXNoZWQgaW50byBkbWVzZy4gVGhhdCB3YXkgdGhlIGFtb3VudCBvZiBuZXcgVUFC
SSBpcyByZWR1Y2VkIHRvIGp1c3QKPiB0aGUgdHJpZ2dlci4gT2J2aW91c2x5IHRoaXMgc3BhbXMg
ZG1lc2cgYW5kIHdvdWxkIG5lZWQgdGhlIHJpZ2h0cyB0bwo+IGFjY2VzcyBkbWVzZyB0byBhY3R1
YWxseSBjb2xsZWN0IHRoZSBsb2dzLiBJJ20gbm90IHN1cmUgaWYgdGhhdCdzIGdvb2QKPiBvciBi
YWQsIGJ1dCBpdCB3b3VsZCByZS11c2UgZG1lc2cuCgpUaGF0J3Mgcm91Z2hseSBob3cgd2UgZW5k
ZWQgdXAgaGVyZSwgc2luY2UgdHJhY2UgYnVmZmVyIGR1bXBpbmcgaXMKc29tZXRoaW5nIHRoYXQg
ZXhpc3RzIGFscmVhZHkgKHlvdSBjYW4gZS5nLiBkdW1wIGl0IG9uIGFuIE9vcHMgdG9vLCB3ZQpk
byB0aGF0IGluIG91ciBDSSB3aXRoIGEgZmV3IGk5MTUgdHJhY2Vwb2ludHMgZW5hYmxlZCkuIEkg
dGhpbmsgYXQKdGhhdCBwb2ludCBhIHNlY3Rpb24gaW4gZHJtLXVhcGkucnN0IGV4cGxhaW5pbmcg
d2hhdCB5b3UKc2hvdWxkL3Nob3VsZG4ndCBkbyB3aXRoIHRoZXNlIHRyYWNlcG9pbnRzIGlzIGFi
b3V0IGFzIGRtZXNnLgotRGFuaWVsCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVy
LCBJbnRlbCBDb3Jwb3JhdGlvbgorNDEgKDApIDc5IDM2NSA1NyA0OCAtIGh0dHA6Ly9ibG9nLmZm
d2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
