Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6313F70FD43
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 19:53:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9E5610E54E;
	Wed, 24 May 2023 17:53:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CFF310E040;
 Wed, 24 May 2023 17:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684950804; x=1716486804;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=XvYGmYyOOBWuE5/bTHgaDlzadt7GCen24pcW8SySHi8=;
 b=WV6zz8kl1gWl0KXVs0Y87skK/YPSs4zH3gL0GjpylpARokw26ab2aYYn
 6tDV8s/gcEis72vJ9JjcITxBJt021zAP1iBQ62iVAux5SBG2D+yj/jnkC
 /HhUHbt3KYXc+RcPHtL0rwrJRgsj8nT9JGCz/1uV/Daniy8hA7fjjKK8b
 +CIYQ5SRJQu8FNA5/CNuGdjR8hYO2C7IzPcR0S4y+LbqOEoBGJ5IWNfGE
 Gsk9TrCS0hhlcJc+pa+SuamRz7vrY7ttJ0MpxQ3U775lNw2bmwDnjfRwx
 RhjmX2c2O+DcmaQveRYsOOKH1mSd8E5G+tC+m8dxuSiCiTx5oMAYjGW6y Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="352490044"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; d="scan'208";a="352490044"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 10:53:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="1034621299"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; d="scan'208";a="1034621299"
Received: from bmhacket-mobl.ger.corp.intel.com (HELO [10.213.218.245])
 ([10.213.218.245])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 10:53:21 -0700
Message-ID: <458a92eb-5b95-4cea-ab3d-ea889b20d626@linux.intel.com>
Date: Wed, 24 May 2023 18:53:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/2] drm/i915/pmu: Make PMU sample array two-dimensional
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20230523151918.4170499-1-ashutosh.dixit@intel.com>
 <20230523151918.4170499-3-ashutosh.dixit@intel.com>
 <beaf5d7d-a611-6c87-efa7-5b4c87e5ac7d@linux.intel.com>
 <87fs7lr5oj.wl-ashutosh.dixit@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <87fs7lr5oj.wl-ashutosh.dixit@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 andrzej.hajda@intel.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 24/05/2023 18:38, Dixit, Ashutosh wrote:
> On Wed, 24 May 2023 04:38:18 -0700, Tvrtko Ursulin wrote:
>>
> 
> Hi Tvrtko,
> 
>> On 23/05/2023 16:19, Ashutosh Dixit wrote:
>>> No functional changes but we can remove some unsightly index computation
>>> and read/write functions if we convert the PMU sample array from a
>>> one-dimensional to a two-dimensional array.
>>>
>>> Suggested-by: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>>> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>>> ---
>>>    drivers/gpu/drm/i915/i915_pmu.c | 60 ++++++++++-----------------------
>>>    drivers/gpu/drm/i915/i915_pmu.h |  2 +-
>>>    2 files changed, 19 insertions(+), 43 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
>>> index b47d890d4ada1..137e0df9573ee 100644
>>> --- a/drivers/gpu/drm/i915/i915_pmu.c
>>> +++ b/drivers/gpu/drm/i915/i915_pmu.c
>>> @@ -195,33 +195,6 @@ static inline s64 ktime_since_raw(const ktime_t kt)
>>> 	return ktime_to_ns(ktime_sub(ktime_get_raw(), kt));
>>>    }
>>>    -static unsigned int
>>> -__sample_idx(struct i915_pmu *pmu, unsigned int gt_id, int sample)
>>> -{
>>> -	unsigned int idx = gt_id * __I915_NUM_PMU_SAMPLERS + sample;
>>> -
>>> -	GEM_BUG_ON(idx >= ARRAY_SIZE(pmu->sample));
>>> -
>>> -	return idx;
>>> -}
>>> -
>>> -static u64 read_sample(struct i915_pmu *pmu, unsigned int gt_id, int sample)
>>> -{
>>> -	return pmu->sample[__sample_idx(pmu, gt_id, sample)].cur;
>>> -}
>>> -
>>> -static void
>>> -store_sample(struct i915_pmu *pmu, unsigned int gt_id, int sample, u64 val)
>>> -{
>>> -	pmu->sample[__sample_idx(pmu, gt_id, sample)].cur = val;
>>> -}
>>> -
>>> -static void
>>> -add_sample_mult(struct i915_pmu *pmu, unsigned int gt_id, int sample, u32 val, u32 mul)
>>> -{
>>> -	pmu->sample[__sample_idx(pmu, gt_id, sample)].cur += mul_u32_u32(val, mul);
>>> -}
>>
>> IMO read and store helpers could have stayed and just changed the
>> implementation. Like add_sample_mult which you just moved. I would have
>> been a smaller patch. So dunno.. a bit of a reluctant r-b.
> 
> Are you referring just to add_sample_mult or to all the other functions
> too? add_sample_mult I moved it to where it was before bc4be0a38b63

Read and store helpers.

> ("drm/i915/pmu: Prepare for multi-tile non-engine counters"), could have
> left it here I guess.
> 
> The other read and store helpers are not needed with the 2-d array at all
> since the compiler itself will do that, so I thought it was better to get
> rid of them completely.

Yes I get it, just that I didn't see the benefit of removing them.

For example:

  -		store_sample(pmu, gt_id, __I915_SAMPLE_RC6, val);
  +		pmu->sample[gt_id][__I915_SAMPLE_RC6].cur = val;

It's a meh for me. Either flavour looks fine to me so I would have erred 
on the side of keeping the patch small. If anything I probably slightly 
prefer that the struct pmu_sample implementation was able to be changed 
with less churn before. For example. But a very minor argument really.

Or maybe next step is get rid of the struct i915_pmu_sample. It is a 
struct because originally previous value was tracked too. Then I removed 
that and it was easier to keep the struct. I guess it can go now and 
then the removal of helpers here will look somewhat nicer without the 
trailing .cur on every affected line.

> Let me know if you want any changes, otherwise I will leave as is.

You can leave it as is, I dont' mind much.

Regards,

Tvrtko

>> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Thanks for the review. Thanks Andrzej too :)
> --
> Ashutosh
> 
>>> -
>>>    static u64 get_rc6(struct intel_gt *gt)
>>>    {
>>> 	struct drm_i915_private *i915 = gt->i915;
>>> @@ -240,7 +213,7 @@ static u64 get_rc6(struct intel_gt *gt)
>>> 	spin_lock_irqsave(&pmu->lock, flags);
>>> 		if (awake) {
>>> -		store_sample(pmu, gt_id, __I915_SAMPLE_RC6, val);
>>> +		pmu->sample[gt_id][__I915_SAMPLE_RC6].cur = val;
>>> 	} else {
>>> 		/*
>>> 		 * We think we are runtime suspended.
>>> @@ -250,13 +223,13 @@ static u64 get_rc6(struct intel_gt *gt)
>>> 		 * counter value.
>>> 		 */
>>> 		val = ktime_since_raw(pmu->sleep_last[gt_id]);
>>> -		val += read_sample(pmu, gt_id, __I915_SAMPLE_RC6);
>>> +		val += pmu->sample[gt_id][__I915_SAMPLE_RC6].cur;
>>> 	}
>>>    -	if (val < read_sample(pmu, gt_id, __I915_SAMPLE_RC6_LAST_REPORTED))
>>> -		val = read_sample(pmu, gt_id, __I915_SAMPLE_RC6_LAST_REPORTED);
>>> +	if (val < pmu->sample[gt_id][__I915_SAMPLE_RC6_LAST_REPORTED].cur)
>>> +		val = pmu->sample[gt_id][__I915_SAMPLE_RC6_LAST_REPORTED].cur;
>>> 	else
>>> -		store_sample(pmu, gt_id, __I915_SAMPLE_RC6_LAST_REPORTED, val);
>>> +		pmu->sample[gt_id][__I915_SAMPLE_RC6_LAST_REPORTED].cur = val;
>>> 		spin_unlock_irqrestore(&pmu->lock, flags);
>>>    @@ -275,9 +248,8 @@ static void init_rc6(struct i915_pmu *pmu)
>>> 		with_intel_runtime_pm(gt->uncore->rpm, wakeref) {
>>> 			u64 val = __get_rc6(gt);
>>>    -			store_sample(pmu, i, __I915_SAMPLE_RC6, val);
>>> -			store_sample(pmu, i, __I915_SAMPLE_RC6_LAST_REPORTED,
>>> -				     val);
>>> +			pmu->sample[i][__I915_SAMPLE_RC6].cur = val;
>>> +			pmu->sample[i][__I915_SAMPLE_RC6_LAST_REPORTED].cur = val;
>>> 			pmu->sleep_last[i] = ktime_get_raw();
>>> 		}
>>> 	}
>>> @@ -287,7 +259,7 @@ static void park_rc6(struct intel_gt *gt)
>>>    {
>>> 	struct i915_pmu *pmu = &gt->i915->pmu;
>>>    -	store_sample(pmu, gt->info.id, __I915_SAMPLE_RC6, __get_rc6(gt));
>>> +	pmu->sample[gt->info.id][__I915_SAMPLE_RC6].cur = __get_rc6(gt);
>>> 	pmu->sleep_last[gt->info.id] = ktime_get_raw();
>>>    }
>>>    @@ -428,6 +400,12 @@ engines_sample(struct intel_gt *gt, unsigned int
>>> period_ns)
>>> 	}
>>>    }
>>>    +static void
>>> +add_sample_mult(struct i915_pmu_sample *sample, u32 val, u32 mul)
>>> +{
>>> +	sample->cur += mul_u32_u32(val, mul);
>>> +}
>>> +
>>>    static bool
>>>    frequency_sampling_enabled(struct i915_pmu *pmu, unsigned int gt)
>>>    {
>>> @@ -467,12 +445,12 @@ frequency_sample(struct intel_gt *gt, unsigned int period_ns)
>>> 		if (!val)
>>> 			val = intel_gpu_freq(rps, rps->cur_freq);
>>>    -		add_sample_mult(pmu, gt_id, __I915_SAMPLE_FREQ_ACT,
>>> +		add_sample_mult(&pmu->sample[gt_id][__I915_SAMPLE_FREQ_ACT],
>>> 				val, period_ns / 1000);
>>> 	}
>>> 		if (pmu->enable &
>>> config_mask(__I915_PMU_REQUESTED_FREQUENCY(gt_id))) {
>>> -		add_sample_mult(pmu, gt_id, __I915_SAMPLE_FREQ_REQ,
>>> +		add_sample_mult(&pmu->sample[gt_id][__I915_SAMPLE_FREQ_REQ],
>>> 				intel_rps_get_requested_frequency(rps),
>>> 				period_ns / 1000);
>>> 	}
>>> @@ -673,14 +651,12 @@ static u64 __i915_pmu_event_read(struct perf_event *event)
>>> 		switch (config) {
>>> 		case I915_PMU_ACTUAL_FREQUENCY:
>>> 			val =
>>> -			   div_u64(read_sample(pmu, gt_id,
>>> -					       __I915_SAMPLE_FREQ_ACT),
>>> +			   div_u64(pmu->sample[gt_id][__I915_SAMPLE_FREQ_ACT].cur,
>>> 				   USEC_PER_SEC /* to MHz */);
>>> 			break;
>>> 		case I915_PMU_REQUESTED_FREQUENCY:
>>> 			val =
>>> -			   div_u64(read_sample(pmu, gt_id,
>>> -					       __I915_SAMPLE_FREQ_REQ),
>>> +			   div_u64(pmu->sample[gt_id][__I915_SAMPLE_FREQ_REQ].cur,
>>> 				   USEC_PER_SEC /* to MHz */);
>>> 			break;
>>> 		case I915_PMU_INTERRUPTS:
>>> diff --git a/drivers/gpu/drm/i915/i915_pmu.h b/drivers/gpu/drm/i915/i915_pmu.h
>>> index 33d80fbaab8bc..d20592e7db999 100644
>>> --- a/drivers/gpu/drm/i915/i915_pmu.h
>>> +++ b/drivers/gpu/drm/i915/i915_pmu.h
>>> @@ -127,7 +127,7 @@ struct i915_pmu {
>>> 	 * Only global counters are held here, while the per-engine ones are in
>>> 	 * struct intel_engine_cs.
>>> 	 */
>>> -	struct i915_pmu_sample sample[I915_PMU_MAX_GTS * __I915_NUM_PMU_SAMPLERS];
>>> +	struct i915_pmu_sample sample[I915_PMU_MAX_GTS][__I915_NUM_PMU_SAMPLERS];
>>> 	/**
>>> 	 * @sleep_last: Last time GT parked for RC6 estimation.
>>> 	 */
