Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDAA43C1B15
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 23:37:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C66E389CC9;
	Thu,  8 Jul 2021 21:37:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F28B489CC9
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 21:37:52 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 f93-20020a9d03e60000b02904b1f1d7c5f4so6545375otf.9
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jul 2021 14:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kpEaKXIPqiq+74WTxsBIvETGT3UlDF3lNc93AnyqNxc=;
 b=QWDO3gcSiy3PSSBckqzyYkHgbfrrZCV6eKwVlUSc+bUUJVlUD8RQuw4N52t0PE+PxN
 xkOhXTMYP7K8to3hIms4oFoYDlBOVgmrwFi19+lwh9kq6L1ttvdw627IsVdyrcYss4MK
 rtgG0Ui2nkYHvct7FmqYVce1GcNcEadt/1Qjg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kpEaKXIPqiq+74WTxsBIvETGT3UlDF3lNc93AnyqNxc=;
 b=ekLUnRUTgqX56lNjIzWLM5kcJROL+OBM1CLPJwHwQSBfqmIEvNBfryW+4dMk5c7zJn
 nFtRgBFWi8jQEBB20b42yp74NM8dxk1Ib8PHz94b8N7ukwgp/WXN7yNG43Cdt29amJoC
 UFdy1H05paOlmJTqQ2b+3KsZ/LjbIeyVI8O42jOwuTr7V6KGGSZu1kWW/GJRwmuH1eeZ
 X+uwycAn/6eiEQxkjjttoXPUf1ruLG546E3ODHXcDkzQMyuMlGTlQJJHB8+gwF4ItLxt
 1kKyK4MScUoPwTi1HZhXXHP2QC5zFatPNZg+yFbSubw+ZBw6zOcPBjiKhGAWrrjPkFUS
 IRiw==
X-Gm-Message-State: AOAM530yYUluj1oTQT2/Fp17mHPIEJ0mZ3hB1+gvtqDAm71QA81nS6jH
 wnDrVov8C/Wm9m6Loioumsaoal08BcYsaqeCjPMuow==
X-Google-Smtp-Source: ABdhPJxbw6H9XVQrNqyI20JnIkq1WO3RfxEoeVVbK/6yfb5acpuC0vbVQsuypvLlWO+10ftBrQdyzKOGYRrwjN527oU=
X-Received: by 2002:a05:6830:2366:: with SMTP id
 r6mr25183475oth.188.1625780272248; 
 Thu, 08 Jul 2021 14:37:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210624095238.8804-1-tzimmermann@suse.de>
In-Reply-To: <20210624095238.8804-1-tzimmermann@suse.de>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 8 Jul 2021 23:37:40 +0200
Message-ID: <CAKMK7uEe_JaT7kBopoZtgNW_3rDgn-nr2fbycmVuGQAUsb34tA@mail.gmail.com>
Subject: Re: [PATCH] drm/vgem: Implement mmap as GEM object function
To: Thomas Zimmermann <tzimmermann@suse.de>, "Syrjala,
 Ville" <ville.syrjala@linux.intel.com>
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
Cc: Dave Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 "Wilson, Chris" <chris@chris-wilson.co.uk>,
 Melissa Wen <melissa.srw@gmail.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 24, 2021 at 11:52 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Moving the driver-specific mmap code into a GEM object function allows
> for using DRM helpers for various mmap callbacks.
>
> The respective vgem functions are being removed. The file_operations
> structure vgem_driver_fops is now being created by the helper macro
> DEFINE_DRM_GEM_FOPS().
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Might be this one, might be a different one (there's also a bunch of
core kernel patches that got into drm-tip together with this patch),
but vgem goes boom after this landed in CI:

https://intel-gfx-ci.01.org/tree/drm-tip/igt@vgem_basic@unload.html

Can you pls take a quick look? It's in dma-buf fault stuff, so not
entirely unlikely. Ville pointed this out on irc.
-Daniel

> ---
>  drivers/gpu/drm/vgem/vgem_drv.c | 46 ++++-----------------------------
>  1 file changed, 5 insertions(+), 41 deletions(-)
>
> diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vgem_drv.c
> index bf38a7e319d1..df634aa52638 100644
> --- a/drivers/gpu/drm/vgem/vgem_drv.c
> +++ b/drivers/gpu/drm/vgem/vgem_drv.c
> @@ -239,32 +239,7 @@ static struct drm_ioctl_desc vgem_ioctls[] = {
>         DRM_IOCTL_DEF_DRV(VGEM_FENCE_SIGNAL, vgem_fence_signal_ioctl, DRM_RENDER_ALLOW),
>  };
>
> -static int vgem_mmap(struct file *filp, struct vm_area_struct *vma)
> -{
> -       unsigned long flags = vma->vm_flags;
> -       int ret;
> -
> -       ret = drm_gem_mmap(filp, vma);
> -       if (ret)
> -               return ret;
> -
> -       /* Keep the WC mmaping set by drm_gem_mmap() but our pages
> -        * are ordinary and not special.
> -        */
> -       vma->vm_flags = flags | VM_DONTEXPAND | VM_DONTDUMP;
> -       return 0;
> -}
> -
> -static const struct file_operations vgem_driver_fops = {
> -       .owner          = THIS_MODULE,
> -       .open           = drm_open,
> -       .mmap           = vgem_mmap,
> -       .poll           = drm_poll,
> -       .read           = drm_read,
> -       .unlocked_ioctl = drm_ioctl,
> -       .compat_ioctl   = drm_compat_ioctl,
> -       .release        = drm_release,
> -};
> +DEFINE_DRM_GEM_FOPS(vgem_driver_fops);
>
>  static struct page **vgem_pin_pages(struct drm_vgem_gem_object *bo)
>  {
> @@ -387,24 +362,12 @@ static void vgem_prime_vunmap(struct drm_gem_object *obj, struct dma_buf_map *ma
>         vgem_unpin_pages(bo);
>  }
>
> -static int vgem_prime_mmap(struct drm_gem_object *obj,
> -                          struct vm_area_struct *vma)
> +static int vgem_prime_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
>  {
> -       int ret;
> -
> -       if (obj->size < vma->vm_end - vma->vm_start)
> -               return -EINVAL;
> -
> -       if (!obj->filp)
> -               return -ENODEV;
> -
> -       ret = call_mmap(obj->filp, vma);
> -       if (ret)
> -               return ret;
> -
>         vma_set_file(vma, obj->filp);
>         vma->vm_flags |= VM_DONTEXPAND | VM_DONTDUMP;
>         vma->vm_page_prot = pgprot_writecombine(vm_get_page_prot(vma->vm_flags));
> +       vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
>
>         return 0;
>  }
> @@ -416,6 +379,7 @@ static const struct drm_gem_object_funcs vgem_gem_object_funcs = {
>         .get_sg_table = vgem_prime_get_sg_table,
>         .vmap = vgem_prime_vmap,
>         .vunmap = vgem_prime_vunmap,
> +       .mmap = vgem_prime_mmap,
>         .vm_ops = &vgem_gem_vm_ops,
>  };
>
> @@ -433,7 +397,7 @@ static const struct drm_driver vgem_driver = {
>         .prime_fd_to_handle = drm_gem_prime_fd_to_handle,
>         .gem_prime_import = vgem_prime_import,
>         .gem_prime_import_sg_table = vgem_prime_import_sg_table,
> -       .gem_prime_mmap = vgem_prime_mmap,
> +       .gem_prime_mmap = drm_gem_prime_mmap,
>
>         .name   = DRIVER_NAME,
>         .desc   = DRIVER_DESC,
> --
> 2.32.0
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
