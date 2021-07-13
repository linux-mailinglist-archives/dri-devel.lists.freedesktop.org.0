Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A18B13C6AD7
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 08:57:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 339E66E037;
	Tue, 13 Jul 2021 06:57:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3AA86E037;
 Tue, 13 Jul 2021 06:57:03 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id l6so4598467wmq.0;
 Mon, 12 Jul 2021 23:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=cy079q31qXB4BvQ61x/GgLNgLlogDlpGpmHYR82mcr4=;
 b=Sz6h8Cl7CeuRGcd0WobLRbMD5EO3w/iY24tng6BEDd85ht3MSejAc1MhA51Y89YVCU
 BKZk05PBMdLpNqXiPyGqNPwiTRwvdzwfVzbem7nin4+fWvIoqe0NQh0KTZ2ui5ogJX8e
 Cpv4//kNTwnkXAJDa3lyoxnHos9ReRk9myHXDDeNdnqHgUtRQzVuoHQPdDBou4BhSbWS
 +flM17GI8xii+VWVYSsFT0UUgPW1yE/SvwoSZhNExHHsnybUz3ibWZowzCNgqsDt629k
 vvE1yhJGgN9x4bdBs8SXj+T6y9YCaQ29r+m6nMzpd9ql2+KVNmL1DeSjQA0kzrqH6Sd+
 MAsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=cy079q31qXB4BvQ61x/GgLNgLlogDlpGpmHYR82mcr4=;
 b=gTIfCgDApQRglBHNxX7dMnTqtLj5YxcM3MtlsAl301Inv8g8RgbPjY6OkoyUU+UrhI
 f6zPPCAJO2RJYGh56s1C/NhTrUB0sfaHTWf6DEPMrzHWEu6c/XUOwhyJLR7+xynQGQPC
 0E5Tak7axF8Mk5H8L26v6sYZksfsbAadM0p3c6L3SXpFEGvvDpgcoIr0nti9/RO8to05
 fNPOLWMMelGw3OZb77HOCubs812KrYJD2/p+UBElK2hqNEVMoWFtR2yC1xvOwVFJNCcz
 MqM19yZoOXFW1m0N+C6CI9VpymDz4OfzaOeyHXP9qWnnOmhe+Q6HxTKyU+c6iQPJGOQv
 lgGQ==
X-Gm-Message-State: AOAM530pzq9r8ahciblSt0vyyRL/wrgftYgWrhTIO8/M44ZBqECzSp1k
 D1jQlxhJf1BVaAIkD7P7Nek=
X-Google-Smtp-Source: ABdhPJzv5keanHOvfjKMP+K0kNh5HHLrTzJMbE9Qy8Or0RjnzZQMGpZBEmskMow/yTTLvPNy8DmWyQ==
X-Received: by 2002:a1c:c90c:: with SMTP id f12mr18866700wmb.80.1626159422319; 
 Mon, 12 Jul 2021 23:57:02 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:7f5a:cff:4644:b698?
 ([2a02:908:1252:fb60:7f5a:cff:4644:b698])
 by smtp.gmail.com with ESMTPSA id d14sm6083438wrs.49.2021.07.12.23.57.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jul 2021 23:57:01 -0700 (PDT)
