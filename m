Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4234A449832
	for <lists+dri-devel@lfdr.de>; Mon,  8 Nov 2021 16:29:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A23226E062;
	Mon,  8 Nov 2021 15:29:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDDF76E062
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Nov 2021 15:29:23 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id u1so27558107wru.13
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Nov 2021 07:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=c1Vs+8e8CI/eQJgbpfI/Ztxvzb9lQKxlTgF3ypUWX2Q=;
 b=EvlGKfzWf4YR8a+ai4RU3CDMnu3ajWJwo8Sp6Li16gYPErtkuf7ySvMFaMs3zqU6i/
 ekw32AsoVDd52jHf+vVFPbMOH91z7Cj9FjCy9/QctcBukSoXe60I7bH9hY3/3TUo9+d6
 J0ZpzzHXIqYXbJmYZukljOghYAs4PpBo3VFnU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=c1Vs+8e8CI/eQJgbpfI/Ztxvzb9lQKxlTgF3ypUWX2Q=;
 b=kr9C5GxsrT140/oOIh1VXq+8fg6gZYxF981ex1lRM8+y7xzHDWSH91mcZVllR1fwi3
 4KhLKyB+uyP9g9bMtzIj9p1AjQCUikPAchzelNrw6gTk6CWQguf/MyhuHzjTRjvAyqjC
 4ljkILrdHDZvhn3kJ9rzezKvtBEjrJOqi0xlIsf5KBA7L5eSGU2DbMbBxXGJbhAr0WJb
 i2BLOv0PntSlRMeuOTG/2L7tle2COfNNGt0lYYbZhXn84xdK6E5/hH0B6xRrvTYk6Q1r
 wat5lQuo0JWgvugdajIdCAOzWcCnMOLDZG/nBJWCZhEEJabZ3iVk6CEI0qJcQ8ewcEHg
 u/7A==
X-Gm-Message-State: AOAM533El0vLAqfN8G1w9eq4jjYU5VyGZEvA5fyRWRXJvJXAUwuK4+mV
 Weq9RK5Q7la1ZrlNTvBX9DAZtg==
X-Google-Smtp-Source: ABdhPJwb/aFbIu8dIyZ/rHwVyiCtAdp7dmdzWNFLSsD1GwQ69nph/cPeSUCecltAOeJjHsbs2fHFGQ==
X-Received: by 2002:adf:e6c5:: with SMTP id y5mr664478wrm.79.1636385362480;
 Mon, 08 Nov 2021 07:29:22 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z135sm24083422wmc.45.2021.11.08.07.29.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 07:29:21 -0800 (PST)
Date: Mon, 8 Nov 2021 16:29:20 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 1/3] drm/exynox: Implement mmap as GEM object function
Message-ID: <YYlCUOgd1/GBluE7@phenom.ffwll.local>
References: <20211108102846.309-1-tzimmermann@suse.de>
 <20211108102846.309-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211108102846.309-2-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com,
 krzysztof.kozlowski@canonical.com, airlied@linux.ie, sw0312.kim@samsung.com,
 oleksandr_andrushchenko@epam.com, kyungmin.park@samsung.com,
 dri-devel@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 08, 2021 at 11:28:44AM +0100, Thomas Zimmermann wrote:
> Moving the driver-specific mmap code into a GEM object function allows
> for using DRM helpers for various mmap callbacks.
> 
> The respective exynos functions are being removed. The file_operations
> structure exynos_drm_driver_fops is now being created by the helper macro
> DEFINE_DRM_GEM_FOPS().
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

s/exynox/exynos in the subject.

