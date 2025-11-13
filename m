Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDCEC58376
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 16:08:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CB0310E87A;
	Thu, 13 Nov 2025 15:08:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MP4wNlIJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 029DA10E87A;
 Thu, 13 Nov 2025 15:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763046523; x=1794582523;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=wAVRgEmnZIxgyQBCgbBxqS2a2X7Tql8nxCsscAkX2Bw=;
 b=MP4wNlIJrSKZpsjJFqbhiVbtCLP8AIksFTaKGsYVAU3TLmkfvXV1/Y0B
 frTuVT5ltz7mNe1wciLrsUv2pBYWRW7fdk/ahKg59e77qFEMv5Lab3iEF
 gGuq46wjjj/ZpBLocP9L3aGqO5Q44HtQ/toM6Xo/wulm9SMikZL+6Gua+
 EHtYZ2c5BBAOlw4yMg7JdxRbZ4IIoTMOJEXR0sQZXggPRhx0ITH0Bdavs
 803Qr78oXgrUB41W53YOpcdgNRjeo/+IUfBXnPajOUEUlnR4woKEKhs60
 nyUr2s4t5QKzh4kWogYY10iVZFjt8rmPQCADpjKlyJVWGSQdk5IpTqSf+ w==;
X-CSE-ConnectionGUID: C1GcMnGxQTGnvLiLr71pHg==
X-CSE-MsgGUID: KGfOARKuSmqCZoTDqX9VPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="65167153"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="65167153"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 07:08:42 -0800
X-CSE-ConnectionGUID: 1LrMgLnvTDqu5M3RxPuokA==
X-CSE-MsgGUID: O3nhC1jRTXOx6EkjLFXpqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="193961130"
Received: from aotchere-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.135])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 07:08:39 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>, Simona Vetter
 <simona@ffwll.ch>
Cc: Alex Deucher <alexander.deucher@amd.com>, Christian =?utf-8?Q?K=C3=B6n?=
 =?utf-8?Q?ig?=
 <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, "open
 list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>, "open
 list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, open list
 <linux-kernel@vger.kernel.org>, Mario Limonciello
 <mario.limonciello@amd.com>, Simona Vetter <simona.vetter@ffwll.ch>, Harry
 Wentland <Harry.Wentland@amd.com>, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH] drm/amd: Move adaptive backlight modulation property to
 drm core
In-Reply-To: <20251112222646.495189-1-mario.limonciello@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251112222646.495189-1-mario.limonciello@amd.com>
Date: Thu, 13 Nov 2025 17:08:36 +0200
Message-ID: <83aa8a816cf301085a3e3638238f8fba11053dc2@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, 12 Nov 2025, Mario Limonciello <mario.limonciello@amd.com> wrote:
> The adaptive backlight modulation property is supported on AMD hardware but
> compositors should be aware of it in standard DRM property documentation.

I think the reason for adding a property in drm core code should be to
share the ABI between drivers.

> Move the helper to create the property and documentation into DRM.
>

Link: to the userspace implementation according to
Documentation/gpu/drm-uapi.rst

