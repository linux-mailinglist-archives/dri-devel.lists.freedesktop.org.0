Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2099AF92DC
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 14:39:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A2E910E12A;
	Fri,  4 Jul 2025 12:39:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E903z9Gv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01ED110E12A;
 Fri,  4 Jul 2025 12:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751632786; x=1783168786;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=4vUgA3Ow+HjYttgRvQkDl2pRDFL6vRQ+6rbUyUQCP5w=;
 b=E903z9GvGvXuYvZ7APCOvB96GntDHCcXhfiLpR8yZV2F+yPp0u4kKYU3
 iFf+/7iz2WO4UyS7d6iY+ErGuhXPFDnpq2ZP0aNKjsM/g95xUNhVMw0Co
 3Eih8yztzQf2UfCuzLSrI78DpaoxvzpJIVpnpUi0lZeVR9+l/QVyBspYI
 a2/5p39rd9zds1+SY3vPzaqD/IPNGtW/F/VBhJ6+qfNl0Pwz83HGlyfil
 iiZ/cZKVy8zU9LsREVMnc3NUJvVRc3xXLfUDbD743AqgUz/C1WjUkKpce
 MzCA8Vh+Vf8jxchIsVjZXnrZIiSAWcOD2hPRMbgrayJgHb+s+1Cq8PEse A==;
X-CSE-ConnectionGUID: VwmU9MRcR16qGEYHC9fAYA==
X-CSE-MsgGUID: LW3njpjeQMOKW+ZrKnttcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="53834444"
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; d="scan'208";a="53834444"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 05:39:46 -0700
X-CSE-ConnectionGUID: w3NNSEVHRv+myzPfgudkMQ==
X-CSE-MsgGUID: +65I9WK2QyOkjKNoPhvVDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; d="scan'208";a="158978270"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.102])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 05:39:41 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Uma Shankar <uma.shankar@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, harry.wentland@amd.com,
 mwen@igalia.com, jadahl@redhat.com, sebastian.wick@redhat.com,
 shashank.sharma@amd.com, swati2.sharma@intel.com, alex.hung@amd.com, Uma
 Shankar <uma.shankar@intel.com>
Subject: Re: [v5 10/24] drm/i915/color: Create a transfer function color
 pipeline
In-Reply-To: <20250702091936.3004854-11-uma.shankar@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250702091936.3004854-1-uma.shankar@intel.com>
 <20250702091936.3004854-11-uma.shankar@intel.com>
Date: Fri, 04 Jul 2025 15:39:37 +0300
Message-ID: <938bf8b6d839cf946cd44ddf3de92ba7b8be9235@intel.com>
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

On Wed, 02 Jul 2025, Uma Shankar <uma.shankar@intel.com> wrote:
> From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>
> Add a color pipeline with three colorops in the sequence
>
> 	1D LUT - 3x4 CTM - 1D LUT
>
> This pipeline can be used to do any color space conversion or HDR
> tone mapping
>
> v2: Change namespace to drm_plane_colorop*
> v3: Use simpler/pre-existing colorops for first iteration
>
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_color.c | 49 ++++++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_color.h |  3 ++
>  2 files changed, 52 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
> index 5f38a5ff541c..90ac6530d1a5 100644
> --- a/drivers/gpu/drm/i915/display/intel_color.c
> +++ b/drivers/gpu/drm/i915/display/intel_color.c
> @@ -32,6 +32,10 @@
>  #include "intel_display_types.h"
>  #include "intel_dsb.h"
>  #include "intel_vrr.h"
> +#include "skl_universal_plane.h"
> +
> +#define PLANE_DEGAMMA_SIZE 128
> +#define PLANE_GAMMA_SIZE 32
>  
>  struct intel_color_funcs {
>  	int (*color_check)(struct intel_atomic_state *state,
> @@ -4001,6 +4005,51 @@ struct intel_plane_colorop *intel_plane_colorop_create(enum intel_color_block id
>  	return colorop;
>  }
>  
> +int intel_plane_tf_pipeline_init(struct drm_plane *plane, struct drm_prop_enum_list *list)

plane the F?

Please let's not invent ad hoc acronyms that will confuse people.

> +{
> +	struct intel_plane_colorop *colorop;
> +	struct drm_device *dev = plane->dev;
> +	int ret;
> +	struct drm_colorop *prev_op;
> +
> +	colorop = intel_plane_colorop_create(CB_PLANE_PRE_CSC_LUT);
> +
> +	ret = drm_plane_colorop_curve_1d_lut_init(dev, &colorop->base, plane,
> +						  PLANE_DEGAMMA_SIZE,
> +						  DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
> +						  DRM_COLOROP_FLAG_ALLOW_BYPASS);
> +
> +	if (ret)
> +		return ret;
> +
> +	list->type = colorop->base.base.id;
> +	list->name = kasprintf(GFP_KERNEL, "Color Pipeline %d", colorop->base.base.id);
> +
> +	/* TODO: handle failures and clean up*/
> +	prev_op = &colorop->base;
> +
> +	colorop = intel_plane_colorop_create(CB_PLANE_CSC);
> +	ret = drm_plane_colorop_ctm_3x4_init(dev, &colorop->base, plane,
> +					     DRM_COLOROP_FLAG_ALLOW_BYPASS);
> +	if (ret)
> +		return ret;
> +
> +	drm_colorop_set_next_property(prev_op, &colorop->base);
> +	prev_op = &colorop->base;
> +
> +	colorop = intel_plane_colorop_create(CB_PLANE_POST_CSC_LUT);
> +	ret = drm_plane_colorop_curve_1d_lut_init(dev, &colorop->base, plane,
> +						  PLANE_GAMMA_SIZE,
> +						  DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
> +						  DRM_COLOROP_FLAG_ALLOW_BYPASS);
> +	if (ret)
> +		return ret;
> +
> +	drm_colorop_set_next_property(prev_op, &colorop->base);
> +
> +	return 0;
> +}
> +
>  void intel_color_crtc_init(struct intel_crtc *crtc)
>  {
>  	struct intel_display *display = to_intel_display(crtc);
> diff --git a/drivers/gpu/drm/i915/display/intel_color.h b/drivers/gpu/drm/i915/display/intel_color.h
> index f3c7cd694b99..ce9db761c6e2 100644
> --- a/drivers/gpu/drm/i915/display/intel_color.h
> +++ b/drivers/gpu/drm/i915/display/intel_color.h
> @@ -14,6 +14,8 @@ struct intel_crtc;
>  struct intel_display;
>  struct intel_dsb;
>  struct drm_property_blob;
> +struct drm_plane;
> +struct drm_prop_enum_list;
>  enum intel_color_block;
>  
>  void intel_color_init_hooks(struct intel_display *display);
> @@ -43,5 +45,6 @@ bool intel_color_lut_equal(const struct intel_crtc_state *crtc_state,
>  void intel_color_assert_luts(const struct intel_crtc_state *crtc_state);
>  struct intel_plane_colorop *intel_colorop_alloc(void);
>  struct intel_plane_colorop *intel_plane_colorop_create(enum intel_color_block id);
> +int intel_plane_tf_pipeline_init(struct drm_plane *plane, struct drm_prop_enum_list *list);
>  
>  #endif /* __INTEL_COLOR_H__ */

-- 
Jani Nikula, Intel
