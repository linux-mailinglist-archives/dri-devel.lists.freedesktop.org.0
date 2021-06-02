Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C1539930E
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 21:01:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A9D26E53C;
	Wed,  2 Jun 2021 19:00:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C29886E536;
 Wed,  2 Jun 2021 19:00:53 +0000 (UTC)
IronPort-SDR: D0mmiYlW4Q6zOzwxqtPJXvxPSEM6cWBCqrkTzjhRXMHzYVKqYXdnxFSKuUDSffstm3CdudWcq8
 CMKuO8mZmX8g==
X-IronPort-AV: E=McAfee;i="6200,9189,10003"; a="202010264"
X-IronPort-AV: E=Sophos;i="5.83,242,1616482800"; d="scan'208";a="202010264"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2021 12:00:52 -0700
IronPort-SDR: AcMYCYTY1Bommok5VowuYHbsfjWASCiGwAWCdHlSfuPs7RqFYwJqKsnXxylqe82Lr+RIJ6bzCu
 2RyYaOOHsObw==
X-IronPort-AV: E=Sophos;i="5.83,242,1616482800"; d="scan'208";a="411729300"
Received: from ticela-az-103.amr.corp.intel.com (HELO intel.com)
 ([10.254.2.125])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2021 12:00:51 -0700
Date: Wed, 2 Jun 2021 15:00:50 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH v4 16/17] drm/i915/pxp: black pixels on pxp disabled
Message-ID: <YLfVYne2yPu/pnZY@intel.com>
References: <20210525054803.7387-1-daniele.ceraolospurio@intel.com>
 <20210525054803.7387-17-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210525054803.7387-17-daniele.ceraolospurio@intel.com>
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
Cc: Anshuman Gupta <anshuman.gupta@intel.com>, intel-gfx@lists.freedesktop.org,
 Shankar Uma <uma.shankar@intel.com>, dri-devel@lists.freedesktop.org,
 Gaurav Kumar <kumar.gaurav@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 24, 2021 at 10:48:02PM -0700, Daniele Ceraolo Spurio wrote:
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
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Gaurav Kumar <kumar.gaurav@intel.com>
> Cc: Shankar Uma <uma.shankar@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> ---
>  .../gpu/drm/i915/display/intel_atomic_plane.c | 13 +++++-
>  .../drm/i915/display/intel_display_types.h    |  3 ++
>  .../drm/i915/display/skl_universal_plane.c    | 36 ++++++++++++++-
>  drivers/gpu/drm/i915/i915_reg.h               | 46 +++++++++++++++++++
>  4 files changed, 95 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> index 88b3272c0b00..44d7a5072090 100644
> --- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> +++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> @@ -392,6 +392,11 @@ static int bo_has_valid_encryption(const struct drm_i915_gem_object *obj)
>  	       intel_pxp_is_active(&i915->gt.pxp);
>  }
>  
> +static bool pxp_is_borked(const struct drm_i915_gem_object *obj)
> +{
> +	return i915_gem_object_is_protected(obj) && !bo_has_valid_encryption(obj);
> +}
> +
>  int intel_plane_atomic_check(struct intel_atomic_state *state,
>  			     struct intel_plane *plane)
>  {
> @@ -424,10 +429,14 @@ int intel_plane_atomic_check(struct intel_atomic_state *state,
>  					  crtc);
>  
>  	fb = new_plane_state->hw.fb;
> -	if (fb)
> +	if (fb) {
>  		new_plane_state->decrypt = bo_has_valid_encryption(intel_fb_obj(fb));
> -	else
> +		new_plane_state->force_black = pxp_is_borked(intel_fb_obj(fb));
> +
> +	} else {
>  		new_plane_state->decrypt = old_plane_state->decrypt;
> +		new_plane_state->force_black = old_plane_state->force_black;
> +	}
>  
>  	new_plane_state->uapi.visible = false;
>  	if (!new_crtc_state)
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index 6b5dab9e1c40..88c0b882b844 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -624,6 +624,9 @@ struct intel_plane_state {
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
> index 2c8e88e8ad83..d4eb43b96ffd 100644
> --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> @@ -975,6 +975,33 @@ static u32 skl_surf_address(const struct intel_plane_state *plane_state,
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
> @@ -1088,14 +1115,21 @@ skl_program_plane(struct intel_plane *plane,
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
> index b3eaf45ae3ab..3ad6577b7fa4 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -7161,6 +7161,7 @@ enum {
>  #define _PLANE_COLOR_CTL_3_A			0x703CC /* GLK+ */
>  #define   PLANE_COLOR_PIPE_GAMMA_ENABLE		(1 << 30) /* Pre-ICL */
>  #define   PLANE_COLOR_YUV_RANGE_CORRECTION_DISABLE	(1 << 28)
> +#define   PLANE_COLOR_PLANE_CSC_ENABLE			REG_BIT(21) /* ICL+ */
>  #define   PLANE_COLOR_INPUT_CSC_ENABLE		(1 << 20) /* ICL+ */
>  #define   PLANE_COLOR_PIPE_CSC_ENABLE		(1 << 23) /* Pre-ICL */
>  #define   PLANE_COLOR_CSC_MODE_BYPASS			(0 << 17)
> @@ -11276,6 +11277,51 @@ enum skl_power_gate {
>  					_PAL_PREC_MULTI_SEG_DATA_A, \
>  					_PAL_PREC_MULTI_SEG_DATA_B)
>  
> +#define _MMIO_PLANE_GAMC(plane, i, a, b)  _MMIO(_PIPE(plane, a, b) + (i) * 4)
> +
> +/* Plane CSC Registers */
> +#define _PLANE_CSC_RY_GY_1_A	0x70210

registers could have followed spec and be simply PLANCE_CSC_1_A ...
and also "HI" removed from the ones below.

But anyway, they are right and the patch looks right.

I wish we had some kind of solution for the async flips as well,
but, this is already very good:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

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
> 2.29.2
> 
