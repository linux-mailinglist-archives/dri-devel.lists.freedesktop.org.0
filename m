Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 177DC4CF7B3
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 10:47:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31BBC10ED58;
	Mon,  7 Mar 2022 09:47:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA65110ED58;
 Mon,  7 Mar 2022 09:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646646421; x=1678182421;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=KVWjmkdjs+Womn6pQhgEZF2xNdMBIcU3O95msKRwTHs=;
 b=NUT0umkIMuHMH5aJ+ex+AHiMWdsRow9rYZ6dao8pF9HetbBZko2MimDJ
 duCtdUzrxTDmbKJxRek15heNCFuk+iQ6neTDXT+A/UEyh8FNzPv8YYqnz
 GvzgXRBJuk70ltPWA+XKA9mw4w8uvjHxOQ4WPt1ZM2FogcEFXik7KNPrf
 k49HJP7LphEjPCuCslorV7qSjE7X/Ckt+Hqi7spoWaDw3bkDwgLS+KvRX
 3GLx8+iVKh/hq+gHULe+BwhLiKR1mIgF2ELvYj4HxbwmGL5GkDtztZKmr
 LEM6bNMtwtvMEdEg1lly/GyjXfqBnSNXKs8bgmQ7mbMDGq6gByAy9Zqh2 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10278"; a="340781956"
X-IronPort-AV: E=Sophos;i="5.90,161,1643702400"; d="scan'208";a="340781956"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 01:47:01 -0800
X-IronPort-AV: E=Sophos;i="5.90,161,1643702400"; d="scan'208";a="553088382"
Received: from kennedym-mobl.ger.corp.intel.com (HELO [10.213.196.214])
 ([10.213.196.214])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 01:46:58 -0800
Message-ID: <142118f5-7907-c008-2346-6f06e458e994@linux.intel.com>
Date: Mon, 7 Mar 2022 09:46:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 2/2] drm/i915/dg2: Add debugfs to control global
 preemption setting
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220304234639.3231617-1-matthew.d.roper@intel.com>
 <20220304234639.3231617-2-matthew.d.roper@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220304234639.3231617-2-matthew.d.roper@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: dri-devel@lists.freedesktop.org,
 Akeem G Abodunrin <akeem.g.abodunrin@intel.com>,
 John Harrison <john.c.harrison@intel.com>,
 Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 04/03/2022 23:46, Matt Roper wrote:
> From: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
> 
> Since DG2 and beyond only support global preemption enable/disable (see
> Wa_14015141709), userspace no longer has a way to control preemption on
> a per-context basis.  Preemption is globally enabled by default, but the
> UMD teams have requested that we provide a debugfs interface that can be
> used to query and adjust the system-wide preemption setting for
> development and bug reporting purposes.

I guess most distros enable debugfs, anyone knows for sure? Otherwise 
the bug reporting use case could be questionable.

And UMD acks would be desirable here I'd say.

> v2 (MattR):
>   - Split debugfs out into a separate patch.  (Jani)
>   - Add the hardware update/query as facilities in intel_gt.c and just
>     call them from the debugfs code.  (Jani)
>   - Add register to GuC's save/restore list so that the value will
>     persist across resets.  (Tvrtko)
>   - Place under per-GT debugfs rather than i915 debugfs.  (MattR)
>   - Only register debugfs entries on platforms subject to Wa_14015141709,
>     and only on platforms that have an RCS engine.  (MattR/Tvrtko)
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>
> Cc: John Harrison <john.c.harrison@intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Signed-off-by: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_gt.c         | 50 ++++++++++++++++++++++
>   drivers/gpu/drm/i915/gt/intel_gt.h         |  3 ++
>   drivers/gpu/drm/i915/gt/intel_gt_debugfs.c | 31 ++++++++++++++
>   drivers/gpu/drm/i915/gt/intel_gt_regs.h    |  3 ++
>   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c |  7 +++
>   5 files changed, 94 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> index 8a2483ccbfb9..90bdebd8d267 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -1045,3 +1045,53 @@ void intel_gt_invalidate_tlbs(struct intel_gt *gt)
>   	intel_uncore_forcewake_put_delayed(uncore, FORCEWAKE_ALL);
>   	mutex_unlock(&gt->tlb_invalidate_lock);
>   }
> +
> +/**
> + * intel_gt_get_global_preemption - return whether the global preemption
> + *     setting is enabled in hardware
> + * @gt: GT structure
> + *
> + * Returns the hardware's global 'preemption enabled' setting.  Only relevant
> + * on newer platforms that lack per-context preemption control (and only on
> + * GTs that have a render engine).
> + *
> + * Returns 1 if preemption is enabled, 0 if disabled.
> + */
> +u64 intel_gt_get_global_preemption(struct intel_gt *gt)
> +{
> +	intel_wakeref_t wakeref;
> +	u32 val;
> +
> +	drm_WARN_ON(&gt->i915->drm, GRAPHICS_VER_FULL(gt->i915) < IP_VER(12, 55));
> +	drm_WARN_ON(&gt->i915->drm, RCS_MASK(gt) == 0);
> +
> +	with_intel_runtime_pm(&gt->i915->runtime_pm, wakeref)
> +		val = intel_uncore_read(gt->uncore, GEN12_VFG_PREEMPTION_CHICKEN);
> +
> +	return !(val & GEN12_VFG_PREEMPT_CHICKEN_DISABLE);
> +}
> +
> +/**
> + * intel_gt_set_global_preemption - adjust global preemption enabled setting
> + * @gt: GT structure
> + * @val: desired preemption setting
> + *
> + * Enables global preemption if @val is non-zero, otherwise disables it.  Only
> + * relevant on newer platforms that lack per-context preemption control (and
> + * only on GTs that have a render engine).
> + *
> + * Returns 1 if preemption is enabled, 0 if disabled.
> + */
> +void intel_gt_set_global_preemption(struct intel_gt *gt, u64 val)
> +{
> +	intel_wakeref_t wakeref;
> +	u32 tmp = val ?
> +		_MASKED_BIT_DISABLE(GEN12_VFG_PREEMPT_CHICKEN_DISABLE) :
> +		_MASKED_BIT_ENABLE(GEN12_VFG_PREEMPT_CHICKEN_DISABLE);
> +
> +	drm_WARN_ON(&gt->i915->drm, GRAPHICS_VER_FULL(gt->i915) < IP_VER(12, 55));
> +	drm_WARN_ON(&gt->i915->drm, RCS_MASK(gt) == 0);

Bike shedding territory, but as long as these checks are present in 
release builds, it would be possible to return an error and propagate to 
debugfs caller/return. Not saying to do it just thinking out loud.

> +
> +	with_intel_runtime_pm(&gt->i915->runtime_pm, wakeref)
> +		intel_uncore_write(gt->uncore, GEN12_VFG_PREEMPTION_CHICKEN, tmp);
> +}
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.h b/drivers/gpu/drm/i915/gt/intel_gt.h
> index 0f571c8ee22b..63a599a1bf6d 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.h
> @@ -94,4 +94,7 @@ void intel_gt_watchdog_work(struct work_struct *work);
>   
>   void intel_gt_invalidate_tlbs(struct intel_gt *gt);
>   
> +u64 intel_gt_get_global_preemption(struct intel_gt *gt);
> +void intel_gt_set_global_preemption(struct intel_gt *gt, u64 val);

