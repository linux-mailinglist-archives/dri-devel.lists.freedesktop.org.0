Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A549557377
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 09:02:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5836113AE1;
	Thu, 23 Jun 2022 07:02:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B59C113ADF;
 Thu, 23 Jun 2022 07:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655967731; x=1687503731;
 h=message-id:subject:from:to:cc:in-reply-to:references:
 mime-version:date:content-transfer-encoding;
 bh=C7HFRCtwfuOcJ3nO/c4kKsctIAHIf/OpuiU7L/gEY6M=;
 b=iYej17G5aNiShfq3miIKDagBwF6EcJ+ssBF2ybC0hpsEhvaNV93gzUkH
 QqiY7qgD4NHF4BR1Sdgam5i4EBhl2KE8E+J1Gv8tvT4DRoR4aDIc/cvXP
 uh4aEzMTuTy+QjxaYnF0ra9aeedjOVCT1FdKCjvIJ36ocwy08pHd6Xq4S
 Fg7QDs7cqIo0klpUxk7olohlDzY359Xe/veBMIeV2b7ZFTPv3S0ghGQ9B
 7dJ8+n+dSGZ1CWRckHFXTf1YhVsvKPioLSDmr8tLM4L8xieu8sHSh4nh/
 aMH5GYVBRpT2XNmYuTGUJSVgaxKUmbnjAomGIrkUP1OKvDygOUqWnjfcK A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10386"; a="279412342"
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; d="scan'208";a="279412342"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2022 00:02:11 -0700
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; d="scan'208";a="677935662"
Received: from wterliko-mobl.ger.corp.intel.com (HELO [10.249.254.158])
 ([10.249.254.158])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2022 00:02:06 -0700
Message-ID: <142c82a44dc1ea6ec1d501d783679c3a513282b5.camel@linux.intel.com>
Subject: Re: [PATCH v2 10/12] drm/i915/ttm: handle blitter failure on DG2
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
In-Reply-To: <20220621104434.190962-11-matthew.auld@intel.com>
References: <20220621104434.190962-1-matthew.auld@intel.com>
 <20220621104434.190962-11-matthew.auld@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Date: Thu, 23 Jun 2022 09:00:53 +0200
User-Agent: Evolution 3.40.4 (3.40.4-5.fc34) 
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jordan Justen <jordan.l.justen@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Kenneth Graunke <kenneth@whitecape.org>,
 Jon Bloomfield <jon.bloomfield@intel.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2022-06-21 at 11:44 +0100, Matthew Auld wrote:
> If the move or clear operation somehow fails, and the memory
> underneath
> is not cleared, like when moving to lmem, then we currently fallback
> to
> memcpy or memset. However with small-BAR systems this fallback might
> no
> longer be possible. For now we use the set_wedged sledgehammer if we
> ever encounter such a scenario, and mark the object as borked to plug
> any holes where access to the memory underneath can happen. Add some
> basic selftests to exercise this.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: Jon Bloomfield <jon.bloomfield@intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Jordan Justen <jordan.l.justen@intel.com>
> Cc: Kenneth Graunke <kenneth@whitecape.org>
> Cc: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_object.c    |  2 +
>  .../gpu/drm/i915/gem/i915_gem_object_types.h  | 17 ++++
>  drivers/gpu/drm/i915/gem/i915_gem_ttm.c       | 17 +++-
>  drivers/gpu/drm/i915/gem/i915_gem_ttm.h       |  5 +
>  drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c  | 84 ++++++++++++++---
>  drivers/gpu/drm/i915/gem/i915_gem_ttm_move.h  |  1 +
>  .../drm/i915/gem/selftests/i915_gem_migrate.c | 94 ++++++++++++++---
> --
>  .../drm/i915/gem/selftests/i915_gem_mman.c    | 54 +++++++++++
>  drivers/gpu/drm/i915/i915_vma.c               | 25 ++---
>  9 files changed, 248 insertions(+), 51 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c
> b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> index 06b1b188ce5a..741d7df4e6ff 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> @@ -783,6 +783,8 @@ int i915_gem_object_wait_moving_fence(struct
> drm_i915_gem_object *obj,
>                                     intr, MAX_SCHEDULE_TIMEOUT);
>         if (!ret)
>                 ret = -ETIME;
> +       else if (ret > 0 && obj->mm.ttm_unknown_state)
> +               ret = -EIO;
>  

