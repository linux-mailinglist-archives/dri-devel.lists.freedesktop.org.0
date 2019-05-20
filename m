Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF07923E7A
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2019 19:25:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEC2089219;
	Mon, 20 May 2019 17:25:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC9238921C
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 17:25:40 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id j49so13671671otc.13
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 10:25:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=p+IGewVPK/3sUNtWjN0J1v9qG0o9ZctDOQFJRjZs3v4=;
 b=nGIYUpfajXosCesuGKBlcWQ4zW8KVWQ2aVd2xRT7MmW5kM6CPx1jfZxGVb04g/BRkX
 FxbM/dVvdo7SzePfRS/TjgyjNEXBumuPmoIFV60egVsrZduNsLnf7dtF8YsHF0g7p92Y
 8P2MVv/bjI3+2MKtGMgipMu6xCWusPvET3GCZ/oQELWl2YsaLYmXZrWXu4XXFnjtUbcq
 3uNSc06PZR6O6FG1Ws5ZJT/mR5RyCzyuOBSATUQBIJQdAdfi2xdg7YJJKma1N1a1UReh
 xsy2CQ4qZa3i4QgasYQQVJmbSq6mcxWSwJW6f/KJSINWw7s+8e09wRe8fy9XloXFy8V1
 yaOQ==
X-Gm-Message-State: APjAAAXp6TEiMMxqG7aX0jN7gBrToHJc0NrZWDD3wPJV7duW/eC629dw
 BvR9M5FOU/0a0xszOPTOIyL57gxGXiU5VZENLdjvug==
X-Google-Smtp-Source: APXvYqzVxIgdQlO/YdvYOV5mGXBZTR4aGXDhff4jSmBlpuQLUW6acY4OVOfHwYJiTVqpqlqr4sTv4zfSpLMjUvn/RH0=
X-Received: by 2002:a9d:7414:: with SMTP id n20mr18557548otk.106.1558373139972; 
 Mon, 20 May 2019 10:25:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190520082216.26273-1-daniel.vetter@ffwll.ch>
 <20190520082216.26273-11-daniel.vetter@ffwll.ch>
 <20190520170820.GA27230@ravnborg.org>
In-Reply-To: <20190520170820.GA27230@ravnborg.org>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Mon, 20 May 2019 19:25:28 +0200
Message-ID: <CAKMK7uHQo83UZmkV=gd3hHCMpusSdK_6O_UQnnHdSm+kLMgmmA@mail.gmail.com>
Subject: Re: [PATCH 10/33] fbcon: call fbcon_fb_(un)registered directly
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=p+IGewVPK/3sUNtWjN0J1v9qG0o9ZctDOQFJRjZs3v4=;
 b=MxkyDNPTF+GcBwtvga785KdKzkeJok9neVtLb0YWhEJFqdZvQ3jCn1KUbxAtA/EC7e
 ikhd2kpZAoHjIzLMMH9EWQ3PMGbYb4S8mIo2pyOdOdW338UMv3Ze/uuBHSwaQNk49O6k
 CaXpO9mH/y6qSHuYZ+HZtmDe2Tw/P5rQssSV0=
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Yisheng Xie <ysxie@foxmail.com>, Hans de Goede <hdegoede@redhat.com>,
 Mikulas Patocka <mpatocka@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXkgMjAsIDIwMTkgYXQgNzowOCBQTSBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9y
