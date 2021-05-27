Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5BD393473
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 19:01:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51E3F6F483;
	Thu, 27 May 2021 17:01:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B89086F46B;
 Thu, 27 May 2021 17:01:46 +0000 (UTC)
IronPort-SDR: PLjbYvHFeCjunTA2ZuIVRExoUYmdhC4BlFdKGfmdivnwdRo+95B3h37YLPWch9uOCQVYabhjab
 ccL1OpiRJGxg==
X-IronPort-AV: E=McAfee;i="6200,9189,9997"; a="200893252"
X-IronPort-AV: E=Sophos;i="5.83,227,1616482800"; 
 d="scan'208,217";a="200893252"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2021 10:01:28 -0700
IronPort-SDR: xPuwjsQiuUJaGPjlKCj0wLaVzGgP3ULqHvcTOOLhSzJrAWZdj1Ww5iqnzXqdWtfYCJjkNUyqw/
 xTpGfKLQAXUg==
X-IronPort-AV: E=Sophos;i="5.83,227,1616482800"; 
 d="scan'208,217";a="477570041"
Received: from johnharr-mobl1.amr.corp.intel.com (HELO [10.209.116.237])
 ([10.209.116.237])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2021 10:01:26 -0700
Subject: Re: [Intel-gfx] [RFC PATCH 60/97] drm/i915: Track 'serial' counts for
 virtual engines
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20210506191451.77768-1-matthew.brost@intel.com>
 <20210506191451.77768-61-matthew.brost@intel.com>
 <cd59ddd4-625b-c40d-05a8-e259b8fd430c@linux.intel.com>
 <20210525175239.GA21324@sdutt-i7>
 <6f6a1266-fe48-9cf1-beba-0b4463000ca7@linux.intel.com>
 <15643bd8-a270-a84d-3bd7-5376af7e378c@intel.com>
 <018044c0-d238-2060-99a4-a477d225781e@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <87dd027f-6690-19f9-55c3-40115254fa1c@intel.com>
Date: Thu, 27 May 2021 10:01:24 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <018044c0-d238-2060-99a4-a477d225781e@linux.intel.com>
Content-Type: multipart/alternative;
 boundary="------------B53BCBDA1B0D69846EED16DB"
Content-Language: en-GB
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

