Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CDA39319F
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 17:01:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0DD76F400;
	Thu, 27 May 2021 15:01:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83A966E7DD;
 Thu, 27 May 2021 15:01:24 +0000 (UTC)
IronPort-SDR: QhwtIUGWJK6VH+SmWp8oQHQUaAiFQi1Z8J8KlKl7+K6gwJpKyEcQxEUKeoddH8w63XOStof59+
 xpfDxS+3DiKQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9996"; a="266641664"
X-IronPort-AV: E=Sophos;i="5.82,334,1613462400"; d="scan'208";a="266641664"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2021 08:01:13 -0700
IronPort-SDR: VaMqt0T4ci2OaEAWwgOHGv9Wte7r1lt1cswe3MBKnddHYjQqCO8tVe69gXJfZGElFPsm9iB3Ma
 Gr/OKYKIgCDw==
X-IronPort-AV: E=Sophos;i="5.82,334,1613462400"; d="scan'208";a="547941040"
Received: from amoses-mobl1.ger.corp.intel.com (HELO [10.213.211.53])
 ([10.213.211.53])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2021 08:01:10 -0700
Subject: Re: [Intel-gfx] [RFC PATCH 2/2] drm/doc/rfc: i915 new parallel
 submission uAPI plan
To: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20210526233357.9165-1-matthew.brost@intel.com>
 <20210526233357.9165-3-matthew.brost@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <5d46472d-3dc2-0484-5a1f-4b36eecc11f6@linux.intel.com>
Date: Thu, 27 May 2021 16:01:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210526233357.9165-3-matthew.brost@intel.com>
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
Cc: jason.ekstrand@intel.com, mesa-dev@lists.freedesktop.org,
 christian.koenig@amd.com, daniel.vetter@intel.com, carl.zhang@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 27/05/2021 00:33, Matthew Brost wrote:
