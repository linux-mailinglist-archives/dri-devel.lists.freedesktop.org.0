Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B0A392A20
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 10:53:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82CF06E102;
	Thu, 27 May 2021 08:53:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 152966E045;
 Thu, 27 May 2021 08:53:50 +0000 (UTC)
IronPort-SDR: 2bfc94O2niXewDbv/BDAMQLK7t2oW17o0eEtGmj0SKlWpiwzj+X4TVmTzo2aDzVyUtMKdEgzbZ
 k5ZhvF1eEqGg==
X-IronPort-AV: E=McAfee;i="6200,9189,9996"; a="182339458"
X-IronPort-AV: E=Sophos;i="5.82,334,1613462400"; d="scan'208";a="182339458"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2021 01:53:49 -0700
IronPort-SDR: /sVHfX/zrUvK3o/bu9Fk5hvP86TOyERbGHtC+lJq/3ciQe8gQF55BqsxQrX1RgniVMIe06IDH6
 CSgJ+g7KtURA==
X-IronPort-AV: E=Sophos;i="5.82,334,1613462400"; d="scan'208";a="547605361"
Received: from amoses-mobl1.ger.corp.intel.com (HELO [10.213.211.53])
 ([10.213.211.53])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2021 01:53:48 -0700
Subject: Re: [Intel-gfx] [RFC PATCH 60/97] drm/i915: Track 'serial' counts for
 virtual engines
To: John Harrison <john.c.harrison@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20210506191451.77768-1-matthew.brost@intel.com>
 <20210506191451.77768-61-matthew.brost@intel.com>
 <cd59ddd4-625b-c40d-05a8-e259b8fd430c@linux.intel.com>
 <20210525175239.GA21324@sdutt-i7>
 <6f6a1266-fe48-9cf1-beba-0b4463000ca7@linux.intel.com>
 <15643bd8-a270-a84d-3bd7-5376af7e378c@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <018044c0-d238-2060-99a4-a477d225781e@linux.intel.com>
Date: Thu, 27 May 2021 09:53:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <15643bd8-a270-a84d-3bd7-5376af7e378c@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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


On 26/05/2021 19:45, John Harrison wrote:
> On 5/26/2021 01:40, Tvrtko Ursulin wrote:
>> On 25/05/2021 18:52, Matthew Brost wrote:
>>> On Tue, May 25, 2021 at 11:16:12AM +0100, Tvrtko Ursulin wrote:
>>>>
>>>> On 06/05/2021 20:14, Matthew Brost wrote:
>>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>>
>>>>> The serial number tracking of engines happens at the backend of
>>>>> request submission and was expecting to only be given physical
>>>>> engines. However, in GuC submission mode, the decomposition of virtual
>>>>> to physical engines does not happen in i915. Instead, requests are
>>>>> submitted to their virtual engine mask all the way through to the
>>>>> hardware (i.e. to GuC). This would mean that the heart beat code
>>>>> thinks the physical engines are idle due to the serial number not
>>>>> incrementing.
>>>>>
>>>>> This patch updates the tracking to decompose virtual engines into
>>>>> their physical constituents and tracks the request against each. This
>>>>> is not entirely accurate as the GuC will only be issuing the request
>>>>> to one physical engine. However, it is the best that i915 can do given
>>>>> that it has no knowledge of the GuC's scheduling decisions.
>>>>
>>>> Commit text sounds a bit defeatist. I think instead of making up the 
>>>> serial
>>>> counts, which has downsides (could you please document in the commit 
>>>> what
>>>> they are), we should think how to design things properly.
>>>>
>>>
>>> IMO, I don't think fixing serial counts is the scope of this series. We
>>> should focus on getting GuC submission in not cleaning up all the crap
>>> that is in the i915. Let's make a note of this though so we can revisit
>>> later.
>>
>> I will say again - commit message implies it is introducing an 
>> unspecified downside by not fully fixing an also unspecified issue. It 
>> is completely reasonable, and customary even, to ask for both to be 
>> documented in the commit message.
> Not sure what exactly is 'unspecified'. I thought the commit message 
> described both the problem (heartbeat not running when using virtual 
> engines) and the result (heartbeat running on more engines than strictly 
> necessary). But in greater detail...
> 
> The serial number tracking is a hack for the heartbeat code to know 
> whether an engine is busy or idle, and therefore whether it should be 
> pinged for aliveness. Whenever a submission is made to an engine, the 
> serial number is incremented. The heartbeat code keeps a copy of the 
> value. If the value has changed, the engine is busy and needs to be pinged.
> 
> This works fine for execlist mode where virtual engine decomposition is 
> done inside i915. It fails miserably for GuC mode where the 
> decomposition is done by the hardware. The reason being that the 
> heartbeat code only looks at physical engines but the serial count is 
> only incremented on the virtual engine. Thus, the heartbeat sees 
> everything as idle and does not ping.

So hangcheck does not work. Or it works because GuC does it anyway. 
Either way, that's one thing to explicitly state in the commit message.

