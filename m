Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A9DA32EC5
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 19:35:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 233FF10E95E;
	Wed, 12 Feb 2025 18:35:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MnXChyF6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 922F710E111;
 Wed, 12 Feb 2025 18:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739385313; x=1770921313;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=7bob8s/Sp40KItn1mzp1XffTlRKotvieJOMj/04H0ck=;
 b=MnXChyF67Zyayje4/sE4ShXA9sVFy+F8zngAlwYpoLOejG5AepDEqFRX
 9uYeW6KlhSrjeL9NKmp6kOJo8wqeb/8bSyFPgSo1+qMONQ+jHFNHidQQk
 5MDga4CKORq8ZOhHw4ez6yiHxbzPrYsnCzLAmKFlMTxUM+cX7HPynKuxz
 ql2Z4RZYxiRlaTp1E12XCyXQqfHedy3NNhg/plOInNxjZ1qbQD6wbE+QX
 qwbJr5Pf13YnHjiRwMn6+r5U5lbK+5EE/9HsSU7ewwHedfkRNa3jFO+wP
 PJDaWcCmKsTFZWwIDvE8XxDlutpOmKqHDVk4uKZYDNJeTbNOZ/WtNddr2 w==;
X-CSE-ConnectionGUID: iY8aueThSPqDqAOA3e5OYA==
X-CSE-MsgGUID: CywthUcQQpay9X8Qf5c0sA==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="39983902"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="39983902"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 10:35:11 -0800
X-CSE-ConnectionGUID: KvOh9DAFSYy1jK6IYJ0xZQ==
X-CSE-MsgGUID: QFHc2qF1R+qjafdTdtBTYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="113101381"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 12 Feb 2025 10:35:07 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 12 Feb 2025 20:35:06 +0200
Date: Wed, 12 Feb 2025 20:35:06 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Vinod Govindapillai <vinod.govindapillai@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, ville.syrjala@intel.com,
 santhosh.reddy.guddati@intel.com, jani.saarinen@intel.com
Subject: Re: [PATCH v7 2/7] drm/i915/xe3: update and store the plane damage
 clips
Message-ID: <Z6zp2lzMGEevu5kr@intel.com>
References: <20250212131420.60026-1-vinod.govindapillai@intel.com>
 <20250212131420.60026-3-vinod.govindapillai@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250212131420.60026-3-vinod.govindapillai@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 12, 2025 at 03:14:15PM +0200, Vinod Govindapillai wrote:
> Userspace can pass damage area clips per plane to track
> changes in a plane and some display components can utilze
> these damage clips for efficiently handling use cases like
> FBC, PSR etc. A merged damage area is generated and its
> coordinates are updated relative to viewport and HW and
> stored in the plane_state. This merged damage areas will be
> used for FBC dirty rect support in xe3 in the follow-up
> patch.
> 
> Big thanks to Ville Syrjala for his contribuitions in shaping
> up of this series.
> 
> v1: - Move damage_merged helper to cover bigjoiner case and use
>     the correct plane state for damage find helper (Ville)
>     - Damage handling code under HAS_FBC_DIRTY_RECT() so the
>     the related part will be executed only for xe3+
>     - Changed dev_priv to i915 in one of the functions
> 
> v2: - damage reported is stored in the plane state after coords
>       adjustmentments irrespective of fbc dirty rect support.
>     - Damage to be empty in case of plane not visible (Ville)
>     - Handle fb could be NULL and plane not visible cases (Ville)
> 
> Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
> ---
>  .../gpu/drm/i915/display/intel_atomic_plane.c | 31 +++++++++++++
>  .../drm/i915/display/intel_display_types.h    |  2 +
>  .../drm/i915/display/skl_universal_plane.c    | 46 ++++++++++++++++++-
>  3 files changed, 78 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> index 8a49d87d9bd9..b4e94dd01173 100644
> --- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> +++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> @@ -36,6 +36,7 @@
>  
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_blend.h>
> +#include <drm/drm_damage_helper.h>
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_gem.h>
>  #include <drm/drm_gem_atomic_helper.h>
> @@ -117,6 +118,7 @@ intel_plane_duplicate_state(struct drm_plane *plane)
>  	intel_state->ggtt_vma = NULL;
>  	intel_state->dpt_vma = NULL;
>  	intel_state->flags = 0;
> +	intel_state->damage = DRM_RECT_INIT(0, 0, 0, 0);
>  
>  	/* add reference to fb */
>  	if (intel_state->hw.fb)
> @@ -322,6 +324,27 @@ static void intel_plane_clear_hw_state(struct intel_plane_state *plane_state)
>  	memset(&plane_state->hw, 0, sizeof(plane_state->hw));
>  }
>  
> +static void
> +intel_plane_copy_uapi_plane_damage(struct intel_plane_state *new_plane_state,
> +				   const struct intel_plane_state *old_uapi_plane_state,
> +				   const struct intel_plane_state *new_uapi_plane_state)
> +{
> +	struct intel_display *display = to_intel_display(new_plane_state);
> +	struct drm_rect *damage = &new_plane_state->damage;
> +
> +	/* damage property tracking enabled from display version 12 onwards */
> +	if (DISPLAY_VER(display) < 12) {
> +		*damage = DRM_RECT_INIT(0, 0, 0, 0);
> +		return;
> +	}

I don't think that is needed. If we have no damage prop then the helper
will give us full damage.

> +
> +	if (!drm_atomic_helper_damage_merged(&old_uapi_plane_state->uapi,
> +					     &new_uapi_plane_state->uapi,
> +					     damage))
> +		/* Incase helper fails, mark whole plane region as damage */
> +		*damage = drm_plane_state_src(&new_uapi_plane_state->uapi);
> +}
> +
>  void intel_plane_copy_uapi_to_hw_state(struct intel_plane_state *plane_state,
>  				       const struct intel_plane_state *from_plane_state,
>  				       struct intel_crtc *crtc)
> @@ -691,6 +714,7 @@ int intel_plane_atomic_check(struct intel_atomic_state *state,
>  	const struct intel_plane_state *old_plane_state =
>  		intel_atomic_get_old_plane_state(state, plane);
>  	const struct intel_plane_state *new_primary_crtc_plane_state;
> +	const struct intel_plane_state *old_primary_crtc_plane_state;
>  	struct intel_crtc *crtc = intel_crtc_for_pipe(display, plane->pipe);
>  	const struct intel_crtc_state *old_crtc_state =
>  		intel_atomic_get_old_crtc_state(state, crtc);
> @@ -705,10 +729,17 @@ int intel_plane_atomic_check(struct intel_atomic_state *state,
>  
>  		new_primary_crtc_plane_state =
>  			intel_atomic_get_new_plane_state(state, primary_crtc_plane);
> +		old_primary_crtc_plane_state =
> +			intel_atomic_get_old_plane_state(state, primary_crtc_plane);
>  	} else {
>  		new_primary_crtc_plane_state = new_plane_state;
> +		old_primary_crtc_plane_state = old_plane_state;
>  	}
>  
> +	intel_plane_copy_uapi_plane_damage(new_plane_state,
> +					   old_primary_crtc_plane_state,
> +					   new_primary_crtc_plane_state);
> +
>  	intel_plane_copy_uapi_to_hw_state(new_plane_state,
>  					  new_primary_crtc_plane_state,
>  					  crtc);
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index 6a82c6ade549..844f92ea4f45 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -697,6 +697,8 @@ struct intel_plane_state {
>  	u64 ccval;
>  
>  	const char *no_fbc_reason;
> +
> +	struct drm_rect damage;
>  };
>  
>  struct intel_initial_plane_config {
> diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> index eb85d3d6cdc3..3e3c22a26357 100644
> --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> @@ -2260,6 +2260,44 @@ static void check_protection(struct intel_plane_state *plane_state)
>  		!plane_state->decrypt;
>  }
>  
> +static void
> +make_damage_viewport_relative(struct intel_plane_state *plane_state)
> +{
> +	const struct drm_framebuffer *fb = plane_state->hw.fb;
> +	const struct drm_rect *src = &plane_state->uapi.src;
> +	unsigned int rotation = plane_state->hw.rotation;
> +	struct drm_rect *damage = &plane_state->damage;
> +
> +	if (!drm_rect_visible(damage))
> +		return;
> +
> +	if (!fb || !plane_state->uapi.visible) {
> +		plane_state->damage = DRM_RECT_INIT(0, 0, 0, 0);
> +		return;
> +	}
> +
> +	if (drm_rotation_90_or_270(rotation)) {
> +		drm_rect_rotate(damage, fb->width, fb->height,
> +				DRM_MODE_ROTATE_270);
> +		drm_rect_translate(damage, -(src->y1 >> 16), -(src->x1 >> 16));
> +	} else {
> +		drm_rect_translate(damage, -(src->x1 >> 16), -(src->y1 >> 16));
> +	}
> +}
> +
> +static void clip_damage(struct intel_plane_state *plane_state)
> +{
> +	struct drm_rect *damage = &plane_state->damage;
> +	struct drm_rect src;
> +
> +	if (!drm_rect_visible(damage))
> +		return;
> +
> +	drm_rect_fp_to_int(&src, &plane_state->uapi.src);
> +	drm_rect_translate(damage, src.x1, src.y1);
> +	drm_rect_intersect(damage, &src);
> +}
> +
>  static int skl_plane_check(struct intel_crtc_state *crtc_state,
>  			   struct intel_plane_state *plane_state)
>  {
> @@ -2285,6 +2323,8 @@ static int skl_plane_check(struct intel_crtc_state *crtc_state,
>  	if (ret)
>  		return ret;
>  
> +	make_damage_viewport_relative(plane_state);
> +
>  	ret = skl_check_plane_surface(plane_state);
>  	if (ret)
>  		return ret;
> @@ -2300,6 +2340,8 @@ static int skl_plane_check(struct intel_crtc_state *crtc_state,
>  	if (ret)
>  		return ret;
>  
> +	clip_damage(plane_state);
> +
>  	ret = skl_plane_check_nv12_rotation(plane_state);
>  	if (ret)
>  		return ret;
> @@ -2307,8 +2349,10 @@ static int skl_plane_check(struct intel_crtc_state *crtc_state,
>  	check_protection(plane_state);
>  
>  	/* HW only has 8 bits pixel precision, disable plane if invisible */
> -	if (!(plane_state->hw.alpha >> 8))
> +	if (!(plane_state->hw.alpha >> 8)) {
>  		plane_state->uapi.visible = false;
> +		plane_state->damage = DRM_RECT_INIT(0, 0, 0, 0);
> +	}
>  
>  	plane_state->ctl = skl_plane_ctl(crtc_state, plane_state);
>  
> -- 
> 2.43.0

-- 
Ville Syrjälä
Intel