> Add entry for i915 new parallel submission uAPI plan.
> 
> v2:
>   (Daniel Vetter):
>    - Expand logical order explaination
>    - Add dummy header
>    - Only allow N BBs in execbuf IOCTL
>    - Configure parallel submission per slot not per gem context
> v3:
>   (Marcin Ślusarz):
>    - Lot's of typos / bad english fixed
>   (Tvrtko Ursulin):
>    - Consistent pseudo code, clean up wording in descriptions
> 
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Tony Ye <tony.ye@intel.com>
> CC: Carl Zhang <carl.zhang@intel.com>
> Cc: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Jason Ekstrand <jason@jlekstrand.net>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   Documentation/gpu/rfc/i915_parallel_execbuf.h | 145 ++++++++++++++++++
>   Documentation/gpu/rfc/i915_scheduler.rst      |  55 ++++++-
>   2 files changed, 198 insertions(+), 2 deletions(-)
>   create mode 100644 Documentation/gpu/rfc/i915_parallel_execbuf.h
> 
> diff --git a/Documentation/gpu/rfc/i915_parallel_execbuf.h b/Documentation/gpu/rfc/i915_parallel_execbuf.h
> new file mode 100644
> index 000000000000..20de206e3ab4
> --- /dev/null
> +++ b/Documentation/gpu/rfc/i915_parallel_execbuf.h
> @@ -0,0 +1,145 @@
> +#define I915_CONTEXT_ENGINES_EXT_PARALLEL_SUBMIT 2 /* see i915_context_engines_parallel_submit */
> +
> +/*
> + * i915_context_engines_parallel_submit:
> + *
> + * Setup a slot in the context engine map to allow multiple BBs to be submitted
> + * in a single execbuf IOCTL. Those BBs will then be scheduled to run on the GPU
> + * in parallel. Multiple hardware contexts are created internally in the i915
> + * run these BBs. Once a slot is configured for N BBs only N BBs can be
> + * submitted in each execbuf IOCTL and this is implicit behavior e.g. The user

"i.e. the user" I think.

> + * doesn't tell the execbuf IOCTL there are N BBs, the execbuf IOCTL know how

knows

> + * many BBs there are based on the slots configuration. The N BBs are the last N

"slot's" ? Or maybe better fully qualified as "engine map slot"?

> + * buffer objects for first N if I915_EXEC_BATCH_FIRST is set.

s/for/or/

> + *
> + * There are two currently defined ways to control the placement of the
> + * hardware contexts on physical engines: default behavior (no flags) and
> + * I915_PARALLEL_IMPLICIT_BONDS (a flag). More flags may be added the in the
> + * future as new hardware / use cases arise. Details of how to use this
> + * interface above the flags field in this structure.

"are above", "can be found above" ?

> + *
> + * Returns -EINVAL if hardware context placement configuration is invalid or if
> + * the placement configuration isn't supported on the platform / submission
> + * interface.
> + * Returns -ENODEV if extension isn't supported on the platform / submission
> + * inteface.
> + */
> +struct i915_context_engines_parallel_submit {
> +	struct i915_user_extension base;
> +
> +	__u16 engine_index;	/* slot for parallel engine */
> +	__u16 width;		/* number of contexts per parallel engine */
> +	__u16 num_siblings;	/* number of siblings per context */
> +	__u16 mbz16;
> +/*
> + * Default placement behavior (currently unsupported):
> + *
> + * Allow BBs to be placed on any available engine instance. In this case each
> + * context's engine mask indicates where that context can be placed. It is

Context does not have an engine mask in the uapi so I'd explain this in 
terms of list of engines.

> + * implied in this mode that all contexts have mutual exclusive placement.

mutually

> + * e.g. If one context is running CSX[0] no other contexts can run on CSX[0]).

s/If/if, I think.

I don't find CSX[0] readable nor I think introducing csx as a term is 
desirable. Lowercase cs<n> (like cs0) is what I would prefer for both 
readability and likely cs = command streamer could be more obvious what 
it is. Naming like rcs0 (prefix-cs-number) and similar are exposed in 
kernel logs and error state while csx[] (cs-suffix-number) are not at all.

In placement examples I would refrain from using any prefixes/suffixes 
to designate engine classes and just say cs0/cs1, mentioning the 
same/mixed class requirement separately in the notes if applicable.

> + *
> + * Example 1 pseudo code:
> + * CSX,Y[N] = generic engine class X or Y, logical instance N
> + * INVALID = I915_ENGINE_CLASS_INVALID, I915_ENGINE_CLASS_INVALID_NONE
> + * set_engines(INVALID)
> + * set_parallel(engine_index=0, width=2, num_siblings=2,
> + *		engines=CSX[0],CSX[1],CSY[0],CSY[1])
> + *
> + * Results in the following valid placements:
> + * CSX[0], CSY[0]
> + * CSX[0], CSY[1]
> + * CSX[1], CSY[0]
> + * CSX[1], CSY[1]
> + *
> + * This can also be thought of as 2 virtual engines described by 2-D array in
> + * the engines the field:

One the too many.

> + * VE[0] = CSX[0], CSX[1]
> + * VE[1] = CSY[0], CSY[1]
> + *
> + * Example 2 pseudo code:
> + * CSX[Y] = generic engine of same class X, logical instance N
> + * INVALID = I915_ENGINE_CLASS_INVALID, I915_ENGINE_CLASS_INVALID_NONE
> + * set_engines(INVALID)
> + * set_parallel(engine_index=0, width=2, num_siblings=3,
> + *		engines=CSX[0],CSX[1],CSX[2],CSX[0],CSX[1],CSX[2])
> + *
> + * Results in the following valid placements:
> + * CSX[0], CSX[1]
> + * CSX[0], CSX[2]
> + * CSX[1], CSX[0]
> + * CSX[1], CSX[2]
> + * CSX[2], CSX[0]
> + * CSX[2], CSX[1]
> + *
> + * This can also be thought of as 2 virtual engines described by 2-D array in
> + * the engines the field:
> + * VE[0] = CSX[0], CSX[1], CSX[2]
> + * VE[1] = CSX[0], CSX[1], CSX[2]
> +
> + * This enables a use case where all engines are created equally, we don't care
> + * where they are scheduled, we just want a certain number of resources, for
> + * those resources to be scheduled in parallel, and possibly across multiple
> + * engine classes.
> + */
> +
> +/*
> + * I915_PARALLEL_IMPLICIT_BONDS - Create implicit bonds between each context.
> + * Each context must have the same number of sibling and bonds are implicitly

siblings

> + * created between each set of siblings.
> + *
> + * Example 1 pseudo code:
> + * CSX[N] = generic engine of same class X, logical instance N
> + * INVALID = I915_ENGINE_CLASS_INVALID, I915_ENGINE_CLASS_INVALID_NONE
> + * set_engines(INVALID)
> + * set_parallel(engine_index=0, width=2, num_siblings=1,
> + *		engines=CSX[0],CSX[1], flags=I915_PARALLEL_IMPLICIT_BONDS)
> + *
> + * Results in the following valid placements:
> + * CSX[0], CSX[1]
> + *
> + * Example 2 pseudo code:
> + * CSX[N] = generic engine of same class X, logical instance N
> + * INVALID = I915_ENGINE_CLASS_INVALID, I915_ENGINE_CLASS_INVALID_NONE
> + * set_engines(INVALID)
> + * set_parallel(engine_index=0, width=2, num_siblings=2,
> + *		engines=CSX[0],CSX[2],CSX[1],CSX[3],
> + *		flags=I915_PARALLEL_IMPLICIT_BONDS)
> + *
> + * Results in the following valid placements:
> + * CSX[0], CSX[1]
> + * CSX[2], CSX[3]
> + *
> + * This can also be thought of as 2 virtual engines described by 2-D array in
> + * the engines the field with bonds placed between each index of the virtual
> + * engines. e.g. CSX[0] is bonded to CSX[1], CSX[2] is bonded to CSX[3].
> + * VE[0] = CSX[0], CSX[2]
> + * VE[1] = CSX[1], CSX[3]
> + *
> + * This enables a use case where all engines are not equal and certain placement
> + * rules are required (i.e. split-frame requires all contexts to be placed in a
> + * logically contiguous order on the VCS engines on gen11+ platforms). This use
> + * case (logically contiguous placement, within a single engine class) is

Again, I wouldn't use the term logically contiguous here because logical 
instance numbering isn't used in class:instance addressing as used in 
engine maps.

> + * supported when using GuC submission. Execlist mode could support all possible
> + * bonding configurations but currently doesn't support this extension.
> + */
> +#define I915_PARALLEL_IMPLICIT_BONDS			(1 << 0)
> +/*
> + * Do not allow BBs to be preempted mid BB rather insert coordinated preemption
> + * points on all hardware contexts between each set of BBs. An example use case
> + * of this feature is split-frame on gen11+ hardware.
> + */
> +#define I915_PARALLEL_NO_PREEMPT_MID_BATCH		(1 << 1)
> +#define __I915_PARALLEL_UNKNOWN_FLAGS	(-(I915_PARALLEL_NO_PREEMPT_MID_BATCH << 1))
> +	__u64 flags;		/* all undefined flags must be zero */
> +	__u64 mbz64[3];		/* reserved for future use; must be zero */
> +
> +	/*
> +	 * 2-D array of engines
> +	 *
> +	 * width (i) * num_siblings (j) in length
> +	 * index = j + i * num_siblings

engines[][] = {
   /* Channel 0 possible engines: */ { cs0, cs2 },
   /* Channel 1 possible engines: */ { cs1, cs3 },
};

