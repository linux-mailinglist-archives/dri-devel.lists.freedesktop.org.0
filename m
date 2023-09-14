Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E18757A0BA7
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 19:25:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0031610E29D;
	Thu, 14 Sep 2023 17:25:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2681010E29E
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 17:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694712336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0Aol6jxzlWnzdNb3Rodg0NX62ZcMK0/Glt3uyTv0sUs=;
 b=YQXx7qd4L2xN0220s7Ptvg+DnY95E8YQ5B4adBf0JU4m82VnPopOqEWpDpV9+R4CAvrQxw
 0/jOjbiD3+TnvdPpUJoh0EZn30JADrT/5f4WeHwhdrpGPXsDsGgyU37gr7BVrPs/qeLa7b
 eReFvPzpy6dQqxC3xg4n+adpgCNIi48=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-437--1feMyOFMfC7ULnCnUF9NQ-1; Thu, 14 Sep 2023 13:25:35 -0400
X-MC-Unique: -1feMyOFMfC7ULnCnUF9NQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-993c2d9e496so95349366b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 10:25:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694712334; x=1695317134;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0Aol6jxzlWnzdNb3Rodg0NX62ZcMK0/Glt3uyTv0sUs=;
 b=jafUzzElR/B3RKzQJyvTGJIH8VcTDZEhd1VVL3SBr+LINlp1blhUpdj7x2IkgG8ETt
 Mck2F5EHKGc4Ocou6KFQkebSA8wdYuce5wcF3pK5YXBsWBN84Yx+VFOwTyF2tDuq6S9c
 6PD6dtZI6TzaS50avTN9D/jObGDERaNnIaVlL//KEH6Es0jtwu0QvMenvG0sY5YjDJcc
 yAcy8Xo0Pa4n8kFBGEa+fnw6VN6pnQyBLf1xhKuOqGcLjsahIeN7tX8yXS+lfF8yTJqw
 pS4SQFgxL6Et4v0CMhOMqM3m0dziTM4LQscSzfyf3EIgIuWYjLD4+QI7gs14TUG62zUp
 UQ2A==
X-Gm-Message-State: AOJu0YwOQTe9zwqHIZlw1lD0H7VdJcM6i2a2IunJ6s3UD7Os9gcq0pVH
 4uxCKfey330N8EF01P8EE/1cjUJAP2xwtLBGabaMvv+Dxm8NkKWl9q6kWAyhvPRReuf+cdZPBda
 0q1SgD9y66ljLmB0DAqU3XZJZelKm
X-Received: by 2002:a17:906:cc58:b0:9a9:f3df:80cd with SMTP id
 mm24-20020a170906cc5800b009a9f3df80cdmr4499932ejb.72.1694712333765; 
 Thu, 14 Sep 2023 10:25:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH47inJm7FoAmrJdqXXrLDU5mF4jvBJ0EWuzOIG7HxwUpDSiewi1WBkIlurKQHelbeLV7HiYw==
X-Received: by 2002:a17:906:cc58:b0:9a9:f3df:80cd with SMTP id
 mm24-20020a170906cc5800b009a9f3df80cdmr4499920ejb.72.1694712333361; 
 Thu, 14 Sep 2023 10:25:33 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 u22-20020a170906409600b0099d9dee8108sm1290752ejj.149.2023.09.14.10.25.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Sep 2023 10:25:32 -0700 (PDT)
Message-ID: <803e4aa0-0c46-05ba-e90b-188771227f0a@redhat.com>
Date: Thu, 14 Sep 2023 19:25:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH drm-misc-next v3 6/7] drm/gpuvm: generalize
 dma_resv/extobj handling and GEM validation
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 airlied@gmail.com, daniel@ffwll.ch, matthew.brost@intel.com,
 sarah.walker@imgtec.com, donald.robson@imgtec.com,
 boris.brezillon@collabora.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
