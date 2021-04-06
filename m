Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B01355659
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 16:18:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91D1689D63;
	Tue,  6 Apr 2021 14:18:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DBD089D63;
 Tue,  6 Apr 2021 14:18:48 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 g8-20020a9d6c480000b02901b65ca2432cso14778461otq.3; 
 Tue, 06 Apr 2021 07:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6L3nJ2nC2BXr4QBUd7AzoIzOpY4ksiNqnZtm8EiKXdQ=;
 b=e28WgelyLXQlunlIn1FBqgqaq0GfQBU/izQsvdEJpR7QNkk/6WZGN7gbZwiOfBAcaS
 HONccFEXE2TFolYblS1k0paf5KPLJ0rGW5Ga4QEK/5arsAYZ/AD+1JyYkjbCsjPMt4E3
 qcvfm7colPov4hgmS6C4DFz1fHnUq2evCC4sVA1IafSAQDRuk6Q8iyN5kKxSE5JNbKws
 4LVzW0C1NBJVzTi1iowjUusV3YAqO23CzaPwBLe/xiffevCY7a2ffCULAWTz4dlmFVP5
 KLNBjaSlhV17zaS1oDhEuuznlBsjA3mqq1JevNMGDdI/BN4jScgi1TdYZBOaHunX8xbW
 JIGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6L3nJ2nC2BXr4QBUd7AzoIzOpY4ksiNqnZtm8EiKXdQ=;
 b=Z8d7+oKBwBOJyHFVi7iQulL794cehILFTzQS1ACi/QT2q+W6GoDwHqUu/8JNXN+aLm
 P3QdGvYjr8E6WEjExDt0mhYDj/lYlT5+gkEBUB5aoDIEaBazjQVZWe/0F5cZtZVu6qTM
 eFpoffiKehfRQE6mF4/IC5ak56NUtvlc4LT1Re+q+HHy/lrltq3vjoo0NyAHat/GLbk1
 MzT/AQshyDXQPeZ3LDxw8Ok8+cOthXo3phw0PDEj43kcdoRgd9Law9O0edny2iodjExC
 V4h4UB4qDwiP9Q3OdxIoO7sEr4dlANPH7Xpug8bJbVn08f7amPP1qx/A7lKxCZRT/hAT
 XdiA==
X-Gm-Message-State: AOAM530HsBBMjXh3Ft3iQN4Vsl1D3fPIy1qo+FJCBeXbrrM8+JUl435O
 Vaj7SzNkbaAkNxq3FrXebfYBhAkIPMQs1bDKMko=
X-Google-Smtp-Source: ABdhPJy3R3ef6LQpMZAFKb648tqMSYhCmFge0cFGQ63HfV0XaIVZvnAA6edb9Mrk0b0srOfyIzdY649+9zb2kKQl7oU=
X-Received: by 2002:a9d:d89:: with SMTP id 9mr26864758ots.23.1617718727289;
 Tue, 06 Apr 2021 07:18:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210406090903.7019-1-tzimmermann@suse.de>
 <20210406090903.7019-5-tzimmermann@suse.de>
In-Reply-To: <20210406090903.7019-5-tzimmermann@suse.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 6 Apr 2021 10:18:36 -0400
Message-ID: <CADnq5_PbJ_LfqfkL6iQDd+2RAoqt1jcbYyau3C6wCK3=oDRn2A@mail.gmail.com>
Subject: Re: [PATCH 4/8] drm/radeon: Implement mmap as GEM object function
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Shashank Sharma <shashank.sharma@amd.com>, Dave Airlie <airlied@linux.ie>,
 nouveau <nouveau@lists.freedesktop.org>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>, Roland Scheidegger <sroland@vmware.com>,
 Nirmoy Das <nirmoy.das@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Huang Rui <ray.huang@amd.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Ben Skeggs <bskeggs@redhat.com>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 Christian Koenig <christian.koenig@amd.com>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 6, 2021 at 5:09 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
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

s/amdgpu/radeon/

Alex

