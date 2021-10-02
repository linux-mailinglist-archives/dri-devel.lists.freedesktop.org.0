Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0E141FE6C
	for <lists+dri-devel@lfdr.de>; Sun,  3 Oct 2021 00:15:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 587716E859;
	Sat,  2 Oct 2021 22:15:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53F806E859
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Oct 2021 22:15:35 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id y23so14599017lfb.0
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Oct 2021 15:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J7Gs0YZo/yS+QSN5sYLpJlXAH6KcQo1tHEnqPF/PWto=;
 b=D9AIq6WePOGv3YMx+fwXIA0vsoB21rg0tNShhjIPZArX+R/PCI9U30As1AU4FIHcbD
 s23jSkF0V87eOJ6z9RbnQmb7mimNrcE3HiScRWKZ3bAVAI7CMsqK5n58odQHDtLm5IKR
 cReZWwttWiifbnyHO0vn+BgtdwG8w9TfHpoemHEoKyEJn4Kl3S0Xmqyh3rPp1GKdykOJ
 FA/K5/R3H3J+R+zzZ+GabKOvx2bAUTM2/gbIrKUirgPNVm6Nd+OFyZwn/0SdLgIk0PJp
 GGV3zB+NNj/Zb+5TfWzAjJLSwVNPz1exdy+UbcB8f79E8Xoh9JxYzDUSyzTA67sF2KjB
 ZQmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J7Gs0YZo/yS+QSN5sYLpJlXAH6KcQo1tHEnqPF/PWto=;
 b=exp6Ntgk23Lu5fLyDaOM9JQlVBclhasDhUYtLIndI5qvZK+tZGWiJlOpITA4mUj4Oy
 pYTkUbqXS8BVqD/QMDj696tENS3OYylWXi5D2Ec2Ycmz8+aZ5X7FV/hQEZxwcM6+Bc4I
 g/fH463M4nUI+1OWjywEsn1JmSp3WD2XmpOAAQqgd7oV/fv3OscJXA58jJaJraPzBkWg
 UbsUxjfdC9JPfYFPBoU7TBIkXuLTcZln3qEDTpgSvu6nIuCbPm2sccOprUQudknmwwiQ
 B1FEWk5OkwhDTaOtcTCavKn3YZPO8hKn3+G8I5BmAfrcEjHBKF5eExU2grBowVsdSb2C
 HA3A==
X-Gm-Message-State: AOAM530x2IjsbY8K9CY7OEjSpuEWvgfjIvrru3IMw8+mcekPjkN9nEUA
 Hp0L2Vpl7G3U9MVYMFJ66ogWWDt/iRD5MZnB+q8=
X-Google-Smtp-Source: ABdhPJxmh19UpehcUj2pFvOHq/N7d7WSB/xFAUA7QKfptQsfVXQh19WnRab3OSQFEGDwWC6Xcj5IosQYivheQZVVuIU=
X-Received: by 2002:a2e:8684:: with SMTP id l4mr6063726lji.32.1633212933536;
 Sat, 02 Oct 2021 15:15:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210928084446.22580-1-tzimmermann@suse.de>
 <20210928084446.22580-10-tzimmermann@suse.de>
In-Reply-To: <20210928084446.22580-10-tzimmermann@suse.de>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Sun, 3 Oct 2021 00:15:22 +0200
Message-ID: <CAMeQTsY=5hiYqNLkqbv=8iM0T5HOtL1JpHvFegiU7K9dSo_mVQ@mail.gmail.com>
Subject: Re: [PATCH 09/10] drm/gma500: Rewrite GTT page insert/remove without
 struct gtt_range
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
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

On Tue, Sep 28, 2021 at 10:44 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> struct gtt_range represents a GEM object and should not be used for GTT
> setup. Change psb_gtt_insert() and psb_gtt_remove() to receive all
> necessary parameters from their caller. This also eliminates possible
> failure from psb_gtt_insert().
>
> There's one exception in psb_gtt_restore(), which requires an upcast
> from struct resource to struct gtt_range when restoring the GTT after
> hibernation. A possible solution would track the GEM objects that need
> restoration separately from the GTT resource.

We could also treat the GTT as registers and save/restore it that way.
OFC that approach would waste a bit of memory.


