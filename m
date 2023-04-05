Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EA86D72B6
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 05:28:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A54B910E1AA;
	Wed,  5 Apr 2023 03:28:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 195FF10E1AA
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 03:28:22 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 71B2084D0F;
 Wed,  5 Apr 2023 05:28:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1680665298;
 bh=bKaTZMpFYkkLbnTYZecYxf3MB9y5kfCDupMMfLfXpec=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=SRSFRYw+B7BCKAMQGuNszmJfxCKUw8xpESwBLDobDLGggNqSijncjsjAC84Crjpgo
 w8rtVnifU14r/xmjMfM2b8lcJGzXhfkWI3uZbC7CADQ1fKig5u7dWDL70+aXz/63pE
 4548q2niUkmSsy+Y7LoFYz35mAhwc7dzPIoo2WhIaqTz+XrTGQhq5QDhuQdEh0Kh2a
 +T2/4kFpQAD+ogPw6cxm2HXr/ukyd8Nw4FUIdVxcWhkhUTFgyD78M4axcmBLYOXsV7
 Hajdoqo39t8uzXr7UYrXKbrLl5weRrKvp3ykTGEQYPOYLRxAwnkwdG5hZRm0l9IA+m
 LUSSOWPTe4f4g==
Message-ID: <5b514970-cfc8-41de-7ae6-f608f5187860@denx.de>
Date: Wed, 5 Apr 2023 05:28:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] drm: bridge: ldb: add support for using channel 1 only
Content-Language: en-US
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, dri-devel@lists.freedesktop.org
References: <20230404073720.1465552-1-luca.ceresoli@bootlin.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20230404073720.1465552-1-luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
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
 Jonas Karlman <jonas@kwiboo.se>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/4/23 09:37, Luca Ceresoli wrote:

[...]

