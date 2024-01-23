Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74513837CC9
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 02:17:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D76410E0C3;
	Tue, 23 Jan 2024 01:17:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9A2B10E0C3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 01:17:12 +0000 (UTC)
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi
 [89.27.53.110])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0185D1574;
 Tue, 23 Jan 2024 02:15:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1705972554;
 bh=22dELSQHTcOkyOJDCSy4w/O6DClPqBTUGM3zbVdN6Pk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DHEyNI9MQcgQqsDstVKdkIn0e4tjkwezLEPzlaGFvGfrx6lFCnCgQ1kCrAmw+nvUJ
 2tUl5mfEMZWrVXMX5B/EU0uG/LOt98szZnc88Hz6z1u8SOtnSGofbw0muQiTbowv5j
 8/Zwci8dRWlgTQM/wEE3wYnPW87uv8zYCvKTxMVo=
Date: Tue, 23 Jan 2024 03:17:10 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: Re: [PATCH 1/5] drm/bridge: Add drm_bridge_find_by_fwnode() helper
Message-ID: <20240123011710.GA22880@pendragon.ideasonboard.com>
References: <20240122163220.110788-1-sui.jingfeng@linux.dev>
 <20240122163220.110788-2-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240122163220.110788-2-sui.jingfeng@linux.dev>
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
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sui,

Thank you for the patch.

On Tue, Jan 23, 2024 at 12:32:16AM +0800, Sui Jingfeng wrote:
> Because ACPI based systems only has the fwnode associated, the of_node
> member of struct device is NULL. To order to move things forward, we add
> drm_bridge_find_by_fwnode() to extend the support.
> 
> Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>

Could we switch completely to fwnode, instead of maintaining the fwnode
and OF options side-by-side ?

> ---
>  drivers/gpu/drm/drm_bridge.c | 33 +++++++++++++++++++++++++++++++++
>  include/drm/drm_bridge.h     |  4 ++++
>  2 files changed, 37 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index cee3188adf3d..ffd969adc2fb 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -1347,6 +1347,39 @@ struct drm_bridge *of_drm_find_bridge(struct device_node *np)
>  EXPORT_SYMBOL(of_drm_find_bridge);
>  #endif
>  
> +/**
> + * drm_bridge_find_by_fwnode - Find the bridge corresponding to the associated fwnode
> + *
> + * @fwnode: fwnode for which to find the matching drm_bridge
> + *
> + * This function looks up a drm_bridge based on its associated fwnode.
> + *
> + * RETURNS:
> + * A reference to the drm_bridge control structure if found, NULL on failure.
> + */
> +struct drm_bridge *drm_bridge_find_by_fwnode(struct fwnode_handle *fwnode)
> +{
> +	struct drm_bridge *ret = NULL;
> +	struct drm_bridge *bridge;
> +
> +	if (!fwnode)
> +		return NULL;
> +
> +	mutex_lock(&bridge_lock);
> +
> +	list_for_each_entry(bridge, &bridge_list, list) {
> +		if (bridge->fwnode == fwnode) {
> +			ret = bridge;
> +			break;
> +		}
> +	}
> +
> +	mutex_unlock(&bridge_lock);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(drm_bridge_find_by_fwnode);
> +
>  MODULE_AUTHOR("Ajay Kumar <ajaykumar.rs@samsung.com>");
>  MODULE_DESCRIPTION("DRM bridge infrastructure");
>  MODULE_LICENSE("GPL and additional rights");
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index e39da5807ba7..fe3d5f4bf37f 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -720,6 +720,8 @@ struct drm_bridge {
>  	struct list_head chain_node;
>  	/** @of_node: device node pointer to the bridge */
>  	struct device_node *of_node;
> +	/** @fwnode: associated fwnode supplied by platform firmware */
> +	struct fwnode_handle *fwnode;
>  	/** @list: to keep track of all added bridges */
>  	struct list_head list;
>  	/**
> @@ -796,6 +798,8 @@ static inline struct drm_bridge *of_drm_find_bridge(struct device_node *np)
>  }
>  #endif
>  
> +struct drm_bridge *drm_bridge_find_by_fwnode(struct fwnode_handle *fwnode);
> +
>  /**
>   * drm_bridge_get_next_bridge() - Get the next bridge in the chain
>   * @bridge: bridge object

-- 
Regards,

Laurent Pinchart
