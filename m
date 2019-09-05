Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9146AA00F
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 12:41:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0287F6E040;
	Thu,  5 Sep 2019 10:41:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03D826E040
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 10:41:39 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id b80so1384173oii.7
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Sep 2019 03:41:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AbBV6oo8EEIqowDXyeUoAbrfMbexy7KJeFh9ZmY9cKQ=;
 b=iMJ+jLI1W8b1vKaI+QcZtZD5IFRK1Bq/GbcukFH0LQZAa+xXhNbkgNqDCh6XUBkrhs
 t5oebQDELIMIkNnzoKRzFI6gJ5xszV/yBFrombH0XC2lUhoKb0rNeYAVy4wRFvFdUStj
 xPEIFWaH6CXjG0tzIigO5JTsVmg3qb9ONZI/TnzVPDLQgEK+KFHDAiP8Vxxy0UeVh+i2
 wrZPcpgLzEoi6nz40UcgAJKURAQNZEbaaPCiMGfbJT16wwRxqn7yOg9sif6R4VSFroui
 Mvg+/WkTPGM2KgZFvlYGJk4z2Jl6RIFXPs+tkXkPBDnhc39yOQlz8JBJTDr4BTcQKuMi
 eh2w==
X-Gm-Message-State: APjAAAWgackHqsZeQm5FwyZWoQd6QuovihA4U6kn5r+9htQKBPA/CcEM
 5DHPg1QqZiFnrLRWpYIYWPFPiTH0cJ/OoC4vCJbakA==
X-Google-Smtp-Source: APXvYqw1asXU8p84eB6UIF6IHFqR62bfC+WWX4hUgop6z4xTLlQI6y/FeN0rMBqV0jh1EkLR9nK3TLawr6qrrPOsJMs=
X-Received: by 2002:aca:5697:: with SMTP id k145mr1816837oib.101.1567680098221; 
 Thu, 05 Sep 2019 03:41:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190904202938.110207-1-sean@poorly.run>
In-Reply-To: <20190904202938.110207-1-sean@poorly.run>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 5 Sep 2019 12:41:27 +0200
Message-ID: <CAKMK7uFtcmZd9+wARmYuZwtimUV91fiFXNmr5Nuk4Z65QjHyuA@mail.gmail.com>
Subject: Re: [PATCH] drm: damage_helper: Fix race checking plane->state->fb
To: Sean Paul <sean@poorly.run>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=AbBV6oo8EEIqowDXyeUoAbrfMbexy7KJeFh9ZmY9cKQ=;
 b=Ic05xQnYjdm68gWTyNiOvYw20Hz8Ax+yQeHAE8UIfHAhAa16danRTGGUSrrIl9Zfy6
 rywCu4Iw06J5VQsWtX2POq3Gcuoi5bN9N9RV2O2AdZ0snBw6EDz9Ha0i1EVm7YmOcUDf
 JzkohUZZRwmQvHNec7xozwNGn61KtccMUdnLE=
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Sean Paul <seanpaul@chromium.org>, stable <stable@vger.kernel.org>,
 Deepak Rawat <drawat@vmware.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBTZXAgNCwgMjAxOSBhdCAxMDoyOSBQTSBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1
