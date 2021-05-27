Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6EA1392A2E
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 11:03:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BAB36E145;
	Thu, 27 May 2021 09:03:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A0376E145;
 Thu, 27 May 2021 09:03:00 +0000 (UTC)
IronPort-SDR: cFJ9Nkem95gpfa+WDuUrzNUiYzILp7/2QuArI0x9Ae2McHMhQuWDn+kjexxlvozWpDx/FQ+KHk
 uUhE2fTF8bmg==
X-IronPort-AV: E=McAfee;i="6200,9189,9996"; a="202722793"
X-IronPort-AV: E=Sophos;i="5.82,334,1613462400"; d="scan'208";a="202722793"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2021 02:02:59 -0700
IronPort-SDR: 2tjSniVxLpo3Hrjm06tmKFI4gIlrnjah6MefloZNkEoY8dzeiBJ4XBfcp4OF2uF5IrR6AZNVDh
 QFC408l5hT4g==
X-IronPort-AV: E=Sophos;i="5.82,334,1613462400"; d="scan'208";a="547613939"
Received: from amoses-mobl1.ger.corp.intel.com (HELO [10.213.211.53])
 ([10.213.211.53])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2021 02:02:57 -0700
Subject: Re: [Intel-gfx] [RFC PATCH 55/97] drm/i915/guc: Update
 intel_gt_wait_for_idle to work with GuC
To: Matthew Brost <matthew.brost@intel.com>
References: <20210506191451.77768-1-matthew.brost@intel.com>
 <20210506191451.77768-56-matthew.brost@intel.com>
 <921b59dc-da74-0499-05e2-edf07be0acfd@linux.intel.com>
 <20210525170718.GB14724@sdutt-i7>
 <5f84fcc9-5c8c-d44b-3739-5b970aef7eb4@linux.intel.com>
 <20210526181844.GB4268@sdutt-i7>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <c757430f-9e00-0533-7d76-fe88d4a784d4@linux.intel.com>
