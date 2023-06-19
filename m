Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA40735059
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 11:33:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 713B910E1D8;
	Mon, 19 Jun 2023 09:33:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7956610E18E
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 09:33:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id C80E240217;
 Mon, 19 Jun 2023 11:33:14 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.2
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.091,
 T_SCC_BODY_TEXT_LINE=-0.01, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Authentication-Results: ste-pvt-msa2.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (ste-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gzwoXdVmyps0; Mon, 19 Jun 2023 11:33:12 +0200 (CEST)
Received: by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 4BB65401E4;
 Mon, 19 Jun 2023 11:33:12 +0200 (CEST)
Received: from [192.168.0.209] (h-155-4-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id D2BF63631FE;
 Mon, 19 Jun 2023 11:33:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1687167191; bh=TLXAbQPVJeVXbcd+dw0qfanEE1rREvxLceIxj8iLUGQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=SWM7HxoQ0sxTdqPCimFas2oteLjmqXiYcYQTb6lgSvYgAL07HNcOUm6wy3EZUhopd
 lJJ+jfZxSzDZcAM6t7JU0U85pP+HHweQnpvH431a9Bxzp+8QDdpwbBdYuR6DAsjD83
 OF5ThlH3K0Uf+mDX4nxJOt53CYb9rLUblBh6NsQ0=
Message-ID: <e8e93582-e741-564d-4d26-4e507ccb5906@shipmail.org>
Date: Mon, 19 Jun 2023 11:33:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.1
Subject: Re: [PATCH 01/13] drm: execution context for GEM buffers v4
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
References: <20230504115159.2245-1-christian.koenig@amd.com>
 <20230504115159.2245-2-christian.koenig@amd.com>
 <20230614142339.04df5111@collabora.com>
 <299e0ff6-bd0a-fa8d-acda-8b3ce22d6ab6@amd.com>
 <20230614150252.6ceb42fd@collabora.com>
 <20230617135434.7dd3a25d@collabora.com>
 <5058c4dd-da1b-9495-5ced-c4d5a5749194@shipmail.org>
 <94f9393a-17fe-321d-c4e1-e12663dc3106@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
In-Reply-To: <94f9393a-17fe-321d-c4e1-e12663dc3106@amd.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>, arunpravin.paneerselvam@amd.com,
 felix.kuehling@amd.com, francois.dugast@intel.com,
 amd-gfx@lists.freedesktop.org, luben.tuikov@amd.com, dakr@redhat.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi!

On 6/19/23 11:20, Christian König wrote:
> Hi guys,
>
> Am 19.06.23 um 10:59 schrieb Thomas Hellström (Intel):
>> [SNIP]
>>>>>
>>>>> I really need to find some time to work on that anyway.
>>> I've been playing with drm_exec for a couple weeks now, and I wanted
>>> to share something I hacked to try and make the API simpler and
>>> more robust against misuse (see the below diff, which is a slightly
>>> adjusted version of your work).
>>
>> It would be good if we could have someone taking charge of this 
>> series and address all review comments, I see some of my comments 
>> getting lost, we have multiple submitters and I can't find a 
>> dri-devel patchwork entry for this. Anyway some comments below.
>
> I can try to find some time for the series this week (As long as 
> nobody comes along and has any burning roof).
>
>>
>>>
>>> In this version, the user is no longer in control of the retry
>>> loop. Instead, it provides an expression (a call to a
>>> sub-function) to be re-evaluated each time a contention is
>>> detected. IMHO, this makes the 'prepare-objs' functions easier to
>>> apprehend, and avoids any mistake like calling
>>> drm_exec_continue_on_contention() in an inner loop, or breaking
>>> out of the drm_exec_while_all_locked() loop unintentionally.
>>
>> In i915 we've had a very similar helper to this, and while I agree 
>> this newer version would probably help make code cleaner, but OTOH 
>> there also are some places where the short 
>> drm_exec_while_all_locked() -likeblock don't really motivate a 
>> separate function. Porting i915 to the current version will take some 
>> work, For  the xe driver both versions would work fine.
>
> Yeah, this is actually what my first version of this looked like. But 
> I abandoned that approach because we have a lot of cases were we just 
> quickly want to lock a few GEM objects and don't want the extra 
> overhead of putting all the state into some bag to forward it to a 
> function.
>
>>
>> Some additional review comments not related to the interface change 
>> below:
>>
>>>
>>> It also makes the internal management a bit simpler, since we
>>> no longer call drm_exec_cleanup() on the first attempt, and can
>>> thus get rid of the DRM_EXEC_DUMMY trick.
>>>
>>> In the below diff, I also re-introduced native support for
>>> duplicates as an opt-in, so we don't have to do things like:
>>>
>>>     ret = drm_exec_prepare_obj(exec, obj, num_fences);
>>>     if (ret == -EALREADY)
>>>         ret = dma_resv_reserve_fences(obj->resv, num_fences);
>>>     if (ret)
>>>         return ret;
>>>
>>> and can just do:
>>>
>>>     ret = drm_exec_prepare_obj(exec, obj, num_fences);
>>>     if (ret)
>>>         return;
>>>
>>> Of course drivers can open-code a wrapper doing the same thing, but
>>> given at least pvr and radeon need this, it'd be nice if the core
>>> could support it natively.
>>>
>>> That's mostly it. Just wanted to share what I had in case you're
>>> interested. If not, that's fine too.
>>>
>>> Regards,
>>>
>>> Boris
>>> ---
>>>   Documentation/gpu/drm-mm.rst |  12 ++
>>>   drivers/gpu/drm/Kconfig      |   6 +
>>>   drivers/gpu/drm/Makefile     |   2 +
>>>   drivers/gpu/drm/drm_exec.c   | 274 
>>> +++++++++++++++++++++++++++++++++++
>>>   include/drm/drm_exec.h       | 130 +++++++++++++++++
>>>   5 files changed, 424 insertions(+)
>>>   create mode 100644 drivers/gpu/drm/drm_exec.c
>>>   create mode 100644 include/drm/drm_exec.h
>>>
>>> diff --git a/Documentation/gpu/drm-mm.rst 
>>> b/Documentation/gpu/drm-mm.rst
>>> index fe40ee686f6e..c9f120cfe730 100644
>>> --- a/Documentation/gpu/drm-mm.rst
>>> +++ b/Documentation/gpu/drm-mm.rst
>>> @@ -524,6 +524,18 @@ DRM Sync Objects
>>>   .. kernel-doc:: drivers/gpu/drm/drm_syncobj.c
>>>      :export:
>>>   +DRM Execution context
>>> +=====================
>>> +
>>> +.. kernel-doc:: drivers/gpu/drm/drm_exec.c
>>> +   :doc: Overview
>>> +
>>> +.. kernel-doc:: include/drm/drm_exec.h
>>> +   :internal:
>>> +
>>> +.. kernel-doc:: drivers/gpu/drm/drm_exec.c
>>> +   :export:
>>> +
>>>   GPU Scheduler
>>>   =============
>>>   diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>>> index 76991720637c..01a38fcdb1c4 100644
>>> --- a/drivers/gpu/drm/Kconfig
>>> +++ b/drivers/gpu/drm/Kconfig
>>> @@ -194,6 +194,12 @@ config DRM_TTM
>>>         GPU memory types. Will be enabled automatically if a device 
>>> driver
>>>         uses it.
>>>   +config DRM_EXEC
>>> +    tristate
>>> +    depends on DRM
>>> +    help
>>> +      Execution context for command submissions
>>> +
>>>   config DRM_BUDDY
>>>       tristate
>>>       depends on DRM
>>> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
>>> index 1873f64db171..18a02eaf2d49 100644
>>> --- a/drivers/gpu/drm/Makefile
>>> +++ b/drivers/gpu/drm/Makefile
>>> @@ -79,6 +79,8 @@ obj-$(CONFIG_DRM_PANEL_ORIENTATION_QUIRKS) += 
>>> drm_panel_orientation_quirks.o
>>>   #
>>>   # Memory-management helpers
>>>   #
>>> +#
>>> +obj-$(CONFIG_DRM_EXEC) += drm_exec.o
>>>     obj-$(CONFIG_DRM_BUDDY) += drm_buddy.o
>>>   diff --git a/drivers/gpu/drm/drm_exec.c b/drivers/gpu/drm/drm_exec.c
>>> new file mode 100644
>>> index 000000000000..e0ad1a3e1610
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/drm_exec.c
>>> @@ -0,0 +1,274 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
>>> +
>>> +#include <drm/drm_exec.h>
>>> +#include <drm/drm_gem.h>
>>> +#include <linux/dma-resv.h>
>>> +
>>> +/**
>>> + * DOC: Overview
>>> + *
>>> + * This component mainly abstracts the retry loop necessary for 
>>> locking
>>> + * multiple GEM objects while preparing hardware operations (e.g. 
>>> command
>>> + * submissions, page table updates etc..).
>>> + *
>>> + * If a contention is detected while locking a GEM object the 
>>> cleanup procedure
>>> + * unlocks all previously locked GEM objects and locks the 
>>> contended one first
>>> + * before locking any further objects.
>>> + *
>>> + * After an object is locked fences slots can optionally be 
>>> reserved on the
>>> + * dma_resv object inside the GEM object.
>>> + *
>>> + * A typical usage pattern should look like this::
>>> + *
>>> + * int prepare_objs_func(struct drm_exec *exec, ...)
>>> + * {
>>> + *    struct drm_gem_object *boA, *boB;
>>> + *     int ret;
>>> + *
>>> + *    <retrieve boA and boB here>
>>> + *
>>> + *    ret = drm_exec_prepare_obj(&exec, boA, 1);
>>> + *    if (ret)
>>> + *        return ret;
>>> + *
>>> + *    ret = drm_exec_prepare_obj(&exec, boB, 1);
>>> + *    if (ret)
>>> + *        return ret;
>>> + *
>>> + *     return 0;
>>> + * }
>>> + *
>>> + * int some_func()
>>> + * {
>>> + *    struct drm_exec exec;
>>> + *    unsigned long index;
>>> + *    int ret;
>>> + *
>>> + *    drm_exec_init(&exec, true);
>>> + *    ret = drm_exec_until_all_locked(&exec, 
>>> prepare_objs_func(&exec, ...));
>>> + *    if (ret)
>>> + *        goto error;
>>> + *
>>> + *    drm_exec_for_each_locked_object(&exec, index, obj) {
>>> + *        dma_resv_add_fence(obj->resv, fence, DMA_RESV_USAGE_READ);
>>> + *        ...
>>> + *    }
>>> + *    drm_exec_fini(&exec);
>>> + *
>>> + * See struct dma_exec for more details.
>>> + */
>>> +
>>> +/* Unlock all objects and drop references */
>>> +static void drm_exec_unlock_all(struct drm_exec *exec)
>>> +{
>>> +    struct drm_gem_object *obj;
>>> +    unsigned long index;
>>> +
>>> +    drm_exec_for_each_locked_object(exec, index, obj) {
>>> +        dma_resv_unlock(obj->resv);
>>> +        drm_gem_object_put(obj);
>>> +    }
>>> +
>>> +    drm_gem_object_put(exec->prelocked);
>>> +    exec->prelocked = NULL;
>>> +}
>>> +
>>> +/**
>>> + * drm_exec_init - initialize a drm_exec object
>>> + * @exec: the drm_exec object to initialize
>>> + * @interruptible: if locks should be acquired interruptible
>>> + *
>>> + * Initialize the object and make sure that we can track locked 
>>> objects.
>>> + */
>>> +void drm_exec_init(struct drm_exec *exec, u32 flags)
>>> +{
>>> +    exec->flags = flags;
>>> +    exec->objects = kmalloc(PAGE_SIZE, GFP_KERNEL);
>>> +
>>> +    /* If allocation here fails, just delay that till the first use */
>>> +    exec->max_objects = exec->objects ? PAGE_SIZE / sizeof(void *) 
>>> : 0;
>>> +    exec->num_objects = 0;
>>> +    exec->contended = NULL;
>>> +    exec->prelocked = NULL;
>>> +    ww_acquire_init(&exec->ticket, &reservation_ww_class);
>>> +}
>>> +EXPORT_SYMBOL(drm_exec_init);
>>> +
>>> +/**
>>> + * drm_exec_fini - finalize a drm_exec object
>>> + * @exec: the drm_exec object to finalize
>>> + *
>>> + * Unlock all locked objects, drop the references to objects and 
>>> free all memory
>>> + * used for tracking the state.
>>> + */
>>> +void drm_exec_fini(struct drm_exec *exec)
>>> +{
>>> +    drm_exec_unlock_all(exec);
>>> +    kvfree(exec->objects);
>>> +    if (exec->contended)
>>> +        drm_gem_object_put(exec->contended);
>>> +    ww_acquire_fini(&exec->ticket);
>>> +}
>>> +EXPORT_SYMBOL(drm_exec_fini);
>>> +
>>> +/**
>>> + * drm_exec_reset - reset a drm_exec object after a contention
>>> + * @exec: the drm_exec object to reset
>>> + *
>>> + * Unlock all locked objects and resets the number of objects locked.
>>> + */
>>> +void drm_exec_reset(struct drm_exec *exec)
>>> +{
>>> +    WARN_ON(!exec->contended);
>>> +    drm_exec_unlock_all(exec);
>>> +    exec->num_objects = 0;
>>> +}
>>> +EXPORT_SYMBOL(drm_exec_reset);
>>> +
>>> +/* Track the locked object in the array */
>>> +static int drm_exec_obj_locked(struct drm_exec *exec,
>>> +                   struct drm_gem_object *obj)
>>> +{
>>> +    if (unlikely(exec->num_objects == exec->max_objects)) {
>>> +        size_t size = exec->max_objects * sizeof(void *);
>>> +        void *tmp;
>>> +
>>> +        tmp = kvrealloc(exec->objects, size, size + PAGE_SIZE,
>>> +                GFP_KERNEL);
>>> +        if (!tmp)
>>> +            return -ENOMEM;
>>
>> Sometimes you need to just temporarily lock an object and then unlock 
>> it again if it goes out of scope before reaching the end of 
>> _until_all_locked(). In that case you might need to remove a lock 
>> from the array. I *think* for all use-cases in i915 it would suffice 
>> to take a snapshot of num_objects, and unlock everything above that, 
>> having exec->objects behave like a stack, but was ever a list 
>> considered instead of a realloced array?
>
> Yes, the problem is that linked lists really suck regarding their 
> cache line locality. That's why I've came up with this approach here.
>
> What we could maybe do is to allow unlocking objects, but with the 
> cost of linear backward searching for them in the array.
>
>>
>>> +
>>> +        exec->objects = tmp;
>>> +        exec->max_objects += PAGE_SIZE / sizeof(void *);
>>> +    }
>>> +    drm_gem_object_get(obj);
>>> +    exec->objects[exec->num_objects++] = obj;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +/* Make sure the contended object is locked first */
>>> +static int drm_exec_lock_contended(struct drm_exec *exec)
>>> +{
>>> +    struct drm_gem_object *obj = exec->contended;
>>> +    int ret;
>>> +
>>> +    if (likely(!obj))
>>> +        return 0;
>>> +
>>> +    if (exec->flags & DRM_EXEC_FLAG_INTERRUPTIBLE) {
>>> +        ret = dma_resv_lock_slow_interruptible(obj->resv,
>>> +                               &exec->ticket);
>>> +        if (unlikely(ret))
>>> +            goto error_dropref;
>>> +    } else {
>>> +        dma_resv_lock_slow(obj->resv, &exec->ticket);
>>> +    }
>>> +
>>
>> Sometimes you want to just drop the contended lock after the above 
>> relaxation. (Eviction would be one example), and not add as 
>> prelocked, if the contended object goes out of scope. Eviction would 
>> in some situations be one such example, -EDEADLOCK leading to an 
>> error path where the object should otherwise be freed is another. 
>> Perhaps we could add an argument to prepare_obj() as to whether the 
>> object should be immediately put after relaxation.
>
> I was considering a try_prepare version as well, that should cover 
> this use case.

That sounds a bit different from this use-case. The use-case above 
would, on -EDEADLOCK actually unlock everything, then lock-slow the 
contending lock and then immediately unlock it and drop. It sounds like 
try_prepare would just skip locking and continue with everything locked 
so far still locked?

>
>>
>>> +    ret = drm_exec_obj_locked(exec, obj);
>>> +    if (unlikely(ret)) {
>>> +        dma_resv_unlock(obj->resv);
>>> +        goto error_dropref;
>>> +    }
>>> +
>>> +    swap(exec->prelocked, obj);
>>> +
>>> +error_dropref:
>>> +    /* Always cleanup the contention so that error handling can 
>>> kick in */
>>> +    drm_gem_object_put(obj);
>>> +    exec->contended = NULL;
>>> +    return ret;
>>> +}
>>> +
>>> +/**
>>> + * drm_exec_prepare_obj - prepare a GEM object for use
>>> + * @exec: the drm_exec object with the state
>>> + * @obj: the GEM object to prepare
>>> + * @num_fences: how many fences to reserve
>>> + *
>>> + * Prepare a GEM object for use by locking it and reserving fence 
>>> slots. All
>>> + * successfully locked objects are put into the locked container.
>>> + *
>>> + * Returns: -EDEADLK if a contention is detected, -EALREADY when 
>>> object is
>>> + * already locked, -ENOMEM when memory allocation failed and zero 
>>> for success.
>>> + */
>>> +int drm_exec_prepare_obj(struct drm_exec *exec, struct 
>>> drm_gem_object *obj,
>>> +             unsigned int num_fences)
>>> +{
>>> +    int ret;
>>> +
>>> +    ret = drm_exec_lock_contended(exec);
>>> +    if (unlikely(ret))
>>> +        return ret;
>>> +
>>> +    if (exec->prelocked == obj) {
>>> +        drm_gem_object_put(exec->prelocked);
>>> +        exec->prelocked = NULL;
>>> +
>>> +        return dma_resv_reserve_fences(obj->resv, num_fences);
>>> +    }
>>> +
>>> +    if (exec->flags & DRM_EXEC_FLAG_INTERRUPTIBLE)
>>> +        ret = dma_resv_lock_interruptible(obj->resv, &exec->ticket);
>>> +    else
>>> +        ret = dma_resv_lock(obj->resv, &exec->ticket);
>>> +
>>> +    if (unlikely(ret == -EDEADLK)) {
>>> +        drm_gem_object_get(obj);
>>> +        exec->contended = obj;
>>> +        return -EDEADLK;
>>> +    }
>>> +
>>> +    if (unlikely(ret == -EALREADY &&
>>> +        (exec->flags & DRM_EXEC_FLAG_ALLOW_DUPLICATES)))
>>> +        goto reserve_fences;
>>> +
>>> +    if (unlikely(ret))
>>> +        return ret;
>>> +
>>> +    ret = drm_exec_obj_locked(exec, obj);
>>> +    if (ret)
>>> +        goto error_unlock;
>>> +
>>> +reserve_fences:
>>> +    /* Keep locked when reserving fences fails */
>>> +    return dma_resv_reserve_fences(obj->resv, num_fences);
>>
>> Ugh, what is the use-case for keeping things locked here? How would a 
>> caller tell the difference between an error where everything is 
>> locked and nothing is locked? IMO, we should unlock on error here. If 
>> there indeed is a use-case we should add a separate function for 
>> reserving fences for all locked objects, rather than returning 
>> sometimes locked on error sometime not.
>
> We return the object locked here because it was to much churn to 
> remove it again from the array and we are getting fully cleaned up at 
> the end anyway.

OK, so if we add an unlock functionality, we could just have a 
consistent locking state on error return?

Thanks,
Thomas

>
> Regards,
> Christian.
>
>>
>> Thanks,
>>
>> Thomas
>>
>>
>>> +
>>> +error_unlock:
>>> +    dma_resv_unlock(obj->resv);
>>> +    return ret;
>>> +}
>>> +EXPORT_SYMBOL(drm_exec_prepare_obj);
>>> +
>>> +/**
>>> + * drm_exec_prepare_array - helper to prepare an array of objects
>>> + * @exec: the drm_exec object with the state
>>> + * @objects: array of GEM object to prepare
>>> + * @num_objects: number of GEM objects in the array
>>> + * @num_fences: number of fences to reserve on each GEM object
>>> + *
>>> + * Prepares all GEM objects in an array, handles contention but 
>>> aports on first
>>> + * error otherwise. Reserves @num_fences on each GEM object after 
>>> locking it.
>>> + *
>>> + * Returns: -EALREADY when object is already locked, -ENOMEM when 
>>> memory
>>> + * allocation failed and zero for success.
>>> + */
>>> +int drm_exec_prepare_array(struct drm_exec *exec,
>>> +               struct drm_gem_object **objects,
>>> +               unsigned int num_objects,
>>> +               unsigned int num_fences)
>>> +{
>>> +    int ret;
>>> +
>>> +    for (unsigned int i = 0; i < num_objects; ++i) {
>>> +        ret = drm_exec_prepare_obj(exec, objects[i], num_fences);
>>> +        if (ret)
>>> +            return ret;
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +EXPORT_SYMBOL(drm_exec_prepare_array);
>>> +
>>> +MODULE_DESCRIPTION("DRM execution context");
>>> +MODULE_LICENSE("Dual MIT/GPL");
>>> diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
>>> new file mode 100644
>>> index 000000000000..b1a5da0509c1
>>> --- /dev/null
>>> +++ b/include/drm/drm_exec.h
>>> @@ -0,0 +1,130 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
>>> +
>>> +#ifndef __DRM_EXEC_H__
>>> +#define __DRM_EXEC_H__
>>> +
>>> +#include <linux/ww_mutex.h>
>>> +
>>> +struct drm_gem_object;
>>> +
>>> +/**
>>> + * enum drm_exec_flags - Execution context flags
>>> + */
>>> +enum drm_exec_flags {
>>> +    /**
>>> +     * DRM_EXEC_FLAG_INTERRUPTIBLE: Set to true to use 
>>> interruptible locking
>>> +     * functions.
>>> +     */
>>> +    DRM_EXEC_FLAG_INTERRUPTIBLE = BIT(0),
>>> +
>>> +    /**
>>> +     * DRM_EXEC_FLAG_ALLOW_DUPLICATES: Set to true to allow 
>>> EALREADY errors.
>>> +     */
>>> +    DRM_EXEC_FLAG_ALLOW_DUPLICATES = BIT(1),
>>> +};
>>> +
>>> +/**
>>> + * struct drm_exec - Execution context
>>> + */
>>> +struct drm_exec {
>>> +    /**
>>> +     * @flags: Combinations of DRM_EXEC_FLAG_* flags.
>>> +     */
>>> +    u32 flags;
>>> +
>>> +    /**
>>> +     * @ticket: WW ticket used for acquiring locks
>>> +     */
>>> +    struct ww_acquire_ctx    ticket;
>>> +
>>> +    /**
>>> +     * @num_objects: number of objects locked
>>> +     */
>>> +    unsigned int        num_objects;
>>> +
>>> +    /**
>>> +     * @max_objects: maximum objects in array
>>> +     */
>>> +    unsigned int        max_objects;
>>> +
>>> +    /**
>>> +     * @objects: array of the locked objects
>>> +     */
>>> +    struct drm_gem_object    **objects;
>>> +
>>> +    /**
>>> +     * @contended: contended GEM object we backed off for
>>> +     */
>>> +    struct drm_gem_object    *contended;
>>> +
>>> +    /**
>>> +     * @prelocked: already locked GEM object due to contention
>>> +     */
>>> +    struct drm_gem_object *prelocked;
>>> +};
>>> +
>>> +/**
>>> + * drm_exec_for_each_locked_object - iterate over all the locked 
>>> objects
>>> + * @exec: drm_exec object
>>> + * @index: unsigned long index for the iteration
>>> + * @obj: the current GEM object
>>> + *
>>> + * Iterate over all the locked GEM objects inside the drm_exec object.
>>> + */
>>> +#define drm_exec_for_each_locked_object(exec, index, obj) \
>>> +    for (index = 0, obj = (exec)->objects[0];        \
>>> +         index < (exec)->num_objects;            \
>>> +         ++index, obj = (exec)->objects[index])
>>> +
>>> +/**
>>> + * drm_exec_until_all_locked - retry objects preparation until all 
>>> objects
>>> + * are locked
>>> + * @exec: drm_exec object
>>> + * @expr: expression to be evaluated on each attempt
>>> + *
>>> + * This helper tries to prepare objects and if a deadlock is detected,
>>> + * rollbacks and retries.
>>> + *
>>> + * @expr is typically a function that tries to prepare objects using
>>> + * drm_exec_prepare_obj().
>>> + *
>>> + * If we take drm_exec_prepare_array() as an example, you should do:
>>> + *
>>> + *    ret = drm_exec_until_all_locked(exec,
>>> + *                    drm_exec_prepare_array(exec,
>>> + *                                   objs,
>>> + *                                   num_objs,
>>> + *                                   num_fences));
>>> + *    if (ret)
>>> + *        goto error_path;
>>> + *
>>> + *    ...
>>> + *
>>> + * Returns: 0 on success, a negative error code on failure.
>>> + */
>>> +#define drm_exec_until_all_locked(exec, expr)        \
>>> +    ({                        \
>>> +        __label__ retry;            \
>>> +        int __ret;                \
>>> +retry:                            \
>>> +        __ret = expr;                \
>>> +        if ((exec)->contended) {        \
>>> +            WARN_ON(__ret != -EDEADLK);    \
>>> +            drm_exec_reset(exec);        \
>>> +            goto retry;            \
>>> +        }                    \
>>> +        ww_acquire_done(&(exec)->ticket);    \
>>> +        __ret;                    \
>>> +    })
>>> +
>>> +void drm_exec_init(struct drm_exec *exec, u32 flags);
>>> +void drm_exec_fini(struct drm_exec *exec);
>>> +void drm_exec_reset(struct drm_exec *exec);
>>> +int drm_exec_prepare_obj(struct drm_exec *exec, struct 
>>> drm_gem_object *obj,
>>> +             unsigned int num_fences);
>>> +int drm_exec_prepare_array(struct drm_exec *exec,
>>> +               struct drm_gem_object **objects,
>>> +               unsigned int num_objects,
>>> +               unsigned int num_fences);
>>> +
>>> +#endif