Would this be accurate and descriptive on top of the formula? Although I 
am not too happy with the term channel without first explaining how we 
are going to call parallel streams within a wide context.

> +	 */
> +	struct i915_engine_class_instance engines[0];
> +} __attribute__ ((packed));
> +
> diff --git a/Documentation/gpu/rfc/i915_scheduler.rst b/Documentation/gpu/rfc/i915_scheduler.rst
> index 7faa46cde088..0254c04d34be 100644
> --- a/Documentation/gpu/rfc/i915_scheduler.rst
> +++ b/Documentation/gpu/rfc/i915_scheduler.rst
> @@ -23,7 +23,7 @@ i915 with the DRM scheduler is:
>   	  severe design issues in general, which is why we want to retire it no
>   	  matter what
>   	* New uAPI adds I915_CONTEXT_ENGINES_EXT_PARALLEL context setup step
> -	  which configures a slot with N contexts
> +	  which configures a slot with N contexts
>   	* After I915_CONTEXT_ENGINES_EXT_PARALLEL a user can submit N batches to
>   	  a slot in a single execbuf IOCTL and the batches run on the GPU in
>   	  paralllel
> @@ -82,4 +82,55 @@ https://spec.oneapi.com/level-zero/latest/core/api.html#ze-command-queue-priorit
>   
>   New parallel submission uAPI
>   ============================
> -Details to come in a following patch.
> +The existing bonding uAPI is completely broken with GuC submission because
> +whether a submission is a single context submit or parallel submit isn't known
> +until execbuf time activated via the I915_SUBMIT_FENCE. To submit multiple
> +contexts in parallel with the GuC the context must be explicitly registered with
> +N contexts and all N contexts must be submitted in a single command to the GuC.
> +The GuC interfaces do not support dynamically changing between N contexts as the
> +bonding uAPI does. Hence the need for a new parallel submission interface. Also
> +the legacy bonding uAPI is quite confusing and not intuitive at all.