Zy5vcmc+IHdyb3RlOgo+Cj4gSGkgRGFuaWVsLgo+Cj4gV2hpbGUgYnJvd3NpbmcgdGhpcyBuaWNl
IHBhdGNoIHNlcmllcyBJIHN0dW1ibGVkIHVwb24gYSBkZXRhaWwuCj4KPiBPbiBNb24sIE1heSAy
MCwgMjAxOSBhdCAxMDoyMTo1M0FNICswMjAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+ID4gV2l0
aAo+ID4KPiA+IGNvbW1pdCA2MTA0YzM3MDk0ZTcyOWYzZDRjZTY1Nzk3MDAyMTEyNzM1ZDQ5Y2Qx
Cj4gPiBBdXRob3I6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cj4gPiBE
YXRlOiAgIFR1ZSBBdWcgMSAxNzozMjowNyAyMDE3ICswMjAwCj4gPgo+ID4gICAgIGZiY29uOiBN
YWtlIGZiY29uIGEgYnVpbHQtdGltZSBkZXBlbmN5IGZvciBmYmRldgo+ID4KPiA+IHdlIGhhdmUg
YSBzdGF0aWMgZGVwZW5kZW5jeSBiZXR3ZWVuIGZiY29uIGFuZCBmYmRldiwgYW5kIHdlIGNhbgo+
ID4gcmVwbGFjZSB0aGUgaW5kaXJlY3Rpb24gdGhyb3VnaCB0aGUgbm90aWZpZXIgY2hhaW4gd2l0
aCBhIGZ1bmN0aW9uCj4gPiBjYWxsLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0
ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgo+ID4gQ2M6IEJhcnRsb21pZWogWm9sbmllcmtp
ZXdpY3ogPGIuem9sbmllcmtpZUBzYW1zdW5nLmNvbT4KPiA+IENjOiBEYW5pZWwgVmV0dGVyIDxk
YW5pZWwudmV0dGVyQGZmd2xsLmNoPgo+ID4gQ2M6IEhhbnMgZGUgR29lZGUgPGhkZWdvZWRlQHJl
ZGhhdC5jb20+Cj4gPiBDYzogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0
aW9uLm9yZz4KPiA+IENjOiAiTm9yYWxmIFRyw7hubmVzIiA8bm9yYWxmQHRyb25uZXMub3JnPgo+
ID4gQ2M6IFlpc2hlbmcgWGllIDx5c3hpZUBmb3htYWlsLmNvbT4KPiA+IENjOiBQZXRlciBSb3Np
biA8cGVkYUBheGVudGlhLnNlPgo+ID4gQ2M6ICJNaWNoYcWCIE1pcm9zxYJhdyIgPG1pcnEtbGlu
dXhAcmVyZS5xbXFtLnBsPgo+ID4gQ2M6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBz
dXNlLmRlPgo+ID4gQ2M6IE1pa3VsYXMgUGF0b2NrYSA8bXBhdG9ja2FAcmVkaGF0LmNvbT4KPiA+
IENjOiBsaW51eC1mYmRldkB2Z2VyLmtlcm5lbC5vcmcKPiA+IC0tLQo+ID4gZGlmZiAtLWdpdCBh
L2luY2x1ZGUvbGludXgvZmIuaCBiL2luY2x1ZGUvbGludXgvZmIuaAo+ID4gaW5kZXggZjUyZWYw
YWQ2NzgxLi43MDFhYmFmNzljODcgMTAwNjQ0Cj4gPiAtLS0gYS9pbmNsdWRlL2xpbnV4L2ZiLmgK
PiA+ICsrKyBiL2luY2x1ZGUvbGludXgvZmIuaAo+ID4gQEAgLTEzNiwxMCArMTM2LDYgQEAgc3Ry
dWN0IGZiX2N1cnNvcl91c2VyIHsKPiA+ICAjZGVmaW5lIEZCX0VWRU5UX1JFU1VNRSAgICAgICAg
ICAgICAgICAgICAgICAweDAzCj4gPiAgLyogICAgICBBbiBlbnRyeSBmcm9tIHRoZSBtb2RlbGlz
dCB3YXMgcmVtb3ZlZCAqLwo+ID4gICNkZWZpbmUgRkJfRVZFTlRfTU9ERV9ERUxFVEUgICAgICAg
ICAgICAweDA0Cj4gPiAtLyogICAgICBBIGRyaXZlciByZWdpc3RlcmVkIGl0c2VsZiAqLwo+ID4g
LSNkZWZpbmUgRkJfRVZFTlRfRkJfUkVHSVNURVJFRCAgICAgICAgICAweDA1Cj4gPiAtLyogICAg
ICBBIGRyaXZlciB1bnJlZ2lzdGVyZWQgaXRzZWxmICovCj4gPiAtI2RlZmluZSBGQl9FVkVOVF9G
Ql9VTlJFR0lTVEVSRUQgICAgICAgIDB4MDYKPiA+ICAvKiAgICAgIENPTlNPTEUtU1BFQ0lGSUM6
IGdldCBjb25zb2xlIHRvIGZyYW1lYnVmZmVyIG1hcHBpbmcgKi8KPiA+ICAjZGVmaW5lIEZCX0VW
RU5UX0dFVF9DT05TT0xFX01BUCAgICAgICAgMHgwNwo+ID4gIC8qICAgICAgQ09OU09MRS1TUEVD
SUZJQzogc2V0IGNvbnNvbGUgdG8gZnJhbWVidWZmZXIgbWFwcGluZyAqLwo+Cj4gVGhpcyBicmVh
a3MgYnVpbGQgb2YgYXJjaC9hcm0vbWFjaC1weGEvYW0yMDBlcGQuYyB0aGF0cyB1c2VzCj4gRkJf
RVZFTlRfRkJfKlJFR0lTVEVSRUQ6Cj4KPgo+ICAgICAgICBpZiAoZXZlbnQgPT0gRkJfRVZFTlRf
RkJfUkVHSVNURVJFRCkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIGFtMjAwX3NoYXJlX3ZpZGVv
X21lbShpbmZvKTsKPiAgICAgICAgIGVsc2UgaWYgKGV2ZW50ID09IEZCX0VWRU5UX0ZCX1VOUkVH
SVNURVJFRCkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIGFtMjAwX3Vuc2hhcmVfdmlkZW9fbWVt
KGluZm8pOwo+Cj4KPiBGb3VuZCB3aGlsZSBncmVwcGluZyBmb3IgIkZCX0VWRU5UIiBzbyB0aGlz
IGlzIG5vdCBhIGJ1aWxkCj4gZXJyb3IgSSB0cmlnZ2VyZWQuCgpPaCB0aGlzIGlzIGdsb3Jpb3Vz
IDotLwoKVGhhbmtzIGEgbG90IGZvciBzcG90dGluZyB0aGlzLCBJIGd1ZXNzIEkgbmVlZCB0byBo
YWNrIGFyb3VuZCBvbgptZXRyb25vbWVmYiBhIGJpdCAuLi4KLURhbmllbAotLSAKRGFuaWVsIFZl
dHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KKzQxICgwKSA3OSAzNjUg
NTcgNDggLSBodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
