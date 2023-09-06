Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24332793E5F
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 16:10:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0973D10E660;
	Wed,  6 Sep 2023 14:10:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79C6D10E660;
 Wed,  6 Sep 2023 14:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694009401; x=1725545401;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=2aHrkL0oyKVUnnvZBnpegupvgPJNGCaYmkEBB3jgoB0=;
 b=LTLLxL9eeeGStB+VbMihachqcnEiQxnOSv3tJBPDY0j3j2JtSBcgEs9Q
 UQsSkgtJHywYe9PSk3hHqFKEZaoz1DEmc+L+cVwMnHRNHpMQMNje9EFT/
 zGyah51QzfM5hh2qrioyIIdPeMLQMoK4i8xniRKugD+xtCOdYPwbwghWn
 0S1KhTIgRGY38/amWrU/Aj/eQhngChE4AP4ROx/hCPT0BgM6ekxWIXIOc
 ytCB1iii9WCJM3pfEU5pwM726iIrBB/XUmnJBSC9tfQQ4b+4yOCG9H8Oe
 praZgumNapnaRHbcShKLFOLtwWw0ACPpXNhrQA6aqKtdfr/HKpvkmfWx7 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="408078122"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; d="scan'208";a="408078122"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 07:08:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="1072400539"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; d="scan'208";a="1072400539"
Received: from yinbingc-mobl.ccr.corp.intel.com (HELO [10.249.254.11])
 ([10.249.254.11])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 07:08:09 -0700
Message-ID: <a2c14db7-caed-2467-4ebf-5d66e3b970bd@linux.intel.com>
Date: Wed, 6 Sep 2023 16:08:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] Documentation/gpu: VM_BIND locking document
Content-Language: en-US
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20230816091547.2982-1-thomas.hellstrom@linux.intel.com>
 <ZPeGld0mBwbWptV9@cassiopeiae>
 <4e7a2b2e-1ab5-09b6-b2de-9b2a82a8a32e@linux.intel.com>
 <1c6cbf97-7e85-a48f-9e6a-ed716ab5b05d@redhat.com>
 <1a2965a4-943f-0ba7-b082-155d75b94d59@linux.intel.com>
 <20230906130929.74e3c6cc@collabora.com>
 <e44c93dd-68b2-b8af-6f9a-4d7c6370f105@linux.intel.com>
 <20230906150038.30936ae2@collabora.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230906150038.30936ae2@collabora.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>,
 Oak Zeng <oak.zeng@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Boris,

