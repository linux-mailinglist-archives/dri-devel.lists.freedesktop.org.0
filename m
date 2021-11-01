Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7EC2441AE4
	for <lists+dri-devel@lfdr.de>; Mon,  1 Nov 2021 12:52:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EA4889C55;
	Mon,  1 Nov 2021 11:51:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 766B489C55;
 Mon,  1 Nov 2021 11:51:58 +0000 (UTC)
Received: by mail-qt1-x82b.google.com with SMTP id v29so14175400qtc.10;
 Mon, 01 Nov 2021 04:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3sYCgRlRbpuuktnzx7rhn9wbHaVXP0lZZxiAFf0ZUkg=;
 b=JUu1oxmUzeGgnT35vMa9nOOKtZOqnIbmkr+uVTjecuTW06T7C7MgJCAn7jPf1Nnxs1
 GLy0UV+DGPMwJUMZEntGpgT9sILyD1sMN0VpLtHRYoIhxl8uptdgIekbDXJiI174vtPt
 SdxmYwENOn7sOTHFhN2NUYVYzuY1sMU3mM9WQ9nSmkG/7al7CzCJnctKumQ6JQUCiiTR
 Kc99FoN2xBHc9a2LFPovawib0Pz31Yzvz3+5T5yUFJRt6onp5IYNaQJQumNMvirTyOSE
 U/N1Ctnw0/0oEzX/U/yhFU1GXU3hfpH/G0ehi6Q5Zu0tFrTUlnO41ThVLiFuShXK1oCY
 bFxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3sYCgRlRbpuuktnzx7rhn9wbHaVXP0lZZxiAFf0ZUkg=;
 b=KPM+qgGUWBWIAtRQgp5IcUlYWoVDMcR56Wopspt4Nl5O8ABxJmt+zfG+keoicYDDJ+
 howIaLpQ2MdpgjmeZ1LahZKkh0S1gXQvUiAwCe1Qd4V/ncLJvnxlDg2ZaXCqSfqfZPkl
 Xp/sOI2gSdSf1QdKaAUMb2qoKej1WMTKCTs8j/tddKcfW0jUge1TtMEGku9E1anXDaB0
 K3O6W7/3H9CR5+T4En0SZfuvM34T3o/b5UGVoRAG3Z78GchwpPV6hklmmx5xGKam0mwC
 INA26nFtOU4Pqd56ZFAwo5J6TNBPC6h7lavQ13nY9FYareJFEI91+0xtN+mreDraYfVn
 hPkg==
X-Gm-Message-State: AOAM530v+70+aOAqRtTD+lDjdS/3as4s0VJU/L/05r7OhZ8OZKgy3ejl
 yjMPIP5VFTKRwczXp0FpGD5+M77q9pcEXh3aWGM=
X-Google-Smtp-Source: ABdhPJwtXAlYpx+dkU0I71mMMYbQJKBUTB0ekw4qRA30JYfizN0t4P1Iw75cvIq8/AsaRuZ96FWnuecf5X+m/DL9sQ4=
X-Received: by 2002:ac8:5f08:: with SMTP id x8mr5789161qta.165.1635767517319; 
 Mon, 01 Nov 2021 04:51:57 -0700 (PDT)
MIME-Version: 1.0
References: <20211029082156.194003-1-thomas.hellstrom@linux.intel.com>
 <20211029082156.194003-2-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20211029082156.194003-2-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Mon, 1 Nov 2021 11:51:30 +0000
Message-ID: <CAM0jSHNDnCe3FHiJoBjCqLxY3W9AYoTNX-V8e++5+E5gpykVSA@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v4 1/4] drm/i915: Introduce refcounted
 sg-tables
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
 Matthew Auld <matthew.auld@intel.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 29 Oct 2021 at 09:22, Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
> As we start to introduce asynchronous failsafe object migration,
> where we update the object state and then submit asynchronous
> commands we need to record what memory resources are actually used
> by various part of the command stream. Initially for three purposes:
>
> 1) Error capture.
> 2) Asynchronous migration error recovery.
> 3) Asynchronous vma bind.
>
> At the time where these happens, the object state may have been updated
> to be several migrations ahead and object sg-tables discarded.
>
> In order to make it possible to keep sg-tables with memory resource
> information for these operations, introduce refcounted sg-tables that
> aren't freed until the last user is done with them.
>
> The alternative would be to reference information sitting on the
> corresponding ttm_resources which typically have the same lifetime as
> these refcountes sg_tables, but that leads to other awkward constructs:
> Due to the design direction chosen for ttm resource managers that would
> lead to diamond-style inheritance, the LMEM resources may sometimes be
> prematurely freed, and finally the subclassed struct ttm_resource would
> have to bleed into the asynchronous vma bind code.
>
> v3:
> - Address a number of style issues (Matthew Auld)
> v4:
> - Dont check for st->sgl being NULL in i915_ttm_tt__shmem_unpopulate(),
>   that should never happen. (Matthew Auld)
>
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_object.h    |  12 +-
>  .../gpu/drm/i915/gem/i915_gem_object_types.h  |   3 +-
>  drivers/gpu/drm/i915/gem/i915_gem_shmem.c     |  49 +++--
>  drivers/gpu/drm/i915/gem/i915_gem_ttm.c       | 186 ++++++++++--------
>  drivers/gpu/drm/i915/i915_scatterlist.c       |  62 ++++--
>  drivers/gpu/drm/i915/i915_scatterlist.h       |  76 ++++++-
>  drivers/gpu/drm/i915/intel_region_ttm.c       |  15 +-
>  drivers/gpu/drm/i915/intel_region_ttm.h       |   5 +-
>  drivers/gpu/drm/i915/selftests/mock_region.c  |  12 +-
>  9 files changed, 276 insertions(+), 144 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm=
/i915/gem/i915_gem_object.h
> index a5479ac7a4ad..ba224598ed69 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> @@ -620,12 +620,12 @@ int i915_gem_object_wait_migration(struct drm_i915_=
gem_object *obj,
>  bool i915_gem_object_placement_possible(struct drm_i915_gem_object *obj,
>                                         enum intel_memory_type type);
>
> -struct sg_table *shmem_alloc_st(struct drm_i915_private *i915,
> -                               size_t size, struct intel_memory_region *=
mr,
> -                               struct address_space *mapping,
> -                               unsigned int max_segment);
> -void shmem_free_st(struct sg_table *st, struct address_space *mapping,
> -                  bool dirty, bool backup);
> +int shmem_sg_alloc_table(struct drm_i915_private *i915, struct sg_table =
*st,
> +                        size_t size, struct intel_memory_region *mr,
> +                        struct address_space *mapping,
> +                        unsigned int max_segment);
> +void shmem_sg_free_table(struct sg_table *st, struct address_space *mapp=
ing,
> +                        bool dirty, bool backup);
>  void __shmem_writeback(size_t size, struct address_space *mapping);
>
>  #ifdef CONFIG_MMU_NOTIFIER
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/g=
pu/drm/i915/gem/i915_gem_object_types.h
> index a4b69a43b898..604ed5ad77f5 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> @@ -544,6 +544,7 @@ struct drm_i915_gem_object {
>                  */
>                 struct list_head region_link;
>
> +               struct i915_refct_sgt *rsgt;
>                 struct sg_table *pages;
>                 void *mapping;
>
> @@ -597,7 +598,7 @@ struct drm_i915_gem_object {
>         } mm;
>
>         struct {
> -               struct sg_table *cached_io_st;
> +               struct i915_refct_sgt *cached_io_rsgt;
>                 struct i915_gem_object_page_iter get_io_page;
>                 struct drm_i915_gem_object *backup;
>                 bool created:1;
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/=
i915/gem/i915_gem_shmem.c
> index 01f332d8dbde..e09141031a5e 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> @@ -25,8 +25,8 @@ static void check_release_pagevec(struct pagevec *pvec)
>         cond_resched();
>  }
>
> -void shmem_free_st(struct sg_table *st, struct address_space *mapping,
> -                  bool dirty, bool backup)
> +void shmem_sg_free_table(struct sg_table *st, struct address_space *mapp=
ing,
> +                        bool dirty, bool backup)
>  {
>         struct sgt_iter sgt_iter;
>         struct pagevec pvec;
> @@ -49,17 +49,15 @@ void shmem_free_st(struct sg_table *st, struct addres=
s_space *mapping,
>                 check_release_pagevec(&pvec);
>
>         sg_free_table(st);
> -       kfree(st);
>  }
>
> -struct sg_table *shmem_alloc_st(struct drm_i915_private *i915,
> -                               size_t size, struct intel_memory_region *=
mr,
> -                               struct address_space *mapping,
> -                               unsigned int max_segment)
> +int shmem_sg_alloc_table(struct drm_i915_private *i915, struct sg_table =
*st,
> +                        size_t size, struct intel_memory_region *mr,
> +                        struct address_space *mapping,
> +                        unsigned int max_segment)
>  {
>         const unsigned long page_count =3D size / PAGE_SIZE;
>         unsigned long i;
> -       struct sg_table *st;
>         struct scatterlist *sg;
>         struct page *page;
>         unsigned long last_pfn =3D 0;     /* suppress gcc warning */
> @@ -71,15 +69,11 @@ struct sg_table *shmem_alloc_st(struct drm_i915_priva=
te *i915,
>          * object, bail early.
>          */
>         if (size > resource_size(&mr->region))
> -               return ERR_PTR(-ENOMEM);
> -
> -       st =3D kmalloc(sizeof(*st), GFP_KERNEL);
> -       if (!st)
> -               return ERR_PTR(-ENOMEM);
> +               return -ENOMEM;
>
>         if (sg_alloc_table(st, page_count, GFP_KERNEL)) {
>                 kfree(st);

Potential double free?

> -               return ERR_PTR(-ENOMEM);
> +               return -ENOMEM;
>         }
>
>         /*
> @@ -167,15 +161,14 @@ struct sg_table *shmem_alloc_st(struct drm_i915_pri=
vate *i915,
>         /* Trim unused sg entries to avoid wasting memory. */
>         i915_sg_trim(st);
>
> -       return st;
> +       return 0;
>  err_sg:
>         sg_mark_end(sg);
>         if (sg !=3D st->sgl) {
> -               shmem_free_st(st, mapping, false, false);
> +               shmem_sg_free_table(st, mapping, false, false);
>         } else {
>                 mapping_clear_unevictable(mapping);
>                 sg_free_table(st);
> -               kfree(st);
>         }
>
>         /*
> @@ -190,7 +183,7 @@ struct sg_table *shmem_alloc_st(struct drm_i915_priva=
te *i915,
>         if (ret =3D=3D -ENOSPC)
>                 ret =3D -ENOMEM;
>
> -       return ERR_PTR(ret);
> +       return ret;
>  }
>
>  static int shmem_get_pages(struct drm_i915_gem_object *obj)
> @@ -214,11 +207,14 @@ static int shmem_get_pages(struct drm_i915_gem_obje=
ct *obj)
>         GEM_BUG_ON(obj->write_domain & I915_GEM_GPU_DOMAINS);
>
>  rebuild_st:
> -       st =3D shmem_alloc_st(i915, obj->base.size, mem, mapping, max_seg=
ment);
> -       if (IS_ERR(st)) {
> -               ret =3D PTR_ERR(st);
> +       st =3D kmalloc(sizeof(*st), GFP_KERNEL);
> +       if (!st)
> +               return -ENOMEM;
> +
> +       ret =3D shmem_sg_alloc_table(i915, st, obj->base.size, mem, mappi=
ng,
> +                                  max_segment);
> +       if (ret)
>                 goto err_st;
> -       }
>
>         ret =3D i915_gem_gtt_prepare_pages(obj, st);
>         if (ret) {
> @@ -254,7 +250,7 @@ static int shmem_get_pages(struct drm_i915_gem_object=
 *obj)
>         return 0;
>
>  err_pages:
> -       shmem_free_st(st, mapping, false, false);
> +       shmem_sg_free_table(st, mapping, false, false);
>         /*
>          * shmemfs first checks if there is enough memory to allocate the=
 page
>          * and reports ENOSPC should there be insufficient, along with th=
e usual
> @@ -268,6 +264,8 @@ static int shmem_get_pages(struct drm_i915_gem_object=
 *obj)
>         if (ret =3D=3D -ENOSPC)
>                 ret =3D -ENOMEM;
>
> +       kfree(st);
> +
>         return ret;
>  }
>
> @@ -374,8 +372,9 @@ void i915_gem_object_put_pages_shmem(struct drm_i915_=
gem_object *obj, struct sg_
>         if (i915_gem_object_needs_bit17_swizzle(obj))
>                 i915_gem_object_save_bit_17_swizzle(obj, pages);
>
> -       shmem_free_st(pages, file_inode(obj->base.filp)->i_mapping,
> -                     obj->mm.dirty, obj->mm.madv =3D=3D I915_MADV_WILLNE=
ED);
> +       shmem_sg_free_table(pages, file_inode(obj->base.filp)->i_mapping,
> +                           obj->mm.dirty, obj->mm.madv =3D=3D I915_MADV_=
WILLNEED);
> +       kfree(pages);
>         obj->mm.dirty =3D false;
>  }
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i9=
15/gem/i915_gem_ttm.c
> index 4fd2edb20dd9..6a05369e2705 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -34,7 +34,7 @@
>   * struct i915_ttm_tt - TTM page vector with additional private informat=
ion
>   * @ttm: The base TTM page vector.
>   * @dev: The struct device used for dma mapping and unmapping.
> - * @cached_st: The cached scatter-gather table.
> + * @cached_rsgt: The cached scatter-gather table.
>   * @is_shmem: Set if using shmem.
>   * @filp: The shmem file, if using shmem backend.
>   *
> @@ -47,7 +47,7 @@
>  struct i915_ttm_tt {
>         struct ttm_tt ttm;
>         struct device *dev;
> -       struct sg_table *cached_st;
> +       struct i915_refct_sgt cached_rsgt;
>
>         bool is_shmem;
>         struct file *filp;
> @@ -217,18 +217,16 @@ static int i915_ttm_tt_shmem_populate(struct ttm_de=
vice *bdev,
>                 i915_tt->filp =3D filp;
>         }
>
> -       st =3D shmem_alloc_st(i915, size, mr, filp->f_mapping, max_segmen=
t);
> -       if (IS_ERR(st))
> -               return PTR_ERR(st);
> +       st =3D &i915_tt->cached_rsgt.table;
> +       err =3D shmem_sg_alloc_table(i915, st, size, mr, filp->f_mapping,
> +                                  max_segment);
> +       if (err)
> +               return err;
>
> -       err =3D dma_map_sg_attrs(i915_tt->dev,
> -                              st->sgl, st->nents,
> -                              DMA_BIDIRECTIONAL,
> -                              DMA_ATTR_SKIP_CPU_SYNC);
> -       if (err <=3D 0) {
> -               err =3D -EINVAL;
> +       err =3D dma_map_sgtable(i915_tt->dev, st, DMA_BIDIRECTIONAL,
> +                             DMA_ATTR_SKIP_CPU_SYNC);
> +       if (err)
>                 goto err_free_st;
> -       }
>
>         i =3D 0;
>         for_each_sgt_page(page, sgt_iter, st)
> @@ -237,11 +235,11 @@ static int i915_ttm_tt_shmem_populate(struct ttm_de=
vice *bdev,
>         if (ttm->page_flags & TTM_TT_FLAG_SWAPPED)
>                 ttm->page_flags &=3D ~TTM_TT_FLAG_SWAPPED;
>
> -       i915_tt->cached_st =3D st;
>         return 0;
>
>  err_free_st:
> -       shmem_free_st(st, filp->f_mapping, false, false);
> +       shmem_sg_free_table(st, filp->f_mapping, false, false);
> +
>         return err;
>  }
>
> @@ -249,16 +247,27 @@ static void i915_ttm_tt_shmem_unpopulate(struct ttm=
_tt *ttm)
>  {
>         struct i915_ttm_tt *i915_tt =3D container_of(ttm, typeof(*i915_tt=
), ttm);
>         bool backup =3D ttm->page_flags & TTM_TT_FLAG_SWAPPED;
> +       struct sg_table *st =3D &i915_tt->cached_rsgt.table;
> +
> +       shmem_sg_free_table(st, file_inode(i915_tt->filp)->i_mapping,
> +                           backup, backup);
> +}
>
> -       dma_unmap_sg(i915_tt->dev, i915_tt->cached_st->sgl,
> -                    i915_tt->cached_st->nents,
> -                    DMA_BIDIRECTIONAL);
> +static void i915_ttm_tt_release(struct kref *ref)
> +{
> +       struct i915_ttm_tt *i915_tt =3D
> +               container_of(ref, typeof(*i915_tt), cached_rsgt.kref);
> +       struct sg_table *st =3D &i915_tt->cached_rsgt.table;
>
> -       shmem_free_st(fetch_and_zero(&i915_tt->cached_st),
> -                     file_inode(i915_tt->filp)->i_mapping,
> -                     backup, backup);
> +       GEM_WARN_ON(st->sgl);
> +
> +       kfree(i915_tt);
>  }
>
> +static const struct i915_refct_sgt_ops tt_rsgt_ops =3D {
> +       .release =3D i915_ttm_tt_release
> +};
> +
>  static struct ttm_tt *i915_ttm_tt_create(struct ttm_buffer_object *bo,
>                                          uint32_t page_flags)
>  {
> @@ -287,6 +296,9 @@ static struct ttm_tt *i915_ttm_tt_create(struct ttm_b=
uffer_object *bo,
>         if (ret)
>                 goto err_free;
>
> +       __i915_refct_sgt_init(&i915_tt->cached_rsgt, bo->base.size,
> +                             &tt_rsgt_ops);
> +
>         i915_tt->dev =3D obj->base.dev->dev;
>
>         return &i915_tt->ttm;
> @@ -311,17 +323,15 @@ static int i915_ttm_tt_populate(struct ttm_device *=
bdev,
>  static void i915_ttm_tt_unpopulate(struct ttm_device *bdev, struct ttm_t=
t *ttm)
>  {
>         struct i915_ttm_tt *i915_tt =3D container_of(ttm, typeof(*i915_tt=
), ttm);
> +       struct sg_table *st =3D &i915_tt->cached_rsgt.table;
> +
> +       if (st->sgl)
> +               dma_unmap_sgtable(i915_tt->dev, st, DMA_BIDIRECTIONAL, 0)=
;
>
>         if (i915_tt->is_shmem) {
>                 i915_ttm_tt_shmem_unpopulate(ttm);
>         } else {
> -               if (i915_tt->cached_st) {
> -                       dma_unmap_sgtable(i915_tt->dev, i915_tt->cached_s=
t,
> -                                         DMA_BIDIRECTIONAL, 0);
> -                       sg_free_table(i915_tt->cached_st);
> -                       kfree(i915_tt->cached_st);
> -                       i915_tt->cached_st =3D NULL;
> -               }
> +               sg_free_table(st);
>                 ttm_pool_free(&bdev->pool, ttm);
>         }
>  }
> @@ -334,7 +344,7 @@ static void i915_ttm_tt_destroy(struct ttm_device *bd=
ev, struct ttm_tt *ttm)
>                 fput(i915_tt->filp);
>
>         ttm_tt_fini(ttm);
> -       kfree(i915_tt);
> +       i915_refct_sgt_put(&i915_tt->cached_rsgt);
>  }
>
>  static bool i915_ttm_eviction_valuable(struct ttm_buffer_object *bo,
> @@ -376,12 +386,12 @@ static int i915_ttm_move_notify(struct ttm_buffer_o=
bject *bo)
>         return 0;
>  }
>
> -static void i915_ttm_free_cached_io_st(struct drm_i915_gem_object *obj)
> +static void i915_ttm_free_cached_io_rsgt(struct drm_i915_gem_object *obj=
)
>  {
>         struct radix_tree_iter iter;
>         void __rcu **slot;
>
> -       if (!obj->ttm.cached_io_st)
> +       if (!obj->ttm.cached_io_rsgt)
>                 return;
>
>         rcu_read_lock();
> @@ -389,9 +399,8 @@ static void i915_ttm_free_cached_io_st(struct drm_i91=
5_gem_object *obj)
>                 radix_tree_delete(&obj->ttm.get_io_page.radix, iter.index=
);
>         rcu_read_unlock();
>
> -       sg_free_table(obj->ttm.cached_io_st);
> -       kfree(obj->ttm.cached_io_st);
> -       obj->ttm.cached_io_st =3D NULL;
> +       i915_refct_sgt_put(obj->ttm.cached_io_rsgt);
> +       obj->ttm.cached_io_rsgt =3D NULL;
>  }
>
>  static void
> @@ -477,7 +486,7 @@ static int i915_ttm_purge(struct drm_i915_gem_object =
*obj)
>         obj->write_domain =3D 0;
>         obj->read_domains =3D 0;
>         i915_ttm_adjust_gem_after_move(obj);
> -       i915_ttm_free_cached_io_st(obj);
> +       i915_ttm_free_cached_io_rsgt(obj);
>         obj->mm.madv =3D __I915_MADV_PURGED;
>         return 0;
>  }
> @@ -532,7 +541,7 @@ static void i915_ttm_swap_notify(struct ttm_buffer_ob=
ject *bo)
>         int ret =3D i915_ttm_move_notify(bo);
>
>         GEM_WARN_ON(ret);
> -       GEM_WARN_ON(obj->ttm.cached_io_st);
> +       GEM_WARN_ON(obj->ttm.cached_io_rsgt);
>         if (!ret && obj->mm.madv !=3D I915_MADV_WILLNEED)
>                 i915_ttm_purge(obj);
>  }
> @@ -543,7 +552,7 @@ static void i915_ttm_delete_mem_notify(struct ttm_buf=
fer_object *bo)
>
>         if (likely(obj)) {
>                 __i915_gem_object_pages_fini(obj);
> -               i915_ttm_free_cached_io_st(obj);
> +               i915_ttm_free_cached_io_rsgt(obj);
>         }
>  }
>
> @@ -563,40 +572,35 @@ i915_ttm_region(struct ttm_device *bdev, int ttm_me=
m_type)
>                                           ttm_mem_type - I915_PL_LMEM0);
>  }
>
> -static struct sg_table *i915_ttm_tt_get_st(struct ttm_tt *ttm)
> +static struct i915_refct_sgt *i915_ttm_tt_get_st(struct ttm_tt *ttm)
>  {
>         struct i915_ttm_tt *i915_tt =3D container_of(ttm, typeof(*i915_tt=
), ttm);
>         struct sg_table *st;
>         int ret;
>
> -       if (i915_tt->cached_st)
> -               return i915_tt->cached_st;
> -
> -       st =3D kzalloc(sizeof(*st), GFP_KERNEL);
> -       if (!st)
> -               return ERR_PTR(-ENOMEM);
> +       if (i915_tt->cached_rsgt.table.sgl)
> +               return i915_refct_sgt_get(&i915_tt->cached_rsgt);
>
> +       st =3D &i915_tt->cached_rsgt.table;
>         ret =3D sg_alloc_table_from_pages_segment(st,
>                         ttm->pages, ttm->num_pages,
>                         0, (unsigned long)ttm->num_pages << PAGE_SHIFT,
>                         i915_sg_segment_size(), GFP_KERNEL);
>         if (ret) {
> -               kfree(st);
> +               st->sgl =3D NULL;

Apparently sg_alloc_table* already ensures this.

>                 return ERR_PTR(ret);
>         }
>
>         ret =3D dma_map_sgtable(i915_tt->dev, st, DMA_BIDIRECTIONAL, 0);
>         if (ret) {
>                 sg_free_table(st);
> -               kfree(st);
>                 return ERR_PTR(ret);
>         }
>
> -       i915_tt->cached_st =3D st;
> -       return st;
> +       return i915_refct_sgt_get(&i915_tt->cached_rsgt);
>  }
>
> -static struct sg_table *
> +static struct i915_refct_sgt *
>  i915_ttm_resource_get_st(struct drm_i915_gem_object *obj,
>                          struct ttm_resource *res)
>  {
> @@ -610,7 +614,21 @@ i915_ttm_resource_get_st(struct drm_i915_gem_object =
*obj,
>          * the resulting st. Might make sense for GGTT.
>          */
>         GEM_WARN_ON(!cpu_maps_iomem(res));
> -       return intel_region_ttm_resource_to_st(obj->mm.region, res);
> +       if (bo->resource =3D=3D res) {
> +               if (!obj->ttm.cached_io_rsgt) {
> +                       struct i915_refct_sgt *rsgt;
> +
> +                       rsgt =3D intel_region_ttm_resource_to_rsgt(obj->m=
m.region,
> +                                                                res);
> +                       if (IS_ERR(rsgt))
> +                               return rsgt;
> +
> +                       obj->ttm.cached_io_rsgt =3D rsgt;
> +               }
> +               return i915_refct_sgt_get(obj->ttm.cached_io_rsgt);
> +       }
> +
> +       return intel_region_ttm_resource_to_rsgt(obj->mm.region, res);
>  }
>
>  static int i915_ttm_accel_move(struct ttm_buffer_object *bo,
> @@ -621,10 +639,7 @@ static int i915_ttm_accel_move(struct ttm_buffer_obj=
ect *bo,
>  {
>         struct drm_i915_private *i915 =3D container_of(bo->bdev, typeof(*=
i915),
>                                                      bdev);
> -       struct ttm_resource_manager *src_man =3D
> -               ttm_manager_type(bo->bdev, bo->resource->mem_type);
>         struct drm_i915_gem_object *obj =3D i915_ttm_to_gem(bo);
> -       struct sg_table *src_st;
>         struct i915_request *rq;
>         struct ttm_tt *src_ttm =3D bo->ttm;
>         enum i915_cache_level src_level, dst_level;
> @@ -650,17 +665,22 @@ static int i915_ttm_accel_move(struct ttm_buffer_ob=
ject *bo,
>                 }
>                 intel_engine_pm_put(i915->gt.migrate.context->engine);
>         } else {
> -               src_st =3D src_man->use_tt ? i915_ttm_tt_get_st(src_ttm) =
:
> -                       obj->ttm.cached_io_st;
> +               struct i915_refct_sgt *src_rsgt =3D
> +                       i915_ttm_resource_get_st(obj, bo->resource);
> +
> +               if (IS_ERR(src_rsgt))
> +                       return PTR_ERR(src_rsgt);
>
>                 src_level =3D i915_ttm_cache_level(i915, bo->resource, sr=
c_ttm);
>                 intel_engine_pm_get(i915->gt.migrate.context->engine);
>                 ret =3D intel_context_migrate_copy(i915->gt.migrate.conte=
xt,
> -                                                NULL, src_st->sgl, src_l=
evel,
> +                                                NULL, src_rsgt->table.sg=
l,
> +                                                src_level,
>                                                  gpu_binds_iomem(bo->reso=
urce),
>                                                  dst_st->sgl, dst_level,
>                                                  gpu_binds_iomem(dst_mem)=
,
>                                                  &rq);
> +               i915_refct_sgt_put(src_rsgt);
>                 if (!ret && rq) {
>                         i915_request_wait(rq, 0, MAX_SCHEDULE_TIMEOUT);
>                         i915_request_put(rq);
> @@ -674,13 +694,14 @@ static int i915_ttm_accel_move(struct ttm_buffer_ob=
ject *bo,
>  static void __i915_ttm_move(struct ttm_buffer_object *bo, bool clear,
>                             struct ttm_resource *dst_mem,
>                             struct ttm_tt *dst_ttm,
> -                           struct sg_table *dst_st,
> +                           struct i915_refct_sgt *dst_rsgt,
>                             bool allow_accel)
>  {
>         int ret =3D -EINVAL;
>
>         if (allow_accel)
> -               ret =3D i915_ttm_accel_move(bo, clear, dst_mem, dst_ttm, =
dst_st);
> +               ret =3D i915_ttm_accel_move(bo, clear, dst_mem, dst_ttm,
> +                                         &dst_rsgt->table);
>         if (ret) {
>                 struct drm_i915_gem_object *obj =3D i915_ttm_to_gem(bo);
>                 struct intel_memory_region *dst_reg, *src_reg;
> @@ -697,12 +718,13 @@ static void __i915_ttm_move(struct ttm_buffer_objec=
t *bo, bool clear,
>                 dst_iter =3D !cpu_maps_iomem(dst_mem) ?
>                         ttm_kmap_iter_tt_init(&_dst_iter.tt, dst_ttm) :
>                         ttm_kmap_iter_iomap_init(&_dst_iter.io, &dst_reg-=
>iomap,
> -                                                dst_st, dst_reg->region.=
start);
> +                                                &dst_rsgt->table,
> +                                                dst_reg->region.start);
>
>                 src_iter =3D !cpu_maps_iomem(bo->resource) ?
>                         ttm_kmap_iter_tt_init(&_src_iter.tt, bo->ttm) :
>                         ttm_kmap_iter_iomap_init(&_src_iter.io, &src_reg-=
>iomap,
> -                                                obj->ttm.cached_io_st,
> +                                                &obj->ttm.cached_io_rsgt=
->table,
>                                                  src_reg->region.start);
>
>                 ttm_move_memcpy(clear, dst_mem->num_pages, dst_iter, src_=
iter);
> @@ -718,7 +740,7 @@ static int i915_ttm_move(struct ttm_buffer_object *bo=
, bool evict,
>         struct ttm_resource_manager *dst_man =3D
>                 ttm_manager_type(bo->bdev, dst_mem->mem_type);
>         struct ttm_tt *ttm =3D bo->ttm;
> -       struct sg_table *dst_st;
> +       struct i915_refct_sgt *dst_rsgt;
>         bool clear;
>         int ret;
>
> @@ -744,22 +766,24 @@ static int i915_ttm_move(struct ttm_buffer_object *=
bo, bool evict,
>                         return ret;
>         }
>
> -       dst_st =3D i915_ttm_resource_get_st(obj, dst_mem);
> -       if (IS_ERR(dst_st))
> -               return PTR_ERR(dst_st);
> +       dst_rsgt =3D i915_ttm_resource_get_st(obj, dst_mem);
> +       if (IS_ERR(dst_rsgt))
> +               return PTR_ERR(dst_rsgt);
>
>         clear =3D !cpu_maps_iomem(bo->resource) && (!ttm || !ttm_tt_is_po=
pulated(ttm));
>         if (!(clear && ttm && !(ttm->page_flags & TTM_TT_FLAG_ZERO_ALLOC)=
))
> -               __i915_ttm_move(bo, clear, dst_mem, bo->ttm, dst_st, true=
);
> +               __i915_ttm_move(bo, clear, dst_mem, bo->ttm, dst_rsgt, tr=
ue);
>
>         ttm_bo_move_sync_cleanup(bo, dst_mem);
>         i915_ttm_adjust_domains_after_move(obj);
> -       i915_ttm_free_cached_io_st(obj);
> +       i915_ttm_free_cached_io_rsgt(obj);
>
>         if (gpu_binds_iomem(dst_mem) || cpu_maps_iomem(dst_mem)) {
> -               obj->ttm.cached_io_st =3D dst_st;
> -               obj->ttm.get_io_page.sg_pos =3D dst_st->sgl;
> +               obj->ttm.cached_io_rsgt =3D dst_rsgt;
> +               obj->ttm.get_io_page.sg_pos =3D dst_rsgt->table.sgl;
>                 obj->ttm.get_io_page.sg_idx =3D 0;
> +       } else {
> +               i915_refct_sgt_put(dst_rsgt);
>         }
>
>         i915_ttm_adjust_lru(obj);
> @@ -825,7 +849,6 @@ static int __i915_ttm_get_pages(struct drm_i915_gem_o=
bject *obj,
>                 .interruptible =3D true,
>                 .no_wait_gpu =3D false,
>         };
> -       struct sg_table *st;
>         int real_num_busy;
>         int ret;
>
> @@ -862,12 +885,16 @@ static int __i915_ttm_get_pages(struct drm_i915_gem=
_object *obj,
>         }
>
>         if (!i915_gem_object_has_pages(obj)) {
> -               /* Object either has a page vector or is an iomem object =
*/
> -               st =3D bo->ttm ? i915_ttm_tt_get_st(bo->ttm) : obj->ttm.c=
ached_io_st;
> -               if (IS_ERR(st))
> -                       return PTR_ERR(st);
> +               struct i915_refct_sgt *rsgt =3D
> +                       i915_ttm_resource_get_st(obj, bo->resource);
> +
> +               if (IS_ERR(rsgt))
> +                       return PTR_ERR(rsgt);
>
> -               __i915_gem_object_set_pages(obj, st, i915_sg_dma_sizes(st=
->sgl));
> +               GEM_BUG_ON(obj->mm.rsgt);
> +               obj->mm.rsgt =3D rsgt;
> +               __i915_gem_object_set_pages(obj, &rsgt->table,
> +                                           i915_sg_dma_sizes(rsgt->table=
.sgl));
>         }
>
>         i915_ttm_adjust_lru(obj);
> @@ -941,6 +968,9 @@ static void i915_ttm_put_pages(struct drm_i915_gem_ob=
ject *obj,
>          * If the object is not destroyed next, The TTM eviction logic
>          * and shrinkers will move it out if needed.
>          */
> +
> +       if (obj->mm.rsgt)
> +               i915_refct_sgt_put(fetch_and_zero(&obj->mm.rsgt));
>  }
>
>  static void i915_ttm_adjust_lru(struct drm_i915_gem_object *obj)
> @@ -1278,7 +1308,7 @@ int i915_gem_obj_copy_ttm(struct drm_i915_gem_objec=
t *dst,
>         struct ttm_operation_ctx ctx =3D {
>                 .interruptible =3D intr,
>         };
> -       struct sg_table *dst_st;
> +       struct i915_refct_sgt *dst_rsgt;
>         int ret;
>
>         assert_object_held(dst);
> @@ -1293,11 +1323,11 @@ int i915_gem_obj_copy_ttm(struct drm_i915_gem_obj=
ect *dst,
>         if (ret)
>                 return ret;
>
> -       dst_st =3D gpu_binds_iomem(dst_bo->resource) ?
> -               dst->ttm.cached_io_st : i915_ttm_tt_get_st(dst_bo->ttm);
> -
> +       dst_rsgt =3D i915_ttm_resource_get_st(dst, dst_bo->resource);
>         __i915_ttm_move(src_bo, false, dst_bo->resource, dst_bo->ttm,
> -                       dst_st, allow_accel);
> +                       dst_rsgt, allow_accel);
> +
> +       i915_refct_sgt_put(dst_rsgt);
>
>         return 0;
>  }
> diff --git a/drivers/gpu/drm/i915/i915_scatterlist.c b/drivers/gpu/drm/i9=
15/i915_scatterlist.c
> index 4a6712dca838..41f2adb6a583 100644
> --- a/drivers/gpu/drm/i915/i915_scatterlist.c
> +++ b/drivers/gpu/drm/i915/i915_scatterlist.c
> @@ -41,8 +41,32 @@ bool i915_sg_trim(struct sg_table *orig_st)
>         return true;
>  }
>
> +static void i915_refct_sgt_release(struct kref *ref)
> +{
> +       struct i915_refct_sgt *rsgt =3D
> +               container_of(ref, typeof(*rsgt), kref);
> +
> +       sg_free_table(&rsgt->table);

Ok, and sg_free_table seems to gracefully handle NULL sgl.

With the double kfree fixed,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
