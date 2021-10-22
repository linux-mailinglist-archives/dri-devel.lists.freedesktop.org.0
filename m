Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5176A4373D4
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 10:44:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8140E6E900;
	Fri, 22 Oct 2021 08:44:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB65F6E8FE;
 Fri, 22 Oct 2021 08:44:34 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10144"; a="229528088"
X-IronPort-AV: E=Sophos;i="5.87,172,1631602800"; d="scan'208";a="229528088"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 01:44:34 -0700
X-IronPort-AV: E=Sophos;i="5.87,172,1631602800"; d="scan'208";a="484598105"
Received: from dkarner-mobl.ger.corp.intel.com (HELO [10.252.48.154])
 ([10.252.48.154])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 01:44:33 -0700
Subject: Re: [Intel-gfx] [PATCH 18/28] drm/i915: Take trylock during eviction, 
 v2.
To: Matthew Auld <matthew.william.auld@gmail.com>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
References: <20211021103605.735002-1-maarten.lankhorst@linux.intel.com>
 <20211021103605.735002-18-maarten.lankhorst@linux.intel.com>
 <CAM0jSHNq0RrTrG3hjiBz05QEokGS8YN8=YbwQ7UgWm+S=L-0hg@mail.gmail.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <65b5f267-574e-3c9c-b518-c701b821232a@linux.intel.com>
Date: Fri, 22 Oct 2021 10:44:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAM0jSHNq0RrTrG3hjiBz05QEokGS8YN8=YbwQ7UgWm+S=L-0hg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Op 21-10-2021 om 19:59 schreef Matthew Auld:
> On Thu, 21 Oct 2021 at 11:37, Maarten Lankhorst
> <maarten.lankhorst@linux.intel.com> wrote:
>> Now that freeing objects takes the object lock when destroying the
>> backing pages, we can confidently take the object lock even for dead
>> objects.
>>
>> Use this fact to take the object lock in the shrinker, without requiring
>> a reference to the object, so all calls to unbind take the object lock.
>>
>> This is the last step to requiring the object lock for vma_unbind.
> For the eviction what is the reason for only trylock here, assuming we
> are given a ww context? Maybe the back off is annoying? And the full
> lock version comes later?

2 reasons:

1. We can't take the full lock, because we already hold vm->mutex, which may be held inside dma_resv_lock. This inverts the locking, and is also why we could not keep obj->mm.lock. Until locking for vm is reworked, you cannot do this anyway.

Lockdep will complain about the following lock cycle: dma_resv_lock -> vm->mutex -> dma_resv_lock, and will eventually deadlock.

2. Until locking or delayed destroy is reworked, we cannot call a blocking dma_resv_lock for objects in the list when the refcount may be 0.

 "[PATCH 25/28] drm/i915: Require object lock when freeing pages during destruction".

When destroying the object, we will take dma_resv_lock in blocking mode one last time, then unbind all its vma's. The fact we're holding vm->mutex prevents the object from disappearing, because its vma is not yet unbound. This is how we can get away with unbinding dead objects currently, before and after the changes. This also means we can only trylock, because we can only trylock inside vm->mutex.

If we start reworking vm locking, we may need to handle waiting on dead objects better. It's worth noting that TTM has to handle the exact same race, which can be seen inside ttm_bo_cleanup_refs().

