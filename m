Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0095F5928
	for <lists+dri-devel@lfdr.de>; Wed,  5 Oct 2022 19:35:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4031E10E72D;
	Wed,  5 Oct 2022 17:35:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D63010E722;
 Wed,  5 Oct 2022 17:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664991336; x=1696527336;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=C/oQ3lZmbvcKvLDe3pdZTrgISHvSauKNIWQmlLKNQeY=;
 b=XAeFnRNLbF1BdOOVa7Vj3kI42iOIyu6jTJmrm4JX9kJEEmxCFu/VAzFM
 luqjmAVQ22MaBAH6hFSq694AicQtotZZZfT4tuTdKwV1o4yx9pd51U7P9
 KVL7Y+dIQAMtJNpiBOUJl+Z7hDU0qYmxuxwvIXFlbKcqoHgqjdJ4NzXTX
 1sNdAEVwTdPC5ooCLYWbJmvcN5/lNtg4A7Tw9iZUrzTlunbhpEdxJkg+z
 4b9R5wolioO2c9MUTdsrGm/cm5efkdcfb92LgA04j6f2mlegcYC8xIAX7
 5m4qIylFSF/daz86pmABI8tfgvuGWswmZgEvSx1C+r0ZTTLxf2srEc2GP A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10491"; a="367336561"
X-IronPort-AV: E=Sophos;i="5.95,161,1661842800"; d="scan'208";a="367336561"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2022 10:35:35 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10491"; a="575482068"
X-IronPort-AV: E=Sophos;i="5.95,161,1661842800"; d="scan'208";a="575482068"
Received: from gionescu-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.39.173])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2022 10:35:34 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH v3 1/2] drm/i915: Add a wrapper for
 frequency debugfs
In-Reply-To: <87ilkyqinj.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20221005155943.34747-1-vinay.belgaumkar@intel.com>
 <20221005155943.34747-2-vinay.belgaumkar@intel.com>
 <87ilkyqinj.fsf@intel.com>
Date: Wed, 05 Oct 2022 20:35:31 +0300
Message-ID: <87fsg2qil8.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 05 Oct 2022, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Wed, 05 Oct 2022, Vinay Belgaumkar <vinay.belgaumkar@intel.com> wrote:
>> Move it to the RPS source file.
>>
>> v2: Separate out code movement and functional changes (Jani)
>>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>

PS. Sorry, I'll leave patch 2 for someone else to review. Thanks for
making the changes, patch 1 was trivial now. :)

