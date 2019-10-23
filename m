Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB79E26B9
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 00:56:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE12E6E073;
	Wed, 23 Oct 2019 22:56:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56CF66E039
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 22:56:18 +0000 (UTC)
Received: from mail-yw1-f42.google.com (mail-yw1-f42.google.com
 [209.85.161.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AFAE021D7F
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 22:56:17 +0000 (UTC)
Received: by mail-yw1-f42.google.com with SMTP id p187so2457271ywg.3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 15:56:17 -0700 (PDT)
X-Gm-Message-State: APjAAAWb/8MmyyVQbeFXz+Y/Fg47Y+x8fYo0HX7DMDQ3Ca8rfdIRBt7x
 Y+2hd+ryf5bT4KWZDLsyv24CieMIC970qECIpQ==
X-Google-Smtp-Source: APXvYqz8tk6cy33E2kjPb39rGitBh+OZdCbHVzL15q8iWarg/LpfsD8EOA+hxKTc+k0xKkmN+I8Mi6KKtv6gFF41Jc4=
X-Received: by 2002:a0d:d307:: with SMTP id v7mr4908901ywd.507.1571871376689; 
 Wed, 23 Oct 2019 15:56:16 -0700 (PDT)
MIME-Version: 1.0
References: <20191021214550.1461-1-robh@kernel.org>
 <20191021214550.1461-6-robh@kernel.org>
 <1cbca96c-19dd-1d15-949c-7fbcc15369b4@gmail.com>
 <CAL_JsqL6G=F45G+-QXF6T1269f9YquXfYtjoUkCpAoNartxM=Q@mail.gmail.com>
 <1571864784.19128.8.camel@mtksdaap41>
In-Reply-To: <1571864784.19128.8.camel@mtksdaap41>
From: Rob Herring <robh@kernel.org>
Date: Wed, 23 Oct 2019 17:56:02 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJJ2ET2oCCkE=fqk7PWTWp3xiMRiMM_AmxRDws-NaKoOg@mail.gmail.com>
Message-ID: <CAL_JsqJJ2ET2oCCkE=fqk7PWTWp3xiMRiMM_AmxRDws-NaKoOg@mail.gmail.com>
Subject: Re: [PATCH 5/6] drm/mediatek: Convert to use CMA helpers
To: CK Hu <ck.hu@mediatek.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1571871377;
 bh=LhcrwyC5PZJloPX3jFhnfrduPAW8ErL0lMICTFLMMe0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=FEKPr5N2JCYWNSiyISiceh+xZCp4T71Q3Po7Ky4T6gFGRtpvdViVF7xmqTSYCBLl5
 /0l+w5j5gT8omSw9W1gzO/nYbezt7OcLBs2y9vN+EYjeIUF4tLusPrm98OYivPxEDl
 Dr3liqNTOym28LQ2P+7mXcKiewau21GT3XuEDaiY=
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
 Liviu Dudau <liviu.dudau@arm.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Yannick Fertre <yannick.fertre@st.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Kevin Hilman <khilman@baylibre.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Xinliang Liu <z.liuxinliang@hisilicon.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Chen-Yu Tsai <wens@csie.org>, "James \(Qian\) Wang" <james.qian.wang@arm.com>,
 Ulrich Hecht <uli@fpond.eu>, Alexandre Torgue <alexandre.torgue@st.com>,
 Chen Feng <puck.chen@hisilicon.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <sean@poorly.run>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Philippe Cornu <philippe.cornu@st.com>,
 Vincent Abriou <vincent.abriou@st.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rongrong Zou <zourongrong@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMjMsIDIwMTkgYXQgNDowNiBQTSBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29t
PiB3cm90ZToKPgo+IEhpLCBSb2I6Cj4KPiBPbiBXZWQsIDIwMTktMTAtMjMgYXQgMTI6NDIgLTA1
MDAsIFJvYiBIZXJyaW5nIHdyb3RlOgo+ID4gT24gVHVlLCBPY3QgMjIsIDIwMTkgYXQgMTI6MDcg
UE0gTWF0dGhpYXMgQnJ1Z2dlcgo+ID4gPG1hdHRoaWFzLmJnZ0BnbWFpbC5jb20+IHdyb3RlOgo+
ID4gPgo+ID4gPiBIaSBSb2IsCj4gPiA+Cj4gPiA+IE9uIDIxLzEwLzIwMTkgMjM6NDUsIFJvYiBI
ZXJyaW5nIHdyb3RlOgo+ID4gPiA+IFRoZSBvbmx5IHJlYXNvbiB0aGUgTWVkaWF0ZWsgZHJpdmVy
IGRvZXNuJ3QgdXNlIHRoZSBDTUEgaGVscGVycyBpcyBpdAo+ID4gPiA+IHNldHMgRE1BX0FUVFJf
Tk9fS0VSTkVMX01BUFBJTkcgYW5kIGRvZXMgYSB2bWFwKCkgb24gZGVtYW5kLiBVc2luZwo+ID4g
PiA+IHZtYXAoKSBpcyBub3QgZXZlbiBndWFyYW50ZWVkIHRvIHdvcmsgYXMgRE1BIGJ1ZmZlcnMg
bWF5IG5vdCBoYXZlIGEKPiA+ID4gPiBzdHJ1Y3QgcGFnZS4gTm93IHRoYXQgdGhlIENNQSBoZWxw
ZXJzIHN1cHBvcnQgc2V0dGluZwo+ID4gPiA+IERNQV9BVFRSX05PX0tFUk5FTF9NQVBQSU5HIGFz
IG5lZWRlZCBvciBub3QsIGNvbnZlcnQgTWVkaWF0ZWsgZHJpdmVyIHRvCj4gPiA+ID4gdXNlIENN
QSBoZWxwZXJzLgo+ID4gPiA+Cj4gPiA+ID4gQ2M6IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+
Cj4gPiA+ID4gQ2M6IFBoaWxpcHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+Cj4gPiA+
ID4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiA+ID4gPiBDYzogRGFuaWVs
IFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+ID4gPiA+IENjOiBNYXR0aGlhcyBCcnVnZ2VyIDxt
YXR0aGlhcy5iZ2dAZ21haWwuY29tPgo+ID4gPiA+IENjOiBsaW51eC1hcm0ta2VybmVsQGxpc3Rz
LmluZnJhZGVhZC5vcmcKPiA+ID4gPiBDYzogbGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFk
Lm9yZwo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+
Cj4gPiA+ID4gLS0tCj4gPiA+Cj4gPiA+IEkgdGVzdGVkIHRoaXMgb24gbXkgQ2hyb21lYm9vayB3
aXRoIHNvbWUgcGF0Y2hlcyBvbiB0b3Agb2YgdjUuNC1yYzEgWzFdLCB3aGljaAo+ID4gPiB3b3Jr
LiBJZiBJIGFkZCB5b3VyIHBhdGNoZXMgb24gdG9wIG9mIHRoYXQsIHRoZSBzeXN0ZW0gZG9lcyBu
b3QgYm9vdCB1cC4KPiA+ID4gVW5mb3J0dW5hdGVseSBJIGRvbid0IGhhdmUgYSBzZXJpYWwgY29u
c29sZSwgc28gSSB3YXNuJ3QgYWJsZSB0byBzZWUgaWYgdGhlcmUgaXMKPiA+ID4gYW55IGVycm9y
IG1lc3NhZ2UuCj4gPgo+ID4gVGhhbmtzIGZvciB0ZXN0aW5nLiBJJ20gYmFzZWQgb24gZHJtLW1p
c2MtbmV4dCwgYnV0IGRvbid0IHNlZSBhbnl0aGluZwo+ID4gb2J2aW91cyB0aGVyZSB0aGF0IHdv
dWxkIG1hdHRlci4gVGhlcmUgYXJlIHNvbWUgbW1hcCBjaGFuZ2VzLCBidXQgSQo+ID4gdGhpbmsg
dGhleSBzaG91bGRuJ3QgbWF0dGVyLgo+ID4KPiA+IERpZCB5b3UgaGF2ZSBmYmNvbiBlbmFibGVk
PyBUaGF0IG1heSBnaXZlIG1vcmUgY2x1ZXMgYWJvdXQgd2hlcmUgdGhlIHByb2JsZW0gaXMuCj4K
PiBUaGVyZSBhcmUgcHJpdi0+ZG1hX2RldiBmb3IgZG1hIGRldmljZSwgYnV0IGl0IGlzIG5vdCBk
cm0gZGV2aWNlLiBJbgo+IG10ODE3My5kdHNpIFsxXSwgdGhlcmUgYXJlIG1tc3lzIGRldmljZSBh
bmQgb3ZsIGRldmljZSwgbW1zeXMgZGV2aWNlIGlzCj4gZHJtIGRldmljZSBhbmQgb3ZsIGRldmlj
ZSBpcyBtbXN5cydzIHN1YiBkZXZpY2Ugd2hpY2ggcHJvdmlkZSBkbWEKPiBmdW5jdGlvbiwgc28g
b3ZsIGlzIHRoZSBwcml2LT5kbWFfZGV2LiBJIHRoaW5rIHlvdXIgcGF0Y2ggZGlyZWN0bHkgdXNl
Cj4gZHJtIGRldmljZSBmb3IgZG1hIG9wZXJhdGlvbiBhbmQgdGhpcyB3b3VsZCBjYXVzZSBkbWEg
ZnVuY3Rpb24gZmFpbC4KPiBQbGVhc2UgdXNlIHByaXYtPmRtYV9kZXYgZm9yIGRtYSBvcGVyYXRp
b24uCgpSaWdodCwgdGhhbmtzIGZvciBjYXRjaGluZyB0aGF0LiBFaXRoZXIgd2UnbGwgbmVlZCB0
byBtYWtlIENNQSBHRU0Kb2JqZWN0IGhhdmUgYSBzdHJ1Y3QgZGV2aWNlIHB0ciBvciBhZGp1c3Qg
dGhlIGRybV9kZXZpY2UuZGV2IHRvIGhhdmUKdGhlIG5lY2Vzc2FyeSBETUEgc2V0dXAuCgpPbmUg
cXVlc3Rpb24gdGhvdWdoLCB3aHkgZG8geW91IHVzZSBDTUEgd2hlbiB5b3UgaGF2ZSBhbiBJT01N
VT8gVGhhdCdzCm5vdCBvcHRpbWFsIGFzIENNQSBzaXplIG1heSBiZSBsaW1pdGVkLiBPciB5b3Ug
ZG9uJ3QgYWx3YXlzIGhhdmUgYW4KSU9NTVU/CgpSb2IKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
