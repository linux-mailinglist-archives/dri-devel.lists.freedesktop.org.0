Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5B77A7492
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 09:45:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F47710E44A;
	Wed, 20 Sep 2023 07:44:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85DF910E446;
 Wed, 20 Sep 2023 07:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695195894; x=1726731894;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=F3co5XpiE5AH1gFLEMoj3DygQIKQU9MlyXHPuT42Lyo=;
 b=OdSd9T1pHaFYGNzHSmnVM5xQ9wghFy5bU8kkDAp4UbR4uvsCql56bsRw
 o9Hka1O99n3xD1vQe+WQIkxCmdH6HGs9MHmn4gsREleKfl+IQA1ZWdqPO
 iWqiQk0364he4nw2y+RfVPHRydgiDfm3zuK4xpgzHYfXHNa2EremYEBDw
 bHBUEDIbm8omIirE7Ii81W1uUUA0iGQYwvIvngRZpdcZCAlliW0F2v4GL
 ST5QTsR0bbLw6IT2nognvgR/DKMB+XWvz/E87WMBKxaCxL5DSVBVYgLVg
 Qzh4LKLr5sP0eyZIuwmbyl5INnmaHEPyL44kKbpMdafdhYzD9P3JsFYpi A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="360408676"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; d="scan'208";a="360408676"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 00:44:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="812048471"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; d="scan'208";a="812048471"
Received: from noors55x-mobl1.gar.corp.intel.com (HELO [10.249.254.146])
 ([10.249.254.146])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 00:44:49 -0700
Message-ID: <4a60b67f-c67a-ca80-20b6-4af57f6858df@linux.intel.com>
Date: Wed, 20 Sep 2023 09:44:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH drm-misc-next v3 6/7] drm/gpuvm: generalize
 dma_resv/extobj handling and GEM validation
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@redhat.com>
References: <20230909153125.30032-1-dakr@redhat.com>
 <20230909153125.30032-7-dakr@redhat.com>
 <a9ef04d2-2525-65c0-2eda-45ca9a95a3a0@linux.intel.com>
 <ZQCW6wzHYVdxl/IV@pollux>
 <701dfead-e240-b3fb-422c-d49fc7e04595@linux.intel.com>
 <ZQD2FFLP28bFgHXT@pollux>
 <cbff08ca845655dee44fbf498cdb37a3d5251bf3.camel@linux.intel.com>
 <ZQGoNovGz/4Y3xvf@pollux> <96af067a-ca48-891c-2adf-9faf271e3629@amd.com>
 <5f66db4e-f580-bbfb-d9fc-ac78afdbf01a@redhat.com>
 <0ca78a6b-9011-1738-f367-c9e6369f4ad4@amd.com>
 <00ecb16c-5ebb-7122-4e2d-df21e89a0cf1@redhat.com>
 <92c00bc7-1a20-edc3-e36c-7bcf61684a91@amd.com>
 <5f1b8427-1c51-b10f-f41c-a0f068ef3792@linux.intel.com>
 <7d237f39-51cd-6a3c-c010-8d9c4c7061a1@redhat.com>
 <177db5b8-ee94-3b15-3445-7ed1dc7bef2a@linux.intel.com>
 <7577b5c0-a1cf-61b9-5929-f19515b340c4@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <7577b5c0-a1cf-61b9-5929-f19515b340c4@amd.com>
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
 dri-devel@lists.freedesktop.org, boris.brezillon@collabora.com,
 donald.robson@imgtec.com, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 9/20/23 07:37, Christian König wrote:
> Am 19.09.23 um 17:23 schrieb Thomas Hellström:
>>
>> On 9/19/23 17:16, Danilo Krummrich wrote:
>>> On 9/19/23 14:21, Thomas Hellström wrote:
>>>> Hi Christian
>>>>
>>>> On 9/19/23 14:07, Christian König wrote:
>>>>> Am 13.09.23 um 17:46 schrieb Danilo Krummrich:
>>>>>> On 9/13/23 17:33, Christian König wrote:
>>>>>>> Am 13.09.23 um 17:15 schrieb Danilo Krummrich:
>>>>>>>> On 9/13/23 16:26, Christian König wrote:
>>>>>>>>> Am 13.09.23 um 14:16 schrieb Danilo Krummrich:
>>>>>>>>>> As mentioned in a different mail thread, the reply is based 
>>>>>>>>>> on the assumption
>>>>>>>>>> that we don't support anything else than GPUVM updates from 
>>>>>>>>>> the IOCTL.
>>>>>>>>>
>>>>>>>>> I think that this assumption is incorrect.
>>>>>>>>
>>>>>>>> Well, more precisely I should have said "don't support GPUVM 
>>>>>>>> updated from within
>>>>>>>> fence signaling critical sections". And looking at the code, 
>>>>>>>> that doesn't seem what
>>>>>>>> you're doing there.
>>>>>>>>
>>>>>>>>>
>>>>>>>>> Vulkan is just once specific use case, but this here should 
>>>>>>>>> probably be able to handle other use cases as well.
>>>>>>>>>
>>>>>>>>> Especially with HMM you get the requirement that you need to 
>>>>>>>>> be able to invalidate GPUVM mappings without grabbing a 
>>>>>>>>> reservation lock.
>>>>>>>>
>>>>>>>> What do you mean with "invalidate GPUVM mappings" in this 
>>>>>>>> context? drm_gpuvm_bo_evict()
>>>>>>>> should only be called from a ttm_device_funcs::move callback, 
>>>>>>>> we should hold the dma-resv
>>>>>>>> lock there.
>>>>>>>
>>>>>>> Well the question is which dma-resv lock do we hold?
>>>>>>>
>>>>>>> In the move callback we only hold the dma-resv lock of the BO 
>>>>>>> which is moved, but when that is a shared BO then that's not the 
>>>>>>> same as the one for the VM.
>>>>>>
>>>>>> Correct, Thomas' idea was to use the GEM's dma_resv lock to 
>>>>>> protect drm_gpuvm_bo::evicted
>>>>>> and then actually move the drm_gpuvm_bo to the VM's evicted list 
>>>>>> once we grabbed all
>>>>>> dma-resv locks when locking the VM's BOs using drm_exec. We can 
>>>>>> remove them from the evicted
>>>>>> list on validate(). This way we never touch the evicted list 
>>>>>> without holding at least the VM's
>>>>>> dma-resv lock.
>>>>>>
>>>>>> Do you have any concerns about that?
>>>>>
>>>>> Scratching my head a bit how that is supposed to work.
>>>>>
>>>>> This implies that you go over all the evicted BOs during 
>>>>> validation and not just the one mentioned in the CS.
>>>>>
>>>>> That might work for Vulkan, but is pretty much a no-go for OpenGL.
>>>>>
>>>>>>
>>>>>>>
>>>>>>>>
>>>>>>>>>
>>>>>>>>> See what the eviction lock in amdgpu is doing for example.
>>>>>>>>
>>>>>>>> The eviction_lock seems to protect a VM state "evicting" of 
>>>>>>>> whether any BO that
>>>>>>>> is associated with the VM is currently evicting. At the same 
>>>>>>>> time amdgpu protects
>>>>>>>> the eviceted list of the VM with a different lock. So this 
>>>>>>>> seems to be entirely
>>>>>>>> unrelated. Tracking a "currently evicting" state is not part of 
>>>>>>>> the GPUVM
>>>>>>>> implementation currently and hence nothing would change for 
>>>>>>>> amdgpu there.
>>>>>>>
>>>>>>> Sorry for the confusion we use different terminology in amdgpu.
>>>>>>>
>>>>>>> The eviction lock and evicted state is for the VM page tables, 
>>>>>>> e.g. if the whole VM is currently not used and swapped out or 
>>>>>>> even de-allocated.
>>>>>>>
>>>>>>> This is necessary because we have cases where we need to access 
>>>>>>> the VM data without holding the dma-resv lock of this VM. 
>>>>>>> Especially figuring out which parts of an address space contain 
>>>>>>> mappings and which doesn't.
>>>>>>
>>>>>> I think this is fine, this has nothing to do with lists of 
>>>>>> evicted GEM objects or external GEM
>>>>>> objects, right? Marking mappings (drm_gpuva) as invalidated 
>>>>>> (DRM_GPUVA_INVALIDATED) or accessing
>>>>>> the VA space does not require any dma-resv locks.
>>>>>
>>>>> I hope so, but I'm not 100% sure.
>>>>>
>>>>>>
>>>>>>>
>>>>>>> This is a requirement which comes with HMM handling, you won't 
>>>>>>> see this with Vulkan (or OpenGL, VAAPI etc..).
>>>>>>>
>>>>>>>
>>>>>>> The invalidation lock on the other hand is what in this 
>>>>>>> discussion is called eviction lock. This one is needed because 
>>>>>>> what I wrote above, during the move callback only the dma-resv 
>>>>>>> of the BO which is moved is locked, but not necessarily the 
>>>>>>> dma-resv of the VM.
>>>>>>
>>>>>> That's yet another thing, right? This is used to track whether 
>>>>>> *any* BO that belongs to the VM is
>>>>>> currently being evicted, correct? As mentioned, as by now this is 
>>>>>> not supported in GPUVM and hence
>>>>>> would be the same driver specific code with the same driver 
>>>>>> specifc lock.
>>>>>
>>>>> That is most likely a show stopper using this for OpenGL based 
>>>>> workloads as far as I can see. For those you need to able to 
>>>>> figure out which non-VM BOs have been evicted and which parts of 
>>>>> the VM needs updates.
>>>>
>>>> We identify those with a bool in the gpuvm_bo, and that bool is 
>>>> protected by the bo_resv. In essence, the "evicted" list must be 
>>>> made up-to-date with all relevant locks held before traversing in 
>>>> the next exec.
>>>
>>> What I still miss with this idea is how do we find all the 
>>> drm_gpuvm_bo structures with the evicted bool set to true? When 
>>> doing the drm_exec dance we come across all external ones and can 
>>> add them to the list if needed, but what about the BOs having the 
>>> VM's dma-resv?
>>
>> Oh, they can be added to the evict list directly (no bool needed) in 
>> the eviction code, like in v3. Since for those we indeed hold the 
>> VM's dma_resv since it's aliased with the object's dma-resv.
>
> Yeah, I wanted to note what Danilo seems to think about as well. How 
> do we figure out the non-VM BOs evicted?
>
> We can't walk over the list of all non-VM BOs on every submission, 
> that's to much overhead for cases with lots of non-VM BOs.
>
> And we can't rely on userspace sending all non-VM BOs as used list 
> down to the kernel with each submission.
>
> Regards,
> Christian.

No, that's not needed: Mechanism below.

1) We maintain an evicted list. Typically protected by the vm resv.
2) Each gpuvm_bo has a bool "evicted". Protected by the bo resv.

a) Evicting a vm bo: The vm resv is held by the eviction code. Just put 
it on the evicted list.
b) Evicting a shared/external bo: The bo resv is held by the eviction 
code. Set the "evicted" bool
c) Validating the evicted list on exec: Loop through all 
*external/shared* bos. Lock them. After locking, check the "evicted" 
bool, if it's true. put the bo on the evicted list (we hold the VM resv 
at this point) and clear the "evicted" bool. Note that other vms will 
have their own gpuvm_bo which is marked evicted.

I have this coded up in a patch for Xe and it seems to be working properly.

/Thomas


