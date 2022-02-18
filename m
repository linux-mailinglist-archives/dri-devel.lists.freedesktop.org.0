Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 021B04BC275
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 23:12:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4077C10E125;
	Fri, 18 Feb 2022 22:12:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0580910E125;
 Fri, 18 Feb 2022 22:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645222362; x=1676758362;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=FUfdXH1d51Ds5LoPYTSo+Ikuf4p2jRMSPKxqYkP86rQ=;
 b=YuNGMi84C3k6C9tmnQf2g8a8+iQGU1+UUgKpxhw9y6rcLrcKxnUOMcvx
 TqBPlyE1l3KmDuT7GNXEH8F/343Hce684Xn/9fGjkPfA6NbyhO0YRg5Z6
 eEnR0urLZf6rBsGUIC0gUVl1Ev0BFiIJefeJH5RKTTBuXlDstRQQK1OGE
 rP4vCfV+LnZlAIUmz+6TeYHYEel/0xJj4xZuG+iLFno2vS1c9ZXKiTavd
 B55/FzD+OrwmUEVIW10BEStsqSHVtR8rtp/61+Aru7hhrVjT1Wl7+2Zjs
 aZ/D92TPHsUh60iM7CuPFyk5gqIRuPAEWofh+uypTqhRoYxsMmG1EMyku Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10262"; a="250056776"
X-IronPort-AV: E=Sophos;i="5.88,380,1635231600"; d="scan'208";a="250056776"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 14:12:41 -0800
X-IronPort-AV: E=Sophos;i="5.88,380,1635231600"; d="scan'208";a="506922415"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 14:12:40 -0800
Date: Fri, 18 Feb 2022 14:06:50 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH v3 10/16] drm/i915/guc: Convert golden context prep to
 iosys_map
Message-ID: <20220218220650.GA36686@jons-linux-dev-box>
References: <20220216174147.3073235-1-lucas.demarchi@intel.com>
 <20220216174147.3073235-11-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220216174147.3073235-11-lucas.demarchi@intel.com>
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

