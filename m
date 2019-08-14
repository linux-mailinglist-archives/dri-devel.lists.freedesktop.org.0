Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 900708E6DA
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:37:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E00F6E936;
	Thu, 15 Aug 2019 08:35:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A26816E5F8
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 14:39:23 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id u17so53182762pgi.6
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 07:39:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=JMUiHJTsAwSZagRv5u1mIW6VordoKt5B7sVmqdI/15I=;
 b=qEqBTcIoF6JRe3sj8BEeB0aMYqi+SQ0tBYR0Utf2FVUNxN/pufEGN4uXMx7gmZKqFZ
 1TDT1TYo6XRaJzUolpOQdqBBTyD6BHpC/Re6zjDQUcCaYAs0fjkexWxbyvcDxxXp8n6p
 TDaf8pm8FXZ7Lfc/mMJZuq4zjJPy2SjSNJRS9mSB4hTE7MlKe2uJov+iynaqMoaKkKK5
 egJLzQ3e6AwPZHZBDLX5Ln8Z3PF38RFXyTqQEtUGLRaXVvrFN6ktXPe1Oqxqhuw2L2/v
 M7k8cV+uzf8GRXIRA/95WhDW6seJnrl2vMJrKFoLeXbuThFEcbhzQwam8ChQc435AJaa
 fdEA==
X-Gm-Message-State: APjAAAUzjIy8R8hu3c0KXpRSsqgBoqbFKE+7xDwGaQoHaiMmmvHLutA7
 4SF/mWM4394lR4gZfkNdzLw=
X-Google-Smtp-Source: APXvYqxk9+PaPbwX9l+cfmGnvelXdoXFkB7yG+lB9YLeeCMPwLcf50CVzSOElPfZ/oV7p8L2OX4rDQ==
X-Received: by 2002:a63:2a08:: with SMTP id q8mr38916870pgq.415.1565793563173; 
 Wed, 14 Aug 2019 07:39:23 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id e9sm6411280pge.39.2019.08.14.07.39.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 14 Aug 2019 07:39:22 -0700 (PDT)
Date: Wed, 14 Aug 2019 07:39:20 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH] drm/bridge: dumb-vga-dac: Fix dereferencing -ENODEV DDC
 channel
