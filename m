Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC31146301
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2020 09:06:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E2446F9C8;
	Thu, 23 Jan 2020 08:06:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 291466F9C8
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2020 08:06:26 +0000 (UTC)
Received: from ip092042140082.rev.nessus.at ([92.42.140.82] helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <heiko@sntech.de>)
 id 1iuXVN-0004gu-Fu; Thu, 23 Jan 2020 09:06:21 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Ezequiel Garcia <ezequiel@collabora.com>
Subject: Re: [PATCH] drm/rockchip: Add GEM create ioctl support
Date: Thu, 23 Jan 2020 09:06:20 +0100
Message-ID: <2150585.39Qbo98K5S@phil>
In-Reply-To: <20200122190855.20385-1-ezequiel@collabora.com>
References: <20200122190855.20385-1-ezequiel@collabora.com>
MIME-Version: 1.0
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
Cc: Douglas Anderson <dianders@chromium.org>, David Airlie <airlied@linux.ie>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org, Mark Yao <mark.yao@rock-chips.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ezquiel,

Am Mittwoch, 22. Januar 2020, 20:08:55 CET schrieb Ezequiel Garcia:
> From: Mark Yao <mark.yao@rock-chips.com>
> 
> Add driver-specific GEM create/offset ioctls, to allow users
> to create objects of arbitrary size.
> 
> These are required to allocate buffers to be shared with
> video decoder block, with hardware-specific needs such as
> macroblock alignment and extra room for motion vectors.

Previously the use of this ioctl was to allow a custom xserver
to allocate memory to hand over to a binary mali blob for rendering.
The counter argument was that these dumb buffer should not be
rendered into at all.

Nowadays we have prime for buffer sharing between display ip
and 3d-renderer, and somehow this seems to work also with
binary blobs via libgbm or so. Not sure how this behaves with X11
though but at least up to wayland that seems to work, so in current
display pipelines there doesn't seem to be a need for such an ioctl
anymore.

So I guess my question to understand this is, shouldn't there be
something similar done when sharing buffers with a video decoder?
Instead of userspace requesting a buffer and then handing it to
the hardware video decoder?

Thanks
Heiko

