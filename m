Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AEB383B8B
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 19:43:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A3116EA22;
	Mon, 17 May 2021 17:43:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 829C86EA20;
 Mon, 17 May 2021 17:43:44 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 q7-20020a9d57870000b02902a5c2bd8c17so6268881oth.5; 
 Mon, 17 May 2021 10:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XLJb2IgEQ7K/5rtBcAtSxUKX2z5zxyllknUa3sXOl3g=;
 b=ZYxJcblAPpZU8V2LI3hVlKVW5Wz5qhTURVLlQyyLuk4/QBK+m4JgtOGlbbXMas51n5
 ECnv62KZTMKgiQjY1ch1scZyPlyWZ9iO2d/LcBWJniGK/T3MavCALQHKT/GTVwoFEL6Y
 A/sb76Y6cYeXGtPFI+V2StSIqI+AVhdQWIgqiifoIry4RStlNUMwgBMFYxpGQWdGfpOX
 3m+aVtT5wm+jNH0zyKk9VuKGQKgwPpUOA2TLPV5ZUcvDGX2XIgNv59B+3kie4iduZ41Y
 LgpPaWQ8lcGTrcwtLqjLfW1bIX6SRNNNAY8Ut2FNMLn3BehEwQrik0AGPCa+359ooti6
 YyIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XLJb2IgEQ7K/5rtBcAtSxUKX2z5zxyllknUa3sXOl3g=;
 b=tNp1jlDaoaXE+zvHGgQb5Ol9fLHtgjU8O7QPn2n830hDFKNiUniKz7kiVxEyW/TUQ1
 EfPcoLsIV/wlBD0yX9h0YgTHtUQyaAykSsFfaaVrolhDLRWZQYaATL5JKG0510cl7TRU
 Nxq/yifzHRXnyI3HPMSrfUfuEAHPAeBAv6Za+0FwGMoQ1ftjmCbpPkZ43W5FKbUKkGDE
 /o8ExGKCTHdSeaGkbnfGShXg+x/QNi6FOYsRaCyc9nEUW0GNObKj+lt1zI3LUkbB/JZg
 t3+luOjbnall+Mm5Pf15R5ieKwa+hTJKamlbBm3s905o9CMHZiJE7mvdIC+YeY0xw5Mb
 k55A==
X-Gm-Message-State: AOAM530on7+6kgBgANd8DUV4CtJMIqwkVQJWhEN8HVM8HtGLbb1n8p2v
 hYA/3CMWPzOFMZccukHK7Z7fusQLjMsMkwK9cOUVbHNSVfo=
X-Google-Smtp-Source: ABdhPJwGh1Cb43ILuKcyyuub39Gsc7SKqokFQCOnj1kkmOqfs4JHoh7R00inYAupP1KvSvDsT3Mwl0jz7zL7dcRgOCE=
X-Received: by 2002:a9d:74c6:: with SMTP id a6mr636450otl.132.1621273424021;
 Mon, 17 May 2021 10:43:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210512142648.666476-1-andrey.grodzovsky@amd.com>
 <20210512142648.666476-17-andrey.grodzovsky@amd.com>
In-Reply-To: <20210512142648.666476-17-andrey.grodzovsky@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 17 May 2021 13:43:33 -0400
Message-ID: <CADnq5_M-Sy3cF762044Ub9J=N_U6uQ2h2j40Y=fof04dXL5h7w@mail.gmail.com>
Subject: Re: [PATCH v7 16/16] drm/amdgpu: Unmap all MMIO mappings
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Greg KH <gregkh@linuxfoundation.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Bjorn Helgaas <helgaas@kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Linux PCI <linux-pci@vger.kernel.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 12, 2021 at 10:27 AM Andrey Grodzovsky
<andrey.grodzovsky@amd.com> wrote:
>
> Access to those must be prevented post pci_remove
>
> v6: Drop BOs list, unampping VRAM BAR is enough.
>
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 24 +++++++++++++++++++---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |  1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    |  4 ----
>  3 files changed, 22 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index f7cca25c0fa0..73cbc3c7453f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -3666,6 +3666,25 @@ int amdgpu_device_init(struct amdgpu_device *adev,
>         return r;
>  }
>
> +static void amdgpu_device_unmap_mmio(struct amdgpu_device *adev)
> +{
> +       /* Clear all CPU mappings pointing to this device */
> +       unmap_mapping_range(adev->ddev.anon_inode->i_mapping, 0, 0, 1);
> +
> +       /* Unmap all mapped bars - Doorbell, registers and VRAM */
> +       amdgpu_device_doorbell_fini(adev);
> +
> +       iounmap(adev->rmmio);
> +       adev->rmmio = NULL;
> +       if (adev->mman.aper_base_kaddr)
> +               iounmap(adev->mman.aper_base_kaddr);
> +       adev->mman.aper_base_kaddr = NULL;
> +
> +       /* Memory manager related */

I think we need:
if (!adev->gmc.xgmi.connected_to_cpu) {
around these two to mirror amdgpu_bo_fini().

Alex

> +       arch_phys_wc_del(adev->gmc.vram_mtrr);
> +       arch_io_free_memtype_wc(adev->gmc.aper_base, adev->gmc.aper_size);
> +}
> +
>  /**
>   * amdgpu_device_fini - tear down the driver
>   *
> @@ -3712,6 +3731,8 @@ void amdgpu_device_fini_hw(struct amdgpu_device *adev)
>         amdgpu_device_ip_fini_early(adev);
>
>         amdgpu_gart_dummy_page_fini(adev);
> +
> +       amdgpu_device_unmap_mmio(adev);
>  }
>
>  void amdgpu_device_fini_sw(struct amdgpu_device *adev)
> @@ -3739,9 +3760,6 @@ void amdgpu_device_fini_sw(struct amdgpu_device *adev)
>         }
>         if ((adev->pdev->class >> 8) == PCI_CLASS_DISPLAY_VGA)
>                 vga_client_register(adev->pdev, NULL, NULL, NULL);
> -       iounmap(adev->rmmio);
> -       adev->rmmio = NULL;
> -       amdgpu_device_doorbell_fini(adev);
>
>         if (IS_ENABLED(CONFIG_PERF_EVENTS))
>                 amdgpu_pmu_fini(adev);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index 0adffcace326..882fb49f3c41 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -533,6 +533,7 @@ static int amdgpu_bo_do_create(struct amdgpu_device *adev,
>                 return -ENOMEM;
>         drm_gem_private_object_init(adev_to_drm(adev), &bo->tbo.base, size);
>         INIT_LIST_HEAD(&bo->shadow_list);
> +
>         bo->vm_bo = NULL;
>         bo->preferred_domains = bp->preferred_domain ? bp->preferred_domain :
>                 bp->domain;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 0d54e70278ca..58ad2fecc9e3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -1841,10 +1841,6 @@ void amdgpu_ttm_fini(struct amdgpu_device *adev)
>         amdgpu_bo_free_kernel(&adev->mman.discovery_memory, NULL, NULL);
>         amdgpu_ttm_fw_reserve_vram_fini(adev);
>
> -       if (adev->mman.aper_base_kaddr)
> -               iounmap(adev->mman.aper_base_kaddr);
> -       adev->mman.aper_base_kaddr = NULL;
> -
>         amdgpu_vram_mgr_fini(adev);
>         amdgpu_gtt_mgr_fini(adev);
>         ttm_range_man_fini(&adev->mman.bdev, AMDGPU_PL_GDS);
> --
> 2.25.1
>
