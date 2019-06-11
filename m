Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8940A3D463
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 19:39:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92411891B1;
	Tue, 11 Jun 2019 17:39:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0CA38919E
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 17:39:16 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id p26so17274990edr.2
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 10:39:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=w5N2tKS/Rl6PSEhU2ojyJX68K3uG8DsBNcK2H7xhug8=;
 b=llgW2CNQ+4SHFIpPNGJ1qfc+pcscWP5W4oU6B7hYWoAQrf3WLIfTJ/7t0I+9zqcMbo
 O6c/B2aKal+8pU07EDMPwvXUNy2JfDxMCt8XWOloXZOS//db5Sc2zHIsrJmhGi7jOjke
 kBe9crOIb7sEAeRc8DqFSqIeStUMD4zzRs+9lAOxTXwrqQGKTvNaGhCLhHQAKfeuQ3SK
 x/z/q8T3iLBWmDh/8QxbFyUWo++sAR/7aqyXIfuipfdBYg4QFVE01wZPLsNBauCep0Jg
 Q5PZ/nYUu7h4PZzNBimBYtqKWFJtor9vZOeAIsilcTFZZCMNaMRbhthJUWf9ybJHKqF4
 EVeg==
X-Gm-Message-State: APjAAAVzX3RNecQ6HesSd8ULO/D4WXh2GF1XvoWHuGg2Ci3hs7/cQy9j
 WvH+IfFHhHL5AHt5w+MrgE4tvrazz28=
