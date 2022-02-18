Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B124BC220
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 22:31:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E102D10EA07;
	Fri, 18 Feb 2022 21:31:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBB5510EA07;
 Fri, 18 Feb 2022 21:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1645219893; x=1676755893;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=9gMKqj2n86hOvJog2TljNi9mipWalBn8eAV7XJzWhik=;
 b=Y+c74UoEftfJJsxIBPIDxsT0maOoHqyetLe6qbI3v3kt/M1jrLx2XJlY
 CFLKIloX52DW0V03ZbsTwkCbhHY9QR690QYpKlqczvNWd+Y862AxQiKCi
 WBdBPk4w1Ua3tx5N4FeO1NWpZgenG786xHBD0uH/MMHGzTK4Mx6xsTe2k o=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 18 Feb 2022 13:31:32 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 13:31:32 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Fri, 18 Feb 2022 13:31:26 -0800
Received: from [10.110.101.104] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15; Fri, 18 Feb
 2022 13:31:25 -0800
Message-ID: <572c0402-55da-077b-1809-3d1caf7ce743@quicinc.com>
Date: Fri, 18 Feb 2022 13:31:24 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH v2 4/5] drm/msm/dp: replace dp_connector with
 drm_bridge_connector
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20220211224006.1797846-1-dmitry.baryshkov@linaro.org>
 <20220211224006.1797846-5-dmitry.baryshkov@linaro.org>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <20220211224006.1797846-5-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2/11/2022 2:40 PM, Dmitry Baryshkov wrote:
> There is little point in having both connector and root bridge
> implementation in the same driver. Move connector's functionality to the
> bridge to let next bridge in chain to override it.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

This patch break primary (edp) display

-- right half of screen garbled

-- screen shift vertically

below are error messages seen --

[   36.679216] panel-edp soc@0:edp_panel: No display modes
[   36.687272] panel-edp soc@0:edp_panel: No display modes
[   40.593709] panel-edp soc@0:edp_panel: No display modes
[   40.600285] panel-edp soc@0:edp_panel: No display modes

