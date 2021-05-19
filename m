Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B13E389440
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 18:58:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0D1C6EE42;
	Wed, 19 May 2021 16:58:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69A886EE41;
 Wed, 19 May 2021 16:58:36 +0000 (UTC)
IronPort-SDR: wk07bX0DPrlB8RuIrEoCCvMroIzPitqmcjDwF4686ocZO5RrszJzhH7/vE7+MQZP5pm+Uk77PY
 hxBM4xhrHJqg==
X-IronPort-AV: E=McAfee;i="6200,9189,9989"; a="200718408"
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="200718408"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2021 09:58:35 -0700
IronPort-SDR: 8pUyxRqzJaNu0HR471A8vmXbvqew0uf6TM0yZeeVGzT2dfDIy2DmgH5Tx6Ovn3fD/P+hEzQmCY
 rkNj8kO/Zs5g==
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="542708719"
Received: from unknown (HELO sdutt-i7) ([10.165.21.147])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2021 09:58:35 -0700
Date: Wed, 19 May 2021 09:51:22 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [Mesa-dev] [RFC 2/2] drm/doc/rfc: i915 new parallel submission
 uAPI plan
Message-ID: <20210519165121.GA2585@sdutt-i7>
References: <20210518235830.133834-1-matthew.brost@intel.com>
 <20210518235830.133834-3-matthew.brost@intel.com>
 <5b8ab744-4906-945d-cbca-1ce4c40f2fcb@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5b8ab744-4906-945d-cbca-1ce4c40f2fcb@gmail.com>
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
Cc: tony.ye@intel.com, tvrtko.ursulin@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 jason.ekstrand@intel.com, michal.mrozek@intel.com,
 daniele.ceraolospurio@intel.com, jon.bloomfield@intel.com,
 daniel.vetter@intel.com, mesa-dev@lists.freedesktop.org, karl@freedesktop.org,
 christian.koenig@amd.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 19, 2021 at 01:45:39PM +0200, Christian König wrote:
> Oh, yeah we call that gang submit on the AMD side.
> 
> Had already some internal discussions how to implement this, but so far
> couldn't figure out how to cleanly introduce that into the DRM scheduler.
> 
> Can you briefly describe in a few words how that is supposed to work on the
> Intel side?
> 

Sure, I've done a quick PoC internally and have been able to hook this
into the DRM scheduler.

Basically each BB still maps to a single job as each job is somewhat
unique (e.g. each job has its own ring, lrc, seqno, etc...). However all
the jobs configured to run in parallel map to a single sched_entity
which maintains the order each job was generated from the execbuf IOCTL
(1 - N). When the backend receives jobs 1 to N - 1 it basically just
updates some internal state. When the backend sees job N (last job) it
actually does the submit for jobs 1 - N which with GuC submission is a
simple command moving the LRC tail of the N jobs.

Daniel has suggested that we create a single job for the NN BBs but that
would be huge rework to the internals of the i915 and likely won't
happen by the time this code first lands.

Also worth noting one way a job isn't really a treated individually is
the excl slot with dma-resv. In that case we create a composite fence of
all jobs (dma_fence_array).

Matt

> Thanks,
> Christian.
> 
> Am 19.05.21 um 01:58 schrieb Matthew Brost:
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
> 