References: <20230909153125.30032-1-dakr@redhat.com>
 <20230909153125.30032-7-dakr@redhat.com>
 <62d9b00a-547a-2106-5ec3-6f6a88023496@linux.intel.com>
 <c620c142-ea38-415d-729e-2561f1f4bae3@redhat.com>
 <476c46cfddaef125108a117b47ea9f76299ea85c.camel@linux.intel.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <476c46cfddaef125108a117b47ea9f76299ea85c.camel@linux.intel.com>
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/14/23 19:21, Thomas Hellström wrote:
> On Thu, 2023-09-14 at 18:36 +0200, Danilo Krummrich wrote:
>> On 9/14/23 15:48, Thomas Hellström wrote:
>>> Hi, Danilo
>>>
>>> Some additional minor comments as xe conversion progresses.
>>>
>>> On 9/9/23 17:31, Danilo Krummrich wrote:
>>>> So far the DRM GPUVA manager offers common infrastructure to
>>>> track GPU VA
>>>> allocations and mappings, generically connect GPU VA mappings to
>>>> their
>>>> backing buffers and perform more complex mapping operations on
>>>> the GPU VA
>>>> space.
>>>>
>>>> However, there are more design patterns commonly used by drivers,
>>>> which
>>>> can potentially be generalized in order to make the DRM GPUVA
>>>> manager
>>>> represent a basic GPU-VM implementation. In this context, this
>>>> patch aims
>>>> at generalizing the following elements.
>>>>
>>>> 1) Provide a common dma-resv for GEM objects not being used
>>>> outside of
>>>>      this GPU-VM.
>>>>
>>>> 2) Provide tracking of external GEM objects (GEM objects which
>>>> are
>>>>      shared with other GPU-VMs).
>>>>
>>>> 3) Provide functions to efficiently lock all GEM objects dma-resv
>>>> the
>>>>      GPU-VM contains mappings of.
>>>>
>>>> 4) Provide tracking of evicted GEM objects the GPU-VM contains
>>>> mappings
>>>>      of, such that validation of evicted GEM objects is
>>>> accelerated.
>>>>
>>>> 5) Provide some convinience functions for common patterns.
>>>>
>>>> Rather than being designed as a "framework", the target is to
>>>> make all
>>>> features appear as a collection of optional helper functions,
>>>> such that
>>>> drivers are free to make use of the DRM GPUVA managers basic
>>>> functionality and opt-in for other features without setting any
>>>> feature
>>>> flags, just by making use of the corresponding functions.
>>>>
>>>> Big kudos to Boris Brezillon for his help to figure out locking
>>>> for drivers
>>>> updating the GPU VA space within the fence signalling path.
>>>>
>>>> Suggested-by: Matthew Brost <matthew.brost@intel.com>
>>>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
>>>> ---
>>>>
>>>> +/**
>>>> + * drm_gpuvm_bo_evict() - add / remove a &drm_gem_object to /
>>>> from a
>>>> + * &drm_gpuvms evicted list
>>>> + * @obj: the &drm_gem_object to add or remove
>>>> + * @evict: indicates whether the object is evicted
>>>> + *
>>>> + * Adds a &drm_gem_object to or removes it from all &drm_gpuvms
>>>> evicted
>>>> + * list containing a mapping of this &drm_gem_object.
>>>> + */
>>>> +void
>>>> +drm_gpuvm_bo_evict(struct drm_gem_object *obj, bool evict)
>>>> +{
>>>> +    struct drm_gpuvm_bo *vm_bo;
>>>> +
>>>> +    drm_gem_for_each_gpuvm_bo(vm_bo, obj) {
>>>> +        if (evict)
>>>> +            drm_gpuvm_bo_list_add(vm_bo, evict);
>>>> +        else
>>>> +            drm_gpuvm_bo_list_del(vm_bo, evict);
>>>> +    }
>>>> +}
>>>> +EXPORT_SYMBOL_GPL(drm_gpuvm_bo_evict);
>>>> +
>>>
>>> We need a drm_gpuvm_bo_evict(struct drm_gpuvm_bo *vm_bo, ...) that
>>> puts a single gpuvm_bo on the list, the above function could
>>> perhaps be renamed as drm_gpuvm_gem_obj_evict(obj, ....).
>>
>> Makes sense - gonna change that.
>>
>>>
>>> Reason is some vm's are faulting vms which don't have an evict
>>> list, but validate from the pagefault handler. Also evict == false
>>> is dangerous because if called from within an exec, it might remove
>>> the obj from other vm's evict list before they've had a chance to
>>> rebind their VMAs.
>>>
>>>>    static int
>>>>    __drm_gpuva_insert(struct drm_gpuvm *gpuvm,
>>>>               struct drm_gpuva *va)
>>>> diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
>>>> index afa50b9059a2..834bb6d6617e 100644
>>>> --- a/include/drm/drm_gpuvm.h
>>>> +++ b/include/drm/drm_gpuvm.h
>>>> @@ -26,10 +26,12 @@
>>>>     */
>>>>    #include <linux/list.h>
>>>> +#include <linux/dma-resv.h>
>>>>    #include <linux/rbtree.h>
>>>>    #include <linux/types.h>
>>>>    #include <drm/drm_gem.h>
>>>> +#include <drm/drm_exec.h>
>>>>    struct drm_gpuvm;
>>>>    struct drm_gpuvm_bo;
>>>> @@ -259,6 +261,38 @@ struct drm_gpuvm {
>>>>         * space
>>>>         */
>>>>        struct dma_resv *resv;
>>>> +
>>>> +    /**
>>>> +     * @extobj: structure holding the extobj list
>>>> +     */
>>>> +    struct {
>>>> +        /**
>>>> +         * @list: &list_head storing &drm_gpuvm_bos serving as
>>>> +         * external object
>>>> +         */
>>>> +        struct list_head list;
>>>> +
>>>> +        /**
>>>> +         * @lock: spinlock to protect the extobj list
>>>> +         */
>>>> +        spinlock_t lock;
>>>> +    } extobj;
>>>> +
>>>> +    /**
>>>> +     * @evict: structure holding the evict list and evict list
>>>> lock
>>>> +     */
>>>> +    struct {
>>>> +        /**
>>>> +         * @list: &list_head storing &drm_gpuvm_bos currently
>>>> being
>>>> +         * evicted
>>>> +         */
>>>> +        struct list_head list;
>>>> +
>>>> +        /**
>>>> +         * @lock: spinlock to protect the evict list
>>>> +         */
>>>> +        spinlock_t lock;
>>>> +    } evict;
>>>>    };
>>>>    void drm_gpuvm_init(struct drm_gpuvm *gpuvm, struct drm_device
>>>> *drm,
>>>> @@ -268,6 +302,21 @@ void drm_gpuvm_init(struct drm_gpuvm *gpuvm,
>>>> struct drm_device *drm,
>>>>                const struct drm_gpuvm_ops *ops);
>>>>    void drm_gpuvm_destroy(struct drm_gpuvm *gpuvm);
>>>> +/**
>>>> + * drm_gpuvm_is_extobj() - indicates whether the given
>>>> &drm_gem_object is an
>>>> + * external object
>>>> + * @gpuvm: the &drm_gpuvm to check
>>>> + * @obj: the &drm_gem_object to check
>>>> + *
>>>> + * Returns: true if the &drm_gem_object &dma_resv differs from
>>>> the
>>>> + * &drm_gpuvms &dma_resv, false otherwise
>>>> + */
>>>> +static inline bool drm_gpuvm_is_extobj(struct drm_gpuvm *gpuvm,
>>>> +                       struct drm_gem_object *obj)
>>>> +{
>>>> +    return obj && obj->resv != gpuvm->resv;
>>>> +}
>>>> +
>>>>    static inline struct drm_gpuva *
>>>>    __drm_gpuva_next(struct drm_gpuva *va)
>>>>    {
>>>> @@ -346,6 +395,128 @@ __drm_gpuva_next(struct drm_gpuva *va)
>>>>    #define drm_gpuvm_for_each_va_safe(va__, next__, gpuvm__) \
>>>>        list_for_each_entry_safe(va__, next__, &(gpuvm__)->rb.list,
>>>> rb.entry)
>>>> +/**
>>>> + * struct drm_gpuvm_exec - &drm_gpuvm abstraction of &drm_exec
>>>> + *
>>>> + * This structure should be created on the stack as &drm_exec
>>>> should be.
>>>> + *
>>>> + * Optionally, @extra can be set in order to lock additional
>>>> &drm_gem_objects.
>>>> + */
>>>> +struct drm_gpuvm_exec {
>>>> +    /**
>>>> +     * @exec: the &drm_exec structure
>>>> +     */
>>>> +    struct drm_exec exec;
>>>> +
>>>> +    /**
>>>> +     * @vm: the &drm_gpuvm to lock its DMA reservations
>>>> +     */
>>>> +    struct drm_gpuvm *vm;
>>>> +
>>>> +    /**
>>>> +     * @extra: Callback and corresponding private data for the
>>>> driver to
>>>> +     * lock arbitrary additional &drm_gem_objects.
>>>> +     */
>>>> +    struct {
>>>> +        /**
>>>> +         * @fn: The driver callback to lock additional
>>>> &drm_gem_objects.
>>>> +         */
>>>> +        int (*fn)(struct drm_gpuvm_exec *vm_exec,
>>>> +              unsigned int num_fences);
>>>> +
>>>> +        /**
>>>> +         * @priv: driver private data for the @fn callback
>>>> +         */
>>>> +        void *priv;
>>>> +    } extra;
>>>> +};
>>>> +
>>>> +/**
>>>> + * drm_gpuvm_prepare_vm() - prepare the GPUVMs common dma-resv
>>>> + * @gpuvm: the &drm_gpuvm
>>>> + * @exec: the &drm_exec context
>>>> + * @num_fences: the amount of &dma_fences to reserve
>>>> + *
>>>> + * Calls drm_exec_prepare_obj() for the GPUVMs dummy
>>>> &drm_gem_object.
>>>> + *
>>>> + * Using this function directly, it is the drivers
>>>> responsibility to call
>>>> + * drm_exec_init() and drm_exec_fini() accordingly.
>>>> + *
>>>> + * Returns: 0 on success, negative error code on failure.
>>>> + */
>>>> +static inline int
>>>> +drm_gpuvm_prepare_vm(struct drm_gpuvm *gpuvm,
>>>> +             struct drm_exec *exec,
>>>> +             unsigned int num_fences)
>>>> +{
>>>> +    return drm_exec_prepare_obj(exec, &gpuvm->d_obj,
>>>> num_fences);
>>>> +}
>>>> +
>>>> +int drm_gpuvm_prepare_objects(struct drm_gpuvm *gpuvm,
>>>> +                  struct drm_exec *exec,
>>>> +                  unsigned int num_fences);
>>>> +
>>>> +int drm_gpuvm_prepare_range(struct drm_gpuvm *gpuvm,
>>>> +                struct drm_exec *exec,
>>>> +                u64 addr, u64 range,
>>>> +                unsigned int num_fences);
>>>> +
>>>> +int drm_gpuvm_exec_lock(struct drm_gpuvm_exec *vm_exec,
>>>> +            unsigned int num_fences,
>>>> +            bool interruptible);
>>>> +
>>>> +int drm_gpuvm_exec_lock_array(struct drm_gpuvm_exec *vm_exec,
>>>> +                  struct drm_gem_object **objs,
>>>> +                  unsigned int num_objs,
>>>> +                  unsigned int num_fences,
>>>> +                  bool interruptible);
>>>> +
>>>> +int drm_gpuvm_exec_lock_range(struct drm_gpuvm_exec *vm_exec,
>>>> +                  u64 addr, u64 range,
>>>> +                  unsigned int num_fences,
>>>> +                  bool interruptible);
>>>> +
>>>> +/**
>>>> + * drm_gpuvm_lock() - lock all dma-resv of all assoiciated BOs
>>>> + * @gpuvm: the &drm_gpuvm
>>>> + *
>>>> + * Releases all dma-resv locks of all &drm_gem_objects
>>>> previously acquired
>>>> + * through drm_gpuvm_lock() or its variants.
>>>> + *
>>>> + * Returns: 0 on success, negative error code on failure.
>>>> + */
>>>> +static inline void
>>>> +drm_gpuvm_exec_unlock(struct drm_gpuvm_exec *vm_exec)
>>>> +{
>>>> +    drm_exec_fini(&vm_exec->exec);
>>>> +}
>>>> +
>>>> +int drm_gpuvm_validate(struct drm_gpuvm *gpuvm);
>>>> +void drm_gpuvm_resv_add_fence(struct drm_gpuvm *gpuvm,
>>>> +                  struct drm_exec *exec,
>>>> +                  struct dma_fence *fence,
>>>> +                  enum dma_resv_usage private_usage,
>>>> +                  enum dma_resv_usage extobj_usage);
>>>> +
>>>> +/**
>>>> + * drm_gpuvm_exec_resv_add_fence()
>>>> + * @vm_exec: the &drm_gpuvm_exec abstraction
>>>> + * @fence: fence to add
>>>> + * @private_usage: private dma-resv usage
>>>> + * @extobj_usage: extobj dma-resv usage
>>>> + *
>>>> + * See drm_gpuvm_resv_add_fence().
>>>> + */
>>>> +static inline void
>>>> +drm_gpuvm_exec_resv_add_fence(struct drm_gpuvm_exec *vm_exec,
>>>> +                  struct dma_fence *fence,
>>>> +                  enum dma_resv_usage private_usage,
>>>> +                  enum dma_resv_usage extobj_usage)
>>>> +{
>>>> +    drm_gpuvm_resv_add_fence(vm_exec->vm, &vm_exec->exec, fence,
>>>> +                 private_usage, extobj_usage);
>>>> +}
>>>> +
>>>>    /**
>>>>     * struct drm_gpuvm_bo - structure representing a &drm_gpuvm
>>>> and
>>>>     * &drm_gem_object combination
>>>> @@ -398,6 +569,18 @@ struct drm_gpuvm_bo {
>>>>                 * gpuva list.
>>>>                 */
>>>>                struct list_head gem;
>>>> +
>>>> +            /**
>>>> +             * @evict: List entry to attach to the &drm_gpuvms
>>>> +             * extobj list.
>>>> +             */
>>>> +            struct list_head extobj;
>>>> +
>>>> +            /**
>>>> +             * @evict: List entry to attach to the &drm_gpuvms
>>>> evict
>>>> +             * list.
>>>> +             */
>>>> +            struct list_head evict;
>>>>            } entry;
>>>>        } list;
>>>>    };
>>>> @@ -432,6 +615,9 @@ struct drm_gpuvm_bo *
>>>>    drm_gpuvm_bo_find(struct drm_gpuvm *gpuvm,
>>>>              struct drm_gem_object *obj);
>>>> +void drm_gpuvm_bo_evict(struct drm_gem_object *obj, bool evict);
>>>> +void drm_gpuvm_bo_extobj_add(struct drm_gpuvm_bo *vm_bo);
>>>> +
>>>>    /**
>>>>     * drm_gpuvm_bo_for_each_va() - iterator to walk over a list of
>>>> &drm_gpuva
>>>>     * @va__: &drm_gpuva structure to assign to in each iteration
>>>> step
>>>> @@ -837,6 +1023,17 @@ struct drm_gpuvm_ops {
>>>>         * used.
>>>>         */
>>>>        int (*sm_step_unmap)(struct drm_gpuva_op *op, void *priv);
>>>> +
>>>> +    /**
>>>> +     * @bo_validate: called from drm_gpuvm_validate()
>>>> +     *
>>>> +     * Drivers receive this callback for every evicted
>>>> &drm_gem_object being
>>>> +     * mapped in the corresponding &drm_gpuvm.
>>>> +     *
>>>> +     * Typically, drivers would call their driver specific
>>>> variant of
>>>> +     * ttm_bo_validate() from within this callback.
>>>> +     */
>>>> +    int (*bo_validate)(struct drm_gem_object *obj);
>>>
>>> Same here. Could we have a vm_bo as an argument instead, so that
>>> the callback knows what gpuvm we're targeting and can mark all its
>>> gpu_vas for revalidation? Or is that intended to be done elsewhere?
>>
>> Makes sense as well. I'll change that too.
> 
> I forgot, drm_gpuvm_validate() would preferably take an drm_gpuvm_exec
> argument because we need it in the validate callback. It's also easy
> for the driver to subclass further if needed, to pass even more
> arguments to its validate callback.

Hm.. that implies that a driver open coding the drm_exec loop, still needs
to use a struct drm_gpuvm_exec rather than just a struct drm_exec. What is
this needed for in Xe? Do we expect other drivers needing it? Might a priv
void pointer maybe make more sense?

> 
> /Thomas
> 
> 
>>
>>>
>>>>    };
>>>>    int drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm, void *priv,
>>>
>>> Thanks,
>>>
>>> Thomas
>>>
>>>
>>
> 

