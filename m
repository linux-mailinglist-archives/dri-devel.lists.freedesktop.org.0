Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C483FDF5D
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 18:07:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71B236E212;
	Wed,  1 Sep 2021 16:07:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 821A06E219;
 Wed,  1 Sep 2021 16:07:05 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10094"; a="279801633"
X-IronPort-AV: E=Sophos;i="5.84,369,1620716400"; d="scan'208";a="279801633"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2021 09:06:58 -0700
X-IronPort-AV: E=Sophos;i="5.84,369,1620716400"; d="scan'208";a="645804100"
Received: from frodasgo-mobl3.amr.corp.intel.com (HELO intel.com)
 ([10.255.39.35])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2021 09:06:56 -0700
Date: Wed, 1 Sep 2021 12:06:55 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Anshuman Gupta <anshuman.gupta@intel.com>,
 Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Huang Sean Z <sean.z.huang@intel.com>,
 Gaurav Kumar <kumar.gaurav@intel.com>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Juston Li <juston.li@intel.com>, Uma Shankar <uma.shankar@intel.com>
Subject: Re: [PATCH v7 13/17] drm/i915/pxp: Add plane decryption support
Message-ID: <YS+lH4pesMKwHTZA@intel.com>
References: <20210828012738.317661-1-daniele.ceraolospurio@intel.com>
 <20210828012738.317661-14-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210828012738.317661-14-daniele.ceraolospurio@intel.com>
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

