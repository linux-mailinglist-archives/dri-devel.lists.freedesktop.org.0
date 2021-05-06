Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C51F6375452
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 15:03:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 189906E1CD;
	Thu,  6 May 2021 13:03:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DA736E1CD
 for <dri-devel@lists.freedesktop.org>; Thu,  6 May 2021 13:03:44 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C4F514A5;
 Thu,  6 May 2021 15:03:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1620306222;
 bh=WhrgmKG0FxZG3eUzUrnNjh9YOGSfZ7DB/CLi6X1drpU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sUVps1SdsEtYq45iT2/OFgev8ZtZb2q1dK/xBLfPI1R2iIBy1inpoN4FDDJiEmmR7
 AhFWV4MQmZeXljDxHXE79tu9MPOEtMo96TzPOzvBHD2dD1rZ/Uz29ifsgMdZs8MYpi
 J+9ZNug3K6vwhVeMSvQ7PAxjvHbG0TKMCZqOicA8=
Date: Thu, 6 May 2021 16:03:37 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH V3 2/2] drm/bridge: ti-sn65dsi83: Add TI SN65DSI83 and
 SN65DSI84 driver
Message-ID: <YJPpKbvlBQlnF5Iz@pendragon.ideasonboard.com>
References: <20210505100218.108024-1-marex@denx.de>
 <20210505100218.108024-2-marex@denx.de>
 <CAPY8ntD8T8B6y4S70vya=PBP9hJs=w2kcovYEMG8n4mFpd0APA@mail.gmail.com>
 <b806a975-352b-6755-d5b0-232d1d8ccda0@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b806a975-352b-6755-d5b0-232d1d8ccda0@denx.de>
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
Cc: Loic Poulain <loic.poulain@linaro.org>, ch@denx.de,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Douglas Anderson <dianders@chromium.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Valentin Raevsky <valentin@compulab.co.il>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

On Thu, May 06, 2021 at 02:48:11PM +0200, Marek Vasut wrote:
> On 5/6/21 11:45 AM, Dave Stevenson wrote:
> > Hi Marek
> 
> Hi,
> 
> > I'm taking an interest as there are a number of Raspberry Pi users
> > trying to get this chip up and running (not there quite yet).
> > A couple of fairly minor comments
> 
> Is there any readily available display unit / expansion board with this 
> chip ?

For what it's worth, I have a board with a Raspberry Pi CM4 and a
SN65DSI83. It's a customer design, not an off-the-shelf part I'm afraid,
but I plan to eventually test your driver on it.

> [...]
> 
> >> +#define REG_DSI_LANE                           0x10
> >> +#define  REG_DSI_LANE_LVDS_LINK_CFG_DUAL       BIT(5) /* dual or 2x single */
> > 
> > The bit name here seems a little odd.
> > Bits 5&6 are the DSI channel mode on SN65DSI85, not the LVDS link
> > config (which appears to be reg 0x18 bit 4)
> > DSI_CHANNEL_MODE
> > 00 – Dual-channel DSI receiver
> > 01 – Single channel DSI receiver (default)
> > 10 – Two single channel DSI receivers
> > 11 – Reserved
> > SN65DSI83 and 84 require it to be set to 01. You have that end result,
> > but using an odd register name that only documents one of the 2 bits.
> > 
> > Is it worth documenting bit 7 as being the '85 Dual DSI link
> > LEFT_RIGHT_PIXELS flag at the same time? The chip isn't supported in
> > dual DSI mode at present, but defining all the registers up front
> > seems reasonable.
> 
> Yes, let's fix those.
> 
> [...]
> 
> >> +       /*
> >> +        * Reset the chip, pull EN line low for t_reset=10ms,
> >> +        * then high for t_en=1ms.
> >> +        */
> >> +       regcache_mark_dirty(ctx->regmap);
> >> +       gpiod_set_value(ctx->enable_gpio, 0);
> >> +       usleep_range(10000, 11000);
> >> +       gpiod_set_value(ctx->enable_gpio, 1);
> >> +       usleep_range(1000, 1100);
> >> +}
> > 
> > Whilst section 6.6 of the SN65DSI84 datasheet does list t_en as 1ms,
> > the initialization sequence listed in table 7.2 states
> > Init seq 3 - Set EN pin to Low
> > Wait 10 ms
> > Init seq 4 - Tie EN pin to High
> > Wait 10 ms
> > 
> > with the note that these are "Minimum recommended delay. It is fine to
> > exceed these."
> > 
> > Have you had alternate guidance from TI over that delay?
> 
> No, I trusted the timing diagrams in section 6.6 of the datasheet. I 
> would like to believe those are correct, while the init sequence listing 
> might be a copy-paste error.
> 
> [...]
> 
> >> +static void sn65dsi83_enable(struct drm_bridge *bridge)
> >> +{
> >> +       struct sn65dsi83 *ctx = bridge_to_sn65dsi83(bridge);
> >> +       unsigned int pval;
> >> +       u16 val;
> >> +       int ret;
> >> +
> >> +       /* Clear reset, disable PLL */
> >> +       regmap_write(ctx->regmap, REG_RC_RESET, 0x00);
> >> +       regmap_write(ctx->regmap, REG_RC_PLL_EN, 0x00);
> >> +
> >> +       /* Reference clock derived from DSI link clock. */
> >> +       regmap_write(ctx->regmap, REG_RC_LVDS_PLL,
> >> +               REG_RC_LVDS_PLL_LVDS_CLK_RANGE(sn65dsi83_get_lvds_range(ctx)) |
> >> +               REG_RC_LVDS_PLL_HS_CLK_SRC_DPHY);
> > 
> > (Checkpatch whinge for "Alignment should match open parenthesis" on
> > several lines through this function)
> 
> Do you have any extra checkpatch settings somewhere ?
> I get this on current next:
> 
> linux-2.6$ ./scripts/checkpatch.pl -f drivers/gpu/drm/bridge/ti-sn65dsi83.c
> total: 0 errors, 0 warnings, 625 lines checked
> 
> [...]

-- 
Regards,

Laurent Pinchart
