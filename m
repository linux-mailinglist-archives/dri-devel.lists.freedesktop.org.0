Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8596341D3
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 17:47:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 955F010E420;
	Tue, 22 Nov 2022 16:47:13 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8431310E41F;
 Tue, 22 Nov 2022 16:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669135627; x=1700671627;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=XxIDPj06HiLIyPsDjsbVtLxOjDl0Zf7g3cq3UjTB0m8=;
 b=grKKZt6C96bUgTaqcb5q0C7vLb2gopAH1R/5ruzClJu5alQdygwQTntB
 Xsu4Rism6VDhu5O6u49n8+5N5CtC3+EI67SP4jL9tmmX47E/CSFbXeu6F
 fYKs2d5wTZ3APriyBOtRcSgM5ASeVotb1rmi2B9M7KbPwFHdrj+fLAhDi
 J8sq25DvB9LV/CR/qQQRndtL5cwXIBerT8mboicS3uFE/WZS8XUgvbrkN
 jV+DfvM/W94KUMgt0KnnN1YzZnaytwz8XuxPnXZjkOxKVE7AoTm9szn9C
 8fhRazRJsniw1OTfAyWwhADl+XMM7ZPQWqIf1DjxccVm3Y5HwolVT0vLc A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="378118030"
X-IronPort-AV: E=Sophos;i="5.96,184,1665471600"; d="scan'208";a="378118030"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2022 08:47:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="643780402"
X-IronPort-AV: E=Sophos;i="5.96,184,1665471600"; d="scan'208";a="643780402"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by fmsmga007.fm.intel.com with ESMTP; 22 Nov 2022 08:47:05 -0800
Received: from [10.249.128.71] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.128.71])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 2AMGl4qw030277; Tue, 22 Nov 2022 16:47:04 GMT
Message-ID: <ba438ba2-4adf-45e0-b79b-6aba3641d09f@intel.com>
Date: Tue, 22 Nov 2022 17:47:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.5.0
Subject: Re: [PATCH v2 1/5] drm/i915/gt: Start adding module oriented dmesg
 output
Content-Language: en-US
To: John.C.Harrison@Intel.com, Intel-GFX@Lists.FreeDesktop.Org
References: <20221118015858.2548106-1-John.C.Harrison@Intel.com>
 <20221118015858.2548106-2-John.C.Harrison@Intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20221118015858.2548106-2-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 18.11.2022 02:58, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> When trying to analyse bug reports from CI, customers, etc. it can be
