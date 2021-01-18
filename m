Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A672FACF5
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jan 2021 22:48:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9A216E598;
	Mon, 18 Jan 2021 21:48:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 955126E593;
 Mon, 18 Jan 2021 21:48:17 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id r189so9502355oih.4;
 Mon, 18 Jan 2021 13:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q7A8rb8jN+pS3FHHOdO0I5mP7AmGsFHnFAO5rb9uabo=;
 b=Pz2CpHl1U4DOcaTKq6LijdF42rPeyA9Z+ZRbSsNA8Y9jCq4HC8dnWqTpCD1lhvd35n
 iAwrzfEevzI2amaRaxUwXFgbWxV8i2CjIEwndbmJ7Kbp0SM08xkLcJLJn/k2evA9ta+u
 KlzAVHp5KX3IVNsCGE0U7ME2ZeLeZJJ7mEsA/xA0kSY974NaLN+OVMN+XD4iPdpBfRdG
 Ya9CG4nBEuhb96hhdVIGWuYJvNvE4BrcasHQbxVDWq1vICdDuR5RxJLACvMWl8tjoYi3
 5ec7Qx+/v6PRva8qe52bUq8O2mM/vk8eB4PA2TUgn5Uq8x0IlgSnpH6YSC45irY0AEJL
 kAhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q7A8rb8jN+pS3FHHOdO0I5mP7AmGsFHnFAO5rb9uabo=;
 b=o+rNIjIC7CeR6wo0N4K94CcYrDkfwW5Cilv9BXdeeANEN+7QMI+A2s4VuY5ytm79zr
 vEYbXCuJbvLTO4tIPZBgqHKtYUNmGx6K+FFyK9C2haYCK657Ms9E2o7YKeY4NgRfw602
 XcZmgyf/O7q5AWZsmmwsO5551njfdqFuRa5ivR09pcH5hK+YXov+mQlJIU3Ss5V/Jbjq
 8z5f/mmzCjLe9Lf51TUjs938YLtEB0b6wIqc+GiKSMqjnjzAwOvl7QDyABPN65l1aVIk
 Z/OJ/KAy0/oZMMZNkdfR588KT2xST8BMn5nfG9NvfADpe4SD9m79mhB2wEtYz7RkLfOv
 lJDQ==
X-Gm-Message-State: AOAM533eYRYlNOtgfXEtYvECUgQAGEPX7ngc08XgzJGpk3IUozWcJF2Q
 houPLObM/itIpIc01uFPS4ZpvzvJQn1et5Yoi8Y=
X-Google-Smtp-Source: ABdhPJyoe8KDFlASSQgcRlftuFb9OxIFMGtNTf46zwBdYfESJxeSP/2RMF3bl8pbsgZV0E+oyWtf+QR4M/YNO3NFGdk=
X-Received: by 2002:aca:6202:: with SMTP id w2mr775243oib.5.1611006496939;
 Mon, 18 Jan 2021 13:48:16 -0800 (PST)
MIME-Version: 1.0
References: <1611003683-3534-1-git-send-email-andrey.grodzovsky@amd.com>
 <1611003683-3534-2-git-send-email-andrey.grodzovsky@amd.com>
