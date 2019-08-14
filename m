Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C448D8D6D5
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 17:05:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B3E66E613;
	Wed, 14 Aug 2019 15:05:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59F5E6E613
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 15:05:27 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id x19so104283990eda.12
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 08:05:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=YxKKl2+ta7DCrBjwxKfDaOLOlVGeS7FS1r5qqRf9Yzw=;
 b=Hk9fPruBmvyuodPVP95V+xJZwwGqnRRpDR2C8g+RjAFzX3yDBZUD7Sa5GT7enoeUxf
 4TXCzLg60xPRKnwvuWN5Oh9YAobJRyvCmu+VP/YcPN5iopp6TiADLLFwE2BbgW460EDz
 5l8Wn9JyGvo5w1k6jPVOpi/ELevrVLn/KKisVMmNMPNhCA0YQaUWRm0biB804Dft7+Ox
 pVfgVcGBmuofmlPeZWpy0dlkRDRaOSyHD1vJ9G2DsM1hqXfXyEQWzfmA6LJ+rGn9NadP
 J94bZnk/gkiLjCA7wIuKY9sdJjPzc73lXLugTm+EpJg5PrybnDsvkIC+rftQsK3yUrIE
 MBjg==
X-Gm-Message-State: APjAAAXou6xZ/DAwPeXJMHSlVlXqoGwDFXyro2NjsK8ED02EtwS+h1Cb
 AycMw2jxva5l6ujhYhzXEjrDZw==
X-Google-Smtp-Source: APXvYqyoqDqttrUFCa8gHGrAixJ9GL/dnreYE3IQnI01ouKzd8sNF9P/k0lURlw5zbckNgXnaWIJnw==
X-Received: by 2002:a50:ce5a:: with SMTP id k26mr43298edj.218.1565795125918;
 Wed, 14 Aug 2019 08:05:25 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id x10sm8663edd.73.2019.08.14.08.05.24
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 14 Aug 2019 08:05:25 -0700 (PDT)
Date: Wed, 14 Aug 2019 17:05:23 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH 08/26] drm/dp_mst: Refactor drm_dp_send_enum_path_resources
Message-ID: <20190814150523.GH7444@phenom.ffwll.local>
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
 <20190718014329.8107-9-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190718014329.8107-9-lyude@redhat.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=YxKKl2+ta7DCrBjwxKfDaOLOlVGeS7FS1r5qqRf9Yzw=;
 b=eFlhJjrcaVLUFfvD+Ziul+v9iGSYRnCw8JhZxJuIuCUq5BLTzN2aprorJK+Zgm5Dom
 vJHpvWlwR0PILuTSyvFXRnnHviVZwXGayxbj5KmUgJCX6ZJFFQTULeph0R9nNZRNBkO2
 lR7F5D6DkLb/6WuKZEpQf9jVfO7pG+CeNLi7Q=
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