>
>> ---
>>  drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c | 157 +----------------
>>  drivers/gpu/drm/i915/gt/intel_rps.c           | 163 ++++++++++++++++++
>>  drivers/gpu/drm/i915/gt/intel_rps.h           |   3 +
>>  3 files changed, 167 insertions(+), 156 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
>> index 10f680dbd7b6..40d0a3be42ac 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
>> @@ -344,162 +344,7 @@ void intel_gt_pm_frequency_dump(struct intel_gt *gt, struct drm_printer *p)
>>  		drm_printf(p, "efficient (RPe) frequency: %d MHz\n",
>>  			   intel_gpu_freq(rps, rps->efficient_freq));
>>  	} else if (GRAPHICS_VER(i915) >= 6) {
>> -		u32 rp_state_limits;
>> -		u32 gt_perf_status;
>> -		struct intel_rps_freq_caps caps;
>> -		u32 rpmodectl, rpinclimit, rpdeclimit;
>> -		u32 rpstat, cagf, reqf;
>> -		u32 rpcurupei, rpcurup, rpprevup;
>> -		u32 rpcurdownei, rpcurdown, rpprevdown;
>> -		u32 rpupei, rpupt, rpdownei, rpdownt;
>> -		u32 pm_ier, pm_imr, pm_isr, pm_iir, pm_mask;
>> -
>> -		rp_state_limits = intel_uncore_read(uncore, GEN6_RP_STATE_LIMITS);
>> -		gen6_rps_get_freq_caps(rps, &caps);
>> -		if (IS_GEN9_LP(i915))
>> -			gt_perf_status = intel_uncore_read(uncore, BXT_GT_PERF_STATUS);
>> -		else
>> -			gt_perf_status = intel_uncore_read(uncore, GEN6_GT_PERF_STATUS);
>> -
>> -		/* RPSTAT1 is in the GT power well */
>> -		intel_uncore_forcewake_get(uncore, FORCEWAKE_ALL);
>> -
>> -		reqf = intel_uncore_read(uncore, GEN6_RPNSWREQ);
>> -		if (GRAPHICS_VER(i915) >= 9) {
>> -			reqf >>= 23;
>> -		} else {
>> -			reqf &= ~GEN6_TURBO_DISABLE;
>> -			if (IS_HASWELL(i915) || IS_BROADWELL(i915))
>> -				reqf >>= 24;
>> -			else
>> -				reqf >>= 25;
>> -		}
>> -		reqf = intel_gpu_freq(rps, reqf);
>> -
>> -		rpmodectl = intel_uncore_read(uncore, GEN6_RP_CONTROL);
>> -		rpinclimit = intel_uncore_read(uncore, GEN6_RP_UP_THRESHOLD);
>> -		rpdeclimit = intel_uncore_read(uncore, GEN6_RP_DOWN_THRESHOLD);
>> -
>> -		rpstat = intel_uncore_read(uncore, GEN6_RPSTAT1);
>> -		rpcurupei = intel_uncore_read(uncore, GEN6_RP_CUR_UP_EI) & GEN6_CURICONT_MASK;
>> -		rpcurup = intel_uncore_read(uncore, GEN6_RP_CUR_UP) & GEN6_CURBSYTAVG_MASK;
>> -		rpprevup = intel_uncore_read(uncore, GEN6_RP_PREV_UP) & GEN6_CURBSYTAVG_MASK;
>> -		rpcurdownei = intel_uncore_read(uncore, GEN6_RP_CUR_DOWN_EI) & GEN6_CURIAVG_MASK;
>> -		rpcurdown = intel_uncore_read(uncore, GEN6_RP_CUR_DOWN) & GEN6_CURBSYTAVG_MASK;
>> -		rpprevdown = intel_uncore_read(uncore, GEN6_RP_PREV_DOWN) & GEN6_CURBSYTAVG_MASK;
>> -
>> -		rpupei = intel_uncore_read(uncore, GEN6_RP_UP_EI);
>> -		rpupt = intel_uncore_read(uncore, GEN6_RP_UP_THRESHOLD);
>> -
>> -		rpdownei = intel_uncore_read(uncore, GEN6_RP_DOWN_EI);
>> -		rpdownt = intel_uncore_read(uncore, GEN6_RP_DOWN_THRESHOLD);
>> -
>> -		cagf = intel_rps_read_actual_frequency(rps);
>> -
>> -		intel_uncore_forcewake_put(uncore, FORCEWAKE_ALL);
>> -
>> -		if (GRAPHICS_VER(i915) >= 11) {
>> -			pm_ier = intel_uncore_read(uncore, GEN11_GPM_WGBOXPERF_INTR_ENABLE);
>> -			pm_imr = intel_uncore_read(uncore, GEN11_GPM_WGBOXPERF_INTR_MASK);
>> -			/*
>> -			 * The equivalent to the PM ISR & IIR cannot be read
>> -			 * without affecting the current state of the system
>> -			 */
>> -			pm_isr = 0;
>> -			pm_iir = 0;
>> -		} else if (GRAPHICS_VER(i915) >= 8) {
>> -			pm_ier = intel_uncore_read(uncore, GEN8_GT_IER(2));
>> -			pm_imr = intel_uncore_read(uncore, GEN8_GT_IMR(2));
>> -			pm_isr = intel_uncore_read(uncore, GEN8_GT_ISR(2));
>> -			pm_iir = intel_uncore_read(uncore, GEN8_GT_IIR(2));
>> -		} else {
>> -			pm_ier = intel_uncore_read(uncore, GEN6_PMIER);
>> -			pm_imr = intel_uncore_read(uncore, GEN6_PMIMR);
>> -			pm_isr = intel_uncore_read(uncore, GEN6_PMISR);
>> -			pm_iir = intel_uncore_read(uncore, GEN6_PMIIR);
>> -		}
>> -		pm_mask = intel_uncore_read(uncore, GEN6_PMINTRMSK);
>> -
>> -		drm_printf(p, "Video Turbo Mode: %s\n",
>> -			   str_yes_no(rpmodectl & GEN6_RP_MEDIA_TURBO));
>> -		drm_printf(p, "HW control enabled: %s\n",
>> -			   str_yes_no(rpmodectl & GEN6_RP_ENABLE));
>> -		drm_printf(p, "SW control enabled: %s\n",
>> -			   str_yes_no((rpmodectl & GEN6_RP_MEDIA_MODE_MASK) == GEN6_RP_MEDIA_SW_MODE));
>> -
>> -		drm_printf(p, "PM IER=0x%08x IMR=0x%08x, MASK=0x%08x\n",
>> -			   pm_ier, pm_imr, pm_mask);
>> -		if (GRAPHICS_VER(i915) <= 10)
>> -			drm_printf(p, "PM ISR=0x%08x IIR=0x%08x\n",
>> -				   pm_isr, pm_iir);
>> -		drm_printf(p, "pm_intrmsk_mbz: 0x%08x\n",
>> -			   rps->pm_intrmsk_mbz);
>> -		drm_printf(p, "GT_PERF_STATUS: 0x%08x\n", gt_perf_status);
>> -		drm_printf(p, "Render p-state ratio: %d\n",
>> -			   (gt_perf_status & (GRAPHICS_VER(i915) >= 9 ? 0x1ff00 : 0xff00)) >> 8);
>> -		drm_printf(p, "Render p-state VID: %d\n",
>> -			   gt_perf_status & 0xff);
>> -		drm_printf(p, "Render p-state limit: %d\n",
>> -			   rp_state_limits & 0xff);
>> -		drm_printf(p, "RPSTAT1: 0x%08x\n", rpstat);
>> -		drm_printf(p, "RPMODECTL: 0x%08x\n", rpmodectl);
>> -		drm_printf(p, "RPINCLIMIT: 0x%08x\n", rpinclimit);
>> -		drm_printf(p, "RPDECLIMIT: 0x%08x\n", rpdeclimit);
>> -		drm_printf(p, "RPNSWREQ: %dMHz\n", reqf);
>> -		drm_printf(p, "CAGF: %dMHz\n", cagf);
>> -		drm_printf(p, "RP CUR UP EI: %d (%lldns)\n",
>> -			   rpcurupei,
>> -			   intel_gt_pm_interval_to_ns(gt, rpcurupei));
>> -		drm_printf(p, "RP CUR UP: %d (%lldns)\n",
>> -			   rpcurup, intel_gt_pm_interval_to_ns(gt, rpcurup));
>> -		drm_printf(p, "RP PREV UP: %d (%lldns)\n",
>> -			   rpprevup, intel_gt_pm_interval_to_ns(gt, rpprevup));
>> -		drm_printf(p, "Up threshold: %d%%\n",
>> -			   rps->power.up_threshold);
>> -		drm_printf(p, "RP UP EI: %d (%lldns)\n",
>> -			   rpupei, intel_gt_pm_interval_to_ns(gt, rpupei));
>> -		drm_printf(p, "RP UP THRESHOLD: %d (%lldns)\n",
>> -			   rpupt, intel_gt_pm_interval_to_ns(gt, rpupt));
>> -
>> -		drm_printf(p, "RP CUR DOWN EI: %d (%lldns)\n",
>> -			   rpcurdownei,
>> -			   intel_gt_pm_interval_to_ns(gt, rpcurdownei));
>> -		drm_printf(p, "RP CUR DOWN: %d (%lldns)\n",
>> -			   rpcurdown,
>> -			   intel_gt_pm_interval_to_ns(gt, rpcurdown));
>> -		drm_printf(p, "RP PREV DOWN: %d (%lldns)\n",
>> -			   rpprevdown,
>> -			   intel_gt_pm_interval_to_ns(gt, rpprevdown));
>> -		drm_printf(p, "Down threshold: %d%%\n",
>> -			   rps->power.down_threshold);
>> -		drm_printf(p, "RP DOWN EI: %d (%lldns)\n",
>> -			   rpdownei, intel_gt_pm_interval_to_ns(gt, rpdownei));
>> -		drm_printf(p, "RP DOWN THRESHOLD: %d (%lldns)\n",
>> -			   rpdownt, intel_gt_pm_interval_to_ns(gt, rpdownt));
>> -
>> -		drm_printf(p, "Lowest (RPN) frequency: %dMHz\n",
>> -			   intel_gpu_freq(rps, caps.min_freq));
>> -		drm_printf(p, "Nominal (RP1) frequency: %dMHz\n",
>> -			   intel_gpu_freq(rps, caps.rp1_freq));
>> -		drm_printf(p, "Max non-overclocked (RP0) frequency: %dMHz\n",
>> -			   intel_gpu_freq(rps, caps.rp0_freq));
>> -		drm_printf(p, "Max overclocked frequency: %dMHz\n",
>> -			   intel_gpu_freq(rps, rps->max_freq));
>> -
>> -		drm_printf(p, "Current freq: %d MHz\n",
>> -			   intel_gpu_freq(rps, rps->cur_freq));
>> -		drm_printf(p, "Actual freq: %d MHz\n", cagf);
>> -		drm_printf(p, "Idle freq: %d MHz\n",
>> -			   intel_gpu_freq(rps, rps->idle_freq));
>> -		drm_printf(p, "Min freq: %d MHz\n",
>> -			   intel_gpu_freq(rps, rps->min_freq));
>> -		drm_printf(p, "Boost freq: %d MHz\n",
>> -			   intel_gpu_freq(rps, rps->boost_freq));
>> -		drm_printf(p, "Max freq: %d MHz\n",
>> -			   intel_gpu_freq(rps, rps->max_freq));
>> -		drm_printf(p,
>> -			   "efficient (RPe) frequency: %d MHz\n",
>> -			   intel_gpu_freq(rps, rps->efficient_freq));
>> +		gen6_rps_frequency_dump(rps, p);
>>  	} else {
>>  		drm_puts(p, "no P-state info available\n");
>>  	}
>> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
>> index 17b40b625e31..737db780db00 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_rps.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
>> @@ -2219,6 +2219,169 @@ u32 intel_rps_get_rpn_frequency(struct intel_rps *rps)
>>  		return intel_gpu_freq(rps, rps->min_freq);
>>  }
>>  
>> +void gen6_rps_frequency_dump(struct intel_rps *rps, struct drm_printer *p)
>> +{
>> +	struct intel_gt *gt = rps_to_gt(rps);
>> +	struct drm_i915_private *i915 = gt->i915;
>> +	struct intel_uncore *uncore = gt->uncore;
>> +	struct intel_rps_freq_caps caps;
>> +	u32 rp_state_limits;
>> +	u32 gt_perf_status;
>> +	u32 rpmodectl, rpinclimit, rpdeclimit;
>> +	u32 rpstat, cagf, reqf;
>> +	u32 rpcurupei, rpcurup, rpprevup;
>> +	u32 rpcurdownei, rpcurdown, rpprevdown;
>> +	u32 rpupei, rpupt, rpdownei, rpdownt;
>> +	u32 pm_ier, pm_imr, pm_isr, pm_iir, pm_mask;
>> +
>> +	rp_state_limits = intel_uncore_read(uncore, GEN6_RP_STATE_LIMITS);
>> +	gen6_rps_get_freq_caps(rps, &caps);
>> +	if (IS_GEN9_LP(i915))
>> +		gt_perf_status = intel_uncore_read(uncore, BXT_GT_PERF_STATUS);
>> +	else
>> +		gt_perf_status = intel_uncore_read(uncore, GEN6_GT_PERF_STATUS);
>> +
>> +	/* RPSTAT1 is in the GT power well */
>> +	intel_uncore_forcewake_get(uncore, FORCEWAKE_ALL);
>> +
>> +	reqf = intel_uncore_read(uncore, GEN6_RPNSWREQ);
>> +	if (GRAPHICS_VER(i915) >= 9) {
>> +		reqf >>= 23;
>> +	} else {
>> +		reqf &= ~GEN6_TURBO_DISABLE;
>> +		if (IS_HASWELL(i915) || IS_BROADWELL(i915))
>> +			reqf >>= 24;
>> +		else
>> +			reqf >>= 25;
>> +	}
>> +	reqf = intel_gpu_freq(rps, reqf);
>> +
>> +	rpmodectl = intel_uncore_read(uncore, GEN6_RP_CONTROL);
>> +	rpinclimit = intel_uncore_read(uncore, GEN6_RP_UP_THRESHOLD);
>> +	rpdeclimit = intel_uncore_read(uncore, GEN6_RP_DOWN_THRESHOLD);
>> +
>> +	rpstat = intel_uncore_read(uncore, GEN6_RPSTAT1);
>> +	rpcurupei = intel_uncore_read(uncore, GEN6_RP_CUR_UP_EI) & GEN6_CURICONT_MASK;
>> +	rpcurup = intel_uncore_read(uncore, GEN6_RP_CUR_UP) & GEN6_CURBSYTAVG_MASK;
>> +	rpprevup = intel_uncore_read(uncore, GEN6_RP_PREV_UP) & GEN6_CURBSYTAVG_MASK;
>> +	rpcurdownei = intel_uncore_read(uncore, GEN6_RP_CUR_DOWN_EI) & GEN6_CURIAVG_MASK;
>> +	rpcurdown = intel_uncore_read(uncore, GEN6_RP_CUR_DOWN) & GEN6_CURBSYTAVG_MASK;
>> +	rpprevdown = intel_uncore_read(uncore, GEN6_RP_PREV_DOWN) & GEN6_CURBSYTAVG_MASK;
>> +
>> +	rpupei = intel_uncore_read(uncore, GEN6_RP_UP_EI);
>> +	rpupt = intel_uncore_read(uncore, GEN6_RP_UP_THRESHOLD);
>> +
>> +	rpdownei = intel_uncore_read(uncore, GEN6_RP_DOWN_EI);
>> +	rpdownt = intel_uncore_read(uncore, GEN6_RP_DOWN_THRESHOLD);
>> +
>> +	cagf = intel_rps_read_actual_frequency(rps);
>> +
>> +	intel_uncore_forcewake_put(uncore, FORCEWAKE_ALL);
>> +
>> +	if (GRAPHICS_VER(i915) >= 11) {
>> +		pm_ier = intel_uncore_read(uncore, GEN11_GPM_WGBOXPERF_INTR_ENABLE);
>> +		pm_imr = intel_uncore_read(uncore, GEN11_GPM_WGBOXPERF_INTR_MASK);
>> +		/*
>> +		 * The equivalent to the PM ISR & IIR cannot be read
>> +		 * without affecting the current state of the system
>> +		 */
>> +		pm_isr = 0;
>> +		pm_iir = 0;
>> +	} else if (GRAPHICS_VER(i915) >= 8) {
>> +		pm_ier = intel_uncore_read(uncore, GEN8_GT_IER(2));
>> +		pm_imr = intel_uncore_read(uncore, GEN8_GT_IMR(2));
>> +		pm_isr = intel_uncore_read(uncore, GEN8_GT_ISR(2));
>> +		pm_iir = intel_uncore_read(uncore, GEN8_GT_IIR(2));
>> +	} else {
>> +		pm_ier = intel_uncore_read(uncore, GEN6_PMIER);
>> +		pm_imr = intel_uncore_read(uncore, GEN6_PMIMR);
>> +		pm_isr = intel_uncore_read(uncore, GEN6_PMISR);
>> +		pm_iir = intel_uncore_read(uncore, GEN6_PMIIR);
>> +	}
>> +	pm_mask = intel_uncore_read(uncore, GEN6_PMINTRMSK);
>> +
>> +	drm_printf(p, "Video Turbo Mode: %s\n",
>> +		   str_yes_no(rpmodectl & GEN6_RP_MEDIA_TURBO));
>> +	drm_printf(p, "HW control enabled: %s\n",
>> +		   str_yes_no(rpmodectl & GEN6_RP_ENABLE));
>> +	drm_printf(p, "SW control enabled: %s\n",
>> +		   str_yes_no((rpmodectl & GEN6_RP_MEDIA_MODE_MASK) == GEN6_RP_MEDIA_SW_MODE));
>> +
>> +	drm_printf(p, "PM IER=0x%08x IMR=0x%08x, MASK=0x%08x\n",
>> +		   pm_ier, pm_imr, pm_mask);
>> +	if (GRAPHICS_VER(i915) <= 10)
>> +		drm_printf(p, "PM ISR=0x%08x IIR=0x%08x\n",
>> +			   pm_isr, pm_iir);
>> +	drm_printf(p, "pm_intrmsk_mbz: 0x%08x\n",
>> +		   rps->pm_intrmsk_mbz);
>> +	drm_printf(p, "GT_PERF_STATUS: 0x%08x\n", gt_perf_status);
>> +	drm_printf(p, "Render p-state ratio: %d\n",
>> +		   (gt_perf_status & (GRAPHICS_VER(i915) >= 9 ? 0x1ff00 : 0xff00)) >> 8);
>> +	drm_printf(p, "Render p-state VID: %d\n",
>> +		   gt_perf_status & 0xff);
>> +	drm_printf(p, "Render p-state limit: %d\n",
>> +		   rp_state_limits & 0xff);
>> +	drm_printf(p, "RPSTAT1: 0x%08x\n", rpstat);
>> +	drm_printf(p, "RPMODECTL: 0x%08x\n", rpmodectl);
>> +	drm_printf(p, "RPINCLIMIT: 0x%08x\n", rpinclimit);
>> +	drm_printf(p, "RPDECLIMIT: 0x%08x\n", rpdeclimit);
>> +	drm_printf(p, "RPNSWREQ: %dMHz\n", reqf);
>> +	drm_printf(p, "CAGF: %dMHz\n", cagf);
>> +	drm_printf(p, "RP CUR UP EI: %d (%lldns)\n",
>> +		   rpcurupei,
>> +		   intel_gt_pm_interval_to_ns(gt, rpcurupei));
>> +	drm_printf(p, "RP CUR UP: %d (%lldns)\n",
>> +		   rpcurup, intel_gt_pm_interval_to_ns(gt, rpcurup));
>> +	drm_printf(p, "RP PREV UP: %d (%lldns)\n",
>> +		   rpprevup, intel_gt_pm_interval_to_ns(gt, rpprevup));
>> +	drm_printf(p, "Up threshold: %d%%\n",
>> +		   rps->power.up_threshold);
>> +	drm_printf(p, "RP UP EI: %d (%lldns)\n",
>> +		   rpupei, intel_gt_pm_interval_to_ns(gt, rpupei));
>> +	drm_printf(p, "RP UP THRESHOLD: %d (%lldns)\n",
>> +		   rpupt, intel_gt_pm_interval_to_ns(gt, rpupt));
>> +
>> +	drm_printf(p, "RP CUR DOWN EI: %d (%lldns)\n",
>> +		   rpcurdownei,
>> +		   intel_gt_pm_interval_to_ns(gt, rpcurdownei));
>> +	drm_printf(p, "RP CUR DOWN: %d (%lldns)\n",
>> +		   rpcurdown,
>> +		   intel_gt_pm_interval_to_ns(gt, rpcurdown));
>> +	drm_printf(p, "RP PREV DOWN: %d (%lldns)\n",
>> +		   rpprevdown,
>> +		   intel_gt_pm_interval_to_ns(gt, rpprevdown));
>> +	drm_printf(p, "Down threshold: %d%%\n",
>> +		   rps->power.down_threshold);
>> +	drm_printf(p, "RP DOWN EI: %d (%lldns)\n",
>> +		   rpdownei, intel_gt_pm_interval_to_ns(gt, rpdownei));
>> +	drm_printf(p, "RP DOWN THRESHOLD: %d (%lldns)\n",
>> +		   rpdownt, intel_gt_pm_interval_to_ns(gt, rpdownt));
>> +
>> +	drm_printf(p, "Lowest (RPN) frequency: %dMHz\n",
>> +		   intel_gpu_freq(rps, caps.min_freq));
>> +	drm_printf(p, "Nominal (RP1) frequency: %dMHz\n",
>> +		   intel_gpu_freq(rps, caps.rp1_freq));
>> +	drm_printf(p, "Max non-overclocked (RP0) frequency: %dMHz\n",
>> +		   intel_gpu_freq(rps, caps.rp0_freq));
>> +	drm_printf(p, "Max overclocked frequency: %dMHz\n",
>> +		   intel_gpu_freq(rps, rps->max_freq));
>> +
>> +	drm_printf(p, "Current freq: %d MHz\n",
>> +		   intel_gpu_freq(rps, rps->cur_freq));
>> +	drm_printf(p, "Actual freq: %d MHz\n", cagf);
>> +	drm_printf(p, "Idle freq: %d MHz\n",
>> +		   intel_gpu_freq(rps, rps->idle_freq));
>> +	drm_printf(p, "Min freq: %d MHz\n",
>> +		   intel_gpu_freq(rps, rps->min_freq));
>> +	drm_printf(p, "Boost freq: %d MHz\n",
>> +		   intel_gpu_freq(rps, rps->boost_freq));
>> +	drm_printf(p, "Max freq: %d MHz\n",
>> +		   intel_gpu_freq(rps, rps->max_freq));
>> +	drm_printf(p,
>> +		   "efficient (RPe) frequency: %d MHz\n",
>> +		   intel_gpu_freq(rps, rps->efficient_freq));
>> +}
>> +
>>  static int set_max_freq(struct intel_rps *rps, u32 val)
>>  {
>>  	struct drm_i915_private *i915 = rps_to_i915(rps);
>> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.h b/drivers/gpu/drm/i915/gt/intel_rps.h
>> index 4509dfdc52e0..110300dfd438 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_rps.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_rps.h
>> @@ -10,6 +10,7 @@
>>  #include "i915_reg_defs.h"
>>  
>>  struct i915_request;
>> +struct drm_printer;
>>  
>>  void intel_rps_init_early(struct intel_rps *rps);
>>  void intel_rps_init(struct intel_rps *rps);
>> @@ -54,6 +55,8 @@ void intel_rps_lower_unslice(struct intel_rps *rps);
>>  u32 intel_rps_read_throttle_reason(struct intel_rps *rps);
>>  bool rps_read_mask_mmio(struct intel_rps *rps, i915_reg_t reg32, u32 mask);
>>  
>> +void gen6_rps_frequency_dump(struct intel_rps *rps, struct drm_printer *p);
>> +
>>  void gen5_rps_irq_handler(struct intel_rps *rps);
>>  void gen6_rps_irq_handler(struct intel_rps *rps, u32 pm_iir);
>>  void gen11_rps_irq_handler(struct intel_rps *rps, u32 pm_iir);

-- 
Jani Nikula, Intel Open Source Graphics Center
