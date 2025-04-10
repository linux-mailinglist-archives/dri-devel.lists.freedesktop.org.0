Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E381AA84CFC
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 21:28:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8104810EA07;
	Thu, 10 Apr 2025 19:28:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UcHEroE3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D73AA10E057;
 Thu, 10 Apr 2025 19:28:14 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 69CDB352;
 Thu, 10 Apr 2025 21:26:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1744313172;
 bh=n5YDJmJCE+8tNXLCkkhfeEwPTl/eXzYaXNhwX3cdLAo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UcHEroE3IoHtAiaCtxVRX7fr9fWrFoJzEv1ddztAMoaWEKnj5ZKhV9GSpCDPtVVAs
 hnm0vMVQNNd2wRUSDshcQb9TSoa3+nAbq3dpvSTcgp5BwLGwOrJGZD1BQ0D5B0EjmR
 vTyjAqOJ5mBBsCZ0uqhCdhTtjIuBQ7t8IXecWXOk=
Date: Thu, 10 Apr 2025 22:27:45 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH 01/19] drm: Pass pixel_format+modifier to
 .get_format_info()
Message-ID: <20250410192745.GA27834@pendragon.ideasonboard.com>
References: <20250410163218.15130-1-ville.syrjala@linux.intel.com>
 <20250410163218.15130-2-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250410163218.15130-2-ville.syrjala@linux.intel.com>
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

Hi Ville,

Thank you for the patch.

