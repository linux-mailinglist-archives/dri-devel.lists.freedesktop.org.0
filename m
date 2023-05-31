Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D37F87179E2
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 10:20:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30CF410E493;
	Wed, 31 May 2023 08:20:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CC4110E491;
 Wed, 31 May 2023 08:20:31 +0000 (UTC)
Received: from [192.168.88.20] (91-154-35-171.elisa-laajakaista.fi
 [91.154.35.171])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id AB62D7FC;
 Wed, 31 May 2023 10:20:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1685521207;
 bh=EL3RWdaIqfPKhp0EXpVPxPCT9ntFr8tTKWXlYphupWI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=MvSXDrHk7T4BnPJqHjbFiTX+4V0oyXpM4JlCJJT+bzOMxSOycyjTIr/UAfnt1xezv
 qzMGM+1MWvguHV2odb3hKaYoA6dxUihmMViSPeeHPMA04EyWI4cWEcnv/H7riWMXBY
 LXCYZwLPo9seo/aN3CtoiK5GheRzH+ZTTqCtxMHI=
Message-ID: <c4146861-3e8c-7410-4fec-27e7bce7e2de@ideasonboard.com>
Date: Wed, 31 May 2023 11:20:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v5 08/13] drm/omapdrm: Use regular fbdev I/O helpers
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 javierm@redhat.com, sam@ravnborg.org, suijingfeng@loongson.cn
References: <20230530150253.22758-1-tzimmermann@suse.de>
 <20230530150253.22758-9-tzimmermann@suse.de>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230530150253.22758-9-tzimmermann@suse.de>
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
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/05/2023 18:02, Thomas Zimmermann wrote:
> Use the regular fbdev helpers for framebuffer I/O instead of DRM's
> helpers. Omapdrm does not use damage handling, so DRM's fbdev helpers
> are mere wrappers around the fbdev code.
> 
> By using fbdev helpers directly within each DRM fbdev emulation,
> we can eventually remove DRM's wrapper functions entirely.
> 
> v4:
> 	* use initializer macros for struct fb_ops
> v2:
> 	* use FB_SYS_HELPERS option
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Tomi Valkeinen <tomba@kernel.org>
> ---
>   drivers/gpu/drm/omapdrm/Kconfig      |  1 +
>   drivers/gpu/drm/omapdrm/omap_fbdev.c | 11 +++--------
>   2 files changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/Kconfig b/drivers/gpu/drm/omapdrm/Kconfig
> index 76ded1568bd0..b4ac76c9f31b 100644
> --- a/drivers/gpu/drm/omapdrm/Kconfig
> +++ b/drivers/gpu/drm/omapdrm/Kconfig
> @@ -4,6 +4,7 @@ config DRM_OMAP
>   	depends on DRM && OF
>   	depends on ARCH_OMAP2PLUS
>   	select DRM_KMS_HELPER
> +	select FB_SYS_HELPERS if DRM_FBDEV_EMULATION
>   	select VIDEOMODE_HELPERS
>   	select HDMI
>   	default n
> diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.c b/drivers/gpu/drm/omapdrm/omap_fbdev.c
> index b950e93b3846..b7ccce0704a3 100644
> --- a/drivers/gpu/drm/omapdrm/omap_fbdev.c
> +++ b/drivers/gpu/drm/omapdrm/omap_fbdev.c
> @@ -4,6 +4,8 @@
>    * Author: Rob Clark <rob@ti.com>
>    */
>   
> +#include <linux/fb.h>
> +
>   #include <drm/drm_drv.h>
>   #include <drm/drm_crtc_helper.h>
>   #include <drm/drm_fb_helper.h>
> @@ -95,20 +97,13 @@ static void omap_fbdev_fb_destroy(struct fb_info *info)
>   
>   static const struct fb_ops omap_fb_ops = {
>   	.owner = THIS_MODULE,
> -
> +	FB_DEFAULT_SYS_OPS,
>   	.fb_check_var	= drm_fb_helper_check_var,
>   	.fb_set_par	= drm_fb_helper_set_par,
>   	.fb_setcmap	= drm_fb_helper_setcmap,
>   	.fb_blank	= drm_fb_helper_blank,
>   	.fb_pan_display = omap_fbdev_pan_display,
>   	.fb_ioctl	= drm_fb_helper_ioctl,
> -
> -	.fb_read = drm_fb_helper_sys_read,
> -	.fb_write = drm_fb_helper_sys_write,
> -	.fb_fillrect = drm_fb_helper_sys_fillrect,
> -	.fb_copyarea = drm_fb_helper_sys_copyarea,
> -	.fb_imageblit = drm_fb_helper_sys_imageblit,
> -
>   	.fb_destroy = omap_fbdev_fb_destroy,
>   };
>   

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi

