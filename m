Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BAB2FB480
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jan 2021 09:48:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF77389AB3;
	Tue, 19 Jan 2021 08:48:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F30B89823;
 Tue, 19 Jan 2021 08:48:08 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id rv9so8565990ejb.13;
 Tue, 19 Jan 2021 00:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=O18ksuYM1x+XVDFkzH9aD0n+Ad8o9SHxR11+T1Sy7DU=;
 b=defcVE4Iyhn5uhBlBXUjnSUEfv3MZWClpVao2EXJ90KIY742bt4xK1nI/NbgIljAtE
 aflxtIOB3s2xa0M3diHfVsIPrkKVoHojF1V3b7PrPApW7lr1zlo0nQO+9B/nAG2XeeJg
 xJgrtdd7FMlVmOZ0ScUjZSMkiZF8bBR7oz6q/YIFEBj4XVQWtTGSdfoPWTkZOlMZPnuv
 zYc+Wq70UPkpXj5y5MwbnMyZa1J7piyVkEG1atdxwp6k+re7gdTg7I9E/TVTehrinnFB
 fWBG8cLoXbaLumCxqPJBGM/rJnhPNPpx5syav9ilPOz6jMM2vQeRL8X/NR/v0xCe1lbW
 kQWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=O18ksuYM1x+XVDFkzH9aD0n+Ad8o9SHxR11+T1Sy7DU=;
 b=B81dIedJBCRGb3wKrj3+DWnc3PpaWRhGxwSOCEkVsGiPPZtqz/t/LTK3HQXYiUCqUA
 gSMosZruMuiJKkDCq+z94P/ZcOAXhso2cCcFK7JPc855A01zEMaebMqLSvfCqHyTCy+5
 vDPmlXNx5upvmj8kVan16k+9j/aDBxKgp/3hMQXPSgFabrOSgREb+M6MBAn09oeSWOs/
 osPcAhO8CDrBvMyL4oN+h38esNFYJhuNMhQ8Ls56Fs7HavnTud4Rie5J1osFMTwq+G2V
 J44tukefhqGXcMC9P/uXpF7GuNqPZYwkR41+nIOkI5k2CFwWu1vInMjKGOMW5VMccJhg
 +Y9Q==
X-Gm-Message-State: AOAM533zwaVyUjFRBMQYpp7S8eo1swLY58eCGVIvIi/RGTYhFxczlKff
 KgN+0bmXerUNsXfryyBw9qA=
X-Google-Smtp-Source: ABdhPJyQXH2kN7b29KRqQmazaoHIb3kSBQzhA86rzqCPF4DJrcUVWxcXl+lC5Fr4DdFPMIMzzUPd9Q==
X-Received: by 2002:a17:906:e107:: with SMTP id
 gj7mr2174332ejb.298.1611046087164; 
 Tue, 19 Jan 2021 00:48:07 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id x17sm11774709edd.76.2021.01.19.00.48.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jan 2021 00:48:06 -0800 (PST)
Subject: Re: [PATCH v4 07/14] drm/amdgpu: Register IOMMU topology notifier per
 device.
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, robh@kernel.org, l.stach@pengutronix.de,
 yuq825@gmail.com, eric@anholt.net
References: <1611003683-3534-1-git-send-email-andrey.grodzovsky@amd.com>
 <1611003683-3534-8-git-send-email-andrey.grodzovsky@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <2978ebf8-858d-6e8e-5657-1d0d615d56e0@gmail.com>
