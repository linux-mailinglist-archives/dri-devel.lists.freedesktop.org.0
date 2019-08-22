Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0AC98944
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 04:13:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C70D96EA4C;
	Thu, 22 Aug 2019 02:13:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 702B56EA4B;
 Thu, 22 Aug 2019 02:13:03 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id e8so6013190wme.1;
 Wed, 21 Aug 2019 19:13:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ojaEvfqlKAAL2lTKmwRHpldmWlVYnPOGOZegIqvukh4=;
 b=ZJM0vlSeiIEoAeiSITFsK2ECPNNw1kOuI2UmHgohUKk3kXUTpz0kh7UsH3zBbxx35k
 GoqCLlmius7tQYHe+41njr6XpMDcMv60x0UpditK1B+Ywrt9EuIfThZrV6Wj2l6xTq/P
 5EEhKuS4pPaEw/hI8kZV8KifTnP0AXvAA9ITXdKiGg5U31oV5NUgnM6H0p8jgQ8TuAtL
 mqCX7GITAwBmKq3bLNuuNA4Lr7gMXNiOx6g44vO+G7ho0wWm4bDC9qbMqG8h72oenwpW
 H2ThnPPzPLI5qMevAODcn+R5wkCrvsy4nml1lqVKBe8k+JVNdcMjox2xWywEQAbyMwdv
 XiKA==
X-Gm-Message-State: APjAAAV8PaHxcwvTY74be3VU9zAzCeJhmmNuotO34xXcFJm2ofa1oy3A
 H7sLWhfUwLpWlwiFaEv7WSOUp/F6bGPLzLrsxt0=
X-Google-Smtp-Source: APXvYqz1e6uwc2N1gK7CKn+4vyXXXefJ+pKwR+9EfXYJmVBylK261gkCDlDmCLca8YnY0HAftOAX0k6IOPy/Un811cA=
X-Received: by 2002:a05:600c:352:: with SMTP id
 u18mr3004060wmd.141.1566439981994; 
 Wed, 21 Aug 2019 19:13:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190820235713.3429-1-natechancellor@gmail.com>
 <f594d746-9eaf-76fe-d380-bb033cce06f8@amd.com>
In-Reply-To: <f594d746-9eaf-76fe-d380-bb033cce06f8@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 21 Aug 2019 22:12:50 -0400
Message-ID: <CADnq5_PH6gA2kMi5+sT4N=AQdfJkEg4ZhoZtYduLTDAyUT7cBA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Fix 32-bit divide error in
 wait_for_alt_mode
