Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E2A700327
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 10:59:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4546D10E63D;
	Fri, 12 May 2023 08:59:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A71610E63D;
 Fri, 12 May 2023 08:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683881953; x=1715417953;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=HlKYt9TpjUts33XrCUFY+0VPweylzN92fbHOT2gcv4o=;
 b=PpT9E5NS9Bvgoqku5puXUqYSiUIZa5NInlIwSV/atnfRPSiI1OI/HHCd
 h6F5BWLtHJXwtr8tcr0MhZIZXd4IUs9qtaW2ADlbXZcMjGeUXtnT1Vlgw
 Nb1FU13v2UoMoMwoBmRDLxOvf+b40afVhJP1LeDDcziAyAOHa8vF7a12t
 OUvhiktN8WHUChq/044lSlaKh1bfZkMkndw6w6GjgE5ZS6WUI9o7MdKxm
 5HlYwGo3Q4/P28SDI2PcJz8a0RUS7XpVJLqI02CCQUc96A9//VIZTWtKX
 bKXAIbmKBDil1wThnEuzDqiaqDLitww/1C/zmxQdmJ8E73iUBGJW2JcBn w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="340055492"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="340055492"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 01:59:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="769725289"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="769725289"
Received: from srajbhan-mobl9.amr.corp.intel.com (HELO [10.213.229.156])
 ([10.213.229.156])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 01:59:10 -0700
Message-ID: <c267815d-6894-22b5-8530-487af2166d56@linux.intel.com>
Date: Fri, 12 May 2023 09:59:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] drm/i915/pmu: Turn off the timer to sample frequencies
 when GT is parked
Content-Language: en-US
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, intel-gfx@lists.freedesktop.org
References: <20230512015320.2610830-1-ashutosh.dixit@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20230512015320.2610830-1-ashutosh.dixit@intel.com>
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
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 12/05/2023 02:53, Ashutosh Dixit wrote:
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

The confusing situation seems to be the consequence of b66ecd0438bf ("drm/i915/pmu: Report frequency as zero while GPU is sleeping").

Before that commit we were deliberately sampling the frequencies as GPU minimum during the parked periods and to do so leaving the timer running.

But then some RPS changes exposed that approach as questionable (AFAIR software tracked state stopped being reset to min freq and so created wild PMU readings) and we went the route of reporting zero when parked.

At which point running the timer stopped making sense, so really that commit should/could have made the change you now propose.

> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>   drivers/gpu/drm/i915/i915_pmu.c | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
> index 7ece883a7d956..8db1d681cf4ab 100644
> --- a/drivers/gpu/drm/i915/i915_pmu.c
> +++ b/drivers/gpu/drm/i915/i915_pmu.c
> @@ -124,11 +124,14 @@ static bool pmu_needs_timer(struct i915_pmu *pmu, bool gpu_active)
>   		  ENGINE_SAMPLE_MASK;
>   
>   	/*
> -	 * When the GPU is idle per-engine counters do not need to be
> -	 * running so clear those bits out.
> +	 * When GPU is idle, frequency or per-engine counters do not need
> +	 * to be running so clear those bits out.
>   	 */
> -	if (!gpu_active)
> -		enable &= ~ENGINE_SAMPLE_MASK;
> +	if (!gpu_active) {
> +		enable &= ~(config_mask(I915_PMU_ACTUAL_FREQUENCY) |
> +			    config_mask(I915_PMU_REQUESTED_FREQUENCY) |
> +			    ENGINE_SAMPLE_MASK);
> +	}
>   	/*
>   	 * Also there is software busyness tracking available we do not
>   	 * need the timer for I915_SAMPLE_BUSY counter.

LGTM.

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Or maybe it is possible to simplify since it looks there is no way to return true if gt is parked. So that could be:

pmu_needs_timer(..)
{
	...

	if (!gpu_active)
		return false;

	...
	enable = pmu->enable;

	...
	enable &= config_mask(I915_PMU_ACTUAL_FREQUENCY) |
		  config_mask(I915_PMU_REQUESTED_FREQUENCY) |
		  ENGINE_SAMPLE_MASK;

	...
	if (i915->caps.scheduler & I915_SCHEDULER_CAP_ENGINE_BUSY_STATS)
		enable &= ~BIT(I915_SAMPLE_BUSY);

	return enable;
}

Not sure it is any better, your call.

Regards,

Tvrtko
