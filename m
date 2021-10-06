Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE2C424671
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 21:06:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B8696EE15;
	Wed,  6 Oct 2021 19:06:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4F836EE14;
 Wed,  6 Oct 2021 19:06:07 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10129"; a="312290187"
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; d="scan'208";a="312290187"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 12:06:06 -0700
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; d="scan'208";a="488625273"
Received: from ccronin-mobl.ger.corp.intel.com (HELO [10.213.247.242])
 ([10.213.247.242])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 12:06:04 -0700
Subject: Re: [RFC 6/8] drm/i915: Make some recently added vfuncs use full
 scheduling attribute
To: Matthew Brost <matthew.brost@intel.com>
Cc: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
References: <20211004143650.699120-1-tvrtko.ursulin@linux.intel.com>
 <20211004143650.699120-7-tvrtko.ursulin@linux.intel.com>
 <20211006171228.GA7906@jons-linux-dev-box>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <e5eb54fb-84c3-c95f-ad95-18bddd53fe62@linux.intel.com>
Date: Wed, 6 Oct 2021 20:06:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211006171228.GA7906@jons-linux-dev-box>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 06/10/2021 18:12, Matthew Brost wrote:
> On Mon, Oct 04, 2021 at 03:36:48PM +0100, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> Code added in 71ed60112d5d ("drm/i915: Add kick_backend function to
>> i915_sched_engine") and ee242ca704d3 ("drm/i915/guc: Implement GuC
>> priority management") introduced some scheduling related vfuncs which
>> take integer request priority as argument.
>>
>> Make them instead take struct i915_sched_attr, which is the type
>> encapsulating this information, so it probably aligns with the design
>> better. It definitely enables extending the set of scheduling attributes.
>>
> 
> Understand the motivation here but the i915_scheduler is going to
> disapear when we move to the DRM scheduler or at least its functionality
> of priority inheritance will be pushed into the DRM scheduler. I'd be
> very careful making any changes here as the priority in the DRM
> scheduler is defined as single enum:
> 
> /* These are often used as an (initial) index
>   * to an array, and as such should start at 0.
>   */
> enum drm_sched_priority {
>          DRM_SCHED_PRIORITY_MIN,
>          DRM_SCHED_PRIORITY_NORMAL,
>          DRM_SCHED_PRIORITY_HIGH,
>          DRM_SCHED_PRIORITY_KERNEL,
> 
>          DRM_SCHED_PRIORITY_COUNT,
>          DRM_SCHED_PRIORITY_UNSET = -2
> };
> 
> Adding a field to the i915_sched_attr is fairly easy as we already have
> a structure but changing the DRM scheduler might be a tougher sell.
> Anyway you can make this work without adding the 'nice' field to
> i915_sched_attr? Might be worth exploring so when we move to the DRM
> scheduler this feature drops in a little cleaner.

/me rubs a crystal ball.. no idea how that would look. :)

Idea with separate nice in sched attr is that only default priority 
contexts are affected by nice. Thinking being, if i915 aware userspace 
has explicitly requested a different priority, then let it keep that. In 
other words, only if it did not bother and left it at default/normal, 
then we inherit from process nice.

I suppose to keep this idea in some future drm scheduler world it would 
require some work. But in general the concept is of course open to 
discussion.

Implementation wise, not having prio and nice separate opens some other 
problems in how this interacts with GEM context priority, but there are 
probably solutions to those problems as well.

I suppose I could define a "nice range" in the existing priorities and 
nice adjustments would only apply if within that range. That would allow 
max and min user priority to still be undisturbed as requested via the 
i915 uapi.

(min) -1023 ----- (nice 20) ----- 0 ------ (nice -19) ------ +1023 (max)

And I say if some userspace set a priority in the -20 to 19 range then 
it is allowed to adjust it via process nice. That would keep it a single 
int priority as today.

Regards,

Tvrtko

