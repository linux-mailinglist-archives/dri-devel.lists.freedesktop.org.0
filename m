Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9680048D9C6
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 15:37:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0D2D10E15E;
	Thu, 13 Jan 2022 14:37:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E999410E140;
 Thu, 13 Jan 2022 14:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642084625; x=1673620625;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=RjahPQKuv3DQkSr/yFuVIkJaPd3xjGw0FnBxNN0zRlU=;
 b=MxgdXnQEbtVW5fqrmHPAgZotaNzGV1ERop9/xdNPInC/cWD/8Dvl+/Fe
 NmcUd1uZcVqa77tl/bjMG1tRFjvZzfVt0hEcHq01c3mHKRE5An31gLhld
 WsSJKSvQHMjOhkHz3TUisRc9Vb1fGdIUf9GxiY+G1rXtpG654UpedTgQv
 qFWvgjiKNNp4zciGL+CEUNWUKMW1ExPkwsARcjqcgFY/jkCf91CYgFsdq
 6yS2z5x5iDGVRqxlgkiXb6M/1fqH/ToWl+zgMQ1r1topzzJhzzU2O2t+P
 bA8QIxJV2x/HBKAgXlkeVCGp0KNmCR3kFVctO3t9Ncdo74omUC0u43pAj w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10225"; a="244223580"
X-IronPort-AV: E=Sophos;i="5.88,286,1635231600"; d="scan'208";a="244223580"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2022 06:37:05 -0800
X-IronPort-AV: E=Sophos;i="5.88,286,1635231600"; d="scan'208";a="529677540"
Received: from pthierry-mobl1.ger.corp.intel.com (HELO [10.252.49.62])
 ([10.252.49.62])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2022 06:37:03 -0800
Message-ID: <f78d6639-f587-5d89-1578-0f4b3d09d9fc@linux.intel.com>
Date: Thu, 13 Jan 2022 15:37:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.1
Subject: Re: [Intel-gfx] [PATCH v5 2/6] drm/i915: Add locking to
 i915_gem_evict_vm()
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 intel-gfx@lists.freedesktop.org
References: <20220113114500.2039439-1-maarten.lankhorst@linux.intel.com>
 <20220113114500.2039439-3-maarten.lankhorst@linux.intel.com>
 <8bec6863-faab-d892-e312-673f0a09f3dc@shipmail.org>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <8bec6863-faab-d892-e312-673f0a09f3dc@shipmail.org>
