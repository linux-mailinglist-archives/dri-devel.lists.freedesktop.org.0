Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A1422F3C9
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jul 2020 17:23:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBF1889745;
	Mon, 27 Jul 2020 15:23:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEC898972D
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 15:23:21 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 6CBF92002C;
 Mon, 27 Jul 2020 17:23:18 +0200 (CEST)
Date: Mon, 27 Jul 2020 17:23:16 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v4 08/15] drm/bridge: parade-ps8622: add drm_panel_bridge
 support
Message-ID: <20200727152316.GB3835495@ravnborg.org>
References: <20200726203324.3722593-1-sam@ravnborg.org>
 <20200726203324.3722593-9-sam@ravnborg.org>
 <20200726215408.GD28704@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200726215408.GD28704@pendragon.ideasonboard.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=hD80L64hAAAA:8 a=IpJZQVW2AAAA:8
 a=P1BnusSwAAAA:8 a=RwHePtW7AAAA:8 a=e5mUnYsNAAAA:8 a=184l7RqWBGTf_r8B92IA:9
 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22 a=IawgGOuG5U0WyFbmm1f5:22
 a=D0XLA9XvdZm18NrgonBM:22 a=FqraQwd7dyEg5dwJgZJs:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, kbuild test robot <lkp@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Peter Senna Tschudin <peter.senna@gmail.com>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>, Jonas Karlman <jonas@kwiboo.se>,
 Thierry Reding <thierry.reding@gmail.com>,
 Martin Donnelly <martin.donnelly@ge.com>,
 Martyn Welch <martyn.welch@collabora.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent.

On Mon, Jul 27, 2020 at 12:54:08AM +0300, Laurent Pinchart wrote:
> Hi Sam,
> 
> Thank you for the patch.
> 
> On Sun, Jul 26, 2020 at 10:33:17PM +0200, Sam Ravnborg wrote:
> > Prepare the bridge driver for use in a chained setup by
> > replacing direct use of drm_panel with drm_panel_bridge support.
> > 
> > The connecter is now either created by the panel bridge or the display
> > driver. So all code for connector creation in this driver is no longer
> > relevant and thus dropped.
> > 
> > The connector code had some special polling handling:
> >     connector.polled = DRM_CONNECTOR_POLL_HPD;
> >     drm_helper_hpd_irq_event(ps8622->bridge.dev);
> > 
> > This code was most likely added to speed up detection of the connector.
> > If really needed then this functionality belongs somewhere else.
> > 
> > Note: the bridge panel will use the connector type from the panel.
> > 
> > v2:
> >   - Fix to avoid creating connector twice (Laurent)
> >   - Drop all connector code - defer to bridge panel
> >   - Use panel_bridge for local variable to align with other drivers
> >   - Set bridge.type to DRM_MODE_CONNECTOR_LVDS;
> > 
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Andrzej Hajda <a.hajda@samsung.com>
> > Cc: Neil Armstrong <narmstrong@baylibre.com>
> > Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> > Cc: Jonas Karlman <jonas@kwiboo.se>
> > Cc: Jernej Skrabec <jernej.skrabec@siol.net>
> > ---
> >  drivers/gpu/drm/bridge/parade-ps8622.c | 100 ++++---------------------
> >  1 file changed, 13 insertions(+), 87 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/bridge/parade-ps8622.c b/drivers/gpu/drm/bridge/parade-ps8622.c
> > index d789ea2a7fb9..614b19f0f1b7 100644
> > --- a/drivers/gpu/drm/bridge/parade-ps8622.c
> > +++ b/drivers/gpu/drm/bridge/parade-ps8622.c
> > @@ -42,10 +42,9 @@
> >  #endif
> >  
> >  struct ps8622_bridge {
> > -	struct drm_connector connector;
> >  	struct i2c_client *client;
> >  	struct drm_bridge bridge;
> > -	struct drm_panel *panel;
> > +	struct drm_bridge *panel_bridge;
> >  	struct regulator *v12;
> >  	struct backlight_device *bl;
> >  
> > @@ -64,12 +63,6 @@ static inline struct ps8622_bridge *
> >  	return container_of(bridge, struct ps8622_bridge, bridge);
> >  }
> >  
> > -static inline struct ps8622_bridge *
> > -		connector_to_ps8622(struct drm_connector *connector)
> > -{
> > -	return container_of(connector, struct ps8622_bridge, connector);
> > -}
> > -
> >  static int ps8622_set(struct i2c_client *client, u8 page, u8 reg, u8 val)
> >  {
> >  	int ret;
> > @@ -365,11 +358,6 @@ static void ps8622_pre_enable(struct drm_bridge *bridge)
> >  			DRM_ERROR("fails to enable ps8622->v12");
> >  	}
> >  
> > -	if (drm_panel_prepare(ps8622->panel)) {
> > -		DRM_ERROR("failed to prepare panel\n");
> > -		return;
> > -	}
> > -
> >  	gpiod_set_value(ps8622->gpio_slp, 1);
> >  
> >  	/*
> > @@ -399,24 +387,9 @@ static void ps8622_pre_enable(struct drm_bridge *bridge)
> >  	ps8622->enabled = true;
> >  }
> >  
> > -static void ps8622_enable(struct drm_bridge *bridge)
> > -{
> > -	struct ps8622_bridge *ps8622 = bridge_to_ps8622(bridge);
> > -
> > -	if (drm_panel_enable(ps8622->panel)) {
> > -		DRM_ERROR("failed to enable panel\n");
> > -		return;
> > -	}
> > -}
> > -
> >  static void ps8622_disable(struct drm_bridge *bridge)
> >  {
> > -	struct ps8622_bridge *ps8622 = bridge_to_ps8622(bridge);
> > -
> > -	if (drm_panel_disable(ps8622->panel)) {
> > -		DRM_ERROR("failed to disable panel\n");
> > -		return;
> > -	}
> > +	/* Delay after panel is disabled */
> >  	msleep(PS8622_PWMO_END_T12_MS);
> 
> I really don't understand why a delay would be needed here.
>
Neither do I. I was there in the original code and I have kept it.

> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Thanks.

	Sam

> 
> >  }
> >  
> > @@ -436,11 +409,6 @@ static void ps8622_post_disable(struct drm_bridge *bridge)
> >  	 */
> >  	gpiod_set_value(ps8622->gpio_slp, 0);
> >  
> > -	if (drm_panel_unprepare(ps8622->panel)) {
> > -		DRM_ERROR("failed to unprepare panel\n");
> > -		return;
> > -	}
> > -
> >  	if (ps8622->v12)
> >  		regulator_disable(ps8622->v12);
> >  
> > @@ -455,67 +423,17 @@ static void ps8622_post_disable(struct drm_bridge *bridge)
> >  	msleep(PS8622_POWER_OFF_T17_MS);
> >  }
> >  
> > -static int ps8622_get_modes(struct drm_connector *connector)
> > -{
> > -	struct ps8622_bridge *ps8622;
> > -
> > -	ps8622 = connector_to_ps8622(connector);
> > -
> > -	return drm_panel_get_modes(ps8622->panel, connector);
> > -}
> > -
> > -static const struct drm_connector_helper_funcs ps8622_connector_helper_funcs = {
> > -	.get_modes = ps8622_get_modes,
> > -};
> > -
> > -static const struct drm_connector_funcs ps8622_connector_funcs = {
> > -	.fill_modes = drm_helper_probe_single_connector_modes,
> > -	.destroy = drm_connector_cleanup,
> > -	.reset = drm_atomic_helper_connector_reset,
> > -	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> > -	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> > -};
> > -
> >  static int ps8622_attach(struct drm_bridge *bridge,
> >  			 enum drm_bridge_attach_flags flags)
> >  {
> >  	struct ps8622_bridge *ps8622 = bridge_to_ps8622(bridge);
> > -	int ret;
> > -
> > -	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
> > -		DRM_ERROR("Fix bridge driver to make connector optional!");
> > -		return -EINVAL;
> > -	}
> >  
> > -	if (!bridge->encoder) {
> > -		DRM_ERROR("Parent encoder object not found");
> > -		return -ENODEV;
> > -	}
> > -
> > -	ps8622->connector.polled = DRM_CONNECTOR_POLL_HPD;
> > -	ret = drm_connector_init(bridge->dev, &ps8622->connector,
> > -			&ps8622_connector_funcs, DRM_MODE_CONNECTOR_LVDS);
> > -	if (ret) {
> > -		DRM_ERROR("Failed to initialize connector with drm\n");
> > -		return ret;
> > -	}
> > -	drm_connector_helper_add(&ps8622->connector,
> > -					&ps8622_connector_helper_funcs);
> > -	drm_connector_register(&ps8622->connector);
> > -	drm_connector_attach_encoder(&ps8622->connector,
> > -							bridge->encoder);
> > -
> > -	if (ps8622->panel)
> > -		drm_panel_attach(ps8622->panel, &ps8622->connector);
> > -
> > -	drm_helper_hpd_irq_event(ps8622->connector.dev);
> > -
> > -	return ret;
> > +	return drm_bridge_attach(ps8622->bridge.encoder, ps8622->panel_bridge,
> > +				 &ps8622->bridge, flags);
> >  }
> >  
> >  static const struct drm_bridge_funcs ps8622_bridge_funcs = {
> >  	.pre_enable = ps8622_pre_enable,
> > -	.enable = ps8622_enable,
> >  	.disable = ps8622_disable,
> >  	.post_disable = ps8622_post_disable,
> >  	.attach = ps8622_attach,
> > @@ -533,16 +451,23 @@ static int ps8622_probe(struct i2c_client *client,
> >  {
> >  	struct device *dev = &client->dev;
> >  	struct ps8622_bridge *ps8622;
> > +	struct drm_bridge *panel_bridge;
> > +	struct drm_panel *panel;
> >  	int ret;
> >  
> >  	ps8622 = devm_kzalloc(dev, sizeof(*ps8622), GFP_KERNEL);
> >  	if (!ps8622)
> >  		return -ENOMEM;
> >  
> > -	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0, &ps8622->panel, NULL);
> > +	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0, &panel, NULL);
> >  	if (ret)
> >  		return ret;
> >  
> > +	panel_bridge = devm_drm_panel_bridge_add(dev, panel);
> > +	if (IS_ERR(panel_bridge))
> > +		return PTR_ERR(panel_bridge);
> > +
> > +	ps8622->panel_bridge = panel_bridge;
> >  	ps8622->client = client;
> >  
> >  	ps8622->v12 = devm_regulator_get(dev, "vdd12");
> > @@ -595,6 +520,7 @@ static int ps8622_probe(struct i2c_client *client,
> >  	}
> >  
> >  	ps8622->bridge.funcs = &ps8622_bridge_funcs;
> > +	ps8622->bridge.type = DRM_MODE_CONNECTOR_LVDS;
> >  	ps8622->bridge.of_node = dev->of_node;
> >  	drm_bridge_add(&ps8622->bridge);
> >  
> 
> -- 
> Regards,
> 
> Laurent Pinchart
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
