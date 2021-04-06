Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 964F1355038
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 11:39:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2010789D89;
	Tue,  6 Apr 2021 09:38:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC4DE89C86;
 Tue,  6 Apr 2021 09:38:56 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id p4so5466869edr.2;
 Tue, 06 Apr 2021 02:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=hP5/K4t58eWlJt8iuevjnlK+siZ6xV6KElv5odqgEXY=;
 b=TBWgEU+yETPxOKPyhaziABO7+vb32Rv9BZj44eAQyayK2pfoUdlZhxm1JeO7eBZ55N
 nkF4iGrMQwXFqDrSE85EQMp87S89UN+TbfTj2x6W1gljAxScdcn0PvTFZD4L/KJgnJwk
 02ta9uZCJaU3+QzMWCimnBemk37wc3G+qFTuaCuv5hM4uxkgYcsmr7G8FwgfWXMavpfj
 ZymtEpBhJ8mArhu7DsMh9ZECkcNUzDYLwHx0JVnG0fhqvpcLhCeNDnTeuJXaeiQXXmdd
 g9xjGHjMwkroTPYtH8W7khd6a4qQiA+9l+J1d2VaGJoqQgg8DsFRj1LB+dFFc0N229qk
 GzEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=hP5/K4t58eWlJt8iuevjnlK+siZ6xV6KElv5odqgEXY=;
 b=jlszdvmYRbdW3ESc0KStqTXDOvtShPuXF5Bmo5PrsfL6h807zdFDsp2roK4PvuO4iG
 0del5ZFJ3hAG6nhEEkpcSLQN/tkXZAk6zH7JVga0o21i24GEfnI918Dt5qqjG2xJdt1n
 Ey6zl8pEH8SkevoC3bXBx773/YZovl76vPfEo6fMEDsumq8FNq3CtIdmJOeMks+phurp
 MXvyWh2LpEEa9Xc18Ugo024z+Il/Bqa8r+LFaUItnq+OU7lR7KHp/w/j/OpyLT+SZoMR
 Pya1jCE5MtsXWlh17fAHBpQb3FIaCpb77errviBape62rY3C96QzQJ37HhrHdKFITnMT
 mp5A==
X-Gm-Message-State: AOAM533p9XJ68bChSyDEpusO1FTAfzeYLOTSeIfmzH4KwqmWC01jQYZ4
 X1gRBdgwf2dEBitqAkKZo77jg9vBOEI=
X-Google-Smtp-Source: ABdhPJxq13EnNVT0KcClGYM8+3Zv1Qt8+XiMrTPmYiZyR3vabeRfcFHF4sjMCLSqdfHAdjwdPeraAw==
X-Received: by 2002:aa7:c342:: with SMTP id j2mr37571314edr.8.1617701935487;
 Tue, 06 Apr 2021 02:38:55 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:8475:9991:cfb3:4162?
 ([2a02:908:1252:fb60:8475:9991:cfb3:4162])
 by smtp.gmail.com with ESMTPSA id t12sm5459893ejb.76.2021.04.06.02.38.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Apr 2021 02:38:55 -0700 (PDT)
Subject: Re: [PATCH 4/8] drm/radeon: Implement mmap as GEM object function
To: Thomas Zimmermann <tzimmermann@suse.de>, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 bskeggs@redhat.com, ray.huang@amd.com, linux-graphics-maintainer@vmware.com,
 sroland@vmware.com, zackr@vmware.com, shashank.sharma@amd.com,
 sam@ravnborg.org, emil.velikov@collabora.com, Felix.Kuehling@amd.com,
 nirmoy.das@amd.com
References: <20210406090903.7019-1-tzimmermann@suse.de>
 <20210406090903.7019-5-tzimmermann@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <40a9f066-d486-0d31-6226-98b3470838e6@gmail.com>
