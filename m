Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9EAAF92D4
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 14:38:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37ABB10EA21;
	Fri,  4 Jul 2025 12:38:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GoooMi1d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4575710EA1E;
 Fri,  4 Jul 2025 12:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751632684; x=1783168684;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=yyuOzGdIUflPoJSgZ1dl1uMzfcrabD04VDswYh/h+1s=;
 b=GoooMi1dvaJ5Z0H8s/QkH5B7Wyw1yf8ouW/e/urgjy8fIX30DLXnZubz
 M9yQhhKtdu3eYbT7BCxN2i6s/HelDJC4hKwIxcbAP374GT3VWTyKWc9rh
 3ANA8r0aIr8psP8tiX4WDXBl+lTsoEqA5o/zDjRZIbf2BM4asUqDMkRj6
 km0IxATVi9h+3Zr/36U3sCfbHXlDH6vGRbJFBTo6OJZuTur95KBJvl+wB
 MciG2Cp3yPieG2KQigx6afqNu2oasVe60rWdnNGbjhV6N28u6VCNc06gW
 g3o9E9v+OyuCu/O0biJ82n/x/WMO4pLS/AJRyU5dBGo+0/aLpgFIql73R g==;
X-CSE-ConnectionGUID: Gpv8g6jlSMG2YMsUald8qw==
X-CSE-MsgGUID: Oae/CxgJQXCv0oHBGFMJvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="64659105"
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; d="scan'208";a="64659105"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 05:38:04 -0700
X-CSE-ConnectionGUID: P2k68M3NSlae0ze1lqVuaA==
X-CSE-MsgGUID: KOB8YWrfRhOy3hTaW/to1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; d="scan'208";a="154045810"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.102])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 05:37:59 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Uma Shankar <uma.shankar@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, harry.wentland@amd.com,
 mwen@igalia.com, jadahl@redhat.com, sebastian.wick@redhat.com,
 shashank.sharma@amd.com, swati2.sharma@intel.com, alex.hung@amd.com, Uma
 Shankar <uma.shankar@intel.com>
Subject: Re: [v5 09/24] drm/i915/color: Add helper to create intel colorop
In-Reply-To: <20250702091936.3004854-10-uma.shankar@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250702091936.3004854-1-uma.shankar@intel.com>
 <20250702091936.3004854-10-uma.shankar@intel.com>
Date: Fri, 04 Jul 2025 15:37:55 +0300
Message-ID: <9dc3e9357aa1b3a3a836cc2f9ddaf27c9ad538da@intel.com>
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
> Add intel colorop create helper
>
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_color.c | 39 ++++++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_color.h |  3 ++
>  2 files changed, 42 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
> index 671db6926e4c..5f38a5ff541c 100644
> --- a/drivers/gpu/drm/i915/display/intel_color.c
> +++ b/drivers/gpu/drm/i915/display/intel_color.c
> @@ -3962,6 +3962,45 @@ static const struct intel_color_funcs ilk_color_funcs = {
>  	.get_config = ilk_get_config,
>  };
>  
> +/* TODO: Move to another file */
> +struct intel_plane_colorop *intel_colorop_alloc(void)
> +{
> +	struct intel_plane_colorop *colorop;
> +	struct intel_plane_colorop_state *colorop_state;
> +
> +	colorop = kzalloc(sizeof(*colorop), GFP_KERNEL);
> +	if (!colorop)
> +		return ERR_PTR(-ENOMEM);
> +
> +	colorop_state = kzalloc(sizeof(*colorop_state), GFP_KERNEL);
> +	if (!colorop_state) {
> +		kfree(colorop);
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +	/* TODO: Add color op reset
> +	 * intel_colorop_state_reset(plane_state, plane);
> +	 */
> +
> +	colorop->base.state = &colorop_state->uapi;
> +
> +	return colorop;
> +}
> +
> +struct intel_plane_colorop *intel_plane_colorop_create(enum intel_color_block id)
> +{
> +	struct intel_plane_colorop *colorop;
> +
> +	colorop = intel_colorop_alloc();
> +
> +	if (IS_ERR(colorop))
> +		return colorop;
> +
> +	colorop->id = id;
> +
> +	return colorop;
> +}
> +
>  void intel_color_crtc_init(struct intel_crtc *crtc)
>  {
>  	struct intel_display *display = to_intel_display(crtc);
> diff --git a/drivers/gpu/drm/i915/display/intel_color.h b/drivers/gpu/drm/i915/display/intel_color.h
> index bf7a12ce9df0..f3c7cd694b99 100644
> --- a/drivers/gpu/drm/i915/display/intel_color.h
> +++ b/drivers/gpu/drm/i915/display/intel_color.h
> @@ -14,6 +14,7 @@ struct intel_crtc;
>  struct intel_display;
>  struct intel_dsb;
>  struct drm_property_blob;
> +enum intel_color_block;
>  
>  void intel_color_init_hooks(struct intel_display *display);
>  int intel_color_init(struct intel_display *display);
> @@ -40,5 +41,7 @@ bool intel_color_lut_equal(const struct intel_crtc_state *crtc_state,
>  			   const struct drm_property_blob *blob2,
>  			   bool is_pre_csc_lut);
>  void intel_color_assert_luts(const struct intel_crtc_state *crtc_state);
> +struct intel_plane_colorop *intel_colorop_alloc(void);
> +struct intel_plane_colorop *intel_plane_colorop_create(enum intel_color_block id);

The naming seems inconsistent.

>  
>  #endif /* __INTEL_COLOR_H__ */

-- 
Jani Nikula, Intel