In-Reply-To: <1611003683-3534-2-git-send-email-andrey.grodzovsky@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 18 Jan 2021 16:48:05 -0500
Message-ID: <CADnq5_P_varT8c9zzi5Q=VYP2wc2v5VMLAQJ=ttusYCdcYTyhA@mail.gmail.com>
Subject: Re: [PATCH v4 01/14] drm/ttm: Remap all page faults to per process
 dummy page.
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
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
Cc: Greg KH <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, Qiang Yu <yuq825@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 18, 2021 at 4:02 PM Andrey Grodzovsky
<andrey.grodzovsky@amd.com> wrote:
>
> On device removal reroute all CPU mappings to dummy page.
>
> v3:
> Remove loop to find DRM file and instead access it
> by vma->vm_file->private_data. Move dummy page installation
> into a separate function.
>
> v4:
> Map the entire BOs VA space into on demand allocated dummy page
> on the first fault for that BO.
>
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> ---
>  drivers/gpu/drm/ttm/ttm_bo_vm.c | 82 ++++++++++++++++++++++++++++++++++++++++-
>  include/drm/ttm/ttm_bo_api.h    |  2 +
>  2 files changed, 83 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> index 6dc96cf..ed89da3 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> @@ -34,6 +34,8 @@
>  #include <drm/ttm/ttm_bo_driver.h>
>  #include <drm/ttm/ttm_placement.h>
>  #include <drm/drm_vma_manager.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_managed.h>
>  #include <linux/mm.h>
>  #include <linux/pfn_t.h>
>  #include <linux/rbtree.h>
> @@ -380,25 +382,103 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
>  }
>  EXPORT_SYMBOL(ttm_bo_vm_fault_reserved);
>
> +static void ttm_bo_release_dummy_page(struct drm_device *dev, void *res)
> +{
> +       struct page *dummy_page = (struct page *)res;
> +
> +       __free_page(dummy_page);
> +}
> +
> +vm_fault_t ttm_bo_vm_dummy_page(struct vm_fault *vmf, pgprot_t prot)
> +{
> +       struct vm_area_struct *vma = vmf->vma;
> +       struct ttm_buffer_object *bo = vma->vm_private_data;
> +       struct ttm_bo_device *bdev = bo->bdev;
> +       struct drm_device *ddev = bo->base.dev;
> +       vm_fault_t ret = VM_FAULT_NOPAGE;
> +       unsigned long address = vma->vm_start;
> +       unsigned long num_prefault = (vma->vm_end - vma->vm_start) >> PAGE_SHIFT;
> +       unsigned long pfn;
> +       struct page *page;
> +       int i;
> +
> +       /*
> +        * Wait for buffer data in transit, due to a pipelined
> +        * move.
> +        */
> +       ret = ttm_bo_vm_fault_idle(bo, vmf);
> +       if (unlikely(ret != 0))
> +               return ret;
> +
> +       /* Allocate new dummy page to map all the VA range in this VMA to it*/
> +       page = alloc_page(GFP_KERNEL | __GFP_ZERO);
> +       if (!page)
> +               return VM_FAULT_OOM;
> +
> +       pfn = page_to_pfn(page);
> +
> +       /*
> +        * Prefault the entire VMA range right away to avoid further faults
> +        */
> +       for (i = 0; i < num_prefault; ++i) {
> +
> +               if (unlikely(address >= vma->vm_end))
> +                       break;
> +
> +               if (vma->vm_flags & VM_MIXEDMAP)
> +                       ret = vmf_insert_mixed_prot(vma, address,
> +                                                   __pfn_to_pfn_t(pfn, PFN_DEV),
> +                                                   prot);
> +               else
> +                       ret = vmf_insert_pfn_prot(vma, address, pfn, prot);
> +
> +               /* Never error on prefaulted PTEs */
> +               if (unlikely((ret & VM_FAULT_ERROR))) {
> +                       if (i == 0)
> +                               return VM_FAULT_NOPAGE;
> +                       else
> +                               break;
> +               }
> +
> +               address += PAGE_SIZE;
> +       }
> +
> +       /* Set the page to be freed using drmm release action */
> +       if (drmm_add_action_or_reset(ddev, ttm_bo_release_dummy_page, page))
> +               return VM_FAULT_OOM;
> +
> +       return ret;
> +}
> +EXPORT_SYMBOL(ttm_bo_vm_dummy_page);
> +
>  vm_fault_t ttm_bo_vm_fault(struct vm_fault *vmf)
>  {
>         struct vm_area_struct *vma = vmf->vma;
>         pgprot_t prot;
>         struct ttm_buffer_object *bo = vma->vm_private_data;
> +       struct drm_device *ddev = bo->base.dev;
>         vm_fault_t ret;
> +       int idx;
>
>         ret = ttm_bo_vm_reserve(bo, vmf);
>         if (ret)
>                 return ret;
>
>         prot = vma->vm_page_prot;
> -       ret = ttm_bo_vm_fault_reserved(vmf, prot, TTM_BO_VM_NUM_PREFAULT, 1);
> +       if (drm_dev_enter(ddev, &idx)) {
> +               ret = ttm_bo_vm_fault_reserved(vmf, prot, TTM_BO_VM_NUM_PREFAULT, 1);
> +               drm_dev_exit(idx);
> +       } else {
> +               ret = ttm_bo_vm_dummy_page(vmf, prot);
> +       }
>         if (ret == VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
>                 return ret;
>
>         dma_resv_unlock(bo->base.resv);
>
>         return ret;
> +
> +       return ret;

Duplicate return here.

Alex

>  }
>  EXPORT_SYMBOL(ttm_bo_vm_fault);
>
> diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
> index e17be32..12fb240 100644
> --- a/include/drm/ttm/ttm_bo_api.h
> +++ b/include/drm/ttm/ttm_bo_api.h
> @@ -643,4 +643,6 @@ void ttm_bo_vm_close(struct vm_area_struct *vma);
>  int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
>                      void *buf, int len, int write);
>
> +vm_fault_t ttm_bo_vm_dummy_page(struct vm_fault *vmf, pgprot_t prot);
> +
>  #endif
> --
> 2.7.4
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
