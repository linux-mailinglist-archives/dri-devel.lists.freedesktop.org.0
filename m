Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E87936BAC61
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 10:43:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D8B410E987;
	Wed, 15 Mar 2023 09:43:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D9F310E985;
 Wed, 15 Mar 2023 09:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678873414; x=1710409414;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=6GFvbkbHAauvDgaRZeTIHV3tjysZP9qaWRU08TEXMyU=;
 b=j5Bh61qCKBlqWc6Js96lI/tSQS/XzGLsKKgwotYv9kNShI+z7GqsEf6f
 ndpSVs1a+vtLm9yKWhtTclUTNvHz9ycJAhNmeonHGCCYpHXv5UcJ+ds4F
 nC0rpfL9JmYvdnS6n1gGCOABL02LSRLh5M3TMmmojtPxq5m19o/xV/rQ0
 6iYc7TtnEf4JbAoXsaAFQn8Liv/iXt5pW8sgaM0bPtqqgrs5kGnBo79q1
 tHENVMM4JyOMAAzFs1MkYE0aP6OY8065O3hYJA7EaQKMaf9jPenEHjRLS
 P4kKm0ziEaaL9HbcHE86u6Dp1BmczjWIz0NuDm+ocSwuqbxUDe/xu8Uob w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="335143671"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; d="scan'208";a="335143671"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2023 02:43:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="789732833"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; d="scan'208";a="789732833"
Received: from mchanan-mobl.ger.corp.intel.com (HELO [10.213.222.39])
 ([10.213.222.39])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2023 02:43:32 -0700
Message-ID: <44cf9bcf-ee64-3340-9836-27babb0b1b9c@linux.intel.com>
Date: Wed, 15 Mar 2023 09:43:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] drm/i915/pmu: Use functions common with sysfs to read
 actual freq
Content-Language: en-US
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, intel-gfx@lists.freedesktop.org
References: <20230310005943.1029333-1-ashutosh.dixit@intel.com>
 <20230310005943.1029333-2-ashutosh.dixit@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20230310005943.1029333-2-ashutosh.dixit@intel.com>
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
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 10/03/2023 00:59, Ashutosh Dixit wrote:
> Expose intel_rps_read_actual_frequency_fw to read the actual freq without
> taking forcewake for use by PMU. The code is refactored to use a common set
> of functions across sysfs and PMU. Using common functions with sysfs in PMU
> solves the issues of missing support for MTL and missing support for older
> generations (prior to Gen6). It also future proofs the PMU where sometimes
> code has been updated for sysfs and PMU has been missed.
> 
> v2: Remove runtime_pm_if_in_use from read_actual_frequency_fw (Tvrtko)
> 
> Fixes: 22009b6dad66 ("drm/i915/mtl: Modify CAGF functions for MTL")
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/8280
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_rps.c | 34 ++++++++++++++++-------------
>   drivers/gpu/drm/i915/gt/intel_rps.h |  2 +-
>   drivers/gpu/drm/i915/i915_pmu.c     | 10 ++++-----
>   3 files changed, 24 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
> index 4d0dc9de23f9..9d9ac35691fc 100644
> --- a/drivers/gpu/drm/i915/gt/intel_rps.c
> +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
> @@ -2046,16 +2046,6 @@ void intel_rps_sanitize(struct intel_rps *rps)
>   		rps_disable_interrupts(rps);
>   }
>   
> -u32 intel_rps_read_rpstat_fw(struct intel_rps *rps)
> -{
> -	struct drm_i915_private *i915 = rps_to_i915(rps);
> -	i915_reg_t rpstat;
> -
> -	rpstat = (GRAPHICS_VER(i915) >= 12) ? GEN12_RPSTAT1 : GEN6_RPSTAT1;
> -
> -	return intel_uncore_read_fw(rps_to_gt(rps)->uncore, rpstat);
> -}
> -
>   u32 intel_rps_read_rpstat(struct intel_rps *rps)
>   {
>   	struct drm_i915_private *i915 = rps_to_i915(rps);
> @@ -2089,10 +2079,11 @@ u32 intel_rps_get_cagf(struct intel_rps *rps, u32 rpstat)
>   	return cagf;
>   }
>   
> -static u32 read_cagf(struct intel_rps *rps)
> +static u32 __read_cagf(struct intel_rps *rps, bool take_fw)
>   {
>   	struct drm_i915_private *i915 = rps_to_i915(rps);
>   	struct intel_uncore *uncore = rps_to_uncore(rps);
> +	i915_reg_t r = INVALID_MMIO_REG;
>   	u32 freq;
>   
>   	/*
> @@ -2100,22 +2091,30 @@ static u32 read_cagf(struct intel_rps *rps)
>   	 * registers will return 0 freq when GT is in RC6
>   	 */
>   	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70)) {
> -		freq = intel_uncore_read(uncore, MTL_MIRROR_TARGET_WP1);
> +		r = MTL_MIRROR_TARGET_WP1;
>   	} else if (GRAPHICS_VER(i915) >= 12) {
> -		freq = intel_uncore_read(uncore, GEN12_RPSTAT1);
> +		r = GEN12_RPSTAT1;
>   	} else if (IS_VALLEYVIEW(i915) || IS_CHERRYVIEW(i915)) {
>   		vlv_punit_get(i915);
>   		freq = vlv_punit_read(i915, PUNIT_REG_GPU_FREQ_STS);
>   		vlv_punit_put(i915);
> +		goto exit;

Alternatively you could avoid the goto by making the read below 
conditional on r being set. One more conditional though for avoiding 
gotos.. up to you.

>   	} else if (GRAPHICS_VER(i915) >= 6) {
> -		freq = intel_uncore_read(uncore, GEN6_RPSTAT1);
> +		r = GEN6_RPSTAT1;
>   	} else {
> -		freq = intel_uncore_read(uncore, MEMSTAT_ILK);
> +		r = MEMSTAT_ILK;
>   	}
>   
> +	freq = take_fw ? intel_uncore_read(uncore, r) : intel_uncore_read_fw(uncore, r);
> +exit:
>   	return intel_rps_get_cagf(rps, freq);
>   }
>   
> +static u32 read_cagf(struct intel_rps *rps)
> +{
> +	return __read_cagf(rps, true);
> +}