Date: Tue, 19 Jan 2021 09:48:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1611003683-3534-8-git-send-email-andrey.grodzovsky@amd.com>
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
Reply-To: christian.koenig@amd.com
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 18.01.21 um 22:01 schrieb Andrey Grodzovsky:
> Handle all DMA IOMMU gropup related dependencies before the
> group is removed.
>
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  5 ++++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 46 ++++++++++++++++++++++++++++++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c   |  2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h   |  1 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 10 +++++++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.h |  2 ++
>   6 files changed, 65 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index 478a7d8..2953420 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -51,6 +51,7 @@
>   #include <linux/dma-fence.h>
>   #include <linux/pci.h>
>   #include <linux/aer.h>
> +#include <linux/notifier.h>
>   
>   #include <drm/ttm/ttm_bo_api.h>
>   #include <drm/ttm/ttm_bo_driver.h>
> @@ -1041,6 +1042,10 @@ struct amdgpu_device {
>   
>   	bool                            in_pci_err_recovery;
>   	struct pci_saved_state          *pci_state;
> +
> +	struct notifier_block		nb;
> +	struct blocking_notifier_head	notifier;
> +	struct list_head		device_bo_list;
>   };
>   
>   static inline struct amdgpu_device *drm_to_adev(struct drm_device *ddev)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 45e23e3..e99f4f1 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -70,6 +70,8 @@
>   #include <drm/task_barrier.h>
>   #include <linux/pm_runtime.h>
>   
> +#include <linux/iommu.h>
> +
>   MODULE_FIRMWARE("amdgpu/vega10_gpu_info.bin");
>   MODULE_FIRMWARE("amdgpu/vega12_gpu_info.bin");
>   MODULE_FIRMWARE("amdgpu/raven_gpu_info.bin");
> @@ -3200,6 +3202,39 @@ static const struct attribute *amdgpu_dev_attributes[] = {
>   };
>   
>   
> +static int amdgpu_iommu_group_notifier(struct notifier_block *nb,
> +				     unsigned long action, void *data)
> +{
> +	struct amdgpu_device *adev = container_of(nb, struct amdgpu_device, nb);
> +	struct amdgpu_bo *bo = NULL;
> +
> +	/*
> +	 * Following is a set of IOMMU group dependencies taken care of before
> +	 * device's IOMMU group is removed
> +	 */
> +	if (action == IOMMU_GROUP_NOTIFY_DEL_DEVICE) {
> +
> +		spin_lock(&ttm_bo_glob.lru_lock);
> +		list_for_each_entry(bo, &adev->device_bo_list, bo) {
> +			if (bo->tbo.ttm)
> +				ttm_tt_unpopulate(bo->tbo.bdev, bo->tbo.ttm);
> +		}
> +		spin_unlock(&ttm_bo_glob.lru_lock);

That approach won't work. ttm_tt_unpopulate() might sleep on an IOMMU lock.

You need to use a mutex here or even better make sure you can access the 
device_bo_list without a lock in this moment.

Christian.

> +
> +		if (adev->irq.ih.use_bus_addr)
> +			amdgpu_ih_ring_fini(adev, &adev->irq.ih);
> +		if (adev->irq.ih1.use_bus_addr)
> +			amdgpu_ih_ring_fini(adev, &adev->irq.ih1);
> +		if (adev->irq.ih2.use_bus_addr)
> +			amdgpu_ih_ring_fini(adev, &adev->irq.ih2);
> +
> +		amdgpu_gart_dummy_page_fini(adev);
> +	}
> +
> +	return NOTIFY_OK;
> +}
> +
> +
>   /**
>    * amdgpu_device_init - initialize the driver
>    *
> @@ -3304,6 +3339,8 @@ int amdgpu_device_init(struct amdgpu_device *adev,
>   
>   	INIT_WORK(&adev->xgmi_reset_work, amdgpu_device_xgmi_reset_func);
>   
> +	INIT_LIST_HEAD(&adev->device_bo_list);
> +
>   	adev->gfx.gfx_off_req_count = 1;
>   	adev->pm.ac_power = power_supply_is_system_supplied() > 0;
>   
> @@ -3575,6 +3612,15 @@ int amdgpu_device_init(struct amdgpu_device *adev,
>   	if (amdgpu_device_cache_pci_state(adev->pdev))
>   		pci_restore_state(pdev);
>   
> +	BLOCKING_INIT_NOTIFIER_HEAD(&adev->notifier);
> +	adev->nb.notifier_call = amdgpu_iommu_group_notifier;
> +
> +	if (adev->dev->iommu_group) {
> +		r = iommu_group_register_notifier(adev->dev->iommu_group, &adev->nb);
> +		if (r)
> +			goto failed;
> +	}
> +
>   	return 0;
>   
>   failed:
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c
> index 0db9330..486ad6d 100644
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
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h
> index afa2e28..5678d9c 100644
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
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index 6cc9919..4a1de69 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -94,6 +94,10 @@ static void amdgpu_bo_destroy(struct ttm_buffer_object *tbo)
>   	}
>   	amdgpu_bo_unref(&bo->parent);
>   
> +	spin_lock(&ttm_bo_glob.lru_lock);
> +	list_del(&bo->bo);
> +	spin_unlock(&ttm_bo_glob.lru_lock);
> +
>   	kfree(bo->metadata);
>   	kfree(bo);
>   }
> @@ -613,6 +617,12 @@ static int amdgpu_bo_do_create(struct amdgpu_device *adev,
>   	if (bp->type == ttm_bo_type_device)
>   		bo->flags &= ~AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED;
>   
> +	INIT_LIST_HEAD(&bo->bo);
> +
> +	spin_lock(&ttm_bo_glob.lru_lock);
> +	list_add_tail(&bo->bo, &adev->device_bo_list);
> +	spin_unlock(&ttm_bo_glob.lru_lock);
> +
>   	return 0;
>   
>   fail_unreserve:
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> index 9ac3756..5ae8555 100644
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

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
