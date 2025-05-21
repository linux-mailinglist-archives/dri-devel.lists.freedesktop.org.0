Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA78ABFDCF
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 22:23:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CB0E10E06F;
	Wed, 21 May 2025 20:23:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mVwp4Wi3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FFD410E06F
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 20:23:43 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (179.218-130-109.adsl-dyn.isp.belgacom.be [109.130.218.179])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 41F483A4;
 Wed, 21 May 2025 22:23:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1747858996;
 bh=5zsA2YO7OV9LkOjOhxVEFKJI/n+fcDPSewRE03lCV84=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mVwp4Wi30RF/76LilvP8RLRQNVT4Wlh+tyuh7Rg+UH+Gq5sBMbQgtdXsxZ+SmTbX+
 7H1drtBWg0shTfQ57ktaMM3H1Fn7WUgUbxD62cg8Jpt4rF1PF7Zan5kLz/N2tWb/yd
 g+ddqp0mwUdTQ5TjV5KKRqjRj8zaPRJ88oeV9Q+g=
Date: Wed, 21 May 2025 22:23:31 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 jonas@kwiboo.se, jernej.skrabec@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 alexander.stein@ew.tq-group.com, kernel@pengutronix.de,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 2/2] drm/bridge: fsl-ldb: simplify device_node error
 handling
Message-ID: <20250521202331.GB2942@pendragon.ideasonboard.com>
References: <20250515173643.2140748-1-m.felsch@pengutronix.de>
 <20250515173643.2140748-3-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250515173643.2140748-3-m.felsch@pengutronix.de>
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

On Thu, May 15, 2025 at 07:36:43PM +0200, Marco Felsch wrote:
> Make use of __free(device_node) to simplify the of_node_put() error
> handling paths. No functional changes.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> Changelog:
> v2:
>  - drop __free() from panel_node
> 
>  drivers/gpu/drm/bridge/fsl-ldb.c | 22 ++++++++--------------
>  1 file changed, 8 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
> index 6916cdb15372..f80c68617ce5 100644
> --- a/drivers/gpu/drm/bridge/fsl-ldb.c
> +++ b/drivers/gpu/drm/bridge/fsl-ldb.c
> @@ -293,7 +293,8 @@ static int fsl_ldb_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct device_node *panel_node;
> -	struct device_node *remote1, *remote2;
> +	struct device_node *remote1 __free(device_node) = NULL;
> +	struct device_node *remote2 __free(device_node) = NULL;
>  	struct drm_panel *panel;
>  	struct fsl_ldb *fsl_ldb;
>  	int dual_link;
> @@ -325,21 +326,16 @@ static int fsl_ldb_probe(struct platform_device *pdev)
>  	remote2 = of_graph_get_remote_node(dev->of_node, 2, 0);
>  	fsl_ldb->ch0_enabled = (remote1 != NULL);
>  	fsl_ldb->ch1_enabled = (remote2 != NULL);
> -	panel_node = of_node_get(remote1 ? remote1 : remote2);
> -	of_node_put(remote1);
> -	of_node_put(remote2);
> +	panel_node = remote1 ? remote1 : remote2;
>  
> -	if (!fsl_ldb->ch0_enabled && !fsl_ldb->ch1_enabled) {
> -		of_node_put(panel_node);
> +	if (!fsl_ldb->ch0_enabled && !fsl_ldb->ch1_enabled)
>  		return dev_err_probe(dev, -ENXIO, "No panel node found");
> -	}
>  
>  	dev_dbg(dev, "Using %s\n",
>  		fsl_ldb_is_dual(fsl_ldb) ? "dual-link mode" :
>  		fsl_ldb->ch0_enabled ? "channel 0" : "channel 1");
>  
>  	panel = of_drm_find_panel(panel_node);
> -	of_node_put(panel_node);
>  	if (IS_ERR(panel))
>  		return dev_err_probe(dev, PTR_ERR(panel), "drm panel not found\n");
>  
> @@ -349,14 +345,12 @@ static int fsl_ldb_probe(struct platform_device *pdev)
>  				     "drm panel-bridge add failed\n");
>  
>  	if (fsl_ldb_is_dual(fsl_ldb)) {
> -		struct device_node *port1, *port2;
> +		struct device_node *port1 __free(device_node) =
> +			of_graph_get_port_by_id(dev->of_node, 1);
> +		struct device_node *port2 __free(device_node) =
> +			of_graph_get_port_by_id(dev->of_node, 2);
>  
> -		port1 = of_graph_get_port_by_id(dev->of_node, 1);
> -		port2 = of_graph_get_port_by_id(dev->of_node, 2);
>  		dual_link = drm_of_lvds_get_dual_link_pixel_order(port1, port2);
> -		of_node_put(port1);
> -		of_node_put(port2);
> -
>  		if (dual_link < 0)
>  			return dev_err_probe(dev, dual_link,
>  					     "Error getting dual link configuration\n");

-- 
Regards,

Laurent Pinchart
