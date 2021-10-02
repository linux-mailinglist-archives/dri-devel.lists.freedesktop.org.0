Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2A741FE69
	for <lists+dri-devel@lfdr.de>; Sun,  3 Oct 2021 00:14:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4467A6E045;
	Sat,  2 Oct 2021 22:14:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 472246E045
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Oct 2021 22:14:32 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id e15so53906255lfr.10
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Oct 2021 15:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IDhMv2d4E64QV0sf4vbPBMLJU78aQhqYU+TyIwqMi74=;
 b=kXkru7pceT2V+GxNomFHF6QW8KP9iRhayZcIL+dENK0eQ5O8ZS9FsTSNJTyMqeHGPJ
 67BhJfCHejmuVKsuIzywDcfvRyOQ9t4l153txgvoY1El55r5aQ0RLVkJE7yJhEOszNwc
 raaEBBqlViuArF2VBIXwbP8gF+z3BsjCnqounpmrSQ/STolt87eSW83aCVtV4WcLbuY2
 1o13uBZJRm+yi03LQUgISc6He48BpHRseIB8KWNPsrwIr1oM7FLzTcx1P2dMHTU835It
 Yxl2LwCqrUNOBZFdZI//luEVlIvQWA4Bk/UW/HaKQHCkgYsmoEPuJCTyDcQgyiHPaIHc
 d2ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IDhMv2d4E64QV0sf4vbPBMLJU78aQhqYU+TyIwqMi74=;
 b=DHT98e3R5yoaoVWxl5wVHtZKDF2BsO+XBkGj/JxYiia1OXM9nNZ7jgLMbGqhL2xoCX
 uwBtOzfM/cFlGdTI1Tr81aNPx+NJ5g4bKaa9H7puF/4/AFAtxp17EIOs8J6ScJmyri42
 et+CIsP6QdkVLQqWx4UhpxEAKPS4fdEcaLQyTB1Xi5aIAy9yCVV3G/Sw5BZoqt0b9CFS
 06wOi5jeIL/wqyCtfXyM2l7I7WXsrMu0SEyNic6l7grZhf4PqT1+9YweyYgWd42UE1QI
 X48K9Ot0Dm5oL9bwZt2RXGXgusrhUT5+fx7Ul7RDSnxmgN1IyubuBc+JBsN3bsW9zqgE
 aZaw==
X-Gm-Message-State: AOAM53197fSQL7ZPBu6e+qfTKhu9lngJ4aVkJHs22nKhasFdAHOfk9Si
 NFRtRuIghIJaXD+yxJRkxDqPggpoG6A/7Na8thE=
X-Google-Smtp-Source: ABdhPJygQLE86rakx/OdH/ihtuvl7wq1x4Bf8tjjGxpND16X5hj4kxPBIG20GQeV+C2Fn7q2PER/qDBnaNq1nzcP9MM=
X-Received: by 2002:a2e:1410:: with SMTP id u16mr5875793ljd.469.1633212870583; 
 Sat, 02 Oct 2021 15:14:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210928084446.22580-1-tzimmermann@suse.de>
 <20210928084446.22580-7-tzimmermann@suse.de>
