Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 116713BDCB
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2019 22:51:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F356890B3;
	Mon, 10 Jun 2019 20:51:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EEB6890B3
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2019 20:51:27 +0000 (UTC)
Received: by mail-vs1-xe41.google.com with SMTP id n2so6466738vso.6
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2019 13:51:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eyYkEWRj0YJV5ZLI8Mg19WpHWifRtrV4TMHZVE8qPm8=;
 b=eq+gInHJeUkN7bHYfsM23gusErqR0P0Rpz+iZmO72pseL3ucb62xixkoC29fEOp9P+
 znaqNKHAzBVJ/glHKY0Z/zkcAAZJDZCPoHNxf0RxmE9vH5K8TsUpaoUD4O5QuWApW3KW
 gTwmSOh2eW2u9i6MacpC6n3pFTPeEJPPJhRh4EW8rgjCyAvw2ZCHkmicx4cxfWzlKn1n
 YKfZONWmR6Gq9poudabz3RBbZIDi575NgaCrUI/L9ukO12fosQfmOaGvuzmQcaHzZWQ1
 Xh3Jo22ihmulZ1RUeZCILiHivs5dpYcx9u57OkrbHhNweqb2ZwmmhfRVuIX+aPbJDk1c
 YdVw==
X-Gm-Message-State: APjAAAWvqMzPFVJw6P3q9vv5dBwop+R7eoBYinS5Q+XBycuaJpdsVSiD
 H7QWLVXFHyzqbrvimqwi+q41ga+pJu3HFFPyPUcZ08wP360=
X-Google-Smtp-Source: APXvYqxHiF7j7PUoNqVyn9OY/HQVtXAWopKiEj3RQFyhF+xmBBltqTuNBj9BhxevhFCKpkFJxP+TtW+cFT392wT7E5c=
X-Received: by 2002:a67:6b43:: with SMTP id g64mr28426206vsc.183.1560199886317; 
 Mon, 10 Jun 2019 13:51:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190610175234.196844-1-dianders@chromium.org>
In-Reply-To: <20190610175234.196844-1-dianders@chromium.org>
From: Sean Paul <sean@poorly.run>
Date: Mon, 10 Jun 2019 16:50:50 -0400
Message-ID: <CAMavQKLRm8uYu3O=co5Ui7YjkK0hKHAd=+TA0oExfqnLc+TLFA@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge/synopsys: dw-hdmi: Fix unwedge crash when no
 pinctrl entries
To: Douglas Anderson <dianders@chromium.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=eyYkEWRj0YJV5ZLI8Mg19WpHWifRtrV4TMHZVE8qPm8=;
 b=NC0Ym/mdsDncoZDorvKAM6xnQHqO/QrBZMSByQ87DFOKOY5LektD3i2fXTPFMV5gEb
 B+jz+3Dd13t7MZNh2lFBrzF3VPLx1KIsiagqMIMYyENWW6PDVua6vokHuxp4iRB7SGBP
 oFhMiqoPRQF0lp325kHJWPXC+dup4oIV+FxnM24bVaa7URJymXv0UBdm6axvZ/7SXM0V
 KpHpsjeDDyeZoP+I9UaJoBhGziX7ec09BY4mQMov6WeiEnm+l5+JUFxqG2hd7MI5PM0F
 5X61FbBw9ul1y43HMTwi6J7dygh1JPsAue+OITbRaSvfqs4rtsLSqXqhyOol/LAVEb3N
 Mc1g==
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
Cc: David Airlie <airlied@linux.ie>, Jonas Karlman <jonas@kwiboo.se>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Thomas Gleixner <tglx@linutronix.de>, Sam Ravnborg <sam@ravnborg.org>,
 Erico Nunes <nunes.erico@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMTAsIDIwMTkgYXQgMTo1MiBQTSBEb3VnbGFzIEFuZGVyc29uIDxkaWFuZGVy
