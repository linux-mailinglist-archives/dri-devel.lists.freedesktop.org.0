Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6908D1DCA
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 16:00:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0556C10EE6B;
	Tue, 28 May 2024 14:00:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hr2cb1JY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33E0E1122E4;
 Tue, 28 May 2024 14:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716904837; x=1748440837;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=wuwD9M3OnrW3S+ZzJk0mp/tDlv32D7qXk0sSujXymA0=;
 b=hr2cb1JYCJl9yHQmkiYUisgf2AZmPhsCKP1gCrGcvwCaMgkUHs5YalV6
 z8pM7lG1+xwrF7QRc1bumlk/dlq/bzsfgkbxHY5o/yax0+kIH+AZKlw0H
 GTLBmffRmeQUXWTD4lGoPfnHn7BKgwnxiD3f5VboIhZufKsdm1+saT1Ar
 InKz6fnH0NtiK7opbg5fIBfco1yQ58f1q214xY78Cm+PRbUynFobbnPbW
 rlbiR8aTM5/YZd2vFZj6cRPlCVfuWfwllEyQ3Xm5Q/m6jtsbZeFU+ZVyE
 42O4GiMWP3W4mO3bpGeOZd9iddTnjOz0eUmDx2T6KC/vsXASK66kspLHK w==;
X-CSE-ConnectionGUID: EoFD0fHXTn6YEftwJpWILA==
X-CSE-MsgGUID: uqhmJ2eoSCexQFGlXTBxfg==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13021713"
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; d="scan'208";a="13021713"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 07:00:36 -0700
X-CSE-ConnectionGUID: orumg5ZrQfmT5LXl4BDupw==
X-CSE-MsgGUID: IU7j43npSA2F7ZOilOgQ7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; d="scan'208";a="72507202"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 07:00:35 -0700
Date: Tue, 28 May 2024 17:00:40 +0300
From: Imre Deak <imre.deak@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 9/9] drm/i915: Nuke the TGL+ chroma plane tile row
 alignment stuff
Message-ID: <ZlXjiHRpcEa37hU9@ideak-desk.fi.intel.com>
References: <20240513175942.12910-1-ville.syrjala@linux.intel.com>
 <20240513175942.12910-10-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240513175942.12910-10-ville.syrjala@linux.intel.com>
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
Reply-To: imre.deak@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 13, 2024 at 08:59:42PM +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> I don't think the display hardware really has such chroma
> plane tile row alignment requirements as outlined in
> commit d156135e6a54 ("drm/i915/tgl: Make sure a semiplanar
> UV plane is tile row size aligned")
> 
> Bspec had the same exact thing to say about earlier hardware
> as well, but we never cared and things work just fine.
> 
> The one thing mentioned in that commit that is definitely
> true however is the fence alignment issue. But we don't
> deal with that on earlier hardware either. We do have code
> to deal with that issue for the first color plane, but not
> the chroma planes. So I think if we did want to check this
> more extensively we should do it in the same places where
> we already check the first color plane (namely
> convert_plane_offset_to_xy() and intel_fb_bo_framebuffer_init()).

Imo a correct alignment should be required to help users figure out why
a given config doesn't work (even if an incorrect alignment doesn't
cause other HW issues). But agreed that it should be the same then for
all platforms, so ok to remove it in its current form.

> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_fb.c            | 12 +-----------
>  drivers/gpu/drm/i915/display/intel_fb.h            |  1 -
>  drivers/gpu/drm/i915/display/skl_universal_plane.c | 11 -----------
>  3 files changed, 1 insertion(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
> index c80f866f3fb6..fc18da3106fd 100644
> --- a/drivers/gpu/drm/i915/display/intel_fb.c
> +++ b/drivers/gpu/drm/i915/display/intel_fb.c
> @@ -584,12 +584,6 @@ static bool is_gen12_ccs_cc_plane(const struct drm_framebuffer *fb, int color_pl
>  	return intel_fb_rc_ccs_cc_plane(fb) == color_plane;
>  }
>  
> -bool is_semiplanar_uv_plane(const struct drm_framebuffer *fb, int color_plane)
> -{
> -	return intel_format_info_is_yuv_semiplanar(fb->format, fb->modifier) &&
> -		color_plane == 1;
> -}
> -
>  bool is_surface_linear(const struct drm_framebuffer *fb, int color_plane)
>  {
>  	return fb->modifier == DRM_FORMAT_MOD_LINEAR ||
> @@ -1019,11 +1013,7 @@ static int intel_fb_offset_to_xy(int *x, int *y,
>  	struct drm_i915_private *i915 = to_i915(fb->dev);
>  	unsigned int height, alignment, unused;
>  
> -	if (DISPLAY_VER(i915) >= 12 &&
> -	    !intel_fb_needs_pot_stride_remap(to_intel_framebuffer(fb)) &&
> -	    is_semiplanar_uv_plane(fb, color_plane))
> -		alignment = intel_tile_row_size(fb, color_plane);
> -	else if (fb->modifier != DRM_FORMAT_MOD_LINEAR)
> +	if (fb->modifier != DRM_FORMAT_MOD_LINEAR)
>  		alignment = intel_tile_size(i915);
>  	else
>  		alignment = 0;
> diff --git a/drivers/gpu/drm/i915/display/intel_fb.h b/drivers/gpu/drm/i915/display/intel_fb.h
> index 1b1fef2dc39a..6dee0c8b7f22 100644
> --- a/drivers/gpu/drm/i915/display/intel_fb.h
> +++ b/drivers/gpu/drm/i915/display/intel_fb.h
> @@ -34,7 +34,6 @@ bool intel_fb_is_ccs_modifier(u64 modifier);
>  bool intel_fb_is_rc_ccs_cc_modifier(u64 modifier);
>  bool intel_fb_is_mc_ccs_modifier(u64 modifier);
>  
> -bool is_semiplanar_uv_plane(const struct drm_framebuffer *fb, int color_plane);
>  bool intel_fb_is_ccs_aux_plane(const struct drm_framebuffer *fb, int color_plane);
>  int intel_fb_rc_ccs_cc_plane(const struct drm_framebuffer *fb);
>  
> diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> index ca7fc9fae990..476f5b7d9497 100644
> --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> @@ -514,17 +514,6 @@ static u32 tgl_plane_min_alignment(struct intel_plane *plane,
>  	if (intel_fb_is_ccs_aux_plane(fb, color_plane))
>  		return mult * 4 * 1024;
>  
> -	if (is_semiplanar_uv_plane(fb, color_plane)) {
> -		/*
> -		 * TODO: cross-check wrt. the bspec stride in bytes * 64 bytes
> -		 * alignment for linear UV planes on all platforms.
> -		 */
> -		if (fb->modifier == DRM_FORMAT_MOD_LINEAR)
> -			return 256 * 1024;
> -
> -		return intel_tile_row_size(fb, color_plane);
> -	}

The above will also use the correct 2MB for DPT, which the previous
patch should've kept already. Other than that looks ok:

Reviewed-by: Imre Deak <imre.deak@intel.com>

> -
>  	switch (fb->modifier) {
>  	case DRM_FORMAT_MOD_LINEAR:
>  	case I915_FORMAT_MOD_X_TILED:
> -- 
> 2.43.2
> 