To: Harry Wentland <hwentlan@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=ojaEvfqlKAAL2lTKmwRHpldmWlVYnPOGOZegIqvukh4=;
 b=vPJ+HTkPwnSMhE+qk8hSEgNCinF4IuXtqDQft6K7Z6pWsZRigw83vmRIhHY25E6qfN
 gG7UUcRGewF79O4OeMiXpE3WrqVd6YWw1gf+tajAQ42uAD+lyh9ocOcr3zTKvcDHW76K
 mYTudpP2GdNQBAAecf9HQtxfVLHYL/u3Du+nHR+jhwDK90wV53KbznnQQgC/lbs8TdRx
 A1lTRcezQS9D2/pFwd6SZFA5moefvJ06I9ZHAdIhAQf07OEXr8E8LICKyBcXMOmMpARm
 B+F+n0typVorUhOxNHzx0Czag8LXcQCq2ZiRsJEwbMzSnWfDt40QVKe919bw5QR0A04D
 16YQ==
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
Cc: "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 Nathan Chancellor <natechancellor@gmail.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXBwbGllZC4gIHRoYW5rcyEKCkFsZXgKCk9uIFdlZCwgQXVnIDIxLCAyMDE5IGF0IDEyOjQwIFBN
IEhhcnJ5IFdlbnRsYW5kIDxod2VudGxhbkBhbWQuY29tPiB3cm90ZToKPgo+IE9uIDIwMTktMDgt
MjAgNzo1NyBwLm0uLCBOYXRoYW4gQ2hhbmNlbGxvciB3cm90ZToKPiA+IFdoZW4gYnVpbGRpbmcg
YXJtMzIgYWxseWVzY29uZmlnOgo+ID4KPiA+IGxkLmxsZDogZXJyb3I6IHVuZGVmaW5lZCBzeW1i
b2w6IF9fYWVhYmlfdWxkaXZtb2QKPiA+Pj4+IHJlZmVyZW5jZWQgYnkgZGNfbGluay5jCj4gPj4+
PiBncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGluay5vOih3YWl0X2Zvcl9hbHRfbW9k
ZSkgaW4gYXJjaGl2ZSBkcml2ZXJzL2J1aWx0LWluLmEKPiA+Pj4+IHJlZmVyZW5jZWQgYnkgZGNf
bGluay5jCj4gPj4+PiBncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGluay5vOih3YWl0
X2Zvcl9hbHRfbW9kZSkgaW4gYXJjaGl2ZSBkcml2ZXJzL2J1aWx0LWluLmEKPiA+Cj4gPiB0aW1l
X3Rha2VuX2luX25zIGlzIG9mIHR5cGUgdW5zaWduZWQgbG9uZyBsb25nIHNvIHdlIG5lZWQgdG8g
dXNlIGRpdl91NjQKPiA+IHRvIGF2b2lkIHRoaXMgZXJyb3IuCj4gPgo+ID4gRml4ZXM6IGI1YjFm
NDU1NDkwNCAoImRybS9hbWQvZGlzcGxheTogRW5hYmxlIHR5cGUgQyBob3RwbHVnIikKPiA+IFJl
cG9ydGVkLWJ5OiBSYW5keSBEdW5sYXAgPHJkdW5sYXBAaW5mcmFkZWFkLm9yZz4KPiA+IFNpZ25l
ZC1vZmYtYnk6IE5hdGhhbiBDaGFuY2VsbG9yIDxuYXRlY2hhbmNlbGxvckBnbWFpbC5jb20+Cj4K
PiBSZXZpZXdlZC1ieTogSGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5kQGFtZC5jb20+Cj4K
PiBIYXJyeQo+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29y
ZS9kY19saW5rLmMgfCA0ICsrLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvY29yZS9kY19saW5rLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvY29yZS9kY19saW5rLmMKPiA+IGluZGV4IGYyZDc4ZDdiMDg5ZS4uODYzNDkyM2I0NDQ0IDEw
MDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGlu
ay5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5r
LmMKPiA+IEBAIC03MjEsNyArNzIxLDcgQEAgYm9vbCB3YWl0X2Zvcl9hbHRfbW9kZShzdHJ1Y3Qg
ZGNfbGluayAqbGluaykKPiA+ICAgICAgICAgICAgICAgICAgICAgICB0aW1lX3Rha2VuX2luX25z
ID0gZG1fZ2V0X2VsYXBzZV90aW1lX2luX25zKAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgbGluay0+Y3R4LCBmaW5pc2hfdGltZXN0YW1wLCBlbnRlcl90aW1lc3RhbXApOwo+ID4g
ICAgICAgICAgICAgICAgICAgICAgIERDX0xPR19XQVJOSU5HKCJBbHQgbW9kZSBlbnRlcmVkIGZp
bmlzaGVkIGFmdGVyICVsbHUgbXNcbiIsCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgdGltZV90YWtlbl9pbl9ucyAvIDEwMDAwMDApOwo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGRpdl91NjQodGltZV90YWtlbl9pbl9ucywgMTAwMDAwMCkp
Owo+ID4gICAgICAgICAgICAgICAgICAgICAgIHJldHVybiB0cnVlOwo+ID4gICAgICAgICAgICAg
ICB9Cj4gPgo+ID4gQEAgLTczMCw3ICs3MzAsNyBAQCBib29sIHdhaXRfZm9yX2FsdF9tb2RlKHN0
cnVjdCBkY19saW5rICpsaW5rKQo+ID4gICAgICAgdGltZV90YWtlbl9pbl9ucyA9IGRtX2dldF9l
bGFwc2VfdGltZV9pbl9ucyhsaW5rLT5jdHgsIGZpbmlzaF90aW1lc3RhbXAsCj4gPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGVudGVyX3RpbWVzdGFt
cCk7Cj4gPiAgICAgICBEQ19MT0dfV0FSTklORygiQWx0IG1vZGUgaGFzIHRpbWVkIG91dCBhZnRl
ciAlbGx1IG1zXG4iLAo+ID4gLSAgICAgICAgICAgICAgICAgICAgIHRpbWVfdGFrZW5faW5fbnMg
LyAxMDAwMDAwKTsKPiA+ICsgICAgICAgICAgICAgICAgICAgICBkaXZfdTY0KHRpbWVfdGFrZW5f
aW5fbnMsIDEwMDAwMDApKTsKPiA+ICAgICAgIHJldHVybiBmYWxzZTsKPiA+ICB9Cj4gPgo+ID4K
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGFtZC1n
ZnggbWFpbGluZyBsaXN0Cj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