On Thu, Apr 10, 2025 at 07:32:00PM +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Decouple .get_format_info() from struct drm_mode_fb_cmd2 and just
> pass the pixel format+modifier combo in by hand.
> 
> We may want to use .get_format_info() outside of the normal
> addfb paths where we won't have a struct drm_mode_fb_cmd2, and
> creating a temporary one just for this seems silly.
> 
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Rodrigo Siqueira <siqueira@igalia.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 4 ++--
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.h | 2 +-
>  drivers/gpu/drm/drm_fourcc.c                            | 3 ++-
>  drivers/gpu/drm/i915/display/intel_fb.c                 | 9 +++++----
>  drivers/gpu/drm/i915/display/intel_fb.h                 | 2 +-
>  include/drm/drm_mode_config.h                           | 2 +-
>  6 files changed, 12 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> index 3e0f45f1711c..69d715b6abd3 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> @@ -92,9 +92,9 @@ enum dm_micro_swizzle {
>  	MICRO_SWIZZLE_R = 3
>  };
>  
> -const struct drm_format_info *amdgpu_dm_plane_get_format_info(const struct drm_mode_fb_cmd2 *cmd)
> +const struct drm_format_info *amdgpu_dm_plane_get_format_info(u32 pixel_format, u64 modifier)
>  {
> -	return amdgpu_lookup_format_info(cmd->pixel_format, cmd->modifier[0]);
> +	return amdgpu_lookup_format_info(pixel_format, modifier);
>  }
>  
>  void amdgpu_dm_plane_fill_blending_from_plane_state(const struct drm_plane_state *plane_state,
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.h
> index 615d2ab2b803..ea2619b507db 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.h
> @@ -58,7 +58,7 @@ int amdgpu_dm_plane_init(struct amdgpu_display_manager *dm,
>  			 unsigned long possible_crtcs,
>  			 const struct dc_plane_cap *plane_cap);
>  
> -const struct drm_format_info *amdgpu_dm_plane_get_format_info(const struct drm_mode_fb_cmd2 *cmd);
> +const struct drm_format_info *amdgpu_dm_plane_get_format_info(u32 pixel_format, u64 modifier);
>  
>  void amdgpu_dm_plane_fill_blending_from_plane_state(const struct drm_plane_state *plane_state,
>  				    bool *per_pixel_alpha, bool *pre_multiplied_alpha,
> diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
> index 3a94ca211f9c..f79fff8209fd 100644
> --- a/drivers/gpu/drm/drm_fourcc.c
> +++ b/drivers/gpu/drm/drm_fourcc.c
> @@ -395,7 +395,8 @@ drm_get_format_info(struct drm_device *dev,
>  	const struct drm_format_info *info = NULL;
>  
>  	if (dev->mode_config.funcs->get_format_info)
> -		info = dev->mode_config.funcs->get_format_info(mode_cmd);
> +		info = dev->mode_config.funcs->get_format_info(mode_cmd->pixel_format,
> +							       mode_cmd->modifier[0]);
>  
>  	if (!info)
>  		info = drm_format_info(mode_cmd->pixel_format);
> diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
> index 2b0e0f220442..b83c42fe3233 100644
> --- a/drivers/gpu/drm/i915/display/intel_fb.c
> +++ b/drivers/gpu/drm/i915/display/intel_fb.c
> @@ -421,21 +421,22 @@ unsigned int intel_fb_modifier_to_tiling(u64 fb_modifier)
>  
>  /**
>   * intel_fb_get_format_info: Get a modifier specific format information
> - * @cmd: FB add command structure
> + * @pixel_format: pixel format
> + * @modifier: modifier
>   *
>   * Returns:
>   * Returns the format information for @cmd->pixel_format specific to @cmd->modifier[0],
>   * or %NULL if the modifier doesn't override the format.

This needs to be updated too.

>   */
>  const struct drm_format_info *
> -intel_fb_get_format_info(const struct drm_mode_fb_cmd2 *cmd)
> +intel_fb_get_format_info(u32 pixel_format, u64 modifier)
>  {
> -	const struct intel_modifier_desc *md = lookup_modifier_or_null(cmd->modifier[0]);
> +	const struct intel_modifier_desc *md = lookup_modifier_or_null(modifier);
>  
>  	if (!md || !md->formats)
>  		return NULL;
>  
> -	return lookup_format_info(md->formats, md->format_count, cmd->pixel_format);
> +	return lookup_format_info(md->formats, md->format_count, pixel_format);
>  }
>  
>  static bool plane_caps_contain_any(u8 caps, u8 mask)
> diff --git a/drivers/gpu/drm/i915/display/intel_fb.h b/drivers/gpu/drm/i915/display/intel_fb.h
> index bdd76b372957..7d1267fbeee2 100644
> --- a/drivers/gpu/drm/i915/display/intel_fb.h
> +++ b/drivers/gpu/drm/i915/display/intel_fb.h
> @@ -47,7 +47,7 @@ u64 *intel_fb_plane_get_modifiers(struct intel_display *display,
>  bool intel_fb_plane_supports_modifier(struct intel_plane *plane, u64 modifier);
>  
>  const struct drm_format_info *
> -intel_fb_get_format_info(const struct drm_mode_fb_cmd2 *cmd);
> +intel_fb_get_format_info(u32 pixel_format, u64 modifier);
>  
>  bool
>  intel_format_info_is_yuv_semiplanar(const struct drm_format_info *info,
> diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
> index 4b8f0370b79b..6fca0362bc31 100644
> --- a/include/drm/drm_mode_config.h
> +++ b/include/drm/drm_mode_config.h
> @@ -95,7 +95,7 @@ struct drm_mode_config_funcs {
>  	 * The format information specific to the given fb metadata, or
>  	 * NULL if none is found.

And here too. The full documentation block states

	/**
	 * @get_format_info:
	 *
	 * Allows a driver to return custom format information for special
	 * fb layouts (eg. ones with auxiliary compression control planes).
	 *
	 * RETURNS:
	 *
	 * The format information specific to the given fb metadata, or
	 * NULL if none is found.
	 */

Updating the RETURNS section is easy, but the text before that is
problematic. If the intent was to support formats with auxialiary
compression control planes, this won't be possible anymore if we pass
cmd->modifier[0] only. Is that an issue, or was this a foreseen use case
that never materialized ? If we don't need to support this anymore then
the code change is fine, and the documentation should be updated
accordingly.

>  	 */
> -	const struct drm_format_info *(*get_format_info)(const struct drm_mode_fb_cmd2 *mode_cmd);
> +	const struct drm_format_info *(*get_format_info)(u32 pixel_format, u64 modifier);
>  
>  	/**
>  	 * @mode_valid:

-- 
Regards,

Laurent Pinchart
