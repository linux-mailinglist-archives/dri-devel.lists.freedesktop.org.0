Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EEA67EAC3
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 17:23:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 981BF10E9AB;
	Fri, 27 Jan 2023 16:23:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 791D010E9AB
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 16:23:17 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id y1so5460521wru.2
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 08:23:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=w93HxJVwYaHUCMlu4tIOXmi/iF/7dLqgEsVDLRWLDJE=;
 b=gy1iBnzSJpIKkePkB7ETfy9wWjb3sPIS7jny4ipDUm6ZO6Sy4+n94shTgdCI4gHYnK
 zGGx6ETcSvgAqfceKSRQOQLnb2EWOX/FH4re0btaWqmKwp6KDsth6AIE/xNYb0taDdgJ
 WmnBk5nrKqrwwkkDrCaE57uHswY5teAsQ2nTciHBy3sPoPyPU7PQGfcTylYWfISy/HI0
 KSL0ikdtoKlwBEvEAlXloZ8erk86JqKAjIcV4DJ7HbrSdLvNHp7pHQP468yZwmcv55yZ
 CW1mTrGD68U2qPcGtOSN6wr3KFr4ILvvAu5aitUwHcqD2UaDXpoD5vSDptcXL5XY+1XZ
 OChQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=w93HxJVwYaHUCMlu4tIOXmi/iF/7dLqgEsVDLRWLDJE=;
 b=tZgIj203k7do/Qa3EiZNCi3PpYISEeu3cvOy6EbM1T6ALTUvjLvZDjGwaB6fhG54FE
 rvxLANyZimgxTRSaCQI66E3SDEc1L/82EWA1fUrqRy6yTofhX/pHoYeFUTLLdZRr7JP0
 Xr+v6QuDof1+lXA4QpS9GmhdsyUbY86oKtafOGIdjbtqyvv9dFVDxdXnIaRf00CDk3km
 5nZaLSZjw5wNdXpbjIgHhPV+wV8t98ZI/7/XGYKyrkTcEyOsrmviL984h3a6Ks1zIuJN
 b3NQEjFUikfP0mEDNby5Kjk/OL8Iycj81x4TWHP71PdhZne9YH5f4IxgLX/zWuTT+bUd
 s4vQ==
X-Gm-Message-State: AO0yUKUNLGlcWCme87TuNlXnLqxu8IzZTzTTgqewKPJtspPdGoICx5Uh
 BByalOwRGolDlFHswiuTiF+tm40i+sE=
X-Google-Smtp-Source: AK7set8GWTuQwGyjG+y68CGaCDrf5K+wfi2GQKIvI7hKp3I6+l7J83N35wnhBmLhz4GdREzuUb1KKw==
X-Received: by 2002:a5d:4cce:0:b0:2bf:b741:3e19 with SMTP id
 c14-20020a5d4cce000000b002bfb7413e19mr9041293wrt.25.1674836595706; 
 Fri, 27 Jan 2023 08:23:15 -0800 (PST)
Received: from [192.168.2.181] (46-10-148-141.ip.btc-net.bg. [46.10.148.141])
 by smtp.gmail.com with ESMTPSA id
 m13-20020a5d56cd000000b002bfd462d13asm2195628wrw.18.2023.01.27.08.23.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 08:23:15 -0800 (PST)
Message-ID: <187d8d23-74ff-1359-644b-3e4e89d44845@gmail.com>
Date: Fri, 27 Jan 2023 18:23:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 1/7] drm/vmwgfx: Use the common gem mmap instead of the
 custom code
To: Zack Rusin <zackr@vmware.com>, dri-devel@lists.freedesktop.org
References: <20230126173813.602748-1-zack@kde.org>
 <20230126173813.602748-2-zack@kde.org>
Content-Language: en-US
From: "Martin Krastev (VMware)" <martinkrastev768@gmail.com>
In-Reply-To: <20230126173813.602748-2-zack@kde.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: krastevm@vmware.com, mombasawalam@vmware.com, banackm@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Martin Krastev <krastevm@vmware.com>


LGTM!
Reviewed-by: Martin Krastev <krastevm@vmware.com>


Regards,
Martin