In-Reply-To: <20210928084446.22580-7-tzimmermann@suse.de>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Sun, 3 Oct 2021 00:14:19 +0200
Message-ID: <CAMeQTsaO3vUoVo9qF+aGS-Q2Za1iCtrWN-4_BDiLxjCoeWEK6Q@mail.gmail.com>
Subject: Re: [PATCH 06/10] drm/gma500: Inline psb_gtt_attach_pages() and
 psb_gtt_detach_pages()
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
> psb_gtt_attach_pages() are not GTT functions but deal with the GEM
> object's SHMEM pages. The only callers of psb_gtt_attach_pages() and
> psb_gtt_detach_pages() are the GEM pin helpers. Inline the calls and
> cleanup the resulting code.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/gma500/gem.c | 75 +++++++++++++++++-------------------
>  1 file changed, 36 insertions(+), 39 deletions(-)
>
> diff --git a/drivers/gpu/drm/gma500/gem.c b/drivers/gpu/drm/gma500/gem.c
> index 369910d0091e..a48d7d5ed026 100644
> --- a/drivers/gpu/drm/gma500/gem.c
> +++ b/drivers/gpu/drm/gma500/gem.c
> @@ -19,53 +19,45 @@
>  #include "gem.h"
>  #include "psb_drv.h"
>
> -static int psb_gtt_attach_pages(struct gtt_range *gt)
> +int psb_gem_pin(struct gtt_range *gt)
>  {
> +       int ret = 0;
> +       struct drm_device *dev = gt->gem.dev;
> +       struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
> +       u32 gpu_base = dev_priv->gtt.gatt_start;
>         struct page **pages;
> +       unsigned int npages;
>
> -       WARN_ON(gt->pages);
> +       mutex_lock(&dev_priv->gtt_mutex);
> +
> +       if (gt->in_gart || gt->stolen)
> +               goto out; /* already mapped */
>
>         pages = drm_gem_get_pages(&gt->gem);
>         if (IS_ERR(pages))
>                 return PTR_ERR(pages);

You're not releasing gtt_mutex here


>
> -       gt->npage = gt->gem.size / PAGE_SIZE;
> -       gt->pages = pages;
> -
> -       return 0;
> -}
> +       npages = gt->gem.size / PAGE_SIZE;
>
> -static void psb_gtt_detach_pages(struct gtt_range *gt)
> -{
> -       drm_gem_put_pages(&gt->gem, gt->pages, true, false);
> -       gt->pages = NULL;
> -}
> +       ret = psb_gtt_insert(dev, gt, 0);
> +       if (ret)
> +               goto err_drm_gem_put_pages;
>
> -int psb_gem_pin(struct gtt_range *gt)
> -{
> -       int ret = 0;
> -       struct drm_device *dev = gt->gem.dev;
> -       struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
> -       u32 gpu_base = dev_priv->gtt.gatt_start;
> +       psb_mmu_insert_pages(psb_mmu_get_default_pd(dev_priv->mmu), pages,
> +                            (gpu_base + gt->offset), npages, 0, 0,
> +                            PSB_MMU_CACHED_MEMORY);
>
> -       mutex_lock(&dev_priv->gtt_mutex);
> +       gt->npage = npages;
> +       gt->pages = pages;
>
> -       if (gt->in_gart == 0 && gt->stolen == 0) {
> -               ret = psb_gtt_attach_pages(gt);
> -               if (ret < 0)
> -                       goto out;
> -               ret = psb_gtt_insert(dev, gt, 0);
> -               if (ret < 0) {
> -                       psb_gtt_detach_pages(gt);
> -                       goto out;
> -               }
> -               psb_mmu_insert_pages(psb_mmu_get_default_pd(dev_priv->mmu),
> -                                    gt->pages, (gpu_base + gt->offset),
> -                                    gt->npage, 0, 0, PSB_MMU_CACHED_MEMORY);
> -       }
> -       gt->in_gart++;
>  out:
> +       ++gt->in_gart;
>         mutex_unlock(&dev_priv->gtt_mutex);
> +
> +       return 0;
> +
> +err_drm_gem_put_pages:
> +       drm_gem_put_pages(&gt->gem, pages, true, false);
>         return ret;
>  }
>
> @@ -79,14 +71,19 @@ void psb_gem_unpin(struct gtt_range *gt)
>
>         WARN_ON(!gt->in_gart);
>
> -       gt->in_gart--;
> -       if (gt->in_gart == 0 && gt->stolen == 0) {
> -               psb_mmu_remove_pages(psb_mmu_get_default_pd(dev_priv->mmu),
> +       --gt->in_gart;
> +
> +       if (gt->in_gart || gt->stolen)
> +               goto out;
> +
> +       psb_mmu_remove_pages(psb_mmu_get_default_pd(dev_priv->mmu),
>                                      (gpu_base + gt->offset), gt->npage, 0, 0);
> -               psb_gtt_remove(dev, gt);
> -               psb_gtt_detach_pages(gt);
> -       }
> +       psb_gtt_remove(dev, gt);
>
> +       drm_gem_put_pages(&gt->gem, gt->pages, true, false);
> +       gt->pages = NULL;
> +
> +out:
>         mutex_unlock(&dev_priv->gtt_mutex);
>  }
>
> --
> 2.33.0
>
