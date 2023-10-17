Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5CC7CC134
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 12:55:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19FE210E2C8;
	Tue, 17 Oct 2023 10:54:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 549F510E2C3;
 Tue, 17 Oct 2023 10:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697540094; x=1729076094;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=2/L35Rj+a2kKHtCgFrCrqKxLaJa6IIKGzSzKOeTZ19k=;
 b=KCl7OQsmSRLP9l+JWEcHnwYU28tHQlotBmkPxvqqyHrYffm08s29bYYO
 fSCh8+8rW43luIP8uoa3deOetz6PD2KfjcA26p3IBD0KVNjtkhUQHwal6
 frLJFHjNy/z33mO8BPkDEXhpvC7yajfA0mfM1BIAyP1w7hVU7t3Oz0fiN
 fiuG9pOPEH8shXQAWV8aB0gQACdGK2U7o8KjR/roU6Z0S2064ABEYBkpL
 iuzOAspL1L5izhwQEKLdS3tcgh6UOUpSviMBeMf53gsk2WMCSEzyqt83y
 NBhLtI3jYjVdd9P9Vx4v/FOj4RJ5TBBPXyUlUF+iFUHjaWiw/8aq5jC5k Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="382976385"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; d="scan'208";a="382976385"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 03:54:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="1087466832"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; d="scan'208";a="1087466832"
Received: from fhoeg-mobl1.ger.corp.intel.com (HELO [10.249.254.103])
 ([10.249.254.103])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 03:54:49 -0700
Message-ID: <f8d02597-3ade-9354-7125-51ff11957230@linux.intel.com>
Date: Tue, 17 Oct 2023 12:54:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH drm-misc-next v6 3/6] drm/gpuvm: add an abstraction for a
 VM / BO combination
Content-Language: en-US
To: Danilo Krummrich <dakr@redhat.com>
References: <20231008233212.13815-1-dakr@redhat.com>
 <20231008233212.13815-4-dakr@redhat.com>
 <7b16e8af088e875674cc10a74cfdf6bed830db04.camel@linux.intel.com>
 <ZS5atchTplovZip2@polis>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <ZS5atchTplovZip2@polis>
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
 dri-devel@lists.freedesktop.org, faith@gfxstrand.net,
 boris.brezillon@collabora.com, donald.robson@imgtec.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 10/17/23 11:58, Danilo Krummrich wrote:
> On Fri, Oct 13, 2023 at 02:30:29PM +0200, Thomas Hellström wrote:
>> On Mon, 2023-10-09 at 01:32 +0200, Danilo Krummrich wrote:
>>> Add an abstraction layer between the drm_gpuva mappings of a
>>> particular
>>> drm_gem_object and this GEM object itself. The abstraction represents
>>> a
>>> combination of a drm_gem_object and drm_gpuvm. The drm_gem_object
>>> holds
>>> a list of drm_gpuvm_bo structures (the structure representing this
>>> abstraction), while each drm_gpuvm_bo contains list of mappings of
>>> this
>>> GEM object.
>>>
>>> This has multiple advantages:
>>>
>>> 1) We can use the drm_gpuvm_bo structure to attach it to various
>>> lists
>>>     of the drm_gpuvm. This is useful for tracking external and evicted
>>>     objects per VM, which is introduced in subsequent patches.
>>>
>>> 2) Finding mappings of a certain drm_gem_object mapped in a certain
>>>     drm_gpuvm becomes much cheaper.
>>>
>>> 3) Drivers can derive and extend the structure to easily represent
>>>     driver specific states of a BO for a certain GPUVM.
>>>
>>> The idea of this abstraction was taken from amdgpu, hence the credit
>>> for
>>> this idea goes to the developers of amdgpu.
>>>
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
>>> ---
>>>   drivers/gpu/drm/drm_gpuvm.c            | 332 +++++++++++++++++++++--
>>> --
>>>   drivers/gpu/drm/nouveau/nouveau_uvmm.c |  64 +++--
>>>   include/drm/drm_gem.h                  |  32 +--
>>>   include/drm/drm_gpuvm.h                | 177 ++++++++++++-
>>>   4 files changed, 521 insertions(+), 84 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_gpuvm.c
>>> b/drivers/gpu/drm/drm_gpuvm.c
>>> index 6368dfdbe9dd..28282283ddaf 100644
>>> --- a/drivers/gpu/drm/drm_gpuvm.c
>>> +++ b/drivers/gpu/drm/drm_gpuvm.c
>>> @@ -70,6 +70,18 @@
>>>    * &drm_gem_object, such as the &drm_gem_object containing the root
>>> page table,
>>>    * but it can also be a 'dummy' object, which can be allocated with
>>>    * drm_gpuvm_root_object_alloc().
>>> + *
>>> + * In order to connect a struct drm_gpuva its backing
>>> &drm_gem_object each
>> NIT: Same as previous patch regarding kerneldoc references
> I was intentionally using generic references here to make the documentation
> more readable while still keeping references to be able to look up the
> structure's fields.
>
>>> + * &drm_gem_object maintains a list of &drm_gpuvm_bo structures, and
>>> each
>>> + * &drm_gpuvm_bo contains a list of &&drm_gpuva structures.
>>> + *
>>> + * A &drm_gpuvm_bo is an abstraction that represents a combination
>>> of a
>>> + * &drm_gpuvm and a &drm_gem_object. Every such combination should
>>> be unique.
>>> + * This is ensured by the API through drm_gpuvm_bo_obtain() and
>>> + * drm_gpuvm_bo_obtain_prealloc() which first look into the
>>> corresponding
>>> + * &drm_gem_object list of &drm_gpuvm_bos for an existing instance
>>> of this
>>> + * particular combination. If not existent a new instance is created
>>> and linked
>>> + * to the &drm_gem_object.
>>>    */
>>>   
>>>   /**
>>> @@ -395,21 +407,28 @@
>>>   /**
>>>    * DOC: Locking
>>>    *
>>> - * Generally, the GPU VA manager does not take care of locking
>>> itself, it is
>>> - * the drivers responsibility to take care about locking. Drivers
>>> might want to
>>> - * protect the following operations: inserting, removing and
>>> iterating
>>> - * &drm_gpuva objects as well as generating all kinds of operations,
>>> such as
>>> - * split / merge or prefetch.
>>> - *
>>> - * The GPU VA manager also does not take care of the locking of the
>>> backing
>>> - * &drm_gem_object buffers GPU VA lists by itself; drivers are
>>> responsible to
>>> - * enforce mutual exclusion using either the GEMs dma_resv lock or
>>> alternatively
>>> - * a driver specific external lock. For the latter see also
>>> - * drm_gem_gpuva_set_lock().
>>> - *
>>> - * However, the GPU VA manager contains lockdep checks to ensure
>>> callers of its
>>> - * API hold the corresponding lock whenever the &drm_gem_objects GPU
>>> VA list is
>>> - * accessed by functions such as drm_gpuva_link() or
>>> drm_gpuva_unlink().
>>> + * In terms of managing &drm_gpuva entries DRM GPUVM does not take
>>> care of
>>> + * locking itself, it is the drivers responsibility to take care
>>> about locking.
>>> + * Drivers might want to protect the following operations:
>>> inserting, removing
>>> + * and iterating &drm_gpuva objects as well as generating all kinds
>>> of
>>> + * operations, such as split / merge or prefetch.
>>> + *
>>> + * DRM GPUVM also does not take care of the locking of the backing
>>> + * &drm_gem_object buffers GPU VA lists and &drm_gpuvm_bo
>>> abstractions by
>>> + * itself; drivers are responsible to enforce mutual exclusion using
>>> either the
>>> + * GEMs dma_resv lock or alternatively a driver specific external
>>> lock. For the
>>> + * latter see also drm_gem_gpuva_set_lock().
>>> + *
>>> + * However, DRM GPUVM contains lockdep checks to ensure callers of
>>> its API hold
>>> + * the corresponding lock whenever the &drm_gem_objects GPU VA list
>>> is accessed
>>> + * by functions such as drm_gpuva_link() or drm_gpuva_unlink(), but
>>> also
>>> + * drm_gpuvm_bo_obtain() and drm_gpuvm_bo_put().
>>> + *
>>> + * The latter is required since on creation and destruction of a
>>> &drm_gpuvm_bo
>>> + * the &drm_gpuvm_bo is attached / removed from the &drm_gem_objects
>>> gpuva list.
>>> + * Subsequent calls to drm_gpuvm_bo_obtain() for the same &drm_gpuvm
>>> and
>>> + * &drm_gem_object must be able to observe previous creations and
>>> destructions
>>> + * of &drm_gpuvm_bos in order to keep instances unique.
>>>    */
>>>   
>>>   /**
>>> @@ -439,6 +458,7 @@
>>>    *     {
>>>    *             struct drm_gpuva_ops *ops;
>>>    *             struct drm_gpuva_op *op
>>> + *             struct drm_gpuvm_bo *vm_bo;
>>>    *
>>>    *             driver_lock_va_space();
>>>    *             ops = drm_gpuvm_sm_map_ops_create(gpuvm, addr, range,
>>> @@ -446,6 +466,10 @@
>>>    *             if (IS_ERR(ops))
>>>    *                     return PTR_ERR(ops);
>>>    *
>>> + *             vm_bo = drm_gpuvm_bo_obtain(gpuvm, obj);
>>> + *             if (IS_ERR(vm_bo))
>>> + *                     return PTR_ERR(vm_bo);
>>> + *
>>>    *             drm_gpuva_for_each_op(op, ops) {
>>>    *                     struct drm_gpuva *va;
>>>    *
>>> @@ -458,7 +482,7 @@
>>>    *
>>>    *                             driver_vm_map();
>>>    *                             drm_gpuva_map(gpuvm, va, &op->map);
>>> - *                             drm_gpuva_link(va);
>>> + *                             drm_gpuva_link(va, vm_bo);
>>>    *
>>>    *                             break;
>>>    *                     case DRM_GPUVA_OP_REMAP: {
>>> @@ -485,11 +509,11 @@
>>>    *                             driver_vm_remap();
>>>    *                             drm_gpuva_remap(prev, next, &op-
>>>> remap);
>>>    *
>>> - *                             drm_gpuva_unlink(va);
>>>    *                             if (prev)
>>> - *                                     drm_gpuva_link(prev);
>>> + *                                     drm_gpuva_link(prev, va-
>>>> vm_bo);
>>>    *                             if (next)
>>> - *                                     drm_gpuva_link(next);
>>> + *                                     drm_gpuva_link(next, va-
>>>> vm_bo);
>>> + *                             drm_gpuva_unlink(va);
>>>    *
>>>    *                             break;
>>>    *                     }
>>> @@ -505,6 +529,7 @@
>>>    *                             break;
>>>    *                     }
>>>    *             }
>>> + *             drm_gpuvm_bo_put(vm_bo);
>>>    *             driver_unlock_va_space();
>>>    *
>>>    *             return 0;
>>> @@ -514,6 +539,7 @@
>>>    *
>>>    *     struct driver_context {
>>>    *             struct drm_gpuvm *gpuvm;
>>> + *             struct drm_gpuvm_bo *vm_bo;
>>>    *             struct drm_gpuva *new_va;
>>>    *             struct drm_gpuva *prev_va;
>>>    *             struct drm_gpuva *next_va;
>>> @@ -534,6 +560,7 @@
>>>    *                               struct drm_gem_object *obj, u64
>>> offset)
>>>    *     {
>>>    *             struct driver_context ctx;
>>> + *             struct drm_gpuvm_bo *vm_bo;
>>>    *             struct drm_gpuva_ops *ops;
>>>    *             struct drm_gpuva_op *op;
>>>    *             int ret = 0;
>>> @@ -543,16 +570,23 @@
>>>    *             ctx.new_va = kzalloc(sizeof(*ctx.new_va),
>>> GFP_KERNEL);
>>>    *             ctx.prev_va = kzalloc(sizeof(*ctx.prev_va),
>>> GFP_KERNEL);
>>>    *             ctx.next_va = kzalloc(sizeof(*ctx.next_va),
>>> GFP_KERNEL);
>>> - *             if (!ctx.new_va || !ctx.prev_va || !ctx.next_va) {
>>> + *             ctx.vm_bo = drm_gpuvm_bo_create(gpuvm, obj);
>>> + *             if (!ctx.new_va || !ctx.prev_va || !ctx.next_va ||
>>> !vm_bo) {
>>>    *                     ret = -ENOMEM;
>>>    *                     goto out;
>>>    *             }
>>>    *
>>> + *             // Typically protected with a driver specific GEM
>>> gpuva lock
>>> + *             // used in the fence signaling path for
>>> drm_gpuva_link() and
>>> + *             // drm_gpuva_unlink(), hence pre-allocate.
>>> + *             ctx.vm_bo = drm_gpuvm_bo_obtain_prealloc(ctx.vm_bo);
>>> + *
>>>    *             driver_lock_va_space();
>>>    *             ret = drm_gpuvm_sm_map(gpuvm, &ctx, addr, range, obj,
>>> offset);
>>>    *             driver_unlock_va_space();
>>>    *
>>>    *     out:
>>> + *             drm_gpuvm_bo_put(ctx.vm_bo);
>>>    *             kfree(ctx.new_va);
>>>    *             kfree(ctx.prev_va);
>>>    *             kfree(ctx.next_va);
>>> @@ -565,7 +599,7 @@
>>>    *
>>>    *             drm_gpuva_map(ctx->vm, ctx->new_va, &op->map);
>>>    *
>>> - *             drm_gpuva_link(ctx->new_va);
>>> + *             drm_gpuva_link(ctx->new_va, ctx->vm_bo);
>>>    *
>>>    *             // prevent the new GPUVA from being freed in
>>>    *             // driver_mapping_create()
>>> @@ -577,22 +611,23 @@
>>>    *     int driver_gpuva_remap(struct drm_gpuva_op *op, void *__ctx)
>>>    *     {
>>>    *             struct driver_context *ctx = __ctx;
>>> + *             struct drm_gpuva *va = op->remap.unmap->va;
>>>    *
>>>    *             drm_gpuva_remap(ctx->prev_va, ctx->next_va, &op-
>>>> remap);
>>>    *
>>> - *             drm_gpuva_unlink(op->remap.unmap->va);
>>> - *             kfree(op->remap.unmap->va);
>>> - *
>>>    *             if (op->remap.prev) {
>>> - *                     drm_gpuva_link(ctx->prev_va);
>>> + *                     drm_gpuva_link(ctx->prev_va, va->vm_bo);
>>>    *                     ctx->prev_va = NULL;
>>>    *             }
>>>    *
>>>    *             if (op->remap.next) {
>>> - *                     drm_gpuva_link(ctx->next_va);
>>> + *                     drm_gpuva_link(ctx->next_va, va->vm_bo);
>>>    *                     ctx->next_va = NULL;
>>>    *             }
>>>    *
>>> + *             drm_gpuva_unlink(va);
>>> + *             kfree(va);
>>> + *
>>>    *             return 0;
>>>    *     }
>>>    *
>>> @@ -771,6 +806,194 @@ drm_gpuvm_destroy(struct drm_gpuvm *gpuvm)
>>>   }
>>>   EXPORT_SYMBOL_GPL(drm_gpuvm_destroy);
>>>   
>>> +/**
>>> + * drm_gpuvm_bo_create() - create a new instance of struct
>>> drm_gpuvm_bo
>>> + * @gpuvm: The &drm_gpuvm the @obj is mapped in.
>>> + * @obj: The &drm_gem_object being mapped in the @gpuvm.
>>> + *
>>> + * If provided by the driver, this function uses the &drm_gpuvm_ops
>>> + * vm_bo_alloc() callback to allocate.
>>> + *
>>> + * Returns: a pointer to the &drm_gpuvm_bo on success, NULL on
>> Kerneldoc uses "Return:" rather than "Returns:", (This seems to a
>> common thing throughout the series).
> Gonna fix.
>
>>> failure
>>> + */
>>> +struct drm_gpuvm_bo *
>> Any particular reason there's line-break after the function type even
>> when it fits the ~100 char limit?
> Nope, just for consistency thoughout this source file.
>
>>> +drm_gpuvm_bo_create(struct drm_gpuvm *gpuvm,
>>> +                   struct drm_gem_object *obj)
>>
>>
>>> +{
>>> +       const struct drm_gpuvm_ops *ops = gpuvm->ops;
>>> +       struct drm_gpuvm_bo *vm_bo;
>>> +
>>> +       if (ops && ops->vm_bo_alloc)
>>> +               vm_bo = ops->vm_bo_alloc();
>>> +       else
>>> +               vm_bo = kzalloc(sizeof(*vm_bo), GFP_KERNEL);
>>> +
>>> +       if (unlikely(!vm_bo))
>>> +               return NULL;
>>> +
>>> +       vm_bo->vm = gpuvm;
>>> +       vm_bo->obj = obj;
>>> +
>>> +       kref_init(&vm_bo->kref);
>>> +       INIT_LIST_HEAD(&vm_bo->list.gpuva);
>>> +       INIT_LIST_HEAD(&vm_bo->list.entry.gem);
>>> +
>>> +       drm_gem_object_get(obj);
>> Perhaps group this with the vm_bo->obj assignment to emphasize that
>> that's the pointer that gets the reference?
> Yep, makes sense.
>
>>> +
>>> +       return vm_bo;
>>> +}
>>> +EXPORT_SYMBOL_GPL(drm_gpuvm_bo_create);
>>> +
>>> +static void
>>> +drm_gpuvm_bo_destroy(struct kref *kref)
>>> +{
>>> +       struct drm_gpuvm_bo *vm_bo = container_of(kref, struct
>>> drm_gpuvm_bo,
>>> +                                                 kref);
>>> +       struct drm_gpuvm *gpuvm = vm_bo->vm;
>>> +       const struct drm_gpuvm_ops *ops = gpuvm->ops;
>>> +       struct drm_gem_object *obj = vm_bo->obj;
>>> +       bool lock = !drm_gpuvm_resv_protected(gpuvm);
>>> +
>>> +       drm_gem_gpuva_assert_lock_held(obj);
>>> +       if (!lock)
>>> +               drm_gpuvm_resv_assert_held(gpuvm);
>>> +
>>> +       list_del(&vm_bo->list.entry.gem);
>>> +
>>> +       drm_gem_object_put(obj);
>> Not sure if we have any drivers utilizing vm_bo_free() yet, but it
>> might make sense to move the drm_gem_object_put() until after the
>> freeing below, in case vm_bo_free() wants to use it?
> Good point, gonna fix.
>
>>> +
>>> +       if (ops && ops->vm_bo_free)
>>> +               ops->vm_bo_free(vm_bo);
>>> +       else
>>> +               kfree(vm_bo);
>>> +}
>>> +
>>> +/**
>>> + * drm_gpuvm_bo_put() - drop a struct drm_gpuvm_bo reference
>>> + * @vm_bo: the &drm_gpuvm_bo to release the reference of
>>> + *
>>> + * This releases a reference to @vm_bo.
>>> + *
>>> + * If the reference count drops to zero, the &gpuvm_bo is destroyed,
>>> which
>>> + * includes removing it from the GEMs gpuva list. Hence, if a call
>>> to this
>>> + * function can potentially let the reference count to zero the
>>> caller must
>>> + * hold the dma-resv or driver specific GEM gpuva lock.
>>> + */
>>> +void
>>> +drm_gpuvm_bo_put(struct drm_gpuvm_bo *vm_bo)
>>> +{
>>> +       if (vm_bo)
>>> +               kref_put(&vm_bo->kref, drm_gpuvm_bo_destroy);
>>> +}
>>> +EXPORT_SYMBOL_GPL(drm_gpuvm_bo_put);
>>> +
>>> +static struct drm_gpuvm_bo *
>>> +__drm_gpuvm_bo_find(struct drm_gpuvm *gpuvm,
>>> +                   struct drm_gem_object *obj)
>>> +{
>>> +       struct drm_gpuvm_bo *vm_bo;
>>> +
>>> +       drm_gem_gpuva_assert_lock_held(obj);
>>> +
>>> +       drm_gem_for_each_gpuvm_bo(vm_bo, obj)
>>> +               if (vm_bo->vm == gpuvm)
>>> +                       return vm_bo;
>>> +
>>> +       return NULL;
>>> +}
>>> +
>>> +/**
>>> + * drm_gpuvm_bo_find() - find the &drm_gpuvm_bo for the given
>>> + * &drm_gpuvm and &drm_gem_object
>>> + * @gpuvm: The &drm_gpuvm the @obj is mapped in.
>>> + * @obj: The &drm_gem_object being mapped in the @gpuvm.
>>> + *
>>> + * Find the &drm_gpuvm_bo representing the combination of the given
>>> + * &drm_gpuvm and &drm_gem_object. If found, increases the reference
>>> + * count of the &drm_gpuvm_bo accordingly.
>>> + *
>>> + * Returns: a pointer to the &drm_gpuvm_bo on success, NULL on
>>> failure
>>> + */
>>> +struct drm_gpuvm_bo *
>>> +drm_gpuvm_bo_find(struct drm_gpuvm *gpuvm,
>>> +                 struct drm_gem_object *obj)
>>> +{
>>> +       struct drm_gpuvm_bo *vm_bo = __drm_gpuvm_bo_find(gpuvm, obj);
>>> +
>>> +       return vm_bo ? drm_gpuvm_bo_get(vm_bo) : NULL;
>>> +}
>>> +EXPORT_SYMBOL_GPL(drm_gpuvm_bo_find);
>>> +
>>> +/**
>>> + * drm_gpuvm_bo_obtain() - obtains and instance of the &drm_gpuvm_bo
>>> for the
>>> + * given &drm_gpuvm and &drm_gem_object
>>> + * @gpuvm: The &drm_gpuvm the @obj is mapped in.
>>> + * @obj: The &drm_gem_object being mapped in the @gpuvm.
>>> + *
>>> + * Find the &drm_gpuvm_bo representing the combination of the given
>>> + * &drm_gpuvm and &drm_gem_object. If found, increases the reference
>>> + * count of the &drm_gpuvm_bo accordingly. If not found, allocates a
>>> new
>>> + * &drm_gpuvm_bo.
>>> + *
>>> + * A new &drm_gpuvm_bo is added to the GEMs gpuva list.
>>> + *
>>> + * Returns: a pointer to the &drm_gpuvm_bo on success, an ERR_PTR on
>>> failure
>>> + */
>>> +struct drm_gpuvm_bo *
>>> +drm_gpuvm_bo_obtain(struct drm_gpuvm *gpuvm,
>>> +                   struct drm_gem_object *obj)
>>> +{
>>> +       struct drm_gpuvm_bo *vm_bo;
>>> +
>>> +       vm_bo = drm_gpuvm_bo_find(gpuvm, obj);
>>> +       if (vm_bo)
>>> +               return vm_bo;
>>> +
>>> +       vm_bo = drm_gpuvm_bo_create(gpuvm, obj);
>>> +       if (!vm_bo)
>>> +               return ERR_PTR(-ENOMEM);
>>> +
>>> +       list_add_tail(&vm_bo->list.entry.gem, &obj->gpuva.list);
>> Lockdep check?
> Is inherited by drm_gpuvm_bo_find(), but I can also be explicit here.
>
>>> +
>>> +       return vm_bo;
>>> +}
>>> +EXPORT_SYMBOL_GPL(drm_gpuvm_bo_obtain);
>>> +
>>> +/**
>>> + * drm_gpuvm_bo_obtain_prealloc() - obtains and instance of the
>>> &drm_gpuvm_bo
>>> + * for the given &drm_gpuvm and &drm_gem_object
>>> + * @__vm_bo: A pre-allocated struct drm_gpuvm_bo.
>>> + *
>>> + * Find the &drm_gpuvm_bo representing the combination of the given
>>> + * &drm_gpuvm and &drm_gem_object. If found, increases the reference
>>> + * count of the found &drm_gpuvm_bo accordingly, while the @__vm_bo
>>> reference
>>> + * count is decreased. If not found @__vm_bo is returned without
>>> further
>>> + * increase of the reference count.
>>> + *
>>> + * A new &drm_gpuvm_bo is added to the GEMs gpuva list.
>>> + *
>>> + * Returns: a pointer to the found &drm_gpuvm_bo or @__vm_bo if no
>>> existing
>>> + * &drm_gpuvm_bo was found
>>> + */
>>> +struct drm_gpuvm_bo *
>>> +drm_gpuvm_bo_obtain_prealloc(struct drm_gpuvm_bo *__vm_bo)
>>> +{
>>> +       struct drm_gpuvm *gpuvm = __vm_bo->vm;
>>> +       struct drm_gem_object *obj = __vm_bo->obj;
>>> +       struct drm_gpuvm_bo *vm_bo;
>>> +
>>> +       vm_bo = drm_gpuvm_bo_find(gpuvm, obj);
>>> +       if (vm_bo) {
>>> +               drm_gpuvm_bo_put(__vm_bo);
>>> +               return vm_bo;
>>> +       }
>>> +
>>> +       list_add_tail(&__vm_bo->list.entry.gem, &obj->gpuva.list);
>> Perhaps a lockdep check here?
> Same as above.
>
>>> +
>>> +       return __vm_bo;
>>> +}
>>> +EXPORT_SYMBOL_GPL(drm_gpuvm_bo_obtain_prealloc);
>>> +
>>>   static int
>>>   __drm_gpuva_insert(struct drm_gpuvm *gpuvm,
>>>                     struct drm_gpuva *va)
>>> @@ -860,24 +1083,33 @@ EXPORT_SYMBOL_GPL(drm_gpuva_remove);
>>>   /**
>>>    * drm_gpuva_link() - link a &drm_gpuva
>>>    * @va: the &drm_gpuva to link
>>> + * @vm_bo: the &drm_gpuvm_bo to add the &drm_gpuva to
>>>    *
>>> - * This adds the given &va to the GPU VA list of the &drm_gem_object
>>> it is
>>> - * associated with.
>>> + * This adds the given &va to the GPU VA list of the &drm_gpuvm_bo
>>> and the
>>> + * &drm_gpuvm_bo to the &drm_gem_object it is associated with.
>>> + *
>>> + * For every &drm_gpuva entry added to the &drm_gpuvm_bo an
>>> additional
>>> + * reference of the latter is taken.
>>>    *
>>>    * This function expects the caller to protect the GEM's GPUVA list
>>> against
>> NIT: Referring to a "gem object" as a "GEM" catches my eye every time.
>> Perhaps that has become common practice? With my "it used to be like.."
>> hat on, I'd use gem object.
> I think this is the way it referred to in a lot of places, e.g. drm_exe.c,
> drm_gem.c, etc. Hence, I'd like to stick with that.
>
>>> - * concurrent access using the GEMs dma_resv lock.
>>> + * concurrent access using either the GEMs dma_resv lock or a driver
>>> specific
>>> + * lock set through drm_gem_gpuva_set_lock().
>>>    */
>>>   void
>>> -drm_gpuva_link(struct drm_gpuva *va)
>>> +drm_gpuva_link(struct drm_gpuva *va, struct drm_gpuvm_bo *vm_bo)
>>>   {
>>>          struct drm_gem_object *obj = va->gem.obj;
>>>   
>>>          if (unlikely(!obj))
>>>                  return;
>>>   
>>> +       WARN_ON(obj != vm_bo->obj);
>> Can we use drm_WARN here?
> Sure!
>
>>>          drm_gem_gpuva_assert_lock_held(obj);
>>>   
>>> -       list_add_tail(&va->gem.entry, &obj->gpuva.list);
>>> +       drm_gpuvm_bo_get(vm_bo);
>>> +
>>> +       va->vm_bo = vm_bo;
>>> +       list_add_tail(&va->gem.entry, &vm_bo->list.gpuva);
>>>   }
>>>   EXPORT_SYMBOL_GPL(drm_gpuva_link);
>>>   
>>> @@ -888,13 +1120,22 @@ EXPORT_SYMBOL_GPL(drm_gpuva_link);
>>>    * This removes the given &va from the GPU VA list of the
>>> &drm_gem_object it is
>>>    * associated with.
>>>    *
>>> + * This removes the given &va from the GPU VA list of the
>>> &drm_gpuvm_bo and
>>> + * the &drm_gpuvm_bo from the &drm_gem_object it is associated with
>>> in case
>>> + * this call unlinks the last &drm_gpuva from the &drm_gpuvm_bo.
>>> + *
>>> + * For every &drm_gpuva entry removed from the &drm_gpuvm_bo a
>>> reference of
>>> + * the latter is dropped.
>>> + *
>>>    * This function expects the caller to protect the GEM's GPUVA list
>>> against
>>> - * concurrent access using the GEMs dma_resv lock.
>>> + * concurrent access using either the GEMs dma_resv lock or a driver
>>> specific
>>> + * lock set through drm_gem_gpuva_set_lock().
>>>    */
>>>   void
>>>   drm_gpuva_unlink(struct drm_gpuva *va)
>>>   {
>>>          struct drm_gem_object *obj = va->gem.obj;
>>> +       struct drm_gpuvm_bo *vm_bo = va->vm_bo;
>>>   
>>>          if (unlikely(!obj))
>>>                  return;
>>> @@ -902,6 +1143,9 @@ drm_gpuva_unlink(struct drm_gpuva *va)
>>>          drm_gem_gpuva_assert_lock_held(obj);
>>>   
>>>          list_del_init(&va->gem.entry);
>>> +       va->vm_bo = NULL;
>>> +
>>> +       drm_gpuvm_bo_put(vm_bo);
>>>   }
>>>   EXPORT_SYMBOL_GPL(drm_gpuva_unlink);
>>>   
>>> @@ -1046,10 +1290,10 @@ drm_gpuva_remap(struct drm_gpuva *prev,
>>>                  struct drm_gpuva *next,
>>>                  struct drm_gpuva_op_remap *op)
>>>   {
>>> -       struct drm_gpuva *curr = op->unmap->va;
>>> -       struct drm_gpuvm *gpuvm = curr->vm;
>>> +       struct drm_gpuva *va = op->unmap->va;
>>> +       struct drm_gpuvm *gpuvm = va->vm;
>>>   
>>> -       drm_gpuva_remove(curr);
>>> +       drm_gpuva_remove(va);
>>>   
>>>          if (op->prev) {
>>>                  drm_gpuva_init_from_op(prev, op->prev);
>>> @@ -1693,9 +1937,8 @@ drm_gpuvm_prefetch_ops_create(struct drm_gpuvm
>>> *gpuvm,
>>>   EXPORT_SYMBOL_GPL(drm_gpuvm_prefetch_ops_create);
>>>   
>>>   /**
>>> - * drm_gpuvm_gem_unmap_ops_create() - creates the &drm_gpuva_ops to
>>> unmap a GEM
>>> - * @gpuvm: the &drm_gpuvm representing the GPU VA space
>>> - * @obj: the &drm_gem_object to unmap
>>> + * drm_gpuvm_bo_unmap_ops_create() - creates the &drm_gpuva_ops to
>>> unmap a GEM
>>> + * @vm_bo: the &drm_gpuvm_bo abstraction
>>>    *
>>>    * This function creates a list of operations to perform unmapping
>>> for every
>>>    * GPUVA attached to a GEM.
>>> @@ -1712,15 +1955,14 @@
>>> EXPORT_SYMBOL_GPL(drm_gpuvm_prefetch_ops_create);
>>>    * Returns: a pointer to the &drm_gpuva_ops on success, an ERR_PTR
>>> on failure
>>>    */
>>>   struct drm_gpuva_ops *
>>> -drm_gpuvm_gem_unmap_ops_create(struct drm_gpuvm *gpuvm,
>>> -                              struct drm_gem_object *obj)
>>> +drm_gpuvm_bo_unmap_ops_create(struct drm_gpuvm_bo *vm_bo)
>>>   {
>>>          struct drm_gpuva_ops *ops;
>>>          struct drm_gpuva_op *op;
>>>          struct drm_gpuva *va;
>>>          int ret;
>>>   
>>> -       drm_gem_gpuva_assert_lock_held(obj);
>>> +       drm_gem_gpuva_assert_lock_held(vm_bo->obj);
>>>   
>>>          ops = kzalloc(sizeof(*ops), GFP_KERNEL);
>>>          if (!ops)
>>> @@ -1728,8 +1970,8 @@ drm_gpuvm_gem_unmap_ops_create(struct drm_gpuvm
>>> *gpuvm,
>>>   
>>>          INIT_LIST_HEAD(&ops->list);
>>>   
>>> -       drm_gem_for_each_gpuva(va, obj) {
>>> -               op = gpuva_op_alloc(gpuvm);
>>> +       drm_gpuvm_bo_for_each_va(va, vm_bo) {
>>> +               op = gpuva_op_alloc(vm_bo->vm);
>>>                  if (!op) {
>>>                          ret = -ENOMEM;
>>>                          goto err_free_ops;
>>> @@ -1743,10 +1985,10 @@ drm_gpuvm_gem_unmap_ops_create(struct
>>> drm_gpuvm *gpuvm,
>>>          return ops;
>>>   
>>>   err_free_ops:
>>> -       drm_gpuva_ops_free(gpuvm, ops);
>>> +       drm_gpuva_ops_free(vm_bo->vm, ops);
>>>          return ERR_PTR(ret);
>>>   }
>>> -EXPORT_SYMBOL_GPL(drm_gpuvm_gem_unmap_ops_create);
>>> +EXPORT_SYMBOL_GPL(drm_gpuvm_bo_unmap_ops_create);
>>>   
>>>   /**
>>>    * drm_gpuva_ops_free() - free the given &drm_gpuva_ops
>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
>>> b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
>>> index 93ad2ba7ec8b..4e46f850e65f 100644
>>> --- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
>>> +++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
>>> @@ -62,6 +62,8 @@ struct bind_job_op {
>>>          enum vm_bind_op op;
>>>          u32 flags;
>>>   
>>> +       struct drm_gpuvm_bo *vm_bo;
>>> +
>>>          struct {
>>>                  u64 addr;
>>>                  u64 range;
>>> @@ -1113,22 +1115,28 @@ bind_validate_region(struct nouveau_job *job)
>>>   }
>>>   
>>>   static void
>>> -bind_link_gpuvas(struct drm_gpuva_ops *ops, struct
>>> nouveau_uvma_prealloc *new)
>>> +bind_link_gpuvas(struct bind_job_op *bop)
>>>   {
>>> +       struct nouveau_uvma_prealloc *new = &bop->new;
>>> +       struct drm_gpuvm_bo *vm_bo = bop->vm_bo;
>>> +       struct drm_gpuva_ops *ops = bop->ops;
>>>          struct drm_gpuva_op *op;
>>>   
>>>          drm_gpuva_for_each_op(op, ops) {
>>>                  switch (op->op) {
>>>                  case DRM_GPUVA_OP_MAP:
>>> -                       drm_gpuva_link(&new->map->va);
>>> +                       drm_gpuva_link(&new->map->va, vm_bo);
>>>                          break;
>>> -               case DRM_GPUVA_OP_REMAP:
>>> +               case DRM_GPUVA_OP_REMAP: {
>>> +                       struct drm_gpuva *va = op->remap.unmap->va;
>>> +
>>>                          if (op->remap.prev)
>>> -                               drm_gpuva_link(&new->prev->va);
>>> +                               drm_gpuva_link(&new->prev->va, va-
>>>> vm_bo);
>>>                          if (op->remap.next)
>>> -                               drm_gpuva_link(&new->next->va);
>>> -                       drm_gpuva_unlink(op->remap.unmap->va);
>>> +                               drm_gpuva_link(&new->next->va, va-
>>>> vm_bo);
>>> +                       drm_gpuva_unlink(va);
>>>                          break;
>>> +               }
>>>                  case DRM_GPUVA_OP_UNMAP:
>>>                          drm_gpuva_unlink(op->unmap.va);
>>>                          break;
>>> @@ -1150,10 +1158,18 @@ nouveau_uvmm_bind_job_submit(struct
>>> nouveau_job *job)
>>>   
>>>          list_for_each_op(op, &bind_job->ops) {
>>>                  if (op->op == OP_MAP) {
>>> -                       op->gem.obj = drm_gem_object_lookup(job-
>>>> file_priv,
>>> -                                                           op-
>>>> gem.handle);
>>> -                       if (!op->gem.obj)
>>> +                       struct drm_gem_object *obj;
>>> +
>>> +                       obj = drm_gem_object_lookup(job->file_priv,
>>> +                                                   op->gem.handle);
>>> +                       if (!(op->gem.obj = obj))
>>>                                  return -ENOENT;
>>> +
>>> +                       dma_resv_lock(obj->resv, NULL);
>>> +                       op->vm_bo = drm_gpuvm_bo_obtain(&uvmm->base,
>>> obj);
>>> +                       dma_resv_unlock(obj->resv);
>>> +                       if (IS_ERR(op->vm_bo))
>>> +                               return PTR_ERR(op->vm_bo);
>>>                  }
>>>   
>>>                  ret = bind_validate_op(job, op);
>>> @@ -1364,7 +1380,7 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job
>>> *job)
>>>                  case OP_UNMAP_SPARSE:
>>>                  case OP_MAP:
>>>                  case OP_UNMAP:
>>> -                       bind_link_gpuvas(op->ops, &op->new);
>>> +                       bind_link_gpuvas(op);
>>>                          break;
>>>                  default:
>>>                          break;
>>> @@ -1511,6 +1527,12 @@ nouveau_uvmm_bind_job_free_work_fn(struct
>>> work_struct *work)
>>>                  if (!IS_ERR_OR_NULL(op->ops))
>>>                          drm_gpuva_ops_free(&uvmm->base, op->ops);
>>>   
>>> +               if (!IS_ERR_OR_NULL(op->vm_bo)) {
>>> +                       dma_resv_lock(obj->resv, NULL);
>>> +                       drm_gpuvm_bo_put(op->vm_bo);
>>> +                       dma_resv_unlock(obj->resv);
>>> +               }
>>> +
>>>                  if (obj)
>>>                          drm_gem_object_put(obj);
>>>          }
>>> @@ -1776,15 +1798,18 @@ void
>>>   nouveau_uvmm_bo_map_all(struct nouveau_bo *nvbo, struct nouveau_mem
>>> *mem)
>>>   {
>>>          struct drm_gem_object *obj = &nvbo->bo.base;
>>> +       struct drm_gpuvm_bo *vm_bo;
>>>          struct drm_gpuva *va;
>>>   
>>>          dma_resv_assert_held(obj->resv);
>>>   
>>> -       drm_gem_for_each_gpuva(va, obj) {
>>> -               struct nouveau_uvma *uvma = uvma_from_va(va);
>>> +       drm_gem_for_each_gpuvm_bo(vm_bo, obj) {
>>> +               drm_gpuvm_bo_for_each_va(va, vm_bo) {
>>> +                       struct nouveau_uvma *uvma = uvma_from_va(va);
>>>   
>>> -               nouveau_uvma_map(uvma, mem);
>>> -               drm_gpuva_invalidate(va, false);
>>> +                       nouveau_uvma_map(uvma, mem);
>>> +                       drm_gpuva_invalidate(va, false);
>>> +               }
>>>          }
>>>   }
>>>   
>>> @@ -1792,15 +1817,18 @@ void
>>>   nouveau_uvmm_bo_unmap_all(struct nouveau_bo *nvbo)
>>>   {
>>>          struct drm_gem_object *obj = &nvbo->bo.base;
>>> +       struct drm_gpuvm_bo *vm_bo;
>>>          struct drm_gpuva *va;
>>>   
>>>          dma_resv_assert_held(obj->resv);
>>>   
>>> -       drm_gem_for_each_gpuva(va, obj) {
>>> -               struct nouveau_uvma *uvma = uvma_from_va(va);
>>> +       drm_gem_for_each_gpuvm_bo(vm_bo, obj) {
>>> +               drm_gpuvm_bo_for_each_va(va, vm_bo) {
>>> +                       struct nouveau_uvma *uvma = uvma_from_va(va);
>>>   
>>> -               nouveau_uvma_unmap(uvma);
>>> -               drm_gpuva_invalidate(va, true);
>>> +                       nouveau_uvma_unmap(uvma);
>>> +                       drm_gpuva_invalidate(va, true);
>>> +               }
>>>          }
>>>   }
>>>   
>>> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
>>> index 16364487fde9..369505447acd 100644
>>> --- a/include/drm/drm_gem.h
>>> +++ b/include/drm/drm_gem.h
>>> @@ -580,7 +580,7 @@ int drm_gem_evict(struct drm_gem_object *obj);
>>>    * drm_gem_gpuva_init() - initialize the gpuva list of a GEM object
>>>    * @obj: the &drm_gem_object
>>>    *
>>> - * This initializes the &drm_gem_object's &drm_gpuva list.
>>> + * This initializes the &drm_gem_object's &drm_gpuvm_bo list.
>>>    *
>>>    * Calling this function is only necessary for drivers intending to
>>> support the
>>>    * &drm_driver_feature DRIVER_GEM_GPUVA.
>>> @@ -593,28 +593,28 @@ static inline void drm_gem_gpuva_init(struct
>>> drm_gem_object *obj)
>>>   }
>>>   
>>>   /**
>>> - * drm_gem_for_each_gpuva() - iternator to walk over a list of
>>> gpuvas
>>> - * @entry__: &drm_gpuva structure to assign to in each iteration
>>> step
>>> - * @obj__: the &drm_gem_object the &drm_gpuvas to walk are
>>> associated with
>>> + * drm_gem_for_each_gpuvm_bo() - iterator to walk over a list of
>>> &drm_gpuvm_bo
>>> + * @entry__: &drm_gpuvm_bo structure to assign to in each iteration
>>> step
>>> + * @obj__: the &drm_gem_object the &drm_gpuvm_bo to walk are
>>> associated with
>>>    *
>>> - * This iterator walks over all &drm_gpuva structures associated
>>> with the
>>> - * &drm_gpuva_manager.
>>> + * This iterator walks over all &drm_gpuvm_bo structures associated
>>> with the
>>> + * &drm_gem_object.
>>>    */
>>> -#define drm_gem_for_each_gpuva(entry__, obj__) \
>>> -       list_for_each_entry(entry__, &(obj__)->gpuva.list, gem.entry)
>>> +#define drm_gem_for_each_gpuvm_bo(entry__, obj__) \
>>> +       list_for_each_entry(entry__, &(obj__)->gpuva.list,
>>> list.entry.gem)
>>>   
>>>   /**
>>> - * drm_gem_for_each_gpuva_safe() - iternator to safely walk over a
>>> list of
>>> - * gpuvas
>>> - * @entry__: &drm_gpuva structure to assign to in each iteration
>>> step
>>> - * @next__: &next &drm_gpuva to store the next step
>>> - * @obj__: the &drm_gem_object the &drm_gpuvas to walk are
>>> associated with
>>> + * drm_gem_for_each_gpuvm_bo_safe() - iterator to safely walk over a
>>> list of
>>> + * &drm_gpuvm_bo
>>> + * @entry__: &drm_gpuvm_bostructure to assign to in each iteration
>>> step
>>> + * @next__: &next &drm_gpuvm_bo to store the next step
>>> + * @obj__: the &drm_gem_object the &drm_gpuvm_bo to walk are
>>> associated with
>>>    *
>>> - * This iterator walks over all &drm_gpuva structures associated
>>> with the
>>> + * This iterator walks over all &drm_gpuvm_bo structures associated
>>> with the
>>>    * &drm_gem_object. It is implemented with
>>> list_for_each_entry_safe(), hence
>>>    * it is save against removal of elements.
>>>    */
>>> -#define drm_gem_for_each_gpuva_safe(entry__, next__, obj__) \
>>> -       list_for_each_entry_safe(entry__, next__, &(obj__)-
>>>> gpuva.list, gem.entry)
>>> +#define drm_gem_for_each_gpuvm_bo_safe(entry__, next__, obj__) \
>>> +       list_for_each_entry_safe(entry__, next__, &(obj__)-
>>>> gpuva.list, list.entry.gem)
>>>   
>>>   #endif /* __DRM_GEM_H__ */
>>> diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
>>> index 13539f32c2e2..ddb0b8d323cf 100644
>>> --- a/include/drm/drm_gpuvm.h
>>> +++ b/include/drm/drm_gpuvm.h
>>> @@ -26,12 +26,14 @@
>>>    */
>>>   
>>>   #include <linux/list.h>
>>> +#include <linux/dma-resv.h>
>>>   #include <linux/rbtree.h>
>>>   #include <linux/types.h>
>>>   
>>>   #include <drm/drm_gem.h>
>>>   
>>>   struct drm_gpuvm;
>>> +struct drm_gpuvm_bo;
>>>   struct drm_gpuvm_ops;
>>>   
>>>   /**
>>> @@ -72,6 +74,12 @@ struct drm_gpuva {
>>>           */
>>>          struct drm_gpuvm *vm;
>>>   
>>> +       /**
>>> +        * @vm_bo: the &drm_gpuvm_bo abstraction for the mapped
>>> +        * &drm_gem_object
>>> +        */
>>> +       struct drm_gpuvm_bo *vm_bo;
>>> +
>>>          /**
>>>           * @flags: the &drm_gpuva_flags for this mapping
>>>           */
>>> @@ -107,7 +115,7 @@ struct drm_gpuva {
>>>                  struct drm_gem_object *obj;
>>>   
>>>                  /**
>>> -                * @entry: the &list_head to attach this object to a
>>> &drm_gem_object
>>> +                * @entry: the &list_head to attach this object to a
>>> &drm_gpuvm_bo
>>>                   */
>>>                  struct list_head entry;
>>>          } gem;
>>> @@ -140,7 +148,7 @@ struct drm_gpuva {
>>>   int drm_gpuva_insert(struct drm_gpuvm *gpuvm, struct drm_gpuva *va);
>>>   void drm_gpuva_remove(struct drm_gpuva *va);
>>>   
>>> -void drm_gpuva_link(struct drm_gpuva *va);
>>> +void drm_gpuva_link(struct drm_gpuva *va, struct drm_gpuvm_bo
>>> *vm_bo);
>>>   void drm_gpuva_unlink(struct drm_gpuva *va);
>>>   
>>>   struct drm_gpuva *drm_gpuva_find(struct drm_gpuvm *gpuvm,
>>> @@ -187,10 +195,16 @@ static inline bool drm_gpuva_invalidated(struct
>>> drm_gpuva *va)
>>>    * enum drm_gpuvm_flags - flags for struct drm_gpuvm
>>>    */
>>>   enum drm_gpuvm_flags {
>>> +       /**
>>> +        * @DRM_GPUVM_RESV_PROTECTED: GPUVM is protected externally
>>> by the
>>> +        * GPUVM's &dma_resv lock
>>> +        */
>>> +       DRM_GPUVM_RESV_PROTECTED = (1 << 0),
>>> +
>>>          /**
>>>           * @DRM_GPUVM_USERBITS: user defined bits
>>>           */
>>> -       DRM_GPUVM_USERBITS = (1 << 0),
>>> +       DRM_GPUVM_USERBITS = (1 << 1),
>>>   };
>>>   
>>>   /**
>>> @@ -272,6 +286,19 @@ bool drm_gpuvm_interval_empty(struct drm_gpuvm
>>> *gpuvm, u64 addr, u64 range);
>>>   struct drm_gem_object *
>>>   drm_gpuvm_root_object_alloc(struct drm_device *drm);
>>>   
>>> +/**
>>> + * drm_gpuvm_resv_protected() - indicates whether
>>> &DRM_GPUVM_RESV_PROTECTED is
>>> + * set
>>> + * @gpuvm: the &drm_gpuvm
>>> + *
>>> + * Returns: true if &DRM_GPUVM_RESV_PROTECTED is set, false
>>> otherwise.
>>> + */
>>> +static inline bool
>>> +drm_gpuvm_resv_protected(struct drm_gpuvm *gpuvm)
>>> +{
>>> +       return gpuvm->flags & DRM_GPUVM_RESV_PROTECTED;
>>> +}
>>> +
>>>   /**
>>>    * drm_gpuvm_resv() - returns the &drm_gpuvm's &dma_resv
>>>    * @gpuvm__: the &drm_gpuvm
>>> @@ -290,6 +317,12 @@ drm_gpuvm_root_object_alloc(struct drm_device
>>> *drm);
>>>    */
>>>   #define drm_gpuvm_resv_obj(gpuvm__) ((gpuvm__)->r_obj)
>>>   
>>> +#define drm_gpuvm_resv_held(gpuvm__) \
>>> +       dma_resv_held(drm_gpuvm_resv(gpuvm__))
>>> +
>>> +#define drm_gpuvm_resv_assert_held(gpuvm__) \
>>> +       dma_resv_assert_held(drm_gpuvm_resv(gpuvm__))
>>> +
>>>   #define drm_gpuvm_resv_held(gpuvm__) \
>>>          dma_resv_held(drm_gpuvm_resv(gpuvm__))
>>>   
>>> @@ -374,6 +407,117 @@ __drm_gpuva_next(struct drm_gpuva *va)
>>>   #define drm_gpuvm_for_each_va_safe(va__, next__, gpuvm__) \
>>>          list_for_each_entry_safe(va__, next__, &(gpuvm__)->rb.list,
>>> rb.entry)
>>>   
>>> +/**
>>> + * struct drm_gpuvm_bo - structure representing a &drm_gpuvm and
>>> + * &drm_gem_object combination
>>> + *
>>> + * This structure is an abstraction representing a &drm_gpuvm and
>>> + * &drm_gem_object combination. It serves as an indirection to
>>> accelerate
>>> + * iterating all &drm_gpuvas within a &drm_gpuvm backed by the same
>>> + * &drm_gem_object.
>>> + *
>>> + * Furthermore it is used cache evicted GEM objects for a certain
>>> GPU-VM to
>>> + * accelerate validation.
>>> + *
>>> + * Typically, drivers want to create an instance of a struct
>>> drm_gpuvm_bo once
>>> + * a GEM object is mapped first in a GPU-VM and release the instance
>>> once the
>>> + * last mapping of the GEM object in this GPU-VM is unmapped.
>>> + */
>>> +struct drm_gpuvm_bo {
>>> +
>>> +       /**
>>> +        * @vm: The &drm_gpuvm the @obj is mapped in.
>> Not refcounted. @vm may potentially be freed under us in the
>> !RESV_PROTECTED case.
> It's the drivers responsibility to ensure the VM is not freed up as long as
> VM_BOs with this VM do exist. However, this is nothing drivers need to care
> about explicitly, since drivers are responsible to keep the VM alive as long
> as mappings exist anyway. And all mappings being gone implies also all VM_BOs
> being gone, since the lifetime of a VM_BO goes from the first mapping backed by
> a certain object is created to the last mapping backed by this object is
> removed. drm_gpuvm_destroy() will also warn if the GPUVM still contains
> mappings.
>
> I will document this more explicitly somewhere.
>
>>> +        */
>>> +       struct drm_gpuvm *vm;
>>> +
>>> +       /**
>>> +        * @obj: The &drm_gem_object being mapped in @vm.
>> Refcounted pointer.
> Guess you want me to document that.

Yes, that'd be good. Especially with internal lower-level locking it 
will become crucial to know where we have strong vs weak referencing so 
we know where to upgrade with kref_get_unless_zero().

Thanks,

Thomas