> This patch decomposes the virtual engines for the sake of incrementing 
> the serial count on each sub-engine in order to keep the heartbeat code 
> happy. The downside is that now the heartbeat sees all sub-engines as 
> busy rather than only the one the submission actually ends up on. There 
> really isn't much that can be done about that. The heartbeat code is in 
> i915 not GuC, the scheduler is in GuC not i915. The only way to improve 
> it is to either move the heartbeat code into GuC as well and completely 
> disable the i915 side, or add some way for i915 to interrogate GuC as to 
> which engines are or are not active. Technically, we do have both. GuC 
> has (or at least had) an option to force a context switch on every 
> execution quantum pre-emption. However, that is much, much, more heavy 
> weight than the heartbeat. For the latter, we do (almost) have the 
> engine usage statistics for PMU and such like. I'm not sure how much 
> effort it would be to wire that up to the heartbeat code instead of 
> using the serial count.
> 
> In short, the serial count is ever so slightly inefficient in that it 
> causes heartbeat pings on engines which are idle. On the other hand, it 
> is way more efficient and simpler than the current alternatives.

And the hack to make hangcheck work creates this inefficiency where 
heartbeats are sent to idle engines. Which is probably fine just needs 
to be explained.

> Does that answer the questions?

With the two points I re-raise clearly explained, possibly even patch 
title changed, yeah. I am just wanting for it to be more easily obvious 
to patch reader what it is functionally about - not just what 
implementation details have been change but why as well.

Regards,

Tvrtko

