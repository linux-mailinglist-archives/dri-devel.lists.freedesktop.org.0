Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B629890261
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 15:56:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 049D2112473;
	Thu, 28 Mar 2024 14:56:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="cxVypfiA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A51F0112473
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 14:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1711637761;
 bh=5NsJx8hBJTJXN179nVNOCuTTsF0ALFUhXWTVlzdvgnw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=cxVypfiA73QPdkGEZRRXSgr/gGtfvh6YPPGH7X/rE6eVF26ylRE1ebw63SCW76aFp
 7l7rNhrdeg68yxRCLqBck30+apQsP22ySGjYkcgu4G6ncls0QDkHMbv/ZGHgdt6NQM
 rMoiMTSCZ64uxGsoTfJHjPr+C1HwTC3zRRoqob9aUfnD7tIbxsqUT56ObLlSH7AzwG
 QAs9sK/x+gCrJ+7kZHm5uF1V+R7Lqg5dMQzB54chBb3mpIMh71Ks++jrIeJ+MY4ny3
 cSL1lNnuv4RJbjCXBDESHkjFfBagFbGKIakq8c5M9KhT82xnb9P4E5gRHBzJctsJsd
 K4UAakGoy8s5w==
Received: from [100.109.49.129] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id DC396378211C;
 Thu, 28 Mar 2024 14:55:59 +0000 (UTC)
Message-ID: <5be72075-cdf5-4143-a280-fd9620b97201@collabora.com>
Date: Thu, 28 Mar 2024 17:55:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/43] drm/virtio: Use fbdev-shmem
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, deller@gmx.de, javierm@redhat.com
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>
References: <20240312154834.26178-1-tzimmermann@suse.de>
 <20240312154834.26178-20-tzimmermann@suse.de>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20240312154834.26178-20-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/12/24 18:45, Thomas Zimmermann wrote:
> Implement fbdev emulation with fbdev-shmem. Avoids the overhead of
> fbdev-generic's additional shadow buffering. No functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Gurchetan Singh <gurchetansingh@chromium.org>
> Cc: Chia-I Wu <olvaffe@gmail.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_drv.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
> index 9539aa28937fa..3d626bbaab9e4 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
> @@ -35,7 +35,7 @@
>  #include <drm/drm_aperture.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_drv.h>
> -#include <drm/drm_fbdev_generic.h>
> +#include <drm/drm_fbdev_shmem.h>
>  #include <drm/drm_file.h>
>  
>  #include "virtgpu_drv.h"
> @@ -103,7 +103,7 @@ static int virtio_gpu_probe(struct virtio_device *vdev)
>  	if (ret)
>  		goto err_deinit;
>  
> -	drm_fbdev_generic_setup(vdev->priv, 32);
> +	drm_fbdev_shmem_setup(vdev->priv, 32);
>  	return 0;
>  
>  err_deinit:

Tested-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry

