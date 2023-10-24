Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 689CC7D4A7B
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 10:38:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E61BB10E2FB;
	Tue, 24 Oct 2023 08:37:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6444110E081
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 08:37:49 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 325426607331;
 Tue, 24 Oct 2023 09:37:47 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1698136668;
 bh=VjoK/UpW7x3c/luSkS5Ar1F1xcKYV0zP1oysQkO4Dqo=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=om24qMicEbGsV7OOOh0R08uWayYYF0H4/nMVQInkmy08Ep6Xw1NPbr1Kbt2q7K9fa
 8Nal+lKJG6W5251Z0kFwHVY3G+uxDb5AjHVcfJYuMIh7nR9LHJLi1Eom2s/G1xoI0b
 5HkK5MwBExvVorp9LgpWz2cme25fkU3uXpcAs7wNuawEvNXH6V5KFm1uHAKz0z0Odr
 LZ0Dqnik6LQMcu76qopqCwPOX5G8hzcPvYQqEu5SNMwlXL0RulhsUZOacYJQEuRQZ+
 E0HBZPy9dhd8x7AXe0JZGq+UU29Rqy++qQMGD4RHjJYajHDrYT9x8C2g5LCR9QTtwA
 1Tckojwl7l2eg==
Message-ID: <654f22f8-5070-4064-bcc3-5259345e4ca8@collabora.com>
Date: Tue, 24 Oct 2023 10:37:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 01/11] drm/mediatek: Add interface to allocate MediaTek
 GEM buffer.
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <20231023044549.21412-1-jason-jh.lin@mediatek.com>
 <20231023044549.21412-2-jason-jh.lin@mediatek.com>
Content-Language: en-US
In-Reply-To: <20231023044549.21412-2-jason-jh.lin@mediatek.com>
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
Cc: Jeffrey Kardatzke <jkardatzke@google.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Singo Chang <singo.chang@mediatek.com>,
 Nicolas Boichat <drinkcat@chromium.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Jason-ch Chen <jason-ch.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 linux-mediatek@lists.infradead.org, Shawn Sung <shawn.sung@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 23/10/23 06:45, Jason-JH.Lin ha scritto:
