Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A620C45B6FD
	for <lists+dri-devel@lfdr.de>; Wed, 24 Nov 2021 09:57:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2996F6ECE3;
	Wed, 24 Nov 2021 08:56:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D3056ECE3;
 Wed, 24 Nov 2021 08:56:55 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10177"; a="321472178"
X-IronPort-AV: E=Sophos;i="5.87,260,1631602800"; d="scan'208";a="321472178"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2021 00:56:55 -0800
X-IronPort-AV: E=Sophos;i="5.87,260,1631602800"; d="scan'208";a="591506945"
Received: from sjbright-mobl1.ger.corp.intel.com (HELO [10.213.251.109])
 ([10.213.251.109])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2021 00:56:54 -0800
Message-ID: <b1cc5b51-d8cb-6500-021a-2505fa1e0350@linux.intel.com>
Date: Wed, 24 Nov 2021 08:56:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [Intel-gfx] [PATCH 1/3] drm/i915/gt: Spread virtual engines over
 idle engines
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20211117224955.28999-1-vinay.belgaumkar@intel.com>
 <20211117224955.28999-2-vinay.belgaumkar@intel.com>
 <6e19db61-dee6-f012-9dd4-b8ef455509e7@linux.intel.com>
 <YZ1GcMR6C6YN9szK@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <YZ1GcMR6C6YN9szK@intel.com>
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
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 23/11/2021 19:52, Rodrigo Vivi wrote:
> On Tue, Nov 23, 2021 at 09:39:25AM +0000, Tvrtko Ursulin wrote:
>>
>> On 17/11/2021 22:49, Vinay Belgaumkar wrote:
>>> From: Chris Wilson <chris@chris-wilson.co.uk>
>>>
>>> Everytime we come to the end of a virtual engine's context, re-randomise
>>> it's siblings[]. As we schedule the siblings' tasklets in the order they
>>> are in the array, earlier entries are executed first (when idle) and so
>>> will be preferred when scheduling the next virtual request. Currently,
>>> we only update the array when switching onto a new idle engine, so we
>>> prefer to stick on the last execute engine, keeping the work compact.
>>> However, it can be beneficial to spread the work out across idle
>>> engines, so choose another sibling as our preferred target at the end of
>>> the context's execution.
>>
>> This partially brings back, from a different angle, the more dynamic
>> scheduling behavior which has been lost since bugfix 90a987205c6c
>> ("drm/i915/gt: Only swap to a random sibling once upon creation").
> 
> Shouldn't we use the Fixes tag here since this is targeting to fix one
> of the performance regressions of this patch?

Probably not but hard to say. Note that it wasn't a performance 
regression that was reported but power.

And to go back to what we said elsewhere in the thread, I am actually 
with you in thinking that in the ideal world we need PnP testing across 
a variety of workloads and platforms. And "in the ideal world" should 
really be in the normal world. It is not professional to be reactive to 
isolated bug reports from users, without being able to see the overall 
picture.

>> One day we could experiment with using engine busyness as criteria (instead
>> of random). Back in the day busyness was kind of the best strategy, although
>> sampled at submit, not at the trailing edge like here, but it still may be
>> able to settle down to engine configuration better in some scenarios. Only
>> testing could say.
>>
>> Still, from memory random also wasn't that bad so this should be okay for
>> now.
>>
>> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Since you reviewed and it looks to be a middle ground point in terms
> of when to balancing (always like in the initial implementation vs
> only once like the in 90a987205c6c).
> 
> If this one is really fixing the regression by itself:
> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> on this patch here.
> 
> But I still don't want to take the risk with touching the freq with
> race to idle, until not convinced that it is absolutely needed and
> that we are not breaking the world out there.

Yes agreed in principle, we have users with different priorities.

However the RPS patches in the series, definitely the 1st one which 
looks at classes versus individual engines, sound plausible to me. Given 
the absence of automated PnP testing mentioned above, in the past it was 
usually Chris who was making the above and beyond effort to evaluate 
changes like these on as many platforms as he could, and with different 
workloads. Not sure who has the mandate and drive to fill that space but 
something will need to happen.

Regards,

Tvrtko

