Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CFFA36E593
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 09:08:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9D1D6ECD8;
	Thu, 29 Apr 2021 07:08:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B1536ECD8;
 Thu, 29 Apr 2021 07:08:05 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id u3so19611641eja.12;
 Thu, 29 Apr 2021 00:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=sZocmoLA6jTmRvNKd86kvFskiLA8kKRdc1YGgPQrjWY=;
 b=Texiohd9rHlhQwJqSRTiD6C3HiLSBt4DLN6YH9ePH09uUChN58v+Rqhd4L3OYKHkkw
 5lpvtcdvALWKiaATdOxdRD256s5+DdU83p7ur6cemAyQb6j8FCMC8fhaT2bQVhtsuY44
 C30TlF4AKiWuof7xI2Jn5bPkQha7aMN/B3oaqDPMJaZOG1rla6bNIGXJvyjSZh0zM6Gz
 jeq2e99L/xJPHWJzGYEKZNo+sbmudyAGXuAjvXeDPyQF6bxEuvy8lkT065r01BeXwECo
 XvYmFtbnjAFMLmDDnGGvJu+TSBlr+Dx/U9vwn0YIGCxBPpaD2kfNG36q46C97xYr5bL2
 jpXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=sZocmoLA6jTmRvNKd86kvFskiLA8kKRdc1YGgPQrjWY=;
 b=cUTV3wwR/5Hzd5e5GFVM4Ou4CZTCxR9a22mMPYacFu78EHgBEuYAfdlorWisEcUf7k
 5tzIWQXSdiKlpF/ALhb2fKhsQwflbFkzIr8xF+88DyrxuE7cYlIrsQ3QiiixU6CF4Aon
 oMyxciE0CK2J3HWXA5WCkleccqynlDho1kAk7DAHR9GFEbQeT6WAPF5U6zj93eLQlvpV
 RaMb/K7BiLtdfLbgmY7Qj4+V697qMwXzGZ3HDYVX6f3GVmJAridoTUbfJ27KofnKeKwk
 PNaJY6rUV7ZuRw8iu9mQ9ndOv7ZdsfzZ3Tu748/st4MNFOc9PHeearJhyY0VRATbkIOF
 8dbQ==
X-Gm-Message-State: AOAM530YwKtsJvWJjlR6lXzpx91dz8QJ+z75kVX7o2HxyhOVdRhlMWgH
 uRgei8pt84oeelZ9Ei+avtI=
X-Google-Smtp-Source: ABdhPJzXjTCbb7sYVKDYhKccM3YADztq69vU3q0uwNiR+BHc+7/jaDZuej/cfAX3vdeCaaHbQ14ErQ==
X-Received: by 2002:a17:907:3e06:: with SMTP id
 hp6mr32928460ejc.273.1619680083970; 
 Thu, 29 Apr 2021 00:08:03 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:49f7:8b5a:d7ab:5e3e?
 ([2a02:908:1252:fb60:49f7:8b5a:d7ab:5e3e])
 by smtp.gmail.com with ESMTPSA id k9sm1293504eje.102.2021.04.29.00.08.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Apr 2021 00:08:03 -0700 (PDT)
Subject: Re: [PATCH v5 06/27] drm/amdgpu: Handle IOMMU enabled case.
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
References: <20210428151207.1212258-1-andrey.grodzovsky@amd.com>
 <20210428151207.1212258-7-andrey.grodzovsky@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <8ba9edd8-9d6d-b6c3-342c-3f137d0cacd0@gmail.com>
Date: Thu, 29 Apr 2021 09:08:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210428151207.1212258-7-andrey.grodzovsky@amd.com>
Content-Language: en-US
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
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org, helgaas@kernel.org,
 Felix.Kuehling@amd.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 28.04.21 um 17:11 schrieb Andrey Grodzovsky:
> Handle all DMA IOMMU gropup related dependencies before the
> group is removed.
>
> v5: Drop IOMMU notifier and switch to lockless call to ttm_tt_unpopulate

Maybe split that up into more patches.

