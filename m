Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A9836E5CD
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 09:19:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A113E6ED22;
	Thu, 29 Apr 2021 07:19:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 924B26ED22;
 Thu, 29 Apr 2021 07:19:42 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id n25so5205069edr.5;
 Thu, 29 Apr 2021 00:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=EhxLWRP/GuSFjAg4apJtx2QRUn4D0rnHK/YL0ISOyZM=;
 b=q09BOxPepbeaMBRp596xIsWs2g3HTr9dUDBZOpQ6NZALJjqjLw/9fOEMmqJoOv/s4X
 fqs3y//DDV4fQ1JYfZIL9q+0fo9rRXD0GlKPOs6h7FcYNLPInzQ/ij5ZuySEtCAVQ/cM
 BhwZisgp9RwlKq1fZ4VtkdycHH/JEYMEa/p/DjA/p8GugjX40TZ+bl3KlbuQY6EcAhda
 OTK5k0Wq+fiIEXbLs7aOEpf2/OeTz+71joWxHbI0B5TcELZ4JlH0y5t9d4dTjWhX1plp
 EQywJSrmG0RDD3mnf3BrRBlFDaSNJ49yaT28oGMLeeIt8twEGtel3c9XTsN3SL41yuJS
 8dnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=EhxLWRP/GuSFjAg4apJtx2QRUn4D0rnHK/YL0ISOyZM=;
 b=b/v3JhhZfAWGgDJF8qq1M1ao8g9moKO/1RSd8PxRk8uz3kZM/dqPbLYmizbk1ZKCyJ
 EQ11ZN9U5JAjK66AOD+bnjvJ83gKy2jDkqx2YovB84f9JsWjoW2P1Tg8WV7gt4RXyVRi
 w4728FRzWZupa91t7q3TL37oQioz4sm6Wrhnm2gLfaMEIBMh1EQou8Y8LeiCceGoKhXN
 8HUUzCu+QvqENhZYZbHrlyAIIlhy6d6inJxDJu6zDYBmpbSRE/BtqzG+ukVUDm/XGcxl
 vp7a2wjmuA2YBV5L6o+NrxnmIxLmY8P51N1y3wRyXKtCeqhnetn3dXB1mJ95w4xEI5GQ
 GG+w==
X-Gm-Message-State: AOAM531W/haMZUejFBu6q82lRpkQtgcNFc705cx2VP+z51nrgMAj0/r+
 xNRjpT43i28Lph53sp50XDQ=
X-Google-Smtp-Source: ABdhPJyEVvr7AG4/Hg5dZ3Fd2bkoJAbD3E+70uD1k2r2mar5HZQnKd+hKUR8fxM9mX/JRCbKcRezPA==
X-Received: by 2002:a05:6402:781:: with SMTP id
 d1mr16882766edy.32.1619680781302; 
 Thu, 29 Apr 2021 00:19:41 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:49f7:8b5a:d7ab:5e3e?
 ([2a02:908:1252:fb60:49f7:8b5a:d7ab:5e3e])
 by smtp.gmail.com with ESMTPSA id bu20sm1286842ejb.76.2021.04.29.00.19.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Apr 2021 00:19:40 -0700 (PDT)
Subject: Re: [PATCH v5 16/27] drm/amdgpu: Unmap all MMIO mappings
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
References: <20210428151207.1212258-1-andrey.grodzovsky@amd.com>
 <20210428151207.1212258-17-andrey.grodzovsky@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <ac2bb28e-141a-ef05-328a-af398455c8b2@gmail.com>
Date: Thu, 29 Apr 2021 09:19:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210428151207.1212258-17-andrey.grodzovsky@amd.com>
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
> Access to those must be prevented post pci_remove

That is certainly a no-go. We want to get rid of the kernel pointers in 
BOs, not add another one.

Christian.

