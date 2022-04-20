Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD994508FAA
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 20:46:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD77110E26F;
	Wed, 20 Apr 2022 18:46:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62C2710E26B
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 18:46:07 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id 21so3510958edv.1
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 11:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:cc:from:in-reply-to:content-transfer-encoding;
 bh=zrjTuQhPDt/5AHYi20cviIhPwQ5+hjYQ4/EzVMOENMA=;
 b=d5OdIGem0BI3DuQHF9Nsnp0vPWV3fgzLrlDKv7cHgkYQRmPYyUnP5EcjVBM0Axr/Xp
 5GvIz64hIqrV/zJhx08jtHAYRLgGpgvFf1SB8AhrTRZbq1m5x+A+8smVpQ994DxvFCzw
 x1nmzMJu9k7XC9uuepMbIObqA7VfU0baT0F8ImXuIjlj5RWXvZFulgcxL0kBJgR95tpo
 rwL5fFRyOyMtRwK7f58oKlgmozKHmM65AHRFy1tsjXQUgRl6qENXqI00E0sfrjtC/Ols
 YKJVDohaQ8pgiltSTa2NDq+/gG31h/14ExyTBmI3MujUq8QpucssOv0Cu7VaLn453MYI
 AcWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:cc:from:in-reply-to
 :content-transfer-encoding;
 bh=zrjTuQhPDt/5AHYi20cviIhPwQ5+hjYQ4/EzVMOENMA=;
 b=0ccDin7LYMfu4hKMphC8vbhFGRE7ol034rMS6TDu6ogF3/0yxDS3//ssG9w43+kB8U
 G+Dn5e5zq9zNyOSZSHfrD/GZr39beHCYrfkikxeY7omdBKC0Xk0PH/D+ETyIi+lDl2h2
 1nqdEHPGBpaN4Y3RpY+3/15yeOO3ECFNzOQ8b4j96R93KarXWjAjWqJ7VYL/dRIvSSFi
 hhvJ1H0y48NOet3Nk0PJB7jLNFuVqJbhuE9GIO0ufunFmqOQITwKL9YAWYp8rAEw9aPF
 qqaLbfvlQMBpqGHQz3izm5oE9WcIO5OEjJ7kALA6KLnCOgPYyBx4v9Vfv8vu4NAanHDS
 15Qw==
X-Gm-Message-State: AOAM532A322TLJwemOfPJvm6itfo9Vg3mSH6mvV3Ygw5PN1ymVqsHgqF
 GIip2YMf+pRNVSItKZU2nVxrRWP1lQc=
X-Google-Smtp-Source: ABdhPJxcp4mINvNuOcaVdi4SMUYfUdIlGxf9+gjr5tktvUXhavPML7sudML12Sh9erR1I4Tpr5XbRg==
X-Received: by 2002:a05:6402:c84:b0:41d:72b5:fb05 with SMTP id
 cm4-20020a0564020c8400b0041d72b5fb05mr24262221edb.361.1650480365834; 
 Wed, 20 Apr 2022 11:46:05 -0700 (PDT)
Received: from [192.168.2.181] (46-10-149-62.ip.btc-net.bg. [46.10.149.62])
 by smtp.gmail.com with ESMTPSA id
 k26-20020a056402049a00b004197b0867e0sm10334106edv.42.2022.04.20.11.46.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 11:46:05 -0700 (PDT)
Message-ID: <afc8d97e-06a2-4a95-b7ec-655073d8d15a@gmail.com>
Date: Wed, 20 Apr 2022 21:46:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] drm/vmwgfx: Fix gem refcounting and memory evictions
Content-Language: en-US
To: dri-devel@lists.freedesktop.org
References: <20220420040328.1007409-1-zack@kde.org>
 <CAKPuMhMdrDK7K6c3C_8CaOB++uQJun_RiHuSHtRYa8eJNPJLUg@mail.gmail.com>
From: "Martin Krastev (VMware)" <martinkrastev768@gmail.com>
In-Reply-To: <CAKPuMhMdrDK7K6c3C_8CaOB++uQJun_RiHuSHtRYa8eJNPJLUg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Martin Krastev <krastevm@vmware.com>


