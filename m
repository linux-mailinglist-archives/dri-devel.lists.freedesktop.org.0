Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C82F213167C
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 18:08:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E71A6E4AD;
	Mon,  6 Jan 2020 17:08:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60D6D6E4AD
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2020 17:08:14 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id B1E2080554;
 Mon,  6 Jan 2020 18:08:09 +0100 (CET)
Date: Mon, 6 Jan 2020 18:08:08 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 3/3] drm: tiny: st7735r: Add support for Okaya RH128128T
Message-ID: <20200106170808.GA21745@ravnborg.org>
References: <20200102141246.370-1-geert+renesas@glider.be>
 <20200102141246.370-4-geert+renesas@glider.be>
 <20200105091303.GB29102@ravnborg.org>
 <CAMuHMdUL3tCZzCDyJkmqYT5n+-t+Z-Ubo4=+NJpHpZU1w5C07g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdUL3tCZzCDyJkmqYT5n+-t+Z-Ubo4=+NJpHpZU1w5C07g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=jzz1BgsP7IGNGfLaZHoA:9 a=CjuIK1q_8ugA:10 a=pHzHmUro8NiASowvMSCR:22
 a=6VlIyEUom7LUIeUMNQJH:22
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Lechner <david@lechnology.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Chris Brandt <chris.brandt@renesas.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert.

> Thanks for your comments!
> 
> > On Thu, Jan 02, 2020 at 03:12:46PM +0100, Geert Uytterhoeven wrote:
> > > Add support for the Okaya RH128128T display to the st7735r driver.
> > >
> > > The RH128128T is a 128x128 1.44" TFT display driven by a Sitronix
> > > ST7715R TFT Controller/Driver.  The latter is very similar to the
> > > ST7735R, and can be handled by the existing st7735r driver.
> >
> > As a general comment - it would have eased review if this was split
> > in two patches.
> > One patch to introduce the infrastructure to deal with another set of
> > controller/display and one patch introducing the new combination.
> 
> I had thought about that, but didn't pursue as the new combination is
> just 7 added lines.  If you prefer a split, I can do that.

The good thing with a split is that is shows how little is really
required to support a new controller/panel pair.
So it would be good if you did so.

> 
> > > --- a/drivers/gpu/drm/tiny/st7735r.c
> > > +++ b/drivers/gpu/drm/tiny/st7735r.c
> > > @@ -1,8 +1,9 @@
> > >  // SPDX-License-Identifier: GPL-2.0+
> > >  /*
> > > - * DRM driver for Sitronix ST7735R panels
> > > + * DRM driver for Sitronix ST7715R/ST7735R panels
> >
> > This comment could describe the situation a little better.
> > This is a sitronix st7735r controller with a jianda jd-t18003-t01
> > display.
> > Or a sitronix st7715r controller with a okaya rh128128t display.
> 
> Indeed. It is currently limited to two controller/display combos.
> But I expect more combos to be added over time.
> Hence does it make sense to describe all of that in the top comments?

If we do describe it we should do so as kernel-doc and then wire up the
driver somwhere under Documentation/gpu/
But there is no good place to wire it up yet.

> > > @@ -37,12 +39,28 @@
> > >  #define ST7735R_MY   BIT(7)
> > >  #define ST7735R_MX   BIT(6)
> > >  #define ST7735R_MV   BIT(5)
> > > +#define ST7735R_RGB  BIT(3)
> > > +
> > > +struct st7735r_cfg {
> > > +     const struct drm_display_mode mode;
> > > +     unsigned int left_offset;
> > > +     unsigned int top_offset;
> > > +     unsigned int write_only:1;
> > > +     unsigned int rgb:1;             /* RGB (vs. BGR) */
> > > +};
> > > +
> > > +struct st7735r_priv {
> > > +     struct mipi_dbi_dev dbidev;     /* Must be first for .release() */
> > > +     unsigned int rgb:1;
> > > +};
> >
> > The structs here uses "st7735r" as the generic prefix.
> > But the rest of this file uses "jd_t18003_t01" as the generic prefix.
> >
> > It would help readability if the same prefix is used for the common
> > stuff everywhere.
> 
> Agreed.
> So I think it makes most sense to rename jd_t18003_t01_pipe_{enable,funcs}
> to sh7735r_pipe_{enable,funcs}?
s/sh/st/
Yeah, or maybe just sitronix_pipe_{enable,funcs} as we have support
for more than one Sitronix controller anyway.

> If needed, the display-specific parts (e.g. gamma parameters) could be
> factored out in st7735r_cfg later, if neeeded.
> 
> In reality, there are lots of different ways to communicate with an
> ST77[13]5R display controller (3/4-wire SPI, or 6800/8080 bus, ...), and
> lots of different ways to wire a display to the controller.  Ideally,
> this should be described in DT.  As I don't have schematics for the
> display board, doing so is difficult, and will miss important details,
> which may lead to DTB ABI compatibility issues later.
> I understand using these compatible combinations was a pragmatic solution
> to this problem.
Agreed, let's bite that when we have a display we care enough about
and maybe then we also can write a proper driver for it.
I have a few displays here using 8080 and I hope someone steps up
to do proper support for such displays.

> > >
> > >  static const struct spi_device_id st7735r_id[] = {
> > > -     { "jd-t18003-t01", 0 },
> > > +     { "jd-t18003-t01", (uintptr_t)&jd_t18003_t01_cfg },
> > >       { },
> > { /* sentinel */ },
> >
> > Do we need an entry for "okaya,rh128128t" here?
> >
> > Note: I have not fully understood how MODULE_DEVICE_TABLE()
> > works - so forgive me my ignorance.
> 
> st7735r_id[] is used for matching based on platform device name.
> Hence an entry is needed only to use the display on non-DT systems.
> Can be added later, if ever needed.
> 
> Note that there is a separate MODULE_DEVICE_TABLE() for DT-based matching,
> so the driver module will be auto-loaded on DT-based systems.

Thanks for the explanation.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
