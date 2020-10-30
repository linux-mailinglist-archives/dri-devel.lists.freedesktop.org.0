Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FD62A0805
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 15:37:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 683A689A9F;
	Fri, 30 Oct 2020 14:37:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0E2389A9F
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Oct 2020 14:36:59 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id x203so6815869oia.10
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Oct 2020 07:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tyc2DcLVRGUXLMrDw4Q4IIZe2eeLRq6orFfGq6QYpHo=;
 b=CGnyzC3XtiPzydsPlnKDKhLO5fovxi4is9NSmcgYJj9pF/XKYm9eHpFpKje1hS/5r9
 rrb/9zqPUpS4MNhUeHuuISmxMheXLk9dPXYiiXTVjGR1j677DMfHBzwPM+trPssGX9bf
 2BpNnvHw+rbFcXBJdGcVk3b8PxI6pujjFWcHk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tyc2DcLVRGUXLMrDw4Q4IIZe2eeLRq6orFfGq6QYpHo=;
 b=pObHdxq3Xq17Dqsyw047iU+o7V8g/J3hvs9YKwneonnxZ6a40gsD3IBH36OjZ25+Bm
 Go4gDSKJ9CAB06W2KVhXAIopjo/4anMhOyXRzYTVRQrEszxp1XFRBiwA8BhkB91U5Uwo
 v6VrfU7wPQz0+wDnoWC/aywAaUtE6uZsY2K+MBJiFdh8uKVLtww408tC0yEZAv/PED51
 X42PxuiYT8JgnaWTKvOVf5dPqzkmo2sVpO4F2t2NF/vB+uQGo+F72crOkxh4kPxTsKpe
 okL6Ht6Q/S3rFd72cUERjIfLqrden2hgi7y2DF6FmOgtWn/wLzf7oHQy4p9x453qDUQG
 Aufg==
X-Gm-Message-State: AOAM531TJnfow5sNL8k98zotHIZdPtEgCCMhjGp5I6foA+FNBSpMjUi8
 o1HlTWsVFl8wkZ7jfFf2QxR4FzR/nwDVWvQ/ZWvznLVTgKK3Dg==
X-Google-Smtp-Source: ABdhPJykWzVwlTp1FEdL3mU5cnfBcpu84LPA5MZenbeUebWngHVy8Ht2imJebCBR74npyqc8XVy/4yHPvWOk2JUzIcw=
X-Received: by 2002:aca:39d6:: with SMTP id g205mr1874737oia.14.1604068619273; 
 Fri, 30 Oct 2020 07:36:59 -0700 (PDT)
MIME-Version: 1.0
References: <20201030111301.13458-1-christian.koenig@amd.com>
 <CAKMK7uFXKksw1F4cKRgKFfsNbVWo4VNt0-+-nu7+cv9OPD14Yg@mail.gmail.com>
 <5fe038e5-fe6c-fb67-8668-8cde0ccf52d0@gmail.com>
In-Reply-To: <5fe038e5-fe6c-fb67-8668-8cde0ccf52d0@gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 30 Oct 2020 15:36:47 +0100
Message-ID: <CAKMK7uFhAkiGgWwZEiNvbR+xUyWnReq5tnOaPrSP+UiX1U3P3Q@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveu: fix swiotlb include
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMzAsIDIwMjAgYXQgMzoyNyBQTSBDaHJpc3RpYW4gS8O2bmlnCjxja29lbmln
LmxlaWNodHp1bWVya2VuQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBBbSAzMC4xMC4yMCB1bSAxMzow
OCBzY2hyaWViIERhbmllbCBWZXR0ZXI6Cj4gPiBPbiBGcmksIE9jdCAzMCwgMjAyMCBhdCAxMjox
MyBQTSBDaHJpc3RpYW4gS8O2bmlnCj4gPiA8Y2tvZW5pZy5sZWljaHR6dW1lcmtlbkBnbWFpbC5j
b20+IHdyb3RlOgo+ID4+IFRoZSBjaGVjayBmb3Igc3dpb3RsYiBoYXMgbW92ZWQgdG8gbm91dmV1
X3R0bS5jLCBidXQgd2UgZm9yZ290IHRvIG1vdmUKPiA+PiB0aGUgaW5jbHVkZSBhcyB3ZWxsLgo+
ID4+Cj4gPj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5p
Z0BhbWQuY29tPgo+ID4gSG0gZHJtLW1pc2MtbmV4dCBjb21waWxlcyBmaW5lIHdpdGggc3dpb3Rs
YiBlbmFibGVkIGluIGNvbmZpZy4gQW0gSQo+ID4gYmxpbmQgb3IgaXMgdGhpcyBhIG1lcmdlIHBy
b2JsZW0gd2l0aCAtcmMxPyBJZiB0aGUgbGF0dGVyIG5lZWQgdG8gZ2l2ZQo+ID4gVGhvbWFzIGEg
aGVhZHMtdXAgYWJvdXQgdGhhdCBmb3IgdGhlIGJhY2ttZXJnZSBvZiAtcmMyLgo+Cj4gSXQncyBh
IG1lcmdlIHByb2JsZW0gd2l0aCBsaW51eC1uZXh0IFN0ZXBoZW4gcG9pbnRlZCBvdXQuCj4KPiBB
bmQgYmVmb3JlIHlvdSBhc2s6IE5vcGUsIEkgaGF2ZSBubyBpZGVhIHdoeSBkcm0tbWlzYy1uZXh0
IGFsb25lCj4gY29tcGlsZXMgZmluZSBlaXRoZXIuCj4KPiBBbnl3YXkgdGFraW5nIG92ZXIgdGhl
IGluY2x1ZGUgaXMgdGhlIHJpZ2h0IHRoaW5nIHRvLWRvLiBDYW4gSSBwbGVhc2UKPiBnZXQgYW4g
cmI/CgpBaCBpZiB3ZSBjYW4gYXBwbHkgdGhpcyBhbHJlYWR5IHRvIG1ha2Ugc3VyZSB0aGUgbWVy
Z2UgZG9lc24ndCBnbwpib29tLCB0aGVuIHNob3VsZCBiZSBnb29kIHRvIGFwcGx5IGFscmVhZHkg
Oi0pCgpBY2tlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KCk1h
eWJlIHNtYXNoIHlvdXIgYWJvdmUgZXhwbGFuYXRpb24gaW50byB0aGUgY29tbWl0IG1lc3NhZ2Ug
dG9vLCBmb3IgdGhlIHJlY29yZC4KLURhbmllbAoKPgo+IFRoYW5rcywKPiBDaHJpc3RpYW4uCj4K
PiA+IC1EYW5pZWwKPiA+Cj4gPgo+ID4+IC0tLQo+ID4+ICAgZHJpdmVycy9ncHUvZHJtL25vdXZl
YXUvbm91dmVhdV9iby5jICB8IDEgLQo+ID4+ICAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91
dmVhdV90dG0uYyB8IDMgKysrCj4gPj4gICAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQo+ID4+Cj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9u
b3V2ZWF1L25vdXZlYXVfYm8uYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8u
Ywo+ID4+IGluZGV4IDc0NmMwNmVkMTk1Yi4uODEzMzM3N2Q4NjVkIDEwMDY0NAo+ID4+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYwo+ID4+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYwo+ID4+IEBAIC0yOCw3ICsyOCw2IEBACj4gPj4g
ICAgKi8KPiA+Pgo+ID4+ICAgI2luY2x1ZGUgPGxpbnV4L2RtYS1tYXBwaW5nLmg+Cj4gPj4gLSNp
bmNsdWRlIDxsaW51eC9zd2lvdGxiLmg+Cj4gPj4KPiA+PiAgICNpbmNsdWRlICJub3V2ZWF1X2Ry
di5oIgo+ID4+ICAgI2luY2x1ZGUgIm5vdXZlYXVfY2hhbi5oIgo+ID4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3R0bS5jIGIvZHJpdmVycy9ncHUvZHJtL25v
dXZlYXUvbm91dmVhdV90dG0uYwo+ID4+IGluZGV4IGQ2OTZkODgyYzllYi4uMmJmMzYyMjlkZDU3
IDEwMDY0NAo+ID4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfdHRtLmMK
PiA+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3R0bS5jCj4gPj4gQEAg
LTIyLDYgKzIyLDkgQEAKPiA+PiAgICAqIE9USEVSV0lTRSwgQVJJU0lORyBGUk9NLCBPVVQgT0Yg
T1IgSU4gQ09OTkVDVElPTiBXSVRIIFRIRSBTT0ZUV0FSRSBPUiBUSEUKPiA+PiAgICAqIFVTRSBP
UiBPVEhFUiBERUFMSU5HUyBJTiBUSEUgU09GVFdBUkUuCj4gPj4gICAgKi8KPiA+PiArCj4gPj4g
KyNpbmNsdWRlIDxsaW51eC9zd2lvdGxiLmg+Cj4gPj4gKwo+ID4+ICAgI2luY2x1ZGUgIm5vdXZl
YXVfZHJ2LmgiCj4gPj4gICAjaW5jbHVkZSAibm91dmVhdV9nZW0uaCIKPiA+PiAgICNpbmNsdWRl
ICJub3V2ZWF1X21lbS5oIgo+ID4+IC0tCj4gPj4gMi4xNy4xCj4gPj4KPiA+PiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4+IGRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKPiA+PiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPj4gaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKPiA+Cj4g
Pgo+ID4gLS0KPiA+IERhbmllbCBWZXR0ZXIKPiA+IFNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBD
b3Jwb3JhdGlvbgo+ID4gaHR0cDovL2Jsb2cuZmZ3bGwuY2gKPgoKCi0tIApEYW5pZWwgVmV0dGVy
ClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5j
aApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