Content-Type: text/plain; charset=UTF-8
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13-01-2022 15:33, Thomas Hellström (Intel) wrote:
>
> On 1/13/22 12:44, Maarten Lankhorst wrote:
>> i915_gem_evict_vm will need to be able to evict objects that are
>> locked by the current ctx. By testing if the current context already
>> locked the object, we can do this correctly. This allows us to
>> evict the entire vm even if we already hold some objects' locks.
>>
>> Previously, this was spread over several commits, but it makes
>> more sense to commit the changes to i915_gem_evict_vm separately
>> from the changes to i915_gem_evict_something() and
>> i915_gem_evict_for_node().
>>
>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> ---
>>   .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  2 +-
>>   drivers/gpu/drm/i915/gem/i915_gem_mman.c      |  2 +-
>>   drivers/gpu/drm/i915/i915_gem_evict.c         | 42 ++++++++++++++++++-
>>   drivers/gpu/drm/i915/i915_gem_evict.h         |  4 +-
>>   drivers/gpu/drm/i915/i915_vma.c               |  7 +++-
>>   .../gpu/drm/i915/selftests/i915_gem_evict.c   | 10 ++++-
>>   6 files changed, 59 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>> index cf283b5f6ffe..4d832d6696b5 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>> @@ -767,7 +767,7 @@ static int eb_reserve(struct i915_execbuffer *eb)
>>           case 1:
>>               /* Too fragmented, unbind everything and retry */
>>               mutex_lock(&eb->context->vm->mutex);
>> -            err = i915_gem_evict_vm(eb->context->vm);
>> +            err = i915_gem_evict_vm(eb->context->vm, &eb->ww);
>>               mutex_unlock(&eb->context->vm->mutex);
>>               if (err)
>>                   return err;
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>> index fafd158e5313..a69787999d09 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>> @@ -367,7 +367,7 @@ static vm_fault_t vm_fault_gtt(struct vm_fault *vmf)
>>           if (vma == ERR_PTR(-ENOSPC)) {
>>               ret = mutex_lock_interruptible(&ggtt->vm.mutex);
>>               if (!ret) {
>> -                ret = i915_gem_evict_vm(&ggtt->vm);
>> +                ret = i915_gem_evict_vm(&ggtt->vm, &ww);
>>                   mutex_unlock(&ggtt->vm.mutex);
>>               }
>>               if (ret)
>> diff --git a/drivers/gpu/drm/i915/i915_gem_evict.c b/drivers/gpu/drm/i915/i915_gem_evict.c
>> index 24eee0c2055f..370eb7238d1c 100644
>> --- a/drivers/gpu/drm/i915/i915_gem_evict.c
>> +++ b/drivers/gpu/drm/i915/i915_gem_evict.c
>> @@ -74,6 +74,12 @@ static bool defer_evict(struct i915_vma *vma)
>>       return false;
>>   }
>>   +static int evict_dead(struct i915_vma *vma)
>> +{
>> +    atomic_and(~I915_VMA_PIN_MASK, &vma->flags);
>> +    return __i915_vma_unbind(vma);
>> +}
>> +
>>   /**
>>    * i915_gem_evict_something - Evict vmas to make room for binding a new one
>>    * @vm: address space to evict from
>> @@ -368,7 +374,7 @@ int i915_gem_evict_for_node(struct i915_address_space *vm,
>>    * To clarify: This is for freeing up virtual address space, not for freeing
>>    * memory in e.g. the shrinker.
>>    */
>> -int i915_gem_evict_vm(struct i915_address_space *vm)
>> +int i915_gem_evict_vm(struct i915_address_space *vm, struct i915_gem_ww_ctx *ww)
>>   {
>>       int ret = 0;
>>   @@ -389,24 +395,56 @@ int i915_gem_evict_vm(struct i915_address_space *vm)
>>       do {
>>           struct i915_vma *vma, *vn;
>>           LIST_HEAD(eviction_list);
>> +        LIST_HEAD(locked_eviction_list);
>>             list_for_each_entry(vma, &vm->bound_list, vm_link) {
>> +            if (!kref_read(&vma->obj->base.refcount)) {
>> +                ret = evict_dead(vma);
>> +                if (ret)
>> +                    break;
>> +            }
>> +
>
> Could the call to evict_dead corrupt the bound_list?

Sigh, it actually does, needs a _safe version here, missed it.. Would be interesting to see which patches fail.

Or we should toss it onto the locked_eviction_list to be reaped later, without worrying about unlock here.

>
>>               if (i915_vma_is_pinned(vma))
>>                   continue;
>>   +            /*
>> +             * If we already own the lock, trylock fails. In case the resv
>> +             * is shared among multiple objects, we still need the object ref.
>> +             */
>> +            if (ww && (dma_resv_locking_ctx(vma->obj->base.resv) == &ww->ctx)) {
>> +                __i915_vma_pin(vma);
>> +                list_add(&vma->evict_link, &locked_eviction_list);
>> +                continue;
>> +            }
>> +
>> +            if (!i915_gem_object_trylock(vma->obj, ww))
>> +                continue;
>> +
>>               __i915_vma_pin(vma);
>>               list_add(&vma->evict_link, &eviction_list);
>>           }
>> -        if (list_empty(&eviction_list))
>> +        if (list_empty(&eviction_list) && list_empty(&locked_eviction_list))
>>               break;
>>             ret = 0;
>> +        /* Unbind locked objects first, before unlocking the eviction_list */
>> +        list_for_each_entry_safe(vma, vn, &locked_eviction_list, evict_link) {
>> +            __i915_vma_unpin(vma);
>> +
>> +            if (ret == 0)
>> +                ret = __i915_vma_unbind(vma);
>> +            if (ret != -EINTR) /* "Get me out of here!" */
>> +                ret = 0;
>> +        }
>> +
>>           list_for_each_entry_safe(vma, vn, &eviction_list, evict_link) {
>>               __i915_vma_unpin(vma);
>>               if (ret == 0)
>>                   ret = __i915_vma_unbind(vma);
>>               if (ret != -EINTR) /* "Get me out of here!" */
>>                   ret = 0;
>> +
>> +            i915_gem_object_unlock(vma->obj);
>>           }
>>       } while (ret == 0);
>>   diff --git a/drivers/gpu/drm/i915/i915_gem_evict.h b/drivers/gpu/drm/i915/i915_gem_evict.h
>> index d4478b6ad11b..f5b7a9100609 100644
>> --- a/drivers/gpu/drm/i915/i915_gem_evict.h
>> +++ b/drivers/gpu/drm/i915/i915_gem_evict.h
>> @@ -10,6 +10,7 @@
>>     struct drm_mm_node;
>>   struct i915_address_space;
>> +struct i915_gem_ww_ctx;
>>     int __must_check i915_gem_evict_something(struct i915_address_space *vm,
>>                         u64 min_size, u64 alignment,
>> @@ -19,6 +20,7 @@ int __must_check i915_gem_evict_something(struct i915_address_space *vm,
>>   int __must_check i915_gem_evict_for_node(struct i915_address_space *vm,
>>                        struct drm_mm_node *node,
>>                        unsigned int flags);
>> -int i915_gem_evict_vm(struct i915_address_space *vm);
>> +int i915_gem_evict_vm(struct i915_address_space *vm,
>> +              struct i915_gem_ww_ctx *ww);
>>     #endif /* __I915_GEM_EVICT_H__ */
>> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
>> index 1f15c3298112..8477cae5f877 100644
>> --- a/drivers/gpu/drm/i915/i915_vma.c
>> +++ b/drivers/gpu/drm/i915/i915_vma.c
>> @@ -1535,7 +1535,12 @@ static int __i915_ggtt_pin(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
>>           /* Unlike i915_vma_pin, we don't take no for an answer! */
>>           flush_idle_contexts(vm->gt);
>>           if (mutex_lock_interruptible(&vm->mutex) == 0) {
>> -            i915_gem_evict_vm(vm);
>> +            /*
>> +             * We pass NULL ww here, as we don't want to unbind
>> +             * locked objects when called from execbuf when pinning
>> +             * is removed. This would probably regress badly.
>> +             */
>> +            i915_gem_evict_vm(vm, NULL);
>>               mutex_unlock(&vm->mutex);
>>           }
>>       } while (1);
>> diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_evict.c b/drivers/gpu/drm/i915/selftests/i915_gem_evict.c
>> index 75b709c26dd3..7c075c16a573 100644
>> --- a/drivers/gpu/drm/i915/selftests/i915_gem_evict.c
>> +++ b/drivers/gpu/drm/i915/selftests/i915_gem_evict.c
>> @@ -331,6 +331,7 @@ static int igt_evict_vm(void *arg)
>>   {
>>       struct intel_gt *gt = arg;
>>       struct i915_ggtt *ggtt = gt->ggtt;
>> +    struct i915_gem_ww_ctx ww;
>>       LIST_HEAD(objects);
>>       int err;
>>   @@ -342,7 +343,7 @@ static int igt_evict_vm(void *arg)
>>         /* Everything is pinned, nothing should happen */
>>       mutex_lock(&ggtt->vm.mutex);
>> -    err = i915_gem_evict_vm(&ggtt->vm);
>> +    err = i915_gem_evict_vm(&ggtt->vm, NULL);
>>       mutex_unlock(&ggtt->vm.mutex);
>>       if (err) {
>>           pr_err("i915_gem_evict_vm on a full GGTT returned err=%d]\n",
>> @@ -352,9 +353,14 @@ static int igt_evict_vm(void *arg)
>>         unpin_ggtt(ggtt);
>>   +    i915_gem_ww_ctx_init(&ww, false);
>>       mutex_lock(&ggtt->vm.mutex);
>> -    err = i915_gem_evict_vm(&ggtt->vm);
>> +    err = i915_gem_evict_vm(&ggtt->vm, &ww);
>>       mutex_unlock(&ggtt->vm.mutex);
>> +
>> +    /* no -EDEADLK handling; can't happen with vm.mutex in place */
>> +    i915_gem_ww_ctx_fini(&ww);
>
> This will break if/when we make vm.mutex a dma_resv ww mutex. Perhaps just use the for_i915_gem_ww macro?
>
> /Thomas
>
>

