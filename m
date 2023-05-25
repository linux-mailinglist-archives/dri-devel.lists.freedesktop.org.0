Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A25BE7105C3
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 08:45:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D93310E6B0;
	Thu, 25 May 2023 06:45:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD24B10E6B0;
 Thu, 25 May 2023 06:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684997141; x=1716533141;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=sls89+aDfzj+zo9cjx73tQNm8S7wFlPFhfr7Asf2lzg=;
 b=bSZ21WW1Bo6w6QflcakDcmAloMezsdzP6LJIM+D7HK8JzNJglBcS0YzR
 l5yNcBcvXBamfWldbSl7WAsQdL7bCIEXOvfQTzD40GB6NiPG7qFlmMB3Z
 en2sS68DtEoM9llPfJiZo5QWgFeHaGxbO+R/6W+mBcZSeNc3SxApSfUlq
 kRbr8vCFMVY0sTncYHlLeRW+O1i3cBOQqKCcEGRfkNYSZOTT3NsM0Hg0i
 wA4Q+u2utaqZVhlVRAIs5DQ+aYLZUX4A1+lk/xaMm5SKxl7OYk3zBozF9
 61tmKyberarrKuJQqgH8IKlbsbzaUgHh0QwiJA+ip+Q9fFDj1wR+kXs0u g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="419522167"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; d="scan'208";a="419522167"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 23:45:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="704685798"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; d="scan'208";a="704685798"
Received: from szwolins-mobl1.ger.corp.intel.com (HELO [10.213.31.180])
 ([10.213.31.180])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 23:45:39 -0700
Message-ID: <2ca66c7b-725f-854b-c855-86de031e23ec@intel.com>
Date: Thu, 25 May 2023 08:45:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] drm/i915/pmu: Turn off the timer to sample
 frequencies when GT is parked
Content-Language: en-US
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, intel-gfx@lists.freedesktop.org
References: <20230524215629.97920-1-ashutosh.dixit@intel.com>
 <20230524215629.97920-2-ashutosh.dixit@intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20230524215629.97920-2-ashutosh.dixit@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 24.05.2023 23:56, Ashutosh Dixit wrote:
> pmu_needs_timer() keeps the timer running even when GT is parked,
> ostensibly to sample requested/actual frequencies. However
> frequency_sample() has the following:
>
> 	/* Report 0/0 (actual/requested) frequency while parked. */
> 	if (!intel_gt_pm_get_if_awake(gt))
> 		return;
>
> The above code prevents frequencies to be sampled while the GT is
> parked. So we might as well turn off the sampling timer itself in this
> case and save CPU cycles/power.
>
> v2: Instead of turning freq bits off, return false, since no counters will
>      run after this change when GT is parked (Tvrtko)
> v3: Remove gpu_active argument of pmu_needs_timer (Andrzej)
>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej
> ---
>   drivers/gpu/drm/i915/i915_pmu.c | 16 +++++-----------
>   1 file changed, 5 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
> index a814583e19fd7..09313cf9316b4 100644
> --- a/drivers/gpu/drm/i915/i915_pmu.c
> +++ b/drivers/gpu/drm/i915/i915_pmu.c
> @@ -139,7 +139,7 @@ static u32 frequency_enabled_mask(void)
>   	return mask;
>   }
>   
> -static bool pmu_needs_timer(struct i915_pmu *pmu, bool gpu_active)
> +static bool pmu_needs_timer(struct i915_pmu *pmu)
>   {
>   	struct drm_i915_private *i915 = container_of(pmu, typeof(*i915), pmu);
>   	u32 enable;
> @@ -157,17 +157,11 @@ static bool pmu_needs_timer(struct i915_pmu *pmu, bool gpu_active)
>   	 */
>   	enable &= frequency_enabled_mask() | ENGINE_SAMPLE_MASK;
>   
> -	/*
> -	 * When the GPU is idle per-engine counters do not need to be
> -	 * running so clear those bits out.
> -	 */
> -	if (!gpu_active)
> -		enable &= ~ENGINE_SAMPLE_MASK;
>   	/*
>   	 * Also there is software busyness tracking available we do not
>   	 * need the timer for I915_SAMPLE_BUSY counter.
>   	 */
> -	else if (i915->caps.scheduler & I915_SCHEDULER_CAP_ENGINE_BUSY_STATS)
> +	if (i915->caps.scheduler & I915_SCHEDULER_CAP_ENGINE_BUSY_STATS)
>   		enable &= ~BIT(I915_SAMPLE_BUSY);
>   
>   	/*
> @@ -295,7 +289,7 @@ static void park_rc6(struct intel_gt *gt)
>   
>   static void __i915_pmu_maybe_start_timer(struct i915_pmu *pmu)
>   {
> -	if (!pmu->timer_enabled && pmu_needs_timer(pmu, true)) {
> +	if (!pmu->timer_enabled && pmu_needs_timer(pmu)) {
>   		pmu->timer_enabled = true;
>   		pmu->timer_last = ktime_get();
>   		hrtimer_start_range_ns(&pmu->timer,
> @@ -321,7 +315,7 @@ void i915_pmu_gt_parked(struct intel_gt *gt)
>   	 */
>   	pmu->unparked &= ~BIT(gt->info.id);
>   	if (pmu->unparked == 0)
> -		pmu->timer_enabled = pmu_needs_timer(pmu, false);
> +		pmu->timer_enabled = false;
>   
>   	spin_unlock_irq(&pmu->lock);
>   }
> @@ -827,7 +821,7 @@ static void i915_pmu_disable(struct perf_event *event)
>   	 */
>   	if (--pmu->enable_count[bit] == 0) {
>   		pmu->enable &= ~BIT(bit);
> -		pmu->timer_enabled &= pmu_needs_timer(pmu, true);
> +		pmu->timer_enabled &= pmu_needs_timer(pmu);
>   	}
>   
>   	spin_unlock_irqrestore(&pmu->lock, flags);

