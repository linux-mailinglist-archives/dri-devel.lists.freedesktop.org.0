Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7EB8D1963
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 13:28:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3B9910FD7D;
	Tue, 28 May 2024 11:27:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VjA4+C4U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D68EA10ED5A;
 Tue, 28 May 2024 11:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716895670; x=1748431670;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Tlf9mGFHqEQtdTqCDknBhZRix/3FW09q9e4CUTE9Lkc=;
 b=VjA4+C4UJX6wYon607PlRg8ZaCp5XyUgd86KlI6YdCue/UGJsQGcf8O5
 19fikPVcJIhoWQqyzhZUINW0YGFQOw8asP+o86wuohag5L/oROORRd3pz
 r+voL/QbGtvx8w5IC27Lz8uiLmC7xKbsaWBtYHVLqA2xgxrCBwveGYQt9
 AQrYsXZAT7c1Ubc90Fhai1mIMsNEf7MwIahiiJHW61UDeRCGAhwd9WLgZ
 s2+3oTAuZCStAHKUcMMigdly5A0FsqsGn4l/SlJQ0mWlabR3rwVUH6YBw
 IRf5wYBuIICbhAbPgP2ry8ENWYEx5uimwhV5ZwE7Qd2eM1rVsBIhCpr6S w==;
X-CSE-ConnectionGUID: 2dJtQ5pLThGtoGPuYPjI1w==
X-CSE-MsgGUID: Eve0IL7DQiGpRMZCdjTiiA==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13355033"
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; d="scan'208";a="13355033"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 04:27:50 -0700
X-CSE-ConnectionGUID: QPL/0V3qSxGH0FeXp0ldWA==
X-CSE-MsgGUID: ENmxweN4Q6yOG6NZVcnyIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; d="scan'208";a="65874017"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 04:27:48 -0700
Date: Tue, 28 May 2024 14:27:52 +0300
From: Imre Deak <imre.deak@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 4/9] drm/i915: Introduce fb->min_alignment
Message-ID: <ZlW/uMCDFles0dyv@ideak-desk.fi.intel.com>
References: <20240513175942.12910-1-ville.syrjala@linux.intel.com>
 <20240513175942.12910-5-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240513175942.12910-5-ville.syrjala@linux.intel.com>
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