On Fri, Aug 27, 2021 at 06:27:34PM -0700, Daniele Ceraolo Spurio wrote:
> From: Anshuman Gupta <anshuman.gupta@intel.com>
> 
> Add support to enable/disable PLANE_SURF Decryption Request bit.
> It requires only to enable plane decryption support when following
> condition met.
> 1. PXP session is enabled.
> 2. Buffer object is protected.
> 
> v2:
> - Used gen fb obj user_flags instead gem_object_metadata. [Krishna]
> 
> v3:
> - intel_pxp_gem_object_status() API changes.
> 
> v4: use intel_pxp_is_active (Daniele)
> 
> v5: rebase and use the new protected object status checker (Daniele)
> 
> v6: used plane state for plane_decryption to handle async flip
>     as suggested by Ville.
> 
> v7: check pxp session while plane decrypt state computation. [Ville]
>     removed pointless code. [Ville]
> 
> v8 (Daniele): update PXP check
> 
> v9: move decrypt check after icl_check_nv12_planes() when overlays
>     have fb set (Juston)
> 
> v10 (Daniele): update PXP check again to match rework in earlier patches and
> don't consider protection valid if the object has not been used in an
> execbuf beforehand.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Cc: Huang Sean Z <sean.z.huang@intel.com>
> Cc: Gaurav Kumar <kumar.gaurav@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Juston Li <juston.li@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com> #v8
> Reviewed-by: Uma Shankar <uma.shankar@intel.com> #v9
> ---
>  drivers/gpu/drm/i915/display/intel_display.c  | 26 +++++++++++++++++++
>  .../drm/i915/display/intel_display_types.h    |  3 +++
>  .../drm/i915/display/skl_universal_plane.c    | 15 ++++++++---
>  .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  2 +-
>  drivers/gpu/drm/i915/i915_reg.h               |  1 +
>  drivers/gpu/drm/i915/pxp/intel_pxp.c          |  9 ++++---
>  drivers/gpu/drm/i915/pxp/intel_pxp.h          |  7 +++--
>  7 files changed, 54 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index fe5ad599c218..f04d98fcea46 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -70,6 +70,8 @@
>  #include "gt/intel_rps.h"
>  #include "gt/gen8_ppgtt.h"
>  
> +#include "pxp/intel_pxp.h"
> +
>  #include "g4x_dp.h"
>  #include "g4x_hdmi.h"
>  #include "i915_drv.h"
> @@ -9148,13 +9150,23 @@ static int intel_bigjoiner_add_affected_planes(struct intel_atomic_state *state)
>  	return 0;
>  }
>  
> +static bool bo_has_valid_encryption(struct drm_i915_gem_object *obj)
> +{
> +	struct drm_i915_private *i915 = to_i915(obj->base.dev);
> +
> +	return intel_pxp_key_check(&i915->gt.pxp, obj, false) == 0;
> +}
> +
>  static int intel_atomic_check_planes(struct intel_atomic_state *state)
>  {
>  	struct drm_i915_private *dev_priv = to_i915(state->base.dev);
>  	struct intel_crtc_state *old_crtc_state, *new_crtc_state;
>  	struct intel_plane_state *plane_state;
>  	struct intel_plane *plane;
> +	struct intel_plane_state *new_plane_state;
> +	struct intel_plane_state *old_plane_state;
>  	struct intel_crtc *crtc;
> +	const struct drm_framebuffer *fb;
>  	int i, ret;
>  
>  	ret = icl_add_linked_planes(state);
> @@ -9202,6 +9214,16 @@ static int intel_atomic_check_planes(struct intel_atomic_state *state)
>  			return ret;
>  	}
>  
> +	for_each_new_intel_plane_in_state(state, plane, plane_state, i) {
> +		new_plane_state = intel_atomic_get_new_plane_state(state, plane);
> +		old_plane_state = intel_atomic_get_old_plane_state(state, plane);
> +		fb = new_plane_state->hw.fb;
> +		if (fb)
> +			new_plane_state->decrypt = bo_has_valid_encryption(intel_fb_obj(fb));
> +		else
> +			new_plane_state->decrypt = old_plane_state->decrypt;
> +	}
> +
>  	return 0;
>  }
>  
> @@ -9488,6 +9510,10 @@ static int intel_atomic_check_async(struct intel_atomic_state *state)
>  			drm_dbg_kms(&i915->drm, "Color range cannot be changed in async flip\n");
>  			return -EINVAL;
>  		}
> +
> +		/* plane decryption is allow to change only in synchronous flips */
> +		if (old_plane_state->decrypt != new_plane_state->decrypt)
> +			return -EINVAL;
>  	}
>  
>  	return 0;
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index c7bcf9183447..6d4ea1d5bf7b 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -629,6 +629,9 @@ struct intel_plane_state {
>  
>  	struct intel_fb_view view;
>  
> +	/* Plane pxp decryption state */
> +	bool decrypt;
> +
>  	/* plane control register */
>  	u32 ctl;
>  
> diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> index 724e7b04f3b6..55e3f093b951 100644
> --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> @@ -18,6 +18,7 @@
>  #include "intel_sprite.h"
>  #include "skl_scaler.h"
>  #include "skl_universal_plane.h"
> +#include "pxp/intel_pxp.h"
>  
>  static const u32 skl_plane_formats[] = {
>  	DRM_FORMAT_C8,
> @@ -1024,7 +1025,7 @@ skl_program_plane(struct intel_plane *plane,
>  	u8 alpha = plane_state->hw.alpha >> 8;
>  	u32 plane_color_ctl = 0, aux_dist = 0;
>  	unsigned long irqflags;
> -	u32 keymsk, keymax;
> +	u32 keymsk, keymax, plane_surf;
>  	u32 plane_ctl = plane_state->ctl;
>  
>  	plane_ctl |= skl_plane_ctl_crtc(crtc_state);
> @@ -1113,8 +1114,16 @@ skl_program_plane(struct intel_plane *plane,
>  	 * the control register just before the surface register.
>  	 */
>  	intel_de_write_fw(dev_priv, PLANE_CTL(pipe, plane_id), plane_ctl);
> -	intel_de_write_fw(dev_priv, PLANE_SURF(pipe, plane_id),
> -			  intel_plane_ggtt_offset(plane_state) + surf_addr);
> +	plane_surf = intel_plane_ggtt_offset(plane_state) + surf_addr;
> +
> +	/*
> +	 * FIXME: pxp session invalidation can hit any time even at time of commit
> +	 * or after the commit, display content will be garbage.
> +	 */
> +	if (plane_state->decrypt)
> +		plane_surf |= PLANE_SURF_DECRYPT;
> +
> +	intel_de_write_fw(dev_priv, PLANE_SURF(pipe, plane_id), plane_surf);
>  
>  	spin_unlock_irqrestore(&dev_priv->uncore.lock, irqflags);
>  }
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index bd17741f462f..1b2e4d70896d 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -836,7 +836,7 @@ static struct i915_vma *eb_lookup_vma(struct i915_execbuffer *eb, u32 handle)
>  		 */
>  		if (i915_gem_context_uses_protected_content(eb->gem_context) &&
>  		    i915_gem_object_is_protected(obj)) {
> -			err = intel_pxp_key_check(&vm->gt->pxp, obj);
> +			err = intel_pxp_key_check(&vm->gt->pxp, obj, true);
>  			if (err) {
>  				i915_gem_object_put(obj);
>  				return ERR_PTR(err);
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index 1d870c059d8c..148cfc859c63 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -7357,6 +7357,7 @@ enum {
>  #define _PLANE_SURF_3(pipe)	_PIPE(pipe, _PLANE_SURF_3_A, _PLANE_SURF_3_B)
>  #define PLANE_SURF(pipe, plane)	\
>  	_MMIO_PLANE(plane, _PLANE_SURF_1(pipe), _PLANE_SURF_2(pipe))
> +#define   PLANE_SURF_DECRYPT			REG_BIT(2)
>  
>  #define _PLANE_OFFSET_1_B			0x711a4
>  #define _PLANE_OFFSET_2_B			0x712a4
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.c b/drivers/gpu/drm/i915/pxp/intel_pxp.c
> index 045a8402ebb3..8c73ab0f2e7c 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp.c
> @@ -179,7 +179,9 @@ void intel_pxp_fini_hw(struct intel_pxp *pxp)
>  	intel_pxp_irq_disable(pxp);
>  }
>  
> -int intel_pxp_key_check(struct intel_pxp *pxp, struct drm_i915_gem_object *obj)
> +int intel_pxp_key_check(struct intel_pxp *pxp,
> +			struct drm_i915_gem_object *obj,
> +			bool assign)
>  {
>  	if (!intel_pxp_is_active(pxp))
>  		return -ENODEV;
> @@ -195,9 +197,10 @@ int intel_pxp_key_check(struct intel_pxp *pxp, struct drm_i915_gem_object *obj)
>  	 * as such. If the object is already encrypted, check instead if the
>  	 * used key is still valid.
>  	 */
> -	if (!obj->pxp_key_instance)
> +	if (!obj->pxp_key_instance && assign)
>  		obj->pxp_key_instance = pxp->key_instance;
> -	else if (obj->pxp_key_instance != pxp->key_instance)
> +
> +	if (obj->pxp_key_instance != pxp->key_instance)
>  		return -ENOEXEC;
>  
>  	return 0;
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.h b/drivers/gpu/drm/i915/pxp/intel_pxp.h
> index 424fe00a91fb..edafbfbe9ff4 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp.h
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp.h
> @@ -37,7 +37,9 @@ void intel_pxp_mark_termination_in_progress(struct intel_pxp *pxp);
>  
>  int intel_pxp_start(struct intel_pxp *pxp);
>  
> -int intel_pxp_key_check(struct intel_pxp *pxp, struct drm_i915_gem_object *obj);
> +int intel_pxp_key_check(struct intel_pxp *pxp,
> +			struct drm_i915_gem_object *obj,
> +			bool assign);
>  
>  void intel_pxp_invalidate(struct intel_pxp *pxp);
>  #else
> @@ -55,7 +57,8 @@ static inline int intel_pxp_start(struct intel_pxp *pxp)
>  }
>  
>  static inline int intel_pxp_key_check(struct intel_pxp *pxp,
> -				      struct drm_i915_gem_object *obj)
> +				      struct drm_i915_gem_object *obj,
> +				      bool assing)
>  {
>  	return -ENODEV;
>  }
> -- 
> 2.25.1
> 
