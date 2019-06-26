Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 112BB56BF0
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 16:30:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD9906E44C;
	Wed, 26 Jun 2019 14:30:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D4F86E44C
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 14:30:29 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id k8so3656024eds.7
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 07:30:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=oycxIMhWeOjgRZ0/QzcUw1Wm4NjGiCorky0TzSRYEqE=;
 b=eYhOl0F4T0Lc5ZqrHmQJvBk3RDww76ugmL1BxIpG5LLHyB1tTl709C/wYJfe4/85x5
 1PtYy+PWINzT1Ueto+bf364HRUJJVBMhxPB0W4d/ImnS6MjMSXui280g9dh+w8T/HB6O
 iKCK3D6P8NIeaqltaBH8t++gyJaPKa0DjZDkpfth47Guj37SiIE0WW97stuZ/ouZwBDc
 0KJvT7JEyYhdgqtc502Vn31WYGwqlzaXGimTCgI9klH0Ed7gvkApCRihcbYwxMM01QGo
 s+pzrFUi9zrXgiynQna8X0btsHSDHsVaJP1Jc56NgLuvcUtOlPtgUjpJrQkSDOBJzcQc
 kvgQ==
X-Gm-Message-State: APjAAAV8rEGM209alMm/oFCr+/U8F7LgMb5OOMWLDKYfkNWmDqlIcyq9
 DOmq+F/oGmS/6Elaf7nnSwbPOQ==
X-Google-Smtp-Source: APXvYqzNFt6g8HxgwDJyHbLTfRt/7BCAd97Ph8ib/VE+AghliKNlIAXkR9U7cf7MH6mNrMRncjwmSA==
X-Received: by 2002:a05:6402:2cb:: with SMTP id
 b11mr5612295edx.281.1561559427848; 
 Wed, 26 Jun 2019 07:30:27 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id j10sm3037251ejk.23.2019.06.26.07.30.26
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 26 Jun 2019 07:30:27 -0700 (PDT)
Date: Wed, 26 Jun 2019 16:30:25 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v3 3/4] drm/vblank: estimate vblank while disabling
 vblank if interrupt disabled
Message-ID: <20190626143025.GN12905@phenom.ffwll.local>
Mail-Followup-To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?=
 <ville.syrjala@linux.intel.com>, 
 Robert Beckett <bob.beckett@collabora.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org
