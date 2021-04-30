Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D835836F44F
	for <lists+dri-devel@lfdr.de>; Fri, 30 Apr 2021 05:14:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E0FD6F4F5;
	Fri, 30 Apr 2021 03:14:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9403E6E426;
 Fri, 30 Apr 2021 03:14:07 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 c8-20020a9d78480000b0290289e9d1b7bcso49223650otm.4; 
 Thu, 29 Apr 2021 20:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QGKDqICWZ3hx8jj1ErYY72RQJQjrjjkd8N0N9mVq3ts=;
 b=S3hxMAUJ3J8gJ8cd7+cUESDWHn9xkflACC2b87KpeJDiybzjgJirlF96UTnikqsgJz
 wBNE/l3I15+2M8k+NnKuu8KJWMECZTO2zcBomIynMVsXAuPoNY5Dm1FQL5TzHwZa2P5O
 aHHLmLOtHc6et2eKsHvGB1p56OgQbFLClXOZA4lwieS2Yywd0T8W/YDI8vfxuvyQdRAL
 fD40kl8nwEDpi0p+Coqfdr3trIDLKkpXS87JWmt2Vog4ZUUxcRt8x6t6OE+UxfCoUb3H
 lby1x7/Efi5pMZjLbDt4kNc0DAPkVIpbxta0amuuSuJJ4VxXZvCEiLgEK4sth1e+mQMf
 WkMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QGKDqICWZ3hx8jj1ErYY72RQJQjrjjkd8N0N9mVq3ts=;
 b=B1GUozdUu3XReGOk5VXNsxLyaO9KkGlXb9a0HeOWE3p/vek3TBIP8GJdhoT8dPVDXm
 8qhsu5HKAMyBMmuyU/m3G+0dsUNjLRfpkITeJcC45EpcbyrKSOxIjCw9Pscd8SDhYHLm
 wW6KmatqAnWSGPyrPajAd5Hz55LcaQD3a6Yzn8RHPh/QN5wNnZdaGL+KV84uLj48AZLb
 Uaxd5c+Vn0AiJIUqK068mA0gALkwwTJtSiX6JYhWdnglR4Ogm9QyIdJc4eYGMJl4sTlg
 fcQ9CnjvMoxQ65hST6pgr05zVc4x6/gPhpKNtUeZWhatj6vqfua5bwYoRd83S5RJrzBX
 Ytig==
X-Gm-Message-State: AOAM533opbn6UJe3AuZKlf6Kx0KqEbIClxASJsaKFlOUlGlDe7BFW1dX
 TnhI6+vzQcC/sVFLsc6NqLq/+5pCjKyvV8t43yY=
X-Google-Smtp-Source: ABdhPJw1yGl7Ru2ixItWs6qs5kFNXuZFp5zWncR2EEmnky3sJHNEDp9f5kjzCDB6W88sTtaYpz3nK8FQ/2i/7SJt3+U=
X-Received: by 2002:a9d:8d1:: with SMTP id 75mr2025799otf.23.1619752446695;
 Thu, 29 Apr 2021 20:14:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210428151207.1212258-1-andrey.grodzovsky@amd.com>
 <20210428151207.1212258-7-andrey.grodzovsky@amd.com>
