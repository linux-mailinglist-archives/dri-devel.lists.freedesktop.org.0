Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F28AF12EA
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 10:52:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 005506EC94;
	Wed,  6 Nov 2019 09:52:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFFC66EC93
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 09:52:18 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id w18so24953813wrt.3
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Nov 2019 01:52:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=uCkx2NozxMaeNkrsz7EMpm21ukg71K77/waY5+1TSls=;
 b=hC/ag4PPzYCRJ/CtHqwldmb32e6RIpCS3sj/P/MXHU/PEW/80fexebKItcGAWlbEpx
 Bzpgpo9nY8AlcfWtGVA1yqctOCfCFananl1c/opUbKlBWpRDgWjmwbRYK281wqGj5iaS
 wvbK+eMttxAmtOGXOIJfBH+GULZMytScHnNkjFSSJiuwQYnUcQ25qfdnkSxCxbfPLamW
 GMQbDeaa2l+USnOEgUlGpxM01aEbCSZ7lDYxeXA35B06cWExrXm1Pj7YCkF3uxIdu13S
 4U6tR2C/NXydYG46xnNrcvpOS7A6J9ouNSHC0uKx1mJMWirztZWpEZehvztzvy0D77S4
 XrlQ==
X-Gm-Message-State: APjAAAWjij4cCsKQwI+pOFLKFv2NkwebE+wRj3+QSQxSsPo+CJGcPGLI
 uu2268JykGY5ng6nVMWG39yHBSqIZv0=
X-Google-Smtp-Source: APXvYqy8SOiPH2SZzS90gKSp/dp4epdL+H8v3Vlhplrbbnp18EozMW5rOerNGE8QMR95g/PO5WVynA==
X-Received: by 2002:adf:8011:: with SMTP id 17mr1804211wrk.367.1573033937277; 
 Wed, 06 Nov 2019 01:52:17 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id u4sm13466822wrq.22.2019.11.06.01.52.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2019 01:52:16 -0800 (PST)
Date: Wed, 6 Nov 2019 10:51:32 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] drm/bridge: ti-tfp410: switch to using
 fwnode_gpiod_get_index()
Message-ID: <20191106095132.GA23790@phenom.ffwll.local>
Mail-Followup-To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 David Airlie <airlied@linux.ie>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20191014184320.GA161094@dtor-ws> <20191105004050.GU57214@dtor-ws>
 <CACRpkdak-gW9+OV-SZQVNNi5BuyNzkjkKvHmYp2+eYq4vu2nyg@mail.gmail.com>
 <CAKMK7uG7FQ3bDWsTxq0n8Osh7jjws5ia3PFJXvDdo=nxKu7+Ng@mail.gmail.com>
 <20191105195323.GC4869@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191105195323.GC4869@pendragon.ideasonboard.com>
