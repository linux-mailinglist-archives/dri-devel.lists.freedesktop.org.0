Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C8C5584E
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 22:02:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3A776E072;
	Tue, 25 Jun 2019 20:02:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2DEC6E072
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 20:02:49 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id m10so28969214edv.6
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 13:02:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=DmS1jNL47BlCeH7f/PXu4ZPXGuwE81QoT6SSZgP5EfA=;
 b=hR0hUo7XW7Nt8zcw8CZPLpZbARQdM+7l6FzqiLQ9kqxufdID6lL+zYWU4jRSmCtESG
 xqDlLILoZG3vFlSGrWEg+hbMpkLtaHTrjk7ireSgfstMPR4PkQlVOEAvXUXQLqvFgIQd
 e6MU/K8P9UTtUW7sJqYCSPBYDv0o1HEfv0kfrk6nXpunRZEeoRq2a+0iaZhX3vjEnHOD
 L17zCgWspZBeWsxOoXyoP0xgv3NStSfCUaTXCkN7uwtNjg5AMgU1lAWXkg4L618PEAH9
 cL0fAoYnc9eecXNOB+pB6YkK4nez4sROYy9FTAtLFBFsXxcvS2IhgWQ8kBoqHBmvZNba
 SUWg==
X-Gm-Message-State: APjAAAXwkpI9av3wMp9WZVqVO+TxtYvHsmrhGTzBJlQeEFxhacgPvJjA
 8CJSyjEb/tpIQr8MAEQkUzoudg==
X-Google-Smtp-Source: APXvYqzia67HddlGmDa0OCB9iU/++DB8gSxq/pTHPCjjVlkhcaBvvSzaHxF0djPvj6x74cJ3TAndBg==
X-Received: by 2002:a50:d0d6:: with SMTP id g22mr352450edf.250.1561492968402; 
 Tue, 25 Jun 2019 13:02:48 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id a9sm5165772edc.44.2019.06.25.13.02.47
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 25 Jun 2019 13:02:47 -0700 (PDT)
Date: Tue, 25 Jun 2019 22:02:45 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Robert Beckett <bob.beckett@collabora.com>,
 dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/4] drm/vblank: warn on sending stale event
Message-ID: <20190625200245.GD12905@phenom.ffwll.local>
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
 <20190625200042.GC12905@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190625200042.GC12905@phenom.ffwll.local>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=DmS1jNL47BlCeH7f/PXu4ZPXGuwE81QoT6SSZgP5EfA=;
 b=Qeo0rZGKwLlLKqReBhoZJ8BiSZyBWcjLuJ5zL9fbsq8WUKITB5LgdxoLYpK3FW0cG7
 KQ9WeabH4I4Dh2ci7fWd2d7xv00yr6/dGF1cXGMNXq5HKXKb1R8TQIHT7sfu+U4DF6IS
 o5+8S4KcN7IFrcz5xN5c8/OkDyMjxdIQiFfM8=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgMTA6MDA6NDJQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBUdWUsIEp1biAyNSwgMjAxOSBhdCAwNjo1OToxMlBNICswMTAwLCBSb2JlcnQg
QmVja2V0dCB3cm90ZToKPiA+IFdhcm4gd2hlbiBhYm91dCB0byBzZW5kIHN0YWxlIHZibGFuayBp
bmZvIGFuZCBhZGQgYWR2aWNlIHRvCj4gPiBkb2N1bWVudGF0aW9uIG9uIGhvdyB0byBhdm9pZC4K
PiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogUm9iZXJ0IEJlY2tldHQgPGJvYi5iZWNrZXR0QGNvbGxh
Ym9yYS5jb20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX3ZibGFuay5jIHwgMTcg
KysrKysrKysrKysrKysrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKQo+
ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV92YmxhbmsuYyBiL2RyaXZl
cnMvZ3B1L2RybS9kcm1fdmJsYW5rLmMKPiA+IGluZGV4IDYwM2FiMTA1MTI1ZC4uN2RhYmIyYmRi
NzMzIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV92YmxhbmsuYwo+ID4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2RybV92YmxhbmsuYwo+ID4gQEAgLTkxOCw2ICs5MTgsMTkgQEAg
RVhQT1JUX1NZTUJPTChkcm1fY3J0Y19hcm1fdmJsYW5rX2V2ZW50KTsKPiA+ICAgKgo+ID4gICAq
IFNlZSBkcm1fY3J0Y19hcm1fdmJsYW5rX2V2ZW50KCkgZm9yIGEgaGVscGVyIHdoaWNoIGNhbiBi
ZSB1c2VkIGluIGNlcnRhaW4KPiA+ICAgKiBzaXR1YXRpb24sIGVzcGVjaWFsbHkgdG8gc2VuZCBv
dXQgZXZlbnRzIGZvciBhdG9taWMgY29tbWl0IG9wZXJhdGlvbnMuCj4gPiArICoKPiA+ICsgKiBD
YXJlIHNob3VsZCBiZSB0YWtlbiB0byBhdm9pZCBzdGFsZSB0aW1lc3RhbXBzLiBJZjoKPiA+ICsg
KiAgIC0geW91ciBkcml2ZXIgaGFzIHZibGFuayBzdXBwb3J0IChpLmUuIGRldi0+bnVtX2NydGNz
ID4gMCkKPiA+ICsgKiAgIC0gdGhlIHZibGFuayBpcnEgaXMgb2ZmIChpLmUuIG5vIG9uZSBjYWxs
ZWQgZHJtX2NydGNfdmJsYW5rX2dldCkKPiAKPiBkcm1fY3J0Y192YmxhbmtfZ2V0KCkgc28gaXQg
YmVjb21lcyBhIG5lYXQgaHlwZXJsaW5rLgo+IAo+ID4gKyAqICAgLSBmcm9tIHRoZSB2Ymxhbmsg
Y29kZSdzIHBvdiB0aGUgcGlwZSBpcyBzdGlsbCBydW5uaW5nIChpLmUuIG5vdAo+ID4gKyAqICAg
ICBpbi1iZXR3ZWVuIGEgZHJtX2NydGNfdmJsYW5rX29mZigpL29uKCkgcGFpcikKPiAKPiBOb3Qg
c3VyZSB0aGUgYWJvdmUgd2lsbCBsZWFkIHRvIGdyZWF0IG1hcmt1cCwgbWF5YmUgc3BlbGwgb3V0
IHRoZQo+IGRybV9jcnRjX3ZibGFua19vbigpIGFuZCBtYXliZSBtYWtlIGl0IGEgYml0IGNsZWFy
ZXIgbGlrZSAiaS5lLiBub3QgYWZ0ZXIKPiB0aGUgY2FsbCB0byBkcm1fY3J0Y192Ymxhbmtfb2Zm
KCkgYnV0IGJlZm9yZSB0aGUgbmV4dCBjYWxsIHRvCj4gZHJtX2NydGNfdmJsYW5rX29uKCkiIHNv
IGl0J3MgY2xlYXIgd2hpY2ggc2FpZCBvZiB0aGlzIHBhaXIgd2UncmUgdGFsa2luZwo+IGFib3V0
Lgo+IAo+ID4gKyAqIElmIGFsbCBvZiB0aGVzZSBjb25kaXRpb25zIGhvbGQgdGhlbiBkcm1fY3J0
Y19zZW5kX3ZibGFua19ldmVudCBpcwo+IAo+IHN0eWxlIG5pdDogdGhlIGVudW1lcmF0aW9uIGlz
IG9uZSBzZW50ZW5jZSAoYW5kIGFuZCBveGZvcmQgY29tbWFuIG1pc3NpbmcKPiBidXQgd2hhdGV2
ZXIpLCBidXQgeW91IGRvbid0IGNvbnRpbnVlIGl0IGhlcmUuIEFsc28sIGRvZXMgdGhlIGVudW1l
cmF0aW9uCj4gbG9vayBwcmV0dHkgaW4gdGhlIGh0bWxkb2NzIG91dHB1dD8KPiAKPiA+ICsgKiBn
b2luZyB0byBnaXZlIHlvdSBhIGdhcmJhZ2UgdGltZXN0YW1wIGFuZCBhbmQgc2VxdWVuY2UgbnVt
YmVyICh0aGUgbGFzdAo+ID4gKyAqIHJlY29yZGVkIGJlZm9yZSB0aGUgaXJxIHdhcyBkaXNhYmxl
ZCkuIElmIHlvdSBjYWxsIGRybV9jcnRjX3ZibGFua19nZXQvcHV0Cj4gPiArICogYXJvdW5kIGl0
LCBvciBhZnRlciB2Ymxhbmtfb2ZmLCB0aGVuIGVpdGhlciBvZiB0aG9zZSB3aWxsIGhhdmUgcm9s
bGVkIHRoaW5ncwo+ID4gKyAqIGZvcndhcmQgZm9yIHlvdS4KPiAKPiBBZ2FpbiBwbHMgZml4IHRo
ZSBtYXJrdXAgc28gYWxsIHRoZSBmdW5jdGlvbiByZWZlcmVuY2Ugc3RpY2sgb3V0IGFuZCB3b3Jr
LgoKT25lIG1vcmUgc3R5bGUgbml0OiBzL3lvdS9kcml2ZXJzLywgc28gbWF5YmU6CgoiRHJpdmVy
cyBtdXN0IGVpdGhlciBob2xkIGEgdmJsYW5rIHJlZmVyZW5jZSBhY3F1aXJlZCB0aHJvdWdoCmRy
bV9jcnRjX3ZibGFua19nZXQoKSBvciB0aGUgdmJsYW5rIG11c3QgaGF2ZSBiZWVuIHNodXQgb2Zm
IGJ5IGNhbGxpbmcKZHJtX2NydGNfdmJsYW5rX29mZigpLiIgVGhvc2UgZnVuY3Rpb25zIHRoZW4g
aGF2ZSBpbiB0dXJuIGxpbmtzIGFuZCBoaW50cwp3aGF0IHlvdSBhbHNvIG5lZWQgdG8gZG8sIGxp
a2Ugbm90IGZvcmdldCB0byBjYWxsIGRybV9jcnRjX3ZibGFua19wdXQoKS4KPiAKPiA+ICsgKiBT
bywgZHJpdmVycyBzaG91bGQgY2FsbCBkcm1fY3J0Y192Ymxhbmtfb2ZmKCkgYmVmb3JlIHRoaXMg
ZnVuY3Rpb24gaW4gdGhlaXIKPiA+ICsgKiBjcnRjIGF0b21pY19kaXNhYmxlIGhhbmRsZXJzLgo+
IAo+IEltbyB0aGlzIHNlbnRlbmNlIGhlcmUgaXMgbmVlZGVkIGJ1dCBhIGJpdCBjb25mdXNpbmcs
IGFuZCB3ZSBoYXZlIGl0Cj4gZG9jdW1lbnRlZCBhbHJlYWR5IGluIHRoZSBhdG9taWNfZGlzYWJs
ZSBob29rLgo+IAo+IE90aGVyIG9wdGlvbiB3b3VsZCBiZSB0byBsaXN0IGFsbCB0aGUgcGxhY2Vz
IHdoZXJlIGEgZHJpdmVyIG1pZ2h0IHdhbnQgdG8KPiBjYWxsIHRoaXMgYW5kIGhvdyB0aGV5IGNv
dWxkIGdldCBpdCB3cm9uZywgd2hpY2ggaW1vIGRvZXNuJ3QgbWFrZSBzZW5zZS4KPiAKPiBXaXRo
IHRoZSBuaXRzIGFkZHJlc3NlZDoKPiAKPiBSZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFu
aWVsLnZldHRlckBmZndsbC5jaD4KPiAKPiA+ICAgKi8KPiA+ICB2b2lkIGRybV9jcnRjX3NlbmRf
dmJsYW5rX2V2ZW50KHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKPiA+ICAJCQkJc3RydWN0IGRybV9w
ZW5kaW5nX3ZibGFua19ldmVudCAqZSkKPiA+IEBAIC05MjUsOCArOTM4LDEyIEBAIHZvaWQgZHJt
X2NydGNfc2VuZF92YmxhbmtfZXZlbnQoc3RydWN0IGRybV9jcnRjICpjcnRjLAo+ID4gIAlzdHJ1
Y3QgZHJtX2RldmljZSAqZGV2ID0gY3J0Yy0+ZGV2Owo+ID4gIAl1NjQgc2VxOwo+ID4gIAl1bnNp
Z25lZCBpbnQgcGlwZSA9IGRybV9jcnRjX2luZGV4KGNydGMpOwo+ID4gKwlzdHJ1Y3QgZHJtX3Zi
bGFua19jcnRjICp2YmxhbmsgPSAmZGV2LT52YmxhbmtbcGlwZV07Cj4gPiAgCWt0aW1lX3Qgbm93
Owo+ID4gIAo+ID4gKwlXQVJOX09OQ0UoZGV2LT5udW1fY3J0Y3MgPiAwICYmICF2YmxhbmstPmVu
YWJsZWQgJiYgIXZibGFuay0+aW5tb2Rlc2V0LAo+ID4gKwkJICAic2VuZGluZyBzdGFsZSB2Ymxh
bmsgaW5mb1xuIik7Cj4gPiArCj4gPiAgCWlmIChkZXYtPm51bV9jcnRjcyA+IDApIHsKPiA+ICAJ
CXNlcSA9IGRybV92YmxhbmtfY291bnRfYW5kX3RpbWUoZGV2LCBwaXBlLCAmbm93KTsKPiA+ICAJ
fSBlbHNlIHsKPiA+IC0tIAo+ID4gMi4xOC4wCj4gPiAKPiAKPiAtLSAKPiBEYW5pZWwgVmV0dGVy
Cj4gU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCj4gaHR0cDovL2Jsb2cuZmZ3
bGwuY2gKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3Jh
dGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
