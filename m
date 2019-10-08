Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7DACF66E
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 11:50:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D7C46E575;
	Tue,  8 Oct 2019 09:50:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17DB86E575
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 09:50:38 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id h33so15027170edh.12
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Oct 2019 02:50:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=C4Sn2LyTGlsGA19K26hSD7gSL0yhfZTsKXwzGWxidOw=;
 b=Zn4vYdBolHgTU+oFkLx0vZJLZtoiN+5X5SzmVUFrpj5hTOxUWxc6oHHRFutQPhcFGv
 w/2JnZfmrBXSF6FJt5qD+tU/KXQkJnQqzX8+0GLEWOVS2vaOP7HBV18OinLT5Pukn0GM
 sT2QyyEx2Sc1PCnb/riMdKw7bU5MbJEIoyDDBX98erO1WugajD5TSlaR3j1Vrtrdh6u5
 l2MH+U66ZiqU+E/T3PU7yuisT2XFFqivgANkjIbM+23WiLKGHiRmhq6PFOrKS6cmr+dE
 SkUqGsT44aKxk1L1b3Dg8MRTwsvaivFmEj7/Ogsyh9bK9ap9UGCcgdH73T3JZAmh6IQG
 jk8g==
X-Gm-Message-State: APjAAAW8pDUg164pVlQDwTaVcNj7GyDb5zrOalnKnOnorg3Sm9+P1rQ2
 OLU7AcSJIxWtSkAtMIKK0C1mzw==
X-Google-Smtp-Source: APXvYqxxwv46wDv4YrMe44eoYLbxRseBlpH5ESo6wGFdIoZLrUKolDk67i7SfrnrJf5KjiCdasDY0g==
X-Received: by 2002:a50:a0e2:: with SMTP id 89mr32578116edo.118.1570528236671; 
 Tue, 08 Oct 2019 02:50:36 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id f36sm3799428ede.28.2019.10.08.02.50.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2019 02:50:35 -0700 (PDT)
Date: Tue, 8 Oct 2019 11:50:33 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH] drm: damage_helper: Fix race checking plane->state->fb
Message-ID: <20191008095033.GJ16989@phenom.ffwll.local>
References: <20190904202938.110207-1-sean@poorly.run>
 <CAKMK7uFtcmZd9+wARmYuZwtimUV91fiFXNmr5Nuk4Z65QjHyuA@mail.gmail.com>
 <20190919150401.GV218215@art_vandelay>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190919150401.GV218215@art_vandelay>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=C4Sn2LyTGlsGA19K26hSD7gSL0yhfZTsKXwzGWxidOw=;
 b=DW6ATx9ATvHpBqVvlwMJuJiWB00Uw5JjA9VYNxubhAgGgspFlOt1NGoOVa4KAo+Akx
 nNkHCmpKTYDs/3vdAGM3N8RjTbP1NEYcQbFFj7QwelsUvmRujWeoYiMKIhxmMoOlmFsf
 WdXt3TRnRF7EUMcnuCE477xZrUNKpuQ7tC8CE=
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
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Sean Paul <seanpaul@chromium.org>, stable <stable@vger.kernel.org>,
 Deepak Rawat <drawat@vmware.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMTksIDIwMTkgYXQgMTE6MDQ6MDFBTSAtMDQwMCwgU2VhbiBQYXVsIHdyb3Rl
