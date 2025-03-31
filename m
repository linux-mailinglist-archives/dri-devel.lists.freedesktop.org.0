Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DD4A76B05
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 17:46:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87FB510E428;
	Mon, 31 Mar 2025 15:45:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FfIF4HeE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 665ED10E426;
 Mon, 31 Mar 2025 15:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743435955; x=1774971955;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=0ZvM9nQyOktN/9qs5Yyft/XiOmjbte6J62i8UR09Ovo=;
 b=FfIF4HeEIeB7htyWGnOTFuhXMMjukWCy1yIJSiAocltp+O3HAs/HxtX/
 qElO+LLbevsH+xtpz8aeCBMCEdl5Z7NAjEUJLA0nHQ9nku8eCo7Sfgv4L
 aeyhyEi5keGehn+ueOQyMFcjS84XYZpQZKAtu/X9vwJKZz8NCO5c7H1Zu
 WHuF4Xk/7PuHXgmggSnWzkqZgNk0sUV1Ty8dM00qfafP7jf7YDfFJwfuB
 8X6he3yD86CtCYmLt8+EzaNPTEs0ySBwUzr27F4ORNFIsUj/RO/VVa4kL
 RfVtRMpmoy6KJCFGDQSYzn1HcV0uZC+tTzbocGpgDsR+gC2wOu9yz8yT6 g==;
X-CSE-ConnectionGUID: +TOAzbxyTvKMQXLqpn4D8g==
X-CSE-MsgGUID: ZxqbpJlUS2qZMmhXJirLfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="43979363"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="43979363"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 08:45:52 -0700
X-CSE-ConnectionGUID: 45AeX7XHSbiMfWOfT15iig==
X-CSE-MsgGUID: 22lGlnWdQZaa0DVqP5OMgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="131338881"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orviesa005.jf.intel.com with SMTP; 31 Mar 2025 08:45:49 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 31 Mar 2025 18:45:47 +0300
Date: Mon, 31 Mar 2025 18:45:47 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Arun R Murthy <arun.r.murthy@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 chaitanya.kumar.borah@intel.com, ville.syrjala@intel.com
Subject: Re: [PATCH v11 3/5] drm/i915/display: Acomodate format check in
 intel_plane_can_async_flip()
Message-ID: <Z-q4q5js59CS3kxB@intel.com>
References: <20250328-asyn-v11-0-a50d13bfea0d@intel.com>
 <20250328-asyn-v11-3-a50d13bfea0d@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250328-asyn-v11-3-a50d13bfea0d@intel.com>
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

On Fri, Mar 28, 2025 at 09:26:22PM +0530, Arun R Murthy wrote:
> The function intel_plane_can_async_flip() checks for async supported
> modifier, add format support check also in the same function.
> 
> Note: on ADL the surface base addr is required to be 16k aligned and if
> not might generate DMAR and GGTT faults leading to glitches.

What we want to highlight is that this *changes* the alignment from
16K to 4K for planar formats on ADL.