Ah, Now I see why this function didn't error when the moving fence
signaled with error, Christian's adaption to the new dma-resv semantics
simply ditched that check :/. We possibly might need to reinstate that.
(See later discussion on ttm_unknown_state).

Also strictly here, I think we need an smp_rmb() between reading
ttm_unkown_state and reading the fence signaled status, so that they
don't get reordered when reading. That smp_rmb() would then pair with
the test_and_set_bit() in dma_fence_signal_timestamp_locked().

Strictly this is against our locking policies; if that barrier is
indeed needed that's possibly a flaw in the dma_fence_signaled code, in
that if that function returns a signaled status it should imply acquire
barrier semantics.


>         return ret < 0 ? ret : 0;
>  }
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> index 2c88bdb8ff7c..40449e384038 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> @@ -547,6 +547,23 @@ struct drm_i915_gem_object {
>                  */
>                 bool ttm_shrinkable;
>  
> +               /**
> +                * @ttm_unknown_state: Indicate that the object is
> effectively
> +                * borked. This is write-once and set if we somehow
> encounter a
> +                * fatal error when moving/clearing the pages, and we
> are not
> +                * able to fallback to memcpy/memset, like on small-
> BAR systems.
> +                * The GPU should also be wedged (or in the process)
> at this
> +                * point.
> +                *
> +                * Only valid to read this after acquiring the dma-
> resv lock and
> +                * waiting for all DMA_RESV_USAGE_KERNEL fences to be
> signalled,
> +                * or if we otherwise know that the moving fence has
> signalled,
> +                * and we are certain the pages underneath are valid
> for
> +                * immediate access (under normal operation), like
> just prior to
> +                * binding the object or when setting up the CPU
> fault handler.
> +                */
> +               bool ttm_unknown_state;
> +
>                 /**
>                  * Priority list of potential placements for this
> object.
>                  */
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> index 4c25d9b2f138..8fc03b5a1d4e 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -266,8 +266,7 @@ static const struct i915_refct_sgt_ops
> tt_rsgt_ops = {
>         .release = i915_ttm_tt_release
>  };
>  
> -static inline bool
> -i915_gem_object_needs_ccs_pages(struct drm_i915_gem_object *obj)
> +bool i915_gem_object_needs_ccs_pages(struct drm_i915_gem_object
> *obj)

Add kerneldoc when becomes extern?

>  {
>         bool lmem_placement = false;
>         int i;
> @@ -675,7 +674,7 @@ static void i915_ttm_swap_notify(struct
> ttm_buffer_object *bo)
>                 i915_ttm_purge(obj);
>  }
>  
> -static bool i915_ttm_resource_mappable(struct ttm_resource *res)
> +bool i915_ttm_resource_mappable(struct ttm_resource *res)
>  {

Same here?

>         struct i915_ttm_buddy_resource *bman_res =
> to_ttm_buddy_resource(res);
>  
> @@ -1054,8 +1053,16 @@ static vm_fault_t vm_fault_ttm(struct vm_fault
> *vmf)
>         }
>  
>         if (drm_dev_enter(dev, &idx)) {
> -               ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma-
> >vm_page_prot,
> -                                             
> TTM_BO_VM_NUM_PREFAULT);
> +               /*
> +                * Ensure we check for any fatal errors if we had to
> move/clear
> +                * the object. The device should already be wedged if
> we hit
> +                * such an error.
> +                */
> +               if (i915_gem_object_wait_moving_fence(obj, true))
> +                       ret = VM_FAULT_SIGBUS;

We should check with Christian here whether it's ok to export
ttm_bo_vm_fault_idle() as a helper, so that we release the proper locks
while waiting. The above is not a bug, but causes us to wait for the
moving fence under the mmap_lock, which is considered bad.


> +               else
> +                       ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma-
> >vm_page_prot,
> +                                                     
> TTM_BO_VM_NUM_PREFAULT);
>                 drm_dev_exit(idx);
>         } else {
>                 ret = ttm_bo_vm_dummy_page(vmf, vmf->vma-
> >vm_page_prot);
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.h
> b/drivers/gpu/drm/i915/gem/i915_gem_ttm.h
> index 73e371aa3850..907803930f44 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.h
> @@ -69,6 +69,8 @@ void i915_ttm_adjust_lru(struct drm_i915_gem_object
> *obj);
>  
>  int i915_ttm_purge(struct drm_i915_gem_object *obj);
>  
> +bool i915_gem_object_needs_ccs_pages(struct drm_i915_gem_object
> *obj);
> +
>  /**
>   * i915_ttm_gtt_binds_lmem - Should the memory be viewed as LMEM by
> the GTT?
>   * @mem: struct ttm_resource representing the memory.
> @@ -92,4 +94,7 @@ static inline bool i915_ttm_cpu_maps_iomem(struct
> ttm_resource *mem)
>         /* Once / if we support GGTT, this is also false for cached
> ttm_tts */
>         return mem->mem_type != I915_PL_SYSTEM;
>  }
> +
> +bool i915_ttm_resource_mappable(struct ttm_resource *res);
> +
>  #endif
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> index a10716f4e717..60b34dbb14f8 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> @@ -33,6 +33,7 @@
>  #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
>  static bool fail_gpu_migration;
>  static bool fail_work_allocation;
> +static bool ban_memcpy;
>  
>  void i915_ttm_migrate_set_failure_modes(bool gpu_migration,
>                                         bool work_allocation)
> @@ -40,6 +41,11 @@ void i915_ttm_migrate_set_failure_modes(bool
> gpu_migration,
>         fail_gpu_migration = gpu_migration;
>         fail_work_allocation = work_allocation;
>  }
> +
> +void i915_ttm_migrate_set_ban_memcpy(bool ban)
> +{
> +       ban_memcpy = ban;
> +}
>  #endif
>  
>  static enum i915_cache_level
> @@ -258,15 +264,23 @@ struct i915_ttm_memcpy_arg {
>   * from the callback for lockdep reasons.
>   * @cb: Callback for the accelerated migration fence.
>   * @arg: The argument for the memcpy functionality.
> + * @i915: The i915 pointer.
> + * @obj: The GEM object.
> + * @memcpy_allowed: Instead of processing the @arg, and falling back
> to memcpy
> + * or memset, we wedge the device and set the @obj
> ttm_unknown_state, to prevent
> + * further access to the object with the CPU or GPU.  On some
> devices we might
> + * only be permitted to use the blitter engine for such operations.
>   */
>  struct i915_ttm_memcpy_work {
>         struct dma_fence fence;
>         struct work_struct work;
> -       /* The fence lock */
>         spinlock_t lock;
>         struct irq_work irq_work;
>         struct dma_fence_cb cb;
>         struct i915_ttm_memcpy_arg arg;
> +       struct drm_i915_private *i915;
> +       struct drm_i915_gem_object *obj;

Strictly, it's the ttm resource rather than the gem object that carries
the "unknown" state. Due to pipelined moves it is not obvious that the
object is even associated with the resource anymore when the memcpy
work is actually executed, even if it were when it was scheduled. Would
it make sense to attach the "unknown status" bool to the refcounted sg-
table instead, since we're lacking a subclassed i915_ttm_resource?


> +       bool memcpy_allowed;
>  };
>  
>  static void i915_ttm_move_memcpy(struct i915_ttm_memcpy_arg *arg)
> @@ -319,12 +333,27 @@ static void __memcpy_work(struct work_struct
> *work)
>         struct i915_ttm_memcpy_arg *arg = &copy_work->arg;
>         bool cookie = dma_fence_begin_signalling();
>  
> -       i915_ttm_move_memcpy(arg);
> +       if (copy_work->memcpy_allowed) {
> +               i915_ttm_move_memcpy(arg);
> +       } else {
> +               /*
> +                * Prevent further use of the object. Any future GTT
> binding or
> +                * CPU access is not allowed once we signal the
> fence. Outside
> +                * of the fence critical section, we then also then
> wedge the gpu
> +                * to indicate the device is not functional.
> +                */
> +               copy_work->obj->mm.ttm_unknown_state = true;
> +       }
> +
>         dma_fence_end_signalling(cookie);
>  
>         dma_fence_signal(&copy_work->fence);
>  
> +       if (!copy_work->memcpy_allowed)
> +               intel_gt_set_wedged(&copy_work->i915->gt0);
> +

I think we need to move this to before dma_fence_signal(). However, due
to incorrect locking priming (reset_mutex->dma_fence_signalling), it
must be after dma_fence_end_signalling() for now to not cause that
locking splat we discussed before. As a follow-up we should really fix
that locking annotation.

Also do we need to wedge all gts?


>         i915_ttm_memcpy_release(arg);
> +       i915_gem_object_put(copy_work->obj);
>         dma_fence_put(&copy_work->fence);
>  }
>  
> @@ -336,6 +365,7 @@ static void __memcpy_irq_work(struct irq_work
> *irq_work)
>  
>         dma_fence_signal(&copy_work->fence);
>         i915_ttm_memcpy_release(arg);
> +       i915_gem_object_put(copy_work->obj);
>         dma_fence_put(&copy_work->fence);
>  }
>  
> @@ -389,6 +419,16 @@ i915_ttm_memcpy_work_arm(struct
> i915_ttm_memcpy_work *work,
>         return &work->fence;
>  }
>  
> +static bool i915_ttm_memcpy_allowed(struct ttm_buffer_object *bo,
> +                                   struct ttm_resource *dst_mem)
> +{
> +       if (!(i915_ttm_resource_mappable(bo->resource) &&
> +             i915_ttm_resource_mappable(dst_mem)))
> +               return false;
> +
> +       return I915_SELFTEST_ONLY(ban_memcpy) ? false : true;
> +}
> +
>  static struct dma_fence *
>  __i915_ttm_move(struct ttm_buffer_object *bo,
>                 const struct ttm_operation_ctx *ctx, bool clear,
> @@ -396,6 +436,9 @@ __i915_ttm_move(struct ttm_buffer_object *bo,
>                 struct i915_refct_sgt *dst_rsgt, bool allow_accel,
>                 const struct i915_deps *move_deps)
>  {
> +       const bool memcpy_allowed = i915_ttm_memcpy_allowed(bo,
> dst_mem);
> +       struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
> +       struct drm_i915_private *i915 = to_i915(bo->base.dev);
>         struct i915_ttm_memcpy_work *copy_work = NULL;
>         struct i915_ttm_memcpy_arg _arg, *arg = &_arg;
>         struct dma_fence *fence = ERR_PTR(-EINVAL);
> @@ -423,9 +466,14 @@ __i915_ttm_move(struct ttm_buffer_object *bo,
>                         copy_work = kzalloc(sizeof(*copy_work),
> GFP_KERNEL);
>  
>                 if (copy_work) {
> +                       copy_work->i915 = i915;
> +                       copy_work->memcpy_allowed = memcpy_allowed;
> +                       copy_work->obj = i915_gem_object_get(obj);
>                         arg = &copy_work->arg;
> -                       i915_ttm_memcpy_init(arg, bo, clear, dst_mem,
> dst_ttm,
> -                                            dst_rsgt);
> +                       if (memcpy_allowed)
> +                               i915_ttm_memcpy_init(arg, bo, clear,
> dst_mem,
> +                                                    dst_ttm,
> dst_rsgt);
> +
>                         fence = i915_ttm_memcpy_work_arm(copy_work,
> dep);
>                 } else {
>                         dma_fence_wait(dep, false);
> @@ -450,17 +498,26 @@ __i915_ttm_move(struct ttm_buffer_object *bo,
>         }
>  
>         /* Error intercept failed or no accelerated migration to
> start with */
> -       if (!copy_work)
> -               i915_ttm_memcpy_init(arg, bo, clear, dst_mem,
> dst_ttm,
> -                                    dst_rsgt);
> -       i915_ttm_move_memcpy(arg);
> -       i915_ttm_memcpy_release(arg);
> +
> +       if (memcpy_allowed) {
> +               if (!copy_work)
> +                       i915_ttm_memcpy_init(arg, bo, clear, dst_mem,
> dst_ttm,
> +                                            dst_rsgt);
> +               i915_ttm_move_memcpy(arg);
> +               i915_ttm_memcpy_release(arg);
> +       } else {
> +               intel_gt_set_wedged(&i915->gt0);
> +               obj->mm.ttm_unknown_state = true;
> +       }
> +       if (copy_work)
> +               i915_gem_object_put(copy_work->obj);
>         kfree(copy_work);
>  
> -       return NULL;
> +       return memcpy_allowed ? NULL : ERR_PTR(-EIO);
>  out:
>         if (!fence && copy_work) {
>                 i915_ttm_memcpy_release(arg);
> +               i915_gem_object_put(copy_work->obj);
>                 kfree(copy_work);
>         }
>  
> @@ -539,8 +596,11 @@ int i915_ttm_move(struct ttm_buffer_object *bo,
> bool evict,
>         }
>  
>         if (migration_fence) {
> -               ret = ttm_bo_move_accel_cleanup(bo, migration_fence,
> evict,
> -                                               true, dst_mem);
> +               if (I915_SELFTEST_ONLY(evict && fail_gpu_migration))
> +                       ret = -EIO; /* never feed non-migrate fences
> into ttm */
> +               else
> +                       ret = ttm_bo_move_accel_cleanup(bo,
> migration_fence, evict,
> +                                                       true,
> dst_mem);
>                 if (ret) {
>                         dma_fence_wait(migration_fence, false);
>                         ttm_bo_move_sync_cleanup(bo, dst_mem);
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.h
> b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.h
> index d2e7f149e05c..8a5d5ab0cc34 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.h
> @@ -22,6 +22,7 @@ int i915_ttm_move_notify(struct ttm_buffer_object
> *bo);
>  
>  I915_SELFTEST_DECLARE(void i915_ttm_migrate_set_failure_modes(bool
> gpu_migration,
>                                                               bool
> work_allocation));
> +I915_SELFTEST_DECLARE(void i915_ttm_migrate_set_ban_memcpy(bool
> ban));
>  
>  int i915_gem_obj_copy_ttm(struct drm_i915_gem_object *dst,
>                           struct drm_i915_gem_object *src,
> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
> b/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
> index 801af51aff62..3fb8bcb04cae 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
> @@ -9,6 +9,7 @@
>  
>  #include "i915_deps.h"
>  
> +#include "selftests/igt_reset.h"
>  #include "selftests/igt_spinner.h"
>  
>  static int igt_fill_check_buffer(struct drm_i915_gem_object *obj,
> @@ -109,7 +110,8 @@ static int igt_same_create_migrate(void *arg)
>  
>  static int lmem_pages_migrate_one(struct i915_gem_ww_ctx *ww,
>                                   struct drm_i915_gem_object *obj,
> -                                 struct i915_vma *vma)
> +                                 struct i915_vma *vma,
> +                                 bool silent_migrate)
>  {
>         int err;
>  
> @@ -138,7 +140,8 @@ static int lmem_pages_migrate_one(struct
> i915_gem_ww_ctx *ww,
>         if (i915_gem_object_is_lmem(obj)) {
>                 err = i915_gem_object_migrate(obj, ww,
> INTEL_REGION_SMEM);
>                 if (err) {
> -                       pr_err("Object failed migration to smem\n");
> +                       if (!silent_migrate)
> +                               pr_err("Object failed migration to
> smem\n");
>                         if (err)
>                                 return err;
>                 }
> @@ -156,7 +159,8 @@ static int lmem_pages_migrate_one(struct
> i915_gem_ww_ctx *ww,
>         } else {
>                 err = i915_gem_object_migrate(obj, ww,
> INTEL_REGION_LMEM_0);
>                 if (err) {
> -                       pr_err("Object failed migration to lmem\n");
> +                       if (!silent_migrate)
> +                               pr_err("Object failed migration to
> lmem\n");
>                         if (err)
>                                 return err;
>                 }
> @@ -179,7 +183,8 @@ static int __igt_lmem_pages_migrate(struct
> intel_gt *gt,
>                                     struct i915_address_space *vm,
>                                     struct i915_deps *deps,
>                                     struct igt_spinner *spin,
> -                                   struct dma_fence *spin_fence)
> +                                   struct dma_fence *spin_fence,
> +                                   bool borked_migrate)
>  {
>         struct drm_i915_private *i915 = gt->i915;
>         struct drm_i915_gem_object *obj;
> @@ -242,7 +247,8 @@ static int __igt_lmem_pages_migrate(struct
> intel_gt *gt,
>          */
>         for (i = 1; i <= 5; ++i) {
>                 for_i915_gem_ww(&ww, err, true)
> -                       err = lmem_pages_migrate_one(&ww, obj, vma);
> +                       err = lmem_pages_migrate_one(&ww, obj, vma,
> +                                                    borked_migrate);
>                 if (err)
>                         goto out_put;
>         }
> @@ -276,6 +282,9 @@ static int __igt_lmem_pages_migrate(struct
> intel_gt *gt,
>  out_unlock:
>         i915_gem_object_unlock(obj);
>  out_put:
> +       if (borked_migrate && !obj->mm.ttm_unknown_state)
> +               err = -EINVAL;
> +
>         i915_gem_object_put(obj);
>  
>         return err;
> @@ -283,23 +292,45 @@ static int __igt_lmem_pages_migrate(struct
> intel_gt *gt,
>  
>  static int igt_lmem_pages_failsafe_migrate(void *arg)
>  {
> -       int fail_gpu, fail_alloc, ret;
> +       int fail_gpu, fail_alloc, ban_memcpy, ret;
>         struct intel_gt *gt = arg;
>  
>         for (fail_gpu = 0; fail_gpu < 2; ++fail_gpu) {
>                 for (fail_alloc = 0; fail_alloc < 2; ++fail_alloc) {
> -                       pr_info("Simulated failure modes: gpu: %d,
> alloc: %d\n",
> -                               fail_gpu, fail_alloc);
> -                       i915_ttm_migrate_set_failure_modes(fail_gpu,
> -                                                         
> fail_alloc);
> -                       ret = __igt_lmem_pages_migrate(gt, NULL,
> NULL, NULL, NULL);
> -                       if (ret)
> -                               goto out_err;
> +                       for (ban_memcpy = 0; ban_memcpy < 2;
> ++ban_memcpy) {
> +                               pr_info("Simulated failure modes:
> gpu: %d, alloc:%d, ban_memcpy: %d\n",
> +                                       fail_gpu, fail_alloc,
> ban_memcpy);
> +                               i915_ttm_migrate_set_ban_memcpy(ban_m
> emcpy);
> +                               i915_ttm_migrate_set_failure_modes(fa
> il_gpu,
> +                                                                 
> fail_alloc);
> +                               ret = __igt_lmem_pages_migrate(gt,
> NULL, NULL,
> +                                                              NULL,
> NULL,
> +                                                             
> ban_memcpy &&
> +                                                             
> fail_gpu);
> +
> +                               if (ban_memcpy && fail_gpu) {
> +                                       if (ret != -EIO)
> +                                               ret = -EINVAL;
> +                                       else
> +                                               ret = 0;
> +
> +                                       if (test_bit(I915_WEDGED,
> &gt->reset.flags)) {
> +                                               igt_global_reset_lock
> (gt);
> +                                               intel_gt_reset(gt,
> ALL_ENGINES, NULL);
> +                                               igt_global_reset_unlo
> ck(gt);
> +                                       } else {
> +                                               ret = -EINVAL;
> +                                       }
> +                               }
> +                               if (ret)
> +                                       goto out_err;
> +                       }
>                 }
>         }
>  
>  out_err:
>         i915_ttm_migrate_set_failure_modes(false, false);
> +       i915_ttm_migrate_set_ban_memcpy(false);
>         return ret;
>  }
>  
> @@ -370,7 +401,7 @@ static int igt_async_migrate(struct intel_gt *gt)
>                         goto out_ce;
>  
>                 err = __igt_lmem_pages_migrate(gt, &ppgtt->vm, &deps,
> &spin,
> -                                              spin_fence);
> +                                              spin_fence, false);
>                 i915_deps_fini(&deps);
>                 dma_fence_put(spin_fence);
>                 if (err)
> @@ -394,23 +425,42 @@ static int igt_async_migrate(struct intel_gt
> *gt)
>  #define ASYNC_FAIL_ALLOC 1
>  static int igt_lmem_async_migrate(void *arg)
>  {
> -       int fail_gpu, fail_alloc, ret;
> +       int fail_gpu, fail_alloc, ban_memcpy, ret;
>         struct intel_gt *gt = arg;
>  
>         for (fail_gpu = 0; fail_gpu < 2; ++fail_gpu) {
>                 for (fail_alloc = 0; fail_alloc < ASYNC_FAIL_ALLOC;
> ++fail_alloc) {
> -                       pr_info("Simulated failure modes: gpu: %d,
> alloc: %d\n",
> -                               fail_gpu, fail_alloc);
> -                       i915_ttm_migrate_set_failure_modes(fail_gpu,
> -                                                         
> fail_alloc);
> -                       ret = igt_async_migrate(gt);
> -                       if (ret)
> -                               goto out_err;
> +                       for (ban_memcpy = 0; ban_memcpy < 2;
> ++ban_memcpy) {
> +                               pr_info("Simulated failure modes:
> gpu: %d, alloc: %d, ban_memcpy: %d\n",
> +                                       fail_gpu, fail_alloc,
> ban_memcpy);
> +                               i915_ttm_migrate_set_ban_memcpy(ban_m
> emcpy);
> +                               i915_ttm_migrate_set_failure_modes(fa
> il_gpu,
> +                                                                 
> fail_alloc);
> +                               ret = igt_async_migrate(gt);
> +
> +                               if (fail_gpu && ban_memcpy) {
> +                                       if (ret != -EIO)
> +                                               ret = -EINVAL;
> +                                       else
> +                                               ret = 0;
> +
> +                                       if (test_bit(I915_WEDGED,
> &gt->reset.flags)) {
> +                                               igt_global_reset_lock
> (gt);
> +                                               intel_gt_reset(gt,
> ALL_ENGINES, NULL);
> +                                               igt_global_reset_unlo
> ck(gt);
> +                                       } else {
> +                                               ret = -EINVAL;
> +                                       }
> +                               }
> +                               if (ret)
> +                                       goto out_err;
> +                       }
>                 }
>         }
>  
>  out_err:
>         i915_ttm_migrate_set_failure_modes(false, false);
> +       i915_ttm_migrate_set_ban_memcpy(false);
>         return ret;
>  }
>  
> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> index 7c95b6768610..a052e90fa551 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> @@ -10,6 +10,7 @@
>  #include "gem/i915_gem_internal.h"
>  #include "gem/i915_gem_region.h"
>  #include "gem/i915_gem_ttm.h"
> +#include "gem/i915_gem_ttm_move.h"
>  #include "gt/intel_engine_pm.h"
>  #include "gt/intel_gpu_commands.h"
>  #include "gt/intel_gt.h"
> @@ -21,6 +22,7 @@
>  #include "i915_selftest.h"
>  #include "selftests/i915_random.h"
>  #include "selftests/igt_flush_test.h"
> +#include "selftests/igt_reset.h"
>  #include "selftests/igt_mmap.h"
>  
>  struct tile {
> @@ -1160,6 +1162,7 @@ static int ___igt_mmap_migrate(struct
> drm_i915_private *i915,
>  #define IGT_MMAP_MIGRATE_FILL        (1 << 1)
>  #define IGT_MMAP_MIGRATE_EVICTABLE   (1 << 2)
>  #define IGT_MMAP_MIGRATE_UNFAULTABLE (1 << 3)
> +#define IGT_MMAP_MIGRATE_FAIL_GPU    (1 << 4)
>  static int __igt_mmap_migrate(struct intel_memory_region
> **placements,
>                               int n_placements,
>                               struct intel_memory_region
> *expected_mr,
> @@ -1234,13 +1237,47 @@ static int __igt_mmap_migrate(struct
> intel_memory_region **placements,
>         if (flags & IGT_MMAP_MIGRATE_EVICTABLE)
>                 igt_make_evictable(&objects);
>  
> +       if (flags & IGT_MMAP_MIGRATE_FAIL_GPU) {
> +               err = i915_gem_object_lock(obj, NULL);
> +               if (err)
> +                       goto out_put;
> +
> +               /*
> +                * Ensure we only simulate the gpu failuire when
> faulting the
> +                * pages.
> +                */
> +               err = i915_gem_object_wait_moving_fence(obj, true);
> +               i915_gem_object_unlock(obj);
> +               if (err)
> +                       goto out_put;
> +               i915_ttm_migrate_set_failure_modes(true, false);
> +       }
> +
>         err = ___igt_mmap_migrate(i915, obj, addr,
>                                   flags &
> IGT_MMAP_MIGRATE_UNFAULTABLE);
> +
>         if (!err && obj->mm.region != expected_mr) {
>                 pr_err("%s region mismatch %s\n", __func__,
> expected_mr->name);
>                 err = -EINVAL;
>         }
>  
> +       if (flags & IGT_MMAP_MIGRATE_FAIL_GPU) {
> +               struct intel_gt *gt = &i915->gt0;
> +
> +               i915_ttm_migrate_set_failure_modes(false, false);
> +
> +               if (!obj->mm.ttm_unknown_state)
> +                       err = -EINVAL;
> +
> +               if (test_bit(I915_WEDGED, &gt->reset.flags)) {
> +                       igt_global_reset_lock(gt);
> +                       intel_gt_reset(gt, ALL_ENGINES, NULL);
> +                       igt_global_reset_unlock(gt);
> +               } else if (!err) {
> +                       err = -EINVAL;
> +               }
> +       }
> +
>  out_put:
>         i915_gem_object_put(obj);
>         igt_close_objects(i915, &objects);
> @@ -1321,6 +1358,23 @@ static int igt_mmap_migrate(void *arg)
>                                          IGT_MMAP_MIGRATE_TOPDOWN |
>                                          IGT_MMAP_MIGRATE_FILL |
>                                         
> IGT_MMAP_MIGRATE_UNFAULTABLE);
> +               if (err)
> +                       goto out_io_size;
> +
> +               /*
> +                * Allocate in the non-mappable portion, but force
> migrating to
> +                * the mappable portion on fault (LMEM -> LMEM). We
> then also
> +                * simulate a gpu error when moving the pages when
> faulting the
> +                * pages, which should result in wedging the gpu and
> returning
> +                * SIGBUS in the fault handler, since we can't
> fallback to
> +                * memcpy.
> +                */
> +               err = __igt_mmap_migrate(single, ARRAY_SIZE(single),
> mr,
> +                                        IGT_MMAP_MIGRATE_TOPDOWN |
> +                                        IGT_MMAP_MIGRATE_FILL |
> +                                        IGT_MMAP_MIGRATE_EVICTABLE |
> +                                        IGT_MMAP_MIGRATE_FAIL_GPU |
> +                                       
> IGT_MMAP_MIGRATE_UNFAULTABLE);
>  out_io_size:
>                 mr->io_size = saved_io_size;
>                 i915_ttm_buddy_man_force_visible_size(man,
> diff --git a/drivers/gpu/drm/i915/i915_vma.c
> b/drivers/gpu/drm/i915/i915_vma.c
> index 0bffb70b3c5f..84f8ccb8d0ea 100644
> --- a/drivers/gpu/drm/i915/i915_vma.c
> +++ b/drivers/gpu/drm/i915/i915_vma.c
> @@ -310,7 +310,7 @@ struct i915_vma_work {
>         struct i915_address_space *vm;
>         struct i915_vm_pt_stash stash;
>         struct i915_vma_resource *vma_res;
> -       struct drm_i915_gem_object *pinned;
> +       struct drm_i915_gem_object *obj;
>         struct i915_sw_dma_fence_cb cb;
>         enum i915_cache_level cache_level;
>         unsigned int flags;
> @@ -321,17 +321,25 @@ static void __vma_bind(struct dma_fence_work
> *work)
>         struct i915_vma_work *vw = container_of(work, typeof(*vw),
> base);
>         struct i915_vma_resource *vma_res = vw->vma_res;
>  
> +       /*
> +        * We are about the bind the object, which must mean we have
> already
> +        * signaled the work to potentially clear/move the pages
> underneath. If
> +        * something went wrong at that stage then the object should
> have
> +        * ttm_unknown_state set, in which case we need to skip the
> bind.
> +        */
> +       if (vw->obj->mm.ttm_unknown_state)
> +               return;
> +
>         vma_res->ops->bind_vma(vma_res->vm, &vw->stash,
>                                vma_res, vw->cache_level, vw->flags);
> -
>  }
>  
>  static void __vma_release(struct dma_fence_work *work)
>  {
>         struct i915_vma_work *vw = container_of(work, typeof(*vw),
> base);
>  
> -       if (vw->pinned)
> -               i915_gem_object_put(vw->pinned);
> +       if (vw->obj)
> +               i915_gem_object_put(vw->obj);
>  
>         i915_vm_free_pt_stash(vw->vm, &vw->stash);
>         if (vw->vma_res)
> @@ -517,14 +525,7 @@ int i915_vma_bind(struct i915_vma *vma,
>                 }
>  
>                 work->base.dma.error = 0; /* enable the queue_work()
> */
> -
> -               /*
> -                * If we don't have the refcounted pages list, keep a
> reference
> -                * on the object to avoid waiting for the async bind
> to
> -                * complete in the object destruction path.
> -                */
> -               if (!work->vma_res->bi.pages_rsgt)
> -                       work->pinned = i915_gem_object_get(vma->obj);
> +               work->obj = i915_gem_object_get(vma->obj);
>         } else {
>                 ret = i915_gem_object_wait_moving_fence(vma->obj,
> true);
>                 if (ret) {


