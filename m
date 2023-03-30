Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 379646D0447
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 14:05:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04CF810E2CD;
	Thu, 30 Mar 2023 12:04:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8571210E2C8
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 12:04:54 +0000 (UTC)
Received: from [192.168.88.20] (91-154-35-171.elisa-laajakaista.fi
 [91.154.35.171])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C6EA16E1;
 Thu, 30 Mar 2023 14:04:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1680177893;
 bh=8Cdy8r5t5ix3lQ8HR4WdXv8BAiiQEoQHPWMUVuA5nFE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=OerJTc8zh66GJB3KctLjrkdcfb7oluI+jUCyWbDjEQyqm3eDqyPao0kSRVHbgD64u
 FZk5Szl75L3zSjRzSlruzvvXDYv95MzYEt0fQn6cUBHiazq0OP2Vge3x5F3Oj+wJji
 X3Izkq9+kTml55ZhNqHs4DyJGYFuFb+2biq3tx40=
Message-ID: <6cac8d26-a515-9ffa-8935-89fee12c602a@ideasonboard.com>
Date: Thu, 30 Mar 2023 15:04:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 3/6] drm/omapdrm: Remove bo from struct omap_fbdev
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch
References: <20230330083205.12621-1-tzimmermann@suse.de>
 <20230330083205.12621-4-tzimmermann@suse.de>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230330083205.12621-4-tzimmermann@suse.de>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/03/2023 11:32, Thomas Zimmermann wrote:
> Fbdev's framebuffer stores a pointer to the GEM object. Remove
> struct omap_fbdev.exynos_gem, which contains the same value. No

Copy paste error? =)

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi

> functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/omapdrm/omap_fbdev.c | 32 +++++++++++++++++-----------
>   1 file changed, 19 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.c b/drivers/gpu/drm/omapdrm/omap_fbdev.c
> index b3d57fe4e6ac..d04a20f95e3d 100644
> --- a/drivers/gpu/drm/omapdrm/omap_fbdev.c
> +++ b/drivers/gpu/drm/omapdrm/omap_fbdev.c
> @@ -10,6 +10,7 @@
>   #include <drm/drm_file.h>
>   #include <drm/drm_fourcc.h>
>   #include <drm/drm_framebuffer.h>
> +#include <drm/drm_gem_framebuffer_helper.h>
>   
>   #include "omap_drv.h"
>   
> @@ -25,7 +26,6 @@ module_param_named(ywrap, ywrap_enabled, bool, 0644);
>   
>   struct omap_fbdev {
>   	struct drm_fb_helper base;
> -	struct drm_gem_object *bo;
>   	bool ywrap_enabled;
>   
>   	/* for deferred dmm roll when getting called in atomic ctx */
> @@ -37,12 +37,14 @@ static struct drm_fb_helper *get_fb(struct fb_info *fbi);
>   static void pan_worker(struct work_struct *work)
>   {
>   	struct omap_fbdev *fbdev = container_of(work, struct omap_fbdev, work);
> -	struct fb_info *fbi = fbdev->base.info;
> +	struct drm_fb_helper *helper = &fbdev->base;
> +	struct fb_info *fbi = helper->info;
> +	struct drm_gem_object *bo = drm_gem_fb_get_obj(helper->fb, 0);
>   	int npages;
>   
>   	/* DMM roll shifts in 4K pages: */
>   	npages = fbi->fix.line_length >> PAGE_SHIFT;
> -	omap_gem_roll(fbdev->bo, fbi->var.yoffset * npages);
> +	omap_gem_roll(bo, fbi->var.yoffset * npages);
>   }
>   
>   static int omap_fbdev_pan_display(struct fb_var_screeninfo *var,
> @@ -97,6 +99,7 @@ static int omap_fbdev_create(struct drm_fb_helper *helper,
>   	union omap_gem_size gsize;
>   	struct fb_info *fbi = NULL;
>   	struct drm_mode_fb_cmd2 mode_cmd = {0};
> +	struct drm_gem_object *bo;
>   	dma_addr_t dma_addr;
>   	int ret;
>   
> @@ -127,20 +130,20 @@ static int omap_fbdev_create(struct drm_fb_helper *helper,
>   		.bytes = PAGE_ALIGN(mode_cmd.pitches[0] * mode_cmd.height),
>   	};
>   	DBG("allocating %d bytes for fb %d", gsize.bytes, dev->primary->index);
> -	fbdev->bo = omap_gem_new(dev, gsize, OMAP_BO_SCANOUT | OMAP_BO_WC);
> -	if (!fbdev->bo) {
> +	bo = omap_gem_new(dev, gsize, OMAP_BO_SCANOUT | OMAP_BO_WC);
> +	if (!bo) {
>   		dev_err(dev->dev, "failed to allocate buffer object\n");
>   		ret = -ENOMEM;
>   		goto fail;
>   	}
>   
> -	fb = omap_framebuffer_init(dev, &mode_cmd, &fbdev->bo);
> +	fb = omap_framebuffer_init(dev, &mode_cmd, &bo);
>   	if (IS_ERR(fb)) {
>   		dev_err(dev->dev, "failed to allocate fb\n");
>   		/* note: if fb creation failed, we can't rely on fb destroy
>   		 * to unref the bo:
>   		 */
> -		drm_gem_object_put(fbdev->bo);
> +		drm_gem_object_put(bo);
>   		ret = PTR_ERR(fb);
>   		goto fail;
>   	}
> @@ -153,7 +156,7 @@ static int omap_fbdev_create(struct drm_fb_helper *helper,
>   	 * to it).  Then we just need to be sure that we are able to re-
>   	 * pin it in case of an opps.
>   	 */
> -	ret = omap_gem_pin(fbdev->bo, &dma_addr);
> +	ret = omap_gem_pin(bo, &dma_addr);
>   	if (ret) {
>   		dev_err(dev->dev, "could not pin framebuffer\n");
>   		ret = -ENOMEM;
> @@ -175,10 +178,10 @@ static int omap_fbdev_create(struct drm_fb_helper *helper,
>   
>   	drm_fb_helper_fill_info(fbi, helper, sizes);
>   
> -	fbi->screen_buffer = omap_gem_vaddr(fbdev->bo);
> -	fbi->screen_size = fbdev->bo->size;
> +	fbi->screen_buffer = omap_gem_vaddr(bo);
> +	fbi->screen_size = bo->size;
>   	fbi->fix.smem_start = dma_addr;
> -	fbi->fix.smem_len = fbdev->bo->size;
> +	fbi->fix.smem_len = bo->size;
>   
>   	/* if we have DMM, then we can use it for scrolling by just
>   	 * shuffling pages around in DMM rather than doing sw blit.
> @@ -265,6 +268,7 @@ void omap_fbdev_fini(struct drm_device *dev)
>   	struct omap_drm_private *priv = dev->dev_private;
>   	struct drm_fb_helper *helper = priv->fbdev;
>   	struct drm_framebuffer *fb;
> +	struct drm_gem_object *bo;
>   	struct omap_fbdev *fbdev;
>   
>   	DBG();
> @@ -280,9 +284,11 @@ void omap_fbdev_fini(struct drm_device *dev)
>   
>   	fbdev = to_omap_fbdev(helper);
>   
> +	bo = drm_gem_fb_get_obj(fb, 0);
> +
>   	/* unpin the GEM object pinned in omap_fbdev_create() */
> -	if (fbdev->bo)
> -		omap_gem_unpin(fbdev->bo);
> +	if (bo)
> +		omap_gem_unpin(bo);
>   
>   	/* this will free the backing object */
>   	if (fb)