It's not that confusing really. If we had added multi-batch execbuf from 
the start no one would be talking about bonds today.

> +
> +The new parallel submission uAPI consists of 3 parts:
> +
> +* Export engines logical mapping
> +* A 'set_parallel' extension to configure contexts for parallel
> +  submission
> +* Extend execbuf2 IOCTL to support submitting N BBs in a single IOCTL
> +
> +Export engines logical mapping
> +------------------------------
> +Certain use cases require BBs to be placed on engine instances in logical order
> +(e.g. split-frame on gen11+). The logical mapping of engine instances can change
> +based on fusing. Rather than making UMDs be aware of fusing, simply expose the
> +logical mapping with the existing query engine info IOCTL. Also the GuC
> +submission interface currently only supports submitting multiple contexts to
> +engines in logical order which is a new requirement compared to execlists.
> +Lastly, all current platforms have at most 2 engine instances and the logical
> +order is the same as uAPI order. This will change on platforms with more than 2
> +engine instances.
> +
> +A single bit will be added to drm_i915_engine_info.flags indicating that the
> +logical instance has been returned and a new field,
> +drm_i915_engine_info.logical_instance, returns the logical instance.
> +
> +A 'set_parallel' extension to configure contexts for parallel submission
> +------------------------------------------------------------------------
> +The 'set_parallel' extension configures a slot for parallel submission of N BBs.
> +It is setup step that should be called before using any of the contexts. See

a setup step

s/any of the context/the context/ ?

> +I915_CONTEXT_ENGINES_EXT_LOAD_BALANCE or I915_CONTEXT_ENGINES_EXT_BOND for
> +similar existing examples. Once a slot is configured for parallel submission the
> +execbuf2 IOCTL can be called submitting N BBs in a single IOCTL. Initially only
> +support GuC submission. Execlist support can be added later if needed.

supports

execlists

> +
> +Add I915_CONTEXT_ENGINES_EXT_PARALLEL_SUBMIT and
> +i915_context_engines_parallel_submit to the uAPI to implement this extension.
> +
> +Extend execbuf2 IOCTL to support submitting N BBs in a single IOCTL
> +-------------------------------------------------------------------
> +Contexts that have been configured with the 'set_parallel' extension are allowed

s/are allowed/can only/

> +to submit N BBs in a single execbuf2 IOCTL. The BBs are either the last N
> +objects in the drm_i915_gem_exec_object2 list or the first N if
> +I915_EXEC_BATCH_FIRST is set. The number of BBs is implict based on the slot

implicit

> +submitted and how it has been configured by 'set_parallel' or other extensions.
> +No uAPI changes are required to execbuf2 IOCTL.
> 

Regards,

Tvrtko
