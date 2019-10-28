Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC525E7C61
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2019 23:34:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61FD66E0AD;
	Mon, 28 Oct 2019 22:34:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C27FC6E0AD
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2019 22:34:08 +0000 (UTC)
Received: by mail-il1-x144.google.com with SMTP id a13so9653377ilp.1
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2019 15:34:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c2XX2oa9okl2tfpust4RUifahZHp7tb1+MoPm2u47Wc=;
 b=MAZwdCBumFk6W2O1KA8c1TjP/ouFMwokS4FQQ+EcZvdoTymTU2x1tvEVa/e6ThaxUB
 6B+GW/ITvXmVIFBuxZx4aH/Ym/jfxiPivdcIXcrtqECy60uPR6foZAlQFawcnOmFPbzu
 MVBlCigEIAkVdIbMvJAH+itc3o7IoM0Sfu/qHjcqpT+5YmAlSdhm5uWs0trZKZqLwuqX
 6jepXYdiavE1Wler852X49U1hJx0Q42BSKuu5yxNwBSKsEbBFZDl+jRM7a6KWL8PpM7P
 6tS7cbKa12Z9w/XeQ+u5AAIMZgEE85sAdlOUHWnRKUYt5U0iUU8I7Pm/SNJ0KtdR55vD
 KGkg==
X-Gm-Message-State: APjAAAUABLhsBkGBsNfjrJUIpvghCc/ERaOki3wVHogGCV6rmcpJ6348
 oLKtz1IbXN4YVyjaxHoqpgGlUBHch2Ehou0hHPooww==
X-Google-Smtp-Source: APXvYqyCGJQl+HAm+sa8mYYJp4Wxr/m+y+g/6ntOZCrMubS4XyZUczCAk4EdzfbP8O6fyXYOHmttxwz3zGzyvqk0tc0=
X-Received: by 2002:a92:99ca:: with SMTP id t71mr8413794ilk.61.1572302047950; 
 Mon, 28 Oct 2019 15:34:07 -0700 (PDT)
MIME-Version: 1.0
References: <20191025175625.8011-1-jagan@amarulasolutions.com>
 <20191025175625.8011-5-jagan@amarulasolutions.com>
 <20191028153427.pc3tnoz2d23filhx@hendrix>
In-Reply-To: <20191028153427.pc3tnoz2d23filhx@hendrix>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue, 29 Oct 2019 04:03:56 +0530
Message-ID: <CAMty3ZCisTrFGjzHyqSofqFAsKSLV1n2xP5Li3Lonhdi0WUZVA@mail.gmail.com>
Subject: Re: [PATCH v11 4/7] drm/sun4i: dsi: Handle bus clock explicitly 
To: Maxime Ripard <mripard@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=c2XX2oa9okl2tfpust4RUifahZHp7tb1+MoPm2u47Wc=;
 b=n4p86JogluIaUwX8lpVfKCl315ggHShPT/3PG9nmdvv6A+WmkcxoXlJ1p500UHclpZ
 V7orIaazLLn5Miq8ZaNeWiihu1+79cg9oAg+i/LcaIdcqZQ5iG4T4aVCMjo26c+Cdn97
 r3IOx7w0Y6kNlL3cRfnacuWuUmSw1xh6YKtgE=
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTWF4aW1lLAoKT24gTW9uLCBPY3QgMjgsIDIwMTkgYXQgOTowNiBQTSBNYXhpbWUgUmlwYXJk
IDxtcmlwYXJkQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gRnJpLCBPY3QgMjUsIDIwMTkgYXQg
MTE6MjY6MjJQTSArMDUzMCwgSmFnYW4gVGVraSB3cm90ZToKPiA+IFVzYWdlIG9mIGNsb2NrcyBh
cmUgdmFyaWVzIGJldHdlZW4gZGlmZmVyZW50IEFsbHdpbm5lcgo+ID4gRFNJIGNvbnRyb2xsZXJz
LiBDbG9ja2luZyBpbiBBMzMgd291bGQgbmVlZCBidXMgYW5kCj4gPiBtb2QgY2xvY2tzIHdoZXJl
IGFzIEE2NCB3b3VsZCBuZWVkIG9ubHkgYnVzIGNsb2NrLgo+ID4KPiA+IFRvIHN1cHBvcnQgdGhp
cyBraW5kIG9mIGNsb2NraW5nIHN0cnVjdHVyZSB2YXJpYW50cwo+ID4gaW4gdGhlIHNhbWUgZHNp
IGRyaXZlciwKPgo+IFRoZXJlJ3Mgbm8gdmFyaWFuY2UgaW4gdGhlIGNsb2NrIHN0cnVjdHVyZSBh
cyBmYXIgYXMgdGhlIGJ1cyBjbG9jayBpcwo+IGNvbmNlcm5lZC4KPgo+ID4gZXhwbGljaXQgaGFu
ZGxpbmcgb2YgY29tbW9uIGNsb2NrIHdvdWxkIHJlcXVpcmUgc2luY2UgdGhlIEE2NAo+ID4gZG9l
c24ndCBuZWVkIHRvIG1lbnRpb24gdGhlIGNsb2NrLW5hbWVzIGV4cGxpY2l0bHkgaW4gZHRzIHNp
bmNlIGl0Cj4gPiBzdXBwb3J0IG9ubHkgb25lIGJ1cyBjbG9jay4KPiA+Cj4gPiBBbHNvIHBhc3Mg
Y2xrX2lkIE5VTEwgaW5zdGVhZCAiYnVzIiB0byByZWdtYXAgY2xvY2sgaW5pdCBmdW5jdGlvbgo+
ID4gc2luY2UgdGhlIHNpbmdsZSBjbG9jayB2YXJpYW50cyBubyBuZWVkIHRvIG1lbnRpb24gY2xv
Y2stbmFtZXMKPiA+IGV4cGxpY2l0bHkuCj4KPiBZb3UgZG9uJ3QgbmVlZCBleHBsaWNpdCBjbG9j
ayBoYW5kbGluZy4gUGFzc2luZyBOVUxMIGFzIHRoZSBhcmd1bWVudAo+IGluIHJlZ21hcF9pbml0
X21taW9fY2xrIHdpbGwgbWFrZSBpdCB1c2UgdGhlIGZpcnN0IGNsb2NrLCB3aGljaCBpcyB0aGUK
PiBidXMgY2xvY2suCgpJbmRlZWQgSSB0cmllZCB0aGF0LCBzaW5jZSBOVUxMIGNsa19pZCB3b3Vs
ZG4ndCBlbmFibGUgdGhlIGJ1cyBjbG9jawpkdXJpbmcgcmVnbWFwX21taW9fZ2VuX2NvbnRleHQg
Y29kZSwgcGFzc2luZyBOVUxMIHRyaWdnZXJpbmcgdmJsYW5rCnRpbWVvdXQuCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