> Signed-off-by: Mark Yao <mark.yao@rock-chips.com>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  drivers/gpu/drm/rockchip/rockchip_drm_drv.c | 11 ++++
>  drivers/gpu/drm/rockchip/rockchip_drm_gem.c | 21 +++++++
>  drivers/gpu/drm/rockchip/rockchip_drm_gem.h | 13 +++++
>  include/uapi/drm/rockchip_drm.h             | 61 +++++++++++++++++++++
>  4 files changed, 106 insertions(+)
>  create mode 100644 include/uapi/drm/rockchip_drm.h
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> index ca12a35483f9..bd35a0b1aa5a 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> @@ -22,6 +22,7 @@
>  #include <drm/drm_of.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_vblank.h>
> +#include <drm/rockchip_drm.h>
>  
>  #include "rockchip_drm_drv.h"
>  #include "rockchip_drm_fb.h"
> @@ -206,6 +207,14 @@ static void rockchip_drm_unbind(struct device *dev)
>  	drm_dev_put(drm_dev);
>  }
>  
> +static const struct drm_ioctl_desc rockchip_ioctls[] = {
> +	DRM_IOCTL_DEF_DRV(ROCKCHIP_GEM_CREATE, rockchip_gem_create_ioctl,
> +			  DRM_UNLOCKED | DRM_AUTH),
> +	DRM_IOCTL_DEF_DRV(ROCKCHIP_GEM_MAP_OFFSET,
> +			  rockchip_gem_map_offset_ioctl,
> +			  DRM_UNLOCKED | DRM_AUTH),
> +};
> +
>  static const struct file_operations rockchip_drm_driver_fops = {
>  	.owner = THIS_MODULE,
>  	.open = drm_open,
> @@ -230,6 +239,8 @@ static struct drm_driver rockchip_drm_driver = {
>  	.gem_prime_vmap		= rockchip_gem_prime_vmap,
>  	.gem_prime_vunmap	= rockchip_gem_prime_vunmap,
>  	.gem_prime_mmap		= rockchip_gem_mmap_buf,
> +	.ioctls			= rockchip_ioctls,
> +	.num_ioctls		= ARRAY_SIZE(rockchip_ioctls),
>  	.fops			= &rockchip_drm_driver_fops,
>  	.name	= DRIVER_NAME,
>  	.desc	= DRIVER_DESC,
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
> index 0d1884684dcb..315fa67d5668 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
> @@ -12,6 +12,7 @@
>  #include <drm/drm_gem.h>
>  #include <drm/drm_prime.h>
>  #include <drm/drm_vma_manager.h>
> +#include <drm/rockchip_drm.h>
>  
>  #include "rockchip_drm_drv.h"
>  #include "rockchip_drm_gem.h"
> @@ -428,6 +429,26 @@ int rockchip_gem_dumb_create(struct drm_file *file_priv,
>  	return PTR_ERR_OR_ZERO(rk_obj);
>  }
>  
> +int rockchip_gem_map_offset_ioctl(struct drm_device *drm, void *data,
> +				  struct drm_file *file_priv)
> +{
> +	struct drm_rockchip_gem_map_off *args = data;
> +
> +	return drm_gem_dumb_map_offset(file_priv, drm, args->handle,
> +				       &args->offset);
> +}
> +
> +int rockchip_gem_create_ioctl(struct drm_device *dev, void *data,
> +			      struct drm_file *file_priv)
> +{
> +	struct drm_rockchip_gem_create *args = data;
> +	struct rockchip_gem_object *rk_obj;
> +
> +	rk_obj = rockchip_gem_create_with_handle(file_priv, dev, args->size,
> +						 &args->handle);
> +	return PTR_ERR_OR_ZERO(rk_obj);
> +}
> +
>  /*
>   * Allocate a sg_table for this GEM object.
>   * Note: Both the table's contents, and the sg_table itself must be freed by
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_gem.h b/drivers/gpu/drm/rockchip/rockchip_drm_gem.h
> index 7ffc541bea07..87fe58b05bf6 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_gem.h
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_gem.h
> @@ -50,4 +50,17 @@ void rockchip_gem_free_object(struct drm_gem_object *obj);
>  int rockchip_gem_dumb_create(struct drm_file *file_priv,
>  			     struct drm_device *dev,
>  			     struct drm_mode_create_dumb *args);
> +
> +/*
> + * request gem object creation and buffer allocation as the size
> + * that it is calculated with framebuffer information such as width,
> + * height and bpp.
> + */
> +int rockchip_gem_create_ioctl(struct drm_device *dev, void *data,
> +			      struct drm_file *file_priv);
> +
> +/* get buffer offset to map to user space. */
> +int rockchip_gem_map_offset_ioctl(struct drm_device *dev, void *data,
> +				  struct drm_file *file_priv);
> +
>  #endif /* _ROCKCHIP_DRM_GEM_H */
> diff --git a/include/uapi/drm/rockchip_drm.h b/include/uapi/drm/rockchip_drm.h
> new file mode 100644
> index 000000000000..3185f72f36b9
> --- /dev/null
> +++ b/include/uapi/drm/rockchip_drm.h
> @@ -0,0 +1,61 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +/*
> + * Copyright (c) Fuzhou Rockchip Electronics Co.Ltd
> + * Authors:
> + *       Mark Yao <yzq@rock-chips.com>
> + *
> + * base on exynos_drm.h
> + */
> +
> +#ifndef _ROCKCHIP_DRM_H
> +#define _ROCKCHIP_DRM_H
> +
> +#include <drm/drm.h>
> +
> +#if defined(__cplusplus)
> +extern "C" {
> +#endif
> +
> +/**
> + * User-desired buffer creation information structure.
> + *
> + * @size: user-desired memory allocation size.
> + * @flags: user request for setting memory type or cache attributes.
> + * @handle: returned a handle to created gem object.
> + *     - this handle will be set by gem module of kernel side.
> + */
> +struct drm_rockchip_gem_create {
> +	uint64_t size;
> +	uint32_t flags;
> +	uint32_t handle;
> +};
> +
> +/**
> + * A structure for getting buffer offset.
> + *
> + * @handle: a pointer to gem object created.
> + * @pad: just padding to be 64-bit aligned.
> + * @offset: relatived offset value of the memory region allocated.
> + *     - this value should be set by user.
> + */
> +struct drm_rockchip_gem_map_off {
> +	uint32_t handle;
> +	uint32_t pad;
> +	uint64_t offset;
> +};
> +
> +#define DRM_ROCKCHIP_GEM_CREATE		0x00
> +#define DRM_ROCKCHIP_GEM_MAP_OFFSET	0x01
> +
> +#define DRM_IOCTL_ROCKCHIP_GEM_CREATE	DRM_IOWR(DRM_COMMAND_BASE + \
> +		DRM_ROCKCHIP_GEM_CREATE, struct drm_rockchip_gem_create)
> +
> +#define DRM_IOCTL_ROCKCHIP_GEM_MAP_OFFSET	DRM_IOWR(DRM_COMMAND_BASE + \
> +		DRM_ROCKCHIP_GEM_MAP_OFFSET, struct drm_rockchip_gem_map_off)
> +
> +#if defined(__cplusplus)
> +}
> +#endif
> +
> +#endif /* _ROCKCHIP_DRM_H */
> 




_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
