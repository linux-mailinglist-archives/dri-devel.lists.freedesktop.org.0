Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C05958152A
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 11:16:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E059E6E3B7;
	Mon,  5 Aug 2019 09:16:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2DD46E3B5
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 09:16:28 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 07B255C05E2;
 Mon,  5 Aug 2019 11:16:27 +0200 (CEST)
MIME-Version: 1.0
Date: Mon, 05 Aug 2019 11:16:26 +0200
From: Stefan Agner <stefan@agner.ch>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 05/16] drm/fsl-dcu: fix opencoded use of drm_panel_*
In-Reply-To: <20190804201637.1240-6-sam@ravnborg.org>
References: <20190804201637.1240-1-sam@ravnborg.org>
 <20190804201637.1240-6-sam@ravnborg.org>
Message-ID: <8567eb4c916a0b1d134bd62112a11903@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.3.9
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=agner.ch; s=dkim; t=1564996587;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HPQtnZFrmV2z2ZY4AUfwVhL1KZOhKYp78pnR/I9Q3gU=;
 b=dDz17VqIE1JQlYngbbljhYiHAlll72f3XT1TPeuh9u7wN5YpW3p2+imJ+iWmB7Hm6vizk6
 BimPIm5U7TgfWtGCwCzvNwsmbj3kDU9O3OCtzuQfVbVr1ZuIFBIcNhPDSLRS2O79bmIOTJ
 yQA/FaXqhxhjIC6jiFXV63Z5IRaa6Gc=
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Marek Vasut <marex@denx.de>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Vincent Abriou <vincent.abriou@st.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Kukjin Kim <kgene@kernel.org>,
 linux-arm-kernel@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, Alison Wang <alison.wang@nxp.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Alexios Zavras <alexios.zavras@intel.com>, linux-samsung-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Sean Paul <sean@poorly.run>, Allison Randal <allison@lohutok.net>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Shawn Guo <shawnguo@kernel.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Sam Ravnborg <sam.ravnborg@gmail.com>, Enrico Weigelt <info@metux.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wOC0wNCAyMjoxNiwgU2FtIFJhdm5ib3JnIHdyb3RlOgo+IFVzZSBkcm1fcGFuZWxf
Z2V0X21vZGVzKCkgdG8gYWNjZXNzIG1vZGVzLgo+IFRoaXMgaGFzIGEgbmljZSBzaWRlIGVmZmVj
dCB0byBzaW1wbGlmeSB0aGUgY29kZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBTYW0gUmF2bmJvcmcg
PHNhbUByYXZuYm9yZy5vcmc+Cj4gQ2M6IFN0ZWZhbiBBZ25lciA8c3RlZmFuQGFnbmVyLmNoPgo+
IENjOiBBbGlzb24gV2FuZyA8YWxpc29uLndhbmdAbnhwLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9n
cHUvZHJtL2ZzbC1kY3UvZnNsX2RjdV9kcm1fcmdiLmMgfCAxMCArLS0tLS0tLS0tCj4gIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgOSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2ZzbC1kY3UvZnNsX2RjdV9kcm1fcmdiLmMKPiBiL2RyaXZlcnMv
Z3B1L2RybS9mc2wtZGN1L2ZzbF9kY3VfZHJtX3JnYi5jCj4gaW5kZXggMjc5ZDgzZWFmZmMwLi5h
OTJmZDZjNzBiMDkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2ZzbC1kY3UvZnNsX2Rj
dV9kcm1fcmdiLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZnNsLWRjdS9mc2xfZGN1X2RybV9y
Z2IuYwo+IEBAIC02NSwxNyArNjUsOSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9jb25uZWN0
b3JfZnVuY3MKPiBmc2xfZGN1X2RybV9jb25uZWN0b3JfZnVuY3MgPSB7Cj4gIHN0YXRpYyBpbnQg
ZnNsX2RjdV9kcm1fY29ubmVjdG9yX2dldF9tb2RlcyhzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29u
bmVjdG9yKQo+ICB7Cj4gIAlzdHJ1Y3QgZnNsX2RjdV9kcm1fY29ubmVjdG9yICpmc2xfY29ubmVj
dG9yOwo+IC0JaW50ICgqZ2V0X21vZGVzKShzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCk7Cj4gLQlp
bnQgbnVtX21vZGVzID0gMDsKPiAgCj4gIAlmc2xfY29ubmVjdG9yID0gdG9fZnNsX2RjdV9jb25u
ZWN0b3IoY29ubmVjdG9yKTsKPiAtCWlmIChmc2xfY29ubmVjdG9yLT5wYW5lbCAmJiBmc2xfY29u
bmVjdG9yLT5wYW5lbC0+ZnVuY3MgJiYKPiAtCSAgICBmc2xfY29ubmVjdG9yLT5wYW5lbC0+ZnVu
Y3MtPmdldF9tb2Rlcykgewo+IC0JCWdldF9tb2RlcyA9IGZzbF9jb25uZWN0b3ItPnBhbmVsLT5m
dW5jcy0+Z2V0X21vZGVzOwo+IC0JCW51bV9tb2RlcyA9IGdldF9tb2Rlcyhmc2xfY29ubmVjdG9y
LT5wYW5lbCk7Cj4gLQl9Cj4gLQo+IC0JcmV0dXJuIG51bV9tb2RlczsKPiArCXJldHVybiBkcm1f
cGFuZWxfZ2V0X21vZGVzKGZzbF9jb25uZWN0b3ItPnBhbmVsKTsKCk9oLCB0aGF0IG9sZCBjb2Rl
IGxvb2tzIHJhdGhlciBtZXNzeS4gVGhhbmtzIGZvciB0aGUgc2ltcGxpZmljYXRpb24hCgpUaGlz
IGJlaGF2ZXMgc2xpZ2h0bHkgZGlmZmVyZW50IHNpbmNlIGl0IG5vdyByZXR1cm5zIC1FSU5WQUwg
b3IgLUVOT1NZUywKYnV0IHRoYXQgaXMgd2hhdCB3ZSB3YW50LgoKQWNrZWQtYnk6IFN0ZWZhbiBB
Z25lciA8c3RlZmFuQGFnbmVyLmNoPgoKLS0KU3RlZmFuCgo+ICB9Cj4gIAo+ICBzdGF0aWMgaW50
IGZzbF9kY3VfZHJtX2Nvbm5lY3Rvcl9tb2RlX3ZhbGlkKHN0cnVjdCBkcm1fY29ubmVjdG9yICpj
b25uZWN0b3IsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
