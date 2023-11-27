Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F9B7FA125
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 14:36:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD9C210E023;
	Mon, 27 Nov 2023 13:36:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B5AC10E023
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 13:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701092176; x=1732628176;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=5Qao0lQmJBBg9XCG1scfystufVdrrOGqO8bhlKqTeYA=;
 b=Vjh+F2BsDLfS0kMIyC/2zC7Htfv/xRHTC0Vzo2CrgRNdhd9gztfQP20a
 8XILUDSKmZuFlB12C++Qw9rLlFZFBpmb/l7LOV+an8kHZnjzYLo0lV4oc
 aXTz7PsOUZdpMwcllzBZLTXY6tjyTa25y0lu6Z6EfTEbVptJ28Asw2Q38
 M0+1jj+bjwxJHEKwe7J2ElvCNG3UM0omyzAo71NVCwoZ2XpAkROnk+Wfl
 Lv3FJlx8IHQqnFJ0dCI266g58fBXsopKHow6BVoF/TSUTsIr71YegDdm8
 dAGrsosaOef3U2jDayddggsbr6e8SVIjZqnD53Q/8QfAOHznGGvIX4LZk w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="391578810"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; d="scan'208";a="391578810"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 05:35:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="761601320"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; d="scan'208";a="761601320"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga007.jf.intel.com with SMTP; 27 Nov 2023 05:35:39 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 27 Nov 2023 15:35:38 +0200
Date: Mon, 27 Nov 2023 15:35:38 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH] drm/bridge: panel: Check device dependency before
 managing device link
Message-ID: <ZWSbKkgs8V4sdy8T@intel.com>
References: <20231123032615.3760488-1-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231123032615.3760488-1-victor.liu@nxp.com>
X-Patchwork-Hint: comment
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
Cc: neil.armstrong@linaro.org, ulf.hansson@linaro.org, jernej.skrabec@gmail.com,
 rfoss@kernel.org, andrzej.hajda@intel.com, jonas@kwiboo.se,
 linux-kernel@vger.kernel.org, mripard@kernel.org,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 angelogioacchino.delregno@collabora.com, Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 23, 2023 at 11:26:15AM +0800, Liu Ying wrote:
> Some panel devices already depend on DRM device, like the panel in
> arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts, because DRM device is
> the ancestor of those panel devices.  device_link_add() would fail by
> returning a NULL pointer for those panel devices because of the existing
> dependency.  So, check the dependency by calling device_is_dependent()
> before adding or deleting device link between panel device and DRM device
> so that the link is managed only for independent panel devices.
> 
> Fixes: 887878014534 ("drm/bridge: panel: Fix device link for DRM_BRIDGE_ATTACH_NO_CONNECTOR")
> Fixes: 199cf07ebd2b ("drm/bridge: panel: Add a device link between drm device and panel device")
> Reported-by: Linus Walleij <linus.walleij@linaro.org>
> Closes: https://lore.kernel.org/lkml/CACRpkdaGzXD6HbiX7mVUNJAJtMEPG00Pp6+nJ1P0JrfJ-ArMvQ@mail.gmail.com/T/
> Tested-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
>  drivers/gpu/drm/bridge/panel.c | 27 ++++++++++++++++++---------
>  1 file changed, 18 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
> index e48823a4f1ed..5e8980023407 100644
> --- a/drivers/gpu/drm/bridge/panel.c
> +++ b/drivers/gpu/drm/bridge/panel.c
> @@ -23,6 +23,7 @@ struct panel_bridge {
>  	struct drm_panel *panel;
>  	struct device_link *link;
>  	u32 connector_type;
> +	bool is_independent;
>  };
>  
>  static inline struct panel_bridge *
> @@ -67,12 +68,17 @@ static int panel_bridge_attach(struct drm_bridge *bridge,
>  	struct drm_device *drm_dev = bridge->dev;
>  	int ret;
>  
> -	panel_bridge->link = device_link_add(drm_dev->dev, panel->dev,
> -					     DL_FLAG_STATELESS);
> -	if (!panel_bridge->link) {
> -		DRM_ERROR("Failed to add device link between %s and %s\n",
> -			  dev_name(drm_dev->dev), dev_name(panel->dev));
> -		return -EINVAL;
> +	panel_bridge->is_independent = !device_is_dependent(drm_dev->dev,
> +							    panel->dev);

This broke the build. Looks like device_is_dependent() is not even exported.
ERROR: modpost: "device_is_dependent" [drivers/gpu/drm/drm_kms_helper.ko] undefined!

The recommended defconfigs in rerere-cache do seem to have CONFIG_DRM_KMS_HELPER=m
so this should have been caught before pushing. How did it slip through?

> +
> +	if (panel_bridge->is_independent) {
> +		panel_bridge->link = device_link_add(drm_dev->dev, panel->dev,
> +						     DL_FLAG_STATELESS);
> +		if (!panel_bridge->link) {
> +			DRM_ERROR("Failed to add device link between %s and %s\n",
> +				  dev_name(drm_dev->dev), dev_name(panel->dev));
> +			return -EINVAL;
> +		}
>  	}
>  
>  	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
> @@ -80,7 +86,8 @@ static int panel_bridge_attach(struct drm_bridge *bridge,
>  
>  	if (!bridge->encoder) {
>  		DRM_ERROR("Missing encoder\n");
> -		device_link_del(panel_bridge->link);
> +		if (panel_bridge->is_independent)
> +			device_link_del(panel_bridge->link);
>  		return -ENODEV;
>  	}
>  
> @@ -92,7 +99,8 @@ static int panel_bridge_attach(struct drm_bridge *bridge,
>  				 panel_bridge->connector_type);
>  	if (ret) {
>  		DRM_ERROR("Failed to initialize connector\n");
> -		device_link_del(panel_bridge->link);
> +		if (panel_bridge->is_independent)
> +			device_link_del(panel_bridge->link);
>  		return ret;
>  	}
>  
> @@ -115,7 +123,8 @@ static void panel_bridge_detach(struct drm_bridge *bridge)
>  	struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
>  	struct drm_connector *connector = &panel_bridge->connector;
>  
> -	device_link_del(panel_bridge->link);
> +	if (panel_bridge->is_independent)
> +		device_link_del(panel_bridge->link);
>  
>  	/*
>  	 * Cleanup the connector if we know it was initialized.
> -- 
> 2.37.1

-- 
Ville Syrjälä
Intel
