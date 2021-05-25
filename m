Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E63138FD9A
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 11:19:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A6C26E9CE;
	Tue, 25 May 2021 09:19:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [IPv6:2607:f8b0:4864:20::f29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E52DC6E1D6;
 Tue, 25 May 2021 09:19:11 +0000 (UTC)
Received: by mail-qv1-xf29.google.com with SMTP id z1so15646813qvo.4;
 Tue, 25 May 2021 02:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tdYUMadvtxpD5C8t144m5ZylELjq6xl47cMITxlfnMM=;
 b=PY+WK9LqmIYsaXnihf3lQ+Puw3/axj43oLCxYbhgzSJLQYmO7TG0SJr7cKiRfUMGap
 Uoq70UKPGrzxBYoAw9/h9/6rKJTfyQ7LNWG1qTRNJIAYQr2tIMKw5IPpBHKag3ATOE47
 tEB07Ys64SY1nBZEwjyQW3++rcdsdv9vchfd5PuiDolsHQES0aDn8Hzui0MQ/H4eRqrz
 JrDSwtq5wepRDJ6fm8Wu1LA4zfb1HP8JcR7y8nAYMcIjhgzvKmaAjoyMccZvHUYcEHFe
 HeHJErA13C4+Zl7Gu8GWqxEkPRYNHKqDYc6sA/Y6Rq42xJ+D375C2bgXAdnXHG11OuhJ
 wiXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tdYUMadvtxpD5C8t144m5ZylELjq6xl47cMITxlfnMM=;
 b=pU06txv1ApGacYF/jyNoMjb674P2uJQtbEK5yH3VI8DoTQ6/e64paMcjmM2YtzucKd
 z2GEJZnN1QA24ZLf8ZGciN0bqS23ddjtOgWzaPawfxg/9rwEstHX5RBzjc8gMqQQfZ8P
 pH7Kcu0/pUnd5han7JhLWzCelZOxhEalvBx2vDo2mOOV2lh6OH+8kP/m54ShOcdz7fah
 ksHEniDveafiwyu3XoBND9D0NF1wDm4iVVgik8J0v/5h8014YKNQhRJKFdWsOpatsLZn
 vtTmsGJHROanehDkIeby82h615GeSUt+0Xxf8W0U9/QVBBMFjq0XuynVNEyzfrcVWXcF
 8Mig==
X-Gm-Message-State: AOAM533mxt/x5/sunm2YvqGCtKxWDtQfKd786wMDH7vVz69jLB3aQyEG
 x7W4ZOnKmGk5lSPv1ocLwhVvaT5yDEqIjEDZqvQ=
X-Google-Smtp-Source: ABdhPJyeVfzlyiX5ZZDZf+H1Yr3jyj7/9zjwbGFqeLk7bdwEHUPOYhiSWJeccRmq22R98qZnTmr82PO2Ei24W+TGQRw=
X-Received: by 2002:ad4:580c:: with SMTP id dd12mr35869710qvb.48.1621934350834; 
 Tue, 25 May 2021 02:19:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210521153253.518037-1-thomas.hellstrom@linux.intel.com>
 <20210521153253.518037-7-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20210521153253.518037-7-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 25 May 2021 10:18:44 +0100
Message-ID: <CAM0jSHM9SOPKkvbzUgFacqURXY_QbKcJ=3K_8Tdh4jjxm0nA3Q@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v3 06/12] drm/ttm: Add a generic TTM memcpy
 move for page-based iomem
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
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 21 May 2021 at 16:33, Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
> The internal ttm_bo_util memcpy uses ioremap functionality, and while it
> probably might be possible to use it for copying in- and out of
> sglist represented io memory, using io_mem_reserve() / io_mem_free()
> callbacks, that would cause problems with fault().
> Instead, implement a method mapping page-by-page using kmap_local()
> semantics. As an additional benefit we then avoid the occasional global
> TLB flushes of ioremap() and consuming ioremap space, elimination of a
> critical point of failure and with a slight change of semantics we could
> also push the memcpy out async for testing and async driver development
> purposes.
>
> A special linear iomem iterator is introduced internally to mimic the
> old ioremap behaviour for code-paths that can't immediately be ported
> over. This adds to the code size and should be considered a temporary
> solution.
>
> Looking at the code we have a lot of checks for iomap tagged pointers.
> Ideally we should extend the core memremap functions to also accept
> uncached memory and kmap_local functionality. Then we could strip a
> lot of code.
>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> ---
> v3:
> - Split up in various TTM files and addressed review comments by
>   Christian K=C3=B6nig. Tested and fixed legacy iomap memcpy path on i915=
.
> ---
>  drivers/gpu/drm/ttm/ttm_bo_util.c  | 278 ++++++++++-------------------
>  drivers/gpu/drm/ttm/ttm_module.c   |  35 ++++
>  drivers/gpu/drm/ttm/ttm_resource.c | 166 +++++++++++++++++
>  drivers/gpu/drm/ttm/ttm_tt.c       |  42 +++++
>  include/drm/ttm/ttm_bo_driver.h    |  28 +++
>  include/drm/ttm/ttm_caching.h      |   2 +
>  include/drm/ttm/ttm_kmap_iter.h    |  61 +++++++
>  include/drm/ttm/ttm_resource.h     |  61 +++++++
>  include/drm/ttm/ttm_tt.h           |  16 ++
>  9 files changed, 508 insertions(+), 181 deletions(-)
>  create mode 100644 include/drm/ttm/ttm_kmap_iter.h
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_=
bo_util.c
> index ae8b61460724..912cbe8e60a2 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -72,190 +72,126 @@ void ttm_mem_io_free(struct ttm_device *bdev,
>         mem->bus.addr =3D NULL;
>  }
>
> -static int ttm_resource_ioremap(struct ttm_device *bdev,
> -                              struct ttm_resource *mem,
> -                              void **virtual)
> +/**
> + * ttm_move_memcpy - Helper to perform a memcpy ttm move operation.
> + * @bo: The struct ttm_buffer_object.
> + * @new_mem: The struct ttm_resource we're moving to (copy destination).
> + * @new_iter: A struct ttm_kmap_iter representing the destination resour=
ce.
> + * @src_iter: A struct ttm_kmap_iter representing the source resource.
> + *
> + * This function is intended to be able to move out async under a
> + * dma-fence if desired.
> + */
> +void ttm_move_memcpy(struct ttm_buffer_object *bo,
> +                    struct ttm_resource *dst_mem,
> +                    struct ttm_kmap_iter *dst_iter,
> +                    struct ttm_kmap_iter *src_iter)
>  {
> -       int ret;
> -       void *addr;
> -
> -       *virtual =3D NULL;
> -       ret =3D ttm_mem_io_reserve(bdev, mem);
> -       if (ret || !mem->bus.is_iomem)
> -               return ret;
> +       const struct ttm_kmap_iter_ops *dst_ops =3D dst_iter->ops;
> +       const struct ttm_kmap_iter_ops *src_ops =3D src_iter->ops;
> +       struct ttm_tt *ttm =3D bo->ttm;
> +       struct dma_buf_map src_map, dst_map;
> +       pgoff_t i;
>
> -       if (mem->bus.addr) {
> -               addr =3D mem->bus.addr;
> -       } else {
> -               size_t bus_size =3D (size_t)mem->num_pages << PAGE_SHIFT;
> +       /* Single TTM move. NOP */
> +       if (dst_ops->maps_tt && src_ops->maps_tt)
> +               return;
>
> -               if (mem->bus.caching =3D=3D ttm_write_combined)
> -                       addr =3D ioremap_wc(mem->bus.offset, bus_size);
> -#ifdef CONFIG_X86
> -               else if (mem->bus.caching =3D=3D ttm_cached)
> -                       addr =3D ioremap_cache(mem->bus.offset, bus_size)=
;
> -#endif
> -               else
> -                       addr =3D ioremap(mem->bus.offset, bus_size);
> -               if (!addr) {
> -                       ttm_mem_io_free(bdev, mem);
> -                       return -ENOMEM;
> +       /* Don't move nonexistent data. Clear destination instead. */
> +       if (src_ops->maps_tt && (!ttm || !ttm_tt_is_populated(ttm))) {
> +               if (ttm && !(ttm->page_flags & TTM_PAGE_FLAG_ZERO_ALLOC))
> +                       return;
> +
> +               for (i =3D 0; i < dst_mem->num_pages; ++i) {
> +                       dst_ops->map_local(dst_iter, &dst_map, i);
> +                       if (dst_map.is_iomem)
> +                               memset_io(dst_map.vaddr_iomem, 0, PAGE_SI=
ZE);
> +                       else
> +                               memset(dst_map.vaddr, 0, PAGE_SIZE);
> +                       if (dst_ops->unmap_local)
> +                               dst_ops->unmap_local(dst_iter, &dst_map);
>                 }
> +               return;
>         }
> -       *virtual =3D addr;
> -       return 0;
> -}
> -
> -static void ttm_resource_iounmap(struct ttm_device *bdev,
> -                               struct ttm_resource *mem,
> -                               void *virtual)
> -{
> -       if (virtual && mem->bus.addr =3D=3D NULL)
> -               iounmap(virtual);
> -       ttm_mem_io_free(bdev, mem);
> -}
> -
> -static int ttm_copy_io_page(void *dst, void *src, unsigned long page)
> -{
> -       uint32_t *dstP =3D
> -           (uint32_t *) ((unsigned long)dst + (page << PAGE_SHIFT));
> -       uint32_t *srcP =3D
> -           (uint32_t *) ((unsigned long)src + (page << PAGE_SHIFT));
> -
> -       int i;
> -       for (i =3D 0; i < PAGE_SIZE / sizeof(uint32_t); ++i)
> -               iowrite32(ioread32(srcP++), dstP++);
> -       return 0;
> -}
> -
> -static int ttm_copy_io_ttm_page(struct ttm_tt *ttm, void *src,
> -                               unsigned long page,
> -                               pgprot_t prot)
> -{
> -       struct page *d =3D ttm->pages[page];
> -       void *dst;
> -
> -       if (!d)
> -               return -ENOMEM;
> -
> -       src =3D (void *)((unsigned long)src + (page << PAGE_SHIFT));
> -       dst =3D kmap_atomic_prot(d, prot);
> -       if (!dst)
> -               return -ENOMEM;
> -
> -       memcpy_fromio(dst, src, PAGE_SIZE);
> -
> -       kunmap_atomic(dst);
> -
> -       return 0;
> -}
> -
> -static int ttm_copy_ttm_io_page(struct ttm_tt *ttm, void *dst,
> -                               unsigned long page,
> -                               pgprot_t prot)
> -{
> -       struct page *s =3D ttm->pages[page];
> -       void *src;
> -
> -       if (!s)
> -               return -ENOMEM;
> -
> -       dst =3D (void *)((unsigned long)dst + (page << PAGE_SHIFT));
> -       src =3D kmap_atomic_prot(s, prot);
> -       if (!src)
> -               return -ENOMEM;
>
> -       memcpy_toio(dst, src, PAGE_SIZE);
> -
> -       kunmap_atomic(src);
> +       for (i =3D 0; i < dst_mem->num_pages; ++i) {
> +               dst_ops->map_local(dst_iter, &dst_map, i);
> +               src_ops->map_local(src_iter, &src_map, i);
> +
> +               if (!src_map.is_iomem && !dst_map.is_iomem) {
> +                       memcpy(dst_map.vaddr, src_map.vaddr, PAGE_SIZE);
> +               } else if (!src_map.is_iomem) {
> +                       dma_buf_map_memcpy_to(&dst_map, src_map.vaddr,
> +                                             PAGE_SIZE);
> +               } else if (!dst_map.is_iomem) {
> +                       memcpy_fromio(dst_map.vaddr, src_map.vaddr_iomem,
> +                                     PAGE_SIZE);
> +               } else {
> +                       int j;
> +                       u32 __iomem *src =3D src_map.vaddr_iomem;
> +                       u32 __iomem *dst =3D dst_map.vaddr_iomem;
>
> -       return 0;
> +                       for (j =3D 0; j < (PAGE_SIZE >> 2); ++j)

IMO PAGE_SIZE / sizeof(u32) is easier to understand.

> +                               iowrite32(ioread32(src++), dst++);
> +               }
> +               if (src_ops->unmap_local)
> +                       src_ops->unmap_local(src_iter, &src_map);
> +               if (dst_ops->unmap_local)
> +                       dst_ops->unmap_local(dst_iter, &dst_map);
> +       }
>  }
> +EXPORT_SYMBOL(ttm_move_memcpy);
>
>  int ttm_bo_move_memcpy(struct ttm_buffer_object *bo,
>                        struct ttm_operation_ctx *ctx,
> -                      struct ttm_resource *new_mem)
> +                      struct ttm_resource *dst_mem)
>  {
>         struct ttm_device *bdev =3D bo->bdev;
> -       struct ttm_resource_manager *man =3D ttm_manager_type(bdev, new_m=
em->mem_type);
> +       struct ttm_resource_manager *dst_man =3D
> +               ttm_manager_type(bo->bdev, dst_mem->mem_type);
>         struct ttm_tt *ttm =3D bo->ttm;
> -       struct ttm_resource *old_mem =3D &bo->mem;
> -       struct ttm_resource old_copy =3D *old_mem;
> -       void *old_iomap;
> -       void *new_iomap;
> +       struct ttm_resource *src_mem =3D &bo->mem;
> +       struct ttm_resource_manager *src_man =3D
> +               ttm_manager_type(bdev, src_mem->mem_type);
> +       struct ttm_resource src_copy =3D *src_mem;
> +       union {
> +               struct ttm_kmap_iter_tt tt;
> +               struct ttm_kmap_iter_linear_io io;
> +       } _dst_iter, _src_iter;
> +       struct ttm_kmap_iter *dst_iter, *src_iter;
>         int ret;
> -       unsigned long i;
>
> -       ret =3D ttm_bo_wait_ctx(bo, ctx);
> -       if (ret)
> -               return ret;
> -
> -       ret =3D ttm_resource_ioremap(bdev, old_mem, &old_iomap);
> -       if (ret)
> -               return ret;
> -       ret =3D ttm_resource_ioremap(bdev, new_mem, &new_iomap);
> -       if (ret)
> -               goto out;
> -
> -       /*
> -        * Single TTM move. NOP.
> -        */
> -       if (old_iomap =3D=3D NULL && new_iomap =3D=3D NULL)
> -               goto out2;
> -
> -       /*
> -        * Don't move nonexistent data. Clear destination instead.
> -        */
> -       if (old_iomap =3D=3D NULL &&
> -           (ttm =3D=3D NULL || (!ttm_tt_is_populated(ttm) &&
> -                            !(ttm->page_flags & TTM_PAGE_FLAG_SWAPPED)))=
) {
> -               memset_io(new_iomap, 0, new_mem->num_pages*PAGE_SIZE);
> -               goto out2;
> -       }
> -
> -       /*
> -        * TTM might be null for moves within the same region.
> -        */
> -       if (ttm) {
> +       if (ttm && ((ttm->page_flags & TTM_PAGE_FLAG_SWAPPED) ||
> +                   dst_man->use_tt)) {
>                 ret =3D ttm_tt_populate(bdev, ttm, ctx);
>                 if (ret)
> -                       goto out1;
> +                       return ret;
>         }
>
> -       for (i =3D 0; i < new_mem->num_pages; ++i) {
> -               if (old_iomap =3D=3D NULL) {
> -                       pgprot_t prot =3D ttm_io_prot(bo, old_mem, PAGE_K=
ERNEL);
> -                       ret =3D ttm_copy_ttm_io_page(ttm, new_iomap, i,
> -                                                  prot);
> -               } else if (new_iomap =3D=3D NULL) {
> -                       pgprot_t prot =3D ttm_io_prot(bo, new_mem, PAGE_K=
ERNEL);
> -                       ret =3D ttm_copy_io_ttm_page(ttm, old_iomap, i,
> -                                                  prot);
> -               } else {
> -                       ret =3D ttm_copy_io_page(new_iomap, old_iomap, i)=
;
> -               }
> -               if (ret)
> -                       goto out1;
> +       dst_iter =3D ttm_kmap_iter_linear_io_init(&_dst_iter.io, bdev, ds=
t_mem);
> +       if (PTR_ERR(dst_iter) =3D=3D -EINVAL && dst_man->use_tt)
> +               dst_iter =3D ttm_kmap_iter_tt_init(&_dst_iter.tt, bo->ttm=
);
> +       if (IS_ERR(dst_iter))
> +               return PTR_ERR(dst_iter);
> +
> +       src_iter =3D ttm_kmap_iter_linear_io_init(&_src_iter.io, bdev, sr=
c_mem);
> +       if (PTR_ERR(src_iter) =3D=3D -EINVAL && src_man->use_tt)
> +               src_iter =3D ttm_kmap_iter_tt_init(&_src_iter.tt, bo->ttm=
);
> +       if (IS_ERR(src_iter)) {
> +               ret =3D PTR_ERR(src_iter);
> +               goto out_src_iter;
>         }
> -       mb();
> -out2:
> -       old_copy =3D *old_mem;
>
> -       ttm_bo_assign_mem(bo, new_mem);
> -
> -       if (!man->use_tt)
> -               ttm_bo_tt_destroy(bo);
> +       ttm_move_memcpy(bo, dst_mem, dst_iter, src_iter);
> +       src_copy =3D *src_mem;
> +       ttm_bo_move_sync_cleanup(bo, dst_mem);
>
> -out1:
> -       ttm_resource_iounmap(bdev, old_mem, new_iomap);
> -out:
> -       ttm_resource_iounmap(bdev, &old_copy, old_iomap);
> +       if (!src_iter->ops->maps_tt)
> +               ttm_kmap_iter_linear_io_fini(&_src_iter.io, bdev, &src_co=
py);
> +out_src_iter:
> +       if (!dst_iter->ops->maps_tt)
> +               ttm_kmap_iter_linear_io_fini(&_dst_iter.io, bdev, dst_mem=
);
>
> -       /*
> -        * On error, keep the mm node!
> -        */
> -       if (!ret)
> -               ttm_resource_free(bo, &old_copy);
>         return ret;
>  }
>  EXPORT_SYMBOL(ttm_bo_move_memcpy);
> @@ -336,27 +272,7 @@ pgprot_t ttm_io_prot(struct ttm_buffer_object *bo, s=
truct ttm_resource *res,
>         man =3D ttm_manager_type(bo->bdev, res->mem_type);
>         caching =3D man->use_tt ? bo->ttm->caching : res->bus.caching;
>
> -       /* Cached mappings need no adjustment */
> -       if (caching =3D=3D ttm_cached)
> -               return tmp;
> -
> -#if defined(__i386__) || defined(__x86_64__)
> -       if (caching =3D=3D ttm_write_combined)
> -               tmp =3D pgprot_writecombine(tmp);
> -       else if (boot_cpu_data.x86 > 3)
> -               tmp =3D pgprot_noncached(tmp);
> -#endif
> -#if defined(__ia64__) || defined(__arm__) || defined(__aarch64__) || \
> -    defined(__powerpc__) || defined(__mips__)
> -       if (caching =3D=3D ttm_write_combined)
> -               tmp =3D pgprot_writecombine(tmp);
> -       else
> -               tmp =3D pgprot_noncached(tmp);
> -#endif
> -#if defined(__sparc__)
> -       tmp =3D pgprot_noncached(tmp);
> -#endif
> -       return tmp;
> +       return ttm_prot_from_caching(caching, tmp);
>  }
>  EXPORT_SYMBOL(ttm_io_prot);
>
> diff --git a/drivers/gpu/drm/ttm/ttm_module.c b/drivers/gpu/drm/ttm/ttm_m=
odule.c
> index 56b0efdba1a9..997c458f68a9 100644
> --- a/drivers/gpu/drm/ttm/ttm_module.c
> +++ b/drivers/gpu/drm/ttm/ttm_module.c
> @@ -31,12 +31,47 @@
>   */
>  #include <linux/module.h>
>  #include <linux/device.h>
> +#include <linux/pgtable.h>
>  #include <linux/sched.h>
>  #include <linux/debugfs.h>
>  #include <drm/drm_sysfs.h>
> +#include <drm/ttm/ttm_caching.h>
>
>  #include "ttm_module.h"
>
> +/**
> + * ttm_prot_from_caching - Modify the page protection according to the
> + * ttm cacing mode
> + * @caching: The ttm caching mode
> + * @tmp: The original page protection
> + *
> + * Return: The modified page protection
> + */
> +pgprot_t ttm_prot_from_caching(enum ttm_caching caching, pgprot_t tmp)
> +{
> +       /* Cached mappings need no adjustment */
> +       if (caching =3D=3D ttm_cached)
> +               return tmp;
> +
> +#if defined(__i386__) || defined(__x86_64__)
> +       if (caching =3D=3D ttm_write_combined)
> +               tmp =3D pgprot_writecombine(tmp);
> +       else if (boot_cpu_data.x86 > 3)
> +               tmp =3D pgprot_noncached(tmp);
> +#endif
> +#if defined(__ia64__) || defined(__arm__) || defined(__aarch64__) || \
> +       defined(__powerpc__) || defined(__mips__)
> +       if (caching =3D=3D ttm_write_combined)
> +               tmp =3D pgprot_writecombine(tmp);
> +       else
> +               tmp =3D pgprot_noncached(tmp);
> +#endif
> +#if defined(__sparc__)
> +       tmp =3D pgprot_noncached(tmp);
> +#endif
> +       return tmp;
> +}
> +
>  struct dentry *ttm_debugfs_root;
>
>  static int __init ttm_init(void)
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm=
_resource.c
> index 59e2b7157e41..e05ae7e3d477 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -22,6 +22,10 @@
>   * Authors: Christian K=C3=B6nig
>   */
>
> +#include <linux/dma-buf-map.h>
> +#include <linux/io-mapping.h>
> +#include <linux/scatterlist.h>
> +
>  #include <drm/ttm/ttm_resource.h>
>  #include <drm/ttm/ttm_bo_driver.h>
>
> @@ -147,3 +151,165 @@ void ttm_resource_manager_debug(struct ttm_resource=
_manager *man,
>                 man->func->debug(man, p);
>  }
>  EXPORT_SYMBOL(ttm_resource_manager_debug);
> +
> +static void ttm_kmap_iter_iomap_map_local(struct ttm_kmap_iter *iter,
> +                                         struct dma_buf_map *dmap,
> +                                         pgoff_t i)
> +{
> +       struct ttm_kmap_iter_iomap *iter_io =3D
> +               container_of(iter, typeof(*iter_io), base);
> +       void __iomem *addr;
> +
> +retry:
> +       while (i >=3D iter_io->cache.end) {
> +               iter_io->cache.sg =3D iter_io->cache.sg ?
> +                       sg_next(iter_io->cache.sg) : iter_io->st->sgl;
> +               iter_io->cache.i =3D iter_io->cache.end;
> +               iter_io->cache.end +=3D sg_dma_len(iter_io->cache.sg) >>
> +                       PAGE_SHIFT;
> +               iter_io->cache.offs =3D sg_dma_address(iter_io->cache.sg)=
 -
> +                       iter_io->start;
> +       }
> +
> +       if (i < iter_io->cache.i) {
> +               iter_io->cache.end =3D 0;
> +               iter_io->cache.sg =3D NULL;
> +               goto retry;
> +       }
> +
> +       addr =3D io_mapping_map_local_wc(iter_io->iomap, iter_io->cache.o=
ffs +
> +                                      (((resource_size_t)i - iter_io->ca=
che.i)
> +                                       << PAGE_SHIFT));
> +       dma_buf_map_set_vaddr_iomem(dmap, addr);
> +}
> +
> +static void ttm_kmap_iter_iomap_unmap_local(struct ttm_kmap_iter *iter,
> +                                           struct dma_buf_map *map)
> +{
> +       io_mapping_unmap_local(map->vaddr_iomem);
> +}
> +
> +static const struct ttm_kmap_iter_ops ttm_kmap_iter_io_ops =3D {
> +       .map_local =3D  ttm_kmap_iter_iomap_map_local,
> +       .unmap_local =3D ttm_kmap_iter_iomap_unmap_local,
> +       .maps_tt =3D false,
> +};
> +
> +/**
> + * ttm_kmap_iter_iomap_init - Initialize a struct ttm_kmap_iter_iomap
> + * @iter_io: The struct ttm_kmap_iter_iomap to initialize.
> + * @iomap: The struct io_mapping representing the underlying linear io_m=
emory.
> + * @st: sg_table into @iomap, representing the memory of the struct
> + * ttm_resource.
> + * @start: Offset that needs to be subtracted from @st to make
> + * sg_dma_address(st->sgl) - @start =3D=3D 0 for @iomap start.
> + *
> + * Return: Pointer to the embedded struct ttm_kmap_iter.
> + */
> +struct ttm_kmap_iter *
> +ttm_kmap_iter_iomap_init(struct ttm_kmap_iter_iomap *iter_io,
> +                        struct io_mapping *iomap,
> +                        struct sg_table *st,
> +                        resource_size_t start)
> +{
> +       iter_io->base.ops =3D &ttm_kmap_iter_io_ops;
> +       iter_io->iomap =3D iomap;
> +       iter_io->st =3D st;
> +       iter_io->start =3D start;
> +       memset(&iter_io->cache, 0, sizeof(iter_io->cache));
> +
> +       return &iter_io->base;
> +}
> +EXPORT_SYMBOL(ttm_kmap_iter_iomap_init);
> +
> +/**
> + * DOC: Linear io iterator
> + *
> + * This code should die in the not too near future. Best would be if we =
could
> + * make io-mapping use memremap for all io memory, and have memremap
> + * implement a kmap_local functionality. We could then strip a huge amou=
nt of
> + * code. These linear io iterators are implemented to mimic old function=
ality,
> + * and they don't use kmap_local semantics at all internally. Rather ior=
emap or
> + * friends, and at least on 32-bit they add global TLB flushes and point=
s
> + * of failure.
> + */
> +
> +static void ttm_kmap_iter_linear_io_map_local(struct ttm_kmap_iter *iter=
,
> +                                             struct dma_buf_map *dmap,
> +                                             pgoff_t i)
> +{
> +       struct ttm_kmap_iter_linear_io *iter_io =3D
> +               container_of(iter, typeof(*iter_io), base);
> +
> +       *dmap =3D iter_io->dmap;
> +       dma_buf_map_incr(dmap, i * PAGE_SIZE);
> +}
> +
> +static const struct ttm_kmap_iter_ops ttm_kmap_iter_linear_io_ops =3D {
> +       .map_local =3D  ttm_kmap_iter_linear_io_map_local,
> +       .maps_tt =3D false,
> +};
> +
> +struct ttm_kmap_iter *
> +ttm_kmap_iter_linear_io_init(struct ttm_kmap_iter_linear_io *iter_io,
> +                            struct ttm_device *bdev,
> +                            struct ttm_resource *mem)
> +{
> +       int ret;
> +
> +       ret =3D ttm_mem_io_reserve(bdev, mem);
> +       if (ret)
> +               goto out_err;
> +       if (!mem->bus.is_iomem) {
> +               ret =3D -EINVAL;
> +               goto out_io_free;
> +       }
> +
> +       if (mem->bus.addr) {
> +               dma_buf_map_set_vaddr(&iter_io->dmap, mem->bus.addr);
> +               iter_io->needs_unmap =3D false;
> +       } else {
> +               size_t bus_size =3D (size_t)mem->num_pages << PAGE_SHIFT;
> +
> +               iter_io->needs_unmap =3D true;
> +               if (mem->bus.caching =3D=3D ttm_write_combined)
> +                       dma_buf_map_set_vaddr_iomem(&iter_io->dmap,
> +                                                   ioremap_wc(mem->bus.o=
ffset,
> +                                                              bus_size))=
;
> +               else if (mem->bus.caching =3D=3D ttm_cached)
> +                       dma_buf_map_set_vaddr(&iter_io->dmap,
> +                                             memremap(mem->bus.offset, b=
us_size,
> +                                                      MEMREMAP_WB));

The comments in set_vaddr suggest that this is meant for
system-memory. Does that actually matter or is it just about not
losing the __iomem annotation on platforms where it matters?
Apparently cached device local is a thing. Also should this not be
wrapped in CONFIG_X86?
