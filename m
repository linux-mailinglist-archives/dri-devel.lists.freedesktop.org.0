Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E1A5BC9AB
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 12:43:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3364410E5F9;
	Mon, 19 Sep 2022 10:43:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 082C310E5F9
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 10:43:45 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id CC227D02;
 Mon, 19 Sep 2022 12:43:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1663584223;
 bh=2VN+lPUU0HWbPH3ReA2VR1zfuu9H6VNxiwqm2QgC0mM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GdOIsFJcS9bsIBQ/sE4of5jJpLh8y+E3c9Ul83JUFLZEqJXT7J41HBu0724QreAZ1
 wy/nIeiy4T73bkWipU6xcAHJzY49ewB0kRIFsUof/xdNoPLrndEPNOOcf0K+v9rf44
 9FHeL/kI1woSGQ2PJa1hhjaoUV4C/MPOquhB6mBk=
Date: Mon, 19 Sep 2022 13:43:29 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Robert Foss <robert.foss@linaro.org>
Subject: Re: [PATCH v2 1/2] Revert "Revert "drm/bridge: ti-sn65dsi86:
 Implement bridge connector operations for DP""
Message-ID: <YyhH0cENOBZfeu64@pendragon.ideasonboard.com>
References: <20220919102009.150503-1-robert.foss@linaro.org>
 <20220919102009.150503-2-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220919102009.150503-2-robert.foss@linaro.org>
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
Cc: devicetree@vger.kernel.org, andrzej.hajda@intel.com, jonas@kwiboo.se,
 airlied@linux.ie, narmstrong@baylibre.com,
 Chris Morgan <macromorgan@hotmail.com>, dianders@chromium.org,
 jernej.skrabec@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

Thank you for the patch.

On Mon, Sep 19, 2022 at 12:20:08PM +0200, Robert Foss wrote:
> This commit was accidentally reverted instead of another commit, and
> therefore needs to be reinstated.
> 
> This reverts commit 8c9c40ec83445b188fb6b59e119bf5c2de81b02d.
> 
> Fixes: 8c9c40ec8344 ("Revert "drm/bridge: ti-sn65dsi86: Implement bridge connector operations for DP"")
> Signed-off-by: Robert Foss <robert.foss@linaro.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 28 +++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 6e053e2af229..3c3561942eb6 100644
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
> @@ -1158,10 +1160,33 @@ static void ti_sn_bridge_atomic_post_disable(struct drm_bridge *bridge,
>  	pm_runtime_put_sync(pdata->dev);
>  }
>  
> +static enum drm_connector_status ti_sn_bridge_detect(struct drm_bridge *bridge)
> +{
> +	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
> +	int val = 0;
> +
> +	pm_runtime_get_sync(pdata->dev);
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
> @@ -1257,6 +1282,9 @@ static int ti_sn_bridge_probe(struct auxiliary_device *adev,
>  	pdata->bridge.type = pdata->next_bridge->type == DRM_MODE_CONNECTOR_DisplayPort
>  			   ? DRM_MODE_CONNECTOR_DisplayPort : DRM_MODE_CONNECTOR_eDP;
>  
> +	if (pdata->bridge.type == DRM_MODE_CONNECTOR_DisplayPort)
> +		pdata->bridge.ops = DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_DETECT;
> +
>  	drm_bridge_add(&pdata->bridge);
>  
>  	ret = ti_sn_attach_host(pdata);

-- 
Regards,

Laurent Pinchart
