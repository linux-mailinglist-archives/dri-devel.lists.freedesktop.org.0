Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C34DC735579
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 13:06:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6245210E1EB;
	Mon, 19 Jun 2023 11:06:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD3A510E1EB;
 Mon, 19 Jun 2023 11:06:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 98B0840A29;
 Mon, 19 Jun 2023 13:06:51 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.2
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.091,
 T_SCC_BODY_TEXT_LINE=-0.01, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Authentication-Results: ste-pvt-msa1.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cf71LNJ089Nc; Mon, 19 Jun 2023 13:06:50 +0200 (CEST)
Received: by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 3618840A1E;
 Mon, 19 Jun 2023 13:06:50 +0200 (CEST)
Received: from [192.168.0.209] (h-155-4-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id C1D523631FE;
 Mon, 19 Jun 2023 13:06:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1687172809; bh=dCweQdyiTz2t0+mixufVnOhhEFr5svnVnndV0v+HhpE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=FJZuvUGLmZoDYRx/5PhtAUOxEj7AgO+Zu9rlSKDdDW+R3ECbBHDuLSZLLiOKuRxWl
 B5KYE48OtUi6o40xeTOTxG7m3bzaLbcL5mCEJdF+ZZyCPFPNOZw18VCqvA0VhPAtyx
 Hfl7C2sRgd94cUMz+ofyOXmPwyemjfZs+qMy4xRg=
Message-ID: <2b8ec4e4-5442-952f-e699-300492f2b4f2@shipmail.org>
Date: Mon, 19 Jun 2023 13:06:49 +0200
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
 <e8e93582-e741-564d-4d26-4e507ccb5906@shipmail.org>
 <4ca0aef0-824e-383a-95e3-72bb3685b567@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
In-Reply-To: <4ca0aef0-824e-383a-95e3-72bb3685b567@amd.com>
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


On 6/19/23 11:48, Christian König wrote:
> Hi,
>
> Am 19.06.23 um 11:33 schrieb Thomas Hellström (Intel):
>> [SNIP]
>>>> Sometimes you want to just drop the contended lock after the above 
>>>> relaxation. (Eviction would be one example), and not add as 
>>>> prelocked, if the contended object goes out of scope. Eviction 
>>>> would in some situations be one such example, -EDEADLOCK leading to 
>>>> an error path where the object should otherwise be freed is 
>>>> another. Perhaps we could add an argument to prepare_obj() as to 
>>>> whether the object should be immediately put after relaxation.
>>>
>>> I was considering a try_prepare version as well, that should cover 
>>> this use case.
>>
>> That sounds a bit different from this use-case. The use-case above 
>> would, on -EDEADLOCK actually unlock everything, then lock-slow the 
>> contending lock and then immediately unlock it and drop.
>
> Hui? What would that be good for?

It's for the case where you have nested locking, the contended lock has 
gone out-of-scope and you're probably not going to need it on the next 
attempt. I think the refcounted "prelocked" object that is lacking in 
the i915 variant will resolve all correctness / uaf issues, but still 
the object might be needlessly carried around for yet another locking round.


>
>> It sounds like try_prepare would just skip locking and continue with 
>> everything locked so far still locked?
>
> Correct.
>
>>
>>>
>>>>
>>>>> +    ret = drm_exec_obj_locked(exec, obj);
>>>>> +    if (unlikely(ret)) {
>>>>> +        dma_resv_unlock(obj->resv);
>>>>> +        goto error_dropref;
>>>>> +    }
>>>>> +
>>>>> +    swap(exec->prelocked, obj);
>>>>> +
>>>>> +error_dropref:
>>>>> +    /* Always cleanup the contention so that error handling can 
>>>>> kick in */
>>>>> +    drm_gem_object_put(obj);
>>>>> +    exec->contended = NULL;
>>>>> +    return ret;
>>>>> +}
>>>>> +
>>>>> +/**
>>>>> + * drm_exec_prepare_obj - prepare a GEM object for use
>>>>> + * @exec: the drm_exec object with the state
>>>>> + * @obj: the GEM object to prepare
>>>>> + * @num_fences: how many fences to reserve
>>>>> + *
>>>>> + * Prepare a GEM object for use by locking it and reserving fence 
>>>>> slots. All
>>>>> + * successfully locked objects are put into the locked container.
>>>>> + *
>>>>> + * Returns: -EDEADLK if a contention is detected, -EALREADY when 
>>>>> object is
>>>>> + * already locked, -ENOMEM when memory allocation failed and zero 
>>>>> for success.
>>>>> + */
>>>>> +int drm_exec_prepare_obj(struct drm_exec *exec, struct 
>>>>> drm_gem_object *obj,
>>>>> +             unsigned int num_fences)
>>>>> +{
>>>>> +    int ret;
>>>>> +
>>>>> +    ret = drm_exec_lock_contended(exec);
>>>>> +    if (unlikely(ret))
>>>>> +        return ret;
>>>>> +
>>>>> +    if (exec->prelocked == obj) {
>>>>> +        drm_gem_object_put(exec->prelocked);
>>>>> +        exec->prelocked = NULL;
>>>>> +
>>>>> +        return dma_resv_reserve_fences(obj->resv, num_fences);
>>>>> +    }
>>>>> +
>>>>> +    if (exec->flags & DRM_EXEC_FLAG_INTERRUPTIBLE)
>>>>> +        ret = dma_resv_lock_interruptible(obj->resv, &exec->ticket);
>>>>> +    else
>>>>> +        ret = dma_resv_lock(obj->resv, &exec->ticket);
>>>>> +
>>>>> +    if (unlikely(ret == -EDEADLK)) {
>>>>> +        drm_gem_object_get(obj);
>>>>> +        exec->contended = obj;
>>>>> +        return -EDEADLK;
>>>>> +    }
>>>>> +
>>>>> +    if (unlikely(ret == -EALREADY &&
>>>>> +        (exec->flags & DRM_EXEC_FLAG_ALLOW_DUPLICATES)))
>>>>> +        goto reserve_fences;
>>>>> +
>>>>> +    if (unlikely(ret))
>>>>> +        return ret;
>>>>> +
>>>>> +    ret = drm_exec_obj_locked(exec, obj);
>>>>> +    if (ret)
>>>>> +        goto error_unlock;
>>>>> +
>>>>> +reserve_fences:
>>>>> +    /* Keep locked when reserving fences fails */
>>>>> +    return dma_resv_reserve_fences(obj->resv, num_fences);
>>>>
>>>> Ugh, what is the use-case for keeping things locked here? How would 
>>>> a caller tell the difference between an error where everything is 
>>>> locked and nothing is locked? IMO, we should unlock on error here. 
>>>> If there indeed is a use-case we should add a separate function for 
>>>> reserving fences for all locked objects, rather than returning 
>>>> sometimes locked on error sometime not.
>>>
>>> We return the object locked here because it was to much churn to 
>>> remove it again from the array and we are getting fully cleaned up 
>>> at the end anyway.
>>
>> OK, so if we add an unlock functionality, we could just have a 
>> consistent locking state on error return?
>
> Yeah, that should work. Going to work on this.

Great.

Thanks,

Thomas


>
> Regards,
> Christian.
>
>>
>> Thanks,
>> Thomas
>>
>>>
>>> Regards,
>>> Christian.
>>>
>>>>
>>>> Thanks,
>>>>
>>>> Thomas
>>>>
>>>>
>>>>> +
>>>>> +error_unlock:
>>>>> +    dma_resv_unlock(obj->resv);
>>>>> +    return ret;
>>>>> +}
>>>>> +EXPORT_SYMBOL(drm_exec_prepare_obj);
>>>>> +
>>>>> +/**
>>>>> + * drm_exec_prepare_array - helper to prepare an array of objects
>>>>> + * @exec: the drm_exec object with the state
>>>>> + * @objects: array of GEM object to prepare
>>>>> + * @num_objects: number of GEM objects in the array
>>>>> + * @num_fences: number of fences to reserve on each GEM object
>>>>> + *
>>>>> + * Prepares all GEM objects in an array, handles contention but 
>>>>> aports on first
>>>>> + * error otherwise. Reserves @num_fences on each GEM object after 
>>>>> locking it.
>>>>> + *
>>>>> + * Returns: -EALREADY when object is already locked, -ENOMEM when 
>>>>> memory
>>>>> + * allocation failed and zero for success.
>>>>> + */
>>>>> +int drm_exec_prepare_array(struct drm_exec *exec,
>>>>> +               struct drm_gem_object **objects,
>>>>> +               unsigned int num_objects,
>>>>> +               unsigned int num_fences)
>>>>> +{
>>>>> +    int ret;
>>>>> +
>>>>> +    for (unsigned int i = 0; i < num_objects; ++i) {
>>>>> +        ret = drm_exec_prepare_obj(exec, objects[i], num_fences);
>>>>> +        if (ret)
>>>>> +            return ret;
>>>>> +    }
>>>>> +
>>>>> +    return 0;
>>>>> +}
>>>>> +EXPORT_SYMBOL(drm_exec_prepare_array);
>>>>> +
>>>>> +MODULE_DESCRIPTION("DRM execution context");
>>>>> +MODULE_LICENSE("Dual MIT/GPL");
>>>>> diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
>>>>> new file mode 100644
>>>>> index 000000000000..b1a5da0509c1
>>>>> --- /dev/null
>>>>> +++ b/include/drm/drm_exec.h
>>>>> @@ -0,0 +1,130 @@
>>>>> +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
>>>>> +
>>>>> +#ifndef __DRM_EXEC_H__
>>>>> +#define __DRM_EXEC_H__
>>>>> +
>>>>> +#include <linux/ww_mutex.h>
>>>>> +
>>>>> +struct drm_gem_object;
>>>>> +
>>>>> +/**
>>>>> + * enum drm_exec_flags - Execution context flags
>>>>> + */
>>>>> +enum drm_exec_flags {
>>>>> +    /**
>>>>> +     * DRM_EXEC_FLAG_INTERRUPTIBLE: Set to true to use 
>>>>> interruptible locking
>>>>> +     * functions.
>>>>> +     */
>>>>> +    DRM_EXEC_FLAG_INTERRUPTIBLE = BIT(0),
>>>>> +
>>>>> +    /**
>>>>> +     * DRM_EXEC_FLAG_ALLOW_DUPLICATES: Set to true to allow 
>>>>> EALREADY errors.
>>>>> +     */
>>>>> +    DRM_EXEC_FLAG_ALLOW_DUPLICATES = BIT(1),
>>>>> +};
>>>>> +
>>>>> +/**
>>>>> + * struct drm_exec - Execution context
>>>>> + */
>>>>> +struct drm_exec {
>>>>> +    /**
>>>>> +     * @flags: Combinations of DRM_EXEC_FLAG_* flags.
>>>>> +     */
>>>>> +    u32 flags;
>>>>> +
>>>>> +    /**
>>>>> +     * @ticket: WW ticket used for acquiring locks
>>>>> +     */
>>>>> +    struct ww_acquire_ctx    ticket;
>>>>> +
>>>>> +    /**
>>>>> +     * @num_objects: number of objects locked
>>>>> +     */
>>>>> +    unsigned int        num_objects;
>>>>> +
>>>>> +    /**
>>>>> +     * @max_objects: maximum objects in array
>>>>> +     */
>>>>> +    unsigned int        max_objects;
>>>>> +
>>>>> +    /**
>>>>> +     * @objects: array of the locked objects
>>>>> +     */
>>>>> +    struct drm_gem_object    **objects;
>>>>> +
>>>>> +    /**
>>>>> +     * @contended: contended GEM object we backed off for
>>>>> +     */
>>>>> +    struct drm_gem_object    *contended;
>>>>> +
>>>>> +    /**
>>>>> +     * @prelocked: already locked GEM object due to contention
>>>>> +     */
>>>>> +    struct drm_gem_object *prelocked;
>>>>> +};
>>>>> +
>>>>> +/**
>>>>> + * drm_exec_for_each_locked_object - iterate over all the locked 
>>>>> objects
>>>>> + * @exec: drm_exec object
>>>>> + * @index: unsigned long index for the iteration
>>>>> + * @obj: the current GEM object
>>>>> + *
>>>>> + * Iterate over all the locked GEM objects inside the drm_exec 
>>>>> object.
>>>>> + */
>>>>> +#define drm_exec_for_each_locked_object(exec, index, obj) \
>>>>> +    for (index = 0, obj = (exec)->objects[0];        \
>>>>> +         index < (exec)->num_objects;            \
>>>>> +         ++index, obj = (exec)->objects[index])
>>>>> +
>>>>> +/**
>>>>> + * drm_exec_until_all_locked - retry objects preparation until 
>>>>> all objects
>>>>> + * are locked
>>>>> + * @exec: drm_exec object
>>>>> + * @expr: expression to be evaluated on each attempt
>>>>> + *
>>>>> + * This helper tries to prepare objects and if a deadlock is 
>>>>> detected,
>>>>> + * rollbacks and retries.
>>>>> + *
>>>>> + * @expr is typically a function that tries to prepare objects using
>>>>> + * drm_exec_prepare_obj().
>>>>> + *
>>>>> + * If we take drm_exec_prepare_array() as an example, you should do:
>>>>> + *
>>>>> + *    ret = drm_exec_until_all_locked(exec,
>>>>> + *                    drm_exec_prepare_array(exec,
>>>>> + *                                   objs,
>>>>> + *                                   num_objs,
>>>>> + *                                   num_fences));
>>>>> + *    if (ret)
>>>>> + *        goto error_path;
>>>>> + *
>>>>> + *    ...
>>>>> + *
>>>>> + * Returns: 0 on success, a negative error code on failure.
>>>>> + */
>>>>> +#define drm_exec_until_all_locked(exec, expr)        \
>>>>> +    ({                        \
>>>>> +        __label__ retry;            \
>>>>> +        int __ret;                \
>>>>> +retry:                            \
>>>>> +        __ret = expr;                \
>>>>> +        if ((exec)->contended) {        \
>>>>> +            WARN_ON(__ret != -EDEADLK);    \
>>>>> +            drm_exec_reset(exec);        \
>>>>> +            goto retry;            \
>>>>> +        }                    \
>>>>> +        ww_acquire_done(&(exec)->ticket);    \
>>>>> +        __ret;                    \
>>>>> +    })
>>>>> +
>>>>> +void drm_exec_init(struct drm_exec *exec, u32 flags);
>>>>> +void drm_exec_fini(struct drm_exec *exec);
>>>>> +void drm_exec_reset(struct drm_exec *exec);
>>>>> +int drm_exec_prepare_obj(struct drm_exec *exec, struct 
>>>>> drm_gem_object *obj,
>>>>> +             unsigned int num_fences);
>>>>> +int drm_exec_prepare_array(struct drm_exec *exec,
>>>>> +               struct drm_gem_object **objects,
>>>>> +               unsigned int num_objects,
>>>>> +               unsigned int num_fences);
>>>>> +
>>>>> +#endif
