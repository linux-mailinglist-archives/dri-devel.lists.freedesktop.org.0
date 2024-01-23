Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41113837CE2
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 02:20:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5BFE10F25F;
	Tue, 23 Jan 2024 01:20:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E88CA10F25F
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 01:20:23 +0000 (UTC)
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi
 [89.27.53.110])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A104BE4;
 Tue, 23 Jan 2024 02:19:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1705972749;
 bh=Xa8ntlXCZZ2MZ8nDZWEk0iLWlpDlzYMH/xMfar8ssuM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nElGEYIT2vat6NGNNA3fzYqaKcaZa3WXJzG+l418uuQdMIpR4a4C6r34gW6iVUfyj
 kO6CJl7yxac9WH5+5ZvRZXroYTFIwUWmckmog1oj3Gv1D+UUF1nvCAt6l0MowjFYL5
 gLAmDywztT8hWN+AGi5TeHubphtPas1mMhzlDynU=
Date: Tue, 23 Jan 2024 03:20:26 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: Re: [PATCH 5/5] drm-bridge: display-connector: Switch to use fwnode
 API
Message-ID: <20240123012026.GC22880@pendragon.ideasonboard.com>
References: <20240122163220.110788-1-sui.jingfeng@linux.dev>
 <20240122163220.110788-6-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240122163220.110788-6-sui.jingfeng@linux.dev>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Sui Jingfeng <suijingfeng@loongson.cn>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 23, 2024 at 12:32:20AM +0800, Sui Jingfeng wrote:
> From: Sui Jingfeng <suijingfeng@loongson.cn>
> 
> Because API has wider coverage, it can be used on non-DT systems as well.
> 
> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> ---
>  drivers/gpu/drm/bridge/display-connector.c | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/display-connector.c b/drivers/gpu/drm/bridge/display-connector.c
> index eb7e194e7735..2c3e54a458e8 100644
> --- a/drivers/gpu/drm/bridge/display-connector.c
> +++ b/drivers/gpu/drm/bridge/display-connector.c
> @@ -243,8 +243,8 @@ static int display_connector_probe(struct platform_device *pdev)
>  	case DRM_MODE_CONNECTOR_DVII: {
>  		bool analog, digital;
>  
> -		analog = of_property_read_bool(pdev->dev.of_node, "analog");
> -		digital = of_property_read_bool(pdev->dev.of_node, "digital");
> +		analog = fwnode_property_present(pdev->dev.fwnode, "analog");
> +		digital = fwnode_property_present(pdev->dev.fwnode, "digital");
>  		if (analog && !digital) {
>  			conn->bridge.type = DRM_MODE_CONNECTOR_DVIA;
>  		} else if (!analog && digital) {
> @@ -261,8 +261,8 @@ static int display_connector_probe(struct platform_device *pdev)
>  	case DRM_MODE_CONNECTOR_HDMIA: {
>  		const char *hdmi_type;
>  
> -		ret = of_property_read_string(pdev->dev.of_node, "type",
> -					      &hdmi_type);
> +		ret = fwnode_property_read_string(pdev->dev.fwnode, "type",
> +						  &hdmi_type);
>  		if (ret < 0) {
>  			dev_err(&pdev->dev, "HDMI connector with no type\n");
>  			return -EINVAL;
> @@ -292,7 +292,7 @@ static int display_connector_probe(struct platform_device *pdev)
>  	conn->bridge.interlace_allowed = true;
>  
>  	/* Get the optional connector label. */
> -	of_property_read_string(pdev->dev.of_node, "label", &label);
> +	fwnode_property_read_string(pdev->dev.fwnode, "label", &label);
>  
>  	/*
>  	 * Get the HPD GPIO for DVI, HDMI and DP connectors. If the GPIO can provide
> @@ -330,12 +330,13 @@ static int display_connector_probe(struct platform_device *pdev)
>  	if (type == DRM_MODE_CONNECTOR_DVII ||
>  	    type == DRM_MODE_CONNECTOR_HDMIA ||
>  	    type == DRM_MODE_CONNECTOR_VGA) {
> -		struct device_node *phandle;
> +		struct fwnode_handle *fwnode;
>  
> -		phandle = of_parse_phandle(pdev->dev.of_node, "ddc-i2c-bus", 0);
> -		if (phandle) {
> -			conn->bridge.ddc = of_get_i2c_adapter_by_node(phandle);
> -			of_node_put(phandle);
> +		fwnode = fwnode_find_reference(pdev->dev.fwnode, "ddc-i2c-bus", 0);
> +		if (!IS_ERR_OR_NULL(fwnode)) {
> +			dev_info(&pdev->dev, "has I2C bus property\n");

This looks like a debugging leftover.

> +			conn->bridge.ddc = i2c_get_adapter_by_fwnode(fwnode);
> +			fwnode_handle_put(fwnode);
>  			if (!conn->bridge.ddc)
>  				return -EPROBE_DEFER;
>  		} else {
> @@ -380,6 +381,7 @@ static int display_connector_probe(struct platform_device *pdev)
>  
>  	conn->bridge.funcs = &display_connector_bridge_funcs;
>  	conn->bridge.of_node = pdev->dev.of_node;
> +	conn->bridge.fwnode = pdev->dev.fwnode;

This goes in the right direction. Let's address the other drivers and
drop the OF-based calls in the same series :-)

>  
>  	if (conn->bridge.ddc)
>  		conn->bridge.ops |= DRM_BRIDGE_OP_EDID

-- 
Regards,

Laurent Pinchart