> 
> Matt
> 
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_execlists_submission.c | 4 +++-
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c    | 3 ++-
>>   drivers/gpu/drm/i915/i915_scheduler.c                | 4 ++--
>>   drivers/gpu/drm/i915/i915_scheduler_types.h          | 4 ++--
>>   4 files changed, 9 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
>> index 7147fe80919e..e91d803a6453 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
>> @@ -3216,11 +3216,13 @@ static bool can_preempt(struct intel_engine_cs *engine)
>>   	return engine->class != RENDER_CLASS;
>>   }
>>   
>> -static void kick_execlists(const struct i915_request *rq, int prio)
>> +static void kick_execlists(const struct i915_request *rq,
>> +			   const struct i915_sched_attr *attr)
>>   {
>>   	struct intel_engine_cs *engine = rq->engine;
>>   	struct i915_sched_engine *sched_engine = engine->sched_engine;
>>   	const struct i915_request *inflight;
>> +	const int prio = attr->priority;
>>   
>>   	/*
>>   	 * We only need to kick the tasklet once for the high priority
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> index ba0de35f6323..b5883a4365ca 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> @@ -2414,9 +2414,10 @@ static void guc_init_breadcrumbs(struct intel_engine_cs *engine)
>>   }
>>   
>>   static void guc_bump_inflight_request_prio(struct i915_request *rq,
>> -					   int prio)
>> +					   const struct i915_sched_attr *attr)
>>   {
>>   	struct intel_context *ce = rq->context;
>> +	const int prio = attr->priority;
>>   	u8 new_guc_prio = map_i915_prio_to_guc_prio(prio);
>>   
>>   	/* Short circuit function */
>> diff --git a/drivers/gpu/drm/i915/i915_scheduler.c b/drivers/gpu/drm/i915/i915_scheduler.c
>> index 762127dd56c5..534bab99fcdc 100644
>> --- a/drivers/gpu/drm/i915/i915_scheduler.c
>> +++ b/drivers/gpu/drm/i915/i915_scheduler.c
>> @@ -255,7 +255,7 @@ static void __i915_schedule(struct i915_sched_node *node,
>>   
>>   		/* Must be called before changing the nodes priority */
>>   		if (sched_engine->bump_inflight_request_prio)
>> -			sched_engine->bump_inflight_request_prio(from, prio);
>> +			sched_engine->bump_inflight_request_prio(from, attr);
>>   
>>   		WRITE_ONCE(node->attr.priority, prio);
>>   
>> @@ -280,7 +280,7 @@ static void __i915_schedule(struct i915_sched_node *node,
>>   
>>   		/* Defer (tasklet) submission until after all of our updates. */
>>   		if (sched_engine->kick_backend)
>> -			sched_engine->kick_backend(node_to_request(node), prio);
>> +			sched_engine->kick_backend(node_to_request(node), attr);
>>   	}
>>   
>>   	spin_unlock(&sched_engine->lock);
>> diff --git a/drivers/gpu/drm/i915/i915_scheduler_types.h b/drivers/gpu/drm/i915/i915_scheduler_types.h
>> index b0a1b58c7893..24b9ac1c2ce2 100644
>> --- a/drivers/gpu/drm/i915/i915_scheduler_types.h
>> +++ b/drivers/gpu/drm/i915/i915_scheduler_types.h
>> @@ -177,13 +177,13 @@ struct i915_sched_engine {
>>   	 * @kick_backend: kick backend after a request's priority has changed
>>   	 */
>>   	void	(*kick_backend)(const struct i915_request *rq,
>> -				int prio);
>> +				const struct i915_sched_attr *attr);
>>   
>>   	/**
>>   	 * @bump_inflight_request_prio: update priority of an inflight request
>>   	 */
>>   	void	(*bump_inflight_request_prio)(struct i915_request *rq,
>> -					      int prio);
>> +					      const struct i915_sched_attr *attr);
>>   
>>   	/**
>>   	 * @retire_inflight_request_prio: indicate request is retired to
>> -- 
>> 2.30.2
>>
