Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E4086AD7
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 21:53:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6538D6E8B8;
	Thu,  8 Aug 2019 19:53:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C30E56E8B8
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 19:53:23 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id e3so92195904edr.10
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Aug 2019 12:53:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=Hx4zFgtlrFg6qa3OGmZWiKmbcXh1MHkynmASC975EfY=;
 b=Hm39I1g+0VUPCKknBT8pefvrDsfgDkZG2GDT1FBNBmEHcSxwHRKg8lLTNCeHu4RxYX
 BTAnZ8f9fekYqGgCu2rjKEH9ijod/+FDFM9PkHY5WiCjFs6GxGAnskD5XhKfYMi/z8s+
 i2oNo0xgkaTJBTKVvCDASurCxYm5MdpTPynutfoSejkHwM0uzpoQhimlZqu+FeYuom4L
 d2nco9BcZxJs3yQivHo76N7yyM87AVqS2J+LENrUeoD4Ca1WT2PRrJFhtFaKMo/jYKji
 SA16Ol4zldyAUCo3spyoZ4N5OYokB39FrIq53BFHzn5SFlpbt9LUKrcX5ri31BSVPaMb
 toeA==
X-Gm-Message-State: APjAAAXqn9NXtSgP48e6orFZG+oPSIE8mvu09OxMIk4vKa3eZb29DLjA
 ESC1uPl8NWP5XHXTD3e0EzAYkw==
X-Google-Smtp-Source: APXvYqy9QZDaIPMY+YwMctNImyD9+BfYQxSi2RrV91xgPr938CL3tw0iNxbTcYIiU2UFL2gp/bBVLA==
X-Received: by 2002:a17:906:e2c2:: with SMTP id
 gr2mr15180216ejb.284.1565294002360; 
 Thu, 08 Aug 2019 12:53:22 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id u9sm22123540edm.71.2019.08.08.12.53.20
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 08 Aug 2019 12:53:21 -0700 (PDT)
Date: Thu, 8 Aug 2019 21:53:18 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH 01/26] drm/dp_mst: Move link address dumping into a
 function
Message-ID: <20190808195318.GQ7444@phenom.ffwll.local>
Mail-Followup-To: Lyude Paul <lyude@redhat.com>,
 dri-devel@lists.freedesktop.org, Juston Li <juston.li@intel.com>,
 Imre Deak <imre.deak@intel.com>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Harry Wentland <hwentlan@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org
References: <20190718014329.8107-1-lyude@redhat.com>
 <20190718014329.8107-2-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190718014329.8107-2-lyude@redhat.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=Hx4zFgtlrFg6qa3OGmZWiKmbcXh1MHkynmASC975EfY=;
 b=iYR9wSCg65JI+uwVkvAiRQJUZALaPs/HlAH+vjKa0SMd0potj9JYU7FbPaB7nYiAmF
 NU+5kx6mC1PW6k9TygrOuq5eSQWSugpe7Ge24Py8+EyyNaBeBH8MIw5rmXnIpFiLX1pb
 3fWc+y+802/I7qnlMADscQ57kFFJWQylDP8fI=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Juston Li <juston.li@intel.com>,
 Harry Wentland <hwentlan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMTcsIDIwMTkgYXQgMDk6NDI6MjRQTSAtMDQwMCwgTHl1ZGUgUGF1bCB3cm90