Ogo+IE9uIFRodSwgU2VwIDA1LCAyMDE5IGF0IDEyOjQxOjI3UE0gKzAyMDAsIERhbmllbCBWZXR0
ZXIgd3JvdGU6Cj4gPiBPbiBXZWQsIFNlcCA0LCAyMDE5IGF0IDEwOjI5IFBNIFNlYW4gUGF1bCA8
c2VhbkBwb29ybHkucnVuPiB3cm90ZToKPiA+ID4KPiA+ID4gRnJvbTogU2VhbiBQYXVsIDxzZWFu
cGF1bEBjaHJvbWl1bS5vcmc+Cj4gPiA+Cj4gPiA+IFNpbmNlIHRoZSBkaXJ0eWZiIGlvY3RsIGRv
ZXNuJ3QgZ2l2ZSB1cyBhbnkgaGludHMgYXMgdG8gd2hpY2ggcGxhbmUgaXMKPiA+ID4gc2Nhbm5p
bmcgb3V0IHRoZSBmYiBpdCdzIG1hcmtpbmcgYXMgZGFtYWdlZCwgd2UgbmVlZCB0byBsb29wIHRo
cm91Z2gKPiA+ID4gcGxhbmVzIHRvIGZpbmQgaXQuCj4gPiA+Cj4gPiA+IEN1cnJlbnRseSB3ZSBq
dXN0IHJlYWNoIGludG8gcGxhbmUgc3RhdGUgYW5kIGNoZWNrLCBidXQgdGhhdCBjYW4gcmFjZQo+
ID4gPiB3aXRoIGFub3RoZXIgY29tbWl0IGNoYW5naW5nIHRoZSBmYiBvdXQgZnJvbSB1bmRlciB1
cy4gVGhpcyBwYXRjaCBsb2Nrcwo+ID4gPiB0aGUgcGxhbmUgYmVmb3JlIGNoZWNraW5nIHRoZSBm
YiBhbmQgd2lsbCByZWxlYXNlIHRoZSBsb2NrIGlmIHRoZSBwbGFuZQo+ID4gPiBpcyBub3QgZGlz
cGxheWluZyB0aGUgZGlydHkgZmIuCj4gPiA+Cj4gPiA+IEZpeGVzOiBiOWZjNWUwMWQxY2UgKCJk
cm06IEFkZCBoZWxwZXIgdG8gaW1wbGVtZW50IGxlZ2FjeSBkaXJ0eWZiIikKPiA+ID4gQ2M6IFJv
YiBDbGFyayA8cm9iZGNsYXJrQGdtYWlsLmNvbT4KPiA+ID4gQ2M6IERlZXBhayBSYXdhdCA8ZHJh
d2F0QHZtd2FyZS5jb20+Cj4gPiA+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZm
d2xsLmNoPgo+ID4gPiBDYzogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29t
Pgo+ID4gPiBDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4Lmlu
dGVsLmNvbT4KPiA+ID4gQ2M6IE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAYm9vdGxpbi5j
b20+Cj4gPiA+IENjOiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4KPiA+ID4gQ2M6IERhdmlk
IEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiA+ID4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmll
bEBmZndsbC5jaD4KPiA+ID4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+
ID4gQ2M6IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPiAjIHY1LjArCj4gPiA+IFJlcG9ydGVkLWJ5
OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IFNl
YW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgo+ID4gPiAtLS0KPiA+ID4gIGRyaXZlcnMv
Z3B1L2RybS9kcm1fZGFtYWdlX2hlbHBlci5jIHwgOCArKysrKysrLQo+ID4gPiAgMSBmaWxlIGNo
YW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4gPgo+ID4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kYW1hZ2VfaGVscGVyLmMgYi9kcml2ZXJzL2dwdS9k
cm0vZHJtX2RhbWFnZV9oZWxwZXIuYwo+ID4gPiBpbmRleCA4MjMwZGFjMDFhODkuLjNhNDEyNmRj
MjUyMCAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9kYW1hZ2VfaGVscGVy
LmMKPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kYW1hZ2VfaGVscGVyLmMKPiA+ID4g
QEAgLTIxMiw4ICsyMTIsMTQgQEAgaW50IGRybV9hdG9taWNfaGVscGVyX2RpcnR5ZmIoc3RydWN0
IGRybV9mcmFtZWJ1ZmZlciAqZmIsCj4gPiA+ICAgICAgICAgZHJtX2Zvcl9lYWNoX3BsYW5lKHBs
YW5lLCBmYi0+ZGV2KSB7Cj4gPiA+ICAgICAgICAgICAgICAgICBzdHJ1Y3QgZHJtX3BsYW5lX3N0
YXRlICpwbGFuZV9zdGF0ZTsKPiA+ID4KPiA+ID4gLSAgICAgICAgICAgICAgIGlmIChwbGFuZS0+
c3RhdGUtPmZiICE9IGZiKQo+ID4gPiArICAgICAgICAgICAgICAgcmV0ID0gZHJtX21vZGVzZXRf
bG9jaygmcGxhbmUtPm11dGV4LCBzdGF0ZS0+YWNxdWlyZV9jdHgpOwo+ID4gPiArICAgICAgICAg
ICAgICAgaWYgKHJldCkKPiA+IAo+ID4gSSB0aGluayBmb3IgcGFyYW5vaWQgc2FmZXR5IHdlIHNo
b3VsZCBoYXZlIGEgV0FSTl9PTihyZXQgPT0gLUVBTFJFQURZKQo+ID4gaGVyZS4gSXQgc2hvdWxk
IGJlIGltcG9zc2libGUsIGJ1dCBpZiBpdCdzIG5vdCBmb3Igc29tZSBvZGRiYWxsCj4gPiByZWFz
b24sIHdlJ2xsIGJsb3cgdXAuCj4gCj4gZHJtX21vZGVzZXRfbG9jayBlYXRzIEVBTFJFQURZIGFu
ZCByZXR1cm5zIDAgZm9yIHRoYXQgY2FzZSwgc28gSSBndWVzcyBpdAo+IGRlcGVuZHMgX2hvd18g
cGFyYW5vaWQgeW91IHdhbnQgdG8gYmUgaGVyZSA6LSkKCkFoIHNpbGx5IG1lLCByLWIgYXMtaXMg
dGhlbi4KLURhbmllbAoKPiAKPiA+IAo+ID4gV2l0aCB0aGF0OiBSZXZpZXdlZC1ieTogRGFuaWVs
IFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+ID4gCj4gPiBCdXQgcGxlYXNlIGdpdmUgdGhpcyBh
IHNwaW4gd2l0aCBzb21lIHdvcmtsb2FkcyBhbmQgdGhlIHd3X211dGV4Cj4gPiBzbG93cGF0aCBk
ZWJ1Z2dpbmcgZW5hYmxlZCwganVzdCB0byBtYWtyZSBzdXJlLgo+IAo+IE9rLCBoYWQgYSBjaGFu
Y2UgdG8gcnVuIHRocm91Z2ggc29tZSB0ZXN0cyB0aGlzIG1vcm5pbmcgd2l0aAo+IENPTkZJR19E
RUJVR19XV19NVVRFWF9TTE9XUEFUSCBhbmQgdGhpbmdzIGxndG0KPiAKPiBTZWFuCj4gCj4gPiAt
RGFuaWVsCj4gPiAKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgZ290byBvdXQ7Cj4gPiA+
ICsKPiA+ID4gKyAgICAgICAgICAgICAgIGlmIChwbGFuZS0+c3RhdGUtPmZiICE9IGZiKSB7Cj4g
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGRybV9tb2Rlc2V0X3VubG9jaygmcGxhbmUtPm11
dGV4KTsKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4gPiA+ICsgICAg
ICAgICAgICAgICB9Cj4gPiA+Cj4gPiA+ICAgICAgICAgICAgICAgICBwbGFuZV9zdGF0ZSA9IGRy
bV9hdG9taWNfZ2V0X3BsYW5lX3N0YXRlKHN0YXRlLCBwbGFuZSk7Cj4gPiA+ICAgICAgICAgICAg
ICAgICBpZiAoSVNfRVJSKHBsYW5lX3N0YXRlKSkgewo+ID4gPiAtLQo+ID4gPiBTZWFuIFBhdWws
IFNvZnR3YXJlIEVuZ2luZWVyLCBHb29nbGUgLyBDaHJvbWl1bSBPUwo+ID4gPgo+ID4gCj4gPiAK
PiA+IC0tIAo+ID4gRGFuaWVsIFZldHRlcgo+ID4gU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENv
cnBvcmF0aW9uCj4gPiArNDEgKDApIDc5IDM2NSA1NyA0OCAtIGh0dHA6Ly9ibG9nLmZmd2xsLmNo
Cj4gCj4gLS0gCj4gU2VhbiBQYXVsLCBTb2Z0d2FyZSBFbmdpbmVlciwgR29vZ2xlIC8gQ2hyb21p
dW0gT1MKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3Jh
dGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