>
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  2 ++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 31 ++++++++++++++++++++--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c   |  3 +--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h   |  1 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c    |  9 +++++++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 13 ++++++++-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.h |  2 ++
>   drivers/gpu/drm/amd/amdgpu/cik_ih.c        |  1 -
>   drivers/gpu/drm/amd/amdgpu/cz_ih.c         |  1 -
>   drivers/gpu/drm/amd/amdgpu/iceland_ih.c    |  1 -
>   drivers/gpu/drm/amd/amdgpu/navi10_ih.c     |  3 ---
>   drivers/gpu/drm/amd/amdgpu/si_ih.c         |  1 -
>   drivers/gpu/drm/amd/amdgpu/tonga_ih.c      |  1 -
>   drivers/gpu/drm/amd/amdgpu/vega10_ih.c     |  3 ---
>   14 files changed, 56 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index fddb82897e5d..30a24db5f4d1 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -1054,6 +1054,8 @@ struct amdgpu_device {
>   
>   	bool                            in_pci_err_recovery;
>   	struct pci_saved_state          *pci_state;
> +
> +	struct list_head                device_bo_list;
>   };
>   
>   static inline struct amdgpu_device *drm_to_adev(struct drm_device *ddev)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 46d646c40338..91594ddc2459 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -70,6 +70,7 @@
>   #include <drm/task_barrier.h>
>   #include <linux/pm_runtime.h>
>   
> +
>   MODULE_FIRMWARE("amdgpu/vega10_gpu_info.bin");
>   MODULE_FIRMWARE("amdgpu/vega12_gpu_info.bin");
>   MODULE_FIRMWARE("amdgpu/raven_gpu_info.bin");
> @@ -3211,7 +3212,6 @@ static const struct attribute *amdgpu_dev_attributes[] = {
>   	NULL
>   };
>   
> -
>   /**
>    * amdgpu_device_init - initialize the driver
>    *
> @@ -3316,6 +3316,8 @@ int amdgpu_device_init(struct amdgpu_device *adev,
>   
>   	INIT_WORK(&adev->xgmi_reset_work, amdgpu_device_xgmi_reset_func);
>   
> +	INIT_LIST_HEAD(&adev->device_bo_list);
> +
>   	adev->gfx.gfx_off_req_count = 1;
>   	adev->pm.ac_power = power_supply_is_system_supplied() > 0;
>   
> @@ -3601,6 +3603,28 @@ int amdgpu_device_init(struct amdgpu_device *adev,
>   	return r;
>   }
>   
> +static void amdgpu_clear_dma_mappings(struct amdgpu_device *adev)
> +{
> +	struct amdgpu_bo *bo = NULL;
> +
> +	/*
> +	 * Unmaps all DMA mappings before device will be removed from it's
> +	 * IOMMU group otherwise in case of IOMMU enabled system a crash
> +	 * will happen.
> +	 */
> +
> +	spin_lock(&adev->mman.bdev.lru_lock);
> +	while (!list_empty(&adev->device_bo_list)) {
> +		bo = list_first_entry(&adev->device_bo_list, struct amdgpu_bo, bo);
> +		list_del_init(&bo->bo);
> +		spin_unlock(&adev->mman.bdev.lru_lock);
> +		if (bo->tbo.ttm)
> +			ttm_tt_unpopulate(bo->tbo.bdev, bo->tbo.ttm);
> +		spin_lock(&adev->mman.bdev.lru_lock);
> +	}
> +	spin_unlock(&adev->mman.bdev.lru_lock);

Can you try to use the same approach as amdgpu_gtt_mgr_recover() instead 
of adding something to the BO?

Christian.

