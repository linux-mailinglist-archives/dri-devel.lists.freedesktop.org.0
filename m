Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2B64921FE
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 10:06:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFA6F1129C7;
	Tue, 18 Jan 2022 09:06:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 617CF1129BC;
 Tue, 18 Jan 2022 09:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642496791; x=1674032791;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yKW0GqdjJtXxS8Mw7KwkmWAjmWaszeLYVWoeiwJQHIQ=;
 b=oJ+vP9QxHaeGdDjdWJqpaNXOxLHUv1N3RR9Bn+PgKvxSrt/Uos3fyMmy
 E1uhArepNpcES9Z8eIPN79k1F76DgsudfhAuQ/GwPbU7eNxVrhlQ7v5pT
 9tPf3HIMVQP7MUDHzNAUaGZCiUvQprFlpfVf7lcfTUDX2m5WzcEIhxNnk
 OSSk9td3msnl02MOM+eFrId4CXLlaFbcqIWQTfj02nHGdI4p3s6UIuTa0
 cqiztawoIwrViN28uQggBuCdC9Zp9RFpHc+C71PRzmvbpiDrncPP6jyJC
 cnQ6X7TdQOfwqz/9OBxn8fw9kyrmbII4qNRvVdQQmbo/idWBNIk0tn1KL g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10230"; a="244729811"
X-IronPort-AV: E=Sophos;i="5.88,297,1635231600"; d="scan'208";a="244729811"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2022 01:06:30 -0800
X-IronPort-AV: E=Sophos;i="5.88,297,1635231600"; d="scan'208";a="764539021"
Received: from jsarha-mobl.ger.corp.intel.com (HELO [10.249.254.210])
 ([10.249.254.210])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2022 01:06:28 -0800
Message-ID: <563dd04b0f29f9e30b47e230d40619c65732c67b.camel@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v7 4/6] drm/i915: Use vma resources for
 async unbinding
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Robert Beckett <bob.beckett@collabora.com>, 
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Date: Tue, 18 Jan 2022 10:06:26 +0100
In-Reply-To: <28186e6b-513b-d380-d72f-0c05862e4a73@collabora.com>
References: <20220110172219.107131-1-thomas.hellstrom@linux.intel.com>
 <20220110172219.107131-5-thomas.hellstrom@linux.intel.com>
 <28186e6b-513b-d380-d72f-0c05862e4a73@collabora.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-2.fc34) 
