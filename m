Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9CBD4143
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2019 15:31:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 863D46E06B;
	Fri, 11 Oct 2019 13:31:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9610B6E06B
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2019 13:31:18 +0000 (UTC)
Received: from dhcp-172-31-174-146.wireless.concordia.ca (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id A118428E804;
 Fri, 11 Oct 2019 14:31:16 +0100 (BST)
Date: Fri, 11 Oct 2019 15:31:13 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org, Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v2 04/21] drm/exynos: Fix potential unbalanced calls to
 pm_runtime_put
Message-ID: <20191011153113.0a555119@dhcp-172-31-174-146.wireless.concordia.ca>
In-Reply-To: <20190826152649.13820-5-boris.brezillon@collabora.com>
References: <20190826152649.13820-1-boris.brezillon@collabora.com>
 <20190826152649.13820-5-boris.brezillon@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, Chris Healy <Chris.Healy@zii.aero>,
 kernel@collabora.com, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSW5raSwKCk9uIE1vbiwgMjYgQXVnIDIwMTkgMTc6MjY6MzIgKzAyMDAKQm9yaXMgQnJlemls
bG9uIDxib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNvbT4gd3JvdGU6Cgo+IFRoZSBlbmNvZGVy
LT5lbmFibGUoKSBjYW4ndCByZXBvcnQgZXJyb3JzIGFuZCBpcyBleHBlY3RlZCB0byBhbHdheXMK
PiBzdWNjZWVkLiBJZiB3ZSBjYWxsIHBtX3J1bnRpbWVfcHV0KCkgaW4gdGhlIGV4eW5vc19kc2lf
ZW5hYmxlKCkgZXJyb3IKPiBwYXRoIChhcyBjdXJyZW50bHkgZG9uZSkgd2UnbGwgaGF2ZSB1bmJh
bGFuY2VkIGdldC9wdXQgY2FsbHMgd2hlbgo+IGVuY29kZXItPmRpc2FibGUoKSBpcyBjYWxsZWQu
Cj4gCj4gVGhlIHNpdHVhdGlvbiBpcyBub3QgaWRlYWwgc2luY2UgZHJtX3BhbmVsX3twcmVwYXJl
LGVuYWJsZX0oKSBjYW4KPiB0aGVvcmV0aWNhbGx5IHJldHVybiBhbiBlcnJvciAoZXZlbiBpZiBp
biBwcmFjdGljZSBJIGRvbid0IHRoaW5rIGFueQo+IHBhbmVsIGRyaXZlciBkb2VzIHRoYXQpLiBQ
dXR0aW5nIGEgV0FSTl9PTigpIGlzIHRoZSBiZXN0IHdlIGNhbiBkbywKPiB1bmZvcnR1bmF0ZWx5
LiBOb3RlIHRoYXQgLUVOT1NZUyBpcyBhY3R1YWxseSBhIHZhbGlkIGNhc2UsIGl0IGp1c3QKPiBt
ZWFucyB0aGUgcGFuZWwgZHJpdmVyIGRvZXMgbm90IGltcGxlbWVudCB0aGUgaG9vay4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEu
Y29tPgoKRGlkIHlvdSBoYXZlIGEgY2hhbmNlIHRvIGxvb2sgYXQgdGhpcyBwYXRjaCA0IGFuZCA1
IG9mIHRoaXMgc2VyaWVzPyBJJ2QKcmVhbGx5IGxpa2UgdG8gZ2V0IHRob3NlIDIgcGF0Y2hlcyBt
ZXJnZWQuCgpUaGFua3MsCgpCb3JpcwoKPiAtLS0KPiBDaGFuZ2VzIGluIHYyOgo+ICogTmV3IHBh
dGNoCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9kc2kuYyB8IDE0
ICsrLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEyIGRl
bGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5v
c19kcm1fZHNpLmMgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZHNpLmMKPiBp
bmRleCA4ZTY1NWFlMWZiMGMuLmM1NTVjZWNmZTFmNSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZHNpLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZXh5
bm9zL2V4eW5vc19kcm1fZHNpLmMKPiBAQCAtMTM4Nyw4ICsxMzg3LDcgQEAgc3RhdGljIHZvaWQg
ZXh5bm9zX2RzaV9lbmFibGUoc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyKQo+ICAKPiAgCWlm
IChkc2ktPnBhbmVsKSB7Cj4gIAkJcmV0ID0gZHJtX3BhbmVsX3ByZXBhcmUoZHNpLT5wYW5lbCk7
Cj4gLQkJaWYgKHJldCA8IDApCj4gLQkJCWdvdG8gZXJyX3B1dF9zeW5jOwo+ICsJCVdBUk5fT04o
cmV0ICYmIHJldCAhPSAtRU5PU1lTKTsKPiAgCX0gZWxzZSB7Cj4gIAkJZHJtX2JyaWRnZV9wcmVf
ZW5hYmxlKGRzaS0+b3V0X2JyaWRnZSk7Cj4gIAl9Cj4gQEAgLTEzOTgsMjIgKzEzOTcsMTMgQEAg
c3RhdGljIHZvaWQgZXh5bm9zX2RzaV9lbmFibGUoc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVy
KQo+ICAKPiAgCWlmIChkc2ktPnBhbmVsKSB7Cj4gIAkJcmV0ID0gZHJtX3BhbmVsX2VuYWJsZShk
c2ktPnBhbmVsKTsKPiAtCQlpZiAocmV0IDwgMCkKPiAtCQkJZ290byBlcnJfZGlzcGxheV9kaXNh
YmxlOwo+ICsJCVdBUk5fT04ocmV0ICYmIHJldCAhPSAtRU5PU1lTKTsKPiAgCX0gZWxzZSB7Cj4g
IAkJZHJtX2JyaWRnZV9lbmFibGUoZHNpLT5vdXRfYnJpZGdlKTsKPiAgCX0KPiAgCj4gIAlkc2kt
PnN0YXRlIHw9IERTSU1fU1RBVEVfVklET1VUX0FWQUlMQUJMRTsKPiAgCXJldHVybjsKPiAtCj4g
LWVycl9kaXNwbGF5X2Rpc2FibGU6Cj4gLQlleHlub3NfZHNpX3NldF9kaXNwbGF5X2VuYWJsZShk
c2ksIGZhbHNlKTsKPiAtCWRybV9wYW5lbF91bnByZXBhcmUoZHNpLT5wYW5lbCk7Cj4gLQo+IC1l
cnJfcHV0X3N5bmM6Cj4gLQlkc2ktPnN0YXRlICY9IH5EU0lNX1NUQVRFX0VOQUJMRUQ7Cj4gLQlw
bV9ydW50aW1lX3B1dChkc2ktPmRldik7Cj4gIH0KPiAgCj4gIHN0YXRpYyB2b2lkIGV4eW5vc19k
c2lfZGlzYWJsZShzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIpCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
