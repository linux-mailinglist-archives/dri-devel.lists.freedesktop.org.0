Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B436AF0329
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 20:50:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC03410E611;
	Tue,  1 Jul 2025 18:49:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Nwn7zXqM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D10C10E60C;
 Tue,  1 Jul 2025 18:49:58 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 583397E0;
 Tue,  1 Jul 2025 20:49:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1751395774;
 bh=btjGnMDX8vkqk6UaF2hfFA+4qDJCCMOKBK3eO0iMlX8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Nwn7zXqMeB9/9GedyWwwtywMnm/Elch7my/uYCtDmOZg4dgFPXSOp0U1JByVGIWZN
 P2BXuKimywD6rtoSSmy12cEEP0MDYZvrPzjRhs+jxhepj5hADabIe5Rv6hYsM9nGy8
 Qf7F1fWg4r/4HFQWsVaHy4M9KIOkIhBtZAlA8ddU=
Date: Tue, 1 Jul 2025 21:49:30 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 01/19] drm: Pass pixel_format+modifier to
 .get_format_info()
Message-ID: <20250701184930.GA16835@pendragon.ideasonboard.com>
References: <20250701090722.13645-1-ville.syrjala@linux.intel.com>
 <20250701090722.13645-2-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250701090722.13645-2-ville.syrjala@linux.intel.com>
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

On Tue, Jul 01, 2025 at 12:07:04PM +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Decouple .get_format_info() from struct drm_mode_fb_cmd2 and just
> pass the pixel format+modifier combo in by hand.
> 
> We may want to use .get_format_info() outside of the normal
> addfb paths where we won't have a struct drm_mode_fb_cmd2, and
> creating a temporary one just for this seems silly.
> 
> v2: Fix intel_fb_get_format_info() docs (Laurent)
> 
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Rodrigo Siqueira <siqueira@igalia.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c   |  4 ++--
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.h   |  2 +-
>  drivers/gpu/drm/drm_fourcc.c                          |  3 ++-
>  drivers/gpu/drm/i915/display/intel_fb.c               | 11 ++++++-----
>  drivers/gpu/drm/i915/display/intel_fb.h               |  2 +-
>  include/drm/drm_mode_config.h                         |  2 +-
>  6 files changed, 13 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> index b7c6e8d13435..eef51652ca35 100644
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
> index 2890e889dd15..4b4444f6d504 100644
> --- a/drivers/gpu/drm/drm_fourcc.c
> +++ b/drivers/gpu/drm/drm_fourcc.c
> @@ -430,7 +430,8 @@ drm_get_format_info(struct drm_device *dev,
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
> index 6158031821fd..52c4901dc072 100644
> --- a/drivers/gpu/drm/i915/display/intel_fb.c
> +++ b/drivers/gpu/drm/i915/display/intel_fb.c
> @@ -422,21 +422,22 @@ unsigned int intel_fb_modifier_to_tiling(u64 fb_modifier)
>  
>  /**
>   * intel_fb_get_format_info: Get a modifier specific format information
> - * @cmd: FB add command structure
> + * @pixel_format: pixel format
> + * @modifier: modifier
>   *
>   * Returns:
> - * Returns the format information for @cmd->pixel_format specific to @cmd->modifier[0],
> + * Returns the format information for @pixel_format specific to @modifier,
>   * or %NULL if the modifier doesn't override the format.
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
> index 9e524b51a001..e971e1b8a850 100644
> --- a/include/drm/drm_mode_config.h
> +++ b/include/drm/drm_mode_config.h
> @@ -95,7 +95,7 @@ struct drm_mode_config_funcs {
>  	 * The format information specific to the given fb metadata, or
>  	 * NULL if none is found.
>  	 */
> -	const struct drm_format_info *(*get_format_info)(const struct drm_mode_fb_cmd2 *mode_cmd);
> +	const struct drm_format_info *(*get_format_info)(u32 pixel_format, u64 modifier);
>  
>  	/**
>  	 * @mode_valid:

-- 
Regards,

Laurent Pinchart
