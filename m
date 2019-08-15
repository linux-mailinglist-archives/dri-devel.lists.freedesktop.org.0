Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4EA38F3EA
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 20:48:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00D936EA40;
	Thu, 15 Aug 2019 18:48:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 539616EA40
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 18:48:54 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id q20so6581477otl.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 11:48:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Fw71kr2mW9IiwjOZNH6XOoot80+S25fBYBZ0bINw6z0=;
 b=PskoAzZXqdSQgyfx7Vsl++72msty9L99t9o4af2EXS2vlzbBZYyvkiNzv1OuudRGew
 rNj1t/eAN3eVCc24UchCFsEEVQqRK+V3wPl1WJaXt9Zdht469AkXfx3+9qE8qxQy8B29
 Crw64App3BC6WnrMBUD7sHLOM+lPUy+z0BaerWy1Gn8bXam3t0qHJBrUvbJnXO/tNip5
 WCq5liDGcQB/cScJ8MznJii+tBwXxWl3m7/ZXh4mGsiJtJHI9LGy+ueD+9cTC/DkJx0l
 aL80GxhQqx7EJ5L8gLSFN6pILSvf7FxLI40p/7lIViBkj6r5j961K3NuBQdjy8c7fslL
 oCug==
X-Gm-Message-State: APjAAAVL7xXuSIp29Ya3rkESjNuhZahm2ivyPGTGv1Oi04s6zCsvH1Cu
 cQR5tVN120NQCGVPNZ8bpem6t9iq2WCB95fOFv3NiA==
X-Google-Smtp-Source: APXvYqx45CnNE4wuI3gUxqm34yZ5IGqUTIJm76SL5lwgBzBT07CKX5dWQXvOhLgNdgOxeRQexjtZYSZakdORN2Um8Fg=
X-Received: by 2002:a9d:590d:: with SMTP id t13mr4887921oth.281.1565894933599; 
 Thu, 15 Aug 2019 11:48:53 -0700 (PDT)
MIME-Version: 1.0
References: <3b4da1e6-b5df-0f0e-cf4d-21dd6fd33e32@amd.com>
 <20190811091523.9382-1-chris@chris-wilson.co.uk>
 <20190814172053.GM7444@phenom.ffwll.local>
 <156589475684.11610.4915544599007801229@skylake-alporthouse-com>
In-Reply-To: <156589475684.11610.4915544599007801229@skylake-alporthouse-com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 15 Aug 2019 20:48:42 +0200
Message-ID: <CAKMK7uHuh6DMXitCHOCa7sjif9s1sjnHrBuHkwEgpzyQWBFhwA@mail.gmail.com>
Subject: Re: [PATCH 5/4] dma-fence: Have dma_fence_signal call signal_locked
To: Chris Wilson <chris@chris-wilson.co.uk>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Fw71kr2mW9IiwjOZNH6XOoot80+S25fBYBZ0bINw6z0=;
 b=UxTcA3PZYQEVT41tZpnRcvpJ7cbOMgoRwki7TpsTyP4FkUI7UlEtG4XaL4uhGttKba
 VApuQtyjW3P91s8xYAYQJ6h98/sgLEXDGlpy0e4ZwSHauTzB0C/eVpA2QLwIcG1EkgyV
 zJHc2M8VJ2ZDRiZVZb7ggaaWsSBcrmcEH+x88=
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgODo0NiBQTSBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlz
LXdpbHNvbi5jby51az4gd3JvdGU6Cj4gUXVvdGluZyBEYW5pZWwgVmV0dGVyICgyMDE5LTA4LTE0
IDE4OjIwOjUzKQo+ID4gT24gU3VuLCBBdWcgMTEsIDIwMTkgYXQgMTA6MTU6MjNBTSArMDEwMCwg
Q2hyaXMgV2lsc29uIHdyb3RlOgo+ID4gPiBOb3cgdGhhdCBkbWFfZmVuY2Vfc2lnbmFsIGFsd2F5
cyB0YWtlcyB0aGUgc3BpbmxvY2sgdG8gZmx1c2ggdGhlCj4gPiA+IGNiX2xpc3QsIHNpbXBseSB0
YWtlIHRoZSBzcGlubG9jayBhbmQgY2FsbCBkbWFfZmVuY2Vfc2lnbmFsX2xvY2tlZCgpIHRvCj4g
PiA+IGF2b2lkIGNvZGUgcmVwZXRpdGlvbi4KPiA+ID4KPiA+ID4gU3VnZ2VzdGVkLWJ5OiBDaHJp
c3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gPiA+IFNpZ25lZC1vZmYt
Ynk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgo+ID4gPiBDYzogQ2hy
aXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+ID4KPiA+IEhtLCBJIHRo
aW5rIHRoaXMgbGFyZ2VseSBkZWZlYXRzIHRoZSBwb2ludCBvZiBoYXZpbmcgdGhlIGxvY2tsZXNz
IHNpZ25hbAo+ID4gZW5hYmxpbmcgdHJpY2tlcnkgaW4gZG1hX2ZlbmNlLiBNYXliZSB0aGF0IHBh
cnQgaXNuJ3QgbmVlZGVkIGJ5IGFueW9uZSwKPiA+IGJ1dCBmZWVscyBsaWtlIGEgdGhpbmcgdGhh
dCBuZWVkcyBhIG5vdGNoIG1vcmUgdGhvdWdodC4gQW5kIGlmIHdlIG5lZWQgaXQsCj4gPiBtYXli
ZSBhIGJpdCBtb3JlIGNsZWFudXAuCj4KPiBZb3UgbWVhbiBkbWFfZmVuY2VfZW5hYmxlX3N3X3Np
Z25hbGluZygpLiBUaGUgb25seSB1c2VyIGFwcGVhcnMgdG8gYmUgdG8KPiBmbHVzaCBmZW5jZXMs
IHdoaWNoIGlzIGFjdHVhbGx5IHRoZSBpbnRlbnQgb2YgYWx3YXlzIG5vdGlmeWluZyB0aGUgc2ln
bmFsCj4gY2IuIEJ5IGFsd2F5cyBkb2luZyB0aGUgY2FsbGJhY2tzLCB3ZSBjYW4gYXZvaWQgaW5z
dGFsbGluZyB0aGUgaW50ZXJydXB0Cj4gYW5kIGNvbXBsZXRlbHkgc2F0dXJhdGluZyBDUFVzIHdp
dGggaXJxcywgaW5zdGVhZCBkb2luZyBhIGJhdGNoIGluIGEKPiBsZWlzdXJlbHkgdGltZXIgY2Fs
bGJhY2sgaWYgbm90IGZsdXNoZWQgbmF0dXJhbGx5LgoKWWVhaCBJJ20gbm90IGFnYWluc3QgZGl0
Y2hpbmcgdGhpcywgYnV0IGNhbid0IHdlIGRpdGNoIGEgbG90IG1vcmUgaWYKd2UganVzdCBhbHdh
eXMgdGFrZSB0aGUgc3BpbmxvY2sgaW4gdGhvc2UgcGF0aHMgbm93IGFueXdheXM/IEtpbmRhIG5v
dAp3b3J0aCBoYXZpbmcgdGhlIGNvbXBsZXhpdHkgYW55bW9yZS4KLURhbmllbAotLSAKRGFuaWVs
IFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KKzQxICgwKSA3OSAz
NjUgNTcgNDggLSBodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