>
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  5 +++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 38 ++++++++++++++++++++--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 28 ++++++++++++++--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.h |  5 +++
>   4 files changed, 71 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index 30a24db5f4d1..3e4755fc10c8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -1056,6 +1056,11 @@ struct amdgpu_device {
>   	struct pci_saved_state          *pci_state;
>   
>   	struct list_head                device_bo_list;
> +
> +	/* List of all MMIO BOs */
> +	struct list_head                mmio_list;
> +	struct mutex                    mmio_list_lock;
> +
>   };
>   
>   static inline struct amdgpu_device *drm_to_adev(struct drm_device *ddev)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 22b09c4db255..3ddad6cba62d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -3320,6 +3320,9 @@ int amdgpu_device_init(struct amdgpu_device *adev,
>   	INIT_LIST_HEAD(&adev->shadow_list);
>   	mutex_init(&adev->shadow_list_lock);
>   
> +	INIT_LIST_HEAD(&adev->mmio_list);
> +	mutex_init(&adev->mmio_list_lock);
> +
>   	INIT_DELAYED_WORK(&adev->delayed_init_work,
>   			  amdgpu_device_delayed_init_work_handler);
>   	INIT_DELAYED_WORK(&adev->gfx.gfx_off_delay_work,
> @@ -3636,6 +3639,36 @@ static void amdgpu_clear_dma_mappings(struct amdgpu_device *adev)
>   	spin_unlock(&adev->mman.bdev.lru_lock);
>   }
>   
> +static void amdgpu_device_unmap_mmio(struct amdgpu_device *adev)
> +{
> +	struct amdgpu_bo *bo;
> +
> +	/* Clear all CPU mappings pointing to this device */
> +	unmap_mapping_range(adev->ddev.anon_inode->i_mapping, 0, 0, 1);
> +
> +	/* Unmap all MMIO mapped kernel BOs */
> +	mutex_lock(&adev->mmio_list_lock);
> +	list_for_each_entry(bo, &adev->mmio_list, mmio_list) {
> +		amdgpu_bo_kunmap(bo);
> +		if (*bo->kmap_ptr)
> +			*bo->kmap_ptr = NULL;
> +	}
> +	mutex_unlock(&adev->mmio_list_lock);
> +
> +	/* Unmap all mapped bars - Doorbell, registers and VRAM */
> +	amdgpu_device_doorbell_fini(adev);
> +
> +	iounmap(adev->rmmio);
> +	adev->rmmio = NULL;
> +	if (adev->mman.aper_base_kaddr)
> +		iounmap(adev->mman.aper_base_kaddr);
> +	adev->mman.aper_base_kaddr = NULL;
> +
> +	/* Memory manager related */
> +	arch_phys_wc_del(adev->gmc.vram_mtrr);
> +	arch_io_free_memtype_wc(adev->gmc.aper_base, adev->gmc.aper_size);
> +}
> +
>   /**
>    * amdgpu_device_fini - tear down the driver
>    *
> @@ -3683,6 +3716,8 @@ void amdgpu_device_fini_hw(struct amdgpu_device *adev)
>   	amdgpu_clear_dma_mappings(adev);
>   
>   	amdgpu_gart_dummy_page_fini(adev);
> +
> +	amdgpu_device_unmap_mmio(adev);
>   }
>   
>   void amdgpu_device_fini_sw(struct amdgpu_device *adev)
> @@ -3713,9 +3748,6 @@ void amdgpu_device_fini_sw(struct amdgpu_device *adev)
>   	if (adev->rio_mem)
>   		pci_iounmap(adev->pdev, adev->rio_mem);
>   	adev->rio_mem = NULL;
> -	iounmap(adev->rmmio);
> -	adev->rmmio = NULL;
> -	amdgpu_device_doorbell_fini(adev);
>   
>   	if (IS_ENABLED(CONFIG_PERF_EVENTS))
>   		amdgpu_pmu_fini(adev);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index 62d829f5e62c..9b05e3b96fa0 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -531,6 +531,9 @@ static int amdgpu_bo_do_create(struct amdgpu_device *adev,
>   		return -ENOMEM;
>   	drm_gem_private_object_init(adev_to_drm(adev), &bo->tbo.base, size);
>   	INIT_LIST_HEAD(&bo->shadow_list);
> +
> +	INIT_LIST_HEAD(&bo->mmio_list);
> +
>   	bo->vm_bo = NULL;
>   	bo->preferred_domains = bp->preferred_domain ? bp->preferred_domain :
>   		bp->domain;
> @@ -774,9 +777,21 @@ int amdgpu_bo_kmap(struct amdgpu_bo *bo, void **ptr)
>   	if (r)
>   		return r;
>   
> -	if (ptr)
> +	if (bo->kmap.bo_kmap_type == ttm_bo_map_iomap) {
> +		struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
> +
> +		mutex_lock(&adev->mmio_list_lock);
> +		list_add_tail(&bo->mmio_list, &adev->mmio_list);
> +		mutex_unlock(&adev->mmio_list_lock);
> +	}
> +
> +	if (ptr) {
>   		*ptr = amdgpu_bo_kptr(bo);
>   
> +		if (bo->kmap.bo_kmap_type == ttm_bo_map_iomap)
> +			bo->kmap_ptr = ptr;
> +	}
> +
>   	return 0;
>   }
>   
> @@ -804,8 +819,17 @@ void *amdgpu_bo_kptr(struct amdgpu_bo *bo)
>    */
>   void amdgpu_bo_kunmap(struct amdgpu_bo *bo)
>   {
> -	if (bo->kmap.bo)
> +	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
> +
> +	if (bo->kmap.bo) {
> +		if (bo->kmap.bo_kmap_type == ttm_bo_map_iomap) {
> +			mutex_lock(&adev->mmio_list_lock);
> +			list_del_init(&bo->mmio_list);
> +			mutex_unlock(&adev->mmio_list_lock);
> +		}
> +
>   		ttm_bo_kunmap(&bo->kmap);
> +	}
>   }
>   
>   /**
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> index 5ae8555ef275..3129d9bbfa22 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> @@ -112,6 +112,11 @@ struct amdgpu_bo {
>   	struct kgd_mem                  *kfd_bo;
>   
>   	struct list_head		bo;
> +
> +	struct list_head                mmio_list;
> +	/* Address of kernel VA pointer to MMIO so they can be updated post remap */
> +	void				**kmap_ptr;
> +
>   };
>   
>   static inline struct amdgpu_bo *ttm_to_amdgpu_bo(struct ttm_buffer_object *tbo)

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
