Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB2D826B7
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 23:17:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE4C46E181;
	Mon,  5 Aug 2019 21:17:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2A0B6E181
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 21:17:30 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A4BCA2173B
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 21:17:30 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id t8so61270710qkt.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2019 14:17:30 -0700 (PDT)
X-Gm-Message-State: APjAAAW4QBPMXVM0RT75TT4d6mHZwxHAw9MsvLzxL0kU90nnkiB4TKW2
 5X2ai84k+fCbnQC+UluYl47nBqmqLOv6wb/uvw==
X-Google-Smtp-Source: APXvYqzFNoWd/v43N79FN3b8VGxTYLJuAwZYUsoZMTz5VmaFns1XQi2M9uhwxptaPvwPA9bKqOoBtg3PRBGN2UgnpFM=
X-Received: by 2002:a37:a44a:: with SMTP id n71mr294865qke.393.1565039849808; 
 Mon, 05 Aug 2019 14:17:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190805143358.21245-1-robh@kernel.org>
 <20190805163526.GV7444@phenom.ffwll.local>
 <CAF6AEGtKS4V_CHiYwdUB+USw772n7GVb_sHOoVQ2dDHRxyaU+Q@mail.gmail.com>
In-Reply-To: <CAF6AEGtKS4V_CHiYwdUB+USw772n7GVb_sHOoVQ2dDHRxyaU+Q@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 5 Aug 2019 15:17:18 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJf0mM2fF1_oSh-8iqLREH1-0rzeJ+xE2gk=pe18hirXg@mail.gmail.com>
Message-ID: <CAL_JsqJf0mM2fF1_oSh-8iqLREH1-0rzeJ+xE2gk=pe18hirXg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/shmem: Add madvise state and purge helpers
To: Rob Clark <robdclark@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1565039850;
 bh=AwfbTsiGs7X4T43cUaVckZ8qcnVPkyU3IHZbwBcXhd0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=IVxJaZ9SOodDFvaMsX0wA9dCe92o6o3vTBNQp04VRYwgnA7hMG6MG1F7PI0pmGKvR
 Fk89gRCm2TQSKyQnMJ5soKYuDgOu+FX8SmAnhefz5tRlrtwRhLOMNcCpoPAzxBKn6A
 lME/xt70YCJtBCRpvtxZHiMHmu1599/cl+ar+Ne8=
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, David Airlie <airlied@linux.ie>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBBdWcgNSwgMjAxOSBhdCAxMTo0NyBBTSBSb2IgQ2xhcmsgPHJvYmRjbGFya0BnbWFp
bC5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCBBdWcgNSwgMjAxOSBhdCA5OjM1IEFNIERhbmllbCBW
ZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4gd3JvdGU6Cj4gPgo+ID4gT24gTW9uLCBBdWcgMDUsIDIw
MTkgYXQgMDg6MzM6NTdBTSAtMDYwMCwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gPiA+IEFkZCBzdXBw
b3J0IHRvIHRoZSBzaG1lbSBHRU0gaGVscGVycyBmb3IgdHJhY2tpbmcgbWFkdmlzZSBzdGF0ZSBh
bmQKPiA+ID4gcHVyZ2luZyBwYWdlcy4gVGhpcyBpcyBiYXNlZCBvbiB0aGUgbXNtIGltcGxlbWVu
dGF0aW9uLgo+ID4gPgo+ID4gPiBUaGUgQk8gcHJvdmlkZXMgYSBsaXN0X2hlYWQsIGJ1dCB0aGUg
bGlzdCBtYW5hZ2VtZW50IGlzIGhhbmRsZWQgb3V0c2lkZQo+ID4gPiBvZiB0aGUgc2htZW0gaGVs
cGVycyBhcyB0aGVyZSBhcmUgZGlmZmVyZW50IGxvY2tpbmcgcmVxdWlyZW1lbnRzLgo+ID4gPgo+
ID4gPiBDYzogVG9tZXUgVml6b3NvIDx0b21ldS52aXpvc29AY29sbGFib3JhLmNvbT4KPiA+ID4g
Q2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+
Cj4gPiA+IENjOiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJkQGJvb3RsaW4uY29tPgo+ID4g
PiBDYzogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+Cj4gPiA+IENjOiBEYXZpZCBBaXJsaWUg
PGFpcmxpZWRAbGludXguaWU+Cj4gPiA+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwu
Y2g+Cj4gPiA+IENjOiBFcmljIEFuaG9sdCA8ZXJpY0BhbmhvbHQubmV0Pgo+ID4gPiBTaWduZWQt
b2ZmLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgo+ID4gPiAtLS0KPiA+ID4gIGRy
aXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3NobWVtX2hlbHBlci5jIHwgNTcgKysrKysrKysrKysrKysr
KysrKysrKysrKysKPiA+ID4gIGluY2x1ZGUvZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmggICAg
IHwgMTUgKysrKysrKwo+ID4gPiAgMiBmaWxlcyBjaGFuZ2VkLCA3MiBpbnNlcnRpb25zKCspCj4g
PiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9zaG1lbV9oZWxw
ZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3NobWVtX2hlbHBlci5jCj4gPiA+IGluZGV4
IDJmNjQ2NjdhYzgwNS4uNGI0NDI1NzZkZTFjIDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX2dlbV9zaG1lbV9oZWxwZXIuYwo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2dlbV9zaG1lbV9oZWxwZXIuYwo+ID4gPiBAQCAtNzUsNiArNzUsNyBAQCBzdHJ1Y3QgZHJt
X2dlbV9zaG1lbV9vYmplY3QgKmRybV9nZW1fc2htZW1fY3JlYXRlKHN0cnVjdCBkcm1fZGV2aWNl
ICpkZXYsIHNpemVfdAo+ID4gPiAgICAgICBzaG1lbSA9IHRvX2RybV9nZW1fc2htZW1fb2JqKG9i
aik7Cj4gPiA+ICAgICAgIG11dGV4X2luaXQoJnNobWVtLT5wYWdlc19sb2NrKTsKPiA+ID4gICAg
ICAgbXV0ZXhfaW5pdCgmc2htZW0tPnZtYXBfbG9jayk7Cj4gPgo+ID4gTWF5YmUgYSBiaXQgbGF0
ZSwgYnV0IGZvciByZWFzb25zIChpbnRlcm9wIHdpdGggdHRtLCB3aGljaCB3aWxsIGJlIG1vcmUK
PiA+IGltcG9ydGFudCBvbmNlIHdlIGhhdmUgZHluYW1pYyBkbWEtYnVmKSBpdCB3b3VsZCBiZSBy
ZWFsIG5pY2UgdG8gdXNlIHRoZQo+ID4gcmVzZXJ2YXRpb25fb2JqIGxvY2sgZm9yIGFsbCB0aGlz
IHN0dWZmLiBtc20sIGJlaW5nIHN0cnVjdF9tdXRleCBiYXNlZCwKPiA+IGlzbid0IGEgZ3JlYXQg
ZXhhbXBsZSBoZXJlLiBUaGUgZG93bnNpZGUgaXMgdGhhdCBpdCB3aWxsIGJlIGEgbG90IGhhcmRl
cgo+ID4gdG8gZ2V0ICBtc20gdG8gdXNlIHRoZXNlIHRoZW4sIGJ1dCBtdWNoIGJldHRlciB0byBu
b3Qgc3ByZWFkIHN0cnVjdF9tdXRleAo+ID4gaW5zcGlyZWQgbG9ja2luZyB0b28gZmFyLgo+ID4K
Pgo+IGJ1dCBzb21ld2hlcmUgeW91IG5lZWQgdG8gcHJvdGVjdCBhY2Nlc3MgdG8gbGlzdCBvZiBi
bydzIHRoYXQgYXJlCj4gYXZhaWxhYmxlIHRvIHNocmluay4uIGlpcmMgdGhhdCBpcyB0aGUgb25s
eSB0aGluZyB3ZSBzaG91bGQgbmVlZAo+IHN0cnVjdF9tdXRleCBmb3Igbm93IGluIHNocmlua2Vy
IHBhdGggaW4gZHJtL21zbS4gIFRoZSBwZXItYm8gc3RhdGUgaXMKPiBwcm90ZWN0ZWQgYnkgYSBw
ZXItYm8gbG9jay4KClJpZ2h0LiBBbmQgZm9yIHBhbmZyb3N0LCBJIGhhdmUgYSBsb2NrIGp1c3Qg
Zm9yIHRoZSBzaHJpbmtlciBsaXN0IGFuZApkb24ndCB1c2Ugc3RydWN0X211dGV4LiBIb3BlZnVs
bHkgSSd2ZSB1bmRlcnN0b29kIHRoZSBsb2NraW5nCnJlcXVpcmVtZW50cyBzdWZmaWNpZW50bHku
CgpSb2IKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