Date: Tue, 6 Apr 2021 11:38:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210406090903.7019-5-tzimmermann@suse.de>
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
Cc: nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 06.04.21 um 11:08 schrieb Thomas Zimmermann:
> Moving the driver-specific mmap code into a GEM object function allows
> for using DRM helpers for various mmap callbacks.
>
> This change also allows to support prime-based mmap via DRM's helper
> drm_gem_prime_mmap().
>
> Permission checks are implemented by drm_gem_mmap(), with an additional
> check for radeon_ttm_tt_has_userptr() in the GEM object function. The
> function radeon_verify_access() is now unused and has thus been removed.
>
> As a side effect, amdgpu_ttm_vm_ops and amdgpu_ttm_fault() are now
> implemented in amdgpu's GEM code.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/radeon/radeon_drv.c |  3 +-
>   drivers/gpu/drm/radeon/radeon_gem.c | 52 +++++++++++++++++++++++
>   drivers/gpu/drm/radeon/radeon_ttm.c | 65 -----------------------------
>   drivers/gpu/drm/radeon/radeon_ttm.h |  1 -
>   4 files changed, 54 insertions(+), 67 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
> index efeb115ae70e..4039b6d71aa2 100644
> --- a/drivers/gpu/drm/radeon/radeon_drv.c
> +++ b/drivers/gpu/drm/radeon/radeon_drv.c
> @@ -557,7 +557,7 @@ static const struct file_operations radeon_driver_kms_fops = {
>   	.open = drm_open,
>   	.release = drm_release,
>   	.unlocked_ioctl = radeon_drm_ioctl,
> -	.mmap = radeon_mmap,
> +	.mmap = drm_gem_mmap,
>   	.poll = drm_poll,
>   	.read = drm_read,
>   #ifdef CONFIG_COMPAT
> @@ -632,6 +632,7 @@ static const struct drm_driver kms_driver = {
>   	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
>   	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
>   	.gem_prime_import_sg_table = radeon_gem_prime_import_sg_table,
> +	.gem_prime_mmap = drm_gem_prime_mmap,
>   
>   	.name = DRIVER_NAME,
>   	.desc = DRIVER_DESC,
> diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
> index 05ea2f39f626..71e8737bce01 100644
> --- a/drivers/gpu/drm/radeon/radeon_gem.c
> +++ b/drivers/gpu/drm/radeon/radeon_gem.c
> @@ -44,6 +44,42 @@ void radeon_gem_prime_unpin(struct drm_gem_object *obj);
>   
>   const struct drm_gem_object_funcs radeon_gem_object_funcs;
>   
> +static vm_fault_t radeon_ttm_fault(struct vm_fault *vmf)

Please name this radeon_gem_fault or radeon_gem_object_fault.

Apart from that looks good to me.

Christian.

> +{
> +	struct ttm_buffer_object *bo = vmf->vma->vm_private_data;
> +	struct radeon_device *rdev = radeon_get_rdev(bo->bdev);
> +	vm_fault_t ret;
> +
> +	down_read(&rdev->pm.mclk_lock);
> +
> +	ret = ttm_bo_vm_reserve(bo, vmf);
> +	if (ret)
> +		goto unlock_mclk;
> +
> +	ret = radeon_bo_fault_reserve_notify(bo);
> +	if (ret)
> +		goto unlock_resv;
> +
> +	ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
> +				       TTM_BO_VM_NUM_PREFAULT, 1);
> +	if (ret == VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
> +		goto unlock_mclk;
> +
> +unlock_resv:
> +	dma_resv_unlock(bo->base.resv);
> +
> +unlock_mclk:
> +	up_read(&rdev->pm.mclk_lock);
> +	return ret;
> +}
> +
> +static const struct vm_operations_struct radeon_ttm_vm_ops = {
> +	.fault = radeon_ttm_fault,
> +	.open = ttm_bo_vm_open,
> +	.close = ttm_bo_vm_close,
> +	.access = ttm_bo_vm_access
> +};
> +
>   static void radeon_gem_object_free(struct drm_gem_object *gobj)
>   {
>   	struct radeon_bo *robj = gem_to_radeon_bo(gobj);
> @@ -226,6 +262,20 @@ static int radeon_gem_handle_lockup(struct radeon_device *rdev, int r)
>   	return r;
>   }
>   
> +static int radeon_gem_object_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
> +{
> +	struct radeon_bo *bo = gem_to_radeon_bo(obj);
> +	struct radeon_device *rdev = radeon_get_rdev(bo->tbo.bdev);
> +
> +	if (!rdev)
> +		return -EINVAL;
> +
> +	if (radeon_ttm_tt_has_userptr(rdev, bo->tbo.ttm))
> +		return -EPERM;
> +
> +	return drm_gem_ttm_mmap(obj, vma);
> +}
> +
>   const struct drm_gem_object_funcs radeon_gem_object_funcs = {
>   	.free = radeon_gem_object_free,
>   	.open = radeon_gem_object_open,
> @@ -236,6 +286,8 @@ const struct drm_gem_object_funcs radeon_gem_object_funcs = {
>   	.get_sg_table = radeon_gem_prime_get_sg_table,
>   	.vmap = drm_gem_ttm_vmap,
>   	.vunmap = drm_gem_ttm_vunmap,
> +	.mmap = radeon_gem_object_mmap,
> +	.vm_ops = &radeon_ttm_vm_ops,
>   };
>   
>   /*
> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
> index 476ce9c24b9f..a5ce43a909a2 100644
> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> @@ -136,17 +136,6 @@ static void radeon_evict_flags(struct ttm_buffer_object *bo,
>   	*placement = rbo->placement;
>   }
>   
> -static int radeon_verify_access(struct ttm_buffer_object *bo, struct file *filp)
> -{
> -	struct radeon_bo *rbo = container_of(bo, struct radeon_bo, tbo);
> -	struct radeon_device *rdev = radeon_get_rdev(bo->bdev);
> -
> -	if (radeon_ttm_tt_has_userptr(rdev, bo->ttm))
> -		return -EPERM;
> -	return drm_vma_node_verify_access(&rbo->tbo.base.vma_node,
> -					  filp->private_data);
> -}
> -
>   static int radeon_move_blit(struct ttm_buffer_object *bo,
>   			bool evict,
>   			struct ttm_resource *new_mem,
> @@ -704,7 +693,6 @@ static struct ttm_device_funcs radeon_bo_driver = {
>   	.eviction_valuable = ttm_bo_eviction_valuable,
>   	.evict_flags = &radeon_evict_flags,
>   	.move = &radeon_bo_move,
> -	.verify_access = &radeon_verify_access,
>   	.delete_mem_notify = &radeon_bo_delete_mem_notify,
>   	.io_mem_reserve = &radeon_ttm_io_mem_reserve,
>   };
> @@ -801,59 +789,6 @@ void radeon_ttm_set_active_vram_size(struct radeon_device *rdev, u64 size)
>   	man->size = size >> PAGE_SHIFT;
>   }
>   
> -static vm_fault_t radeon_ttm_fault(struct vm_fault *vmf)
> -{
> -	struct ttm_buffer_object *bo = vmf->vma->vm_private_data;
> -	struct radeon_device *rdev = radeon_get_rdev(bo->bdev);
> -	vm_fault_t ret;
> -
> -	down_read(&rdev->pm.mclk_lock);
> -
> -	ret = ttm_bo_vm_reserve(bo, vmf);
> -	if (ret)
> -		goto unlock_mclk;
> -
> -	ret = radeon_bo_fault_reserve_notify(bo);
> -	if (ret)
> -		goto unlock_resv;
> -
> -	ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
> -				       TTM_BO_VM_NUM_PREFAULT, 1);
> -	if (ret == VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
> -		goto unlock_mclk;
> -
> -unlock_resv:
> -	dma_resv_unlock(bo->base.resv);
> -
> -unlock_mclk:
> -	up_read(&rdev->pm.mclk_lock);
> -	return ret;
> -}
> -
> -static const struct vm_operations_struct radeon_ttm_vm_ops = {
> -	.fault = radeon_ttm_fault,
> -	.open = ttm_bo_vm_open,
> -	.close = ttm_bo_vm_close,
> -	.access = ttm_bo_vm_access
> -};
> -
> -int radeon_mmap(struct file *filp, struct vm_area_struct *vma)
> -{
> -	int r;
> -	struct drm_file *file_priv = filp->private_data;
> -	struct radeon_device *rdev = file_priv->minor->dev->dev_private;
> -
> -	if (rdev == NULL)
> -		return -EINVAL;
> -
> -	r = ttm_bo_mmap(filp, vma, &rdev->mman.bdev);
> -	if (unlikely(r != 0))
> -		return r;
> -
> -	vma->vm_ops = &radeon_ttm_vm_ops;
> -	return 0;
> -}
> -
>   #if defined(CONFIG_DEBUG_FS)
>   
>   static int radeon_mm_vram_dump_table_show(struct seq_file *m, void *unused)
> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.h b/drivers/gpu/drm/radeon/radeon_ttm.h
> index 4d7b90ee2774..91ea7141bc81 100644
> --- a/drivers/gpu/drm/radeon/radeon_ttm.h
> +++ b/drivers/gpu/drm/radeon/radeon_ttm.h
> @@ -32,6 +32,5 @@ struct radeon_device;
>   
>   int radeon_ttm_init(struct radeon_device *rdev);
>   void radeon_ttm_fini(struct radeon_device *rdev);
> -int radeon_mmap(struct file *filp, struct vm_area_struct *vma);
>   
>   #endif				/* __RADEON_TTM_H__ */

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
