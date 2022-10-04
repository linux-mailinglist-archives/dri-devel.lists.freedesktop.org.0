Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8795F3F9A
	for <lists+dri-devel@lfdr.de>; Tue,  4 Oct 2022 11:29:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E045F10E3C5;
	Tue,  4 Oct 2022 09:29:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B6C910E3C5;
 Tue,  4 Oct 2022 09:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664875785; x=1696411785;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=mpf5/q5+Vzo+E1pBNy1Oh/maPG73r4HQ+EJPJ2Tf2oc=;
 b=EiNXy/9PI9xT2519wCPXn41hVXrR92Pa8hsrbqlHAdO9W/M7PTRvnmjZ
 gz9dkUBTa1O4f4mt3q8qTx1STKeU79lfKHrUU7vXixPY575EII0IcTDKW
 icmfRyZlAW5BLDH8ifm2vY6TFhJOQUVJxbaMYo2u99mZKsYp5BELVHpFx
 Eu+2hv0vp6QD8BLM8y+NrWMJy/XSNXUIC8OW+EycQML4zJbB1hRBKs0/N
 yywLuqLzbXVGmUyY70guDaFnM4Ta6Z+v6C1fjG0p18hQT8nvMtkgcPKhH
 +7M4vVWZHXUCkPiFyDsi6CDnWutqXSmSSfIFamjKoTvKOsoMbvMTCOCvB w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10489"; a="364764939"
X-IronPort-AV: E=Sophos;i="5.93,367,1654585200"; d="scan'208";a="364764939"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2022 02:29:45 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10489"; a="749312658"
X-IronPort-AV: E=Sophos;i="5.93,367,1654585200"; d="scan'208";a="749312658"
Received: from tomfin1x-mobl1.ger.corp.intel.com (HELO [10.213.229.10])
 ([10.213.229.10])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2022 02:29:44 -0700
Message-ID: <d83e3b3b-25ee-74cd-b4a3-bee6c567d50a@linux.intel.com>
Date: Tue, 4 Oct 2022 10:29:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] drm/i915/pmu: Match frequencies reported by PMU and sysfs
Content-Language: en-US
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, intel-gfx@lists.freedesktop.org
References: <20221003192419.3541088-1-ashutosh.dixit@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20221003192419.3541088-1-ashutosh.dixit@intel.com>
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


On 03/10/2022 20:24, Ashutosh Dixit wrote:
> PMU and sysfs use different wakeref's to "interpret" zero freq. Sysfs uses
> runtime PM wakeref (see intel_rps_read_punit_req and
> intel_rps_read_actual_frequency). PMU uses the GT parked/unparked
> wakeref. In general the GT wakeref is held for less time that the runtime
> PM wakeref which causes PMU to report a lower average freq than the average
> freq obtained from sampling sysfs.
> 
> To resolve this, use the same freq functions (and wakeref's) in PMU as
> those used in sysfs.
> 
> Bug: https://gitlab.freedesktop.org/drm/intel/-/issues/7025
> Reported-by: Ashwin Kumar Kulkarni <ashwin.kumar.kulkarni@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>   drivers/gpu/drm/i915/i915_pmu.c | 27 ++-------------------------
>   1 file changed, 2 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
> index 958b37123bf1..eda03f264792 100644
> --- a/drivers/gpu/drm/i915/i915_pmu.c
> +++ b/drivers/gpu/drm/i915/i915_pmu.c
> @@ -371,37 +371,16 @@ static void
>   frequency_sample(struct intel_gt *gt, unsigned int period_ns)
>   {
>   	struct drm_i915_private *i915 = gt->i915;
> -	struct intel_uncore *uncore = gt->uncore;
>   	struct i915_pmu *pmu = &i915->pmu;
>   	struct intel_rps *rps = &gt->rps;
>   
>   	if (!frequency_sampling_enabled(pmu))
>   		return;
>   
> -	/* Report 0/0 (actual/requested) frequency while parked. */
> -	if (!intel_gt_pm_get_if_awake(gt))
> -		return;
> -
>   	if (pmu->enable & config_mask(I915_PMU_ACTUAL_FREQUENCY)) {
> -		u32 val;
> -
> -		/*
> -		 * We take a quick peek here without using forcewake
> -		 * so that we don't perturb the system under observation
> -		 * (forcewake => !rc6 => increased power use). We expect
> -		 * that if the read fails because it is outside of the
> -		 * mmio power well, then it will return 0 -- in which
> -		 * case we assume the system is running at the intended
> -		 * frequency. Fortunately, the read should rarely fail!
> -		 */
> -		val = intel_uncore_read_fw(uncore, GEN6_RPSTAT1);
> -		if (val)
> -			val = intel_rps_get_cagf(rps, val);
> -		else
> -			val = rps->cur_freq;
> -
>   		add_sample_mult(&pmu->sample[__I915_SAMPLE_FREQ_ACT],
> -				intel_gpu_freq(rps, val), period_ns / 1000);
> +				intel_rps_read_actual_frequency(rps),
> +				period_ns / 1000);
>   	}
>   
>   	if (pmu->enable & config_mask(I915_PMU_REQUESTED_FREQUENCY)) {

What is software tracking of requested frequency showing when GT is 
parked or runtime suspended? With this change sampling would be outside 
any such checks so we need to be sure reported value makes sense.

Although more important open is around what is actually correct.

For instance how does the patch affect RC6 and power? I don't know how 
power management of different blocks is wired up, so personally I would 
only be able to look at it empirically. In other words what I am asking 
is this - if we changed from skipping obtaining forcewake even when 
unparked, to obtaining forcewake if not runtime suspended - what 
hardware blocks does that power up and how it affects RC6 and power? Can 
it affect actual frequency or not? (Will "something" power up the clocks 
just because we will be getting forcewake?)

Or maybe question simplified - does 200Hz polling on existing sysfs 
actual frequency field disturbs the system under some circumstances? 
(Increases power and decreases RC6.) If it does then that would be a 
problem. We want a solution which shows the real data, but where the act 
of monitoring itself does not change it too much. If it doesn't then 
it's okay.

Could you somehow investigate on these topics? Maybe log RAPL GPU power 
while polling on sysfs, versus getting the actual frequency from the 
existing PMU implementation and see if that shows anything? Or actually 
simpler - RAPL GPU power for current PMU intel_gpu_top versus this 
patch? On idle(-ish) desktop workloads perhaps? Power and frequency 
graphed for both.

Regards,

Tvrtko

> @@ -409,8 +388,6 @@ frequency_sample(struct intel_gt *gt, unsigned int period_ns)
>   				intel_rps_get_requested_frequency(rps),
>   				period_ns / 1000);
>   	}
> -
> -	intel_gt_pm_put_async(gt);
>   }
>   
>   static enum hrtimer_restart i915_sample(struct hrtimer *hrtimer)
