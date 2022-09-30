Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FDF5F0CCA
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 15:53:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9E1210ED07;
	Fri, 30 Sep 2022 13:53:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 572AD10ED02;
 Fri, 30 Sep 2022 13:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664545996; x=1696081996;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=lXfkj1kHU738ZcXH32MTNyRpTqwZ/hPUXM0dcBrWFdY=;
 b=T4L9aq6LG3vJ24ZhQzqiWlrzgK+EnbjusJdkhk9A+J46e86SjC2h+y4u
 WbNscUbEwT9evKcc6rKfNBVN2Sw1esW8+YHT0YUXR4a9LO0XAF1CT20Dd
 kPn0K5lh19KLnxYXDA4O06lK7MO7DpCj/oIdX3IiIx91YXxGiylASYLQa
 XV6tHha87a53/MdgmAJtx1d6hdVwXc8ySDBBTtGHfgDeeG8sLspi2lqt2
 hnFSch37zxUIhsMYMJFgCPkAV5IL5OQPSza3FKa/ETFAjslYRYV/VzuKd
 65h6IGbOou6P5r9dyJv8VWJYexujCl65lh1kNkZ9y017QjUKY927RMaWN g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10486"; a="303679676"
X-IronPort-AV: E=Sophos;i="5.93,358,1654585200"; d="scan'208";a="303679676"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2022 06:53:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10486"; a="655961414"
X-IronPort-AV: E=Sophos;i="5.93,358,1654585200"; d="scan'208";a="655961414"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by orsmga001.jf.intel.com with SMTP; 30 Sep 2022 06:53:11 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 30 Sep 2022 16:53:10 +0300
Date: Fri, 30 Sep 2022 16:53:10 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v3 3/6] drm: introduce
 drm_mode_config.atomic_async_page_flip_not_supported
Message-ID: <Yzb0xhcvwnWg4iY6@intel.com>
References: <20220929184307.258331-1-contact@emersion.fr>
 <20220929184307.258331-4-contact@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220929184307.258331-4-contact@emersion.fr>
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
Cc: andrealmeid@igalia.com, daniel.vetter@ffwll.ch,
 amd-gfx@lists.freedesktop.org, wayland-devel@lists.freedesktop.org,
 mwen@igalia.com, dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 hwentlan@amd.com, nicholas.kazlauskas@amd.com, joshua@froggi.es
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 29, 2022 at 06:43:42PM +0000, Simon Ser wrote:
> This new field indicates whether the driver has the necessary logic
> to support async page-flips via the atomic uAPI. This is leveraged by
> the next commit to allow user-space to use this functionality.
> 
> All atomic drivers setting drm_mode_config.async_page_flip are updated
> to also set drm_mode_config.atomic_async_page_flip_not_supported. We
> will gradually check and update these drivers to properly handle
> drm_crtc_state.async_flip in their atomic logic.
> 
> The goal of this negative flag is the same as
> fb_modifiers_not_supported: we want to eventually get rid of all
> drivers missing atomic support for async flips. New drivers should not
> set this flag, instead they should support atomic async flips (if
> they support async flips at all). IOW, we don't want more drivers
> with async flip support for legacy but not atomic.
> 
> v2: only set the flag on atomic drivers (remove it on amdgpu DCE and
> on radeon)
> 
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Reviewed-by: André Almeida <andrealmeid@igalia.com>
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Joshua Ashton <joshua@froggi.es>
> Cc: Melissa Wen <mwen@igalia.com>
> Cc: Harry Wentland <hwentlan@amd.com>
> Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  1 +
>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c      |  1 +
>  drivers/gpu/drm/i915/display/intel_display.c      |  1 +
>  drivers/gpu/drm/nouveau/nouveau_display.c         |  1 +
>  drivers/gpu/drm/vc4/vc4_kms.c                     |  1 +
>  include/drm/drm_mode_config.h                     | 11 +++++++++++
>  6 files changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 44235345fd57..7500e82cf06a 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -3808,6 +3808,7 @@ static int amdgpu_dm_mode_config_init(struct amdgpu_device *adev)
>  		adev_to_drm(adev)->mode_config.prefer_shadow = 1;
>  	/* indicates support for immediate flip */
>  	adev_to_drm(adev)->mode_config.async_page_flip = true;
> +	adev_to_drm(adev)->mode_config.atomic_async_page_flip_not_supported = true;

The flag polarity seems weird. Why opt out and not opt in?

>  
>  	adev_to_drm(adev)->mode_config.fb_base = adev->gmc.aper_base;
>  
> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
> index f7e7f4e919c7..ffb3a2fa797f 100644
> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
> @@ -639,6 +639,7 @@ static int atmel_hlcdc_dc_modeset_init(struct drm_device *dev)
>  	dev->mode_config.max_height = dc->desc->max_height;
>  	dev->mode_config.funcs = &mode_config_funcs;
>  	dev->mode_config.async_page_flip = true;
> +	dev->mode_config.atomic_async_page_flip_not_supported = true;
>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 40fbf8a296e2..e025b3499c9d 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -8621,6 +8621,7 @@ static void intel_mode_config_init(struct drm_i915_private *i915)
>  	mode_config->helper_private = &intel_mode_config_funcs;
>  
>  	mode_config->async_page_flip = HAS_ASYNC_FLIPS(i915);
> +	mode_config->atomic_async_page_flip_not_supported = true;
>  
>  	/*
>  	 * Maximum framebuffer dimensions, chosen to match
> diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
> index a2f5df568ca5..2b5c4f24aedd 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_display.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_display.c
> @@ -699,6 +699,7 @@ nouveau_display_create(struct drm_device *dev)
>  		dev->mode_config.async_page_flip = false;
>  	else
>  		dev->mode_config.async_page_flip = true;
> +	dev->mode_config.atomic_async_page_flip_not_supported = true;
>  
>  	drm_kms_helper_poll_init(dev);
>  	drm_kms_helper_poll_disable(dev);
> diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
> index 4419e810103d..3fe59c6b2cf0 100644
> --- a/drivers/gpu/drm/vc4/vc4_kms.c
> +++ b/drivers/gpu/drm/vc4/vc4_kms.c
> @@ -1047,6 +1047,7 @@ int vc4_kms_load(struct drm_device *dev)
>  	dev->mode_config.helper_private = &vc4_mode_config_helpers;
>  	dev->mode_config.preferred_depth = 24;
>  	dev->mode_config.async_page_flip = true;
> +	dev->mode_config.atomic_async_page_flip_not_supported = true;
>  
>  	ret = vc4_ctm_obj_init(vc4);
>  	if (ret)
> diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
> index 6b5e01295348..1b535d94f2f4 100644
> --- a/include/drm/drm_mode_config.h
> +++ b/include/drm/drm_mode_config.h
> @@ -917,6 +917,17 @@ struct drm_mode_config {
>  	 */
>  	bool async_page_flip;
>  
> +	/**
> +	 * @atomic_async_page_flip_not_supported:
> +	 *
> +	 * If true, the driver does not support async page-flips with the
> +	 * atomic uAPI. This is only used by old drivers which haven't yet
> +	 * accomodated for &drm_crtc_state.async_flip in their atomic logic,
> +	 * even if they have &drm_mode_config.async_page_flip set to true.
> +	 * New drivers shall not set this flag.
> +	 */
> +	bool atomic_async_page_flip_not_supported;
> +
>  	/**
>  	 * @fb_modifiers_not_supported:
>  	 *
> -- 
> 2.37.3
> 

-- 
Ville Syrjälä
Intel