This is a multi-part message in MIME format.
--------------B53BCBDA1B0D69846EED16DB
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/27/2021 01:53, Tvrtko Ursulin wrote:
> On 26/05/2021 19:45, John Harrison wrote:
>> On 5/26/2021 01:40, Tvrtko Ursulin wrote:
>>> On 25/05/2021 18:52, Matthew Brost wrote:
>>>> On Tue, May 25, 2021 at 11:16:12AM +0100, Tvrtko Ursulin wrote:
>>>>>
>>>>> On 06/05/2021 20:14, Matthew Brost wrote:
>>>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>>>
>>>>>> The serial number tracking of engines happens at the backend of
>>>>>> request submission and was expecting to only be given physical
>>>>>> engines. However, in GuC submission mode, the decomposition of 
>>>>>> virtual
>>>>>> to physical engines does not happen in i915. Instead, requests are
>>>>>> submitted to their virtual engine mask all the way through to the
>>>>>> hardware (i.e. to GuC). This would mean that the heart beat code
>>>>>> thinks the physical engines are idle due to the serial number not
>>>>>> incrementing.
>>>>>>
>>>>>> This patch updates the tracking to decompose virtual engines into
>>>>>> their physical constituents and tracks the request against each. 
>>>>>> This
>>>>>> is not entirely accurate as the GuC will only be issuing the request
>>>>>> to one physical engine. However, it is the best that i915 can do 
>>>>>> given
>>>>>> that it has no knowledge of the GuC's scheduling decisions.
>>>>>
>>>>> Commit text sounds a bit defeatist. I think instead of making up 
>>>>> the serial
>>>>> counts, which has downsides (could you please document in the 
>>>>> commit what
>>>>> they are), we should think how to design things properly.
>>>>>
>>>>
>>>> IMO, I don't think fixing serial counts is the scope of this 
>>>> series. We
>>>> should focus on getting GuC submission in not cleaning up all the crap
>>>> that is in the i915. Let's make a note of this though so we can 
>>>> revisit
>>>> later.
>>>
>>> I will say again - commit message implies it is introducing an 
>>> unspecified downside by not fully fixing an also unspecified issue. 
>>> It is completely reasonable, and customary even, to ask for both to 
>>> be documented in the commit message.
>> Not sure what exactly is 'unspecified'. I thought the commit message 
>> described both the problem (heartbeat not running when using virtual 
>> engines) and the result (heartbeat running on more engines than 
>> strictly necessary). But in greater detail...
>>
>> The serial number tracking is a hack for the heartbeat code to know 
>> whether an engine is busy or idle, and therefore whether it should be 
>> pinged for aliveness. Whenever a submission is made to an engine, the 
>> serial number is incremented. The heartbeat code keeps a copy of the 
>> value. If the value has changed, the engine is busy and needs to be 
>> pinged.
>>
>> This works fine for execlist mode where virtual engine decomposition 
>> is done inside i915. It fails miserably for GuC mode where the 
>> decomposition is done by the hardware. The reason being that the 
>> heartbeat code only looks at physical engines but the serial count is 
>> only incremented on the virtual engine. Thus, the heartbeat sees 
>> everything as idle and does not ping.
>
> So hangcheck does not work. Or it works because GuC does it anyway. 
> Either way, that's one thing to explicitly state in the commit message.
>
>> This patch decomposes the virtual engines for the sake of 
>> incrementing the serial count on each sub-engine in order to keep the 
>> heartbeat code happy. The downside is that now the heartbeat sees all 
>> sub-engines as busy rather than only the one the submission actually 
>> ends up on. There really isn't much that can be done about that. The 
>> heartbeat code is in i915 not GuC, the scheduler is in GuC not i915. 
>> The only way to improve it is to either move the heartbeat code into 
>> GuC as well and completely disable the i915 side, or add some way for 
>> i915 to interrogate GuC as to which engines are or are not active. 
>> Technically, we do have both. GuC has (or at least had) an option to 
>> force a context switch on every execution quantum pre-emption. 
>> However, that is much, much, more heavy weight than the heartbeat. 
>> For the latter, we do (almost) have the engine usage statistics for 
>> PMU and such like. I'm not sure how much effort it would be to wire 
>> that up to the heartbeat code instead of using the serial count.
>>
>> In short, the serial count is ever so slightly inefficient in that it 
>> causes heartbeat pings on engines which are idle. On the other hand, 
>> it is way more efficient and simpler than the current alternatives.
>
> And the hack to make hangcheck work creates this inefficiency where 
> heartbeats are sent to idle engines. Which is probably fine just needs 
> to be explained.
>
>> Does that answer the questions?
>
> With the two points I re-raise clearly explained, possibly even patch 
> title changed, yeah. I am just wanting for it to be more easily 
> obvious to patch reader what it is functionally about - not just what 
> implementation details have been change but why as well.
>
My understanding is that we don't explain every piece of code in minute 
detail in every checkin email that touches it. I thought my description 
was already pretty verbose. I've certainly seen way less informative 
checkins that apparently made it through review without issue.

Regarding the problem statement, I thought this was fairly clear that 
the heartbeat was broken for virtual engines:

    This would mean that the heart beat code
    thinks the physical engines are idle due to the serial number not
    incrementing.


Regarding the inefficiency about heartbeating all physical engines in a 
virtual engine, again, this seems clear to me:

    decompose virtual engines into
    their physical constituents and tracks the request against each. This
    is not entirely accurate as the GuC will only be issuing the request
    to one physical engine.


For the subject, I guess you could say "Track 'heartbeat serial' counts 
for virtual engines". However, the serial tracking count is not 
explicitly named for heartbeats so it seems inaccurate to rename it for 
a checkin email subject.

If you have a suggestion for better wording then feel free to propose 
something.

John.