ZToKPiBTaW5jZSB3ZSdyZSBhYm91dCB0byBiZSBjYWxsaW5nIHRoaXMgZnJvbSBtdWx0aXBsZSBw
bGFjZXMuIEFsc28gaXQgbWFrZXMKPiB0aGluZ3MgZWFzaWVyIHRvIHJlYWQhCj4gCj4gQ2M6IEp1
c3RvbiBMaSA8anVzdG9uLmxpQGludGVsLmNvbT4KPiBDYzogSW1yZSBEZWFrIDxpbXJlLmRlYWtA
aW50ZWwuY29tPgo+IENjOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50
ZWwuY29tPgo+IENjOiBIYXJyeSBXZW50bGFuZCA8aHdlbnRsYW5AYW1kLmNvbT4KPiBTaWduZWQt
b2ZmLWJ5OiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPgoKUmV2aWV3ZWQtYnk6IERhbmll
bCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9k
cm0vZHJtX2RwX21zdF90b3BvbG9neS5jIHwgMzUgKysrKysrKysrKysrKysrKysrLS0tLS0tLS0t
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKPiAK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKPiBpbmRleCAwOTg0YjlhMzRkNTUu
Ljk5ODA4MWI5YjIwNSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90
b3BvbG9neS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYwo+
IEBAIC0yMDEzLDYgKzIwMTMsMjggQEAgc3RhdGljIHZvaWQgZHJtX2RwX3F1ZXVlX2Rvd25fdHgo
c3RydWN0IGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdyICptZ3IsCj4gIAltdXRleF91bmxvY2soJm1n
ci0+cWxvY2spOwo+ICB9Cj4gIAo+ICtzdGF0aWMgdm9pZAo+ICtkcm1fZHBfZHVtcF9saW5rX2Fk
ZHJlc3Moc3RydWN0IGRybV9kcF9saW5rX2FkZHJlc3NfYWNrX3JlcGx5ICpyZXBseSkKPiArewo+
ICsJc3RydWN0IGRybV9kcF9saW5rX2FkZHJfcmVwbHlfcG9ydCAqcG9ydF9yZXBseTsKPiArCWlu
dCBpOwo+ICsKPiArCWZvciAoaSA9IDA7IGkgPCByZXBseS0+bnBvcnRzOyBpKyspIHsKPiArCQlw
b3J0X3JlcGx5ID0gJnJlcGx5LT5wb3J0c1tpXTsKPiArCQlEUk1fREVCVUdfS01TKCJwb3J0ICVk
OiBpbnB1dCAlZCwgcGR0OiAlZCwgcG46ICVkLCBkcGNkX3JldjogJTAyeCwgbWNzOiAlZCwgZGRw
czogJWQsIGxkcHMgJWQsIHNkcCAlZC8lZFxuIiwKPiArCQkJICAgICAgaSwKPiArCQkJICAgICAg
cG9ydF9yZXBseS0+aW5wdXRfcG9ydCwKPiArCQkJICAgICAgcG9ydF9yZXBseS0+cGVlcl9kZXZp
Y2VfdHlwZSwKPiArCQkJICAgICAgcG9ydF9yZXBseS0+cG9ydF9udW1iZXIsCj4gKwkJCSAgICAg
IHBvcnRfcmVwbHktPmRwY2RfcmV2aXNpb24sCj4gKwkJCSAgICAgIHBvcnRfcmVwbHktPm1jcywK
PiArCQkJICAgICAgcG9ydF9yZXBseS0+ZGRwcywKPiArCQkJICAgICAgcG9ydF9yZXBseS0+bGVn
YWN5X2RldmljZV9wbHVnX3N0YXR1cywKPiArCQkJICAgICAgcG9ydF9yZXBseS0+bnVtX3NkcF9z
dHJlYW1zLAo+ICsJCQkgICAgICBwb3J0X3JlcGx5LT5udW1fc2RwX3N0cmVhbV9zaW5rcyk7Cj4g
Kwl9Cj4gK30KPiArCj4gIHN0YXRpYyB2b2lkIGRybV9kcF9zZW5kX2xpbmtfYWRkcmVzcyhzdHJ1
Y3QgZHJtX2RwX21zdF90b3BvbG9neV9tZ3IgKm1nciwKPiAgCQkJCSAgICAgc3RydWN0IGRybV9k
cF9tc3RfYnJhbmNoICptc3RiKQo+ICB7Cj4gQEAgLTIwMzgsMTggKzIwNjAsNyBAQCBzdGF0aWMg
dm9pZCBkcm1fZHBfc2VuZF9saW5rX2FkZHJlc3Moc3RydWN0IGRybV9kcF9tc3RfdG9wb2xvZ3lf
bWdyICptZ3IsCj4gIAkJCURSTV9ERUJVR19LTVMoImxpbmsgYWRkcmVzcyBuYWsgcmVjZWl2ZWRc
biIpOwo+ICAJCX0gZWxzZSB7Cj4gIAkJCURSTV9ERUJVR19LTVMoImxpbmsgYWRkcmVzcyByZXBs
eTogJWRcbiIsIHR4bXNnLT5yZXBseS51LmxpbmtfYWRkci5ucG9ydHMpOwo+IC0JCQlmb3IgKGkg
PSAwOyBpIDwgdHhtc2ctPnJlcGx5LnUubGlua19hZGRyLm5wb3J0czsgaSsrKSB7Cj4gLQkJCQlE
Uk1fREVCVUdfS01TKCJwb3J0ICVkOiBpbnB1dCAlZCwgcGR0OiAlZCwgcG46ICVkLCBkcGNkX3Jl
djogJTAyeCwgbWNzOiAlZCwgZGRwczogJWQsIGxkcHMgJWQsIHNkcCAlZC8lZFxuIiwgaSwKPiAt
CQkJCSAgICAgICB0eG1zZy0+cmVwbHkudS5saW5rX2FkZHIucG9ydHNbaV0uaW5wdXRfcG9ydCwK
PiAtCQkJCSAgICAgICB0eG1zZy0+cmVwbHkudS5saW5rX2FkZHIucG9ydHNbaV0ucGVlcl9kZXZp
Y2VfdHlwZSwKPiAtCQkJCSAgICAgICB0eG1zZy0+cmVwbHkudS5saW5rX2FkZHIucG9ydHNbaV0u
cG9ydF9udW1iZXIsCj4gLQkJCQkgICAgICAgdHhtc2ctPnJlcGx5LnUubGlua19hZGRyLnBvcnRz
W2ldLmRwY2RfcmV2aXNpb24sCj4gLQkJCQkgICAgICAgdHhtc2ctPnJlcGx5LnUubGlua19hZGRy
LnBvcnRzW2ldLm1jcywKPiAtCQkJCSAgICAgICB0eG1zZy0+cmVwbHkudS5saW5rX2FkZHIucG9y
dHNbaV0uZGRwcywKPiAtCQkJCSAgICAgICB0eG1zZy0+cmVwbHkudS5saW5rX2FkZHIucG9ydHNb
aV0ubGVnYWN5X2RldmljZV9wbHVnX3N0YXR1cywKPiAtCQkJCSAgICAgICB0eG1zZy0+cmVwbHku
dS5saW5rX2FkZHIucG9ydHNbaV0ubnVtX3NkcF9zdHJlYW1zLAo+IC0JCQkJICAgICAgIHR4bXNn
LT5yZXBseS51LmxpbmtfYWRkci5wb3J0c1tpXS5udW1fc2RwX3N0cmVhbV9zaW5rcyk7Cj4gLQkJ
CX0KPiArCQkJZHJtX2RwX2R1bXBfbGlua19hZGRyZXNzKCZ0eG1zZy0+cmVwbHkudS5saW5rX2Fk
ZHIpOwo+ICAKPiAgCQkJZHJtX2RwX2NoZWNrX21zdGJfZ3VpZChtc3RiLCB0eG1zZy0+cmVwbHku
dS5saW5rX2FkZHIuZ3VpZCk7Cj4gIAo+IC0tIAo+IDIuMjEuMAo+IAoKLS0gCkRhbmllbCBWZXR0
ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xs
LmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
