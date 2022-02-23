Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E344C1A29
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 18:48:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E1CA10E1D7;
	Wed, 23 Feb 2022 17:47:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06FF610E1B6;
 Wed, 23 Feb 2022 17:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1645638477; x=1677174477;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=XUgO4nVQJ6a1L5q3OrfsToVOG7On6/Pom1eXaMVtDHs=;
 b=r9+xzwccGkKJvsgoBebW0R0+EqY2N2O5GUD9CdaMi4krmaIXt4s7SmRh
 GUNm0Km9rXm4xUIDkeOPq3Tp61TTZEdghCmsMgfO//NQFLyHTj4vTfTE9
 An76vPrWzX6jPHTHLBCNc4KqH+FM60H5iI3H/FzL/rfWFhDe3BeltcsDr E=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 23 Feb 2022 09:47:56 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2022 09:47:55 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Wed, 23 Feb 2022 09:47:55 -0800
Received: from [10.110.64.217] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15; Wed, 23 Feb
 2022 09:47:54 -0800
Message-ID: <2e253aa8-d405-c4b9-fd11-6797503c9d44@quicinc.com>
Date: Wed, 23 Feb 2022 09:47:54 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [RFC PATCH v2 2/5] drm/msm/dp: support attaching bridges to the
 DP encoder
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20220211224006.1797846-1-dmitry.baryshkov@linaro.org>
 <20220211224006.1797846-3-dmitry.baryshkov@linaro.org>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <20220211224006.1797846-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
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
> Currently DP driver will allocate panel bridge for eDP panels. This
> supports only the following topology:
>
> - eDP encoder ⇒ eDP panel (wrapped using panel-bridge)
>
> Simplify this code to just check if there is any next bridge in the
> chain (be it a panel bridge or regular bridge). Rename panel_bridge
> field to next_bridge accordingly.
>
> This allows one to use e.g. one of the following display topologies:
>
> - eDP encoder ⇒ ptn3460 ⇒ fixed LVDS panel
> - eDP encoder ⇒ ptn3460 ⇒ LVDS connector with EDID lines for panel autodetect
> - eDP encoder ⇒ ptn3460 ⇒ THC63LVD1024 ⇒ DPI panel.
> - eDP encoder ⇒ LT8912 ⇒ DSI panel
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Tested-by: Kuogee Hsieh <quic_khsieh@quicinc.com>


>   drivers/gpu/drm/msm/dp/dp_display.c |  2 +-
>   drivers/gpu/drm/msm/dp/dp_display.h |  2 +-
>   drivers/gpu/drm/msm/dp/dp_drm.c     |  4 ++--
>   drivers/gpu/drm/msm/dp/dp_parser.c  | 31 +++++++++++++++--------------
>   drivers/gpu/drm/msm/dp/dp_parser.h  |  2 +-
>   5 files changed, 21 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 44d42c76c2a3..45f9a912ecc5 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -266,7 +266,7 @@ static int dp_display_bind(struct device *dev, struct device *master,
>   		goto end;
>   	}
>   
> -	dp->dp_display.panel_bridge = dp->parser->panel_bridge;
> +	dp->dp_display.next_bridge = dp->parser->next_bridge;
>   
>   	dp->aux->drm_dev = drm;
>   	rc = dp_aux_register(dp->aux);
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
> index e3adcd578a90..7af2b186d2d9 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.h
> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> @@ -16,7 +16,7 @@ struct msm_dp {
>   	struct drm_bridge *bridge;
>   	struct drm_connector *connector;
>   	struct drm_encoder *encoder;
> -	struct drm_bridge *panel_bridge;
> +	struct drm_bridge *next_bridge;
>   	bool is_connected;
>   	bool audio_enabled;
>   	bool power_on;
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
> index 26ef41a4c1b6..80f59cf99089 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> @@ -236,9 +236,9 @@ struct drm_bridge *msm_dp_bridge_init(struct msm_dp *dp_display, struct drm_devi
>   		return ERR_PTR(rc);
>   	}
>   
> -	if (dp_display->panel_bridge) {
> +	if (dp_display->next_bridge) {
>   		rc = drm_bridge_attach(dp_display->encoder,
> -					dp_display->panel_bridge, bridge,
> +					dp_display->next_bridge, bridge,
>   					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>   		if (rc < 0) {
>   			DRM_ERROR("failed to attach panel bridge: %d\n", rc);
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
> index a7acc23f742b..901d7967370f 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.c
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.c
> @@ -265,23 +265,16 @@ static int dp_parser_clock(struct dp_parser *parser)
>   	return 0;
>   }
>   
> -static int dp_parser_find_panel(struct dp_parser *parser)
> +static int dp_parser_find_next_bridge(struct dp_parser *parser)
>   {
>   	struct device *dev = &parser->pdev->dev;
> -	struct drm_panel *panel;
> -	int rc;
> +	struct drm_bridge *bridge;
>   
> -	rc = drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &panel, NULL);
> -	if (rc) {
> -		DRM_ERROR("failed to acquire DRM panel: %d\n", rc);
> -		return rc;
> -	}
> +	bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
> +	if (IS_ERR(bridge))
> +		return PTR_ERR(bridge);
>   
> -	parser->panel_bridge = devm_drm_panel_bridge_add(dev, panel);
> -	if (IS_ERR(parser->panel_bridge)) {
> -		DRM_ERROR("failed to create panel bridge\n");
> -		return PTR_ERR(parser->panel_bridge);
> -	}
> +	parser->next_bridge = bridge;
>   
>   	return 0;
>   }
> @@ -307,10 +300,18 @@ static int dp_parser_parse(struct dp_parser *parser, int connector_type)
>   	if (rc)
>   		return rc;
>   
> +	/*
> +	 * Currently we support external bridges only for eDP connectors.
> +	 *
> +	 * No external bridges are expected for the DisplayPort connector,
> +	 * it is physically present in a form of a DP or USB-C connector.
> +	 */
>   	if (connector_type == DRM_MODE_CONNECTOR_eDP) {
> -		rc = dp_parser_find_panel(parser);
> -		if (rc)
> +		rc = dp_parser_find_next_bridge(parser);
> +		if (rc) {
> +			DRM_ERROR("DP: failed to find next bridge\n");
>   			return rc;
> +		}
>   	}
>   
>   	/* Map the corresponding regulator information according to
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
> index 3172da089421..4cec851e38d9 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.h
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.h
> @@ -123,7 +123,7 @@ struct dp_parser {
>   	struct dp_display_data disp_data;
>   	const struct dp_regulator_cfg *regulator_cfg;
>   	u32 max_dp_lanes;
> -	struct drm_bridge *panel_bridge;
> +	struct drm_bridge *next_bridge;
>   
>   	int (*parse)(struct dp_parser *parser, int connector_type);
>   };