Message-ID: <20190814143920.GA30613@roeck-us.net>
References: <20190813093046.4976-1-geert+renesas@glider.be>
 <29ff3bfd-57ee-9c64-3706-555edc8b4675@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <29ff3bfd-57ee-9c64-3706-555edc8b4675@baylibre.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Approved-At: Thu, 15 Aug 2019 08:34:58 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=JMUiHJTsAwSZagRv5u1mIW6VordoKt5B7sVmqdI/15I=;
 b=Vn4hhpuFqTeNWbD1F1Eoy7rzWzynqyLG1XMGKCAH3ubHPbZRAA4jB/RmnUSR84PPEW
 iTYdoIJ1SPh1+s2JwNE2rD++IJwZT+krmtVTN5MFNapPOXbvxv7QScwACsW5fypf0/3U
 MHl3u5XPur/ap7gR3F5Z1PxeGaV4mmkdLvQLdRtkFztAW5p9m+XO/IwIVo1fTubSgP4G
 kC1ufrogrl6I4DZQX//noYCuMJntbF+i29tznjywK1nWrJ+sLJLOnDQL/acV34tOXj3I
 5UcfRFHzKIW/rWaAFXKNeh63SHPoqljaggm4WWeBkXPvyqLj6kGPYQHT1ISKh3/qgEBn
 lQ6g==
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 linux-renesas-soc@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMTMsIDIwMTkgYXQgMDI6MDE6MjZQTSArMDIwMCwgTmVpbCBBcm1zdHJvbmcg
d3JvdGU6Cj4gSGksCj4gCj4gCj4gT24gMTMvMDgvMjAxOSAxMTozMCwgR2VlcnQgVXl0dGVyaG9l
dmVuIHdyb3RlOgo+ID4gSWYgdGhlIFZHQSBjb25uZWN0b3IgaGFzIG5vIEREQyBjaGFubmVsLCBh
biBlcnJvciBwb2ludGVyIHdpbGwgYmUKPiA+IGRlcmVmZXJlbmNlZCwgZS5nLiBvbiBTYWx2YXRv
ci1YUzoKPiA+IAo+ID4gICAgIFVuYWJsZSB0byBoYW5kbGUga2VybmVsIE5VTEwgcG9pbnRlciBk
ZXJlZmVyZW5jZSBhdCB2aXJ0dWFsIGFkZHJlc3MgMDAwMDAwMDAwMDAwMDE3ZAo+ID4gICAgIC4u
Lgo+ID4gICAgIENhbGwgdHJhY2U6Cj4gPiAgICAgIHN5c2ZzX2RvX2NyZWF0ZV9saW5rX3NkLmlz
cmEuMCsweDQwLzB4MTA4Cj4gPiAgICAgIHN5c2ZzX2NyZWF0ZV9saW5rKzB4MjAvMHg0MAo+ID4g
ICAgICBkcm1fc3lzZnNfY29ubmVjdG9yX2FkZCsweGE4LzB4YzgKPiA+ICAgICAgZHJtX2Nvbm5l
Y3Rvcl9yZWdpc3Rlci5wYXJ0LjMrMHg1NC8weGIwCj4gPiAgICAgIGRybV9jb25uZWN0b3JfcmVn
aXN0ZXJfYWxsKzB4YjAvMHhkMAo+ID4gICAgICBkcm1fbW9kZXNldF9yZWdpc3Rlcl9hbGwrMHg1
NC8weDg4Cj4gPiAgICAgIGRybV9kZXZfcmVnaXN0ZXIrMHgxOGMvMHgxZDgKPiA+ICAgICAgcmNh
cl9kdV9wcm9iZSsweGU0LzB4MTUwCj4gPiAgICAgIC4uLgo+ID4gCj4gPiBUaGlzIGhhcHBlbnMg
YmVjYXVzZSB2Z2EtPmRkYyBlaXRoZXIgY29udGFpbnMgYSB2YWxpZCBEREMgY2hhbm5lbAo+ID4g
cG9pbnRlciwgb3IgLUVOT0RFViwgYW5kIGRybV9jb25uZWN0b3JfaW5pdF93aXRoX2RkYygpIGV4
cGVjdHMgYSB2YWxpZAo+ID4gRERDIGNoYW5uZWwgcG9pbnRlciwgb3IgTlVMTC4KPiA+IAo+ID4g
Rml4IHRoaXMgYnkgcmVzZXR0aW5nIHZnYS0+ZGRjIHRvIE5VTEwgaW4gY2FzZSBvZiAtRU5PREVW
LCBhbmQgcmVwbGFjaW5nCj4gPiB0aGUgZXhpc3RpbmcgZXJyb3IgY2hlY2tzIGJ5IG5vbi1OVUxM
IGNoZWNrcy4KPiA+IFRoaXMgaXMgc2ltaWxhciB0byB3aGF0IHRoZSBIRE1JIGNvbm5lY3RvciBk
cml2ZXIgZG9lcy4KPiA+IAo+ID4gRml4ZXM6IGE0ZjkwODdlODVkZTE0MWUgKCJkcm0vYnJpZGdl
OiBkdW1iLXZnYS1kYWM6IFByb3ZpZGUgZGRjIHN5bWxpbmsgaW4gY29ubmVjdG9yIHN5c2ZzIGRp
cmVjdG9yeSIpCj4gPiBTaWduZWQtb2ZmLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3Jl
bmVzYXNAZ2xpZGVyLmJlPgo+ID4gLS0tCj4gPiBBbiBhbHRlcm5hdGl2ZSB3b3VsZCBiZSB0byBj
aGVjayBpZiB2Z2EtPmRkYyBjb250YWlucyBhbiBlcnJvciBwb2ludGVyLAo+ID4gYW5kIGNhbGxp
bmcgZHJtX2Nvbm5lY3Rvcl9pbml0KCkgaW5zdGVhZCBvZgo+ID4gZHJtX2Nvbm5lY3Rvcl9pbml0
X3dpdGhfZGRjKCksIGxpa2UgYmVmb3JlLgo+ID4gLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS9kdW1iLXZnYS1kYWMuYyB8IDcgKysrKy0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0IGlu
c2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL2R1bWItdmdhLWRhYy5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9k
dW1iLXZnYS1kYWMuYwo+ID4gaW5kZXggOGVmNjUzOWFlNzhhNmViMy4uN2FhNzg5YzM1ODgyOWIw
NSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvZHVtYi12Z2EtZGFjLmMK
PiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvZHVtYi12Z2EtZGFjLmMKPiA+IEBAIC00
Miw3ICs0Miw3IEBAIHN0YXRpYyBpbnQgZHVtYl92Z2FfZ2V0X21vZGVzKHN0cnVjdCBkcm1fY29u
bmVjdG9yICpjb25uZWN0b3IpCj4gPiAgCXN0cnVjdCBlZGlkICplZGlkOwo+ID4gIAlpbnQgcmV0
Owo+ID4gIAo+ID4gLQlpZiAoSVNfRVJSKHZnYS0+ZGRjKSkKPiA+ICsJaWYgKCF2Z2EtPmRkYykK
PiA+ICAJCWdvdG8gZmFsbGJhY2s7Cj4gPiAgCj4gPiAgCWVkaWQgPSBkcm1fZ2V0X2VkaWQoY29u
bmVjdG9yLCB2Z2EtPmRkYyk7Cj4gPiBAQCAtODQsNyArODQsNyBAQCBkdW1iX3ZnYV9jb25uZWN0
b3JfZGV0ZWN0KHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsIGJvb2wgZm9yY2UpCj4g
PiAgCSAqIHdpcmUgdGhlIEREQyBwaW5zLCBvciB0aGUgSTJDIGJ1cyBtaWdodCBub3QgYmUgd29y
a2luZyBhdAo+ID4gIAkgKiBhbGwuCj4gPiAgCSAqLwo+ID4gLQlpZiAoIUlTX0VSUih2Z2EtPmRk
YykgJiYgZHJtX3Byb2JlX2RkYyh2Z2EtPmRkYykpCj4gPiArCWlmICh2Z2EtPmRkYyAmJiBkcm1f
cHJvYmVfZGRjKHZnYS0+ZGRjKSkKPiA+ICAJCXJldHVybiBjb25uZWN0b3Jfc3RhdHVzX2Nvbm5l
Y3RlZDsKPiA+ICAKPiA+ICAJcmV0dXJuIGNvbm5lY3Rvcl9zdGF0dXNfdW5rbm93bjsKPiA+IEBA
IC0xOTcsNiArMTk3LDcgQEAgc3RhdGljIGludCBkdW1iX3ZnYV9wcm9iZShzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlICpwZGV2KQo+ID4gIAkJaWYgKFBUUl9FUlIodmdhLT5kZGMpID09IC1FTk9ERVYp
IHsKPiA+ICAJCQlkZXZfZGJnKCZwZGV2LT5kZXYsCj4gPiAgCQkJCSJObyBpMmMgYnVzIHNwZWNp
ZmllZC4gRGlzYWJsaW5nIEVESUQgcmVhZG91dFxuIik7Cj4gPiArCQkJdmdhLT5kZGMgPSBOVUxM
Owo+ID4gIAkJfSBlbHNlIHsKPiA+ICAJCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJDb3VsZG4ndCBy
ZXRyaWV2ZSBpMmMgYnVzXG4iKTsKPiA+ICAJCQlyZXR1cm4gUFRSX0VSUih2Z2EtPmRkYyk7Cj4g
PiBAQCAtMjE4LDcgKzIxOSw3IEBAIHN0YXRpYyBpbnQgZHVtYl92Z2FfcmVtb3ZlKHN0cnVjdCBw
bGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gPiAgCj4gPiAgCWRybV9icmlkZ2VfcmVtb3ZlKCZ2Z2Et
PmJyaWRnZSk7Cj4gPiAgCj4gPiAtCWlmICghSVNfRVJSKHZnYS0+ZGRjKSkKPiA+ICsJaWYgKHZn
YS0+ZGRjKQo+ID4gIAkJaTJjX3B1dF9hZGFwdGVyKHZnYS0+ZGRjKTsKPiA+ICAKPiA+ICAJcmV0
dXJuIDA7Cj4gPiAKPiAKPiBMb29rcyBzYW5lLAo+IAo+IFJldmlld2VkLWJ5OiBOZWlsIEFybXN0
cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+Cj4gCj4gR3VlbnRlciwgY2FuIHlvdSBjb25m
aXJtIGl0IGFsc28gZml4ZXMgcWVtdTp2ZXJzYXRpbGVwYiA/Cj4gCgpZZXMsIGl0IGRvZXMuCgpU
ZXN0ZWQtYnk6IEd1ZW50ZXIgUm9lY2sgPGxpbnV4QHJvZWNrLXVzLm5ldD4KCkd1ZW50ZXIKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