In-Reply-To: <20210428151207.1212258-7-andrey.grodzovsky@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 29 Apr 2021 23:13:55 -0400
Message-ID: <CADnq5_NtyLBon0Tk_BHh=XOprMPrAcKf8LN8b-bdmy1-D1Uzhg@mail.gmail.com>
Subject: Re: [PATCH v5 06/27] drm/amdgpu: Handle IOMMU enabled case.
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Greg KH <gregkh@linuxfoundation.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Bjorn Helgaas <helgaas@kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Linux PCI <linux-pci@vger.kernel.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 28, 2021 at 11:13 AM Andrey Grodzovsky
<andrey.grodzovsky@amd.com> wrote:
>
> Handle all DMA IOMMU gropup related dependencies before the
> group is removed.
>
> v5: Drop IOMMU notifier and switch to lockless call to ttm_tt_unpopulate
>
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  2 ++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 31 ++++++++++++++++++++--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c   |  3 +--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h   |  1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c    |  9 +++++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 13 ++++++++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.h |  2 ++
>  drivers/gpu/drm/amd/amdgpu/cik_ih.c        |  1 -
>  drivers/gpu/drm/amd/amdgpu/cz_ih.c         |  1 -
>  drivers/gpu/drm/amd/amdgpu/iceland_ih.c    |  1 -
>  drivers/gpu/drm/amd/amdgpu/navi10_ih.c     |  3 ---
>  drivers/gpu/drm/amd/amdgpu/si_ih.c         |  1 -
>  drivers/gpu/drm/amd/amdgpu/tonga_ih.c      |  1 -
>  drivers/gpu/drm/amd/amdgpu/vega10_ih.c     |  3 ---
>  14 files changed, 56 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index fddb82897e5d..30a24db5f4d1 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -1054,6 +1054,8 @@ struct amdgpu_device {
>
>         bool                            in_pci_err_recovery;
>         struct pci_saved_state          *pci_state;
> +
> +       struct list_head                device_bo_list;
>  };
>
>  static inline struct amdgpu_device *drm_to_adev(struct drm_device *ddev)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 46d646c40338..91594ddc2459 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -70,6 +70,7 @@
>  #include <drm/task_barrier.h>
>  #include <linux/pm_runtime.h>
>
> +
>  MODULE_FIRMWARE("amdgpu/vega10_gpu_info.bin");
>  MODULE_FIRMWARE("amdgpu/vega12_gpu_info.bin");
>  MODULE_FIRMWARE("amdgpu/raven_gpu_info.bin");
> @@ -3211,7 +3212,6 @@ static const struct attribute *amdgpu_dev_attributes[] = {
>         NULL
>  };
>
> -
>  /**
>   * amdgpu_device_init - initialize the driver
>   *
> @@ -3316,6 +3316,8 @@ int amdgpu_device_init(struct amdgpu_device *adev,
>
>         INIT_WORK(&adev->xgmi_reset_work, amdgpu_device_xgmi_reset_func);
>
> +       INIT_LIST_HEAD(&adev->device_bo_list);
> +
>         adev->gfx.gfx_off_req_count = 1;
>         adev->pm.ac_power = power_supply_is_system_supplied() > 0;
>
> @@ -3601,6 +3603,28 @@ int amdgpu_device_init(struct amdgpu_device *adev,
>         return r;
>  }
>
> +static void amdgpu_clear_dma_mappings(struct amdgpu_device *adev)

Prefix this with amdgpu_device for consistency.  E.g.,
amdgpu_device_clear_dma_mappings()

> +{
> +       struct amdgpu_bo *bo = NULL;
> +
> +       /*
> +        * Unmaps all DMA mappings before device will be removed from it's
> +        * IOMMU group otherwise in case of IOMMU enabled system a crash
> +        * will happen.
> +        */
> +
> +       spin_lock(&adev->mman.bdev.lru_lock);
> +       while (!list_empty(&adev->device_bo_list)) {
> +               bo = list_first_entry(&adev->device_bo_list, struct amdgpu_bo, bo);
> +               list_del_init(&bo->bo);
> +               spin_unlock(&adev->mman.bdev.lru_lock);
> +               if (bo->tbo.ttm)
> +                       ttm_tt_unpopulate(bo->tbo.bdev, bo->tbo.ttm);
> +               spin_lock(&adev->mman.bdev.lru_lock);
> +       }
> +       spin_unlock(&adev->mman.bdev.lru_lock);
> +}
> +
>  /**
>   * amdgpu_device_fini - tear down the driver
>   *
> @@ -3639,12 +3663,15 @@ void amdgpu_device_fini_hw(struct amdgpu_device *adev)
>                 amdgpu_ucode_sysfs_fini(adev);
>         sysfs_remove_files(&adev->dev->kobj, amdgpu_dev_attributes);
>
> -
>         amdgpu_fbdev_fini(adev);
>
>         amdgpu_irq_fini_hw(adev);
>
>         amdgpu_device_ip_fini_early(adev);
> +
> +       amdgpu_clear_dma_mappings(adev);
> +
> +       amdgpu_gart_dummy_page_fini(adev);
>  }
>
>  void amdgpu_device_fini_sw(struct amdgpu_device *adev)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c
> index fde2d899b2c4..49cdcaf8512d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c
> @@ -92,7 +92,7 @@ static int amdgpu_gart_dummy_page_init(struct amdgpu_device *adev)
>   *
>   * Frees the dummy page used by the driver (all asics).
>   */
> -static void amdgpu_gart_dummy_page_fini(struct amdgpu_device *adev)
> +void amdgpu_gart_dummy_page_fini(struct amdgpu_device *adev)
>  {
>         if (!adev->dummy_page_addr)
>                 return;
> @@ -397,5 +397,4 @@ void amdgpu_gart_fini(struct amdgpu_device *adev)
>         vfree(adev->gart.pages);
>         adev->gart.pages = NULL;
>  #endif
> -       amdgpu_gart_dummy_page_fini(adev);
>  }
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h
> index afa2e2877d87..5678d9c105ab 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h
> @@ -61,6 +61,7 @@ int amdgpu_gart_table_vram_pin(struct amdgpu_device *adev);
>  void amdgpu_gart_table_vram_unpin(struct amdgpu_device *adev);
>  int amdgpu_gart_init(struct amdgpu_device *adev);
>  void amdgpu_gart_fini(struct amdgpu_device *adev);
> +void amdgpu_gart_dummy_page_fini(struct amdgpu_device *adev);
>  int amdgpu_gart_unbind(struct amdgpu_device *adev, uint64_t offset,
>                        int pages);
>  int amdgpu_gart_map(struct amdgpu_device *adev, uint64_t offset,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
> index 63e815c27585..a922154953a7 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
> @@ -326,6 +326,15 @@ void amdgpu_irq_fini_hw(struct amdgpu_device *adev)
>                 if (!amdgpu_device_has_dc_support(adev))
>                         flush_work(&adev->hotplug_work);
>         }
> +
> +       if (adev->irq.ih_soft.ring)
> +               amdgpu_ih_ring_fini(adev, &adev->irq.ih_soft);
> +       if (adev->irq.ih.ring)
> +               amdgpu_ih_ring_fini(adev, &adev->irq.ih);
> +       if (adev->irq.ih1.ring)
> +               amdgpu_ih_ring_fini(adev, &adev->irq.ih1);
> +       if (adev->irq.ih2.ring)
> +               amdgpu_ih_ring_fini(adev, &adev->irq.ih2);
>  }
>
>  /**
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index 485f249d063a..62d829f5e62c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -68,8 +68,13 @@ static void amdgpu_bo_destroy(struct ttm_buffer_object *tbo)
>                 list_del_init(&bo->shadow_list);
>                 mutex_unlock(&adev->shadow_list_lock);
>         }
> -       amdgpu_bo_unref(&bo->parent);
>
> +
> +       spin_lock(&adev->mman.bdev.lru_lock);
> +       list_del(&bo->bo);
> +       spin_unlock(&adev->mman.bdev.lru_lock);
> +
> +       amdgpu_bo_unref(&bo->parent);
>         kfree(bo->metadata);
>         kfree(bo);
>  }
> @@ -585,6 +590,12 @@ static int amdgpu_bo_do_create(struct amdgpu_device *adev,
>         if (bp->type == ttm_bo_type_device)
>                 bo->flags &= ~AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED;
>
> +       INIT_LIST_HEAD(&bo->bo);
> +
> +       spin_lock(&adev->mman.bdev.lru_lock);
> +       list_add_tail(&bo->bo, &adev->device_bo_list);
> +       spin_unlock(&adev->mman.bdev.lru_lock);
> +
>         return 0;
>
>  fail_unreserve:
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> index 9ac37569823f..5ae8555ef275 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> @@ -110,6 +110,8 @@ struct amdgpu_bo {
>         struct list_head                shadow_list;
>
>         struct kgd_mem                  *kfd_bo;
> +
> +       struct list_head                bo;
>  };
>
>  static inline struct amdgpu_bo *ttm_to_amdgpu_bo(struct ttm_buffer_object *tbo)
> diff --git a/drivers/gpu/drm/amd/amdgpu/cik_ih.c b/drivers/gpu/drm/amd/amdgpu/cik_ih.c
> index 183d44a6583c..df385ffc9768 100644
> --- a/drivers/gpu/drm/amd/amdgpu/cik_ih.c
> +++ b/drivers/gpu/drm/amd/amdgpu/cik_ih.c
> @@ -310,7 +310,6 @@ static int cik_ih_sw_fini(void *handle)
>         struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>
>         amdgpu_irq_fini_sw(adev);
> -       amdgpu_ih_ring_fini(adev, &adev->irq.ih);
>         amdgpu_irq_remove_domain(adev);
>
>         return 0;
> diff --git a/drivers/gpu/drm/amd/amdgpu/cz_ih.c b/drivers/gpu/drm/amd/amdgpu/cz_ih.c
> index d32743949003..b8c47e0cf37a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/cz_ih.c
> +++ b/drivers/gpu/drm/amd/amdgpu/cz_ih.c
> @@ -302,7 +302,6 @@ static int cz_ih_sw_fini(void *handle)
>         struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>
>         amdgpu_irq_fini_sw(adev);
> -       amdgpu_ih_ring_fini(adev, &adev->irq.ih);
>         amdgpu_irq_remove_domain(adev);
>
>         return 0;
> diff --git a/drivers/gpu/drm/amd/amdgpu/iceland_ih.c b/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
> index da96c6013477..ddfe4eaeea05 100644
> --- a/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
> +++ b/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
> @@ -301,7 +301,6 @@ static int iceland_ih_sw_fini(void *handle)
>         struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>
>         amdgpu_irq_fini_sw(adev);
> -       amdgpu_ih_ring_fini(adev, &adev->irq.ih);
>         amdgpu_irq_remove_domain(adev);
>
>         return 0;
> diff --git a/drivers/gpu/drm/amd/amdgpu/navi10_ih.c b/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
> index 5eea4550b856..e171a9e78544 100644
> --- a/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
> +++ b/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
> @@ -571,9 +571,6 @@ static int navi10_ih_sw_fini(void *handle)
>
>         amdgpu_irq_fini_sw(adev);
>         amdgpu_ih_ring_fini(adev, &adev->irq.ih_soft);

Shouldn't the soft ring be removed as well?

> -       amdgpu_ih_ring_fini(adev, &adev->irq.ih2);
> -       amdgpu_ih_ring_fini(adev, &adev->irq.ih1);
> -       amdgpu_ih_ring_fini(adev, &adev->irq.ih);
>
>         return 0;
>  }
> diff --git a/drivers/gpu/drm/amd/amdgpu/si_ih.c b/drivers/gpu/drm/amd/amdgpu/si_ih.c
> index 751307f3252c..9a24f17a5750 100644
> --- a/drivers/gpu/drm/amd/amdgpu/si_ih.c
> +++ b/drivers/gpu/drm/amd/amdgpu/si_ih.c
> @@ -176,7 +176,6 @@ static int si_ih_sw_fini(void *handle)
>         struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>
>         amdgpu_irq_fini_sw(adev);
> -       amdgpu_ih_ring_fini(adev, &adev->irq.ih);
>
>         return 0;
>  }
> diff --git a/drivers/gpu/drm/amd/amdgpu/tonga_ih.c b/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
> index 973d80ec7f6c..b08905d1c00f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
> +++ b/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
> @@ -313,7 +313,6 @@ static int tonga_ih_sw_fini(void *handle)
>         struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>
>         amdgpu_irq_fini_sw(adev);
> -       amdgpu_ih_ring_fini(adev, &adev->irq.ih);
>         amdgpu_irq_remove_domain(adev);
>
>         return 0;
> diff --git a/drivers/gpu/drm/amd/amdgpu/vega10_ih.c b/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
> index 2d0094c276ca..8c8abc00f710 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
> @@ -525,9 +525,6 @@ static int vega10_ih_sw_fini(void *handle)
>
>         amdgpu_irq_fini_sw(adev);
>         amdgpu_ih_ring_fini(adev, &adev->irq.ih_soft);

Same here?

> -       amdgpu_ih_ring_fini(adev, &adev->irq.ih2);
> -       amdgpu_ih_ring_fini(adev, &adev->irq.ih1);
> -       amdgpu_ih_ring_fini(adev, &adev->irq.ih);
>
>         return 0;
>  }
> --
> 2.25.1
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
