Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6AB3A2C80
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 15:08:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8B206E84E;
	Thu, 10 Jun 2021 13:08:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA3FE6E84E;
 Thu, 10 Jun 2021 13:08:15 +0000 (UTC)
IronPort-SDR: E+3TqlJLhaWmAM1DzLXh+6E140ApVwnaDMbeHRckckW96LkIzytqSGWxelTmcv+UgvEa2xz1rN
 C1OIUIz1B6aQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10011"; a="192405513"
X-IronPort-AV: E=Sophos;i="5.83,263,1616482800"; d="scan'208";a="192405513"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2021 06:08:14 -0700
IronPort-SDR: M92i3q6wu+AEiimedRl6u2xRm7iD/20I8pzS4r3gTQHb/qkqqZM5vauCUkFIw3HfaTazqFvLwG
 hzz3aEv1hNtQ==
X-IronPort-AV: E=Sophos;i="5.83,263,1616482800"; d="scan'208";a="448710251"
Received: from rabolton-mobl.ger.corp.intel.com (HELO [10.213.197.140])
 ([10.213.197.140])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2021 06:08:11 -0700
Subject: Re: [Intel-gfx] [PATCH 0/5] dma-fence, i915: Stop allowing
 SLAB_TYPESAFE_BY_RCU for dma_fence
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20210609212959.471209-1-jason@jlekstrand.net>
 <ae289388-911f-2928-d695-050863ee1007@linux.intel.com>
 <f9be43e3-4107-3742-a11b-8021b2c19e32@amd.com>
 <CAKMK7uFMEdFjUSphcyxuKMW8HfLOWQAE2iw-Fei+SRTDwUbRdQ@mail.gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <829bf753-35b3-d306-3749-f4d8c3ead948@linux.intel.com>
Date: Thu, 10 Jun 2021 14:07:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAKMK7uFMEdFjUSphcyxuKMW8HfLOWQAE2iw-Fei+SRTDwUbRdQ@mail.gmail.com>
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
Cc: Dave Airlie <airlied@redhat.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>, Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 10/06/2021 12:29, Daniel Vetter wrote:
> On Thu, Jun 10, 2021 at 11:39 AM Christian König
> <christian.koenig@amd.com> wrote:
>> Am 10.06.21 um 11:29 schrieb Tvrtko Ursulin:
>>> On 09/06/2021 22:29, Jason Ekstrand wrote:
>>>> Ever since 0eafec6d3244 ("drm/i915: Enable lockless lookup of request
>>>> tracking via RCU"), the i915 driver has used SLAB_TYPESAFE_BY_RCU (it
>>>> was called SLAB_DESTROY_BY_RCU at the time) in order to allow RCU on
>>>> i915_request.  As nifty as SLAB_TYPESAFE_BY_RCU may be, it comes with
>>>> some serious disclaimers.  In particular, objects can get recycled while
>>>> RCU readers are still in-flight.  This can be ok if everyone who touches
>>>> these objects knows about the disclaimers and is careful. However,
>>>> because we've chosen to use SLAB_TYPESAFE_BY_RCU for i915_request and
>>>> because i915_request contains a dma_fence, we've leaked
>>>> SLAB_TYPESAFE_BY_RCU and its whole pile of disclaimers to every driver
>>>> in the kernel which may consume a dma_fence.
>>>
>>> I don't think the part about leaking is true...
>>>
>>>> We've tried to keep it somewhat contained by doing most of the hard work
>>>> to prevent access of recycled objects via dma_fence_get_rcu_safe().
>>>> However, a quick grep of kernel sources says that, of the 30 instances
>>>> of dma_fence_get_rcu*, only 11 of them use dma_fence_get_rcu_safe().
>>>> It's likely there bear traps in DRM and related subsystems just waiting
>>>> for someone to accidentally step in them.
>>>
>>> ...because dma_fence_get_rcu_safe apears to be about whether the
>>> *pointer* to the fence itself is rcu protected, not about the fence
>>> object itself.
>>
>> Yes, exactly that.
> 
> We do leak, and badly. Any __rcu protected fence pointer where a
> shared fence could show up is affected. And the point of dma_fence is
> that they're shareable, and we're inventing ever more ways to do so
> (sync_file, drm_syncobj, implicit fencing maybe soon with
> import/export ioctl on top, in/out fences in CS ioctl, atomic ioctl,
> ...).
> 
> So without a full audit anything that uses the following pattern is
> probably busted:
> 
> rcu_read_lock();
> fence = rcu_dereference();
> fence = dma_fence_get_rcu();
> rcu_read_lock();

What do you mean by _probably_ busted? This should either fail in 
kref_get_unless_zero for freed fences or it grabs the wrong fence which 
dma_fence_get_rcu_safe() is supposed to detect.

> /* use the fence now that we acquired a full reference */
> 
> And I don't mean "you might wait a bit too much" busted, but "this can
> lead to loops in the dma_fence dependency chain, resulting in
> deadlocks" kind of busted. What's worse, the standard rcu lockless

I don't have the story on dma_fence dependency chain deadlocks. Maybe 
put a few more words about that in the cover letter since it would be 
good to understand the real motivation behind the change.

Are there even bugs about deadlocks which should be mentioned?

Or why is not the act of fence being signaled removing the fence from 
the rcu protected containers, preventing the stale pointer problem?

> access pattern is also busted completely:
> 
> rcu_read_lock();
> fence = rcu_derefence();
> /* locklessly check the state of fence */
> rcu_read_unlock();

My understanding is that lockless, eg. no reference taken, access can 
access a different fence or a freed fence, but won't cause use after 
free when under the rcu lock.

As long as dma fence users are going through the API entry points 
individual drivers should be able to handle things correctly.

> because once you have TYPESAFE_BY_RCU rcu_read_lock doesn't prevent a
> use-after-free anymore. The only thing it guarantees is that your
> fence pointer keeps pointing at either freed memory, or a fence, but

Again, I think it can't be freed memory inside the rcu lock section. It 
can only be re-allocated or unused object.

Overall it looks like there is some complication involving the 
interaction between rcu protected pointers and SLAB_TYPESAFE_BY_RCU, 
rather than a simple statement i915 leaked/broke something for other 
drivers. And challenge of auditing drivers to make all use 
dma_fence_get_rcu_safe() when dealing with such storage.

To be clear I don't mind simplifications in principle as long as the 
problem statement is accurate.

And some benchmarks definitely need to be ran here. At least that was 
the usual thing in the past when such large changes were being proposed.

Regards,

Tvrtko

