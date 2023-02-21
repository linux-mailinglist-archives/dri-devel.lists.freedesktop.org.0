Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A7069E32D
	for <lists+dri-devel@lfdr.de>; Tue, 21 Feb 2023 16:17:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52C6910E817;
	Tue, 21 Feb 2023 15:17:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A46CD10E817
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Feb 2023 15:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676992617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JuqPHb9zZ5UTv5TGpgtbDOCWEaODz0ZgYpqvelgvU6c=;
 b=OB8lOPL0CNkvRcul4tKPhg6ozgOpooIvnCc35Q4YhdYWdhunBqCJoYlrMOBhykiduKKnmu
 Z3+y7vhgFxtSIgb8FNjrpbZkD3fOLiALKfH3C4z3zkK7emGm/6u4QvymuTV54u0FfcYkY8
 yXaBwyAm4DqqjLEz0UUyxTW2Qr23SnU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-553-UbI1LbY4Ok6-oM_1sPO42A-1; Tue, 21 Feb 2023 10:16:51 -0500
X-MC-Unique: UbI1LbY4Ok6-oM_1sPO42A-1
Received: by mail-ed1-f71.google.com with SMTP id
 cz22-20020a0564021cb600b004a245f58006so6844583edb.12
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Feb 2023 07:16:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JuqPHb9zZ5UTv5TGpgtbDOCWEaODz0ZgYpqvelgvU6c=;
 b=yMBoCeHGG+N4SQS7JZGBdkFXWXdcHCy8Ixi/00mw7dFxLjqRzqqnhXgnVPifyaWoay
 Xkv4IFB/TDToSRHjtL5RUCutt81lgjVxiNXtATx7ezJLnpCmx9q4AioMjHqGlCm0xZDm
 G+dCrHAET8/groxgDez8cFBQpEuTcicUAMSACb3mGoeeiirs4D3zjQIdvUuslI059RCj
 YmyEbe5rACv/f+Vr7ydTKot3dXXzi0ht1Xuu0Gg07UJMofXZhJc9NYrmowpy7N4yEdJd
 Lo+MHThMf9yvqLgR+yvjx0IzWaJUIRigRVKt/4ozbipv9qeQsDeovQe8TQ1EdpBImCUZ
 WZTw==
X-Gm-Message-State: AO0yUKXMWyE6KdaqC/Dm6uqLx8KtI0pNQlCf43+Ev38U44vK3wDFCM1P
 oICLD9RLjK6m+OFJ7AfwmMVOJat7JBN+Vz0kM0MOstyA8Y1wvRrH6p1bxt8A5S3meRW1lowo4/e
 6bEFDI+HwNys4AQjVVB+cOV1Vl41z
X-Received: by 2002:a17:906:1912:b0:872:6bd0:d2b with SMTP id
 a18-20020a170906191200b008726bd00d2bmr11895352eje.45.1676992602750; 
 Tue, 21 Feb 2023 07:16:42 -0800 (PST)
X-Google-Smtp-Source: AK7set84gm+39/qkmeMUA7Sl/R9tJ31E4LSuYXM07UxPK7sN94ycDIBGu4V0zIm/d4TFx6Jk6pHiFw==
X-Received: by 2002:a17:906:1912:b0:872:6bd0:d2b with SMTP id
 a18-20020a170906191200b008726bd00d2bmr11895303eje.45.1676992602394; 
 Tue, 21 Feb 2023 07:16:42 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de78:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de78:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 qo12-20020a170907212c00b008b17eb06282sm6267034ejb.213.2023.02.21.07.16.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 07:16:41 -0800 (PST)
Message-ID: <fbbc3bc7-3dd4-85cd-4b06-0dc9140d22f7@redhat.com>
Date: Tue, 21 Feb 2023 15:56:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH drm-next v2 01/16] drm: execution context for GEM buffers
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20230217134422.14116-1-dakr@redhat.com>
 <20230217134422.14116-2-dakr@redhat.com>
 <38ebd698-0619-6f02-7a7c-4349e5971b6a@amd.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <38ebd698-0619-6f02-7a7c-4349e5971b6a@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: matthew.brost@intel.com, willy@infradead.org,
 dri-devel@lists.freedesktop.org, corbet@lwn.net, nouveau@lists.freedesktop.org,
 ogabbay@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, boris.brezillon@collabora.com, bskeggs@redhat.com,
 tzimmermann@suse.de, Liam.Howlett@oracle.com, bagasdotme@gmail.com,
 jason@jlekstrand.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/17/23 17:00, Christian König wrote:
> Am 17.02.23 um 14:44 schrieb Danilo Krummrich:
>> From: Christian König <christian.koenig@amd.com>
>>
>> This adds the infrastructure for an execution context for GEM buffers
>> which is similar to the existinc TTMs execbuf util and intended to 
>> replace
>> it in the long term.
>>
>> The basic functionality is that we abstracts the necessary loop to lock
>> many different GEM buffers with automated deadlock and duplicate 
>> handling.
>>
>> v2: drop xarray and use dynamic resized array instead, the locking
>>      overhead is unecessary and measureable.
> 
> Question for Danilo and probably others: Does Nouveau make use of the 
> duplicate tracking at some point?

I'm not iterating duplicates or do something with them explicitly. 
However, I rely on drm_exec being able to deal with duplicates in general.
> 
> Background is that I only have two or three use cases for this in 
> radeon/amdgpu and would like to make it an optional feature.
> 
> Going to take a look at the rest of this series next week.
> 
> Regards,
> Christian.
> 
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   Documentation/gpu/drm-mm.rst       |  12 ++
>>   drivers/gpu/drm/Kconfig            |   6 +
>>   drivers/gpu/drm/Makefile           |   2 +
>>   drivers/gpu/drm/amd/amdgpu/Kconfig |   1 +
>>   drivers/gpu/drm/drm_exec.c         | 295 +++++++++++++++++++++++++++++
>>   include/drm/drm_exec.h             | 144 ++++++++++++++
>>   6 files changed, 460 insertions(+)
>>   create mode 100644 drivers/gpu/drm/drm_exec.c
>>   create mode 100644 include/drm/drm_exec.h
>>
>> diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
>> index a79fd3549ff8..a52e6f4117d6 100644
>> --- a/Documentation/gpu/drm-mm.rst
>> +++ b/Documentation/gpu/drm-mm.rst
>> @@ -493,6 +493,18 @@ DRM Sync Objects
>>   .. kernel-doc:: drivers/gpu/drm/drm_syncobj.c
>>      :export:
>> +DRM Execution context
>> +=====================
>> +
>> +.. kernel-doc:: drivers/gpu/drm/drm_exec.c
>> +   :doc: Overview
>> +
>> +.. kernel-doc:: include/drm/drm_exec.h
>> +   :internal:
>> +
>> +.. kernel-doc:: drivers/gpu/drm/drm_exec.c
>> +   :export:
>> +
>>   GPU Scheduler
>>   =============
>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>> index f42d4c6a19f2..1573d658fbb5 100644
>> --- a/drivers/gpu/drm/Kconfig
>> +++ b/drivers/gpu/drm/Kconfig
>> @@ -200,6 +200,12 @@ config DRM_TTM
>>         GPU memory types. Will be enabled automatically if a device 
>> driver
>>         uses it.
>> +config DRM_EXEC
>> +    tristate
>> +    depends on DRM
>> +    help
>> +      Execution context for command submissions
>> +
>>   config DRM_BUDDY
>>       tristate
>>       depends on DRM
>> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
>> index ab4460fcd63f..d40defbb0347 100644
>> --- a/drivers/gpu/drm/Makefile
>> +++ b/drivers/gpu/drm/Makefile
>> @@ -78,6 +78,8 @@ obj-$(CONFIG_DRM_PANEL_ORIENTATION_QUIRKS) += 
>> drm_panel_orientation_quirks.o
>>   #
>>   # Memory-management helpers
>>   #
>> +#
>> +obj-$(CONFIG_DRM_EXEC) += drm_exec.o
>>   obj-$(CONFIG_DRM_BUDDY) += drm_buddy.o
>> diff --git a/drivers/gpu/drm/amd/amdgpu/Kconfig 
>> b/drivers/gpu/drm/amd/amdgpu/Kconfig
>> index 5341b6b242c3..279fb3bba810 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/Kconfig
>> +++ b/drivers/gpu/drm/amd/amdgpu/Kconfig
>> @@ -11,6 +11,7 @@ config DRM_AMDGPU
>>       select DRM_SCHED
>>       select DRM_TTM
>>       select DRM_TTM_HELPER
>> +    select DRM_EXEC
>>       select POWER_SUPPLY
>>       select HWMON
>>       select I2C
>> diff --git a/drivers/gpu/drm/drm_exec.c b/drivers/gpu/drm/drm_exec.c
>> new file mode 100644
>> index 000000000000..ed2106c22786
>> --- /dev/null
>> +++ b/drivers/gpu/drm/drm_exec.c
>> @@ -0,0 +1,295 @@
>> +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
>> +
>> +#include <drm/drm_exec.h>
>> +#include <drm/drm_gem.h>
>> +#include <linux/dma-resv.h>
>> +
>> +/**
>> + * DOC: Overview
>> + *
>> + * This component mainly abstracts the retry loop necessary for locking
>> + * multiple GEM objects while preparing hardware operations (e.g. 
>> command
>> + * submissions, page table updates etc..).
>> + *
>> + * If a contention is detected while locking a GEM object the cleanup 
>> procedure
>> + * unlocks all previously locked GEM objects and locks the contended 
>> one first
>> + * before locking any further objects.
>> + *
>> + * After an object is locked fences slots can optionally be reserved 
>> on the
>> + * dma_resv object inside the GEM object.
>> + *
>> + * A typical usage pattern should look like this::
>> + *
>> + *    struct drm_gem_object *obj;
>> + *    struct drm_exec exec;
>> + *    unsigned long index;
>> + *    int ret;
>> + *
>> + *    drm_exec_init(&exec, true);
>> + *    drm_exec_while_not_all_locked(&exec) {
>> + *        ret = drm_exec_prepare_obj(&exec, boA, 1);
>> + *        drm_exec_continue_on_contention(&exec);
>> + *        if (ret)
>> + *            goto error;
>> + *
>> + *        ret = drm_exec_lock(&exec, boB, 1);
>> + *        drm_exec_continue_on_contention(&exec);
>> + *        if (ret)
>> + *            goto error;
>> + *    }
>> + *
>> + *    drm_exec_for_each_locked_object(&exec, index, obj) {
>> + *        dma_resv_add_fence(obj->resv, fence, DMA_RESV_USAGE_READ);
>> + *        ...
>> + *    }
>> + *    drm_exec_fini(&exec);
>> + *
>> + * See struct dma_exec for more details.
>> + */
>> +
>> +/* Dummy value used to initially enter the retry loop */
>> +#define DRM_EXEC_DUMMY (void*)~0
>> +
>> +/* Initialize the drm_exec_objects container */
>> +static void drm_exec_objects_init(struct drm_exec_objects *container)
>> +{
>> +    container->objects = kmalloc(PAGE_SIZE, GFP_KERNEL);
>> +
>> +    /* If allocation here fails, just delay that till the first use */
>> +    container->max_objects = container->objects ?
>> +        PAGE_SIZE / sizeof(void *) : 0;
>> +    container->num_objects = 0;
>> +}
>> +
>> +/* Cleanup the drm_exec_objects container */
>> +static void drm_exec_objects_fini(struct drm_exec_objects *container)
>> +{
>> +    kvfree(container->objects);
>> +}
>> +
>> +/* Make sure we have enough room and add an object the container */
>> +static int drm_exec_objects_add(struct drm_exec_objects *container,
>> +                struct drm_gem_object *obj)
>> +{
>> +    if (unlikely(container->num_objects == container->max_objects)) {
>> +        size_t size = container->max_objects * sizeof(void *);
>> +        void *tmp;
>> +
>> +        tmp = kvrealloc(container->objects, size, size + PAGE_SIZE,
>> +                GFP_KERNEL);
>> +        if (!tmp)
>> +            return -ENOMEM;
>> +
>> +        container->objects = tmp;
>> +        container->max_objects += PAGE_SIZE / sizeof(void *);
>> +    }
>> +    drm_gem_object_get(obj);
>> +    container->objects[container->num_objects++] = obj;
>> +    return 0;
>> +}
>> +
>> +/* Unlock all objects and drop references */
>> +static void drm_exec_unlock_all(struct drm_exec *exec)
>> +{
>> +    struct drm_gem_object *obj;
>> +    unsigned long index;
>> +
>> +    drm_exec_for_each_duplicate_object(exec, index, obj)
>> +        drm_gem_object_put(obj);
>> +
>> +    drm_exec_for_each_locked_object(exec, index, obj) {
>> +        dma_resv_unlock(obj->resv);
>> +        drm_gem_object_put(obj);
>> +    }
>> +}
>> +
>> +/**
>> + * drm_exec_init - initialize a drm_exec object
>> + * @exec: the drm_exec object to initialize
>> + * @interruptible: if locks should be acquired interruptible
>> + *
>> + * Initialize the object and make sure that we can track locked and 
>> duplicate
>> + * objects.
>> + */
>> +void drm_exec_init(struct drm_exec *exec, bool interruptible)
>> +{
>> +    exec->interruptible = interruptible;
>> +    drm_exec_objects_init(&exec->locked);
>> +    drm_exec_objects_init(&exec->duplicates);
>> +    exec->contended = DRM_EXEC_DUMMY;
>> +}
>> +EXPORT_SYMBOL(drm_exec_init);
>> +
>> +/**
>> + * drm_exec_fini - finalize a drm_exec object
>> + * @exec: the drm_exec object to finilize
>> + *
>> + * Unlock all locked objects, drop the references to objects and free 
>> all memory
>> + * used for tracking the state.
>> + */
>> +void drm_exec_fini(struct drm_exec *exec)
>> +{
>> +    drm_exec_unlock_all(exec);
>> +    drm_exec_objects_fini(&exec->locked);
>> +    drm_exec_objects_fini(&exec->duplicates);
>> +    if (exec->contended != DRM_EXEC_DUMMY) {
>> +        drm_gem_object_put(exec->contended);
>> +        ww_acquire_fini(&exec->ticket);
>> +    }
>> +}
>> +EXPORT_SYMBOL(drm_exec_fini);
>> +
>> +/**
>> + * drm_exec_cleanup - cleanup when contention is detected
>> + * @exec: the drm_exec object to cleanup
>> + *
>> + * Cleanup the current state and return true if we should stay inside 
>> the retry
>> + * loop, false if there wasn't any contention detected and we can 
>> keep the
>> + * objects locked.
>> + */
>> +bool drm_exec_cleanup(struct drm_exec *exec)
>> +{
>> +    if (likely(!exec->contended)) {
>> +        ww_acquire_done(&exec->ticket);
>> +        return false;
>> +    }
>> +
>> +    if (likely(exec->contended == DRM_EXEC_DUMMY)) {
>> +        exec->contended = NULL;
>> +        ww_acquire_init(&exec->ticket, &reservation_ww_class);
>> +        return true;
>> +    }
>> +
>> +    drm_exec_unlock_all(exec);
>> +    exec->locked.num_objects = 0;
>> +    exec->duplicates.num_objects = 0;
>> +    return true;
>> +}
>> +EXPORT_SYMBOL(drm_exec_cleanup);
>> +
>> +/* Track the locked object in the xa and reserve fences */
>> +static int drm_exec_obj_locked(struct drm_exec_objects *container,
>> +                   struct drm_gem_object *obj,
>> +                   unsigned int num_fences)
>> +{
>> +    int ret;
>> +
>> +    if (container) {
>> +        ret = drm_exec_objects_add(container, obj);
>> +        if (ret)
>> +            return ret;
>> +    }
>> +
>> +    if (num_fences) {
>> +        ret = dma_resv_reserve_fences(obj->resv, num_fences);
>> +        if (ret)
>> +            goto error_erase;
>> +    }
>> +
>> +    return 0;
>> +
>> +error_erase:
>> +    if (container) {
>> +        --container->num_objects;
>> +        drm_gem_object_put(obj);
>> +    }
>> +    return ret;
>> +}
>> +
>> +/* Make sure the contended object is locked first */
>> +static int drm_exec_lock_contended(struct drm_exec *exec)
>> +{
>> +    struct drm_gem_object *obj = exec->contended;
>> +    int ret;
>> +
>> +    if (likely(!obj))
>> +        return 0;
>> +
>> +    if (exec->interruptible) {
>> +        ret = dma_resv_lock_slow_interruptible(obj->resv,
>> +                               &exec->ticket);
>> +        if (unlikely(ret))
>> +            goto error_dropref;
>> +    } else {
>> +        dma_resv_lock_slow(obj->resv, &exec->ticket);
>> +    }
>> +
>> +    ret = drm_exec_obj_locked(&exec->locked, obj, 0);
>> +    if (unlikely(ret))
>> +        dma_resv_unlock(obj->resv);
>> +
>> +error_dropref:
>> +    /* Always cleanup the contention so that error handling can kick 
>> in */
>> +    drm_gem_object_put(obj);
>> +    exec->contended = NULL;
>> +    return ret;
>> +}
>> +
>> +/**
>> + * drm_exec_prepare_obj - prepare a GEM object for use
>> + * @exec: the drm_exec object with the state
>> + * @obj: the GEM object to prepare
>> + * @num_fences: how many fences to reserve
>> + *
>> + * Prepare a GEM object for use by locking it and reserving fence 
>> slots. All
>> + * succesfully locked objects are put into the locked container. 
>> Duplicates
>> + * detected as well and automatically moved into the duplicates 
>> container.
>> + *
>> + * Returns: -EDEADLK if a contention is detected, -ENOMEM when memory
>> + * allocation failed and zero for success.
>> + */
>> +int drm_exec_prepare_obj(struct drm_exec *exec, struct drm_gem_object 
>> *obj,
>> +             unsigned int num_fences)
>> +{
>> +    int ret;
>> +
>> +    ret = drm_exec_lock_contended(exec);
>> +    if (unlikely(ret))
>> +        return ret;
>> +
>> +    if (exec->interruptible)
>> +        ret = dma_resv_lock_interruptible(obj->resv, &exec->ticket);
>> +    else
>> +        ret = dma_resv_lock(obj->resv, &exec->ticket);
>> +
>> +    if (unlikely(ret == -EDEADLK)) {
>> +        drm_gem_object_get(obj);
>> +        exec->contended = obj;
>> +        return -EDEADLK;
>> +    }
>> +
>> +    if (unlikely(ret == -EALREADY)) {
>> +        struct drm_exec_objects *container = &exec->duplicates;
>> +
>> +        /*
>> +         * If this is the first locked GEM object it was most likely
>> +         * just contended. So don't add it to the duplicates, just
>> +         * reserve the fence slots.
>> +         */
>> +        if (exec->locked.num_objects && exec->locked.objects[0] == obj)
>> +            container = NULL;
>> +
>> +        ret = drm_exec_obj_locked(container, obj, num_fences);
>> +        if (ret)
>> +            return ret;
>> +
>> +    } else if (unlikely(ret)) {
>> +        return ret;
>> +
>> +    } else {
>> +        ret = drm_exec_obj_locked(&exec->locked, obj, num_fences);
>> +        if (ret)
>> +            goto error_unlock;
>> +    }
>> +
>> +    drm_gem_object_get(obj);
>> +    return 0;
>> +
>> +error_unlock:
>> +    dma_resv_unlock(obj->resv);
>> +    return ret;
>> +}
>> +EXPORT_SYMBOL(drm_exec_prepare_obj);
>> +
>> +MODULE_DESCRIPTION("DRM execution context");
>> +MODULE_LICENSE("Dual MIT/GPL");
>> diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
>> new file mode 100644
>> index 000000000000..f73981c6292e
>> --- /dev/null
>> +++ b/include/drm/drm_exec.h
>> @@ -0,0 +1,144 @@
>> +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
>> +
>> +#ifndef __DRM_EXEC_H__
>> +#define __DRM_EXEC_H__
>> +
>> +#include <linux/ww_mutex.h>
>> +
>> +struct drm_gem_object;
>> +
>> +/**
>> + * struct drm_exec_objects - Container for GEM objects in a drm_exec
>> + */
>> +struct drm_exec_objects {
>> +    unsigned int        num_objects;
>> +    unsigned int        max_objects;
>> +    struct drm_gem_object    **objects;
>> +};
>> +
>> +/**
>> + * drm_exec_objects_for_each - iterate over all the objects inside 
>> the container
>> + */
>> +#define drm_exec_objects_for_each(array, index, obj)        \
>> +    for (index = 0, obj = (array)->objects[0];        \
>> +         index < (array)->num_objects;            \
>> +         ++index, obj = (array)->objects[index])
>> +
>> +/**
>> + * struct drm_exec - Execution context
>> + */
>> +struct drm_exec {
>> +    /**
>> +     * @interruptible: If locks should be taken interruptible
>> +     */
>> +    bool            interruptible;
>> +
>> +    /**
>> +     * @ticket: WW ticket used for acquiring locks
>> +     */
>> +    struct ww_acquire_ctx    ticket;
>> +
>> +    /**
>> +     * @locked: container for the locked GEM objects
>> +     */
>> +    struct drm_exec_objects    locked;
>> +
>> +    /**
>> +     * @duplicates: container for the duplicated GEM objects
>> +     */
>> +    struct drm_exec_objects    duplicates;
>> +
>> +    /**
>> +     * @contended: contended GEM object we backet of for.
>> +     */
>> +    struct drm_gem_object    *contended;
>> +};
>> +
>> +/**
>> + * drm_exec_for_each_locked_object - iterate over all the locked objects
>> + * @exec: drm_exec object
>> + * @index: unsigned long index for the iteration
>> + * @obj: the current GEM object
>> + *
>> + * Iterate over all the locked GEM objects inside the drm_exec object.
>> + */
>> +#define drm_exec_for_each_locked_object(exec, index, obj)    \
>> +    drm_exec_objects_for_each(&(exec)->locked, index, obj)
>> +
>> +/**
>> + * drm_exec_for_each_duplicate_object - iterate over all the 
>> duplicate objects
>> + * @exec: drm_exec object
>> + * @index: unsigned long index for the iteration
>> + * @obj: the current GEM object
>> + *
>> + * Iterate over all the duplicate GEM objects inside the drm_exec 
>> object.
>> + */
>> +#define drm_exec_for_each_duplicate_object(exec, index, obj)    \
>> +    drm_exec_objects_for_each(&(exec)->duplicates, index, obj)
>> +
>> +/**
>> + * drm_exec_while_not_all_locked - loop until all GEM objects are 
>> prepared
>> + * @exec: drm_exec object
>> + *
>> + * Core functionality of the drm_exec object. Loops until all GEM 
>> objects are
>> + * prepared and no more contention exists.
>> + *
>> + * At the beginning of the loop it is guaranteed that no GEM object 
>> is locked.
>> + */
>> +#define drm_exec_while_not_all_locked(exec)    \
>> +    while (drm_exec_cleanup(exec))
>> +
>> +/**
>> + * drm_exec_continue_on_contention - continue the loop when we need 
>> to cleanup
>> + * @exec: drm_exec object
>> + *
>> + * Control flow helper to continue when a contention was detected and 
>> we need to
>> + * clean up and re-start the loop to prepare all GEM objects.
>> + */
>> +#define drm_exec_continue_on_contention(exec)        \
>> +    if (unlikely(drm_exec_is_contended(exec)))    \
>> +        continue
>> +
>> +/**
>> + * drm_exec_break_on_contention - break a subordinal loop on contention
>> + * @exec: drm_exec object
>> + *
>> + * Control flow helper to break a subordinal loop when a contention 
>> was detected
>> + * and we need to clean up and re-start the loop to prepare all GEM 
>> objects.
>> + */
>> +#define drm_exec_break_on_contention(exec)        \
>> +    if (unlikely(drm_exec_is_contended(exec)))    \
>> +        break
>> +
>> +/**
>> + * drm_exec_is_contended - check for contention
>> + * @exec: drm_exec object
>> + *
>> + * Returns true if the drm_exec object has run into some contention 
>> while
>> + * locking a GEM object and needs to clean up.
>> + */
>> +static inline bool drm_exec_is_contended(struct drm_exec *exec)
>> +{
>> +    return !!exec->contended;
>> +}
>> +
>> +/**
>> + * drm_exec_has_duplicates - check for duplicated GEM object
>> + * @exec: drm_exec object
>> + *
>> + * Return true if the drm_exec object has encountered some already 
>> locked GEM
>> + * objects while trying to lock them. This can happen if multiple GEM 
>> objects
>> + * share the same underlying resv object.
>> + */
>> +static inline bool drm_exec_has_duplicates(struct drm_exec *exec)
>> +{
>> +    return exec->duplicates.num_objects > 0;
>> +}
>> +
>> +void drm_exec_init(struct drm_exec *exec, bool interruptible);
>> +void drm_exec_fini(struct drm_exec *exec);
>> +bool drm_exec_cleanup(struct drm_exec *exec);
>> +int drm_exec_prepare_obj(struct drm_exec *exec, struct drm_gem_object 
>> *obj,
>> +             unsigned int num_fences);
>> +
>> +#endif
> 

