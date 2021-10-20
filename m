Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19453434460
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 06:41:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 537A46E0D2;
	Wed, 20 Oct 2021 04:41:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC56A6E0D2;
 Wed, 20 Oct 2021 04:41:14 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10142"; a="226151750"
X-IronPort-AV: E=Sophos;i="5.87,165,1631602800"; d="scan'208";a="226151750"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2021 21:41:12 -0700
X-IronPort-AV: E=Sophos;i="5.87,165,1631602800"; d="scan'208";a="567356131"
Received: from unerlige-desk.amr.corp.intel.com (HELO
 unerlige-ril-10.165.21.208) ([10.165.21.208])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2021 21:41:12 -0700
Date: Tue, 19 Oct 2021 21:41:11 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 john.c.harrison@intel.com, daniel.vetter@ffwll.ch,
 Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH 2/2] drm/i915/pmu: Connect engine busyness stats from GuC
 to pmu
Message-ID: <20211020044111.GD10100@unerlige-ril-10.165.21.208>
References: <20211015234705.12392-1-umesh.nerlige.ramappa@intel.com>
 <20211015234705.12392-2-umesh.nerlige.ramappa@intel.com>
 <2a31b713-e8ea-524b-f37c-976791a2ccc4@linux.intel.com>
 <20211018183544.GA10100@unerlige-ril-10.165.21.208>
 <bbaa19bf-d25d-d9cd-8064-cec23ec58b3a@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bbaa19bf-d25d-d9cd-8064-cec23ec58b3a@linux.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
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

On Tue, Oct 19, 2021 at 09:32:07AM +0100, Tvrtko Ursulin wrote:
>
>On 18/10/2021 19:35, Umesh Nerlige Ramappa wrote:
>>On Mon, Oct 18, 2021 at 08:58:01AM +0100, Tvrtko Ursulin wrote:
>>>
>>>
>>>On 16/10/2021 00:47, Umesh Nerlige Ramappa wrote:
>>>>With GuC handling scheduling, i915 is not aware of the time that a
>>>>context is scheduled in and out of the engine. Since i915 pmu relies on
>>>>this info to provide engine busyness to the user, GuC shares this info
>>>>with i915 for all engines using shared memory. For each engine, this
>>>>info contains:
>>>>
>>>>- total busyness: total time that the context was running (total)
>>>>- id: id of the running context (id)
>>>>- start timestamp: timestamp when the context started running (start)
>>>>
>>>>At the time (now) of sampling the engine busyness, if the id is valid
>>>>(!= ~0), and start is non-zero, then the context is considered to be
>>>>active and the engine busyness is calculated using the below equation
>>>>
>>>>    engine busyness = total + (now - start)
>>>>
>>>>All times are obtained from the gt clock base. For inactive contexts,
>>>>engine busyness is just equal to the total.
>>>>
>>>>The start and total values provided by GuC are 32 bits and wrap around
>>>>in a few minutes. Since perf pmu provides busyness as 64 bit
>>>>monotonically increasing values, there is a need for this implementation
>>>>to account for overflows and extend the time to 64 bits before returning
>>>>busyness to the user. In order to do that, a worker runs periodically at
>>>>frequency = 1/8th the time it takes for the timestamp to wrap. As an
>>>>example, that would be once in 27 seconds for a gt clock frequency of
>>>>19.2 MHz.
>>>>
>>>>Note:
>>>>There might be an overaccounting of busyness due to the fact that GuC
>>>>may be updating the total and start values while kmd is reading them.
>>>>(i.e kmd may read the updated total and the stale start). In such a
>>>>case, user may see higher busyness value followed by smaller ones which
>>>>would eventually catch up to the higher value.
>>>>
>>>>v2: (Tvrtko)
>>>>- Include details in commit message
>>>>- Move intel engine busyness function into execlist code
>>>>- Use union inside engine->stats
>>>>- Use natural type for ping delay jiffies
>>>>- Drop active_work condition checks
>>>>- Use for_each_engine if iterating all engines
>>>>- Drop seq locking, use spinlock at guc level to update engine stats
>>>>- Document worker specific details
>>>>
>>>>v3: (Tvrtko/Umesh)
>>>>- Demarcate guc and execlist stat objects with comments
>>>>- Document known over-accounting issue in commit
>>>>- Provide a consistent view of guc state
>>>>- Add hooks to gt park/unpark for guc busyness
>>>>- Stop/start worker in gt park/unpark path
>>>>- Drop inline
>>>>- Move spinlock and worker inits to guc initialization
>>>>- Drop helpers that are called only once
>>>>
>>>>v4: (Tvrtko/Matt/Umesh)
>>>>- Drop addressed opens from commit message
>>>>- Get runtime pm in ping, remove from the park path
>>>>- Use cancel_delayed_work_sync in disable_submission path
>>>>- Update stats during reset prepare
>>>>- Skip ping if reset in progress
>>>>- Explicitly name execlists and guc stats objects
>>>>- Since disable_submission is called from many places, move resetting
>>>>  stats to intel_guc_submission_reset_prepare
>>>>
>>>>v5: (Tvrtko)
>>>>- Add a trylock helper that does not sleep and synchronize PMU event
>>>>  callbacks and worker with gt reset
>>>>
>>>>v6: (CI BAT failures)
>>>>- DUTs using execlist submission failed to boot since __gt_unpark is
>>>>  called during i915 load. This ends up calling the guc busyness unpark
>>>>  hook and results in kiskstarting an uninitialized worker. Let
>>>>  park/unpark hooks check if guc submission has been initialized.
>>>>- drop cant_sleep() from trylock hepler since rcu_read_lock takes care
>>>>  of that.
>>>>
>>>>v7: (CI) Fix igt@i915_selftest@live@gt_engines
>>>>- For guc mode of submission the engine busyness is derived from gt time
>>>>  domain. Use gt time elapsed as reference in the selftest.
>>>>- Increase busyness calculation to 10ms duration to ensure batch runs
>>>>  longer and falls within the busyness tolerances in selftest.
>>>
>>>[snip]
>>>
>>>>diff --git a/drivers/gpu/drm/i915/gt/selftest_engine_pm.c 
>>>>b/drivers/gpu/drm/i915/gt/selftest_engine_pm.c
>>>>index 75569666105d..24358bef6691 100644
>>>>--- a/drivers/gpu/drm/i915/gt/selftest_engine_pm.c
>>>>+++ b/drivers/gpu/drm/i915/gt/selftest_engine_pm.c
>>>>@@ -234,6 +234,7 @@ static int live_engine_busy_stats(void *arg)
>>>>         struct i915_request *rq;
>>>>         ktime_t de, dt;
>>>>         ktime_t t[2];
>>>>+        u32 gt_stamp;
>>>>         if (!intel_engine_supports_stats(engine))
>>>>             continue;
>>>>@@ -251,10 +252,16 @@ static int live_engine_busy_stats(void *arg)
>>>>         ENGINE_TRACE(engine, "measuring idle time\n");
>>>>         preempt_disable();
>>>>         de = intel_engine_get_busy_time(engine, &t[0]);
>>>>-        udelay(100);
>>>>+        gt_stamp = intel_uncore_read(gt->uncore, GUCPMTIMESTAMP);
>>>>+        udelay(10000);
>>>>         de = ktime_sub(intel_engine_get_busy_time(engine, &t[1]), de);
>>>>+        gt_stamp = intel_uncore_read(gt->uncore, 
>>>>GUCPMTIMESTAMP) - gt_stamp;
>>>>         preempt_enable();
>>>>-        dt = ktime_sub(t[1], t[0]);
>>>>+
>>>>+        dt = intel_engine_uses_guc(engine) ?
>>>>+             intel_gt_clock_interval_to_ns(engine->gt, gt_stamp) :
>>>>+             ktime_sub(t[1], t[0]);
>>>
>>>But this then shows the thing might not work for external callers 
>>>like PMU who have no idea about GUCPMTIMESTAMP and cannot obtain 
>>>it anyway.
>>>
>>>What is the root cause of the failure here, 100us or clock source? 
>>>Is the granularity of GUCPMTIMESTAMP perhaps simply too coarse for 
>>>100us test period? I forget what frequency it runs at.
>>
>>guc timestamp is ticking at 19.2 MHz in adlp/rkl (where I ran this).
>
>So ~52ns clock granularity, right?
>
>In which case 100us with +/- 52ns error should be max 0.05% error - is 
>this math correct?