c0BjaHJvbWl1bS5vcmc+IHdyb3RlOgo+Cj4gSW4gY29tbWl0IDUwZjk0OTVlZmUzMCAoImRybS9i
cmlkZ2Uvc3lub3BzeXM6IGR3LWhkbWk6IEFkZCAidW53ZWRnZSIKPiBmb3IgZGRjIGJ1cyIpIEkg
c3R1cGlkbHkgdXNlZCBJU19FUlIoKSB0byBjaGVjayBmb3Igd2hldGhlciB3ZSBoYXZlIGFuCj4g
InVud2VkZ2UiIHBpbmN0cmwgc3RhdGUgZXZlbiB0aG91Z2ggb24gbW9zdCBmbG93cyB0aHJvdWdo
IHRoZSBkcml2ZXIKPiB0aGUgdW53ZWRnZSBzdGF0ZSB3aWxsIGp1c3QgYmUgTlVMTC4KPgo+IEZp
eCBpdCBzbyB0aGF0IHdlIGNvbnNpc3RlbnRseSB1c2UgTlVMTCBmb3Igbm8gdW53ZWRnZSBzdGF0
ZS4KPgo+IEZpeGVzOiA1MGY5NDk1ZWZlMzAgKCJkcm0vYnJpZGdlL3N5bm9wc3lzOiBkdy1oZG1p
OiBBZGQgInVud2VkZ2UiIGZvciBkZGMgYnVzIikKPiBSZXBvcnRlZC1ieTogRXJpY28gTnVuZXMg
PG51bmVzLmVyaWNvQGdtYWlsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBEb3VnbGFzIEFuZGVyc29u
IDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+CgpUaGFua3MgRXJpY28gZm9yIHRoZSByZXBvcnQsIGFu
ZCBEb3VnIGZvciBmaXhpbmcgdGhpcyB1cCBxdWlja2x5LCBJJ3ZlIGFwcGxpZWQKdGhlIHBhdGNo
IHRvIGRybS1taXNjLW5leHQKClNlYW4KCj4gLS0tCj4KPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS9zeW5vcHN5cy9kdy1oZG1pLmMgfCAxNCArKysrKysrKy0tLS0tLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgOCBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jIGIvZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMKPiBpbmRleCBmMjVlMDkxYjkzYzUuLjVlNGU5NDA4ZDAw
ZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWku
Ywo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jCj4gQEAg
LTI1MSw3ICsyNTEsNyBAQCBzdGF0aWMgdm9pZCBkd19oZG1pX2kyY19pbml0KHN0cnVjdCBkd19o
ZG1pICpoZG1pKQo+ICBzdGF0aWMgYm9vbCBkd19oZG1pX2kyY191bndlZGdlKHN0cnVjdCBkd19o
ZG1pICpoZG1pKQo+ICB7Cj4gICAgICAgICAvKiBJZiBubyB1bndlZGdlIHN0YXRlIHRoZW4gZ2l2
ZSB1cCAqLwo+IC0gICAgICAgaWYgKElTX0VSUihoZG1pLT51bndlZGdlX3N0YXRlKSkKPiArICAg
ICAgIGlmICghaGRtaS0+dW53ZWRnZV9zdGF0ZSkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIGZh
bHNlOwo+Cj4gICAgICAgICBkZXZfaW5mbyhoZG1pLT5kZXYsICJBdHRlbXB0aW5nIHRvIHVud2Vk
Z2Ugc3R1Y2sgaTJjIGJ1c1xuIik7Cj4gQEAgLTI2ODYsMTEgKzI2ODYsMTMgQEAgX19kd19oZG1p
X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYsCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgaGRtaS0+ZGVmYXVsdF9zdGF0ZSA9Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBwaW5jdHJsX2xvb2t1cF9zdGF0ZShoZG1pLT5waW5jdHJsLCAiZGVmYXVsdCIpOwo+Cj4g
LSAgICAgICAgICAgICAgICAgICAgICAgaWYgKElTX0VSUihoZG1pLT5kZWZhdWx0X3N0YXRlKSAm
Jgo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAhSVNfRVJSKGhkbWktPnVud2VkZ2Vfc3Rh
dGUpKSB7Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkZXZfd2FybihkZXYsCj4g
LSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiVW53ZWRnZSByZXF1aXJl
cyBkZWZhdWx0IHBpbmN0cmxcbiIpOwo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
aGRtaS0+dW53ZWRnZV9zdGF0ZSA9IEVSUl9QVFIoLUVOT0RFVik7Cj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgaWYgKElTX0VSUihoZG1pLT5kZWZhdWx0X3N0YXRlKSB8fAo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICBJU19FUlIoaGRtaS0+dW53ZWRnZV9zdGF0ZSkpIHsKPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGlmICghSVNfRVJSKGhkbWktPnVud2VkZ2Vfc3RhdGUp
KQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkZXZfd2FybihkZXYs
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJVbndl
ZGdlIHJlcXVpcmVzIGRlZmF1bHQgcGluY3RybFxuIik7Cj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBoZG1pLT5kZWZhdWx0X3N0YXRlID0gTlVMTDsKPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGhkbWktPnVud2VkZ2Vfc3RhdGUgPSBOVUxMOwo+ICAgICAgICAgICAg
ICAgICAgICAgICAgIH0KPiAgICAgICAgICAgICAgICAgfQo+Cj4gLS0KPiAyLjIyLjAucmMyLjM4
My5nZjRmYmJmMzBjMi1nb29nCj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
