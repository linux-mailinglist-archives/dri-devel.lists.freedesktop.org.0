Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 261C97EE3B0
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 16:01:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 598D410E617;
	Thu, 16 Nov 2023 15:01:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FE5B10E60F;
 Thu, 16 Nov 2023 15:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700146896; x=1731682896;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=oOLN7zUL5eOq5PRiTPeUes3TAocPoVU7Mz+FtP7O4+M=;
 b=K+mlDsc1bVX4zhqBRMcTUBbRMNs50oeM5Dyy4pXJsDFQG8p58dE90gWN
 0ItWydft2n3lWOIPhtHMqN9Howu7Ayjbt1spVkZ1z9iZWcNtBUNEgxb4V
 KPNBPoD0LmbccFYNbRUMI786YRi/dmup0pNsIpR+YI8a/xw5QWY7AE1Zl
 kig/JlSrukwZ7lyUshXPyppZToPeJ6HJPmKZR2dxfwCtOdftNmuusMSSh
 /PjrwemBnY+pAu2HRGIZHgRLnP2R29MPUIOeypkr9yU0CWR/teUC2EsNu
 UUytoZrRrPW+p2omgGmUwmDtYFhigDcKWwehB3S4ueZn8JUsFfjhgqHXD g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="395020677"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; d="scan'208";a="395020677"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 07:01:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="882777033"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; d="scan'208";a="882777033"
Received: from mcaspar-mobl1.ger.corp.intel.com (HELO [10.249.254.12])
 ([10.249.254.12])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 07:01:32 -0800
Message-ID: <bd933b64-282f-e9ff-7acc-fac21030984a@linux.intel.com>
Date: Thu, 16 Nov 2023 16:01:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4] Documentation/gpu: VM_BIND locking document
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20231115124937.6740-1-thomas.hellstrom@linux.intel.com>
 <20231116104851.114bdb08@collabora.com>
 <0850281b667c4b88163dab60737dbc945ad742fd.camel@linux.intel.com>
 <20231116142707.044aeec2@collabora.com>
 <656d5f890de7ba3af05616122a9bd399badd35bc.camel@linux.intel.com>
 <20231116154708.148ce241@collabora.com>
Content-Language: en-US
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20231116154708.148ce241@collabora.com>
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
 Oak Zeng <oak.zeng@intel.com>, Danilo Krummrich <dakr@redhat.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 11/16/23 15:47, Boris Brezillon wrote:
> On Thu, 16 Nov 2023 14:53:50 +0100
> Thomas Hellström <thomas.hellstrom@linux.intel.com> wrote:
>
>> On Thu, 2023-11-16 at 14:27 +0100, Boris Brezillon wrote:
>>> On Thu, 16 Nov 2023 12:48:45 +0100
>>> Thomas Hellström <thomas.hellstrom@linux.intel.com> wrote:
>>>    
>>>> Hi, Boris,
>>>>
>>>> Thanks for reviewing. Some comments below:
>>>>
>>>> On Thu, 2023-11-16 at 10:48 +0100, Boris Brezillon wrote:
>>>>> Hi Thomas,
>>>>>
>>>>> On Wed, 15 Nov 2023 13:49:37 +0100
>>>>> Thomas Hellström <thomas.hellstrom@linux.intel.com> wrote:
>>>>>      
>>>>>> Add the first version of the VM_BIND locking document which is
>>>>>> intended to be part of the xe driver upstreaming agreement.
>>>>>>
>>>>>> The document describes and discuss the locking used during
>>>>>> exec-
>>>>>> functions, evicton and for userptr gpu-vmas. Intention is to be
>>>>>> using the
>>>>>> same nomenclature as the drm-vm-bind-async.rst.
>>>>>>
>>>>>> v2:
>>>>>> - s/gvm/gpu_vm/g (Rodrigo Vivi)
>>>>>> - Clarify the userptr seqlock with a pointer to
>>>>>> mm/mmu_notifier.c
>>>>>>    (Rodrigo Vivi)
>>>>>> - Adjust commit message accordingly.
>>>>>> - Add SPDX license header.
>>>>>>
>>>>>> v3:
>>>>>> - Large update to align with the drm_gpuvm manager locking
>>>>>> - Add "Efficient userptr gpu_vma exec function iteration"
>>>>>> section
>>>>>> - Add "Locking at bind- and unbind time" section.
>>>>>>
>>>>>> v4:
>>>>>> - Fix tabs vs space errors by untabifying (Rodrigo Vivi)
>>>>>> - Minor style fixes and typos (Rodrigo Vivi)
>>>>>> - Clarify situations where stale GPU mappings are occurring and
>>>>>> how
>>>>>>    access through these mappings are blocked. (Rodrigo Vivi)
>>>>>> - Insert into the toctree in implementation_guidelines.rst
>>>>>>
>>>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>>>> Signed-off-by: Thomas Hellström
>>>>>> <thomas.hellstrom@linux.intel.com>
>>>>>> ---
>>>>>>   Documentation/gpu/drm-vm-bind-locking.rst     | 503
>>>>>> ++++++++++++++++++
>>>>>>   .../gpu/implementation_guidelines.rst         |   1 +
>>>>>>   2 files changed, 504 insertions(+)
>>>>>>   create mode 100644 Documentation/gpu/drm-vm-bind-locking.rst
>>>>>>
>>>>>> diff --git a/Documentation/gpu/drm-vm-bind-locking.rst
>>>>>> b/Documentation/gpu/drm-vm-bind-locking.rst
>>>>>> new file mode 100644
>>>>>> index 000000000000..bc701157cb34
>>>>>> --- /dev/null
>>>>>> +++ b/Documentation/gpu/drm-vm-bind-locking.rst
>>>>>> @@ -0,0 +1,503 @@
>>>>>> +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>>>>>> +
>>>>>> +===============
>>>>>> +VM_BIND locking
>>>>>> +===============
>>>>>> +
>>>>>> +This document attempts to describe what's needed to get
>>>>>> VM_BIND
>>>>>> locking right,
>>>>>> +including the userptr mmu_notifier locking and it will also
>>>>>> discuss some
>>>>>> +optimizations to get rid of the looping through of all userptr
>>>>>> mappings and
>>>>>> +external / shared object mappings that is needed in the
>>>>>> simplest
>>>>>> +implementation. It will also discuss some implications for
>>>>>> faulting gpu_vms.
>>>>>> +
>>>>>> +Nomenclature
>>>>>> +============
>>>>>> +
>>>>>> +* ``Context``: GPU execution context.
>>>>>> +* ``gpu_vm``: Abstraction of a virtual GPU address space with
>>>>>> +  meta-data. Typically one per client (DRM file-private), or
>>>>>> one
>>>>>> per
>>>>>> +  context.
>>>>> Should we mention that it's a driver object, likely inheriting
>>>>> from
>>>>> drm_gpuvm?
>>>> Yes, I can try to be a bit more drm_gpuvm-centric throughout the
>>>> document, although I want to avoid being too specific due to the
>>>> current rapid drm_gpuvm rate of change, which might also affect
>>>> this
>>>> document. I guess I will have to commit for now to update the
>>>> document
>>>> on each gpuvm series we land...
>>> Well, I'd suggest that the one doing changes to drm_gpuvm gets to
>>> update this document along the way, or even better, make this
>>> documentation part of the drm_gpuvm doc, so there's no excuse to not
>>> update it when drm_gpuvm is extended.
>> Sure, Although I think initial merge will be as is, and then merging
>> with drm_gpuvm will come at a later point.
> Sure, I have no problem with that.
>
>>>>    
>>>>>      
>>>>>> +   add_dma_fence(&obj->resv, job_dma_fence);
>>>>>> +
>>>>>> +   dma_resv_unlock(&obj->resv);
>>>>>> +   put_object(obj);
>>>>>> +
>>>>>> +Note that since the object is local to the gpu_vm, it will
>>>>>> share
>>>>>> the gpu_vm's
>>>>>> +dma_resv lock so that ``obj->resv == gpu_vm->resv``.
>>>>>> +The gpu_vm_bos marked for eviction are put on the gpu_vm's
>>>>>> evict
>>>>>> list,
>>>>>> +which is protected by ``gpu_vm->resv``, that is always locked
>>>>>> while
>>>>>> +evicting, due to the above equality.
>>>>>> +
>>>>>> +For VM_BIND gpu_vms, gpu_vmas don't need to be unbound before
>>>>>> eviction,
>>>>>> +Since the driver must ensure that the eviction blit or copy
>>>>>> will
>>>>>> wait
>>>>>> +for GPU idle or depend on all previous GPU activity.
>>>>>> Furthermore,
>>>>>> any
>>>>>> +subsequent attempt by the GPU to access freed memory through
>>>>>> the
>>>>>> +gpu_vma will be preceded by a new exec function, with a
>>>>>> revalidation
>>>>>> +section which will make sure all gpu_vmas are rebound. The
>>>>>> eviction
>>>>>> +code holding the object's dma_resv while revalidating will
>>>>>> ensure
>>>>>> a
>>>>>> +new exec function may not race with the eviction. Note that
>>>>>> this
>>>>>> will
>>>>>> +not hold true, however, if only a subsets of vmas are, due to
>>>>>> the
>>>>>> +driver implementation, selected for rebinding the next exec
>>>>>> +function.
>>>>> This last sentence is hard to follow.
>>>>>
>>>>> "
>>>>> Note that this will not hold true if only a subset of vmas
>>>>> are selected for rebinding during the next exec call (for
>>>>> instance,
>>>>> due
>>>>> to some driver decision to only partially restore VMAs).
>>>>> "
>>>>>      
>>>>>> Then all vmas *not* selected for rebinding needs to be
>>>>>> +properly unbound before re-enabling GPU access to the VM.
>>>>> I think I get the problem, but can we have a use case where
>>>>> partial
>>>>> VMA restoration is useful? I mean, if some VMAs are not needed,
>>>>> we
>>>>> might be able to save MMU page table allocation/setup-time, but
>>>>> given
>>>>> the mess it then is to track those non-live VMAs, I'm wondering
>>>>> if
>>>>> it's
>>>>> leaving the door open for that, unless there's a good reason to
>>>>> do
>>>>> it.
>>>> This is the use-case Christian has been flagging for for OpenGL and
>>>> Media where he warns that the single-vm-memory-overcommit case
>>>> would
>>>> otherwise make the app crawl.
>>> IIUC, the partial VMA restore is about not restoring all VMAs
>>> attached
>>> to a vm_bo, but as soon as you restore one, this makes the BO
>>> resident,
>>> so all you're saving here is the extra page table for non-restored
>>> VMAs.
>>> I don't think that would significantly help the overcommit use case,
>>> unless you have so many VMAs attached to a single vm_bo that the
>>> amount of extra page tables becomes non-negligible compared to the BO
>>> size itself.
>>>
>>> What would really help the overcommit use case is not restoring all
>>> evicted BOs, if some of them are known to be in a range that's not
>>> accessed by a GPU job. In that situation, you can decide to leave
>>> vm_bos in the evicted list if none of their VMAs overlap any of the
>>> VM
>>> ranges used by a job.
>> Yes this section here is the key: The vmas belonging to evicted bos not
>> restored would be the ones not "selected for rebind".
> Okay, but then I don't see the problem if you leave such vm_bos in the
> evicted list. Those will still be considered for 'rebind' next time the
> evicted list is walked (basically on the next exec), right?

