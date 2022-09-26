Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D40D5EAD48
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 18:56:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7853510E277;
	Mon, 26 Sep 2022 16:56:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8968E10E277;
 Mon, 26 Sep 2022 16:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664211376; x=1695747376;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=ijXf7XMzPZ9wbA89KdlDB5gv4Ky15GubaBdxnGOTR1g=;
 b=KU2ODPqUHZ2BSFoG5QP8Zd7ZHVxJgbQzm2rLYZ4v7oymHr83na8OIiGs
 5FgJnW5F8IJmF+wctx+v2uMyyEwcNG2v0Y1a/QevgkF9A4e3j/x6r/O0M
 25+HRamCwAGR6SeAZxvGnRP+6bpJsUntfg5kAchoOLllJHDYbLebnKEs2
 yjzKe9I6dz0kEDFMnxu64WyaIH5jhWoOkPiCH9jhVsjHkL/kSBdGzUYVT
 ESPTWyIFh4ueEuNDeIjpF1UQCLbNW4jwpwhbhwcWqmmRMAz8HZVfPZfWW
 HEl/GolCY/lq4Laa+WlqsDYj/GBsO4hLvRHFcTk476+uXp4FRiTsNyadN Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="301065004"
X-IronPort-AV: E=Sophos;i="5.93,346,1654585200"; d="scan'208";a="301065004"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2022 09:56:15 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="949922989"
X-IronPort-AV: E=Sophos;i="5.93,346,1654585200"; d="scan'208";a="949922989"
Received: from lsabisze-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.59.243])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2022 09:56:14 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/i915/mtl: enable local stolen memory
In-Reply-To: <20220926164643.4192603-1-aravind.iddamsetty@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220926164643.4192603-1-aravind.iddamsetty@intel.com>
Date: Mon, 26 Sep 2022 19:55:54 +0300
Message-ID: <87y1u613dx.fsf@intel.com>
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
Cc: lucas.demarchi@intel.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 26 Sep 2022, Aravind Iddamsetty <aravind.iddamsetty@intel.com> wrote:
> As an integrated GPU, MTL does not have local memory and
> HAS_LMEM() returns false.  However the platform's stolen memory
> is presented via BAR2 (i.e., the BAR we traditionally consider
> to be the LMEM BAR) and should be managed by the driver the same
> way that local memory is on dgpu platforms (which includes
> setting the "lmem" bit on page table entries).  We use the term
> "local stolen memory" to refer to this model.
>
> v2:
> 1. dropped is_dsm_invalid, updated valid_stolen_size check from Lucas
> (Jani, Lucas)
> 2. drop lmembar_is_igpu_stolen
> 3. revert to referring GFXMEM_BAR as GEN12_LMEM_BAR (Lucas)
>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>
> Signed-off-by: CQ Tang <cq.tang@intel.com>
> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Original-author: CQ Tang
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_stolen.c | 88 ++++++++++++++++++----
>  drivers/gpu/drm/i915/gt/intel_ggtt.c       |  2 +-
>  drivers/gpu/drm/i915/i915_drv.h            |  3 +
>  3 files changed, 76 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> index c5a4035c99cd..582c4d7d2a9a 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> @@ -77,9 +77,9 @@ void i915_gem_stolen_remove_node(struct drm_i915_private *i915,
>  	mutex_unlock(&i915->mm.stolen_lock);
>  }
>  
> -static bool valid_stolen_size(struct resource *dsm)
> +static bool valid_stolen_size(struct drm_i915_private *i915, struct resource *dsm)
>  {
> -	return dsm->start != 0 && dsm->end > dsm->start;
> +	return (dsm->start != 0 || HAS_BAR2_SMEM_STOLEN(i915)) && dsm->end > dsm->start;
>  }
>  
>  static int adjust_stolen(struct drm_i915_private *i915,
> @@ -88,7 +88,7 @@ static int adjust_stolen(struct drm_i915_private *i915,
>  	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
>  	struct intel_uncore *uncore = ggtt->vm.gt->uncore;
>  
> -	if (!valid_stolen_size(dsm))
> +	if (!valid_stolen_size(i915, dsm))
>  		return -EINVAL;
>  
>  	/*
> @@ -135,7 +135,7 @@ static int adjust_stolen(struct drm_i915_private *i915,
>  		}
>  	}
>  
> -	if (!valid_stolen_size(dsm))
> +	if (!valid_stolen_size(i915, dsm))
>  		return -EINVAL;
>  
>  	return 0;
> @@ -148,9 +148,10 @@ static int request_smem_stolen(struct drm_i915_private *i915,
>  
>  	/*
>  	 * With stolen lmem, we don't need to request system memory for the
> -	 * address range since it's local to the gpu.
> +	 * address range since it's local to the gpu and in some IGFX devices
> +	 * BAR2 is exposed as stolen
>  	 */
> -	if (HAS_LMEM(i915))
> +	if (HAS_LMEM(i915) || HAS_BAR2_SMEM_STOLEN(i915))
>  		return 0;
>  
>  	/*
> @@ -385,8 +386,6 @@ static void icl_get_stolen_reserved(struct drm_i915_private *i915,
>  
>  	drm_dbg(&i915->drm, "GEN6_STOLEN_RESERVED = 0x%016llx\n", reg_val);
>  
> -	*base = reg_val & GEN11_STOLEN_RESERVED_ADDR_MASK;
> -
>  	switch (reg_val & GEN8_STOLEN_RESERVED_SIZE_MASK) {
>  	case GEN8_STOLEN_RESERVED_1M:
>  		*size = 1024 * 1024;
> @@ -404,6 +403,12 @@ static void icl_get_stolen_reserved(struct drm_i915_private *i915,
>  		*size = 8 * 1024 * 1024;
>  		MISSING_CASE(reg_val & GEN8_STOLEN_RESERVED_SIZE_MASK);
>  	}
> +
> +	if (HAS_BAR2_SMEM_STOLEN(i915))
> +		/* the base is initialized to stolen top so subtract size to get base */
> +		*base -= *size;
> +	else
> +		*base = reg_val & GEN11_STOLEN_RESERVED_ADDR_MASK;
>  }
>  
>  /*
> @@ -833,6 +838,34 @@ static const struct intel_memory_region_ops i915_region_stolen_lmem_ops = {
>  	.init_object = _i915_gem_object_stolen_init,
>  };
>  
> +static int get_mtl_gms_size(struct intel_uncore *uncore)

Please always use platform TLA as prefix, not something in the middle of
the function name.

> +{
> +	u16 ggc, gms;
> +
> +	ggc = intel_uncore_read16(uncore, _MMIO(0x108040));

Please define the registers.

> +
> +	/* check GGMS, should be fixed 0x3 (8MB) */
> +	if ((ggc & 0xc0) != 0xc0)
> +		return -EIO;
> +
> +	/* return valid GMS value, -EIO if invalid */
> +	gms = ggc >> 8;
> +	switch (gms) {
> +	case 0x0 ... 0x10:
> +		return gms * 32;
> +	case 0x20:
> +		return 1024;
> +	case 0x30:
> +		return 1536;
> +	case 0x40:
> +		return 2048;
> +	case 0xf0 ... 0xfe:
> +		return (gms - 0xf0 + 1) * 4;
> +	default:
> +		return -EIO;
> +	}
> +}
> +
>  struct intel_memory_region *
>  i915_gem_stolen_lmem_setup(struct drm_i915_private *i915, u16 type,
>  			   u16 instance)
> @@ -843,6 +876,7 @@ i915_gem_stolen_lmem_setup(struct drm_i915_private *i915, u16 type,
>  	struct intel_memory_region *mem;
>  	resource_size_t io_start, io_size;
>  	resource_size_t min_page_size;
> +	int ret;
>  
>  	if (WARN_ON_ONCE(instance))
>  		return ERR_PTR(-ENODEV);
> @@ -850,12 +884,8 @@ i915_gem_stolen_lmem_setup(struct drm_i915_private *i915, u16 type,
>  	if (!i915_pci_resource_valid(pdev, GEN12_LMEM_BAR))
>  		return ERR_PTR(-ENXIO);
>  
> -	/* Use DSM base address instead for stolen memory */
> -	dsm_base = intel_uncore_read64(uncore, GEN12_DSMBASE) & GEN12_BDSM_MASK;
> -	if (IS_DG1(uncore->i915)) {
> +	if (HAS_BAR2_SMEM_STOLEN(i915) || IS_DG1(i915)) {
>  		lmem_size = pci_resource_len(pdev, GEN12_LMEM_BAR);
> -		if (WARN_ON(lmem_size < dsm_base))
> -			return ERR_PTR(-ENODEV);
>  	} else {
>  		resource_size_t lmem_range;
>  
> @@ -864,13 +894,39 @@ i915_gem_stolen_lmem_setup(struct drm_i915_private *i915, u16 type,
>  		lmem_size *= SZ_1G;
>  	}
>  
> -	dsm_size = lmem_size - dsm_base;
> -	if (pci_resource_len(pdev, GEN12_LMEM_BAR) < lmem_size) {
> +	if (HAS_BAR2_SMEM_STOLEN(i915)) {
> +		/*
> +		 * MTL dsm size is in GGC register, not the bar size.
> +		 * also MTL uses offset to DSMBASE in ptes, so i915
> +		 * uses dsm_base = 0 to setup stolen region.
> +		 */
> +		ret = get_mtl_gms_size(uncore);
> +		if (ret < 0) {
> +			drm_err(&i915->drm, "invalid MTL GGC register setting\n");
> +			return ERR_PTR(ret);
> +		}
> +
> +		dsm_base = 0;
> +		dsm_size = (resource_size_t)(ret * SZ_1M);
> +
> +		GEM_BUG_ON(pci_resource_len(pdev, GEN12_LMEM_BAR) != 256 * SZ_1M);
> +		GEM_BUG_ON((dsm_size + 8 * SZ_1M) > lmem_size);
> +	} else {
> +		/* Use DSM base address instead for stolen memory */
> +		dsm_base = intel_uncore_read64(uncore, GEN12_DSMBASE);
> +		if (WARN_ON(lmem_size < dsm_base))
> +			return ERR_PTR(-ENODEV);
> +		dsm_size = lmem_size - dsm_base;
> +	}
> +
> +	io_size = dsm_size;
> +	if (pci_resource_len(pdev, GEN12_LMEM_BAR) < dsm_size) {
>  		io_start = 0;
>  		io_size = 0;
> +	} else if (HAS_BAR2_SMEM_STOLEN(i915)) {
> +		io_start = pci_resource_start(pdev, GEN12_LMEM_BAR) + 8 * SZ_1M;
>  	} else {
>  		io_start = pci_resource_start(pdev, GEN12_LMEM_BAR) + dsm_base;
> -		io_size = dsm_size;
>  	}
>  
>  	min_page_size = HAS_64K_PAGES(i915) ? I915_GTT_PAGE_SIZE_64K :
> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> index 30cf5c3369d9..b31fe0fb013f 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> @@ -931,7 +931,7 @@ static int gen8_gmch_probe(struct i915_ggtt *ggtt)
>  	unsigned int size;
>  	u16 snb_gmch_ctl;
>  
> -	if (!HAS_LMEM(i915)) {
> +	if (!HAS_LMEM(i915) && !HAS_BAR2_SMEM_STOLEN(i915)) {
>  		if (!i915_pci_resource_valid(pdev, GTT_APERTURE_BAR))
>  			return -ENXIO;
>  
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index d830d52ded5d..b33ba0d49bbd 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -975,6 +975,9 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
>  
>  #define HAS_ONE_EU_PER_FUSE_BIT(i915)	(INTEL_INFO(i915)->has_one_eu_per_fuse_bit)
>  
> +#define HAS_BAR2_SMEM_STOLEN(i915) (!HAS_LMEM(i915) && \
> +				    GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70))
> +
>  /* intel_device_info.c */
>  static inline struct intel_device_info *
>  mkwrite_device_info(struct drm_i915_private *dev_priv)

-- 
Jani Nikula, Intel Open Source Graphics Center