> 
> v11: Move filtering Indexed 8bit to a separate patch (Ville)
> v12: correct the commit msg and remove unwanted debug print (Ville)
> 
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> ---
>  drivers/gpu/drm/i915/display/i9xx_plane.c          |  4 ++--
>  drivers/gpu/drm/i915/display/intel_atomic_plane.c  |  6 +++++-
>  drivers/gpu/drm/i915/display/intel_atomic_plane.h  |  3 ++-
>  drivers/gpu/drm/i915/display/intel_display.c       | 14 ++++----------
>  drivers/gpu/drm/i915/display/skl_universal_plane.c |  2 +-
>  5 files changed, 14 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/i9xx_plane.c b/drivers/gpu/drm/i915/display/i9xx_plane.c
> index 5e8344fdfc28a311dc0632bb848a0e08f9e6c6d2..20c47de6d8bfd1d8ddafae02ed68370df799e22b 100644
> --- a/drivers/gpu/drm/i915/display/i9xx_plane.c
> +++ b/drivers/gpu/drm/i915/display/i9xx_plane.c
> @@ -828,7 +828,7 @@ unsigned int vlv_plane_min_alignment(struct intel_plane *plane,
>  {
>  	struct intel_display *display = to_intel_display(plane);
>  
> -	if (intel_plane_can_async_flip(plane, fb->modifier))
> +	if (intel_plane_can_async_flip(plane, fb->format->format, fb->modifier))
>  		return 256 * 1024;
>  
>  	/* FIXME undocumented so not sure what's actually needed */
> @@ -852,7 +852,7 @@ static unsigned int g4x_primary_min_alignment(struct intel_plane *plane,
>  {
>  	struct intel_display *display = to_intel_display(plane);
>  
> -	if (intel_plane_can_async_flip(plane, fb->modifier))
> +	if (intel_plane_can_async_flip(plane, fb->format->format, fb->modifier))
>  		return 256 * 1024;
>  
>  	if (intel_scanout_needs_vtd_wa(display))
> diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> index 7276179df878658b7053fe6d8dc37b69f19625e3..1ec730047759cb22b3e0fabfd2eaddbc1bc865af 100644
> --- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> +++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> @@ -174,8 +174,12 @@ bool intel_plane_needs_physical(struct intel_plane *plane)
>  		DISPLAY_INFO(display)->cursor_needs_physical;
>  }
>  
> -bool intel_plane_can_async_flip(struct intel_plane *plane, u64 modifier)
> +bool intel_plane_can_async_flip(struct intel_plane *plane, u32 format,
> +				u64 modifier)
>  {
> +	if (intel_format_info_is_yuv_semiplanar(drm_format_info(format), modifier))
> +		return false;
> +
>  	return plane->can_async_flip && plane->can_async_flip(modifier);
>  }
>  
> diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.h b/drivers/gpu/drm/i915/display/intel_atomic_plane.h
> index 6efac923dcbc757e6f68564cbef2919c920f13cb..772a12aa9c6997d77b9393f964e91f3e8747d149 100644
> --- a/drivers/gpu/drm/i915/display/intel_atomic_plane.h
> +++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.h
> @@ -21,7 +21,8 @@ enum plane_id;
>  
>  struct intel_plane *
>  intel_crtc_get_plane(struct intel_crtc *crtc, enum plane_id plane_id);
> -bool intel_plane_can_async_flip(struct intel_plane *plane, u64 modifier);
> +bool intel_plane_can_async_flip(struct intel_plane *plane, u32 format,
> +				u64 modifier);
>  unsigned int intel_adjusted_rate(const struct drm_rect *src,
>  				 const struct drm_rect *dst,
>  				 unsigned int rate);
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 103173836abf9ea3a9094d2726d3dfbc94023ea6..542fe21a1f32588a8f4d9e133475b15c4132c4c9 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -5998,22 +5998,16 @@ static int intel_async_flip_check_hw(struct intel_atomic_state *state, struct in
>  		if (!plane->async_flip)
>  			continue;
>  
> -		if (!intel_plane_can_async_flip(plane, new_plane_state->hw.fb->modifier)) {
> +		if (!intel_plane_can_async_flip(plane, new_plane_state->hw.fb->format->format,
> +						new_plane_state->hw.fb->modifier)) {
>  			drm_dbg_kms(display->drm,
> -				    "[PLANE:%d:%s] Modifier 0x%llx does not support async flip\n",
> +				    "[PLANE:%d:%s] Format %p4cc Modifier 0x%llx does not support async flip\n",

I would make that

"... pixel format %p4cc / modifier 0x%llx ..."

to be consistent with some existing printk in intel_fb.c.

Apart from those lgtm
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>


>  				    plane->base.base.id, plane->base.name,
> +				    &new_plane_state->hw.fb->format->format,
>  				    new_plane_state->hw.fb->modifier);
>  			return -EINVAL;
>  		}
>  
> -		if (intel_format_info_is_yuv_semiplanar(new_plane_state->hw.fb->format,
> -							new_plane_state->hw.fb->modifier)) {
> -			drm_dbg_kms(display->drm,
> -				    "[PLANE:%d:%s] Planar formats do not support async flips\n",
> -				    plane->base.base.id, plane->base.name);
> -			return -EINVAL;
> -		}
> -
>  		/*
>  		 * We turn the first async flip request into a sync flip
>  		 * so that we can reconfigure the plane (eg. change modifier).
> diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> index 8739195aba696d13b30e1b978c8b2bb5e188119b..8f6170a5c108a000582f3415f78bad279254d8cf 100644
> --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> @@ -601,7 +601,7 @@ static u32 tgl_plane_min_alignment(struct intel_plane *plane,
>  	 * Figure out what's going on here...
>  	 */
>  	if (display->platform.alderlake_p &&
> -	    intel_plane_can_async_flip(plane, fb->modifier))
> +	    intel_plane_can_async_flip(plane, fb->format->format, fb->modifier))
>  		return mult * 16 * 1024;
>  
>  	switch (fb->modifier) {
> 
> -- 
> 2.25.1

-- 
Ville Syrjälä
Intel
