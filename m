Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4784320F99
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 22:26:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0754E894EB;
	Thu, 16 May 2019 20:26:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4C9B894EB
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 20:26:48 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id w11so7047862edl.5
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 13:26:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=8yZZHCOma5wE75Yy+ujK3Ktu9FJHCJkzhA9Yrh2WVYE=;
 b=Eu8Nut1eQGbNiLT0Ttx1uwTEBVIOk5pf49cW0JiJJTzpJWXhWZE4+jYb7Orkm/bBqF
 rHW2LuVMwBypIWDqS04mobGvWlmXSAsjn7LpPbJ6y9ROoYX1Tgub7yjXM8vuudcnU9Q+
 bsLtpCLsETHp2px+J731UAy1FOrO0FIHY8JXq6O2LZ7V7v6gmXpN2Yt1qzofZLrx+4DW
 NCeXuiKkYuDta0TaPzMBcKY9wExxXrGyHmCGhyN0+S2ha9yNHaI3gN/YEisC+zWtmLEI
 SH/c94EA1hjFQDOwXiav5PXS+JDhjUe228giR2jcBrlupqyvHZveh5e3UKYQc/U5fPSJ
 G5uA==
X-Gm-Message-State: APjAAAXt4T4pCd0NXRvxPVUYUj6zqCLmqLG2glQHCDQQ0DZaICXJjKTX
 SdI3SKDV9lUgO2izExuz0zTQPw==
X-Google-Smtp-Source: APXvYqzG1v8f6lqDK748rAUhUkdpUUAtJkbDrCDkFJGH9u8GRbfiWTkXsU2/eVwvvBirf5/w/Eaw2g==
X-Received: by 2002:a17:906:7d16:: with SMTP id
 u22mr21355882ejo.85.1558038407410; 
 Thu, 16 May 2019 13:26:47 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id c20sm1225864ejr.69.2019.05.16.13.26.46
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 16 May 2019 13:26:46 -0700 (PDT)
Date: Thu, 16 May 2019 22:26:44 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v2 2/3] drm: shmem: Add drm_gem_shmem_map_offset() wrapper
Message-ID: <20190516202644.GE3851@phenom.ffwll.local>
Mail-Followup-To: Steven Price <steven.price@arm.com>,
 Rob Herring <robh@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 David Airlie <airlied@linux.ie>, Inki Dae <inki.dae@samsung.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Kukjin Kim <kgene@kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Sean Paul <sean@poorly.run>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20190516141447.46839-1-steven.price@arm.com>
 <20190516141447.46839-3-steven.price@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190516141447.46839-3-steven.price@arm.com>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=8yZZHCOma5wE75Yy+ujK3Ktu9FJHCJkzhA9Yrh2WVYE=;
 b=Q98S9ja2/IVtOjZB3o7q/lqxjh+gCLb+tfCBb0PRkYaHawbd+6fekaWUyEorRgJdfn
 T8tYiyFVQ1sDKIG8/8yDHLGVYx3rky/alhZ9Z3IbDIhBYkVHMqduZ1DSlJtNlP8naqaD
 xsCLWpLkdDQIuhg+v345d3WoH4VJx7Ng4dfCw=
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>,
 dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgMTYsIDIwMTkgYXQgMDM6MTQ6NDZQTSArMDEwMCwgU3RldmVuIFByaWNlIHdy
