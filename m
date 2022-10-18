Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F259F602EF1
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 16:56:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18EBA10E8AF;
	Tue, 18 Oct 2022 14:56:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6BA410E8AF;
 Tue, 18 Oct 2022 14:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666104989; x=1697640989;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=r8XPIXg0OvHPkQlorPcKCuj+aVhJx0cE/MUFBCvA1fs=;
 b=cPTcCSfWlq8yD3kMtiQc+rjE+Tk31327dgSH+Qtfhm39D+GG0NidlnbC
 /rSwUHGuqmi77Gx59rTkSUgg7RT+UjB9LGTYj8G+QcbC7nWGkznvuZHTK
 6NpnV/zrQjx5t8wJAfpFUspB/D19oFtoWkshukrApMriAv8CyYNX4eSoW
 oYgfKSBS3ab5fLX9FDqdgwR7r+z4WVXJd0g+ui4A/WWfTRtX+wNf7qHWx
 L+hZ4d4SbVafn0qaJ21pHxIzuY/d/7C/iDOWpWqQonjC6lDQF5Xe7SkNX
 VTdXYAqksuk9Qgwm+fx3zk19ZXfdjrizEmrMTxJMPlOYEh+EPL8bXSXtS A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="289420062"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="289420062"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 07:55:46 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="754079414"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="754079414"
Received: from kmaslows-mobl.ger.corp.intel.com (HELO [10.252.26.162])
 ([10.252.26.162])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 07:55:39 -0700
Message-ID: <f676b8a5-9ade-33e3-fc37-78a82a0545d6@intel.com>
Date: Tue, 18 Oct 2022 15:55:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.3.1
Subject: Re: [Intel-gfx] [PATCH v3 09/17] drm/i915/vm_bind: Add out fence
 support
Content-Language: en-GB
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20221010065826.32037-1-niranjana.vishwanathapura@intel.com>
 <20221010065826.32037-10-niranjana.vishwanathapura@intel.com>
 <Y0kGMzaVxlC7qQKd@nvishwa1-DESK>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <Y0kGMzaVxlC7qQKd@nvishwa1-DESK>
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
Cc: jani.nikula@intel.com, daniel.vetter@intel.com, thomas.hellstrom@intel.com,
 paulo.r.zanoni@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/10/2022 07:48, Niranjana Vishwanathapura wrote:
> On Sun, Oct 09, 2022 at 11:58:18PM -0700, Niranjana Vishwanathapura wrote:
>> Add support for handling out fence for vm_bind call.
>>
>> v2: Reset vma->vm_bind_fence.syncobj to NULL at the end
>>    of vm_bind call.
>>
>> Signed-off-by: Niranjana Vishwanathapura 
>> <niranjana.vishwanathapura@intel.com>
>> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
>> ---
>> drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h   |  4 +
>> .../drm/i915/gem/i915_gem_vm_bind_object.c    | 82 +++++++++++++++++++
>> drivers/gpu/drm/i915/i915_vma.c               |  7 +-
>> drivers/gpu/drm/i915/i915_vma_types.h         |  7 ++
>> include/uapi/drm/i915_drm.h                   | 63 +++++++++++++-
>> 5 files changed, 158 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h 
>> b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h
>> index 36262a6357b5..b70e900e35ab 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h
>> @@ -8,6 +8,7 @@
>>
>> #include <linux/types.h>
>>
>> +struct dma_fence;
>> struct drm_device;
>> struct drm_file;
>> struct i915_address_space;
>> @@ -23,4 +24,7 @@ int i915_gem_vm_unbind_ioctl(struct drm_device *dev, 
>> void *data,
>>
>> void i915_gem_vm_unbind_all(struct i915_address_space *vm);
>>
>> +void i915_vm_bind_signal_fence(struct i915_vma *vma,
>> +                   struct dma_fence * const fence);
>> +
>> #endif /* __I915_GEM_VM_BIND_H */
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c 
>> b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>> index c435d49af2c8..526d3a6bf671 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>> @@ -7,6 +7,8 @@
>>
>> #include <linux/interval_tree_generic.h>
>>
>> +#include <drm/drm_syncobj.h>
>> +
>> #include "gem/i915_gem_context.h"
>> #include "gem/i915_gem_vm_bind.h"
>>
>> @@ -100,6 +102,76 @@ static void i915_gem_vm_bind_remove(struct 
>> i915_vma *vma, bool release_obj)
>>         i915_gem_object_put(vma->obj);
>> }
>>
>> +static int i915_vm_bind_add_fence(struct drm_file *file, struct 
>> i915_vma *vma,
>> +                  u32 handle, u64 point)
>> +{
>> +    struct drm_syncobj *syncobj;
>> +
>> +    syncobj = drm_syncobj_find(file, handle);
>> +    if (!syncobj) {
>> +        DRM_DEBUG("Invalid syncobj handle provided\n");
>> +        return -ENOENT;
>> +    }
>> +
>> +    /*
>> +     * For timeline syncobjs we need to preallocate chains for
>> +     * later signaling.
>> +     */
>> +    if (point) {
>> +        vma->vm_bind_fence.chain_fence = dma_fence_chain_alloc();
>> +        if (!vma->vm_bind_fence.chain_fence) {
>> +            drm_syncobj_put(syncobj);
>> +            return -ENOMEM;
>> +        }
>> +    } else {
>> +        vma->vm_bind_fence.chain_fence = NULL;
>> +    }
>> +    vma->vm_bind_fence.syncobj = syncobj;
>> +    vma->vm_bind_fence.value = point;
>> +
>> +    return 0;
>> +}
>> +
>> +static void i915_vm_bind_put_fence(struct i915_vma *vma)
>> +{
>> +    if (!vma->vm_bind_fence.syncobj)
>> +        return;
>> +
>> +    drm_syncobj_put(vma->vm_bind_fence.syncobj);
>> +    dma_fence_chain_free(vma->vm_bind_fence.chain_fence);
>> +    vma->vm_bind_fence.syncobj = NULL;
>> +}
>> +
>> +/**
>> + * i915_vm_bind_signal_fence() - Add fence to vm_bind syncobj
>> + * @vma: vma mapping requiring signaling
>> + * @fence: fence to be added
>> + *
>> + * Associate specified @fence with the @vma's syncobj to be
>> + * signaled after the @fence work completes.
>> + */
>> +void i915_vm_bind_signal_fence(struct i915_vma *vma,
>> +                   struct dma_fence * const fence)
>> +{
>> +    struct drm_syncobj *syncobj = vma->vm_bind_fence.syncobj;
>> +
>> +    if (!syncobj)
>> +        return;
>> +
>> +    if (vma->vm_bind_fence.chain_fence) {
>> +        drm_syncobj_add_point(syncobj,
>> +                      vma->vm_bind_fence.chain_fence,
>> +                      fence, vma->vm_bind_fence.value);
>> +        /*
>> +         * The chain's ownership is transferred to the
>> +         * timeline.
>> +         */
>> +        vma->vm_bind_fence.chain_fence = NULL;
>> +    } else {
>> +        drm_syncobj_replace_fence(syncobj, fence);
>> +    }
>> +}
>> +
>> static int i915_gem_vm_unbind_vma(struct i915_address_space *vm,
>>                   struct drm_i915_gem_vm_unbind *va)
>> {
>> @@ -237,6 +309,13 @@ static int i915_gem_vm_bind_obj(struct 
>> i915_address_space *vm,
>>         goto unlock_vm;
>>     }
>>
>> +    if (va->fence.flags & I915_TIMELINE_FENCE_SIGNAL) {
>> +        ret = i915_vm_bind_add_fence(file, vma, va->fence.handle,
>> +                         va->fence.value);
>> +        if (ret)
>> +            goto put_vma;
>> +    }
>> +
>>     pin_flags = va->start | PIN_OFFSET_FIXED | PIN_USER | PIN_VALIDATE;
>>
>>     for_i915_gem_ww(&ww, ret, true) {
>> @@ -258,6 +337,9 @@ static int i915_gem_vm_bind_obj(struct 
>> i915_address_space *vm,
>>         i915_gem_object_get(vma->obj);
>>     }
>>
>> +    if (va->fence.flags & I915_TIMELINE_FENCE_SIGNAL)
>> +        i915_vm_bind_put_fence(vma);
>> +put_vma:
>>     if (ret)
>>         i915_vma_destroy(vma);
>> unlock_vm:
>> diff --git a/drivers/gpu/drm/i915/i915_vma.c 
>> b/drivers/gpu/drm/i915/i915_vma.c
>> index 88c09e885fec..cb8e718ec46e 100644
>> --- a/drivers/gpu/drm/i915/i915_vma.c
>> +++ b/drivers/gpu/drm/i915/i915_vma.c
>> @@ -29,6 +29,7 @@
>> #include "display/intel_frontbuffer.h"
>> #include "gem/i915_gem_lmem.h"
>> #include "gem/i915_gem_tiling.h"
>> +#include "gem/i915_gem_vm_bind.h"
>> #include "gt/intel_engine.h"
>> #include "gt/intel_engine_heartbeat.h"
>> #include "gt/intel_gt.h"
>> @@ -1572,8 +1573,12 @@ int i915_vma_pin_ww(struct i915_vma *vma, 
>> struct i915_gem_ww_ctx *ww,
>> err_vma_res:
>>     i915_vma_resource_free(vma_res);
>> err_fence:
>> -    if (work)
>> +    if (work) {
>> +        if (i915_vma_is_persistent(vma))
>> +            i915_vm_bind_signal_fence(vma, &work->base.dma);
>> +
>>         dma_fence_work_commit_imm(&work->base);
>> +    }
>> err_rpm:
>>     if (wakeref)
>>         intel_runtime_pm_put(&vma->vm->i915->runtime_pm, wakeref);
>> diff --git a/drivers/gpu/drm/i915/i915_vma_types.h 
>> b/drivers/gpu/drm/i915/i915_vma_types.h
>> index d32c72e8d242..2c740500ac1b 100644
>> --- a/drivers/gpu/drm/i915/i915_vma_types.h
>> +++ b/drivers/gpu/drm/i915/i915_vma_types.h
>> @@ -308,6 +308,13 @@ struct i915_vma {
>>     /* @vm_rebind_link: link to vm_rebind_list and protected by 
>> vm_rebind_lock */
>>     struct list_head vm_rebind_link; /* Link in vm_rebind_list */
>>
>> +    /** Timeline fence for vm_bind completion notification */
>> +    struct {
>> +        struct dma_fence_chain *chain_fence;
>> +        struct drm_syncobj *syncobj;
>> +        u64 value;
>> +    } vm_bind_fence;
>> +
>>     /** Interval tree structures for persistent vma */
>>
>>     /** @rb: node for the interval tree of vm for persistent vmas */
>> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
>> index 16b815875e4f..61b1500866f9 100644
>> --- a/include/uapi/drm/i915_drm.h
>> +++ b/include/uapi/drm/i915_drm.h
>> @@ -1527,6 +1527,41 @@ struct drm_i915_gem_execbuffer2 {
>> #define i915_execbuffer2_get_context_id(eb2) \
>>     ((eb2).rsvd1 & I915_EXEC_CONTEXT_ID_MASK)
>>
>> +/**
>> + * struct drm_i915_gem_timeline_fence - An input or output timeline 
>> fence.
>> + *
>> + * The operation will wait for input fence to signal.
>> + *
>> + * The returned output fence will be signaled after the completion of 
>> the
>> + * operation.
>> + */
>> +struct drm_i915_gem_timeline_fence {
>> +    /** @handle: User's handle for a drm_syncobj to wait on or 
>> signal. */
>> +    __u32 handle;
>> +
>> +    /**
>> +     * @flags: Supported flags are:
>> +     *
>> +     * I915_TIMELINE_FENCE_WAIT:
>> +     * Wait for the input fence before the operation.
>> +     *
>> +     * I915_TIMELINE_FENCE_SIGNAL:
>> +     * Return operation completion fence as output.
>> +     */
>> +    __u32 flags;
>> +#define I915_TIMELINE_FENCE_WAIT            (1 << 0)
>> +#define I915_TIMELINE_FENCE_SIGNAL          (1 << 1)
>> +#define __I915_TIMELINE_FENCE_UNKNOWN_FLAGS 
>> (-(I915_TIMELINE_FENCE_SIGNAL << 1))
>> +
>> +    /**
>> +     * @value: A point in the timeline.
>> +     * Value must be 0 for a binary drm_syncobj. A Value of 0 for a
>> +     * timeline drm_syncobj is invalid as it turns a drm_syncobj into a
>> +     * binary one.
>> +     */
>> +    __u64 value;
>> +};
>> +
>> struct drm_i915_gem_pin {
>>     /** Handle of the buffer to be pinned. */
>>     __u32 handle;
>> @@ -3817,8 +3852,18 @@ struct drm_i915_gem_vm_bind {
>>      */
>>     __u64 flags;
>>
>> -    /** @rsvd: Reserved, MBZ */
>> -    __u64 rsvd[2];
>> +    /**
>> +     * @fence: Timeline fence for bind completion signaling.
>> +     *
>> +     * Timeline fence is of format struct drm_i915_gem_timeline_fence.
>> +     *
>> +     * It is an out fence, hence using I915_TIMELINE_FENCE_WAIT flag
>> +     * is invalid, and an error will be returned.
>> +     *
>> +     * If I915_TIMELINE_FENCE_SIGNAL flag is not set, then out fence
>> +     * is not requested and binding is completed synchronously.
>> +     */
>> +    struct drm_i915_gem_timeline_fence fence;
>>
>>     /**
>>      * @extensions: Zero-terminated chain of extensions.
>> @@ -3865,8 +3910,18 @@ struct drm_i915_gem_vm_unbind {
>>      */
>>     __u64 flags;
>>
>> -    /** @rsvd2: Reserved, MBZ */
>> -    __u64 rsvd2[2];
>> +    /**
>> +     * @fence: Timeline fence for unbind completion signaling.
>> +     *
>> +     * Timeline fence is of format struct drm_i915_gem_timeline_fence.
>> +     *
>> +     * It is an out fence, hence using I915_TIMELINE_FENCE_WAIT flag
>> +     * is invalid, and an error will be returned.
>> +     *
>> +     * If I915_TIMELINE_FENCE_SIGNAL flag is not set, then out fence
>> +     * is not requested and unbinding is completed synchronously.
>> +     */
>> +    struct drm_i915_gem_timeline_fence fence;
> 
> Async unbind (hence out fence) is not yet supported for vm_unbind call.
> 
> Also, looking at i915_vma_unbind_async(), we can use that for async
> vm_unbind support. The i915 driver also handles sequencing of other
> operations behind the async unbind. Hence, probably we don't need to
> return the out fence to user at all here.
> i915_vma_unbind_async() works only for objects with ttm backend.
> Perhaps for other objects (like userptr) and if async unbind returns
> error, we can fallback to synchronous vma unbind (i915_vma_unbind()).
> 
> So, not sure whether we really need timeline out fence support here.
> I will remove this udate here and keep the fields as reserved for now.
> Any thoughts?

That seems reasonable to me, unless there is some other usecase for the 
out fence on unbind...

> 
> Thanks,
> Niranjana
> 
>>
>>     /**
>>      * @extensions: Zero-terminated chain of extensions.
>> -- 
>> 2.21.0.rc0.32.g243a4c7e27
>>
