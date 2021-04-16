Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C99C2362152
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 15:46:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87AC06EA30;
	Fri, 16 Apr 2021 13:46:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 593DB6E0C4;
 Fri, 16 Apr 2021 13:46:20 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id j12so7321489edy.3;
 Fri, 16 Apr 2021 06:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=gyvXgqlyZpHUIm/h1OCk2xVbzq7vNfV05vzal9UiBPY=;
 b=U/0gyl/9GNKP51jEDroPhgGvz+stGipWe8QSJUWnEiRCXKtKQRRWvSiBjfITSM35Vn
 O3bvBYnj840A8wGwwP6aAel3L/M8wpggee4kgcIlWxu8KWK0UXid+KCznjy2Sjw/tpJd
 W6H39MRX+ZfWFyRKo3robihgcrS2PQbW0nNcNfyY032U9HVQUKLVB72QRlgXPeYUm8S+
 TMnpkdbsSI8UAiVmIs70f0m64UNLHRdl1PV+epmOgvaij0ZPnAri9JWr9tAA4FV9xVwB
 slHPG9mAqbpTKY7NjczAJ247PrDT/emiCLcjHKVecGC48NyVh+rRz+EEHCWw+G7BS4Vk
 QcfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=gyvXgqlyZpHUIm/h1OCk2xVbzq7vNfV05vzal9UiBPY=;
 b=oeflMp7IpkXWVAzbrghPtQmPjdX5In2UmJhy24/Nn5EO/W7S+oaJYGPbEqe7z8Z4ad
 zDpTwInb6WCUZXDLAHNKfS+0jRxVSU/FUstg0Z6FRj7dVHA6lTAxTRbvzcGCDcUDe4sW
 YJNkKVEbXdgAedcrKuW/Y8R6DfYFyBT2oR/kRegmevNqR0OK/3xqBEg55MHNAGMS2wNo
 nundncBwlm+j3YLqNpj2rNufjGrMk0FqFE830S/IpTlOpf+cBoqagc6tFcbYIMt1fqZu
 gFQX7Fiw16c7QYnxUbVGCV70Jl0pOI7SFFwaqhp6bxRydn9d+F5BATqi9+LBxbsdsYL5
 Yh5Q==
X-Gm-Message-State: AOAM532morZ2EmOTscmJJxw21oktEUKrGxDJLO/aDhqJcOiunNYXLgXC
 PwVJIuqvo0gxnVt85LPjNGPDZv5fIkU=
X-Google-Smtp-Source: ABdhPJys8/rVd6zRvrcgYSwRLng+aKkfxcMdZ7W4nXte1WF1rmjITTEwm59uzDSp2Pho0jwDOwX+2Q==
X-Received: by 2002:a05:6402:35d3:: with SMTP id
 z19mr9929786edc.143.1618580778984; 
 Fri, 16 Apr 2021 06:46:18 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:6a8a:26d6:7403:5ada?
 ([2a02:908:1252:fb60:6a8a:26d6:7403:5ada])
 by smtp.gmail.com with ESMTPSA id cy5sm5489794edb.46.2021.04.16.06.46.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Apr 2021 06:46:18 -0700 (PDT)
Subject: Re: [PATCH v3 5/7] drm/vmwgfx: Inline ttm_bo_mmap() into vmwgfx driver
To: Thomas Zimmermann <tzimmermann@suse.de>, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 bskeggs@redhat.com, ray.huang@amd.com, linux-graphics-maintainer@vmware.com,
 sroland@vmware.com, zackr@vmware.com, shashank.sharma@amd.com,
 sam@ravnborg.org, emil.velikov@collabora.com, Felix.Kuehling@amd.com,
 nirmoy.das@amd.com
References: <20210416133146.24825-1-tzimmermann@suse.de>
 <20210416133146.24825-6-tzimmermann@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <b7008944-fbe5-bd59-d2a9-ff62bea38237@gmail.com>
