Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E905124F94
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2019 15:03:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70AF58931E;
	Tue, 21 May 2019 13:03:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-it1-x144.google.com (mail-it1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DEAE8922E;
 Tue, 21 May 2019 13:03:54 +0000 (UTC)
Received: by mail-it1-x144.google.com with SMTP id m140so4539720itg.2;
 Tue, 21 May 2019 06:03:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=X5UBFBt6SemRtO/b3yNJJKHCDQh0vE40doezgKAmcYA=;
 b=JtMMpoPhmGZbDLUWndadxVns7naeGS+9ZEhsCdO/rhyh6PmfJ4u1XuwjiffTq/YX7j
 zqgkL811iq/ku0gn3DezcZBF/CzSPkzIC/PMtlPo8qT121ywTSRLz7/XOMBUe5AZZHxJ
 uDxSmfRa91hyZe7a+F2FPVWPxk8FfNUvcwLhG5ANN+XoP8nwcTImLzxrVTFXSHniqTMX
 5hYM0gvzfyg5HFHQfczzVLwyipdoczFuuXbOPQrxC3USlD0Tlx6ka4Q4Vg+gUL2DwXmW
 RyDU8dyGj+217p+3j2PYJAxOuCYUP0feGD9aZaMgocadrCTTmbj31qfOtFJaUN+uiCDb
 m7aQ==
X-Gm-Message-State: APjAAAU/HqiMCN116pngS40LUDmPx8J2x4IaFhEeLxFPiESFvtSYYEDn
 vVrRjOlXroqF2ppQn4wc+hQSkpyMWnF0ZcwGk0c=
X-Google-Smtp-Source: APXvYqwXFovA0sPlvj4oY3gKr7dFWW1EcYLt8cVevwOxG0zcO1biKENDEejBINU8wi7i/pO5Zcq1XYF9kNgzuXthLIQ=
X-Received: by 2002:a24:edce:: with SMTP id r197mr3606947ith.147.1558443833929; 
 Tue, 21 May 2019 06:03:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190520231649.24595-1-nunes.erico@gmail.com>
 <cff4f34a-c604-b662-c250-15c426062601@amd.com>
 <CAK4VdL2jtyFXDXY1VvVXp=buk4tbY__eqAW5b7nigxuZaw6Wvw@mail.gmail.com>
In-Reply-To: <CAK4VdL2jtyFXDXY1VvVXp=buk4tbY__eqAW5b7nigxuZaw6Wvw@mail.gmail.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Tue, 21 May 2019 21:03:42 +0800
Message-ID: <CAKGbVbuteaCGA0vrRXuNUmZhuJSx2b7FZVdW1w02upin1ZFaxA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/scheduler: Fix job cleanup without timeout handler
To: Erico Nunes <nunes.erico@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=X5UBFBt6SemRtO/b3yNJJKHCDQh0vE40doezgKAmcYA=;
 b=JweuTf0F2dz86+kleMKJ9Sk/x+Fanu+9U+B53mJDtW9jgDD2tYxfso/wXnS71w16Zz
 kk6eCoFroxN4j+eJSVFWHwNt6WmubZJZ4vamuu5Ysp6eOByamj30+P5drXyALQo/ruhh
 PFE7qW79ynInUpD6RNEF/J8RiN/HbRQTxr5g6kXu1+3odYBVLCuwDEpttNPo/lZH7603
 oH6xbVY7TUPiZbA/ACFI0kqYB4/yaHTDvfvzkASEGI/22s2XOa+w5girBvlEkK41wUSf
 ne1Yk5ID24DVYYIe9qPYTj063LQ2N/DsurfmtHzpQ4Y0d1PZ28BRB756oE63I3YTXX8H
 wcJA==
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
Cc: "lima@lists.freedesktop.org" <lima@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, Sharat Masetty <smasetty@codeaurora.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Nayan Deshmukh <nayan26deshmukh@gmail.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXkgMjEsIDIwMTkgYXQgODoxNyBQTSBFcmljbyBOdW5lcyA8bnVuZXMuZXJpY29A
Z21haWwuY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwgTWF5IDIxLCAyMDE5IGF0IDg6NDcgQU0gS29l
bmlnLCBDaHJpc3RpYW4KPiA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29tPiB3cm90ZToKPiA+Cj4g
PiBBbSAyMS4wNS4xOSB1bSAwMToxNiBzY2hyaWViIEVyaWNvIE51bmVzOgo+ID4gPiBbQ0FVVElP
TjogRXh0ZXJuYWwgRW1haWxdCj4gPiA+Cj4gPiA+IEFmdGVyICI1OTE4MDQ1YzRlZDQgZHJtL3Nj
aGVkdWxlcjogcmV3b3JrIGpvYiBkZXN0cnVjdGlvbiIsIGpvYnMgYXJlCj4gPiA+IG9ubHkgZGVs
ZXRlZCB3aGVuIHRoZSB0aW1lb3V0IGhhbmRsZXIgaXMgYWJsZSB0byBiZSBjYW5jZWxsZWQKPiA+
ID4gc3VjY2Vzc2Z1bGx5Lgo+ID4gPgo+ID4gPiBJbiBjYXNlIG5vIHRpbWVvdXQgaGFuZGxlciBp
cyBydW5uaW5nICh0aW1lb3V0ID09IE1BWF9TQ0hFRFVMRV9USU1FT1VUKSwKPiA+ID4gam9iIGNs
ZWFudXAgd291bGQgYmUgc2tpcHBlZCB3aGljaCBtYXkgcmVzdWx0IGluIG1lbW9yeSBsZWFrcy4K
PiA+ID4KPiA+ID4gQWRkIHRoZSBoYW5kbGluZyBmb3IgdGhlICh0aW1lb3V0ID09IE1BWF9TQ0hF
RFVMRV9USU1FT1VUKSBjYXNlIGluCj4gPiA+IGRybV9zY2hlZF9jbGVhbnVwX2pvYnMuCj4gPiA+
Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEVyaWNvIE51bmVzIDxudW5lcy5lcmljb0BnbWFpbC5jb20+
Cj4gPiA+IENjOiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4g
Pgo+ID4gUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1k
LmNvbT4KPiA+Cj4gPiBHb2luZyB0byBwaWNrIHRoYXQgdXAgbGF0ZXIgdG9kYXkgaW50byBvdXIg
aW50ZXJuYWwgYnJhbmNoLgo+Cj4gVGhhbmtzLiBJIGFsc28gcG9zdGVkIG9uZSB0byBzZXQgbGlt
YSB0byB1c2UgYSByZWFsIGRlZmF1bHQgdGltZW91dC4KPgo+IElzIGl0IHBvc3NpYmxlIGZvciB1
cyB0byBzdGlsbCBnZXQgYXQgbGVhc3Qgb25lIG9mIHRoZXNlIGludG8gYSB0cmVlCj4gdGhhdCBn
b2VzIHRvIGEgbGludXggNS4yLXJjPwo+IFRoaXMgaXNzdWUgbWF5IG1ha2UgbGltYSB1bnVzYWJs
ZSBhcyB0aGUgc3lzdGVtIHJ1bnMgb3V0IG9mIG1lbW9yeQo+IHF1aWNrbHkgaWYgbWFueSBvcGVu
Z2wgcHJvZ3JhbXMgYXJlIGxhdW5jaGVkLgo+ClRoZSAiZHJtL3NjaGVkdWxlcjogcmV3b3JrIGpv
YiBkZXN0cnVjdGlvbiIgY29tbWl0IGlzIG5vdCBpbiA1LjItcmMuIFNvIG5vCm5lZWQgdG8gcGlj
ayBhbnkgZml4IHRvIHRoYXQgcGxhY2UuCgpJdCB3b3VsZCBiZSBiZXR0ZXIgdGhhdCBydW4gc29t
ZSB0ZXN0cyBvbiA1LjItcmMgZm9yIG90aGVyIHBvc3NpYmxlCmZpeGVzIGluZGVlZC4KClJlZ2Fy
ZHMsClFpYW5nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
