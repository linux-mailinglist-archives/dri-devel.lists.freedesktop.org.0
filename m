Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EED7F599A1A
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 12:45:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A24EC10E7D4;
	Fri, 19 Aug 2022 10:45:56 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9ABF10E7D4;
 Fri, 19 Aug 2022 10:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660905953; x=1692441953;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=szYM7FIgtfc4j+Ci3QgMkf0NfHc4b1Ro7JVuO/wUqoA=;
 b=HY6Hki6ssuwBE4Tcaj2I5CTNbiGLvgDcEOQMI3kmEc5Q3IDyJtZuveYM
 hU3vmlKd2cM1/2HWK0Vd3PzfJCWfs9as0aQhnr3ErBVW0ms6vRITI2L9r
 Yaz3ATmtA0nyxAJvvwXTXCC7uAoB9JWbAg0ZxJnebQ6w8HbAWIoEyjJB5
 Q6S6vA+a4l4tyTPRkQops0F79J3KgZlbLljYeDo1v/bYcAvwUZP1DMefQ
 d3YlAQKI5SgzHXHQdV3UE0aCoafKsrzVW3j8tdgXTrl+vQLse86jB4rq/
 qNsdwM12DgUIvFob9cWPpGkP54JrKZ3mlv8u4lsGKlYjoNeD3HBysMhT7 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10443"; a="273381075"
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; d="scan'208";a="273381075"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2022 03:45:53 -0700
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; d="scan'208";a="668536046"
Received: from jastrom-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.51.176])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2022 03:45:51 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: John.C.Harrison@Intel.com, Intel-GFX@Lists.FreeDesktop.Org
Subject: Re: [Intel-gfx] [PATCH 3/7] drm/i915/guc: Add GuC <-> kernel time
 stamp translation information
In-Reply-To: <20220728022028.2190627-4-John.C.Harrison@Intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220728022028.2190627-1-John.C.Harrison@Intel.com>
 <20220728022028.2190627-4-John.C.Harrison@Intel.com>
Date: Fri, 19 Aug 2022 13:45:49 +0300
Message-ID: <87a680o6jm.fsf@intel.com>
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 27 Jul 2022, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> It is useful to be able to match GuC events to kernel events when
> looking at the GuC log. That requires being able to convert GuC
> timestamps to kernel time. So, when dumping error captures and/or GuC
> logs, include a stamp in both time zones plus the clock frequency.
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt_regs.h    |  2 ++
>  drivers/gpu/drm/i915/gt/uc/intel_guc.c     | 19 +++++++++++++++++++
>  drivers/gpu/drm/i915/gt/uc/intel_guc.h     |  2 ++
>  drivers/gpu/drm/i915/gt/uc/intel_guc_log.c |  2 ++
>  drivers/gpu/drm/i915/i915_gpu_error.c      | 12 ++++++++++++
>  drivers/gpu/drm/i915/i915_gpu_error.h      |  3 +++
>  6 files changed, 40 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index 60d6eb5f245b7..fc7979bd91db5 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -1007,6 +1007,8 @@
>  #define   GEN11_LSN_UNSLCVC_GAFS_HALF_CL2_MAXALLOC	(1 << 9)
>  #define   GEN11_LSN_UNSLCVC_GAFS_HALF_SF_MAXALLOC	(1 << 7)
>  
> +#define GUCPMTIMESTAMP				_MMIO(0xc3e8)
> +
>  #define __GEN9_RCS0_MOCS0			0xc800
>  #define GEN9_GFX_MOCS(i)			_MMIO(__GEN9_RCS0_MOCS0 + (i) * 4)
>  #define __GEN9_VCS0_MOCS0			0xc900
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> index 2706a8c650900..ab4aacc516aa4 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> @@ -389,6 +389,25 @@ void intel_guc_write_params(struct intel_guc *guc)
>  	intel_uncore_forcewake_put(uncore, FORCEWAKE_GT);
>  }
>  
> +void intel_guc_dump_time_info(struct intel_guc *guc, struct drm_printer *p)
> +{
> +	struct intel_gt *gt = guc_to_gt(guc);
> +	intel_wakeref_t wakeref;
> +	u32 stamp = 0;
> +	u64 ktime;
> +
> +	intel_device_info_print_runtime(RUNTIME_INFO(gt->i915), p);

Why does this function print runtime info alone? Seems kind of random,
considering what intel_device_info_print_runtime() actually
prints. Should it print both device info and runtime info, or nothing at
all?

This conflicts with [1] and I don't know what to do about it. The first
instinct is to just remove it.

BR,
Jani.


[1] https://patchwork.freedesktop.org/patch/msgid/4be86d7a0737b2c49eee460d29d42843418536fe.1660137416.git.jani.nikula@intel.com

> +
> +	with_intel_runtime_pm(&gt->i915->runtime_pm, wakeref)
> +		stamp = intel_uncore_read(gt->uncore, GUCPMTIMESTAMP);
> +	ktime = ktime_get_boottime_ns();
> +
> +	drm_printf(p, "Kernel timestamp: 0x%08llX [%llu]\n", ktime, ktime);
> +	drm_printf(p, "GuC timestamp: 0x%08X [%u]\n", stamp, stamp);
> +	drm_printf(p, "CS timestamp frequency: %u Hz, %u ns\n",
> +		   gt->clock_frequency, gt->clock_period_ns);
> +}
> +
>  int intel_guc_init(struct intel_guc *guc)
>  {
>  	struct intel_gt *gt = guc_to_gt(guc);
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> index a7acffbf15d1f..804133df1ac9b 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> @@ -464,4 +464,6 @@ void intel_guc_load_status(struct intel_guc *guc, struct drm_printer *p);
>  
>  void intel_guc_write_barrier(struct intel_guc *guc);
>  
> +void intel_guc_dump_time_info(struct intel_guc *guc, struct drm_printer *p);
> +
>  #endif
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
> index 991d4a02248dc..07d31ae32f765 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
> @@ -764,6 +764,8 @@ int intel_guc_log_dump(struct intel_guc_log *log, struct drm_printer *p,
>  	if (!obj)
>  		return 0;
>  
> +	intel_guc_dump_time_info(guc, p);
> +
>  	map = i915_gem_object_pin_map_unlocked(obj, I915_MAP_WC);
>  	if (IS_ERR(map)) {
>  		DRM_DEBUG("Failed to pin object\n");
> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
> index 32e92651ef7c2..addba75252343 100644
> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
> @@ -678,6 +678,7 @@ static void err_print_uc(struct drm_i915_error_state_buf *m,
>  
>  	intel_uc_fw_dump(&error_uc->guc_fw, &p);
>  	intel_uc_fw_dump(&error_uc->huc_fw, &p);
> +	err_printf(m, "GuC timestamp: 0x%08x\n", error_uc->timestamp);
>  	intel_gpu_error_print_vma(m, NULL, error_uc->guc_log);
>  }
>  
> @@ -720,6 +721,8 @@ static void err_print_gt_global_nonguc(struct drm_i915_error_state_buf *m,
>  	int i;
>  
>  	err_printf(m, "GT awake: %s\n", str_yes_no(gt->awake));
> +	err_printf(m, "CS timestamp frequency: %u Hz, %d ns\n",
> +		   gt->clock_frequency, gt->clock_period_ns);
>  	err_printf(m, "EIR: 0x%08x\n", gt->eir);
>  	err_printf(m, "PGTBL_ER: 0x%08x\n", gt->pgtbl_er);
>  
> @@ -1675,6 +1678,13 @@ gt_record_uc(struct intel_gt_coredump *gt,
>  	 */
>  	error_uc->guc_fw.path = kstrdup(uc->guc.fw.path, ALLOW_FAIL);
>  	error_uc->huc_fw.path = kstrdup(uc->huc.fw.path, ALLOW_FAIL);
> +
> +	/*
> +	 * Save the GuC log and include a timestamp reference for converting the
> +	 * log times to system times (in conjunction with the error->boottime and
> +	 * gt->clock_frequency fields saved elsewhere).
> +	 */
> +	error_uc->timestamp = intel_uncore_read(gt->_gt->uncore, GUCPMTIMESTAMP);
>  	error_uc->guc_log = create_vma_coredump(gt->_gt, uc->guc.log.vma,
>  						"GuC log buffer", compress);
>  
> @@ -1833,6 +1843,8 @@ static void gt_record_global_regs(struct intel_gt_coredump *gt)
>  static void gt_record_info(struct intel_gt_coredump *gt)
>  {
>  	memcpy(&gt->info, &gt->_gt->info, sizeof(struct intel_gt_info));
> +	gt->clock_frequency = gt->_gt->clock_frequency;
> +	gt->clock_period_ns = gt->_gt->clock_period_ns;
>  }
>  
>  /*
> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.h b/drivers/gpu/drm/i915/i915_gpu_error.h
> index 55a143b92d10e..d8a8b3d529e09 100644
> --- a/drivers/gpu/drm/i915/i915_gpu_error.h
> +++ b/drivers/gpu/drm/i915/i915_gpu_error.h
> @@ -150,6 +150,8 @@ struct intel_gt_coredump {
>  	u32 gtt_cache;
>  	u32 aux_err; /* gen12 */
>  	u32 gam_done; /* gen12 */
> +	u32 clock_frequency;
> +	u32 clock_period_ns;
>  
>  	/* Display related */
>  	u32 derrmr;
> @@ -164,6 +166,7 @@ struct intel_gt_coredump {
>  		struct intel_uc_fw guc_fw;
>  		struct intel_uc_fw huc_fw;
>  		struct i915_vma_coredump *guc_log;
> +		u32 timestamp;
>  		bool is_guc_capture;
>  	} *uc;

-- 
Jani Nikula, Intel Open Source Graphics Center