Date: Fri, 16 Apr 2021 15:46:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210416133146.24825-6-tzimmermann@suse.de>
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 16.04.21 um 15:31 schrieb Thomas Zimmermann:
> The vmwgfx driver is the only remaining user of ttm_bo_mmap(). Inline
> the code. The internal helper ttm_bo_vm_lookup() is now also part of
> vmwgfx as vmw_bo_vm_lookup().
>
> v2:
> 	* replace pr_err() with drm_err() (Zack)
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Zack Rusin <zackr@vmware.com>
> ---
>   drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c | 56 ++++++++++++++++++++++--
>   1 file changed, 53 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
> index cb9975889e2f..c8b6543b4e39 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
> @@ -27,6 +27,32 @@
>   
>   #include "vmwgfx_drv.h"
>   
> +static struct ttm_buffer_object *vmw_bo_vm_lookup(struct ttm_device *bdev,
> +						  unsigned long offset,
> +						  unsigned long pages)
> +{
> +	struct vmw_private *dev_priv = container_of(bdev, struct vmw_private, bdev);
> +	struct drm_device *drm = &dev_priv->drm;
> +	struct drm_vma_offset_node *node;
> +	struct ttm_buffer_object *bo = NULL;
> +
> +	drm_vma_offset_lock_lookup(bdev->vma_manager);
> +
> +	node = drm_vma_offset_lookup_locked(bdev->vma_manager, offset, pages);
> +	if (likely(node)) {
> +		bo = container_of(node, struct ttm_buffer_object,
> +				  base.vma_node);
> +		bo = ttm_bo_get_unless_zero(bo);
> +	}
> +
> +	drm_vma_offset_unlock_lookup(bdev->vma_manager);
> +
> +	if (!bo)
> +		drm_err(drm, "Could not find buffer object to map\n");
> +
> +	return bo;
> +}
> +
>   int vmw_mmap(struct file *filp, struct vm_area_struct *vma)
>   {
>   	static const struct vm_operations_struct vmw_vm_ops = {
> @@ -41,10 +67,28 @@ int vmw_mmap(struct file *filp, struct vm_area_struct *vma)
>   	};
>   	struct drm_file *file_priv = filp->private_data;
>   	struct vmw_private *dev_priv = vmw_priv(file_priv->minor->dev);
> -	int ret = ttm_bo_mmap(filp, vma, &dev_priv->bdev);
> +	struct ttm_device *bdev = &dev_priv->bdev;
> +	struct ttm_buffer_object *bo;
> +	int ret;
> +
> +	if (unlikely(vma->vm_pgoff < DRM_FILE_PAGE_OFFSET_START))
> +		return -EINVAL;
> +
> +	bo = vmw_bo_vm_lookup(bdev, vma->vm_pgoff, vma_pages(vma));
> +	if (unlikely(!bo))
> +		return -EINVAL;
>   
> -	if (ret)
> -		return ret;
> +	if (unlikely(!bo->bdev->funcs->verify_access)) {
> +		ret = -EPERM;
> +		goto out_unref;
> +	}
> +	ret = bo->bdev->funcs->verify_access(bo, filp);

Is there any reason we can't call vmw_verify_access() directly here?

Would allow us to completely nuke the verify_access callback as well as 
far as I can see.

Regards,
Christian.

> +	if (unlikely(ret != 0))
> +		goto out_unref;
> +
> +	ret = ttm_bo_mmap_obj(vma, bo);
> +	if (unlikely(ret != 0))
> +		goto out_unref;
>   
>   	vma->vm_ops = &vmw_vm_ops;
>   
> @@ -52,7 +96,13 @@ int vmw_mmap(struct file *filp, struct vm_area_struct *vma)
>   	if (!is_cow_mapping(vma->vm_flags))
>   		vma->vm_flags = (vma->vm_flags & ~VM_MIXEDMAP) | VM_PFNMAP;
>   
> +	ttm_bo_put(bo); /* release extra ref taken by ttm_bo_mmap_obj() */
> +
>   	return 0;
> +
> +out_unref:
> +	ttm_bo_put(bo);
> +	return ret;
>   }
>   
>   /* struct vmw_validation_mem callback */

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
