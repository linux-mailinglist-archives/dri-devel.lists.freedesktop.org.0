Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B1E510BA4
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 00:00:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5759910E009;
	Tue, 26 Apr 2022 22:00:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B155410E009;
 Tue, 26 Apr 2022 22:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651010440; x=1682546440;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ScrRxN06v+ytehdO+4wJo7o+MabcMdXMEmKmKdfbUg4=;
 b=HzPGFE+iAvQ8//YqYaQ5ogxW2BABWqhCxU5JpWgJv/nmBy2F9lQ5IX/7
 AOLhy1S01eOS+KMd1PfMNln733/jT6sO3ij4FET3bqYnWyUCdrh8fmTPI
 6zbe4WejVcyDGvMzGhjVC1L0urbwTvYL/2CpGV7CbAtRc4iqA/qDPZBUu
 bRwhp3K9X250zCK9GcC//M7OtyhQvE7Fsuz2suA74YA18ZmcXfC2raI0U
 BX66zvUAxewEm5xxT73QvzQz3nw2Pq9s2bNnBjO/PeeDC4vbcA2EZ4BpA
 bcTdiq85B+ITKZaHxoEWuyfcGEvVL/bKR3IxdojuqiDW3b9CVcKNfRWgT A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="265895845"
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; d="scan'208";a="265895845"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 15:00:39 -0700
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; d="scan'208";a="513368790"
Received: from mdnavare-mobl1.jf.intel.com ([10.165.21.211])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 15:00:39 -0700
Date: Tue, 26 Apr 2022 15:01:07 -0700
From: "Navare, Manasi" <manasi.d.navare@intel.com>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: Re: [RFC v2 1/2] drm/vrr: Attach vrr_enabled property to the drm crtc
Message-ID: <20220426220107.GB269266@mdnavare-mobl1.jf.intel.com>
References: <20220425064612.2993587-1-bhanuprakash.modem@intel.com>
 <20220425064612.2993587-2-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220425064612.2993587-2-bhanuprakash.modem@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 25, 2022 at 12:16:11PM +0530, Bhanuprakash Modem wrote:
> Modern display hardware is capable of supporting variable refresh rates.
> This patch introduces helpers to attach and set "vrr_enabled" property
> on the crtc to allow userspace to query VRR enabled status on that crtc.
> 
> Atomic drivers should attach this property to crtcs those are capable of
> driving variable refresh rates using
> drm_mode_crtc_attach_vrr_enabled_property().
> 
> The value should be updated based on driver and hardware capability
> by using drm_mode_crtc_set_vrr_enabled_property().
> 
> V2: Use property flag as atomic

We already have userspace making us of the CRTC vrr_enabled property to
enable VRR for the CRTC like in case of full screen gaming.

This can already be done through:
drm_atomic_crtc_set_property call. Why do we need additonal helpers
for setting the same per CRTC property?

This is a default CRTC property so it will be created annd attached for
CRTC as per the DRM doc:
"VRR_ENABLED":
 *      Default &drm_crtc boolean property that notifies the driver that the
 *      content on the CRTC is suitable for variable refresh rate presentation.
 *      The driver will take this property as a hint to enable variable
 *      refresh rate support if the receiver supports it, ie. if the
 *      "vrr_capable" property is true on the &drm_connector object. The
 *      vertical front porch duration will be extended until page-flip or
 *      timeout when enabled.

Then we can use the atomic_crtc_set/get_property helpers to set it
Am I missing some other use case here?

Manasi

> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> Cc: Manasi Navare <manasi.d.navare@intel.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  drivers/gpu/drm/drm_crtc.c        | 44 +++++++++++++++++++++++++++++++
>  drivers/gpu/drm/drm_mode_config.c |  2 +-
>  include/drm/drm_crtc.h            |  4 +++
>  3 files changed, 49 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
> index 26a77a735905..95b4a0c7ecb3 100644
> --- a/drivers/gpu/drm/drm_crtc.c
> +++ b/drivers/gpu/drm/drm_crtc.c
> @@ -883,3 +883,47 @@ int drm_crtc_create_scaling_filter_property(struct drm_crtc *crtc,
>  	return 0;
>  }
>  EXPORT_SYMBOL(drm_crtc_create_scaling_filter_property);
> +
> +/**
> + * drm_mode_crtc_attach_vrr_enabled_property - attaches the vrr_enabled property
> + * @crtc: drm CRTC to attach the vrr_enabled property on.
> + *
> + * This is used by atomic drivers to add support for querying
> + * VRR enabled status for a crtc.
> + */
> +void drm_mode_crtc_attach_vrr_enabled_property(struct drm_crtc *crtc)
> +{
> +	struct drm_device *dev = crtc->dev;
> +	struct drm_mode_config *config = &dev->mode_config;
> +
> +	if (!config->prop_vrr_enabled)
> +		return;
> +
> +	drm_object_attach_property(&crtc->base,
> +				   config->prop_vrr_enabled,
> +				   0);
> +}
> +EXPORT_SYMBOL(drm_mode_crtc_attach_vrr_enabled_property);
> +
> +/**
> + * drm_mode_crtc_set_vrr_enabled_property - sets the vrr enabled property for
> + * a crtc.
> + * @crtc: drm CRTC
> + * @vrr_enabled: True to enable the VRR on CRTC
> + *
> + * Should be used by atomic drivers to update the VRR enabled status on a CRTC
> + */
> +void drm_mode_crtc_set_vrr_enabled_property(struct drm_crtc *crtc,
> +					    bool vrr_enabled)
> +{
> +	struct drm_device *dev = crtc->dev;
> +	struct drm_mode_config *config = &dev->mode_config;
> +
> +	if (!config->prop_vrr_enabled)
> +		return;
> +
> +	drm_object_property_set_value(&crtc->base,
> +				      config->prop_vrr_enabled,
> +				      vrr_enabled);
> +}
> +EXPORT_SYMBOL(drm_mode_crtc_set_vrr_enabled_property);
> diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
> index 37b4b9f0e468..b7cde73d5586 100644
> --- a/drivers/gpu/drm/drm_mode_config.c
> +++ b/drivers/gpu/drm/drm_mode_config.c
> @@ -323,7 +323,7 @@ static int drm_mode_create_standard_properties(struct drm_device *dev)
>  		return -ENOMEM;
>  	dev->mode_config.prop_mode_id = prop;
>  
> -	prop = drm_property_create_bool(dev, 0,
> +	prop = drm_property_create_bool(dev, DRM_MODE_PROP_ATOMIC,
>  			"VRR_ENABLED");
>  	if (!prop)
>  		return -ENOMEM;
> diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
> index a70baea0636c..bde657cb0f9e 100644
> --- a/include/drm/drm_crtc.h
> +++ b/include/drm/drm_crtc.h
> @@ -1333,4 +1333,8 @@ static inline struct drm_crtc *drm_crtc_find(struct drm_device *dev,
>  int drm_crtc_create_scaling_filter_property(struct drm_crtc *crtc,
>  					    unsigned int supported_filters);
>  
> +void drm_mode_crtc_attach_vrr_enabled_property(struct drm_crtc *crtc);
> +void drm_mode_crtc_set_vrr_enabled_property(struct drm_crtc *crtc,
> +					    bool vrr_enabled);
> +
>  #endif /* __DRM_CRTC_H__ */
> -- 
> 2.35.1
> 
