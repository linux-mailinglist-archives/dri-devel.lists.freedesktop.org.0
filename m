Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0959EAB7918
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 00:37:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B63A410E02F;
	Wed, 14 May 2025 22:36:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="B2Ynz6JG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DA7A10E02F
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 22:36:50 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (cust-east-par-46-193-72-226.cust.wifirst.net [46.193.72.226])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0FBBD725;
 Thu, 15 May 2025 00:36:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1747262187;
 bh=sa2uCyX7Z3JYK87vSFtE4RQ6/9Zp2oN+ivGmFG29byw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=B2Ynz6JGIsTxD1aYvu6V7clVPuN5xsBO7D7XWwM3xD7xbYJDDRxp8ibCQ/6xoy5ws
 MHb+kJCPzywH3MQw695DHmtmQ84IKbAlHJiZ7ifJOoR67xNel2UC+jcb6TiDZR2VrH
 wFbQTAAf7Jd0y773TJP0GLd+VqxEb1QemTlApnPg=
Date: Thu, 15 May 2025 00:36:36 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 jonas@kwiboo.se, jernej.skrabec@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de
Subject: Re: [PATCH 2/3] drm/bridge: fsl-ldb: make use of dev_err_probe
Message-ID: <20250514223636.GK23592@pendragon.ideasonboard.com>
References: <20250514222453.440915-1-m.felsch@pengutronix.de>
 <20250514222453.440915-3-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250514222453.440915-3-m.felsch@pengutronix.de>
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

Hi Marco,

Thank you for the patch.

On Thu, May 15, 2025 at 12:24:52AM +0200, Marco Felsch wrote:
> Make use of dev_err_probe() to easily spot issues via the debugfs or
> kernel log. No functional changes.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/fsl-ldb.c | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
> index fa29f2bf4031..e0a229c91953 100644
> --- a/drivers/gpu/drm/bridge/fsl-ldb.c
> +++ b/drivers/gpu/drm/bridge/fsl-ldb.c
> @@ -308,11 +308,13 @@ static int fsl_ldb_probe(struct platform_device *pdev)
>  
>  	fsl_ldb->clk = devm_clk_get(dev, "ldb");
>  	if (IS_ERR(fsl_ldb->clk))
> -		return PTR_ERR(fsl_ldb->clk);
> +		return dev_err_probe(dev, PTR_ERR(fsl_ldb->clk),
> +				     "Failed to get ldb clk\n");
>  
>  	fsl_ldb->regmap = syscon_node_to_regmap(dev->of_node->parent);
>  	if (IS_ERR(fsl_ldb->regmap))
> -		return PTR_ERR(fsl_ldb->regmap);
> +		return dev_err_probe(dev, PTR_ERR(fsl_ldb->regmap),
> +				     "Failed to get regmap\n");
>  
>  	/* Locate the remote ports and the panel node */
>  	remote1 = of_graph_get_remote_node(dev->of_node, 1, 0);
> @@ -335,12 +337,12 @@ static int fsl_ldb_probe(struct platform_device *pdev)
>  	panel = of_drm_find_panel(panel_node);
>  	of_node_put(panel_node);
>  	if (IS_ERR(panel))
> -		return PTR_ERR(panel);
> +		return dev_err_probe(dev, PTR_ERR(panel), "drm panel not found\n");
>  
>  	fsl_ldb->panel_bridge = devm_drm_panel_bridge_add(dev, panel);
>  	if (IS_ERR(fsl_ldb->panel_bridge))
> -		return PTR_ERR(fsl_ldb->panel_bridge);
> -
> +		return dev_err_probe(dev, PTR_ERR(fsl_ldb->panel_bridge),
> +				     "drm panel-bridge add failed\n");
>  
>  	if (fsl_ldb_is_dual(fsl_ldb)) {
>  		struct device_node *port1, *port2;
> @@ -356,10 +358,9 @@ static int fsl_ldb_probe(struct platform_device *pdev)
>  					     "Error getting dual link configuration\n");
>  
>  		/* Only DRM_LVDS_DUAL_LINK_ODD_EVEN_PIXELS is supported */
> -		if (dual_link == DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS) {
> -			dev_err(dev, "LVDS channel pixel swap not supported.\n");
> -			return -EINVAL;
> -		}
> +		if (dual_link == DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS)
> +			return dev_err_probe(dev, -EINVAL,
> +					     "LVDS channel pixel swap not supported.\n");
>  	}
>  
>  	platform_set_drvdata(pdev, fsl_ldb);

-- 
Regards,

Laurent Pinchart
