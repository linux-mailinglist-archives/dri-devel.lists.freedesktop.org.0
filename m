Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA37FA0656
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 17:31:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BB1C89C48;
	Wed, 28 Aug 2019 15:31:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc43.google.com (mail-yw1-xc43.google.com
 [IPv6:2607:f8b0:4864:20::c43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53C5789C48
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 15:31:20 +0000 (UTC)
Received: by mail-yw1-xc43.google.com with SMTP id z64so29465ywe.7
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 08:31:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mWKjkK5WtrW3QK9X5eJFdP/hRsqnfk5BJKymO3Pr+b4=;
 b=oROm5+E79tR4CpBro3JgbgzlTQ5ZuY1dHZbP+Hr85iSP/TUlDq8rBvyUJN/aZMy6Dz
 GhIhsN5zufrkQDII3HXHumhQm1sFlstkRH1Icx5XFn0zMkSlot9a5bvI10AeU/1yYHe2
 N2v4VV5DbbtF61c5CXrzSwhoSycO12PNH48lXgZ4dA5GSsYQjTswEIzEtqQYMWndEVHX
 DCZh/EiIvh8BwhM4vaUSu9JxKRMKdLjK4la5VKfHyM+Ip56dB6ai6aFA3jP9P0h8WDJV
 85KoX6vDmGn3Dx2XBAJlDP7H3gFPZpGCWCm8htE+ZLX7SZVxfG2F+ytjU8Xae1JO5EiG
 6+MA==
X-Gm-Message-State: APjAAAXkQpKSarVhafuouduCTqKA03RqN0UIG86JOrNa2VgssEgnKBHX
 66dtubYGXgXgxZJ3bW+jwbSTQgkidj6koTqeyZKpbw==
X-Google-Smtp-Source: APXvYqxfcc6AUIpZnmhQlWk2kE06PHZjL3TebO7sTtwMjLjdKsPZlsXj6vumxxPcVZ5GkArlRymoaQwThm/HCgoFORM=
X-Received: by 2002:a0d:db51:: with SMTP id d78mr3546314ywe.319.1567006279491; 
 Wed, 28 Aug 2019 08:31:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190826152649.13820-1-boris.brezillon@collabora.com>
 <20190826152649.13820-9-boris.brezillon@collabora.com>
 <20190828152257.GB218215@art_vandelay>
 <20190828172533.4f24a37d@collabora.com>
In-Reply-To: <20190828172533.4f24a37d@collabora.com>
From: Sean Paul <sean@poorly.run>
Date: Wed, 28 Aug 2019 11:30:43 -0400
Message-ID: <CAMavQKLrOxE=3-bbVRxH+ghnapFTaWas0BEK5dcM5EMABuz7rg@mail.gmail.com>
Subject: Re: [PATCH v2 08/21] drm/msm: Use drm_attach_bridge() to attach a
 bridge to an encoder
To: Boris Brezillon <boris.brezillon@collabora.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=mWKjkK5WtrW3QK9X5eJFdP/hRsqnfk5BJKymO3Pr+b4=;
 b=Pm+bZJ80a/kTn/4xQggCdnirUCQFae4woAzMiTVrP+Nbj79EM2qpTGhClVRNDE4Zic
 //c21GDgd+6ZXwzTCqQmxR4SatP9Po+4aMGPKtDlsId7WSkni8DhdmLOByvkRId5XoPY
 TVb/G4QwzXIh7bHK7aLoiX4g7o01IpqztNQ/KIKkUqGKUMssu3bCprMxJSxBgK81bph4
 ylhE8vLf3uNbNd+bMDR1o24DIcHPXZ9YUu3uz14W+LKFHmLRUewK/Pfg0bnV8h9MWmc9
 jr4X/W5upft1t3r3jG+mhlZ/3Q5XFus8ofmuzFAqrj4DPj3JD1Dd0zalY9x4siruyDwl
 bNBQ==
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
Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>, Chris Healy <Chris.Healy@zii.aero>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMjgsIDIwMTkgYXQgMTE6MjUgQU0gQm9yaXMgQnJlemlsbG9uCjxib3Jpcy5i
cmV6aWxsb25AY29sbGFib3JhLmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIDI4IEF1ZyAyMDE5IDEx
OjIyOjU3IC0wNDAwCj4gU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+IHdyb3RlOgo+Cj4gPiBP
biBNb24sIEF1ZyAyNiwgMjAxOSBhdCAwNToyNjozNlBNICswMjAwLCBCb3JpcyBCcmV6aWxsb24g
d3JvdGU6Cj4gPiA+IFRoaXMgaXMgcGFydCBvZiBvdXIgYXR0ZW1wdCB0byBtYWtlIHRoZSBicmlk
Z2UgY2hhaW4gYSBkb3VibGUtbGlua2VkCj4gPiA+IGxpc3QgYmFzZWQgb24gdGhlIGdlbmVyaWMg
bGlzdCBoZWxwZXJzLiBJbiBvcmRlciB0byBkbyB0aGF0LCB3ZSBtdXN0Cj4gPiA+IHBhdGNoIGFs
bCBkcml2ZXJzIG1hbmlwdWxhdGluZyB0aGUgZW5jb2Rlci0+YnJpZGdlIGZpZWxkIGRpcmVjdGx5
Lgo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXpp
bGxvbkBjb2xsYWJvcmEuY29tPgo+ID4gPiBSZXZpZXdlZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1A
cmF2bmJvcmcub3JnPgo+ID4gPiBSZXZpZXdlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVu
dC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgo+ID4KPiA+IERvIHlvdSB3YW50IHRvIHRha2Ug
dGhpcyB0aHJvdWdoIC1taXNjPwo+ID4KPiA+IFJldmlld2VkLWJ5OiBTZWFuIFBhdWwgPHNlYW5A
cG9vcmx5LnJ1bj4KPgo+IFllcywgdGhhdCB3YXMgdGhlIHBsYW4sIHVubGVzcyB5b3Ugd2FudCB0
byBhcHBseSBpdCB0byB0aGUgbXNtIHRyZWUKPiAobm90IHN1cmUgaWYgdGhlcmUncyBzdWNoIGEg
dHJlZSkuCj4KClRoZXJlIGlzLCBidXQgSSB0aGluayBpdCdzIGZpbmUgdG8gdGFrZSB0aGlzIHRo
cm91Z2ggLW1pc2MuCgpTZWFuCgo+ID4KPiA+Cj4gPiA+IC0tLQo+ID4gPiBDaGFuZ2VzIGluIHYy
Ogo+ID4gPiAqIEFkZCBMYXVyZW50IGFuZCBTYW0gUi1iICh3YWl0aW5nIGZvciBhIFItYiBmcm9t
IGEgZHJtL21zbSBtYWludGFpbmVyCj4gPiA+ICAgbm93KQo+ID4gPiAtLS0KPiA+ID4gIGRyaXZl
cnMvZ3B1L2RybS9tc20vZWRwL2VkcC5jICAgfCA0ICsrKy0KPiA+ID4gIGRyaXZlcnMvZ3B1L2Ry
bS9tc20vaGRtaS9oZG1pLmMgfCA0ICsrKy0KPiA+ID4gIDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL21zbS9lZHAvZWRwLmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2VkcC9lZHAuYwo+
ID4gPiBpbmRleCBiNTQ1NTlhNzlkMzYuLmFkNGU5NjNjY2Q5YiAxMDA2NDQKPiA+ID4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL21zbS9lZHAvZWRwLmMKPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L21zbS9lZHAvZWRwLmMKPiA+ID4gQEAgLTE3OCw3ICsxNzgsOSBAQCBpbnQgbXNtX2VkcF9tb2Rl
c2V0X2luaXQoc3RydWN0IG1zbV9lZHAgKmVkcCwgc3RydWN0IGRybV9kZXZpY2UgKmRldiwKPiA+
ID4gICAgICAgICAgICAgZ290byBmYWlsOwo+ID4gPiAgICAgfQo+ID4gPgo+ID4gPiAtICAgZW5j
b2Rlci0+YnJpZGdlLm5leHQgPSBlZHAtPmJyaWRnZTsKPiA+ID4gKyAgIHJldCA9IGRybV9icmlk
Z2VfYXR0YWNoKGVuY29kZXIsIGVkcC0+YnJpZGdlLCBOVUxMKTsKPiA+ID4gKyAgIGlmIChyZXQp
Cj4gPiA+ICsgICAgICAgICAgIGdvdG8gZmFpbDsKPiA+ID4KPiA+ID4gICAgIHByaXYtPmJyaWRn
ZXNbcHJpdi0+bnVtX2JyaWRnZXMrK10gICAgICAgPSBlZHAtPmJyaWRnZTsKPiA+ID4gICAgIHBy
aXYtPmNvbm5lY3RvcnNbcHJpdi0+bnVtX2Nvbm5lY3RvcnMrK10gPSBlZHAtPmNvbm5lY3RvcjsK
PiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vaGRtaS9oZG1pLmMgYi9kcml2
ZXJzL2dwdS9kcm0vbXNtL2hkbWkvaGRtaS5jCj4gPiA+IGluZGV4IDlkOTRhODhkZDhkNi4uNTVi
OWE4YzgzMTJiIDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2hkbWkvaGRt
aS5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vaGRtaS9oZG1pLmMKPiA+ID4gQEAg
LTMyNyw3ICszMjcsOSBAQCBpbnQgbXNtX2hkbWlfbW9kZXNldF9pbml0KHN0cnVjdCBoZG1pICpo
ZG1pLAo+ID4gPiAgICAgICAgICAgICBnb3RvIGZhaWw7Cj4gPiA+ICAgICB9Cj4gPiA+Cj4gPiA+
IC0gICBlbmNvZGVyLT5icmlkZ2UubmV4dCA9IGhkbWktPmJyaWRnZTsKPiA+ID4gKyAgIHJldCA9
IGRybV9icmlkZ2VfYXR0YWNoKGVuY29kZXIsIGhkbWktPmJyaWRnZSwgTlVMTCk7Cj4gPiA+ICsg
ICBpZiAocmV0KQo+ID4gPiArICAgICAgICAgICBnb3RvIGZhaWw7Cj4gPiA+Cj4gPiA+ICAgICBw
cml2LT5icmlkZ2VzW3ByaXYtPm51bV9icmlkZ2VzKytdICAgICAgID0gaGRtaS0+YnJpZGdlOwo+
ID4gPiAgICAgcHJpdi0+Y29ubmVjdG9yc1twcml2LT5udW1fY29ubmVjdG9ycysrXSA9IGhkbWkt
PmNvbm5lY3RvcjsKPiA+ID4gLS0KPiA+ID4gMi4yMS4wCj4gPiA+Cj4gPiA+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiA+IGRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKPiA+ID4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+ID4gPiBodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo+ID4K
PgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
