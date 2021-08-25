Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6B53F6FBB
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 08:43:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF4956E155;
	Wed, 25 Aug 2021 06:43:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAF396E155;
 Wed, 25 Aug 2021 06:43:36 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id z4so19086433wrr.6;
 Tue, 24 Aug 2021 23:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=fzACWBmlHWt2s2ApnNdT2Sp99bgbRcT2MvngoYnJ8S4=;
 b=jRTu7hBsRbVMVnQGe/qCiutZPsSk4FpkA811nuHR1EvdQREcvgU/PPailleFVSDWsj
 iePDOtLjfdqnUmN2xvbfQ/MtwEg2IjlZxpQDxOaxHqo02tz3n8oWr8Ug8RKnTJ2Q7MSH
 D3k1IFaYKYTT9XbIKZ4Hbu0QSHQVuA1oIExEZF8fAwm9aUtv1vRz948b2hjKepSPOGSr
 VAhgO/4DBXMn91BR6YYF1iC0kS8Ya/IcnPzmr0PVmaFB5oyXSL/iXzEc1evw5u8pcKuR
 WWvlaJKfPFn1em5Z+KqV+TJaG9dvm8R2isMQ8eGJX9loeudsFmAIw/+Czrdhlh+Z7tfh
 cCDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=fzACWBmlHWt2s2ApnNdT2Sp99bgbRcT2MvngoYnJ8S4=;
 b=Fvwd1akLyBtSZoAUTww2ME8rIuwE0Q12eHEjm2mcVtW0sS/Zd0CY2x+BALAb4v+4P7
 qVt8zVq1DMrAfEyX1A7jDHroeFYTKHWl9fTvqfzgSrAxuv+aK72wxQ4MlXfIEEO3rl48
 IF3dVEbzaNy2DtgHAv2DpG0tRMi5s6Hs6UHBLlb8/Y3kUQDRUS7d1lXpBKsqYYSkxOBh
 R5/wOC5SYOzsxA/yNMJa3R8EvulECG6Kal8iEpaQi8lMMv/KHWrAHJQjxzPR/yO83xBS
 q6e5/WKWQzkLm8GtZ2ImoHZc4bo7CCL4aiYPzeTqTx5nSseZQW5cxN01Lsz7iMGY4M6q
 b49w==
X-Gm-Message-State: AOAM531w3BX5S5pkedvO03DdYDAOdn5T57Zo5co99nEj+zrvenHrmaBq
 4CWdRBKo5lM2FIam2v2yTr/zfENmQ5Qo9HxJ
X-Google-Smtp-Source: ABdhPJxksAFBjvM/JimH9+ossKd5aJcyos7ZtQhvtBrueTzo3bJeS7PREbAV+tyEr1+7cS/A5bmG9g==
X-Received: by 2002:adf:ea09:: with SMTP id q9mr23299934wrm.64.1629873815446; 
 Tue, 24 Aug 2021 23:43:35 -0700 (PDT)
