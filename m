Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1484922E66F
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jul 2020 09:23:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 986F989CAC;
	Mon, 27 Jul 2020 07:23:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03B8789CAC
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 07:23:03 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 5B089804DA;
 Mon, 27 Jul 2020 09:22:58 +0200 (CEST)
Date: Mon, 27 Jul 2020 09:22:56 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v4 07/15] drm/bridge: tc358767: add drm_panel_bridge
 support
Message-ID: <20200727072256.GA3799743@ravnborg.org>
References: <20200726203324.3722593-1-sam@ravnborg.org>
 <20200726203324.3722593-8-sam@ravnborg.org>
 <20200726214832.GC28704@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200726214832.GC28704@pendragon.ideasonboard.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=P1BnusSwAAAA:8 a=hD80L64hAAAA:8
 a=IpJZQVW2AAAA:8 a=RwHePtW7AAAA:8 a=BCzp7en0e6PmTZLbanEA:9
 a=PtiKW14iDIf8ZSlN:21 a=mcsOGsdddqy8Jpaq:21 a=CjuIK1q_8ugA:10
 a=E9Po1WZjFZOl8hwRPBS3:22 a=D0XLA9XvdZm18NrgonBM:22
 a=IawgGOuG5U0WyFbmm1f5:22 a=FqraQwd7dyEg5dwJgZJs:22
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
 Peter Senna Tschudin <peter.senna@gmail.com>,
 kbuild test robot <lkp@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org,
 Martyn Welch <martyn.welch@collabora.co.uk>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Martin Donnelly <martin.donnelly@ge.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent.

Thanks for the prompt review.

