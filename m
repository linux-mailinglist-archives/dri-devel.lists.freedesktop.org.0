Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4BDE21FD
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 19:42:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2CB06EB57;
	Wed, 23 Oct 2019 17:42:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65ACA6EB57
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 17:42:55 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2A97121D81
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 17:42:55 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id u184so20570114qkd.4
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 10:42:55 -0700 (PDT)
X-Gm-Message-State: APjAAAXtYRPnT3mGcJcyIEHss0Kn5Tz9FRSh3rOFzIAGPKWclFMVffGu
 Z0GSdM843GnbtCIgbsLmF0txfjWG3OoSYWgsJQ==
X-Google-Smtp-Source: APXvYqyuh/XWFNyrpsa1JhFwoa2PiHMb3DrmJcjTiQicDd2Twa2DKVtOZdwWw/pNA4z2JJqXpQHFweiKQz+jhiRVtUU=
X-Received: by 2002:a37:9847:: with SMTP id a68mr9887831qke.223.1571852574174; 
 Wed, 23 Oct 2019 10:42:54 -0700 (PDT)
MIME-Version: 1.0
References: <20191021214550.1461-1-robh@kernel.org>
 <20191021214550.1461-6-robh@kernel.org>
 <1cbca96c-19dd-1d15-949c-7fbcc15369b4@gmail.com>
In-Reply-To: <1cbca96c-19dd-1d15-949c-7fbcc15369b4@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 23 Oct 2019 12:42:43 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL6G=F45G+-QXF6T1269f9YquXfYtjoUkCpAoNartxM=Q@mail.gmail.com>
Message-ID: <CAL_JsqL6G=F45G+-QXF6T1269f9YquXfYtjoUkCpAoNartxM=Q@mail.gmail.com>
Subject: Re: [PATCH 5/6] drm/mediatek: Convert to use CMA helpers
To: Matthias Brugger <matthias.bgg@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1571852575;
 bh=Zdd+bgen4VCdF1TuKnoa4pMTs+dOffO7IeAg+rc9+gE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=eh7HMESxDN1m3ndZNJdg5HSRI8CkYBB2carSLn+avNAW9l1F1Bkv9veylygmjsFoN
 SHNlKpRIbd9x6tBOMS/IvKXbwDlDV5yoQITMR30rNGV2cHjeaZA/N0JoN/FQ9Of8Yb
 b3u8sJE9FFjhWMQdh+HlR4zQ7M7XDGqgjqg7E2vI=
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
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>,
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

T24gVHVlLCBPY3QgMjIsIDIwMTkgYXQgMTI6MDcgUE0gTWF0dGhpYXMgQnJ1Z2dlcgo8bWF0dGhp
YXMuYmdnQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBIaSBSb2IsCj4KPiBPbiAyMS8xMC8yMDE5IDIz
OjQ1LCBSb2IgSGVycmluZyB3cm90ZToKPiA+IFRoZSBvbmx5IHJlYXNvbiB0aGUgTWVkaWF0ZWsg
ZHJpdmVyIGRvZXNuJ3QgdXNlIHRoZSBDTUEgaGVscGVycyBpcyBpdAo+ID4gc2V0cyBETUFfQVRU
Ul9OT19LRVJORUxfTUFQUElORyBhbmQgZG9lcyBhIHZtYXAoKSBvbiBkZW1hbmQuIFVzaW5nCj4g
PiB2bWFwKCkgaXMgbm90IGV2ZW4gZ3VhcmFudGVlZCB0byB3b3JrIGFzIERNQSBidWZmZXJzIG1h
eSBub3QgaGF2ZSBhCj4gPiBzdHJ1Y3QgcGFnZS4gTm93IHRoYXQgdGhlIENNQSBoZWxwZXJzIHN1
cHBvcnQgc2V0dGluZwo+ID4gRE1BX0FUVFJfTk9fS0VSTkVMX01BUFBJTkcgYXMgbmVlZGVkIG9y
IG5vdCwgY29udmVydCBNZWRpYXRlayBkcml2ZXIgdG8KPiA+IHVzZSBDTUEgaGVscGVycy4KPiA+
Cj4gPiBDYzogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4KPiA+IENjOiBQaGlsaXBwIFphYmVs
IDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPgo+ID4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBs
aW51eC5pZT4KPiA+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gPiBDYzog
TWF0dGhpYXMgQnJ1Z2dlciA8bWF0dGhpYXMuYmdnQGdtYWlsLmNvbT4KPiA+IENjOiBsaW51eC1h
cm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKPiA+IENjOiBsaW51eC1tZWRpYXRla0BsaXN0
cy5pbmZyYWRlYWQub3JnCj4gPiBTaWduZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJu
ZWwub3JnPgo+ID4gLS0tCj4KPiBJIHRlc3RlZCB0aGlzIG9uIG15IENocm9tZWJvb2sgd2l0aCBz
b21lIHBhdGNoZXMgb24gdG9wIG9mIHY1LjQtcmMxIFsxXSwgd2hpY2gKPiB3b3JrLiBJZiBJIGFk
ZCB5b3VyIHBhdGNoZXMgb24gdG9wIG9mIHRoYXQsIHRoZSBzeXN0ZW0gZG9lcyBub3QgYm9vdCB1
cC4KPiBVbmZvcnR1bmF0ZWx5IEkgZG9uJ3QgaGF2ZSBhIHNlcmlhbCBjb25zb2xlLCBzbyBJIHdh
c24ndCBhYmxlIHRvIHNlZSBpZiB0aGVyZSBpcwo+IGFueSBlcnJvciBtZXNzYWdlLgoKVGhhbmtz
IGZvciB0ZXN0aW5nLiBJJ20gYmFzZWQgb24gZHJtLW1pc2MtbmV4dCwgYnV0IGRvbid0IHNlZSBh
bnl0aGluZwpvYnZpb3VzIHRoZXJlIHRoYXQgd291bGQgbWF0dGVyLiBUaGVyZSBhcmUgc29tZSBt
bWFwIGNoYW5nZXMsIGJ1dCBJCnRoaW5rIHRoZXkgc2hvdWxkbid0IG1hdHRlci4KCkRpZCB5b3Ug
aGF2ZSBmYmNvbiBlbmFibGVkPyBUaGF0IG1heSBnaXZlIG1vcmUgY2x1ZXMgYWJvdXQgd2hlcmUg
dGhlIHByb2JsZW0gaXMuCgpSb2IKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
