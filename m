Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA547AE3EE2
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 14:02:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34EDE10E36E;
	Mon, 23 Jun 2025 12:02:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="l3+UqK+K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 062EF10E36E
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 12:02:13 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 92EE9D77;
 Mon, 23 Jun 2025 14:01:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1750680112;
 bh=eRambE0IBM8lNOiYCxa2v73RenBHpxNaK9LeTRHj+AE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=l3+UqK+KWz4sGVgbakoiaVTmeJjO6bv7sXCPr3994UjbHOvGFinjekByWnIlIIumD
 +BmzInw6CZif2voQk9KtawqU16spy5+mpeD40aBE/SyXqRYhqI8UICjQ5GYPwjil1u
 ma5r9yxK0Rwf+4UrnD8DVxcX7FJsCvlwyvj05Q4Q=
Date: Mon, 23 Jun 2025 15:01:49 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dharma Balasubiramani <dharma.b@microchip.com>
Cc: Manikandan Muralidharan <manikandan.m@microchip.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Sandeep Sheriker M <sandeep.sheriker@microchip.com>
Subject: Re: [PATCH v2] drm/bridge: microchip-lvds: fix bus format mismatch
 with VESA displays
Message-ID: <20250623120149.GA19319@pendragon.ideasonboard.com>
References: <20250623-microchip-lvds-v2-1-8ecbabc6abc4@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250623-microchip-lvds-v2-1-8ecbabc6abc4@microchip.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dharma,

Thank you for the patch.

On Mon, Jun 23, 2025 at 04:20:20PM +0530, Dharma Balasubiramani wrote:
> From: Sandeep Sheriker M <sandeep.sheriker@microchip.com>
> 
> The LVDS controller was hardcoded to JEIDA mapping, which leads to
> distorted output on panels expecting VESA mapping.
> 
> Update the driver to dynamically select the appropriate mapping and
> pixel size based on the panel's advertised media bus format. This
> ensures compatibility with both JEIDA and VESA displays.
> 
> Modernize the bridge ops to use atomic_enable/disable, and retrieve
> the bus format from the connector via the atomic bridge state.
> 
> Signed-off-by: Sandeep Sheriker M <sandeep.sheriker@microchip.com>
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
> ---
> Note: Tested the changes on newvision 10.1 VESA display.
> 
> Changes in v2:
> - Switch to atomic bridge functions
> - Drop custom connector creation
> - Use drm_atomic_get_new_connector_for_encoder()
> - Link to v1: https://lore.kernel.org/r/20250618-microchip-lvds-v1-1-1eae5acd7a82@microchip.com
> ---
>  drivers/gpu/drm/bridge/microchip-lvds.c | 64 +++++++++++++++++++++++++++------
>  1 file changed, 54 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/microchip-lvds.c b/drivers/gpu/drm/bridge/microchip-lvds.c
> index 9f4ff82bc6b4..b71478aa36e9 100644
> --- a/drivers/gpu/drm/bridge/microchip-lvds.c
> +++ b/drivers/gpu/drm/bridge/microchip-lvds.c
> @@ -11,6 +11,7 @@
>  #include <linux/component.h>
>  #include <linux/delay.h>
>  #include <linux/jiffies.h>
> +#include <linux/media-bus-format.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/of_graph.h>
>  #include <linux/pinctrl/devinfo.h>
> @@ -41,9 +42,11 @@
>  
>  /* Bitfields in LVDSC_CFGR (Configuration Register) */
>  #define LVDSC_CFGR_PIXSIZE_24BITS	0
> +#define LVDSC_CFGR_PIXSIZE_18BITS	1

#define LVDSC_CFGR_PIXSIZE_18BITS	BIT(0)

>  #define LVDSC_CFGR_DEN_POL_HIGH		0
>  #define LVDSC_CFGR_DC_UNBALANCED	0
>  #define LVDSC_CFGR_MAPPING_JEIDA	BIT(6)
> +#define LVDSC_CFGR_MAPPING_VESA		0
>  
>  /*Bitfields in LVDSC_SR */
>  #define LVDSC_SR_CS	BIT(0)

I think you can drop the panel field of the mchp_lvds structure in the
same patch.