> From: Zack Rusin <zack@kde.org>
> Date: Wed, 20 Apr 2022 at 07:03
> Subject: [PATCH v2] drm/vmwgfx: Fix gem refcounting and memory evictions
> To: <dri-devel@lists.freedesktop.org>
> Cc: <krastevm@vmware.com>, <mombasawalam@vmware.com>
>
>
> From: Zack Rusin <zackr@vmware.com>
>
> v2: Add the last part of the ref count fix which was spotted by
> Philipp Sieweck where the ref count of cpu writers is off due to
> ERESTARTSYS or EBUSY during bo waits.
>
> The initial GEM port broke refcounting on shareable (prime) surfaces and
> memory evictions. The prime surfaces broke because the parent surfaces
> weren't increasing the ref count on GEM surfaces, which meant that
> the memory backing textures could have been deleted while the texture
> was still accessible. The evictions broke due to a typo, the code was
> supposed to exit if the passed buffers were not vmw_buffer_object
> not if they were. They're tied because the evictions depend on having
> memory to actually evict.
>
> This fixes crashes with XA state tracker which is used for xrender
> acceleration on xf86-video-vmware, apps/tests which use a lot of
> memory (a good test being the piglit's streaming-texture-leak) and
> desktops.
>
> Signed-off-by: Zack Rusin <zackr@vmware.com>
> Fixes: 8afa13a0583f ("drm/vmwgfx: Implement DRIVER_GEM")
> Reported-by: Philipp Sieweck <psi@informatik.uni-kiel.de>
> Cc: <stable@vger.kernel.org> # v5.17+
> Reviewed-by: Maaz Mombasawala <mombasawalam@vmware.com>
> ---
>   drivers/gpu/drm/vmwgfx/vmwgfx_bo.c      | 43 ++++++++++++-------------
>   drivers/gpu/drm/vmwgfx/vmwgfx_drv.c     |  8 ++---
>   drivers/gpu/drm/vmwgfx/vmwgfx_surface.c |  7 +++-
>   3 files changed, 28 insertions(+), 30 deletions(-)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> index 31aecc46624b..04c8a378aeed 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> @@ -46,6 +46,21 @@ vmw_buffer_object(struct ttm_buffer_object *bo)
>          return container_of(bo, struct vmw_buffer_object, base);
>   }
>
> +/**
> + * bo_is_vmw - check if the buffer object is a &vmw_buffer_object
> + * @bo: ttm buffer object to be checked
> + *
> + * Uses destroy function associated with the object to determine if this is
> + * a &vmw_buffer_object.
> + *
> + * Returns:
> + * true if the object is of &vmw_buffer_object type, false if not.
> + */
> +static bool bo_is_vmw(struct ttm_buffer_object *bo)
> +{
> +       return bo->destroy == &vmw_bo_bo_free ||
> +              bo->destroy == &vmw_gem_destroy;
> +}
>
>   /**
>    * vmw_bo_pin_in_placement - Validate a buffer to placement.
> @@ -615,8 +630,9 @@ int vmw_user_bo_synccpu_ioctl(struct drm_device
> *dev, void *data,
>
>                  ret = vmw_user_bo_synccpu_grab(vbo, arg->flags);
>                  vmw_bo_unreference(&vbo);
> -               if (unlikely(ret != 0 && ret != -ERESTARTSYS &&
> -                            ret != -EBUSY)) {
> +               if (unlikely(ret != 0)) {
> +                       if (ret == -ERESTARTSYS || ret == -EBUSY)
> +                               return -EBUSY;
>                          DRM_ERROR("Failed synccpu grab on handle 0x%08x.\n",
>                                    (unsigned int) arg->handle);
>                          return ret;
> @@ -798,7 +814,7 @@ int vmw_dumb_create(struct drm_file *file_priv,
>   void vmw_bo_swap_notify(struct ttm_buffer_object *bo)
>   {
>          /* Is @bo embedded in a struct vmw_buffer_object? */
> -       if (vmw_bo_is_vmw_bo(bo))
> +       if (!bo_is_vmw(bo))
>                  return;
>
>          /* Kill any cached kernel maps before swapout */
> @@ -822,7 +838,7 @@ void vmw_bo_move_notify(struct ttm_buffer_object *bo,
>          struct vmw_buffer_object *vbo;
>
>          /* Make sure @bo is embedded in a struct vmw_buffer_object? */
> -       if (vmw_bo_is_vmw_bo(bo))
> +       if (!bo_is_vmw(bo))
>                  return;
>
>          vbo = container_of(bo, struct vmw_buffer_object, base);
> @@ -843,22 +859,3 @@ void vmw_bo_move_notify(struct ttm_buffer_object *bo,
>          if (mem->mem_type != VMW_PL_MOB && bo->resource->mem_type == VMW_PL_MOB)
>                  vmw_resource_unbind_list(vbo);
>   }
> -
> -/**
> - * vmw_bo_is_vmw_bo - check if the buffer object is a &vmw_buffer_object
> - * @bo: buffer object to be checked
> - *
> - * Uses destroy function associated with the object to determine if this is
> - * a &vmw_buffer_object.
> - *
> - * Returns:
> - * true if the object is of &vmw_buffer_object type, false if not.
> - */
> -bool vmw_bo_is_vmw_bo(struct ttm_buffer_object *bo)
> -{
> -       if (bo->destroy == &vmw_bo_bo_free ||
> -           bo->destroy == &vmw_gem_destroy)
> -               return true;
> -
> -       return false;
> -}
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> index 72a17618ba0a..0c12faa4e533 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> @@ -1018,13 +1018,10 @@ static int vmw_driver_load(struct vmw_private
> *dev_priv, u32 pci_id)
>                  goto out_no_fman;
>          }
>
> -       drm_vma_offset_manager_init(&dev_priv->vma_manager,
> -                                   DRM_FILE_PAGE_OFFSET_START,
> -                                   DRM_FILE_PAGE_OFFSET_SIZE);
>          ret = ttm_device_init(&dev_priv->bdev, &vmw_bo_driver,
>                                dev_priv->drm.dev,
>                                dev_priv->drm.anon_inode->i_mapping,
> -                             &dev_priv->vma_manager,
> +                             dev_priv->drm.vma_offset_manager,
>                                dev_priv->map_mode == vmw_dma_alloc_coherent,
>                                false);
>          if (unlikely(ret != 0)) {
> @@ -1195,7 +1192,6 @@ static void vmw_driver_unload(struct drm_device *dev)
>          vmw_devcaps_destroy(dev_priv);
>          vmw_vram_manager_fini(dev_priv);
>          ttm_device_fini(&dev_priv->bdev);
> -       drm_vma_offset_manager_destroy(&dev_priv->vma_manager);
>          vmw_release_device_late(dev_priv);
>          vmw_fence_manager_takedown(dev_priv->fman);
>          if (dev_priv->capabilities & SVGA_CAP_IRQMASK)
> @@ -1419,7 +1415,7 @@ vmw_get_unmapped_area(struct file *file,
> unsigned long uaddr,
>          struct vmw_private *dev_priv = vmw_priv(file_priv->minor->dev);
>
>          return drm_get_unmapped_area(file, uaddr, len, pgoff, flags,
> -                                    &dev_priv->vma_manager);
> +                                    dev_priv->drm.vma_offset_manager);
>   }
>
>   static int vmwgfx_pm_notifier(struct notifier_block *nb, unsigned long val,
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
> b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
> index 00e8e27e4884..ace7ca150b03 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
> @@ -683,6 +683,9 @@ static void vmw_user_surface_base_release(struct
> ttm_base_object **p_base)
>              container_of(base, struct vmw_user_surface, prime.base);
>          struct vmw_resource *res = &user_srf->srf.res;
>
> +       if (base->shareable && res && res->backup)
> +               drm_gem_object_put(&res->backup->base.base);
> +
>          *p_base = NULL;
>          vmw_resource_unreference(&res);
>   }
> @@ -857,6 +860,7 @@ int vmw_surface_define_ioctl(struct drm_device
> *dev, void *data,
>                          goto out_unlock;
>                  }
>                  vmw_bo_reference(res->backup);
> +               drm_gem_object_get(&res->backup->base.base);
>          }
>
>          tmp = vmw_resource_reference(&srf->res);
> @@ -1513,7 +1517,6 @@ vmw_gb_surface_define_internal(struct drm_device *dev,
>                                                          &res->backup);
>                  if (ret == 0)
>                          vmw_bo_reference(res->backup);
> -
>          }
>
>          if (unlikely(ret != 0)) {
> @@ -1561,6 +1564,8 @@ vmw_gb_surface_define_internal(struct drm_device *dev,
>
> drm_vma_node_offset_addr(&res->backup->base.base.vma_node);
>                  rep->buffer_size = res->backup->base.base.size;
>                  rep->buffer_handle = backup_handle;
> +               if (user_srf->prime.base.shareable)
> +                       drm_gem_object_get(&res->backup->base.base);
>          } else {
>                  rep->buffer_map_handle = 0;
>                  rep->buffer_size = 0;
> --
> 2.32.0


LGTM!


Reviewed-by: Martin Krastev <krastevm@vmware.com>


Regards,

Martin

