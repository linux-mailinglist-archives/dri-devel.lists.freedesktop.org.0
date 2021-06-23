Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A873B1BCF
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 15:59:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07A196E0DA;
	Wed, 23 Jun 2021 13:59:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A38D6E0DA
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 13:59:32 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3BFB08B6;
 Wed, 23 Jun 2021 15:59:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1624456770;
 bh=ls/eY08oJTMff7wXCIzJl5jDcaF07GxdUrqlqumyQlk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bmYlxvycnAJOUUYXnTZAiCI2wiZcvSbKYDGHrDJZj/n7UTdR3miefqbbbac14UClR
 iNygB7GGJuNExmPzrPtDwI9yEk7RUWZg0eWqKO+lwaX2SOqmiVKUs1bSiYJE9hZs9C
 GzGeOpjQkMCbwowMeW/EiSWZnG0COXA+nlnDckX0=
Date: Wed, 23 Jun 2021 16:59:00 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [RFC PATCH 10/11] drm/bridge: ti-sn65dsi86: Support DisplayPort
 (non-eDP) mode
Message-ID: <YNM+JO4AAkPOLg7Y@pendragon.ideasonboard.com>
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210322030128.2283-11-laurent.pinchart+renesas@ideasonboard.com>
 <CAD=FV=Wwayx1Y-xv=RPuJbG+Q1wHrUWgh4P7wuzy_bAL=_FN0g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAD=FV=Wwayx1Y-xv=RPuJbG+Q1wHrUWgh4P7wuzy_bAL=_FN0g@mail.gmail.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, linux-renesas-soc@vger.kernel.org,
 Andrzej Hajda <a.hajda@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Doug,

On Wed, Mar 24, 2021 at 03:47:07PM -0700, Doug Anderson wrote:
> On Sun, Mar 21, 2021 at 8:02 PM Laurent Pinchart wrote:
> >
> > Despite the SN65DSI86 being an eDP bridge, on some systems its output is
> > routed to a DisplayPort connector. Enable DisplayPort mode when the next
> > component in the display pipeline is not a panel, and disable eDP
> > features in that case.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 32 ++++++++++++++++++++-------
> >  1 file changed, 24 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > index e2527d597ccb..f792227142a7 100644
> > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > @@ -55,6 +55,7 @@
> >  #define SN_LN_ASSIGN_REG                       0x59
> >  #define  LN_ASSIGN_WIDTH                       2
> >  #define SN_ENH_FRAME_REG                       0x5A
> > +#define  ASSR_CONTROL                          BIT(0)
> >  #define  VSTREAM_ENABLE                                BIT(3)
> >  #define  LN_POLRS_OFFSET                       4
> >  #define  LN_POLRS_MASK                         0xf0
> > @@ -86,6 +87,8 @@
> >  #define SN_DATARATE_CONFIG_REG                 0x94
> >  #define  DP_DATARATE_MASK                      GENMASK(7, 5)
> >  #define  DP_DATARATE(x)                                ((x) << 5)
> > +#define SN_TRAINING_SETTING_REG                        0x95
> > +#define  SCRAMBLE_DISABLE                      BIT(4)
> >  #define SN_ML_TX_MODE_REG                      0x96
> >  #define  ML_TX_MAIN_LINK_OFF                   0
> >  #define  ML_TX_NORMAL_MODE                     BIT(0)
> > @@ -723,6 +726,11 @@ static int ti_sn_link_training(struct ti_sn_bridge *pdata, int dp_rate_idx,
> >         regmap_update_bits(pdata->regmap, SN_DATARATE_CONFIG_REG,
> >                            DP_DATARATE_MASK, DP_DATARATE(dp_rate_idx));
> >
> > +       /* For DisplayPort, use the standard DP scrambler seed. */
> > +       if (pdata->bridge.type == DRM_MODE_CONNECTOR_DisplayPort)
> > +               regmap_update_bits(pdata->regmap, SN_ENH_FRAME_REG,
> > +                                  ASSR_CONTROL, 0);
> 
> I don't actually know anything about DP scrambler seeds. However:
> 
> 1. From reading the docs, this field seems to be documented to be
> "read only" unless:
> 
> 1a) The "TEST2" pin is pulled high when you power on the bridge.
> 1b) You set "ASSR_OVERRIDE" (page select to page 7, write to register
> 0x16, page select back to page 0).
> 
> I don't know if TEST2 is being pulled high in your hardware, but at
> least I can see that 1b) isn't done. So I'm guessing that this line is
> a no-op? If I had to guess from all the hoops they're making you jump
> through there's some sort of errata around standard scrambling on this
> bridge chip. Are you sure it works OK?

Good question :-) We managed to get the SN65DSI86 to work with an
external DP monitor yesterday, so it's possible (some modes don't
operate correctly yet, but I assume that to be an issue with the DSI
encoder).

The TEST2 pin is strapped to ground on the board.

According to the DisplayPort specification, eDP and DP use different
scrambler seeds to prevent interoperability between an eDP source and a
DP sink. I'll check what happens without this change.

> 2. The docs I see claim that this field is 2 bits big. It seems like
> it would be nice to honor. Yeah, it's silly because 0x11 and 0x10 are
> "reserved" so it's really more like a 1-bit field, but still seems
> like it would be better to set both bits, or at least add a comment
> explaining why you're not matching the datasheet.

Sure.

> 3. Your patch doesn't seem to touch the bit of code in
> ti_sn_bridge_enable() that says this:
> 
> /**
>  * The SN65DSI86 only supports ASSR Display Authentication method and
>  * this method is enabled by default. An eDP panel must support this
>  * authentication method. We need to enable this method in the eDP panel
>  * at DisplayPort address 0x0010A prior to link training.
>  */
> drm_dp_dpcd_writeb(&pdata->aux, DP_EDP_CONFIGURATION_SET,
>    DP_ALTERNATE_SCRAMBLER_RESET_ENABLE);
> 
> Won't that be a problem?

I'll have a look.

> > +
> >         /* enable DP PLL */
> >         regmap_write(pdata->regmap, SN_PLL_ENABLE_REG, 1);
> >
> > @@ -734,6 +742,11 @@ static int ti_sn_link_training(struct ti_sn_bridge *pdata, int dp_rate_idx,
> >                 goto exit;
> >         }
> >
> > +       /* For DisplayPort, disable scrambling mode. */
> > +       if (pdata->bridge.type == DRM_MODE_CONNECTOR_DisplayPort)
> > +               regmap_update_bits(pdata->regmap, SN_TRAINING_SETTING_REG,
> > +                                  SCRAMBLE_DISABLE, SCRAMBLE_DISABLE);
> 
> I'm assuming that this is the important part of your patch? Would be
> sorta nice to include the "why" in your comment. Why do you want to
> disable scrambling mode for DP but not for eDP? Maybe you care about
> compatibility but not EMI if you're hooking up to random DP things?

I'll investigate and include proper documentation in v2 (or drop the
change altogether if it's not required).

-- 
Regards,

Laurent Pinchart