Yes, but given what's written below that "rebind next time" also allows 
gpu activation with stale mappings, so at least we need to invalidate 
the stale mappings at this point.

/Thomas


>
>>>    
>>>> Generalized one might want to think of these as groups of (or
>>>> perhaps
>>>> virtual ranges of) vmas that need to be resident for a single job
>>>> submission. Currently we assume the residency-group <-> vm mapping
>>>> is
>>>> 1:1, allowing for the unbind-before-eviction to be ignored, but I
>>>> figure moving forward and addressing performance problems of real-
>>>> world
>>>> applications that may not always be true.
>>> Maybe I don't understand what unbind-before-eviction means. To me
>>> it's
>>> the operation of tearing down all VM mappings (unbind) before
>>> returning
>>> BO pages to the system (evict). I don't see a situation where the
>>> eviction of a BO doesn't imply killing all VM mapping pointing to
>>> this
>>> BO.
>> It's the point of teardown that matters here. You can return the pages
>> to system without tearing down the GPU mappings, as long as you tear
>> them down before there are any GPU activity on that vm again. In xe we
>> tear down the old mappings as part of the rebind process after we've
>> validated the evicted bo again, (but before submitting the GPU job).
>> The point is the stale mappings can be left as long as there is no gpu
>> job accessing them.
> I see. As long as you're sure the VM is completely inactive, and that
> such mappings are destroyed before the VM is used again, that's fine I
> guess. Might be worth a detailed explanation about the different
> scenarios though.
>
