Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B0656BBEC
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 16:52:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEE9F10E479;
	Fri,  8 Jul 2022 14:52:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACCDA10E46A;
 Fri,  8 Jul 2022 14:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657291938; x=1688827938;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=fTiX9LLToGjKiTKsc4hlVirsQEJRUD17JE5wCDp7DVs=;
 b=TlJl7WGb81oB3iDba+ApWscZ3RluAxMZrycJ0CYXkrW7NlOZWyXdT6nm
 ON211S46Lda0UAxDMG3vcqhbEdGjoGbFdpPgV6/pj3opaDY9CKE6EZ02E
 xKUYWNErVbT5EQ1v2IGYkFrGHjRVOugTbnktIx3IhalPhqVNR/WW9lnZI
 YMLPURSsp1Vzp+38SoNQN9fb5smMwo6DbHf2MXITTTPMqAJ+yC72LOE+8
 nNi02u+ZRMXfs0GUqBXJ8gREWzVhuuxdgwj0QWr2Jftib4IlbMvn8gIpw
 gjvt+IEXcdoK9+tVyRIYTuB18tB4AKg7Wes9ZldCszetU4rCGBgIN1ndw A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10401"; a="283046760"
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; d="scan'208";a="283046760"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2022 07:52:17 -0700
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; d="scan'208";a="544230022"
Received: from nvishwa1-desk.sc.intel.com (HELO nvishwa1-DESK) ([172.25.29.76])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2022 07:52:17 -0700
Date: Fri, 8 Jul 2022 07:51:58 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
Subject: Re: [RFC 08/10] drm/i915/vm_bind: userptr dma-resv changes
Message-ID: <20220708145157.GX14039@nvishwa1-DESK>
References: <20220701225055.8204-1-niranjana.vishwanathapura@intel.com>
 <20220701225055.8204-9-niranjana.vishwanathapura@intel.com>
 <d1c8cd2c44c07ebc7053f192100bf0ee5aa67140.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <d1c8cd2c44c07ebc7053f192100bf0ee5aa67140.camel@intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: "Brost, Matthew" <matthew.brost@intel.com>, "Zanoni,
 Paulo R" <paulo.r.zanoni@intel.com>, "Landwerlin,
 Lionel G" <lionel.g.landwerlin@intel.com>, "Ursulin,
 Tvrtko" <tvrtko.ursulin@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Auld,
 Matthew" <matthew.auld@intel.com>,
 "jason@jlekstrand.net" <jason@jlekstrand.net>, "Vetter,
 Daniel" <daniel.vetter@intel.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 07, 2022 at 06:11:13AM -0700, Hellstrom, Thomas wrote:
>On Fri, 2022-07-01 at 15:50 -0700, Niranjana Vishwanathapura wrote:
>> For persistent (vm_bind) vmas of userptr BOs, handle the user
>> page pinning by using the i915_gem_object_userptr_submit_init()
>> /done() functions
>>
>> Signed-off-by: Niranjana Vishwanathapura
>> <niranjana.vishwanathapura@intel.com>
>> ---
>>  .../gpu/drm/i915/gem/i915_gem_execbuffer3.c   | 67
>> +++++++++++++++++++
>>  .../drm/i915/gem/i915_gem_vm_bind_object.c    | 16 +++++
>>  drivers/gpu/drm/i915/gt/intel_gtt.c           |  1 +
>>  drivers/gpu/drm/i915/gt/intel_gtt.h           |  1 +
>>  4 files changed, 85 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c
>> b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c
>> index 2079f5ca9010..bf13dd6d642e 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c
>> @@ -22,6 +22,7 @@
>>  #include "i915_gem_vm_bind.h"
>>  #include "i915_trace.h"
>>
>> +#define __EXEC3_USERPTR_USED           BIT_ULL(34)
>>  #define __EXEC3_HAS_PIN                        BIT_ULL(33)
>>  #define __EXEC3_ENGINE_PINNED          BIT_ULL(32)
>>  #define __EXEC3_INTERNAL_FLAGS         (~0ull << 32)
>> @@ -147,10 +148,36 @@ static void eb_scoop_unbound_vmas(struct
>> i915_address_space *vm)
>>         spin_unlock(&vm->vm_rebind_lock);
>>  }
>>
>> +static int eb_lookup_persistent_userptr_vmas(struct i915_execbuffer
>> *eb)
>> +{
>> +       struct i915_address_space *vm = eb->context->vm;
>> +       struct i915_vma *last_vma = NULL;
>> +       struct i915_vma *vma;
>> +       int err;
>> +
>> +       assert_vm_bind_held(vm);
>> +
>> +       list_for_each_entry(vma, &vm->vm_bind_list, vm_bind_link) {
>> +               if (i915_gem_object_is_userptr(vma->obj)) {
>> +                       err =
>> i915_gem_object_userptr_submit_init(vma->obj);
>> +                       if (err)
>> +                               return err;
>> +
>> +                       last_vma = vma;
>> +               }
>> +       }
>> +
>
>Don't we need to loop also over non-private userptr objects?

No, as explained in other thread, non-private BOs will also be
there in vm_bind/bound_list.

>
>
>> +       if (last_vma)
>> +               eb->args->flags |= __EXEC3_USERPTR_USED;
>> +
>> +       return 0;
>> +}
>> +
>>  static int eb_lookup_vmas(struct i915_execbuffer *eb)
>>  {
>>         unsigned int i, current_batch = 0;
>>         struct i915_vma *vma;
>> +       int err = 0;
>>
>>         for (i = 0; i < eb->num_batches; i++) {
>>                 vma = eb_find_vma(eb->context->vm, eb-
>> >batch_addresses[i]);
>> @@ -163,6 +190,10 @@ static int eb_lookup_vmas(struct i915_execbuffer
>> *eb)
>>
>>         eb_scoop_unbound_vmas(eb->context->vm);
>>
>> +       err = eb_lookup_persistent_userptr_vmas(eb);
>> +       if (err)
>> +               return err;
>> +
>>         return 0;
>>  }
>>
>> @@ -358,15 +389,51 @@ static void
>> eb_persistent_vmas_move_to_active(struct i915_execbuffer *eb)
>>
>>  static int eb_move_to_gpu(struct i915_execbuffer *eb)
>>  {
>> +       int err = 0, j;
>> +
>>         assert_vm_bind_held(eb->context->vm);
>>         assert_vm_priv_held(eb->context->vm);
>>
>>         eb_persistent_vmas_move_to_active(eb);
>>
>> +#ifdef CONFIG_MMU_NOTIFIER
>> +       if (!err && (eb->args->flags & __EXEC3_USERPTR_USED)) {
>> +               struct i915_vma *vma;
>> +
>> +               assert_vm_bind_held(eb->context->vm);
>> +               assert_vm_priv_held(eb->context->vm);
>> +
>> +               read_lock(&eb->i915->mm.notifier_lock);
>> +               list_for_each_entry(vma, &eb->context->vm-
>> >vm_bind_list,
>> +                                   vm_bind_link) {
>> +                       if (!i915_gem_object_is_userptr(vma->obj))
>> +                               continue;
>> +
>> +                       err =
>> i915_gem_object_userptr_submit_done(vma->obj);
>> +                       if (err)
>> +                               break;
>> +               }
>> +
>> +               read_unlock(&eb->i915->mm.notifier_lock);
>> +       }
>
>Since we don't loop over the vm_bound_list, there is a need to check
>whether the rebind_list is empty here under the notifier_lock in read
>mode, and in that case, restart from eb_lookup_vmas(). That might also
>eliminate the need for the __EXEC3_USERPTR_USED flag?
>
>That will also catch any objects that were evicted between
>eb_lookup_vmas() where the rebind_list was last checked, and
>i915_gem_vm_priv_lock(), which prohibits further eviction, but if we
>want to catch these earlier (which I think is a good idea), we could
>check that the rebind_list is indeed empty just after taking the
>vm_priv_lock(), and if not, restart from eb_lookup_vmas().

Yah, right, we need to check rebind_list here and if not empty, restart
from lookup phase.
It is bit tricky with userptr here as the unbind happens during
submit_init() call after we scoop unbound vmas here, the vmas gets
re-added to rebind_list :(.
I think we need a separate 'invalidated_userptr_list' here and we
iterate through it for submit_init() and submit_done() calls (yes,
__EXEC3_USERPTR_USED flag won't be needed then).
And, we call, eb_scoop_unbound_vmas() after calling
eb_lookup_persistent_userptr_vmas(), so that we scoop all unbound
vmas properly.

>
>
>> +#endif
>> +
>> +       if (unlikely(err))
>> +               goto err_skip;
>> +
>>         /* Unconditionally flush any chipset caches (for streaming
>> writes). */
>>         intel_gt_chipset_flush(eb->gt);
>>
>>         return 0;
>> +
>> +err_skip:
>> +       for_each_batch_create_order(eb, j) {
>> +               if (!eb->requests[j])
>> +                       break;
>> +
>> +               i915_request_set_error_once(eb->requests[j], err);
>> +       }
>> +       return err;
>>  }
>>
>>  static int eb_request_submit(struct i915_execbuffer *eb,
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>> b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>> index 1a8efa83547f..cae282b91618 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>> @@ -263,6 +263,12 @@ int i915_gem_vm_bind_obj(struct
>> i915_address_space *vm,
>>                 goto put_obj;
>>         }
>>
>> +       if (i915_gem_object_is_userptr(obj)) {
>> +               ret = i915_gem_object_userptr_submit_init(obj);
>> +               if (ret)
>> +                       goto put_obj;
>> +       }
>> +
>>         ret = i915_gem_vm_bind_lock_interruptible(vm);
>>         if (ret)
>>                 goto put_obj;
>> @@ -295,6 +301,16 @@ int i915_gem_vm_bind_obj(struct
>> i915_address_space *vm,
>>         /* Make it evictable */
>>         __i915_vma_unpin(vma);
>>
>> +#ifdef CONFIG_MMU_NOTIFIER
>> +       if (i915_gem_object_is_userptr(obj)) {
>> +               write_lock(&vm->i915->mm.notifier_lock);
>
>Why do we need the lock in write mode here?

Looks like it was no intentional. Should switch to read_lock here.

Niranjana

>
>> +               ret = i915_gem_object_userptr_submit_done(obj);
>> +               write_unlock(&vm->i915->mm.notifier_lock);
>> +               if (ret)
>> +                       goto out_ww;
>> +       }
>> +#endif
>> +
>>         list_add_tail(&vma->vm_bind_link, &vm->vm_bound_list);
>>         i915_vm_bind_it_insert(vma, &vm->va);
>>         if (!obj->priv_root)
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c
>> b/drivers/gpu/drm/i915/gt/intel_gtt.c
>> index 55d5389b2c6c..4ab3bda644ff 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gtt.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
>> @@ -295,6 +295,7 @@ void i915_address_space_init(struct
>> i915_address_space *vm, int subclass)
>>         GEM_BUG_ON(IS_ERR(vm->root_obj));
>>         INIT_LIST_HEAD(&vm->vm_rebind_list);
>>         spin_lock_init(&vm->vm_rebind_lock);
>> +       INIT_LIST_HEAD(&vm->invalidate_link);
>>  }
>>
>>  void *__px_vaddr(struct drm_i915_gem_object *p)
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h
>> b/drivers/gpu/drm/i915/gt/intel_gtt.h
>> index fe5485c4a1cd..f9edf11c144f 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gtt.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
>> @@ -267,6 +267,7 @@ struct i915_address_space {
>>         struct list_head vm_bound_list;
>>         struct list_head vm_rebind_list;
>>         spinlock_t vm_rebind_lock;   /* Protects vm_rebind_list */
>> +       struct list_head invalidate_link;
>>         /* va tree of persistent vmas */
>>         struct rb_root_cached va;
>>         struct list_head non_priv_vm_bind_list;
>