>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/radeon/radeon_drv.c |  3 +-
>  drivers/gpu/drm/radeon/radeon_gem.c | 52 +++++++++++++++++++++++
>  drivers/gpu/drm/radeon/radeon_ttm.c | 65 -----------------------------
>  drivers/gpu/drm/radeon/radeon_ttm.h |  1 -
>  4 files changed, 54 insertions(+), 67 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
> index efeb115ae70e..4039b6d71aa2 100644
> --- a/drivers/gpu/drm/radeon/radeon_drv.c
> +++ b/drivers/gpu/drm/radeon/radeon_drv.c
> @@ -557,7 +557,7 @@ static const struct file_operations radeon_driver_kms_fops = {
>         .open = drm_open,
>         .release = drm_release,
>         .unlocked_ioctl = radeon_drm_ioctl,
> -       .mmap = radeon_mmap,
> +       .mmap = drm_gem_mmap,
>         .poll = drm_poll,
>         .read = drm_read,
>  #ifdef CONFIG_COMPAT
> @@ -632,6 +632,7 @@ static const struct drm_driver kms_driver = {
>         .prime_handle_to_fd = drm_gem_prime_handle_to_fd,
>         .prime_fd_to_handle = drm_gem_prime_fd_to_handle,
>         .gem_prime_import_sg_table = radeon_gem_prime_import_sg_table,
> +       .gem_prime_mmap = drm_gem_prime_mmap,
>
>         .name = DRIVER_NAME,
>         .desc = DRIVER_DESC,
> diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
> index 05ea2f39f626..71e8737bce01 100644
> --- a/drivers/gpu/drm/radeon/radeon_gem.c
> +++ b/drivers/gpu/drm/radeon/radeon_gem.c
> @@ -44,6 +44,42 @@ void radeon_gem_prime_unpin(struct drm_gem_object *obj);
>
>  const struct drm_gem_object_funcs radeon_gem_object_funcs;
>
> +static vm_fault_t radeon_ttm_fault(struct vm_fault *vmf)
> +{
> +       struct ttm_buffer_object *bo = vmf->vma->vm_private_data;
> +       struct radeon_device *rdev = radeon_get_rdev(bo->bdev);
> +       vm_fault_t ret;
> +
> +       down_read(&rdev->pm.mclk_lock);
> +
> +       ret = ttm_bo_vm_reserve(bo, vmf);
> +       if (ret)
> +               goto unlock_mclk;
> +
> +       ret = radeon_bo_fault_reserve_notify(bo);
> +       if (ret)
> +               goto unlock_resv;
> +
> +       ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
> +                                      TTM_BO_VM_NUM_PREFAULT, 1);
> +       if (ret == VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
> +               goto unlock_mclk;
> +
> +unlock_resv:
> +       dma_resv_unlock(bo->base.resv);
> +
> +unlock_mclk:
> +       up_read(&rdev->pm.mclk_lock);
> +       return ret;
> +}
> +
> +static const struct vm_operations_struct radeon_ttm_vm_ops = {
> +       .fault = radeon_ttm_fault,
> +       .open = ttm_bo_vm_open,
> +       .close = ttm_bo_vm_close,
> +       .access = ttm_bo_vm_access
> +};
> +
>  static void radeon_gem_object_free(struct drm_gem_object *gobj)
>  {
>         struct radeon_bo *robj = gem_to_radeon_bo(gobj);
> @@ -226,6 +262,20 @@ static int radeon_gem_handle_lockup(struct radeon_device *rdev, int r)
>         return r;
>  }
>
> +static int radeon_gem_object_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
> +{
> +       struct radeon_bo *bo = gem_to_radeon_bo(obj);
> +       struct radeon_device *rdev = radeon_get_rdev(bo->tbo.bdev);
> +
> +       if (!rdev)
> +               return -EINVAL;
> +
> +       if (radeon_ttm_tt_has_userptr(rdev, bo->tbo.ttm))
> +               return -EPERM;
> +
> +       return drm_gem_ttm_mmap(obj, vma);
> +}
> +
>  const struct drm_gem_object_funcs radeon_gem_object_funcs = {
>         .free = radeon_gem_object_free,
>         .open = radeon_gem_object_open,
> @@ -236,6 +286,8 @@ const struct drm_gem_object_funcs radeon_gem_object_funcs = {
>         .get_sg_table = radeon_gem_prime_get_sg_table,
>         .vmap = drm_gem_ttm_vmap,
>         .vunmap = drm_gem_ttm_vunmap,
> +       .mmap = radeon_gem_object_mmap,
> +       .vm_ops = &radeon_ttm_vm_ops,
>  };
>
>  /*
> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
> index 476ce9c24b9f..a5ce43a909a2 100644
> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> @@ -136,17 +136,6 @@ static void radeon_evict_flags(struct ttm_buffer_object *bo,
>         *placement = rbo->placement;
>  }
>
> -static int radeon_verify_access(struct ttm_buffer_object *bo, struct file *filp)
> -{
> -       struct radeon_bo *rbo = container_of(bo, struct radeon_bo, tbo);
> -       struct radeon_device *rdev = radeon_get_rdev(bo->bdev);
> -
> -       if (radeon_ttm_tt_has_userptr(rdev, bo->ttm))
> -               return -EPERM;
> -       return drm_vma_node_verify_access(&rbo->tbo.base.vma_node,
> -                                         filp->private_data);
> -}
> -
>  static int radeon_move_blit(struct ttm_buffer_object *bo,
>                         bool evict,
>                         struct ttm_resource *new_mem,
> @@ -704,7 +693,6 @@ static struct ttm_device_funcs radeon_bo_driver = {
>         .eviction_valuable = ttm_bo_eviction_valuable,
>         .evict_flags = &radeon_evict_flags,
>         .move = &radeon_bo_move,
> -       .verify_access = &radeon_verify_access,
>         .delete_mem_notify = &radeon_bo_delete_mem_notify,
>         .io_mem_reserve = &radeon_ttm_io_mem_reserve,
>  };
> @@ -801,59 +789,6 @@ void radeon_ttm_set_active_vram_size(struct radeon_device *rdev, u64 size)
>         man->size = size >> PAGE_SHIFT;
>  }
>
> -static vm_fault_t radeon_ttm_fault(struct vm_fault *vmf)
> -{
> -       struct ttm_buffer_object *bo = vmf->vma->vm_private_data;
> -       struct radeon_device *rdev = radeon_get_rdev(bo->bdev);
> -       vm_fault_t ret;
> -
> -       down_read(&rdev->pm.mclk_lock);
> -
> -       ret = ttm_bo_vm_reserve(bo, vmf);
> -       if (ret)
> -               goto unlock_mclk;
> -
> -       ret = radeon_bo_fault_reserve_notify(bo);
> -       if (ret)
> -               goto unlock_resv;
> -
> -       ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
> -                                      TTM_BO_VM_NUM_PREFAULT, 1);
> -       if (ret == VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
> -               goto unlock_mclk;
> -
> -unlock_resv:
> -       dma_resv_unlock(bo->base.resv);
> -
> -unlock_mclk:
> -       up_read(&rdev->pm.mclk_lock);
> -       return ret;
> -}
> -
> -static const struct vm_operations_struct radeon_ttm_vm_ops = {
> -       .fault = radeon_ttm_fault,
> -       .open = ttm_bo_vm_open,
> -       .close = ttm_bo_vm_close,
> -       .access = ttm_bo_vm_access
> -};
> -
> -int radeon_mmap(struct file *filp, struct vm_area_struct *vma)
> -{
> -       int r;
> -       struct drm_file *file_priv = filp->private_data;
> -       struct radeon_device *rdev = file_priv->minor->dev->dev_private;
> -
> -       if (rdev == NULL)
> -               return -EINVAL;
> -
> -       r = ttm_bo_mmap(filp, vma, &rdev->mman.bdev);
> -       if (unlikely(r != 0))
> -               return r;
> -
> -       vma->vm_ops = &radeon_ttm_vm_ops;
> -       return 0;
> -}
> -
>  #if defined(CONFIG_DEBUG_FS)
>
>  static int radeon_mm_vram_dump_table_show(struct seq_file *m, void *unused)
> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.h b/drivers/gpu/drm/radeon/radeon_ttm.h
> index 4d7b90ee2774..91ea7141bc81 100644
> --- a/drivers/gpu/drm/radeon/radeon_ttm.h
> +++ b/drivers/gpu/drm/radeon/radeon_ttm.h
> @@ -32,6 +32,5 @@ struct radeon_device;
>
>  int radeon_ttm_init(struct radeon_device *rdev);
>  void radeon_ttm_fini(struct radeon_device *rdev);
> -int radeon_mmap(struct file *filp, struct vm_area_struct *vma);
>
>  #endif                         /* __RADEON_TTM_H__ */
> --
> 2.30.2
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
