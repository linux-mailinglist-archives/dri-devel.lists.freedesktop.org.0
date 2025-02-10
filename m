Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CF9A2EC68
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 13:23:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8409510E4FE;
	Mon, 10 Feb 2025 12:23:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="J7PsWrE8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24BCD10E516
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 12:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+NiY+ixs91EHQR2WgaoD/CErzRjNV8cXWlDAVc4ZbpI=; b=J7PsWrE802VaedbFVuoCz+vCH+
 xsjxV8uPaY9/ovKx2kwvF1vFylLTGpSDKUTmYbDgpZ7WBDIAA6B5gp1BJopCvUAS3JsNs1js+VJxY
 aSCuLmou2HjdgNjDt7dK3jq9J/e79G5r5k7h6tMSbp24L9txErLhGtRYsWCF4tDZl8CsPyK0CqsHu
 cPBJvIDqCu5vK4tR8vIV+g2z8ozfEj0rewlyq+9tTiMP9PNs8jVVO9LkkH7Gcb9a6bWgqJlHd/LTV
 K62CbQzJp/bnGWAkeB0CEQZjGBPHFu8t3x7nOYHU8okxTfN1dTzCzmMXoIjB8t6CaTPeUxTM8VGsh
 SRbjcHzw==;
Received: from [187.36.213.55] (helo=[192.168.1.103])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1thSor-007F0J-SK; Mon, 10 Feb 2025 13:23:28 +0100
Message-ID: <e1bd620c-a5d7-47f8-bc07-c41418c0c34c@igalia.com>
Date: Mon, 10 Feb 2025 09:23:21 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/v3d: Add clock handling
To: Stefan Wahren <wahrenst@gmx.net>, Melissa Wen <mwen@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, kernel-list@raspberrypi.com
References: <20250201125046.33030-1-wahrenst@gmx.net>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20250201125046.33030-1-wahrenst@gmx.net>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stefan,

Thanks for your patch!

On 01/02/25 09:50, Stefan Wahren wrote:
> Since the initial commit 57692c94dcbe ("drm/v3d: Introduce a new DRM driver
> for Broadcom V3D V3.x+") the struct v3d_dev reserved a pointer for
> an optional V3D clock. But there wasn't any code, which fetched it.
> So add the missing clock handling before accessing any V3D registers.

Actually, I believe we should remove `v3d->clk`. In the past, we used
`v3d->clk` for PM management, but we removed PM management a while ago
(it was somewhat broken).

I believe the best move would be to remove `v3d->clk`. If we decide to
use the clock at some point, we can reintroduce the variable to the
struct. Right now, it doesn't make sense to add clock handling if we
don't use it.

Let me know if you have any use case for this variable. If you have,
then we can add clock handling.

Best Regards,
- Maíra

> 
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> ---
>   drivers/gpu/drm/v3d/v3d_drv.c | 25 ++++++++++++++++++++-----
>   1 file changed, 20 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
> index 930737a9347b..852015214e97 100644
> --- a/drivers/gpu/drm/v3d/v3d_drv.c
> +++ b/drivers/gpu/drm/v3d/v3d_drv.c
> @@ -295,11 +295,21 @@ static int v3d_platform_drm_probe(struct platform_device *pdev)
>   	if (ret)
>   		return ret;
> 
> +	v3d->clk = devm_clk_get_optional(dev, NULL);
> +	if (IS_ERR(v3d->clk))
> +		return dev_err_probe(dev, PTR_ERR(v3d->clk), "Failed to get V3D clock\n");
> +
> +	ret = clk_prepare_enable(v3d->clk);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Couldn't enable the V3D clock\n");
> +		return ret;
> +	}
> +
>   	mmu_debug = V3D_READ(V3D_MMU_DEBUG_INFO);
>   	mask = DMA_BIT_MASK(30 + V3D_GET_FIELD(mmu_debug, V3D_MMU_PA_WIDTH));
>   	ret = dma_set_mask_and_coherent(dev, mask);
>   	if (ret)
> -		return ret;
> +		goto clk_disable;
> 
>   	v3d->va_width = 30 + V3D_GET_FIELD(mmu_debug, V3D_MMU_VA_WIDTH);
> 
> @@ -319,28 +329,29 @@ static int v3d_platform_drm_probe(struct platform_device *pdev)
>   		ret = PTR_ERR(v3d->reset);
> 
>   		if (ret == -EPROBE_DEFER)
> -			return ret;
> +			goto clk_disable;
> 
>   		v3d->reset = NULL;
>   		ret = map_regs(v3d, &v3d->bridge_regs, "bridge");
>   		if (ret) {
>   			dev_err(dev,
>   				"Failed to get reset control or bridge regs\n");
> -			return ret;
> +			goto clk_disable;
>   		}
>   	}
> 
>   	if (v3d->ver < 41) {
>   		ret = map_regs(v3d, &v3d->gca_regs, "gca");
>   		if (ret)
> -			return ret;
> +			goto clk_disable;
>   	}
> 
>   	v3d->mmu_scratch = dma_alloc_wc(dev, 4096, &v3d->mmu_scratch_paddr,
>   					GFP_KERNEL | __GFP_NOWARN | __GFP_ZERO);
>   	if (!v3d->mmu_scratch) {
>   		dev_err(dev, "Failed to allocate MMU scratch page\n");
> -		return -ENOMEM;
> +		ret = -ENOMEM;
> +		goto clk_disable;
>   	}
> 
>   	ret = v3d_gem_init(drm);
> @@ -369,6 +380,8 @@ static int v3d_platform_drm_probe(struct platform_device *pdev)
>   	v3d_gem_destroy(drm);
>   dma_free:
>   	dma_free_wc(dev, 4096, v3d->mmu_scratch, v3d->mmu_scratch_paddr);
> +clk_disable:
> +	clk_disable_unprepare(v3d->clk);
>   	return ret;
>   }
> 
> @@ -386,6 +399,8 @@ static void v3d_platform_drm_remove(struct platform_device *pdev)
> 
>   	dma_free_wc(v3d->drm.dev, 4096, v3d->mmu_scratch,
>   		    v3d->mmu_scratch_paddr);
> +
> +	clk_disable_unprepare(v3d->clk);
>   }
> 
>   static struct platform_driver v3d_platform_driver = {
> --
> 2.34.1
> 

