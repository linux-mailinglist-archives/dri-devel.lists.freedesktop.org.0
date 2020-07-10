Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3E221C002
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jul 2020 00:39:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E12126ED35;
	Fri, 10 Jul 2020 22:39:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 364A76ED35
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 22:39:47 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id BD7732C0;
 Sat, 11 Jul 2020 00:39:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1594420785;
 bh=Xrj7StyqVgATpNYZL/rHMdcL0dZ5mRFv4ao7u2rOQy4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jKxxCiVIrK4w6BNo2QqSyYHGEBaYIoAF4Foyf1YuuJHKbpySBMOMBbLex5CpRo7Jn
 pSaHVwJBj6HyOatABMEoJ7y54HvQaMOepJLopVZToyrQSVOA14YjEzWlqDWSelpncF
 1T1sPBL3jucoOxUcynwH38X6B3hmogpRLyhxFzZ0=
Date: Sat, 11 Jul 2020 01:39:39 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v3 18/21] drm/bridge: nxp-ptn3460: add drm_panel_bridge
 support
Message-ID: <20200710223939.GV5964@pendragon.ideasonboard.com>
References: <20200703192417.372164-1-sam@ravnborg.org>
 <20200703192417.372164-19-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200703192417.372164-19-sam@ravnborg.org>
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
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Martyn Welch <martyn.welch@collabora.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

Thank you for the patch.

On Fri, Jul 03, 2020 at 09:24:14PM +0200, Sam Ravnborg wrote:
> Prepare the bridge driver for use in a chained setup by
> replacing direct use of drm_panel with drm_panel_bridge support.
> 
> Note: the bridge panel will use the connector type from the panel.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@siol.net>
> ---
>  drivers/gpu/drm/bridge/nxp-ptn3460.c | 51 ++++++++--------------------
>  1 file changed, 14 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/nxp-ptn3460.c b/drivers/gpu/drm/bridge/nxp-ptn3460.c
> index 438e566ce0a4..0bd9f0e451b3 100644
> --- a/drivers/gpu/drm/bridge/nxp-ptn3460.c
> +++ b/drivers/gpu/drm/bridge/nxp-ptn3460.c
> @@ -30,7 +30,7 @@ struct ptn3460_bridge {
>  	struct i2c_client *client;
>  	struct drm_bridge bridge;
>  	struct edid *edid;
> -	struct drm_panel *panel;
> +	struct drm_bridge *panel_bridge;
>  	struct gpio_desc *gpio_pd_n;
>  	struct gpio_desc *gpio_rst_n;
>  	u32 edid_emulation;
> @@ -127,11 +127,6 @@ static void ptn3460_pre_enable(struct drm_bridge *bridge)
>  	usleep_range(10, 20);
>  	gpiod_set_value(ptn_bridge->gpio_rst_n, 1);
>  
> -	if (drm_panel_prepare(ptn_bridge->panel)) {
> -		DRM_ERROR("failed to prepare panel\n");
> -		return;
> -	}
> -
>  	/*
>  	 * There's a bug in the PTN chip where it falsely asserts hotplug before
>  	 * it is fully functional. We're forced to wait for the maximum start up
> @@ -146,16 +141,6 @@ static void ptn3460_pre_enable(struct drm_bridge *bridge)
>  	ptn_bridge->enabled = true;
>  }
>  
> -static void ptn3460_enable(struct drm_bridge *bridge)
> -{
> -	struct ptn3460_bridge *ptn_bridge = bridge_to_ptn3460(bridge);
> -
> -	if (drm_panel_enable(ptn_bridge->panel)) {
> -		DRM_ERROR("failed to enable panel\n");
> -		return;
> -	}
> -}
> -
>  static void ptn3460_disable(struct drm_bridge *bridge)
>  {
>  	struct ptn3460_bridge *ptn_bridge = bridge_to_ptn3460(bridge);
> @@ -165,25 +150,10 @@ static void ptn3460_disable(struct drm_bridge *bridge)
>  
>  	ptn_bridge->enabled = false;
>  
> -	if (drm_panel_disable(ptn_bridge->panel)) {
> -		DRM_ERROR("failed to disable panel\n");
> -		return;
> -	}
> -
>  	gpiod_set_value(ptn_bridge->gpio_rst_n, 1);
>  	gpiod_set_value(ptn_bridge->gpio_pd_n, 0);
>  }
>  
> -static void ptn3460_post_disable(struct drm_bridge *bridge)
> -{
> -	struct ptn3460_bridge *ptn_bridge = bridge_to_ptn3460(bridge);
> -
> -	if (drm_panel_unprepare(ptn_bridge->panel)) {
> -		DRM_ERROR("failed to unprepare panel\n");
> -		return;
> -	}
> -}
> -
>  static int ptn3460_get_modes(struct drm_connector *connector)
>  {
>  	struct ptn3460_bridge *ptn_bridge;
> @@ -242,6 +212,11 @@ static int ptn3460_bridge_attach(struct drm_bridge *bridge,
>  	struct ptn3460_bridge *ptn_bridge = bridge_to_ptn3460(bridge);
>  	int ret;
>  
> +	ret = drm_bridge_attach(bridge->encoder, ptn_bridge->panel_bridge,
> +				bridge, flags);

Same as earlier in the series about the flags.

> +	if (ret < 0)
> +		return ret;
> +
>  	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
>  		DRM_ERROR("Fix bridge driver to make connector optional!");
>  		return -EINVAL;
> @@ -265,9 +240,6 @@ static int ptn3460_bridge_attach(struct drm_bridge *bridge,
>  	drm_connector_attach_encoder(&ptn_bridge->connector,
>  							bridge->encoder);
>  
> -	if (ptn_bridge->panel)
> -		drm_panel_attach(ptn_bridge->panel, &ptn_bridge->connector);
> -
>  	drm_helper_hpd_irq_event(ptn_bridge->connector.dev);
>  
>  	return ret;
> @@ -275,9 +247,7 @@ static int ptn3460_bridge_attach(struct drm_bridge *bridge,
>  
>  static const struct drm_bridge_funcs ptn3460_bridge_funcs = {
>  	.pre_enable = ptn3460_pre_enable,
> -	.enable = ptn3460_enable,
>  	.disable = ptn3460_disable,
> -	.post_disable = ptn3460_post_disable,
>  	.attach = ptn3460_bridge_attach,
>  };
>  
> @@ -286,6 +256,8 @@ static int ptn3460_probe(struct i2c_client *client,
>  {
>  	struct device *dev = &client->dev;
>  	struct ptn3460_bridge *ptn_bridge;
> +	struct drm_bridge *pbridge;
> +	struct drm_panel *panel;
>  	int ret;
>  
>  	ptn_bridge = devm_kzalloc(dev, sizeof(*ptn_bridge), GFP_KERNEL);
> @@ -293,10 +265,15 @@ static int ptn3460_probe(struct i2c_client *client,
>  		return -ENOMEM;
>  	}
>  
> -	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0, &ptn_bridge->panel, NULL);
> +	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0, &panel, NULL);
>  	if (ret)
>  		return ret;
>  
> +	pbridge = devm_drm_panel_bridge_add(dev, panel);
> +	if (IS_ERR(pbridge))
> +		return PTR_ERR(pbridge);
> +
> +	ptn_bridge->panel_bridge = pbridge;
>  	ptn_bridge->client = client;
>  
>  	ptn_bridge->gpio_pd_n = devm_gpiod_get(&client->dev, "powerdown",

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