>> Changes since v1:
>> - No longer require the refcount, as every freed object now holds the lock
>>   when unbinding VMA's.
>>
>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> ---
>>  drivers/gpu/drm/i915/gem/i915_gem_shrinker.c |  6 ++++
>>  drivers/gpu/drm/i915/i915_gem_evict.c        | 34 +++++++++++++++++---
>>  2 files changed, 35 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
>> index d3f29a66cb36..34c12e5983eb 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
>> @@ -403,12 +403,18 @@ i915_gem_shrinker_vmap(struct notifier_block *nb, unsigned long event, void *ptr
>>         list_for_each_entry_safe(vma, next,
>>                                  &i915->ggtt.vm.bound_list, vm_link) {
>>                 unsigned long count = vma->node.size >> PAGE_SHIFT;
>> +               struct drm_i915_gem_object *obj = vma->obj;
>>
>>                 if (!vma->iomap || i915_vma_is_active(vma))
>>                         continue;
>>
>> +               if (!i915_gem_object_trylock(obj))
>> +                       continue;
>> +
>>                 if (__i915_vma_unbind(vma) == 0)
>>                         freed_pages += count;
>> +
>> +               i915_gem_object_unlock(obj);
>>         }
>>         mutex_unlock(&i915->ggtt.vm.mutex);
>>
>> diff --git a/drivers/gpu/drm/i915/i915_gem_evict.c b/drivers/gpu/drm/i915/i915_gem_evict.c
>> index 2b73ddb11c66..286efa462eca 100644
>> --- a/drivers/gpu/drm/i915/i915_gem_evict.c
>> +++ b/drivers/gpu/drm/i915/i915_gem_evict.c
>> @@ -58,6 +58,9 @@ mark_free(struct drm_mm_scan *scan,
>>         if (i915_vma_is_pinned(vma))
>>                 return false;
>>
>> +       if (!i915_gem_object_trylock(vma->obj))
>> +               return false;
>> +
>>         list_add(&vma->evict_link, unwind);
>>         return drm_mm_scan_add_block(scan, &vma->node);
>>  }
>> @@ -178,6 +181,7 @@ i915_gem_evict_something(struct i915_address_space *vm,
>>         list_for_each_entry_safe(vma, next, &eviction_list, evict_link) {
>>                 ret = drm_mm_scan_remove_block(&scan, &vma->node);
>>                 BUG_ON(ret);
>> +               i915_gem_object_unlock(vma->obj);
>>         }
>>
>>         /*
>> @@ -222,10 +226,12 @@ i915_gem_evict_something(struct i915_address_space *vm,
>>          * of any of our objects, thus corrupting the list).
>>          */
>>         list_for_each_entry_safe(vma, next, &eviction_list, evict_link) {
>> -               if (drm_mm_scan_remove_block(&scan, &vma->node))
>> +               if (drm_mm_scan_remove_block(&scan, &vma->node)) {
>>                         __i915_vma_pin(vma);
>> -               else
>> +               } else {
>>                         list_del(&vma->evict_link);
>> +                       i915_gem_object_unlock(vma->obj);
>> +               }
>>         }
>>
>>         /* Unbinding will emit any required flushes */
>> @@ -234,16 +240,22 @@ i915_gem_evict_something(struct i915_address_space *vm,
>>                 __i915_vma_unpin(vma);
>>                 if (ret == 0)
>>                         ret = __i915_vma_unbind(vma);
>> +
>> +               i915_gem_object_unlock(vma->obj);
>>         }
>>
>>         while (ret == 0 && (node = drm_mm_scan_color_evict(&scan))) {
>>                 vma = container_of(node, struct i915_vma, node);
>>
>> +
>>                 /* If we find any non-objects (!vma), we cannot evict them */
>> -               if (vma->node.color != I915_COLOR_UNEVICTABLE)
>> +               if (vma->node.color != I915_COLOR_UNEVICTABLE &&
>> +                   i915_gem_object_trylock(vma->obj)) {
>>                         ret = __i915_vma_unbind(vma);
>> -               else
>> -                       ret = -ENOSPC; /* XXX search failed, try again? */
>> +                       i915_gem_object_unlock(vma->obj);
>> +               } else {
>> +                       ret = -ENOSPC;
>> +               }
>>         }
>>
>>         return ret;
>> @@ -333,6 +345,11 @@ int i915_gem_evict_for_node(struct i915_address_space *vm,
>>                         break;
>>                 }
>>
>> +               if (!i915_gem_object_trylock(vma->obj)) {
>> +                       ret = -ENOSPC;
>> +                       break;
>> +               }
>> +
>>                 /*
>>                  * Never show fear in the face of dragons!
>>                  *
>> @@ -350,6 +367,8 @@ int i915_gem_evict_for_node(struct i915_address_space *vm,
>>                 __i915_vma_unpin(vma);
>>                 if (ret == 0)
>>                         ret = __i915_vma_unbind(vma);
>> +
>> +               i915_gem_object_unlock(vma->obj);
>>         }
>>
>>         return ret;
>> @@ -393,6 +412,9 @@ int i915_gem_evict_vm(struct i915_address_space *vm)
>>                         if (i915_vma_is_pinned(vma))
>>                                 continue;
>>
>> +                       if (!i915_gem_object_trylock(vma->obj))
>> +                               continue;
>> +
>>                         __i915_vma_pin(vma);
>>                         list_add(&vma->evict_link, &eviction_list);
>>                 }
>> @@ -406,6 +428,8 @@ int i915_gem_evict_vm(struct i915_address_space *vm)
>>                                 ret = __i915_vma_unbind(vma);
>>                         if (ret != -EINTR) /* "Get me out of here!" */
>>                                 ret = 0;
>> +
>> +                       i915_gem_object_unlock(vma->obj);
>>                 }
>>         } while (ret == 0);
>>
>> --
>> 2.33.0
>>