> nothing else. You have to wrap your rcu_derefence and code into a
> seqlock of some kind, either a real one like dma_resv, or an
> open-coded one like dma_fence_get_rcu_safe uses. And yes the latter is
> a specialized seqlock, except it fails to properly document in
> comments where all the required barriers are.
> 
> tldr; all the code using dma_fence_get_rcu needs to be assumed to be broken.
> 
> Heck this is fragile and tricky enough that i915 shot its own leg off
> routinely (there's a bugfix floating around just now), so not even
> internally we're very good at getting this right.
> 
>>> If one has a stable pointer to a fence dma_fence_get_rcu is I think
>>> enough to deal with SLAB_TYPESAFE_BY_RCU used by i915_request (as dma
>>> fence is a base object there). Unless you found a bug in rq field
>>> recycling. But access to the dma fence is all tightly controlled so I
>>> don't get what leaks.
>>>
>>>> This patch series stops us using SLAB_TYPESAFE_BY_RCU for i915_request
>>>> and, instead, does an RCU-safe slab free via rcu_call().  This should
>>>> let us keep most of the perf benefits of slab allocation while avoiding
>>>> the bear traps inherent in SLAB_TYPESAFE_BY_RCU.  It then removes
>>>> support
>>>> for SLAB_TYPESAFE_BY_RCU from dma_fence entirely.
>>>
>>> According to the rationale behind SLAB_TYPESAFE_BY_RCU traditional RCU
>>> freeing can be a lot more costly so I think we need a clear
>>> justification on why this change is being considered.
>>
>> The problem is that SLAB_TYPESAFE_BY_RCU requires that we use a sequence
>> counter to make sure that we don't grab the reference to a reallocated
>> dma_fence.
>>
>> Updating the sequence counter every time we add a fence now means two
>> additions writes and one additional barrier for an extremely hot path.
>> The extra overhead of RCU freeing is completely negligible compared to that.
>>
>> The good news is that I think if we are just a bit more clever about our
>> handle we can both avoid the sequence counter and keep
>> SLAB_TYPESAFE_BY_RCU around.
> 
> You still need a seqlock, or something else that's serving as your
> seqlock. dma_fence_list behind a single __rcu protected pointer, with
> all subsequent fence pointers _not_ being rcu protected (i.e. full
> reference, on every change we allocate might work. Which is a very
> funny way of implementing something like a seqlock.
> 
> And that only covers dma_resv, you _have_ to do this _everywhere_ in
> every driver. Except if you can proof that your __rcu fence pointer
> only ever points at your own driver's fences.
> 
> So unless you're volunteering to audit all the drivers, and constantly
> re-audit them (because rcu only guaranteeing type-safety but not
> actually preventing use-after-free is very unusual in the kernel) just
> fixing dma_resv doesn't solve the problem here at all.
> 
>> But this needs more code cleanup and abstracting the sequence counter
>> usage in a macro.
> 
> The other thing is that this doesn't even make sense for i915 anymore.
> The solution to the "userspace wants to submit bazillion requests"
> problem is direct userspace submit. Current hw doesn't have userspace
> ringbuffer, but we have a pretty clever trick in the works to make
> this possible with current hw, essentially by submitting a CS that
> loops on itself, and then inserting batches into this "ring" by
> latching a conditional branch in this CS. It's not pretty, but it gets
> the job done and outright removes the need for plaid mode throughput
> of i915_request dma fences.
> -Daniel
> 
>>
>> Regards,
>> Christian.
>>
>>
>>>
>>> Regards,
>>>
>>> Tvrtko
>>>
>>>>
>>>> Note: The last patch is labled DONOTMERGE.  This was at Daniel Vetter's
>>>> request as we may want to let this bake for a couple releases before we
>>>> rip out dma_fence_get_rcu_safe entirely.
>>>>
>>>> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
>>>> Cc: Jon Bloomfield <jon.bloomfield@intel.com>
>>>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>>>> Cc: Christian König <christian.koenig@amd.com>
>>>> Cc: Dave Airlie <airlied@redhat.com>
>>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>>
>>>> Jason Ekstrand (5):
>>>>     drm/i915: Move intel_engine_free_request_pool to i915_request.c
>>>>     drm/i915: Use a simpler scheme for caching i915_request
>>>>     drm/i915: Stop using SLAB_TYPESAFE_BY_RCU for i915_request
>>>>     dma-buf: Stop using SLAB_TYPESAFE_BY_RCU in selftests
>>>>     DONOTMERGE: dma-buf: Get rid of dma_fence_get_rcu_safe
>>>>
>>>>    drivers/dma-buf/dma-fence-chain.c         |   8 +-
>>>>    drivers/dma-buf/dma-resv.c                |   4 +-
>>>>    drivers/dma-buf/st-dma-fence-chain.c      |  24 +---
>>>>    drivers/dma-buf/st-dma-fence.c            |  27 +---
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c |   4 +-
>>>>    drivers/gpu/drm/i915/gt/intel_engine_cs.c |   8 --
>>>>    drivers/gpu/drm/i915/i915_active.h        |   4 +-
>>>>    drivers/gpu/drm/i915/i915_request.c       | 147 ++++++++++++----------
>>>>    drivers/gpu/drm/i915/i915_request.h       |   2 -
>>>>    drivers/gpu/drm/i915/i915_vma.c           |   4 +-
>>>>    include/drm/drm_syncobj.h                 |   4 +-
>>>>    include/linux/dma-fence.h                 |  50 --------
>>>>    include/linux/dma-resv.h                  |   4 +-
>>>>    13 files changed, 110 insertions(+), 180 deletions(-)
>>>>
>>
> 
> 
