Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A793E3677
	for <lists+dri-devel@lfdr.de>; Sat,  7 Aug 2021 19:18:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CBFB89CD7;
	Sat,  7 Aug 2021 17:18:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDAE889CD4;
 Sat,  7 Aug 2021 17:18:37 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id h14so15377009wrx.10;
 Sat, 07 Aug 2021 10:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5hbuDKh/pz00s6q8ViXl34FY2QFpcZMpDha1IvDmYqU=;
 b=dUlMaJcYlrL9KCiV6IXdTH0REFud/+1f2NKp1Jla3jEyeX2hD0UtNf6rboYrVVKbf9
 WcMD/7qHoysJS65t3bpIjeQXNxGuffLLaSklFebMjBKdFoPANNPxLXQmVfQCq5qjyJDK
 xdszDGPorxHa3fqbrgp44m2ESY83RIQs2PX1ja/FnsBqeuj8b6MxEcx4a3dLI+MDYL2u
 ehsisEEhUtRUdwYxAiBixgmvKhzwNAf+CqF2yd/n0RCr4FEkocACy+C5zwzaYH+gCEP1
 2e6wn6hm/JTYcLEt6eGrXOp+bPpLcfLTWUUtx+2pgD2y9rcbouz1UlpRKu1eTfaeMCkD
 7KoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5hbuDKh/pz00s6q8ViXl34FY2QFpcZMpDha1IvDmYqU=;
 b=BRDA55blX4Xqnp58Ifi9d/6mtXyE7W3r5GlrKvR0jFOx+gYjvXsp/pIRPODoMnCTYD
 jfzbFZDH+SVp1mmBXEAyf6m3kXBguE7zHiTeg1tFvCsnqcI2IbRfOL1iwt3gYWUeTLws
 bS4mfOUIPDSVinAAttExnbINYYtJfVVJ6n6YTJzZjN0qToGXhrtbYIVAfJZG87t66Kd4
 0wruQdM+t18nRdxBzYiL5dphhaDzVt488DHqMqXpqSFt5feu8hK548wsjhcBSa0HhtFT
 TmH3Eao2t51Pc2INzh++QkErBAJMUzc3daFubK63CdMfP/1CCSQ001MN9rg7WCr1gFAs
 PDbA==
X-Gm-Message-State: AOAM532a24xw8Ongsl0wnRVBuxucCNv4RdV4N/f0VqSxMitwPUzqta3F
 t589+tJ9H5ZG3oD6R5x2dZwP3/fGEUSMEAa03gQ=
X-Google-Smtp-Source: ABdhPJx4MLhD42aux6sivF/EYk+qPy/m85zs8ghQIw6qkpvvIGYgO80R7iNATsYLAq3xm3K//s7YDdjvYnCqHnA9u9s=
X-Received: by 2002:adf:f90e:: with SMTP id b14mr14538920wrr.28.1628356716240; 
 Sat, 07 Aug 2021 10:18:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210706084753.8194-1-tzimmermann@suse.de>
In-Reply-To: <20210706084753.8194-1-tzimmermann@suse.de>
From: Rob Clark <robdclark@gmail.com>
Date: Sat, 7 Aug 2021 10:22:51 -0700
Message-ID: <CAF6AEGtC+A4Rg-8EQWcBuWzOsm-CtnL4KFJJSE0CFQgry7dh7Q@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm: Implement mmap as GEM object function
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Jonathan <jonathan@marek.ca>, Jordan Crouse <jordan@cosmicpenguin.net>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
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

On Tue, Jul 6, 2021 at 1:47 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Moving the driver-specific mmap code into a GEM object function allows
> for using DRM helpers for various mmap callbacks.
>
> The respective msm functions are being removed. The file_operations
> structure fops is now being created by the helper macro
> DEFINE_DRM_GEM_FOPS().
>
> v2:
>         * rebase onto latest upstream
>         * remove declaration of msm_gem_mmap_obj() from msm_fbdev.c
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

applied with the following fixup squashed in:

-------
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 4d1872916552..28c1a81f7e7f 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -1057,7 +1057,7 @@ static int msm_gem_object_mmap(struct
drm_gem_object *obj, struct vm_area_struct
  struct msm_gem_object *msm_obj = to_msm_bo(obj);

  vma->vm_flags &= ~VM_PFNMAP;
- vma->vm_flags |= VM_MIXEDMAP;
+ vma->vm_flags |= VM_MIXEDMAP | VM_DONTEXPAND;
  vma->vm_page_prot = msm_gem_pgprot(msm_obj, vm_get_page_prot(vma->vm_flags));

  return 0;
-------

BR,
-R

> ---
>  drivers/gpu/drm/msm/msm_drv.c       | 14 ++---------
>  drivers/gpu/drm/msm/msm_drv.h       |  1 -
>  drivers/gpu/drm/msm/msm_fbdev.c     | 12 ++--------
>  drivers/gpu/drm/msm/msm_gem.c       | 37 ++++++++++-------------------
>  drivers/gpu/drm/msm/msm_gem.h       |  3 ---
>  drivers/gpu/drm/msm/msm_gem_prime.c | 11 ---------
>  6 files changed, 16 insertions(+), 62 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 9b8fa2ad0d84..a4d238e8d377 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -1004,17 +1004,7 @@ static const struct drm_ioctl_desc msm_ioctls[] = {
>         DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_QUERY, msm_ioctl_submitqueue_query, DRM_RENDER_ALLOW),
>  };
>
> -static const struct file_operations fops = {
> -       .owner              = THIS_MODULE,
> -       .open               = drm_open,
> -       .release            = drm_release,
> -       .unlocked_ioctl     = drm_ioctl,
> -       .compat_ioctl       = drm_compat_ioctl,
> -       .poll               = drm_poll,
> -       .read               = drm_read,
> -       .llseek             = no_llseek,
> -       .mmap               = msm_gem_mmap,
> -};
> +DEFINE_DRM_GEM_FOPS(fops);
>
>  static const struct drm_driver msm_driver = {
>         .driver_features    = DRIVER_GEM |
> @@ -1034,7 +1024,7 @@ static const struct drm_driver msm_driver = {
>         .prime_handle_to_fd = drm_gem_prime_handle_to_fd,
>         .prime_fd_to_handle = drm_gem_prime_fd_to_handle,
>         .gem_prime_import_sg_table = msm_gem_prime_import_sg_table,
> -       .gem_prime_mmap     = msm_gem_prime_mmap,
> +       .gem_prime_mmap     = drm_gem_prime_mmap,
>  #ifdef CONFIG_DEBUG_FS
>         .debugfs_init       = msm_debugfs_init,
>  #endif
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index 1a48a709ffb3..1a42903db347 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -309,7 +309,6 @@ void msm_gem_shrinker_cleanup(struct drm_device *dev);
>  struct sg_table *msm_gem_prime_get_sg_table(struct drm_gem_object *obj);
>  int msm_gem_prime_vmap(struct drm_gem_object *obj, struct dma_buf_map *map);
>  void msm_gem_prime_vunmap(struct drm_gem_object *obj, struct dma_buf_map *map);
> -int msm_gem_prime_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma);
>  struct drm_gem_object *msm_gem_prime_import_sg_table(struct drm_device *dev,
>                 struct dma_buf_attachment *attach, struct sg_table *sg);
>  int msm_gem_prime_pin(struct drm_gem_object *obj);
> diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
> index 67fae60f2fa5..0daaeb54ff6f 100644
> --- a/drivers/gpu/drm/msm/msm_fbdev.c
> +++ b/drivers/gpu/drm/msm/msm_fbdev.c
> @@ -8,13 +8,12 @@
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_fb_helper.h>
>  #include <drm/drm_fourcc.h>
> +#include <drm/drm_prime.h>
>
>  #include "msm_drv.h"
>  #include "msm_gem.h"
>  #include "msm_kms.h"
>
> -extern int msm_gem_mmap_obj(struct drm_gem_object *obj,
> -                                       struct vm_area_struct *vma);
>  static int msm_fbdev_mmap(struct fb_info *info, struct vm_area_struct *vma);
>
>  /*
> @@ -48,15 +47,8 @@ static int msm_fbdev_mmap(struct fb_info *info, struct vm_area_struct *vma)
>         struct drm_fb_helper *helper = (struct drm_fb_helper *)info->par;
>         struct msm_fbdev *fbdev = to_msm_fbdev(helper);
>         struct drm_gem_object *bo = msm_framebuffer_bo(fbdev->fb, 0);
> -       int ret = 0;
>
> -       ret = drm_gem_mmap_obj(bo, bo->size, vma);
> -       if (ret) {
> -               pr_err("%s:drm_gem_mmap_obj fail\n", __func__);
> -               return ret;
> -       }
> -
> -       return msm_gem_mmap_obj(bo, vma);
> +       return drm_gem_prime_mmap(bo, vma);
>  }
>
>  static int msm_fbdev_create(struct drm_fb_helper *helper,
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> index 141178754231..519a9601b219 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -218,31 +218,6 @@ static pgprot_t msm_gem_pgprot(struct msm_gem_object *msm_obj, pgprot_t prot)
>         return prot;
>  }
>
> -int msm_gem_mmap_obj(struct drm_gem_object *obj,
> -               struct vm_area_struct *vma)
> -{
> -       struct msm_gem_object *msm_obj = to_msm_bo(obj);
> -
> -       vma->vm_flags &= ~VM_PFNMAP;
> -       vma->vm_flags |= VM_MIXEDMAP;
> -       vma->vm_page_prot = msm_gem_pgprot(msm_obj, vm_get_page_prot(vma->vm_flags));
> -
> -       return 0;
> -}
> -
> -int msm_gem_mmap(struct file *filp, struct vm_area_struct *vma)
> -{
> -       int ret;
> -
> -       ret = drm_gem_mmap(filp, vma);
> -       if (ret) {
> -               DBG("mmap failed: %d", ret);
> -               return ret;
> -       }
> -
> -       return msm_gem_mmap_obj(vma->vm_private_data, vma);
> -}
> -
>  static vm_fault_t msm_gem_fault(struct vm_fault *vmf)
>  {
>         struct vm_area_struct *vma = vmf->vma;
> @@ -1114,6 +1089,17 @@ void msm_gem_free_object(struct drm_gem_object *obj)
>         kfree(msm_obj);
>  }
>
> +static int msm_gem_object_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
> +{
> +       struct msm_gem_object *msm_obj = to_msm_bo(obj);
> +
> +       vma->vm_flags &= ~VM_PFNMAP;
> +       vma->vm_flags |= VM_MIXEDMAP;
> +       vma->vm_page_prot = msm_gem_pgprot(msm_obj, vm_get_page_prot(vma->vm_flags));
> +
> +       return 0;
> +}
> +
>  /* convenience method to construct a GEM buffer object, and userspace handle */
>  int msm_gem_new_handle(struct drm_device *dev, struct drm_file *file,
>                 uint32_t size, uint32_t flags, uint32_t *handle,
> @@ -1151,6 +1137,7 @@ static const struct drm_gem_object_funcs msm_gem_object_funcs = {
>         .get_sg_table = msm_gem_prime_get_sg_table,
>         .vmap = msm_gem_prime_vmap,
>         .vunmap = msm_gem_prime_vunmap,
> +       .mmap = msm_gem_object_mmap,
>         .vm_ops = &vm_ops,
>  };
>
> diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
> index 405f8411e395..aab548720bee 100644
> --- a/drivers/gpu/drm/msm/msm_gem.h
> +++ b/drivers/gpu/drm/msm/msm_gem.h
> @@ -112,9 +112,6 @@ struct msm_gem_object {
>  };
>  #define to_msm_bo(x) container_of(x, struct msm_gem_object, base)
>
> -int msm_gem_mmap_obj(struct drm_gem_object *obj,
> -                       struct vm_area_struct *vma);
> -int msm_gem_mmap(struct file *filp, struct vm_area_struct *vma);
>  uint64_t msm_gem_mmap_offset(struct drm_gem_object *obj);
>  int msm_gem_get_iova(struct drm_gem_object *obj,
>                 struct msm_gem_address_space *aspace, uint64_t *iova);
> diff --git a/drivers/gpu/drm/msm/msm_gem_prime.c b/drivers/gpu/drm/msm/msm_gem_prime.c
> index 9880348a4dc7..fc94e061d6a7 100644
> --- a/drivers/gpu/drm/msm/msm_gem_prime.c
> +++ b/drivers/gpu/drm/msm/msm_gem_prime.c
> @@ -39,17 +39,6 @@ void msm_gem_prime_vunmap(struct drm_gem_object *obj, struct dma_buf_map *map)
>         msm_gem_put_vaddr(obj);
>  }
>
> -int msm_gem_prime_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
> -{
> -       int ret;
> -
> -       ret = drm_gem_mmap_obj(obj, obj->size, vma);
> -       if (ret < 0)
> -               return ret;
> -
> -       return msm_gem_mmap_obj(vma->vm_private_data, vma);
> -}
> -
>  struct drm_gem_object *msm_gem_prime_import_sg_table(struct drm_device *dev,
>                 struct dma_buf_attachment *attach, struct sg_table *sg)
>  {
> --
> 2.32.0
>
