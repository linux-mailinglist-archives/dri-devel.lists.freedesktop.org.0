Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 263C246F01E
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 18:03:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08B7910F680;
	Thu,  9 Dec 2021 16:55:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADF4410E116
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Dec 2021 16:39:19 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2BA85501;
 Thu,  9 Dec 2021 17:39:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1639067958;
 bh=k6CmCciVjfbhbekq8/he9ey/4J0m9COmTP6tTmZ51Yo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uEv7vOUwvO0TaiaGfPTwG9T/mQ6MPxVnM5TJTvTk5J2qevVamn7YEuNIwTJUZXmmg
 5uFiNw345UHL+TwKsT65ujlXIdl5/oANsRc4Asy3kciufv7ljLFba7KVQFc4RFgwhf
 0URtthnkiKyj6dqrk49LpGT3F2a8wWi7JNbgSyuA=
Date: Thu, 9 Dec 2021 18:38:49 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v4 4/4] drm/bridge: ti-sn65dsi83: Add vcc supply
 regulator support
Message-ID: <YbIxGc8faqUQhUWP@pendragon.ideasonboard.com>
References: <20211118091955.3009900-1-alexander.stein@ew.tq-group.com>
 <20211118091955.3009900-5-alexander.stein@ew.tq-group.com>
 <CAMty3ZCQ+JDvojX0QiLEJLSA=J+kzi9kY1QE+dzf35fgO3T4aQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMty3ZCQ+JDvojX0QiLEJLSA=J+kzi9kY1QE+dzf35fgO3T4aQ@mail.gmail.com>
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <a.hajda@samsung.com>,
 David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jagan,

On Thu, Dec 09, 2021 at 12:34:49PM +0530, Jagan Teki wrote:
> On Thu, Nov 18, 2021 at 2:50 PM Alexander Stein wrote:
> >
> > VCC needs to be enabled before releasing the enable GPIO.
> >
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> >  drivers/gpu/drm/bridge/ti-sn65dsi83.c | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> > index 065610edc37a..54d18e82ed74 100644
> > --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> > @@ -33,6 +33,7 @@
> >  #include <linux/of_device.h>
> >  #include <linux/of_graph.h>
> >  #include <linux/regmap.h>
> > +#include <linux/regulator/consumer.h>
> >
> >  #include <drm/drm_atomic_helper.h>
> >  #include <drm/drm_bridge.h>
> > @@ -143,6 +144,7 @@ struct sn65dsi83 {
> >         struct mipi_dsi_device          *dsi;
> >         struct drm_bridge               *panel_bridge;
> >         struct gpio_desc                *enable_gpio;
> > +       struct regulator                *vcc;
> >         int                             dsi_lanes;
> >         bool                            lvds_dual_link;
> >         bool                            lvds_dual_link_even_odd_swap;
> > @@ -337,6 +339,12 @@ static void sn65dsi83_atomic_enable(struct drm_bridge *bridge,
> >         u16 val;
> >         int ret;
> >
> > +       ret = regulator_enable(ctx->vcc);
> > +       if (ret) {
> > +               dev_err(ctx->dev, "Failed to enable vcc\n");
> > +               return;
> > +       }
> 
> Better check the vcc and enable it since it is an optional one.

Won't the regulator core create a dummy regulator if none is specified
in DT ?

-- 
Regards,

Laurent Pinchart