>
> Rename the functions to psb_gtt_insert_pages() and psb_gtt_remove_pages()
> to reflect their similarity to MMU interfaces.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/gma500/gem.c | 13 ++----
>  drivers/gpu/drm/gma500/gtt.c | 87 ++++++++++++------------------------
>  drivers/gpu/drm/gma500/gtt.h |  5 ++-
>  3 files changed, 35 insertions(+), 70 deletions(-)
>
> diff --git a/drivers/gpu/drm/gma500/gem.c b/drivers/gpu/drm/gma500/gem.c
> index a88d51a3aa2a..fd556ba2c044 100644
> --- a/drivers/gpu/drm/gma500/gem.c
> +++ b/drivers/gpu/drm/gma500/gem.c
> @@ -23,7 +23,6 @@
>
>  int psb_gem_pin(struct gtt_range *gt)
>  {
> -       int ret = 0;
>         struct drm_device *dev = gt->gem.dev;
>         struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
>         u32 gpu_base = dev_priv->gtt.gatt_start;
> @@ -43,10 +42,7 @@ int psb_gem_pin(struct gtt_range *gt)
>
>         set_pages_array_wc(pages, npages);
>
> -       ret = psb_gtt_insert(dev, gt);
> -       if (ret)
> -               goto err_drm_gem_put_pages;
> -
> +       psb_gtt_insert_pages(dev_priv, &gt->resource, pages);
>         psb_mmu_insert_pages(psb_mmu_get_default_pd(dev_priv->mmu), pages,
>                              (gpu_base + gt->offset), npages, 0, 0,
>                              PSB_MMU_CACHED_MEMORY);
> @@ -59,10 +55,6 @@ int psb_gem_pin(struct gtt_range *gt)
>         mutex_unlock(&dev_priv->gtt_mutex);
>
>         return 0;
> -
> -err_drm_gem_put_pages:
> -       drm_gem_put_pages(&gt->gem, pages, true, false);
> -       return ret;
>  }
>
>  void psb_gem_unpin(struct gtt_range *gt)
> @@ -82,13 +74,14 @@ void psb_gem_unpin(struct gtt_range *gt)
>
>         psb_mmu_remove_pages(psb_mmu_get_default_pd(dev_priv->mmu),
>                                      (gpu_base + gt->offset), gt->npage, 0, 0);
> -       psb_gtt_remove(dev, gt);
> +       psb_gtt_remove_pages(dev_priv, &gt->resource);
>
>         /* Reset caching flags */
>         set_pages_array_wb(gt->pages, gt->npage);
>
>         drm_gem_put_pages(&gt->gem, gt->pages, true, false);
>         gt->pages = NULL;
> +       gt->npage = 0;
>
>  out:
>         mutex_unlock(&dev_priv->gtt_mutex);
> diff --git a/drivers/gpu/drm/gma500/gtt.c b/drivers/gpu/drm/gma500/gtt.c
> index 244de618e612..cf71a2396c16 100644
> --- a/drivers/gpu/drm/gma500/gtt.c
> +++ b/drivers/gpu/drm/gma500/gtt.c
> @@ -66,85 +66,51 @@ static inline uint32_t psb_gtt_mask_pte(uint32_t pfn, int type)
>         return (pfn << PAGE_SHIFT) | mask;
>  }
>
> -/**
> - *     psb_gtt_entry           -       find the GTT entries for a gtt_range
> - *     @dev: our DRM device
> - *     @r: our GTT range
> - *
> - *     Given a gtt_range object return the GTT offset of the page table
> - *     entries for this gtt_range
> - */
> -static u32 __iomem *psb_gtt_entry(struct drm_device *dev, struct gtt_range *r)
> +static u32 __iomem *psb_gtt_entry(struct drm_psb_private *pdev, const struct resource *res)
>  {
> -       struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
> -       unsigned long offset;
> -
> -       offset = r->resource.start - dev_priv->gtt_mem->start;
> +       unsigned long offset = res->start - pdev->gtt_mem->start;
>
> -       return dev_priv->gtt_map + (offset >> PAGE_SHIFT);
> +       return pdev->gtt_map + (offset >> PAGE_SHIFT);
>  }
>
> -/**
> - *     psb_gtt_insert  -       put an object into the GTT
> - *     @dev: our DRM device
> - *     @r: our GTT range
> - *
> - *     Take our preallocated GTT range and insert the GEM object into
> - *     the GTT. This is protected via the gtt mutex which the caller
> - *     must hold.
> - */
> -int psb_gtt_insert(struct drm_device *dev, struct gtt_range *r)
> +void psb_gtt_insert_pages(struct drm_psb_private *pdev, const struct resource *res,
> +                         struct page **pages)
>  {
> +       resource_size_t npages, i;
>         u32 __iomem *gtt_slot;
>         u32 pte;
> -       int i;
>
> -       if (r->pages == NULL) {
> -               WARN_ON(1);
> -               return -EINVAL;
> -       }
> -
> -       WARN_ON(r->stolen);     /* refcount these maybe ? */
> +       /* Write our page entries into the GTT itself */
>
> -       gtt_slot = psb_gtt_entry(dev, r);
> +       npages = resource_size(res) >> PAGE_SHIFT;
> +       gtt_slot = psb_gtt_entry(pdev, res);
>
> -       /* Write our page entries into the GTT itself */
> -       for (i = 0; i < r->npage; i++) {
> -               pte = psb_gtt_mask_pte(page_to_pfn(r->pages[i]),
> -                                      PSB_MMU_CACHED_MEMORY);
> -               iowrite32(pte, gtt_slot++);
> +       for (i = 0; i < npages; ++i, ++gtt_slot) {
> +               pte = psb_gtt_mask_pte(page_to_pfn(pages[i]), PSB_MMU_CACHED_MEMORY);
> +               iowrite32(pte, gtt_slot);
>         }
>
>         /* Make sure all the entries are set before we return */
>         ioread32(gtt_slot - 1);
> -
> -       return 0;
>  }
>
> -/**
> - *     psb_gtt_remove  -       remove an object from the GTT
> - *     @dev: our DRM device
> - *     @r: our GTT range
> - *
> - *     Remove a preallocated GTT range from the GTT. Overwrite all the
> - *     page table entries with the dummy page. This is protected via the gtt
> - *     mutex which the caller must hold.
> - */
> -void psb_gtt_remove(struct drm_device *dev, struct gtt_range *r)
> +void psb_gtt_remove_pages(struct drm_psb_private *pdev, const struct resource *res)
>  {
> -       struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
> +       resource_size_t npages, i;
>         u32 __iomem *gtt_slot;
>         u32 pte;
> -       int i;
>
> -       WARN_ON(r->stolen);
> +       /* Install scratch page for the resource */
> +
> +       pte = psb_gtt_mask_pte(page_to_pfn(pdev->scratch_page), PSB_MMU_CACHED_MEMORY);
>
> -       gtt_slot = psb_gtt_entry(dev, r);
> -       pte = psb_gtt_mask_pte(page_to_pfn(dev_priv->scratch_page),
> -                              PSB_MMU_CACHED_MEMORY);
> +       npages = resource_size(res) >> PAGE_SHIFT;
> +       gtt_slot = psb_gtt_entry(pdev, res);
>
> -       for (i = 0; i < r->npage; i++)
> -               iowrite32(pte, gtt_slot++);
> +       for (i = 0; i < npages; ++i, ++gtt_slot)
> +               iowrite32(pte, gtt_slot);
> +
> +       /* Make sure all the entries are set before we return */
>         ioread32(gtt_slot - 1);
>  }
>
> @@ -334,9 +300,14 @@ int psb_gtt_restore(struct drm_device *dev)
>         psb_gtt_init(dev, 1);
>
>         while (r != NULL) {
> +               /*
> +                * TODO: GTT restoration needs a refactoring, so that we don't have to touch
> +                *       struct gtt_range here. The type represents a GEM object and is not
> +                *       related to the GTT itself.
> +                */
>                 range = container_of(r, struct gtt_range, resource);
>                 if (range->pages) {
> -                       psb_gtt_insert(dev, range);
> +                       psb_gtt_insert_pages(dev_priv, &range->resource, range->pages);
>                         size += range->resource.end - range->resource.start;
>                         restored++;
>                 }
> diff --git a/drivers/gpu/drm/gma500/gtt.h b/drivers/gpu/drm/gma500/gtt.h
> index 7af71617e0c5..6a28e24a18b7 100644
> --- a/drivers/gpu/drm/gma500/gtt.h
> +++ b/drivers/gpu/drm/gma500/gtt.h
> @@ -49,7 +49,8 @@ int psb_gtt_allocate_resource(struct drm_psb_private *pdev, struct resource *res
>                               const char *name, resource_size_t size, resource_size_t align,
>                               bool stolen, u32 offset[static 1]);
>
> -int psb_gtt_insert(struct drm_device *dev, struct gtt_range *r);
> -void psb_gtt_remove(struct drm_device *dev, struct gtt_range *r);
> +void psb_gtt_insert_pages(struct drm_psb_private *pdev, const struct resource *res,
> +                         struct page **pages);
> +void psb_gtt_remove_pages(struct drm_psb_private *pdev, const struct resource *res);
>
>  #endif
> --
> 2.33.0
>
