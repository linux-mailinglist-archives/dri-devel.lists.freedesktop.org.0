Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 269457DD255
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 17:41:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A97F10E56F;
	Tue, 31 Oct 2023 16:41:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FF2610E500
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 16:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698770503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vlafNidClVfswdO3kgovYjfpEqyr8OoqFnuXlXC+U8k=;
 b=igolSUGMSemj3zmq9un5v/4SYH/iYOwvEhbcgORFCOUHhiqvqgMBVzM/xW+Ci0khu7bTFN
 Tcr1CvbS9w0ThFXz5elwbAt8lAj6RxV5N2dkTHRbjriJFhFldRcnzv5DwEYIu/NeSaVnfg
 MYUjeAY7dEC9D67f5+DZo1FxcSToNV0=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-27-oxKhpLVZObKmvkmn21LqZQ-1; Tue, 31 Oct 2023 12:41:41 -0400
X-MC-Unique: oxKhpLVZObKmvkmn21LqZQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-9ae686dafedso430635266b.3
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 09:41:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698770500; x=1699375300;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vlafNidClVfswdO3kgovYjfpEqyr8OoqFnuXlXC+U8k=;
 b=wmIYgYvOBYfHLGrmhS1/18Lnli65NFXblOROxfbu7egYNTblwfUfZoVTodU4HYpClt
 WQI7kUArByBJzbNE0TPZUjtT1YZzlPYpAFVGN7QnaUU6LPHqaU2LDUxVspw5g9Z9oOkF
 cVSt9mlqiG7yw3Qlltm6A411MTPLZ0D0xN6cXkJCH/k1HtZ4qHWYiaGY3MdosgN/gfsx
 tZGqf7TjC44YKgSynvCrzwqy85YbYUJe532PaidcFFHZHx5q5MWEkZojG6IY9RlMOlYn
 IjH3COkgRiBSK1tSiZy+YZMmtPZhDlZih4XEe2zij/Ngyc5VxNJFhPcJLmq4i/O1D0hr
 T8Gg==
X-Gm-Message-State: AOJu0Yzxy+bZU7IpUgeIHT03Vi3yc/AnnNraQ6OGcgwMVvxctwLxXgPR
 7mf7BgZ9bga03l7Jvw84PP+dusEDUeKbnGsLOh0AonjoRLaATB0l3y0XXr/M6Pl8FsyISCwQ69S
 fss3rAqQdgCxxnKMX9Yc/3kfdg7iv
X-Received: by 2002:a17:907:9629:b0:9c2:a072:78ca with SMTP id
 gb41-20020a170907962900b009c2a07278camr12820155ejc.28.1698770499907; 
 Tue, 31 Oct 2023 09:41:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMtjejIKizZZmtrs2b+YAHTS34Ft/myQ5UJUkp17xVQLLVKV8QSj3AWrKcMxiA0AYkqmE1Tg==
X-Received: by 2002:a17:907:9629:b0:9c2:a072:78ca with SMTP id
 gb41-20020a170907962900b009c2a07278camr12820137ejc.28.1698770499508; 
 Tue, 31 Oct 2023 09:41:39 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 o8-20020a17090637c800b00992b8d56f3asm1234714ejc.105.2023.10.31.09.41.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Oct 2023 09:41:39 -0700 (PDT)
Message-ID: <9db6a491-c49f-47a0-8936-9ad1cf4c29d6@redhat.com>
Date: Tue, 31 Oct 2023 17:41:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH drm-misc-next v7 5/7] drm/gpuvm: track/lock/validate
 external/evicted objects
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 airlied@gmail.com, daniel@ffwll.ch, matthew.brost@intel.com,
 sarah.walker@imgtec.com, donald.robson@imgtec.com,
 boris.brezillon@collabora.com, christian.koenig@amd.com, faith@gfxstrand.net
References: <20231023201659.25332-1-dakr@redhat.com>
 <20231023201659.25332-6-dakr@redhat.com>
 <d7a46efbf5fdcc62a96fb09579ff72c70e64d5fb.camel@linux.intel.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <d7a46efbf5fdcc62a96fb09579ff72c70e64d5fb.camel@linux.intel.com>
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

On 10/31/23 12:34, Thomas Hellström wrote:
> On Mon, 2023-10-23 at 22:16 +0200, Danilo Krummrich wrote:
>> Currently the DRM GPUVM offers common infrastructure to track GPU VA
>> allocations and mappings, generically connect GPU VA mappings to
>> their
>> backing buffers and perform more complex mapping operations on the
>> GPU VA
>> space.
>>
>> However, there are more design patterns commonly used by drivers,
>> which
>> can potentially be generalized in order to make the DRM GPUVM
>> represent
>> a basis for GPU-VM implementations. In this context, this patch aims
>> at generalizing the following elements.
>>
>> 1) Provide a common dma-resv for GEM objects not being used outside
>> of
>>     this GPU-VM.
>>
>> 2) Provide tracking of external GEM objects (GEM objects which are
>>     shared with other GPU-VMs).
>>
>> 3) Provide functions to efficiently lock all GEM objects dma-resv the
>>     GPU-VM contains mappings of.
>>
>> 4) Provide tracking of evicted GEM objects the GPU-VM contains
>> mappings
>>     of, such that validation of evicted GEM objects is accelerated.
>>
>> 5) Provide some convinience functions for common patterns.
>>
>> Big thanks to Boris Brezillon for his help to figure out locking for
>> drivers updating the GPU VA space within the fence signalling path.
>>
>> Suggested-by: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> 
> The checkpatch.pl warning still persists:
> WARNING: ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP
> #627: FILE: drivers/gpu/drm/drm_gpuvm.c:1347:
> +		return -ENOTSUPP;

Hm, I thought I changed this one. Seems like it slipped through. Gonna
fix that.

> 
>> ---
>>   drivers/gpu/drm/drm_gpuvm.c | 633
>> ++++++++++++++++++++++++++++++++++++
>>   include/drm/drm_gpuvm.h     | 250 ++++++++++++++
>>   2 files changed, 883 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_gpuvm.c
>> b/drivers/gpu/drm/drm_gpuvm.c
>> index 7f4f5919f84c..01cbeb98755a 100644
>> --- a/drivers/gpu/drm/drm_gpuvm.c
>> +++ b/drivers/gpu/drm/drm_gpuvm.c
>> @@ -82,6 +82,21 @@
>>    * &drm_gem_object list of &drm_gpuvm_bos for an existing instance
>> of this
>>    * particular combination. If not existent a new instance is created
>> and linked
>>    * to the &drm_gem_object.
>> + *
>> + * &drm_gpuvm_bo structures, since unique for a given &drm_gpuvm,
>> are also used
>> + * as entry for the &drm_gpuvm's lists of external and evicted
>> objects. Those
>> + * lists are maintained in order to accelerate locking of dma-resv
>> locks and
>> + * validation of evicted objects bound in a &drm_gpuvm. For
>> instance, all
>> + * &drm_gem_object's &dma_resv of a given &drm_gpuvm can be locked
>> by calling
>> + * drm_gpuvm_exec_lock(). Once locked drivers can call
>> drm_gpuvm_validate() in
>> + * order to validate all evicted &drm_gem_objects. It is also
>> possible to lock
>> + * additional &drm_gem_objects by providing the corresponding
>> parameters to
>> + * drm_gpuvm_exec_lock() as well as open code the &drm_exec loop
>> while making
>> + * use of helper functions such as drm_gpuvm_prepare_range() or
>> + * drm_gpuvm_prepare_objects().
>> + *
>> + * Every bound &drm_gem_object is treated as external object when
>> its &dma_resv
>> + * structure is different than the &drm_gpuvm's common &dma_resv
>> structure.
>>    */
>>   
>>   /**
>> @@ -429,6 +444,20 @@
>>    * Subsequent calls to drm_gpuvm_bo_obtain() for the same &drm_gpuvm
>> and
>>    * &drm_gem_object must be able to observe previous creations and
>> destructions
>>    * of &drm_gpuvm_bos in order to keep instances unique.
>> + *
>> + * The &drm_gpuvm's lists for keeping track of external and evicted
>> objects are
>> + * protected against concurrent insertion / removal and iteration
>> internally.
>> + *
>> + * However, drivers still need ensure to protect concurrent calls to
>> functions
>> + * iterating those lists, namely drm_gpuvm_prepare_objects() and
>> + * drm_gpuvm_validate().
>> + *
>> + * Alternatively, drivers can set the &DRM_GPUVM_RESV_PROTECTED flag
>> to indicate
>> + * that the corresponding &dma_resv locks are held in order to
>> protect the
>> + * lists. If &DRM_GPUVM_RESV_PROTECTED is set, internal locking is
>> disabled and
>> + * the corresponding lockdep checks are enabled. This is an
>> optimization for
>> + * drivers which are capable of taking the corresponding &dma_resv
>> locks and
>> + * hence do not require internal locking.
>>    */
>>   
>>   /**
>> @@ -641,6 +670,201 @@
>>    *     }
>>    */
>>   
>> +/**
>> + * get_next_vm_bo_from_list() - get the next vm_bo element
>> + * @__gpuvm: the &drm_gpuvm
>> + * @__list_name: the name of the list we're iterating on
>> + * @__local_list: a pointer to the local list used to store already
>> iterated items
>> + * @__prev_vm_bo: the previous element we got from
>> get_next_vm_bo_from_list()
>> + *
>> + * This helper is here to provide lockless list iteration. Lockless
>> as in, the
>> + * iterator releases the lock immediately after picking the first
>> element from
>> + * the list, so list insertion deletion can happen concurrently.
>> + *
>> + * Elements popped from the original list are kept in a local list,
>> so removal
>> + * and is_empty checks can still happen while we're iterating the
>> list.
>> + */
>> +#define get_next_vm_bo_from_list(__gpuvm, __list_name, __local_list,
>> __prev_vm_bo)     \
>> +       ({
>>                     \
>> +               struct drm_gpuvm_bo *__vm_bo =
>> NULL;                                    \
>> +
>>                     \
>> +               drm_gpuvm_bo_put(__prev_vm_bo);
>>                     \
>> +
>>                     \
>> +               spin_lock(&(__gpuvm)-
>>> __list_name.lock);                                \
>> +               if (!(__gpuvm)-
>>> __list_name.local_list)                                 \
>> +                       (__gpuvm)->__list_name.local_list =
>> __local_list;               \
>> +               else
>>                     \
>> +                       drm_WARN_ON((__gpuvm)-
>>> drm,                                     \
>> +                                   (__gpuvm)->__list_name.local_list
>> != __local_list); \
>> +
>>                     \
>> +               while (!list_empty(&(__gpuvm)->__list_name.list))
>> {                     \
>> +                       __vm_bo = list_first_entry(&(__gpuvm)-
>>> __list_name.list,        \
>> +                                                  struct
>> drm_gpuvm_bo,                 \
>> +
>> list.entry.__list_name);             \
>> +                       if (kref_get_unless_zero(&__vm_bo->kref))
>> {                     \
>> +                               list_move_tail(&(__vm_bo)-
>>> list.entry.__list_name,      \
>> +
>> __local_list);                           \
>> +                               break;
>>                     \
>> +                       } else
>> {                                                        \
>> +                               list_del_init(&(__vm_bo)-
>>> list.entry.__list_name);      \
>> +                               __vm_bo =
>> NULL;                                         \
>> +                       }
>>                     \
>> +               }
>>                     \
>> +               spin_unlock(&(__gpuvm)-
>>> __list_name.lock);                              \
>> +
>>                     \
>> +               __vm_bo;
>>                     \
>> +       })
>> +
>> +/**
>> + * for_each_vm_bo_in_list() - internal vm_bo list iterator
>> + * @__gpuvm: the &drm_gpuvm
>> + * @__list_name: the name of the list we're iterating on
>> + * @__local_list: a pointer to the local list used to store already
>> iterated items
>> + * @__vm_bo: the struct drm_gpuvm_bo to assign in each iteration
>> step
>> + *
>> + * This helper is here to provide lockless list iteration. Lockless
>> as in, the
>> + * iterator releases the lock immediately after picking the first
>> element from the
>> + * list, hence list insertion and deletion can happen concurrently.
>> + *
>> + * It is not allowed to re-assign the vm_bo pointer from inside this
>> loop.
>> + *
>> + * Typical use:
>> + *
>> + *     struct drm_gpuvm_bo *vm_bo;
>> + *     LIST_HEAD(my_local_list);
>> + *
>> + *     ret = 0;
>> + *     for_each_vm_bo_in_list(gpuvm, <list_name>, &my_local_list,
>> vm_bo) {
>> + *             ret = do_something_with_vm_bo(..., vm_bo);
>> + *             if (ret)
>> + *                     break;
>> + *     }
>> + *     // Drop ref in case we break out of the loop.
>> + *     drm_gpuvm_bo_put(vm_bo);
>> + *     restore_vm_bo_list(gpuvm, <list_name>, &my_local_list);
>> + *
>> + *
>> + * Only used for internal list iterations, not meant to be exposed
>> to the outside
>> + * world.
>> + */
>> +#define for_each_vm_bo_in_list(__gpuvm, __list_name, __local_list,
>> __vm_bo)    \
>> +       for (__vm_bo = get_next_vm_bo_from_list(__gpuvm,
>> __list_name,           \
>> +                                               __local_list,
>> NULL);            \
>> +
>> __vm_bo;                                                           \
>> +            __vm_bo = get_next_vm_bo_from_list(__gpuvm,
>> __list_name,           \
>> +                                               __local_list,
>> __vm_bo))
>> +
>> +static void
>> +__restore_vm_bo_list(struct drm_gpuvm *gpuvm, spinlock_t *lock,
>> +                    struct list_head *list, struct list_head
>> **local_list)
>> +{
>> +       /* Merge back the two lists, moving local list elements to
>> the
>> +        * head to preserve previous ordering, in case it matters.
>> +        */
>> +       spin_lock(lock);
>> +       if (*local_list) {
>> +               list_splice(*local_list, list);
>> +               *local_list = NULL;
>> +       }
>> +       spin_unlock(lock);
>> +}
>> +
>> +/**
>> + * restore_vm_bo_list() - move vm_bo elements back to their original
>> list
>> + * @__gpuvm: the &drm_gpuvm
>> + * @__list_name: the name of the list we're iterating on
>> + *
>> + * When we're done iterating a vm_bo list, we should call
>> restore_vm_bo_list()
>> + * to restore the original state and let new iterations take place.
>> + */
>> +#define restore_vm_bo_list(__gpuvm,
>> __list_name)                       \
>> +       __restore_vm_bo_list((__gpuvm), &(__gpuvm)-
>>> __list_name.lock,   \
>> +                            &(__gpuvm)-
>>> __list_name.list,              \
>> +                            &(__gpuvm)->__list_name.local_list)
>> +
>> +static void
>> +cond_spin_lock(spinlock_t *lock, bool cond)
>> +{
>> +       if (cond)
>> +               spin_lock(lock);
>> +}
>> +
>> +static void
>> +cond_spin_unlock(spinlock_t *lock, bool cond)
>> +{
>> +       if (cond)
>> +               spin_unlock(lock);
>> +}
>> +
>> +static void
>> +__drm_gpuvm_bo_list_add(struct drm_gpuvm *gpuvm, spinlock_t *lock,
>> +                       struct list_head *entry, struct list_head
>> *list)
>> +{
>> +       cond_spin_lock(lock, !!lock);
>> +       if (list_empty(entry))
>> +               list_add_tail(entry, list);
>> +       cond_spin_unlock(lock, !!lock);
>> +}
>> +
>> +/**
>> + * drm_gpuvm_bo_list_add() - insert a vm_bo into the given list
>> + * @__vm_bo: the &drm_gpuvm_bo
>> + * @__list_name: the name of the list to insert into
>> + * @__lock: whether to lock with the internal spinlock
>> + *
>> + * Inserts the given @__vm_bo into the list specified by
>> @__list_name.
>> + */
>> +#define drm_gpuvm_bo_list_add(__vm_bo, __list_name,
>> __lock)                    \
>> +       __drm_gpuvm_bo_list_add((__vm_bo)-
>>> vm,                                  \
>> +                               __lock ? &(__vm_bo)->vm-
>>> __list_name.lock :     \
>> +
>> NULL,                                  \
>> +                               &(__vm_bo)-
>>> list.entry.__list_name,             \
>> +                               &(__vm_bo)->vm->__list_name.list)
>> +
>> +static void
>> +__drm_gpuvm_bo_list_del(struct drm_gpuvm *gpuvm, spinlock_t *lock,
>> +                       struct list_head *entry, bool init)
>> +{
>> +       cond_spin_lock(lock, !!lock);
>> +       if (init) {
>> +               if (!list_empty(entry))
>> +                       list_del_init(entry);
>> +       } else {
>> +               list_del(entry);
>> +       }
>> +       cond_spin_unlock(lock, !!lock);
>> +}
>> +
>> +/**
>> + * drm_gpuvm_bo_list_del_init() - remove a vm_bo from the given list
>> + * @__vm_bo: the &drm_gpuvm_bo
>> + * @__list_name: the name of the list to insert into
>> + * @__lock: whether to lock with the internal spinlock
>> + *
>> + * Removes the given @__vm_bo from the list specified by
>> @__list_name.
>> + */
>> +#define drm_gpuvm_bo_list_del_init(__vm_bo, __list_name,
>> __lock)               \
>> +       __drm_gpuvm_bo_list_del((__vm_bo)-
>>> vm,                                  \
>> +                               __lock ? &(__vm_bo)->vm-
>>> __list_name.lock :     \
>> +
>> NULL,                                  \
>> +                               &(__vm_bo)-
>>> list.entry.__list_name,             \
>> +                               true)
>> +
>> +/**
>> + * drm_gpuvm_bo_list_del() - remove a vm_bo from the given list
>> + * @__vm_bo: the &drm_gpuvm_bo
>> + * @__list_name: the name of the list to insert into
>> + * @__lock: whether to lock with the internal spinlock
>> + *
>> + * Removes the given @__vm_bo from the list specified by
>> @__list_name.
>> + */
>> +#define drm_gpuvm_bo_list_del(__vm_bo, __list_name,
>> __lock)                    \
>> +       __drm_gpuvm_bo_list_del((__vm_bo)-
>>> vm,                                  \
>> +                               __lock ? &(__vm_bo)->vm-
>>> __list_name.lock :     \
>> +
>> NULL,                                  \
>> +                               &(__vm_bo)-
>>> list.entry.__list_name,             \
>> +                               false)
>> +
>>   #define to_drm_gpuva(__node)   container_of((__node), struct
>> drm_gpuva, rb.node)
>>   
>>   #define GPUVA_START(node) ((node)->va.addr)
>> @@ -763,6 +987,12 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm, const
>> char *name,
>>          gpuvm->rb.tree = RB_ROOT_CACHED;
>>          INIT_LIST_HEAD(&gpuvm->rb.list);
>>   
>> +       INIT_LIST_HEAD(&gpuvm->extobj.list);
>> +       spin_lock_init(&gpuvm->extobj.lock);
>> +
>> +       INIT_LIST_HEAD(&gpuvm->evict.list);
>> +       spin_lock_init(&gpuvm->evict.lock);
>> +
>>          gpuvm->name = name ? name : "unknown";
>>          gpuvm->flags = flags;
>>          gpuvm->ops = ops;
>> @@ -805,10 +1035,352 @@ drm_gpuvm_destroy(struct drm_gpuvm *gpuvm)
>>          drm_WARN(gpuvm->drm, !RB_EMPTY_ROOT(&gpuvm->rb.tree.rb_root),
>>                   "GPUVA tree is not empty, potentially leaking
>> memory.\n");
>>   
>> +       drm_WARN(gpuvm->drm, !list_empty(&gpuvm->extobj.list),
>> +                "Extobj list should be empty.\n");
>> +       drm_WARN(gpuvm->drm, !list_empty(&gpuvm->evict.list),
>> +                "Evict list should be empty.\n");
>> +
>>          drm_gem_object_put(gpuvm->r_obj);
>>   }
>>   EXPORT_SYMBOL_GPL(drm_gpuvm_destroy);
>>   
>> +static int
>> +__drm_gpuvm_prepare_objects(struct drm_gpuvm *gpuvm,
>> +                           struct drm_exec *exec,
>> +                           unsigned int num_fences)
>> +{
>> +       struct drm_gpuvm_bo *vm_bo;
>> +       LIST_HEAD(extobjs);
>> +       int ret = 0;
>> +
>> +       for_each_vm_bo_in_list(gpuvm, extobj, &extobjs, vm_bo) {
>> +               ret = drm_exec_prepare_obj(exec, vm_bo->obj,
>> num_fences);
>> +               if (ret)
>> +                       break;
>> +       }
>> +       /* Drop ref in case we break out of the loop. */
>> +       drm_gpuvm_bo_put(vm_bo);
>> +       restore_vm_bo_list(gpuvm, extobj);
>> +
>> +       return ret;
>> +}
>> +
>> +static int
>> +drm_gpuvm_prepare_objects_locked(struct drm_gpuvm *gpuvm,
>> +                                struct drm_exec *exec,
>> +                                unsigned int num_fences)
>> +{
>> +       struct drm_gpuvm_bo *vm_bo;
>> +       int ret = 0;
>> +
>> +       drm_gpuvm_resv_assert_held(gpuvm);
>> +       list_for_each_entry(vm_bo, &gpuvm->extobj.list,
>> list.entry.extobj) {
>> +               ret = drm_exec_prepare_obj(exec, vm_bo->obj,
>> num_fences);
>> +               if (ret)
>> +                       break;
>> +
>> +               if (vm_bo->evicted)
>> +                       drm_gpuvm_bo_list_add(vm_bo, evict, false);
>> +       }
>> +
>> +       return ret;
>> +}
>> +
>> +/**
>> + * drm_gpuvm_prepare_objects() - prepare all assoiciated BOs
>> + * @gpuvm: the &drm_gpuvm
>> + * @exec: the &drm_exec locking context
>> + * @num_fences: the amount of &dma_fences to reserve
>> + *
>> + * Calls drm_exec_prepare_obj() for all &drm_gem_objects the given
>> + * &drm_gpuvm contains mappings of.
>> + *
>> + * Using this function directly, it is the drivers responsibility to
>> call
>> + * drm_exec_init() and drm_exec_fini() accordingly.
>> + *
>> + * Note: This function is safe against concurrent insertion and
>> removal of
>> + * external objects, however it is not safe against concurrent usage
>> itself.
>> + *
>> + * Drivers need to make sure to protect this case with either an
>> outer VM lock
>> + * or by calling drm_gpuvm_prepare_vm() before this function within
>> the
>> + * drm_exec_until_all_locked() loop, such that the GPUVM's dma-resv
>> lock ensures
>> + * mutual exclusion.
>> + *
>> + * Returns: 0 on success, negative error code on failure.
> 
> s/Returns:/Return:/g
> 
> Otherwise LGTM.

Sounds like you want to offer your RB? :)

> 
> /Thomas
> 
> 

