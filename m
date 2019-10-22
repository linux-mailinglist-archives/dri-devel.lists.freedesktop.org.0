Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE48EE0CD0
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 21:52:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7CFD6E8E6;
	Tue, 22 Oct 2019 19:52:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51EB76E8E6
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 19:52:42 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EB47A222D0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 19:52:41 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id r5so28719851qtd.0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 12:52:41 -0700 (PDT)
X-Gm-Message-State: APjAAAW/U/4L8322gsSss3Kbk9mJM0pVEN8dqaN92lBOzs96lgcJdnv/
 YrXVlXCbyE/Ji/GdifiQ0SH8MMx+h5hCZVvCjA==
X-Google-Smtp-Source: APXvYqwfTFQvEWZsi+fmlXq4bJ/93h8u27YyErOcN6+jtvSG/aNt4UCbC5GoUws1bleVICB9W55vYXnUR58eU0hZLWI=
X-Received: by 2002:ac8:741a:: with SMTP id p26mr5266590qtq.143.1571773960946; 
 Tue, 22 Oct 2019 12:52:40 -0700 (PDT)
MIME-Version: 1.0
References: <20191021214550.1461-1-robh@kernel.org>
 <20191021214550.1461-5-robh@kernel.org>
 <20191022113001.GG4756@pendragon.ideasonboard.com>
 <CAMuHMdXCq9urRDCSmLueVpsv9-FxJ6pxQf-9Ua=vT-TrRs++fQ@mail.gmail.com>
In-Reply-To: <CAMuHMdXCq9urRDCSmLueVpsv9-FxJ6pxQf-9Ua=vT-TrRs++fQ@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 22 Oct 2019 14:52:29 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJwJgNHy4wr0as0n-R3ist_yKp3ytyBw4bPXjtSOSMOXQ@mail.gmail.com>
Message-ID: <CAL_JsqJwJgNHy4wr0as0n-R3ist_yKp3ytyBw4bPXjtSOSMOXQ@mail.gmail.com>
Subject: Re: [PATCH 4/6] drm/cma-helper: Support DRM_MODE_DUMB_KERNEL_MAP flag
To: Geert Uytterhoeven <geert@linux-m68k.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1571773962;
 bh=lVep/kGw+Qm/9BH6yFF5Ta8I/nos5oV6cOnqMoFM8O4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=SbSsk/ekDVLBB454r0f1fvmvvTfmN03c5NGb9PdZ9IvpRX8d1DtgQ08Z0bcIFwtzs
 VJWkSkAkUUYtQwyf9KuPhqlpVOF4v4w2h5TXmW4XmSDy7Bzdam3XJW9stl7dqdpFvB
 VeMeIZqvsNaRGBObR2DhS1fZ9eyDJP3dVFLqhiSw=
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
 DRI Development <dri-devel@lists.freedesktop.org>,
 Philippe Cornu <philippe.cornu@st.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Chen-Yu Tsai <wens@csie.org>,
 Xinliang Liu <z.liuxinliang@hisilicon.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Chen Feng <puck.chen@hisilicon.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Vincent Abriou <vincent.abriou@st.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Sean Paul <sean@poorly.run>, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Yannick Fertre <yannick.fertre@st.com>, Rongrong Zou <zourongrong@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMjIsIDIwMTkgYXQgNjo0MCBBTSBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0
QGxpbnV4LW02OGsub3JnPiB3cm90ZToKPgo+IEhpIExhdXJlbnQsCj4KPiBPbiBUdWUsIE9jdCAy
MiwgMjAxOSBhdCAxOjMwIFBNIExhdXJlbnQgUGluY2hhcnQKPiA8bGF1cmVudC5waW5jaGFydEBp
ZGVhc29uYm9hcmQuY29tPiB3cm90ZToKPiA+IE9uIE1vbiwgT2N0IDIxLCAyMDE5IGF0IDA0OjQ1
OjQ4UE0gLTA1MDAsIFJvYiBIZXJyaW5nIHdyb3RlOgo+Cj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fZ2VtLmMKPiA+ID4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV9nZW0uYwo+ID4gPiBAQCAtNDE5LDYgKzQxOSw3IEBA
IGludCByb2NrY2hpcF9nZW1fZHVtYl9jcmVhdGUoc3RydWN0IGRybV9maWxlICpmaWxlX3ByaXYs
Cj4gPiA+ICAgICAgICAqIGFsaWduIHRvIDY0IGJ5dGVzIHNpbmNlIE1hbGkgcmVxdWlyZXMgaXQu
Cj4gPiA+ICAgICAgICAqLwo+ID4gPiAgICAgICBhcmdzLT5waXRjaCA9IEFMSUdOKG1pbl9waXRj
aCwgNjQpOwo+ID4gPiArICAgICBhcmdzLT5mbGFncyA9IERSTV9NT0RFX0RVTUJfS0VSTkVMX01B
UDsKPiA+ID4gICAgICAgYXJncy0+c2l6ZSA9IGFyZ3MtPnBpdGNoICogYXJncy0+aGVpZ2h0Owo+
ID4KPiA+IE15IE9DRCBnZXRzIHRyaWdnZXJlZCBieSBmbGFncyBhcHBlYXJpbmcgaW4gdGhlIG1p
ZGRsZSBoZXJlIHdoaWxlIGl0IGlzCj4gPiBhdCB0aGUgZW5kIGluIG90aGVyIGRyaXZlcnMgOi0p
Cj4KPiAuLi4gd2hpbGUgImZsYWdzIiBhcHBlYXJzIGJlZm9yZSAicGl0Y2giIGFuZCAic2l6ZSIg
aW4gdGhlIGFjdHVhbCBzdHJ1Y3QKPiBkZWZpbml0aW9uLi4uIEFhYXJnaGwgOy0pCgpUaGVyZSB3
YXMgc29tZSByZWFzb25pbmcgaGVyZSBhcyBteSBDTUEgaGVscGVyIGNvbnZlcnNpb24gcGF0Y2gg
aXMKZ29pbmcgdG8gaW5zZXJ0IGNvZGUgYmV0d2VlbiBmbGFncyBhbmQgc2l6ZS4KCkJ1dCB0byBr
ZWVwIGV2ZXJ5b25lJ3MgT0NEIGluIGNoZWNrLCBJIGNhbiBzZXQgZmxhZ3MgZmlyc3QuCgpSb2IK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
