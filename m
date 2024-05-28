Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A728D19D9
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 13:40:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6276B10E079;
	Tue, 28 May 2024 11:40:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jdz+LStv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8299910E00A;
 Tue, 28 May 2024 11:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716896436; x=1748432436;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Paa10C+gblD+Eztj3aUPkTT+EAXZGdu7mF0TWCEPp9A=;
 b=jdz+LStvc5Mf9sYo2rMEp7PY24eE+tF0qpsmHDz3cBjEnmCkaikxeSlS
 211D5ntDwIaIHqExm8OrNsnkuAAdqcCYDaCSqNM5rGrEodNOwDPdCnwcm
 wbUM1aCx9PwkfGa6YuvsTcVQw0dLW1664Vv4WNeKXwgZxmv3bJqWowyIu
 WwZd8eaZeKTf2PverfVjZ29czvq4jN5EtkZ5vyqnqilbSOLbjcSCCIoT/
 VdNPWLkKJPsmhDb38s3hMgLt0IWWiSGu1ep5N86UgJBjZBHeM/aIevL2g
 9ySxRb+UwO77HP5sQ4BcMYnc0G2waBpoPhlihRz+CYphOGFa8IIJUU7r2 g==;
X-CSE-ConnectionGUID: HP9ZXirLQOiH/R9Nm9og3w==
X-CSE-MsgGUID: +sDFmlTuSJ6Eceo/vlvcXg==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="30758782"
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; d="scan'208";a="30758782"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 04:40:35 -0700
X-CSE-ConnectionGUID: OUBzuz/TQmGFLKXkh3Tuyw==
X-CSE-MsgGUID: XHDZ/7DXRfSAQVtXxeCGPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; d="scan'208";a="40011035"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 04:40:34 -0700
Date: Tue, 28 May 2024 14:40:39 +0300
From: Imre Deak <imre.deak@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 5/9] drm/i915: Split cursor alignment to per-platform
 vfuncs
Message-ID: <ZlXCt9z8vNpnQ62H@ideak-desk.fi.intel.com>
References: <20240513175942.12910-1-ville.syrjala@linux.intel.com>
 <20240513175942.12910-6-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240513175942.12910-6-ville.syrjala@linux.intel.com>
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