X-Google-Smtp-Source: APXvYqyeVmizdHwhgwHZgmr/e4kWY+FAahfl/COJf844taDtIr0xVpVkEX7mKGHw2WEC+CSOQQBDHg==
X-Received: by 2002:a50:be03:: with SMTP id a3mr81819825edi.5.1560274755535;
 Tue, 11 Jun 2019 10:39:15 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id x98sm3013884ede.89.2019.06.11.10.39.14
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 11 Jun 2019 10:39:14 -0700 (PDT)
Date: Tue, 11 Jun 2019 19:39:12 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v5 06/11] drm/rockchip: Use dirtyfb helper
Message-ID: <20190611173912.GL2458@phenom.ffwll.local>
References: <20190611160844.257498-1-sean@poorly.run>
 <20190611160844.257498-7-sean@poorly.run>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190611160844.257498-7-sean@poorly.run>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=w5N2tKS/Rl6PSEhU2ojyJX68K3uG8DsBNcK2H7xhug8=;
 b=NvT1h0wggzS0hz0PDBCzPPh5Ge5ir++LUyVwr7g/5KfnulH0p5RSnOJH3v9BnXE2Pg
 OwQ+InctUir5CPHG97smHdUISweVsS2w8gLeRYPp4w7WW95GaLjJ6vw0eW2yLPvE5Cbd
 CYnFLtlFGwQlIjjVIMykJEYrhNDXANavV/TDs=
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, Sean Paul <seanpaul@chromium.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMTEsIDIwMTkgYXQgMTI6MDg6MjBQTSAtMDQwMCwgU2VhbiBQYXVsIHdyb3Rl
Ogo+IEZyb206IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgo+IAo+IEluc3RlYWQg
b2YgZmx1c2hpbmcgYWxsIHZvcHMgZXZlcnkgdGltZSB3ZSBnZXQgYSBkaXJ0eWZiIGNhbGwsIHVz
ZSB0aGUKPiBkYW1hZ2UgaGVscGVyIHRvIGtpY2sgb2ZmIGFuIGF0b21pYyBjb21taXQuIEV2ZW4g
dGhvdWdoIHdlIGRvbid0IHVzZQo+IGRhbWFnZSBjbGlwcywgdGhlIGhlbHBlciBjb21taXQgd2ls
bCBmb3JjZSB1cyB0aHJvdWdoIHRoZSBub3JtYWwKPiBwc3JfaW5oaWJpdF9nZXQvcHV0IHNlcXVl
bmNlLgo+IAo+IENoYW5nZXMgaW4gdjM6Cj4gLSBBZGRlZCB0byB0aGUgc2V0Cj4gQ2hhbmdlcyBp
biB2NDoKPiAtIE5vbmUKPiBDaGFuZ2VzIGluIHY1Ogo+IC0gTm9uZQo+IAo+IExpbmsgdG8gdjM6
IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC9tc2dpZC8yMDE5MDUwMjE5
NDk1Ni4yMTg0NDEtNy1zZWFuQHBvb3JseS5ydW4KPiBMaW5rIHRvIHY0OiBodHRwczovL3BhdGNo
d29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvbXNnaWQvMjAxOTA1MDgxNjA5MjAuMTQ0NzM5LTct
c2VhbkBwb29ybHkucnVuCj4gCj4gU3VnZ2VzdGVkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxA
ZmZ3bGwuY2g+Cj4gVGVzdGVkLWJ5OiBIZWlrbyBTdHVlYm5lciA8aGVpa29Ac250ZWNoLmRlPgo+
IFNpZ25lZC1vZmYtYnk6IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgoKUmV2aWV3
ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+CgpidHcgc29tZXdo
YXQgYmlnZ2VyIGZpc2ggdG8gZnJ5LCBidXQgaW1vIGFsc28gdmVyeSBtdWNoIHdvcnRoIGl0OgpT
d2l0Y2hpbmcgb3ZlciB0byB0aGUgZ2VuZXJpYyBmYmRldiBlbXVsYXRpb24uCgpBbHNvLCBzaW5j
ZSBldmVyeXRoaW5nIHVwIHRvIHRoaXMgb25lIGlzIHJldmlld2VkIEkgdGhpbmsgd291bGQgYmUg
Z29vZCB0bwpsYW5kIHRoYXQgcGFydCBhbHJlYWR5LiBTbyBJIGNhbiBnbyBhcm91bmQgYW5kIGhh
Z2dsZSB0aGlzIHRvIG90aGVyCmRyaXZlcnMgOi0pCi1EYW5pZWwKCj4gLS0tCj4gIGRyaXZlcnMv
Z3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fZmIuYyB8IDEzICsrLS0tLS0tLS0tLS0KPiAg
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fZmIuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fZmIuYwo+IGluZGV4IDMxMDMwY2Y4
MWJjOTcuLmE4ODhlMzFhYTU0NWEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JvY2tj
aGlwL3JvY2tjaGlwX2RybV9mYi5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3Jv
Y2tjaGlwX2RybV9mYi5jCj4gQEAgLTE2LDYgKzE2LDcgQEAKPiAgI2luY2x1ZGUgPGRybS9kcm0u
aD4KPiAgI2luY2x1ZGUgPGRybS9kcm1QLmg+Cj4gICNpbmNsdWRlIDxkcm0vZHJtX2F0b21pYy5o
Pgo+ICsjaW5jbHVkZSA8ZHJtL2RybV9kYW1hZ2VfaGVscGVyLmg+Cj4gICNpbmNsdWRlIDxkcm0v
ZHJtX2ZiX2hlbHBlci5oPgo+ICAjaW5jbHVkZSA8ZHJtL2RybV9nZW1fZnJhbWVidWZmZXJfaGVs
cGVyLmg+Cj4gICNpbmNsdWRlIDxkcm0vZHJtX3Byb2JlX2hlbHBlci5oPgo+IEBAIC0yNSwyMCAr
MjYsMTAgQEAKPiAgI2luY2x1ZGUgInJvY2tjaGlwX2RybV9nZW0uaCIKPiAgI2luY2x1ZGUgInJv
Y2tjaGlwX2RybV9wc3IuaCIKPiAgCj4gLXN0YXRpYyBpbnQgcm9ja2NoaXBfZHJtX2ZiX2RpcnR5
KHN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiLAo+IC0JCQkJIHN0cnVjdCBkcm1fZmlsZSAqZmls
ZSwKPiAtCQkJCSB1bnNpZ25lZCBpbnQgZmxhZ3MsIHVuc2lnbmVkIGludCBjb2xvciwKPiAtCQkJ
CSBzdHJ1Y3QgZHJtX2NsaXBfcmVjdCAqY2xpcHMsCj4gLQkJCQkgdW5zaWduZWQgaW50IG51bV9j
bGlwcykKPiAtewo+IC0Jcm9ja2NoaXBfZHJtX3Bzcl9mbHVzaF9hbGwoZmItPmRldik7Cj4gLQly
ZXR1cm4gMDsKPiAtfQo+IC0KPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fZnJhbWVidWZmZXJf
ZnVuY3Mgcm9ja2NoaXBfZHJtX2ZiX2Z1bmNzID0gewo+ICAJLmRlc3Ryb3kgICAgICAgPSBkcm1f
Z2VtX2ZiX2Rlc3Ryb3ksCj4gIAkuY3JlYXRlX2hhbmRsZSA9IGRybV9nZW1fZmJfY3JlYXRlX2hh
bmRsZSwKPiAtCS5kaXJ0eQkgICAgICAgPSByb2NrY2hpcF9kcm1fZmJfZGlydHksCj4gKwkuZGly
dHkJICAgICAgID0gZHJtX2F0b21pY19oZWxwZXJfZGlydHlmYiwKPiAgfTsKPiAgCj4gIHN0YXRp
YyBzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICoKPiAtLSAKPiBTZWFuIFBhdWwsIFNvZnR3YXJlIEVu
Z2luZWVyLCBHb29nbGUgLyBDaHJvbWl1bSBPUwo+IAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdh
cmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
