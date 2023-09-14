Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 545FE7A01E3
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 12:45:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63C7010E564;
	Thu, 14 Sep 2023 10:45:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C417910E559;
 Thu, 14 Sep 2023 10:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694688351; x=1726224351;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=eDCacQltUL4sO4Sp2uHePK7e2K1JX4DVEGzqG99Q/fM=;
 b=lB5eq9Ii/KYiyPcKFujK0Lj1sb9Cf69POA6fbp60J2hDxLoiruEFJ1b/
 M3mqR7wf8wtKnToNIdDIQ8ZEwWTYsY0QthP+t8HoF5dH/ZAeNcq7FQKKw
 9Qzfn2Ya+L50CFMs1VmwL5f7w0gbPTYdq/opHkPpbVAKSVeECXLx3fq4D
 H9PudbFc9cBqzL8yrI8SLWMDCNF7RlHQ4Unq4GxPKbPr/SQiORVZdZRh9
 XvNz6D/8JnPbZmYs4Jc40HYm4cF45w4T/z0/2IPIM5HYSZYMOyyAdioTY
 YtsovKrVLNASNHPIOy2lKGEaeHbFZM1hUZDLe4v3w7FiBeOzcv4mBg1gL g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="369188499"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; d="scan'208";a="369188499"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 03:45:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="744491507"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; d="scan'208";a="744491507"
Received: from skallurr-mobl1.ger.corp.intel.com (HELO [10.249.254.49])
 ([10.249.254.49])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 03:45:47 -0700
Message-ID: <c32bb890-b06e-6b5d-1ff8-b67f6c9d92a6@linux.intel.com>
Date: Thu, 14 Sep 2023 12:45:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH drm-misc-next v3 6/7] drm/gpuvm: generalize
 dma_resv/extobj handling and GEM validation
Content-Language: en-US
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20230909153125.30032-1-dakr@redhat.com>
 <20230909153125.30032-7-dakr@redhat.com>
 <a9ef04d2-2525-65c0-2eda-45ca9a95a3a0@linux.intel.com>
 <20230913090311.5eeb026a@collabora.com>
 <CAPM=9tyf4m6gtUQ0BCraf0gB06_pxXV8gpQQsvWjeJnczmJkQQ@mail.gmail.com>
 <20230913091918.62c06a30@collabora.com>
 <df85257a-02ed-4869-2421-0039a9c97db5@linux.intel.com>
 <20230913133318.15edec7c@collabora.com>
 <6f4c047d-0e6d-c45b-3092-cd0bc84849dc@linux.intel.com>
 <20230914102010.628ea823@collabora.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230914102010.628ea823@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: matthew.brost@intel.com, sarah.walker@imgtec.com,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>,
 donald.robson@imgtec.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 9/14/23 10:20, Boris Brezillon wrote:
> On Wed, 13 Sep 2023 15:22:56 +0200
> Thomas Hellström <thomas.hellstrom@linux.intel.com> wrote:
>
>> On 9/13/23 13:33, Boris Brezillon wrote:
>>> On Wed, 13 Sep 2023 12:39:01 +0200
>>> Thomas Hellström <thomas.hellstrom@linux.intel.com> wrote:
>>>   
>>>> Hi,
>>>>
>>>> On 9/13/23 09:19, Boris Brezillon wrote:
>>>>> On Wed, 13 Sep 2023 17:05:42 +1000
>>>>> Dave Airlie <airlied@gmail.com> wrote:
>>>>>      
>>>>>> On Wed, 13 Sept 2023 at 17:03, Boris Brezillon
>>>>>> <boris.brezillon@collabora.com> wrote:
>>>>>>> On Tue, 12 Sep 2023 18:20:32 +0200
>>>>>>> Thomas Hellström <thomas.hellstrom@linux.intel.com> wrote:
>>>>>>>         
>>>>>>>>> +/**
>>>>>>>>> + * get_next_vm_bo_from_list() - get the next vm_bo element
>>>>>>>>> + * @__gpuvm: The GPU VM
>>>>>>>>> + * @__list_name: The name of the list we're iterating on
>>>>>>>>> + * @__local_list: A pointer to the local list used to store already iterated items
>>>>>>>>> + * @__prev_vm_bo: The previous element we got from drm_gpuvm_get_next_cached_vm_bo()
>>>>>>>>> + *
>>>>>>>>> + * This helper is here to provide lockless list iteration. Lockless as in, the
>>>>>>>>> + * iterator releases the lock immediately after picking the first element from
>>>>>>>>> + * the list, so list insertion deletion can happen concurrently.
>>>>>>>> Are the list spinlocks needed for that async state update from within
>>>>>>>> the dma-fence critical section we've discussed previously?
>>>>>>> Any driver calling _[un]link() from its drm_gpu_scheduler::run_job()
>>>>>>> hook will be in this situation (Panthor at the moment, PowerVR soon). I
>>>>>>> get that Xe and Nouveau don't need that because they update the VM
>>>>>>> state early (in the ioctl path), but I keep thinking this will hurt us
>>>>>>> if we don't think it through from the beginning, because once you've
>>>>>>> set this logic to depend only on resv locks, it will be pretty hard to
>>>>>>> get back to a solution which lets synchronous VM_BINDs take precedence
>>>>>>> on asynchronous request, and, with vkQueueBindSparse() passing external
>>>>>>> deps (plus the fact the VM_BIND queue might be pretty deep), it can
>>>>>>> take a long time to get your synchronous VM_BIND executed...
>>>> So this would boil down to either (possibly opt-in) keeping the spinlock
>>>> approach or pushing the unlink out to a wq then?
>>> Deferred _unlink() would not be an issue, since I already defer the
>>> drm_gpuva destruction to a wq, it would just a be a matter of moving the
>>> _unlink() call there as well. But _link() also takes the GEM gpuva list
>>> lock, and that one is bit tricky, in that sm_map() can trigger 2 more
>>> _link() calls for the prev/next mappings, which we can't guess until we
>>> get to execute the VM update. If we mandate the use of the GEM resv
>>> lock, that simply means async VM updates (AKA calling
>>> drm_gpuvm_sm_[un]map()) are not an option. And if this is what everyone
>>> agrees on, then I'd like the APIs that make this sort of async VM
>>> update possible (drm_gpuvm_sm_[un]map(), the drm_gpuvm_ops::sm_step*
>>> methods, and probably other things) to be dropped, so we don't make it
>>> look like it's something we support.
>>>   
>>>> BTW, as also asked in a reply to Danilo, how do you call unlink from
>>>> run_job() when it was requiring the obj->dma_resv lock, or was that a WIP?
>>> _unlink() makes sure the GEM gpuva list lock is taken, but this can be
>>> a custom lock (see drm_gem_gpuva_set_lock()). In panthor we have
>>> panthor_gem_object::gpuva_list_lock that's dedicated the gpuva list
>>> protection. We make sure we never take this lock while allocating
>>> memory to guarantee the dma-signalling path can't deadlock.
>>>   
>>>>>>>         
>>>>>> btw what is the use case for this? do we have actual vulkan
>>>>>> applications we know will have problems here?
>>>>> I don't, but I think that's a concern Faith raised at some point (dates
>>>>> back from when I was reading threads describing how VM_BIND on i915
>>>>> should work, and I was clearly discovering this whole VM_BIND thing at
>>>>> that time, so maybe I misunderstood).
>>>>>      
>>>>>> it feels like a bit of premature optimisation, but maybe we have use cases.
>>>>> Might be, but that's the sort of thing that would put us in a corner if
>>>>> we don't have a plan for when the needs arise. Besides, if we don't
>>>>> want to support that case because it's too complicated, I'd recommend
>>>>> dropping all the drm_gpuvm APIs that let people think this mode is
>>>>> valid/supported (map/remap/unmap hooks in drm_gpuvm_ops,
>>>>> drm_gpuvm_sm_[un]map helpers, etc). Keeping them around just adds to the
>>>>> confusion.
>>>> Xe allows bypassing the bind-queue with another bind-queue, but to
>>>> completely avoid dependencies between queues the Operations may not
>>>> overlap.
>>> So, you check the VM state with some VM lock held (would be the VM resv
>>> in my case), and if the mapping is new (no overlaps with pre-existing
>>> mappings), you queue it to the fast-track/sync-VM_BIND queue. What would
>>> be missing I guess is a way to know if the mapping is active (MMU has
>>> been updated) or pending (MMU update queued to the bind-queue), so I can
>>> fast-track mapping/unmapping of active mappings.
> Ok, so I started modifying the implementation, and quickly realized the
> overlap test can't be done without your xe_range_fence tree because of
> unmaps. Since we call drm_gpuva_unmap() early/in the IOCTL path (IOW,
> before the mapping teardown is effective), we lose track of this
> yet-to-be-executed-unmap operation, and if we do our
> va_range_overlaps_with_existing_mappings() test after such an unmap has
> been queued using just the drm_gpuvm tree, we might get false even if
> the mapping still exists and is expected to be torn down when the
> VM_BIND(unmap) job is executed on the bind-queue. As a result, this
> might execute the VM_BIND(map,sync) immediately (because the dependency
> went undetected), and then the vm_bind_run_job() function kicks in and
> undoes what the synchronous VM_BIND(map) did. Am I missing something?
>
> If I'm correct, that means I'm back to having synchronous VM_BIND ops
> queued after all asynchronous ones unless I use something like your
> xe_range_fence solution (which I was hoping I could postpone until we
> decide to expose multiple bind queues).

Yes, unfortunately fine-granular async range-tracking comes with a cost. 
Still, if you are doing page-table updates solely with the CPU, you 
could probably short-circuit the fence part of the fenced ranges?


>
> I'm still a bit skeptical about this 'update VM mappings tree early,
> defer MMU page table updates' approach, where the VM state and the
> actual page table tree are temporarily out of sync until all operations
> have been flushed on all queues targeting a VM. This means any test we
> do on the gpuvm, like, 'give me the BO mapped at VA xxx', is subject to
> 'is this the current state or the future state?' questioning. Note that
> we can't even get the current VM state anymore, because all the
> drm_gpuvm::tree stores with this solution is the future state, and
> to-be-unmapped mappings are lost during the transitioning period (when
> vm_bind jobs are queued but not executed yet).

Understandable. But this is the way we historically have been doing 
things, (I think the whole async atomic page-flipping is using the same 
concept), but rather than refering to it as current state and future 
state, I'd like to think it as Synchronous CPU state (What an API user 
sees) vs GPU state (What the GPU sees where it's currently executing). 
To bring them in sync you need to wait for fences. And ideally the async 
work should never fail.

If one wants to push async work out to be handled solely by the GPU, 
this is the way things must be done since the GPU can't take locks or 
allocate memory, but as part or all of async work is sometimes done 
using the CPU, it might make sense to challenge that to some extent. 
There are indeed pros and cons with both approaches.

/Thomas

>
>>> This would leave
>>> overlapping sync/async VM updates, which can't happen in practice
>>> unless userspace is doing something wrong (sparse bindings always go
>>> through vkQueueBindSparse).
>> User-space is allowed to create new bind queues at will, and they
>> execute independently save for range overlaps.
>>
>> And the overlapping granularity depends very much on the detail of the
>> range tracking.
>> We drafted this fenced range utility
>>
>> https://gitlab.freedesktop.org/drm/xe/kernel/-/merge_requests/353
> I'll try to see if there's a way we can have something generic shared
> at the gpuvm level.