>>
>> Regards,
>>
>> Tvrtko
>>
>>> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
>>> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>>> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>>> ---
>>>    .../drm/i915/gt/intel_execlists_submission.c  | 80 ++++++++++++-------
>>>    1 file changed, 52 insertions(+), 28 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
>>> index ca03880fa7e4..b95bbc8fb91a 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
>>> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
>>> @@ -539,6 +539,41 @@ static void execlists_schedule_in(struct i915_request *rq, int idx)
>>>    	GEM_BUG_ON(intel_context_inflight(ce) != rq->engine);
>>>    }
>>> +static void virtual_xfer_context(struct virtual_engine *ve,
>>> +				 struct intel_engine_cs *engine)
>>> +{
>>> +	unsigned int n;
>>> +
>>> +	if (likely(engine == ve->siblings[0]))
>>> +		return;
>>> +
>>> +	if (!intel_engine_has_relative_mmio(engine))
>>> +		lrc_update_offsets(&ve->context, engine);
>>> +
>>> +	/*
>>> +	 * Move the bound engine to the top of the list for
>>> +	 * future execution. We then kick this tasklet first
>>> +	 * before checking others, so that we preferentially
>>> +	 * reuse this set of bound registers.
>>> +	 */
>>> +	for (n = 1; n < ve->num_siblings; n++) {
>>> +		if (ve->siblings[n] == engine) {
>>> +			swap(ve->siblings[n], ve->siblings[0]);
>>> +			break;
>>> +		}
>>> +	}
>>> +}
>>> +
>>> +static int ve_random_sibling(struct virtual_engine *ve)
>>> +{
>>> +	return prandom_u32_max(ve->num_siblings);
>>> +}
>>> +
>>> +static int ve_random_other_sibling(struct virtual_engine *ve)
>>> +{
>>> +	return 1 + prandom_u32_max(ve->num_siblings - 1);
>>> +}
>>> +
>>>    static void
>>>    resubmit_virtual_request(struct i915_request *rq, struct virtual_engine *ve)
>>>    {
>>> @@ -578,8 +613,23 @@ static void kick_siblings(struct i915_request *rq, struct intel_context *ce)
>>>    	    rq->execution_mask != engine->mask)
>>>    		resubmit_virtual_request(rq, ve);
>>> -	if (READ_ONCE(ve->request))
>>> +	/*
>>> +	 * Reschedule with a new "preferred" sibling.
>>> +	 *
>>> +	 * The tasklets are executed in the order of ve->siblings[], so
>>> +	 * siblings[0] receives preferrential treatment of greedily checking
>>> +	 * for execution of the virtual engine. At this point, the virtual
>>> +	 * engine is no longer in the current GPU cache due to idleness or
>>> +	 * contention, so it can be executed on any without penalty. We
>>> +	 * re-randomise at this point in order to spread light loads across
>>> +	 * the system, heavy overlapping loads will continue to be greedily
>>> +	 * executed by the first available engine.
>>> +	 */
>>> +	if (READ_ONCE(ve->request)) {
>>> +		virtual_xfer_context(ve,
>>> +				     ve->siblings[ve_random_other_sibling(ve)]);
>>>    		tasklet_hi_schedule(&ve->base.sched_engine->tasklet);
>>> +	}
>>>    }
>>>    static void __execlists_schedule_out(struct i915_request * const rq,
>>> @@ -1030,32 +1080,6 @@ first_virtual_engine(struct intel_engine_cs *engine)
>>>    	return NULL;
>>>    }
>>> -static void virtual_xfer_context(struct virtual_engine *ve,
>>> -				 struct intel_engine_cs *engine)
>>> -{
>>> -	unsigned int n;
>>> -
>>> -	if (likely(engine == ve->siblings[0]))
>>> -		return;
>>> -
>>> -	GEM_BUG_ON(READ_ONCE(ve->context.inflight));
>>> -	if (!intel_engine_has_relative_mmio(engine))
>>> -		lrc_update_offsets(&ve->context, engine);
>>> -
>>> -	/*
>>> -	 * Move the bound engine to the top of the list for
>>> -	 * future execution. We then kick this tasklet first
>>> -	 * before checking others, so that we preferentially
>>> -	 * reuse this set of bound registers.
>>> -	 */
>>> -	for (n = 1; n < ve->num_siblings; n++) {
>>> -		if (ve->siblings[n] == engine) {
>>> -			swap(ve->siblings[n], ve->siblings[0]);
>>> -			break;
>>> -		}
>>> -	}
>>> -}
>>> -
>>>    static void defer_request(struct i915_request *rq, struct list_head * const pl)
>>>    {
>>>    	LIST_HEAD(list);
>>> @@ -3590,7 +3614,7 @@ static void virtual_engine_initial_hint(struct virtual_engine *ve)
>>>    	 * NB This does not force us to execute on this engine, it will just
>>>    	 * typically be the first we inspect for submission.
>>>    	 */
>>> -	swp = prandom_u32_max(ve->num_siblings);
>>> +	swp = ve_random_sibling(ve);
>>>    	if (swp)
>>>    		swap(ve->siblings[swp], ve->siblings[0]);
>>>    }
>>>
