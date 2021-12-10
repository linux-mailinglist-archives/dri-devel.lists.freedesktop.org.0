Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4D946FB99
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 08:33:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5A5E10E670;
	Fri, 10 Dec 2021 07:33:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA5AC10E670;
 Fri, 10 Dec 2021 07:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639121598; x=1670657598;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=AnZcDbV6HpTWHGpHi/20P4ob6TBiEV5eFbUKJZgzD5I=;
 b=T3Ue+78XikAJkUTL9jSNoIqVfS02Y2M6FYtBfUcuq9Pp2bcHbRfKt3dw
 F6zFFCbQrL3ve+obR+d7/7rvUi+9R6tJR1n6/2upJx4wPV0Oyo/V4ItpJ
 LZNbw8K6HyZ9+eSwkKFFAG4h9khuBQ9d7AR/vTmRBUx+3qUV4cATv/bzu
 73Vp4U0mjBJyVe1tmy+48BXfdDOBOPBXGkgF0pFkg8x+1+uClO04tmrt4
 c82HsLvYWOk3VK+3v6ASmXfa6LR9FNEP1Bk/5mzPlB6E0QVCNv6JckGIh
 rL00nnLGGpT2HMLNZ6kBE7GYmKlCUmi0EjXabONlr7C1qeh4AeCGswR7A Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10193"; a="324557601"
X-IronPort-AV: E=Sophos;i="5.88,194,1635231600"; d="scan'208";a="324557601"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 23:33:18 -0800
X-IronPort-AV: E=Sophos;i="5.88,194,1635231600"; d="scan'208";a="503830402"
Received: from unknown (HELO intel.com) ([10.237.72.167])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 23:33:15 -0800
Date: Fri, 10 Dec 2021 09:33:07 +0200
From: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
To: Ramalingam C <ramalingam.c@intel.com>
Subject: Re: [PATCH v4 07/16] drm/i915/dg2: Tile 4 plane format support
Message-ID: <20211210073307.GA27698@intel.com>
References: <20211209154533.4084-1-ramalingam.c@intel.com>
 <20211209154533.4084-8-ramalingam.c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211209154533.4084-8-ramalingam.c@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 09, 2021 at 09:15:24PM +0530, Ramalingam C wrote:
> From: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
> 
> Tile4 in bspec format is 4K tile organized into
> 64B subtiles with same basic shape as for legacy TileY
> which will be supported by Display13.
> 
> v2: - Moved Tile4 associating struct for modifier/display to
>       the beginning(Imre Deak)
>     - Removed unneeded case I915_FORMAT_MOD_4_TILED modifier
>       checks(Imre Deak)
>     - Fixed I915_FORMAT_MOD_4_TILED to be 9 instead of 12
>       (Imre Deak)
> 
> v3: - Rebased patch on top of new changes related to plane_caps.
>     - Added static assert to check that PLANE_CTL_TILING_YF
>       matches PLANE_CTL_TILING_4(Nanley Chery)
>     - Fixed naming and layout description for Tile 4 in drm uapi
>       header(Nanley Chery)

Hi Ramalingam,

This is probably wrong patch to use as I've sent a newer series,
where drm_fourcc.h changes are separately introducing new tiling
format.
I would be also resending this series today as Nanley Chery
suggested that drm_foucc changes should be introduced after
the kernel support is introduced.

Stan

> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Signed-off-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Juha-Pekka Heikkilä <juha-pekka.heikkila@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display.c  |  1 +
>  drivers/gpu/drm/i915/display/intel_fb.c       | 15 +++++++++++-
>  drivers/gpu/drm/i915/display/intel_fb.h       |  1 +
>  drivers/gpu/drm/i915/display/intel_fbc.c      |  1 +
>  .../drm/i915/display/intel_plane_initial.c    |  1 +
>  .../drm/i915/display/skl_universal_plane.c    | 23 ++++++++++++-------
>  drivers/gpu/drm/i915/i915_drv.h               |  1 +
>  drivers/gpu/drm/i915/i915_pci.c               |  1 +
>  drivers/gpu/drm/i915/i915_reg.h               |  1 +
>  drivers/gpu/drm/i915/intel_device_info.h      |  1 +
>  drivers/gpu/drm/i915/intel_pm.c               |  1 +
>  include/uapi/drm/drm_fourcc.h                 | 11 +++++++++
>  12 files changed, 49 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 128d4943a43b..83253c62b6d6 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -7777,6 +7777,7 @@ static int intel_atomic_check_async(struct intel_atomic_state *state, struct int
>  		case I915_FORMAT_MOD_X_TILED:
>  		case I915_FORMAT_MOD_Y_TILED:
>  		case I915_FORMAT_MOD_Yf_TILED:
> +		case I915_FORMAT_MOD_4_TILED:
>  			break;
>  		default:
>  			drm_dbg_kms(&i915->drm,
> diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
> index 23cfe2e5ce2a..46505c69fe72 100644
> --- a/drivers/gpu/drm/i915/display/intel_fb.c
> +++ b/drivers/gpu/drm/i915/display/intel_fb.c
> @@ -135,11 +135,16 @@ struct intel_modifier_desc {
>  					 INTEL_PLANE_CAP_CCS_MC)
>  #define INTEL_PLANE_CAP_TILING_MASK	(INTEL_PLANE_CAP_TILING_X | \
>  					 INTEL_PLANE_CAP_TILING_Y | \
> -					 INTEL_PLANE_CAP_TILING_Yf)
> +					 INTEL_PLANE_CAP_TILING_Yf | \
> +					 INTEL_PLANE_CAP_TILING_4)
>  #define INTEL_PLANE_CAP_TILING_NONE	0
>  
>  static const struct intel_modifier_desc intel_modifiers[] = {
>  	{
> +		.modifier = I915_FORMAT_MOD_4_TILED,
> +		.display_ver = { 13, 14 },
> +		.plane_caps = INTEL_PLANE_CAP_TILING_4,
> +	}, {
>  		.modifier = I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS,
>  		.display_ver = { 12, 13 },
>  		.plane_caps = INTEL_PLANE_CAP_TILING_Y | INTEL_PLANE_CAP_CCS_MC,
> @@ -545,6 +550,12 @@ intel_tile_width_bytes(const struct drm_framebuffer *fb, int color_plane)
>  			return 128;
>  		else
>  			return 512;
> +	case I915_FORMAT_MOD_4_TILED:
> +		/*
> +		 * Each 4K tile consists of 64B(8*8) subtiles, with
> +		 * same shape as Y Tile(i.e 4*16B OWords)
> +		 */
> +		return 128;
>  	case I915_FORMAT_MOD_Y_TILED_CCS:
>  		if (intel_fb_is_ccs_aux_plane(fb, color_plane))
>  			return 128;
> @@ -650,6 +661,7 @@ static unsigned int intel_fb_modifier_to_tiling(u64 fb_modifier)
>  		return I915_TILING_Y;
>  	case INTEL_PLANE_CAP_TILING_X:
>  		return I915_TILING_X;
> +	case INTEL_PLANE_CAP_TILING_4:
>  	case INTEL_PLANE_CAP_TILING_Yf:
>  	case INTEL_PLANE_CAP_TILING_NONE:
>  		return I915_TILING_NONE;
> @@ -737,6 +749,7 @@ unsigned int intel_surf_alignment(const struct drm_framebuffer *fb,
>  	case I915_FORMAT_MOD_Y_TILED_CCS:
>  	case I915_FORMAT_MOD_Yf_TILED_CCS:
>  	case I915_FORMAT_MOD_Y_TILED:
> +	case I915_FORMAT_MOD_4_TILED:
>  	case I915_FORMAT_MOD_Yf_TILED:
>  		return 1 * 1024 * 1024;
>  	default:
> diff --git a/drivers/gpu/drm/i915/display/intel_fb.h b/drivers/gpu/drm/i915/display/intel_fb.h
> index ba9df8986c1e..12386f13a4e0 100644
> --- a/drivers/gpu/drm/i915/display/intel_fb.h
> +++ b/drivers/gpu/drm/i915/display/intel_fb.h
> @@ -27,6 +27,7 @@ struct intel_plane_state;
>  #define INTEL_PLANE_CAP_TILING_X	BIT(3)
>  #define INTEL_PLANE_CAP_TILING_Y	BIT(4)
>  #define INTEL_PLANE_CAP_TILING_Yf	BIT(5)
> +#define INTEL_PLANE_CAP_TILING_4	BIT(6)
>  
>  bool intel_fb_is_ccs_modifier(u64 modifier);
>  bool intel_fb_is_rc_ccs_cc_modifier(u64 modifier);
> diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
> index 8be01b93015f..c62da58a7d5a 100644
> --- a/drivers/gpu/drm/i915/display/intel_fbc.c
> +++ b/drivers/gpu/drm/i915/display/intel_fbc.c
> @@ -936,6 +936,7 @@ static bool tiling_is_valid(const struct intel_plane_state *plane_state)
>  	case I915_FORMAT_MOD_Y_TILED:
>  	case I915_FORMAT_MOD_Yf_TILED:
>  		return DISPLAY_VER(i915) >= 9;
> +	case I915_FORMAT_MOD_4_TILED:
>  	case I915_FORMAT_MOD_X_TILED:
>  		return true;
>  	default:
> diff --git a/drivers/gpu/drm/i915/display/intel_plane_initial.c b/drivers/gpu/drm/i915/display/intel_plane_initial.c
> index 01ce1d72297f..4ae9730ceeff 100644
> --- a/drivers/gpu/drm/i915/display/intel_plane_initial.c
> +++ b/drivers/gpu/drm/i915/display/intel_plane_initial.c
> @@ -126,6 +126,7 @@ intel_alloc_initial_plane_obj(struct intel_crtc *crtc,
>  	case DRM_FORMAT_MOD_LINEAR:
>  	case I915_FORMAT_MOD_X_TILED:
>  	case I915_FORMAT_MOD_Y_TILED:
> +	case I915_FORMAT_MOD_4_TILED:
>  		break;
>  	default:
>  		drm_dbg(&dev_priv->drm,
> diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> index d5359cf3d270..f62ba027fcf9 100644
> --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> @@ -762,6 +762,8 @@ static u32 skl_plane_ctl_tiling(u64 fb_modifier)
>  		return PLANE_CTL_TILED_X;
>  	case I915_FORMAT_MOD_Y_TILED:
>  		return PLANE_CTL_TILED_Y;
> +	case I915_FORMAT_MOD_4_TILED:
> +		return PLANE_CTL_TILED_4;
>  	case I915_FORMAT_MOD_Y_TILED_CCS:
>  	case I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC:
>  		return PLANE_CTL_TILED_Y | PLANE_CTL_RENDER_DECOMPRESSION_ENABLE;
> @@ -1990,9 +1992,7 @@ static bool gen12_plane_format_mod_supported(struct drm_plane *_plane,
>  	case DRM_FORMAT_Y216:
>  	case DRM_FORMAT_XVYU12_16161616:
>  	case DRM_FORMAT_XVYU16161616:
> -		if (modifier == DRM_FORMAT_MOD_LINEAR ||
> -		    modifier == I915_FORMAT_MOD_X_TILED ||
> -		    modifier == I915_FORMAT_MOD_Y_TILED)
> +		if (!intel_fb_is_ccs_modifier(modifier))
>  			return true;
>  		fallthrough;
>  	default:
> @@ -2085,6 +2085,8 @@ static u8 skl_get_plane_caps(struct drm_i915_private *i915,
>  		caps |= INTEL_PLANE_CAP_TILING_Y;
>  	if (DISPLAY_VER(i915) < 12)
>  		caps |= INTEL_PLANE_CAP_TILING_Yf;
> +	if (HAS_4TILE(i915))
> +		caps |= INTEL_PLANE_CAP_TILING_4;
>  
>  	if (skl_plane_has_rc_ccs(i915, pipe, plane_id)) {
>  		caps |= INTEL_PLANE_CAP_CCS_RC;
> @@ -2257,6 +2259,7 @@ skl_get_initial_plane_config(struct intel_crtc *crtc,
>  	unsigned int aligned_height;
>  	struct drm_framebuffer *fb;
>  	struct intel_framebuffer *intel_fb;
> +	static_assert(PLANE_CTL_TILED_YF == PLANE_CTL_TILED_4);
>  
>  	if (!plane->get_hw_state(plane, &pipe))
>  		return;
> @@ -2318,11 +2321,15 @@ skl_get_initial_plane_config(struct intel_crtc *crtc,
>  		else
>  			fb->modifier = I915_FORMAT_MOD_Y_TILED;
>  		break;
> -	case PLANE_CTL_TILED_YF:
> -		if (val & PLANE_CTL_RENDER_DECOMPRESSION_ENABLE)
> -			fb->modifier = I915_FORMAT_MOD_Yf_TILED_CCS;
> -		else
> -			fb->modifier = I915_FORMAT_MOD_Yf_TILED;
> +	case PLANE_CTL_TILED_YF: /* aka PLANE_CTL_TILED_4 on XE_LPD+ */
> +		if (HAS_4TILE(dev_priv)) {
> +			fb->modifier = I915_FORMAT_MOD_4_TILED;
> +		} else {
> +			if (val & PLANE_CTL_RENDER_DECOMPRESSION_ENABLE)
> +				fb->modifier = I915_FORMAT_MOD_Yf_TILED_CCS;
> +			else
> +				fb->modifier = I915_FORMAT_MOD_Yf_TILED;
> +		}
>  		break;
>  	default:
>  		MISSING_CASE(tiling);
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index ad2dd18f7622..cbcb5689391a 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -1444,6 +1444,7 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
>  #define CMDPARSER_USES_GGTT(dev_priv) (GRAPHICS_VER(dev_priv) == 7)
>  
>  #define HAS_LLC(dev_priv)	(INTEL_INFO(dev_priv)->has_llc)
> +#define HAS_4TILE(dev_priv)	(INTEL_INFO(dev_priv)->has_4tile)
>  #define HAS_SNOOP(dev_priv)	(INTEL_INFO(dev_priv)->has_snoop)
>  #define HAS_EDRAM(dev_priv)	((dev_priv)->edram_size_mb)
>  #define HAS_SECURE_BATCHES(dev_priv) (GRAPHICS_VER(dev_priv) < 6)
> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
> index 382e7278058a..6cddd6ac0db8 100644
> --- a/drivers/gpu/drm/i915/i915_pci.c
> +++ b/drivers/gpu/drm/i915/i915_pci.c
> @@ -1047,6 +1047,7 @@ static const struct intel_device_info dg2_info = {
>  	DGFX_FEATURES,
>  	.graphics.rel = 55,
>  	.media.rel = 55,
> +	.has_4tile = 1,
>  	PLATFORM(INTEL_DG2),
>  	.has_64k_pages = 1,
>  	.platform_engine_mask =
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index 29f1cafb0f4b..eb0dc1ec1744 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -7285,6 +7285,7 @@ enum {
>  #define   PLANE_CTL_TILED_X			(1 << 10)
>  #define   PLANE_CTL_TILED_Y			(4 << 10)
>  #define   PLANE_CTL_TILED_YF			(5 << 10)
> +#define   PLANE_CTL_TILED_4			(5 << 10)
>  #define   PLANE_CTL_ASYNC_FLIP			(1 << 9)
>  #define   PLANE_CTL_FLIP_HORIZONTAL		(1 << 8)
>  #define   PLANE_CTL_MEDIA_DECOMPRESSION_ENABLE	(1 << 4) /* TGL+ */
> diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
> index cbbb40e8451f..57835487a6c5 100644
> --- a/drivers/gpu/drm/i915/intel_device_info.h
> +++ b/drivers/gpu/drm/i915/intel_device_info.h
> @@ -130,6 +130,7 @@ enum intel_ppgtt_type {
>  	func(gpu_reset_clobbers_display); \
>  	func(has_reset_engine); \
>  	func(has_flat_ccs); \
> +	func(has_4tile); \
>  	func(has_global_mocs); \
>  	func(has_gt_uc); \
>  	func(has_l3_dpf); \
> diff --git a/drivers/gpu/drm/i915/intel_pm.c b/drivers/gpu/drm/i915/intel_pm.c
> index abad48e1690e..a32dea144bb6 100644
> --- a/drivers/gpu/drm/i915/intel_pm.c
> +++ b/drivers/gpu/drm/i915/intel_pm.c
> @@ -5381,6 +5381,7 @@ skl_compute_wm_params(const struct intel_crtc_state *crtc_state,
>  	}
>  
>  	wp->y_tiled = modifier == I915_FORMAT_MOD_Y_TILED ||
> +		      modifier == I915_FORMAT_MOD_4_TILED ||
>  		      modifier == I915_FORMAT_MOD_Yf_TILED ||
>  		      modifier == I915_FORMAT_MOD_Y_TILED_CCS ||
>  		      modifier == I915_FORMAT_MOD_Yf_TILED_CCS;
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index 7f652c96845b..a146c6df1066 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -565,6 +565,17 @@ extern "C" {
>   */
>  #define I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC fourcc_mod_code(INTEL, 8)
>  
> +/*
> + * Intel Tile 4 layout
> + *
> + * This is a tiled layout using 4KB tiles in a row-major layout. It has the same
> + * shape as Tile Y at two granularities: 4KB (128B x 32) and 64B (16B x 4). It
> + * only differs from Tile Y at the 256B granularity in between. At this
> + * granularity, Tile Y has a shape of 16B x 32 rows, but this tiling has a shape
> + * of 64B x 8 rows.
> + */
> +#define I915_FORMAT_MOD_4_TILED         fourcc_mod_code(INTEL, 9)
> +
>  /*
>   * Tiled, NV12MT, grouped in 64 (pixels) x 32 (lines) -sized macroblocks
>   *
> -- 
> 2.20.1
> 
