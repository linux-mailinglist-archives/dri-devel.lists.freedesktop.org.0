Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 070575E76DC
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 11:24:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17BEE10E7E4;
	Fri, 23 Sep 2022 09:24:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C35610E7DF;
 Fri, 23 Sep 2022 09:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663925088; x=1695461088;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=pNjHEkwxfi1AXbSix1Z/2J7/i9ojeMUJeRzZ+oK2380=;
 b=B2sTV4RS/rrarZ/QiG6ox02pHtbUOikNsYFusvV1pG93Oj3sTcLfp8F3
 or1vB8z1VpSBpu989/L1SV4+J7voYge6uGraiqMjbwjMcTqw1I2eOO3bB
 JC0H6/sL3HOhnx4sJKwawDP7JDLShXZ985+cfr1yR7HUsj/foHBj6Tnp7
 GQ6C4C/y0wiDXjdI/KatRnoT/025N/O2ThMZoCnwOB3zabKufXTloMI1h
 sCS1SOQSNx1nllDgkjYfJGgfjw6JeeFWj197lpiN4iHRTMQmSwcF6cSFo
 jmt7dT7UtZP3T5CBLeh/P1MeY2qnHf6somCr1OYCrWhO0JRc1KAbqorTi w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="283649590"
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; d="scan'208";a="283649590"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2022 02:24:47 -0700
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; d="scan'208";a="688657383"
Received: from armannov-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.61.93])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2022 02:24:45 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 intel-gfx@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 5/7] drm/i915/mtl: Handle wopcm per-GT and
 limit calculations.
In-Reply-To: <20220922221117.458087-6-daniele.ceraolospurio@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220922221117.458087-1-daniele.ceraolospurio@intel.com>
 <20220922221117.458087-6-daniele.ceraolospurio@intel.com>
Date: Fri, 23 Sep 2022 12:24:27 +0300
Message-ID: <87edw24f5g.fsf@intel.com>
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
Cc: dri-devel@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 22 Sep 2022, Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com> wrote:
> From: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>
> With MTL standalone media architecture the wopcm layout has changed with
> separate partitioning in WOPCM for GCD/GT GuC and SA Media GuC. The size
> of WOPCM is 4MB with lower 2MB for SA Media and upper 2MB for GCD/GT.
>
>     +=====+===> +====================+ <== WOPCM TOP
>     ^     ^     |                    |
>     |     |     |                    |
>     |    GCD    |   GCD RC6 Image    |
>     |    GuC    |    Power Context   |
>     |    WOPCM  |                    |
>     |    Size   +--------------------+
>     |     |     |   GCD GuC Image    |
>     |     |     |                    |
>     |     v     |                    |
>     |     +===> +====================+ <== SA Media GuC WOPCM Top
>     |     ^     |                    |
>     |   SA Media|                    |
>     |    GuC    | SA Media RC6 Image |
>     |   WOPCM   |    Power Context   |
>     |    Size   |                    |
>   WOPCM   |     +--------------------+
>     |     |     |                    |
>     |     |     | SA Media GuC Image |
>     |     v     |                    |
>     |     +===> +====================+ <== GuC WOPCM base
>     |           |     WOPCM RSVD     |
>     |           +------------------- + <== HuC Firmware Top
>     v           |      HuC FW        |
>     +=========> +====================+ <== WOPCM Base
>
> Given that MTL has GuC deprivilege, the WOPCM registers are pre-locked
> by the bios. Therefore, we can skip all the math for the partitioning
> and just limit ourselves to sanity checking the values.
>
> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: John Harrison <john.c.harrison@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>  drivers/gpu/drm/i915/Makefile               |  7 +--
>  drivers/gpu/drm/i915/gt/intel_ggtt.c        |  2 +-
>  drivers/gpu/drm/i915/gt/intel_gt.c          |  1 +
>  drivers/gpu/drm/i915/gt/intel_gt_types.h    |  2 +
>  drivers/gpu/drm/i915/{ => gt}/intel_wopcm.c | 48 +++++++++++++++------
>  drivers/gpu/drm/i915/{ => gt}/intel_wopcm.h |  0
>  drivers/gpu/drm/i915/gt/uc/intel_uc.c       |  4 +-
>  drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c    | 14 +++---
>  drivers/gpu/drm/i915/i915_driver.c          |  2 -
>  drivers/gpu/drm/i915/i915_drv.h             |  3 --
>  drivers/gpu/drm/i915/i915_gem.c             |  5 ++-
>  11 files changed, 56 insertions(+), 32 deletions(-)
>  rename drivers/gpu/drm/i915/{ => gt}/intel_wopcm.c (86%)
>  rename drivers/gpu/drm/i915/{ => gt}/intel_wopcm.h (100%)
>
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index a26edcdadc21..6ed4c745b226 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -129,7 +129,9 @@ gt-y += \
>  	gt/intel_timeline.o \
>  	gt/intel_workarounds.o \
>  	gt/shmem_utils.o \
> -	gt/sysfs_engines.o
> +	gt/sysfs_engines.o \
> +	gt/intel_wopcm.o

