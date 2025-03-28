Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6C4A74879
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 11:40:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9728E10E9D7;
	Fri, 28 Mar 2025 10:40:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hVjHxeHq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B66810E0F5;
 Fri, 28 Mar 2025 10:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743158433; x=1774694433;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=2ErVrw9cEWwe4CiiYrVId3nwpYWgV69DWk92imr9Ndg=;
 b=hVjHxeHqWcNqR8cSEL8+RE6SeL/WStFLIA6xSqr2/eRp50kQSMmo5EaF
 yo5Mv7Lf6WurNHv1D/1yiv0KVB7J9z9DcIchjjJ6fzH1lEX0g/nHq+E2w
 0w73IMkK/L9H7Z7B6Sn/MRzocz2bT7MJStdUigP0szRSgi/8Xx8kXny1v
 9RiRm1B3AQyhwpkYsEbbQ4vfhJO83RGyCliGk0SO61JMy4X3SYHxWTim+
 UrgldLAydb+QcoWe4BP5Fei2xWugrqSJcxx83UudArZB68NhX0dR++YiN
 2XGJSSxT78HuZ95i05KxnQAesNBUXfA9Mv+h6rOBY9FpNFVJ6ORr6naQm A==;
X-CSE-ConnectionGUID: QQdRzbwWSFqpmfONHfIRjA==
X-CSE-MsgGUID: vZ8/SkdQRcCCwV3COpMqaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="55884437"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="55884437"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 03:40:32 -0700
X-CSE-ConnectionGUID: 7pk0WlGYSRScqQHLTkRBlA==
X-CSE-MsgGUID: aOQDgJh/ToODbJYGtuFOaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="130621021"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orviesa005.jf.intel.com with SMTP; 28 Mar 2025 03:40:29 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 28 Mar 2025 12:40:28 +0200
Date: Fri, 28 Mar 2025 12:40:28 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Arun R Murthy <arun.r.murthy@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 chaitanya.kumar.borah@intel.com, ville.syrjala@intel.com
Subject: Re: [PATCH v10 3/4] drm/i915/display: Acomodate format check in
 can_async_flip()
Message-ID: <Z-Z8nIPjHA1HWu-G@intel.com>
References: <20250328-asyn-v10-0-8b8ad12cfc97@intel.com>
 <20250328-asyn-v10-3-8b8ad12cfc97@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250328-asyn-v10-3-8b8ad12cfc97@intel.com>
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

On Fri, Mar 28, 2025 at 02:59:15PM +0530, Arun R Murthy wrote:
> The function pointer can_async_flip() checks for async supported
> modifier, add format support check also in the same function.
> 
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> ---
>  drivers/gpu/drm/i915/display/i9xx_plane.c          |  4 ++--
>  drivers/gpu/drm/i915/display/intel_atomic_plane.c  | 11 ++++++++++-
>  drivers/gpu/drm/i915/display/intel_atomic_plane.h  |  3 ++-
>  drivers/gpu/drm/i915/display/intel_display.c       | 14 ++++----------
>  drivers/gpu/drm/i915/display/skl_universal_plane.c |  2 +-
>  5 files changed, 19 insertions(+), 15 deletions(-)
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
> index 7276179df878658b7053fe6d8dc37b69f19625e3..5260b9e723af3f654cb36512fe0b5368523082e6 100644
> --- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> +++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> @@ -174,8 +174,17 @@ bool intel_plane_needs_physical(struct intel_plane *plane)
>  		DISPLAY_INFO(display)->cursor_needs_physical;
>  }
>  
> -bool intel_plane_can_async_flip(struct intel_plane *plane, u64 modifier)
> +bool intel_plane_can_async_flip(struct intel_plane *plane, u32 format,
> +				u64 modifier)
>  {
> +	if (intel_format_info_is_yuv_semiplanar(drm_format_info(format), modifier)
> +	    || format == DRM_FORMAT_C8) {

You're still mixing refactoring and functional changes in
one patch. The C8 check needs to be a separate patch.

Also the || goes to the end of the line.

> +		drm_dbg_kms(plane->base.dev,
> +			    "[PLANE:%d:%s] Planar formats do not support async flips\n",
> +			    plane->base.base.id, plane->base.name);
> +		return false;
> +	}
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
> index ee7812126129227971be89d3a79f944155620b03..ff349355ac95a039272f2fe174034ca06a555249 100644
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
