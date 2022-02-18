Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 054734BC17E
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 22:02:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB0E210E4B9;
	Fri, 18 Feb 2022 21:02:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 518C410E1B1;
 Fri, 18 Feb 2022 21:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645218158; x=1676754158;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=V1eLV/y0z7huggG7K0R0fJvDE1jzU70TClA48L6pUTM=;
 b=YerRht+oA6hhpZkAZbV0Q+UaMfVnsmT7MacZd8V261V1ut17bu/q2y5c
 GWDgBQp03FuBRZuTQTb3TBwkJRalu5rg2XeKpvYvN6rtY1HYiKaPdjPE+
 hKAkzk7jEvsGjjZTivI20vYjA5RyLzJoDhMD0sqVj5t2AKGUEybhQenYN
 0eGZH0rsE5qvXXW77BhMfGALlw5+RnGaukUObj1xhr5f9LpP8JrE0XUe5
 hKuUl+YJsrM//Nu1L1d22iRa8zy4Mog3gDIb0IQepZDJqz2Ls3qhg9jvE
 lMgDTvFjvSsj9kCc7FHVa8aC9SjJy6WFqtHNIStPGMHKPNpYzT0+0za1w g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10262"; a="275805918"
X-IronPort-AV: E=Sophos;i="5.88,379,1635231600"; d="scan'208";a="275805918"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 13:02:37 -0800
X-IronPort-AV: E=Sophos;i="5.88,379,1635231600"; d="scan'208";a="635987394"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 13:02:37 -0800
Date: Fri, 18 Feb 2022 12:56:47 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH v3 14/16] drm/i915/guc: Convert guc_mmio_reg_state_init
 to iosys_map
Message-ID: <20220218205647.GA3494@jons-linux-dev-box>
References: <20220216174147.3073235-1-lucas.demarchi@intel.com>
 <20220216174147.3073235-15-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220216174147.3073235-15-lucas.demarchi@intel.com>
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

On Wed, Feb 16, 2022 at 09:41:45AM -0800, Lucas De Marchi wrote:
> Now that the regset list is prepared, convert guc_mmio_reg_state_init()
> to use iosys_map to copy the array to the final location and
> initialize additional fields in ads.reg_state_list.
> 
> v2: Just use an offset instead of temporary iosys_map.
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
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c | 28 ++++++++++++----------
>  1 file changed, 16 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> index ec0ccdf98dfa..90cbb93a2945 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> @@ -383,40 +383,44 @@ static long guc_mmio_reg_state_create(struct intel_guc *guc)
>  	return ret;
>  }
>  
> -static void guc_mmio_reg_state_init(struct intel_guc *guc,
> -				    struct __guc_ads_blob *blob)
> +static void guc_mmio_reg_state_init(struct intel_guc *guc)
>  {
>  	struct intel_gt *gt = guc_to_gt(guc);
>  	struct intel_engine_cs *engine;
> -	struct guc_mmio_reg *ads_registers;
>  	enum intel_engine_id id;
>  	u32 addr_ggtt, offset;
>  
>  	offset = guc_ads_regset_offset(guc);
>  	addr_ggtt = intel_guc_ggtt_offset(guc, guc->ads_vma) + offset;
> -	ads_registers = (struct guc_mmio_reg *)(((u8 *)blob) + offset);
>  
> -	memcpy(ads_registers, guc->ads_regset, guc->ads_regset_size);
> +	iosys_map_memcpy_to(&guc->ads_map, offset, guc->ads_regset,
> +			    guc->ads_regset_size);
>  
>  	for_each_engine(engine, gt, id) {
>  		u32 count = guc->ads_regset_count[id];
> -		struct guc_mmio_reg_set *ads_reg_set;
>  		u8 guc_class;
>  
>  		/* Class index is checked in class converter */
>  		GEM_BUG_ON(engine->instance >= GUC_MAX_INSTANCES_PER_CLASS);
>  
>  		guc_class = engine_class_to_guc_class(engine->class);
> -		ads_reg_set = &blob->ads.reg_state_list[guc_class][engine->instance];
>  
>  		if (!count) {
> -			ads_reg_set->address = 0;
> -			ads_reg_set->count = 0;
> +			ads_blob_write(guc,
> +				       ads.reg_state_list[guc_class][engine->instance].address,
> +				       0);
> +			ads_blob_write(guc,
> +				       ads.reg_state_list[guc_class][engine->instance].count,
> +				       0);
>  			continue;
>  		}
>  
> -		ads_reg_set->address = addr_ggtt;
> -		ads_reg_set->count = count;
> +		ads_blob_write(guc,
> +			       ads.reg_state_list[guc_class][engine->instance].address,
> +			       addr_ggtt);
> +		ads_blob_write(guc,
> +			       ads.reg_state_list[guc_class][engine->instance].count,
> +			       count);
>  
>  		addr_ggtt += count * sizeof(struct guc_mmio_reg);
>  	}
> @@ -643,7 +647,7 @@ static void __guc_ads_init(struct intel_guc *guc)
>  	blob->ads.gt_system_info = base + ptr_offset(blob, system_info);
>  
>  	/* MMIO save/restore list */
> -	guc_mmio_reg_state_init(guc, blob);
> +	guc_mmio_reg_state_init(guc);
>  
>  	/* Private Data */
>  	blob->ads.private_data = base + guc_ads_private_data_offset(guc);
> -- 
> 2.35.1
> 