T24gV2VkLCBKdWwgMTcsIDIwMTkgYXQgMDk6NDI6MzFQTSAtMDQwMCwgTHl1ZGUgUGF1bCB3cm90
ZToKPiBVc2UgbW9yZSBwb2ludGVycyBzbyB3ZSBkb24ndCBoYXZlIHRvIHdyaXRlIG91dAo+IHR4
bXNnLT5yZXBseS51LnBhdGhfcmVzb3VyY2VzIGVhY2ggdGltZS4gQWxzbywgZml4IGxpbmUgd3Jh
cHBpbmcgKwo+IHJlYXJyYW5nZSBsb2NhbCB2YXJpYWJsZXMuCj4gCj4gQ2M6IEp1c3RvbiBMaSA8
anVzdG9uLmxpQGludGVsLmNvbT4KPiBDYzogSW1yZSBEZWFrIDxpbXJlLmRlYWtAaW50ZWwuY29t
Pgo+IENjOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgo+
IENjOiBIYXJyeSBXZW50bGFuZCA8aHdlbnRsYW5AYW1kLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBM
eXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPgoKUmV2aWV3ZWQtYnk6IERhbmllbCBWZXR0ZXIg
PGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2Rw
X21zdF90b3BvbG9neS5jIHwgMjQgKysrKysrKysrKysrKysrKy0tLS0tLS0tCj4gIDEgZmlsZSBj
aGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jIGIvZHJpdmVycy9ncHUvZHJt
L2RybV9kcF9tc3RfdG9wb2xvZ3kuYwo+IGluZGV4IGVjNjg2NWUxYWY3NS4uNTdjOWM2MDVlZTE3
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCj4gQEAgLTIzNTAsMTIg
KzIzNTAsMTQgQEAgc3RhdGljIHZvaWQgZHJtX2RwX3NlbmRfbGlua19hZGRyZXNzKHN0cnVjdCBk
cm1fZHBfbXN0X3RvcG9sb2d5X21nciAqbWdyLAo+ICAJa2ZyZWUodHhtc2cpOwo+ICB9Cj4gIAo+
IC1zdGF0aWMgaW50IGRybV9kcF9zZW5kX2VudW1fcGF0aF9yZXNvdXJjZXMoc3RydWN0IGRybV9k
cF9tc3RfdG9wb2xvZ3lfbWdyICptZ3IsCj4gLQkJCQkJICAgc3RydWN0IGRybV9kcF9tc3RfYnJh
bmNoICptc3RiLAo+IC0JCQkJCSAgIHN0cnVjdCBkcm1fZHBfbXN0X3BvcnQgKnBvcnQpCj4gK3N0
YXRpYyBpbnQKPiArZHJtX2RwX3NlbmRfZW51bV9wYXRoX3Jlc291cmNlcyhzdHJ1Y3QgZHJtX2Rw
X21zdF90b3BvbG9neV9tZ3IgKm1nciwKPiArCQkJCXN0cnVjdCBkcm1fZHBfbXN0X2JyYW5jaCAq
bXN0YiwKPiArCQkJCXN0cnVjdCBkcm1fZHBfbXN0X3BvcnQgKnBvcnQpCj4gIHsKPiAtCWludCBs
ZW47Cj4gKwlzdHJ1Y3QgZHJtX2RwX2VudW1fcGF0aF9yZXNvdXJjZXNfYWNrX3JlcGx5ICpwYXRo
X3JlczsKPiAgCXN0cnVjdCBkcm1fZHBfc2lkZWJhbmRfbXNnX3R4ICp0eG1zZzsKPiArCWludCBs
ZW47Cj4gIAlpbnQgcmV0Owo+ICAKPiAgCXR4bXNnID0ga3phbGxvYyhzaXplb2YoKnR4bXNnKSwg
R0ZQX0tFUk5FTCk7Cj4gQEAgLTIzNjksMTQgKzIzNzEsMjAgQEAgc3RhdGljIGludCBkcm1fZHBf
c2VuZF9lbnVtX3BhdGhfcmVzb3VyY2VzKHN0cnVjdCBkcm1fZHBfbXN0X3RvcG9sb2d5X21nciAq
bWdyLAo+ICAKPiAgCXJldCA9IGRybV9kcF9tc3Rfd2FpdF90eF9yZXBseShtc3RiLCB0eG1zZyk7
Cj4gIAlpZiAocmV0ID4gMCkgewo+ICsJCXBhdGhfcmVzID0gJnR4bXNnLT5yZXBseS51LnBhdGhf
cmVzb3VyY2VzOwo+ICsKPiAgCQlpZiAodHhtc2ctPnJlcGx5LnJlcGx5X3R5cGUgPT0gRFBfU0lE
RUJBTkRfUkVQTFlfTkFLKSB7Cj4gIAkJCURSTV9ERUJVR19LTVMoImVudW0gcGF0aCByZXNvdXJj
ZXMgbmFrIHJlY2VpdmVkXG4iKTsKPiAgCQl9IGVsc2Ugewo+IC0JCQlpZiAocG9ydC0+cG9ydF9u
dW0gIT0gdHhtc2ctPnJlcGx5LnUucGF0aF9yZXNvdXJjZXMucG9ydF9udW1iZXIpCj4gKwkJCWlm
IChwb3J0LT5wb3J0X251bSAhPSBwYXRoX3Jlcy0+cG9ydF9udW1iZXIpCj4gIAkJCQlEUk1fRVJS
T1IoImdvdCBpbmNvcnJlY3QgcG9ydCBpbiByZXNwb25zZVxuIik7Cj4gLQkJCURSTV9ERUJVR19L
TVMoImVudW0gcGF0aCByZXNvdXJjZXMgJWQ6ICVkICVkXG4iLCB0eG1zZy0+cmVwbHkudS5wYXRo
X3Jlc291cmNlcy5wb3J0X251bWJlciwgdHhtc2ctPnJlcGx5LnUucGF0aF9yZXNvdXJjZXMuZnVs
bF9wYXlsb2FkX2J3X251bWJlciwKPiAtCQkJICAgICAgIHR4bXNnLT5yZXBseS51LnBhdGhfcmVz
b3VyY2VzLmF2YWlsX3BheWxvYWRfYndfbnVtYmVyKTsKPiAtCQkJcG9ydC0+YXZhaWxhYmxlX3Bi
biA9IHR4bXNnLT5yZXBseS51LnBhdGhfcmVzb3VyY2VzLmF2YWlsX3BheWxvYWRfYndfbnVtYmVy
Owo+ICsKPiArCQkJRFJNX0RFQlVHX0tNUygiZW51bSBwYXRoIHJlc291cmNlcyAlZDogJWQgJWRc
biIsCj4gKwkJCQkgICAgICBwYXRoX3Jlcy0+cG9ydF9udW1iZXIsCj4gKwkJCQkgICAgICBwYXRo
X3Jlcy0+ZnVsbF9wYXlsb2FkX2J3X251bWJlciwKPiArCQkJCSAgICAgIHBhdGhfcmVzLT5hdmFp
bF9wYXlsb2FkX2J3X251bWJlcik7Cj4gKwkJCXBvcnQtPmF2YWlsYWJsZV9wYm4gPQo+ICsJCQkJ
cGF0aF9yZXMtPmF2YWlsX3BheWxvYWRfYndfbnVtYmVyOwo+ICAJCX0KPiAgCX0KPiAgCj4gLS0g
Cj4gMi4yMS4wCj4gCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwg
Q29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