b3RlOgo+IFByb3ZpZGUgYSB3cmFwcGVyIGZvciBkcm1fZ2VtX21hcF9vZmZzZXQoKSBmb3IgY2xp
ZW50cyBvZiBzaG1lbS4gVGhpcwo+IHdyYXBwZXIgcHJvdmlkZXMgdGhlIGNvcnJlY3Qgc2VtYW50
aWNzIGZvciB0aGUgZHJtX2dlbV9zaG1lbV9tbWFwKCkKPiBjYWxsYmFjay4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5wcmljZUBhcm0uY29tPgo+IC0tLQo+ICBkcml2
ZXJzL2dwdS9kcm0vZHJtX2dlbV9zaG1lbV9oZWxwZXIuYyB8IDIwICsrKysrKysrKysrKysrKysr
KysrCj4gIGluY2x1ZGUvZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmggICAgIHwgIDIgKysKPiAg
MiBmaWxlcyBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9kcm1fZ2VtX3NobWVtX2hlbHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9n
ZW1fc2htZW1faGVscGVyLmMKPiBpbmRleCAxZWUyMDhjMmM4NWUuLjlkYmViYzQ4OTdkMSAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9zaG1lbV9oZWxwZXIuYwo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3NobWVtX2hlbHBlci5jCj4gQEAgLTQwMCw2ICs0MDAs
MjYgQEAgaW50IGRybV9nZW1fc2htZW1fZHVtYl9jcmVhdGUoc3RydWN0IGRybV9maWxlICpmaWxl
LCBzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAo+ICB9Cj4gIEVYUE9SVF9TWU1CT0xfR1BMKGRybV9n
ZW1fc2htZW1fZHVtYl9jcmVhdGUpOwo+ICAKPiArLyoqCj4gKyAqIGRybV9nZW1fbWFwX29mZnNl
dCAtIHJldHVybiB0aGUgZmFrZSBtbWFwIG9mZnNldCBmb3IgYSBnZW0gb2JqZWN0Cj4gKyAqIEBm
aWxlOiBkcm0gZmlsZS1wcml2YXRlIHN0cnVjdHVyZSBjb250YWluaW5nIHRoZSBnZW0gb2JqZWN0
Cj4gKyAqIEBkZXY6IGNvcnJlc3BvbmRpbmcgZHJtX2RldmljZQo+ICsgKiBAaGFuZGxlOiBnZW0g
b2JqZWN0IGhhbmRsZQo+ICsgKiBAb2Zmc2V0OiByZXR1cm4gbG9jYXRpb24gZm9yIHRoZSBmYWtl
IG1tYXAgb2Zmc2V0Cj4gKyAqCj4gKyAqIFRoaXMgcHJvdmlkZXMgYW4gb2Zmc2V0IHN1aXRhYmxl
IGZvciB1c2VyIHNwYWNlIHRvIHJldHVybiB0byB0aGUKPiArICogZHJtX2dlbV9zaG1lbV9tbWFw
KCkgY2FsbGJhY2sgdmlhIGFuIG1tYXAoKSBjYWxsLgo+ICsgKgo+ICsgKiBSZXR1cm5zOgo+ICsg
KiAwIG9uIHN1Y2Nlc3Mgb3IgYSBuZWdhdGl2ZSBlcnJvciBjb2RlIG9uIGZhaWx1cmUuCj4gKyAq
Lwo+ICtpbnQgZHJtX2dlbV9zaG1lbV9tYXBfb2Zmc2V0KHN0cnVjdCBkcm1fZmlsZSAqZmlsZSwg
c3RydWN0IGRybV9kZXZpY2UgKmRldiwKPiArCQkJICAgICB1MzIgaGFuZGxlLCB1NjQgKm9mZnNl
dCkKPiArewo+ICsJcmV0dXJuIGRybV9nZW1fbWFwX29mZnNldChmaWxlLCBkZXYsIGhhbmRsZSwg
b2Zmc2V0KTsKPiArfQo+ICtFWFBPUlRfU1lNQk9MX0dQTChkcm1fZ2VtX3NobWVtX21hcF9vZmZz
ZXQpOwoKTm90IHNlZWluZyB0aGUgcG9pbnQgb2YgdGhpcyBtYXBwZXIsIHNpbmNlIGRybV9nZW1f
c2htZW1fbWFwX29mZnNldCBpc24ndApzcGVmaWNpYyBhdCBhbGwuIEl0IHdvcmtzIGZvciBkdW1i
LCBzaG1lbSwgY21hIGFuZCBwcml2YXRlIG9iamVjdHMgYWxsCmVxdWFsbHkgd2VsbC4gSSdkIGRy
b3AgdGhpcyBhbmQganVzdCBkaXJlY3RseSBjYWxsIHRoZSB1bmRlcmx5aW5nIHRoaW5nLApubyBu
ZWVkIHRvIGxheWVyIGhlbHBlcnMuCi1EYW5pZWwKCj4gKwo+ICBzdGF0aWMgdm1fZmF1bHRfdCBk
cm1fZ2VtX3NobWVtX2ZhdWx0KHN0cnVjdCB2bV9mYXVsdCAqdm1mKQo+ICB7Cj4gIAlzdHJ1Y3Qg
dm1fYXJlYV9zdHJ1Y3QgKnZtYSA9IHZtZi0+dm1hOwo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2Ry
bS9kcm1fZ2VtX3NobWVtX2hlbHBlci5oIGIvaW5jbHVkZS9kcm0vZHJtX2dlbV9zaG1lbV9oZWxw
ZXIuaAo+IGluZGV4IDAzOGI2ZDMxMzQ0Ny4uNDIzOWRkYWFhYTRmIDEwMDY0NAo+IC0tLSBhL2lu
Y2x1ZGUvZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmgKPiArKysgYi9pbmNsdWRlL2RybS9kcm1f
Z2VtX3NobWVtX2hlbHBlci5oCj4gQEAgLTEyOCw2ICsxMjgsOCBAQCBkcm1fZ2VtX3NobWVtX2Ny
ZWF0ZV93aXRoX2hhbmRsZShzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGVfcHJpdiwKPiAgaW50IGRybV9n
ZW1fc2htZW1fZHVtYl9jcmVhdGUoc3RydWN0IGRybV9maWxlICpmaWxlLCBzdHJ1Y3QgZHJtX2Rl
dmljZSAqZGV2LAo+ICAJCQkgICAgICBzdHJ1Y3QgZHJtX21vZGVfY3JlYXRlX2R1bWIgKmFyZ3Mp
Owo+ICAKPiAraW50IGRybV9nZW1fc2htZW1fbWFwX29mZnNldChzdHJ1Y3QgZHJtX2ZpbGUgKmZp
bGUsIHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCj4gKwkJCSAgICAgdTMyIGhhbmRsZSwgdTY0ICpv
ZmZzZXQpOwo+ICBpbnQgZHJtX2dlbV9zaG1lbV9tbWFwKHN0cnVjdCBmaWxlICpmaWxwLCBzdHJ1
Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSk7Cj4gIAo+ICBleHRlcm4gY29uc3Qgc3RydWN0IHZtX29w
ZXJhdGlvbnNfc3RydWN0IGRybV9nZW1fc2htZW1fdm1fb3BzOwo+IC0tIAo+IDIuMjAuMQo+IAoK
LS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0
dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
