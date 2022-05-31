Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D495398D3
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 23:34:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E64010E46F;
	Tue, 31 May 2022 21:34:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B419310E28D;
 Tue, 31 May 2022 21:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654032840; x=1685568840;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xmTQGlNpRI+hYF3aWcsTWS2ZdLerNBet8acdMFdZJZM=;
 b=MHw6lQWYgYDqj6GOcnVJ3zPWBx+N1TM0tbADkXdO+2kzMCSIxliWzaa4
 dvEAWZOl3iXpIIG42PPjxxhvuURgngKYvsl0rXtwvRm9IqKAxU4pyWY03
 Ec4WZx14xK6Px8VkTQtsaFlFveLORkiYT3mVYv+qDllgrS/Y7rWy8hi1W
 gLofiIki/PoijPOVbucWuMSAMYPPEsafnHEpzvvdcir5imQSxI+qwzIrt
 4B0oNac8oHHuneoNipytJyPIQeED42yA5XE0TQZhhEmruKEV3cI8aO3lQ
 sz59ke6m7ilI2/DKzVY1AmqZiDRsHi5cHaEvkFGn9rMJuyNw5hmHu3YgJ w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10364"; a="255262232"
X-IronPort-AV: E=Sophos;i="5.91,266,1647327600"; d="scan'208";a="255262232"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2022 14:34:00 -0700
X-IronPort-AV: E=Sophos;i="5.91,266,1647327600"; d="scan'208";a="633234907"
Received: from msatwood-mobl.jf.intel.com (HELO msatwood-mobl)
 ([10.241.232.75])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2022 14:34:00 -0700
Date: Tue, 31 May 2022 14:33:54 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 1/2] drm/i915/pvc: Extract stepping
 information from PCI revid
Message-ID: <YpaJwnd+nWwbFwZY@msatwood-mobl>
References: <20220527163348.1936146-1-matthew.d.roper@intel.com>
 <20220527163348.1936146-2-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220527163348.1936146-2-matthew.d.roper@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 27, 2022 at 09:33:47AM -0700, Matt Roper wrote:
> For PVC, the base die and compute tile have separate stepping values
> that we need to track; we'll use the existing graphics_step field to
> represent the compute tile stepping and add a new 'basedie_step' field.
> 
> Unlike past platforms, steppings for these components are represented by
> specific bitfields within the PCI revision ID, and we shouldn't make
> assumptions about the non-CT, non-BD bits staying 0.  Let's update our
> stepping code accordingly.
> 
> Bspec: 44484
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_drv.h   | 13 ++++++
>  drivers/gpu/drm/i915/intel_step.c | 70 ++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/i915/intel_step.h |  4 +-
>  3 files changed, 85 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index 74b3caccd839..ec1b3484fdaf 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -943,6 +943,7 @@ static inline struct intel_gt *to_gt(struct drm_i915_private *i915)
>  #define INTEL_DISPLAY_STEP(__i915) (RUNTIME_INFO(__i915)->step.display_step)
>  #define INTEL_GRAPHICS_STEP(__i915) (RUNTIME_INFO(__i915)->step.graphics_step)
>  #define INTEL_MEDIA_STEP(__i915) (RUNTIME_INFO(__i915)->step.media_step)
> +#define INTEL_BASEDIE_STEP(__i915) (RUNTIME_INFO(__i915)->step.basedie_step)
>  
>  #define IS_DISPLAY_STEP(__i915, since, until) \
>  	(drm_WARN_ON(&(__i915)->drm, INTEL_DISPLAY_STEP(__i915) == STEP_NONE), \
> @@ -956,6 +957,10 @@ static inline struct intel_gt *to_gt(struct drm_i915_private *i915)
>  	(drm_WARN_ON(&(__i915)->drm, INTEL_MEDIA_STEP(__i915) == STEP_NONE), \
>  	 INTEL_MEDIA_STEP(__i915) >= (since) && INTEL_MEDIA_STEP(__i915) < (until))
>  
> +#define IS_BASEDIE_STEP(__i915, since, until) \
> +	(drm_WARN_ON(&(__i915)->drm, INTEL_BASEDIE_STEP(__i915) == STEP_NONE), \
> +	 INTEL_BASEDIE_STEP(__i915) >= (since) && INTEL_BASEDIE_STEP(__i915) < (until))
> +
>  static __always_inline unsigned int
>  __platform_mask_index(const struct intel_runtime_info *info,
>  		      enum intel_platform p)
> @@ -1208,6 +1213,14 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
>  	(IS_DG2(__i915) && \
>  	 IS_DISPLAY_STEP(__i915, since, until))
>  
> +#define IS_PVC_BD_STEP(__i915, since, until) \
> +	(IS_PONTEVECCHIO(__i915) && \
> +	 IS_BASEDIE_STEP(__i915, since, until))
> +
> +#define IS_PVC_CT_STEP(__i915, since, until) \
> +	(IS_PONTEVECCHIO(__i915) && \
> +	 IS_GRAPHICS_STEP(__i915, since, until))
> +
>  #define IS_LP(dev_priv)		(INTEL_INFO(dev_priv)->is_lp)
>  #define IS_GEN9_LP(dev_priv)	(GRAPHICS_VER(dev_priv) == 9 && IS_LP(dev_priv))
>  #define IS_GEN9_BC(dev_priv)	(GRAPHICS_VER(dev_priv) == 9 && !IS_LP(dev_priv))
> diff --git a/drivers/gpu/drm/i915/intel_step.c b/drivers/gpu/drm/i915/intel_step.c
> index 74e8e4680028..42b3133d8387 100644
> --- a/drivers/gpu/drm/i915/intel_step.c
> +++ b/drivers/gpu/drm/i915/intel_step.c
> @@ -135,6 +135,8 @@ static const struct intel_step_info adlp_n_revids[] = {
>  	[0x0] = { COMMON_GT_MEDIA_STEP(A0), .display_step = STEP_D0 },
>  };
>  
> +static void pvc_step_init(struct drm_i915_private *i915, int pci_revid);
> +
>  void intel_step_init(struct drm_i915_private *i915)
>  {
>  	const struct intel_step_info *revids = NULL;
> @@ -142,7 +144,10 @@ void intel_step_init(struct drm_i915_private *i915)
>  	int revid = INTEL_REVID(i915);
>  	struct intel_step_info step = {};
>  
> -	if (IS_DG2_G10(i915)) {
> +	if (IS_PONTEVECCHIO(i915)) {
> +		pvc_step_init(i915, revid);
> +		return;
> +	} else if (IS_DG2_G10(i915)) {
>  		revids = dg2_g10_revid_step_tbl;
>  		size = ARRAY_SIZE(dg2_g10_revid_step_tbl);
>  	} else if (IS_DG2_G11(i915)) {
> @@ -235,6 +240,69 @@ void intel_step_init(struct drm_i915_private *i915)
>  	RUNTIME_INFO(i915)->step = step;
>  }
>  
> +#define PVC_BD_REVID	GENMASK(5, 3)
> +#define PVC_CT_REVID	GENMASK(2, 0)
> +
> +static const int pvc_bd_subids[] = {
> +	[0x0] = STEP_A0,
> +	[0x3] = STEP_B0,
> +	[0x4] = STEP_B1,
> +	[0x5] = STEP_B3,
> +};
> +
> +static const int pvc_ct_subids[] = {
> +	[0x3] = STEP_A0,
> +	[0x5] = STEP_B0,
> +	[0x6] = STEP_B1,
> +	[0x7] = STEP_C0,
> +};
> +
> +static int
> +pvc_step_lookup(struct drm_i915_private *i915, const char *type,
> +		const int *table, int size, int subid)
> +{
> +	if (subid < size && table[subid] != STEP_NONE)
> +		return table[subid];
> +
> +	drm_warn(&i915->drm, "Unknown %s id 0x%02x\n", type, subid);
> +
> +	/*
> +	 * As on other platforms, try to use the next higher ID if we land on a
> +	 * gap in the table.
> +	 */
> +	while (subid < size && table[subid] == STEP_NONE)
> +		subid++;
> +
> +	if (subid < size) {
> +		drm_dbg(&i915->drm, "Using steppings for %s id 0x%02x\n",
> +			type, subid);
> +		return table[subid];
> +	}
> +
> +	drm_dbg(&i915->drm, "Using future steppings\n");
> +	return STEP_FUTURE;
> +}
> +
> +/*
> + * PVC needs special handling since we don't lookup the
> + * revid in a table, but rather specific bitfields within
> + * the revid for various components.
> + */
> +static void pvc_step_init(struct drm_i915_private *i915, int pci_revid)
> +{
> +	int ct_subid, bd_subid;
> +
> +	bd_subid = FIELD_GET(PVC_BD_REVID, pci_revid);
> +	ct_subid = FIELD_GET(PVC_CT_REVID, pci_revid);
> +
> +	RUNTIME_INFO(i915)->step.basedie_step =
> +		pvc_step_lookup(i915, "Base Die", pvc_bd_subids,
> +				ARRAY_SIZE(pvc_bd_subids), bd_subid);
> +	RUNTIME_INFO(i915)->step.graphics_step =
> +		pvc_step_lookup(i915, "Compute Tile", pvc_ct_subids,
> +				ARRAY_SIZE(pvc_ct_subids), ct_subid);
> +}
> +
>  #define STEP_NAME_CASE(name)	\
>  	case STEP_##name:	\
>  		return #name;
> diff --git a/drivers/gpu/drm/i915/intel_step.h b/drivers/gpu/drm/i915/intel_step.h
> index d71a99bd5179..a6b12bfa9744 100644
> --- a/drivers/gpu/drm/i915/intel_step.h
> +++ b/drivers/gpu/drm/i915/intel_step.h
> @@ -11,9 +11,10 @@
>  struct drm_i915_private;
>  
>  struct intel_step_info {
> -	u8 graphics_step;
> +	u8 graphics_step;	/* Represents the compute tile on Xe_HPC */
>  	u8 display_step;
>  	u8 media_step;
> +	u8 basedie_step;
>  };
>  
>  #define STEP_ENUM_VAL(name)  STEP_##name,
> @@ -25,6 +26,7 @@ struct intel_step_info {
>  	func(B0)			\
>  	func(B1)			\
>  	func(B2)			\
> +	func(B3)			\
>  	func(C0)			\
>  	func(C1)			\
>  	func(D0)			\
> -- 
> 2.35.3
> 
