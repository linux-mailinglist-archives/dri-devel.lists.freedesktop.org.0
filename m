Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9755B74DE3
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 14:14:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D0D26E72E;
	Thu, 25 Jul 2019 12:14:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACDE86E72E
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 12:14:49 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id m10so50021010edv.6
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 05:14:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=xBQlbxU4sIAkZTKOezDDuKJzUoBaUMJjzL90w1I4sJI=;
 b=melR7r0xl5G2HAJPk0+kTBNRG3+oU3oUb9jqKfNUtLESeLSCdEAhv3oY3svSfd2E4q
 lxmaVIGXzh5yDL9t55/HJFcWprr33RlwmggSEamtWa4UMHIvBt6lv4hQKlNbXWMnbDsj
 ec+kY85h6abVKIZJ48TdkiMjgTL/mfi3i7wNJAEzXuQKZF967m1LiiOeIYu4NDwquTC4
 6QIe7ycBJ3D34bzbQe5HEOMPehFro1iPwIgRUiNaDrgn40POo/7Dmx2X7Mxr2AkN0fq8
 jVQXLWn+VWI47wf8CjX0TKX+YYoSYkSwOzTQuSA4Jcotp/hz/Y5ML0uVrO9UeqgqdDN+
 xOtA==
X-Gm-Message-State: APjAAAWTeMn8hDZt1RauhipN54UsoIrAOhNNI5WTdF7icus/vrMmkcif
 0yOuP08Bno4ORpt7KnG/9iw=
X-Google-Smtp-Source: APXvYqxpjLksWwyG57A6QDgvk5QYVTO1S3Bu71l5am95Yyx/jOFyNfHhPMap/yiKB8fT77bOtSzaSQ==
X-Received: by 2002:a50:e618:: with SMTP id y24mr76229999edm.142.1564056888257; 
 Thu, 25 Jul 2019 05:14:48 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id 34sm13374689eds.5.2019.07.25.05.14.46
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 25 Jul 2019 05:14:47 -0700 (PDT)
Date: Thu, 25 Jul 2019 14:14:45 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
Subject: Re: [PATCH 1/1] drm/bridge: vga-dac: Fix detect of monitor connection
Message-ID: <20190725121445.GD15868@phenom.ffwll.local>
Mail-Followup-To: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Igor Opaniuk <igor.opaniuk@toradex.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 "maxime.ripard@free-electrons.com" <maxime.ripard@free-electrons.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
References: <20190725110520.26848-1-oleksandr.suvorov@toradex.com>
 <20190725110520.26848-2-oleksandr.suvorov@toradex.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190725110520.26848-2-oleksandr.suvorov@toradex.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=xBQlbxU4sIAkZTKOezDDuKJzUoBaUMJjzL90w1I4sJI=;
 b=M3t1O2gx3+K3rmn/pg3IKsxF+wMha3/LFiBk1fJtQOwd8o0IqWLiVGplJsSGS0D56s
 9xudBdZ2cfavEGGdm0BxzNjv7mYMR/gZDIdJDMJnpyWgil3kUhBR8OYvLmQzLxtkugQC
 Fvqfzg4SzAyYVYQu3pyILKvHWBdT4P88aG3lU=
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
 Igor Opaniuk <igor.opaniuk@toradex.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "maxime.ripard@free-electrons.com" <maxime.ripard@free-electrons.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdWwgMjUsIDIwMTkgYXQgMTE6MDU6MjRBTSArMDAwMCwgT2xla3NhbmRyIFN1dm9y