On Wed, Feb 16, 2022 at 09:41:41AM -0800, Lucas De Marchi wrote:
> Use the saved ads_map to prepare the golden context. One difference from
> the init context is that this function can be called before there is a
> gem object (and thus the guc->ads_map) to calculare the size of the
> golden context that should be allocated for that object.
> 
> So in this case the function needs to be prepared for not having the
> system_info with enabled engines filled out. To accomplish that an
> info_map is prepared on the side to point either to the gem object
> or the local variable on the stack. This allows making
> fill_engine_enable_masks() operate always with a iosys_map
> argument.
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
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c | 52 +++++++++++++---------
>  1 file changed, 32 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> index d924486490c1..0077a63832ad 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> @@ -67,6 +67,12 @@ struct __guc_ads_blob {
>  	iosys_map_wr_field(&(guc_)->ads_map, 0, struct __guc_ads_blob,	\
>  			   field_, val_)
>  
> +#define info_map_write(map_, field_, val_) \
> +	iosys_map_wr_field(map_, 0, struct guc_gt_system_info, field_, val_)
> +
> +#define info_map_read(map_, field_) \
> +	iosys_map_rd_field(map_, 0, struct guc_gt_system_info, field_)
> +
>  static u32 guc_ads_regset_size(struct intel_guc *guc)
>  {
>  	GEM_BUG_ON(!guc->ads_regset_size);
> @@ -417,24 +423,24 @@ static void guc_mmio_reg_state_init(struct intel_guc *guc,
>  }
>  
>  static void fill_engine_enable_masks(struct intel_gt *gt,
> -				     struct guc_gt_system_info *info)
> +				     struct iosys_map *info_map)
>  {
> -	info->engine_enabled_masks[GUC_RENDER_CLASS] = 1;
> -	info->engine_enabled_masks[GUC_BLITTER_CLASS] = 1;
> -	info->engine_enabled_masks[GUC_VIDEO_CLASS] = VDBOX_MASK(gt);
> -	info->engine_enabled_masks[GUC_VIDEOENHANCE_CLASS] = VEBOX_MASK(gt);
> +	info_map_write(info_map, engine_enabled_masks[GUC_RENDER_CLASS], 1);
> +	info_map_write(info_map, engine_enabled_masks[GUC_BLITTER_CLASS], 1);
> +	info_map_write(info_map, engine_enabled_masks[GUC_VIDEO_CLASS], VDBOX_MASK(gt));
> +	info_map_write(info_map, engine_enabled_masks[GUC_VIDEOENHANCE_CLASS], VEBOX_MASK(gt));
>  }
>  
>  #define LR_HW_CONTEXT_SIZE (80 * sizeof(u32))
>  #define LRC_SKIP_SIZE (LRC_PPHWSP_SZ * PAGE_SIZE + LR_HW_CONTEXT_SIZE)
> -static int guc_prep_golden_context(struct intel_guc *guc,
> -				   struct __guc_ads_blob *blob)
> +static int guc_prep_golden_context(struct intel_guc *guc)
>  {
>  	struct intel_gt *gt = guc_to_gt(guc);
>  	u32 addr_ggtt, offset;
>  	u32 total_size = 0, alloc_size, real_size;
>  	u8 engine_class, guc_class;
> -	struct guc_gt_system_info *info, local_info;
> +	struct guc_gt_system_info local_info;
> +	struct iosys_map info_map;
>  
>  	/*
>  	 * Reserve the memory for the golden contexts and point GuC at it but
> @@ -448,14 +454,15 @@ static int guc_prep_golden_context(struct intel_guc *guc,
>  	 * GuC will also validate that the LRC base + size fall within the
>  	 * allowed GGTT range.
>  	 */
> -	if (blob) {
> +	if (!iosys_map_is_null(&guc->ads_map)) {
>  		offset = guc_ads_golden_ctxt_offset(guc);
>  		addr_ggtt = intel_guc_ggtt_offset(guc, guc->ads_vma) + offset;
> -		info = &blob->system_info;
> +		info_map = IOSYS_MAP_INIT_OFFSET(&guc->ads_map,
> +						 offsetof(struct __guc_ads_blob, system_info));
>  	} else {
>  		memset(&local_info, 0, sizeof(local_info));
> -		info = &local_info;
> -		fill_engine_enable_masks(gt, info);
> +		iosys_map_set_vaddr(&info_map, &local_info);
> +		fill_engine_enable_masks(gt, &info_map);
>  	}
>  
>  	for (engine_class = 0; engine_class <= MAX_ENGINE_CLASS; ++engine_class) {
> @@ -464,14 +471,14 @@ static int guc_prep_golden_context(struct intel_guc *guc,
>  
>  		guc_class = engine_class_to_guc_class(engine_class);
>  
> -		if (!info->engine_enabled_masks[guc_class])
> +		if (!info_map_read(&info_map, engine_enabled_masks[guc_class]))
>  			continue;
>  
>  		real_size = intel_engine_context_size(gt, engine_class);
>  		alloc_size = PAGE_ALIGN(real_size);
>  		total_size += alloc_size;
>  
> -		if (!blob)
> +		if (iosys_map_is_null(&guc->ads_map))
>  			continue;
>  
>  		/*
> @@ -485,12 +492,15 @@ static int guc_prep_golden_context(struct intel_guc *guc,
>  		 * what comes before it in the context image (which is identical
>  		 * on all engines).
>  		 */
> -		blob->ads.eng_state_size[guc_class] = real_size - LRC_SKIP_SIZE;
> -		blob->ads.golden_context_lrca[guc_class] = addr_ggtt;
> +		ads_blob_write(guc, ads.eng_state_size[guc_class],
> +			       real_size - LRC_SKIP_SIZE);
> +		ads_blob_write(guc, ads.golden_context_lrca[guc_class],
> +			       addr_ggtt);
> +
>  		addr_ggtt += alloc_size;
>  	}
>  
> -	if (!blob)
> +	if (iosys_map_is_null(&guc->ads_map))
>  		return total_size;
>  
>  	GEM_BUG_ON(guc->ads_golden_ctxt_size != total_size);
> @@ -595,13 +605,15 @@ static void __guc_ads_init(struct intel_guc *guc)
>  	struct intel_gt *gt = guc_to_gt(guc);
>  	struct drm_i915_private *i915 = gt->i915;
>  	struct __guc_ads_blob *blob = guc->ads_blob;
> +	struct iosys_map info_map = IOSYS_MAP_INIT_OFFSET(&guc->ads_map,
> +			offsetof(struct __guc_ads_blob, system_info));
>  	u32 base;
>  
>  	/* GuC scheduling policies */
>  	guc_policies_init(guc);
>  
>  	/* System info */
> -	fill_engine_enable_masks(gt, &blob->system_info);
> +	fill_engine_enable_masks(gt, &info_map);
>  
>  	blob->system_info.generic_gt_sysinfo[GUC_GENERIC_GT_SYSINFO_SLICE_ENABLED] =
>  		hweight8(gt->info.sseu.slice_mask);
> @@ -617,7 +629,7 @@ static void __guc_ads_init(struct intel_guc *guc)
>  	}
>  
>  	/* Golden contexts for re-initialising after a watchdog reset */
> -	guc_prep_golden_context(guc, blob);
> +	guc_prep_golden_context(guc);
>  
>  	guc_mapping_table_init(guc_to_gt(guc), &blob->system_info);
>  
> @@ -663,7 +675,7 @@ int intel_guc_ads_create(struct intel_guc *guc)
>  	guc->ads_regset_size = ret;
>  
>  	/* Likewise the golden contexts: */
> -	ret = guc_prep_golden_context(guc, NULL);
> +	ret = guc_prep_golden_context(guc);
>  	if (ret < 0)
>  		return ret;
>  	guc->ads_golden_ctxt_size = ret;
> -- 
> 2.35.1
> 
