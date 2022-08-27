Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC335A3359
	for <lists+dri-devel@lfdr.de>; Sat, 27 Aug 2022 03:10:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A21310EAD0;
	Sat, 27 Aug 2022 01:10:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A4B910EAD0
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Aug 2022 01:10:51 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 433C24A8;
 Sat, 27 Aug 2022 03:10:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1661562649;
 bh=tTU3IOe71yXnE9NPnmMuZnHbyq6VxhTerBcqCMDfuns=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bGvF86GyxJHqzfn6pK5xt0OzxZrr67DOrotmIMEOW7hNGCQXOOlDyRkwTTmehWy8u
 y/raJTfO/JvZk5TC/OVEnYc/szNuH2w1AtCHNGFbxf4mCjMQceEkTcuUz4PSTYgH6e
 p3+eKSCKFEYPZtfKaMh5kbWjaWBlIGOkoEwp+NWw=
Date: Sat, 27 Aug 2022 04:10:41 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v5 4/4] drm/bridge: ti-sn65dsi86: Implement bridge
 connector operations
Message-ID: <YwlvEa7c6xnhvGyj@pendragon.ideasonboard.com>
References: <20220824130034.196041-1-tomi.valkeinen@ideasonboard.com>
 <20220824130034.196041-5-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220824130034.196041-5-tomi.valkeinen@ideasonboard.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Douglas Anderson <dianders@chromium.org>, Robert Foss <robert.foss@linaro.org>,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

On Wed, Aug 24, 2022 at 04:00:34PM +0300, Tomi Valkeinen wrote:
> From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> Implement the bridge connector-related .get_edid() and .detect()
> operations, and report the related bridge capabilities and type.
> 
> These ops are only added for DP mode. They should also be used for eDP
> mode, but the driver seems to be mostly used for eDP and, according to
> the comments, they've had issues with eDP panels and HPD. So better be
> safe and only enable them for DP for now.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

This patch is missing a third-party review, so I won't apply the series
to my tree but will let you pushing it through drm-misc once we get the
necessary review.

> ---
> Changes since v1:
> 
> - The connector .get_modes() operation doesn't rely on EDID anymore,
>   __ti_sn_bridge_get_edid() and ti_sn_bridge_get_edid() got merged
>   together
>  - Fix on top of Sam Ravnborg's DRM_BRIDGE_STATE_OPS
> 
> Changes since v2: [Kieran]
>  - Only support EDID on DRM_MODE_CONNECTOR_DisplayPort modes.
> 
> Changes since v3: [Kieran]
>  - Remove PM calls in ti_sn_bridge_get_edid() and simplify
> 
> Changes since v4:
>  - Add .detect()
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 28 +++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index a6b15ea4e84d..dd20624adc70 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -29,6 +29,7 @@
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_bridge_connector.h>
> +#include <drm/drm_edid.h>
>  #include <drm/drm_mipi_dsi.h>
>  #include <drm/drm_of.h>
>  #include <drm/drm_panel.h>
> @@ -68,6 +69,7 @@
>  #define  BPP_18_RGB				BIT(0)
>  #define SN_HPD_DISABLE_REG			0x5C
>  #define  HPD_DISABLE				BIT(0)
> +#define  HPD_DEBOUNCED_STATE			BIT(4)
>  #define SN_GPIO_IO_REG				0x5E
>  #define  SN_GPIO_INPUT_SHIFT			4
>  #define  SN_GPIO_OUTPUT_SHIFT			0
> @@ -1163,10 +1165,33 @@ static void ti_sn_bridge_atomic_post_disable(struct drm_bridge *bridge,
>  	pm_runtime_put_sync(pdata->dev);
>  }
>  
> +static enum drm_connector_status ti_sn_bridge_detect(struct drm_bridge *bridge)
> +{
> +	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
> +	int val = 0;
> +
> +	pm_runtime_get_sync(pdata->dev);

Would this

	int ret;

	ret = pm_runtime_resume_and_get(pdata->dev);
	if (ret)
		return connector_status_disconnected;

(or possibly connector_status_unknown) help avoiding problems ?

Apart from that, the patch looks good to me.

> +	regmap_read(pdata->regmap, SN_HPD_DISABLE_REG, &val);
> +	pm_runtime_put_autosuspend(pdata->dev);
> +
> +	return val & HPD_DEBOUNCED_STATE ? connector_status_connected
> +					 : connector_status_disconnected;
> +}
> +
> +static struct edid *ti_sn_bridge_get_edid(struct drm_bridge *bridge,
> +					  struct drm_connector *connector)
> +{
> +	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
> +
> +	return drm_get_edid(connector, &pdata->aux.ddc);
> +}
> +
>  static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
>  	.attach = ti_sn_bridge_attach,
>  	.detach = ti_sn_bridge_detach,
>  	.mode_valid = ti_sn_bridge_mode_valid,
> +	.get_edid = ti_sn_bridge_get_edid,
> +	.detect = ti_sn_bridge_detect,
>  	.atomic_pre_enable = ti_sn_bridge_atomic_pre_enable,
>  	.atomic_enable = ti_sn_bridge_atomic_enable,
>  	.atomic_disable = ti_sn_bridge_atomic_disable,
> @@ -1262,6 +1287,9 @@ static int ti_sn_bridge_probe(struct auxiliary_device *adev,
>  	pdata->bridge.type = pdata->next_bridge->type == DRM_MODE_CONNECTOR_DisplayPort
>  			   ? DRM_MODE_CONNECTOR_DisplayPort : DRM_MODE_CONNECTOR_eDP;
>  
> +	if (pdata->bridge.type == DRM_MODE_CONNECTOR_DisplayPort)
> +		pdata->bridge.ops = DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_DETECT;
> +
>  	drm_bridge_add(&pdata->bridge);
>  
>  	ret = ti_sn_attach_host(pdata);
> -- 
> 2.34.1
> 

-- 
Regards,

Laurent Pinchart
