Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD133B23ED
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 01:26:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B4DE6E953;
	Wed, 23 Jun 2021 23:26:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E46106E953
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 23:26:27 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1377687F;
 Thu, 24 Jun 2021 01:26:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1624490786;
 bh=ynmhFRHOFC3DGFXRUHhXroMfMJDEBCBRc1Sp3IeMbvU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kolP0OZ6f9YcFrGjlHQtP+Xj+fJOO6UNXg8agbh1zwRez3txACDJ7F7jHaVY5Cms2
 45nfVpH/YLXuqDO1ERV8FlqY2AFmR8N9Afz/ywPLjxyUAZtzgfYqT8wziO8Liwug2Y
 bF+6VJFYS7GT3kT3tHfc4iWqh60Sz0ALpZDxPYKc=
Date: Thu, 24 Jun 2021 02:25:55 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [RFC PATCH 11/11] drm/bridge: ti-sn65dsi86: Support hotplug
 detection
Message-ID: <YNPDAyODcvlWtxpj@pendragon.ideasonboard.com>
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210322030128.2283-12-laurent.pinchart+renesas@ideasonboard.com>
 <CAD=FV=XeUbw44OZ0H6hJhS3Pb7LgknVpKynHFxWpPx_qPQ6+QA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAD=FV=XeUbw44OZ0H6hJhS3Pb7LgknVpKynHFxWpPx_qPQ6+QA@mail.gmail.com>
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
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, linux-renesas-soc@vger.kernel.org,
 Andrzej Hajda <a.hajda@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Doug,

On Wed, Mar 24, 2021 at 03:47:38PM -0700, Doug Anderson wrote:
> On Sun, Mar 21, 2021 at 8:02 PM Laurent Pinchart wrote:
> >
> > When the SN65DSI86 is used in DisplayPort mode, its output is likely
> > routed to a DisplayPort connector, which can benefit from hotplug
> > detection. Support it in such cases, with polling mode only for now.
> >
> > The implementation is limited to the bridge operations, as the connector
> > operations are legacy and new users should use
> > DRM_BRIDGE_ATTACH_NO_CONNECTOR.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 46 +++++++++++++++++++--------
> >  1 file changed, 33 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > index f792227142a7..72f6362adf44 100644
> > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > @@ -167,6 +167,8 @@ struct ti_sn_bridge {
> >         struct gpio_chip                gchip;
> >         DECLARE_BITMAP(gchip_output, SN_NUM_GPIOS);
> >  #endif
> > +
> > +       bool                            no_hpd;
> 
> This structure is documented by kernel-doc, but you didn't add your new member.

Oops, sorry.

> >  };
> >
> >  static const struct regmap_range ti_sn_bridge_volatile_ranges[] = {
> > @@ -862,23 +864,28 @@ static void ti_sn_bridge_pre_enable(struct drm_bridge *bridge)
> >         ti_sn_bridge_set_refclk_freq(pdata);
> >
> >         /*
> > -        * HPD on this bridge chip is a bit useless.  This is an eDP bridge
> > -        * so the HPD is an internal signal that's only there to signal that
> > -        * the panel is done powering up.  ...but the bridge chip debounces
> > -        * this signal by between 100 ms and 400 ms (depending on process,
> > -        * voltage, and temperate--I measured it at about 200 ms).  One
> > +        * As this is an eDP bridge, the output will be connected to a fixed
> > +        * panel in most systems. HPD is in that case only an internal signal
> > +        * to signal that the panel is done powering up. The bridge chip
> > +        * debounces this signal by between 100 ms and 400 ms (depending on
> > +        * process, voltage, and temperate--I measured it at about 200 ms). One
> >          * particular panel asserted HPD 84 ms after it was powered on meaning
> >          * that we saw HPD 284 ms after power on.  ...but the same panel said
> >          * that instead of looking at HPD you could just hardcode a delay of
> > -        * 200 ms.  We'll assume that the panel driver will have the hardcoded
> > -        * delay in its prepare and always disable HPD.
> > +        * 200 ms. HPD is thus a bit useless. For this type of use cases, we'll
> > +        * assume that the panel driver will have the hardcoded delay in its
> > +        * prepare and always disable HPD.
> >          *
> > -        * If HPD somehow makes sense on some future panel we'll have to
> > -        * change this to be conditional on someone specifying that HPD should
> > -        * be used.
> > +        * However, on some systems, the output is connected to a DisplayPort
> > +        * connector. HPD is needed in such cases. To accommodate both use
> > +        * cases, enable HPD only when requested.
> >          */
> > -       regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG, HPD_DISABLE,
> > -                          HPD_DISABLE);
> > +       if (pdata->no_hpd)
> > +               regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG,
> > +                                  HPD_DISABLE, HPD_DISABLE);
> > +       else
> > +               regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG,
> > +                                  HPD_DISABLE, 0);
> 
> Optionally you could skip the "else". HPD enabled is the default state
> and, in general, we don't exhaustively init all registers and rely on
> the power-on defaults for ones we don't explicitly control.

