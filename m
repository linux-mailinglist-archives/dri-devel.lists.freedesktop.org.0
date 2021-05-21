Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA8538CB66
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 18:56:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B4446E4EC;
	Fri, 21 May 2021 16:56:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 063266E1B6;
 Fri, 21 May 2021 16:56:06 +0000 (UTC)
IronPort-SDR: o6vAIiJtq7lcefkblzaJCnfdx0O+O+piolovzpOk+VwgH1WLdDvc3TkfvP2V6HzgLmSmZ6Epea
 MDILq7ONqDbg==
X-IronPort-AV: E=McAfee;i="6200,9189,9991"; a="265433419"
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; d="scan'208";a="265433419"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2021 09:56:05 -0700
IronPort-SDR: BzvuDD3bXN53u8pcfATwTVAb6fIMz/oi8fEX9UGnhlaKUSOtTExpsCOj9Ibb80AAClBUeCH/47
 K426Age7Ukqg==
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; d="scan'208";a="441011261"
Received: from unknown (HELO sdutt-i7) ([10.165.21.147])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2021 09:56:05 -0700
Date: Fri, 21 May 2021 09:48:55 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [RFC 2/2] drm/doc/rfc: i915 new parallel submission
 uAPI plan
Message-ID: <20210521164853.GD22003@sdutt-i7>
References: <20210518235830.133834-1-matthew.brost@intel.com>
 <20210518235830.133834-3-matthew.brost@intel.com>
 <882a70cf-74d6-3de4-ff76-b20d3f1eea6d@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <882a70cf-74d6-3de4-ff76-b20d3f1eea6d@linux.intel.com>
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

On Fri, May 21, 2021 at 01:00:54PM +0100, Tvrtko Ursulin wrote:
> 
> On 19/05/2021 00:58, Matthew Brost wrote:
> > Add entry fpr i915 new parallel submission uAPI plan.
> > 
> > v2:
> >   (Daniel Vetter):
> >    - Expand logical order explaination
> >    - Add dummy header
> >    - Only allow N BBs in execbuf IOCTL
> >    - Configure parallel submission per slot not per gem context
> > 
> > Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > Cc: Tony Ye <tony.ye@intel.com>
> > CC: Carl Zhang <carl.zhang@intel.com>
> > Cc: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Jason Ekstrand <jason@jlekstrand.net>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   Documentation/gpu/rfc/i915_parallel_execbuf.h | 144 ++++++++++++++++++
> >   Documentation/gpu/rfc/i915_scheduler.rst      |  53 ++++++-
> >   2 files changed, 196 insertions(+), 1 deletion(-)
> >   create mode 100644 Documentation/gpu/rfc/i915_parallel_execbuf.h
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
> 
> 1)
> Expand the term slot here with "slot in the context engine map" least once
> for clarity.
> 

Sure.

> 2)
> About where execbuf will implicitly be finding batches - suggest to also
> cover first/last flag here. I know you have it in the readme but I think it
> is good if uapi header is as self-contained as possible.
>

Yep, good idea.

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
> > +/*
> > + * Default placement behvavior (currently unsupported):
> > + *
> > + * Rather than restricting parallel submission to a single class with a
> > + * logically contiguous placement (I915_PARALLEL_IMPLICT_BONDS), add a mode that
> 
> What do you mean with logically contiguous here? It sounds ambiguous versus
> logical vs "normal" engine instance numbers.
>

This is a little backwards. I think when I wrote this originally the implicit
placement comments were first. I can reword this.
 
> > + * enables parallel submission across multiple engine classes. In this case each
> > + * context's logical engine mask indicates where that context can placed. It is
> > + * implied in this mode that all contexts have mutual exclusive placement (e.g.
> > + * if one context is running CS0 no other contexts can run on CS0).
> 
> I think talk about logical context and its mask is too implementation detail
> at the uapi level. Instead I would suggest more userspace programmer centric
> description.

Ok, can you give me suggestion? Writing DOC isn't really my strength.

> 
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
> 
> Ah okay so essentially similar to what I was proposing a year ago. But then
> it is no longer "set_parallel" really. It is one slot in the engine map,
> right, with the idea to super class intel_context in the implementation?
>

Yes, it is bascially a super class intel_context. In the implementation is
parent-child with the parent having a linked list of child intel_contexts.
 
> So really a wide virtual engine, as opposed to single one. In which case I
> think it makes sense to stay close to the existing naming of the
> load_balance extension for consistency. Load_balance_wide?
> Load_balance_parallel? Multi?

I like the way is named but I also don't want to argue about this as I don't
really care. If someone else says this should be renamed, let's do it.
 
> 
> I also have to say the notation "CS0[0]" - I who know this problem space am
> finding it hard to penetrate what that actually means. (Also uppercase IMO
> makes it hard to read, but maybe it is just me.)
>

Yea, now I think about it CS0[0] is bad because of using numbers twice. How
about CSX[0] & CSY[1]? I used upper case because in the i915 all engine classes
defines are upper case but agree it might be easier to read it lower case.
 
> Looking a bit lower below, extension seems to be taking a 2d array of
> class:instance pairs, right? If so then reading these docs in order, or even
> just looking further down, I don't think that is explicitly called out
> clearly enough.
> 
> So I think a paragraph or two explaining clearly how the 2d array of engines
> corresponds to the allowed engines for full virtual engine width. Or maybe
> just a 2d diagram?
> 
>   2-wide virtual engine:
>     .engines = [
>       /* channel 0 allowed engines: */  [cs0, cs1],
>       /* channel 1 allowed engines: */  [cs0, cs1]
>      ]
> 
> Not sure if that's better.
> 

Yes, it is a 2-d array. Agree the explaination could be better.

> Also to be noted, this only allows uniform number of allowed engines per
> channel. I am not saying we need the non-uniform setup today but with bonds
> there isn't this limitation.
>

Not exactly. You could do something like this.

witdth = 2
siblings = 2
engines = CSX[0], CSX[1], CSY[0], INVALID

This would allow a placement of:

CSX[0], CSY[0]
CSX[1], CSY[0]

In this case the siblings is just a max value of each entry.

Matt
 
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
> 
> And now here you use different notation than above (CS0[0] vs CS[0]) which
> is confusing.
>

Yea, a little bit. I do explain the notation in both examples though but will
make this uniform. Now that I think about it CS0[0] is bad too because of using
numbers twice. How about CSX[0] & CSY[1]?
 
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
> > +/*
> > + * Do not allow BBs to be preempted mid BB rather insert coordinated preemption
> > + * points on all hardware contexts between each set of BBs. An example use case
> > + * of this feature is split-frame on gen11+ hardware. When using this feature a
> > + * BB must be submitted on each hardware context in the parallel gem context.
> > + * The execbuf2 IOCTL enforces the user adheres to policy.
> > + */
> Is the part about execbuf2 enforcing num_batches == context_width still
> valid, I mean is the latest proposal supporting num_batches < context_width?
> Does media needs this option?
>

With the new uAPI num_batches == context_width regardless of this flag. This is
a stale comment that needs to be removed.
 
> I would also have this flag as a separate patch because it strictly isn't
> about parallel submission per-se but a specific hw limitation on top of it.
>

Yep, I do in the actual code but this in just the RFC header. Can break it out
in the RFC header but IMO it is better to have in a single patch to review.

Matt
 
> Regards,
> 
> Tvrtko
> 
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
> >   New parallel submission uAPI
> >   ============================
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
> > 