On 26.01.23 г. 19:38 ч., Zack Rusin wrote:
> From: Zack Rusin <zackr@vmware.com>
>
> Before vmwgfx supported gem it needed to implement the entire mmap logic
> explicitly. With GEM support that's not needed and the generic code
> can be used by simply setting the vm_ops to vmwgfx specific ones on the
> gem object itself.
>
> Removes a lot of code from vmwgfx without any functional difference.
>
> Signed-off-by: Zack Rusin <zackr@vmware.com>
> ---
>   drivers/gpu/drm/vmwgfx/Makefile          |   2 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_drv.c      |   2 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h      |   6 --
>   drivers/gpu/drm/vmwgfx/vmwgfx_gem.c      |   8 ++
>   drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c | 110 -----------------------
>   5 files changed, 10 insertions(+), 118 deletions(-)
>   delete mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
>
> diff --git a/drivers/gpu/drm/vmwgfx/Makefile b/drivers/gpu/drm/vmwgfx/Makefile
> index 2a644f035597..e94479d9cd5b 100644
> --- a/drivers/gpu/drm/vmwgfx/Makefile
> +++ b/drivers/gpu/drm/vmwgfx/Makefile
> @@ -1,7 +1,7 @@
>   # SPDX-License-Identifier: GPL-2.0
>   vmwgfx-y := vmwgfx_execbuf.o vmwgfx_gmr.o vmwgfx_kms.o vmwgfx_drv.o \
>   	    vmwgfx_ioctl.o vmwgfx_resource.o vmwgfx_ttm_buffer.o \
> -	    vmwgfx_cmd.o vmwgfx_irq.o vmwgfx_ldu.o vmwgfx_ttm_glue.o \
> +	    vmwgfx_cmd.o vmwgfx_irq.o vmwgfx_ldu.o \
>   	    vmwgfx_overlay.o vmwgfx_gmrid_manager.o vmwgfx_fence.o \
>   	    vmwgfx_bo.o vmwgfx_scrn.o vmwgfx_context.o \
>   	    vmwgfx_surface.o vmwgfx_prime.o vmwgfx_mob.o vmwgfx_shader.o \
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> index bd02cb0e6837..e0c2e3748015 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> @@ -1566,7 +1566,7 @@ static const struct file_operations vmwgfx_driver_fops = {
>   	.open = drm_open,
>   	.release = drm_release,
>   	.unlocked_ioctl = vmw_unlocked_ioctl,
> -	.mmap = vmw_mmap,
> +	.mmap = drm_gem_mmap,
>   	.poll = drm_poll,
>   	.read = drm_read,
>   #if defined(CONFIG_COMPAT)
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> index 5acbf5849b27..4dfa5044a9e7 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> @@ -1053,12 +1053,6 @@ vmw_is_cursor_bypass3_enabled(const struct vmw_private *dev_priv)
>   	return (vmw_fifo_caps(dev_priv) & SVGA_FIFO_CAP_CURSOR_BYPASS_3) != 0;
>   }
>   
> -/**
> - * TTM glue - vmwgfx_ttm_glue.c
> - */
> -
> -extern int vmw_mmap(struct file *filp, struct vm_area_struct *vma);
> -
>   /**
>    * TTM buffer object driver - vmwgfx_ttm_buffer.c
>    */
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
> index ce609e7d758f..ba4ddd9f7a7e 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
> @@ -103,6 +103,13 @@ static struct sg_table *vmw_gem_object_get_sg_table(struct drm_gem_object *obj)
>   	return drm_prime_pages_to_sg(obj->dev, vmw_tt->dma_ttm.pages, vmw_tt->dma_ttm.num_pages);
>   }
>   
> +static const struct vm_operations_struct vmw_vm_ops = {
> +	.pfn_mkwrite = vmw_bo_vm_mkwrite,
> +	.page_mkwrite = vmw_bo_vm_mkwrite,
> +	.fault = vmw_bo_vm_fault,
> +	.open = ttm_bo_vm_open,
> +	.close = ttm_bo_vm_close,
> +};
>   
>   static const struct drm_gem_object_funcs vmw_gem_object_funcs = {
>   	.free = vmw_gem_object_free,
> @@ -115,6 +122,7 @@ static const struct drm_gem_object_funcs vmw_gem_object_funcs = {
>   	.vmap = drm_gem_ttm_vmap,
>   	.vunmap = drm_gem_ttm_vunmap,
>   	.mmap = drm_gem_ttm_mmap,
> +	.vm_ops = &vmw_vm_ops,
>   };
>   
>   /**
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
> deleted file mode 100644
> index 265f7c48d856..000000000000
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
> +++ /dev/null
> @@ -1,110 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0 OR MIT
> -/**************************************************************************
> - *
> - * Copyright 2009-2011 VMware, Inc., Palo Alto, CA., USA
> - *
> - * Permission is hereby granted, free of charge, to any person obtaining a
> - * copy of this software and associated documentation files (the
> - * "Software"), to deal in the Software without restriction, including
> - * without limitation the rights to use, copy, modify, merge, publish,
> - * distribute, sub license, and/or sell copies of the Software, and to
> - * permit persons to whom the Software is furnished to do so, subject to
> - * the following conditions:
> - *
> - * The above copyright notice and this permission notice (including the
> - * next paragraph) shall be included in all copies or substantial portions
> - * of the Software.
> - *
> - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> - * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
> - * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
> - * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
> - * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
> - * USE OR OTHER DEALINGS IN THE SOFTWARE.
> - *
> - **************************************************************************/
> -
> -#include "vmwgfx_drv.h"
> -
> -static int vmw_bo_vm_lookup(struct ttm_device *bdev,
> -				   struct drm_file *filp,
> -				   unsigned long offset,
> -				   unsigned long pages,
> -				   struct ttm_buffer_object **p_bo)
> -{
> -	struct vmw_private *dev_priv = container_of(bdev, struct vmw_private, bdev);
> -	struct drm_device *drm = &dev_priv->drm;
> -	struct drm_vma_offset_node *node;
> -	int ret;
> -
> -	*p_bo = NULL;
> -
> -	drm_vma_offset_lock_lookup(bdev->vma_manager);
> -
> -	node = drm_vma_offset_lookup_locked(bdev->vma_manager, offset, pages);
> -	if (likely(node)) {
> -		*p_bo = container_of(node, struct ttm_buffer_object,
> -				  base.vma_node);
> -		*p_bo = ttm_bo_get_unless_zero(*p_bo);
> -	}
> -
> -	drm_vma_offset_unlock_lookup(bdev->vma_manager);
> -
> -	if (!*p_bo) {
> -		drm_err(drm, "Could not find buffer object to map\n");
> -		return -EINVAL;
> -	}
> -
> -	if (!drm_vma_node_is_allowed(node, filp)) {
> -		ret = -EACCES;
> -		goto out_no_access;
> -	}
> -
> -	return 0;
> -out_no_access:
> -	ttm_bo_put(*p_bo);
> -	return ret;
> -}
> -
> -int vmw_mmap(struct file *filp, struct vm_area_struct *vma)
> -{
> -	static const struct vm_operations_struct vmw_vm_ops = {
> -		.pfn_mkwrite = vmw_bo_vm_mkwrite,
> -		.page_mkwrite = vmw_bo_vm_mkwrite,
> -		.fault = vmw_bo_vm_fault,
> -		.open = ttm_bo_vm_open,
> -		.close = ttm_bo_vm_close,
> -	};
> -	struct drm_file *file_priv = filp->private_data;
> -	struct vmw_private *dev_priv = vmw_priv(file_priv->minor->dev);
> -	struct ttm_device *bdev = &dev_priv->bdev;
> -	struct ttm_buffer_object *bo;
> -	int ret;
> -
> -	if (unlikely(vma->vm_pgoff < DRM_FILE_PAGE_OFFSET_START))
> -		return -EINVAL;
> -
> -	ret = vmw_bo_vm_lookup(bdev, file_priv, vma->vm_pgoff, vma_pages(vma), &bo);
> -	if (unlikely(ret != 0))
> -		return ret;
> -
> -	ret = ttm_bo_mmap_obj(vma, bo);
> -	if (unlikely(ret != 0))
> -		goto out_unref;
> -
> -	vma->vm_ops = &vmw_vm_ops;
> -
> -	/* Use VM_PFNMAP rather than VM_MIXEDMAP if not a COW mapping */
> -	if (!is_cow_mapping(vma->vm_flags))
> -		vma->vm_flags = (vma->vm_flags & ~VM_MIXEDMAP) | VM_PFNMAP;
> -
> -	ttm_bo_put(bo); /* release extra ref taken by ttm_bo_mmap_obj() */
> -
> -	return 0;
> -
> -out_unref:
> -	ttm_bo_put(bo);
> -	return ret;
> -}
> -
