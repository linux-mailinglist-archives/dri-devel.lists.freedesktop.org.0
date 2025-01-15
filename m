Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29883A11824
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 04:57:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47E4910E4AF;
	Wed, 15 Jan 2025 03:57:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="teidT1Fw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 392 seconds by postgrey-1.36 at gabe;
 Wed, 15 Jan 2025 03:57:13 UTC
Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com
 [91.218.175.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D698A10E4AE;
 Wed, 15 Jan 2025 03:57:13 +0000 (UTC)
Message-ID: <078ddd52-1d04-4aad-935a-67c12ebf569a@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1736913034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jVhN80lSe9/RJE7xTb/gBfGOBNDnLQWNn0HdoXTdJX4=;
 b=teidT1Fw63fY1UplJo7A5bi9iE7QpymiDozRtg4zga+cfodcNKCHBs5xeOi588P6Xgf2QP
 CYp1SqpJZNtGd/fHLlyHIgbHFs46Z3aoqpduhurkaP+sGXJgpt1fvAeSbcUUllSz8kx3vA
 np+KZYyxC2PBSgowDFD5qMH7M7wgWl8=
Date: Wed, 15 Jan 2025 11:50:20 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v2 11/25] drm/loongson: Compute dumb-buffer sizes with
 drm_mode_size_dumb()
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 nouveau@lists.freedesktop.org, virtualization@lists.linux.dev,
 spice-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
 intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 Sui Jingfeng <suijingfeng@loongson.cn>
References: <20250109150310.219442-1-tzimmermann@suse.de>
 <20250109150310.219442-12-tzimmermann@suse.de>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20250109150310.219442-12-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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

Hi,

On 2025/1/9 22:57, Thomas Zimmermann wrote:
> Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and
> buffer size. Align the pitch according to hardware requirements.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Sui Jingfeng <suijingfeng@loongson.cn>
> Cc: Sui Jingfeng <sui.jingfeng@linux.dev>


Reviewed-by: Sui Jingfeng <sui.jingfeng@linux.dev>


> ---
>   drivers/gpu/drm/loongson/lsdc_gem.c | 29 ++++++++---------------------
>   1 file changed, 8 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/gpu/drm/loongson/lsdc_gem.c b/drivers/gpu/drm/loongson/lsdc_gem.c
> index a720d8f53209..9f982b85301f 100644
> --- a/drivers/gpu/drm/loongson/lsdc_gem.c
> +++ b/drivers/gpu/drm/loongson/lsdc_gem.c
> @@ -6,6 +6,7 @@
>   #include <linux/dma-buf.h>
>   
>   #include <drm/drm_debugfs.h>
> +#include <drm/drm_dumb_buffers.h>
>   #include <drm/drm_file.h>
>   #include <drm/drm_gem.h>
>   #include <drm/drm_prime.h>
> @@ -204,45 +205,31 @@ int lsdc_dumb_create(struct drm_file *file, struct drm_device *ddev,
>   	const struct lsdc_desc *descp = ldev->descp;
>   	u32 domain = LSDC_GEM_DOMAIN_VRAM;
>   	struct drm_gem_object *gobj;
> -	size_t size;
> -	u32 pitch;
> -	u32 handle;
>   	int ret;
>   
> -	if (!args->width || !args->height)
> -		return -EINVAL;
> -
> -	if (args->bpp != 32 && args->bpp != 16)
> -		return -EINVAL;
> -
> -	pitch = args->width * args->bpp / 8;
> -	pitch = ALIGN(pitch, descp->pitch_align);
> -	size = pitch * args->height;
> -	size = ALIGN(size, PAGE_SIZE);
> +	ret = drm_mode_size_dumb(ddev, args, descp->pitch_align, 0);
> +	if (ret)
> +		return ret;
>   
>   	/* Maximum single bo size allowed is the half vram size available */
> -	if (size > ldev->vram_size / 2) {
> -		drm_err(ddev, "Requesting(%zuMiB) failed\n", size >> 20);
> +	if (args->size > ldev->vram_size / 2) {
> +		drm_err(ddev, "Requesting(%zuMiB) failed\n", (size_t)(args->size >> PAGE_SHIFT));
>   		return -ENOMEM;
>   	}
>   
> -	gobj = lsdc_gem_object_create(ddev, domain, size, false, NULL, NULL);
> +	gobj = lsdc_gem_object_create(ddev, domain, args->size, false, NULL, NULL);
>   	if (IS_ERR(gobj)) {
>   		drm_err(ddev, "Failed to create gem object\n");
>   		return PTR_ERR(gobj);
>   	}
>   
> -	ret = drm_gem_handle_create(file, gobj, &handle);
> +	ret = drm_gem_handle_create(file, gobj, &args->handle);
>   
>   	/* drop reference from allocate, handle holds it now */
>   	drm_gem_object_put(gobj);
>   	if (ret)
>   		return ret;
>   
> -	args->pitch = pitch;
> -	args->size = size;
> -	args->handle = handle;
> -
>   	return 0;
>   }
>   

-- 
Best regards,
Sui

