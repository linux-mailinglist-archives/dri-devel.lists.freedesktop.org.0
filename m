Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E31FB666
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 18:26:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40DA06ED8F;
	Wed, 13 Nov 2019 17:26:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2CEF6ED8F
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 17:25:59 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id f3so2929527wmc.5
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 09:25:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=Ne3IB6JUFova0lzzOpPMWzymeDbzsimAaBCz8RRdb34=;
 b=dI7MU3jHqziJYAGpM2gKCkoimrwmKuJ8jeNDlK4ofaD0FWDiMvz/QRHBZxyyQLrIOK
 uf3eWj0sN02whtfTfrtfrhM+kS/azYsceQldxE5wwCP/nBc7CbBAZV9ptnTnD6gVCyUF
 Pi1uv6vQDqk3NNQaDOFXNLZQZUvEQqPbemd1Ns35VDRlHjEMp2AQMZ1cT46RIgSrRB/e
 3okBZrlHjSJisFUPmIPaQeC6t7CFR6R3SdLh0jmrLzc8jVL4bG/CkJ/NckNh1uYJQ2BV
 UmjojAgoI/sdU8Sxk2PpwtEyhTh6xfmLQUgY9CD2GHgBt3zA6RbE89Px8ZyUpnl0oxne
 y+Tw==
X-Gm-Message-State: APjAAAVFbGkggLIqDkYlp3OSFoevCulXd4Z+KAKArLVf4hrkEmJr2GCm
 YGkc2U5uTfJ7PK0syb/jH44Q7w==
X-Google-Smtp-Source: APXvYqxCtvJuXqPxIA0Khu8utk9sAVQT2i2beFqWvz4cDuTR2YzISI6cdki5QgFtYGv0aIG12l7Iug==
X-Received: by 2002:a7b:c959:: with SMTP id i25mr3817163wml.100.1573665958483; 
 Wed, 13 Nov 2019 09:25:58 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id x9sm3610241wru.32.2019.11.13.09.25.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Nov 2019 09:25:57 -0800 (PST)
Date: Wed, 13 Nov 2019 18:25:55 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] drm/bridge: ti-tfp410: switch to using
 fwnode_gpiod_get_index()
Message-ID: <20191113172555.GW23790@phenom.ffwll.local>
Mail-Followup-To: Linus Walleij <linus.walleij@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 David Airlie <airlied@linux.ie>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20191014184320.GA161094@dtor-ws> <20191105004050.GU57214@dtor-ws>
 <CACRpkdak-gW9+OV-SZQVNNi5BuyNzkjkKvHmYp2+eYq4vu2nyg@mail.gmail.com>
 <CAKMK7uG7FQ3bDWsTxq0n8Osh7jjws5ia3PFJXvDdo=nxKu7+Ng@mail.gmail.com>
 <CACRpkdYY_W8_L4---iMORt6vriUa9wKEi0d_kiMRbB_NQatRog@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACRpkdYY_W8_L4---iMORt6vriUa9wKEi0d_kiMRbB_NQatRog@mail.gmail.com>
