Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A71CA39B5C
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 12:47:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD55810E3B0;
	Tue, 18 Feb 2025 11:47:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FbuceZy8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6E9110E3B0;
 Tue, 18 Feb 2025 11:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739879224; x=1771415224;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=8OPt8BvkwIgSAslswcXYvgBTly+8YgI/xqYSzoCdwJk=;
 b=FbuceZy8jjiA0XlwSjeuEqaa0gKL6LMnLlqj2ZLq0UMVkWN6SDjpb0pW
 oB3OZUIJHut9hKrR1WGHKZ8O+O9Xf/2oRW9W3/+bjPxdH29WXDo8L7fB6
 pQHCe0I0Cd55neajZux3ygVhnfFYQiCX6+lfafTblHZFcnanlmBUov7ML
 YZDfIPnXAysNC7YrYZMJdwYHvXN/kaUeoCitYKrCRlF4F06RwooglHEwM
 CKrOfuv/rtcgE6C7LyYL99n8KuTepZBCF0jmqeLdWqUUxhAME58EHaRjR
 tepc236553No0f2NPKP2wReZakwt5/9kOo3yKhvK8uDfMXaVtU01u3BG3 g==;
X-CSE-ConnectionGUID: itV3QC85Sk249zPqOVBWqw==
X-CSE-MsgGUID: fpH3madkQX2x5MfGyl3yew==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="39804229"
X-IronPort-AV: E=Sophos;i="6.13,295,1732608000"; d="scan'208";a="39804229"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 03:47:03 -0800
X-CSE-ConnectionGUID: wuQ64HiJR1aQCbdamMxYLw==
X-CSE-MsgGUID: 4qgyEmFjRLGcZYbuSuzqig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="119013268"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.43])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 03:47:00 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Arun R Murthy <arun.r.murthy@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, Arun R Murthy
 <arun.r.murthy@intel.com>, Naveen Kumar <naveen1.kumar@intel.com>
Subject: Re: [PATCH v5 3/3] drm/i915/display: Add i915 hook for
 format_mod_supported_async
In-Reply-To: <20250218-asyn-v5-3-7ac5ac4abd4a@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250218-asyn-v5-0-7ac5ac4abd4a@intel.com>
 <20250218-asyn-v5-3-7ac5ac4abd4a@intel.com>
Date: Tue, 18 Feb 2025 13:46:55 +0200
Message-ID: <87h64ro4pc.fsf@intel.com>
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

On Tue, 18 Feb 2025, Arun R Murthy <arun.r.murthy@intel.com> wrote:
> Hook up the newly added plane function pointer
> format_mod_supported_async to populate the modifiers/formats supported
> by asynchronous flips.
>
> v5: Correct the if condition for modifier support check (Chaitanya)
>
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> Tested-by: Naveen Kumar <naveen1.kumar@intel.com>
> ---
>  drivers/gpu/drm/i915/display/skl_universal_plane.c | 56 ++++++++++++++++------
>  1 file changed, 41 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> index cd9762947f1de227a3abbcd61b7c7b0c9848e439..e303ae6b1c6208755ea0454ba36efcff0c06cda6 100644
> --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> @@ -509,6 +509,33 @@ skl_plane_max_stride(struct intel_plane *plane,
>  				modifier, rotation,
>  				max_pixels, max_bytes);
>  }
> +static bool intel_plane_async_formats(struct intel_plane *plane, uint32_t format)

Do not add new uint32_t etc. uses to i915. Use u32 etc. Ditto below.

> +{
> +	switch (format) {
> +	case DRM_FORMAT_RGB565:
> +	case DRM_FORMAT_XRGB8888:
> +	case DRM_FORMAT_XBGR8888:
> +	case DRM_FORMAT_ARGB8888:
> +	case DRM_FORMAT_ABGR8888:
> +	case DRM_FORMAT_XRGB2101010:
> +	case DRM_FORMAT_XBGR2101010:
> +	case DRM_FORMAT_XRGB16161616F:
> +	case DRM_FORMAT_XBGR16161616F:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
> +static bool intel_plane_format_mod_supported_async(struct drm_plane *plane,
> +						   uint32_t format,
> +						   uint64_t modifier)
> +{
> +	if (!intel_plane_can_async_flip(to_intel_plane(plane), modifier))
> +		return false;
> +
> +	return intel_plane_async_formats(to_intel_plane(plane), format);
> +}
>  
>  static bool tgl_plane_can_async_flip(u64 modifier)
>  {
> @@ -2616,30 +2643,29 @@ static bool tgl_plane_format_mod_supported(struct drm_plane *_plane,
>  	}
>  }
>  
> +#define INTEL_PLANE_FUNCS \
> +	.update_plane = drm_atomic_helper_update_plane, \
> +	.disable_plane = drm_atomic_helper_disable_plane, \
> +	.destroy = intel_plane_destroy, \
> +	.atomic_duplicate_state = intel_plane_duplicate_state, \
> +	.atomic_destroy_state = intel_plane_destroy_state, \
> +	.format_mod_supported_async = intel_plane_format_mod_supported_async
> +
>  static const struct drm_plane_funcs skl_plane_funcs = {
> -	.update_plane = drm_atomic_helper_update_plane,
> -	.disable_plane = drm_atomic_helper_disable_plane,
> -	.destroy = intel_plane_destroy,
> -	.atomic_duplicate_state = intel_plane_duplicate_state,
> -	.atomic_destroy_state = intel_plane_destroy_state,
> +	INTEL_PLANE_FUNCS,
> +
>  	.format_mod_supported = skl_plane_format_mod_supported,
>  };
>  
>  static const struct drm_plane_funcs icl_plane_funcs = {
> -	.update_plane = drm_atomic_helper_update_plane,
> -	.disable_plane = drm_atomic_helper_disable_plane,
> -	.destroy = intel_plane_destroy,
> -	.atomic_duplicate_state = intel_plane_duplicate_state,
> -	.atomic_destroy_state = intel_plane_destroy_state,
> +	INTEL_PLANE_FUNCS,
> +
>  	.format_mod_supported = icl_plane_format_mod_supported,
>  };
>  
>  static const struct drm_plane_funcs tgl_plane_funcs = {
> -	.update_plane = drm_atomic_helper_update_plane,
> -	.disable_plane = drm_atomic_helper_disable_plane,
> -	.destroy = intel_plane_destroy,
> -	.atomic_duplicate_state = intel_plane_duplicate_state,
> -	.atomic_destroy_state = intel_plane_destroy_state,
> +	INTEL_PLANE_FUNCS,
> +
>  	.format_mod_supported = tgl_plane_format_mod_supported,
>  };

-- 
Jani Nikula, Intel
