Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E724CD38E
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 12:35:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7684310EDDE;
	Fri,  4 Mar 2022 11:35:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0760310EDA5;
 Fri,  4 Mar 2022 11:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646393728; x=1677929728;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=WhCjVHxroIxSCZEeZUS+H9OvmAySNULdfegGUuQzW3Q=;
 b=eiX5DMzwgcMuhfFgbcGUEnXv0ntF7UgXF9MU3mZBM0NYlGNVfjadkRtV
 3Nfobq2EyK6Sgf25WdLSAmL79oDE8voPlLGfGtEE18EjAVspY/j8SYQzq
 pJm/0tw+ulKSZUdbKaYd+UUP3ya+Q3uBNLr+DXsws+hfnFPXmTQqlYDDO
 bVMWhidn1wm1J8xNKJPBmUqkTy2fEeKUQ+bd9ycztKjeMuBesf94ofVCN
 gz89RBgFnJLOFBjf14yFlbg72E03w4kmmsTJLmxYAB5lOhk/zvbkiQNCs
 4KcgeggBTvbs4HDmTJanYlZ7qnEh7RPWcPUjwsJWEGRS7Iq495rRgI+S6 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10275"; a="254150932"
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="254150932"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 03:35:27 -0800
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="536249107"
Received: from dlalwani-mobl.ger.corp.intel.com (HELO [10.213.223.211])
 ([10.213.223.211])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 03:35:26 -0800
Message-ID: <7a69b7ce-54cc-9ad3-b6ad-bc2228e4db42@linux.intel.com>
Date: Fri, 4 Mar 2022 11:35:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915/dg2: Add preemption changes for
 Wa_14015141709
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220303224256.2793639-1-matthew.d.roper@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220303224256.2793639-1-matthew.d.roper@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 03/03/2022 22:42, Matt Roper wrote:
> From: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
> 
> Starting with DG2, preemption can no longer be controlled using userspace
> on a per-context basis. Instead, the hardware only allows us to enable or
> disable preemption in a global, system-wide basis. Also, we lose the
> ability to specify the preemption granularity (such as batch-level vs
> command-level vs object-level).
> 
> As a result of this - for debugging purposes, this patch adds debugfs
> interface to configure (disable/enable) preemption globally.
> 
> Jira: VLK-27831
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>
> Cc: John Harrison <john.c.harrison@intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Signed-off-by: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_gt_regs.h     |  3 ++
>   drivers/gpu/drm/i915/gt/intel_workarounds.c |  2 +-
>   drivers/gpu/drm/i915/i915_debugfs.c         | 50 +++++++++++++++++++++
>   drivers/gpu/drm/i915/i915_drv.h             |  3 ++
>   4 files changed, 57 insertions(+), 1 deletion(-)
> 
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
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> index c014b40d2e9f..18dc82f29776 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> @@ -2310,7 +2310,7 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
>   			     FF_DOP_CLOCK_GATE_DISABLE);
>   	}
>   
> -	if (IS_GRAPHICS_VER(i915, 9, 12)) {
> +	if (HAS_PERCTX_PREEMPT_CTRL(i915)) {
>   		/* FtrPerCtxtPreemptionGranularityControl:skl,bxt,kbl,cfl,cnl,icl,tgl */
>   		wa_masked_en(wal,
>   			     GEN7_FF_SLICE_CS_CHICKEN1,
> diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
> index 747fe9f41e1f..40e6e17e2950 100644
> --- a/drivers/gpu/drm/i915/i915_debugfs.c
> +++ b/drivers/gpu/drm/i915/i915_debugfs.c
> @@ -571,6 +571,55 @@ static int i915_wa_registers(struct seq_file *m, void *unused)
>   	return 0;
>   }
>   
> +static void i915_global_preemption_config(struct drm_i915_private *i915,
> +					  u32 val)
> +{
> +	const u32 bit = GEN12_VFG_PREEMPT_CHICKEN_DISABLE;
> +
> +	if (val)
> +		intel_uncore_write(&i915->uncore, GEN12_VFG_PREEMPTION_CHICKEN,
> +				   _MASKED_BIT_DISABLE(bit));
> +	else
> +		intel_uncore_write(&i915->uncore, GEN12_VFG_PREEMPTION_CHICKEN,
> +				   _MASKED_BIT_ENABLE(bit));

In addition to what Jani suggested some other questions:

Does this setting survive GT reset?

Would intel_reg read/write work?

Can we not add the debugfs file to start with if register is n/a for a platform?

> +}
> +
> +static int i915_global_preempt_support_get(void *data, u64 *val)
> +{
> +	struct drm_i915_private *i915 = data;
> +	intel_wakeref_t wakeref;
> +	u32 curr_status = 0;
> +
> +	if (HAS_PERCTX_PREEMPT_CTRL(i915) || GRAPHICS_VER(i915) < 11)
> +		return -EINVAL;

What is the purpose of the "< 11" condition here? Because HAS_PERCTX_PREEMPT_CTRL is defined as starting on Gen9? Is the 11 arbitrary then or has some deeper meaning?

Regards,

Tvrtko

> +
> +	with_intel_runtime_pm(&i915->runtime_pm, wakeref)
> +		curr_status = intel_uncore_read(&i915->uncore,
> +						GEN12_VFG_PREEMPTION_CHICKEN);
> +	*val = (curr_status & GEN12_VFG_PREEMPT_CHICKEN_DISABLE) ? 0 : 1;
> +
> +	return 0;
> +}
> +
> +static int i915_global_preempt_support_set(void *data, u64 val)
> +{
> +	struct drm_i915_private *i915 = data;
> +	intel_wakeref_t wakeref;
> +
> +	if (HAS_PERCTX_PREEMPT_CTRL(i915) || GRAPHICS_VER(i915) < 11)
> +		return -EINVAL;
> +
> +	with_intel_runtime_pm(&i915->runtime_pm, wakeref)
> +		i915_global_preemption_config(i915, val);
> +
> +	return 0;
> +}
> +
> +DEFINE_SIMPLE_ATTRIBUTE(i915_global_preempt_support_fops,
> +			i915_global_preempt_support_get,
> +			i915_global_preempt_support_set,
> +			"%lld\n");
> +
>   static int i915_wedged_get(void *data, u64 *val)
>   {
>   	struct drm_i915_private *i915 = data;
> @@ -765,6 +814,7 @@ static const struct i915_debugfs_files {
>   	const struct file_operations *fops;
>   } i915_debugfs_files[] = {
>   	{"i915_perf_noa_delay", &i915_perf_noa_delay_fops},
> +	{"i915_global_preempt_support", &i915_global_preempt_support_fops},
>   	{"i915_wedged", &i915_wedged_fops},
>   	{"i915_gem_drop_caches", &i915_drop_caches_fops},
>   #if IS_ENABLED(CONFIG_DRM_I915_CAPTURE_ERROR)
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index 457bc1993d19..8c3f69c87d36 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -1407,6 +1407,9 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
>   #define HAS_GUC_DEPRIVILEGE(dev_priv) \
>   	(INTEL_INFO(dev_priv)->has_guc_deprivilege)
>   
> +#define HAS_PERCTX_PREEMPT_CTRL(i915) \
> +	((GRAPHICS_VER(i915) >= 9) &&  GRAPHICS_VER_FULL(i915) < IP_VER(12, 55))
> +
>   static inline bool run_as_guest(void)
>   {
>   	return !hypervisor_is_type(X86_HYPER_NATIVE);
