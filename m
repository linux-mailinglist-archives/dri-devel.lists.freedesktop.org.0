Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 235E67A0ADE
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 18:37:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1D7710E173;
	Thu, 14 Sep 2023 16:37:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E8F410E173
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 16:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694709421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o5/7FW8+bpep4lR+GR+4sw7+o+hytEZYZa/XT16JWK0=;
 b=Dm9MiLHrH6b97wkIIhtBTOM9nBkRz9W7hhi3C6oEe7k9rQTAwVXjh/IV1gAO+nMQi1tYOw
 V8ZDTjFa6/0xkvw8h8KywZ6Dt3VtQkndCiTS1pN9vLNQNMsjSklWa+k/JgMVRA1R+SD57i
 DqfH25lTOeycAhXwpJ/q/c3gbKfPq28=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-669-EKUillZxPq-CfDHwugdl2A-1; Thu, 14 Sep 2023 12:36:55 -0400
X-MC-Unique: EKUillZxPq-CfDHwugdl2A-1
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-50091a3fd87so1367483e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 09:36:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694709413; x=1695314213;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o5/7FW8+bpep4lR+GR+4sw7+o+hytEZYZa/XT16JWK0=;
 b=ff7IWjitjYPjQHKjyDu64vWfvIATdoPvYRR+HbGC+a0c3yqfcruX7fPaccYHDB16aL
 +mcmn3IjoZorN3SIkiQhPmTVUIHaPEm+P1zmwk9Ha6sxO5N9qgjeIDEPmjh6gyc99Qqi
 nZFnNHpPno8jwVZJMPi9NtM4li34oRmEIZDs5Hyf8PUJ/va4kqNNCae3olDME3zHin1L
 woXkQBFK0fCxWbGG67U0tUbwMsVEwFvHWWzRwmAN4MC42i+rk7xDytQE/nDqK1NLIDVC
 qfJhG9abOq0ppeG6iDwZx2RX9Vd6+AnefTdXKlvAPjaiyPgCVhkSG+UQgE8KW1J9fBHR
 prRg==
X-Gm-Message-State: AOJu0Yx8O6777vFnGONUUcSPvC7iYL5U0nZIWsh+YG2PoTBgoChGDymP
 aA7UmPjORRh1wPjZjuiCpjpcnG5f4GSFHmhUS1s4xp1aZd+QqVljODt+GtSOW6hk7uIYOjIj159
 CskhW+n65c/c5Se6SNfkucpVSIJCN
X-Received: by 2002:ac2:52b1:0:b0:500:b74b:e53 with SMTP id
 r17-20020ac252b1000000b00500b74b0e53mr4823598lfm.46.1694709413615; 
 Thu, 14 Sep 2023 09:36:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVaI6opWgDsECNDnnBgI/exiVhz0yXejEnk7Rp0fMRo7GWclXor2y5jgxkilHEFPELP8iqRg==
X-Received: by 2002:ac2:52b1:0:b0:500:b74b:e53 with SMTP id
 r17-20020ac252b1000000b00500b74b0e53mr4823584lfm.46.1694709413215; 
 Thu, 14 Sep 2023 09:36:53 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 wj18-20020a170907051200b009adc5802d30sm336701ejb.21.2023.09.14.09.36.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Sep 2023 09:36:52 -0700 (PDT)
Message-ID: <c620c142-ea38-415d-729e-2561f1f4bae3@redhat.com>
Date: Thu, 14 Sep 2023 18:36:50 +0200
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
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <62d9b00a-547a-2106-5ec3-6f6a88023496@linux.intel.com>
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