Patch lgtm, but would still be good if exynos maintainers would
ack/review/test it. But if you don't get anything within 2 weeks here's
my:

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/exynos/exynos_drm_drv.c   | 13 ++-----
>  drivers/gpu/drm/exynos/exynos_drm_fbdev.c | 20 ++---------
>  drivers/gpu/drm/exynos/exynos_drm_gem.c   | 43 +++++------------------
>  drivers/gpu/drm/exynos/exynos_drm_gem.h   |  5 ---
>  4 files changed, 13 insertions(+), 68 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> index d8f1cf4d6b69..9743b6b17447 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> @@ -102,16 +102,7 @@ static const struct drm_ioctl_desc exynos_ioctls[] = {
>  			DRM_RENDER_ALLOW),
>  };
>  
> -static const struct file_operations exynos_drm_driver_fops = {
> -	.owner		= THIS_MODULE,
> -	.open		= drm_open,
> -	.mmap		= exynos_drm_gem_mmap,
> -	.poll		= drm_poll,
> -	.read		= drm_read,
> -	.unlocked_ioctl	= drm_ioctl,
> -	.compat_ioctl = drm_compat_ioctl,
> -	.release	= drm_release,
> -};
> +DEFINE_DRM_GEM_FOPS(exynos_drm_driver_fops);
>  
>  static const struct drm_driver exynos_drm_driver = {
>  	.driver_features	= DRIVER_MODESET | DRIVER_GEM
> @@ -124,7 +115,7 @@ static const struct drm_driver exynos_drm_driver = {
>  	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle,
>  	.gem_prime_import	= exynos_drm_gem_prime_import,
>  	.gem_prime_import_sg_table	= exynos_drm_gem_prime_import_sg_table,
> -	.gem_prime_mmap		= exynos_drm_gem_prime_mmap,
> +	.gem_prime_mmap		= drm_gem_prime_mmap,
>  	.ioctls			= exynos_ioctls,
>  	.num_ioctls		= ARRAY_SIZE(exynos_ioctls),
>  	.fops			= &exynos_drm_driver_fops,
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> index 5147f5929be7..02c97b9ca926 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> @@ -15,6 +15,7 @@
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_fb_helper.h>
>  #include <drm/drm_fourcc.h>
> +#include <drm/drm_prime.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/exynos_drm.h>
>  
> @@ -39,25 +40,8 @@ static int exynos_drm_fb_mmap(struct fb_info *info,
>  	struct drm_fb_helper *helper = info->par;
>  	struct exynos_drm_fbdev *exynos_fbd = to_exynos_fbdev(helper);
>  	struct exynos_drm_gem *exynos_gem = exynos_fbd->exynos_gem;
> -	unsigned long vm_size;
> -	int ret;
> -
> -	vma->vm_flags |= VM_IO | VM_DONTEXPAND | VM_DONTDUMP;
> -
> -	vm_size = vma->vm_end - vma->vm_start;
> -
> -	if (vm_size > exynos_gem->size)
> -		return -EINVAL;
>  
> -	ret = dma_mmap_attrs(to_dma_dev(helper->dev), vma, exynos_gem->cookie,
> -			     exynos_gem->dma_addr, exynos_gem->size,
> -			     exynos_gem->dma_attrs);
> -	if (ret < 0) {
> -		DRM_DEV_ERROR(to_dma_dev(helper->dev), "failed to mmap.\n");
> -		return ret;
> -	}
> -
> -	return 0;
> +	return drm_gem_prime_mmap(&exynos_gem->base, vma);
>  }
>  
>  static const struct fb_ops exynos_drm_fb_ops = {
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
> index 4396224227d1..c4b63902ee7a 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
> @@ -17,6 +17,8 @@
>  #include "exynos_drm_drv.h"
>  #include "exynos_drm_gem.h"
>  
> +static int exynos_drm_gem_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma);
> +
>  static int exynos_drm_alloc_buf(struct exynos_drm_gem *exynos_gem, bool kvmap)
>  {
>  	struct drm_device *dev = exynos_gem->base.dev;
> @@ -135,6 +137,7 @@ static const struct vm_operations_struct exynos_drm_gem_vm_ops = {
>  static const struct drm_gem_object_funcs exynos_drm_gem_object_funcs = {
>  	.free = exynos_drm_gem_free_object,
>  	.get_sg_table = exynos_drm_gem_prime_get_sg_table,
> +	.mmap = exynos_drm_gem_mmap,
>  	.vm_ops = &exynos_drm_gem_vm_ops,
>  };
>  
> @@ -354,12 +357,16 @@ int exynos_drm_gem_dumb_create(struct drm_file *file_priv,
>  	return 0;
>  }
>  
> -static int exynos_drm_gem_mmap_obj(struct drm_gem_object *obj,
> -				   struct vm_area_struct *vma)
> +static int exynos_drm_gem_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
>  {
>  	struct exynos_drm_gem *exynos_gem = to_exynos_gem(obj);
>  	int ret;
>  
> +	if (obj->import_attach)
> +		return dma_buf_mmap(obj->dma_buf, vma, 0);
> +
> +	vma->vm_flags |= VM_IO | VM_DONTEXPAND | VM_DONTDUMP;
> +
>  	DRM_DEV_DEBUG_KMS(to_dma_dev(obj->dev), "flags = 0x%x\n",
>  			  exynos_gem->flags);
>  
> @@ -385,26 +392,6 @@ static int exynos_drm_gem_mmap_obj(struct drm_gem_object *obj,
>  	return ret;
>  }
>  
> -int exynos_drm_gem_mmap(struct file *filp, struct vm_area_struct *vma)
> -{
> -	struct drm_gem_object *obj;
> -	int ret;
> -
> -	/* set vm_area_struct. */
> -	ret = drm_gem_mmap(filp, vma);
> -	if (ret < 0) {
> -		DRM_ERROR("failed to mmap.\n");
> -		return ret;
> -	}
> -
> -	obj = vma->vm_private_data;
> -
> -	if (obj->import_attach)
> -		return dma_buf_mmap(obj->dma_buf, vma, 0);
> -
> -	return exynos_drm_gem_mmap_obj(obj, vma);
> -}
> -
>  /* low-level interface prime helpers */
>  struct drm_gem_object *exynos_drm_gem_prime_import(struct drm_device *dev,
>  					    struct dma_buf *dma_buf)
> @@ -466,15 +453,3 @@ exynos_drm_gem_prime_import_sg_table(struct drm_device *dev,
>  	exynos_gem->sgt = sgt;
>  	return &exynos_gem->base;
>  }
> -
> -int exynos_drm_gem_prime_mmap(struct drm_gem_object *obj,
> -			      struct vm_area_struct *vma)
> -{
> -	int ret;
> -
> -	ret = drm_gem_mmap_obj(obj, obj->size, vma);
> -	if (ret < 0)
> -		return ret;
> -
> -	return exynos_drm_gem_mmap_obj(obj, vma);
> -}
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.h b/drivers/gpu/drm/exynos/exynos_drm_gem.h
> index a23272fb96fb..79d7e1a87419 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_gem.h
> +++ b/drivers/gpu/drm/exynos/exynos_drm_gem.h
> @@ -96,9 +96,6 @@ int exynos_drm_gem_dumb_create(struct drm_file *file_priv,
>  			       struct drm_device *dev,
>  			       struct drm_mode_create_dumb *args);
>  
> -/* set vm_flags and we can change the vm attribute to other one at here. */
> -int exynos_drm_gem_mmap(struct file *filp, struct vm_area_struct *vma);
> -
>  /* low-level interface prime helpers */
>  struct drm_gem_object *exynos_drm_gem_prime_import(struct drm_device *dev,
>  					    struct dma_buf *dma_buf);
> @@ -107,7 +104,5 @@ struct drm_gem_object *
>  exynos_drm_gem_prime_import_sg_table(struct drm_device *dev,
>  				     struct dma_buf_attachment *attach,
>  				     struct sg_table *sgt);
> -int exynos_drm_gem_prime_mmap(struct drm_gem_object *obj,
> -			      struct vm_area_struct *vma);
>  
>  #endif
> -- 
> 2.33.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
