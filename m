Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B3A42A5F2
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 15:41:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 159126E98E;
	Tue, 12 Oct 2021 13:41:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC10F6E98E
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Oct 2021 13:41:37 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id z11so78928485lfj.4
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Oct 2021 06:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rMeZnIYRAUnd+3oTo/UAvUfercN/PP9UYvshNv/quRs=;
 b=oM5dv5ndykJozAH/5QXVI1xgfASntuxk15V8WXCleax+uZStpj0sX9RodOgjrWYcwy
 Pii7UiKjxbKpFI7464y61MwsVOtajvlugqt3W0n6o9Qnyg26IIqpJj2b+t6F/65OYurU
 d+jM1sX/2wkA2wgCVhF/8vkny3xiAIKPO0O6KeeTpP3HaXRaoO6NLmTJUb93T/FKtjWT
 DeWML/WldDwF4JypER93RxTr3I5pu+O5+JwciiXjvarG+aa8U2yv5Rw3Al8JlpSeTkvC
 JJ3DXLQxMNnUmRRaW8fUnWRZhqXRVBaPrQAZWom8ivAxil/aZbUnJZBjWVunQEhztqKD
 87pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rMeZnIYRAUnd+3oTo/UAvUfercN/PP9UYvshNv/quRs=;
 b=wdJDVA447SlDPSGM07QVAjrURS5PTiR3hLJdR+ET/IJEGuDZ4PbZYqnK8FyqL3SDPy
 yt4+BnDLVh1xJ8P2LWk3uE4ttbJM3rMBubCOw9neOy2GgMub3aInukbR4qEsOkf3gS9E
 ttr7BsW/BgS8JumbQ5tOdwmDBaAh3sOKml6lc2MAmsAxdfMZRFvf5KeNQMf71JWSoBgP
 ELkZJ2YjHIR3j0wBheEw2fxtABSqPA8WOCCdif+/60bds4cLxSCQCYCKTnZRZvFrfsTp
 wGGED3/s+FQjoyrYmuceLLoyIaQechg77A/7Dh7w8BcdRCkZnaqtp8r4eZ5vCzS/so7Y
 k9iQ==
X-Gm-Message-State: AOAM530F7fGF3UaCRK6vz2L+iirT7QZpFoKuQvnwVLmmat1sx6ZQPDXh
 7ZiC1jjYEP0UhP1tL56GRwldiI4Xzij4plQLyit4tW5I
X-Google-Smtp-Source: ABdhPJw/ZzuQY4OqrwmCj8t9s0XwaIy1UXhgN5HF1+y6Mt35mrli9lpdQnw3mxOrGgAHJGJ1wuzACaUYt2MiSttu+gA=
X-Received: by 2002:a2e:a415:: with SMTP id p21mr6697309ljn.384.1634046096136; 
 Tue, 12 Oct 2021 06:41:36 -0700 (PDT)
MIME-Version: 1.0
References: <20211005081151.23612-1-tzimmermann@suse.de>
 <20211005081151.23612-7-tzimmermann@suse.de>
In-Reply-To: <20211005081151.23612-7-tzimmermann@suse.de>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Tue, 12 Oct 2021 15:41:25 +0200
Message-ID: <CAMeQTsbJz2bWz1cUpmvym6n+Hutd_nP_N78GwuHf3R=T=32mTg@mail.gmail.com>
Subject: Re: [PATCH v2 06/10] drm/gma500: Inline psb_gtt_attach_pages() and
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

On Tue, Oct 5, 2021 at 10:11 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> psb_gtt_attach_pages() are not GTT functions but deal with the GEM
> object's SHMEM pages. The only callers of psb_gtt_attach_pages() and
> psb_gtt_detach_pages() are the GEM pin helpers. Inline the calls and
> cleanup the resulting code.
>
> v2:
>         * unlock gtt_mutex in pin-error handling (Patrik)
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Acked-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>


> ---
>  drivers/gpu/drm/gma500/gem.c | 94 ++++++++++++++++--------------------
>  1 file changed, 42 insertions(+), 52 deletions(-)
>
> diff --git a/drivers/gpu/drm/gma500/gem.c b/drivers/gpu/drm/gma500/gem.c
> index 1905468924ca..37b61334ade2 100644
> --- a/drivers/gpu/drm/gma500/gem.c
> +++ b/drivers/gpu/drm/gma500/gem.c
> @@ -19,63 +19,48 @@
>  #include "gem.h"
>  #include "psb_drv.h"
>
> -/*
> - * Pin and build an in-kernel list of the pages that back our GEM object.
> - * While we hold this the pages cannot be swapped out. This is protected
> - * via the gtt mutex which the caller must hold.
> - */
> -static int psb_gtt_attach_pages(struct gtt_range *gt)
> -{
> -       struct page **pages;
> -
> -       WARN_ON(gt->pages);
> -
> -       pages = drm_gem_get_pages(&gt->gem);
> -       if (IS_ERR(pages))
> -               return PTR_ERR(pages);
> -
> -       gt->npage = gt->gem.size / PAGE_SIZE;
> -       gt->pages = pages;
> -
> -       return 0;
> -}
> -
> -/*
> - * Undo the effect of psb_gtt_attach_pages. At this point the pages
> - * must have been removed from the GTT as they could now be paged out
> - * and move bus address. This is protected via the gtt mutex which the
> - * caller must hold.
> - */
> -static void psb_gtt_detach_pages(struct gtt_range *gt)
> -{
> -       drm_gem_put_pages(&gt->gem, gt->pages, true, false);
> -       gt->pages = NULL;
> -}
> -
>  int psb_gem_pin(struct gtt_range *gt)
>  {
>         int ret = 0;
>         struct drm_device *dev = gt->gem.dev;
>         struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
>         u32 gpu_base = dev_priv->gtt.gatt_start;
> +       struct page **pages;
> +       unsigned int npages;
>
>         mutex_lock(&dev_priv->gtt_mutex);
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
> +       if (gt->in_gart || gt->stolen)
> +               goto out; /* already mapped */
> +
> +       pages = drm_gem_get_pages(&gt->gem);
> +       if (IS_ERR(pages)) {
> +               ret = PTR_ERR(pages);
> +               goto err_mutex_unlock;
>         }
> -       gt->in_gart++;
> +
> +       npages = gt->gem.size / PAGE_SIZE;
> +
> +       ret = psb_gtt_insert(dev, gt, 0);
> +       if (ret)
> +               goto err_drm_gem_put_pages;
> +
> +       psb_mmu_insert_pages(psb_mmu_get_default_pd(dev_priv->mmu), pages,
> +                            (gpu_base + gt->offset), npages, 0, 0,
> +                            PSB_MMU_CACHED_MEMORY);
> +
> +       gt->npage = npages;
> +       gt->pages = pages;
> +
>  out:
> +       ++gt->in_gart;
> +       mutex_unlock(&dev_priv->gtt_mutex);
> +
> +       return 0;
> +
> +err_drm_gem_put_pages:
> +       drm_gem_put_pages(&gt->gem, pages, true, false);
> +err_mutex_unlock:
>         mutex_unlock(&dev_priv->gtt_mutex);
>         return ret;
>  }
> @@ -90,14 +75,19 @@ void psb_gem_unpin(struct gtt_range *gt)
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
