Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D213FDF4F
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 18:05:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1BAD6E1F7;
	Wed,  1 Sep 2021 16:05:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8641C6E1ED;
 Wed,  1 Sep 2021 16:05:37 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10094"; a="216943886"
X-IronPort-AV: E=Sophos;i="5.84,369,1620716400"; d="scan'208";a="216943886"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2021 09:05:36 -0700
X-IronPort-AV: E=Sophos;i="5.84,369,1620716400"; d="scan'208";a="532259842"
Received: from frodasgo-mobl3.amr.corp.intel.com (HELO intel.com)
 ([10.255.39.35])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2021 09:05:34 -0700
Date: Wed, 1 Sep 2021 12:05:33 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Anshuman Gupta <anshuman.gupta@intel.com>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Gaurav Kumar <kumar.gaurav@intel.com>, Shankar Uma <uma.shankar@intel.com>,
 Juston Li <juston.li@intel.com>
Subject: Re: [Intel-gfx] [PATCH v7 14/17] drm/i915/pxp: black pixels on pxp
 disabled
Message-ID: <YS+kzX7yIE2cpJPx@intel.com>
References: <20210828012738.317661-1-daniele.ceraolospurio@intel.com>
 <20210828012738.317661-15-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210828012738.317661-15-daniele.ceraolospurio@intel.com>
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

On Fri, Aug 27, 2021 at 06:27:35PM -0700, Daniele Ceraolo Spurio wrote:
> From: Anshuman Gupta <anshuman.gupta@intel.com>
> 
> When protected sufaces has flipped and pxp session is disabled,
> display black pixels by using plane color CTM correction.
> 
> v2:
> - Display black pixels in async flip too.
> 
> v3:
> - Removed the black pixels logic for async flip. [Ville]
> - Used plane state to force black pixels. [Ville]
> 
> v4 (Daniele): update pxp_is_borked check.
> 
> v5: rebase on top of v9 plane decryption moving the decrypt check
>     (Juston)
> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Gaurav Kumar <kumar.gaurav@intel.com>
> Cc: Shankar Uma <uma.shankar@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Juston Li <juston.li@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com> #v4

The end result looks identical to me, so my rv-b remains valid.