> @@ -177,28 +183,25 @@ static void fsl_ldb_atomic_enable(struct drm_bridge *bridge,
>   	clk_prepare_enable(fsl_ldb->clk);
>   
>   	/* Program LDB_CTRL */
> -	reg = LDB_CTRL_CH0_ENABLE;
> -
> -	if (fsl_ldb->lvds_dual_link)
> -		reg |= LDB_CTRL_CH1_ENABLE | LDB_CTRL_SPLIT_MODE;
> -
> -	if (lvds_format_24bpp) {
> -		reg |= LDB_CTRL_CH0_DATA_WIDTH;
> -		if (fsl_ldb->lvds_dual_link)
> -			reg |= LDB_CTRL_CH1_DATA_WIDTH;
> -	}
> -
> -	if (lvds_format_jeida) {
> -		reg |= LDB_CTRL_CH0_BIT_MAPPING;
> -		if (fsl_ldb->lvds_dual_link)
> -			reg |= LDB_CTRL_CH1_BIT_MAPPING;
> -	}
> -
> -	if (mode->flags & DRM_MODE_FLAG_PVSYNC) {
> -		reg |= LDB_CTRL_DI0_VSYNC_POLARITY;
> -		if (fsl_ldb->lvds_dual_link)
> -			reg |= LDB_CTRL_DI1_VSYNC_POLARITY;
> -	}
> +	reg =

Cosmetic nit, do we need the newline here , can't we just move the first 
'(fsl_ldb->ch0_enabled ? LDB_CTRL_CH0_ENABLE : 0) |' on the same line as 
'reg =' ? It might need a bit of indent with spaces, but that should be OK.

> +		(fsl_ldb->ch0_enabled ? LDB_CTRL_CH0_ENABLE : 0) |
> +		(fsl_ldb->ch1_enabled ? LDB_CTRL_CH1_ENABLE : 0) |
> +		(fsl_ldb_is_dual(fsl_ldb) ? LDB_CTRL_SPLIT_MODE : 0);
> +
> +	if (lvds_format_24bpp)
> +		reg |=
> +			(fsl_ldb->ch0_enabled ? LDB_CTRL_CH0_DATA_WIDTH : 0) |
> +			(fsl_ldb->ch1_enabled ? LDB_CTRL_CH1_DATA_WIDTH : 0);
> +
> +	if (lvds_format_jeida)
> +		reg |=
> +			(fsl_ldb->ch0_enabled ? LDB_CTRL_CH0_BIT_MAPPING : 0) |
> +			(fsl_ldb->ch1_enabled ? LDB_CTRL_CH1_BIT_MAPPING : 0);
> +
> +	if (mode->flags & DRM_MODE_FLAG_PVSYNC)
> +		reg |=
> +			(fsl_ldb->ch0_enabled ? LDB_CTRL_DI0_VSYNC_POLARITY : 0) |
> +			(fsl_ldb->ch1_enabled ? LDB_CTRL_DI1_VSYNC_POLARITY : 0);
>   
>   	regmap_write(fsl_ldb->regmap, fsl_ldb->devdata->ldb_ctrl, reg);

[...]

> @@ -311,10 +314,23 @@ static int fsl_ldb_probe(struct platform_device *pdev)
>   	if (IS_ERR(fsl_ldb->regmap))
>   		return PTR_ERR(fsl_ldb->regmap);
>   
> -	/* Locate the panel DT node. */
> -	panel_node = of_graph_get_remote_node(dev->of_node, 1, 0);
> -	if (!panel_node)
> -		return -ENXIO;
> +	/* Locate the remote ports and the panel node */
> +	remote1 = of_graph_get_remote_node(dev->of_node, 1, 0);
> +	remote2 = of_graph_get_remote_node(dev->of_node, 2, 0);
> +	fsl_ldb->ch0_enabled = (remote1 != NULL);
> +	fsl_ldb->ch1_enabled = (remote2 != NULL);
> +	panel_node = of_node_get(remote1 ? remote1 : remote2);

You can even do this without the middle 'remote1' I think:

panel_node = of_node_get(remote1 ? : remote2);

> +	of_node_put(remote1);
> +	of_node_put(remote2);
> +
> +	if (!fsl_ldb->ch0_enabled && !fsl_ldb->ch1_enabled) {
> +		of_node_put(panel_node);
> +		return dev_err_probe(dev, -ENXIO, "No panel node found");
> +	}
> +
> +	dev_dbg(dev, "Using %s\n",
> +		fsl_ldb_is_dual(fsl_ldb) ? "dual mode" :

I think this is called "dual-link mode" , maybe update the string .

> +		fsl_ldb->ch0_enabled ? "channel 0" : "channel 1");
>   
>   	panel = of_drm_find_panel(panel_node);
>   	of_node_put(panel_node);
> @@ -325,20 +341,26 @@ static int fsl_ldb_probe(struct platform_device *pdev)
>   	if (IS_ERR(fsl_ldb->panel_bridge))
>   		return PTR_ERR(fsl_ldb->panel_bridge);
>   
> -	/* Determine whether this is dual-link configuration */
> -	port1 = of_graph_get_port_by_id(dev->of_node, 1);
> -	port2 = of_graph_get_port_by_id(dev->of_node, 2);
> -	dual_link = drm_of_lvds_get_dual_link_pixel_order(port1, port2);
> -	of_node_put(port1);
> -	of_node_put(port2);
>   
> -	if (dual_link == DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS) {
> -		dev_err(dev, "LVDS channel pixel swap not supported.\n");
> -		return -EINVAL;
> -	}
> +	if (fsl_ldb_is_dual(fsl_ldb)) {
> +		struct device_node *port1, *port2;
> +
> +		port1 = of_graph_get_port_by_id(dev->of_node, 1);
> +		port2 = of_graph_get_port_by_id(dev->of_node, 2);
> +		dual_link = drm_of_lvds_get_dual_link_pixel_order(port1, port2);
> +		of_node_put(port1);
> +		of_node_put(port2);
>   
> -	if (dual_link == DRM_LVDS_DUAL_LINK_ODD_EVEN_PIXELS)
> -		fsl_ldb->lvds_dual_link = true;
> +		if (dual_link < 0)
> +			return dev_err_probe(dev, dual_link,
> +					     "Error getting dual link configuration");

Does this need a trailing '\n' in the formatting string or not ? I think 
yes.

The rest looks good, with the few details fixed:

Reviewed-by: Marek Vasut <marex@denx.de>