References: <cover.1561483965.git.bob.beckett@collabora.com>
 <b96132cef4b63118df1026a99b3c345692e3de26.1561483965.git.bob.beckett@collabora.com>
 <20190626132732.GP5942@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190626132732.GP5942@intel.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=oycxIMhWeOjgRZ0/QzcUw1Wm4NjGiCorky0TzSRYEqE=;
 b=ATxugIl2SCaT9srbmP+Rni5GHifDKlPGbXR7cYJH8NZJPoLZdG+YoE+KGlga5ijBjN
 0IaYYsPbZbhlbZ+tgs7ixOM0KKMv+5E5aECiVHH+fBYMy1syTxMjneNp9IDNlk7a/jbe
 M++g+/H/ce1vcxRfKzoZWLaBkn7ISoij6+edI=
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
Cc: Robert Beckett <bob.beckett@collabora.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMjYsIDIwMTkgYXQgMDQ6Mjc6MzJQTSArMDMwMCwgVmlsbGUgU3lyasOkbMOk
IHdyb3RlOgo+IE9uIFR1ZSwgSnVuIDI1LCAyMDE5IGF0IDA2OjU5OjE0UE0gKzAxMDAsIFJvYmVy
dCBCZWNrZXR0IHdyb3RlOgo+ID4gSWYgaW50ZXJydXB0cyBhcmUgZGlzYWJsZWQgKGUuZy4gdmlh
IHZibGFua19kaXNhYmxlX2ZuKSBhbmQgd2UgY29tZSB0bwo+ID4gZGlzYWJsZSB2YmxhbmssIHVw
ZGF0ZSB0aGUgdmJsYW5rIGNvdW50IHRvIGJlc3QgZ3Vlc3MgYXMgdG8gd2hhdCBpdAo+ID4gd291
bGQgYmUgaGFkIHRoZSBpbnRlcnJ1cHRzIHJlbWFpbmVkIGVuYWJsZWQsIGFuZCB1cGRhdGUgdGhl
IHRpbWVzYW1wIHRvCj4gPiBub3cuCj4gPiAKPiA+IFRoaXMgYXZvaWRzIGEgc3RhbGUgdmJsYW5r
IGV2ZW50IGJlaW5nIHNlbnQgd2hpbGUgZGlzYWJsaW5nIGNydGNzIGR1cmluZwo+ID4gYXRvbWlj
IG1vZGVzZXQuCj4gPiAKPiA+IEZpeGVzOiA2ODAzNmIwOGI5MWJjICgiZHJtL3ZibGFuazogRG8g
bm90IHVwZGF0ZSB2YmxhbmsgY291bnQgaWYgaW50ZXJydXB0cwo+ID4gYXJlIGFscmVhZHkgZGlz
YWJsZWQuIikKPiAKPiBJIGRvbid0IHVuZGVyc3RhbmQgdGhhdCBjb21taXQuIGRybV92Ymxhbmtf
b2ZmKCkgc2hvdWxkIGJlIGNhbGxlZAo+IHdoZW4gdGhlIHBvd2VyIGlzIHN0aWxsIHByZXNlbnQs
IHNvIGl0IGxvb2tzIHRvIG1lIGxpa2UgdGhhdAo+IGNvbW1pdCBpcyBhY3R1YWxseSB3cm9uZy4g
U28gSSB0aGluayB3ZSBtYXkgd2FudCB0byBqdXN0IHJldmVydAo+IGl0IGFuZCBmaWd1cmUgb3V0
IHdoYXQgdGhlIGFjdHVhbCBidWcgd2FzLgoKSG0geWVhaCB3ZSBtaWdodCBuZWVkIGEgcG93ZXIg
ZG9tYWluIGdldC9wdXQgYXJvdW5kIG91cgpkcm1fY3J0Y192Ymxhbmtfb2ZmKCkgY2FsbCB0byBt
YWtlIHN1cmUgaXQgZHRydC4gUmV2ZXJ0IHNvdW5kcyBsaWtlIGEgZ29vZAppZGVhIGluc3RlYWQg
b2YgYWRkaW5nIG1vcmUga2x1ZGdlcyAuLi4gYS1iOiBtZSBvbiB0aGUgcmV2ZXJ0LCBldmVuIHRo
b3VnaApJIGRpZCBhY2sgdGhlIG9yaWdpbmFsIHBhdGNoIHRvby4KLURhbmllbAoKPiAKPiA+IAo+
ID4gU2lnbmVkLW9mZi1ieTogUm9iZXJ0IEJlY2tldHQgPGJvYi5iZWNrZXR0QGNvbGxhYm9yYS5j
b20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX3ZibGFuay5jIHwgMTYgKysrKysr
KysrKysrKysrLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3ZibGFuay5j
IGIvZHJpdmVycy9ncHUvZHJtL2RybV92YmxhbmsuYwo+ID4gaW5kZXggN2RhYmIyYmRiNzMzLi5k
YjY4YjhjYmY3OTcgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3ZibGFuay5j
Cj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3ZibGFuay5jCj4gPiBAQCAtMzc1LDkgKzM3
NSwyMyBAQCB2b2lkIGRybV92YmxhbmtfZGlzYWJsZV9hbmRfc2F2ZShzdHJ1Y3QgZHJtX2Rldmlj
ZSAqZGV2LCB1bnNpZ25lZCBpbnQgcGlwZSkKPiA+ICAJICogaW50ZXJydXB0cyB3ZXJlIGVuYWJs
ZWQuIFRoaXMgYXZvaWRzIGNhbGxpbmcgdGhlIC0+ZGlzYWJsZV92YmxhbmsoKQo+ID4gIAkgKiBv
cGVyYXRpb24gaW4gYXRvbWljIGNvbnRleHQgd2l0aCB0aGUgaGFyZHdhcmUgcG90ZW50aWFsbHkg
cnVudGltZQo+ID4gIAkgKiBzdXNwZW5kZWQuCj4gPiArCSAqIElmIGludGVycnVwdHMgYXJlIGRp
c2FibGVkIChlLmcuIHZpYSBibGFua19kaXNhYmxlX2ZuKSB0aGVuIG1ha2UKPiA+ICsJICogYmVz
dCBndWVzcyBhcyB0byB3aGF0IGl0IHdvdWxkIGJlIG5vdyBhbmQgbWFrZSBzdXJlIHdlIGhhdmUg
YW4gdXAKPiA+ICsJICogdG8gZGF0ZSB0aW1lc3RhbXAuCj4gPiAgCSAqLwo+ID4gLQlpZiAoIXZi
bGFuay0+ZW5hYmxlZCkKPiA+ICsJaWYgKCF2YmxhbmstPmVuYWJsZWQpIHsKPiA+ICsJCWt0aW1l
X3Qgbm93ID0ga3RpbWVfZ2V0KCk7Cj4gPiArCQl1MzIgZGlmZiA9IDA7Cj4gPiArCQlpZiAodmJs
YW5rLT5mcmFtZWR1cl9ucykgewo+ID4gKwkJCXU2NCBkaWZmX25zID0ga3RpbWVfdG9fbnMoa3Rp
bWVfc3ViKG5vdywgdmJsYW5rLT50aW1lKSk7Cj4gPiArCQkJZGlmZiA9IERJVl9ST1VORF9DTE9T
RVNUX1VMTChkaWZmX25zLAo+ID4gKwkJCQkJCSAgICAgdmJsYW5rLT5mcmFtZWR1cl9ucyk7Cj4g
PiArCQl9Cj4gPiArCj4gPiArCQlzdG9yZV92YmxhbmsoZGV2LCBwaXBlLCBkaWZmLCBub3csIHZi
bGFuay0+Y291bnQpOwo+ID4gKwo+ID4gIAkJZ290byBvdXQ7Cj4gPiArCX0KPiA+ICAKPiA+ICAJ
LyoKPiA+ICAJICogVXBkYXRlIHRoZSBjb3VudCBhbmQgdGltZXN0YW1wIHRvIG1haW50YWluIHRo
ZQo+ID4gLS0gCj4gPiAyLjE4LjAKPiA+IAo+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPiA+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiA+IGRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCj4gCj4gLS0gCj4gVmlsbGUgU3lyasOkbMOk
Cj4gSW50ZWwKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3Jh
dGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