> @@ -76,9 +79,10 @@ static inline void lvds_writel(struct mchp_lvds *lvds, u32 offset, u32 val)
>  	writel_relaxed(val, lvds->regs + offset);
>  }
>  
> -static void lvds_serialiser_on(struct mchp_lvds *lvds)
> +static void lvds_serialiser_on(struct mchp_lvds *lvds, u32 bus_format)
>  {
>  	unsigned long timeout = jiffies + msecs_to_jiffies(LVDS_POLL_TIMEOUT_MS);
> +	u8 map, pix_size;
>  
>  	/* The LVDSC registers can only be written if WPEN is cleared */
>  	lvds_writel(lvds, LVDSC_WPMR, (LVDSC_WPMR_WPKEY_PSSWD &
> @@ -93,11 +97,24 @@ static void lvds_serialiser_on(struct mchp_lvds *lvds)
>  		usleep_range(1000, 2000);
>  	}
>  
> +	switch (bus_format) {
> +	case MEDIA_BUS_FMT_RGB666_1X7X3_SPWG:
> +		map = LVDSC_CFGR_MAPPING_JEIDA;
> +		pix_size = LVDSC_CFGR_PIXSIZE_18BITS;
> +		break;
> +	case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:
> +		map = LVDSC_CFGR_MAPPING_VESA;
> +		pix_size = LVDSC_CFGR_PIXSIZE_24BITS;
> +		break;
> +	default:
> +		map = LVDSC_CFGR_MAPPING_JEIDA;
> +		pix_size = LVDSC_CFGR_PIXSIZE_24BITS;
> +		break;
> +	}
> +
>  	/* Configure the LVDSC */
> -	lvds_writel(lvds, LVDSC_CFGR, (LVDSC_CFGR_MAPPING_JEIDA |
> -				LVDSC_CFGR_DC_UNBALANCED |
> -				LVDSC_CFGR_DEN_POL_HIGH |
> -				LVDSC_CFGR_PIXSIZE_24BITS));
> +	lvds_writel(lvds, LVDSC_CFGR, (map | LVDSC_CFGR_DC_UNBALANCED |
> +		    LVDSC_CFGR_DEN_POL_HIGH | pix_size));

You can drop the inner parentheses.

>  
>  	/* Enable the LVDS serializer */
>  	lvds_writel(lvds, LVDSC_CR, LVDSC_CR_SER_EN);
> @@ -113,7 +130,8 @@ static int mchp_lvds_attach(struct drm_bridge *bridge,
>  				 bridge, flags);
>  }
>  
> -static void mchp_lvds_enable(struct drm_bridge *bridge)
> +static void mchp_lvds_atomic_pre_enable(struct drm_bridge *bridge,
> +					struct drm_atomic_state *state)
>  {
>  	struct mchp_lvds *lvds = bridge_to_lvds(bridge);
>  	int ret;
> @@ -129,11 +147,35 @@ static void mchp_lvds_enable(struct drm_bridge *bridge)
>  		dev_err(lvds->dev, "failed to get pm runtime: %d\n", ret);
>  		return;
>  	}
> +}
> +
> +static void mchp_lvds_atomic_enable(struct drm_bridge *bridge,
> +				    struct drm_atomic_state *state)
> +{
> +	struct mchp_lvds *lvds = bridge_to_lvds(bridge);
> +	struct drm_connector *connector;
> +
> +	/* default to jeida-24 */
> +	u32 bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA;
> +
> +	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
> +	if (connector && connector->display_info.num_bus_formats)
> +		bus_format = connector->display_info.bus_formats[0];
> +
> +	lvds_serialiser_on(lvds, bus_format);
> +}
> +
> +static void mchp_lvds_atomic_disable(struct drm_bridge *bridge,
> +				     struct drm_atomic_state *state)
> +{
> +	struct mchp_lvds *lvds = bridge_to_lvds(bridge);
>  
> -	lvds_serialiser_on(lvds);
> +	/* Turn off the serialiser */
> +	lvds_writel(lvds, LVDSC_CR, 0);
>  }
>  
> -static void mchp_lvds_disable(struct drm_bridge *bridge)
> +static void mchp_lvds_atomic_post_disable(struct drm_bridge *bridge,
> +					  struct drm_atomic_state *state)
>  {
>  	struct mchp_lvds *lvds = bridge_to_lvds(bridge);
>  
> @@ -143,8 +185,10 @@ static void mchp_lvds_disable(struct drm_bridge *bridge)
>  
>  static const struct drm_bridge_funcs mchp_lvds_bridge_funcs = {
>  	.attach = mchp_lvds_attach,
> -	.enable = mchp_lvds_enable,
> -	.disable = mchp_lvds_disable,
> +	.atomic_pre_enable = mchp_lvds_atomic_pre_enable,
> +	.atomic_enable = mchp_lvds_atomic_enable,
> +	.atomic_disable = mchp_lvds_atomic_disable,
> +	.atomic_post_disable = mchp_lvds_atomic_post_disable,
>  };
>  
>  static int mchp_lvds_probe(struct platform_device *pdev)
> 
> ---
> base-commit: 4325743c7e209ae7845293679a4de94b969f2bef
> change-id: 20250618-microchip-lvds-b7151d96094a

-- 
Regards,

Laurent Pinchart