> Regards,
>
> Tvrtko
>
>> John.
>>
>>
>>>
>>> If we are abandoning the normal review process someone please say so 
>>> I don't waste my time reading it.
>>>
>>> Regards,
>>>
>>> Tvrtko
>>>
>>>> Matt
>>>>
>>>>> Regards,
>>>>>
>>>>> Tvrtko
>>>>>
>>>>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>>>> ---
>>>>>>    drivers/gpu/drm/i915/gt/intel_engine_types.h     |  2 ++
>>>>>>    .../gpu/drm/i915/gt/intel_execlists_submission.c |  6 ++++++
>>>>>>    drivers/gpu/drm/i915/gt/intel_ring_submission.c  |  6 ++++++
>>>>>>    drivers/gpu/drm/i915/gt/mock_engine.c            |  6 ++++++
>>>>>>    .../gpu/drm/i915/gt/uc/intel_guc_submission.c    | 16 
>>>>>> ++++++++++++++++
>>>>>>    drivers/gpu/drm/i915/i915_request.c              |  4 +++-
>>>>>>    6 files changed, 39 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h 
>>>>>> b/drivers/gpu/drm/i915/gt/intel_engine_types.h
>>>>>> index 86302e6d86b2..e2b5cda6dbc4 100644
>>>>>> --- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
>>>>>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
>>>>>> @@ -389,6 +389,8 @@ struct intel_engine_cs {
>>>>>>        void        (*park)(struct intel_engine_cs *engine);
>>>>>>        void        (*unpark)(struct intel_engine_cs *engine);
>>>>>> +    void        (*bump_serial)(struct intel_engine_cs *engine);
>>>>>> +
>>>>>>        void        (*set_default_submission)(struct 
>>>>>> intel_engine_cs *engine);
>>>>>>        const struct intel_context_ops *cops;
>>>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c 
>>>>>> b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
>>>>>> index ae12d7f19ecd..02880ea5d693 100644
>>>>>> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
>>>>>> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
>>>>>> @@ -3199,6 +3199,11 @@ static void execlists_release(struct 
>>>>>> intel_engine_cs *engine)
>>>>>>        lrc_fini_wa_ctx(engine);
>>>>>>    }
>>>>>> +static void execlist_bump_serial(struct intel_engine_cs *engine)
>>>>>> +{
>>>>>> +    engine->serial++;
>>>>>> +}
>>>>>> +
>>>>>>    static void
>>>>>>    logical_ring_default_vfuncs(struct intel_engine_cs *engine)
>>>>>>    {
>>>>>> @@ -3208,6 +3213,7 @@ logical_ring_default_vfuncs(struct 
>>>>>> intel_engine_cs *engine)
>>>>>>        engine->cops = &execlists_context_ops;
>>>>>>        engine->request_alloc = execlists_request_alloc;
>>>>>> +    engine->bump_serial = execlist_bump_serial;
>>>>>>        engine->reset.prepare = execlists_reset_prepare;
>>>>>>        engine->reset.rewind = execlists_reset_rewind;
>>>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_ring_submission.c 
>>>>>> b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
>>>>>> index 14aa31879a37..39dd7c4ed0a9 100644
>>>>>> --- a/drivers/gpu/drm/i915/gt/intel_ring_submission.c
>>>>>> +++ b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
>>>>>> @@ -1045,6 +1045,11 @@ static void setup_irq(struct 
>>>>>> intel_engine_cs *engine)
>>>>>>        }
>>>>>>    }
>>>>>> +static void ring_bump_serial(struct intel_engine_cs *engine)
>>>>>> +{
>>>>>> +    engine->serial++;
>>>>>> +}
>>>>>> +
>>>>>>    static void setup_common(struct intel_engine_cs *engine)
>>>>>>    {
>>>>>>        struct drm_i915_private *i915 = engine->i915;
>>>>>> @@ -1064,6 +1069,7 @@ static void setup_common(struct 
>>>>>> intel_engine_cs *engine)
>>>>>>        engine->cops = &ring_context_ops;
>>>>>>        engine->request_alloc = ring_request_alloc;
>>>>>> +    engine->bump_serial = ring_bump_serial;
>>>>>>        /*
>>>>>>         * Using a global execution timeline; the previous final 
>>>>>> breadcrumb is
>>>>>> diff --git a/drivers/gpu/drm/i915/gt/mock_engine.c 
>>>>>> b/drivers/gpu/drm/i915/gt/mock_engine.c
>>>>>> index bd005c1b6fd5..97b10fd60b55 100644
>>>>>> --- a/drivers/gpu/drm/i915/gt/mock_engine.c
>>>>>> +++ b/drivers/gpu/drm/i915/gt/mock_engine.c
>>>>>> @@ -292,6 +292,11 @@ static void mock_engine_release(struct 
>>>>>> intel_engine_cs *engine)
>>>>>>        intel_engine_fini_retire(engine);
>>>>>>    }
>>>>>> +static void mock_bump_serial(struct intel_engine_cs *engine)
>>>>>> +{
>>>>>> +    engine->serial++;
>>>>>> +}
>>>>>> +
>>>>>>    struct intel_engine_cs *mock_engine(struct drm_i915_private 
>>>>>> *i915,
>>>>>>                        const char *name,
>>>>>>                        int id)
>>>>>> @@ -318,6 +323,7 @@ struct intel_engine_cs *mock_engine(struct 
>>>>>> drm_i915_private *i915,
>>>>>>        engine->base.cops = &mock_context_ops;
>>>>>>        engine->base.request_alloc = mock_request_alloc;
>>>>>> +    engine->base.bump_serial = mock_bump_serial;
>>>>>>        engine->base.emit_flush = mock_emit_flush;
>>>>>>        engine->base.emit_fini_breadcrumb = mock_emit_breadcrumb;
>>>>>>        engine->base.submit_request = mock_submit_request;
>>>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c 
>>>>>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>>>>> index dc79d287c50a..f0e5731bcef6 100644
>>>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>>>>> @@ -1500,6 +1500,20 @@ static void guc_release(struct 
>>>>>> intel_engine_cs *engine)
>>>>>>        lrc_fini_wa_ctx(engine);
>>>>>>    }
>>>>>> +static void guc_bump_serial(struct intel_engine_cs *engine)
>>>>>> +{
>>>>>> +    engine->serial++;
>>>>>> +}
>>>>>> +
>>>>>> +static void virtual_guc_bump_serial(struct intel_engine_cs *engine)
>>>>>> +{
>>>>>> +    struct intel_engine_cs *e;
>>>>>> +    intel_engine_mask_t tmp, mask = engine->mask;
>>>>>> +
>>>>>> +    for_each_engine_masked(e, engine->gt, mask, tmp)
>>>>>> +        e->serial++;
>>>>>> +}
>>>>>> +
>>>>>>    static void guc_default_vfuncs(struct intel_engine_cs *engine)
>>>>>>    {
>>>>>>        /* Default vfuncs which can be overridden by each engine. */
>>>>>> @@ -1508,6 +1522,7 @@ static void guc_default_vfuncs(struct 
>>>>>> intel_engine_cs *engine)
>>>>>>        engine->cops = &guc_context_ops;
>>>>>>        engine->request_alloc = guc_request_alloc;
>>>>>> +    engine->bump_serial = guc_bump_serial;
>>>>>>        engine->sched_engine->schedule = i915_schedule;
>>>>>> @@ -1843,6 +1858,7 @@ guc_create_virtual(struct intel_engine_cs 
>>>>>> **siblings, unsigned int count)
>>>>>>        ve->base.cops = &virtual_guc_context_ops;
>>>>>>        ve->base.request_alloc = guc_request_alloc;
>>>>>> +    ve->base.bump_serial = virtual_guc_bump_serial;
>>>>>>        ve->base.submit_request = guc_submit_request;
>>>>>> diff --git a/drivers/gpu/drm/i915/i915_request.c 
>>>>>> b/drivers/gpu/drm/i915/i915_request.c
>>>>>> index 9542a5baa45a..127d60b36422 100644
>>>>>> --- a/drivers/gpu/drm/i915/i915_request.c
>>>>>> +++ b/drivers/gpu/drm/i915/i915_request.c
>>>>>> @@ -692,7 +692,9 @@ bool __i915_request_submit(struct 
>>>>>> i915_request *request)
>>>>>>                         request->ring->vaddr + request->postfix);
>>>>>>        trace_i915_request_execute(request);
>>>>>> -    engine->serial++;
>>>>>> +    if (engine->bump_serial)
>>>>>> +        engine->bump_serial(engine);
>>>>>> +
>>>>>>        result = true;
>>>>>>        GEM_BUG_ON(test_bit(I915_FENCE_FLAG_ACTIVE, 
>>>>>> &request->fence.flags));
>>>>>>
>>> _______________________________________________
>>> Intel-gfx mailing list
>>> Intel-gfx@lists.freedesktop.org
>>> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
>>