On Mon, May 13, 2024 at 08:59:37PM +0300, Ville Syrjala wrote:
> From: Ville Syrj�l� <ville.syrjala@linux.intel.com>
> 
> Different planes could have different alignment requirements
> even for the same format/modifier. Collect the alignment
> requirements across all planes capable of scanning out the
> fb such that the alignment used when pinning the normal ggtt
> view is satisfactory to all those planes.
> 
> When pinning per-plane views we only have to satisfy the
> alignment requirements of the specific plane.
> 
> Signed-off-by: Ville Syrj�l� <ville.syrjala@linux.intel.com>
> ---
>  .../drm/i915/display/intel_display_types.h    |  2 ++
>  drivers/gpu/drm/i915/display/intel_fb.c       | 23 ++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_fb_pin.c   | 27 +++++++++++++++++--
>  drivers/gpu/drm/i915/display/intel_fbdev.c    | 18 +------------
>  4 files changed, 51 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index 40d6e5f4c350..58bb65832adf 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -145,6 +145,8 @@ struct intel_framebuffer {
>  	};
>  
>  	struct i915_address_space *dpt_vm;
> +
> +	unsigned int min_alignment;
>  };
>  
>  enum intel_hotplug_state {
> diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
> index 3f3a9cd534f4..c5bae05cbbc3 100644
> --- a/drivers/gpu/drm/i915/display/intel_fb.c
> +++ b/drivers/gpu/drm/i915/display/intel_fb.c
> @@ -10,6 +10,7 @@
>  #include <linux/dma-resv.h>
>  
>  #include "i915_drv.h"
> +#include "intel_atomic_plane.h"
>  #include "intel_display.h"
>  #include "intel_display_types.h"
>  #include "intel_dpt.h"
> @@ -1616,6 +1617,26 @@ bool intel_fb_supports_90_270_rotation(const struct intel_framebuffer *fb)
>  	       fb->base.modifier == I915_FORMAT_MOD_Yf_TILED;
>  }
>  
> +static unsigned int intel_fb_min_alignment(const struct drm_framebuffer *fb)
> +{
> +	struct drm_i915_private *i915 = to_i915(fb->dev);
> +	struct intel_plane *plane;
> +	unsigned int min_alignment = 0;
> +
> +	for_each_intel_plane(&i915->drm, plane) {
> +		if (!drm_plane_has_format(&plane->base, fb->format->format, fb->modifier))
> +			continue;
> +
> +		if (intel_plane_needs_physical(plane))
> +			continue;
> +
> +		min_alignment = max(min_alignment,
> +				    plane->min_alignment(plane, fb, 0));
> +	}
> +
> +	return min_alignment;
> +}
> +
>  int intel_fill_fb_info(struct drm_i915_private *i915, struct intel_framebuffer *fb)
>  {
>  	struct drm_i915_gem_object *obj = intel_fb_obj(&fb->base);
> @@ -1698,6 +1719,8 @@ int intel_fill_fb_info(struct drm_i915_private *i915, struct intel_framebuffer *
>  		return -EINVAL;
>  	}
>  
> +	fb->min_alignment = intel_fb_min_alignment(&fb->base);
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/i915/display/intel_fb_pin.c b/drivers/gpu/drm/i915/display/intel_fb_pin.c
> index 9b0f1ea41b70..1ae02de906f5 100644
> --- a/drivers/gpu/drm/i915/display/intel_fb_pin.c
> +++ b/drivers/gpu/drm/i915/display/intel_fb_pin.c
> @@ -230,13 +230,36 @@ void intel_fb_unpin_vma(struct i915_vma *vma, unsigned long flags)
>  	i915_vma_put(vma);
>  }
>  
> +static bool gtt_view_is_per_plane(const struct intel_plane_state *plane_state)
> +{
> +	const struct intel_framebuffer *fb = to_intel_framebuffer(plane_state->hw.fb);
> +
> +	if (plane_state->view.gtt.type == I915_GTT_VIEW_REMAPPED &&
> +	    intel_fb_needs_pot_stride_remap(fb))
> +		return false;

The above view is created only once for the FB, I suppose this is how
you differentiate it from views created each time due to a stride
limit (based on intel_plane_needs_remap()).

> +
> +	return plane_state->view.gtt.type != I915_GTT_VIEW_NORMAL;

So the rotated and remapped views created for a stride limit are
per-plane based on the above. There is also a rotated view created only
once for the FB, is it intentional to regard this kind of view as
per-plane as well?

> +}
> +
>  static unsigned int
>  intel_plane_fb_min_alignment(const struct intel_plane_state *plane_state)
>  {
>  	struct intel_plane *plane = to_intel_plane(plane_state->uapi.plane);
> -	const struct drm_framebuffer *fb = plane_state->hw.fb;
> +	const struct intel_framebuffer *fb = to_intel_framebuffer(plane_state->hw.fb);
>  
> -	return plane->min_alignment(plane, fb, 0);
> +	/*
> +	 * Only use plane specific alignment for binding
> +	 * a per-plane gtt view (remapped or rotated),
> +	 * otherwise make sure the alignment is suitable
> +	 * for all planes.
> +	 */
> +	if (!gtt_view_is_per_plane(plane_state))
> +		return fb->min_alignment;
> +
> +	if (intel_plane_needs_physical(plane))
> +		return 0;

I guess the above is ok, though looks like an unrelated change: the
cursor plane min_alignment() for relevant platforms is <= 4k, which will
be rounded up to 4k anyway when binding the vma.

> +
> +	return plane->min_alignment(plane, &fb->base, 0);

The commit could've had more details about the rational for the above.
As I understand it avoids having to rebind the vma for different plane
types, though this is already handled to some degree by
i915_vma::display_alignment.

>  }
>  
>  static unsigned int
> diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
> index ff685aebbd1a..124aac172acb 100644
> --- a/drivers/gpu/drm/i915/display/intel_fbdev.c
> +++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
> @@ -46,7 +46,6 @@
>  #include "gem/i915_gem_mman.h"
>  
>  #include "i915_drv.h"
> -#include "intel_crtc.h"
>  #include "intel_display_types.h"
>  #include "intel_fb.h"
>  #include "intel_fb_pin.h"
> @@ -172,21 +171,6 @@ static const struct fb_ops intelfb_ops = {
>  
>  __diag_pop();
>  
> -static unsigned int intel_fbdev_min_alignment(const struct drm_framebuffer *fb)
> -{
> -	struct drm_i915_private *i915 = to_i915(fb->dev);
> -	struct intel_plane *plane;
> -	struct intel_crtc *crtc;
> -
> -	crtc = intel_first_crtc(i915);
> -	if (!crtc)
> -		return 0;
> -
> -	plane = to_intel_plane(crtc->base.primary);
> -
> -	return plane->min_alignment(plane, fb, 0);
> -}
> -
>  static int intelfb_create(struct drm_fb_helper *helper,
>  			  struct drm_fb_helper_surface_size *sizes)
>  {
> @@ -244,7 +228,7 @@ static int intelfb_create(struct drm_fb_helper *helper,
>  	 * BIOS is suitable for own access.
>  	 */
>  	vma = intel_fb_pin_to_ggtt(&fb->base, &view,
> -				   intel_fbdev_min_alignment(&fb->base), 0,
> +				   fb->min_alignment, 0,
>  				   false, &flags);
>  	if (IS_ERR(vma)) {
>  		ret = PTR_ERR(vma);
> -- 
> 2.43.2
> 
