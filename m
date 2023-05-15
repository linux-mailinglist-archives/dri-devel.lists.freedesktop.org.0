Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E531570398B
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 19:43:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D72310E0CC;
	Mon, 15 May 2023 17:43:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay1-1.pub.mailoutpod2-cph3.one.com
 (mailrelay1-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:400::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D8A610E0CC
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 17:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=fqvFeHqmKCMHySPrpw7LmvcOX8WEkqN8R0ZmmJ8wedU=;
 b=LuflRTNROY0CD/SiMRa00x4NM6Ba/5KTNjWTIw8iM/ymbOPFU7XTgc6q5gyZ/RxhcGu3BdwMovzCp
 jkO2iHve1fpUDPs5+9sEyMW9owAADTy0xdwPW0I7B6mFXa8uI7kYxnTSgBbw5MbodbHGNWpUka4U21
 7h4mUNZZX/nMZg5diOgd58PYk8p/9e90AdYpUcl38rMb+77YaK9AcriBKJ5UvxbVNk7QjI4MPHaVyF
 s+s7BzbpNWkYsKbeS7jVjPPHWkqG4Mb0166SVe8vsZWwNVVX/aHNDon2Im1qM6q5MFmwgr1q7CV7Lj
 I89SkTPK+tfPo/g4wL5kRwP0R5bKAxA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=fqvFeHqmKCMHySPrpw7LmvcOX8WEkqN8R0ZmmJ8wedU=;
 b=m5Ru3cp+fr+MYVaiT66lh06RTG0M0Yo3MAHPI8gz+3ae51FIPn6TF9LZlN4ODMpJHOnJ+Mwz6Vd71
 GaCU+trDA==
X-HalOne-ID: fb2cb6b5-f347-11ed-8278-99461c6a3fe8
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay1 (Halon) with ESMTPSA
 id fb2cb6b5-f347-11ed-8278-99461c6a3fe8;
 Mon, 15 May 2023 17:43:22 +0000 (UTC)
Date: Mon, 15 May 2023 19:43:20 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 03/12] drm/exynos: Use regular fbdev I/O helpers
Message-ID: <20230515174320.GA1745913@ravnborg.org>
References: <20230515094033.2133-1-tzimmermann@suse.de>
 <20230515094033.2133-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230515094033.2133-4-tzimmermann@suse.de>
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
Cc: freedreno@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 Alim Akhtar <alim.akhtar@samsung.com>, amd-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 javierm@redhat.com, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 Kyungmin Park <kyungmin.park@samsung.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Mon, May 15, 2023 at 11:40:24AM +0200, Thomas Zimmermann wrote:
> Use the regular fbdev helpers for framebuffer I/O instead of DRM's
> helpers. Exynos does not use damage handling, so DRM's fbdev helpers
> are mere wrappers around the fbdev code.
> 
> By using fbdev helpers directly within each DRM fbdev emulation,
> we can eventually remove DRM's wrapper functions entirely.
> 
> v2:
> 	* use FB_IO_HELPERS option
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Inki Dae <inki.dae@samsung.com>
> Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Cc: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  drivers/gpu/drm/exynos/Kconfig            |  1 +
>  drivers/gpu/drm/exynos/Makefile           |  2 +-
>  drivers/gpu/drm/exynos/exynos_drm_fbdev.c | 10 +++++-----
>  3 files changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
> index 0cb92d651ff1..7ca7e1dab52c 100644
> --- a/drivers/gpu/drm/exynos/Kconfig
> +++ b/drivers/gpu/drm/exynos/Kconfig
> @@ -7,6 +7,7 @@ config DRM_EXYNOS
>  	select DRM_DISPLAY_HELPER if DRM_EXYNOS_DP
>  	select DRM_KMS_HELPER
>  	select VIDEOMODE_HELPERS
> +	select FB_IO_HELPERS if DRM_FBDEV_EMULATION
>  	select SND_SOC_HDMI_CODEC if SND_SOC
>  	help
>  	  Choose this option if you have a Samsung SoC Exynos chipset.
> diff --git a/drivers/gpu/drm/exynos/Makefile b/drivers/gpu/drm/exynos/Makefile
> index 2fd2f3ee4fcf..233a66036584 100644
> --- a/drivers/gpu/drm/exynos/Makefile
> +++ b/drivers/gpu/drm/exynos/Makefile
> @@ -6,7 +6,6 @@
>  exynosdrm-y := exynos_drm_drv.o exynos_drm_crtc.o exynos_drm_fb.o \
>  		exynos_drm_gem.o exynos_drm_plane.o exynos_drm_dma.o
>  
> -exynosdrm-$(CONFIG_DRM_FBDEV_EMULATION) += exynos_drm_fbdev.o
>  exynosdrm-$(CONFIG_DRM_EXYNOS_FIMD)	+= exynos_drm_fimd.o
>  exynosdrm-$(CONFIG_DRM_EXYNOS5433_DECON)	+= exynos5433_drm_decon.o
>  exynosdrm-$(CONFIG_DRM_EXYNOS7_DECON)	+= exynos7_drm_decon.o
> @@ -23,5 +22,6 @@ exynosdrm-$(CONFIG_DRM_EXYNOS_ROTATOR)	+= exynos_drm_rotator.o
>  exynosdrm-$(CONFIG_DRM_EXYNOS_SCALER)	+= exynos_drm_scaler.o
>  exynosdrm-$(CONFIG_DRM_EXYNOS_GSC)	+= exynos_drm_gsc.o
>  exynosdrm-$(CONFIG_DRM_EXYNOS_MIC)     += exynos_drm_mic.o
> +exynosdrm-$(CONFIG_DRM_FBDEV_EMULATION)	+= exynos_drm_fbdev.o
What does this change do?
Maybe something that was left by accident?

	Sam

>  
>  obj-$(CONFIG_DRM_EXYNOS)		+= exynosdrm.o
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> index ea4b3d248aac..b3333dd1d087 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> @@ -8,6 +8,8 @@
>   *	Seung-Woo Kim <sw0312.kim@samsung.com>
>   */
>  
> +#include <linux/fb.h>
> +
>  #include <drm/drm_crtc_helper.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_fb_helper.h>
> @@ -49,11 +51,9 @@ static const struct fb_ops exynos_drm_fb_ops = {
>  	.owner		= THIS_MODULE,
>  	DRM_FB_HELPER_DEFAULT_OPS,
>  	.fb_mmap        = exynos_drm_fb_mmap,
> -	.fb_read	= drm_fb_helper_cfb_read,
> -	.fb_write	= drm_fb_helper_cfb_write,
> -	.fb_fillrect	= drm_fb_helper_cfb_fillrect,
> -	.fb_copyarea	= drm_fb_helper_cfb_copyarea,
> -	.fb_imageblit	= drm_fb_helper_cfb_imageblit,
> +	.fb_fillrect	= cfb_fillrect,
> +	.fb_copyarea	= cfb_copyarea,
> +	.fb_imageblit	= cfb_imageblit,
>  	.fb_destroy	= exynos_drm_fb_destroy,
>  };
>  
> -- 
> 2.40.1
