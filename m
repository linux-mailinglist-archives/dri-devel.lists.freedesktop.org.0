Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B864798A6
	for <lists+dri-devel@lfdr.de>; Sat, 18 Dec 2021 05:46:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FCEE10EB6E;
	Sat, 18 Dec 2021 04:46:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E760610EB6E;
 Sat, 18 Dec 2021 04:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639802778; x=1671338778;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=uomp2kTPePFBc++1qmdEPUkA2GkzFUtYCvnXTb7XBfU=;
 b=D0GASCWqHz1L5j4jRFfx9dexWVDMPdFhg7oc1DKjcytRBTKJsyZ5mB8c
 5XGsmhy9TipmYN7pIJztP826Mn44USu0aRQ7KibgMpxWABj+CswXlXfvE
 YPKev1bCclILXHM81g86ODLOjFO7cID01shlC8i7eszp1wVyJOkbbrdZ4
 oJm7rIVLcqQUEp5uwQR7qYSn1kOJRhab27rOQ0EhJBwsro8dMgCRGGaT8
 avZ9uf73Ogtg4qoL2PsqGzFOwOKP37wek9pIMi7ADuGDXWg20GRidIO96
 HTbQfLAbcJrrUCzlB4ina72/vCbKcmLX7RQwSjV2S/svmx7uB3kodovyV w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10201"; a="219898688"