>
>>
>> /Thomas
>>
>>
>>
>>>
>>>>
>>>> If you mean that we need to unbind all vmas of all vms of evicted 
>>>> bos before evicting, We don't do that, at least not in Xe, since 
>>>> evicting we wait for VM idle, and it cant access anything through 
>>>> the stale vmas until they have been revalidated and rebound.
>>>>
>>>> /Thomas
>>>>
>>>>
>>>>
>>>>>>
>>>>>>>
>>>>>>> Regards,
>>>>>>> Christian.
>>>>>>>
>>>>>>>>
>>>>>>>>>
>>>>>>>>> Regards,
>>>>>>>>> Christian.
>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> On Wed, Sep 13, 2023 at 11:14:46AM +0200, Thomas Hellström 
>>>>>>>>>> wrote:
>>>>>>>>>>> Hi!
>>>>>>>>>>>
>>>>>>>>>>> On Wed, 2023-09-13 at 01:36 +0200, Danilo Krummrich wrote:
>>>>>>>>>>>> On Tue, Sep 12, 2023 at 09:23:08PM +0200, Thomas Hellström 
>>>>>>>>>>>> wrote:
>>>>>>>>>>>>> On 9/12/23 18:50, Danilo Krummrich wrote:
>>>>>>>>>>>>>> On Tue, Sep 12, 2023 at 06:20:32PM +0200, Thomas 
>>>>>>>>>>>>>> Hellström wrote:
>>>>>>>>>>>>>>> Hi, Danilo,
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> On 9/9/23 17:31, Danilo Krummrich wrote:
>>>>>>>>>>>>>>>> So far the DRM GPUVA manager offers common 
>>>>>>>>>>>>>>>> infrastructure to
>>>>>>>>>>>>>>>> track GPU VA
>>>>>>>>>>>>>>>> allocations and mappings, generically connect GPU VA 
>>>>>>>>>>>>>>>> mappings
>>>>>>>>>>>>>>>> to their
>>>>>>>>>>>>>>>> backing buffers and perform more complex mapping 
>>>>>>>>>>>>>>>> operations
>>>>>>>>>>>>>>>> on the GPU VA
>>>>>>>>>>>>>>>> space.
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> However, there are more design patterns commonly used by
>>>>>>>>>>>>>>>> drivers, which
>>>>>>>>>>>>>>>> can potentially be generalized in order to make the DRM 
>>>>>>>>>>>>>>>> GPUVA
>>>>>>>>>>>>>>>> manager
>>>>>>>>>>>>>>>> represent a basic GPU-VM implementation. In this context,
>>>>>>>>>>>>>>>> this patch aims
>>>>>>>>>>>>>>>> at generalizing the following elements.
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> 1) Provide a common dma-resv for GEM objects not being 
>>>>>>>>>>>>>>>> used
>>>>>>>>>>>>>>>> outside of
>>>>>>>>>>>>>>>>       this GPU-VM.
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> 2) Provide tracking of external GEM objects (GEM objects
>>>>>>>>>>>>>>>> which are
>>>>>>>>>>>>>>>>       shared with other GPU-VMs).
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> 3) Provide functions to efficiently lock all GEM 
>>>>>>>>>>>>>>>> objects dma-
>>>>>>>>>>>>>>>> resv the
>>>>>>>>>>>>>>>>       GPU-VM contains mappings of.
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> 4) Provide tracking of evicted GEM objects the GPU-VM
>>>>>>>>>>>>>>>> contains mappings
>>>>>>>>>>>>>>>>       of, such that validation of evicted GEM objects is
>>>>>>>>>>>>>>>> accelerated.
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> 5) Provide some convinience functions for common patterns.
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> Rather than being designed as a "framework", the target 
>>>>>>>>>>>>>>>> is to
>>>>>>>>>>>>>>>> make all
>>>>>>>>>>>>>>>> features appear as a collection of optional helper 
>>>>>>>>>>>>>>>> functions,
>>>>>>>>>>>>>>>> such that
>>>>>>>>>>>>>>>> drivers are free to make use of the DRM GPUVA managers 
>>>>>>>>>>>>>>>> basic
>>>>>>>>>>>>>>>> functionality and opt-in for other features without 
>>>>>>>>>>>>>>>> setting
>>>>>>>>>>>>>>>> any feature
>>>>>>>>>>>>>>>> flags, just by making use of the corresponding functions.
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> Big kudos to Boris Brezillon for his help to figure out
>>>>>>>>>>>>>>>> locking for drivers
>>>>>>>>>>>>>>>> updating the GPU VA space within the fence signalling 
>>>>>>>>>>>>>>>> path.
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> Suggested-by: Matthew Brost <matthew.brost@intel.com>
>>>>>>>>>>>>>>>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
>>>>>>>>>>>>>>>> ---
>>>>>>>>>>>>>>>>     drivers/gpu/drm/drm_gpuvm.c | 516
>>>>>>>>>>>>>>>> ++++++++++++++++++++++++++++++++++++
>>>>>>>>>>>>>>>>     include/drm/drm_gpuvm.h     | 197 ++++++++++++++
>>>>>>>>>>>>>>>>     2 files changed, 713 insertions(+)
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> diff --git a/drivers/gpu/drm/drm_gpuvm.c
>>>>>>>>>>>>>>>> b/drivers/gpu/drm/drm_gpuvm.c
>>>>>>>>>>>>>>>> index f4411047dbb3..8e62a043f719 100644
>>>>>>>>>>>>>>>> --- a/drivers/gpu/drm/drm_gpuvm.c
>>>>>>>>>>>>>>>> +++ b/drivers/gpu/drm/drm_gpuvm.c
>>>>>>>>>>>>>>>> @@ -73,6 +73,21 @@
>>>>>>>>>>>>>>>>      * &drm_gem_object list of &drm_gpuvm_bos for an 
>>>>>>>>>>>>>>>> existing
>>>>>>>>>>>>>>>> instance of this
>>>>>>>>>>>>>>>>      * particular combination. If not existent a new 
>>>>>>>>>>>>>>>> instance
>>>>>>>>>>>>>>>> is created and linked
>>>>>>>>>>>>>>>>      * to the &drm_gem_object.
>>>>>>>>>>>>>>>> + *
>>>>>>>>>>>>>>>> + * &drm_gpuvm_bo structures, since unique for a given
>>>>>>>>>>>>>>>> &drm_gpuvm, are also used
>>>>>>>>>>>>>>>> + * as entry for the &drm_gpuvm's lists of external and
>>>>>>>>>>>>>>>> evicted objects. Those
>>>>>>>>>>>>>>>> + * list are maintained in order to accelerate locking of
>>>>>>>>>>>>>>>> dma-resv locks and
>>>>>>>>>>>>>>>> + * validation of evicted objects bound in a 
>>>>>>>>>>>>>>>> &drm_gpuvm. For
>>>>>>>>>>>>>>>> instance the all
>>>>>>>>>>>>>>>> + * &drm_gem_object's &dma_resv of a given &drm_gpuvm 
>>>>>>>>>>>>>>>> can be
>>>>>>>>>>>>>>>> locked by calling
>>>>>>>>>>>>>>>> + * drm_gpuvm_exec_lock(). Once locked drivers can call
>>>>>>>>>>>>>>>> drm_gpuvm_validate() in
>>>>>>>>>>>>>>>> + * order to validate all evicted &drm_gem_objects. It is
>>>>>>>>>>>>>>>> also possible to lock
>>>>>>>>>>>>>>>> + * additional &drm_gem_objects by providing the
>>>>>>>>>>>>>>>> corresponding parameters to
>>>>>>>>>>>>>>>> + * drm_gpuvm_exec_lock() as well as open code the 
>>>>>>>>>>>>>>>> &drm_exec
>>>>>>>>>>>>>>>> loop while making
>>>>>>>>>>>>>>>> + * use of helper functions such as 
>>>>>>>>>>>>>>>> drm_gpuvm_prepare_range()
>>>>>>>>>>>>>>>> or
>>>>>>>>>>>>>>>> + * drm_gpuvm_prepare_objects().
>>>>>>>>>>>>>>>> + *
>>>>>>>>>>>>>>>> + * Every bound &drm_gem_object is treated as external 
>>>>>>>>>>>>>>>> object
>>>>>>>>>>>>>>>> when its &dma_resv
>>>>>>>>>>>>>>>> + * structure is different than the &drm_gpuvm's common
>>>>>>>>>>>>>>>> &dma_resv structure.
>>>>>>>>>>>>>>>>      */
>>>>>>>>>>>>>>>>     /**
>>>>>>>>>>>>>>>> @@ -420,6 +435,20 @@
>>>>>>>>>>>>>>>>      * Subsequent calls to drm_gpuvm_bo_obtain() for 
>>>>>>>>>>>>>>>> the same
>>>>>>>>>>>>>>>> &drm_gpuvm and
>>>>>>>>>>>>>>>>      * &drm_gem_object must be able to observe previous
>>>>>>>>>>>>>>>> creations and destructions
>>>>>>>>>>>>>>>>      * of &drm_gpuvm_bos in order to keep instances 
>>>>>>>>>>>>>>>> unique.
>>>>>>>>>>>>>>>> + *
>>>>>>>>>>>>>>>> + * The &drm_gpuvm's lists for keeping track of 
>>>>>>>>>>>>>>>> external and
>>>>>>>>>>>>>>>> evicted objects are
>>>>>>>>>>>>>>>> + * protected against concurrent insertion / removal and
>>>>>>>>>>>>>>>> iteration internally.
>>>>>>>>>>>>>>>> + *
>>>>>>>>>>>>>>>> + * However, drivers still need ensure to protect 
>>>>>>>>>>>>>>>> concurrent
>>>>>>>>>>>>>>>> calls to functions
>>>>>>>>>>>>>>>> + * iterating those lists, such as drm_gpuvm_validate() 
>>>>>>>>>>>>>>>> and
>>>>>>>>>>>>>>>> + * drm_gpuvm_prepare_objects(). Every such function 
>>>>>>>>>>>>>>>> contains
>>>>>>>>>>>>>>>> a particular
>>>>>>>>>>>>>>>> + * comment and lockdep checks if possible.
>>>>>>>>>>>>>>>> + *
>>>>>>>>>>>>>>>> + * Functions adding or removing entries from those lists,
>>>>>>>>>>>>>>>> such as
>>>>>>>>>>>>>>>> + * drm_gpuvm_bo_evict() or drm_gpuvm_bo_extobj_add() 
>>>>>>>>>>>>>>>> may be
>>>>>>>>>>>>>>>> called with external
>>>>>>>>>>>>>>>> + * locks being held, e.g. in order to avoid the
>>>>>>>>>>>>>>>> corresponding list to be
>>>>>>>>>>>>>>>> + * (safely) modified while potentially being iternated by
>>>>>>>>>>>>>>>> other API functions.
>>>>>>>>>>>>>>>> + * However, this is entirely optional.
>>>>>>>>>>>>>>>>      */
>>>>>>>>>>>>>>>>     /**
>>>>>>>>>>>>>>>> @@ -632,6 +661,131 @@
>>>>>>>>>>>>>>>>      *   }
>>>>>>>>>>>>>>>>      */
>>>>>>>>>>>>>>>> +/**
>>>>>>>>>>>>>>>> + * get_next_vm_bo_from_list() - get the next vm_bo 
>>>>>>>>>>>>>>>> element
>>>>>>>>>>>>>>>> + * @__gpuvm: The GPU VM
>>>>>>>>>>>>>>>> + * @__list_name: The name of the list we're iterating on
>>>>>>>>>>>>>>>> + * @__local_list: A pointer to the local list used to 
>>>>>>>>>>>>>>>> store
>>>>>>>>>>>>>>>> already iterated items
>>>>>>>>>>>>>>>> + * @__prev_vm_bo: The previous element we got from
>>>>>>>>>>>>>>>> drm_gpuvm_get_next_cached_vm_bo()
>>>>>>>>>>>>>>>> + *
>>>>>>>>>>>>>>>> + * This helper is here to provide lockless list 
>>>>>>>>>>>>>>>> iteration.
>>>>>>>>>>>>>>>> Lockless as in, the
>>>>>>>>>>>>>>>> + * iterator releases the lock immediately after 
>>>>>>>>>>>>>>>> picking the
>>>>>>>>>>>>>>>> first element from
>>>>>>>>>>>>>>>> + * the list, so list insertion deletion can happen
>>>>>>>>>>>>>>>> concurrently.
>>>>>>>>>>>>>>> Are the list spinlocks needed for that async state 
>>>>>>>>>>>>>>> update from
>>>>>>>>>>>>>>> within the
>>>>>>>>>>>>>>> dma-fence critical section we've discussed previously?
>>>>>>>>>>>>>> Yes, but also for other reasons, see below.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> Otherwise it should be sufficient to protect the lists 
>>>>>>>>>>>>>>> with the
>>>>>>>>>>>>>>> gpuvm's resv
>>>>>>>>>>>>>>> (or for the extobj list with an outer lock).
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> If those spinlocks are still needed in some situations, 
>>>>>>>>>>>>>>> perhaps
>>>>>>>>>>>>>>> could we
>>>>>>>>>>>>>>> have an option to set them to NULL (Like IIRC the maple 
>>>>>>>>>>>>>>> tree
>>>>>>>>>>>>>>> allows for)?
>>>>>>>>>>>>>> The evict spinlock is needed in any case, since in
>>>>>>>>>>>>>> drm_gpuvm_bo_evict() we're
>>>>>>>>>>>>>> holding only the dma-resv lock from the BO this function 
>>>>>>>>>>>>>> gets
>>>>>>>>>>>>>> called for. Hence,
>>>>>>>>>>>>>> the spinlock protects concurrent drm_gpuvm_bo_evict() 
>>>>>>>>>>>>>> calls with
>>>>>>>>>>>>>> different BOs.
>>>>>>>>>>>>> No. Only if you try to add external objects to the vm's 
>>>>>>>>>>>>> evict list
>>>>>>>>>>>>> from
>>>>>>>>>>>>> within the evict code. That's not necessary since you loop 
>>>>>>>>>>>>> through
>>>>>>>>>>>>> all
>>>>>>>>>>>>> external objects anyway when locking them so an "evicted" 
>>>>>>>>>>>>> bool in
>>>>>>>>>>>>> the vm_bo,
>>>>>>>>>>>>> protected by the bo resv would be sufficient. The extobj 
>>>>>>>>>>>>> locking
>>>>>>>>>>>>> loop can
>>>>>>>>>>>>> then add the bo to the evicted list.
>>>>>>>>>>>> And validate() can remove it while still holding all 
>>>>>>>>>>>> dma-resv locks,
>>>>>>>>>>>> neat!
>>>>>>>>>>>> However, what if two tasks are trying to lock the VA space
>>>>>>>>>>>> concurrently? What
>>>>>>>>>>>> do we do when the drm_gpuvm_bo's refcount drops to zero in
>>>>>>>>>>>> drm_gpuva_unlink()?
>>>>>>>>>>>> Are we guaranteed that at this point of time the 
>>>>>>>>>>>> drm_gpuvm_bo is not
>>>>>>>>>>>> on the
>>>>>>>>>>>> evicted list? Because otherwise we would call 
>>>>>>>>>>>> drm_gpuvm_bo_destroy()
>>>>>>>>>>>> with the
>>>>>>>>>>>> dma-resv lock held, which wouldn't be allowed, since
>>>>>>>>>>>> drm_gpuvm_bo_destroy()
>>>>>>>>>>>> might drop the last reference to the drm_gem_object and 
>>>>>>>>>>>> hence we'd
>>>>>>>>>>>> potentially
>>>>>>>>>>>> free the dma-resv lock while holding it, at least if it's 
>>>>>>>>>>>> an external
>>>>>>>>>>>> object.
>>>>>>>>>>> Easiest way in this scheme is to think of the lists as being 
>>>>>>>>>>> protected
>>>>>>>>>>> by the vm's resv lock. That means anybody calling unlink() 
>>>>>>>>>>> must also
>>>>>>>>>>> hold the vm's resv lock. (Which is OK from an UAF point of 
>>>>>>>>>>> view, but
>>>>>>>>>>> perhaps not from a locking inversion POW from an async list 
>>>>>>>>>>> update).
>>>>>>>>>> This would mean that on unlink() we'd need to hold the VM's 
>>>>>>>>>> resv lock and the
>>>>>>>>>> corresponding GEM's resv lock (in case they're not the same 
>>>>>>>>>> anyways) because the
>>>>>>>>>> VM's resv lock would protect the external / evicted object 
>>>>>>>>>> lists and the GEM
>>>>>>>>>> objects resv lock protects the GEM's list of drm_gpuvm_bos 
>>>>>>>>>> and the
>>>>>>>>>> drm_gpuvm_bo's list of drm_gpuvas.
>>>>>>>>>>
>>>>>>>>>>>>>> For extobjs an outer lock would be enough in case of Xe, 
>>>>>>>>>>>>>> but I
>>>>>>>>>>>>>> really would not
>>>>>>>>>>>>>> like to add even more complexity just to get the spinlock 
>>>>>>>>>>>>>> out of
>>>>>>>>>>>>>> the way in case
>>>>>>>>>>>>>> the driver already has an outer lock protecting this path.
>>>>>>>>>>>>> I must disagree here. These spinlocks and atomic 
>>>>>>>>>>>>> operations are
>>>>>>>>>>>>> pretty
>>>>>>>>>>>>> costly and as discussed earlier this type of locking was 
>>>>>>>>>>>>> the reason
>>>>>>>>>>>>> (at
>>>>>>>>>>>>> least according to the commit message) that made Christian 
>>>>>>>>>>>>> drop the
>>>>>>>>>>>>> XArray
>>>>>>>>>>>>> use in drm_exec for the same set of objects: "The locking 
>>>>>>>>>>>>> overhead
>>>>>>>>>>>>> is
>>>>>>>>>>>>> unecessary and measurable". IMHO the spinlock is the added
>>>>>>>>>>>>> complexity and a
>>>>>>>>>>>>> single wide lock following the drm locking guidelines set 
>>>>>>>>>>>>> out by
>>>>>>>>>>>>> Daniel and
>>>>>>>>>>>>> David should really be the default choice with an opt-in 
>>>>>>>>>>>>> for a
>>>>>>>>>>>>> spinlock if
>>>>>>>>>>>>> needed for async and pushing out to a wq is not an option.
>>>>>>>>>>>> For the external object list an outer lock would work as 
>>>>>>>>>>>> long as it's
>>>>>>>>>>>> not the
>>>>>>>>>>>> dma-resv lock of the corresponding GEM object, since here 
>>>>>>>>>>>> we actually
>>>>>>>>>>>> need to
>>>>>>>>>>>> remove the list entry from the external object list on
>>>>>>>>>>>> drm_gpuvm_bo_destroy().
>>>>>>>>>>>> It's just a bit weird design wise that drivers would need 
>>>>>>>>>>>> to take
>>>>>>>>>>>> this outer
>>>>>>>>>>>> lock on:
>>>>>>>>>>>>
>>>>>>>>>>>> - drm_gpuvm_bo_extobj_add()
>>>>>>>>>>>> - drm_gpuvm_bo_destroy()        (and hence also 
>>>>>>>>>>>> drm_gpuvm_bo_put())
>>>>>>>>>>>> - drm_gpuva_unlink()            (because it needs to call
>>>>>>>>>>>> drm_gpuvm_bo_put())
>>>>>>>>>>>> - drm_gpuvm_exec_lock()
>>>>>>>>>>>> - drm_gpuvm_exec_lock_array()
>>>>>>>>>>>> - drm_gpuvm_prepare_range()
>>>>>>>>>>>>
>>>>>>>>>>>> Given that it seems reasonable to do all the required locking
>>>>>>>>>>>> internally.
>>>>>>>>>>>  From a design POW, there has been a clear direction in XE 
>>>>>>>>>>> to make
>>>>>>>>>>> things similar to mmap() / munmap(), so this outer lock, 
>>>>>>>>>>> which in Xe is
>>>>>>>>>>> an rwsem, is used in a similar way as the mmap_lock. It's 
>>>>>>>>>>> protecting
>>>>>>>>>>> the page-table structures and vma rb tree, the userptr 
>>>>>>>>>>> structures and
>>>>>>>>>>> the extobj list. Basically it's taken early in the exec 
>>>>>>>>>>> IOCTL, the
>>>>>>>>>>> VM_BIND ioctl, the compute rebind worker and the pagefault 
>>>>>>>>>>> handler, so
>>>>>>>>>>> all of the above are just asserting that it is taken in the 
>>>>>>>>>>> correct
>>>>>>>>>>> mode.
>>>>>>>>>>>
>>>>>>>>>>> But strictly with this scheme one could also use the vm's 
>>>>>>>>>>> dma_resv for
>>>>>>>>>>> the extobj list since with drm_exec, it's locked before 
>>>>>>>>>>> traversing the
>>>>>>>>>>> list.
>>>>>>>>>>>
>>>>>>>>>>> The whole point of this scheme is to rely on locks that you 
>>>>>>>>>>> already are
>>>>>>>>>>> supposed to be holding for various reasons and is simple to 
>>>>>>>>>>> comprehend.
>>>>>>>>>> I don't agree that we're supposed to hold the VM's resv lock 
>>>>>>>>>> anyways for
>>>>>>>>>> functions like drm_gpuvm_bo_put() or drm_gpuva_unlink(), but 
>>>>>>>>>> I'm fine using it
>>>>>>>>>> for that purpose nevertheless.
>>>>>>>>>>
>>>>>>>>>>>> In order to at least place lockdep checks, the driver would 
>>>>>>>>>>>> need to
>>>>>>>>>>>> supply the
>>>>>>>>>>>> corresponding lock's lockdep_map, because the GPUVM 
>>>>>>>>>>>> otherwise doesn't
>>>>>>>>>>>> know about
>>>>>>>>>>>> the lock.
>>>>>>>>>>> Yes, that sounds reasonable. One lockdep map per list.
>>>>>>>>>> I'd really like to avoid that, especially now that everything 
>>>>>>>>>> got simpler. We
>>>>>>>>>> should define the actual locks to take instead.
>>>>>>>>>>
>>>>>>>>>>>> Out of curiosity, what is the overhead of a spin_lock() 
>>>>>>>>>>>> that doesn't
>>>>>>>>>>>> need to
>>>>>>>>>>>> spin?
>>>>>>>>>>> I guess it's hard to tell exactly, but it is much lower on 
>>>>>>>>>>> modern x86
>>>>>>>>>>> than what it used to be. Not sure about ARM, which is the other
>>>>>>>>>>> architecture important to us. I figure if there is little 
>>>>>>>>>>> cache-line
>>>>>>>>>>> bouncing the main overhead comes from the implied barriers.
>>>>>>>>>>>
>>>>>>>>>>>>> A pretty simple way that would not add much code would be
>>>>>>>>>>>>>
>>>>>>>>>>>>> static void gpuvm_cond_spin_lock(const struct drm_gpuvm 
>>>>>>>>>>>>> *gpuvm,
>>>>>>>>>>>>> spinlock_t
>>>>>>>>>>>>> *lock)
>>>>>>>>>>>>>
>>>>>>>>>>>>> {
>>>>>>>>>>>>>
>>>>>>>>>>>>>      if (!gpuvm->resv_protected_lists)
>>>>>>>>>>>>>          spin_lock(lock);
>>>>>>>>>>>>>
>>>>>>>>>>>>> }
>>>>>>>>>>>>>
>>>>>>>>>>>>>>> For such drivers, that would require anybody calling 
>>>>>>>>>>>>>>> unlink to
>>>>>>>>>>>>>>> hold the vm's
>>>>>>>>>>>>>>> resv, though.
>>>>>>>>>>>>>> In V4 I want to go back to having a dedicated lock for 
>>>>>>>>>>>>>> the GEMs
>>>>>>>>>>>>>> gpuva list (or
>>>>>>>>>>>>>> VM_BO list to be more precise). We can't just use the 
>>>>>>>>>>>>>> dma-resv
>>>>>>>>>>>>>> lock for that
>>>>>>>>>>>>>> with VM_BO abstractions, because on destruction of a 
>>>>>>>>>>>>>> VM_BO we
>>>>>>>>>>>>>> otherwise wouldn't
>>>>>>>>>>>>>> be allowed to already hold the dma-resv lock. That's the 
>>>>>>>>>>>>>> fix I
>>>>>>>>>>>>>> was referring to
>>>>>>>>>>>>>> earlier.
>>>>>>>>>>>>> Yeah, I can see the need for a dedicated lock for the 
>>>>>>>>>>>>> GEM's gpuva
>>>>>>>>>>>>> list, but
>>>>>>>>>>>>> holding the vm's dma-resv lock across the unlink shouldn't 
>>>>>>>>>>>>> be a
>>>>>>>>>>>>> problem. We
>>>>>>>>>>>>> may free the object and a pointer to the vm's resv during 
>>>>>>>>>>>>> unlink
>>>>>>>>>>>>> but we
>>>>>>>>>>>>> don't free the vm's resv.  It'd be a matter of ensuring 
>>>>>>>>>>>>> that any
>>>>>>>>>>>>> calls to
>>>>>>>>>>>>> unlink from *within* drm_gpuvm allows it to be held.
>>>>>>>>>>>> Drivers calling unlink() from the fence signaling path 
>>>>>>>>>>>> can't use the
>>>>>>>>>>>> VM's
>>>>>>>>>>>> dma-resv lock.
>>>>>>>>>>> Yes, that made me a bit curious because in the current 
>>>>>>>>>>> version the code
>>>>>>>>>>> required the object's dma_resv for unlink() which can't be 
>>>>>>>>>>> grabbed
>>>>>>>>>>> either from the fence signaling path. So are there any 
>>>>>>>>>>> drivers actually
>>>>>>>>>>> wanting to do that? If so, they will either need to resort 
>>>>>>>>>>> to the
>>>>>>>>>>> current spinlock solution or they will need to call unlink 
>>>>>>>>>>> from a
>>>>>>>>>>> workqueue item.
>>>>>>>>>> As Boris already mentioned we have the dma-resv lock by 
>>>>>>>>>> default or a driver
>>>>>>>>>> specific GEM gpuva lock as opt-in. Now, we can get rid of the 
>>>>>>>>>> latter.
>>>>>>>>>>
>>>>>>>>>>>> Also, what if the object is an external object? We can't 
>>>>>>>>>>>> use the VM's
>>>>>>>>>>>> dma-resv
>>>>>>>>>>>> lock here.
>>>>>>>>>>> Why? Typically (sync) unlink is only ever called from an 
>>>>>>>>>>> unbind-like
>>>>>>>>>>> operation where it should be trivial to grab the vm's resv. 
>>>>>>>>>>> Or, for
>>>>>>>>>>> that matter any outer lock protecting the extobj list. Rule 
>>>>>>>>>>> would be
>>>>>>>>>>> the drm_gpuvm_bo::entry::extobj  and 
>>>>>>>>>>> drm_gpuvm_bo::entry::evict would
>>>>>>>>>>> be protected by either the vm's dma_resv (or possibly an 
>>>>>>>>>>> outer lock in
>>>>>>>>>>> the case of the extobj list).
>>>>>>>>>> Outer lock wouldn't have been working for updates in the 
>>>>>>>>>> async path, but
>>>>>>>>>> shouldn't be relevant anymore. We could use the VM's resv for 
>>>>>>>>>> that.
>>>>>>>>>>
>>>>>>>>>>>>   And we can't have the GEM objs dma-resv lock held when 
>>>>>>>>>>>> calling
>>>>>>>>>>>> unlink(), since unlink() calls drm_gpuvm_bo_put(), which if 
>>>>>>>>>>>> the
>>>>>>>>>>>> refcount drops
>>>>>>>>>>>> to zero calls drm_gpuvm_bo_destroy() and 
>>>>>>>>>>>> drm_gpuvm_bo_destroy() might
>>>>>>>>>>>> drop the
>>>>>>>>>>>> last reference of the GEM object.
>>>>>>>>>>> Yes, but this is a different problem as to what exactly 
>>>>>>>>>>> protects
>>>>>>>>>>> drm_gpuvm_bo::entry::gem. Either as you suggest an internal 
>>>>>>>>>>> per bo list
>>>>>>>>>>> lock, or if we want to keep the bo's dma_resv we need to 
>>>>>>>>>>> ensure that
>>>>>>>>>>> the caller of dma_resv_unlock(obj->resv) actually refcounts 
>>>>>>>>>>> its obj
>>>>>>>>>>> pointer, and doesn't implicitly rely on the gpuvm_bo's 
>>>>>>>>>>> refcount (I know
>>>>>>>>>>> Boris didn't like that, but requiring an explicit refcount 
>>>>>>>>>>> for a
>>>>>>>>>>> pointer you dereference unless you're under a lock that 
>>>>>>>>>>> ensures keeping
>>>>>>>>>>> the object alive is pretty much required?) But anyway for the
>>>>>>>>>>> drm_gpuvm_bo::entry::gem list protection (bo resv or 
>>>>>>>>>>> internal spinlock)
>>>>>>>>>>> I don't have a strong preference.
>>>>>>>>>> We can keep the GEM objects dma-resv lock, however as 
>>>>>>>>>> mentioned above
>>>>>>>>>> drm_gpuva_unlink() and drm_gpuvm_bo_put() then requires both 
>>>>>>>>>> the VM's resv lock
>>>>>>>>>> and the GEM's resv lock in case they differ.
>>>>>>>>>>
>>>>>>>>>>>>   All those problems go away with a dedicated
>>>>>>>>>>>> GEM gpuva list lock.
>>>>>>>>>>> I don't think these are real problems.
>>>>>>>>>>> With the excepton of the eviction list "trick" where we 
>>>>>>>>>>> currently have
>>>>>>>>>>> slightly different approach to collect external bos needing 
>>>>>>>>>>> rebinding,
>>>>>>>>>>> we have this working fine.
>>>>>>>>>>>
>>>>>>>>>>> TBH I think pretty much the only situation where the 
>>>>>>>>>>> spinlock is needed
>>>>>>>>>>> is for async updates of these lists, unless a wq item can be 
>>>>>>>>>>> used for
>>>>>>>>>>> that, but it doesn't really seem like the current code 
>>>>>>>>>>> allows for such
>>>>>>>>>>> updates anyway? It complicates the code a lot, adds overhead 
>>>>>>>>>>> and also
>>>>>>>>>>> adds the requirement for refcounting during list traversal.
>>>>>>>>>>>
>>>>>>>>>>> /Thomas
>>>>>>>>>>>
>>>>>>>>>>>>> /Thomas
>>>>>>>>>>>>>
>>>>>>>>>>>>>
>>>>>>>>>>>>>>> It seems that with that also the refcount could be make 
>>>>>>>>>>>>>>> non-
>>>>>>>>>>>>>>> atomic.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> All in the spirit of the drm locking guidelines "use big 
>>>>>>>>>>>>>>> locks
>>>>>>>>>>>>>>> when
>>>>>>>>>>>>>>> possible".
>>>>>>>>>>>>>>> Lower level locks only when necessary for performance or
>>>>>>>>>>>>>>> locking inversion?
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> /Thomas
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> + *
>>>>>>>>>>>>>>>> + * Elements popped from the original list are kept in a
>>>>>>>>>>>>>>>> local list, so removal
>>>>>>>>>>>>>>>> + * and is_empty checks can still happen while we're
>>>>>>>>>>>>>>>> iterating the list.
>>>>>>>>>>>>>>>> + */
>>>>>>>>>>>>>>>> +#define get_next_vm_bo_from_list(__gpuvm, __list_name,
>>>>>>>>>>>>>>>> __local_list, __prev_vm_bo)     \
>>>>>>>>>>>>>>>> +       ({
>>>>>>>>>>>>>>>>                             \
>>>>>>>>>>>>>>>> +               struct drm_gpuvm_bo
>>>>>>>>>>>>>>>> *__vm_bo;                                           \
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>                             \
>>>>>>>>>>>>>>>> +               drm_gpuvm_bo_put(__prev_vm_bo);
>>>>>>>>>>>>>>>>                             \
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>                             \
>>>>>>>>>>>>>>>> +               spin_lock(&(__gpuvm)-
>>>>>>>>>>>>>>>>> __list_name.lock);                                \
>>>>>>>>>>>>>>>> +               while (!list_empty(&(__gpuvm)-
>>>>>>>>>>>>>>>>> __list_name.list)) {                     \
>>>>>>>>>>>>>>>> +                       __vm_bo =
>>>>>>>>>>>>>>>> list_first_entry(&(__gpuvm)->__list_name.list,        \
>>>>>>>>>>>>>>>> + struct
>>>>>>>>>>>>>>>> drm_gpuvm_bo,                 \
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> list.entry.__list_name);             \
>>>>>>>>>>>>>>>> +                       if
>>>>>>>>>>>>>>>> (drm_gpuvm_bo_get_unless_zero(__vm_bo))
>>>>>>>>>>>>>>>> {                    \
>>>>>>>>>>>>>>>> +                               list_move_tail(&(__vm_bo)-
>>>>>>>>>>>>>>>>> list.entry.__list_name,      \
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> __local_list);                           \
>>>>>>>>>>>>>>>> +                               break;
>>>>>>>>>>>>>>>>                             \
>>>>>>>>>>>>>>>> +                       } else
>>>>>>>>>>>>>>>> {                                                        \
>>>>>>>>>>>>>>>> +                               list_del_init(&(__vm_bo)-
>>>>>>>>>>>>>>>>> list.entry.__list_name);      \
>>>>>>>>>>>>>>>> +                               __vm_bo =
>>>>>>>>>>>>>>>> NULL;                                         \
>>>>>>>>>>>>>>>> +                       }
>>>>>>>>>>>>>>>>                             \
>>>>>>>>>>>>>>>> +               }
>>>>>>>>>>>>>>>>                             \
>>>>>>>>>>>>>>>> +               spin_unlock(&(__gpuvm)-
>>>>>>>>>>>>>>>>> __list_name.lock);                              \
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>                             \
>>>>>>>>>>>>>>>> +               __vm_bo;
>>>>>>>>>>>>>>>>                             \
>>>>>>>>>>>>>>>> +       })
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +/**
>>>>>>>>>>>>>>>> + * for_each_vm_bo_in_list() - internal vm_bo list 
>>>>>>>>>>>>>>>> iterator
>>>>>>>>>>>>>>>> + *
>>>>>>>>>>>>>>>> + * This helper is here to provide lockless list 
>>>>>>>>>>>>>>>> iteration.
>>>>>>>>>>>>>>>> Lockless as in, the
>>>>>>>>>>>>>>>> + * iterator releases the lock immediately after 
>>>>>>>>>>>>>>>> picking the
>>>>>>>>>>>>>>>> first element from the
>>>>>>>>>>>>>>>> + * list, so list insertion and deletion can happen
>>>>>>>>>>>>>>>> concurrently.
>>>>>>>>>>>>>>>> + *
>>>>>>>>>>>>>>>> + * Typical use:
>>>>>>>>>>>>>>>> + *
>>>>>>>>>>>>>>>> + *     struct drm_gpuvm_bo *vm_bo;
>>>>>>>>>>>>>>>> + *     LIST_HEAD(my_local_list);
>>>>>>>>>>>>>>>> + *
>>>>>>>>>>>>>>>> + *     ret = 0;
>>>>>>>>>>>>>>>> + *     drm_gpuvm_for_each_vm_bo(gpuvm, <list_name>,
>>>>>>>>>>>>>>>> &my_local_list, vm_bo) {
>>>>>>>>>>>>>>>> + *             ret = do_something_with_vm_bo(..., vm_bo);
>>>>>>>>>>>>>>>> + *             if (ret)
>>>>>>>>>>>>>>>> + *                     break;
>>>>>>>>>>>>>>>> + *     }
>>>>>>>>>>>>>>>> + *     drm_gpuvm_bo_put(vm_bo);
>>>>>>>>>>>>>>>> + *     drm_gpuvm_restore_vm_bo_list(gpuvm, <list_name>,
>>>>>>>>>>>>>>>> &my_local_list);
>>>>>>>>>>>>>>>> + *
>>>>>>>>>>>>>>>> + *
>>>>>>>>>>>>>>>> + * Only used for internal list iterations, not meant 
>>>>>>>>>>>>>>>> to be
>>>>>>>>>>>>>>>> exposed to the outside
>>>>>>>>>>>>>>>> + * world.
>>>>>>>>>>>>>>>> + */
>>>>>>>>>>>>>>>> +#define for_each_vm_bo_in_list(__gpuvm, __list_name,
>>>>>>>>>>>>>>>> __local_list, __vm_bo)    \
>>>>>>>>>>>>>>>> +       for (__vm_bo = get_next_vm_bo_from_list(__gpuvm,
>>>>>>>>>>>>>>>> __list_name,           \
>>>>>>>>>>>>>>>> +                                               __local_list, 
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> NULL);            \
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> __vm_bo;
>>>>>>>>>>>>>>>>        \
>>>>>>>>>>>>>>>> +            __vm_bo = get_next_vm_bo_from_list(__gpuvm,
>>>>>>>>>>>>>>>> __list_name,           \
>>>>>>>>>>>>>>>> +                                               __local_list, 
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> __vm_bo))         \
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +/**
>>>>>>>>>>>>>>>> + * restore_vm_bo_list() - move vm_bo elements back to 
>>>>>>>>>>>>>>>> their
>>>>>>>>>>>>>>>> original list
>>>>>>>>>>>>>>>> + * @__gpuvm: The GPU VM
>>>>>>>>>>>>>>>> + * @__list_name: The name of the list we're iterating on
>>>>>>>>>>>>>>>> + * @__local_list: A pointer to the local list used to 
>>>>>>>>>>>>>>>> store
>>>>>>>>>>>>>>>> already iterated items
>>>>>>>>>>>>>>>> + *
>>>>>>>>>>>>>>>> + * When we're done iterating a vm_bo list, we should call
>>>>>>>>>>>>>>>> restore_vm_bo_list()
>>>>>>>>>>>>>>>> + * to restore the original state and let new 
>>>>>>>>>>>>>>>> iterations take
>>>>>>>>>>>>>>>> place.
>>>>>>>>>>>>>>>> + */
>>>>>>>>>>>>>>>> +#define restore_vm_bo_list(__gpuvm, __list_name,
>>>>>>>>>>>>>>>> __local_list)                         \
>>>>>>>>>>>>>>>> +       do
>>>>>>>>>>>>>>>> {
>>>>>>>>>>>>>>>>                  \
>>>>>>>>>>>>>>>> +               /* Merge back the two lists, moving local
>>>>>>>>>>>>>>>> list elements to the          \
>>>>>>>>>>>>>>>> +                * head to preserve previous ordering, in
>>>>>>>>>>>>>>>> case it matters.              \
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> */
>>>>>>>>>>>>>>>>            \
>>>>>>>>>>>>>>>> +               spin_lock(&(__gpuvm)-
>>>>>>>>>>>>>>>>> __list_name.lock);                                \
>>>>>>>>>>>>>>>> +               list_splice(__local_list, &(__gpuvm)-
>>>>>>>>>>>>>>>>> __list_name.list);                \
>>>>>>>>>>>>>>>> +               spin_unlock(&(__gpuvm)-
>>>>>>>>>>>>>>>>> __list_name.lock);                              \
>>>>>>>>>>>>>>>> +       } while (0)
>>>>>>>>>>>>>>>> +/**
>>>>>>>>>>>>>>>> + * drm_gpuvm_bo_list_add() - insert a vm_bo into the 
>>>>>>>>>>>>>>>> given
>>>>>>>>>>>>>>>> list
>>>>>>>>>>>>>>>> + * @__vm_bo: the &drm_gpuvm_bo
>>>>>>>>>>>>>>>> + * @__list_name: the name of the list to insert into
>>>>>>>>>>>>>>>> + *
>>>>>>>>>>>>>>>> + * Inserts the given @__vm_bo into the list specified by
>>>>>>>>>>>>>>>> @__list_name and
>>>>>>>>>>>>>>>> + * increases the vm_bo's reference count.
>>>>>>>>>>>>>>>> + */
>>>>>>>>>>>>>>>> +#define drm_gpuvm_bo_list_add(__vm_bo,
>>>>>>>>>>>>>>>> __list_name)                            \
>>>>>>>>>>>>>>>> +       do
>>>>>>>>>>>>>>>> {
>>>>>>>>>>>>>>>>          \
>>>>>>>>>>>>>>>> +               spin_lock(&(__vm_bo)->vm-
>>>>>>>>>>>>>>>>> __list_name.lock);                    \
>>>>>>>>>>>>>>>> +               if (list_empty(&(__vm_bo)-
>>>>>>>>>>>>>>>>> list.entry.__list_name))             \
>>>>>>>>>>>>>>>> +                       list_add_tail(&(__vm_bo)-
>>>>>>>>>>>>>>>>> list.entry.__list_name,       \
>>>>>>>>>>>>>>>> + &(__vm_bo)->vm-
>>>>>>>>>>>>>>>>> __list_name.list);        \
>>>>>>>>>>>>>>>> +               spin_unlock(&(__vm_bo)->vm-
>>>>>>>>>>>>>>>>> __list_name.lock);                  \
>>>>>>>>>>>>>>>> +       } while (0)
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +/**
>>>>>>>>>>>>>>>> + * drm_gpuvm_bo_list_del() - remove a vm_bo from the 
>>>>>>>>>>>>>>>> given
>>>>>>>>>>>>>>>> list
>>>>>>>>>>>>>>>> + * @__vm_bo: the &drm_gpuvm_bo
>>>>>>>>>>>>>>>> + * @__list_name: the name of the list to insert into
>>>>>>>>>>>>>>>> + *
>>>>>>>>>>>>>>>> + * Removes the given @__vm_bo from the list specified by
>>>>>>>>>>>>>>>> @__list_name and
>>>>>>>>>>>>>>>> + * decreases the vm_bo's reference count.
>>>>>>>>>>>>>>>> + */
>>>>>>>>>>>>>>>> +#define drm_gpuvm_bo_list_del(__vm_bo,
>>>>>>>>>>>>>>>> __list_name)                            \
>>>>>>>>>>>>>>>> +       do
>>>>>>>>>>>>>>>> {
>>>>>>>>>>>>>>>>          \
>>>>>>>>>>>>>>>> +               spin_lock(&(__vm_bo)->vm-
>>>>>>>>>>>>>>>>> __list_name.lock);                    \
>>>>>>>>>>>>>>>> +               if (!list_empty(&(__vm_bo)-
>>>>>>>>>>>>>>>>> list.entry.__list_name))            \
>>>>>>>>>>>>>>>> +                       list_del_init(&(__vm_bo)-
>>>>>>>>>>>>>>>>> list.entry.__list_name);      \
>>>>>>>>>>>>>>>> +               spin_unlock(&(__vm_bo)->vm-
>>>>>>>>>>>>>>>>> __list_name.lock);                  \
>>>>>>>>>>>>>>>> +       } while (0)
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +static int __must_check
>>>>>>>>>>>>>>>> +drm_gpuvm_bo_get_unless_zero(struct drm_gpuvm_bo *vm_bo);
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>     #define to_drm_gpuva(__node) container_of((__node), 
>>>>>>>>>>>>>>>> struct
>>>>>>>>>>>>>>>> drm_gpuva, rb.node)
>>>>>>>>>>>>>>>>     #define GPUVA_START(node) ((node)->va.addr)
>>>>>>>>>>>>>>>> @@ -713,6 +867,12 @@ drm_gpuvm_init(struct drm_gpuvm 
>>>>>>>>>>>>>>>> *gpuvm,
>>>>>>>>>>>>>>>> struct drm_device *drm,
>>>>>>>>>>>>>>>>          gpuvm->rb.tree = RB_ROOT_CACHED;
>>>>>>>>>>>>>>>>          INIT_LIST_HEAD(&gpuvm->rb.list);
>>>>>>>>>>>>>>>> +       INIT_LIST_HEAD(&gpuvm->extobj.list);
>>>>>>>>>>>>>>>> +       spin_lock_init(&gpuvm->extobj.lock);
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +       INIT_LIST_HEAD(&gpuvm->evict.list);
>>>>>>>>>>>>>>>> +       spin_lock_init(&gpuvm->evict.lock);
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>         ��drm_gpuva_check_overflow(start_offset, range);
>>>>>>>>>>>>>>>>          gpuvm->mm_start = start_offset;
>>>>>>>>>>>>>>>>          gpuvm->mm_range = range;
>>>>>>>>>>>>>>>> @@ -754,10 +914,302 @@ drm_gpuvm_destroy(struct drm_gpuvm
>>>>>>>>>>>>>>>> *gpuvm)
>>>>>>>>>>>>>>>>          WARN(!RB_EMPTY_ROOT(&gpuvm->rb.tree.rb_root),
>>>>>>>>>>>>>>>>               "GPUVA tree is not empty, potentially 
>>>>>>>>>>>>>>>> leaking
>>>>>>>>>>>>>>>> memory.\n");
>>>>>>>>>>>>>>>> +       WARN(!list_empty(&gpuvm->extobj.list), "Extobj 
>>>>>>>>>>>>>>>> list
>>>>>>>>>>>>>>>> should be empty.\n");
>>>>>>>>>>>>>>>> +       WARN(!list_empty(&gpuvm->evict.list), "Evict list
>>>>>>>>>>>>>>>> should be empty.\n");
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>          drm_gem_private_object_fini(&gpuvm->d_obj);
>>>>>>>>>>>>>>>>     }
>>>>>>>>>>>>>>>> EXPORT_SYMBOL_GPL(drm_gpuvm_destroy);
>>>>>>>>>>>>>>>> +/**
>>>>>>>>>>>>>>>> + * drm_gpuvm_prepare_objects() - prepare all 
>>>>>>>>>>>>>>>> assoiciated BOs
>>>>>>>>>>>>>>>> + * @gpuvm: the &drm_gpuvm
>>>>>>>>>>>>>>>> + * @exec: the &drm_exec locking context
>>>>>>>>>>>>>>>> + * @num_fences: the amount of &dma_fences to reserve
>>>>>>>>>>>>>>>> + *
>>>>>>>>>>>>>>>> + * Calls drm_exec_prepare_obj() for all 
>>>>>>>>>>>>>>>> &drm_gem_objects the
>>>>>>>>>>>>>>>> given
>>>>>>>>>>>>>>>> + * &drm_gpuvm contains mappings of.
>>>>>>>>>>>>>>>> + *
>>>>>>>>>>>>>>>> + * Using this function directly, it is the drivers
>>>>>>>>>>>>>>>> responsibility to call
>>>>>>>>>>>>>>>> + * drm_exec_init() and drm_exec_fini() accordingly.
>>>>>>>>>>>>>>>> + *
>>>>>>>>>>>>>>>> + * Note: This function is safe against concurrent 
>>>>>>>>>>>>>>>> insertion
>>>>>>>>>>>>>>>> and removal of
>>>>>>>>>>>>>>>> + * external objects, however it is not safe against
>>>>>>>>>>>>>>>> concurrent usage itself.
>>>>>>>>>>>>>>>> + *
>>>>>>>>>>>>>>>> + * Drivers need to make sure to protect this case with
>>>>>>>>>>>>>>>> either an outer VM lock
>>>>>>>>>>>>>>>> + * or by calling drm_gpuvm_prepare_vm() before this 
>>>>>>>>>>>>>>>> function
>>>>>>>>>>>>>>>> within the
>>>>>>>>>>>>>>>> + * drm_exec_until_all_locked() loop, such that the 
>>>>>>>>>>>>>>>> GPUVM's
>>>>>>>>>>>>>>>> dma-resv lock ensures
>>>>>>>>>>>>>>>> + * mutual exclusion.
>>>>>>>>>>>>>>>> + *
>>>>>>>>>>>>>>>> + * Returns: 0 on success, negative error code on failure.
>>>>>>>>>>>>>>>> + */
>>>>>>>>>>>>>>>> +int
>>>>>>>>>>>>>>>> +drm_gpuvm_prepare_objects(struct drm_gpuvm *gpuvm,
>>>>>>>>>>>>>>>> +                         struct drm_exec *exec,
>>>>>>>>>>>>>>>> +                         unsigned int num_fences)
>>>>>>>>>>>>>>>> +{
>>>>>>>>>>>>>>>> +       struct drm_gpuvm_bo *vm_bo;
>>>>>>>>>>>>>>>> +       LIST_HEAD(extobjs);
>>>>>>>>>>>>>>>> +       int ret = 0;
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +       for_each_vm_bo_in_list(gpuvm, extobj, &extobjs,
>>>>>>>>>>>>>>>> vm_bo) {
>>>>>>>>>>>>>>>> +               ret = drm_exec_prepare_obj(exec, 
>>>>>>>>>>>>>>>> vm_bo->obj,
>>>>>>>>>>>>>>>> num_fences);
>>>>>>>>>>>>>>>> +               if (ret)
>>>>>>>>>>>>>>>> +                       break;
>>>>>>>>>>>>>>>> +       }
>>>>>>>>>>>>>>>> +       /* Drop ref in case we break out of the loop. */
>>>>>>>>>>>>>>>> +       drm_gpuvm_bo_put(vm_bo);
>>>>>>>>>>>>>>>> +       restore_vm_bo_list(gpuvm, extobj, &extobjs);
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +       return ret;
>>>>>>>>>>>>>>>> +}
>>>>>>>>>>>>>>>> +EXPORT_SYMBOL_GPL(drm_gpuvm_prepare_objects);
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +/**
>>>>>>>>>>>>>>>> + * drm_gpuvm_prepare_range() - prepare all BOs mapped 
>>>>>>>>>>>>>>>> within
>>>>>>>>>>>>>>>> a given range
>>>>>>>>>>>>>>>> + * @gpuvm: the &drm_gpuvm
>>>>>>>>>>>>>>>> + * @exec: the &drm_exec locking context
>>>>>>>>>>>>>>>> + * @addr: the start address within the VA space
>>>>>>>>>>>>>>>> + * @range: the range to iterate within the VA space
>>>>>>>>>>>>>>>> + * @num_fences: the amount of &dma_fences to reserve
>>>>>>>>>>>>>>>> + *
>>>>>>>>>>>>>>>> + * Calls drm_exec_prepare_obj() for all &drm_gem_objects
>>>>>>>>>>>>>>>> mapped between @addr
>>>>>>>>>>>>>>>> + * and @addr + @range.
>>>>>>>>>>>>>>>> + *
>>>>>>>>>>>>>>>> + * Returns: 0 on success, negative error code on failure.
>>>>>>>>>>>>>>>> + */
>>>>>>>>>>>>>>>> +int
>>>>>>>>>>>>>>>> +drm_gpuvm_prepare_range(struct drm_gpuvm *gpuvm, struct
>>>>>>>>>>>>>>>> drm_exec *exec,
>>>>>>>>>>>>>>>> +                       u64 addr, u64 range, unsigned int
>>>>>>>>>>>>>>>> num_fences)
>>>>>>>>>>>>>>>> +{
>>>>>>>>>>>>>>>> +       struct drm_gpuva *va;
>>>>>>>>>>>>>>>> +       u64 end = addr + range;
>>>>>>>>>>>>>>>> +       int ret;
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +       drm_gpuvm_for_each_va_range(va, gpuvm, addr, 
>>>>>>>>>>>>>>>> end) {
>>>>>>>>>>>>>>>> +               struct drm_gem_object *obj = va->gem.obj;
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +               ret = drm_exec_prepare_obj(exec, obj,
>>>>>>>>>>>>>>>> num_fences);
>>>>>>>>>>>>>>>> +               if (ret)
>>>>>>>>>>>>>>>> +                       return ret;
>>>>>>>>>>>>>>>> +       }
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +       return 0;
>>>>>>>>>>>>>>>> +}
>>>>>>>>>>>>>>>> +EXPORT_SYMBOL_GPL(drm_gpuvm_prepare_range);
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +/**
>>>>>>>>>>>>>>>> + * drm_gpuvm_exec_lock() - lock all dma-resv of all
>>>>>>>>>>>>>>>> assoiciated BOs
>>>>>>>>>>>>>>>> + * @vm_exec: the &drm_gpuvm_exec abstraction
>>>>>>>>>>>>>>>> + * @num_fences: the amount of &dma_fences to reserve
>>>>>>>>>>>>>>>> + * @interruptible: sleep interruptible if waiting
>>>>>>>>>>>>>>>> + *
>>>>>>>>>>>>>>>> + * Acquires all dma-resv locks of all &drm_gem_objects 
>>>>>>>>>>>>>>>> the
>>>>>>>>>>>>>>>> given
>>>>>>>>>>>>>>>> + * &drm_gpuvm contains mappings of.
>>>>>>>>>>>>>>>> + *
>>>>>>>>>>>>>>>> + * Addionally, when calling this function with struct
>>>>>>>>>>>>>>>> drm_gpuvm_exec::extra
>>>>>>>>>>>>>>>> + * being set the driver receives the given @fn 
>>>>>>>>>>>>>>>> callback to
>>>>>>>>>>>>>>>> lock additional
>>>>>>>>>>>>>>>> + * dma-resv in the context of the &drm_gpuvm_exec 
>>>>>>>>>>>>>>>> instance.
>>>>>>>>>>>>>>>> Typically, drivers
>>>>>>>>>>>>>>>> + * would call drm_exec_prepare_obj() from within this
>>>>>>>>>>>>>>>> callback.
>>>>>>>>>>>>>>>> + *
>>>>>>>>>>>>>>>> + * Returns: 0 on success, negative error code on failure.
>>>>>>>>>>>>>>>> + */
>>>>>>>>>>>>>>>> +int
>>>>>>>>>>>>>>>> +drm_gpuvm_exec_lock(struct drm_gpuvm_exec *vm_exec,
>>>>>>>>>>>>>>>> +                   unsigned int num_fences,
>>>>>>>>>>>>>>>> +                   bool interruptible)
>>>>>>>>>>>>>>>> +{
>>>>>>>>>>>>>>>> +       struct drm_gpuvm *gpuvm = vm_exec->vm;
>>>>>>>>>>>>>>>> +       struct drm_exec *exec = &vm_exec->exec;
>>>>>>>>>>>>>>>> +       uint32_t flags;
>>>>>>>>>>>>>>>> +       int ret;
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +       flags = interruptible ? 
>>>>>>>>>>>>>>>> DRM_EXEC_INTERRUPTIBLE_WAIT :
>>>>>>>>>>>>>>>> 0 |
>>>>>>>>>>>>>>>> +               DRM_EXEC_IGNORE_DUPLICATES;
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +       drm_exec_init(exec, flags);
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +       drm_exec_until_all_locked(exec) {
>>>>>>>>>>>>>>>> +               ret = drm_gpuvm_prepare_vm(gpuvm, exec,
>>>>>>>>>>>>>>>> num_fences);
>>>>>>>>>>>>>>>> +               drm_exec_retry_on_contention(exec);
>>>>>>>>>>>>>>>> +               if (ret)
>>>>>>>>>>>>>>>> +                       goto err;
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +               ret = drm_gpuvm_prepare_objects(gpuvm, 
>>>>>>>>>>>>>>>> exec,
>>>>>>>>>>>>>>>> num_fences);
>>>>>>>>>>>>>>>> +               drm_exec_retry_on_contention(exec);
>>>>>>>>>>>>>>>> +               if (ret)
>>>>>>>>>>>>>>>> +                       goto err;
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +               if (vm_exec->extra.fn) {
>>>>>>>>>>>>>>>> +                       ret = vm_exec->extra.fn(vm_exec,
>>>>>>>>>>>>>>>> num_fences);
>>>>>>>>>>>>>>>> +                       drm_exec_retry_on_contention(exec); 
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> +                       if (ret)
>>>>>>>>>>>>>>>> +                               goto err;
>>>>>>>>>>>>>>>> +               }
>>>>>>>>>>>>>>>> +       }
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +       return 0;
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +err:
>>>>>>>>>>>>>>>> +       drm_exec_fini(exec);
>>>>>>>>>>>>>>>> +       return ret;
>>>>>>>>>>>>>>>> +}
>>>>>>>>>>>>>>>> +EXPORT_SYMBOL_GPL(drm_gpuvm_exec_lock);
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +static int
>>>>>>>>>>>>>>>> +fn_lock_array(struct drm_gpuvm_exec *vm_exec, unsigned 
>>>>>>>>>>>>>>>> int
>>>>>>>>>>>>>>>> num_fences)
>>>>>>>>>>>>>>>> +{
>>>>>>>>>>>>>>>> +       struct {
>>>>>>>>>>>>>>>> +               struct drm_gem_object **objs;
>>>>>>>>>>>>>>>> +               unsigned int num_objs;
>>>>>>>>>>>>>>>> +       } *args = vm_exec->extra.priv;
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +       return drm_exec_prepare_array(&vm_exec->exec, 
>>>>>>>>>>>>>>>> args-
>>>>>>>>>>>>>>>>> objs,
>>>>>>>>>>>>>>>> + args->num_objs,
>>>>>>>>>>>>>>>> num_fences);
>>>>>>>>>>>>>>>> +}
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +/**
>>>>>>>>>>>>>>>> + * drm_gpuvm_exec_lock_array() - lock all dma-resv of all
>>>>>>>>>>>>>>>> assoiciated BOs
>>>>>>>>>>>>>>>> + * @vm_exec: the &drm_gpuvm_exec abstraction
>>>>>>>>>>>>>>>> + * @objs: additional &drm_gem_objects to lock
>>>>>>>>>>>>>>>> + * @num_objs: the number of additional 
>>>>>>>>>>>>>>>> &drm_gem_objects to
>>>>>>>>>>>>>>>> lock
>>>>>>>>>>>>>>>> + * @num_fences: the amount of &dma_fences to reserve
>>>>>>>>>>>>>>>> + * @interruptible: sleep interruptible if waiting
>>>>>>>>>>>>>>>> + *
>>>>>>>>>>>>>>>> + * Acquires all dma-resv locks of all &drm_gem_objects 
>>>>>>>>>>>>>>>> the
>>>>>>>>>>>>>>>> given &drm_gpuvm
>>>>>>>>>>>>>>>> + * contains mappings of, plus the ones given through 
>>>>>>>>>>>>>>>> @objs.
>>>>>>>>>>>>>>>> + *
>>>>>>>>>>>>>>>> + * Returns: 0 on success, negative error code on failure.
>>>>>>>>>>>>>>>> + */
>>>>>>>>>>>>>>>> +int
>>>>>>>>>>>>>>>> +drm_gpuvm_exec_lock_array(struct drm_gpuvm_exec *vm_exec,
>>>>>>>>>>>>>>>> +                         struct drm_gem_object **objs,
>>>>>>>>>>>>>>>> +                         unsigned int num_objs,
>>>>>>>>>>>>>>>> +                         unsigned int num_fences,
>>>>>>>>>>>>>>>> +                         bool interruptible)
>>>>>>>>>>>>>>>> +{
>>>>>>>>>>>>>>>> +       struct {
>>>>>>>>>>>>>>>> +               struct drm_gem_object **objs;
>>>>>>>>>>>>>>>> +               unsigned int num_objs;
>>>>>>>>>>>>>>>> +       } args;
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +       args.objs = objs;
>>>>>>>>>>>>>>>> +       args.num_objs = num_objs;
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +       vm_exec->extra.fn = fn_lock_array;
>>>>>>>>>>>>>>>> +       vm_exec->extra.priv = &args;
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +       return drm_gpuvm_exec_lock(vm_exec, num_fences,
>>>>>>>>>>>>>>>> interruptible);
>>>>>>>>>>>>>>>> +}
>>>>>>>>>>>>>>>> +EXPORT_SYMBOL_GPL(drm_gpuvm_exec_lock_array);
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +/**
>>>>>>>>>>>>>>>> + * drm_gpuvm_exec_lock_range() - prepare all BOs mapped
>>>>>>>>>>>>>>>> within a given range
>>>>>>>>>>>>>>>> + * @vm_exec: the &drm_gpuvm_exec abstraction
>>>>>>>>>>>>>>>> + * @addr: the start address within the VA space
>>>>>>>>>>>>>>>> + * @range: the range to iterate within the VA space
>>>>>>>>>>>>>>>> + * @num_fences: the amount of &dma_fences to reserve
>>>>>>>>>>>>>>>> + * @interruptible: sleep interruptible if waiting
>>>>>>>>>>>>>>>> + *
>>>>>>>>>>>>>>>> + * Acquires all dma-resv locks of all &drm_gem_objects
>>>>>>>>>>>>>>>> mapped between @addr and
>>>>>>>>>>>>>>>> + * @addr + @range.
>>>>>>>>>>>>>>>> + *
>>>>>>>>>>>>>>>> + * Returns: 0 on success, negative error code on failure.
>>>>>>>>>>>>>>>> + */
>>>>>>>>>>>>>>>> +int
>>>>>>>>>>>>>>>> +drm_gpuvm_exec_lock_range(struct drm_gpuvm_exec *vm_exec,
>>>>>>>>>>>>>>>> +                         u64 addr, u64 range,
>>>>>>>>>>>>>>>> +                         unsigned int num_fences,
>>>>>>>>>>>>>>>> +                         bool interruptible)
>>>>>>>>>>>>>>>> +{
>>>>>>>>>>>>>>>> +       struct drm_gpuvm *gpuvm = vm_exec->vm;
>>>>>>>>>>>>>>>> +       struct drm_exec *exec = &vm_exec->exec;
>>>>>>>>>>>>>>>> +       uint32_t flags;
>>>>>>>>>>>>>>>> +       int ret;
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +       flags = interruptible ? 
>>>>>>>>>>>>>>>> DRM_EXEC_INTERRUPTIBLE_WAIT :
>>>>>>>>>>>>>>>> 0 |
>>>>>>>>>>>>>>>> +               DRM_EXEC_IGNORE_DUPLICATES;
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +       drm_exec_init(exec, flags);
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +       drm_exec_until_all_locked(exec) {
>>>>>>>>>>>>>>>> +               ret = drm_gpuvm_prepare_range(gpuvm, exec,
>>>>>>>>>>>>>>>> addr, range,
>>>>>>>>>>>>>>>> + num_fences);
>>>>>>>>>>>>>>>> +               drm_exec_retry_on_contention(exec);
>>>>>>>>>>>>>>>> +               if (ret)
>>>>>>>>>>>>>>>> +                       goto err;
>>>>>>>>>>>>>>>> +       }
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +       return ret;
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +err:
>>>>>>>>>>>>>>>> +       drm_exec_fini(exec);
>>>>>>>>>>>>>>>> +       return ret;
>>>>>>>>>>>>>>>> +}
>>>>>>>>>>>>>>>> +EXPORT_SYMBOL_GPL(drm_gpuvm_exec_lock_range);
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +/**
>>>>>>>>>>>>>>>> + * drm_gpuvm_validate() - validate all BOs marked as 
>>>>>>>>>>>>>>>> evicted
>>>>>>>>>>>>>>>> + * @gpuvm: the &drm_gpuvm to validate evicted BOs
>>>>>>>>>>>>>>>> + *
>>>>>>>>>>>>>>>> + * Calls the &drm_gpuvm_ops.bo_validate callback for all
>>>>>>>>>>>>>>>> evicted buffer
>>>>>>>>>>>>>>>> + * objects being mapped in the given &drm_gpuvm.
>>>>>>>>>>>>>>>> + *
>>>>>>>>>>>>>>>> + * Returns: 0 on success, negative error code on failure.
>>>>>>>>>>>>>>>> + */
>>>>>>>>>>>>>>>> +int
>>>>>>>>>>>>>>>> +drm_gpuvm_validate(struct drm_gpuvm *gpuvm)
>>>>>>>>>>>>>>>> +{
>>>>>>>>>>>>>>>> +       const struct drm_gpuvm_ops *ops = gpuvm->ops;
>>>>>>>>>>>>>>>> +       struct drm_gpuvm_bo *vm_bo;
>>>>>>>>>>>>>>>> +       LIST_HEAD(evict);
>>>>>>>>>>>>>>>> +       int ret = 0;
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +       if (unlikely(!ops || !ops->bo_validate))
>>>>>>>>>>>>>>>> +               return -ENOTSUPP;
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +       for_each_vm_bo_in_list(gpuvm, evict, &evict, 
>>>>>>>>>>>>>>>> vm_bo) {
>>>>>>>>>>>>>>>> +               dma_resv_assert_held(vm_bo->obj->resv);
>>>>>>>>>>>>>>>> +               ret = ops->bo_validate(vm_bo->obj);
>>>>>>>>>>>>>>>> +               if (ret)
>>>>>>>>>>>>>>>> +                       break;
>>>>>>>>>>>>>>>> +       }
>>>>>>>>>>>>>>>> +       /* Drop ref in case we break out of the loop. */
>>>>>>>>>>>>>>>> +       drm_gpuvm_bo_put(vm_bo);
>>>>>>>>>>>>>>>> +       restore_vm_bo_list(gpuvm, evict, &evict);
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +       return ret;
>>>>>>>>>>>>>>>> +}
>>>>>>>>>>>>>>>> +EXPORT_SYMBOL_GPL(drm_gpuvm_validate);
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +/**
>>>>>>>>>>>>>>>> + * drm_gpuvm_resv_add_fence - add fence to private and 
>>>>>>>>>>>>>>>> all
>>>>>>>>>>>>>>>> extobj
>>>>>>>>>>>>>>>> + * dma-resv
>>>>>>>>>>>>>>>> + * @gpuvm: the &drm_gpuvm to add a fence to
>>>>>>>>>>>>>>>> + * @exec: the &drm_exec locking context
>>>>>>>>>>>>>>>> + * @fence: fence to add
>>>>>>>>>>>>>>>> + * @private_usage: private dma-resv usage
>>>>>>>>>>>>>>>> + * @extobj_usage: extobj dma-resv usage
>>>>>>>>>>>>>>>> + */
>>>>>>>>>>>>>>>> +void
>>>>>>>>>>>>>>>> +drm_gpuvm_resv_add_fence(struct drm_gpuvm *gpuvm,
>>>>>>>>>>>>>>>> +                        struct drm_exec *exec,
>>>>>>>>>>>>>>>> +                        struct dma_fence *fence,
>>>>>>>>>>>>>>>> +                        enum dma_resv_usage 
>>>>>>>>>>>>>>>> private_usage,
>>>>>>>>>>>>>>>> +                        enum dma_resv_usage extobj_usage)
>>>>>>>>>>>>>>>> +{
>>>>>>>>>>>>>>>> +       struct drm_gem_object *obj;
>>>>>>>>>>>>>>>> +       unsigned long index;
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +       drm_exec_for_each_locked_object(exec, index, 
>>>>>>>>>>>>>>>> obj) {
>>>>>>>>>>>>>>>> +               dma_resv_assert_held(obj->resv);
>>>>>>>>>>>>>>>> +               dma_resv_add_fence(obj->resv, fence,
>>>>>>>>>>>>>>>> + drm_gpuvm_is_extobj(gpuvm,
>>>>>>>>>>>>>>>> obj) ?
>>>>>>>>>>>>>>>> + private_usage :
>>>>>>>>>>>>>>>> extobj_usage);
>>>>>>>>>>>>>>>> +       }
>>>>>>>>>>>>>>>> +}
>>>>>>>>>>>>>>>> +EXPORT_SYMBOL_GPL(drm_gpuvm_resv_add_fence);
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>     /**
>>>>>>>>>>>>>>>>      * drm_gpuvm_bo_create() - create a new instance of 
>>>>>>>>>>>>>>>> struct
>>>>>>>>>>>>>>>> drm_gpuvm_bo
>>>>>>>>>>>>>>>>      * @gpuvm: The &drm_gpuvm the @obj is mapped in.
>>>>>>>>>>>>>>>> @@ -790,6 +1242,9 @@ drm_gpuvm_bo_create(struct drm_gpuvm
>>>>>>>>>>>>>>>> *gpuvm,
>>>>>>>>>>>>>>>>          INIT_LIST_HEAD(&vm_bo->list.gpuva);
>>>>>>>>>>>>>>>>          INIT_LIST_HEAD(&vm_bo->list.entry.gem);
>>>>>>>>>>>>>>>> +       INIT_LIST_HEAD(&vm_bo->list.entry.extobj);
>>>>>>>>>>>>>>>> +       INIT_LIST_HEAD(&vm_bo->list.entry.evict);
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>          drm_gem_object_get(obj);
>>>>>>>>>>>>>>>>          return vm_bo;
>>>>>>>>>>>>>>>> @@ -807,6 +1262,14 @@ drm_gpuvm_bo_destroy(struct kref 
>>>>>>>>>>>>>>>> *kref)
>>>>>>>>>>>>>>>>          drm_gem_gpuva_assert_lock_held(vm_bo->obj);
>>>>>>>>>>>>>>>> +       spin_lock(&gpuvm->extobj.lock);
>>>>>>>>>>>>>>>> +       list_del(&vm_bo->list.entry.extobj);
>>>>>>>>>>>>>>>> +       spin_unlock(&gpuvm->extobj.lock);
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +       spin_lock(&gpuvm->evict.lock);
>>>>>>>>>>>>>>>> +       list_del(&vm_bo->list.entry.evict);
>>>>>>>>>>>>>>>> +       spin_unlock(&gpuvm->evict.lock);
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>          list_del(&vm_bo->list.entry.gem);
>>>>>>>>>>>>>>>>          drm_gem_object_put(obj);
>>>>>>>>>>>>>>>> @@ -822,6 +1285,11 @@ drm_gpuvm_bo_destroy(struct kref 
>>>>>>>>>>>>>>>> *kref)
>>>>>>>>>>>>>>>>      * @vm_bo: the &drm_gpuvm_bo to release the 
>>>>>>>>>>>>>>>> reference of
>>>>>>>>>>>>>>>>      *
>>>>>>>>>>>>>>>>      * This releases a reference to @vm_bo.
>>>>>>>>>>>>>>>> + *
>>>>>>>>>>>>>>>> + * If the reference count drops to zero, the &gpuvm_bo is
>>>>>>>>>>>>>>>> destroyed, which
>>>>>>>>>>>>>>>> + * includes removing it from the GEMs gpuva list. 
>>>>>>>>>>>>>>>> Hence, if
>>>>>>>>>>>>>>>> a call to this
>>>>>>>>>>>>>>>> + * function can potentially let the reference count to 
>>>>>>>>>>>>>>>> zero
>>>>>>>>>>>>>>>> the caller must
>>>>>>>>>>>>>>>> + * hold the dma-resv or driver specific GEM gpuva lock.
>>>>>>>>>>>>>>>>      */
>>>>>>>>>>>>>>>>     void
>>>>>>>>>>>>>>>>     drm_gpuvm_bo_put(struct drm_gpuvm_bo *vm_bo)
>>>>>>>>>>>>>>>> @@ -831,6 +1299,12 @@ drm_gpuvm_bo_put(struct drm_gpuvm_bo
>>>>>>>>>>>>>>>> *vm_bo)
>>>>>>>>>>>>>>>>     }
>>>>>>>>>>>>>>>> EXPORT_SYMBOL_GPL(drm_gpuvm_bo_put);
>>>>>>>>>>>>>>>> +static int __must_check
>>>>>>>>>>>>>>>> +drm_gpuvm_bo_get_unless_zero(struct drm_gpuvm_bo *vm_bo)
>>>>>>>>>>>>>>>> +{
>>>>>>>>>>>>>>>> +       return kref_get_unless_zero(&vm_bo->kref);
>>>>>>>>>>>>>>>> +}
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>     static struct drm_gpuvm_bo *
>>>>>>>>>>>>>>>>     __drm_gpuvm_bo_find(struct drm_gpuvm *gpuvm,
>>>>>>>>>>>>>>>>                      struct drm_gem_object *obj)
>>>>>>>>>>>>>>>> @@ -938,6 +1412,48 @@ drm_gpuvm_bo_obtain_prealloc(struct
>>>>>>>>>>>>>>>> drm_gpuvm_bo *__vm_bo)
>>>>>>>>>>>>>>>>     }
>>>>>>>>>>>>>>>> EXPORT_SYMBOL_GPL(drm_gpuvm_bo_obtain_prealloc);
>>>>>>>>>>>>>>>> +/**
>>>>>>>>>>>>>>>> + * drm_gpuvm_bo_extobj_add() - adds the &drm_gpuvm_bo 
>>>>>>>>>>>>>>>> to its
>>>>>>>>>>>>>>>> &drm_gpuvm's
>>>>>>>>>>>>>>>> + * extobj list
>>>>>>>>>>>>>>>> + * @vm_bo: The &drm_gpuvm_bo to add to its 
>>>>>>>>>>>>>>>> &drm_gpuvm's the
>>>>>>>>>>>>>>>> extobj list.
>>>>>>>>>>>>>>>> + *
>>>>>>>>>>>>>>>> + * Adds the given @vm_bo to its &drm_gpuvm's extobj 
>>>>>>>>>>>>>>>> list if
>>>>>>>>>>>>>>>> not on the list
>>>>>>>>>>>>>>>> + * already and if the corresponding &drm_gem_object is an
>>>>>>>>>>>>>>>> external object,
>>>>>>>>>>>>>>>> + * actually.
>>>>>>>>>>>>>>>> + */
>>>>>>>>>>>>>>>> +void
>>>>>>>>>>>>>>>> +drm_gpuvm_bo_extobj_add(struct drm_gpuvm_bo *vm_bo)
>>>>>>>>>>>>>>>> +{
>>>>>>>>>>>>>>>> +       struct drm_gpuvm *gpuvm = vm_bo->vm;
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +       if (drm_gpuvm_is_extobj(gpuvm, vm_bo->obj))
>>>>>>>>>>>>>>>> +               drm_gpuvm_bo_list_add(vm_bo, extobj);
>>>>>>>>>>>>>>>> +}
>>>>>>>>>>>>>>>> +EXPORT_SYMBOL_GPL(drm_gpuvm_bo_extobj_add);
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +/**
>>>>>>>>>>>>>>>> + * drm_gpuvm_bo_evict() - add / remove a 
>>>>>>>>>>>>>>>> &drm_gem_object to
>>>>>>>>>>>>>>>> / from a
>>>>>>>>>>>>>>>> + * &drm_gpuvms evicted list
>>>>>>>>>>>>>>>> + * @obj: the &drm_gem_object to add or remove
>>>>>>>>>>>>>>>> + * @evict: indicates whether the object is evicted
>>>>>>>>>>>>>>>> + *
>>>>>>>>>>>>>>>> + * Adds a &drm_gem_object to or removes it from all
>>>>>>>>>>>>>>>> &drm_gpuvms evicted
>>>>>>>>>>>>>>>> + * list containing a mapping of this &drm_gem_object.
>>>>>>>>>>>>>>>> + */
>>>>>>>>>>>>>>>> +void
>>>>>>>>>>>>>>>> +drm_gpuvm_bo_evict(struct drm_gem_object *obj, bool 
>>>>>>>>>>>>>>>> evict)
>>>>>>>>>>>>>>>> +{
>>>>>>>>>>>>>>>> +       struct drm_gpuvm_bo *vm_bo;
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +       drm_gem_for_each_gpuvm_bo(vm_bo, obj) {
>>>>>>>>>>>>>>>> +               if (evict)
>>>>>>>>>>>>>>>> +                       drm_gpuvm_bo_list_add(vm_bo, 
>>>>>>>>>>>>>>>> evict);
>>>>>>>>>>>>>>>> +               else
>>>>>>>>>>>>>>>> +                       drm_gpuvm_bo_list_del(vm_bo, 
>>>>>>>>>>>>>>>> evict);
>>>>>>>>>>>>>>>> +       }
>>>>>>>>>>>>>>>> +}
>>>>>>>>>>>>>>>> +EXPORT_SYMBOL_GPL(drm_gpuvm_bo_evict);
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>     static int
>>>>>>>>>>>>>>>>     __drm_gpuva_insert(struct drm_gpuvm *gpuvm,
>>>>>>>>>>>>>>>>                     struct drm_gpuva *va)
>>>>>>>>>>>>>>>> diff --git a/include/drm/drm_gpuvm.h
>>>>>>>>>>>>>>>> b/include/drm/drm_gpuvm.h
>>>>>>>>>>>>>>>> index afa50b9059a2..834bb6d6617e 100644
>>>>>>>>>>>>>>>> --- a/include/drm/drm_gpuvm.h
>>>>>>>>>>>>>>>> +++ b/include/drm/drm_gpuvm.h
>>>>>>>>>>>>>>>> @@ -26,10 +26,12 @@
>>>>>>>>>>>>>>>>      */
>>>>>>>>>>>>>>>>     #include <linux/list.h>
>>>>>>>>>>>>>>>> +#include <linux/dma-resv.h>
>>>>>>>>>>>>>>>>     #include <linux/rbtree.h>
>>>>>>>>>>>>>>>>     #include <linux/types.h>
>>>>>>>>>>>>>>>>     #include <drm/drm_gem.h>
>>>>>>>>>>>>>>>> +#include <drm/drm_exec.h>
>>>>>>>>>>>>>>>>     struct drm_gpuvm;
>>>>>>>>>>>>>>>>     struct drm_gpuvm_bo;
>>>>>>>>>>>>>>>> @@ -259,6 +261,38 @@ struct drm_gpuvm {
>>>>>>>>>>>>>>>>           * space
>>>>>>>>>>>>>>>>           */
>>>>>>>>>>>>>>>>          struct dma_resv *resv;
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +       /**
>>>>>>>>>>>>>>>> +        * @extobj: structure holding the extobj list
>>>>>>>>>>>>>>>> +        */
>>>>>>>>>>>>>>>> +       struct {
>>>>>>>>>>>>>>>> +               /**
>>>>>>>>>>>>>>>> +                * @list: &list_head storing 
>>>>>>>>>>>>>>>> &drm_gpuvm_bos
>>>>>>>>>>>>>>>> serving as
>>>>>>>>>>>>>>>> +                * external object
>>>>>>>>>>>>>>>> +                */
>>>>>>>>>>>>>>>> +               struct list_head list;
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +               /**
>>>>>>>>>>>>>>>> +                * @lock: spinlock to protect the 
>>>>>>>>>>>>>>>> extobj list
>>>>>>>>>>>>>>>> +                */
>>>>>>>>>>>>>>>> +               spinlock_t lock;
>>>>>>>>>>>>>>>> +       } extobj;
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +       /**
>>>>>>>>>>>>>>>> +        * @evict: structure holding the evict list and 
>>>>>>>>>>>>>>>> evict
>>>>>>>>>>>>>>>> list lock
>>>>>>>>>>>>>>>> +        */
>>>>>>>>>>>>>>>> +       struct {
>>>>>>>>>>>>>>>> +               /**
>>>>>>>>>>>>>>>> +                * @list: &list_head storing 
>>>>>>>>>>>>>>>> &drm_gpuvm_bos
>>>>>>>>>>>>>>>> currently being
>>>>>>>>>>>>>>>> +                * evicted
>>>>>>>>>>>>>>>> +                */
>>>>>>>>>>>>>>>> +               struct list_head list;
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +               /**
>>>>>>>>>>>>>>>> +                * @lock: spinlock to protect the evict 
>>>>>>>>>>>>>>>> list
>>>>>>>>>>>>>>>> +                */
>>>>>>>>>>>>>>>> +               spinlock_t lock;
>>>>>>>>>>>>>>>> +       } evict;
>>>>>>>>>>>>>>>>     };
>>>>>>>>>>>>>>>>     void drm_gpuvm_init(struct drm_gpuvm *gpuvm, struct
>>>>>>>>>>>>>>>> drm_device *drm,
>>>>>>>>>>>>>>>> @@ -268,6 +302,21 @@ void drm_gpuvm_init(struct drm_gpuvm
>>>>>>>>>>>>>>>> *gpuvm, struct drm_device *drm,
>>>>>>>>>>>>>>>>                      const struct drm_gpuvm_ops *ops);
>>>>>>>>>>>>>>>>     void drm_gpuvm_destroy(struct drm_gpuvm *gpuvm);
>>>>>>>>>>>>>>>> +/**
>>>>>>>>>>>>>>>> + * drm_gpuvm_is_extobj() - indicates whether the given
>>>>>>>>>>>>>>>> &drm_gem_object is an
>>>>>>>>>>>>>>>> + * external object
>>>>>>>>>>>>>>>> + * @gpuvm: the &drm_gpuvm to check
>>>>>>>>>>>>>>>> + * @obj: the &drm_gem_object to check
>>>>>>>>>>>>>>>> + *
>>>>>>>>>>>>>>>> + * Returns: true if the &drm_gem_object &dma_resv differs
>>>>>>>>>>>>>>>> from the
>>>>>>>>>>>>>>>> + * &drm_gpuvms &dma_resv, false otherwise
>>>>>>>>>>>>>>>> + */
>>>>>>>>>>>>>>>> +static inline bool drm_gpuvm_is_extobj(struct drm_gpuvm
>>>>>>>>>>>>>>>> *gpuvm,
>>>>>>>>>>>>>>>> + struct drm_gem_object
>>>>>>>>>>>>>>>> *obj)
>>>>>>>>>>>>>>>> +{
>>>>>>>>>>>>>>>> +       return obj && obj->resv != gpuvm->resv;
>>>>>>>>>>>>>>>> +}
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>     static inline struct drm_gpuva *
>>>>>>>>>>>>>>>>     __drm_gpuva_next(struct drm_gpuva *va)
>>>>>>>>>>>>>>>>     {
>>>>>>>>>>>>>>>> @@ -346,6 +395,128 @@ __drm_gpuva_next(struct drm_gpuva 
>>>>>>>>>>>>>>>> *va)
>>>>>>>>>>>>>>>>     #define drm_gpuvm_for_each_va_safe(va__, next__, 
>>>>>>>>>>>>>>>> gpuvm__)
>>>>>>>>>>>>>>>> \
>>>>>>>>>>>>>>>>          list_for_each_entry_safe(va__, next__, 
>>>>>>>>>>>>>>>> &(gpuvm__)-
>>>>>>>>>>>>>>>>> rb.list, rb.entry)
>>>>>>>>>>>>>>>> +/**
>>>>>>>>>>>>>>>> + * struct drm_gpuvm_exec - &drm_gpuvm abstraction of
>>>>>>>>>>>>>>>> &drm_exec
>>>>>>>>>>>>>>>> + *
>>>>>>>>>>>>>>>> + * This structure should be created on the stack as
>>>>>>>>>>>>>>>> &drm_exec should be.
>>>>>>>>>>>>>>>> + *
>>>>>>>>>>>>>>>> + * Optionally, @extra can be set in order to lock 
>>>>>>>>>>>>>>>> additional
>>>>>>>>>>>>>>>> &drm_gem_objects.
>>>>>>>>>>>>>>>> + */
>>>>>>>>>>>>>>>> +struct drm_gpuvm_exec {
>>>>>>>>>>>>>>>> +       /**
>>>>>>>>>>>>>>>> +        * @exec: the &drm_exec structure
>>>>>>>>>>>>>>>> +        */
>>>>>>>>>>>>>>>> +       struct drm_exec exec;
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +       /**
>>>>>>>>>>>>>>>> +        * @vm: the &drm_gpuvm to lock its DMA 
>>>>>>>>>>>>>>>> reservations
>>>>>>>>>>>>>>>> +        */
>>>>>>>>>>>>>>>> +       struct drm_gpuvm *vm;
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +       /**
>>>>>>>>>>>>>>>> +        * @extra: Callback and corresponding private data
>>>>>>>>>>>>>>>> for the driver to
>>>>>>>>>>>>>>>> +        * lock arbitrary additional &drm_gem_objects.
>>>>>>>>>>>>>>>> +        */
>>>>>>>>>>>>>>>> +       struct {
>>>>>>>>>>>>>>>> +               /**
>>>>>>>>>>>>>>>> +                * @fn: The driver callback to lock
>>>>>>>>>>>>>>>> additional &drm_gem_objects.
>>>>>>>>>>>>>>>> +                */
>>>>>>>>>>>>>>>> +               int (*fn)(struct drm_gpuvm_exec *vm_exec,
>>>>>>>>>>>>>>>> +                         unsigned int num_fences);
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +               /**
>>>>>>>>>>>>>>>> +                * @priv: driver private data for the @fn
>>>>>>>>>>>>>>>> callback
>>>>>>>>>>>>>>>> +                */
>>>>>>>>>>>>>>>> +               void *priv;
>>>>>>>>>>>>>>>> +       } extra;
>>>>>>>>>>>>>>>> +};
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +/**
>>>>>>>>>>>>>>>> + * drm_gpuvm_prepare_vm() - prepare the GPUVMs common 
>>>>>>>>>>>>>>>> dma-
>>>>>>>>>>>>>>>> resv
>>>>>>>>>>>>>>>> + * @gpuvm: the &drm_gpuvm
>>>>>>>>>>>>>>>> + * @exec: the &drm_exec context
>>>>>>>>>>>>>>>> + * @num_fences: the amount of &dma_fences to reserve
>>>>>>>>>>>>>>>> + *
>>>>>>>>>>>>>>>> + * Calls drm_exec_prepare_obj() for the GPUVMs dummy
>>>>>>>>>>>>>>>> &drm_gem_object.
>>>>>>>>>>>>>>>> + *
>>>>>>>>>>>>>>>> + * Using this function directly, it is the drivers
>>>>>>>>>>>>>>>> responsibility to call
>>>>>>>>>>>>>>>> + * drm_exec_init() and drm_exec_fini() accordingly.
>>>>>>>>>>>>>>>> + *
>>>>>>>>>>>>>>>> + * Returns: 0 on success, negative error code on failure.
>>>>>>>>>>>>>>>> + */
>>>>>>>>>>>>>>>> +static inline int
>>>>>>>>>>>>>>>> +drm_gpuvm_prepare_vm(struct drm_gpuvm *gpuvm,
>>>>>>>>>>>>>>>> +                    struct drm_exec *exec,
>>>>>>>>>>>>>>>> +                    unsigned int num_fences)
>>>>>>>>>>>>>>>> +{
>>>>>>>>>>>>>>>> +       return drm_exec_prepare_obj(exec, &gpuvm->d_obj,
>>>>>>>>>>>>>>>> num_fences);
>>>>>>>>>>>>>>>> +}
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +int drm_gpuvm_prepare_objects(struct drm_gpuvm *gpuvm,
>>>>>>>>>>>>>>>> +                             struct drm_exec *exec,
>>>>>>>>>>>>>>>> + unsigned int num_fences);
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +int drm_gpuvm_prepare_range(struct drm_gpuvm *gpuvm,
>>>>>>>>>>>>>>>> +                           struct drm_exec *exec,
>>>>>>>>>>>>>>>> +                           u64 addr, u64 range,
>>>>>>>>>>>>>>>> +                           unsigned int num_fences);
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +int drm_gpuvm_exec_lock(struct drm_gpuvm_exec *vm_exec,
>>>>>>>>>>>>>>>> +                       unsigned int num_fences,
>>>>>>>>>>>>>>>> +                       bool interruptible);
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +int drm_gpuvm_exec_lock_array(struct drm_gpuvm_exec
>>>>>>>>>>>>>>>> *vm_exec,
>>>>>>>>>>>>>>>> +                             struct drm_gem_object 
>>>>>>>>>>>>>>>> **objs,
>>>>>>>>>>>>>>>> + unsigned int num_objs,
>>>>>>>>>>>>>>>> + unsigned int num_fences,
>>>>>>>>>>>>>>>> +                             bool interruptible);
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +int drm_gpuvm_exec_lock_range(struct drm_gpuvm_exec
>>>>>>>>>>>>>>>> *vm_exec,
>>>>>>>>>>>>>>>> +                             u64 addr, u64 range,
>>>>>>>>>>>>>>>> + unsigned int num_fences,
>>>>>>>>>>>>>>>> +                             bool interruptible);
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +/**
>>>>>>>>>>>>>>>> + * drm_gpuvm_lock() - lock all dma-resv of all 
>>>>>>>>>>>>>>>> assoiciated
>>>>>>>>>>>>>>>> BOs
>>>>>>>>>>>>>>>> + * @gpuvm: the &drm_gpuvm
>>>>>>>>>>>>>>>> + *
>>>>>>>>>>>>>>>> + * Releases all dma-resv locks of all &drm_gem_objects
>>>>>>>>>>>>>>>> previously acquired
>>>>>>>>>>>>>>>> + * through drm_gpuvm_lock() or its variants.
>>>>>>>>>>>>>>>> + *
>>>>>>>>>>>>>>>> + * Returns: 0 on success, negative error code on failure.
>>>>>>>>>>>>>>>> + */
>>>>>>>>>>>>>>>> +static inline void
>>>>>>>>>>>>>>>> +drm_gpuvm_exec_unlock(struct drm_gpuvm_exec *vm_exec)
>>>>>>>>>>>>>>>> +{
>>>>>>>>>>>>>>>> +       drm_exec_fini(&vm_exec->exec);
>>>>>>>>>>>>>>>> +}
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +int drm_gpuvm_validate(struct drm_gpuvm *gpuvm);
>>>>>>>>>>>>>>>> +void drm_gpuvm_resv_add_fence(struct drm_gpuvm *gpuvm,
>>>>>>>>>>>>>>>> +                             struct drm_exec *exec,
>>>>>>>>>>>>>>>> +                             struct dma_fence *fence,
>>>>>>>>>>>>>>>> +                             enum dma_resv_usage
>>>>>>>>>>>>>>>> private_usage,
>>>>>>>>>>>>>>>> +                             enum dma_resv_usage
>>>>>>>>>>>>>>>> extobj_usage);
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +/**
>>>>>>>>>>>>>>>> + * drm_gpuvm_exec_resv_add_fence()
>>>>>>>>>>>>>>>> + * @vm_exec: the &drm_gpuvm_exec abstraction
>>>>>>>>>>>>>>>> + * @fence: fence to add
>>>>>>>>>>>>>>>> + * @private_usage: private dma-resv usage
>>>>>>>>>>>>>>>> + * @extobj_usage: extobj dma-resv usage
>>>>>>>>>>>>>>>> + *
>>>>>>>>>>>>>>>> + * See drm_gpuvm_resv_add_fence().
>>>>>>>>>>>>>>>> + */
>>>>>>>>>>>>>>>> +static inline void
>>>>>>>>>>>>>>>> +drm_gpuvm_exec_resv_add_fence(struct drm_gpuvm_exec
>>>>>>>>>>>>>>>> *vm_exec,
>>>>>>>>>>>>>>>> +                             struct dma_fence *fence,
>>>>>>>>>>>>>>>> +                             enum dma_resv_usage
>>>>>>>>>>>>>>>> private_usage,
>>>>>>>>>>>>>>>> +                             enum dma_resv_usage
>>>>>>>>>>>>>>>> extobj_usage)
>>>>>>>>>>>>>>>> +{
>>>>>>>>>>>>>>>> +       drm_gpuvm_resv_add_fence(vm_exec->vm, 
>>>>>>>>>>>>>>>> &vm_exec->exec,
>>>>>>>>>>>>>>>> fence,
>>>>>>>>>>>>>>>> + private_usage,
>>>>>>>>>>>>>>>> extobj_usage);
>>>>>>>>>>>>>>>> +}
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>     /**
>>>>>>>>>>>>>>>>      * struct drm_gpuvm_bo - structure representing a
>>>>>>>>>>>>>>>> &drm_gpuvm and
>>>>>>>>>>>>>>>>      * &drm_gem_object combination
>>>>>>>>>>>>>>>> @@ -398,6 +569,18 @@ struct drm_gpuvm_bo {
>>>>>>>>>>>>>>>>                           * gpuva list.
>>>>>>>>>>>>>>>>                           */
>>>>>>>>>>>>>>>>                          struct list_head gem;
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +                       /**
>>>>>>>>>>>>>>>> +                        * @evict: List entry to attach to
>>>>>>>>>>>>>>>> the &drm_gpuvms
>>>>>>>>>>>>>>>> +                        * extobj list.
>>>>>>>>>>>>>>>> +                        */
>>>>>>>>>>>>>>>> +                       struct list_head extobj;
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +                       /**
>>>>>>>>>>>>>>>> +                        * @evict: List entry to attach to
>>>>>>>>>>>>>>>> the &drm_gpuvms evict
>>>>>>>>>>>>>>>> +                        * list.
>>>>>>>>>>>>>>>> +                        */
>>>>>>>>>>>>>>>> +                       struct list_head evict;
>>>>>>>>>>>>>>>>                  } entry;
>>>>>>>>>>>>>>>>          } list;
>>>>>>>>>>>>>>>>     };
>>>>>>>>>>>>>>>> @@ -432,6 +615,9 @@ struct drm_gpuvm_bo *
>>>>>>>>>>>>>>>>     drm_gpuvm_bo_find(struct drm_gpuvm *gpuvm,
>>>>>>>>>>>>>>>>                    struct drm_gem_object *obj);
>>>>>>>>>>>>>>>> +void drm_gpuvm_bo_evict(struct drm_gem_object *obj, bool
>>>>>>>>>>>>>>>> evict);
>>>>>>>>>>>>>>>> +void drm_gpuvm_bo_extobj_add(struct drm_gpuvm_bo *vm_bo);
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>     /**
>>>>>>>>>>>>>>>>      * drm_gpuvm_bo_for_each_va() - iterator to walk 
>>>>>>>>>>>>>>>> over a
>>>>>>>>>>>>>>>> list of &drm_gpuva
>>>>>>>>>>>>>>>>      * @va__: &drm_gpuva structure to assign to in each
>>>>>>>>>>>>>>>> iteration step
>>>>>>>>>>>>>>>> @@ -837,6 +1023,17 @@ struct drm_gpuvm_ops {
>>>>>>>>>>>>>>>>           * used.
>>>>>>>>>>>>>>>>           */
>>>>>>>>>>>>>>>>          int (*sm_step_unmap)(struct drm_gpuva_op *op, 
>>>>>>>>>>>>>>>> void
>>>>>>>>>>>>>>>> *priv);
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>> +       /**
>>>>>>>>>>>>>>>> +        * @bo_validate: called from drm_gpuvm_validate()
>>>>>>>>>>>>>>>> +        *
>>>>>>>>>>>>>>>> +        * Drivers receive this callback for every evicted
>>>>>>>>>>>>>>>> &drm_gem_object being
>>>>>>>>>>>>>>>> +        * mapped in the corresponding &drm_gpuvm.
>>>>>>>>>>>>>>>> +        *
>>>>>>>>>>>>>>>> +        * Typically, drivers would call their driver
>>>>>>>>>>>>>>>> specific variant of
>>>>>>>>>>>>>>>> +        * ttm_bo_validate() from within this callback.
>>>>>>>>>>>>>>>> +        */
>>>>>>>>>>>>>>>> +       int (*bo_validate)(struct drm_gem_object *obj);
>>>>>>>>>>>>>>>>     };
>>>>>>>>>>>>>>>>     int drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm, void 
>>>>>>>>>>>>>>>> *priv,
>>>>>>>>>
>>>>>>>>
>>>>>>>
>>>>>>
>>>>>
>>>>
>>>
>
