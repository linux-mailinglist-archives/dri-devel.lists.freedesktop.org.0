Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A595A450295
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 11:34:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2A4A6EB8D;
	Mon, 15 Nov 2021 10:34:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E87196EC3A;
 Mon, 15 Nov 2021 10:34:28 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10168"; a="233662691"
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; d="scan'208";a="233662691"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 02:34:27 -0800
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; d="scan'208";a="453777302"
Received: from rmcgrady-mobl.ger.corp.intel.com (HELO [10.213.210.19])
 ([10.213.210.19])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 02:34:25 -0800
Subject: Re: [Intel-gfx] [PATCH] drm/i915/execlists: Weak parallel submission
 support for execlists
To: Matthew Brost <matthew.brost@intel.com>
References: <20211020214751.34602-1-matthew.brost@intel.com>
 <c9a1cd3e-dc3a-2b2b-ee37-73c0c50f3f60@intel.com>
 <20211027191732.GA16188@jons-linux-dev-box>
 <af017ae0-e826-7b6a-03d7-0e422030da02@intel.com>
 <20211027201001.GA16265@jons-linux-dev-box>
 <a86e7ea7-3c70-2540-9538-44adc3d12e52@linux.intel.com>
 <20211111164946.GA875@jons-linux-dev-box>
 <9f67ba17-63ae-9cde-dd22-dc0fe93e6f6f@linux.intel.com>
 <20211112175913.GA16631@jons-linux-dev-box>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <0f48dc5a-861b-6c3d-b406-411dc0ef70b4@linux.intel.com>
Date: Mon, 15 Nov 2021 10:34:23 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211112175913.GA16631@jons-linux-dev-box>
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
Cc: intel-gfx@lists.freedesktop.org, daniele.ceraolospurio@intel.com,
 dri-devel@lists.freedesktop.org, John Harrison <john.c.harrison@intel.com>,
 tvrtko.ursulin@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 12/11/2021 17:59, Matthew Brost wrote:
> On Fri, Nov 12, 2021 at 02:13:50PM +0000, Tvrtko Ursulin wrote:
>>
>> On 11/11/2021 16:49, Matthew Brost wrote:
>>> On Mon, Nov 01, 2021 at 10:35:09AM +0000, Tvrtko Ursulin wrote:
>>>>
>>>> On 27/10/2021 21:10, Matthew Brost wrote:
>>>>> On Wed, Oct 27, 2021 at 01:04:49PM -0700, John Harrison wrote:
>>>>>> On 10/27/2021 12:17, Matthew Brost wrote:
>>>>>>> On Tue, Oct 26, 2021 at 02:58:00PM -0700, John Harrison wrote:
>>>>>>>> On 10/20/2021 14:47, Matthew Brost wrote:
>>>>>>>>> A weak implementation of parallel submission (multi-bb execbuf IOCTL) for
>>>>>>>>> execlists. Doing as little as possible to support this interface for
>>>>>>>>> execlists - basically just passing submit fences between each request
>>>>>>>>> generated and virtual engines are not allowed. This is on par with what
>>>>>>>>> is there for the existing (hopefully soon deprecated) bonding interface.
>>>>>>>>>
>>>>>>>>> We perma-pin these execlists contexts to align with GuC implementation.
>>>>>>>>>
>>>>>>>>> v2:
>>>>>>>>>       (John Harrison)
>>>>>>>>>        - Drop siblings array as num_siblings must be 1
>>>>>>>>>
>>>>>>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>>>>>>> ---
>>>>>>>>>       drivers/gpu/drm/i915/gem/i915_gem_context.c   | 10 +++--
>>>>>>>>>       drivers/gpu/drm/i915/gt/intel_context.c       |  4 +-
>>>>>>>>>       .../drm/i915/gt/intel_execlists_submission.c  | 44 ++++++++++++++++++-
>>>>>>>>>       drivers/gpu/drm/i915/gt/intel_lrc.c           |  2 +
>>>>>>>>>       .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  2 -
>>>>>>>>>       5 files changed, 52 insertions(+), 10 deletions(-)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
>>>>>>>>> index fb33d0322960..35e87a7d0ea9 100644
>>>>>>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
>>>>>>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
>>>>>>>>> @@ -570,10 +570,6 @@ set_proto_ctx_engines_parallel_submit(struct i915_user_extension __user *base,
>>>>>>>>>       	struct intel_engine_cs **siblings = NULL;
>>>>>>>>>       	intel_engine_mask_t prev_mask;
>>>>>>>>> -	/* FIXME: This is NIY for execlists */
>>>>>>>>> -	if (!(intel_uc_uses_guc_submission(&i915->gt.uc)))
>>>>>>>>> -		return -ENODEV;
>>>>>>>>> -
>>>>>>>>>       	if (get_user(slot, &ext->engine_index))
>>>>>>>>>       		return -EFAULT;
>>>>>>>>> @@ -583,6 +579,12 @@ set_proto_ctx_engines_parallel_submit(struct i915_user_extension __user *base,
>>>>>>>>>       	if (get_user(num_siblings, &ext->num_siblings))
>>>>>>>>>       		return -EFAULT;
>>>>>>>>> +	if (!intel_uc_uses_guc_submission(&i915->gt.uc) && num_siblings != 1) {
>>>>>>>>> +		drm_dbg(&i915->drm, "Only 1 sibling (%d) supported in non-GuC mode\n",
>>>>>>>>> +			num_siblings);
>>>>>>>>> +		return -EINVAL;
>>>>>>>>> +	}
>>>>>>>>> +
>>>>>>>>>       	if (slot >= set->num_engines) {
>>>>>>>>>       		drm_dbg(&i915->drm, "Invalid placement value, %d >= %d\n",
>>>>>>>>>       			slot, set->num_engines);
>>>>>>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
>>>>>>>>> index 5634d14052bc..1bec92e1d8e6 100644
>>>>>>>>> --- a/drivers/gpu/drm/i915/gt/intel_context.c
>>>>>>>>> +++ b/drivers/gpu/drm/i915/gt/intel_context.c
>>>>>>>>> @@ -79,7 +79,8 @@ static int intel_context_active_acquire(struct intel_context *ce)
>>>>>>>>>       	__i915_active_acquire(&ce->active);
>>>>>>>>> -	if (intel_context_is_barrier(ce) || intel_engine_uses_guc(ce->engine))
>>>>>>>>> +	if (intel_context_is_barrier(ce) || intel_engine_uses_guc(ce->engine) ||
>>>>>>>>> +	    intel_context_is_parallel(ce))
>>>>>>>>>       		return 0;
>>>>>>>>>       	/* Preallocate tracking nodes */
>>>>>>>>> @@ -563,7 +564,6 @@ void intel_context_bind_parent_child(struct intel_context *parent,
>>>>>>>>>       	 * Callers responsibility to validate that this function is used
>>>>>>>>>       	 * correctly but we use GEM_BUG_ON here ensure that they do.
>>>>>>>>>       	 */
>>>>>>>>> -	GEM_BUG_ON(!intel_engine_uses_guc(parent->engine));
>>>>>>>>>       	GEM_BUG_ON(intel_context_is_pinned(parent));
>>>>>>>>>       	GEM_BUG_ON(intel_context_is_child(parent));
>>>>>>>>>       	GEM_BUG_ON(intel_context_is_pinned(child));
>>>>>>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
>>>>>>>>> index bedb80057046..2865b422300d 100644
>>>>>>>>> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
>>>>>>>>> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
>>>>>>>>> @@ -927,8 +927,7 @@ static void execlists_submit_ports(struct intel_engine_cs *engine)
>>>>>>>>>       static bool ctx_single_port_submission(const struct intel_context *ce)
>>>>>>>>>       {
>>>>>>>>> -	return (IS_ENABLED(CONFIG_DRM_I915_GVT) &&
>>>>>>>>> -		intel_context_force_single_submission(ce));
>>>>>>>>> +	return intel_context_force_single_submission(ce);
>>>>>>>> I think this is actually going to break GVT.
>>>>>>>>
>>>>>>>> Not so much this change here but the whole use of single submission outside
>>>>>>>> of GVT. It looks like the GVT driver overloads the single submission flag to
>>>>>>>> tag requests that it owns. If we start using that flag elsewhere when GVT is
>>>>>>>> active, I think that will cause much confusion within the GVT code.
>>>>>>>>
>>>>>>>> The correct fix would be to create a new flag just for GVT usage alongside
>>>>>>>> the single submission one. GVT would then set both but only check for its
>>>>>>>> own private flag. The parallel code would obviously only set the existing
>>>>>>>> single submission flag.
>>>>>>>>
>>>>>>> Ok, see below.
>>>>>>>
>>>>>>>>>       }
>>>>>>>>>       static bool can_merge_ctx(const struct intel_context *prev,
>>>>>>>>> @@ -2598,6 +2597,46 @@ static void execlists_context_cancel_request(struct intel_context *ce,
>>>>>>>>>       				      current->comm);
>>>>>>>>>       }
>>>>>>>>> +static struct intel_context *
>>>>>>>>> +execlists_create_parallel(struct intel_engine_cs **engines,
>>>>>>>>> +			  unsigned int num_siblings,
>>>>>>>>> +			  unsigned int width)
>>>>>>>>> +{
>>>>>>>>> +	struct intel_context *parent = NULL, *ce, *err;
>>>>>>>>> +	int i;
>>>>>>>>> +
>>>>>>>>> +	GEM_BUG_ON(num_siblings != 1);
>>>>>>>>> +
>>>>>>>>> +	for (i = 0; i < width; ++i) {
>>>>>>>>> +		ce = intel_context_create(engines[i]);
>>>>>>>>> +		if (!ce) {
>>>>>>>>> +			err = ERR_PTR(-ENOMEM);
>>>>>>>>> +			goto unwind;
>>>>>>>>> +		}
>>>>>>>>> +
>>>>>>>>> +		if (i == 0)
>>>>>>>>> +			parent = ce;
>>>>>>>>> +		else
>>>>>>>>> +			intel_context_bind_parent_child(parent, ce);
>>>>>>>>> +	}
>>>>>>>>> +
>>>>>>>>> +	parent->parallel.fence_context = dma_fence_context_alloc(1);
>>>>>>>>> +
>>>>>>>>> +	intel_context_set_nopreempt(parent);
>>>>>>>>> +	intel_context_set_single_submission(parent);
>>>>>>>> Can you explain the need for setting single submission?
>>>>>>>>
>>>>>>> I think I can actually pull this out. This was needed when I tried to
>>>>>>> truely implement a guarante that all the parallel requests would be
>>>>>>> running simultaneously. Couldn't ever to get that working because of the
>>>>>>> mess that is the execlists scheduler - a simple wait at the head of
>>>>>>> queue until everyone joined just blew up for whatever reason. I don't
>>>>>>> believe this servers a purpose anymore, so I'll just drop it.
>>>>>>>
>>>>>>> Matt
>>>>>> Is that not going to be a problem? I thought concurrent execution was a
>>>>>> fundamental requirement?
>>>>>>
>>>>>
>>>>> I don't think so. See the commit message. This implmementation is on par
>>>>> with the bonding interface - there is no guarantee whatsoever that with
>>>>> the bonding interface bonded requests actually run at the same time. It
>>>>> says hopefully these submissions run together. That's what I do in this
>>>>> patch too for execlists, hence the 'weak' clause in the commit message.
>>>>
>>>> With the new uapi definition implying a stricter guarantee - why not have
>>>> this patch use special bb semaphore pre/post-ambles so scheduling behaviour
>>>> is closer between the two backends?
>>>>
>>>
>>> We could do that in a follow up if needed, as this bare minimum to get
>>> this uAPI working. The real fix would be update the execlists scheduler
>>> to be able to do a join of parallel requests and then schedule them
>>> together. Should be fairly simple, tried to do this, but the execlists
>>> scheduler is such a mess doing something simple is near impossible. IMO
>>> there is little point wasting time on a legacy submission interface.
>>> This implementation works as well as the old uAPI, let's get this in and
>>> move on.
>>
>> Bashing aside, what downside do you see in just doing what I suggested right
>> now? Code is there and all so it is a simple matter of adding a conditional
>> somewhere to use it. And it would make the behaviour between the two
>> backends closer. So it sounds like a no brainer to me. Or I am missing
>> something?
> 
> For parallel submission, user batches should be inserting semaphore to
> ensure that they are running together - the kernel inserting them is
> redundant. The reason we do this for GuC submission is for safe
> preemption, in execlists we just don't allow preemption while the
> requests are running. As I said, the correct solution is update the
> execlists scheduler to actually run these requests in parallel. Tried
> that but proved difficult and landed on this patch. If someone wants to
> fix the the execlists scheduler in a follow up they are welcome to but
> in the meantime what I have in place is on par with the bonded
> interface. I see no reason why this patch can't be merged.

Nowhere I wrote this patch cannot be merged. I was asking why you don't 
add another one on top.

I'd recommend adding mention of no preempt behaviour to the commit 
messasge. And sentinel as well. As the commit already talks about 
limitations "doing as little" as possible, it makes sense to list all 
limitations and design choices.

Regards,

Tvrtko