> From: CK Hu <ck.hu@mediatek.com>
> 
> Add an interface to allocate MediaTek GEM buffers, allow the IOCTLs
> to be used by render nodes.
> This patch also sets the RENDER driver feature.
> 
> Signed-off-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> Reviewed-by: Daniel Kurtz <djkurtz@chromium.org>
> Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>
> Tested-by: Daniel Kurtz <djkurtz@chromium.org>
> Tested-by: Pi-Hsun Shih <pihsun@chromium.org>
> 
> ---
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c | 13 ++++++
>   drivers/gpu/drm/mediatek/mtk_drm_gem.c | 39 +++++++++++++++++
>   drivers/gpu/drm/mediatek/mtk_drm_gem.h | 12 ++++++
>   include/uapi/drm/mediatek_drm.h        | 58 ++++++++++++++++++++++++++
>   4 files changed, 122 insertions(+)
>   create mode 100644 include/uapi/drm/mediatek_drm.h
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index 93552d76b6e7..e3e9dbdf265b 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -24,6 +24,7 @@
>   #include <drm/drm_of.h>
>   #include <drm/drm_probe_helper.h>
>   #include <drm/drm_vblank.h>
> +#include <drm/mediatek_drm.h>
>   
>   #include "mtk_drm_crtc.h"
>   #include "mtk_drm_ddp_comp.h"
> @@ -541,6 +542,14 @@ static void mtk_drm_kms_deinit(struct drm_device *drm)
>   	component_unbind_all(drm->dev, drm);
>   }
>   
> +static const struct drm_ioctl_desc mtk_ioctls[] = {
> +	DRM_IOCTL_DEF_DRV(MTK_GEM_CREATE, mtk_gem_create_ioctl,
> +			  DRM_UNLOCKED | DRM_AUTH | DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF_DRV(MTK_GEM_MAP_OFFSET,
> +			  mtk_gem_map_offset_ioctl,
> +			  DRM_UNLOCKED | DRM_AUTH | DRM_RENDER_ALLOW),
> +};
> +
>   DEFINE_DRM_GEM_FOPS(mtk_drm_fops);
>   
>   /*
> @@ -562,6 +571,10 @@ static const struct drm_driver mtk_drm_driver = {
>   
>   	.gem_prime_import = mtk_drm_gem_prime_import,
>   	.gem_prime_import_sg_table = mtk_gem_prime_import_sg_table,
> +
> +	.ioctls = mtk_ioctls,
> +	.num_ioctls = ARRAY_SIZE(mtk_ioctls),
> +
>   	.fops = &mtk_drm_fops,
>   
>   	.name = DRIVER_NAME,
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> index 9f364df52478..bcce723f257d 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> @@ -4,6 +4,7 @@
>    */
>   
>   #include <linux/dma-buf.h>
> +#include <drm/mediatek_drm.h>
>   
>   #include <drm/drm.h>
>   #include <drm/drm_device.h>
> @@ -272,3 +273,41 @@ void mtk_drm_gem_prime_vunmap(struct drm_gem_object *obj,
>   	mtk_gem->kvaddr = NULL;
>   	kfree(mtk_gem->pages);
>   }
> +
> +int mtk_gem_map_offset_ioctl(struct drm_device *drm, void *data,
> +			     struct drm_file *file_priv)
> +{
> +	struct drm_mtk_gem_map_off *args = data;
> +
> +	return drm_gem_dumb_map_offset(file_priv, drm, args->handle,
> +				       &args->offset);
> +}
> +
> +int mtk_gem_create_ioctl(struct drm_device *dev, void *data,
> +			 struct drm_file *file_priv)
> +{
> +	struct mtk_drm_gem_obj *mtk_gem;
> +	struct drm_mtk_gem_create *args = data;
> +	int ret;
> +
> +	mtk_gem = mtk_drm_gem_create(dev, args->size, false);
> +	if (IS_ERR(mtk_gem))
> +		return PTR_ERR(mtk_gem);
> +
> +	/*
> +	 * allocate a id of idr table where the obj is registered
> +	 * and handle has the id what user can see.
> +	 */
> +	ret = drm_gem_handle_create(file_priv, &mtk_gem->base, &args->handle);
> +	if (ret)
> +		goto err_handle_create;
> +
> +	/* drop reference from allocate - handle holds it now. */
> +	drm_gem_object_put(&mtk_gem->base);
> +
> +	return 0;
> +
> +err_handle_create:
> +	mtk_drm_gem_free_object(&mtk_gem->base);
> +	return ret;
> +}
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.h b/drivers/gpu/drm/mediatek/mtk_drm_gem.h
> index 78f23b07a02e..90f3d2916ec5 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_gem.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.h
> @@ -46,4 +46,16 @@ int mtk_drm_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map);
>   void mtk_drm_gem_prime_vunmap(struct drm_gem_object *obj,
>   			      struct iosys_map *map);
>   
> +/*
> + * request gem object creation and buffer allocation as the size
> + * that it is calculated with framebuffer information such as width,
> + * height and bpp.
> + */
> +int mtk_gem_create_ioctl(struct drm_device *dev, void *data,
> +			 struct drm_file *file_priv);
> +
> +/* get buffer offset to map to user space. */
> +int mtk_gem_map_offset_ioctl(struct drm_device *dev, void *data,
> +			     struct drm_file *file_priv);
> +
>   #endif
> diff --git a/include/uapi/drm/mediatek_drm.h b/include/uapi/drm/mediatek_drm.h
> new file mode 100644
> index 000000000000..c050de320a84
> --- /dev/null
> +++ b/include/uapi/drm/mediatek_drm.h
> @@ -0,0 +1,58 @@
> +/* SPDX-License-Identifier: GPL-2.0+ WITH Linux-syscall-note */
> +/*
> + * Copyright (c) 2015 MediaTek Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#ifndef _UAPI_MEDIATEK_DRM_H
> +#define _UAPI_MEDIATEK_DRM_H
> +
> +#include <drm/drm.h>
> +
> +/**
> + * User-desired buffer creation information structure.

You're almost there.... Read:

https://docs.kernel.org/doc-guide/kernel-doc.html#structure-union-and-enumeration-documentation

Regards,
Angelo

