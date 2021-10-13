Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F339342C538
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 17:50:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CCFF6EA5C;
	Wed, 13 Oct 2021 15:50:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 643656EA59;
 Wed, 13 Oct 2021 15:50:06 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10136"; a="214612137"
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="214612137"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 08:50:05 -0700
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="480857203"
Received: from lvoronov-mobl.ger.corp.intel.com (HELO [10.213.252.151])
 ([10.213.252.151])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 08:50:04 -0700
Subject: Re: [Intel-gfx] [RFC 6/8] drm/i915: Make some recently added vfuncs
 use full scheduling attribute
To: Matthew Brost <matthew.brost@intel.com>, Intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
References: <20211004143650.699120-1-tvrtko.ursulin@linux.intel.com>
 <20211004143650.699120-7-tvrtko.ursulin@linux.intel.com>
 <20211006171228.GA7906@jons-linux-dev-box>
 <YWbKhu0IQ4hsr5w7@phenom.ffwll.local>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <2ada1474-68d4-85ab-9e57-cb5e7e9843c0@linux.intel.com>
Date: Wed, 13 Oct 2021 16:50:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YWbKhu0IQ4hsr5w7@phenom.ffwll.local>
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


On 13/10/2021 13:01, Daniel Vetter wrote:
> On Wed, Oct 06, 2021 at 10:12:29AM -0700, Matthew Brost wrote:
>> On Mon, Oct 04, 2021 at 03:36:48PM +0100, Tvrtko Ursulin wrote:
>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>
>>> Code added in 71ed60112d5d ("drm/i915: Add kick_backend function to
>>> i915_sched_engine") and ee242ca704d3 ("drm/i915/guc: Implement GuC
>>> priority management") introduced some scheduling related vfuncs which
>>> take integer request priority as argument.
>>>
>>> Make them instead take struct i915_sched_attr, which is the type
>>> encapsulating this information, so it probably aligns with the design
>>> better. It definitely enables extending the set of scheduling attributes.
>>>
>>
>> Understand the motivation here but the i915_scheduler is going to
>> disapear when we move to the DRM scheduler or at least its functionality
>> of priority inheritance will be pushed into the DRM scheduler. I'd be
>> very careful making any changes here as the priority in the DRM
>> scheduler is defined as single enum:
> 
> Yeah I'm not sure it makes sense to build this and make the conversion to
> drm/sched even harder. We've already merged a lot of code with a "we'll
> totally convert to drm/sched right after" promise, there's not really room
> for more fun like this built on top of i915-scheduler.

It is not really fun on top of i915-scheduler. It is fun on top of the 
concept of uapi gem context priority. As long as there is gem context 
priority, and requests inherit from it, the concept works. This is 
demonstrated by the fact it ties in with the GuC backend which reduces 
to three priorities already. It is limited granularity but it does 
something.

Implementation details aside, key question is the proposal to tie 
process nice with GPU scheduling priority. There seems to be interest 
from other parties so there probably is something here.

But I do plan to simplify this RFC to not add anything to 
i915_sched_attr and also drop the task sched attr change notifier.

Regards,

Tvrtko

> -Daniel
> 
>>
>> /* These are often used as an (initial) index
>>   * to an array, and as such should start at 0.
>>   */
>> enum drm_sched_priority {
>>          DRM_SCHED_PRIORITY_MIN,
>>          DRM_SCHED_PRIORITY_NORMAL,
>>          DRM_SCHED_PRIORITY_HIGH,
>>          DRM_SCHED_PRIORITY_KERNEL,
>>
>>          DRM_SCHED_PRIORITY_COUNT,
>>          DRM_SCHED_PRIORITY_UNSET = -2
>> };
>>
>> Adding a field to the i915_sched_attr is fairly easy as we already have
>> a structure but changing the DRM scheduler might be a tougher sell.
>> Anyway you can make this work without adding the 'nice' field to
>> i915_sched_attr? Might be worth exploring so when we move to the DRM
>> scheduler this feature drops in a little cleaner.
>>
>> Matt
>>
>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>> ---
>>>   drivers/gpu/drm/i915/gt/intel_execlists_submission.c | 4 +++-
>>>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c    | 3 ++-
>>>   drivers/gpu/drm/i915/i915_scheduler.c                | 4 ++--
>>>   drivers/gpu/drm/i915/i915_scheduler_types.h          | 4 ++--
>>>   4 files changed, 9 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
>>> index 7147fe80919e..e91d803a6453 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
>>> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
>>> @@ -3216,11 +3216,13 @@ static bool can_preempt(struct intel_engine_cs *engine)
>>>   	return engine->class != RENDER_CLASS;
>>>   }
>>>   
>>> -static void kick_execlists(const struct i915_request *rq, int prio)
>>> +static void kick_execlists(const struct i915_request *rq,
>>> +			   const struct i915_sched_attr *attr)
>>>   {
>>>   	struct intel_engine_cs *engine = rq->engine;
>>>   	struct i915_sched_engine *sched_engine = engine->sched_engine;
>>>   	const struct i915_request *inflight;
>>> +	const int prio = attr->priority;
>>>   
>>>   	/*
>>>   	 * We only need to kick the tasklet once for the high priority
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> index ba0de35f6323..b5883a4365ca 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> @@ -2414,9 +2414,10 @@ static void guc_init_breadcrumbs(struct intel_engine_cs *engine)
>>>   }
>>>   
>>>   static void guc_bump_inflight_request_prio(struct i915_request *rq,
>>> -					   int prio)
>>> +					   const struct i915_sched_attr *attr)
>>>   {
>>>   	struct intel_context *ce = rq->context;
>>> +	const int prio = attr->priority;
>>>   	u8 new_guc_prio = map_i915_prio_to_guc_prio(prio);
>>>   
>>>   	/* Short circuit function */
>>> diff --git a/drivers/gpu/drm/i915/i915_scheduler.c b/drivers/gpu/drm/i915/i915_scheduler.c
>>> index 762127dd56c5..534bab99fcdc 100644
>>> --- a/drivers/gpu/drm/i915/i915_scheduler.c
>>> +++ b/drivers/gpu/drm/i915/i915_scheduler.c
>>> @@ -255,7 +255,7 @@ static void __i915_schedule(struct i915_sched_node *node,
>>>   
>>>   		/* Must be called before changing the nodes priority */
>>>   		if (sched_engine->bump_inflight_request_prio)
>>> -			sched_engine->bump_inflight_request_prio(from, prio);
>>> +			sched_engine->bump_inflight_request_prio(from, attr);
>>>   
>>>   		WRITE_ONCE(node->attr.priority, prio);
>>>   
>>> @@ -280,7 +280,7 @@ static void __i915_schedule(struct i915_sched_node *node,
>>>   
>>>   		/* Defer (tasklet) submission until after all of our updates. */
>>>   		if (sched_engine->kick_backend)
>>> -			sched_engine->kick_backend(node_to_request(node), prio);
>>> +			sched_engine->kick_backend(node_to_request(node), attr);
>>>   	}
>>>   
>>>   	spin_unlock(&sched_engine->lock);
>>> diff --git a/drivers/gpu/drm/i915/i915_scheduler_types.h b/drivers/gpu/drm/i915/i915_scheduler_types.h
>>> index b0a1b58c7893..24b9ac1c2ce2 100644
>>> --- a/drivers/gpu/drm/i915/i915_scheduler_types.h
>>> +++ b/drivers/gpu/drm/i915/i915_scheduler_types.h
>>> @@ -177,13 +177,13 @@ struct i915_sched_engine {
>>>   	 * @kick_backend: kick backend after a request's priority has changed
>>>   	 */
>>>   	void	(*kick_backend)(const struct i915_request *rq,
>>> -				int prio);
>>> +				const struct i915_sched_attr *attr);
>>>   
>>>   	/**
>>>   	 * @bump_inflight_request_prio: update priority of an inflight request
>>>   	 */
>>>   	void	(*bump_inflight_request_prio)(struct i915_request *rq,
>>> -					      int prio);
>>> +					      const struct i915_sched_attr *attr);
>>>   
>>>   	/**
>>>   	 * @retire_inflight_request_prio: indicate request is retired to
>>> -- 
>>> 2.30.2
>>>
> 