X-IronPort-AV: E=Sophos;i="5.88,215,1635231600"; d="scan'208";a="219898688"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2021 20:46:18 -0800
X-IronPort-AV: E=Sophos;i="5.88,215,1635231600"; d="scan'208";a="520044101"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.134])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2021 20:46:17 -0800
Date: Fri, 17 Dec 2021 20:46:16 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH v8 13/16] drm/i915/gt: Use to_gt() helper for GGTT accesses
Message-ID: <Yb1nmDqP0N6hR/C4@mdroper-desk1.amr.corp.intel.com>
References: <20211214193346.21231-1-andi.shyti@linux.intel.com>
 <20211214193346.21231-14-andi.shyti@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211214193346.21231-14-andi.shyti@linux.intel.com>
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
Cc: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 DRI Devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, Andi Shyti <andi@etezian.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 14, 2021 at 09:33:43PM +0200, Andi Shyti wrote:
> From: Michał Winiarski <michal.winiarski@intel.com>
> 
> GGTT is currently available both through i915->ggtt and gt->ggtt, and we
> eventually want to get rid of the i915->ggtt one.
> Use to_gt() for all i915->ggtt accesses to help with the future
> refactoring.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/intel_ggtt.c         | 14 +++++++-------
>  drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c |  6 +++---
>  drivers/gpu/drm/i915/gt/intel_region_lmem.c  |  4 ++--
>  drivers/gpu/drm/i915/gt/selftest_reset.c     |  2 +-
>  4 files changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> index 971e737b37b2..ec3b998392ff 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> @@ -89,7 +89,7 @@ int i915_ggtt_init_hw(struct drm_i915_private *i915)
>  	 * beyond the end of the batch buffer, across the page boundary,
>  	 * and beyond the end of the GTT if we do not provide a guard.
>  	 */
> -	ret = ggtt_init_hw(&i915->ggtt);
> +	ret = ggtt_init_hw(to_gt(i915)->ggtt);
>  	if (ret)
>  		return ret;
>  
> @@ -725,14 +725,14 @@ int i915_init_ggtt(struct drm_i915_private *i915)
>  {
>  	int ret;
>  
> -	ret = init_ggtt(&i915->ggtt);
> +	ret = init_ggtt(to_gt(i915)->ggtt);
>  	if (ret)
>  		return ret;
>  
>  	if (INTEL_PPGTT(i915) == INTEL_PPGTT_ALIASING) {
> -		ret = init_aliasing_ppgtt(&i915->ggtt);
> +		ret = init_aliasing_ppgtt(to_gt(i915)->ggtt);
>  		if (ret)
> -			cleanup_init_ggtt(&i915->ggtt);
> +			cleanup_init_ggtt(to_gt(i915)->ggtt);
>  	}
>  
>  	return 0;
> @@ -775,7 +775,7 @@ static void ggtt_cleanup_hw(struct i915_ggtt *ggtt)
>   */
>  void i915_ggtt_driver_release(struct drm_i915_private *i915)
>  {
> -	struct i915_ggtt *ggtt = &i915->ggtt;
> +	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
>  
>  	fini_aliasing_ppgtt(ggtt);
>  
> @@ -790,7 +790,7 @@ void i915_ggtt_driver_release(struct drm_i915_private *i915)
>   */
>  void i915_ggtt_driver_late_release(struct drm_i915_private *i915)
>  {
> -	struct i915_ggtt *ggtt = &i915->ggtt;
> +	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
>  
>  	GEM_WARN_ON(kref_read(&ggtt->vm.resv_ref) != 1);
>  	dma_resv_fini(&ggtt->vm._resv);
> @@ -1232,7 +1232,7 @@ int i915_ggtt_probe_hw(struct drm_i915_private *i915)
>  {
>  	int ret;
>  
> -	ret = ggtt_probe_hw(&i915->ggtt, to_gt(i915));
> +	ret = ggtt_probe_hw(to_gt(i915)->ggtt, to_gt(i915));
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c b/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
> index f8948de72036..beabf3bc9b75 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
> @@ -728,8 +728,8 @@ static void detect_bit_6_swizzle(struct i915_ggtt *ggtt)
>  		swizzle_y = I915_BIT_6_SWIZZLE_NONE;
>  	}
>  
> -	i915->ggtt.bit_6_swizzle_x = swizzle_x;
> -	i915->ggtt.bit_6_swizzle_y = swizzle_y;
> +	to_gt(i915)->ggtt->bit_6_swizzle_x = swizzle_x;
> +	to_gt(i915)->ggtt->bit_6_swizzle_y = swizzle_y;
>  }
>  
>  /*
> @@ -896,7 +896,7 @@ void intel_gt_init_swizzling(struct intel_gt *gt)
>  	struct intel_uncore *uncore = gt->uncore;
>  
>  	if (GRAPHICS_VER(i915) < 5 ||
> -	    i915->ggtt.bit_6_swizzle_x == I915_BIT_6_SWIZZLE_NONE)
> +	    to_gt(i915)->ggtt->bit_6_swizzle_x == I915_BIT_6_SWIZZLE_NONE)
>  		return;
>  
>  	intel_uncore_rmw(uncore, DISP_ARB_CTL, 0, DISP_TILE_SURFACE_SWIZZLING);
> diff --git a/drivers/gpu/drm/i915/gt/intel_region_lmem.c b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
> index fde2dcb59809..21215a080088 100644
> --- a/drivers/gpu/drm/i915/gt/intel_region_lmem.c
> +++ b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
> @@ -15,7 +15,7 @@
>  static int init_fake_lmem_bar(struct intel_memory_region *mem)
>  {
>  	struct drm_i915_private *i915 = mem->i915;
> -	struct i915_ggtt *ggtt = &i915->ggtt;
> +	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
>  	unsigned long n;
>  	int ret;
>  
> @@ -131,7 +131,7 @@ intel_gt_setup_fake_lmem(struct intel_gt *gt)
>  	if (!i915->params.fake_lmem_start)
>  		return ERR_PTR(-ENODEV);
>  
> -	GEM_BUG_ON(i915_ggtt_has_aperture(&i915->ggtt));
> +	GEM_BUG_ON(i915_ggtt_has_aperture(to_gt(i915)->ggtt));
>  
>  	/* Your mappable aperture belongs to me now! */
>  	mappable_end = pci_resource_len(pdev, 2);
> diff --git a/drivers/gpu/drm/i915/gt/selftest_reset.c b/drivers/gpu/drm/i915/gt/selftest_reset.c
> index 8a873f6bda7f..37c38bdd5f47 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_reset.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_reset.c
> @@ -19,7 +19,7 @@ __igt_reset_stolen(struct intel_gt *gt,
>  		   intel_engine_mask_t mask,
>  		   const char *msg)
>  {
> -	struct i915_ggtt *ggtt = &gt->i915->ggtt;
> +	struct i915_ggtt *ggtt = gt->ggtt;
>  	const struct resource *dsm = &gt->i915->dsm;
>  	resource_size_t num_pages, page;
>  	struct intel_engine_cs *engine;
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
