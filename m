Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 288E639927C
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 20:23:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F0B46ED94;
	Wed,  2 Jun 2021 18:23:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37D476ED94;
 Wed,  2 Jun 2021 18:23:23 +0000 (UTC)
IronPort-SDR: 5Hc+3Xoqw5J/P2LISP2jx0pAy0+Rd6GNJ6FNVeqRXn0sfaaPZTzcRJWG/WRlu5ABSOAenEga7t
 5bNKcjB/7XVg==
X-IronPort-AV: E=McAfee;i="6200,9189,10003"; a="202001475"
X-IronPort-AV: E=Sophos;i="5.83,242,1616482800"; d="scan'208";a="202001475"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2021 11:23:22 -0700
IronPort-SDR: EHWAENDkerACLrZZnJqfN1FRIi/4q3dJ5GHX1Ct7+ap8wDNHSpokvIkh2tqgXsDSg4LPu64lu9
 9cliFRFt2/tw==
X-IronPort-AV: E=Sophos;i="5.83,242,1616482800"; d="scan'208";a="617317380"
Received: from ticela-az-103.amr.corp.intel.com (HELO intel.com)
 ([10.254.2.125])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2021 11:23:21 -0700
Date: Wed, 2 Jun 2021 14:23:20 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH v4 15/17] drm/i915/pxp: Add plane decryption support
Message-ID: <YLfMmHSlfJGQ/RFN@intel.com>
References: <20210525054803.7387-1-daniele.ceraolospurio@intel.com>
 <20210525054803.7387-16-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210525054803.7387-16-daniele.ceraolospurio@intel.com>
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
 Huang Sean Z <sean.z.huang@intel.com>, dri-devel@lists.freedesktop.org,
 Gaurav Kumar <kumar.gaurav@intel.com>,
 Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 24, 2021 at 10:48:01PM -0700, Daniele Ceraolo Spurio wrote:
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
> Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Cc: Huang Sean Z <sean.z.huang@intel.com>
> Cc: Gaurav Kumar <kumar.gaurav@intel.com>
> Cc: Ville Syrj�l� <ville.syrjala@linux.intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  .../gpu/drm/i915/display/intel_atomic_plane.c    | 16 ++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_display.c     |  4 ++++
>  .../gpu/drm/i915/display/intel_display_types.h   |  3 +++
>  .../gpu/drm/i915/display/skl_universal_plane.c   | 15 ++++++++++++---
>  drivers/gpu/drm/i915/i915_reg.h                  |  1 +
>  5 files changed, 36 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> index 36f52a1d7552..88b3272c0b00 100644
> --- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> +++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> @@ -41,6 +41,7 @@
>  #include "intel_display_types.h"
>  #include "intel_pm.h"
>  #include "intel_sprite.h"
> +#include "pxp/intel_pxp.h"
>  
>  static void intel_plane_state_reset(struct intel_plane_state *plane_state,
>  				    struct intel_plane *plane)
> @@ -383,6 +384,14 @@ intel_crtc_get_plane(struct intel_crtc *crtc, enum plane_id plane_id)
>  	return NULL;
>  }
>  
> +static int bo_has_valid_encryption(const struct drm_i915_gem_object *obj)
> +{
> +	struct drm_i915_private *i915 = to_i915(obj->base.dev);
> +
> +	return i915_gem_object_has_valid_protection(obj) &&
> +	       intel_pxp_is_active(&i915->gt.pxp);
> +}
> +
>  int intel_plane_atomic_check(struct intel_atomic_state *state,
>  			     struct intel_plane *plane)
>  {
> @@ -397,6 +406,7 @@ int intel_plane_atomic_check(struct intel_atomic_state *state,
>  		intel_atomic_get_old_crtc_state(state, crtc);
>  	struct intel_crtc_state *new_crtc_state =
>  		intel_atomic_get_new_crtc_state(state, crtc);
> +	const struct drm_framebuffer *fb;
>  
>  	if (new_crtc_state && new_crtc_state->bigjoiner_slave) {
>  		struct intel_plane *master_plane =
> @@ -413,6 +423,12 @@ int intel_plane_atomic_check(struct intel_atomic_state *state,
>  					  new_master_plane_state,
>  					  crtc);
>  
> +	fb = new_plane_state->hw.fb;
> +	if (fb)
> +		new_plane_state->decrypt = bo_has_valid_encryption(intel_fb_obj(fb));
> +	else
> +		new_plane_state->decrypt = old_plane_state->decrypt;
> +
>  	new_plane_state->uapi.visible = false;
>  	if (!new_crtc_state)
>  		return 0;
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 0bb2e582c87f..f7f5374114ad 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -9767,6 +9767,10 @@ static int intel_atomic_check_async(struct intel_atomic_state *state)
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
> index ce05475ad560..6b5dab9e1c40 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -621,6 +621,9 @@ struct intel_plane_state {
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
> index 59e032f3687a..2c8e88e8ad83 100644
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
> @@ -997,7 +998,7 @@ skl_program_plane(struct intel_plane *plane,
>  	u8 alpha = plane_state->hw.alpha >> 8;
>  	u32 plane_color_ctl = 0, aux_dist = 0;
>  	unsigned long irqflags;
> -	u32 keymsk, keymax;
> +	u32 keymsk, keymax, plane_surf;
>  	u32 plane_ctl = plane_state->ctl;
>  
>  	plane_ctl |= skl_plane_ctl_crtc(crtc_state);
> @@ -1086,8 +1087,16 @@ skl_program_plane(struct intel_plane *plane,
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
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index 297671d78076..b3eaf45ae3ab 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -7284,6 +7284,7 @@ enum {
>  #define _PLANE_SURF_3(pipe)	_PIPE(pipe, _PLANE_SURF_3_A, _PLANE_SURF_3_B)
>  #define PLANE_SURF(pipe, plane)	\
>  	_MMIO_PLANE(plane, _PLANE_SURF_1(pipe), _PLANE_SURF_2(pipe))
> +#define   PLANE_SURF_DECRYPT			REG_BIT(2)
>  
>  #define _PLANE_OFFSET_1_B			0x711a4
>  #define _PLANE_OFFSET_2_B			0x712a4
> -- 
> 2.29.2
> 