Correct, but correlating GPU and CPU time in this manner is not 
accurate. In some cases the MMIO read of the GUC timestamp can take 
longer and since intel_engine_get_busy_time captures ktime into t[0] and 
t[1] BEFORE the stats are calculated, there is room for error. Even if 
t[0]/t[1] are captured AFTER the stats are calculated, it's the same 
issue. Ideally the test should do

before = ktime_get()
busyness1 = intel_engine_get_busy_time()
udelay(100)
busyness2 = intel_engine_get_busy_time()
after = ktime_get()

busy% = (busyness2 - busyness1)/(after - before) * 100

Isn't that how the user would do it?

Note: Second parameter to intel_engine_get_busy_time is not uabi, it's 
internal to i915 and mostly used by selftest or rps_timer (in non SLPC 
mode).

>
>>
>>1)
>>With 100us, often times I see that the batch has not yet started, so 
>>I get busy time in the range 0 - 60 %. I increased the time such 
>>that the batch runs long enough to make the scheduling time < 5%.
>
>0-60% should not be possible since there is a igt_wait_for_spinner 
>call before measuring starts, which ensures spinner is executing on 
>the GPU.
>
>I think we first need to understand where is this 0 - 60% problem 
>coming from because I don't think it is from batch not yet started.

Looks like it's possible that the GuC would update the busyness stats 
after the batch starts (when context goes from idle to active), so 
that's where this discrepancy is creeping in from. I am thinking of 
capturing busyness before igt_wait_for_spinner and then poll for 
busyness after the wait until the busyness starts ticking. Then we can  
continue with the remaining part of the test. Thoughts?

I tried running the above and ran into busyness > 100%. That's likely 
from the ktime_get issue mentioned above.

Thanks,
Umesh

>
>Regards,
>
>Tvrtko
>
>>
>>2)
>>I did a 100 runs on rkl/adlp. No failures on rkl. On adlp, I saw one 
>>in 25 runs show 93%/94% busyness for rcs0 and fail (expected is 
>>95%). For that I tried using the guc timestamp thinking it would 
>>provide more accuracy. It did in my testing, but CI still failed for 
>>rkl-guc (110% busyness!!), so now I just think we need to tweak the 
>>expected busyness for guc.
>>
>>Is 1) acceptable?
>>
>>For 2) I am thinking of just changing the expected busyness to 90% 
>>plus for guc mode OR should we just let it fail occassionally? 
>>Thoughts?
>>
>>Thanks,
>>Umesh
>>
>>>
>>>Regards,
>>>
>>>Tvrtko
