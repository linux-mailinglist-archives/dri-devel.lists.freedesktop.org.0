Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB6E382533
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 09:19:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04F036E8D8;
	Mon, 17 May 2021 07:19:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72D546E102;
 Mon, 17 May 2021 07:19:00 +0000 (UTC)
IronPort-SDR: nmKDC9T4BfiZF00zreattFKk8PXAoIaQVrjeSJaTr0V2LZVWtAbBUd+m+YIr7XJYoUpXUdVsAC
 644ulf3t0vhA==
X-IronPort-AV: E=McAfee;i="6200,9189,9986"; a="179998323"
X-IronPort-AV: E=Sophos;i="5.82,306,1613462400"; d="scan'208";a="179998323"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2021 00:18:59 -0700
IronPort-SDR: PnIqeWS5ets5qspARUY06Bm1PmFk7CQuXMAnlhLSmi4WO4BcCoCtZtErh8sSU3UiMpzb3BhoA8
 +5GTctVDmodg==
X-IronPort-AV: E=Sophos;i="5.82,306,1613462400"; d="scan'208";a="472275178"
Received: from rminkov-mobl3.ger.corp.intel.com ([10.249.254.204])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2021 00:18:56 -0700
Message-ID: <c7b0e1ef628fc71b812ebd3d88c6ba09e6b8f65f.camel@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 3/7] drm/i915/ttm, drm/ttm: Initialize the
 ttm device and memory managers.
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.william.auld@gmail.com>
In-Reply-To: <CAM0jSHN4iuq+nYkWq0aZ-K8q9NBbQy7TLc1Zp6=DEV_fCaAN3A@mail.gmail.com>
References: <20210511132525.377190-1-thomas.hellstrom@linux.intel.com>
 <20210511132525.377190-4-thomas.hellstrom@linux.intel.com>
 <CAM0jSHN4iuq+nYkWq0aZ-K8q9NBbQy7TLc1Zp6=DEV_fCaAN3A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Date: Mon, 17 May 2021 09:18:17 +0200
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2021-05-12 at 09:57 +0100, Matthew Auld wrote:
> On Tue, 11 May 2021 at 14:26, Thomas Hellström
> <thomas.hellstrom@linux.intel.com> wrote:
> > 
> > Temporarily remove the buddy allocator and related selftests
> > and hook up the TTM range manager for i915 regions.
> > 
> > In order to support some of the mock region-related selftests, we
> > need to
> > be able to initialize the TTM range-manager standalone without a
> > struct
> > ttm_device. Add two functions to allow that to the TTM api.
> > 
> > Finally modify the mock region selftests somewhat to account for a
> > fragmenting manager.
> > 
> > Cc: Christian König <christian.koenig@amd.com>
> > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > ---
> >  drivers/gpu/drm/i915/Kconfig                  |   1 +
> >  drivers/gpu/drm/i915/Makefile                 |   2 +-
> >  drivers/gpu/drm/i915/gem/i915_gem_lmem.c      |  58 +-
> >  .../gpu/drm/i915/gem/i915_gem_object_types.h  |   6 +-
> >  drivers/gpu/drm/i915/gem/i915_gem_pages.c     |   3 +-
> >  drivers/gpu/drm/i915/gem/i915_gem_region.c    | 120 ---
> >  drivers/gpu/drm/i915/gem/i915_gem_region.h    |   4 -
> >  drivers/gpu/drm/i915/gem/i915_gem_shmem.c     |   4 +-
> >  drivers/gpu/drm/i915/gem/i915_gem_stolen.c    |  10 +-
> >  drivers/gpu/drm/i915/gem/i915_gem_stolen.h    |   9 +-
> >  drivers/gpu/drm/i915/gt/intel_gt.c            |   2 -
> >  drivers/gpu/drm/i915/gt/intel_region_lmem.c   |  27 +-
> >  drivers/gpu/drm/i915/i915_buddy.c             | 435 ----------
> >  drivers/gpu/drm/i915/i915_buddy.h             | 131 ---
> >  drivers/gpu/drm/i915/i915_drv.c               |   8 +
> >  drivers/gpu/drm/i915/i915_drv.h               |   7 +-
> >  drivers/gpu/drm/i915/i915_gem.c               |   1 +
> >  drivers/gpu/drm/i915/i915_globals.c           |   1 -
> >  drivers/gpu/drm/i915/i915_globals.h           |   1 -
> >  drivers/gpu/drm/i915/i915_scatterlist.c       |  70 ++
> >  drivers/gpu/drm/i915/i915_scatterlist.h       |  35 +
> >  drivers/gpu/drm/i915/intel_memory_region.c    | 180 ++--
> >  drivers/gpu/drm/i915/intel_memory_region.h    |  44 +-
> >  drivers/gpu/drm/i915/intel_region_ttm.c       | 246 ++++++
> >  drivers/gpu/drm/i915/intel_region_ttm.h       |  29 +
> >  drivers/gpu/drm/i915/selftests/i915_buddy.c   | 789 --------------
> > ----
> >  .../drm/i915/selftests/i915_mock_selftests.h  |   1 -
> >  .../drm/i915/selftests/intel_memory_region.c  | 133 +--
> >  drivers/gpu/drm/i915/selftests/mock_region.c  |  51 +-
> >  drivers/gpu/drm/ttm/ttm_range_manager.c       |  55 +-
> >  include/drm/ttm/ttm_bo_driver.h               |  23 +
> >  31 files changed, 715 insertions(+), 1771 deletions(-)
> >  delete mode 100644 drivers/gpu/drm/i915/i915_buddy.c
> >  delete mode 100644 drivers/gpu/drm/i915/i915_buddy.h
> >  create mode 100644 drivers/gpu/drm/i915/intel_region_ttm.c
> >  create mode 100644 drivers/gpu/drm/i915/intel_region_ttm.h
> >  delete mode 100644 drivers/gpu/drm/i915/selftests/i915_buddy.c
> > 
> > diff --git a/drivers/gpu/drm/i915/Kconfig
> > b/drivers/gpu/drm/i915/Kconfig
> > index 1e1cb245fca7..b63d374dff23 100644
> > --- a/drivers/gpu/drm/i915/Kconfig
> > +++ b/drivers/gpu/drm/i915/Kconfig
> > @@ -26,6 +26,7 @@ config DRM_I915
> >         select SND_HDA_I915 if SND_HDA_CORE
> >         select CEC_CORE if CEC_NOTIFIER
> >         select VMAP_PFN
> > +       select DRM_TTM
> >         help
> >           Choose this option if you have a system that has "Intel
> > Graphics
> >           Media Accelerator" or "HD Graphics" integrated graphics,
> > diff --git a/drivers/gpu/drm/i915/Makefile
> > b/drivers/gpu/drm/i915/Makefile
> > index d0d936d9137b..cb8823570996 100644
> > --- a/drivers/gpu/drm/i915/Makefile
> > +++ b/drivers/gpu/drm/i915/Makefile
> > @@ -50,6 +50,7 @@ i915-y += i915_drv.o \
> >           intel_memory_region.o \
> >           intel_pch.o \
> >           intel_pm.o \
> > +         intel_region_ttm.o \
> >           intel_runtime_pm.o \
> >           intel_sideband.o \
> >           intel_step.o \
> > @@ -160,7 +161,6 @@ gem-y += \
> >  i915-y += \
> >           $(gem-y) \
> >           i915_active.o \
> > -         i915_buddy.o \
> >           i915_cmd_parser.o \
> >           i915_gem_evict.o \
> >           i915_gem_gtt.o \
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
> > b/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
> > index f44bdd08f7cb..f42803ea48f2 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
> > @@ -4,16 +4,70 @@
> >   */
> > 
> >  #include "intel_memory_region.h"
> > +#include "intel_region_ttm.h"
> >  #include "gem/i915_gem_region.h"
> >  #include "gem/i915_gem_lmem.h"
> >  #include "i915_drv.h"
> > 
> > +static void lmem_put_pages(struct drm_i915_gem_object *obj,
> > +                                 struct sg_table *pages)
> > +{
> > +       intel_region_ttm_node_free(obj->mm.region, obj-
> > >mm.st_mm_node);
> > +       obj->mm.dirty = false;
> > +       sg_free_table(pages);
> > +       kfree(pages);
> > +}
> > +
> > +static int lmem_get_pages(struct drm_i915_gem_object *obj)
> > +{
> > +       unsigned int flags;
> > +       struct sg_table *pages;
> > +
> > +       flags = I915_ALLOC_MIN_PAGE_SIZE;
> > +       if (obj->flags & I915_BO_ALLOC_CONTIGUOUS)
> > +               flags |= I915_ALLOC_CONTIGUOUS;
> > +
> > +       obj->mm.st_mm_node = intel_region_ttm_node_alloc(obj-
> > >mm.region,
> > +                                                        obj-
> > >base.size,
> > +                                                        flags);
> > +       if (IS_ERR(obj->mm.st_mm_node))
> > +               return PTR_ERR(obj->mm.st_mm_node);
> > +
> > +       /* Range manager is always contigous */
> > +       if (obj->mm.region->is_range_manager)
> > +               obj->flags |= I915_BO_ALLOC_CONTIGUOUS;
> > +       pages = intel_region_ttm_node_to_st(obj->mm.region, obj-
> > >mm.st_mm_node);
> > +       if (IS_ERR(pages))
> > +               return PTR_ERR(pages);
> 
> error unwind?
> 
> > +
> > +       __i915_gem_object_set_pages(obj, pages,
> > +                                   i915_sg_dma_page_sizes(pages-
> > >sgl));
> > +
> > +       if (obj->flags & I915_BO_ALLOC_CPU_CLEAR) {
> > +               void __iomem *vaddr =
> > +                       i915_gem_object_lmem_io_map(obj, 0, obj-
> > >base.size);
> > +
> > +               if (!vaddr) {
> > +                       struct sg_table *pages =
> > +                               __i915_gem_object_unset_pages(obj);
> > +
> > +                       if (!IS_ERR_OR_NULL(pages))
> > +                               lmem_put_pages(obj, pages);
> > +               }
> > +
> > +               memset_io(vaddr, 0, obj->base.size);
> > +               io_mapping_unmap(vaddr);
> > +       }
> > +
> > +       return 0;
> > +}
> 
> <snip>
> 
> > +/**
> > + * i915_sg_dma_page_sizes - Calculate page sizes from a
> > scatterlist
> > + * @sg: The scatterlist from which to calculate page sizes
> > + *
> > + * Return: a value with bits sets for relevant page sizes.
> > + */
> > +static inline unsigned int i915_sg_dma_page_sizes(struct
> > scatterlist *sg)
> > +{
> > +       unsigned int page_sizes;
> > +
> > +       page_sizes = 0;
> > +       while (sg) {
> > +               GEM_BUG_ON(sg->offset);
> > +               GEM_BUG_ON(!IS_ALIGNED(sg->dma_length, PAGE_SIZE));
> > +               page_sizes |= sg->dma_length;
> > +               sg = __sg_next(sg);
> > +       }
> > +
> > +       /*
> > +        * Is this necessary to support building large GPU pages
> > from
> > +        * even larger segments?
> > +        */
> 
> We just need to know the above sg page_sizes, which is the mask of
> sg->dma_length for each sg. Later in __i915_gem_object_set_pages() we
> use this to determine the potential GPU page sizes for the object,
> depending on what the device supports. So the below stuff shouldn't
> be
> needed. Also we can just use i915_sg_page_sizes() here.

I noticed that i915_sg_page_sizes() uses sg->length() instead of sg-
>dma_length(). That doesn't look like what we're after here. Do you
know if there is a reason for that?

Thanks,
Thomas


