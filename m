Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A81E665C79F
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 20:39:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17AB210E035;
	Tue,  3 Jan 2023 19:39:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod2-cph3.one.com
 (mailrelay3-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:402::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D673F10E035
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jan 2023 19:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=OZHsxszE0Di6P4bQaZT8j5f4I8CSfN4qm7AkNZNCBEQ=;
 b=JyYhKq5lK/Elag6ChHk/d+ILSz1NAqqgPmqZlLzl5+ChaG1mYDZ3y/RrCXaeeZtXOZdVe7K1A6/AX
 RLmICT7mHYRdoE0+/WdLbfSXq2CzJECC4tKuJF4bf2Wb6FmJb5Hi2he3umxlIdkaHmdirQ/95W2I1J
 f6ByhdN0rdlEC0/r5zADxwsSoSDrxhd+WkoUharVnp4fPa7XO4KM4vq4tc0v5tKF+AvBt2r9W2TQhw
 rS5TGav3T7kglyqjRUhvmZSnO3xP2BBhSVmMDNSO0KcqJfh+AOvMjbcMsUMoOC+Rrd9cPBe7CqdXtT
 s0tsW2QjdOqdrQ+kB2/IrJFnfWwIFMA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=OZHsxszE0Di6P4bQaZT8j5f4I8CSfN4qm7AkNZNCBEQ=;
 b=/HywVFknhn/PW4+f44wQBtI1ObcaVmSZZZKdmhuo2TwuwhBsPcJdneDdtjVEoA43VDukAL11eal2P
 Cj9GTMvAg==
X-HalOne-ID: 406d26d9-8b9e-11ed-85ad-ede074c87fad
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay3 (Halon) with ESMTPSA
 id 406d26d9-8b9e-11ed-85ad-ede074c87fad;
 Tue, 03 Jan 2023 19:38:54 +0000 (UTC)
Date: Tue, 3 Jan 2023 20:38:52 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Chris Morgan <macroalpha82@gmail.com>
Subject: Re: [PATCH V7 1/4] drm: of: Add drm_of_get_dsi_bus helper function
Message-ID: <Y7SETNoCGq7TUXrp@ravnborg.org>
References: <20230103190707.104595-1-macroalpha82@gmail.com>
 <20230103190707.104595-2-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230103190707.104595-2-macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, Chris Morgan <macromorgan@hotmail.com>,
 krzysztof.kozlowski+dt@linaro.org, linux-rockchip@lists.infradead.org,
 robh+dt@kernel.org, thierry.reding@gmail.com, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, maccraft123mc@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Chris.

On Tue, Jan 03, 2023 at 01:07:04PM -0600, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add helper function to find DSI host for devices where DSI panel is not
> a minor of a DSI bus (such as the Samsung AMS495QA01 panel or the
> official Raspberry Pi touchscreen display).
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpu/drm/drm_of.c | 62 ++++++++++++++++++++++++++++++++++++++++
>  include/drm/drm_of.h     | 11 +++++++
>  2 files changed, 73 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
> index 7bbcb999bb75..7d89ac164069 100644
> --- a/drivers/gpu/drm/drm_of.c
> +++ b/drivers/gpu/drm/drm_of.c
> @@ -10,6 +10,7 @@
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_device.h>
>  #include <drm/drm_encoder.h>
> +#include <drm/drm_mipi_dsi.h>
>  #include <drm/drm_of.h>
>  #include <drm/drm_panel.h>
>  
> @@ -493,3 +494,64 @@ int drm_of_get_data_lanes_count_ep(const struct device_node *port,
>  	return ret;
>  }
>  EXPORT_SYMBOL_GPL(drm_of_get_data_lanes_count_ep);
> +
> +/**
> + * drm_of_get_dsi_bus - find the DSI bus for a given device
> + * @dev: parent device of display (SPI, I2C)
> + * @dsi_host: DSI host to be populated
> + * @info: DSI device info to be updated with correct DSI node
> + *
> + * Given a panel device parented to a non-DSI device, follow the
> + * devicetree to find the correct DSI host node and populate the
> + * dsi_host with the correct host and info with the correct node.

I think you need and empty line before Returns ...
This is what others does in the same file, so for consistency please add
it.

With this detail fixed:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

> + * Returns zero if successful, -EPROBE_DEFER if the DSI host is
> + * found but not available, or -ENODEV otherwise.
> + */
> +int drm_of_get_dsi_bus(struct device *dev,
> +			      struct mipi_dsi_host **dsi_host,
> +			      struct mipi_dsi_device_info *info)
> +{
> +	struct device_node *endpoint, *dsi_host_node;
> +
> +	/*
> +	 * Get first endpoint child from device.
> +	 */
> +	endpoint = of_graph_get_next_endpoint(dev->of_node, NULL);
> +	if (!endpoint)
> +		return -ENODEV;
> +
> +	/*
> +	 * Follow the first endpoint to get the DSI host node.
> +	 */
> +	dsi_host_node = of_graph_get_remote_port_parent(endpoint);
> +	if (!dsi_host_node)
> +		goto error;
> +
> +	/*
> +	 * Get the DSI host from the DSI host node. If we get an error
> +	 * or the return is null assume we're not ready to probe just
> +	 * yet. Release the DSI host node since we're done with it.
> +	 */
> +	*dsi_host = of_find_mipi_dsi_host_by_node(dsi_host_node);
> +	of_node_put(dsi_host_node);
> +	if (IS_ERR_OR_NULL(*dsi_host)) {
> +		of_node_put(endpoint);
> +		return -EPROBE_DEFER;
> +	}
> +
> +	/*
> +	 * Set the node of the mipi_dsi_device_info to the correct node
> +	 * and then release the endpoint node since we're done with it.
> +	 */
> +	info->node = of_graph_get_remote_port(endpoint);
> +	if (IS_ERR_OR_NULL(info->node))
> +		goto error;
> +
> +	of_node_put(endpoint);
> +	return 0;
> +
> +error:
> +	of_node_put(endpoint);
> +	return -ENODEV;
> +}
> +EXPORT_SYMBOL_GPL(drm_of_get_dsi_bus);
> diff --git a/include/drm/drm_of.h b/include/drm/drm_of.h
> index 10ab58c40746..e27061b02315 100644
> --- a/include/drm/drm_of.h
> +++ b/include/drm/drm_of.h
> @@ -15,6 +15,8 @@ struct drm_encoder;
>  struct drm_panel;
>  struct drm_bridge;
>  struct device_node;
> +struct mipi_dsi_device_info;
> +struct mipi_dsi_host;
>  
>  /**
>   * enum drm_lvds_dual_link_pixels - Pixel order of an LVDS dual-link connection
> @@ -56,6 +58,9 @@ int drm_of_get_data_lanes_count_ep(const struct device_node *port,
>  				   int port_reg, int reg,
>  				   const unsigned int min,
>  				   const unsigned int max);
> +int drm_of_get_dsi_bus(struct device *dev,
> +		       struct mipi_dsi_host **dsi_host,
> +		       struct mipi_dsi_device_info *info);
>  #else
>  static inline uint32_t drm_of_crtc_port_mask(struct drm_device *dev,
>  					  struct device_node *port)
> @@ -127,6 +132,12 @@ drm_of_get_data_lanes_count_ep(const struct device_node *port,
>  {
>  	return -EINVAL;
>  }
> +static int drm_of_get_dsi_bus(struct device *dev,
> +			      struct mipi_dsi_host **dsi_host,
> +			      struct mipi_dsi_device_info *info)
> +{
> +	return -EINVAL;
> +}
>  #endif
>  
>  /*
> -- 
> 2.34.1