> Reviewed-by: Uma Shankar <uma.shankar@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display.c  | 12 ++++-
>  .../drm/i915/display/intel_display_types.h    |  3 ++
>  .../drm/i915/display/skl_universal_plane.c    | 36 ++++++++++++++-
>  drivers/gpu/drm/i915/i915_reg.h               | 46 +++++++++++++++++++
>  4 files changed, 94 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index f04d98fcea46..146c87440cc6 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -9157,6 +9157,11 @@ static bool bo_has_valid_encryption(struct drm_i915_gem_object *obj)
>  	return intel_pxp_key_check(&i915->gt.pxp, obj, false) == 0;
>  }
>  
> +static bool pxp_is_borked(struct drm_i915_gem_object *obj)
> +{
> +	return i915_gem_object_is_protected(obj) && !bo_has_valid_encryption(obj);
> +}
> +
>  static int intel_atomic_check_planes(struct intel_atomic_state *state)
>  {
>  	struct drm_i915_private *dev_priv = to_i915(state->base.dev);
> @@ -9218,10 +9223,13 @@ static int intel_atomic_check_planes(struct intel_atomic_state *state)
>  		new_plane_state = intel_atomic_get_new_plane_state(state, plane);
>  		old_plane_state = intel_atomic_get_old_plane_state(state, plane);
>  		fb = new_plane_state->hw.fb;
> -		if (fb)
> +		if (fb) {
>  			new_plane_state->decrypt = bo_has_valid_encryption(intel_fb_obj(fb));
> -		else
> +			new_plane_state->force_black = pxp_is_borked(intel_fb_obj(fb));
> +		} else {
>  			new_plane_state->decrypt = old_plane_state->decrypt;
> +			new_plane_state->force_black = old_plane_state->force_black;
> +		}
>  	}
>  
>  	return 0;
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index 6d4ea1d5bf7b..05d2e6676387 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -632,6 +632,9 @@ struct intel_plane_state {
>  	/* Plane pxp decryption state */
>  	bool decrypt;
>  
> +	/* Plane state to display black pixels when pxp is borked */
> +	bool force_black;
> +
>  	/* plane control register */
>  	u32 ctl;
>  
> diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> index 55e3f093b951..c4adcb3e12b3 100644
> --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> @@ -1002,6 +1002,33 @@ static u32 skl_surf_address(const struct intel_plane_state *plane_state,
>  	}
>  }
>  
> +static void intel_load_plane_csc_black(struct intel_plane *intel_plane)
> +{
> +	struct drm_i915_private *dev_priv = to_i915(intel_plane->base.dev);
> +	enum pipe pipe = intel_plane->pipe;
> +	enum plane_id plane = intel_plane->id;
> +	u16 postoff = 0;
> +
> +	drm_dbg_kms(&dev_priv->drm, "plane color CTM to black  %s:%d\n",
> +		    intel_plane->base.name, plane);
> +	intel_de_write_fw(dev_priv, PLANE_CSC_COEFF(pipe, plane, 0), 0);
> +	intel_de_write_fw(dev_priv, PLANE_CSC_COEFF(pipe, plane, 1), 0);
> +
> +	intel_de_write_fw(dev_priv, PLANE_CSC_COEFF(pipe, plane, 2), 0);
> +	intel_de_write_fw(dev_priv, PLANE_CSC_COEFF(pipe, plane, 3), 0);
> +
> +	intel_de_write_fw(dev_priv, PLANE_CSC_COEFF(pipe, plane, 4), 0);
> +	intel_de_write_fw(dev_priv, PLANE_CSC_COEFF(pipe, plane, 5), 0);
> +
> +	intel_de_write_fw(dev_priv, PLANE_CSC_PREOFF(pipe, plane, 0), 0);
> +	intel_de_write_fw(dev_priv, PLANE_CSC_PREOFF(pipe, plane, 1), 0);
> +	intel_de_write_fw(dev_priv, PLANE_CSC_PREOFF(pipe, plane, 2), 0);
> +
> +	intel_de_write_fw(dev_priv, PLANE_CSC_POSTOFF(pipe, plane, 0), postoff);
> +	intel_de_write_fw(dev_priv, PLANE_CSC_POSTOFF(pipe, plane, 1), postoff);
> +	intel_de_write_fw(dev_priv, PLANE_CSC_POSTOFF(pipe, plane, 2), postoff);
> +}
> +
>  static void
>  skl_program_plane(struct intel_plane *plane,
>  		  const struct intel_crtc_state *crtc_state,
> @@ -1115,14 +1142,21 @@ skl_program_plane(struct intel_plane *plane,
>  	 */
>  	intel_de_write_fw(dev_priv, PLANE_CTL(pipe, plane_id), plane_ctl);
>  	plane_surf = intel_plane_ggtt_offset(plane_state) + surf_addr;
> +	plane_color_ctl = intel_de_read_fw(dev_priv, PLANE_COLOR_CTL(pipe, plane_id));
>  
>  	/*
>  	 * FIXME: pxp session invalidation can hit any time even at time of commit
>  	 * or after the commit, display content will be garbage.
>  	 */
> -	if (plane_state->decrypt)
> +	if (plane_state->decrypt) {
>  		plane_surf |= PLANE_SURF_DECRYPT;
> +	} else if (plane_state->force_black) {
> +		intel_load_plane_csc_black(plane);
> +		plane_color_ctl |= PLANE_COLOR_PLANE_CSC_ENABLE;
> +	}
>  
> +	intel_de_write_fw(dev_priv, PLANE_COLOR_CTL(pipe, plane_id),
> +			  plane_color_ctl);
>  	intel_de_write_fw(dev_priv, PLANE_SURF(pipe, plane_id), plane_surf);
>  
>  	spin_unlock_irqrestore(&dev_priv->uncore.lock, irqflags);
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index 148cfc859c63..806f29f3fa7d 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -7234,6 +7234,7 @@ enum {
>  #define _PLANE_COLOR_CTL_3_A			0x703CC /* GLK+ */
>  #define   PLANE_COLOR_PIPE_GAMMA_ENABLE		(1 << 30) /* Pre-ICL */
>  #define   PLANE_COLOR_YUV_RANGE_CORRECTION_DISABLE	(1 << 28)
> +#define   PLANE_COLOR_PLANE_CSC_ENABLE			REG_BIT(21) /* ICL+ */
>  #define   PLANE_COLOR_INPUT_CSC_ENABLE		(1 << 20) /* ICL+ */
>  #define   PLANE_COLOR_PIPE_CSC_ENABLE		(1 << 23) /* Pre-ICL */
>  #define   PLANE_COLOR_CSC_MODE_BYPASS			(0 << 17)
> @@ -11375,6 +11376,51 @@ enum skl_power_gate {
>  					_PAL_PREC_MULTI_SEG_DATA_A, \
>  					_PAL_PREC_MULTI_SEG_DATA_B)
>  
> +#define _MMIO_PLANE_GAMC(plane, i, a, b)  _MMIO(_PIPE(plane, a, b) + (i) * 4)
> +
> +/* Plane CSC Registers */
> +#define _PLANE_CSC_RY_GY_1_A	0x70210
> +#define _PLANE_CSC_RY_GY_2_A	0x70310
> +
> +#define _PLANE_CSC_RY_GY_1_B	0x71210
> +#define _PLANE_CSC_RY_GY_2_B	0x71310
> +
> +#define _PLANE_CSC_RY_GY_1(pipe)	_PIPE(pipe, _PLANE_CSC_RY_GY_1_A, \
> +					      _PLANE_CSC_RY_GY_1_B)
> +#define _PLANE_CSC_RY_GY_2(pipe)	_PIPE(pipe, _PLANE_INPUT_CSC_RY_GY_2_A, \
> +					      _PLANE_INPUT_CSC_RY_GY_2_B)
> +#define PLANE_CSC_COEFF(pipe, plane, index)	_MMIO_PLANE(plane, \
> +							    _PLANE_CSC_RY_GY_1(pipe) +  (index) * 4, \
> +							    _PLANE_CSC_RY_GY_2(pipe) + (index) * 4)
> +
> +#define _PLANE_CSC_PREOFF_HI_1_A		0x70228
> +#define _PLANE_CSC_PREOFF_HI_2_A		0x70328
> +
> +#define _PLANE_CSC_PREOFF_HI_1_B		0x71228
> +#define _PLANE_CSC_PREOFF_HI_2_B		0x71328
> +
> +#define _PLANE_CSC_PREOFF_HI_1(pipe)	_PIPE(pipe, _PLANE_CSC_PREOFF_HI_1_A, \
> +					      _PLANE_CSC_PREOFF_HI_1_B)
> +#define _PLANE_CSC_PREOFF_HI_2(pipe)	_PIPE(pipe, _PLANE_CSC_PREOFF_HI_2_A, \
> +					      _PLANE_CSC_PREOFF_HI_2_B)
> +#define PLANE_CSC_PREOFF(pipe, plane, index)	_MMIO_PLANE(plane, _PLANE_CSC_PREOFF_HI_1(pipe) + \
> +							    (index) * 4, _PLANE_CSC_PREOFF_HI_2(pipe) + \
> +							    (index) * 4)
> +
> +#define _PLANE_CSC_POSTOFF_HI_1_A		0x70234
> +#define _PLANE_CSC_POSTOFF_HI_2_A		0x70334
> +
> +#define _PLANE_CSC_POSTOFF_HI_1_B		0x71234
> +#define _PLANE_CSC_POSTOFF_HI_2_B		0x71334
> +
> +#define _PLANE_CSC_POSTOFF_HI_1(pipe)	_PIPE(pipe, _PLANE_CSC_POSTOFF_HI_1_A, \
> +					      _PLANE_CSC_POSTOFF_HI_1_B)
> +#define _PLANE_CSC_POSTOFF_HI_2(pipe)	_PIPE(pipe, _PLANE_CSC_POSTOFF_HI_2_A, \
> +					      _PLANE_CSC_POSTOFF_HI_2_B)
> +#define PLANE_CSC_POSTOFF(pipe, plane, index)	_MMIO_PLANE(plane, _PLANE_CSC_POSTOFF_HI_1(pipe) + \
> +							    (index) * 4, _PLANE_CSC_POSTOFF_HI_2(pipe) + \
> +							    (index) * 4)
> +
>  /* pipe CSC & degamma/gamma LUTs on CHV */
>  #define _CGM_PIPE_A_CSC_COEFF01	(VLV_DISPLAY_BASE + 0x67900)
>  #define _CGM_PIPE_A_CSC_COEFF23	(VLV_DISPLAY_BASE + 0x67904)
> -- 
> 2.25.1
> 
