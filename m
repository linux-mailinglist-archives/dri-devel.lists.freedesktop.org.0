Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB05B41135C
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 13:09:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4CB26E4B7;
	Mon, 20 Sep 2021 11:09:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C34DE6E4B3;
 Mon, 20 Sep 2021 11:09:11 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10112"; a="286782930"
X-IronPort-AV: E=Sophos;i="5.85,308,1624345200"; d="scan'208";a="286782930"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 04:09:11 -0700
X-IronPort-AV: E=Sophos;i="5.85,308,1624345200"; d="scan'208";a="517812778"
Received: from ntaiyeby-mobl1.ger.corp.intel.com (HELO [10.249.254.68])
 ([10.249.254.68])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 04:09:09 -0700
Message-ID: <b489b872d20113f38a1b6f9a74ac60e29793e5dd.camel@linux.intel.com>
Subject: Re: [PATCH v3 6/6] drm/i915: Reduce the number of objects subject
 to memcpy recover
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com
Date: Mon, 20 Sep 2021 13:09:08 +0200
In-Reply-To: <22f443a0-d740-8337-1311-d18a31e4f6b0@intel.com>
References: <20210914193112.497379-1-thomas.hellstrom@linux.intel.com>
 <20210914193112.497379-7-thomas.hellstrom@linux.intel.com>
 <22f443a0-d740-8337-1311-d18a31e4f6b0@intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2021-09-20 at 12:05 +0100, Matthew Auld wrote:
> On 14/09/2021 20:31, Thomas Hellström wrote:
> > We really only need memcpy restore for objects that affect the
> > operability of the migrate context. That is, primarily the page-
> > table
> > objects of the migrate VM.
> > 
> > Add an object flag, I915_BO_ALLOC_PM_EARLY for objects that need
> > early
> > restores using memcpy and a way to assign LMEM page-table object
> > flags
> > to be used by the vms.
> > 
> > Restore objects without this flag with the gpu blitter and only
> > objects
> > carrying the flag using TTM memcpy.
> > 
> > Initially mark the migrate, gt, gtt and vgpu vms to use this flag,
> > and
> > defer for a later audit which vms actually need it. Most
> > importantly, user-
> > allocated vms with pinned page-table objects can be restored using
> > the
> > blitter.
> > 
> > Performance-wise memcpy restore is probably as fast as gpu restore
> > if not
> > faster, but using gpu restore will help tackling future
> > restrictions in
> > mappable LMEM size.
> > 
> > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > ---
> >   drivers/gpu/drm/i915/gem/i915_gem_context.c      |  4 ++--
> >   drivers/gpu/drm/i915/gem/i915_gem_object_types.h |  9 ++++++---
> >   drivers/gpu/drm/i915/gem/i915_gem_pm.c           |  5 ++++-
> >   drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c       |  6 ++++--
> >   drivers/gpu/drm/i915/gem/selftests/huge_pages.c  |  2 +-
> >   drivers/gpu/drm/i915/gt/gen6_ppgtt.c             |  2 +-
> >   drivers/gpu/drm/i915/gt/gen8_ppgtt.c             |  5 +++--
> >   drivers/gpu/drm/i915/gt/gen8_ppgtt.h             |  4 +++-
> >   drivers/gpu/drm/i915/gt/intel_ggtt.c             |  2 +-
> >   drivers/gpu/drm/i915/gt/intel_gt.c               |  2 +-
> >   drivers/gpu/drm/i915/gt/intel_gtt.c              |  3 ++-
> >   drivers/gpu/drm/i915/gt/intel_gtt.h              |  9 +++++++--
> >   drivers/gpu/drm/i915/gt/intel_migrate.c          |  2 +-
> >   drivers/gpu/drm/i915/gt/intel_ppgtt.c            | 13 ++++++++---
> > --
> >   drivers/gpu/drm/i915/gt/selftest_hangcheck.c     |  2 +-
> >   drivers/gpu/drm/i915/gvt/scheduler.c             |  2 +-
> >   drivers/gpu/drm/i915/selftests/i915_gem_gtt.c    |  4 ++--
> >   17 files changed, 48 insertions(+), 28 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > index c2ab0e22db0a..8208fd5b72c3 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > @@ -1287,7 +1287,7 @@ i915_gem_create_context(struct
> > drm_i915_private *i915,
> >         } else if (HAS_FULL_PPGTT(i915)) {
> >                 struct i915_ppgtt *ppgtt;
> >   
> > -               ppgtt = i915_ppgtt_create(&i915->gt);
> > +               ppgtt = i915_ppgtt_create(&i915->gt, 0);
> >                 if (IS_ERR(ppgtt)) {
> >                         drm_dbg(&i915->drm, "PPGTT setup failed
> > (%ld)\n",
> >                                 PTR_ERR(ppgtt));
> > @@ -1465,7 +1465,7 @@ int i915_gem_vm_create_ioctl(struct
> > drm_device *dev, void *data,
> >         if (args->flags)
> >                 return -EINVAL;
> >   
> > -       ppgtt = i915_ppgtt_create(&i915->gt);
> > +       ppgtt = i915_ppgtt_create(&i915->gt, 0);
> >         if (IS_ERR(ppgtt))
> >                 return PTR_ERR(ppgtt);
> >   
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> > b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> > index 118691ce81d7..fa2ba9e2a4d0 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> > @@ -294,13 +294,16 @@ struct drm_i915_gem_object {
> >   #define I915_BO_ALLOC_USER        BIT(3)
> >   /* Object is allowed to lose its contents on suspend / resume,
> > even if pinned */
> >   #define I915_BO_ALLOC_PM_VOLATILE BIT(4)
> > +/* Object needs to be restored early using memcpy during resume */
> > +#define I915_BO_ALLOC_PM_EARLY    BIT(5)
> >   #define I915_BO_ALLOC_FLAGS (I915_BO_ALLOC_CONTIGUOUS | \
> >                              I915_BO_ALLOC_VOLATILE | \
> >                              I915_BO_ALLOC_CPU_CLEAR | \
> >                              I915_BO_ALLOC_USER | \
> > -                            I915_BO_ALLOC_PM_VOLATILE)
> > -#define I915_BO_READONLY          BIT(5)
> > -#define I915_TILING_QUIRK_BIT     6 /* unknown swizzling; do not
> > release! */
> > +                            I915_BO_ALLOC_PM_VOLATILE | \
> > +                            I915_BO_ALLOC_PM_EARLY)
> > +#define I915_BO_READONLY          BIT(6)
> > +#define I915_TILING_QUIRK_BIT     7 /* unknown swizzling; do not
> > release! */
> >   
> >         /**
> >          * @mem_flags - Mutable placement-related flags
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pm.c
> > b/drivers/gpu/drm/i915/gem/i915_gem_pm.c
> > index 8736ae1dfbb2..c4a75e1c12ee 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_pm.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_pm.c
> > @@ -98,8 +98,11 @@ int i915_gem_backup_suspend(struct
> > drm_i915_private *i915)
> >          * More objects may have become unpinned as requests were
> >          * retired. Now try to evict again. The gt may be wedged
> > here
> >          * in which case we automatically fall back to memcpy.
> > +        * We allow also backing up pinned objects that have not
> > been
> > +        * marked for early recover, and that may contain, for
> > example,
> > +        * page-tables for the migrate context. 
> >          */
> > -       ret = lmem_suspend(i915, true, false);
> > +       ret = lmem_suspend(i915, true, true);
> 
> I guess we could have made these flags instead of bools, for better 
> readability. I've already forgotten which is which :)
> 
> >         if (ret)
> >                 goto out_recover;
> >   
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
> > b/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
> > index a87419755d43..2684daaa2f22 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
> > @@ -57,7 +57,8 @@ static int i915_ttm_backup(struct
> > i915_gem_apply_to_region *apply,
> >         if (pm_apply->allow_gpu && i915_gem_object_evictable(obj))
> >                 return ttm_bo_validate(bo,
> > i915_ttm_sys_placement(), &ctx);
> >   
> > -       if (!pm_apply->backup_pinned)
> > +       if (!pm_apply->backup_pinned ||
> > +           (pm_apply->allow_gpu && (obj->flags &
> > I915_BO_ALLOC_PM_EARLY)))
> >                 return 0;
> >   
> >         if (obj->flags & I915_BO_ALLOC_PM_VOLATILE)
> > @@ -156,7 +157,8 @@ static int i915_ttm_restore(struct
> > i915_gem_apply_to_region *apply,
> >         if (!backup)
> >                 return 0;
> >   
> > -       if (!pm_apply->allow_gpu && (obj->flags &
> > I915_BO_ALLOC_USER))
> > +       if (!pm_apply->allow_gpu && ((obj->flags &
> > I915_BO_ALLOC_USER) ||
> > +                                    !(obj->flags &
> > I915_BO_ALLOC_PM_EARLY)))
> >                 return 0;
> >   
> >         err = i915_gem_object_lock(backup, apply->ww);
> > diff --git a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
> > b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
> > index 0827634c842c..77d84a9e8789 100644
> > --- a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
> > +++ b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
> > @@ -1645,7 +1645,7 @@ int i915_gem_huge_page_mock_selftests(void)
> >         mkwrite_device_info(dev_priv)->ppgtt_type =
> > INTEL_PPGTT_FULL;
> >         mkwrite_device_info(dev_priv)->ppgtt_size = 48;
> >   
> > -       ppgtt = i915_ppgtt_create(&dev_priv->gt);
> > +       ppgtt = i915_ppgtt_create(&dev_priv->gt, 0);
> >         if (IS_ERR(ppgtt)) {
> >                 err = PTR_ERR(ppgtt);
> >                 goto out_unlock;
> > diff --git a/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
> > b/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
> > index 1aee5e6b1b23..890191f286e3 100644
> > --- a/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
> > +++ b/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
> > @@ -429,7 +429,7 @@ struct i915_ppgtt *gen6_ppgtt_create(struct
> > intel_gt *gt)
> >         mutex_init(&ppgtt->flush);
> >         mutex_init(&ppgtt->pin_mutex);
> >   
> > -       ppgtt_init(&ppgtt->base, gt);
> > +       ppgtt_init(&ppgtt->base, gt, 0);
> >         ppgtt->base.vm.pd_shift = ilog2(SZ_4K * SZ_4K /
> > sizeof(gen6_pte_t));
> >         ppgtt->base.vm.top = 1;
> >   
> > diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> > b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> > index 6a5af995f5b1..037a9a6e4889 100644
> > --- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> > +++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> > @@ -753,7 +753,8 @@ gen8_alloc_top_pd(struct i915_address_space
> > *vm)
> >    * space.
> >    *
> >    */
> > -struct i915_ppgtt *gen8_ppgtt_create(struct intel_gt *gt)
> > +struct i915_ppgtt *gen8_ppgtt_create(struct intel_gt *gt,
> > +                                    unsigned long
> > lmem_pt_obj_flags)
> >   {
> >         struct i915_ppgtt *ppgtt;
> >         int err;
> > @@ -762,7 +763,7 @@ struct i915_ppgtt *gen8_ppgtt_create(struct
> > intel_gt *gt)
> >         if (!ppgtt)
> >                 return ERR_PTR(-ENOMEM);
> >   
> > -       ppgtt_init(ppgtt, gt);
> > +       ppgtt_init(ppgtt, gt, lmem_pt_obj_flags);
> >         ppgtt->vm.top = i915_vm_is_4lvl(&ppgtt->vm) ? 3 : 2;
> >         ppgtt->vm.pd_shift = ilog2(SZ_4K * SZ_4K /
> > sizeof(gen8_pte_t));
> >   
> > diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.h
> > b/drivers/gpu/drm/i915/gt/gen8_ppgtt.h
> > index b9028c2ad3c7..f541d19264b4 100644
> > --- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.h
> > +++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.h
> > @@ -12,7 +12,9 @@ struct i915_address_space;
> >   struct intel_gt;
> >   enum i915_cache_level;
> >   
> > -struct i915_ppgtt *gen8_ppgtt_create(struct intel_gt *gt);
> > +struct i915_ppgtt *gen8_ppgtt_create(struct intel_gt *gt,
> > +                                    unsigned long
> > lmem_pt_obj_flags);
> > +
> >   u64 gen8_ggtt_pte_encode(dma_addr_t addr,
> >                          enum i915_cache_level level,
> >                          u32 flags);
> > diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c
> > b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> > index 8d71f67926f1..b99b26201b67 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> > @@ -644,7 +644,7 @@ static int init_aliasing_ppgtt(struct i915_ggtt
> > *ggtt)
> >         struct i915_ppgtt *ppgtt;
> >         int err;
> >   
> > -       ppgtt = i915_ppgtt_create(ggtt->vm.gt);
> > +       ppgtt = i915_ppgtt_create(ggtt->vm.gt,
> > I915_BO_ALLOC_PM_EARLY);
> 
> I guess could leave as flags=0, since appgtt is not relevant on 
> discrete/modern hw(?).
> 
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>

True, I'll fix these up.