There is only one caller so up to you if you think a helper is needed or 
not.

> +
>   u32 intel_rps_read_actual_frequency(struct intel_rps *rps)
>   {
>   	struct intel_runtime_pm *rpm = rps_to_uncore(rps)->rpm;
> @@ -2128,6 +2127,11 @@ u32 intel_rps_read_actual_frequency(struct intel_rps *rps)
>   	return freq;
>   }
>   
> +u32 intel_rps_read_actual_frequency_fw(struct intel_rps *rps)
> +{
> +	return intel_gpu_freq(rps, __read_cagf(rps, false));
> +}
> +
>   u32 intel_rps_read_punit_req(struct intel_rps *rps)
>   {
>   	struct intel_uncore *uncore = rps_to_uncore(rps);
> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.h b/drivers/gpu/drm/i915/gt/intel_rps.h
> index c622962c6bef..2d5b3ef58606 100644
> --- a/drivers/gpu/drm/i915/gt/intel_rps.h
> +++ b/drivers/gpu/drm/i915/gt/intel_rps.h
> @@ -39,6 +39,7 @@ int intel_gpu_freq(struct intel_rps *rps, int val);
>   int intel_freq_opcode(struct intel_rps *rps, int val);
>   u32 intel_rps_get_cagf(struct intel_rps *rps, u32 rpstat1);
>   u32 intel_rps_read_actual_frequency(struct intel_rps *rps);
> +u32 intel_rps_read_actual_frequency_fw(struct intel_rps *rps);
>   u32 intel_rps_get_requested_frequency(struct intel_rps *rps);
>   u32 intel_rps_get_min_frequency(struct intel_rps *rps);
>   u32 intel_rps_get_min_raw_freq(struct intel_rps *rps);
> @@ -52,7 +53,6 @@ u32 intel_rps_get_rpn_frequency(struct intel_rps *rps);
>   u32 intel_rps_read_punit_req(struct intel_rps *rps);
>   u32 intel_rps_read_punit_req_frequency(struct intel_rps *rps);
>   u32 intel_rps_read_rpstat(struct intel_rps *rps);
> -u32 intel_rps_read_rpstat_fw(struct intel_rps *rps);
>   void gen6_rps_get_freq_caps(struct intel_rps *rps, struct intel_rps_freq_caps *caps);
>   void intel_rps_raise_unslice(struct intel_rps *rps);
>   void intel_rps_lower_unslice(struct intel_rps *rps);
> diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
> index a76c5ce9513d..7ece883a7d95 100644
> --- a/drivers/gpu/drm/i915/i915_pmu.c
> +++ b/drivers/gpu/drm/i915/i915_pmu.c
> @@ -392,14 +392,12 @@ frequency_sample(struct intel_gt *gt, unsigned int period_ns)
>   		 * case we assume the system is running at the intended
>   		 * frequency. Fortunately, the read should rarely fail!
>   		 */
> -		val = intel_rps_read_rpstat_fw(rps);
> -		if (val)
> -			val = intel_rps_get_cagf(rps, val);

I think you can un-export this one now.

With that looks okay to me, with or without the other stuff:

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko

> -		else
> -			val = rps->cur_freq;
> +		val = intel_rps_read_actual_frequency_fw(rps);
> +		if (!val)
> +			val = intel_gpu_freq(rps, rps->cur_freq);
>   
>   		add_sample_mult(&pmu->sample[__I915_SAMPLE_FREQ_ACT],
> -				intel_gpu_freq(rps, val), period_ns / 1000);
> +				val, period_ns / 1000);
>   	}
>   
>   	if (pmu->enable & config_mask(I915_PMU_REQUESTED_FREQUENCY)) {
