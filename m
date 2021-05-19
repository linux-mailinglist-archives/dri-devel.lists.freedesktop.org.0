Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E53A389490
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 19:19:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 766576EE4A;
	Wed, 19 May 2021 17:19:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FE976E226;
 Wed, 19 May 2021 17:19:11 +0000 (UTC)
IronPort-SDR: S3ww105FgO5mDB70YkxBzJSO/FIebscDmENTtAdXwFSIo1x4SXpwCzvwI8YG3BPXtpr98e9NkP
 mwCqAe5sbldQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9989"; a="262260634"
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="262260634"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2021 10:19:10 -0700
IronPort-SDR: rtCJf+98fUlUN2UF4L69myAjc1P98z1jn94UCRIyRKSlcLjCXJwVNAb4ZM5piVbYrZ3kBQJWk8
 i0csLwnBJBNA==
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="439814842"
Received: from unknown (HELO sdutt-i7) ([10.165.21.147])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2021 10:19:09 -0700
Date: Wed, 19 May 2021 10:11:57 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Intel-gfx] [RFC 2/2] drm/doc/rfc: i915 new parallel submission
 uAPI plan
Message-ID: <20210519171157.GA5202@sdutt-i7>
References: <20210518235830.133834-1-matthew.brost@intel.com>
 <20210518235830.133834-3-matthew.brost@intel.com>
 <YKTyDNyVgmR3z1H5@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YKTyDNyVgmR3z1H5@phenom.ffwll.local>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
 jason.ekstrand@intel.com, daniel.vetter@intel.com,
 mesa-dev@lists.freedesktop.org, karl@freedesktop.org, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 19, 2021 at 01:10:04PM +0200, Daniel Vetter wrote:
> On Tue, May 18, 2021 at 04:58:30PM -0700, Matthew Brost wrote:
> > Add entry fpr i915 new parallel submission uAPI plan.
> > 
> > v2:
> >  (Daniel Vetter):
> >   - Expand logical order explaination
> >   - Add dummy header
> >   - Only allow N BBs in execbuf IOCTL
> >   - Configure parallel submission per slot not per gem context
> > 
> > Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > Cc: Tony Ye <tony.ye@intel.com>
> > CC: Carl Zhang <carl.zhang@intel.com>
> > Cc: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Jason Ekstrand <jason@jlekstrand.net>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  Documentation/gpu/rfc/i915_parallel_execbuf.h | 144 ++++++++++++++++++
> >  Documentation/gpu/rfc/i915_scheduler.rst      |  53 ++++++-
> >  2 files changed, 196 insertions(+), 1 deletion(-)
> >  create mode 100644 Documentation/gpu/rfc/i915_parallel_execbuf.h
> > 
> > diff --git a/Documentation/gpu/rfc/i915_parallel_execbuf.h b/Documentation/gpu/rfc/i915_parallel_execbuf.h
> > new file mode 100644
> > index 000000000000..8c64b983ccad
> > --- /dev/null
> > +++ b/Documentation/gpu/rfc/i915_parallel_execbuf.h
> > @@ -0,0 +1,144 @@
> > +#define I915_CONTEXT_ENGINES_EXT_PARALLEL_SUBMIT 2 /* see i915_context_engines_parallel_submit */
> > +
> > +/*
> > + * i915_context_engines_parallel_submit:
> > + *
> > + * Setup a slot to allow multiple BBs to be submitted in a single execbuf IOCTL.
> > + * Those BBs will then be scheduled to run on the GPU in parallel. Multiple
> > + * hardware contexts are created internally in the i915 run these BBs. Once a
> > + * slot is configured for N BBs only N BBs can be submitted in each execbuf
> > + * IOCTL and this is implict behavior (e.g. the user doesn't tell the execbuf
> > + * IOCTL there are N BBs, the execbuf IOCTL know how many BBs there are based on
> > + * the slots configuration).
> > + *
> > + * Their are two currently defined ways to control the placement of the
> > + * hardware contexts on physical engines: default behavior (no flags) and
> > + * I915_PARALLEL_IMPLICT_BONDS (a flag). More flags may be added the in the
> > + * future as new hardware / use cases arise. Details of how to use this
> > + * interface below above the flags.
> > + *
> > + * Returns -EINVAL if hardware context placement configuration invalid or if the
> > + * placement configuration isn't supported on the platform / submission
> > + * interface.
> > + * Returns -ENODEV if extension isn't supported on the platform / submission
> > + * inteface.
> > + */
> > +struct i915_context_engines_parallel_submit {
> > +	struct i915_user_extension base;
> > +
> > +	__u16 engine_index;	/* slot for parallel engine */
> > +	__u16 width;		/* number of contexts per parallel engine */
> > +	__u16 num_siblings;	/* number of siblings per context */
> > +	__u16 mbz16;
> 
> Ok the big picture looks reasonable now, the flags still confuse me.
> 

Yea, it is a bit confusing.

> > +/*
> > + * Default placement behvavior (currently unsupported):
> > + *
> > + * Rather than restricting parallel submission to a single class with a
> > + * logically contiguous placement (I915_PARALLEL_IMPLICT_BONDS), add a mode that
> > + * enables parallel submission across multiple engine classes. In this case each
> > + * context's logical engine mask indicates where that context can placed. It is
> > + * implied in this mode that all contexts have mutual exclusive placement (e.g.
> > + * if one context is running CS0 no other contexts can run on CS0).
> > + *
> > + * Example 1 pseudo code:
> > + * CSX[Y] = engine class X, logical instance Y
> > + * INVALID = I915_ENGINE_CLASS_INVALID, I915_ENGINE_CLASS_INVALID_NONE
> > + * set_engines(INVALID)
> > + * set_parallel(engine_index=0, width=2, num_siblings=2,
> > + *		engines=CS0[0],CS0[1],CS1[0],CS1[1])
> > + *
> > + * Results in the following valid placements:
> > + * CS0[0], CS1[0]
> > + * CS0[0], CS1[1]
> > + * CS0[1], CS1[0]
> > + * CS0[1], CS1[1]
> > + *
> > + * This can also be though of as 2 virtual engines:
> > + * VE[0] = CS0[0], CS0[1]
> > + * VE[1] = CS1[0], CS1[1]
> > + *
> > + * Example 2 pseudo code:
> > + * CS[X] = generic engine of same class, logical instance X
> > + * INVALID = I915_ENGINE_CLASS_INVALID, I915_ENGINE_CLASS_INVALID_NONE
> > + * set_engines(INVALID)
> > + * set_parallel(engine_index=0, width=2, num_siblings=3,
> > + *		engines=CS[0],CS[1],CS[2],CS[0],CS[1],CS[2])
> > + *
> > + * Results in the following valid placements:
> > + * CS[0], CS[1]
> > + * CS[0], CS[2]
> > + * CS[1], CS[0]
> > + * CS[1], CS[2]
> > + * CS[2], CS[0]
> > + * CS[2], CS[1]
> > + *
> > + *
> > + * This can also be though of as 2 virtual engines:
> > + * VE[0] = CS[0], CS[1], CS[2]
> > + * VE[1] = CS[0], CS[1], CS[2]
> > +
> > + * This enables a use case where all engines are created equally, we don't care
> > + * where they are scheduled, we just want a certain number of resources, for
> > + * those resources to be scheduled in parallel, and possibly across multiple
> > + * engine classes.
> > + */
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
> 

High level the flags came out of internal discussions how this interface
should look. The default placement behavior is theoretically possible
with execlists but has no use cases. The GuC supports / current use
cases are a subset of what is possible with I915_PARALLEL_IMPLICT_BONDS.

Argued about for months and this is where we landed. At the end of the
day I think we needed to show that this interface supports more
placement rules than what the GuC supports / current use cases to future
proof this interface.

For what is it worth it seems kinda backwards that we landed on the
default behavior not being supported in our current stack / HW.

> > +
> > +/*
> > + * I915_PARALLEL_IMPLICT_BONDS - Create implict bonds between each context.
> > + * Each context must have the same number sibling and bonds are implictly create
> > + * of the siblings.
> > + *
> > + * All of the below examples are in logical space.
> > + *
> > + * Example 1 pseudo code:
> > + * CS[X] = generic engine of same class, logical instance X
> > + * INVALID = I915_ENGINE_CLASS_INVALID, I915_ENGINE_CLASS_INVALID_NONE
> > + * set_engines(INVALID)
> > + * set_parallel(engine_index=0, width=2, num_siblings=1,
> > + *		engines=CS[0],CS[1], flags=I915_PARALLEL_IMPLICT_BONDS)
> > + *
> > + * Results in the following valid placements:
> > + * CS[0], CS[1]
> > + *
> > + * Example 2 pseudo code:
> > + * CS[X] = generic engine of same class, logical instance X
> > + * INVALID = I915_ENGINE_CLASS_INVALID, I915_ENGINE_CLASS_INVALID_NONE
> > + * set_engines(INVALID)
> > + * set_parallel(engine_index=0, width=2, num_siblings=2,
> > + *		engines=CS[0],CS[2],CS[1],CS[3], flags=I915_PARALLEL_IMPLICT_BONDS)
> > + *
> > + * Results in the following valid placements:
> > + * CS[0], CS[1]
> > + * CS[2], CS[3]
> > + *
> > + * This can also be though of as 2 virtual engines:
> > + * VE[0] = CS[0], CS[2]
> > + * VE[1] = CS[1], CS[3]
> > + *
> > + * This enables a use case where all engines are not equal and certain placement
> > + * rules are required (i.e. split-frame requires all contexts to be placed in a
> > + * logically contiguous order on the VCS engines on gen11+ platforms). This use
> > + * case (logically contiguous placement, within a single engine class) is
> > + * supported when using GuC submission. Execlist mode could support all possible
> > + * bonding configurations but currently doesn't support this extension.
> > + */
> > +#define I915_PARALLEL_IMPLICT_BONDS			(1<<0)
> 
> Does this map to intel_context_set_nopreempt(), so we could implement it
> also in execlist?
>

intel_context_set_nopreempt is preempt is part of how this would be
implemented for execlists. For GuC submission there is a algorithm
between the i915 and GuC that inserts same preemption points between
each set of N batches. I believe the rules are if context 1 can
preempted the rest of the contexts (2 - N) can safely be preempted. A go
/ join algorithm, implemented with semaphores, around the batches
makes sure the i915 adheres to these rules.
 
> Also is this just an artifact of the implementation, or is this somehow
> required functionality for userspace, i.e. the workload fails if e.g. GuC
> decides to preempt all LRC of a parallel virtual engine? Of course just
> preempting one is a bit a bug (but execlist I think happily does that).
>

I think it is part of the implementation / HW limitations. Basically if
N batches are running in parallel if one of the batches gets preempted
it can hang all the other batches even if it gets restarted. Again the
idea behind this is only preempt any of these contexts between each set
of N batches. The GuC has no concept of batches only contexts hence the
aforementioned algorithm to insert same preemption points between each
set of batches.

Matt
 
> Cheers, Daniel
> 
> > +/*
> > + * Do not allow BBs to be preempted mid BB rather insert coordinated preemption
> > + * points on all hardware contexts between each set of BBs. An example use case
> > + * of this feature is split-frame on gen11+ hardware. When using this feature a
> > + * BB must be submitted on each hardware context in the parallel gem context.
> > + * The execbuf2 IOCTL enforces the user adheres to policy.
> > + */
> > +#define I915_PARALLEL_NO_PREEMPT_MID_BATCH		(1<<1)
> > +#define __I915_PARALLEL_UNKNOWN_FLAGS	(-(I915_PARALLEL_NO_PREEMPT_MID_BATCH << 1))
> > +	__u64 flags;		/* all undefined flags must be zero */
> > +	__u64 mbz64[3];		/* reserved for future use; must be zero */
> > +
> > +	/*
> > +	 * width (i) * num_siblings (j) in length
> > +	 * index = j + i * num_siblings
> > +	 */
> > +	struct i915_engine_class_instance engines[0];
> > +} __attribute__ ((packed));
> > +
> > diff --git a/Documentation/gpu/rfc/i915_scheduler.rst b/Documentation/gpu/rfc/i915_scheduler.rst
> > index 7faa46cde088..64c539486ee4 100644
> > --- a/Documentation/gpu/rfc/i915_scheduler.rst
> > +++ b/Documentation/gpu/rfc/i915_scheduler.rst
> > @@ -82,4 +82,55 @@ https://spec.oneapi.com/level-zero/latest/core/api.html#ze-command-queue-priorit
> >  
> >  New parallel submission uAPI
> >  ============================
> > -Details to come in a following patch.
> > +The existing bonding uAPI is completely broken with GuC submission because
> > +whether a submission is a single context submit or parallel submit isn't known
> > +until execbuf time activated via the I915_SUBMIT_FENCE. To submit multiple
> > +contexts in parallel with the GuC the context must be explictly registered with
> > +N contexts and all N contexts must be submitted in a single command to the GuC.
> > +These interfaces doesn't support dynamically changing between N contexts as the
> > +bonding uAPI does. Hence the need for a new parallel submission interface. Also
> > +the legacy bonding uAPI is quite confusing and not intuitive at all.
> > +
> > +The new parallel submission uAPI consists of 3 parts:
> > +
> > +* Export engines logical mapping
> > +* A 'set_parallel' extension to configure contexts for parallel
> > +  submission
> > +* Extend execbuf2 IOCTL to support submitting N BBs in a single IOCTL
> > +
> > +Export engines logical mapping
> > +------------------------------
> > +Certain use cases require BBs to be placed on engine instances in logical order
> > +(e.g. split-frame on gen11+). The logical mapping of engine instances can change
> > +based on fusing. Rather than making UMDs be aware of fusing, simply expose the
> > +logical mapping with the existing query engine info IOCTL. Also the GuC
> > +submission interface currently only supports submitting multiple contexts to
> > +engines in logical order which is a new requirement compared to execlists.
> > +Lastly, all current platforms have at most 2 instances and the logical order is
> > +the same a uABI order. This will change on platforms with more than 2 instances.
> > +
> > +A single bit will be added to drm_i915_engine_info.flags indicating that the
> > +logical instance has been returned and a new field,
> > +drm_i915_engine_info.logical_instance, returns the logical instance.
> > +
> > +A 'set_parallel' extension to configure contexts for parallel submission
> > +------------------------------------------------------------------------
> > +The 'set_parallel' extension configures a slot for parallel submission of N BBs.
> > +It is setup step that should be called before using any of the contexts. See
> > +I915_CONTEXT_ENGINES_EXT_LOAD_BALANCE or I915_CONTEXT_ENGINES_EXT_BOND for
> > +similar existing examples. Once a slot is configured for parallel submission the
> > +execbuf2 IOCTL can be called submiting N BBs in a single IOCTL. Initially only
> > +support GuC submission. Execlist support can be added later if needed.
> > +
> > +Add I915_CONTEXT_ENGINES_EXT_PARALLEL_SUBMIT and
> > +i915_context_engines_parallel_submit to the uAPI to implement this extension.
> > +
> > +Extend execbuf2 IOCTL to support submitting N BBs in a single IOCTL
> > +-------------------------------------------------------------------
> > +Contexts that have been configured with the 'set_parallel' extension are allowed
> > +to submit N BBs in a single execbuf2 IOCTL. The BBs are either the last N
> > +objects in the drm_i915_gem_exec_object2 list or the first N if
> > +I915_EXEC_BATCH_FIRST is set. The number of BBs is implict based on the slot
> > +submitted and how it has been configured by 'set_parallel' or other extensions.
> > +No uAPI changes in the execbuf IOCTL but worth mentioning the new behavior of
> > +the IOCTL.
> > -- 
> > 2.28.0
> > 
> > _______________________________________________
> > Intel-gfx mailing list
> > Intel-gfx@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