MIME-Version: 1.0
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
Cc: matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, 2022-01-17 at 21:07 +0000, Robert Beckett wrote:
> 
> 
> On 10/01/2022 17:22, Thomas Hellström wrote:
> > Implement async (non-blocking) unbinding by not syncing the vma
> > before
> > calling unbind on the vma_resource.
> > Add the resulting unbind fence to the object's dma_resv from where
> > it is
> > picked up by the ttm migration code.
> > Ideally these unbind fences should be coalesced with the migration
> > blit
> > fence to avoid stalling the migration blit waiting for unbind, as
> > they
> > can certainly go on in parallel, but since we don't yet have a
> > reasonable data structure to use to coalesce fences and attach the
> > resulting fence to a timeline, we defer that for now.
> > 
> > Note that with async unbinding, even while the unbind waits for the
> > preceding bind to complete before unbinding, the vma itself might
> > have been
> > destroyed in the process, clearing the vma pages. Therefore we can
> > only allow async unbinding if we have a refcounted sg-list and keep
> > a
> > refcount on that for the vma resource pages to stay intact until
> > binding occurs. If this condition is not met, a request for an
> > async
> > unbind is diverted to a sync unbind.
> > 
> > v2:
> > - Use a separate kmem_cache for vma resources for now to isolate
> > their
> >    memory allocation and aid debugging.
> > - Move the check for vm closed to the actual unbinding thread.
> > Regardless
> >    of whether the vm is closed, we need the unbind fence to
> > properly wait
> >    for capture.
> > - Clear vma_res::vm on unbind and update its documentation.
> > v4:
> > - Take cache coloring into account when searching for vma resources
> >    pending unbind. (Matthew Auld)
> > v5:
> > - Fix timeout and error check in
> > i915_vma_resource_bind_dep_await().
> > - Avoid taking a reference on the object for async binding if
> >    async unbind capable.
> > - Fix braces around a single-line if statement.
> > v6:
> > - Fix up the cache coloring adjustment. (Kernel test robot
> > <lkp@intel.com>)
> > - Don't allow async unbinding if the vma_res pages are not the same
> > as
> >    the object pages. (Matthew Auld)
> > v7:
> > - s/unsigned long/u64/ in a number of places (Matthew Auld)
> > 
> > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> > ---
> >   drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c |  11 +-
> >   drivers/gpu/drm/i915/gt/intel_ggtt.c         |   2 +-
> >   drivers/gpu/drm/i915/gt/intel_gtt.c          |   4 +
> >   drivers/gpu/drm/i915/gt/intel_gtt.h          |   3 +
> >   drivers/gpu/drm/i915/i915_drv.h              |   1 +
> >   drivers/gpu/drm/i915/i915_gem.c              |  12 +-
> >   drivers/gpu/drm/i915/i915_module.c           |   3 +
> >   drivers/gpu/drm/i915/i915_vma.c              | 205 +++++++++--
> >   drivers/gpu/drm/i915/i915_vma.h              |   3 +-
> >   drivers/gpu/drm/i915/i915_vma_resource.c     | 354
> > +++++++++++++++++--
> >   drivers/gpu/drm/i915/i915_vma_resource.h     |  48 +++
> >   11 files changed, 579 insertions(+), 67 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> > b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> > index 8653855d808b..1de306c03aaf 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> > @@ -142,7 +142,16 @@ int i915_ttm_move_notify(struct
> > ttm_buffer_object *bo)
> >         struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
> >         int ret;
> >   
> > -       ret = i915_gem_object_unbind(obj,
> > I915_GEM_OBJECT_UNBIND_ACTIVE);
> > +       /*
> > +        * Note: The async unbinding here will actually transform
> > the
> > +        * blocking wait for unbind into a wait before finally
> > submitting
> > +        * evict / migration blit and thus stall the migration
> > timeline
> > +        * which may not be good for overall throughput. We should
> > make
> > +        * sure we await the unbind fences *after* the migration
> > blit
> > +        * instead of *before* as we currently do.
> > +        */
> > +       ret = i915_gem_object_unbind(obj,
> > I915_GEM_OBJECT_UNBIND_ACTIVE |
> > +                                    I915_GEM_OBJECT_UNBIND_ASYNC);
> >         if (ret)
> >                 return ret;
> >   
> > diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c
> > b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> > index e49b6250c4b7..a1b2761bc16e 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> > @@ -142,7 +142,7 @@ void i915_ggtt_suspend_vm(struct
> > i915_address_space *vm)
> >                         continue;
> >   
> >                 if (!i915_vma_is_bound(vma, I915_VMA_GLOBAL_BIND))
> > {
> > -                       __i915_vma_evict(vma);
> > +                       __i915_vma_evict(vma, false);
> >                         drm_mm_remove_node(&vma->node);
> >                 }
> >         }
> > diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c
> > b/drivers/gpu/drm/i915/gt/intel_gtt.c
> > index a94be0306464..46be4197b93f 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_gtt.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
> > @@ -161,6 +161,9 @@ static void __i915_vm_release(struct
> > work_struct *work)
> >         struct i915_address_space *vm =
> >                 container_of(work, struct i915_address_space,
> > release_work);
> >   
> > +       /* Synchronize async unbinds. */
> > +       i915_vma_resource_bind_dep_sync_all(vm);
> > +
> >         vm->cleanup(vm);
> >         i915_address_space_fini(vm);
> >   
> > @@ -189,6 +192,7 @@ void i915_address_space_init(struct
> > i915_address_space *vm, int subclass)
> >         if (!kref_read(&vm->resv_ref))
> >                 kref_init(&vm->resv_ref);
> >   
> > +       vm->pending_unbind = RB_ROOT_CACHED;
> >         INIT_WORK(&vm->release_work, __i915_vm_release);
> >         atomic_set(&vm->open, 1);
> >   
> > diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h
> > b/drivers/gpu/drm/i915/gt/intel_gtt.h
> > index 676b839d1a34..8073438b67c8 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_gtt.h
> > +++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
> > @@ -265,6 +265,9 @@ struct i915_address_space {
> >         /* Flags used when creating page-table objects for this vm
> > */
> >         unsigned long lmem_pt_obj_flags;
> >   
> > +       /* Interval tree for pending unbind vma resources */
> > +       struct rb_root_cached pending_unbind;
> > +
> >         struct drm_i915_gem_object *
> >                 (*alloc_pt_dma)(struct i915_address_space *vm, int
> > sz);
> >         struct drm_i915_gem_object *
> > diff --git a/drivers/gpu/drm/i915/i915_drv.h
> > b/drivers/gpu/drm/i915/i915_drv.h
> > index a44e0c3298fc..6caec2eca8cd 100644
> > --- a/drivers/gpu/drm/i915/i915_drv.h
> > +++ b/drivers/gpu/drm/i915/i915_drv.h
> > @@ -1661,6 +1661,7 @@ int i915_gem_object_unbind(struct
> > drm_i915_gem_object *obj,
> >   #define I915_GEM_OBJECT_UNBIND_BARRIER BIT(1)
> >   #define I915_GEM_OBJECT_UNBIND_TEST BIT(2)
> >   #define I915_GEM_OBJECT_UNBIND_VM_TRYLOCK BIT(3)
> > +#define I915_GEM_OBJECT_UNBIND_ASYNC BIT(4)
> >   
> >   void i915_gem_runtime_suspend(struct drm_i915_private *dev_priv);
> >   
> > diff --git a/drivers/gpu/drm/i915/i915_gem.c
> > b/drivers/gpu/drm/i915/i915_gem.c
> > index 3729ec01b5bc..7188db42c85b 100644
> > --- a/drivers/gpu/drm/i915/i915_gem.c
> > +++ b/drivers/gpu/drm/i915/i915_gem.c
> > @@ -157,10 +157,16 @@ int i915_gem_object_unbind(struct
> > drm_i915_gem_object *obj,
> >                 spin_unlock(&obj->vma.lock);
> >   
> >                 if (vma) {
> > +                       bool vm_trylock = !!(flags &
> > I915_GEM_OBJECT_UNBIND_VM_TRYLOCK);
> >                         ret = -EBUSY;
> > -                       if (flags & I915_GEM_OBJECT_UNBIND_ACTIVE
> > ||
> > -                           !i915_vma_is_active(vma)) {
> > -                               if (flags &
> > I915_GEM_OBJECT_UNBIND_VM_TRYLOCK) {
> > +                       if (flags & I915_GEM_OBJECT_UNBIND_ASYNC) {
> > +                               assert_object_held(vma->obj);
> > +                               ret = i915_vma_unbind_async(vma,
> > vm_trylock);
> > +                       }
> > +
> > +                       if (ret == -EBUSY && (flags &
> > I915_GEM_OBJECT_UNBIND_ACTIVE ||
> > +                                            
> > !i915_vma_is_active(vma))) {
> > +                               if (vm_trylock) {
> >                                         if (mutex_trylock(&vma->vm-
> > >mutex)) {
> >                                                 ret =
> > __i915_vma_unbind(vma);
> >                                                 mutex_unlock(&vma-
> > >vm->mutex);
> > diff --git a/drivers/gpu/drm/i915/i915_module.c
> > b/drivers/gpu/drm/i915/i915_module.c
> > index f6bcd2f89257..a8f175960b34 100644
> > --- a/drivers/gpu/drm/i915/i915_module.c
> > +++ b/drivers/gpu/drm/i915/i915_module.c
> > @@ -17,6 +17,7 @@
> >   #include "i915_scheduler.h"
> >   #include "i915_selftest.h"
> >   #include "i915_vma.h"
> > +#include "i915_vma_resource.h"
> >   
> >   static int i915_check_nomodeset(void)
> >   {
> > @@ -64,6 +65,8 @@ static const struct {
> >           .exit = i915_scheduler_module_exit },
> >         { .init = i915_vma_module_init,
> >           .exit = i915_vma_module_exit },
> > +       { .init = i915_vma_resource_module_init,
> > +         .exit = i915_vma_resource_module_exit },
> >         { .init = i915_mock_selftests },
> >         { .init = i915_pmu_init,
> >           .exit = i915_pmu_exit },
> > diff --git a/drivers/gpu/drm/i915/i915_vma.c
> > b/drivers/gpu/drm/i915/i915_vma.c
> > index 29c770a764aa..5881b0713b1a 100644
> > --- a/drivers/gpu/drm/i915/i915_vma.c
> > +++ b/drivers/gpu/drm/i915/i915_vma.c
> > @@ -286,9 +286,10 @@ struct i915_vma_work {
> >         struct dma_fence_work base;
> >         struct i915_address_space *vm;
> >         struct i915_vm_pt_stash stash;
> > -       struct i915_vma *vma;
> > +       struct i915_vma_resource *vma_res;
> >         struct drm_i915_gem_object *pinned;
> >         struct i915_sw_dma_fence_cb cb;
> > +       struct i915_refct_sgt *rsgt;
> >         enum i915_cache_level cache_level;
> >         unsigned int flags;
> >   };
> > @@ -296,10 +297,11 @@ struct i915_vma_work {
> >   static void __vma_bind(struct dma_fence_work *work)
> >   {
> >         struct i915_vma_work *vw = container_of(work, typeof(*vw),
> > base);
> > -       struct i915_vma *vma = vw->vma;
> > +       struct i915_vma_resource *vma_res = vw->vma_res;
> > +
> > +       vma_res->ops->bind_vma(vma_res->vm, &vw->stash,
> > +                              vma_res, vw->cache_level, vw-
> > >flags);
> >   
> > -       vma->ops->bind_vma(vw->vm, &vw->stash,
> > -                          vma->resource, vw->cache_level, vw-
> > >flags);
> >   }
> >   
> >   static void __vma_release(struct dma_fence_work *work)
> > @@ -311,6 +313,10 @@ static void __vma_release(struct
> > dma_fence_work *work)
> >   
> >         i915_vm_free_pt_stash(vw->vm, &vw->stash);
> >         i915_vm_put(vw->vm);
> > +       if (vw->vma_res)
> > +               i915_vma_resource_put(vw->vma_res);
> > +       if (vw->rsgt)
> > +               i915_refct_sgt_put(vw->rsgt);
> >   }
> >   
> >   static const struct dma_fence_work_ops bind_ops = {
> > @@ -380,13 +386,11 @@ i915_vma_resource_init_from_vma(struct
> > i915_vma_resource *vma_res,
> >   {
> >         struct drm_i915_gem_object *obj = vma->obj;
> >   
> > -       i915_vma_resource_init(vma_res, vma->pages, &vma-
> > >page_sizes,
> > +       i915_vma_resource_init(vma_res, vma->vm, vma->pages, &vma-
> > >page_sizes,
> >                                i915_gem_object_is_readonly(obj),
> >                                i915_gem_object_is_lmem(obj),
> > -                              vma->private,
> > -                              vma->node.start,
> > -                              vma->node.size,
> > -                              vma->size);
> > +                              vma->ops, vma->private, vma-
> > >node.start,
> > +                              vma->node.size, vma->size);
> >   }
> >   
> >   /**
> > @@ -410,6 +414,7 @@ int i915_vma_bind(struct i915_vma *vma,
> >   {
> >         u32 bind_flags;
> >         u32 vma_flags;
> > +       int ret;
> >   
> >         lockdep_assert_held(&vma->vm->mutex);
> >         GEM_BUG_ON(!drm_mm_node_allocated(&vma->node));
> > @@ -418,12 +423,12 @@ int i915_vma_bind(struct i915_vma *vma,
> >         if (GEM_DEBUG_WARN_ON(range_overflows(vma->node.start,
> >                                               vma->node.size,
> >                                               vma->vm->total))) {
> > -               kfree(vma_res);
> > +               i915_vma_resource_free(vma_res);
> >                 return -ENODEV;
> >         }
> >   
> >         if (GEM_DEBUG_WARN_ON(!flags)) {
> > -               kfree(vma_res);
> > +               i915_vma_resource_free(vma_res);
> >                 return -EINVAL;
> >         }
> >   
> > @@ -435,12 +440,30 @@ int i915_vma_bind(struct i915_vma *vma,
> >   
> >         bind_flags &= ~vma_flags;
> >         if (bind_flags == 0) {
> > -               kfree(vma_res);
> > +               i915_vma_resource_free(vma_res);
> >                 return 0;
> >         }
> >   
> >         GEM_BUG_ON(!atomic_read(&vma->pages_count));
> >   
> > +       /* Wait for or await async unbinds touching our range */
> > +       if (work && bind_flags & vma->vm->bind_async_flags)
> > +               ret = i915_vma_resource_bind_dep_await(vma->vm,
> > +                                                      &work-
> > >base.chain,
> > +                                                      vma-
> > >node.start,
> > +                                                      vma-
> > >node.size,
> > +                                                      true,
> > +                                                      GFP_NOWAIT |
> > +                                                     
> > __GFP_RETRY_MAYFAIL |
> > +                                                     
> > __GFP_NOWARN);
> > +       else
> > +               ret = i915_vma_resource_bind_dep_sync(vma->vm, vma-
> > >node.start,
> > +                                                     vma-
> > >node.size, true);
> > +       if (ret) {
> > +               i915_vma_resource_free(vma_res);
> > +               return ret;
> > +       }
> > +
> >         if (vma->resource || !vma_res) {
> >                 /* Rebinding with an additional I915_VMA_*_BIND */
> >                 GEM_WARN_ON(!vma_flags);
> 
> You missed an extra `kfree(vma_res)` on the next line from here (not
> in 
> patch context), which would presumably need to be 
> `i915_vma_resource_free(vma_res)`

It should, thanks. I see I've missed that in an error path as well, as
you mention below.

> 
> Further to that, you are freeing it where it can already be known to
> be 
> null, which, while relying on known zero side effect of double free
> will 
> work, looks very unintuitive.

This stems from NULL checking before kfree() is typically not done.
IIRC even checkpatch.pl warns if doing that, but with transition to
kmem_cache_free() that doesn't hold anymore so I need to fix this up.

> 
> Firther to that, once this series is applied, `i915_vma_bind` only 
> appears to be called from `eb_relocate_entry()` with `vma_res` always
> null, and from `i915_vma_pin_ww()` where it allocates `vma_res`.
> 
> It would be much cleaner to just allocate the `vma_res` in 
> `i915_vma_bind` if required. That way it will avoid the null
> asignment 
> on return to `i915_vma_pin_ww` with the equally unintuitive 
> `kfree(vma_res)` during the error fallthrough path at the end of 
> `i915_vma_pin_ww` on a knowingly null pointer (also that would need
> to 
> be a `i915_vma_resource_free` if you keep it the way it is).

We can't allocate (GFP_KERNEL) under the vm mutex, hence need to pass
it as an argument.

Thanks,
Thomas