> difficult to work out exactly what is happening on which GT in a
> multi-GT system. So add GT oriented debug/error message wrappers. If
> used instead of the drm_ equivalents, you get the same output but with
> a GT# prefix on it.
> 
> v2: Go back to using lower case names (combined review feedback).
> Convert intel_gt.c as a first step.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt.c | 96 ++++++++++++++----------------
>  drivers/gpu/drm/i915/gt/intel_gt.h | 35 +++++++++++
>  2 files changed, 81 insertions(+), 50 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> index 0325f071046ca..349fcfdd14a6d 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -90,9 +90,8 @@ static int intel_gt_probe_lmem(struct intel_gt *gt)
>  		if (err == -ENODEV)
>  			return 0;
>  
> -		drm_err(&i915->drm,
> -			"Failed to setup region(%d) type=%d\n",
> -			err, INTEL_MEMORY_LOCAL);
> +		gt_err(gt, "Failed to setup region(%d) type=%d\n",
> +		       err, INTEL_MEMORY_LOCAL);
>  		return err;
>  	}
>  
> @@ -192,14 +191,14 @@ int intel_gt_init_hw(struct intel_gt *gt)
>  
>  	ret = i915_ppgtt_init_hw(gt);
>  	if (ret) {
> -		drm_err(&i915->drm, "Enabling PPGTT failed (%d)\n", ret);
> +		gt_err(gt, "Enabling PPGTT failed (%d)\n", ret);
>  		goto out;
>  	}
>  
>  	/* We can't enable contexts until all firmware is loaded */
>  	ret = intel_uc_init_hw(&gt->uc);
>  	if (ret) {
> -		i915_probe_error(i915, "Enabling uc failed (%d)\n", ret);
> +		gt_probe_error(gt, "Enabling uc failed (%d)\n", ret);
>  		goto out;
>  	}
>  
> @@ -264,7 +263,7 @@ intel_gt_clear_error_registers(struct intel_gt *gt,
>  		 * some errors might have become stuck,
>  		 * mask them.
>  		 */
> -		drm_dbg(&gt->i915->drm, "EIR stuck: 0x%08x, masking\n", eir);
> +		gt_dbg(gt, "EIR stuck: 0x%08x, masking\n", eir);
>  		rmw_set(uncore, EMR, eir);
>  		intel_uncore_write(uncore, GEN2_IIR,
>  				   I915_MASTER_ERROR_INTERRUPT);
> @@ -298,16 +297,16 @@ static void gen6_check_faults(struct intel_gt *gt)
>  	for_each_engine(engine, gt, id) {
>  		fault = GEN6_RING_FAULT_REG_READ(engine);
>  		if (fault & RING_FAULT_VALID) {
> -			drm_dbg(&engine->i915->drm, "Unexpected fault\n"
> -				"\tAddr: 0x%08lx\n"
> -				"\tAddress space: %s\n"
> -				"\tSource ID: %d\n"
> -				"\tType: %d\n",
> -				fault & PAGE_MASK,
> -				fault & RING_FAULT_GTTSEL_MASK ?
> -				"GGTT" : "PPGTT",
> -				RING_FAULT_SRCID(fault),
> -				RING_FAULT_FAULT_TYPE(fault));
> +			gt_dbg(gt, "Unexpected fault\n"
> +			       "\tAddr: 0x%08lx\n"
> +			       "\tAddress space: %s\n"
> +			       "\tSource ID: %d\n"
> +			       "\tType: %d\n",
> +			       fault & PAGE_MASK,
> +			       fault & RING_FAULT_GTTSEL_MASK ?
> +			       "GGTT" : "PPGTT",
> +			       RING_FAULT_SRCID(fault),
> +			       RING_FAULT_FAULT_TYPE(fault));
>  		}
>  	}
>  }
> @@ -334,17 +333,17 @@ static void xehp_check_faults(struct intel_gt *gt)
>  		fault_addr = ((u64)(fault_data1 & FAULT_VA_HIGH_BITS) << 44) |
>  			     ((u64)fault_data0 << 12);
>  
> -		drm_dbg(&gt->i915->drm, "Unexpected fault\n"
> -			"\tAddr: 0x%08x_%08x\n"
> -			"\tAddress space: %s\n"
> -			"\tEngine ID: %d\n"
> -			"\tSource ID: %d\n"
> -			"\tType: %d\n",
> -			upper_32_bits(fault_addr), lower_32_bits(fault_addr),
> -			fault_data1 & FAULT_GTT_SEL ? "GGTT" : "PPGTT",
> -			GEN8_RING_FAULT_ENGINE_ID(fault),
> -			RING_FAULT_SRCID(fault),
> -			RING_FAULT_FAULT_TYPE(fault));
> +		gt_dbg(gt, "Unexpected fault\n"
> +		       "\tAddr: 0x%08x_%08x\n"
> +		       "\tAddress space: %s\n"
> +		       "\tEngine ID: %d\n"
> +		       "\tSource ID: %d\n"
> +		       "\tType: %d\n",
> +		       upper_32_bits(fault_addr), lower_32_bits(fault_addr),
> +		       fault_data1 & FAULT_GTT_SEL ? "GGTT" : "PPGTT",
> +		       GEN8_RING_FAULT_ENGINE_ID(fault),
> +		       RING_FAULT_SRCID(fault),
> +		       RING_FAULT_FAULT_TYPE(fault));
>  	}
>  }
>  
> @@ -375,17 +374,17 @@ static void gen8_check_faults(struct intel_gt *gt)
>  		fault_addr = ((u64)(fault_data1 & FAULT_VA_HIGH_BITS) << 44) |
>  			     ((u64)fault_data0 << 12);
>  
> -		drm_dbg(&uncore->i915->drm, "Unexpected fault\n"
> -			"\tAddr: 0x%08x_%08x\n"
> -			"\tAddress space: %s\n"
> -			"\tEngine ID: %d\n"
> -			"\tSource ID: %d\n"
> -			"\tType: %d\n",
> -			upper_32_bits(fault_addr), lower_32_bits(fault_addr),
> -			fault_data1 & FAULT_GTT_SEL ? "GGTT" : "PPGTT",
> -			GEN8_RING_FAULT_ENGINE_ID(fault),
> -			RING_FAULT_SRCID(fault),
> -			RING_FAULT_FAULT_TYPE(fault));
> +		gt_dbg(gt, "Unexpected fault\n"
> +		       "\tAddr: 0x%08x_%08x\n"
> +		       "\tAddress space: %s\n"
> +		       "\tEngine ID: %d\n"
> +		       "\tSource ID: %d\n"
> +		       "\tType: %d\n",
> +		       upper_32_bits(fault_addr), lower_32_bits(fault_addr),
> +		       fault_data1 & FAULT_GTT_SEL ? "GGTT" : "PPGTT",
> +		       GEN8_RING_FAULT_ENGINE_ID(fault),
> +		       RING_FAULT_SRCID(fault),
> +		       RING_FAULT_FAULT_TYPE(fault));
>  	}
>  }
>  
> @@ -479,7 +478,7 @@ static int intel_gt_init_scratch(struct intel_gt *gt, unsigned int size)
>  	if (IS_ERR(obj))
>  		obj = i915_gem_object_create_internal(i915, size);
>  	if (IS_ERR(obj)) {
> -		drm_err(&i915->drm, "Failed to allocate scratch page\n");
> +		gt_err(gt, "Failed to allocate scratch page\n");
>  		return PTR_ERR(obj);
>  	}
>  
> @@ -729,8 +728,7 @@ int intel_gt_init(struct intel_gt *gt)
>  
>  	err = intel_gt_init_hwconfig(gt);
>  	if (err)
> -		drm_err(&gt->i915->drm, "Failed to retrieve hwconfig table: %pe\n",
> -			ERR_PTR(err));
> +		gt_err(gt, "Failed to retrieve hwconfig table: %pe\n", ERR_PTR(err));
>  
>  	err = __engines_record_defaults(gt);
>  	if (err)
> @@ -891,7 +889,7 @@ int intel_gt_probe_all(struct drm_i915_private *i915)
>  	gt->name = "Primary GT";
>  	gt->info.engine_mask = RUNTIME_INFO(i915)->platform_engine_mask;
>  
> -	drm_dbg(&i915->drm, "Setting up %s\n", gt->name);
> +	gt_dbg(gt, "Setting up %s\n", gt->name);
>  	ret = intel_gt_tile_setup(gt, phys_addr);
>  	if (ret)
>  		return ret;
> @@ -916,7 +914,7 @@ int intel_gt_probe_all(struct drm_i915_private *i915)
>  		gt->info.engine_mask = gtdef->engine_mask;
>  		gt->info.id = i;
>  
> -		drm_dbg(&i915->drm, "Setting up %s\n", gt->name);
> +		gt_dbg(gt, "Setting up %s\n", gt->name);
>  		if (GEM_WARN_ON(range_overflows_t(resource_size_t,
>  						  gtdef->mapping_base,
>  						  SZ_16M,
> @@ -951,7 +949,7 @@ int intel_gt_probe_all(struct drm_i915_private *i915)
>  	return 0;
>  
>  err:
> -	i915_probe_error(i915, "Failed to initialize %s! (%d)\n", gtdef->name, ret);
> +	gt_probe_error(gt, "Failed to initialize %s! (%d)\n", gtdef->name, ret);

on -ENOMEM error, this gt will be NULL
so likely we should stay with i915 variant

>  	intel_gt_release_all(i915);
>  
>  	return ret;
> @@ -1004,8 +1002,7 @@ get_reg_and_bit(const struct intel_engine_cs *engine, const bool gen8,
>  	const unsigned int class = engine->class;
>  	struct reg_and_bit rb = { };
>  
> -	if (drm_WARN_ON_ONCE(&engine->i915->drm,
> -			     class >= num || !regs[class].reg))
> +	if (gt_WARN_ON_ONCE(engine->gt, class >= num || !regs[class].reg))
>  		return rb;
>  
>  	rb.reg = regs[class];
> @@ -1088,8 +1085,7 @@ static void mmio_invalidate_full(struct intel_gt *gt)
>  		return;
>  	}
>  
> -	if (drm_WARN_ONCE(&i915->drm, !num,
> -			  "Platform does not implement TLB invalidation!"))
> +	if (gt_WARN_ONCE(gt, !num, "Platform does not implement TLB invalidation!"))
>  		return;
>  
>  	intel_uncore_forcewake_get(uncore, FORCEWAKE_ALL);
> @@ -1142,8 +1138,8 @@ static void mmio_invalidate_full(struct intel_gt *gt)
>  
>  		if (wait_for_invalidate(gt, rb))
>  			drm_err_ratelimited(&gt->i915->drm,
> -					    "%s TLB invalidation did not complete in %ums!\n",
> -					    engine->name, TLB_INVAL_TIMEOUT_MS);
> +					    "GT%d: %s TLB invalidation did not complete in %ums!\n",
> +					    gt->info.id, engine->name, TLB_INVAL_TIMEOUT_MS);

that's inconsistent, we should use gt_err_ratelimited()

>  	}
>  
>  	/*
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.h b/drivers/gpu/drm/i915/gt/intel_gt.h
> index e0365d5562484..5bf2d53f4b4d0 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.h
> @@ -13,6 +13,41 @@
>  struct drm_i915_private;
>  struct drm_printer;
>  
> +#define gt_err(_gt, _fmt, ...) \
> +	drm_err(&(_gt)->i915->drm, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
> +
> +#define gt_warn(_gt, _fmt, ...) \
> +	drm_warn(&(_gt)->i915->drm, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
> +
> +#define gt_notice(_gt, _fmt, ...) \
> +	drm_notice(&(_gt)->i915->drm, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
> +
> +#define gt_info(_gt, _fmt, ...) \
> +	drm_info(&(_gt)->i915->drm, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
> +
> +#define gt_dbg(_gt, _fmt, ...) \
> +	drm_dbg(&(_gt)->i915->drm, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
> +
> +#define gt_probe_error(_gt, _fmt, ...) \
> +	do { \
> +		if (i915_error_injected()) \
> +			gt_dbg(_gt, _fmt, ##__VA_ARGS__); \
> +		else \
> +			gt_err(_gt, _fmt, ##__VA_ARGS__); \
> +	} while (0)
> +
> +#define gt_WARN_ON(_gt, _condition) \
> +	gt_WARN(_gt, _condition, "%s", "gt_WARN_ON(" __stringify(_condition) ")")
> +
> +#define gt_WARN_ON_ONCE(_gt, _condition) \
> +	gt_WARN_ONCE(_gt, _condition, "%s", "gt_WARN_ONCE(" __stringify(_condition) ")")
> +
> +#define gt_WARN(_gt, _condition, _fmt, ...) \
> +	drm_WARN(&(_gt)->i915->drm, _condition, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
> +
> +#define gt_WARN_ONCE(_gt, _condition, _fmt, ...) \
> +	drm_WARN_ONCE(&(_gt)->i915->drm, _condition, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
> +
>  #define GT_TRACE(gt, fmt, ...) do {					\
>  	const struct intel_gt *gt__ __maybe_unused = (gt);		\
>  	GEM_TRACE("%s " fmt, dev_name(gt__->i915->drm.dev),		\

btw, shouldn't we also update GT_TRACE macros to include GT.id ?
(naturally not in this series)

Michal
