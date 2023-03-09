Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E516B1FDB
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 10:20:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B067F10E7BD;
	Thu,  9 Mar 2023 09:20:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B222910E7BC;
 Thu,  9 Mar 2023 09:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678353628; x=1709889628;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=tSrlRhGmP/2HqrP2ZPWsvNq5AyYvDwGhWG/590D5oNw=;
 b=m7GDZrWBPNwNHY+/l3pu70UnWcMeDKFV++bDXlsXyCmZC/DtoCIPhxX+
 mBROVF9L15NTz+v+cwkB71qGNgh6WoBSKBmu4MTxXJ7Re1/YplJ/u0OCQ
 Z8m/Y6HTS1VhCpeF5trL5uZQEwDsowiOVdyTF25V8qzYMOqNsfrWeUUpd
 S6+KFdo8MKpvvzcaJHJTQnwKRDq1vFbS/gyTXE/qBaTRzouaM4Dbu//3K
 w41QeEU1dv+z2AtB+Q3ikTpk0Mjbaaiu40Yj8RQlCFhuZXhN4fBKQ3s6j
 OPxdDRtTg4mAK7ub+GoMO971QboTwOMuW2c3OOV4Zy8JiTTaOC6nFTDAk w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="333870204"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; d="scan'208";a="333870204"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2023 01:20:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="820540229"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; d="scan'208";a="820540229"
Received: from doylejix-mobl1.ger.corp.intel.com (HELO [10.213.221.148])
 ([10.213.221.148])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2023 01:20:11 -0800
Message-ID: <f7508e19-3d66-d72c-f2cf-f5810ec48c94@linux.intel.com>
Date: Thu, 9 Mar 2023 09:20:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] drm/i915/pmu: Use functions common with sysfs to read
 actual freq
Content-Language: en-US
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, intel-gfx@lists.freedesktop.org
References: <20230309034621.1008458-1-ashutosh.dixit@intel.com>
 <20230309034621.1008458-2-ashutosh.dixit@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20230309034621.1008458-2-ashutosh.dixit@intel.com>
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


On 09/03/2023 03:46, Ashutosh Dixit wrote:
> Expose intel_rps_read_actual_frequency_fw to read the actual freq without
> taking forcewake for use by PMU. The code is refactored to use a common set
> of functions across sysfs and PMU. Using common functions with sysfs in PMU
> solves the issues of missing support for MTL and missing support for older
> generations (prior to Gen6). It also future proofs the PMU where sometimes
> code has been updated for sysfs and PMU has been missed.
> 
> Fixes: 22009b6dad66 ("drm/i915/mtl: Modify CAGF functions for MTL")

So not DG1 and above?

> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/8280
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_rps.c | 46 +++++++++++++++++++----------
>   drivers/gpu/drm/i915/gt/intel_rps.h |  2 +-
>   drivers/gpu/drm/i915/i915_pmu.c     | 10 +++----
>   3 files changed, 36 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
> index 4d0dc9de23f9..3957c5ee5cba 100644
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
> +
>   u32 intel_rps_read_actual_frequency(struct intel_rps *rps)
>   {
>   	struct intel_runtime_pm *rpm = rps_to_uncore(rps)->rpm;
> @@ -2128,6 +2127,23 @@ u32 intel_rps_read_actual_frequency(struct intel_rps *rps)
>   	return freq;
>   }
>   
> +static u32 read_cagf_fw(struct intel_rps *rps)
> +{
> +	return __read_cagf(rps, false);
> +}
> +
> +u32 intel_rps_read_actual_frequency_fw(struct intel_rps *rps)
> +{
> +	struct intel_runtime_pm *rpm = rps_to_uncore(rps)->rpm;
> +	intel_wakeref_t wakeref;
> +	u32 freq = 0;
> +
> +	with_intel_runtime_pm_if_in_use(rpm, wakeref)

When called from i915_pmu.c::frequency sample() above seems redundant 
since there we already are under intel_gt_pm_get_if_awake. Perhaps it is 
not a huge deal but it is nevertheless wasteful.

Also, maybe I am a bit rusty, but more fundamentally, wouldn't this be 
adding a _very_ atypical pattern of a _fw function which grabs rpm? I'd 
expect they all assume it's already held since the forcewake is already 
held.

Am I missing the reason why it is needed?

Regards,

Tvrtko

> +		freq = intel_gpu_freq(rps, read_cagf_fw(rps));
> +
> +	return freq;
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
