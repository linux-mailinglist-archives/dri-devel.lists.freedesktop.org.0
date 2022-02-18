Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 410254BC191
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 22:13:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFAE910E131;
	Fri, 18 Feb 2022 21:13:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F1FB10E12F;
 Fri, 18 Feb 2022 21:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645218796; x=1676754796;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=N35qTOIpoLwgYGB1YMNRcCSkLn7wf6dixVHQ7YnZ5Z8=;
 b=IHasWULFBK+g4B8YWtNwZkecHk1v//Jas5ISLthMpCV9XWi14EVCKogC
 CEGqegTFjyz06fV29la/TAzeKeacvjSCu2VB8vWtYR20tnOlb3euYzZuQ
 V7PUmPp/4JE+7JK9q6eJS28xq7gfX8qcWYFN03Cxl+O+MeCDW9IRhDtzT
 VHBKD0e7joiBnqdUFuFo0aptL68NywUuPX0YsTHy1rZcmmffKAwZDFXXp
 OPXGT8LlyZnVLGH1A5fTnwtXXnn8dVeTJTVuP1kOLfSFNeWyTJKeegls8
 2UUzNLsng2G5mMFtsEm69O49Cj3x81pELBNkhPxF8fBixtap2/XdRf05U A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10262"; a="238632538"
X-IronPort-AV: E=Sophos;i="5.88,379,1635231600"; d="scan'208";a="238632538"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 13:13:15 -0800
X-IronPort-AV: E=Sophos;i="5.88,379,1635231600"; d="scan'208";a="626741893"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 13:13:15 -0800
Date: Fri, 18 Feb 2022 13:07:25 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH v3 15/16] drm/i915/guc: Convert __guc_ads_init to iosys_map
Message-ID: <20220218210724.GA3807@jons-linux-dev-box>
References: <20220216174147.3073235-1-lucas.demarchi@intel.com>
 <20220216174147.3073235-16-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220216174147.3073235-16-lucas.demarchi@intel.com>
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
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 16, 2022 at 09:41:46AM -0800, Lucas De Marchi wrote:
> Now that all the called functions from __guc_ads_init() are converted to
> use ads_map, stop using ads_blob in __guc_ads_init().
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c | 25 ++++++++++++----------
>  1 file changed, 14 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> index 90cbb93a2945..d0593063c0dc 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> @@ -608,7 +608,6 @@ static void __guc_ads_init(struct intel_guc *guc)
>  {
>  	struct intel_gt *gt = guc_to_gt(guc);
>  	struct drm_i915_private *i915 = gt->i915;
> -	struct __guc_ads_blob *blob = guc->ads_blob;
>  	struct iosys_map info_map = IOSYS_MAP_INIT_OFFSET(&guc->ads_map,
>  			offsetof(struct __guc_ads_blob, system_info));
>  	u32 base;
> @@ -619,17 +618,18 @@ static void __guc_ads_init(struct intel_guc *guc)
>  	/* System info */
>  	fill_engine_enable_masks(gt, &info_map);
>  
> -	blob->system_info.generic_gt_sysinfo[GUC_GENERIC_GT_SYSINFO_SLICE_ENABLED] =
> -		hweight8(gt->info.sseu.slice_mask);
> -	blob->system_info.generic_gt_sysinfo[GUC_GENERIC_GT_SYSINFO_VDBOX_SFC_SUPPORT_MASK] =
> -		gt->info.vdbox_sfc_access;
> +	ads_blob_write(guc, system_info.generic_gt_sysinfo[GUC_GENERIC_GT_SYSINFO_SLICE_ENABLED],
> +		       hweight8(gt->info.sseu.slice_mask));
> +	ads_blob_write(guc, system_info.generic_gt_sysinfo[GUC_GENERIC_GT_SYSINFO_VDBOX_SFC_SUPPORT_MASK],
> +		       gt->info.vdbox_sfc_access);
>  
>  	if (GRAPHICS_VER(i915) >= 12 && !IS_DGFX(i915)) {
>  		u32 distdbreg = intel_uncore_read(gt->uncore,
>  						  GEN12_DIST_DBS_POPULATED);
> -		blob->system_info.generic_gt_sysinfo[GUC_GENERIC_GT_SYSINFO_DOORBELL_COUNT_PER_SQIDI] =
> -			((distdbreg >> GEN12_DOORBELLS_PER_SQIDI_SHIFT) &
> -			 GEN12_DOORBELLS_PER_SQIDI) + 1;
> +		ads_blob_write(guc,
> +			       system_info.generic_gt_sysinfo[GUC_GENERIC_GT_SYSINFO_DOORBELL_COUNT_PER_SQIDI],
> +			       ((distdbreg >> GEN12_DOORBELLS_PER_SQIDI_SHIFT)
> +				& GEN12_DOORBELLS_PER_SQIDI) + 1);
>  	}
>  
>  	/* Golden contexts for re-initialising after a watchdog reset */
> @@ -643,14 +643,17 @@ static void __guc_ads_init(struct intel_guc *guc)
>  	guc_capture_list_init(guc);
>  
>  	/* ADS */
> -	blob->ads.scheduler_policies = base + ptr_offset(blob, policies);
> -	blob->ads.gt_system_info = base + ptr_offset(blob, system_info);
> +	ads_blob_write(guc, ads.scheduler_policies, base +
> +		       offsetof(struct __guc_ads_blob, policies));
> +	ads_blob_write(guc, ads.gt_system_info, base +
> +		       offsetof(struct __guc_ads_blob, system_info));
>  
>  	/* MMIO save/restore list */
>  	guc_mmio_reg_state_init(guc);
>  
>  	/* Private Data */
> -	blob->ads.private_data = base + guc_ads_private_data_offset(guc);
> +	ads_blob_write(guc, ads.private_data, base +
> +		       guc_ads_private_data_offset(guc));
>  
>  	i915_gem_object_flush_map(guc->ads_vma->obj);
>  }
> -- 
> 2.35.1
> 