Date: Thu, 27 May 2021 10:02:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210526181844.GB4268@sdutt-i7>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: jason.ekstrand@intel.com, daniel.vetter@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 26/05/2021 19:18, Matthew Brost wrote:
> On Wed, May 26, 2021 at 10:21:05AM +0100, Tvrtko Ursulin wrote:
>>
>> On 25/05/2021 18:07, Matthew Brost wrote:
>>> On Tue, May 25, 2021 at 11:06:00AM +0100, Tvrtko Ursulin wrote:
>>>>
>>>> On 06/05/2021 20:14, Matthew Brost wrote:
>>>>> When running the GuC the GPU can't be considered idle if the GuC still
>>>>> has contexts pinned. As such, a call has been added in
>>>>> intel_gt_wait_for_idle to idle the UC and in turn the GuC by waiting for
>>>>> the number of unpinned contexts to go to zero.
>>>>>
>>>>> Cc: John Harrison <john.c.harrison@intel.com>
>>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>>> ---
>>>>>     drivers/gpu/drm/i915/gem/i915_gem_mman.c      |  3 +-
>>>>>     drivers/gpu/drm/i915/gt/intel_gt.c            | 18 ++++
>>>>>     drivers/gpu/drm/i915/gt/intel_gt.h            |  2 +
>>>>>     drivers/gpu/drm/i915/gt/intel_gt_requests.c   | 22 ++---
>>>>>     drivers/gpu/drm/i915/gt/intel_gt_requests.h   |  7 +-
>>>>>     drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  4 +
>>>>>     drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     |  1 +
>>>>>     drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h     |  4 +
>>>>>     .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 91 ++++++++++++++++++-
>>>>>     drivers/gpu/drm/i915/gt/uc/intel_uc.h         |  5 +
>>>>>     drivers/gpu/drm/i915/i915_debugfs.c           |  1 +
>>>>>     drivers/gpu/drm/i915/i915_gem_evict.c         |  1 +
>>>>>     .../gpu/drm/i915/selftests/igt_live_test.c    |  2 +-
>>>>>     .../gpu/drm/i915/selftests/mock_gem_device.c  |  3 +-
>>>>>     14 files changed, 137 insertions(+), 27 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>>>>> index 8598a1c78a4c..2f5295c9408d 100644
>>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>>>>> @@ -634,7 +634,8 @@ mmap_offset_attach(struct drm_i915_gem_object *obj,
>>>>>     		goto insert;
>>>>>     	/* Attempt to reap some mmap space from dead objects */
>>>>> -	err = intel_gt_retire_requests_timeout(&i915->gt, MAX_SCHEDULE_TIMEOUT);
>>>>> +	err = intel_gt_retire_requests_timeout(&i915->gt, MAX_SCHEDULE_TIMEOUT,
>>>>> +					       NULL);
>>>>>     	if (err)
>>>>>     		goto err;
>>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
>>>>> index 8d77dcbad059..1742a8561f69 100644
>>>>> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
>>>>> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
>>>>> @@ -574,6 +574,24 @@ static void __intel_gt_disable(struct intel_gt *gt)
>>>>>     	GEM_BUG_ON(intel_gt_pm_is_awake(gt));
>>>>>     }
>>>>> +int intel_gt_wait_for_idle(struct intel_gt *gt, long timeout)
>>>>> +{
>>>>> +	long rtimeout;
>>>>> +
>>>>> +	/* If the device is asleep, we have no requests outstanding */
>>>>> +	if (!intel_gt_pm_is_awake(gt))
>>>>> +		return 0;
>>>>> +
>>>>> +	while ((timeout = intel_gt_retire_requests_timeout(gt, timeout,
>>>>> +							   &rtimeout)) > 0) {
>>>>> +		cond_resched();
>>>>> +		if (signal_pending(current))
>>>>> +			return -EINTR;
>>>>> +	}
>>>>> +
>>>>> +	return timeout ? timeout : intel_uc_wait_for_idle(&gt->uc, rtimeout);
>>>>> +}
>>>>> +
>>>>>     int intel_gt_init(struct intel_gt *gt)
>>>>>     {
>>>>>     	int err;
>>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.h b/drivers/gpu/drm/i915/gt/intel_gt.h
>>>>> index 7ec395cace69..c775043334bf 100644
>>>>> --- a/drivers/gpu/drm/i915/gt/intel_gt.h
>>>>> +++ b/drivers/gpu/drm/i915/gt/intel_gt.h
>>>>> @@ -48,6 +48,8 @@ void intel_gt_driver_release(struct intel_gt *gt);
>>>>>     void intel_gt_driver_late_release(struct intel_gt *gt);
>>>>> +int intel_gt_wait_for_idle(struct intel_gt *gt, long timeout);
>>>>> +
>>>>>     void intel_gt_check_and_clear_faults(struct intel_gt *gt);
>>>>>     void intel_gt_clear_error_registers(struct intel_gt *gt,
>>>>>     				    intel_engine_mask_t engine_mask);
>>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_requests.c b/drivers/gpu/drm/i915/gt/intel_gt_requests.c
>>>>> index 647eca9d867a..c6c702f236fa 100644
>>>>> --- a/drivers/gpu/drm/i915/gt/intel_gt_requests.c
>>>>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_requests.c
>>>>> @@ -13,6 +13,7 @@
>>>>>     #include "intel_gt_pm.h"
>>>>>     #include "intel_gt_requests.h"
>>>>>     #include "intel_timeline.h"
>>>>> +#include "uc/intel_uc.h"
>>>>>     static bool retire_requests(struct intel_timeline *tl)
>>>>>     {
>>>>> @@ -130,7 +131,8 @@ void intel_engine_fini_retire(struct intel_engine_cs *engine)
>>>>>     	GEM_BUG_ON(engine->retire);
>>>>>     }
>>>>> -long intel_gt_retire_requests_timeout(struct intel_gt *gt, long timeout)
>>>>> +long intel_gt_retire_requests_timeout(struct intel_gt *gt, long timeout,
>>>>> +				      long *rtimeout)
>>>>
>>>> What is 'rtimeout', I know remaining, but it can be more self-descriptive to
>>>> start with.
>>>>
>>>
>>> 'remaining_timeout' it is.
>>>
>>>> It feels a bit churny for what it is. How plausible would be alternatives to
>>>> either change existing timeout to in/out, or measure sleep internally in
>>>> this function, or just risk sleeping twice as long by passing the original
>>>> timeout to uc idle as well?
>>>>
>>>
>>> Originally had it just passing in the same value, got review feedback
>>> saying I should pass in the adjusted value. Hard to make everyone happy.
>>
>> Ok.
>>
>>>>>     {
>>>>>     	struct intel_gt_timelines *timelines = &gt->timelines;
>>>>>     	struct intel_timeline *tl, *tn;
>>>>> @@ -195,22 +197,10 @@ out_active:	spin_lock(&timelines->lock);
>>>>>     	if (flush_submission(gt, timeout)) /* Wait, there's more! */
>>>>>     		active_count++;
>>>>> -	return active_count ? timeout : 0;
>>>>> -}
>>>>> -
>>>>> -int intel_gt_wait_for_idle(struct intel_gt *gt, long timeout)
>>>>> -{
>>>>> -	/* If the device is asleep, we have no requests outstanding */
>>>>> -	if (!intel_gt_pm_is_awake(gt))
>>>>> -		return 0;
>>>>> -
>>>>> -	while ((timeout = intel_gt_retire_requests_timeout(gt, timeout)) > 0) {
>>>>> -		cond_resched();
>>>>> -		if (signal_pending(current))
>>>>> -			return -EINTR;
>>>>> -	}
>>>>> +	if (rtimeout)
>>>>> +		*rtimeout = timeout;
>>>>> -	return timeout;
>>>>> +	return active_count ? timeout : 0;
>>>>>     }
>>>>>     static void retire_work_handler(struct work_struct *work)
>>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_requests.h b/drivers/gpu/drm/i915/gt/intel_gt_requests.h
>>>>> index fcc30a6e4fe9..4419787124e2 100644
>>>>> --- a/drivers/gpu/drm/i915/gt/intel_gt_requests.h
>>>>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_requests.h
>>>>> @@ -10,10 +10,11 @@ struct intel_engine_cs;
>>>>>     struct intel_gt;
>>>>>     struct intel_timeline;
>>>>> -long intel_gt_retire_requests_timeout(struct intel_gt *gt, long timeout);
>>>>> +long intel_gt_retire_requests_timeout(struct intel_gt *gt, long timeout,
>>>>> +				      long *rtimeout);
>>>>>     static inline void intel_gt_retire_requests(struct intel_gt *gt)
>>>>>     {
>>>>> -	intel_gt_retire_requests_timeout(gt, 0);
>>>>> +	intel_gt_retire_requests_timeout(gt, 0, NULL);
>>>>>     }
>>>>>     void intel_engine_init_retire(struct intel_engine_cs *engine);
>>>>> @@ -21,8 +22,6 @@ void intel_engine_add_retire(struct intel_engine_cs *engine,
>>>>>     			     struct intel_timeline *tl);
>>>>>     void intel_engine_fini_retire(struct intel_engine_cs *engine);
>>>>> -int intel_gt_wait_for_idle(struct intel_gt *gt, long timeout);
>>>>> -
>>>>>     void intel_gt_init_requests(struct intel_gt *gt);
>>>>>     void intel_gt_park_requests(struct intel_gt *gt);
>>>>>     void intel_gt_unpark_requests(struct intel_gt *gt);
>>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>>>>> index 485e98f3f304..47eaa69809e8 100644
>>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>>>>> @@ -38,6 +38,8 @@ struct intel_guc {
>>>>>     	spinlock_t irq_lock;
>>>>>     	unsigned int msg_enabled_mask;
>>>>> +	atomic_t outstanding_submission_g2h;
>>>>> +
>>>>>     	struct {
>>>>>     		bool enabled;
>>>>>     		void (*reset)(struct intel_guc *guc);
>>>>> @@ -239,6 +241,8 @@ static inline void intel_guc_disable_msg(struct intel_guc *guc, u32 mask)
>>>>>     	spin_unlock_irq(&guc->irq_lock);
>>>>>     }
>>>>> +int intel_guc_wait_for_idle(struct intel_guc *guc, long timeout);
>>>>> +
>>>>>     int intel_guc_reset_engine(struct intel_guc *guc,
>>>>>     			   struct intel_engine_cs *engine);
>>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
>>>>> index f1893030ca88..cf701056fa14 100644
>>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
>>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
>>>>> @@ -111,6 +111,7 @@ void intel_guc_ct_init_early(struct intel_guc_ct *ct)
>>>>>     	INIT_LIST_HEAD(&ct->requests.incoming);
>>>>>     	INIT_WORK(&ct->requests.worker, ct_incoming_request_worker_func);
>>>>>     	tasklet_init(&ct->receive_tasklet, ct_receive_tasklet_func, (unsigned long)ct);
>>>>> +	init_waitqueue_head(&ct->wq);
>>>>>     }
>>>>>     static inline const char *guc_ct_buffer_type_to_str(u32 type)
>>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
>>>>> index 660bf37238e2..ab1b79ab960b 100644
>>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
>>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
>>>>> @@ -10,6 +10,7 @@
>>>>>     #include <linux/spinlock.h>
>>>>>     #include <linux/workqueue.h>
>>>>>     #include <linux/ktime.h>
>>>>> +#include <linux/wait.h>
>>>>>     #include "intel_guc_fwif.h"
>>>>> @@ -68,6 +69,9 @@ struct intel_guc_ct {
>>>>>     	struct tasklet_struct receive_tasklet;
>>>>> +	/** @wq: wait queue for g2h chanenl */
>>>>> +	wait_queue_head_t wq;
>>>>> +
>>>>>     	struct {
>>>>>     		u16 last_fence; /* last fence used to send request */
>>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>>>> index ae0b386467e3..0ff7dd6d337d 100644
>>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>>>> @@ -253,6 +253,74 @@ static inline void set_lrc_desc_registered(struct intel_guc *guc, u32 id,
>>>>>     	xa_store_irq(&guc->context_lookup, id, ce, GFP_ATOMIC);
>>>>>     }
>>>>> +static int guc_submission_busy_loop(struct intel_guc* guc,
>>>>> +				    const u32 *action,
>>>>> +				    u32 len,
>>>>> +				    u32 g2h_len_dw,
>>>>> +				    bool loop)
>>>>> +{
>>>>> +	int err;
>>>>> +
>>>>> +	err = intel_guc_send_busy_loop(guc, action, len, g2h_len_dw, loop);
>>>>> +
>>>>> +	if (!err && g2h_len_dw)
>>>>> +		atomic_inc(&guc->outstanding_submission_g2h);
>>>>> +
>>>>> +	return err;
>>>>> +}
>>>>> +
>>>>> +static int guc_wait_for_pending_msg(struct intel_guc *guc,
>>>>> +				    atomic_t *wait_var,
>>>>> +				    bool interruptible,
>>>>> +				    long timeout)
>>>>> +{
>>>>> +	const int state = interruptible ?
>>>>> +		TASK_INTERRUPTIBLE : TASK_UNINTERRUPTIBLE;
>>>>> +	DEFINE_WAIT(wait);
>>>>> +
>>>>> +	might_sleep();
>>>>> +	GEM_BUG_ON(timeout < 0);
>>>>> +
>>>>> +	if (!atomic_read(wait_var))
>>>>> +		return 0;
>>>>> +
>>>>> +	if (!timeout)
>>>>> +		return -ETIME;
>>>>> +
>>>>> +	for (;;) {
>>>>> +		prepare_to_wait(&guc->ct.wq, &wait, state);
>>>>> +
>>>>> +		if (!atomic_read(wait_var))
>>>>> +			break;
>>>>> +
>>>>> +		if (signal_pending_state(state, current)) {
>>>>> +			timeout = -ERESTARTSYS;
>>>>> +			break;
>>>>> +		}
>>>>> +
>>>>> +		if (!timeout) {
>>>>> +			timeout = -ETIME;
>>>>> +			break;
>>>>> +		}
>>>>> +
>>>>> +		timeout = io_schedule_timeout(timeout);
>>>>> +	}
>>>>> +	finish_wait(&guc->ct.wq, &wait);
>>>>> +
>>>>> +	return (timeout < 0) ? timeout : 0;
>>>>> +}
>>>>
>>>> See if it is possible to simplify all this with wait_var_event and
>>>> wake_up_var.
>>>>
>>>
>>> Let me check on that.
>>>>> +
>>>>> +int intel_guc_wait_for_idle(struct intel_guc *guc, long timeout)
>>>>> +{
>>>>> +	bool interruptible = true;
>>>>> +
>>>>> +	if (unlikely(timeout < 0))
>>>>> +		timeout = -timeout, interruptible = false;
>>>>> +
>>>>> +	return guc_wait_for_pending_msg(guc, &guc->outstanding_submission_g2h,
>>>>> +					interruptible, timeout);
>>>>> +}
>>>>> +
>>>>>     static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
>>>>>     {
>>>>>     	int err;
>>>>> @@ -279,6 +347,7 @@ static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
>>>>>     	err = intel_guc_send_nb(guc, action, len, g2h_len_dw);
>>>>>     	if (!enabled && !err) {
>>>>> +		atomic_inc(&guc->outstanding_submission_g2h);
>>>>>     		set_context_enabled(ce);
>>>>>     	} else if (!enabled) {
>>>>>     		clr_context_pending_enable(ce);
>>>>> @@ -734,7 +803,7 @@ static int __guc_action_register_context(struct intel_guc *guc,
>>>>>     		offset,
>>>>>     	};
>>>>> -	return intel_guc_send_busy_loop(guc, action, ARRAY_SIZE(action), 0, true);
>>>>> +	return guc_submission_busy_loop(guc, action, ARRAY_SIZE(action), 0, true);
>>>>>     }
>>>>>     static int register_context(struct intel_context *ce)
>>>>> @@ -754,7 +823,7 @@ static int __guc_action_deregister_context(struct intel_guc *guc,
>>>>>     		guc_id,
>>>>>     	};
>>>>> -	return intel_guc_send_busy_loop(guc, action, ARRAY_SIZE(action),
>>>>> +	return guc_submission_busy_loop(guc, action, ARRAY_SIZE(action),
>>>>>     					G2H_LEN_DW_DEREGISTER_CONTEXT, true);
>>>>>     }
>>>>> @@ -871,7 +940,9 @@ static int guc_context_pin(struct intel_context *ce, void *vaddr)
>>>>>     static void guc_context_unpin(struct intel_context *ce)
>>>>>     {
>>>>> -	unpin_guc_id(ce_to_guc(ce), ce);
>>>>> +	struct intel_guc *guc = ce_to_guc(ce);
>>>>> +
>>>>> +	unpin_guc_id(guc, ce);
>>>>>     	lrc_unpin(ce);
>>>>>     }
>>>>> @@ -894,7 +965,7 @@ static void __guc_context_sched_disable(struct intel_guc *guc,
>>>>>     	intel_context_get(ce);
>>>>> -	intel_guc_send_busy_loop(guc, action, ARRAY_SIZE(action),
>>>>> +	guc_submission_busy_loop(guc, action, ARRAY_SIZE(action),
>>>>>     				 G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, true);
>>>>>     }
>>>>> @@ -1437,6 +1508,15 @@ g2h_context_lookup(struct intel_guc *guc, u32 desc_idx)
>>>>>     	return ce;
>>>>>     }
>>>>> +static void decr_outstanding_submission_g2h(struct intel_guc *guc)
>>>>> +{
>>>>> +	if (atomic_dec_and_test(&guc->outstanding_submission_g2h)) {
>>>>> +		smp_mb();
>>>>> +		if (waitqueue_active(&guc->ct.wq))
>>>>> +			wake_up_all(&guc->ct.wq);
>>>>
>>>> I keep pointing out this pattern is racy and at least needs comment why it
>>>> is safe.
>>>>
>>>
>>> There is a comment in wake queue code header saying why this is safe. I
>>> don't think we need to repeat this here.
>>
>> Yeah, _describing how to make it safe_, after it starts with:
>>
>>   * NOTE: this function is lockless and requires care, incorrect usage _will_
>>   * lead to sporadic and non-obvious failure.
>>
>> Then it also says:
>>
>>   * Also note that this 'optimization' trades a spin_lock() for an smp_mb(),
>>   * which (when the lock is uncontended) are of roughly equal cost.
>>
>> I question the need to optimize this path since it means reader has to figure out if it is safe while a simple wake_up_all after atomic_dec_and_test would have done it.
>>
>> Is the case of no waiters a predominant one? It at least deserves a comment explaining why the optimisation is important.
>>
> 
> I just didn't want to add a spin_lock if there is known working code
> path without one and our code fits into that path. I can add a comment
> but I don't really think it necessary.

Lock already exists in the wake_up_all, it is not about adding your own.

As premature optimisations are usually best avoided it is simply about 
how do you justify a):

+static void decr_outstanding_submission_g2h(struct intel_guc *guc)
+{
+	if (atomic_dec_and_test(&guc->outstanding_submission_g2h)) {
+		smp_mb();
+		if (waitqueue_active(&guc->ct.wq))
+			wake_up_all(&guc->ct.wq);

When the easy alternative (easy to read, easy to review, easy to 
maintain) is b):

+static void decr_outstanding_submission_g2h(struct intel_guc *guc)
+{
+	if (atomic_dec_and_test(&guc->outstanding_submission_g2h))
+		wake_up_all(&guc->ct.wq);

For me as external reader the question seems to be, I will say it again, 
is the case of no waiters a common one and is this a hot path to justify 
avoiding a function call by adding the mental complexity explained in 
the waitqueue_active comment? Here and in the other places in the GuC 
backend waitqueue_active is used.

Regards,

Tvrtko
