Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1231842A644
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 15:43:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA5D789F69;
	Tue, 12 Oct 2021 13:42:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30B0489F69
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Oct 2021 13:42:56 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id p16so17258883lfa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Oct 2021 06:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wXobCdZpwsOmQ/3r23oquDOwsG8zIl2g/ZP5u5brpkM=;
 b=QmkouPQY64qhYjoMRHzjf5ZN9ATlBkTcKfis93KBBqvNBwKF37wBYIeyRZZGfp+ZiT
 NwxudD32W1cTCkxQQ47Wkxiehi/KmsWTOteSftutwvKHc9LWslpQ3kzmGTp8rdaMNRnb
 SQUXgj0jDee0Eba+4UA/pACOaUrryIaTU4xzQmBYyL4lf3SnMW1CG0aPonyYzLO8f04d
 NJkYNj0I8lb6wEcQMRKKHvWbYlOtA9/a0CQOZaRnIdiYsDSATiWBL5C2WInei8/hQ3Do
 erAewJRxf6WCk63mV6gi0Y4h4TlrTuO3OKg2OvD1EK0Mh0rKc9np5SUjWXqWKxz1XTOM
 gCFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wXobCdZpwsOmQ/3r23oquDOwsG8zIl2g/ZP5u5brpkM=;
 b=xKik7ArqkCVkJ6QZkUc5dUTm3tBYTfy7NQI3POuFzNPVxI7ewmIWGPR3j+kTUgOb2M
 THou65vOJJBz3LpBfvZWOhUc0mOldIkDS/JiR/80tMeAKikV6qbMFtD6kd7uihPRST3R
 65PQLqlnjIwamaBuLcsJ2B/QRDNNUg6+PGGYM03jkr2v23NEyVqzyC0kRVna0+ZdRlPc
 VyoxwDB3TYwFzI35WYtUkz+z6DLnx0HAtAzbS4MuAWjnlZBpm7yYcJVeqoZssCBKNXQV
 ngFrY4WYtpHmL0LX7kCHLK0JMmcx6HFknEtqbiTkOfGi/jaUT42K4Ri8rX7OauvSf75g
 nahw==
X-Gm-Message-State: AOAM531vfNs9sSBAEyGDOTRBtYenfiqMwBzhWod/RtRXbyrZbvXs3VIW
 o/U61nHTwPEoCQ9LnBh6mxl2Ni5bCFBR6Y7XNEe2rgB6
X-Google-Smtp-Source: ABdhPJyEdbPbsS0hw94dPO8geNmEotQAEN+K0M77t0A42YmOJ6pWRnXUbjL0pSxJ7aiQ1pl1PuR5w0e95mToIuegmbg=
X-Received: by 2002:a2e:b603:: with SMTP id r3mr4132446ljn.14.1634046174363;
 Tue, 12 Oct 2021 06:42:54 -0700 (PDT)
MIME-Version: 1.0
References: <20211005081151.23612-1-tzimmermann@suse.de>
 <20211005081151.23612-10-tzimmermann@suse.de>
In-Reply-To: <20211005081151.23612-10-tzimmermann@suse.de>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Tue, 12 Oct 2021 15:42:43 +0200
Message-ID: <CAMeQTsY=9UQn2Mk-6X2-OPF1codFKKZLyoJ8zLpDq9vEyUK3cQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/10] drm/gma500: Rewrite GTT page insert/remove
 without struct gtt_range
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

On Tue, Oct 5, 2021 at 10:11 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
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
>
> Rename the functions to psb_gtt_insert_pages() and psb_gtt_remove_pages()
> to reflect their similarity to MMU interfaces.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/gma500/gem.c | 12 ++---
>  drivers/gpu/drm/gma500/gtt.c | 87 ++++++++++++------------------------
>  drivers/gpu/drm/gma500/gtt.h |  5 ++-
>  3 files changed, 36 insertions(+), 68 deletions(-)
>
> diff --git a/drivers/gpu/drm/gma500/gem.c b/drivers/gpu/drm/gma500/gem.c
> index def26d9ce89d..c93d09e1921e 100644
> --- a/drivers/gpu/drm/gma500/gem.c
> +++ b/drivers/gpu/drm/gma500/gem.c
> @@ -23,12 +23,12 @@
>
>  int psb_gem_pin(struct gtt_range *gt)
>  {
> -       int ret = 0;
>         struct drm_device *dev = gt->gem.dev;
>         struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
>         u32 gpu_base = dev_priv->gtt.gatt_start;
>         struct page **pages;
>         unsigned int npages;
> +       int ret;
>
>         mutex_lock(&dev_priv->gtt_mutex);
>
> @@ -45,10 +45,7 @@ int psb_gem_pin(struct gtt_range *gt)
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
> @@ -62,8 +59,6 @@ int psb_gem_pin(struct gtt_range *gt)
>
>         return 0;
>
> -err_drm_gem_put_pages:
> -       drm_gem_put_pages(&gt->gem, pages, true, false);
>  err_mutex_unlock:
>         mutex_unlock(&dev_priv->gtt_mutex);
>         return ret;
> @@ -86,13 +81,14 @@ void psb_gem_unpin(struct gtt_range *gt)
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

We lose the reminder about locking here again

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

And here as well


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
