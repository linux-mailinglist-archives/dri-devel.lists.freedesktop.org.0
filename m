Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB9F9A596D
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 06:17:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBB0410E002;
	Mon, 21 Oct 2024 04:17:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="HGRyFK3d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7452010E002
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 04:17:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1729484234; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=ifCZ664MCdZJKpDHi9XHCD/Vvyfdk/dmW4z955C6/YBanLlLjzoWP4yvSMP78JSiMv90FySf6Itq8TkNpdmc3IWK2KaGLQqxq/wqtH8MKxn/d8/hKCMLX+1oGBPSE4QrjiUTsy/gk3WSKOnkxZ0xQes/wG39mJwqwcpqb3FRII8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1729484234;
 h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=BiJ0LdQv6I0pZ/hvzsw8lAMtI1oZK3ScOGveRvtfO3Y=; 
 b=mO/nwvXcvZHntqj43V20Ur4W0jMGc/I33ZOEsom4i7/mL+NP6/eOTnR2h6Ebaq3cC1z0+mF+CZeMFLuLDDhISxGPR2FU0CGh3ll+El1b0RittKeBET9BRqTsFRGPyqck6+i3uvK5fytyfIRXVhcdBl2nHAkukhRmD8Gsbk2mN3k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729484234; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
 bh=BiJ0LdQv6I0pZ/hvzsw8lAMtI1oZK3ScOGveRvtfO3Y=;
 b=HGRyFK3dDkeNjLDCkYWahEugKa9Rq3m7SAeLDdlfggcPj4XbGV6w5gEyq+YhhOl/
 c7JOGLxbjNnEvK0nfUmJ1foRvdjBhZVawZuSN+Gmx7cnlvmOZvDYqHKY2Xo42HJomFk
 +8kVsJlm/2wZXJtv1uq+zIYoVmE0/iI15pkri7DU=
Received: by mx.zohomail.com with SMTPS id 1729484232419792.3567314862235;
 Sun, 20 Oct 2024 21:17:12 -0700 (PDT)
Message-ID: <d81b181b-ef81-4533-aa9d-1084e2b26da2@collabora.com>
Date: Mon, 21 Oct 2024 07:17:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/virtio: use generic dumb_map_offset implementation
To: Peter Shkenev <mustela@erminea.space>, David Airlie <airlied@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20241014170801.71231-1-mustela@erminea.space>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20241014170801.71231-1-mustela@erminea.space>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
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

On 10/14/24 20:07, Peter Shkenev wrote:
> Currently, virtio uses its own dumb_map_offset implementation,
> virtio_gpu_mode_dumb_mmap. It works similarly to generic implementation,
> drm_gem_dumb_map_offset, and using the generic implementation is
> preferable (and making drivers to do so is a task stated on the DRM
> subsystem's TODO list).
> 
> Thus, make driver use the generic implementation. This includes
> VIRTGPU_MAP ioctl so it cannot be used to circumvent rules imposed by
> drm_gem_dumb_map_offset (imported objects cannot be mapped).
> 
> Signed-off-by: Peter Shkenev <mustela@erminea.space>
> ---
>  drivers/gpu/drm/virtio/virtgpu_drv.c   |  1 -
>  drivers/gpu/drm/virtio/virtgpu_gem.c   | 15 ---------------
>  drivers/gpu/drm/virtio/virtgpu_ioctl.c |  3 ++-
>  3 files changed, 2 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
> index ffca6e2e1c9a..909808398d66 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
> @@ -184,7 +184,6 @@ static const struct drm_driver driver = {
>  	.postclose = virtio_gpu_driver_postclose,
>  
>  	.dumb_create = virtio_gpu_mode_dumb_create,
> -	.dumb_map_offset = virtio_gpu_mode_dumb_mmap,
>  
>  	DRM_FBDEV_SHMEM_DRIVER_OPS,
>  
> diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c b/drivers/gpu/drm/virtio/virtgpu_gem.c
> index 7db48d17ee3a..aefbb49481f1 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_gem.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
> @@ -99,21 +99,6 @@ int virtio_gpu_mode_dumb_create(struct drm_file *file_priv,
>  	return ret;
>  }
>  
> -int virtio_gpu_mode_dumb_mmap(struct drm_file *file_priv,
> -			      struct drm_device *dev,
> -			      uint32_t handle, uint64_t *offset_p)
> -{
> -	struct drm_gem_object *gobj;
> -
> -	BUG_ON(!offset_p);
> -	gobj = drm_gem_object_lookup(file_priv, handle);
> -	if (gobj == NULL)
> -		return -ENOENT;
> -	*offset_p = drm_vma_node_offset_addr(&gobj->vma_node);
> -	drm_gem_object_put(gobj);
> -	return 0;
> -}
> -
>  int virtio_gpu_gem_object_open(struct drm_gem_object *obj,
>  			       struct drm_file *file)
>  {
> diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> index e4f76f315550..13f3ed60a0e5 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> @@ -30,6 +30,7 @@
>  #include <linux/uaccess.h>
>  
>  #include <drm/drm_file.h>
> +#include <drm/drm_gem.h>

This include shouldn't be needed as drm_gem.h is included by virtgpu_drv.h

>  #include <drm/virtgpu_drm.h>
>  
>  #include "virtgpu_drv.h"
> @@ -80,7 +81,7 @@ static int virtio_gpu_map_ioctl(struct drm_device *dev, void *data,
>  	struct virtio_gpu_device *vgdev = dev->dev_private;
>  	struct drm_virtgpu_map *virtio_gpu_map = data;
>  
> -	return virtio_gpu_mode_dumb_mmap(file, vgdev->ddev,
> +	return drm_gem_dumb_map_offset(file, vgdev->ddev,
>  					 virtio_gpu_map->handle,
>  					 &virtio_gpu_map->offset);
>  }

Please remove obsoleted virtio_gpu_mode_dumb_mmap() prototype from
virtgpu_drv.h

Otherwise patch looks good.

-- 
Best regards,
Dmitry