On Mon, Jul 27, 2020 at 12:48:32AM +0300, Laurent Pinchart wrote:
> Hi Sam,
> 
> Thank you for the patch.
> 
> On Sun, Jul 26, 2020 at 10:33:16PM +0200, Sam Ravnborg wrote:
> > With the bridge operations implemented the last step to prepare
> > this driver for a chained setup is the use of the bridge panel driver.
> > 
> > The bridge panel driver is only used when a prot@2 is present in
> 
> s/prot/port/
> 
> > the DT. So when the display driver request a connector
> 
> s/request/requests/
> 
> > support both situations:
> > - connector created by bridge panel driver
> > - connector created by this driver
> > 
> > And on top, support that the display driver creates the connector,
> > which is the preferred setup.
> > 
> > Note: the bridge panel will use the connector type from the panel.
> > 
> > v2:
> >   - Merge connector and drm_panel_bridge patches
> >     and fix so we do not create two connectors (Laurent)
> > 
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Cc: Andrzej Hajda <a.hajda@samsung.com>
> > Cc: Neil Armstrong <narmstrong@baylibre.com>
> > Cc: Jonas Karlman <jonas@kwiboo.se>
> > Cc: Jernej Skrabec <jernej.skrabec@siol.net>
> > ---
> >  drivers/gpu/drm/bridge/tc358767.c | 70 +++++++++++++++----------------
> >  1 file changed, 35 insertions(+), 35 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
> > index d86d7f06bebb..75a2cd792ccc 100644
> > --- a/drivers/gpu/drm/bridge/tc358767.c
> > +++ b/drivers/gpu/drm/bridge/tc358767.c
> > @@ -244,8 +244,8 @@ struct tc_data {
> >  	struct drm_dp_aux	aux;
> >  
> >  	struct drm_bridge	bridge;
> > +	struct drm_bridge	*panel_bridge;
> >  	struct drm_connector	connector;
> > -	struct drm_panel	*panel;
> >  
> >  	/* link settings */
> >  	struct tc_edp_link	link;
> > @@ -1234,13 +1234,6 @@ static int tc_stream_disable(struct tc_data *tc)
> >  	return 0;
> >  }
> >  
> > -static void tc_bridge_pre_enable(struct drm_bridge *bridge)
> > -{
> > -	struct tc_data *tc = bridge_to_tc(bridge);
> > -
> > -	drm_panel_prepare(tc->panel);
> > -}
> > -
> >  static void tc_bridge_enable(struct drm_bridge *bridge)
> >  {
> >  	struct tc_data *tc = bridge_to_tc(bridge);
> > @@ -1264,8 +1257,6 @@ static void tc_bridge_enable(struct drm_bridge *bridge)
> >  		tc_main_link_disable(tc);
> >  		return;
> >  	}
> > -
> > -	drm_panel_enable(tc->panel);
> >  }
> >  
> >  static void tc_bridge_disable(struct drm_bridge *bridge)
> > @@ -1273,8 +1264,6 @@ static void tc_bridge_disable(struct drm_bridge *bridge)
> >  	struct tc_data *tc = bridge_to_tc(bridge);
> >  	int ret;
> >  
> > -	drm_panel_disable(tc->panel);
> > -
> >  	ret = tc_stream_disable(tc);
> >  	if (ret < 0)
> >  		dev_err(tc->dev, "main link stream stop error: %d\n", ret);
> > @@ -1284,13 +1273,6 @@ static void tc_bridge_disable(struct drm_bridge *bridge)
> >  		dev_err(tc->dev, "main link disable error: %d\n", ret);
> >  }
> >  
> > -static void tc_bridge_post_disable(struct drm_bridge *bridge)
> > -{
> > -	struct tc_data *tc = bridge_to_tc(bridge);
> > -
> > -	drm_panel_unprepare(tc->panel);
> > -}
> > -
> >  static bool tc_bridge_mode_fixup(struct drm_bridge *bridge,
> >  				 const struct drm_display_mode *mode,
> >  				 struct drm_display_mode *adj)
> > @@ -1354,9 +1336,11 @@ static int tc_connector_get_modes(struct drm_connector *connector)
> >  		return 0;
> >  	}
> >  
> > -	num_modes = drm_panel_get_modes(tc->panel, connector);
> > -	if (num_modes > 0)
> > -		return num_modes;
> > +	if (tc->panel_bridge) {
> > +		num_modes = drm_bridge_get_modes(tc->panel_bridge, connector);
> > +		if (num_modes > 0)
> > +			return num_modes;
> > +	}
> >  
> >  	edid = tc_get_edid(&tc->bridge, connector);
> >  	num_modes = drm_add_edid_modes(connector, edid);
> > @@ -1396,7 +1380,7 @@ tc_connector_detect(struct drm_connector *connector, bool force)
> >  	if (tc->hpd_pin >= 0)
> >  		return tc_bridge_detect(&tc->bridge);
> >  	else
> > -		if (tc->panel)
> > +		if (tc->panel_bridge)
> >  			return connector_status_connected;
> >  
> >  	return connector_status_unknown;
> > @@ -1419,16 +1403,23 @@ static int tc_bridge_attach(struct drm_bridge *bridge,
> >  	struct drm_device *drm = bridge->dev;
> >  	int ret;
> >  
> > -	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
> > -		DRM_ERROR("Fix bridge driver to make connector optional!");
> > -		return -EINVAL;
> > +	if (tc->panel_bridge) {
> > +		enum drm_bridge_attach_flags panel_flags;
> > +
> > +		/* If a connector is required then this driver shall create it */
> > +		panel_flags = flags & ~DRM_BRIDGE_ATTACH_NO_CONNECTOR;
> 
> Shouldn't this be
> 
> 		panel_flags = flags | DRM_BRIDGE_ATTACH_NO_CONNECTOR;
> 
> to ensure that the panel driver will not create a connector ?

Brown paper bag time so I can hide myself.
You are ofc right. Will fix and send a v5.
Same for other patch were the same pattern is used.

	Sam

> 
> > +		ret = drm_bridge_attach(tc->bridge.encoder, tc->panel_bridge,
> > +					&tc->bridge, panel_flags);
> > +		if (ret)
> > +			return ret;
> >  	}
> >  
> > +	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
> > +		return 0;
> > +
> >  	/* Create DP/eDP connector */
> >  	drm_connector_helper_add(&tc->connector, &tc_connector_helper_funcs);
> > -	ret = drm_connector_init(drm, &tc->connector, &tc_connector_funcs,
> > -				 tc->panel ? DRM_MODE_CONNECTOR_eDP :
> > -				 DRM_MODE_CONNECTOR_DisplayPort);
> > +	ret = drm_connector_init(drm, &tc->connector, &tc_connector_funcs, tc->bridge.type);
> >  	if (ret)
> >  		return ret;
> >  
> > @@ -1441,9 +1432,6 @@ static int tc_bridge_attach(struct drm_bridge *bridge,
> >  					       DRM_CONNECTOR_POLL_DISCONNECT;
> >  	}
> >  
> > -	if (tc->panel)
> > -		drm_panel_attach(tc->panel, &tc->connector);
> > -
> >  	drm_display_info_set_bus_formats(&tc->connector.display_info,
> >  					 &bus_format, 1);
> >  	tc->connector.display_info.bus_flags =
> > @@ -1459,10 +1447,8 @@ static const struct drm_bridge_funcs tc_bridge_funcs = {
> >  	.attach = tc_bridge_attach,
> >  	.mode_valid = tc_mode_valid,
> >  	.mode_set = tc_bridge_mode_set,
> > -	.pre_enable = tc_bridge_pre_enable,
> >  	.enable = tc_bridge_enable,
> >  	.disable = tc_bridge_disable,
> > -	.post_disable = tc_bridge_post_disable,
> >  	.mode_fixup = tc_bridge_mode_fixup,
> >  	.detect = tc_bridge_detect,
> >  	.get_edid = tc_get_edid,
> > @@ -1555,6 +1541,7 @@ static irqreturn_t tc_irq_handler(int irq, void *arg)
> >  static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
> >  {
> >  	struct device *dev = &client->dev;
> > +	struct drm_panel *panel;
> >  	struct tc_data *tc;
> >  	int ret;
> >  
> > @@ -1565,10 +1552,23 @@ static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
> >  	tc->dev = dev;
> >  
> >  	/* port@2 is the output port */
> > -	ret = drm_of_find_panel_or_bridge(dev->of_node, 2, 0, &tc->panel, NULL);
> > +	ret = drm_of_find_panel_or_bridge(dev->of_node, 2, 0, &panel, NULL);
> >  	if (ret && ret != -ENODEV)
> >  		return ret;
> >  
> > +	if (panel) {
> > +		struct drm_bridge *panel_bridge;
> > +
> > +		panel_bridge = devm_drm_panel_bridge_add(dev, panel);
> > +		if (IS_ERR(panel_bridge))
> > +			return PTR_ERR(panel_bridge);
> > +
> > +		tc->panel_bridge = panel_bridge;
> > +		tc->bridge.type = DRM_MODE_CONNECTOR_eDP;
> > +	} else {
> > +		tc->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
> > +	}
> > +
> >  	/* Shut down GPIO is optional */
> >  	tc->sd_gpio = devm_gpiod_get_optional(dev, "shutdown", GPIOD_OUT_HIGH);
> >  	if (IS_ERR(tc->sd_gpio))
> 
> -- 
> Regards,
> 
> Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
