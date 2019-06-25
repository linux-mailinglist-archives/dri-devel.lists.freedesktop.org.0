Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C7C55844
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 22:00:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37C5D6E065;
	Tue, 25 Jun 2019 20:00:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 588896E065
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 20:00:47 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id s49so28994925edb.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 13:00:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=XpssnUNoV7k9sQMHO8u9aDEFoNx7wYIClQf7/yQbUY0=;
 b=gG7ArcmvcwKhJCW0r8Sjw0z/ltFJtFZU4HoZi2KyXCr7hj/125UJV21CVfJpe8o935
 OQfLPGSRo2Og44YfND8Bgz8cM106g/MDOOlNolm7Y1Zgzfq4fwFrgxXCytElBmZVBdok
 ZkyYcWHAsSVPIuGJheqjyXWvLcoCXoHvCBfyyllH3aUXoNN6PhEkyjS5pMwc7mZy6mDJ
 gvkC4lC4apwvSypYZoqyPHB+UljgfkSxmxgb9/GlAz64ldQvXvBTGkxoqRIEeZ+7ZRf1
 tkW99RTjyOIafcJwNgNOPT1j6vQxUerRJ8UOgwwP/YcZHoBxqcPBXIpcHcfAu6prvaIm
 0Xfg==
X-Gm-Message-State: APjAAAXmSrE2ZYH8gqftyTrPP4SmNnSBbvi9j0to0qZYreHVPrUHSCxT
 CjxdA93eC2pcziiMaOyDlz1BTA==
X-Google-Smtp-Source: APXvYqyTG93tA0iWwTWOk0YKYXLBLmXwTvzv6iuPCZBZPgk9VTRMb9iAhySyAfex9vBXh+r0aKQJ/w==
X-Received: by 2002:a17:906:facc:: with SMTP id
 lu12mr294752ejb.307.1561492845979; 
 Tue, 25 Jun 2019 13:00:45 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id ay16sm304756ejb.2.2019.06.25.13.00.44
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 25 Jun 2019 13:00:45 -0700 (PDT)
Date: Tue, 25 Jun 2019 22:00:42 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Robert Beckett <bob.beckett@collabora.com>
Subject: Re: [PATCH v3 1/4] drm/vblank: warn on sending stale event
Message-ID: <20190625200042.GC12905@phenom.ffwll.local>
Mail-Followup-To: Robert Beckett <bob.beckett@collabora.com>,
 dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <cover.1561483965.git.bob.beckett@collabora.com>
 <a21034afa30246f31daa16e74a0772377a4791ef.1561483965.git.bob.beckett@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a21034afa30246f31daa16e74a0772377a4791ef.1561483965.git.bob.beckett@collabora.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=XpssnUNoV7k9sQMHO8u9aDEFoNx7wYIClQf7/yQbUY0=;
 b=PIX/20a13tlopYe5MjZtkxue6i24rmBvsP45Uiux0CQpbkmxtwGpmr/7eBjkm/2Axl
 0aQ8usb3w2c2JOtuXgx4gF82Z1W19tko4V3qoPKi8HdA9PTi6VLZjiZp9BhBq89SYYD9
 qVxpy44xV8uXY/jXVybR2J2JeSneJOQZ5zJ7E=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, NXP Linux Team <linux-imx@nxp.com>,
 Sean Paul <sean@poorly.run>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgMDY6NTk6MTJQTSArMDEwMCwgUm9iZXJ0IEJlY2tldHQg
