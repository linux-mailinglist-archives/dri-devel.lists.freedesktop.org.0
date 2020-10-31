Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E64362A180F
	for <lists+dri-devel@lfdr.de>; Sat, 31 Oct 2020 15:08:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5108B6E10E;
	Sat, 31 Oct 2020 14:08:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc42.google.com (mail-oo1-xc42.google.com
 [IPv6:2607:f8b0:4864:20::c42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39E9B6E10E
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Oct 2020 14:08:15 +0000 (UTC)
Received: by mail-oo1-xc42.google.com with SMTP id l26so2270759oop.9
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Oct 2020 07:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pWdxXngcUMQ03RxFDme3w77x0fpSOiqSLeBhEhjtP7s=;
 b=W4e8eew4sc/QV76txoxQ+kOHr8zexxVEsla5IWCtovvIIU+vMKe6PNHCutOBTc8GBD
 TPDcyuCg9/lFCW1XkHed/A2hr+Uuzjsfs3Btox8Gz3uckTsG3b6+/u83uwWACFlisCDv
 +YwfICMdHEDV2rktpwgzs2m9n1ldAff5QPUE4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pWdxXngcUMQ03RxFDme3w77x0fpSOiqSLeBhEhjtP7s=;
 b=R87V+o1SrR1l/sMVhB3j64AAMSmZlDrbPePAeX8kIzn8OU6ERUenGMJOYptAZJv3FP
 8g/Ew34QecZRL9P68eVAhTy/0nxbZM3Yl/xOW+lYkFG1Wl+54G84XNrEc63C3LlXWHGO
 FsA0Wh/d7NDh6haIJT5PQ3o5tZMaxe0B+ImuelnJBC3zHp7rctEVg0lWVJMGWtxvtFMU
 tSt9BBAoz9tZ71qsX+XdbGIf+/AumUI7kEuK/95WEJ27JJ5li2a9g9wzUnfk2hSypOw8
 4HLKpmZEFCdl/X897YpTDCB8S1KoCC56OzdHkaXwCb99XXqm9fMN1XKaZ/HfYlViHCia
 XtNA==
X-Gm-Message-State: AOAM530sWA0VYUk9RztxRrdbiMdzHOdPNpN8KAKHl13FKKm5eiSh4RBG
 tu5y4d+c7X0nxlXeeuVDmP6EyQX8StUYsvG75fcFfA==
X-Google-Smtp-Source: ABdhPJwbM5Hhz3Uwj5sfdDetVmxebZ0aNTB9ZSknJitvlX4Hw9XtzWKFT5q8LeIiORUmLfEk5wvVxzZ37fm0KBkuvcs=
X-Received: by 2002:a4a:95cb:: with SMTP id p11mr5622470ooi.89.1604153294361; 
 Sat, 31 Oct 2020 07:08:14 -0700 (PDT)
MIME-Version: 1.0
References: <20201028123222.1732139-1-maxime@cerno.tech>
 <20201028123222.1732139-2-maxime@cerno.tech>
 <20201029135537.GB6112@intel.com>
 <20201031095905.lr6jat6jasxasuhq@gilmour.lan>
 <20201031123549.GM6112@intel.com>
In-Reply-To: <20201031123549.GM6112@intel.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Sat, 31 Oct 2020 15:08:03 +0100
Message-ID: <CAKMK7uHbOkLpf2m1ktpumd+5aQF7NerRZrgxAXsjTzZpF4yDrg@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/atomic: Pass the full state to CRTC atomic begin
 and flush
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 Maxime Ripard <maxime@cerno.tech>, dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBPY3QgMzEsIDIwMjAgYXQgMTozNSBQTSBWaWxsZSBTeXJqw6Rsw6QKPHZpbGxlLnN5
cmphbGFAbGludXguaW50ZWwuY29tPiB3cm90ZToKPgo+IE9uIFNhdCwgT2N0IDMxLCAyMDIwIGF0
IDEwOjU5OjA1QU0gKzAxMDAsIE1heGltZSBSaXBhcmQgd3JvdGU6Cj4gPiBPbiBUaHUsIE9jdCAy
OSwgMjAyMCBhdCAwMzo1NTozN1BNICswMjAwLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6Cj4gPiA+
IE9uIFdlZCwgT2N0IDI4LCAyMDIwIGF0IDAxOjMyOjIyUE0gKzAxMDAsIE1heGltZSBSaXBhcmQg
d3JvdGU6Cj4gPiA+ID4gVGhlIGN1cnJlbnQgYXRvbWljIGhlbHBlcnMgaGF2ZSBlaXRoZXIgdGhl
aXIgb2JqZWN0IHN0YXRlIGJlaW5nIHBhc3NlZCBhcwo+ID4gPiA+IGFuIGFyZ3VtZW50IG9yIHRo
ZSBmdWxsIGF0b21pYyBzdGF0ZS4KPiA+ID4gPgo+ID4gPiA+IFRoZSBmb3JtZXIgaXMgdGhlIHBh
dHRlcm4gdGhhdCB3YXMgZG9uZSBhdCBmaXJzdCwgYmVmb3JlIHN3aXRjaGluZyB0byB0aGUKPiA+
ID4gPiBsYXR0ZXIgZm9yIG5ldyBob29rcyBvciB3aGVuIGl0IHdhcyBuZWVkZWQuCj4gPiA+ID4K
PiA+ID4gPiBMZXQncyBzdGFydCBjb252ZXJ0IGFsbCB0aGUgcmVtYWluaW5nIGhlbHBlcnMgdG8g
cHJvdmlkZSBhIGNvbnNpc3RlbnQKPiA+ID4gPiBpbnRlcmZhY2UsIHN0YXJ0aW5nIHdpdGggdGhl
IENSVEMncyBhdG9taWNfYmVnaW4gYW5kIGF0b21pY19mbHVzaC4KPiA+ID4gPgo+ID4gPiA+IFRo
ZSBjb252ZXJzaW9uIHdhcyBkb25lIHVzaW5nIHRoZSBjb2NjaW5lbGxlIHNjcmlwdCBiZWxvdywg
YnVpbHQgdGVzdGVkIG9uCj4gPiA+ID4gYWxsIHRoZSBkcml2ZXJzIGFuZCBhY3R1YWxseSB0ZXN0
ZWQgb24gdmM0Lgo+ID4gPiA+Cj4gPiA+IDxzbmlwPgo+ID4gPiA+IEBAIC0zMjMsMjYgKzMyMywy
NyBAQCBzdGF0aWMgdm9pZCBpbmdlbmljX2RybV9jcnRjX2F0b21pY19iZWdpbihzdHJ1Y3QgZHJt
X2NydGMgKmNydGMsCj4gPiA+ID4gIH0KPiA+ID4gPgo+ID4gPiA+ICBzdGF0aWMgdm9pZCBpbmdl
bmljX2RybV9jcnRjX2F0b21pY19mbHVzaChzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCj4gPiA+ID4g
LSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGRybV9jcnRjX3N0YXRl
ICpvbGRzdGF0ZSkKPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBz
dHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqc3RhdGUpCj4gPiA+ID4gIHsKPiA+ID4gPiAgIHN0cnVj
dCBpbmdlbmljX2RybSAqcHJpdiA9IGRybV9jcnRjX2dldF9wcml2KGNydGMpOwo+ID4gPiA+IC0g
c3RydWN0IGRybV9jcnRjX3N0YXRlICpzdGF0ZSA9IGNydGMtPnN0YXRlOwo+ID4gPiA+IC0gc3Ry
dWN0IGRybV9wZW5kaW5nX3ZibGFua19ldmVudCAqZXZlbnQgPSBzdGF0ZS0+ZXZlbnQ7Cj4gPiA+
ID4gKyBzdHJ1Y3QgZHJtX2NydGNfc3RhdGUgKmNydGNfc3RhdGUgPSBjcnRjLT5zdGF0ZTsKPiA+
ID4KPiA+ID4gTG9va3MgbGlrZSBxdWl0ZSBhIGZldyBwbGFjZXMgY291bGQgdXNlIGEgZm9sbG93
dXAgdG8KPiA+ID4gc3dpdGNoIHRvIGdldF97b2xkLG5ld31fY3J0Y19zdGF0ZSgpLgo+ID4KPiA+
IFRoYXQgb25lIGlzIG5vdCBlbnRpcmVseSBjbGVhciB0byBtZS4gY3J0Yy0+c3RhdGUgaXMgZG9j
dW1lbnRlZCBhcyB0aGUKPiA+IGN1cnJlbnQgQ1JUQyBzdGF0ZSwgYnV0IGluIGF0b21pY19iZWdp
biAvIGF0b21pY19mbHVzaCwgZG9lcyB0aGF0IG1lYW4KPiA+IHRoYXQgaXQncyB0aGUgb2xkIHN0
YXRlIHRoYXQgd2UncmUgZ29pbmcgdG8gcmVwbGFjZSwgb3IgdGhlIG5ldyBzdGF0ZQo+ID4gdGhh
dCBpcyBnb2luZyB0byByZXBsYWNlIHRoZSBjdXJyZW50IHN0YXRlPwo+Cj4gVGhhdCBkZXBlbmRz
IG9uIHdoZXRoZXIgaXQncyBiZWluZyB1c2VkIGJlZm9yZSBvciBhZnRlciB0aGUKPiBzd2FwX3N0
YXRlKCkuIEJlZm9yZSBzd2FwX3N0YXRlKCkgZm9vLT5zdGF0ZSBpcyB0aGUgb2xkIHN0YXRlLAo+
IGFmdGVyIHN3YXBfc3RhdGUoKSBmb28tPnN0YXRlIGlzIHRoZSBuZXcgc3RhdGUuCgpUaGUgcHJv
YmxlbSB3aXRoIG9iai0+c3RhdGUgcG9pbnRlcnMgaW4gYXRvbWljIGNvbW1pdCBpcyB3aGVuIHdl
IHN0YXJ0CnRvIHF1ZXVlIHVwIG1vcmUgdGhhbiBvbmUgY29tbWl0LCBpdCBnZXRzIG1lc3N5LiBI
ZW5jZSB0aGUgbG9uZyB0ZXJtCnB1c2ggdG8gcGljayB0aGUgcmlnaHQgb2xkL25ldyBzdGF0ZSBm
cm9tIHRoZSBkcm1fYXRvbWljX3N0YXRlLCBzbyB5b3UKa25vdyB5b3UgZ2V0IHRoZSByaWdodCBv
bmUuIFBsdXMgaXQncyBtb3JlIHNlbGYtZG9jdW1lbnRpbmcsIHdpdGggdGhlCl9uZXdfL19vbGRf
IGluZml4LiBMaWtlIGlmIHlvdSBsb29rZCBhdCBfbmV3XyBpbiBhbiBhdG9taWNfZGlzYWJsZQpo
b29rLCB0aGF0J3MgYSBnb29kIHJlYXNvbiB0byBkb3VibGUtY2hlY2sgdGhlIGNvZGUgZG9lcyB0
aGUgcmlnaHQKdGhpbmcuIE9yIGlmIHlvdSBsb29rIGF0IF9vbGRfIGluIGFuIGVuYWJsZSBmdW5j
dGlvbi4gRm9yIHNwZWNpYWwKdHJhbnNpdGlvbnMgdGhpcyBpcyBzb21ldGltZXMgcmVxdWlyZWQs
IGJ1dCByZWFsbHkgc2hvdWxkIHN0aWNrIG91dCBhcwphbiBleGNlcHRpb24uCgpIZW5jZSBhbHNv
IHdoeSByZXBsYWNpbmcgdGhlIHZhcmlvdXMgb2JqX29sZF9zdGF0ZSBvciBvYmpfc3RhdGUKcG9p
bnRlcnMgaXMgYSBnb29kIGlkZWEsIGFuZCBqdXN0IHBhc3NpbmcgZHJtX2F0b21pY19zdGF0ZSBl
dmVyeXdoZXJlLgoKT2ggYW5kIEkgZ3Vlc3MgZXZlbnR1YWxseSB3ZSBzaG91bGQgd2Ugc2hvdWxk
IHBlcmhhcHMgcmVuYW1lCmRybV9hdG9taWNfc3RhdGUgdG8gZHJtX2F0b21pY19zdGF0ZV91cGRh
dGUgb3Igc2ltaWxhciwgdG8gcmVhbGx5CmRyaXZlIGhvdyB3aGF0IHRoaXMgdGhpbmcgZG9lcy4K
LURhbmllbAoKPgo+IC0tCj4gVmlsbGUgU3lyasOkbMOkCj4gSW50ZWwKPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKCgoKLS0gCkRhbmllbCBWZXR0
ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xs
LmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
