Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 552F6769436
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 13:06:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1140A10E260;
	Mon, 31 Jul 2023 11:06:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD90F10E260;
 Mon, 31 Jul 2023 11:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690801603; x=1722337603;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=U22W154T7l+8t1Ma+k1W2jJfVH4CV8G1PTIyGsQ1oME=;
 b=Vfq+FdZNlMCbGudy0Tb87j3ykoFf1HGxv4LTRRmMg0cNb7sORktYa6dA
 JjM649LA+ASPlyQdsxG6D+OlSki6ifb8Mci43jLeHih0p5Wo/k4/MmqPS
 V1dyPYeuKdh7vl5zG1zA731eX0+gVf7Pnj1iMEgpxli4Mie34Px+EHWqG
 eX3KMfDAXr85liQYFSUo3culItEQnpc7NTeJ4ioODjjlM9ey/B4gl6HlF
 Bh4sx7dcNCaRlO0+6rntDUKs89BsL8sf7e5/HodNnlZPrMhAUv/9PzpUi
 0INPQ/q0TIrt+qfK29mRWG0kiYXkNNrZGonigIZMVCXlzAkEcZUCdwK43 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="369001985"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; d="scan'208";a="369001985"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 04:06:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="902076821"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; d="scan'208";a="902076821"
Received: from naikshri-mobl7.ger.corp.intel.com (HELO localhost)
 ([10.252.36.230])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 04:06:40 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>, Andi Shyti
 <andi.shyti@linux.intel.com>
Subject: Re: [PATCH] drm/i915: Replace i915->gt0 with to_gt(i915)
In-Reply-To: <20230725103330.1041394-1-andi.shyti@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230725103330.1041394-1-andi.shyti@linux.intel.com>
Date: Mon, 31 Jul 2023 14:06:37 +0300
Message-ID: <874jlkxruq.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 25 Jul 2023, Andi Shyti <andi.shyti@linux.intel.com> wrote:
> Quite surprised to see that around i915 there are still i915->gt0
> references. Replace them with the to_gt() helper.

Please remind me why we still have i915->gt0 at all. Why aren't we just
using i915->gt[0] instead?

BR,
Jani.

>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_stolen.c       | 2 +-
>  drivers/gpu/drm/i915/gt/intel_gt.c               | 2 +-
>  drivers/gpu/drm/i915/gt/intel_region_lmem.c      | 2 +-
>  drivers/gpu/drm/i915/pxp/intel_pxp.c             | 8 ++++----
>  drivers/gpu/drm/i915/selftests/mock_gem_device.c | 2 +-
>  5 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> index 3b094d36a0b04..5b0a5cf9a98a8 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> @@ -892,7 +892,7 @@ i915_gem_stolen_lmem_setup(struct drm_i915_private *i915, u16 type,
>  	} else {
>  		resource_size_t lmem_range;
>  
> -		lmem_range = intel_gt_mcr_read_any(&i915->gt0, XEHP_TILE0_ADDR_RANGE) & 0xFFFF;
> +		lmem_range = intel_gt_mcr_read_any(to_gt(i915), XEHP_TILE0_ADDR_RANGE) & 0xFFFF;
>  		lmem_size = lmem_range >> XEHP_TILE_LMEM_RANGE_SHIFT;
>  		lmem_size *= SZ_1G;
>  	}
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> index 9f64d61dd5fcd..02886c1eb0f17 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -887,7 +887,7 @@ static int intel_gt_tile_setup(struct intel_gt *gt, phys_addr_t phys_addr)
>  int intel_gt_probe_all(struct drm_i915_private *i915)
>  {
>  	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
> -	struct intel_gt *gt = &i915->gt0;
> +	struct intel_gt *gt = to_gt(i915);
>  	const struct intel_gt_definition *gtdef;
>  	phys_addr_t phys_addr;
>  	unsigned int mmio_bar;
> diff --git a/drivers/gpu/drm/i915/gt/intel_region_lmem.c b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
> index 2a3217e2890fc..f8512aee58a83 100644
> --- a/drivers/gpu/drm/i915/gt/intel_region_lmem.c
> +++ b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
> @@ -220,7 +220,7 @@ static struct intel_memory_region *setup_lmem(struct intel_gt *gt)
>  		resource_size_t lmem_range;
>  		u64 tile_stolen, flat_ccs_base;
>  
> -		lmem_range = intel_gt_mcr_read_any(&i915->gt0, XEHP_TILE0_ADDR_RANGE) & 0xFFFF;
> +		lmem_range = intel_gt_mcr_read_any(to_gt(i915), XEHP_TILE0_ADDR_RANGE) & 0xFFFF;
>  		lmem_size = lmem_range >> XEHP_TILE_LMEM_RANGE_SHIFT;
>  		lmem_size *= SZ_1G;
>  
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.c b/drivers/gpu/drm/i915/pxp/intel_pxp.c
> index bb2e15329f346..38ec754d0ec8e 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp.c
> @@ -162,8 +162,8 @@ static struct intel_gt *find_gt_for_required_teelink(struct drm_i915_private *i9
>  	 * for HuC authentication. For now, its limited to DG2.
>  	 */
>  	if (IS_ENABLED(CONFIG_INTEL_MEI_PXP) && IS_ENABLED(CONFIG_INTEL_MEI_GSC) &&
> -	    intel_huc_is_loaded_by_gsc(&i915->gt0.uc.huc) && intel_uc_uses_huc(&i915->gt0.uc))
> -		return &i915->gt0;
> +	    intel_huc_is_loaded_by_gsc(&to_gt(i915)->uc.huc) && intel_uc_uses_huc(&to_gt(i915)->uc))
> +		return to_gt(i915);
>  
>  	return NULL;
>  }
> @@ -188,8 +188,8 @@ static struct intel_gt *find_gt_for_required_protected_content(struct drm_i915_p
>  	 * Else we rely on mei-pxp module but only on legacy platforms
>  	 * prior to having separate media GTs and has a valid VDBOX.
>  	 */
> -	if (IS_ENABLED(CONFIG_INTEL_MEI_PXP) && !i915->media_gt && VDBOX_MASK(&i915->gt0))
> -		return &i915->gt0;
> +	if (IS_ENABLED(CONFIG_INTEL_MEI_PXP) && !i915->media_gt && VDBOX_MASK(to_gt(i915)))
> +		return to_gt(i915);
>  
>  	return NULL;
>  }
> diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.c b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> index 12aa7fbb07481..da0b269606c51 100644
> --- a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> +++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> @@ -114,7 +114,7 @@ static struct dev_pm_domain pm_domain = {
>  
>  static void mock_gt_probe(struct drm_i915_private *i915)
>  {
> -	i915->gt[0] = &i915->gt0;
> +	i915->gt[0] = to_gt(i915);
>  	i915->gt[0]->name = "Mock GT";
>  }

-- 
Jani Nikula, Intel Open Source Graphics Center
