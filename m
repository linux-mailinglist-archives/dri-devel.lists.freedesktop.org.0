Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 207124BC166
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 21:51:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D26F010E4C8;
	Fri, 18 Feb 2022 20:51:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ADF810E4B9;
 Fri, 18 Feb 2022 20:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645217484; x=1676753484;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=516zcotZ4vKJxew/o+TSv3WXclgDhYK9iJrfeEkN4bs=;
 b=BUgmq8l0IM3gGvC9zx6Dtslq/DXcUTyLAUO2Q9whMdLl6vhgTdKpOoDr
 GLbK1l3QceqqFayXMTzPFTFjD6t9l7tFhcc06+NqXGNVM0To1y9r1N/Ag
 nmTlLvFMC66l3636H/RR2IcnNSTUGxfsZI5BMr4opaxdrctKX0JraJrZf
 v4J6dWAtNde9qPUt9o2YqDj1SDHMqICYxUXBpIKSC2a4LlMykQg+Q3WZ5
 GWmFHBwAcF6MXDb1ZpVW5SrPEHGIbYUaufUNoBwnVMfQDdNoH0OTeItfo
 lq6+jntR5qGhWczXm7wEIlFTAFMyJ+b+z1lCJGMKaWe4Pv7eL/uoY+sGB Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10262"; a="275802167"
X-IronPort-AV: E=Sophos;i="5.88,379,1635231600"; d="scan'208";a="275802167"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 12:51:23 -0800
X-IronPort-AV: E=Sophos;i="5.88,379,1635231600"; d="scan'208";a="705519738"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 12:51:23 -0800
Date: Fri, 18 Feb 2022 12:45:32 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH v3 12/16] drm/i915/guc: Convert mapping table to iosys_map
Message-ID: <20220218204532.GA3351@jons-linux-dev-box>
References: <20220216174147.3073235-1-lucas.demarchi@intel.com>
 <20220216174147.3073235-13-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220216174147.3073235-13-lucas.demarchi@intel.com>
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

On Wed, Feb 16, 2022 at 09:41:43AM -0800, Lucas De Marchi wrote:
> Use iosys_map to write the fields system_info.mapping_table[][].
> Since we already have the info_map around where needed, just use it
> instead of going through guc->ads_map.
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
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> index b739781bd133..c3c31b679e79 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> @@ -204,7 +204,7 @@ int intel_guc_global_policies_update(struct intel_guc *guc)
>  }
>  
>  static void guc_mapping_table_init(struct intel_gt *gt,
> -				   struct guc_gt_system_info *system_info)
> +				   struct iosys_map *info_map)
>  {
>  	unsigned int i, j;
>  	struct intel_engine_cs *engine;
> @@ -213,14 +213,14 @@ static void guc_mapping_table_init(struct intel_gt *gt,
>  	/* Table must be set to invalid values for entries not used */
>  	for (i = 0; i < GUC_MAX_ENGINE_CLASSES; ++i)
>  		for (j = 0; j < GUC_MAX_INSTANCES_PER_CLASS; ++j)
> -			system_info->mapping_table[i][j] =
> -				GUC_MAX_INSTANCES_PER_CLASS;
> +			info_map_write(info_map, mapping_table[i][j],
> +				       GUC_MAX_INSTANCES_PER_CLASS);
>  
>  	for_each_engine(engine, gt, id) {
>  		u8 guc_class = engine_class_to_guc_class(engine->class);
>  
> -		system_info->mapping_table[guc_class][ilog2(engine->logical_mask)] =
> -			engine->instance;
> +		info_map_write(info_map, mapping_table[guc_class][ilog2(engine->logical_mask)],
> +			       engine->instance);
>  	}
>  }
>  
> @@ -631,7 +631,7 @@ static void __guc_ads_init(struct intel_guc *guc)
>  	/* Golden contexts for re-initialising after a watchdog reset */
>  	guc_prep_golden_context(guc);
>  
> -	guc_mapping_table_init(guc_to_gt(guc), &blob->system_info);
> +	guc_mapping_table_init(guc_to_gt(guc), &info_map);
>  
>  	base = intel_guc_ggtt_offset(guc, guc->ads_vma);
>  
> -- 
> 2.35.1
> 