--------------B53BCBDA1B0D69846EED16DB
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    On 5/27/2021 01:53, Tvrtko Ursulin wrote:<br>
    <blockquote type="cite"
      cite="mid:018044c0-d238-2060-99a4-a477d225781e@linux.intel.com">
      On 26/05/2021 19:45, John Harrison wrote:
      <br>
      <blockquote type="cite">On 5/26/2021 01:40, Tvrtko Ursulin wrote:
        <br>
        <blockquote type="cite">On 25/05/2021 18:52, Matthew Brost
          wrote:
          <br>
          <blockquote type="cite">On Tue, May 25, 2021 at 11:16:12AM
            +0100, Tvrtko Ursulin wrote:
            <br>
            <blockquote type="cite">
              <br>
              On 06/05/2021 20:14, Matthew Brost wrote:
              <br>
              <blockquote type="cite">From: John Harrison
                <a class="moz-txt-link-rfc2396E" href="mailto:John.C.Harrison@Intel.com">&lt;John.C.Harrison@Intel.com&gt;</a>
                <br>
                <br>
                The serial number tracking of engines happens at the
                backend of
                <br>
                request submission and was expecting to only be given
                physical
                <br>
                engines. However, in GuC submission mode, the
                decomposition of virtual
                <br>
                to physical engines does not happen in i915. Instead,
                requests are
                <br>
                submitted to their virtual engine mask all the way
                through to the
                <br>
                hardware (i.e. to GuC). This would mean that the heart
                beat code
                <br>
                thinks the physical engines are idle due to the serial
                number not
                <br>
                incrementing.
                <br>
                <br>
                This patch updates the tracking to decompose virtual
                engines into
                <br>
                their physical constituents and tracks the request
                against each. This
                <br>
                is not entirely accurate as the GuC will only be issuing
                the request
                <br>
                to one physical engine. However, it is the best that
                i915 can do given
                <br>
                that it has no knowledge of the GuC's scheduling
                decisions.
                <br>
              </blockquote>
              <br>
              Commit text sounds a bit defeatist. I think instead of
              making up the serial
              <br>
              counts, which has downsides (could you please document in
              the commit what
              <br>
              they are), we should think how to design things properly.
              <br>
              <br>
            </blockquote>
            <br>
            IMO, I don't think fixing serial counts is the scope of this
            series. We
            <br>
            should focus on getting GuC submission in not cleaning up
            all the crap
            <br>
            that is in the i915. Let's make a note of this though so we
            can revisit
            <br>
            later.
            <br>
          </blockquote>
          <br>
          I will say again - commit message implies it is introducing an
          unspecified downside by not fully fixing an also unspecified
          issue. It is completely reasonable, and customary even, to ask
          for both to be documented in the commit message.
          <br>
        </blockquote>
        Not sure what exactly is 'unspecified'. I thought the commit
        message described both the problem (heartbeat not running when
        using virtual engines) and the result (heartbeat running on more
        engines than strictly necessary). But in greater detail...
        <br>
        <br>
        The serial number tracking is a hack for the heartbeat code to
        know whether an engine is busy or idle, and therefore whether it
        should be pinged for aliveness. Whenever a submission is made to
        an engine, the serial number is incremented. The heartbeat code
        keeps a copy of the value. If the value has changed, the engine
        is busy and needs to be pinged.
        <br>
        <br>
        This works fine for execlist mode where virtual engine
        decomposition is done inside i915. It fails miserably for GuC
        mode where the decomposition is done by the hardware. The reason
        being that the heartbeat code only looks at physical engines but
        the serial count is only incremented on the virtual engine.
        Thus, the heartbeat sees everything as idle and does not ping.
        <br>
      </blockquote>
      <br>
      So hangcheck does not work. Or it works because GuC does it
      anyway. Either way, that's one thing to explicitly state in the
      commit message.
      <br>
      <br>
      <blockquote type="cite">This patch decomposes the virtual engines
        for the sake of incrementing the serial count on each sub-engine
        in order to keep the heartbeat code happy. The downside is that
        now the heartbeat sees all sub-engines as busy rather than only
        the one the submission actually ends up on. There really isn't
        much that can be done about that. The heartbeat code is in i915
        not GuC, the scheduler is in GuC not i915. The only way to
        improve it is to either move the heartbeat code into GuC as well
        and completely disable the i915 side, or add some way for i915
        to interrogate GuC as to which engines are or are not active.
        Technically, we do have both. GuC has (or at least had) an
        option to force a context switch on every execution quantum
        pre-emption. However, that is much, much, more heavy weight than
        the heartbeat. For the latter, we do (almost) have the engine
        usage statistics for PMU and such like. I'm not sure how much
        effort it would be to wire that up to the heartbeat code instead
        of using the serial count.
        <br>
        <br>
        In short, the serial count is ever so slightly inefficient in
        that it causes heartbeat pings on engines which are idle. On the
        other hand, it is way more efficient and simpler than the
        current alternatives.
        <br>
      </blockquote>
      <br>
      And the hack to make hangcheck work creates this inefficiency
      where heartbeats are sent to idle engines. Which is probably fine
      just needs to be explained.
      <br>
      <br>
      <blockquote type="cite">Does that answer the questions?
        <br>
      </blockquote>
      <br>
      With the two points I re-raise clearly explained, possibly even
      patch title changed, yeah. I am just wanting for it to be more
      easily obvious to patch reader what it is functionally about - not
      just what implementation details have been change but why as well.
      <br>
      <br>
    </blockquote>
    My understanding is that we don't explain every piece of code in
    minute detail in every checkin email that touches it. I thought my
    description was already pretty verbose. I've certainly seen way less
    informative checkins that apparently made it through review without
    issue.<br>
    <br>
    Regarding the problem statement, I thought this was fairly clear
    that the heartbeat was broken for virtual engines:<br>
    <blockquote>This would mean that the heart beat code
      <br>
      thinks the physical engines are idle due to the serial number not
      <br>
      incrementing.
      <br>
    </blockquote>
    <br>
    Regarding the inefficiency about heartbeating all physical engines
    in a virtual engine, again, this seems clear to me:<br>
    <blockquote>decompose virtual engines into
      <br>
      their physical constituents and tracks the request against each.
      This
      <br>
      is not entirely accurate as the GuC will only be issuing the
      request
      <br>
      to one physical engine.<br>
    </blockquote>
    <br>
    For the subject, I guess you could say "Track 'heartbeat serial'
    counts for virtual engines". However, the serial tracking count is
    not explicitly named for heartbeats so it seems inaccurate to rename
    it for a checkin email subject.<br>
    <br>
    If you have a suggestion for better wording then feel free to
    propose something.<br>
    <br>
    John.<br>
    <br>
    <br>
    <blockquote type="cite"
      cite="mid:018044c0-d238-2060-99a4-a477d225781e@linux.intel.com">Regards,
      <br>
      <br>
      Tvrtko
      <br>
      <br>
      <blockquote type="cite">John.
        <br>
        <br>
        <br>
        <blockquote type="cite">
          <br>
          If we are abandoning the normal review process someone please
          say so I don't waste my time reading it.
          <br>
          <br>
          Regards,
          <br>
          <br>
          Tvrtko
          <br>
          <br>
          <blockquote type="cite">Matt
            <br>
            <br>
            <blockquote type="cite">Regards,
              <br>
              <br>
              Tvrtko
              <br>
              <br>
              <blockquote type="cite">Signed-off-by: John Harrison
                <a class="moz-txt-link-rfc2396E" href="mailto:John.C.Harrison@Intel.com">&lt;John.C.Harrison@Intel.com&gt;</a>
                <br>
                Signed-off-by: Matthew Brost
                <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
                <br>
                ---
                <br>
                   drivers/gpu/drm/i915/gt/intel_engine_types.h     |  2
                ++
                <br>
                   .../gpu/drm/i915/gt/intel_execlists_submission.c |  6
                ++++++
                <br>
                   drivers/gpu/drm/i915/gt/intel_ring_submission.c  |  6
                ++++++
                <br>
                   drivers/gpu/drm/i915/gt/mock_engine.c            |  6
                ++++++
                <br>
                   .../gpu/drm/i915/gt/uc/intel_guc_submission.c    | 16
                ++++++++++++++++
                <br>
                   drivers/gpu/drm/i915/i915_request.c              |  4
                +++-
                <br>
                   6 files changed, 39 insertions(+), 1 deletion(-)
                <br>
                <br>
                diff --git
                a/drivers/gpu/drm/i915/gt/intel_engine_types.h
                b/drivers/gpu/drm/i915/gt/intel_engine_types.h
                <br>
                index 86302e6d86b2..e2b5cda6dbc4 100644
                <br>
                --- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
                <br>
                +++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
                <br>
                @@ -389,6 +389,8 @@ struct intel_engine_cs {
                <br>
                       void        (*park)(struct intel_engine_cs
                *engine);
                <br>
                       void        (*unpark)(struct intel_engine_cs
                *engine);
                <br>
                +    void        (*bump_serial)(struct intel_engine_cs
                *engine);
                <br>
                +
                <br>
                       void        (*set_default_submission)(struct
                intel_engine_cs *engine);
                <br>
                       const struct intel_context_ops *cops;
                <br>
                diff --git
                a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
                b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
                <br>
                index ae12d7f19ecd..02880ea5d693 100644
                <br>
                ---
                a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
                <br>
                +++
                b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
                <br>
                @@ -3199,6 +3199,11 @@ static void
                execlists_release(struct intel_engine_cs *engine)
                <br>
                       lrc_fini_wa_ctx(engine);
                <br>
                   }
                <br>
                +static void execlist_bump_serial(struct intel_engine_cs
                *engine)
                <br>
                +{
                <br>
                +    engine-&gt;serial++;
                <br>
                +}
                <br>
                +
                <br>
                   static void
                <br>
                   logical_ring_default_vfuncs(struct intel_engine_cs
                *engine)
                <br>
                   {
                <br>
                @@ -3208,6 +3213,7 @@ logical_ring_default_vfuncs(struct
                intel_engine_cs *engine)
                <br>
                       engine-&gt;cops = &amp;execlists_context_ops;
                <br>
                       engine-&gt;request_alloc =
                execlists_request_alloc;
                <br>
                +    engine-&gt;bump_serial = execlist_bump_serial;
                <br>
                       engine-&gt;reset.prepare =
                execlists_reset_prepare;
                <br>
                       engine-&gt;reset.rewind = execlists_reset_rewind;
                <br>
                diff --git
                a/drivers/gpu/drm/i915/gt/intel_ring_submission.c
                b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
                <br>
                index 14aa31879a37..39dd7c4ed0a9 100644
                <br>
                --- a/drivers/gpu/drm/i915/gt/intel_ring_submission.c
                <br>
                +++ b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
                <br>
                @@ -1045,6 +1045,11 @@ static void setup_irq(struct
                intel_engine_cs *engine)
                <br>
                       }
                <br>
                   }
                <br>
                +static void ring_bump_serial(struct intel_engine_cs
                *engine)
                <br>
                +{
                <br>
                +    engine-&gt;serial++;
                <br>
                +}
                <br>
                +
                <br>
                   static void setup_common(struct intel_engine_cs
                *engine)
                <br>
                   {
                <br>
                       struct drm_i915_private *i915 = engine-&gt;i915;
                <br>
                @@ -1064,6 +1069,7 @@ static void setup_common(struct
                intel_engine_cs *engine)
                <br>
                       engine-&gt;cops = &amp;ring_context_ops;
                <br>
                       engine-&gt;request_alloc = ring_request_alloc;
                <br>
                +    engine-&gt;bump_serial = ring_bump_serial;
                <br>
                       /*
                <br>
                        * Using a global execution timeline; the
                previous final breadcrumb is
                <br>
                diff --git a/drivers/gpu/drm/i915/gt/mock_engine.c
                b/drivers/gpu/drm/i915/gt/mock_engine.c
                <br>
                index bd005c1b6fd5..97b10fd60b55 100644
                <br>
                --- a/drivers/gpu/drm/i915/gt/mock_engine.c
                <br>
                +++ b/drivers/gpu/drm/i915/gt/mock_engine.c
                <br>
                @@ -292,6 +292,11 @@ static void
                mock_engine_release(struct intel_engine_cs *engine)
                <br>
                       intel_engine_fini_retire(engine);
                <br>
                   }
                <br>
                +static void mock_bump_serial(struct intel_engine_cs
                *engine)
                <br>
                +{
                <br>
                +    engine-&gt;serial++;
                <br>
                +}
                <br>
                +
                <br>
                   struct intel_engine_cs *mock_engine(struct
                drm_i915_private *i915,
                <br>
                                       const char *name,
                <br>
                                       int id)
                <br>
                @@ -318,6 +323,7 @@ struct intel_engine_cs
                *mock_engine(struct drm_i915_private *i915,
                <br>
                       engine-&gt;base.cops = &amp;mock_context_ops;
                <br>
                       engine-&gt;base.request_alloc =
                mock_request_alloc;
                <br>
                +    engine-&gt;base.bump_serial = mock_bump_serial;
                <br>
                       engine-&gt;base.emit_flush = mock_emit_flush;
                <br>
                       engine-&gt;base.emit_fini_breadcrumb =
                mock_emit_breadcrumb;
                <br>
                       engine-&gt;base.submit_request =
                mock_submit_request;
                <br>
                diff --git
                a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
                b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
                <br>
                index dc79d287c50a..f0e5731bcef6 100644
                <br>
                --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
                <br>
                +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
                <br>
                @@ -1500,6 +1500,20 @@ static void guc_release(struct
                intel_engine_cs *engine)
                <br>
                       lrc_fini_wa_ctx(engine);
                <br>
                   }
                <br>
                +static void guc_bump_serial(struct intel_engine_cs
                *engine)
                <br>
                +{
                <br>
                +    engine-&gt;serial++;
                <br>
                +}
                <br>
                +
                <br>
                +static void virtual_guc_bump_serial(struct
                intel_engine_cs *engine)
                <br>
                +{
                <br>
                +    struct intel_engine_cs *e;
                <br>
                +    intel_engine_mask_t tmp, mask = engine-&gt;mask;
                <br>
                +
                <br>
                +    for_each_engine_masked(e, engine-&gt;gt, mask, tmp)
                <br>
                +        e-&gt;serial++;
                <br>
                +}
                <br>
                +
                <br>
                   static void guc_default_vfuncs(struct intel_engine_cs
                *engine)
                <br>
                   {
                <br>
                       /* Default vfuncs which can be overridden by each
                engine. */
                <br>
                @@ -1508,6 +1522,7 @@ static void
                guc_default_vfuncs(struct intel_engine_cs *engine)
                <br>
                       engine-&gt;cops = &amp;guc_context_ops;
                <br>
                       engine-&gt;request_alloc = guc_request_alloc;
                <br>
                +    engine-&gt;bump_serial = guc_bump_serial;
                <br>
                       engine-&gt;sched_engine-&gt;schedule =
                i915_schedule;
                <br>
                @@ -1843,6 +1858,7 @@ guc_create_virtual(struct
                intel_engine_cs **siblings, unsigned int count)
                <br>
                       ve-&gt;base.cops = &amp;virtual_guc_context_ops;
                <br>
                       ve-&gt;base.request_alloc = guc_request_alloc;
                <br>
                +    ve-&gt;base.bump_serial = virtual_guc_bump_serial;
                <br>
                       ve-&gt;base.submit_request = guc_submit_request;
                <br>
                diff --git a/drivers/gpu/drm/i915/i915_request.c
                b/drivers/gpu/drm/i915/i915_request.c
                <br>
                index 9542a5baa45a..127d60b36422 100644
                <br>
                --- a/drivers/gpu/drm/i915/i915_request.c
                <br>
                +++ b/drivers/gpu/drm/i915/i915_request.c
                <br>
                @@ -692,7 +692,9 @@ bool __i915_request_submit(struct
                i915_request *request)
                <br>
                                        request-&gt;ring-&gt;vaddr +
                request-&gt;postfix);
                <br>
                       trace_i915_request_execute(request);
                <br>
                -    engine-&gt;serial++;
                <br>
                +    if (engine-&gt;bump_serial)
                <br>
                +        engine-&gt;bump_serial(engine);
                <br>
                +
                <br>
                       result = true;
                <br>
                       GEM_BUG_ON(test_bit(I915_FENCE_FLAG_ACTIVE,
                &amp;request-&gt;fence.flags));
                <br>
                <br>
              </blockquote>
            </blockquote>
          </blockquote>
          _______________________________________________
          <br>
          Intel-gfx mailing list
          <br>
          <a class="moz-txt-link-abbreviated" href="mailto:Intel-gfx@lists.freedesktop.org">Intel-gfx@lists.freedesktop.org</a>
          <br>
          <a class="moz-txt-link-freetext" href="https://lists.freedesktop.org/mailman/listinfo/intel-gfx">https://lists.freedesktop.org/mailman/listinfo/intel-gfx</a>
          <br>
        </blockquote>
        <br>
      </blockquote>
    </blockquote>
    <br>
  </body>
</html>

--------------B53BCBDA1B0D69846EED16DB--
