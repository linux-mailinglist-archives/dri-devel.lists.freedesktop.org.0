Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19ACE4F3304
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 15:08:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C55F610E5D3;
	Tue,  5 Apr 2022 13:08:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2752210E5D3
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Apr 2022 13:08:10 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 191D95D;
 Tue,  5 Apr 2022 15:08:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1649164088;
 bh=bpKW22A1yHVmRKVgthdTbw7vllpmnsDe2wEdGGtKvJE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Nj33o66tgcGAllW57bzY2lZMXlIm4LeubEPrTHjWgLosvx0744gPvCS81Z1SO+sT4
 av9QZT/xUHZFX/e8nm8F7TaULMha0erisPp0LnOUXy5cLwkt44TiFlUcdFIjlFeBTV
 Ao1x3gZF/N7lGl7XaaSxGvSsY+TynNl5HH2b/YDI=
Date: Tue, 5 Apr 2022 16:08:04 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH][RESEND] drm/bridge: ti-sn65dsi83: Check link status
 register after enabling the bridge
Message-ID: <Ykw/NEI03rXJ+C9Y@pendragon.ideasonboard.com>
References: <20220213022648.495895-1-marex@denx.de>
 <YkwrDtqhY+Ru2bxG@pendragon.ideasonboard.com>
 <CAPY8ntA+GpJ6WFwJbDcKjD5N2TdKAqv2kQPjrFbcJW=OoFL_Yg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPY8ntA+GpJ6WFwJbDcKjD5N2TdKAqv2kQPjrFbcJW=OoFL_Yg@mail.gmail.com>
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
Cc: Marek Vasut <marex@denx.de>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Robert Foss <robert.foss@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave,

On Tue, Apr 05, 2022 at 01:00:28PM +0100, Dave Stevenson wrote:
> On Tue, 5 Apr 2022 at 12:42, Laurent Pinchart wrote:
> > On Sun, Feb 13, 2022 at 03:26:48AM +0100, Marek Vasut wrote:
> > > In rare cases, the bridge may not start up correctly, which usually
> > > leads to no display output. In case this happens, warn about it in
> > > the kernel log.
> >
> > Do you know what this is caused by ? It's a bit annoying to add a 10+ms
> > delay at start time just to be notified of rare cases.
> 
> The datasheet [1] section 7.4.2 Initialization Sequence states in step 2
> "After power is applied and stable, the DSI CLK lanes MUST be in HS
> state and the DSI data lanes MUST be driven
> to LP11 state"
> Data lanes shouldn't go to HS until step 8 after the DSI83 has been configured.
> 
> Configuration from the driver is being done from atomic_enable,
> therefore the data lanes are likely in HS mode and sending video, not
> LP11.
> 
> Deviate from the specified initialisation sequence at your peril!
> 
> The SN65DSI8[3|4|5] is one of the DSI devices that I'd been looking at
> with the DSI ordering patches [2] so that we could initialise it in
> the way specified in the datasheet. I've had no responses to v2 of
> those patches though.

Sounds like I need to review that :-) It's still in my queue, I'll try
to push it to the top.

Do you think this patch could then be reverted ?

> [1] https://www.ti.com/lit/ds/symlink/sn65dsi83.pdf
> [2] https://patchwork.freedesktop.org/series/100252/#rev2
> 
> > > Signed-off-by: Marek Vasut <marex@denx.de>
> > > Cc: Jagan Teki <jagan@amarulasolutions.com>
> > > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Cc: Linus Walleij <linus.walleij@linaro.org>
> > > Cc: Robert Foss <robert.foss@linaro.org>
> > > Cc: Sam Ravnborg <sam@ravnborg.org>
> > > Cc: dri-devel@lists.freedesktop.org
> > > ---
> > >  drivers/gpu/drm/bridge/ti-sn65dsi83.c | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> > > index 19daaddd29a41..1d7c154ea1d79 100644
> > > --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> > > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> > > @@ -488,6 +488,11 @@ static void sn65dsi83_atomic_enable(struct drm_bridge *bridge,
> > >       /* Clear all errors that got asserted during initialization. */
> > >       regmap_read(ctx->regmap, REG_IRQ_STAT, &pval);
> > >       regmap_write(ctx->regmap, REG_IRQ_STAT, pval);
> > > +
> > > +     usleep_range(10000, 12000);
> > > +     regmap_read(ctx->regmap, REG_IRQ_STAT, &pval);
> > > +     if (pval)
> > > +             dev_err(ctx->dev, "Unexpected link status 0x%02x\n", pval);
> > >  }
> > >
> > >  static void sn65dsi83_atomic_disable(struct drm_bridge *bridge,

-- 
Regards,

Laurent Pinchart