> Suggested-by: Simona Vetter <simona.vetter@ffwll.ch>
> Reviewed-by: Harry Wentland <Harry.Wentland@amd.com>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c | 69 +++------------------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.h |  7 ---
>  drivers/gpu/drm/drm_connector.c             | 63 +++++++++++++++++++
>  include/drm/drm_connector.h                 |  8 +++
>  4 files changed, 80 insertions(+), 67 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> index f8b35c487b6c..3d840bef77bf 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> @@ -1363,67 +1363,9 @@ static const struct drm_prop_enum_list amdgpu_dither_enum_list[] = {
>  	{ AMDGPU_FMT_DITHER_ENABLE, "on" },
>  };
>  
> -/**
> - * DOC: property for adaptive backlight modulation
> - *
> - * The 'adaptive backlight modulation' property is used for the compositor to
> - * directly control the adaptive backlight modulation power savings feature
> - * that is part of DCN hardware.
> - *
> - * The property will be attached specifically to eDP panels that support it.
> - *
> - * The property is by default set to 'sysfs' to allow the sysfs file 'panel_power_savings'
> - * to be able to control it.
> - * If set to 'off' the compositor will ensure it stays off.
> - * The other values 'min', 'bias min', 'bias max', and 'max' will control the
> - * intensity of the power savings.
> - *
> - * Modifying this value can have implications on color accuracy, so tread
> - * carefully.
> - */
> -static int amdgpu_display_setup_abm_prop(struct amdgpu_device *adev)
> -{
> -	const struct drm_prop_enum_list props[] = {
> -		{ ABM_SYSFS_CONTROL, "sysfs" },
> -		{ ABM_LEVEL_OFF, "off" },
> -		{ ABM_LEVEL_MIN, "min" },
> -		{ ABM_LEVEL_BIAS_MIN, "bias min" },
> -		{ ABM_LEVEL_BIAS_MAX, "bias max" },
> -		{ ABM_LEVEL_MAX, "max" },
> -	};
> -	struct drm_property *prop;
> -	int i;
> -
> -	if (!adev->dc_enabled)
> -		return 0;
> -
> -	prop = drm_property_create(adev_to_drm(adev), DRM_MODE_PROP_ENUM,
> -				"adaptive backlight modulation",
> -				6);
> -	if (!prop)
> -		return -ENOMEM;
> -
> -	for (i = 0; i < ARRAY_SIZE(props); i++) {
> -		int ret;
> -
> -		ret = drm_property_add_enum(prop, props[i].type,
> -						props[i].name);
> -
> -		if (ret) {
> -			drm_property_destroy(adev_to_drm(adev), prop);
> -
> -			return ret;
> -		}
> -	}
> -
> -	adev->mode_info.abm_level_property = prop;
> -
> -	return 0;
> -}
> -
>  int amdgpu_display_modeset_create_props(struct amdgpu_device *adev)
>  {
> -	int sz;
> +	int ret, sz;
>  
>  	adev->mode_info.coherent_mode_property =
>  		drm_property_create_range(adev_to_drm(adev), 0, "coherent", 0, 1);
> @@ -1467,7 +1409,14 @@ int amdgpu_display_modeset_create_props(struct amdgpu_device *adev)
>  					 "dither",
>  					 amdgpu_dither_enum_list, sz);
>  
> -	return amdgpu_display_setup_abm_prop(adev);
> +	adev->mode_info.abm_level_property = drm_create_abm_property(adev_to_drm(adev));
> +	if (IS_ERR(adev->mode_info.abm_level_property)) {
> +		ret = PTR_ERR(adev->mode_info.abm_level_property);
> +		adev->mode_info.abm_level_property = NULL;
> +		return ret;
> +	}
> +
> +	return 0;
>  }
>  
>  void amdgpu_display_update_priority(struct amdgpu_device *adev)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.h
> index 2b1536a16752..dfa0d642ac16 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.h
> @@ -54,11 +54,4 @@ int amdgpu_display_resume_helper(struct amdgpu_device *adev);
>  int amdgpu_display_get_scanout_buffer(struct drm_plane *plane,
>  				      struct drm_scanout_buffer *sb);
>  
> -#define ABM_SYSFS_CONTROL	-1
> -#define ABM_LEVEL_OFF		0
> -#define ABM_LEVEL_MIN		1
> -#define ABM_LEVEL_BIAS_MIN	2
> -#define ABM_LEVEL_BIAS_MAX	3
> -#define ABM_LEVEL_MAX		4
> -
>  #endif
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index 272d6254ea47..376169dac247 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -2603,6 +2603,69 @@ static int drm_mode_create_colorspace_property(struct drm_connector *connector,
>  	return 0;
>  }
>  
> +/**
> + * DOC: integrated panel properties
> + *
> + * adaptive backlight modulation:
> + *	Adaptive backlight modulation (ABM) is a power savings feature that
> + *	dynamically adjusts the backlight brightness based on the content
> + *	displayed on the screen. By reducing the backlight brightness for
> + *	darker images and increasing it for brighter images, ABM helps to
> + *	conserve energy and extend battery life on devices with integrated
> + *	displays.  This feature is part of AMD DCN hardware.

So this is basically Content Adaptive Brightness Control, but with the
technology ("backlight" and "modulation") unnecessarily encoded in the
ABI.

You could have the same knob for adjusting CABC implemented in an OLED
panel, controlled via DPCD.

> + *
> + *	sysfs
> + *		The ABM property is exposed to userspace via sysfs interface
> + *		located at 'amdgpu/panel_power_savings' under the DRM device.

Err what? Seriously suggesting that to the common ABI? We shouldn't have
sysfs involved at all, let alone vendor specific sysfs.

> + *	off
> + *		Adaptive backlight modulation is disabled.
> + *	min
> + *		Adaptive backlight modulation is enabled at minimum intensity.
> + *	bias min
> + *		Adaptive backlight modulation is enabled at a more intense
> + *		level than 'min'.
> + *	bias max
> + *		Adaptive backlight modulation is enabled at a more intense
> + *		level than 'bias min'.
> + *	max
> + *		Adaptive backlight modulation is enabled at maximum intensity.

So values 0-4 but with names. I don't know what "bias" means here, and I
probably shouldn't even have to know. It's an implementation detail
leaking to the ABI.

In the past I've encountered CABC with different modes based on the use
case, e.g. "video" or "game", but I don't know how those would map to
the intensities.

I'm concerned the ABI serves AMD hardware, no one else, and everyone
else coming after this is forced to shoehorn their implementation into
this.

> + */
> +struct drm_property *drm_create_abm_property(struct drm_device *dev)
> +{
> +	const struct drm_prop_enum_list props[] = {
> +		{ ABM_SYSFS_CONTROL, "sysfs" },
> +		{ ABM_LEVEL_OFF, "off" },
> +		{ ABM_LEVEL_MIN, "min" },
> +		{ ABM_LEVEL_BIAS_MIN, "bias min" },
> +		{ ABM_LEVEL_BIAS_MAX, "bias max" },
> +		{ ABM_LEVEL_MAX, "max" },
> +	};
> +	struct drm_property *prop;
> +	int i;
> +
> +	prop = drm_property_create(dev, DRM_MODE_PROP_ENUM,
> +				"adaptive backlight modulation",
> +				6);

Please use drm_property_create_enum(), see
e.g. drm_connector_attach_broadcast_rgb_property().

> +	if (!prop)
> +		return ERR_PTR(-ENOMEM);
> +
> +	for (i = 0; i < ARRAY_SIZE(props); i++) {
> +		int ret;
> +
> +		ret = drm_property_add_enum(prop, props[i].type,
> +						props[i].name);
> +
> +		if (ret) {
> +			drm_property_destroy(dev, prop);
> +
> +			return ERR_PTR(ret);
> +		}
> +	}
> +
> +	return prop;
> +}
> +EXPORT_SYMBOL(drm_create_abm_property);
> +
>  /**
>   * drm_mode_create_hdmi_colorspace_property - create hdmi colorspace property
>   * @connector: connector to create the Colorspace property on.
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 8f34f4b8183d..644c0d49500f 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -2454,6 +2454,7 @@ int drm_connector_attach_hdr_output_metadata_property(struct drm_connector *conn
>  bool drm_connector_atomic_hdr_metadata_equal(struct drm_connector_state *old_state,
>  					     struct drm_connector_state *new_state);
>  int drm_mode_create_aspect_ratio_property(struct drm_device *dev);
> +struct drm_property *drm_create_abm_property(struct drm_device *dev);
>  int drm_mode_create_hdmi_colorspace_property(struct drm_connector *connector,
>  					     u32 supported_colorspaces);
>  int drm_mode_create_dp_colorspace_property(struct drm_connector *connector,
> @@ -2563,4 +2564,11 @@ const char *drm_get_colorspace_name(enum drm_colorspace colorspace);
>  	drm_for_each_encoder_mask(encoder, (connector)->dev, \
>  				  (connector)->possible_encoders)
>  
> +#define ABM_SYSFS_CONTROL	-1
> +#define ABM_LEVEL_OFF		0
> +#define ABM_LEVEL_MIN		1
> +#define ABM_LEVEL_BIAS_MIN	2
> +#define ABM_LEVEL_BIAS_MAX	3
> +#define ABM_LEVEL_MAX		4

These need to be an enum, with documentation, name prefixes, the works.

BR,
Jani.

> +
>  #endif

-- 
Jani Nikula, Intel