X-Operating-System: Linux phenom 5.2.0-3-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=Ne3IB6JUFova0lzzOpPMWzymeDbzsimAaBCz8RRdb34=;
 b=Mi9PTtkIzr+0PMcGE/bBm9Lq/ypoje6GERaznJxRQcp3bbriEbSsx6sIC7o41HhzLM
 JnyVFLZ8MEWgjYltJbjEpR3JwpHmwdgByvX668e3QjuOIIXkukRGze0uLqhswvuW8a6H
 JBaOuWRhOYDLvzriTO1AQpkk/7rQBBJDZ+5i0=
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
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMTMsIDIwMTkgYXQgMDI6NTI6MjNQTSArMDEwMCwgTGludXMgV2FsbGVpaiB3
cm90ZToKPiBPbiBUdWUsIE5vdiA1LCAyMDE5IGF0IDQ6NDEgUE0gRGFuaWVsIFZldHRlciA8ZGFu
aWVsQGZmd2xsLmNoPiB3cm90ZToKPiA+IE9uIFR1ZSwgTm92IDUsIDIwMTkgYXQgNDoyOSBQTSBM
aW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+IHdyb3RlOgo+ID4gPiBPbiBU
dWUsIE5vdiA1LCAyMDE5IGF0IDE6NDAgQU0gRG1pdHJ5IFRvcm9raG92Cj4gPiA+IDxkbWl0cnku
dG9yb2tob3ZAZ21haWwuY29tPiB3cm90ZToKPiAKPiA+ID4gSSdtIGhhcHB5IHRvIG1lcmdlIGl0
IGludG8gdGhlIEdQSU8gdHJlZSBpZiBzb21lIERSTSBtYWludGFpbmVyIGNhbgo+ID4gPiBwcm92
aWRlIGFuIEFDSy4KPiA+Cj4gPiBBY2suCj4gCj4gVGhhbmtzIQo+IAo+ID4gPiBHZXR0aW5nIEFD
SyBmcm9tIERSTSBwZW9wbGUgaXMgcHJvYmxlbWF0aWMgYW5kIGEgYml0IG9mIGZyaWN0aW9uIGlu
IHRoZQo+ID4gPiBjb21tdW5pdHksIERWZXR0ZXIgdXN1YWxseSBhZHZpY2UgdG8gc2VlayBtdXR1
YWwgcmV2aWV3cyBldGMsIGJ1dCBJTU8KPiA+ID4gaXQgd291bGQgYmUgYmV0dGVyIGlmIHNvbWUg
cGVvcGxlIGZlbHQgbW9yZSBjb21wZWxsZWQgdG8gcmV2aWV3IHN0dWZmCj4gPiA+IGV2ZW50dWFs
bHkuIChBbmQgdGhhdCBoYXMgdGhlIHByb2JsZW0gdGhhdCBpdCBkb2Vzbid0IHNjYWxlLikKPiA+
Cj4gPiBUaGlzIGhhcyBhIHJldmlldyBhbHJlYWR5IHBsdXMgaWYgeW91IG1lcmdlIHlvdXIgaW1w
bGllZCByZXZpZXcuCj4gCj4gWWVhaCBJIG1pc3NlZCBMYXVyZW50J3MgcmV2aWV3IHRhZy4gSSBu
ZWVkZWQgc29tZSBrdW5kIG9mIGNvbnNlbnQKPiB0byB0YWtlIGl0IGludG8gdGhlIEdQSU8gdHJl
ZSBJIHN1cHBvc2UuCj4gCj4gPiBUaGF0J3MgbW9yZSB0aGFuIGdvb2QgZW5vdWdoIGltbywgc28g
bm90IHNlZWluZyB0aGUgaXNzdWUgaGVyZT8KPiAKPiBObyBpc3N1ZS4KPiAKPiBXaGF0IGZyZWFr
ZWQgbWUgb3V0IHdhcyB0aGUgb3B0aW9uIG9mIGhhdmluZyB0byBwdWxsIGluIGFuCj4gaW1tdXRh
YmxlIGJyYW5jaCBmcm9tIG15IEdQSU8gdHJlZSBpbnRvIGRybS1taXNjLiBUaGF0IHdvdWxkCj4g
aGF2ZSBiZWVuIHNjYXJ5LiBLZWVwaW5nIGl0IGFsbCBpbiBteSB0cmVlIHdvcmtzIGZpbmUuCgpG
b3IgbmV4dCB0aW1lIGFyb3VuZCwganVzdCBwaW5nIG9uZSBvZiB0aGUgZHJtLW1pc2MgKG9yIGRy
bSBtYWludGFpbmVycykKZm9yIGFuIGFjayB0byBtZXJnZSBpdCB0aHJvdWdoIGEgZGlmZmVyZW50
IHRyZWUuIE9yIGFzayB0aGVtIHdoYXQgdGhleQp3YW50IHRvIGRvLiBjb21taXR0ZXIgbW9kZWwg
aXNuJ3QgMTAwJSBmcmVlLXdoZWVsaW5nLCBmb3IgY3Jvc3MtdHJlZSBzdHVmZgp5b3Ugc3RpbGwg
aGF2ZSBtYWludGFpbmVycyB3aG8ncmUgc3VwcG9zZWQgdG8gZG8gdGhlaXIgam9icyA6LSkKCkJ1
dCBieSBkZWZhdWx0IGV2ZXJ5b25lIHdpbGwgYXNzdW1lIHlvdSdsbCBqdXN0IGNvbW1pdCwgc28g
eW91IG5lZWQgdG8KcG9rZSB0aGVtIGV4cGxpY2l0bHkgKGxpa2UgeW91J3ZlIGRvbmUgaGVyZSku
Ci1EYW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBv
cmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