d3JvdGU6Cj4gV2FybiB3aGVuIGFib3V0IHRvIHNlbmQgc3RhbGUgdmJsYW5rIGluZm8gYW5kIGFk
ZCBhZHZpY2UgdG8KPiBkb2N1bWVudGF0aW9uIG9uIGhvdyB0byBhdm9pZC4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBSb2JlcnQgQmVja2V0dCA8Ym9iLmJlY2tldHRAY29sbGFib3JhLmNvbT4KPiAtLS0K
PiAgZHJpdmVycy9ncHUvZHJtL2RybV92YmxhbmsuYyB8IDE3ICsrKysrKysrKysrKysrKysrCj4g
IDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9kcm1fdmJsYW5rLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3ZibGFuay5jCj4g
aW5kZXggNjAzYWIxMDUxMjVkLi43ZGFiYjJiZGI3MzMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2RybV92YmxhbmsuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fdmJsYW5rLmMK
PiBAQCAtOTE4LDYgKzkxOCwxOSBAQCBFWFBPUlRfU1lNQk9MKGRybV9jcnRjX2FybV92Ymxhbmtf
ZXZlbnQpOwo+ICAgKgo+ICAgKiBTZWUgZHJtX2NydGNfYXJtX3ZibGFua19ldmVudCgpIGZvciBh
IGhlbHBlciB3aGljaCBjYW4gYmUgdXNlZCBpbiBjZXJ0YWluCj4gICAqIHNpdHVhdGlvbiwgZXNw
ZWNpYWxseSB0byBzZW5kIG91dCBldmVudHMgZm9yIGF0b21pYyBjb21taXQgb3BlcmF0aW9ucy4K
PiArICoKPiArICogQ2FyZSBzaG91bGQgYmUgdGFrZW4gdG8gYXZvaWQgc3RhbGUgdGltZXN0YW1w
cy4gSWY6Cj4gKyAqICAgLSB5b3VyIGRyaXZlciBoYXMgdmJsYW5rIHN1cHBvcnQgKGkuZS4gZGV2
LT5udW1fY3J0Y3MgPiAwKQo+ICsgKiAgIC0gdGhlIHZibGFuayBpcnEgaXMgb2ZmIChpLmUuIG5v
IG9uZSBjYWxsZWQgZHJtX2NydGNfdmJsYW5rX2dldCkKCmRybV9jcnRjX3ZibGFua19nZXQoKSBz
byBpdCBiZWNvbWVzIGEgbmVhdCBoeXBlcmxpbmsuCgo+ICsgKiAgIC0gZnJvbSB0aGUgdmJsYW5r
IGNvZGUncyBwb3YgdGhlIHBpcGUgaXMgc3RpbGwgcnVubmluZyAoaS5lLiBub3QKPiArICogICAg
IGluLWJldHdlZW4gYSBkcm1fY3J0Y192Ymxhbmtfb2ZmKCkvb24oKSBwYWlyKQoKTm90IHN1cmUg
dGhlIGFib3ZlIHdpbGwgbGVhZCB0byBncmVhdCBtYXJrdXAsIG1heWJlIHNwZWxsIG91dCB0aGUK
ZHJtX2NydGNfdmJsYW5rX29uKCkgYW5kIG1heWJlIG1ha2UgaXQgYSBiaXQgY2xlYXJlciBsaWtl
ICJpLmUuIG5vdCBhZnRlcgp0aGUgY2FsbCB0byBkcm1fY3J0Y192Ymxhbmtfb2ZmKCkgYnV0IGJl
Zm9yZSB0aGUgbmV4dCBjYWxsIHRvCmRybV9jcnRjX3ZibGFua19vbigpIiBzbyBpdCdzIGNsZWFy
IHdoaWNoIHNhaWQgb2YgdGhpcyBwYWlyIHdlJ3JlIHRhbGtpbmcKYWJvdXQuCgo+ICsgKiBJZiBh
bGwgb2YgdGhlc2UgY29uZGl0aW9ucyBob2xkIHRoZW4gZHJtX2NydGNfc2VuZF92YmxhbmtfZXZl
bnQgaXMKCnN0eWxlIG5pdDogdGhlIGVudW1lcmF0aW9uIGlzIG9uZSBzZW50ZW5jZSAoYW5kIGFu
ZCBveGZvcmQgY29tbWFuIG1pc3NpbmcKYnV0IHdoYXRldmVyKSwgYnV0IHlvdSBkb24ndCBjb250
aW51ZSBpdCBoZXJlLiBBbHNvLCBkb2VzIHRoZSBlbnVtZXJhdGlvbgpsb29rIHByZXR0eSBpbiB0
aGUgaHRtbGRvY3Mgb3V0cHV0PwoKPiArICogZ29pbmcgdG8gZ2l2ZSB5b3UgYSBnYXJiYWdlIHRp
bWVzdGFtcCBhbmQgYW5kIHNlcXVlbmNlIG51bWJlciAodGhlIGxhc3QKPiArICogcmVjb3JkZWQg
YmVmb3JlIHRoZSBpcnEgd2FzIGRpc2FibGVkKS4gSWYgeW91IGNhbGwgZHJtX2NydGNfdmJsYW5r
X2dldC9wdXQKPiArICogYXJvdW5kIGl0LCBvciBhZnRlciB2Ymxhbmtfb2ZmLCB0aGVuIGVpdGhl
ciBvZiB0aG9zZSB3aWxsIGhhdmUgcm9sbGVkIHRoaW5ncwo+ICsgKiBmb3J3YXJkIGZvciB5b3Uu
CgpBZ2FpbiBwbHMgZml4IHRoZSBtYXJrdXAgc28gYWxsIHRoZSBmdW5jdGlvbiByZWZlcmVuY2Ug
c3RpY2sgb3V0IGFuZCB3b3JrLgoKPiArICogU28sIGRyaXZlcnMgc2hvdWxkIGNhbGwgZHJtX2Ny
dGNfdmJsYW5rX29mZigpIGJlZm9yZSB0aGlzIGZ1bmN0aW9uIGluIHRoZWlyCj4gKyAqIGNydGMg
YXRvbWljX2Rpc2FibGUgaGFuZGxlcnMuCgpJbW8gdGhpcyBzZW50ZW5jZSBoZXJlIGlzIG5lZWRl
ZCBidXQgYSBiaXQgY29uZnVzaW5nLCBhbmQgd2UgaGF2ZSBpdApkb2N1bWVudGVkIGFscmVhZHkg
aW4gdGhlIGF0b21pY19kaXNhYmxlIGhvb2suCgpPdGhlciBvcHRpb24gd291bGQgYmUgdG8gbGlz
dCBhbGwgdGhlIHBsYWNlcyB3aGVyZSBhIGRyaXZlciBtaWdodCB3YW50IHRvCmNhbGwgdGhpcyBh
bmQgaG93IHRoZXkgY291bGQgZ2V0IGl0IHdyb25nLCB3aGljaCBpbW8gZG9lc24ndCBtYWtlIHNl
bnNlLgoKV2l0aCB0aGUgbml0cyBhZGRyZXNzZWQ6CgpSZXZpZXdlZC1ieTogRGFuaWVsIFZldHRl
ciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KCj4gICAqLwo+ICB2b2lkIGRybV9jcnRjX3NlbmRf
dmJsYW5rX2V2ZW50KHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKPiAgCQkJCXN0cnVjdCBkcm1fcGVu
ZGluZ192YmxhbmtfZXZlbnQgKmUpCj4gQEAgLTkyNSw4ICs5MzgsMTIgQEAgdm9pZCBkcm1fY3J0
Y19zZW5kX3ZibGFua19ldmVudChzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCj4gIAlzdHJ1Y3QgZHJt
X2RldmljZSAqZGV2ID0gY3J0Yy0+ZGV2Owo+ICAJdTY0IHNlcTsKPiAgCXVuc2lnbmVkIGludCBw
aXBlID0gZHJtX2NydGNfaW5kZXgoY3J0Yyk7Cj4gKwlzdHJ1Y3QgZHJtX3ZibGFua19jcnRjICp2
YmxhbmsgPSAmZGV2LT52YmxhbmtbcGlwZV07Cj4gIAlrdGltZV90IG5vdzsKPiAgCj4gKwlXQVJO
X09OQ0UoZGV2LT5udW1fY3J0Y3MgPiAwICYmICF2YmxhbmstPmVuYWJsZWQgJiYgIXZibGFuay0+
aW5tb2Rlc2V0LAo+ICsJCSAgInNlbmRpbmcgc3RhbGUgdmJsYW5rIGluZm9cbiIpOwo+ICsKPiAg
CWlmIChkZXYtPm51bV9jcnRjcyA+IDApIHsKPiAgCQlzZXEgPSBkcm1fdmJsYW5rX2NvdW50X2Fu
ZF90aW1lKGRldiwgcGlwZSwgJm5vdyk7Cj4gIAl9IGVsc2Ugewo+IC0tIAo+IDIuMTguMAo+IAoK
LS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0
dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