> John.
> 
> 
>>
>> If we are abandoning the normal review process someone please say so I 
>> don't waste my time reading it.
>>
>> Regards,
>>
>> Tvrtko
>>
>>> Matt
>>>
>>>> Regards,
>>>>
>>>> Tvrtko
>>>>
>>>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>>> ---
>>>>>    drivers/gpu/drm/i915/gt/intel_engine_types.h     |  2 ++
>>>>>    .../gpu/drm/i915/gt/intel_execlists_submission.c |  6 ++++++
>>>>>    drivers/gpu/drm/i915/gt/intel_ring_submission.c  |  6 ++++++
>>>>>    drivers/gpu/drm/i915/gt/mock_engine.c            |  6 ++++++
>>>>>    .../gpu/drm/i915/gt/uc/intel_guc_submission.c    | 16 
>>>>> ++++++++++++++++
>>>>>    drivers/gpu/drm/i915/i915_request.c              |  4 +++-
>>>>>    6 files changed, 39 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h 
>>>>> b/drivers/gpu/drm/i915/gt/intel_engine_types.h
>>>>> index 86302e6d86b2..e2b5cda6dbc4 100644
>>>>> --- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
>>>>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
>>>>> @@ -389,6 +389,8 @@ struct intel_engine_cs {
>>>>>        void        (*park)(struct intel_engine_cs *engine);
>>>>>        void        (*unpark)(struct intel_engine_cs *engine);
>>>>> +    void        (*bump_serial)(struct intel_engine_cs *engine);
>>>>> +
>>>>>        void        (*set_default_submission)(struct intel_engine_cs 
>>>>> *engine);
>>>>>        const struct intel_context_ops *cops;
>>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c 
>>>>> b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
>>>>> index ae12d7f19ecd..02880ea5d693 100644
>>>>> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
>>>>> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
>>>>> @@ -3199,6 +3199,11 @@ static void execlists_release(struct 
>>>>> intel_engine_cs *engine)
>>>>>        lrc_fini_wa_ctx(engine);
>>>>>    }
>>>>> +static void execlist_bump_serial(struct intel_engine_cs *engine)
>>>>> +{
>>>>> +    engine->serial++;
>>>>> +}
>>>>> +
>>>>>    static void
>>>>>    logical_ring_default_vfuncs(struct intel_engine_cs *engine)
>>>>>    {
>>>>> @@ -3208,6 +3213,7 @@ logical_ring_default_vfuncs(struct 
>>>>> intel_engine_cs *engine)
>>>>>        engine->cops = &execlists_context_ops;
>>>>>        engine->request_alloc = execlists_request_alloc;
>>>>> +    engine->bump_serial = execlist_bump_serial;
>>>>>        engine->reset.prepare = execlists_reset_prepare;
>>>>>        engine->reset.rewind = execlists_reset_rewind;
>>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_ring_submission.c 
>>>>> b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
>>>>> index 14aa31879a37..39dd7c4ed0a9 100644
>>>>> --- a/drivers/gpu/drm/i915/gt/intel_ring_submission.c
>>>>> +++ b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
>>>>> @@ -1045,6 +1045,11 @@ static void setup_irq(struct intel_engine_cs 
>>>>> *engine)
>>>>>        }
>>>>>    }
>>>>> +static void ring_bump_serial(struct intel_engine_cs *engine)
>>>>> +{
>>>>> +    engine->serial++;
>>>>> +}
>>>>> +
>>>>>    static void setup_common(struct intel_engine_cs *engine)
>>>>>    {
>>>>>        struct drm_i915_private *i915 = engine->i915;
>>>>> @@ -1064,6 +1069,7 @@ static void setup_common(struct 
>>>>> intel_engine_cs *engine)
>>>>>        engine->cops = &ring_context_ops;
>>>>>        engine->request_alloc = ring_request_alloc;
>>>>> +    engine->bump_serial = ring_bump_serial;
>>>>>        /*
>>>>>         * Using a global execution timeline; the previous final 
>>>>> breadcrumb is
>>>>> diff --git a/drivers/gpu/drm/i915/gt/mock_engine.c 
>>>>> b/drivers/gpu/drm/i915/gt/mock_engine.c
>>>>> index bd005c1b6fd5..97b10fd60b55 100644
>>>>> --- a/drivers/gpu/drm/i915/gt/mock_engine.c
>>>>> +++ b/drivers/gpu/drm/i915/gt/mock_engine.c
>>>>> @@ -292,6 +292,11 @@ static void mock_engine_release(struct 
>>>>> intel_engine_cs *engine)
>>>>>        intel_engine_fini_retire(engine);
>>>>>    }
>>>>> +static void mock_bump_serial(struct intel_engine_cs *engine)
>>>>> +{
>>>>> +    engine->serial++;
>>>>> +}
>>>>> +
>>>>>    struct intel_engine_cs *mock_engine(struct drm_i915_private *i915,
>>>>>                        const char *name,
>>>>>                        int id)
>>>>> @@ -318,6 +323,7 @@ struct intel_engine_cs *mock_engine(struct 
>>>>> drm_i915_private *i915,
>>>>>        engine->base.cops = &mock_context_ops;
>>>>>        engine->base.request_alloc = mock_request_alloc;
>>>>> +    engine->base.bump_serial = mock_bump_serial;
>>>>>        engine->base.emit_flush = mock_emit_flush;
>>>>>        engine->base.emit_fini_breadcrumb = mock_emit_breadcrumb;
>>>>>        engine->base.submit_request = mock_submit_request;
>>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c 
>>>>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>>>> index dc79d287c50a..f0e5731bcef6 100644
>>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>>>> @@ -1500,6 +1500,20 @@ static void guc_release(struct 
>>>>> intel_engine_cs *engine)
>>>>>        lrc_fini_wa_ctx(engine);
>>>>>    }
>>>>> +static void guc_bump_serial(struct intel_engine_cs *engine)
>>>>> +{
>>>>> +    engine->serial++;
>>>>> +}
>>>>> +
>>>>> +static void virtual_guc_bump_serial(struct intel_engine_cs *engine)
>>>>> +{
>>>>> +    struct intel_engine_cs *e;
>>>>> +    intel_engine_mask_t tmp, mask = engine->mask;
>>>>> +
>>>>> +    for_each_engine_masked(e, engine->gt, mask, tmp)
>>>>> +        e->serial++;
>>>>> +}
>>>>> +
>>>>>    static void guc_default_vfuncs(struct intel_engine_cs *engine)
>>>>>    {
>>>>>        /* Default vfuncs which can be overridden by each engine. */
>>>>> @@ -1508,6 +1522,7 @@ static void guc_default_vfuncs(struct 
>>>>> intel_engine_cs *engine)
>>>>>        engine->cops = &guc_context_ops;
>>>>>        engine->request_alloc = guc_request_alloc;
>>>>> +    engine->bump_serial = guc_bump_serial;
>>>>>        engine->sched_engine->schedule = i915_schedule;
>>>>> @@ -1843,6 +1858,7 @@ guc_create_virtual(struct intel_engine_cs 
>>>>> **siblings, unsigned int count)
>>>>>        ve->base.cops = &virtual_guc_context_ops;
>>>>>        ve->base.request_alloc = guc_request_alloc;
>>>>> +    ve->base.bump_serial = virtual_guc_bump_serial;
>>>>>        ve->base.submit_request = guc_submit_request;
>>>>> diff --git a/drivers/gpu/drm/i915/i915_request.c 
>>>>> b/drivers/gpu/drm/i915/i915_request.c
>>>>> index 9542a5baa45a..127d60b36422 100644
>>>>> --- a/drivers/gpu/drm/i915/i915_request.c
>>>>> +++ b/drivers/gpu/drm/i915/i915_request.c
>>>>> @@ -692,7 +692,9 @@ bool __i915_request_submit(struct i915_request 
>>>>> *request)
>>>>>                         request->ring->vaddr + request->postfix);
>>>>>        trace_i915_request_execute(request);
>>>>> -    engine->serial++;
>>>>> +    if (engine->bump_serial)
>>>>> +        engine->bump_serial(engine);
>>>>> +
>>>>>        result = true;
>>>>>        GEM_BUG_ON(test_bit(I915_FENCE_FLAG_ACTIVE, 
>>>>> &request->fence.flags));
>>>>>
>> _______________________________________________
>> Intel-gfx mailing list
>> Intel-gfx@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
> 