Subject: Re: [PATCH v3 1/1] drm/ttm: Fix COW check
To: Felix Kuehling <Felix.Kuehling@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20210712220636.475675-1-Felix.Kuehling@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <d617d831-7168-51a4-042e-e36a5af7761d@gmail.com>
Date: Tue, 13 Jul 2021 08:57:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210712220636.475675-1-Felix.Kuehling@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 13.07.21 um 00:06 schrieb Felix Kuehling:
> KFD Thunk maps invisible VRAM BOs with PROT_NONE, MAP_PRIVATE.
> is_cow_mapping returns true for these mappings. Add a check for
> vm_flags & VM_WRITE to avoid mmap failures on private read-only or
> PROT_NONE mappings.
>
> v2: protect against mprotect making a mapping writable after the fact
> v3: update driver-specific vm_operations_structs
>
> Fixes: f91142c62161 ("drm/ttm: nuke VM_MIXEDMAP on BO mappings v3")
> Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c  |  3 ++-
>   drivers/gpu/drm/nouveau/nouveau_gem.c    |  3 ++-
>   drivers/gpu/drm/radeon/radeon_gem.c      |  3 ++-
>   drivers/gpu/drm/ttm/ttm_bo_vm.c          | 14 +++++++++++++-
>   drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c |  1 +
>   include/drm/ttm/ttm_bo_api.h             |  4 ++++
>   6 files changed, 24 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> index b3404c43a911..1aa750a6a5d2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> @@ -79,7 +79,8 @@ static const struct vm_operations_struct amdgpu_gem_vm_ops = {
>   	.fault = amdgpu_gem_fault,
>   	.open = ttm_bo_vm_open,
>   	.close = ttm_bo_vm_close,
> -	.access = ttm_bo_vm_access
> +	.access = ttm_bo_vm_access,
> +	.mprotect = ttm_bo_vm_mprotect
>   };
>   
>   static void amdgpu_gem_object_free(struct drm_gem_object *gobj)
> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
> index 5b27845075a1..164ea564bb7a 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
> @@ -70,7 +70,8 @@ static const struct vm_operations_struct nouveau_ttm_vm_ops = {
>   	.fault = nouveau_ttm_fault,
>   	.open = ttm_bo_vm_open,
>   	.close = ttm_bo_vm_close,
> -	.access = ttm_bo_vm_access
> +	.access = ttm_bo_vm_access,
> +	.mprotect = ttm_bo_vm_mprotect
>   };
>   
>   void
> diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
> index 458f92a70887..c19ad07eb7b5 100644
> --- a/drivers/gpu/drm/radeon/radeon_gem.c
> +++ b/drivers/gpu/drm/radeon/radeon_gem.c
> @@ -77,7 +77,8 @@ static const struct vm_operations_struct radeon_gem_vm_ops = {
>   	.fault = radeon_gem_fault,
>   	.open = ttm_bo_vm_open,
>   	.close = ttm_bo_vm_close,
> -	.access = ttm_bo_vm_access
> +	.access = ttm_bo_vm_access,
> +	.mprotect = ttm_bo_vm_mprotect
>   };
>   
>   static void radeon_gem_object_free(struct drm_gem_object *gobj)
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> index f56be5bc0861..fb325bad5db6 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> @@ -542,17 +542,29 @@ int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
>   }
>   EXPORT_SYMBOL(ttm_bo_vm_access);
>   
> +int ttm_bo_vm_mprotect(struct vm_area_struct *vma, unsigned long start,
> +		       unsigned long end, unsigned long newflags)
> +{
> +	/* Enforce no COW since would have really strange behavior with it. */
> +	if (is_cow_mapping(newflags) && (newflags & VM_WRITE))
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(ttm_bo_vm_mprotect);
> +
>   static const struct vm_operations_struct ttm_bo_vm_ops = {
>   	.fault = ttm_bo_vm_fault,
>   	.open = ttm_bo_vm_open,
>   	.close = ttm_bo_vm_close,
>   	.access = ttm_bo_vm_access,
> +	.mprotect = ttm_bo_vm_mprotect,
>   };
>   
>   int ttm_bo_mmap_obj(struct vm_area_struct *vma, struct ttm_buffer_object *bo)
>   {
>   	/* Enforce no COW since would have really strange behavior with it. */
> -	if (is_cow_mapping(vma->vm_flags))
> +	if (is_cow_mapping(vma->vm_flags) && (vma->vm_flags & VM_WRITE))
>   		return -EINVAL;
>   
>   	ttm_bo_get(bo);
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
> index e6b1f98ec99f..e4bf7dc99320 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
> @@ -61,6 +61,7 @@ int vmw_mmap(struct file *filp, struct vm_area_struct *vma)
>   		.fault = vmw_bo_vm_fault,
>   		.open = ttm_bo_vm_open,
>   		.close = ttm_bo_vm_close,
> +		.mprotect = ttm_bo_vm_mprotect,
>   #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>   		.huge_fault = vmw_bo_vm_huge_fault,
>   #endif
> diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
> index f681bbdbc698..40eb95875355 100644
> --- a/include/drm/ttm/ttm_bo_api.h
> +++ b/include/drm/ttm/ttm_bo_api.h
> @@ -605,6 +605,10 @@ void ttm_bo_vm_close(struct vm_area_struct *vma);
>   
>   int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
>   		     void *buf, int len, int write);
> +
> +int ttm_bo_vm_mprotect(struct vm_area_struct *vma, unsigned long start,
> +		       unsigned long end, unsigned long newflags);
> +
>   bool ttm_bo_delayed_delete(struct ttm_device *bdev, bool remove_all);
>   
>   vm_fault_t ttm_bo_vm_dummy_page(struct vm_fault *vmf, pgprot_t prot);