Bool based would be nicer unless there is some reason for 64-bits in the 
future.

Regards,

Tvrtko

> +
>   #endif /* __INTEL_GT_H__ */
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c b/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c
> index f103664b71d4..d851e3f80877 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c
> @@ -6,6 +6,7 @@
>   #include <linux/debugfs.h>
>   
>   #include "i915_drv.h"
> +#include "intel_gt.h"
>   #include "intel_gt_debugfs.h"
>   #include "intel_gt_engines_debugfs.h"
>   #include "intel_gt_pm_debugfs.h"
> @@ -57,13 +58,43 @@ static int __intel_gt_debugfs_reset_store(void *data, u64 val)
>   DEFINE_SIMPLE_ATTRIBUTE(reset_fops, __intel_gt_debugfs_reset_show,
>   			__intel_gt_debugfs_reset_store, "%llu\n");
>   
> +static int i915_global_preemption_enabled_get(void *data, u64 *val)
> +{
> +	*val = intel_gt_get_global_preemption((struct intel_gt *)data);
> +
> +	return 0;
> +}
> +
> +static int i915_global_preemption_enabled_set(void *data, u64 val)
> +{
> +	intel_gt_set_global_preemption((struct intel_gt *)data, val);
> +
> +	return 0;
> +}
> +
> +DEFINE_SIMPLE_ATTRIBUTE(i915_global_preemption_enabled_fops,
> +			i915_global_preemption_enabled_get,
> +			i915_global_preemption_enabled_set,
> +			"%llu\n");
> +
>   static void gt_debugfs_register(struct intel_gt *gt, struct dentry *root)
>   {
>   	static const struct intel_gt_debugfs_file files[] = {
>   		{ "reset", &reset_fops, NULL },
>   	};
> +	static const struct  intel_gt_debugfs_file preempt_files[] = {
> +		{ "preemption_enabled", &i915_global_preemption_enabled_fops }
> +	};
>   
>   	intel_gt_debugfs_register_files(root, files, ARRAY_SIZE(files), gt);
> +
> +	/*
> +	 * Global preemption control only applies to DG2 and beyond
> +	 * (Wa_14015141709) and only to GTs with an RCS.
> +	 */
> +	if (GRAPHICS_VER_FULL(gt->i915) >= IP_VER(12, 55) && RCS_MASK(gt))
> +		intel_gt_debugfs_register_files(root, preempt_files,
> +						ARRAY_SIZE(preempt_files), gt);
>   }
>   
>   void intel_gt_debugfs_register(struct intel_gt *gt)
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index 19cd34f24263..21ede1887b9f 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -468,6 +468,9 @@
>   #define VF_PREEMPTION				_MMIO(0x83a4)
>   #define   PREEMPTION_VERTEX_COUNT		REG_GENMASK(15, 0)
>   
> +#define GEN12_VFG_PREEMPTION_CHICKEN		_MMIO(0x83b4)
> +#define   GEN12_VFG_PREEMPT_CHICKEN_DISABLE	REG_BIT(8)
> +
>   #define GEN8_RC6_CTX_INFO			_MMIO(0x8504)
>   
>   #define GEN12_SQCM				_MMIO(0x8724)
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> index acc4a3766dc1..7e008382ab03 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> @@ -352,6 +352,13 @@ static int guc_mmio_regset_init(struct temp_regset *regset,
>   	for (i = 0; i < GEN9_LNCFCMOCS_REG_COUNT; i++)
>   		ret |= GUC_MMIO_REG_ADD(regset, GEN9_LNCFCMOCS(i), false);
>   
> +	/*
> +	 * VFG_PREEMPTION_CHICKEN can be controlled via debugfs; ensure
> +	 * the setting sticks across resets
> +	 */
> +	if (engine->flags & I915_ENGINE_FIRST_RENDER_COMPUTE)
> +		ret |= GUC_MMIO_REG_ADD(regset, GEN12_VFG_PREEMPTION_CHICKEN, true);
> +
>   	return ret ? -1 : 0;
>   }
>   
