Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C28AA6F9DDE
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 04:51:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54CA410E105;
	Mon,  8 May 2023 02:51:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21A8E10E124;
 Mon,  8 May 2023 02:51:08 +0000 (UTC)
Received: from pendragon.ideasonboard.com (softbank126090219015.bbtec.net
 [126.90.219.15])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 45E5E814;
 Mon,  8 May 2023 04:50:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1683514261;
 bh=ZhuJ29aZv60+w90rySi90/rQ2dYJYfEe/RLa1/gUzIQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QLBgZWUj/E76WqwQITzOEEw0Ch1u7EGfKutIWCpGV95tmvPsdxUuBYKLnYMv9nq/8
 NSOZAEQac2pBVKvnnP/CUxysDR5bMEtA/OxhXCFDjliKY/K9O0snBwjdad3TZtOLdn
 jRYyi+e6LBdp2o3M38axsDarGC/n+6PIBlAxU5TQ=
Date: Mon, 8 May 2023 05:51:18 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 2/3] drm/bridge: display-connector: rename dp_pwr to
 connector_pwr
Message-ID: <20230508025118.GQ23514@pendragon.ideasonboard.com>
References: <20230507201218.2339014-1-dmitry.baryshkov@linaro.org>
 <20230507201218.2339014-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230507201218.2339014-3-dmitry.baryshkov@linaro.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, freedreno@lists.freedesktop.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

Thank you for the patch.

On Sun, May 07, 2023 at 11:12:17PM +0300, Dmitry Baryshkov wrote:
> In preparation to adding support for the hdmi_pwr supply, rename dp_pwr
> structure field to the generic connector_pwr.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/bridge/display-connector.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/display-connector.c b/drivers/gpu/drm/bridge/display-connector.c
> index 9a12449ad7b8..0d94e6edea50 100644
> --- a/drivers/gpu/drm/bridge/display-connector.c
> +++ b/drivers/gpu/drm/bridge/display-connector.c
> @@ -24,7 +24,7 @@ struct display_connector {
>  	struct gpio_desc	*hpd_gpio;
>  	int			hpd_irq;
>  
> -	struct regulator	*dp_pwr;
> +	struct regulator	*connector_pwr;

This makes sense, but I would shorten the name to just "pwr", "power" or
"supply". The field is part of the display_connector structure, so it
implicitly refers to the connector.

With or without that change,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  	struct gpio_desc	*ddc_en;
>  };
>  
> @@ -319,14 +319,14 @@ static int display_connector_probe(struct platform_device *pdev)
>  	if (type == DRM_MODE_CONNECTOR_DisplayPort) {
>  		int ret;
>  
> -		conn->dp_pwr = devm_regulator_get_optional(&pdev->dev, "dp-pwr");
> +		conn->connector_pwr = devm_regulator_get_optional(&pdev->dev, "dp-pwr");
>  
> -		if (IS_ERR(conn->dp_pwr)) {
> -			ret = PTR_ERR(conn->dp_pwr);
> +		if (IS_ERR(conn->connector_pwr)) {
> +			ret = PTR_ERR(conn->connector_pwr);
>  
>  			switch (ret) {
>  			case -ENODEV:
> -				conn->dp_pwr = NULL;
> +				conn->connector_pwr = NULL;
>  				break;
>  
>  			case -EPROBE_DEFER:
> @@ -338,8 +338,8 @@ static int display_connector_probe(struct platform_device *pdev)
>  			}
>  		}
>  
> -		if (conn->dp_pwr) {
> -			ret = regulator_enable(conn->dp_pwr);
> +		if (conn->connector_pwr) {
> +			ret = regulator_enable(conn->connector_pwr);
>  			if (ret) {
>  				dev_err(&pdev->dev, "failed to enable DP PWR regulator: %d\n", ret);
>  				return ret;
> @@ -389,8 +389,8 @@ static int display_connector_remove(struct platform_device *pdev)
>  	if (conn->ddc_en)
>  		gpiod_set_value(conn->ddc_en, 0);
>  
> -	if (conn->dp_pwr)
> -		regulator_disable(conn->dp_pwr);
> +	if (conn->connector_pwr)
> +		regulator_disable(conn->connector_pwr);
>  
>  	drm_bridge_remove(&conn->bridge);
>  

-- 
Regards,

Laurent Pinchart
