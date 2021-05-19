Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C897389295
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 17:29:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F8496EDFB;
	Wed, 19 May 2021 15:29:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50A5A6EDFA;
 Wed, 19 May 2021 15:29:09 +0000 (UTC)
IronPort-SDR: OGNGvMWVz8kg+g2J1mHhk98R4OS92jRyAYW6E5C5fDwi3BK4eUhjJMkFWhxZJbD7h0SIr8N1Fe
 X/Eq+lhNrj6A==
X-IronPort-AV: E=McAfee;i="6200,9189,9989"; a="262231211"
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="262231211"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2021 08:29:05 -0700
IronPort-SDR: xi5tKRMTWMScEBHL/XE+juLMcbWneofo30DcBwagc01nAoSVhe6zeKuZBb2qrZ7wOQO/M9/v69
 NhiwcWmZ2ctw==
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="544597716"
Received: from leiderma-mobl1.ger.corp.intel.com (HELO [10.213.194.66])
 ([10.213.194.66])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2021 08:29:03 -0700
Subject: Re: [Intel-gfx] [RFC 2/2] drm/doc/rfc: i915 new parallel submission
 uAPI plan
To: Daniel Vetter <daniel@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>
References: <20210518235830.133834-1-matthew.brost@intel.com>
 <20210518235830.133834-3-matthew.brost@intel.com>
 <YKTyDNyVgmR3z1H5@phenom.ffwll.local>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <025e94ed-7d37-c6ed-241d-8ae60d03ade6@linux.intel.com>
Date: Wed, 19 May 2021 16:29:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YKTyDNyVgmR3z1H5@phenom.ffwll.local>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 jason.ekstrand@intel.com, mesa-dev@lists.freedesktop.org,
 daniel.vetter@intel.com, karl@freedesktop.org, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 19/05/2021 12:10, Daniel Vetter wrote:
> On Tue, May 18, 2021 at 04:58:30PM -0700, Matthew Brost wrote:
>> Add entry fpr i915 new parallel submission uAPI plan.
>>
>> v2:
>>   (Daniel Vetter):
>>    - Expand logical order explaination
>>    - Add dummy header
>>    - Only allow N BBs in execbuf IOCTL
>>    - Configure parallel submission per slot not per gem context
>>
>> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Cc: Tony Ye <tony.ye@intel.com>
>> CC: Carl Zhang <carl.zhang@intel.com>
>> Cc: Daniel Vetter <daniel.vetter@intel.com>
>> Cc: Jason Ekstrand <jason@jlekstrand.net>
>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>> ---
>>   Documentation/gpu/rfc/i915_parallel_execbuf.h | 144 ++++++++++++++++++
>>   Documentation/gpu/rfc/i915_scheduler.rst      |  53 ++++++-
>>   2 files changed, 196 insertions(+), 1 deletion(-)
>>   create mode 100644 Documentation/gpu/rfc/i915_parallel_execbuf.h
>>
>> diff --git a/Documentation/gpu/rfc/i915_parallel_execbuf.h b/Documentation/gpu/rfc/i915_parallel_execbuf.h
>> new file mode 100644
>> index 000000000000..8c64b983ccad
>> --- /dev/null
>> +++ b/Documentation/gpu/rfc/i915_parallel_execbuf.h
>> @@ -0,0 +1,144 @@
>> +#define I915_CONTEXT_ENGINES_EXT_PARALLEL_SUBMIT 2 /* see i915_context_engines_parallel_submit */
>> +
>> +/*
>> + * i915_context_engines_parallel_submit:
>> + *
>> + * Setup a slot to allow multiple BBs to be submitted in a single execbuf IOCTL.
>> + * Those BBs will then be scheduled to run on the GPU in parallel. Multiple
>> + * hardware contexts are created internally in the i915 run these BBs. Once a
>> + * slot is configured for N BBs only N BBs can be submitted in each execbuf
>> + * IOCTL and this is implict behavior (e.g. the user doesn't tell the execbuf
>> + * IOCTL there are N BBs, the execbuf IOCTL know how many BBs there are based on
>> + * the slots configuration).
>> + *
>> + * Their are two currently defined ways to control the placement of the
>> + * hardware contexts on physical engines: default behavior (no flags) and
>> + * I915_PARALLEL_IMPLICT_BONDS (a flag). More flags may be added the in the
>> + * future as new hardware / use cases arise. Details of how to use this
>> + * interface below above the flags.
>> + *
>> + * Returns -EINVAL if hardware context placement configuration invalid or if the
>> + * placement configuration isn't supported on the platform / submission
>> + * interface.
>> + * Returns -ENODEV if extension isn't supported on the platform / submission
>> + * inteface.
>> + */
>> +struct i915_context_engines_parallel_submit {
>> +	struct i915_user_extension base;
>> +
>> +	__u16 engine_index;	/* slot for parallel engine */
>> +	__u16 width;		/* number of contexts per parallel engine */
>> +	__u16 num_siblings;	/* number of siblings per context */
>> +	__u16 mbz16;
> 
> Ok the big picture looks reasonable now, the flags still confuse me.
> 
>> +/*
>> + * Default placement behvavior (currently unsupported):
>> + *
>> + * Rather than restricting parallel submission to a single class with a
>> + * logically contiguous placement (I915_PARALLEL_IMPLICT_BONDS), add a mode that
>> + * enables parallel submission across multiple engine classes. In this case each
>> + * context's logical engine mask indicates where that context can placed. It is
>> + * implied in this mode that all contexts have mutual exclusive placement (e.g.
>> + * if one context is running CS0 no other contexts can run on CS0).
>> + *
>> + * Example 1 pseudo code:
>> + * CSX[Y] = engine class X, logical instance Y
>> + * INVALID = I915_ENGINE_CLASS_INVALID, I915_ENGINE_CLASS_INVALID_NONE
>> + * set_engines(INVALID)
>> + * set_parallel(engine_index=0, width=2, num_siblings=2,
>> + *		engines=CS0[0],CS0[1],CS1[0],CS1[1])
>> + *
>> + * Results in the following valid placements:
>> + * CS0[0], CS1[0]
>> + * CS0[0], CS1[1]
>> + * CS0[1], CS1[0]
>> + * CS0[1], CS1[1]
>> + *
>> + * This can also be though of as 2 virtual engines:
>> + * VE[0] = CS0[0], CS0[1]
>> + * VE[1] = CS1[0], CS1[1]
>> + *
>> + * Example 2 pseudo code:
>> + * CS[X] = generic engine of same class, logical instance X
>> + * INVALID = I915_ENGINE_CLASS_INVALID, I915_ENGINE_CLASS_INVALID_NONE
>> + * set_engines(INVALID)
>> + * set_parallel(engine_index=0, width=2, num_siblings=3,
>> + *		engines=CS[0],CS[1],CS[2],CS[0],CS[1],CS[2])
>> + *
>> + * Results in the following valid placements:
>> + * CS[0], CS[1]
>> + * CS[0], CS[2]
>> + * CS[1], CS[0]
>> + * CS[1], CS[2]
>> + * CS[2], CS[0]
>> + * CS[2], CS[1]
>> + *
>> + *
>> + * This can also be though of as 2 virtual engines:
>> + * VE[0] = CS[0], CS[1], CS[2]
>> + * VE[1] = CS[0], CS[1], CS[2]
>> +
>> + * This enables a use case where all engines are created equally, we don't care
>> + * where they are scheduled, we just want a certain number of resources, for
>> + * those resources to be scheduled in parallel, and possibly across multiple
>> + * engine classes.
>> + */
> 
> So I don't really get what this does compared to setting the flag below.
> Is this just about running the batchbuffers the wrong way round, i.e. if
> you have (simplest case)
> 
> width=2, num_sibglings=1, engines=CS[0], CS[1]
> 
> Then both
> CS[0], CS[1]
> and
> CS[1], CS[0]
> are possible options for running 2 batches? Iow, the backend is allowed to
> run the batchbuffers the wrong way round, which gains us nothing, since we
> assume the batches take equally long and engines interchangeable. There is
> no scheduling scenario where this additional flexibility can help.
> 
> Also we don't have flags to select the only available and then specify an
> entire pipe dream about what the non-flag mode does, without an
> implementation. What is this about?
> 
> If it's just "because bonded allowed this" then I think we should just
> unceremonously ditch this. Bummer for the nice kerenldoc you wrote, but
> welp.

At the risk of repeating some of the information:

Flexibility helps to avoid hardcoding the current limitations of media 
fixed function pipe into the uapi.

Today's media: Run on N consecutive instances.

Tomorrow's media: Run on N consecutive logical instances.

(Note that the engine addressing we expose today is class:instance based 
which is not this new logical instance name space. It's something else. 
Point of engine discovery and flexible bond configuration was to punt 
these questions to userspace.)

Tomorrow's compute: Run on any N instances.

Tomorrow's + 1 media: Who knows.

Consider the scheduling advantage when the "consecutiveness" is not 
hardcoded in the uapi:

cs0: busy with 1 wide context
cs1: idle
cs2: busy with 1 wide context
cs3: idle

2-wide job with hardcoded consecutive engines now can't run without 
scheduler needing to re-balance.

2-wide job with any-2 can run fine.

(Also keep in mind that all 1-wide, 2-wide and 4-wide contexts can fight 
for four physical engines.)

This was an argument for not hardcoding "consecutiveness". Then if we 
think about cs0 + cs1 vs cs1 + cs0 ordering inversion, for today's media 
there is indeed no benefit to allow the inversion (and it cannot be 
allowed).

But we can expand the argument into parallel submissions which 
absolutely have to run in parallel otherwise the GPU hangs, or at least 
progress stalls, versus the ones which benefit from running in parallel 
but do not strictly depend on it.

In the latter case allowing inversions of the set is a benefit. 
Scheduler can now put partial jobs on the GPU without having to idle, or 
wait for idle, on the other engines.

Overall, bonds weren't the mistake, as much I am sure there is a nice 
camp of people who hate them pasionately. (Hey I hate relocations 
because I can never remember what is offset and what is delta. Or maybe 
that is just because I don't use them enough.) Yes they can be hard to 
understand at first but they were not the mistake. Mistake was the 
disconnect between atomic parallel submission and separate execbufs tied 
with a submit fence which then takes double functionality.

Anyway, all that we need to do today and in the future can be expressed 
with bonds. All that was needed for the GuC backend is to reject the 
bond configuration GuC firmware cannot do. Cannot do today. Can't stress 
this "today" enough. Because we almost got an update of the GuC firmware 
already last year or so which would have broken this assumption for 
compute and made it more flexible.

Which is why I was pushing to make the set_parallel extension more 
flexible than just today's media use cases. Or you may end up adding 
more uapi year after year. Why if bonds can do it all? Why even if bonds 
are not even needed for generic parallel submit in proposed GuC 
multi-LRC changes for compute? They are only needed for media. So all 
the new uapi needed to add is a proper atomic parallel submit.

Literally my proposal was just to add a single flag of how wide the 
context is plus multi-bb execbuf extension and that's all that would be 
needed.

There is a document somewhere which lists all possible usecases that I 
suggest is looked at if the uapi is getting re-designed.

Regards,

Tvrtko

>> +
>> +/*
>> + * I915_PARALLEL_IMPLICT_BONDS - Create implict bonds between each context.
>> + * Each context must have the same number sibling and bonds are implictly create
>> + * of the siblings.
>> + *
>> + * All of the below examples are in logical space.
>> + *
>> + * Example 1 pseudo code:
>> + * CS[X] = generic engine of same class, logical instance X
>> + * INVALID = I915_ENGINE_CLASS_INVALID, I915_ENGINE_CLASS_INVALID_NONE
>> + * set_engines(INVALID)
>> + * set_parallel(engine_index=0, width=2, num_siblings=1,
>> + *		engines=CS[0],CS[1], flags=I915_PARALLEL_IMPLICT_BONDS)
>> + *
>> + * Results in the following valid placements:
>> + * CS[0], CS[1]
>> + *
>> + * Example 2 pseudo code:
>> + * CS[X] = generic engine of same class, logical instance X
>> + * INVALID = I915_ENGINE_CLASS_INVALID, I915_ENGINE_CLASS_INVALID_NONE
>> + * set_engines(INVALID)
>> + * set_parallel(engine_index=0, width=2, num_siblings=2,
>> + *		engines=CS[0],CS[2],CS[1],CS[3], flags=I915_PARALLEL_IMPLICT_BONDS)
>> + *
>> + * Results in the following valid placements:
>> + * CS[0], CS[1]
>> + * CS[2], CS[3]
>> + *
>> + * This can also be though of as 2 virtual engines:
>> + * VE[0] = CS[0], CS[2]
>> + * VE[1] = CS[1], CS[3]
>> + *
>> + * This enables a use case where all engines are not equal and certain placement
>> + * rules are required (i.e. split-frame requires all contexts to be placed in a
>> + * logically contiguous order on the VCS engines on gen11+ platforms). This use
>> + * case (logically contiguous placement, within a single engine class) is
>> + * supported when using GuC submission. Execlist mode could support all possible
>> + * bonding configurations but currently doesn't support this extension.
>> + */
>> +#define I915_PARALLEL_IMPLICT_BONDS			(1<<0)
> 
> Does this map to intel_context_set_nopreempt(), so we could implement it
> also in execlist?
> 
> Also is this just an artifact of the implementation, or is this somehow
> required functionality for userspace, i.e. the workload fails if e.g. GuC
> decides to preempt all LRC of a parallel virtual engine? Of course just
> preempting one is a bit a bug (but execlist I think happily does that).
> 
> Cheers, Daniel
> 
>> +/*
>> + * Do not allow BBs to be preempted mid BB rather insert coordinated preemption
>> + * points on all hardware contexts between each set of BBs. An example use case
>> + * of this feature is split-frame on gen11+ hardware. When using this feature a
>> + * BB must be submitted on each hardware context in the parallel gem context.
>> + * The execbuf2 IOCTL enforces the user adheres to policy.
>> + */
>> +#define I915_PARALLEL_NO_PREEMPT_MID_BATCH		(1<<1)
>> +#define __I915_PARALLEL_UNKNOWN_FLAGS	(-(I915_PARALLEL_NO_PREEMPT_MID_BATCH << 1))
>> +	__u64 flags;		/* all undefined flags must be zero */
>> +	__u64 mbz64[3];		/* reserved for future use; must be zero */
>> +
>> +	/*
>> +	 * width (i) * num_siblings (j) in length
>> +	 * index = j + i * num_siblings
>> +	 */
>> +	struct i915_engine_class_instance engines[0];
>> +} __attribute__ ((packed));
>> +
>> diff --git a/Documentation/gpu/rfc/i915_scheduler.rst b/Documentation/gpu/rfc/i915_scheduler.rst
>> index 7faa46cde088..64c539486ee4 100644
>> --- a/Documentation/gpu/rfc/i915_scheduler.rst
>> +++ b/Documentation/gpu/rfc/i915_scheduler.rst
>> @@ -82,4 +82,55 @@ https://spec.oneapi.com/level-zero/latest/core/api.html#ze-command-queue-priorit
>>   
>>   New parallel submission uAPI
>>   ============================
>> -Details to come in a following patch.
>> +The existing bonding uAPI is completely broken with GuC submission because
>> +whether a submission is a single context submit or parallel submit isn't known
>> +until execbuf time activated via the I915_SUBMIT_FENCE. To submit multiple
>> +contexts in parallel with the GuC the context must be explictly registered with
>> +N contexts and all N contexts must be submitted in a single command to the GuC.
>> +These interfaces doesn't support dynamically changing between N contexts as the
>> +bonding uAPI does. Hence the need for a new parallel submission interface. Also
>> +the legacy bonding uAPI is quite confusing and not intuitive at all.
>> +
>> +The new parallel submission uAPI consists of 3 parts:
>> +
>> +* Export engines logical mapping
>> +* A 'set_parallel' extension to configure contexts for parallel
>> +  submission
>> +* Extend execbuf2 IOCTL to support submitting N BBs in a single IOCTL
>> +
>> +Export engines logical mapping
>> +------------------------------
>> +Certain use cases require BBs to be placed on engine instances in logical order
>> +(e.g. split-frame on gen11+). The logical mapping of engine instances can change
>> +based on fusing. Rather than making UMDs be aware of fusing, simply expose the
>> +logical mapping with the existing query engine info IOCTL. Also the GuC
>> +submission interface currently only supports submitting multiple contexts to
>> +engines in logical order which is a new requirement compared to execlists.
>> +Lastly, all current platforms have at most 2 instances and the logical order is
>> +the same a uABI order. This will change on platforms with more than 2 instances.
>> +
>> +A single bit will be added to drm_i915_engine_info.flags indicating that the
>> +logical instance has been returned and a new field,
>> +drm_i915_engine_info.logical_instance, returns the logical instance.
>> +
>> +A 'set_parallel' extension to configure contexts for parallel submission
>> +------------------------------------------------------------------------
>> +The 'set_parallel' extension configures a slot for parallel submission of N BBs.
>> +It is setup step that should be called before using any of the contexts. See
>> +I915_CONTEXT_ENGINES_EXT_LOAD_BALANCE or I915_CONTEXT_ENGINES_EXT_BOND for
>> +similar existing examples. Once a slot is configured for parallel submission the
>> +execbuf2 IOCTL can be called submiting N BBs in a single IOCTL. Initially only
>> +support GuC submission. Execlist support can be added later if needed.
>> +
>> +Add I915_CONTEXT_ENGINES_EXT_PARALLEL_SUBMIT and
>> +i915_context_engines_parallel_submit to the uAPI to implement this extension.
>> +
>> +Extend execbuf2 IOCTL to support submitting N BBs in a single IOCTL
>> +-------------------------------------------------------------------
>> +Contexts that have been configured with the 'set_parallel' extension are allowed
>> +to submit N BBs in a single execbuf2 IOCTL. The BBs are either the last N
>> +objects in the drm_i915_gem_exec_object2 list or the first N if
>> +I915_EXEC_BATCH_FIRST is set. The number of BBs is implict based on the slot
>> +submitted and how it has been configured by 'set_parallel' or other extensions.
>> +No uAPI changes in the execbuf IOCTL but worth mentioning the new behavior of
>> +the IOCTL.
>> -- 
>> 2.28.0
>>
>> _______________________________________________
>> Intel-gfx mailing list
>> Intel-gfx@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
> 