> +}
> +
>   /**
>    * amdgpu_device_fini - tear down the driver
>    *
> @@ -3639,12 +3663,15 @@ void amdgpu_device_fini_hw(struct amdgpu_device *adev)
>   		amdgpu_ucode_sysfs_fini(adev);
>   	sysfs_remove_files(&adev->dev->kobj, amdgpu_dev_attributes);
>   
> -
>   	amdgpu_fbdev_fini(adev);
>   
>   	amdgpu_irq_fini_hw(adev);
>   
>   	amdgpu_device_ip_fini_early(adev);
> +
> +	amdgpu_clear_dma_mappings(adev);
> +
> +	amdgpu_gart_dummy_page_fini(adev);
>   }
>   
>   void amdgpu_device_fini_sw(struct amdgpu_device *adev)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c
> index fde2d899b2c4..49cdcaf8512d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c
> @@ -92,7 +92,7 @@ static int amdgpu_gart_dummy_page_init(struct amdgpu_device *adev)
>    *
>    * Frees the dummy page used by the driver (all asics).
>    */
> -static void amdgpu_gart_dummy_page_fini(struct amdgpu_device *adev)
> +void amdgpu_gart_dummy_page_fini(struct amdgpu_device *adev)
>   {
>   	if (!adev->dummy_page_addr)
>   		return;
> @@ -397,5 +397,4 @@ void amdgpu_gart_fini(struct amdgpu_device *adev)
>   	vfree(adev->gart.pages);
>   	adev->gart.pages = NULL;
>   #endif
> -	amdgpu_gart_dummy_page_fini(adev);
>   }
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h
> index afa2e2877d87..5678d9c105ab 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h
> @@ -61,6 +61,7 @@ int amdgpu_gart_table_vram_pin(struct amdgpu_device *adev);
>   void amdgpu_gart_table_vram_unpin(struct amdgpu_device *adev);
>   int amdgpu_gart_init(struct amdgpu_device *adev);
>   void amdgpu_gart_fini(struct amdgpu_device *adev);
> +void amdgpu_gart_dummy_page_fini(struct amdgpu_device *adev);
>   int amdgpu_gart_unbind(struct amdgpu_device *adev, uint64_t offset,
>   		       int pages);
>   int amdgpu_gart_map(struct amdgpu_device *adev, uint64_t offset,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
> index 63e815c27585..a922154953a7 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
> @@ -326,6 +326,15 @@ void amdgpu_irq_fini_hw(struct amdgpu_device *adev)
>   		if (!amdgpu_device_has_dc_support(adev))
>   			flush_work(&adev->hotplug_work);
>   	}
> +
> +	if (adev->irq.ih_soft.ring)
> +		amdgpu_ih_ring_fini(adev, &adev->irq.ih_soft);
> +	if (adev->irq.ih.ring)
> +		amdgpu_ih_ring_fini(adev, &adev->irq.ih);
> +	if (adev->irq.ih1.ring)
> +		amdgpu_ih_ring_fini(adev, &adev->irq.ih1);
> +	if (adev->irq.ih2.ring)
> +		amdgpu_ih_ring_fini(adev, &adev->irq.ih2);
>   }
>   
>   /**
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index 485f249d063a..62d829f5e62c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -68,8 +68,13 @@ static void amdgpu_bo_destroy(struct ttm_buffer_object *tbo)
>   		list_del_init(&bo->shadow_list);
>   		mutex_unlock(&adev->shadow_list_lock);
>   	}
> -	amdgpu_bo_unref(&bo->parent);
>   
> +
> +	spin_lock(&adev->mman.bdev.lru_lock);
> +	list_del(&bo->bo);
> +	spin_unlock(&adev->mman.bdev.lru_lock);
> +
> +	amdgpu_bo_unref(&bo->parent);
>   	kfree(bo->metadata);
>   	kfree(bo);
>   }
> @@ -585,6 +590,12 @@ static int amdgpu_bo_do_create(struct amdgpu_device *adev,
>   	if (bp->type == ttm_bo_type_device)
>   		bo->flags &= ~AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED;
>   
> +	INIT_LIST_HEAD(&bo->bo);
> +
> +	spin_lock(&adev->mman.bdev.lru_lock);
> +	list_add_tail(&bo->bo, &adev->device_bo_list);
> +	spin_unlock(&adev->mman.bdev.lru_lock);
> +
>   	return 0;
>   
>   fail_unreserve:
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> index 9ac37569823f..5ae8555ef275 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> @@ -110,6 +110,8 @@ struct amdgpu_bo {
>   	struct list_head		shadow_list;
>   
>   	struct kgd_mem                  *kfd_bo;
> +
> +	struct list_head		bo;
>   };
>   
>   static inline struct amdgpu_bo *ttm_to_amdgpu_bo(struct ttm_buffer_object *tbo)
> diff --git a/drivers/gpu/drm/amd/amdgpu/cik_ih.c b/drivers/gpu/drm/amd/amdgpu/cik_ih.c
> index 183d44a6583c..df385ffc9768 100644
> --- a/drivers/gpu/drm/amd/amdgpu/cik_ih.c
> +++ b/drivers/gpu/drm/amd/amdgpu/cik_ih.c
> @@ -310,7 +310,6 @@ static int cik_ih_sw_fini(void *handle)
>   	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>   
>   	amdgpu_irq_fini_sw(adev);
> -	amdgpu_ih_ring_fini(adev, &adev->irq.ih);
>   	amdgpu_irq_remove_domain(adev);
>   
>   	return 0;
> diff --git a/drivers/gpu/drm/amd/amdgpu/cz_ih.c b/drivers/gpu/drm/amd/amdgpu/cz_ih.c
> index d32743949003..b8c47e0cf37a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/cz_ih.c
> +++ b/drivers/gpu/drm/amd/amdgpu/cz_ih.c
> @@ -302,7 +302,6 @@ static int cz_ih_sw_fini(void *handle)
>   	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>   
>   	amdgpu_irq_fini_sw(adev);
> -	amdgpu_ih_ring_fini(adev, &adev->irq.ih);
>   	amdgpu_irq_remove_domain(adev);
>   
>   	return 0;
> diff --git a/drivers/gpu/drm/amd/amdgpu/iceland_ih.c b/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
> index da96c6013477..ddfe4eaeea05 100644
> --- a/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
> +++ b/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
> @@ -301,7 +301,6 @@ static int iceland_ih_sw_fini(void *handle)
>   	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>   
>   	amdgpu_irq_fini_sw(adev);
> -	amdgpu_ih_ring_fini(adev, &adev->irq.ih);
>   	amdgpu_irq_remove_domain(adev);
>   
>   	return 0;
> diff --git a/drivers/gpu/drm/amd/amdgpu/navi10_ih.c b/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
> index 5eea4550b856..e171a9e78544 100644
> --- a/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
> +++ b/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
> @@ -571,9 +571,6 @@ static int navi10_ih_sw_fini(void *handle)
>   
>   	amdgpu_irq_fini_sw(adev);
>   	amdgpu_ih_ring_fini(adev, &adev->irq.ih_soft);
> -	amdgpu_ih_ring_fini(adev, &adev->irq.ih2);
> -	amdgpu_ih_ring_fini(adev, &adev->irq.ih1);
> -	amdgpu_ih_ring_fini(adev, &adev->irq.ih);
>   
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/amd/amdgpu/si_ih.c b/drivers/gpu/drm/amd/amdgpu/si_ih.c
> index 751307f3252c..9a24f17a5750 100644
> --- a/drivers/gpu/drm/amd/amdgpu/si_ih.c
> +++ b/drivers/gpu/drm/amd/amdgpu/si_ih.c
> @@ -176,7 +176,6 @@ static int si_ih_sw_fini(void *handle)
>   	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>   
>   	amdgpu_irq_fini_sw(adev);
> -	amdgpu_ih_ring_fini(adev, &adev->irq.ih);
>   
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/amd/amdgpu/tonga_ih.c b/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
> index 973d80ec7f6c..b08905d1c00f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
> +++ b/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
> @@ -313,7 +313,6 @@ static int tonga_ih_sw_fini(void *handle)
>   	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>   
>   	amdgpu_irq_fini_sw(adev);
> -	amdgpu_ih_ring_fini(adev, &adev->irq.ih);
>   	amdgpu_irq_remove_domain(adev);
>   
>   	return 0;
> diff --git a/drivers/gpu/drm/amd/amdgpu/vega10_ih.c b/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
> index 2d0094c276ca..8c8abc00f710 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
> @@ -525,9 +525,6 @@ static int vega10_ih_sw_fini(void *handle)
>   
>   	amdgpu_irq_fini_sw(adev);
>   	amdgpu_ih_ring_fini(adev, &adev->irq.ih_soft);
> -	amdgpu_ih_ring_fini(adev, &adev->irq.ih2);
> -	amdgpu_ih_ring_fini(adev, &adev->irq.ih1);
> -	amdgpu_ih_ring_fini(adev, &adev->irq.ih);
>   
>   	return 0;
>   }

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