OK.

> >  }
> >
> >  static void ti_sn_bridge_post_disable(struct drm_bridge *bridge)
> > @@ -890,6 +897,15 @@ static void ti_sn_bridge_post_disable(struct drm_bridge *bridge)
> >         pm_runtime_put_sync(pdata->dev);
> >  }
> >
> > +static enum drm_connector_status ti_sn_bridge_detect(struct drm_bridge *bridge)
> > +{
> > +       struct ti_sn_bridge *pdata = bridge_to_ti_sn_bridge(bridge);
> > +       int val;
> > +
> > +       regmap_read(pdata->regmap, SN_HPD_DISABLE_REG, &val);
> > +       return val ? connector_status_connected : connector_status_disconnected;
> 
> I would have expected that you would have used the interrupt signal,
> but I guess it just polls in this case. I suppose polling has the
> advantage that it's simpler... Maybe throw in a comment about why IRQ
> isn't being used?

Correct, I didn't want to include IRQ support yet. I'll add a TODO
comment.

> > +}
> > +
> >  static struct edid *ti_sn_bridge_get_edid(struct drm_bridge *bridge,
> >                                           struct drm_connector *connector)
> >  {
> > @@ -904,6 +920,7 @@ static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
> >         .enable = ti_sn_bridge_enable,
> >         .disable = ti_sn_bridge_disable,
> >         .post_disable = ti_sn_bridge_post_disable,
> > +       .detect = ti_sn_bridge_detect,
> >         .get_edid = ti_sn_bridge_get_edid,
> >  };
u> >
> > @@ -1327,6 +1344,8 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
> >                 return ret;
> >         }
> >
> > +       pdata->no_hpd = of_property_read_bool(pdata->dev->of_node, "no-hpd");
> > +
> >         ti_sn_bridge_parse_lanes(pdata, client->dev.of_node);
> >
> >         ret = ti_sn_bridge_parse_regulators(pdata);
> > @@ -1365,7 +1384,8 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
> >
> >         pdata->bridge.funcs = &ti_sn_bridge_funcs;
> >         pdata->bridge.of_node = client->dev.of_node;
> > -       pdata->bridge.ops = DRM_BRIDGE_OP_EDID;
> > +       pdata->bridge.ops = (pdata->no_hpd ? 0 : DRM_BRIDGE_OP_DETECT)
> 
> Checking for "no_hpd" here is not the right test IIUC. You want to
> check for eDP vs. DP (AKA whether a panel is downstream of you or a
> connector). Specifically if downstream of you is a panel then (I
> believe) HPD won't assert until you turn on the panel and you won't
> turn on the panel (which happens in pre_enable, right?) until HPD
> fires, so you've got a chicken-and-egg problem. If downstream of you
> is a connector, though, then by definition HPD has to just work
> without pre_enable running so then you're OK.

Agreed. It's even more true now that your rework has landed, as in the
eDP case EDID is handled by the panel driver. I'll rework this.

Should I also condition setting HPD_DISABLE to the presence of a panel
then ? I could drop of_property_read_bool() and set

	pdata->no_hpd = !!panel;

> I guess then you'd need to figure out what to do if someone wants to
> use "HPD" on eDP. Do you need to put a polling loop in pre_enable
> then? Or you could just punt not support this case until someone needs
> it.

I think I'll stop short of saving the world this time, yes :-) We'll see
what to do when this case arises.

> > +                         | DRM_BRIDGE_OP_EDID;
> 
> IMO somewhere in here if HPD is being used like this you should throw
> in a call to pm_runtime_get_sync(). I guess in your solution the
> regulators (for the bridge, not the panel) and enable pin are just
> left on all the time,

Correct, on my development board the SN65DSI86 is on all the time, I
can't control that.

> but plausibly someone might want to build a
> system to use HPD and also have the enable pin and/or regulators
> controlled by this driver, right?

True. DRM doesn't make this very easy, as, as far as I can tell, there's
no standard infrastructure for userspace to register an interest in HPD
that could be notified to bridges. I think it should be fixable, but
it's out of scope for this series :-) Should I still add a
pm_runtime_get_sync() at probe time, or leave this to be addressed by
someone who will need to implement power control ?

-- 
Regards,

Laurent Pinchart