The comment near the top of the file:

# Please keep these build lists sorted!

> +
>  # x86 intel-gtt module support
>  gt-$(CONFIG_X86) += gt/intel_ggtt_gmch.o
>  # autogenerated null render state
> @@ -183,8 +185,7 @@ i915-y += \
>  	  i915_trace_points.o \
>  	  i915_ttm_buddy_manager.o \
>  	  i915_vma.o \
> -	  i915_vma_resource.o \
> -	  intel_wopcm.o
> +	  i915_vma_resource.o
>  
>  # general-purpose microcontroller (GuC) support
>  i915-y += gt/uc/intel_uc.o \
> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> index 30cf5c3369d9..605e1aa674d4 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> @@ -560,7 +560,7 @@ static int init_ggtt(struct i915_ggtt *ggtt)
>  	 * why.
>  	 */
>  	ggtt->pin_bias = max_t(u32, I915_GTT_PAGE_SIZE,
> -			       intel_wopcm_guc_size(&ggtt->vm.i915->wopcm));
> +			       intel_wopcm_guc_size(&ggtt->vm.gt->wopcm));
>  
>  	ret = intel_vgt_balloon(ggtt);
>  	if (ret)
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> index b367cfff48d5..a95eb0b656d2 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -56,6 +56,7 @@ void intel_gt_common_init_early(struct intel_gt *gt)
>  	seqcount_mutex_init(&gt->tlb.seqno, &gt->tlb.invalidate_lock);
>  	intel_gt_pm_init_early(gt);
>  
> +	intel_wopcm_init_early(&gt->wopcm);
>  	intel_uc_init_early(&gt->uc);
>  	intel_rps_init_early(&gt->rps);
>  }
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
> index f19c2de77ff6..c20a32d2700f 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
> @@ -30,6 +30,7 @@
>  #include "intel_migrate_types.h"
>  #include "intel_wakeref.h"
>  #include "pxp/intel_pxp_types.h"
> +#include "intel_wopcm.h"
>  
>  struct drm_i915_private;
>  struct i915_ggtt;
> @@ -97,6 +98,7 @@ struct intel_gt {
>  
>  	struct intel_uc uc;
>  	struct intel_gsc gsc;
> +	struct intel_wopcm wopcm;
>  
>  	struct {
>  		/* Serialize global tlb invalidations */
> diff --git a/drivers/gpu/drm/i915/intel_wopcm.c b/drivers/gpu/drm/i915/gt/intel_wopcm.c
> similarity index 86%
> rename from drivers/gpu/drm/i915/intel_wopcm.c
> rename to drivers/gpu/drm/i915/gt/intel_wopcm.c
> index 322fb9eeb880..487fbbbdf3d6 100644
> --- a/drivers/gpu/drm/i915/intel_wopcm.c
> +++ b/drivers/gpu/drm/i915/gt/intel_wopcm.c
> @@ -43,6 +43,7 @@
>  /* Default WOPCM size is 2MB from Gen11, 1MB on previous platforms */
>  #define GEN11_WOPCM_SIZE		SZ_2M
>  #define GEN9_WOPCM_SIZE			SZ_1M
> +#define XELPM_SAMEDIA_WOPCM_SIZE	SZ_2M
>  #define MAX_WOPCM_SIZE			SZ_8M
>  /* 16KB WOPCM (RSVD WOPCM) is reserved from HuC firmware top. */
>  #define WOPCM_RESERVED_SIZE		SZ_16K
> @@ -64,9 +65,9 @@
>  #define GEN9_GUC_FW_RESERVED	SZ_128K
>  #define GEN9_GUC_WOPCM_OFFSET	(GUC_WOPCM_RESERVED + GEN9_GUC_FW_RESERVED)
>  
> -static inline struct drm_i915_private *wopcm_to_i915(struct intel_wopcm *wopcm)
> +static inline struct intel_gt *wopcm_to_gt(struct intel_wopcm *wopcm)
>  {
> -	return container_of(wopcm, struct drm_i915_private, wopcm);
> +	return container_of(wopcm, struct intel_gt, wopcm);
>  }
>  
>  /**
> @@ -77,7 +78,8 @@ static inline struct drm_i915_private *wopcm_to_i915(struct intel_wopcm *wopcm)
>   */
>  void intel_wopcm_init_early(struct intel_wopcm *wopcm)
>  {
> -	struct drm_i915_private *i915 = wopcm_to_i915(wopcm);
> +	struct intel_gt *gt = wopcm_to_gt(wopcm);
> +	struct drm_i915_private *i915 = gt->i915;
>  
>  	if (!HAS_GT_UC(i915))
>  		return;
> @@ -157,14 +159,18 @@ static bool check_hw_restrictions(struct drm_i915_private *i915,
>  	return true;
>  }
>  
> -static bool __check_layout(struct drm_i915_private *i915, u32 wopcm_size,
> +static bool __check_layout(struct intel_gt *gt, u32 wopcm_size,
>  			   u32 guc_wopcm_base, u32 guc_wopcm_size,
>  			   u32 guc_fw_size, u32 huc_fw_size)
>  {
> +	struct drm_i915_private *i915 = gt->i915;
>  	const u32 ctx_rsvd = context_reserved_size(i915);
>  	u32 size;
>  
>  	size = wopcm_size - ctx_rsvd;
> +	if (MEDIA_VER(i915) >= 13)
> +		size += XELPM_SAMEDIA_WOPCM_SIZE;
> +
>  	if (unlikely(range_overflows(guc_wopcm_base, guc_wopcm_size, size))) {
>  		drm_err(&i915->drm,
>  			"WOPCM: invalid GuC region layout: %uK + %uK > %uK\n",
> @@ -181,12 +187,14 @@ static bool __check_layout(struct drm_i915_private *i915, u32 wopcm_size,
>  		return false;
>  	}
>  
> -	size = huc_fw_size + WOPCM_RESERVED_SIZE;
> -	if (unlikely(guc_wopcm_base < size)) {
> -		drm_err(&i915->drm, "WOPCM: no space for %s: %uK < %uK\n",
> -			intel_uc_fw_type_repr(INTEL_UC_FW_TYPE_HUC),
> -			guc_wopcm_base / SZ_1K, size / SZ_1K);
> -		return false;
> +	if (VDBOX_MASK(gt)) {
> +		size = huc_fw_size + WOPCM_RESERVED_SIZE;
> +		if (unlikely(guc_wopcm_base < size)) {
> +			drm_err(&i915->drm, "WOPCM: no space for %s: %uK < %uK\n",
> +				intel_uc_fw_type_repr(INTEL_UC_FW_TYPE_HUC),
> +				guc_wopcm_base / SZ_1K, size / SZ_1K);
> +			return false;
> +		}
>  	}
>  
>  	return check_hw_restrictions(i915, guc_wopcm_base, guc_wopcm_size,
> @@ -228,8 +236,8 @@ static bool __wopcm_regs_writable(struct intel_uncore *uncore)
>   */
>  void intel_wopcm_init(struct intel_wopcm *wopcm)
>  {
> -	struct drm_i915_private *i915 = wopcm_to_i915(wopcm);
> -	struct intel_gt *gt = to_gt(i915);
> +	struct intel_gt *gt = wopcm_to_gt(wopcm);
> +	struct drm_i915_private *i915 = gt->i915;
>  	u32 guc_fw_size = intel_uc_fw_get_upload_size(&gt->uc.guc.fw);
>  	u32 huc_fw_size = intel_uc_fw_get_upload_size(&gt->uc.huc.fw);
>  	u32 ctx_rsvd = context_reserved_size(i915);
> @@ -274,6 +282,19 @@ void intel_wopcm_init(struct intel_wopcm *wopcm)
>  		goto check;
>  	}
>  
> +	/*
> +	 * On platforms with a media GT, the WOPCM is partitioned between the
> +	 * two GTs, so we would have to take that into account when doing the
> +	 * math below. There is also a new section reserved for the GSC ctx
> +	 * that w would have to factor in. However, all platforms with a media
> +	 * GT also have GuC depriv enabled, so the WOPCM regs are pre-locked
> +	 * and therefore we don't have to do the math ourselves.
> +	 */
> +	if (unlikely(i915->media_gt)) {
> +		drm_err(&i915->drm, "Unlocked WOPCM regs with media GT\n");
> +		return;
> +	}
> +
>  	/*
>  	 * Aligned value of guc_wopcm_base will determine available WOPCM space
>  	 * for HuC firmware and mandatory reserved area.
> @@ -289,13 +310,14 @@ void intel_wopcm_init(struct intel_wopcm *wopcm)
>  
>  	/* Aligned remainings of usable WOPCM space can be assigned to GuC. */
>  	guc_wopcm_size = wopcm_size - ctx_rsvd - guc_wopcm_base;
> +
>  	guc_wopcm_size &= GUC_WOPCM_SIZE_MASK;
>  
>  	drm_dbg(&i915->drm, "Calculated GuC WOPCM [%uK, %uK)\n",
>  		guc_wopcm_base / SZ_1K, guc_wopcm_size / SZ_1K);
>  
>  check:
> -	if (__check_layout(i915, wopcm_size, guc_wopcm_base, guc_wopcm_size,
> +	if (__check_layout(gt, wopcm_size, guc_wopcm_base, guc_wopcm_size,
>  			   guc_fw_size, huc_fw_size)) {
>  		wopcm->guc.base = guc_wopcm_base;
>  		wopcm->guc.size = guc_wopcm_size;
> diff --git a/drivers/gpu/drm/i915/intel_wopcm.h b/drivers/gpu/drm/i915/gt/intel_wopcm.h
> similarity index 100%
> rename from drivers/gpu/drm/i915/intel_wopcm.h
> rename to drivers/gpu/drm/i915/gt/intel_wopcm.h
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> index dbd048b77e19..4cd8a787f9e5 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> @@ -357,8 +357,8 @@ static int uc_init_wopcm(struct intel_uc *uc)
>  {
>  	struct intel_gt *gt = uc_to_gt(uc);
>  	struct intel_uncore *uncore = gt->uncore;
> -	u32 base = intel_wopcm_guc_base(&gt->i915->wopcm);
> -	u32 size = intel_wopcm_guc_size(&gt->i915->wopcm);
> +	u32 base = intel_wopcm_guc_base(&gt->wopcm);
> +	u32 size = intel_wopcm_guc_size(&gt->wopcm);
>  	u32 huc_agent = intel_uc_uses_huc(uc) ? HUC_LOADING_AGENT_GUC : 0;
>  	u32 mask;
>  	int err;
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> index d6ca772e9f4b..a9ff9abb66db 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> @@ -469,10 +469,11 @@ static int check_gsc_manifest(const struct firmware *fw,
>  	return 0;
>  }
>  
> -static int check_ccs_header(struct drm_i915_private *i915,
> +static int check_ccs_header(struct intel_gt *gt,
>  			    const struct firmware *fw,
>  			    struct intel_uc_fw *uc_fw)
>  {
> +	struct drm_i915_private *i915 = gt->i915;
>  	struct uc_css_header *css;
>  	size_t size;
>  
> @@ -514,10 +515,10 @@ static int check_ccs_header(struct drm_i915_private *i915,
>  
>  	/* Sanity check whether this fw is not larger than whole WOPCM memory */
>  	size = __intel_uc_fw_get_upload_size(uc_fw);
> -	if (unlikely(size >= i915->wopcm.size)) {
> +	if (unlikely(size >= gt->wopcm.size)) {
>  		drm_warn(&i915->drm, "%s firmware %s: invalid size: %zu > %zu\n",
>  			 intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path,
> -			 size, (size_t)i915->wopcm.size);
> +			 size, (size_t)gt->wopcm.size);
>  		return -E2BIG;
>  	}
>  
> @@ -545,7 +546,8 @@ static int check_ccs_header(struct drm_i915_private *i915,
>   */
>  int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
>  {
> -	struct drm_i915_private *i915 = __uc_fw_to_gt(uc_fw)->i915;
> +	struct intel_gt *gt = __uc_fw_to_gt(uc_fw);
> +	struct drm_i915_private *i915 = gt->i915;
>  	struct intel_uc_fw_file file_ideal;
>  	struct device *dev = i915->drm.dev;
>  	struct drm_i915_gem_object *obj;
> @@ -553,7 +555,7 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
>  	bool old_ver = false;
>  	int err;
>  
> -	GEM_BUG_ON(!i915->wopcm.size);
> +	GEM_BUG_ON(!gt->wopcm.size);
>  	GEM_BUG_ON(!intel_uc_fw_is_enabled(uc_fw));
>  
>  	err = i915_inject_probe_error(i915, -ENXIO);
> @@ -595,7 +597,7 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
>  	if (uc_fw->loaded_via_gsc)
>  		err = check_gsc_manifest(fw, uc_fw);
>  	else
> -		err = check_ccs_header(i915, fw, uc_fw);
> +		err = check_ccs_header(gt, fw, uc_fw);
>  	if (err)
>  		goto fail;
>  
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> index 9d1fc2477f80..51fc030774fa 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -369,8 +369,6 @@ static int i915_driver_early_probe(struct drm_i915_private *dev_priv)
>  	if (ret)
>  		goto err_ttm;
>  
> -	intel_wopcm_init_early(&dev_priv->wopcm);
> -
>  	ret = intel_root_gt_init_early(dev_priv);
>  	if (ret < 0)
>  		goto err_rootgt;
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index 8ca575202e5d..587e43ad7941 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -63,7 +63,6 @@
>  #include "intel_runtime_pm.h"
>  #include "intel_step.h"
>  #include "intel_uncore.h"
> -#include "intel_wopcm.h"
>  
>  struct drm_i915_clock_gating_funcs;
>  struct drm_i915_gem_object;
> @@ -236,8 +235,6 @@ struct drm_i915_private {
>  
>  	struct intel_gvt *gvt;
>  
> -	struct intel_wopcm wopcm;
> -
>  	struct pci_dev *bridge_dev;
>  
>  	struct rb_root uabi_engines;
> diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
> index a5b192ac885c..cfc8b17c1ee5 100644
> --- a/drivers/gpu/drm/i915/i915_gem.c
> +++ b/drivers/gpu/drm/i915/i915_gem.c
> @@ -1140,9 +1140,10 @@ int i915_gem_init(struct drm_i915_private *dev_priv)
>  	if (ret)
>  		return ret;
>  
> -	for_each_gt(gt, dev_priv, i)
> +	for_each_gt(gt, dev_priv, i) {
>  		intel_uc_fetch_firmwares(&gt->uc);
> -	intel_wopcm_init(&dev_priv->wopcm);
> +		intel_wopcm_init(&gt->wopcm);
> +	}
>  
>  	ret = i915_init_ggtt(dev_priv);
>  	if (ret) {

-- 
Jani Nikula, Intel Open Source Graphics Center
