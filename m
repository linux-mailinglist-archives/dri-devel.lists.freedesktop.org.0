Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 487476F22C0
	for <lists+dri-devel@lfdr.de>; Sat, 29 Apr 2023 05:46:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADE7010E380;
	Sat, 29 Apr 2023 03:45:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.104])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8747510E380
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Apr 2023 03:45:51 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.43:49174.1309328384
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.43])
 by 189.cn (HERMES) with SMTP id A7CD410023C;
 Sat, 29 Apr 2023 11:45:43 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-85667d6c59-fm8l8 with ESMTP id
 c58e0e2cda1648ceab62faa32009eb89 for geert+renesas@glider.be; 
 Sat, 29 Apr 2023 11:45:47 CST
X-Transaction-ID: c58e0e2cda1648ceab62faa32009eb89
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <ce073f1d-0f40-aad9-5509-1f44d3887984@189.cn>
Date: Sat, 29 Apr 2023 11:45:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: drm/fb-helper: Fix height, width, and accel_flags in fb_var
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>
References: <2b6073d9c2d869c6a4eac6edebd616e0568dec91.1681843245.git.geert+renesas@glider.be>
Content-Language: en-US
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <2b6073d9c2d869c6a4eac6edebd616e0568dec91.1681843245.git.geert+renesas@glider.be>
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
Cc: linux-renesas-soc@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

I have just tested this patch on a LoongArch(3a5000+ls7a2000 evb) machine,

both fbtest and the fbdev test of IGT finished.


fbtest say test001: ~ test013: PASSED,

After apply your patch, the warn log `accel_flags changed from 0 to 1` 
disappeared while  running it.

So,


Tested-by: Sui Jingfeng <suijingfeng@loongson.cn>


On 2023/4/19 02:42, Geert Uytterhoeven wrote:
> Fbtest contains some very simple validation of the fbdev userspace API
> contract.  When used with shmob-drm, it reports the following warnings
> and errors:
>
>      height changed from 68 to 0
>      height was rounded down
>      width changed from 111 to 0
>      width was rounded down
>      accel_flags changed from 0 to 1
>
> The first part happens because __fill_var() resets the physical
> dimensions of the first connector, as filled in by drm_setup_crtcs_fb().
> Fix this by retaining the original values.
>
> The last part happens because __fill_var() forces the FB_ACCELF_TEXT
> flag on, while fbtest disables all acceleration on purpose, so it can
> draw safely to the frame buffer.  Fix this by setting accel_flags to
> zero, as DRM does not implement any text console acceleration.
> Note that this issue can also be seen in the output of fbset, which
> reports "accel true".
>
> Fixes: ee4cce0a8f03a333 ("drm/fb-helper: fix input validation gaps in check_var")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>   drivers/gpu/drm/drm_fb_helper.c | 12 +++++++-----
>   1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index 64458982be40c468..ed6ad787915f0b8f 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -1537,17 +1537,19 @@ static void drm_fb_helper_fill_pixel_fmt(struct fb_var_screeninfo *var,
>   	}
>   }
>   
> -static void __fill_var(struct fb_var_screeninfo *var,
> +static void __fill_var(struct fb_var_screeninfo *var, struct fb_info *info,
>   		       struct drm_framebuffer *fb)
>   {
>   	int i;
>   
>   	var->xres_virtual = fb->width;
>   	var->yres_virtual = fb->height;
> -	var->accel_flags = FB_ACCELF_TEXT;
> +	var->accel_flags = 0;
>   	var->bits_per_pixel = drm_format_info_bpp(fb->format, 0);
>   
> -	var->height = var->width = 0;
> +	var->height = info->var.height;
> +	var->width = info->var.width;
> +
>   	var->left_margin = var->right_margin = 0;
>   	var->upper_margin = var->lower_margin = 0;
>   	var->hsync_len = var->vsync_len = 0;
> @@ -1610,7 +1612,7 @@ int drm_fb_helper_check_var(struct fb_var_screeninfo *var,
>   		return -EINVAL;
>   	}
>   
> -	__fill_var(var, fb);
> +	__fill_var(var, info, fb);
>   
>   	/*
>   	 * fb_pan_display() validates this, but fb_set_par() doesn't and just
> @@ -2066,7 +2068,7 @@ static void drm_fb_helper_fill_var(struct fb_info *info,
>   	info->pseudo_palette = fb_helper->pseudo_palette;
>   	info->var.xoffset = 0;
>   	info->var.yoffset = 0;
> -	__fill_var(&info->var, fb);
> +	__fill_var(&info->var, info, fb);
>   	info->var.activate = FB_ACTIVATE_NOW;
>   
>   	drm_fb_helper_fill_pixel_fmt(&info->var, format);