On 9/14/23 15:48, Thomas Hellström wrote:
> Hi, Danilo
> 
> Some additional minor comments as xe conversion progresses.
> 
> On 9/9/23 17:31, Danilo Krummrich wrote:
>> So far the DRM GPUVA manager offers common infrastructure to track GPU VA
>> allocations and mappings, generically connect GPU VA mappings to their
>> backing buffers and perform more complex mapping operations on the GPU VA
>> space.
>>
>> However, there are more design patterns commonly used by drivers, which
>> can potentially be generalized in order to make the DRM GPUVA manager
>> represent a basic GPU-VM implementation. In this context, this patch aims
>> at generalizing the following elements.
>>
>> 1) Provide a common dma-resv for GEM objects not being used outside of
>>     this GPU-VM.
>>
>> 2) Provide tracking of external GEM objects (GEM objects which are
>>     shared with other GPU-VMs).
>>
>> 3) Provide functions to efficiently lock all GEM objects dma-resv the
>>     GPU-VM contains mappings of.
>>
>> 4) Provide tracking of evicted GEM objects the GPU-VM contains mappings
>>     of, such that validation of evicted GEM objects is accelerated.
>>
>> 5) Provide some convinience functions for common patterns.
>>
>> Rather than being designed as a "framework", the target is to make all
>> features appear as a collection of optional helper functions, such that
>> drivers are free to make use of the DRM GPUVA managers basic
>> functionality and opt-in for other features without setting any feature
>> flags, just by making use of the corresponding functions.
>>
>> Big kudos to Boris Brezillon for his help to figure out locking for drivers
>> updating the GPU VA space within the fence signalling path.
>>
>> Suggested-by: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
>> ---
>>
>> +/**
>> + * drm_gpuvm_bo_evict() - add / remove a &drm_gem_object to / from a
>> + * &drm_gpuvms evicted list
>> + * @obj: the &drm_gem_object to add or remove
>> + * @evict: indicates whether the object is evicted
>> + *
>> + * Adds a &drm_gem_object to or removes it from all &drm_gpuvms evicted
>> + * list containing a mapping of this &drm_gem_object.
>> + */
>> +void
>> +drm_gpuvm_bo_evict(struct drm_gem_object *obj, bool evict)
>> +{
>> +    struct drm_gpuvm_bo *vm_bo;
>> +
>> +    drm_gem_for_each_gpuvm_bo(vm_bo, obj) {
>> +        if (evict)
>> +            drm_gpuvm_bo_list_add(vm_bo, evict);
>> +        else
>> +            drm_gpuvm_bo_list_del(vm_bo, evict);
>> +    }
>> +}
>> +EXPORT_SYMBOL_GPL(drm_gpuvm_bo_evict);
>> +
> 
> We need a drm_gpuvm_bo_evict(struct drm_gpuvm_bo *vm_bo, ...) that puts a single gpuvm_bo on the list, the above function could perhaps be renamed as drm_gpuvm_gem_obj_evict(obj, ....).

Makes sense - gonna change that.