b3Ygd3JvdGU6Cj4gRERDIGFuZCBWR0EgY2hhbm5lbHMgYXJlIGluZGVwZW5kZW50LCBhbmQgdGhl
cmVmb3JlCj4gd2UgY2Fubm90IGRlY2lkZSB3aGV0aGVyIHRoZSBtb25pdG9yIGlzIGNvbm5lY3Rl
ZCBvciBub3QsCj4gZGVwZW5kaW5nIG9uIHRoZSBpbmZvcm1hdGlvbiBmcm9tIHRoZSBEREMuCj4g
Cj4gU28gdGhlIG1vbml0b3Igc2hvdWxkIGFsd2F5cyBiZSBjb25zaWRlcmVkIGNvbm5lY3RlZC4K
PiBUaHVzIHRoZXJlIGlzIG5vIHJlYXNvbiB0byB1c2UgY29ubmVjdG9yIGRldGVjdCBjYWxsYmFj
ayBmb3IgdGhpcwo+IGRyaXZlci4KPiAKPiBGaXhlcyBEUk0gZXJyb3Igb2YgZHVtYiBtb25pdG9y
IGRldGVjdGlvbiBsaWtlOgo+IC4uLgo+IERSTTogaGVhZCAnVkdBLTEnIGZvdW5kLCBjb25uZWN0
b3IgMzIgaXMgZGlzY29ubmVjdGVkLgo+IC4uLgo+IAo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwu
b3JnCj4gRml4ZXM6IDU2ZmU4YjZmNDk5MSAoImRybS9icmlkZ2U6IEFkZCBSR0IgdG8gVkdBIGJy
aWRnZSBzdXBwb3J0IikKPiBTaWduZWQtb2ZmLWJ5OiBPbGVrc2FuZHIgU3V2b3JvdiA8b2xla3Nh
bmRyLnN1dm9yb3ZAdG9yYWRleC5jb20+CgpVaCBub3BlIDotKQoKWWVzIFZHQSBtb25pdG9ycyBh
cmUgYnJva2VuLCBidXQgdGhlIHdheSB0byBmaXggdGhhdCBpcyB0byBlaXRoZXIgb3ZlcnJpZGUK
dGhhdCBvbiB0aGUga2VybmVsIGNtZGxpbmUsIG9yIGluIHlvdXIgdXNlcnNwYWNlIHNvbWV3aGVy
ZS4gTm90IGhhcmRjb2RlCnRoaXMgaW4gdGhlIGtlcm5lbCBmb3IgZXZlcnlvbmUuIEJlY2F1c2Ug
bm90IGV2ZXJ5b25lIGRvZXMgaGF2ZSBhIGJyb2tlbgpWR0EgbW9uaXRvciwgYnV0IGlmIHlvdSBk
byB0aGlzIF9ldmVyeV8gZGVza3RvcCB3aWxsIHRyeSB0byBsaWdodCB1cCB0aGF0CmJyb2tlbiBt
b25pdG9yLiBXaGljaCBsZWFkcyB0byBsb3RzIG9mIGJ1ZyByZXBvcnRzIGFuZCByZWdyZXNzaW9u
cy4KClRoaXMgY2FzZSBpcyBleGFjdGx5IHdoYXQgY29ubmVjdG9yX3N0YXR1c191bmtub3duIGlz
IG1lYW50IGZvcjogVGhlCmtlcm5lbCBjb3VsZG4ndCBhdXRob3JpdGF0aXZlbHkgZmlndXJlIG91
dCB3aGV0aGVyIHRoZXJlIGlzIGEgbW9uaXRvciBvcgpub3QuIFVzZXJzcGFjZSBzaG91bGQvY2Fu
IHRyeSB0aGlzIGludG8gYWNjb3VudCBmb3IgYXV0b2NvbmZpZ3VyYXRpb24uCgpOb3RlIGEgbW9y
ZSBwcm9wZXIgZml4IHdvdWxkIGJlIHRvIHNvbWVob3cgd2lyZSB1cCBsb2FkIGRldGVjdGlvbi4g
VGhhdAp3aWxsIHdvcmsgZXZlbiBmb3IgZHVtYiBWR0EgbW9uaXRvcnMsIGFuZCBlLmcuIGk5MTUg
dGhlbiBnaXZlcyB5b3UgYW4KYXV0aG9yaXRhdGl2ZSBjb25uZWN0b3Jfc3RhdHVzX2Rpc2Nvbm5l
Y3RlZCBpZiBpdCBjb3VsZCBleGVjdXRlIGEgbG9hZApkZXRlY3QgY3ljbGUgKG5vdCBhbHdheXMg
cG9zc2libGUgb24gc29tZSBodykgYW5kIHRoZXJlJ3Mgbm8gc2NyZWVuCmRldGVjdGVkIHdpdGgg
dGhhdC4KCk1heWJlIHdlIHNob3VsZCBkb2N1bWVudCB0aGlzIGJldHRlciBzb21ld2hlcmUgaW4g
ZG9jcz8gV291bGQgYmUgZ3JlYXQgaWYKeW91IGNhbiB0eXBlIGEgcGF0Y2ggZm9yIHRoaXMgLi4u
Ci1EYW5pZWwKCj4gLS0tCj4gCj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvZHVtYi12Z2EtZGFj
LmMgfCAxOCAtLS0tLS0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDE4IGRlbGV0aW9u
cygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2R1bWItdmdhLWRh
Yy5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9kdW1iLXZnYS1kYWMuYwo+IGluZGV4IGQzMjg4
NWI5MDZhZS4uZTM3YzE5MzU2ZDEyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2UvZHVtYi12Z2EtZGFjLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2R1bWItdmdh
LWRhYy5jCj4gQEAgLTczLDI1ICs3Myw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Nvbm5l
Y3Rvcl9oZWxwZXJfZnVuY3MgZHVtYl92Z2FfY29uX2hlbHBlcl9mdW5jcyA9IHsKPiAgCS5nZXRf
bW9kZXMJPSBkdW1iX3ZnYV9nZXRfbW9kZXMsCj4gIH07Cj4gIAo+IC1zdGF0aWMgZW51bSBkcm1f
Y29ubmVjdG9yX3N0YXR1cwo+IC1kdW1iX3ZnYV9jb25uZWN0b3JfZGV0ZWN0KHN0cnVjdCBkcm1f
Y29ubmVjdG9yICpjb25uZWN0b3IsIGJvb2wgZm9yY2UpCj4gLXsKPiAtCXN0cnVjdCBkdW1iX3Zn
YSAqdmdhID0gZHJtX2Nvbm5lY3Rvcl90b19kdW1iX3ZnYShjb25uZWN0b3IpOwo+IC0KPiAtCS8q
Cj4gLQkgKiBFdmVuIGlmIHdlIGhhdmUgYW4gSTJDIGJ1cywgd2UgY2FuJ3QgYXNzdW1lIHRoYXQg
dGhlIGNhYmxlCj4gLQkgKiBpcyBkaXNjb25uZWN0ZWQgaWYgZHJtX3Byb2JlX2RkYyBmYWlscy4g
U29tZSBjYWJsZXMgZG9uJ3QKPiAtCSAqIHdpcmUgdGhlIEREQyBwaW5zLCBvciB0aGUgSTJDIGJ1
cyBtaWdodCBub3QgYmUgd29ya2luZyBhdAo+IC0JICogYWxsLgo+IC0JICovCj4gLQlpZiAoIUlT
X0VSUih2Z2EtPmRkYykgJiYgZHJtX3Byb2JlX2RkYyh2Z2EtPmRkYykpCj4gLQkJcmV0dXJuIGNv
bm5lY3Rvcl9zdGF0dXNfY29ubmVjdGVkOwo+IC0KPiAtCXJldHVybiBjb25uZWN0b3Jfc3RhdHVz
X3Vua25vd247Cj4gLX0KPiAtCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9m
dW5jcyBkdW1iX3ZnYV9jb25fZnVuY3MgPSB7Cj4gLQkuZGV0ZWN0CQkJPSBkdW1iX3ZnYV9jb25u
ZWN0b3JfZGV0ZWN0LAo+ICAJLmZpbGxfbW9kZXMJCT0gZHJtX2hlbHBlcl9wcm9iZV9zaW5nbGVf
Y29ubmVjdG9yX21vZGVzLAo+ICAJLmRlc3Ryb3kJCT0gZHJtX2Nvbm5lY3Rvcl9jbGVhbnVwLAo+
ICAJLnJlc2V0CQkJPSBkcm1fYXRvbWljX2hlbHBlcl9jb25uZWN0b3JfcmVzZXQsCj4gLS0gCj4g
Mi4yMC4xCj4gCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29y
cG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