bj4gd3JvdGU6Cj4KPiBGcm9tOiBTZWFuIFBhdWwgPHNlYW5wYXVsQGNocm9taXVtLm9yZz4KPgo+
IFNpbmNlIHRoZSBkaXJ0eWZiIGlvY3RsIGRvZXNuJ3QgZ2l2ZSB1cyBhbnkgaGludHMgYXMgdG8g
d2hpY2ggcGxhbmUgaXMKPiBzY2FubmluZyBvdXQgdGhlIGZiIGl0J3MgbWFya2luZyBhcyBkYW1h
Z2VkLCB3ZSBuZWVkIHRvIGxvb3AgdGhyb3VnaAo+IHBsYW5lcyB0byBmaW5kIGl0Lgo+Cj4gQ3Vy
cmVudGx5IHdlIGp1c3QgcmVhY2ggaW50byBwbGFuZSBzdGF0ZSBhbmQgY2hlY2ssIGJ1dCB0aGF0
IGNhbiByYWNlCj4gd2l0aCBhbm90aGVyIGNvbW1pdCBjaGFuZ2luZyB0aGUgZmIgb3V0IGZyb20g
dW5kZXIgdXMuIFRoaXMgcGF0Y2ggbG9ja3MKPiB0aGUgcGxhbmUgYmVmb3JlIGNoZWNraW5nIHRo
ZSBmYiBhbmQgd2lsbCByZWxlYXNlIHRoZSBsb2NrIGlmIHRoZSBwbGFuZQo+IGlzIG5vdCBkaXNw
bGF5aW5nIHRoZSBkaXJ0eSBmYi4KPgo+IEZpeGVzOiBiOWZjNWUwMWQxY2UgKCJkcm06IEFkZCBo
ZWxwZXIgdG8gaW1wbGVtZW50IGxlZ2FjeSBkaXJ0eWZiIikKPiBDYzogUm9iIENsYXJrIDxyb2Jk
Y2xhcmtAZ21haWwuY29tPgo+IENjOiBEZWVwYWsgUmF3YXQgPGRyYXdhdEB2bXdhcmUuY29tPgo+
IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgo+IENjOiBUaG9tYXMg
SGVsbHN0cm9tIDx0aGVsbHN0cm9tQHZtd2FyZS5jb20+Cj4gQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0
IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+Cj4gQ2M6IE1heGltZSBSaXBhcmQg
PG1heGltZS5yaXBhcmRAYm9vdGxpbi5jb20+Cj4gQ2M6IFNlYW4gUGF1bCA8c2VhbkBwb29ybHku
cnVuPgo+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERhbmllbCBW
ZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwo+IENjOiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4gIyB2NS4wKwo+IFJlcG9ydGVkLWJ5
OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gU2lnbmVkLW9mZi1ieTogU2VhbiBQ
YXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1f
ZGFtYWdlX2hlbHBlci5jIHwgOCArKysrKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ry
bV9kYW1hZ2VfaGVscGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RhbWFnZV9oZWxwZXIuYwo+
IGluZGV4IDgyMzBkYWMwMWE4OS4uM2E0MTI2ZGMyNTIwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9kcm1fZGFtYWdlX2hlbHBlci5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9k
YW1hZ2VfaGVscGVyLmMKPiBAQCAtMjEyLDggKzIxMiwxNCBAQCBpbnQgZHJtX2F0b21pY19oZWxw
ZXJfZGlydHlmYihzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYiwKPiAgICAgICAgIGRybV9mb3Jf
ZWFjaF9wbGFuZShwbGFuZSwgZmItPmRldikgewo+ICAgICAgICAgICAgICAgICBzdHJ1Y3QgZHJt
X3BsYW5lX3N0YXRlICpwbGFuZV9zdGF0ZTsKPgo+IC0gICAgICAgICAgICAgICBpZiAocGxhbmUt
PnN0YXRlLT5mYiAhPSBmYikKPiArICAgICAgICAgICAgICAgcmV0ID0gZHJtX21vZGVzZXRfbG9j
aygmcGxhbmUtPm11dGV4LCBzdGF0ZS0+YWNxdWlyZV9jdHgpOwo+ICsgICAgICAgICAgICAgICBp
ZiAocmV0KQoKSSB0aGluayBmb3IgcGFyYW5vaWQgc2FmZXR5IHdlIHNob3VsZCBoYXZlIGEgV0FS
Tl9PTihyZXQgPT0gLUVBTFJFQURZKQpoZXJlLiBJdCBzaG91bGQgYmUgaW1wb3NzaWJsZSwgYnV0
IGlmIGl0J3Mgbm90IGZvciBzb21lIG9kZGJhbGwKcmVhc29uLCB3ZSdsbCBibG93IHVwLgoKV2l0
aCB0aGF0OiBSZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgoKQnV0
IHBsZWFzZSBnaXZlIHRoaXMgYSBzcGluIHdpdGggc29tZSB3b3JrbG9hZHMgYW5kIHRoZSB3d19t
dXRleApzbG93cGF0aCBkZWJ1Z2dpbmcgZW5hYmxlZCwganVzdCB0byBtYWtyZSBzdXJlLgotRGFu
aWVsCgo+ICsgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gb3V0Owo+ICsKPiArICAgICAgICAg
ICAgICAgaWYgKHBsYW5lLT5zdGF0ZS0+ZmIgIT0gZmIpIHsKPiArICAgICAgICAgICAgICAgICAg
ICAgICBkcm1fbW9kZXNldF91bmxvY2soJnBsYW5lLT5tdXRleCk7Cj4gICAgICAgICAgICAgICAg
ICAgICAgICAgY29udGludWU7Cj4gKyAgICAgICAgICAgICAgIH0KPgo+ICAgICAgICAgICAgICAg
ICBwbGFuZV9zdGF0ZSA9IGRybV9hdG9taWNfZ2V0X3BsYW5lX3N0YXRlKHN0YXRlLCBwbGFuZSk7
Cj4gICAgICAgICAgICAgICAgIGlmIChJU19FUlIocGxhbmVfc3RhdGUpKSB7Cj4gLS0KPiBTZWFu
IFBhdWwsIFNvZnR3YXJlIEVuZ2luZWVyLCBHb29nbGUgLyBDaHJvbWl1bSBPUwo+CgoKLS0gCkRh
bmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCis0MSAoMCkg
NzkgMzY1IDU3IDQ4IC0gaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