> 
> Reason is some vm's are faulting vms which don't have an evict list, but validate from the pagefault handler. Also evict == false is dangerous because if called from within an exec, it might remove the obj from other vm's evict list before they've had a chance to rebind their VMAs.
> 
>>   static int
>>   __drm_gpuva_insert(struct drm_gpuvm *gpuvm,
>>              struct drm_gpuva *va)
>> diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
>> index afa50b9059a2..834bb6d6617e 100644
>> --- a/include/drm/drm_gpuvm.h
>> +++ b/include/drm/drm_gpuvm.h
>> @@ -26,10 +26,12 @@
>>    */
>>   #include <linux/list.h>
>> +#include <linux/dma-resv.h>
>>   #include <linux/rbtree.h>
>>   #include <linux/types.h>
>>   #include <drm/drm_gem.h>
>> +#include <drm/drm_exec.h>
>>   struct drm_gpuvm;
>>   struct drm_gpuvm_bo;
>> @@ -259,6 +261,38 @@ struct drm_gpuvm {
>>        * space
>>        */
>>       struct dma_resv *resv;
>> +
>> +    /**
>> +     * @extobj: structure holding the extobj list
>> +     */
>> +    struct {
>> +        /**
>> +         * @list: &list_head storing &drm_gpuvm_bos serving as
>> +         * external object
>> +         */
>> +        struct list_head list;
>> +
>> +        /**
>> +         * @lock: spinlock to protect the extobj list
>> +         */
>> +        spinlock_t lock;
>> +    } extobj;
>> +
>> +    /**
>> +     * @evict: structure holding the evict list and evict list lock
>> +     */
>> +    struct {
>> +        /**
>> +         * @list: &list_head storing &drm_gpuvm_bos currently being
>> +         * evicted
>> +         */
>> +        struct list_head list;
>> +
>> +        /**
>> +         * @lock: spinlock to protect the evict list
>> +         */
>> +        spinlock_t lock;
>> +    } evict;
>>   };
>>   void drm_gpuvm_init(struct drm_gpuvm *gpuvm, struct drm_device *drm,
>> @@ -268,6 +302,21 @@ void drm_gpuvm_init(struct drm_gpuvm *gpuvm, struct drm_device *drm,
>>               const struct drm_gpuvm_ops *ops);
>>   void drm_gpuvm_destroy(struct drm_gpuvm *gpuvm);
>> +/**
>> + * drm_gpuvm_is_extobj() - indicates whether the given &drm_gem_object is an
>> + * external object
>> + * @gpuvm: the &drm_gpuvm to check
>> + * @obj: the &drm_gem_object to check
>> + *
>> + * Returns: true if the &drm_gem_object &dma_resv differs from the
>> + * &drm_gpuvms &dma_resv, false otherwise
>> + */
>> +static inline bool drm_gpuvm_is_extobj(struct drm_gpuvm *gpuvm,
>> +                       struct drm_gem_object *obj)
>> +{
>> +    return obj && obj->resv != gpuvm->resv;
>> +}
>> +
>>   static inline struct drm_gpuva *
>>   __drm_gpuva_next(struct drm_gpuva *va)
>>   {
>> @@ -346,6 +395,128 @@ __drm_gpuva_next(struct drm_gpuva *va)
>>   #define drm_gpuvm_for_each_va_safe(va__, next__, gpuvm__) \
>>       list_for_each_entry_safe(va__, next__, &(gpuvm__)->rb.list, rb.entry)
>> +/**
>> + * struct drm_gpuvm_exec - &drm_gpuvm abstraction of &drm_exec
>> + *
>> + * This structure should be created on the stack as &drm_exec should be.
>> + *
>> + * Optionally, @extra can be set in order to lock additional &drm_gem_objects.
>> + */
>> +struct drm_gpuvm_exec {
>> +    /**
>> +     * @exec: the &drm_exec structure
>> +     */
>> +    struct drm_exec exec;
>> +
>> +    /**
>> +     * @vm: the &drm_gpuvm to lock its DMA reservations
>> +     */
>> +    struct drm_gpuvm *vm;
>> +
>> +    /**
>> +     * @extra: Callback and corresponding private data for the driver to
>> +     * lock arbitrary additional &drm_gem_objects.
>> +     */
>> +    struct {
>> +        /**
>> +         * @fn: The driver callback to lock additional &drm_gem_objects.
>> +         */
>> +        int (*fn)(struct drm_gpuvm_exec *vm_exec,
>> +              unsigned int num_fences);
>> +
>> +        /**
>> +         * @priv: driver private data for the @fn callback
>> +         */
>> +        void *priv;
>> +    } extra;
>> +};
>> +
>> +/**
>> + * drm_gpuvm_prepare_vm() - prepare the GPUVMs common dma-resv
>> + * @gpuvm: the &drm_gpuvm
>> + * @exec: the &drm_exec context
>> + * @num_fences: the amount of &dma_fences to reserve
>> + *
>> + * Calls drm_exec_prepare_obj() for the GPUVMs dummy &drm_gem_object.
>> + *
>> + * Using this function directly, it is the drivers responsibility to call
>> + * drm_exec_init() and drm_exec_fini() accordingly.
>> + *
>> + * Returns: 0 on success, negative error code on failure.
>> + */
>> +static inline int
>> +drm_gpuvm_prepare_vm(struct drm_gpuvm *gpuvm,
>> +             struct drm_exec *exec,
>> +             unsigned int num_fences)
>> +{
>> +    return drm_exec_prepare_obj(exec, &gpuvm->d_obj, num_fences);
>> +}
>> +
>> +int drm_gpuvm_prepare_objects(struct drm_gpuvm *gpuvm,
>> +                  struct drm_exec *exec,
>> +                  unsigned int num_fences);
>> +
>> +int drm_gpuvm_prepare_range(struct drm_gpuvm *gpuvm,
>> +                struct drm_exec *exec,
>> +                u64 addr, u64 range,
>> +                unsigned int num_fences);
>> +
>> +int drm_gpuvm_exec_lock(struct drm_gpuvm_exec *vm_exec,
>> +            unsigned int num_fences,
>> +            bool interruptible);
>> +
>> +int drm_gpuvm_exec_lock_array(struct drm_gpuvm_exec *vm_exec,
>> +                  struct drm_gem_object **objs,
>> +                  unsigned int num_objs,
>> +                  unsigned int num_fences,
>> +                  bool interruptible);
>> +
>> +int drm_gpuvm_exec_lock_range(struct drm_gpuvm_exec *vm_exec,
>> +                  u64 addr, u64 range,
>> +                  unsigned int num_fences,
>> +                  bool interruptible);
>> +
>> +/**
>> + * drm_gpuvm_lock() - lock all dma-resv of all assoiciated BOs
>> + * @gpuvm: the &drm_gpuvm
>> + *
>> + * Releases all dma-resv locks of all &drm_gem_objects previously acquired
>> + * through drm_gpuvm_lock() or its variants.
>> + *
>> + * Returns: 0 on success, negative error code on failure.
>> + */
>> +static inline void
>> +drm_gpuvm_exec_unlock(struct drm_gpuvm_exec *vm_exec)
>> +{
>> +    drm_exec_fini(&vm_exec->exec);
>> +}
>> +
>> +int drm_gpuvm_validate(struct drm_gpuvm *gpuvm);
>> +void drm_gpuvm_resv_add_fence(struct drm_gpuvm *gpuvm,
>> +                  struct drm_exec *exec,
>> +                  struct dma_fence *fence,
>> +                  enum dma_resv_usage private_usage,
>> +                  enum dma_resv_usage extobj_usage);
>> +
>> +/**
>> + * drm_gpuvm_exec_resv_add_fence()
>> + * @vm_exec: the &drm_gpuvm_exec abstraction
>> + * @fence: fence to add
>> + * @private_usage: private dma-resv usage
>> + * @extobj_usage: extobj dma-resv usage
>> + *
>> + * See drm_gpuvm_resv_add_fence().
>> + */
>> +static inline void
>> +drm_gpuvm_exec_resv_add_fence(struct drm_gpuvm_exec *vm_exec,
>> +                  struct dma_fence *fence,
>> +                  enum dma_resv_usage private_usage,
>> +                  enum dma_resv_usage extobj_usage)
>> +{
>> +    drm_gpuvm_resv_add_fence(vm_exec->vm, &vm_exec->exec, fence,
>> +                 private_usage, extobj_usage);
>> +}
>> +
>>   /**
>>    * struct drm_gpuvm_bo - structure representing a &drm_gpuvm and
>>    * &drm_gem_object combination
>> @@ -398,6 +569,18 @@ struct drm_gpuvm_bo {
>>                * gpuva list.
>>                */
>>               struct list_head gem;
>> +
>> +            /**
>> +             * @evict: List entry to attach to the &drm_gpuvms
>> +             * extobj list.
>> +             */
>> +            struct list_head extobj;
>> +
>> +            /**
>> +             * @evict: List entry to attach to the &drm_gpuvms evict
>> +             * list.
>> +             */
>> +            struct list_head evict;
>>           } entry;
>>       } list;
>>   };
>> @@ -432,6 +615,9 @@ struct drm_gpuvm_bo *
>>   drm_gpuvm_bo_find(struct drm_gpuvm *gpuvm,
>>             struct drm_gem_object *obj);
>> +void drm_gpuvm_bo_evict(struct drm_gem_object *obj, bool evict);
>> +void drm_gpuvm_bo_extobj_add(struct drm_gpuvm_bo *vm_bo);
>> +
>>   /**
>>    * drm_gpuvm_bo_for_each_va() - iterator to walk over a list of &drm_gpuva
>>    * @va__: &drm_gpuva structure to assign to in each iteration step
>> @@ -837,6 +1023,17 @@ struct drm_gpuvm_ops {
>>        * used.
>>        */
>>       int (*sm_step_unmap)(struct drm_gpuva_op *op, void *priv);
>> +
>> +    /**
>> +     * @bo_validate: called from drm_gpuvm_validate()
>> +     *
>> +     * Drivers receive this callback for every evicted &drm_gem_object being
>> +     * mapped in the corresponding &drm_gpuvm.
>> +     *
>> +     * Typically, drivers would call their driver specific variant of
>> +     * ttm_bo_validate() from within this callback.
>> +     */
>> +    int (*bo_validate)(struct drm_gem_object *obj);
> 
> Same here. Could we have a vm_bo as an argument instead, so that the callback knows what gpuvm we're targeting and can mark all its gpu_vas for revalidation? Or is that intended to be done elsewhere?

Makes sense as well. I'll change that too.

> 
>>   };
>>   int drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm, void *priv,
> 
> Thanks,
> 
> Thomas
> 
> 