X-Operating-System: Linux phenom 5.2.0-3-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=uCkx2NozxMaeNkrsz7EMpm21ukg71K77/waY5+1TSls=;
 b=WCwD54c3npOPHXAP4xGIZoi+KxNI0Wra0FUQc+WOKuP65BTREKcW1l2Px8Cy5d7Hvf
 RsnnX7VENbarQfmGgwgmypWiHj4Noz1Ts34CB2uRBr36vyCBKg3YP1rnO8oJ2+hKTnnA
 2mcXMzgkd/9aX8Mm+HBqytVbf8+3bOW6tICyY=
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
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMDUsIDIwMTkgYXQgMDk6NTM6MjNQTSArMDIwMCwgTGF1cmVudCBQaW5jaGFy
dCB3cm90ZToKPiBIaSBEYW5pZWwsCj4gCj4gT24gVHVlLCBOb3YgMDUsIDIwMTkgYXQgMDQ6NDE6
NDFQTSArMDEwMCwgRGFuaWVsIFZldHRlciB3cm90ZToKPiA+IE9uIFR1ZSwgTm92IDUsIDIwMTkg
YXQgNDoyOSBQTSBMaW51cyBXYWxsZWlqIHdyb3RlOgo+ID4gPiBPbiBUdWUsIE5vdiA1LCAyMDE5
IGF0IDE6NDAgQU0gRG1pdHJ5IFRvcm9raG92IHdyb3RlOgo+ID4gPiA+IE9uIE1vbiwgT2N0IDE0
LCAyMDE5IGF0IDExOjQzOjIwQU0gLTA3MDAsIERtaXRyeSBUb3Jva2hvdiB3cm90ZToKPiA+ID4K
PiA+ID4gPiA+IEluc3RlYWQgb2YgZndub2RlX2dldF9uYW1lZF9ncGlvZCgpIHRoYXQgSSBwbGFu
IHRvIGhpZGUgYXdheSwgbGV0J3MgdXNlCj4gPiA+ID4gPiB0aGUgbmV3IGZ3bm9kZV9ncGlvZF9n
ZXRfaW5kZXgoKSB0aGF0IG1pbWljcyBncGlvZF9nZXRfaW5kZXgoKSwgYnV0Cj4gPiA+ID4gPiB3
b3JrcyB3aXRoIGFyYml0cmFyeSBmaXJtd2FyZSBub2RlLgo+ID4gPiA+ID4KPiA+ID4gPiA+IFJl
dmlld2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2Fy
ZC5jb20+Cj4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBEbWl0cnkgVG9yb2tob3YgPGRtaXRyeS50
b3Jva2hvdkBnbWFpbC5jb20+Cj4gPiA+ID4gPiAtLS0KPiA+ID4gPiA+Cj4gPiA+ID4gPiBBbmRy
emVqLCBOZWlsLAo+ID4gPiA+ID4KPiA+ID4gPiA+IFRoaXMgZGVwZW5kcyBvbiB0aGUgbmV3IGNv
ZGUgdGhhdCBjYW4gYmUgYm91bmQgaW4KPiA+ID4gPiA+IGliLWZ3bm9kZS1ncGlvZC1nZXQtaW5k
ZXggaW1tdXRhYmxlIGJyYW5jaCBvZiBMaW51cycgV2FsbGVpaiB0cmVlOgo+ID4gPiA+ID4KPiA+
ID4gPiA+ICAgICAgICAgZ2l0IHB1bGwgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51
eC9rZXJuZWwvZ2l0L2xpbnVzdy9saW51eC1ncGlvLmdpdCBpYi1md25vZGUtZ3Bpb2QtZ2V0LWlu
ZGV4Cj4gPiA+ID4gPgo+ID4gPiA+ID4gSSBob3BlIHRoYXQgaXQgd291bGQgYmUgcG9zc2libGUg
dG8gcHVsbCBpbiB0aGlzIGltbXV0YWJsZSBicmFuY2ggYW5kCj4gPiA+ID4gPiBub3Qgd2FpdCB1
bnRpbCBhZnRlciA1LjUgbWVyZ2Ugd2luZG93LCBvciwgYWx0ZXJuYXRpdmVseSwgbWVyZ2UgdGhy
b3VnaAo+ID4gPiA+ID4gTGludXMgV2FsbGVpaidzIHRyZWUuCj4gPiA+ID4KPiA+ID4gPiBBbnkg
Y2hhbmNlIHRoaXMgY291bGQgYmUgbWVyZ2VkLCBwbGVhc2U/Cj4gPiA+Cj4gPiA+IEknbSBoYXBw
eSB0byBtZXJnZSBpdCBpbnRvIHRoZSBHUElPIHRyZWUgaWYgc29tZSBEUk0gbWFpbnRhaW5lciBj
YW4KPiA+ID4gcHJvdmlkZSBhbiBBQ0suCj4gPiAKPiA+IEFjay4KPiA+IAo+ID4gPiBHZXR0aW5n
IEFDSyBmcm9tIERSTSBwZW9wbGUgaXMgcHJvYmxlbWF0aWMgYW5kIGEgYml0IG9mIGZyaWN0aW9u
IGluIHRoZQo+ID4gPiBjb21tdW5pdHksIERWZXR0ZXIgdXN1YWxseSBhZHZpY2UgdG8gc2VlayBt
dXR1YWwgcmV2aWV3cyBldGMsIGJ1dCBJTU8KPiA+ID4gaXQgd291bGQgYmUgYmV0dGVyIGlmIHNv
bWUgcGVvcGxlIGZlbHQgbW9yZSBjb21wZWxsZWQgdG8gcmV2aWV3IHN0dWZmCj4gPiA+IGV2ZW50
dWFsbHkuIChBbmQgdGhhdCBoYXMgdGhlIHByb2JsZW0gdGhhdCBpdCBkb2Vzbid0IHNjYWxlLikK
PiA+IAo+ID4gVGhpcyBoYXMgYSByZXZpZXcgYWxyZWFkeSBwbHVzIGlmIHlvdSBtZXJnZSB5b3Vy
IGltcGxpZWQgcmV2aWV3Lgo+ID4gVGhhdCdzIG1vcmUgdGhhbiBnb29kIGVub3VnaCBpbW8sIHNv
IG5vdCBzZWVpbmcgdGhlIGlzc3VlIGhlcmU/Cj4gCj4gSXNuJ3QgdGhlIGlzc3VlIHRoYXQgdGhl
IHBhdGNoIHNob3VsZCBoYXZlIGJlZW4gcGlja2VkIGJ5IHNvbWVvbmUgZm9yCj4gZHJtLW1pc2Mg
PwoKSXQgcmVxdWlyZXMgcHJlcCB3b3JrIHRoYXQgaXNuJ3QgaW4gZHJtLW1pc2MgSSB0aG91Z2h0
PyBBbnl3YXksIExpbnVzIGhhcwpjb21taXQgcmlnaHRzIHRvIGRybS1taXNjLCBjb3VsZCBhbHNv
IHB1c2ggaXQgdGhlcmUuCgpQbHVzIHlvdSBoYXZlLCBleGNlcHQgeW91IGRvbid0IHdhbnQgaXQu
Ci1EYW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBv
cmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