On Mon, May 13, 2024 at 08:59:38PM +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Split intel_cursor_alignment() into per-platform variants.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reviewed-by: Imre Deak <imre.deak@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_cursor.c | 40 +++++++++++++++++++--
>  drivers/gpu/drm/i915/display/intel_fb.c     | 16 ---------
>  drivers/gpu/drm/i915/display/intel_fb.h     |  3 --
>  3 files changed, 38 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
> index 026975f569a7..737d53c50901 100644
> --- a/drivers/gpu/drm/i915/display/intel_cursor.c
> +++ b/drivers/gpu/drm/i915/display/intel_cursor.c
> @@ -193,6 +193,13 @@ i845_cursor_max_stride(struct intel_plane *plane,
>  	return 2048;
>  }
>  
> +static unsigned int i845_cursor_min_alignment(struct intel_plane *plane,
> +					      const struct drm_framebuffer *fb,
> +					      int color_plane)
> +{
> +	return 32;
> +}
> +
>  static u32 i845_cursor_ctl_crtc(const struct intel_crtc_state *crtc_state)
>  {
>  	u32 cntl = 0;
> @@ -343,6 +350,28 @@ i9xx_cursor_max_stride(struct intel_plane *plane,
>  	return plane->base.dev->mode_config.cursor_width * 4;
>  }
>  
> +static unsigned int i830_cursor_min_alignment(struct intel_plane *plane,
> +					      const struct drm_framebuffer *fb,
> +					      int color_plane)
> +{
> +	/* "AlmadorM Errata – Requires 32-bpp cursor data to be 16KB aligned." */
> +	return 16 * 1024; /* physical */
> +}
> +
> +static unsigned int i85x_cursor_min_alignment(struct intel_plane *plane,
> +					      const struct drm_framebuffer *fb,
> +					      int color_plane)
> +{
> +	return 256; /* physical */
> +}
> +
> +static unsigned int i9xx_cursor_min_alignment(struct intel_plane *plane,
> +					      const struct drm_framebuffer *fb,
> +					      int color_plane)
> +{
> +	return 4 * 1024; /* physical for i915/i945 */
> +}
> +
>  static u32 i9xx_cursor_ctl_crtc(const struct intel_crtc_state *crtc_state)
>  {
>  	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
> @@ -884,20 +913,27 @@ intel_cursor_plane_create(struct drm_i915_private *dev_priv,
>  
>  	if (IS_I845G(dev_priv) || IS_I865G(dev_priv)) {
>  		cursor->max_stride = i845_cursor_max_stride;
> +		cursor->min_alignment = i845_cursor_min_alignment;
>  		cursor->update_arm = i845_cursor_update_arm;
>  		cursor->disable_arm = i845_cursor_disable_arm;
>  		cursor->get_hw_state = i845_cursor_get_hw_state;
>  		cursor->check_plane = i845_check_cursor;
>  	} else {
>  		cursor->max_stride = i9xx_cursor_max_stride;
> +
> +		if (IS_I830(dev_priv))
> +			cursor->min_alignment = i830_cursor_min_alignment;
> +		else if (IS_I85X(dev_priv))
> +			cursor->min_alignment = i85x_cursor_min_alignment;
> +		else
> +			cursor->min_alignment = i9xx_cursor_min_alignment;
> +
>  		cursor->update_arm = i9xx_cursor_update_arm;
>  		cursor->disable_arm = i9xx_cursor_disable_arm;
>  		cursor->get_hw_state = i9xx_cursor_get_hw_state;
>  		cursor->check_plane = i9xx_check_cursor;
>  	}
>  
> -	cursor->min_alignment = intel_cursor_alignment;
> -
>  	cursor->cursor.base = ~0;
>  	cursor->cursor.cntl = ~0;
>  
> diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
> index c5bae05cbbc3..c84ecae3a57c 100644
> --- a/drivers/gpu/drm/i915/display/intel_fb.c
> +++ b/drivers/gpu/drm/i915/display/intel_fb.c
> @@ -776,22 +776,6 @@ bool intel_fb_uses_dpt(const struct drm_framebuffer *fb)
>  		intel_fb_modifier_uses_dpt(to_i915(fb->dev), fb->modifier);
>  }
>  
> -unsigned int intel_cursor_alignment(struct intel_plane *plane,
> -				    const struct drm_framebuffer *fb,
> -				    int color_plane)
> -{
> -	struct drm_i915_private *i915 = to_i915(plane->base.dev);
> -
> -	if (IS_I830(i915))
> -		return 16 * 1024;
> -	else if (IS_I85X(i915))
> -		return 256;
> -	else if (IS_I845G(i915) || IS_I865G(i915))
> -		return 32;
> -	else
> -		return 4 * 1024;
> -}
> -
>  static unsigned int intel_linear_alignment(const struct drm_i915_private *dev_priv)
>  {
>  	if (DISPLAY_VER(dev_priv) >= 9)
> diff --git a/drivers/gpu/drm/i915/display/intel_fb.h b/drivers/gpu/drm/i915/display/intel_fb.h
> index 86c01a3ce81e..16ebb573643f 100644
> --- a/drivers/gpu/drm/i915/display/intel_fb.h
> +++ b/drivers/gpu/drm/i915/display/intel_fb.h
> @@ -60,9 +60,6 @@ unsigned int intel_tile_height(const struct drm_framebuffer *fb, int color_plane
>  unsigned int intel_tile_row_size(const struct drm_framebuffer *fb, int color_plane);
>  unsigned int intel_fb_align_height(const struct drm_framebuffer *fb,
>  				   int color_plane, unsigned int height);
> -unsigned int intel_cursor_alignment(struct intel_plane *plane,
> -				    const struct drm_framebuffer *fb,
> -				    int color_plane);
>  unsigned int intel_surf_alignment(struct intel_plane *plane,
>  				  const struct drm_framebuffer *fb,
>  				  int color_plane);
> -- 
> 2.43.2
> 