> ---
>   drivers/gpu/drm/msm/dp/dp_display.c |  22 +++---
>   drivers/gpu/drm/msm/dp/dp_drm.c     | 113 ++++++++++------------------
>   2 files changed, 52 insertions(+), 83 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 45f9a912ecc5..59e5e5b8e5b4 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1501,6 +1501,17 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
>   
>   	dp_display->encoder = encoder;
>   
> +	dp_display->bridge = msm_dp_bridge_init(dp_display, dev, encoder);
> +	if (IS_ERR(dp_display->bridge)) {
> +		ret = PTR_ERR(dp_display->bridge);
> +		DRM_DEV_ERROR(dev->dev,
> +			"failed to create dp bridge: %d\n", ret);
> +		dp_display->bridge = NULL;
> +		return ret;
> +	}
> +
> +	priv->bridges[priv->num_bridges++] = dp_display->bridge;
> +
>   	dp_display->connector = dp_drm_connector_init(dp_display);
>   	if (IS_ERR(dp_display->connector)) {
>   		ret = PTR_ERR(dp_display->connector);
> @@ -1514,17 +1525,6 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
>   
>   	priv->connectors[priv->num_connectors++] = dp_display->connector;
>   
> -	dp_display->bridge = msm_dp_bridge_init(dp_display, dev, encoder);
> -	if (IS_ERR(dp_display->bridge)) {
> -		ret = PTR_ERR(dp_display->bridge);
> -		DRM_DEV_ERROR(dev->dev,
> -			"failed to create dp bridge: %d\n", ret);
> -		dp_display->bridge = NULL;
> -		return ret;
> -	}
> -
> -	priv->bridges[priv->num_bridges++] = dp_display->bridge;
> -
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
> index 80f59cf99089..57800b865fe6 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> @@ -6,6 +6,7 @@
>   #include <drm/drm_atomic_helper.h>
>   #include <drm/drm_atomic.h>
>   #include <drm/drm_bridge.h>
> +#include <drm/drm_bridge_connector.h>
>   #include <drm/drm_crtc.h>
>   
>   #include "msm_drv.h"
> @@ -20,24 +21,16 @@ struct msm_dp_bridge {
>   
>   #define to_dp_display(x)     container_of((x), struct msm_dp_bridge, bridge)
>   
> -struct dp_connector {
> -	struct drm_connector base;
> -	struct msm_dp *dp_display;
> -};
> -#define to_dp_connector(x) container_of(x, struct dp_connector, base)
> -
>   /**
> - * dp_connector_detect - callback to determine if connector is connected
> - * @conn: Pointer to drm connector structure
> - * @force: Force detect setting from drm framework
> - * Returns: Connector 'is connected' status
> + * dp_bridge_detect - callback to determine if connector is connected
> + * @bridge: Pointer to drm bridge structure
> + * Returns: Bridge's 'is connected' status
>    */
> -static enum drm_connector_status dp_connector_detect(struct drm_connector *conn,
> -		bool force)
> +static enum drm_connector_status dp_bridge_detect(struct drm_bridge *bridge)
>   {
>   	struct msm_dp *dp;
>   
> -	dp = to_dp_connector(conn)->dp_display;
> +	dp = to_dp_display(bridge)->dp_display;
>   
>   	DRM_DEBUG_DP("is_connected = %s\n",
>   		(dp->is_connected) ? "true" : "false");
> @@ -47,11 +40,12 @@ static enum drm_connector_status dp_connector_detect(struct drm_connector *conn,
>   }
>   
>   /**
> - * dp_connector_get_modes - callback to add drm modes via drm_mode_probed_add()
> + * dp_bridge_get_modes - callback to add drm modes via drm_mode_probed_add()
> + * @bridge: Poiner to drm bridge
>    * @connector: Pointer to drm connector structure
>    * Returns: Number of modes added
>    */
> -static int dp_connector_get_modes(struct drm_connector *connector)
> +static int dp_bridge_get_modes(struct drm_bridge *bridge, struct drm_connector *connector)
>   {
>   	int rc = 0;
>   	struct msm_dp *dp;
> @@ -61,7 +55,7 @@ static int dp_connector_get_modes(struct drm_connector *connector)
>   	if (!connector)
>   		return 0;
>   
> -	dp = to_dp_connector(connector)->dp_display;
> +	dp = to_dp_display(bridge)->dp_display;
>   
>   	dp_mode = kzalloc(sizeof(*dp_mode),  GFP_KERNEL);
>   	if (!dp_mode)
> @@ -102,18 +96,20 @@ static int dp_connector_get_modes(struct drm_connector *connector)
>   }
>   
>   /**
> - * dp_connector_mode_valid - callback to determine if specified mode is valid
> - * @connector: Pointer to drm connector structure
> + * dp_bridge_mode_valid - callback to determine if specified mode is valid
> + * @bridge: Pointer to drm bridge structure
> + * @info: display info
>    * @mode: Pointer to drm mode structure
>    * Returns: Validity status for specified mode
>    */
> -static enum drm_mode_status dp_connector_mode_valid(
> -		struct drm_connector *connector,
> -		struct drm_display_mode *mode)
> +static enum drm_mode_status dp_bridge_mode_valid(
> +		struct drm_bridge *bridge,
> +		const struct drm_display_info *info,
> +		const struct drm_display_mode *mode)
>   {
>   	struct msm_dp *dp_disp;
>   
> -	dp_disp = to_dp_connector(connector)->dp_display;
> +	dp_disp = to_dp_display(bridge)->dp_display;
>   
>   	if ((dp_disp->max_pclk_khz <= 0) ||
>   			(dp_disp->max_pclk_khz > DP_MAX_PIXEL_CLK_KHZ) ||
> @@ -123,55 +119,6 @@ static enum drm_mode_status dp_connector_mode_valid(
>   	return dp_display_validate_mode(dp_disp, mode->clock);
>   }
>   
> -static const struct drm_connector_funcs dp_connector_funcs = {
> -	.detect = dp_connector_detect,
> -	.fill_modes = drm_helper_probe_single_connector_modes,
> -	.destroy = drm_connector_cleanup,
> -	.reset = drm_atomic_helper_connector_reset,
> -	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> -	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> -};
> -
> -static const struct drm_connector_helper_funcs dp_connector_helper_funcs = {
> -	.get_modes = dp_connector_get_modes,
> -	.mode_valid = dp_connector_mode_valid,
> -};
> -
> -/* connector initialization */
> -struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display)
> -{
> -	struct drm_connector *connector = NULL;
> -	struct dp_connector *dp_connector;
> -	int ret;
> -
> -	dp_connector = devm_kzalloc(dp_display->drm_dev->dev,
> -					sizeof(*dp_connector),
> -					GFP_KERNEL);
> -	if (!dp_connector)
> -		return ERR_PTR(-ENOMEM);
> -
> -	dp_connector->dp_display = dp_display;
> -
> -	connector = &dp_connector->base;
> -
> -	ret = drm_connector_init(dp_display->drm_dev, connector,
> -			&dp_connector_funcs,
> -			dp_display->connector_type);
> -	if (ret)
> -		return ERR_PTR(ret);
> -
> -	drm_connector_helper_add(connector, &dp_connector_helper_funcs);
> -
> -	/*
> -	 * Enable HPD to let hpd event is handled when cable is connected.
> -	 */
> -	connector->polled = DRM_CONNECTOR_POLL_HPD;
> -
> -	drm_connector_attach_encoder(connector, dp_display->encoder);
> -
> -	return connector;
> -}
> -
>   static void dp_bridge_mode_set(struct drm_bridge *drm_bridge,
>   				const struct drm_display_mode *mode,
>   				const struct drm_display_mode *adjusted_mode)
> @@ -211,6 +158,9 @@ static const struct drm_bridge_funcs dp_bridge_ops = {
>   	.disable      = dp_bridge_disable,
>   	.post_disable = dp_bridge_post_disable,
>   	.mode_set     = dp_bridge_mode_set,
> +	.mode_valid   = dp_bridge_mode_valid,
> +	.get_modes    = dp_bridge_get_modes,
> +	.detect       = dp_bridge_detect,
>   };
>   
>   struct drm_bridge *msm_dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
> @@ -228,7 +178,12 @@ struct drm_bridge *msm_dp_bridge_init(struct msm_dp *dp_display, struct drm_devi
>   
>   	bridge = &dp_bridge->bridge;
>   	bridge->funcs = &dp_bridge_ops;
> -	bridge->encoder = encoder;
> +	bridge->type = dp_display->connector_type;
> +
> +	bridge->ops =
> +		DRM_BRIDGE_OP_DETECT |
> +		DRM_BRIDGE_OP_HPD |
> +		DRM_BRIDGE_OP_MODES;
>   
>   	rc = drm_bridge_attach(encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>   	if (rc) {
> @@ -249,3 +204,17 @@ struct drm_bridge *msm_dp_bridge_init(struct msm_dp *dp_display, struct drm_devi
>   
>   	return bridge;
>   }
> +
> +/* connector initialization */
> +struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display)
> +{
> +	struct drm_connector *connector = NULL;
> +
> +	connector = drm_bridge_connector_init(dp_display->drm_dev, dp_display->encoder);
> +	if (IS_ERR(connector))
> +		return connector;
> +
> +	drm_connector_attach_encoder(connector, dp_display->encoder);
> +
> +	return connector;
> +}