Received: from [192.168.178.21] (p5b0ea1b5.dip0.t-ipconnect.de.
 [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id y6sm10514106wrm.54.2021.08.24.23.43.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Aug 2021 23:43:35 -0700 (PDT)
Subject: Re: [PATCH 3/4] drm/amdgpu: drm/amdgpu: Handle IOMMU enabled case
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20210824210120.49812-1-andrey.grodzovsky@amd.com>
 <20210824210120.49812-4-andrey.grodzovsky@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <d4e6682e-2d2f-f271-6041-6bcb145c1fc9@gmail.com>
Date: Wed, 25 Aug 2021 08:43:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210824210120.49812-4-andrey.grodzovsky@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 24.08.21 um 23:01 schrieb Andrey Grodzovsky:
> Handle all DMA IOMMU group related dependencies before the
> group is removed and we try to access it after free.
>
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  2 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    | 50 ++++++++++++++++++++++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h    |  1 +
>   3 files changed, 53 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 0b5764aa98a4..288a465b8101 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -3860,6 +3860,8 @@ void amdgpu_device_fini_hw(struct amdgpu_device *adev)
>   
>   	amdgpu_device_ip_fini_early(adev);
>   
> +	amdgpu_ttm_clear_dma_mappings(adev);
> +
>   	amdgpu_gart_dummy_page_fini(adev);
>   
>   	amdgpu_device_unmap_mmio(adev);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 446943e32e3e..f73d807db3b0 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -64,6 +64,7 @@
>   static int amdgpu_ttm_backend_bind(struct ttm_device *bdev,
>   				   struct ttm_tt *ttm,
>   				   struct ttm_resource *bo_mem);
> +
>   static void amdgpu_ttm_backend_unbind(struct ttm_device *bdev,
>   				      struct ttm_tt *ttm);
>   
> @@ -2293,6 +2294,55 @@ static ssize_t amdgpu_iomem_write(struct file *f, const char __user *buf,
>   	return result;
>   }
>   
> +void amdgpu_ttm_clear_dma_mappings(struct amdgpu_device *adev)

I strongly think that this function should be part of TTM. Something 
like ttm_device_force_unpopulate.

> +{
> +	struct ttm_device *bdev = &adev->mman.bdev;
> +	struct ttm_resource_manager *man;
> +	struct ttm_buffer_object *bo;
> +	unsigned int i, j;
> +
> +	spin_lock(&bdev->lru_lock);
> +	for (i = TTM_PL_SYSTEM; i < TTM_NUM_MEM_TYPES; ++i) {
> +		man = ttm_manager_type(bdev, i);
> +		if (!man || !man->use_tt)
> +			continue;
> +
> +		while (!list_empty(&man->pinned)) {
> +			bo = list_first_entry(&man->pinned, struct ttm_buffer_object, lru);
> +			/* Take ref against racing releases once lru_lock is unlocked */
> +			ttm_bo_get(bo);
> +			list_del_init(&bo->lru);
> +			spin_unlock(&bdev->lru_lock);
> +
> +			if (bo->ttm) {
> +				amdgpu_ttm_backend_unbind(bo->bdev, bo->ttm);
> +				ttm_tt_destroy_common(bo->bdev, bo->ttm);

Then you can also cleanly use ttm_tt_unpopulate here, cause this will 
result in incorrect statistics inside TTM atm.

Regards,
Christian.

> +			}
> +
> +			ttm_bo_put(bo);
> +			spin_lock(&bdev->lru_lock);
> +		}
> +
> +		for (j = 0; j < TTM_MAX_BO_PRIORITY; ++j) {
> +			while (!list_empty(&man->lru[j])) {
> +				bo = list_first_entry(&man->lru[j], struct ttm_buffer_object, lru);
> +				ttm_bo_get(bo);
> +				list_del_init(&bo->lru);
> +				spin_unlock(&bdev->lru_lock);
> +
> +				if (bo->ttm) {
> +					amdgpu_ttm_backend_unbind(bo->bdev, bo->ttm);
> +					ttm_tt_destroy_common(bo->bdev, bo->ttm);
> +				}
> +				ttm_bo_put(bo);
> +				spin_lock(&bdev->lru_lock);
> +			}
> +		}
> +	}
> +	spin_unlock(&bdev->lru_lock);
> +
> +}
> +
>   static const struct file_operations amdgpu_ttm_iomem_fops = {
>   	.owner = THIS_MODULE,
>   	.read = amdgpu_iomem_read,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> index e69f3e8e06e5..02c8eac48a64 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> @@ -190,6 +190,7 @@ bool amdgpu_ttm_tt_is_readonly(struct ttm_tt *ttm);
>   uint64_t amdgpu_ttm_tt_pde_flags(struct ttm_tt *ttm, struct ttm_resource *mem);
>   uint64_t amdgpu_ttm_tt_pte_flags(struct amdgpu_device *adev, struct ttm_tt *ttm,
>   				 struct ttm_resource *mem);
> +void amdgpu_ttm_clear_dma_mappings(struct amdgpu_device *adev);
>   
>   void amdgpu_ttm_debugfs_init(struct amdgpu_device *adev);
>   

