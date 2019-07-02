Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9989F5D31C
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2019 17:40:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A805889FC8;
	Tue,  2 Jul 2019 15:40:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E10E89FC8
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2019 15:40:38 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id j6so38033800ioa.5
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jul 2019 08:40:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AuMos9aOQM3cxcuhv1W60RSW7KPJmo8XlBPpXo9DwCM=;
 b=olNabrnkp7mKm4i5OqscV7iHDPnPDlvXSFMOPrYa1AwnGpahzq6a42r+M/9ALNjpew
 U/eqYc317SNxjyin+uUTEFamEvgq/g3a3aug7yOWdYaLQgoX5pyA4H7w82dKirzfPaIn
 sbOxsURoFT1idPZPitLK13Rfd+FscJluCM7xefhwaknB5vcgw9z+C+UCf1tHykOzqR+I
 mkCGfG5l1D0ikswsiq9VN9NncesUPguea7Xp1qntyF4Fm1HiLxlf+tmVIVlNk8TpmLi0
 LAtpDnA/1JOHFBFRY6P8zs+tx6hrtepuRhgU65cuscbgErUuQp52jgAZUAtog+0IOv+P
 QDfA==
X-Gm-Message-State: APjAAAUJ+hpNIe3CXWmZUQyMb9ulvPHVxDr7eLL4JeVmj2A4JGYi53p1
 XO2GDdhzrmwqxsTAwLh5L6UsyErGZJZPNgbxwsvGtw==
X-Google-Smtp-Source: APXvYqyQn4ELrVQ+31mi6vxiW6KfqbigRcLe+LAxPCqbDf7gQDuzyI9WP9loYa7CyZvrX79HFV3MP0xrrvEDEhK+XbE=
X-Received: by 2002:a05:6638:3d6:: with SMTP id
 r22mr35517516jaq.71.1562082037872; 
 Tue, 02 Jul 2019 08:40:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190523204823.mx7l4ozklzdh7npn@flea>
 <CAMty3ZA0S=+8NBrQZvP6sFdzSYWqhNZL_KjkJAQ0jTc2RVivrw@mail.gmail.com>
 <20190604143016.fcx3ezmga244xakp@flea>
 <CAMty3ZAAK4RoE6g_LAZ-Q38On_1s_TTOz65YG7PVd88mwp-+4Q@mail.gmail.com>
 <20190613131626.7zbwvrvd4e7eafrc@flea>
 <CAMty3ZBDkMJkZm8FudNB1wQ+L-q3XVKa3zR2M0wZ5Uncdy_Ayg@mail.gmail.com>
 <20190624130442.ww4l3zctykr4i2e2@flea>
 <CAMty3ZB+eZUh5mr-LMZuEd_wrwLCN0mbf7arcRQHj8=uUNNq=Q@mail.gmail.com>
 <20190625143747.3czd7sit4waz75b6@flea>
 <CAMty3ZCh+C9+zgcL633tTw6aPW_WOLnYN7FzJHX+3zu8=8Unpg@mail.gmail.com>
 <20190702152908.fwwf7smt7nh2lxo2@flea>
In-Reply-To: <20190702152908.fwwf7smt7nh2lxo2@flea>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue, 2 Jul 2019 21:10:26 +0530
Message-ID: <CAMty3ZCBK__VcdNh6xJESjsX7nGrBHxLY3fOWW=5TxOVrwyVXw@mail.gmail.com>
Subject: Re: [linux-sunxi] Re: [PATCH v10 04/11] drm/sun4i: tcon: Compute DCLK
 dividers based on format, lanes
To: Maxime Ripard <maxime.ripard@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=AuMos9aOQM3cxcuhv1W60RSW7KPJmo8XlBPpXo9DwCM=;
 b=EXC0a6fl270PfkwfxWzCHOx4R/6yhlO7DJ1l9JUMGtuVKq/y1rC1kLXwgNQzLEEVX9
 GXFXuCSjEmgmkRMe22VN8Si9ND41RT9/KzZzdgDXlCAw4zDfk1zOI/z46qkjn/kGwM46
 b6soIF2xiVhwujyt4rbqlkDPEeXgmw6xb1yJI=
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
Cc: Bhushan Shah <bshah@mykolab.com>, David Airlie <airlied@linux.ie>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>,
 =?UTF-8?B?5Z2a5a6a5YmN6KGM?= <powerpan@qq.com>, Chen-Yu Tsai <wens@csie.org>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMiwgMjAxOSBhdCA4OjU5IFBNIE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBh
cmRAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBKdWwgMDIsIDIwMTkgYXQgMTI6MzA6
MTRBTSArMDUzMCwgSmFnYW4gVGVraSB3cm90ZToKPiA+IE9uIFR1ZSwgSnVuIDI1LCAyMDE5IGF0
IDg6MDcgUE0gTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBib290bGluLmNvbT4gd3JvdGU6
Cj4gPiA+ID4gPiA+ID4gPiA+ID4gQlNQIGhhcyB0Y29uX2RpdiBhbmQgZHNpX2Rpdi4gZHNpX2Rp
diBpcyBkeW5hbWljIHdoaWNoIGRlcGVuZHMgb24KPiA+ID4gPiA+ID4gPiA+ID4gPiBicHAvbGFu
ZXMgYW5kIGl0IGluZGVlZCBkZXBlbmRzIG9uIFBMTCBjb21wdXRhdGlvbiAobm90IHRjb25fZGl2
KSwKPiA+ID4gPiA+ID4gPiA+ID4gPiBhbnl3YXkgSSBoYXZlIGV4cGxhaW5lZCBhZ2FpbiBvbiB0
aGlzIGluaXRpYWwgbGluayB5b3UgbWVudGlvbmVkLgo+ID4gPiA+ID4gPiA+ID4gPiA+IFBsZWFz
ZSBoYXZlIGEgbG9vayBhbmQgZ2V0IGJhY2suCj4gPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+
ID4gPiA+IEknbGwgaGF2ZSBhIGxvb2ssIHRoYW5rcy4KPiA+ID4gPiA+ID4gPiA+ID4KPiA+ID4g
PiA+ID4gPiA+ID4gSSd2ZSBnaXZlbiB5b3VyIHBhdGNoZXMgYSB0cnkgb24gbXkgc2V0dXAgdGhv
dWdoLCBhbmQgdGhpcyBwYXRjaAo+ID4gPiA+ID4gPiA+ID4gPiBicmVha3MgaXQgd2l0aCB2Ymxh
bmsgdGltZW91dHMgYW5kIHNvbWUgaG9yaXpvbnRhbCBsaW5lcyB0aGF0IGxvb2tzCj4gPiA+ID4g
PiA+ID4gPiA+IGxpa2Ugd2hhdCBzaG91bGQgYmUgZGlzcGxheWVkLCBidXQgYmxpbmtpbmcgYW5k
IG9uIHRoZSByaWdodCBvZiB0aGUKPiA+ID4gPiA+ID4gPiA+ID4gZGlzcGxheS4gVGhlIHByZXZp
b3VzIG9uZXMgYXJlIGZpbmUgdGhvdWdoLgo+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+
IFdvdWxkIHlvdSBwbGVhc2Ugc2VuZCBtZSB0aGUgbGluayBvZiBwYW5lbCBkcml2ZXIuCj4gPiA+
ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBJdCdzIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1y
b25iby1yYjA3MGQzMC5jCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IExvb2sgbGlrZSB0aGlzIHBh
bmVsIHdvcmsgZXZlbiB3L28gYW55IHZlbmRvciBzZXF1ZW5jZS4gaXQncyBzaW1pbGFyCj4gPiA+
ID4gPiA+IHRvIHRoZSA0LWxhbmUgcGFuZWwgSSBoYXZlIHdpdGggUkdCODg4LCBzbyB0aGUgZGNs
ayBkaXYgaXMgNiwgaXMgaXQKPiA+ID4gPiA+ID4gd29ya2luZyB3aXRoIHRoaXMgZGl2aWRlcj8K
PiA+ID4gPiA+Cj4gPiA+ID4gPiBJdCB3b3JrcyB3aXRoIDQsIGl0IGRvZXNuJ3Qgd29yayB3aXRo
IDYuCj4gPiA+ID4KPiA+ID4gPiBDYW4gYmUgdGhlIHBpeGVsIGNsb2NrIHdpdGggYXNzb2NpYXRl
ZCB0aW1pbmdzIGNhbiBtYWtlIHRoaXMgZGlmZi4KPiA+ID4gPiBXb3VsZCB5b3Ugc2VuZCBtZSB0
aGUgcGl4ZWwgY2xvY2ssIHBsbF9yYXRlIGFuZCB0aW1pbmdzIHRoaXMgcGFuZWwKPiA+ID4gPiB1
c2VkIGl0IGZyb20gQlNQPwo+ID4gPgo+ID4gPiBUaGlzIGJvYXJkIG5ldmVyIGhhZCBhbiBBbGx3
aW5uZXIgQlNQCj4gPgo+ID4gUnVubmluZyBvbiBCU1Agd291bGQgaGVscCB0byB1bmRlcnN0YW5k
IHNvbWUgY2x1ZSwgYW55d2F5IHdvdWxkIHlvdQo+ID4gc2VuZCBtZSB0aGUgdGhlIHZhbHVlIFBM
TF9NSVBJIHJlZ2lzdGVyIChkZXZtZSAweDFjMjAwNDApIG9uIHRoaXMKPiA+IGJvYXJkLiBJJ20g
dHJ5aW5nIHRvIHVuZGVyc3RhbmQgaG93IGl0IHZhbHVlIGluIHlvdXIgY2FzZS4KPgo+IEknbSBz
b3JyeSwgYnV0IEknbSBub3QgZ29pbmcgdG8gcG9ydCBhIHdob2xlIEJTUCBvbiB0aGF0IGJvYXJk
LAo+IGVzcGVjaWFsbHkgZm9yIHNvbWV0aGluZyBJIGhhdmVuJ3QgYmVlbiBjb252aW5jZWQgaXQn
cyB0aGUgcmlnaHQgZml4LgoKTG9vayBsaWtlIGEgZGVhZCBsb2NrIGhlcmUsIHRoaXMgY2hhbmdl
IGhhcyBhIGNvbmNsdXNpdmUgZXZpZGVuY2UgZnJvbQpCU1AgKHdoaWNoIGlzIEFXIGRhdGFzaGVl
dCBvciBvcGVuIGNvZGUgdG8gb3V0c2lkZSB3b3JsZCkgYW5kIGl0IGlzCndvcmtpbmcgd2l0aCBB
MzMsIEE2NCBhbmQgUjQwIHdoaWNoIHdhcyB0ZXN0ZWQgaW4gNCBkaWZmZXJlbnQgcGFuZWxzCmFu
ZCBJIGRvbid0IHVuZGVyc3RhbmQgdGhlIHJlYXNvbiBmb3Igbm90IGdvaW5nIHdpdGggdGhpcyAo
YXRsZWFzdApjaGVjayB3aXRoIHJlc3BlY3QgdG8gQlNQKS4KClBsZWFzZSBzdWdnZXN0LCB3aGF0
IEkgY2FuIGRvIGZ1cnRoZXIsIHlvdXIgc3VnZ2VzdGlvbiBpcyB2ZXJ5IGhlbHBmdWwgaGVyZS4K
CkphZ2FuLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