On 9/6/23 15:00, Boris Brezillon wrote:
> On Wed, 6 Sep 2023 13:57:03 +0200
> Thomas Hellström <thomas.hellstrom@linux.intel.com> wrote:
>
>> Hi, Boris
>>
>> On 9/6/23 13:09, Boris Brezillon wrote:
>>> On Wed, 6 Sep 2023 10:32:24 +0200
>>> Thomas Hellström <thomas.hellstrom@linux.intel.com> wrote:
>>>
>>>   
>>>>>>>> +Introducing external (or shared) buffer objects
>>>>>>>> +===============================================
>>>>>>>> +
>>>>>>>> +Since shared buffer objects may be shared by multiple gpu_vm's they
>>>>>>>> +can't share their reservation object with a single gpu_vm, but
>>>>>>>> will rather
>>>>>>>> +have a reservation object of their own. The shared objects bound to a
>>>>>>>> +gpu_vm using one or many
>>>>>>>> +gpu_vmas are therefore typically put on a per-gpu_vm list which is
>>>>>>>> +protected by the gpu_vm lock. One could in theory protect it also
>>>>>>>> with
>>>>>>>> +the ``gpu_vm->resv``, but since the list of dma_resvs to take is
>>>>>>>> typically
>>>>>>>> +built before the ``gpu_vm->resv`` is locked due to a limitation in
>>>>>>>> +the current locking helpers, that is typically not done. Also see
>>>>>>>> +below for userptr gpu_vmas.
>>>>>>>> +
>>>>>>>> +At eviction time we now need to invalidate *all* gpu_vmas of a shared
>>>>>>>> +object, but we can no longer be certain that we hold the gpu_vm's
>>>>>>>> +dma_resv of all the object's gpu_vmas. We can only be certain that we
>>>>>>> I need to think a bit more about locking of extobj and evicted
>>>>>>> object tracking
>>>>>>> in the case of processing 'drm_gpuva_ops' directly through callbacks
>>>>>>> within the
>>>>>>> fence signalling critical path as mentioend in [1].
>>>>>>>
>>>>>>> In order to support that, we'd need to protect extobjs with a
>>>>>>> separate lock,
>>>>>>> and while iterating extobjs to acquire the dma-resv lock drop the
>>>>>>> lock within
>>>>>>> the loop before we actually acquire the dma-resv lock. Maple tree
>>>>>>> supports that
>>>>>>> already and this can be fully done within the GPUVA manager; no need
>>>>>>> for the
>>>>>>> driver to care about that.
>>>>>> So do I understand correctly that this because you want to update the
>>>>>> gpuvm state while operations are progressing asynchronously?
>>>>>>
>>>>>> If so, I wonder whether that could really be done? For example to
>>>>>> allocate enough memory for page-tables etc, you need to know the
>>>>>> details of the operations at IOCTL execution time, and to know the
>>>>>> details you need to know the state from the previous operation?
>>>>> Right, sync and async bind can't run fully concurrently, but you could
>>>>> "inject" a
>>>>> sync one between two async ones such that the sync ones executed from
>>>>> the IOCTL
>>>>> directly while async execution is stalled meanwhile. This would be
>>>>> possible because
>>>>> the actual drm_gpuva_ops would be calculated within the async
>>>>> execution path rather
>>>>> than in the IOCTL. But yes, page-table management must be desinged to
>>>>> support that.
>>> FWIW, the panthor driver is designed this way (note that I'm not
>>> supporting GEM eviction yet, so there might be subtleties I missed).
>> The problem is that once you've published your VM_BIND out-fence, any
>> code path required to signal that fence may notallocate memory nor or
>> grab any locks that allows allocating memory while held including
>> dma_resv locks, and that means all required page-table memory needs to
>> be allocated synchronously in the IOCTL,
> Yep, that's already what I do, by over-provisioning for the worst case
> scenario (page table tree is empty), and returning unused pages after
> the operation is done.
>
>> and all evicted bos need to be
>> made resident in the IOCTL,
> Yep, I'm pinning memory to BOs in that path too.
>
>> and at least in the xe driver the amount of
>> memory we need to allocate depends on the vm state, so we can't really
>> update the vm state asynchronously either.
> For Mali, we can calculate the maximum amount of pages we'll need for a
> MAP operation, by assuming the page table is empty. Then it's just a
> matter of returning unused pages to a fast-alloc pool so we can
> speed-up further page table allocations (we're using a kmem_cache here,
> since the page table update is done by the CPU and memory is shared on
> Arm, but there's no reason you can't have your own cache
> implementation).
>
>> But as long as any async binding work required for signalling the
>> VM_BIND out-fence is properly annotated with
>> dma_fence_begin_signalling() and dma_fence_end_signalling() and there
>> aren't any lockdep splats, things should be good. It would trigger on
>> both memory allocation and attempts to grab a dma_resv lock.
> I have dma_fence_{begin,end}_signalling() annotations in the
> ::run_job() path, and no lockdep complaint spotted so far.
>
>>
>>>   
>>>> OK, well one of the main motivations for Xe is to be able to pipeline
>>>> interleaving binds and execs if needed, like so:
>>>>
>>>> - Bind vmas for scene 1.
>>>> - Submit scene 1.
>>>> - Unbind vmas for scene 1.
>>>> - Bind vmas for scene 2.
>>>> - Submit scene 2.
>>>> - Unbind vmas for scene 2.
>>>>
>>>> And being able to *submit* all of the above while the async binding of
>>>> vmas for scene (step 1) has not yet completed.
>>>> I can't really see how this could be done, while obeying dma-fence
>>>> rules, unless state is updated synchronously while submitting?
>>> The idea in this case is to detect when a GPU job dependency is a
>>> VM_BIND out-fence, turn drm_sched_fence->parent into an
>>> xxx_vm_bind_job_fence object that's holding the GEM that's about to be
>>> mapped (AFAICT, we don't need to do anything for unmap operations), and
>>> then add our GPU job fence to this BO. This should not only guarantee
>>> that the GEMs we depend on are mapped before the GPU job is executed
>>> (the fence wait does that), but also that such yet-to-be-mapped GEMs
>>> won't be evicted just after they've been mapped and before the GPU had
>>> a chance to execute (unless I'm missing something, adding our GPU job
>>> fence to the BO being targeted by a pending VM_BIND(async,map) operation
>>> solves this problem).
> It's not exactly that, because we'd need to add a GEMs of all the
> pending VM_BIND(map) jobs that come before the expressed dependency, not
> just the one attached to the dependency itself. But after chatting with
> Danilo, I realized we might not even need to track the GEMs being
> mapped at the fence level if we call drm_gpuva_extobj_insert() in the
> ioctl(VM_BIND) path:
>
> - drm_gpuva_extobj_insert() will make sure the GEM is added to
>    the ext-object map even before it's actually mapped to the VM (for
>    private GEMs, it doesn't matter, because they are using the VM resv,
>    so any private GEM mapped will automatically receive the VM resv
>    updates).
>
> Now, when a GPU job is queued, we do all the VM GEM preparation, which
> includes the following steps:
>
> - drm_gpuva_manager_validate() will make already-bound-but-evicted GEMs
>    resident
> - Iterate over all ext-objs to add our fence (I'm skipping the slot
>    reservation step that's implied). Because drm_gpuva_extobj_insert()
>    was called early, we also get all the GEMs that are not yet mapped,
>    but are about to be mapped. This means they won't be evicted until
>    after our job is done
> - add our fence to the VM resv
>
> Unless I'm missing something, this should guarantee that all GEMs are
> resident and mapped when the job is executed.
>
>> Yes, we're essentially doing the same. The issue here is that when we,
>> for example *submit* Bind vmas for scene 2,
>> we need to know how much page-table memory to allocate,
> This is solved with over-provisioning in our case.
>
>> and what BOs to
>> make resident to be able to publish the out-fence.
> That's basically what Danilo's latest gpuva_mgr patchset tries to
> provide generic helpers for, by exposing functions to iterate over all
> evicted GEMs (so we can make them resident) and adding a way to add
> fences to all GEMs currently bound to the VM. That leaves external GEMs
> that are about to be mapped, which, I think, is addressed by the
> solution detailed above.
>
>> That means we need to
>> know what the VM state would look like at the end of "Unbind vmas for
>> scene 1".
> Not necessarily, as long as you know all the GEMs that are currently
> mapped and those that are about to be mapped. The extobj set provides
> exactly that for external GEMs.
>
>> If the VM state is updated at submission time, that's all ok
>> but if it's updated at execution time, we'd have to guess what resources
>> to pre-allocate.
> As long as you have enough resources pre-allocated to do the VM update
> (not saying this is easy to guess on Intel, but it's doable on Mali,
> and the page table caching makes over-provisioning not too bad, as long
> as we limit the number of in-flight VM_BIND jobs).

OK, then it sounds we're on the same page. I guess it would i theory be 
possible to pre-allocate all needed resources on xe as well, but if the 
vm state lock is made an inner lock in order for us to be able to grab 
it within the dma-fence critical section, then it comes with a number of 
drawbacks as well:
* Over-allocation of resources.
* Need to spawn a cpu-thread for the async part (currently we utilize 
the GPU for that).
* Probably looking at locking inversions wrt userptr?
* Probably looking at locking inversions wrt recoverable pagefaults?
* Mismatch with the cpu mmap() / munmap() interface where the mmap_sem 
is the outermost lock.

So for us currently it currently looks like the sync state update is the 
preferred one... But OTOH we haven't fully implemented the unwinding yet...

/Thomas





