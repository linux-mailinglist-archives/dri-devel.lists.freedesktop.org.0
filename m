Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87AFC6D0434
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 14:00:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACD7110EDE0;
	Thu, 30 Mar 2023 12:00:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E50CF10EDE0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 12:00:20 +0000 (UTC)
Received: from [192.168.88.20] (91-154-35-171.elisa-laajakaista.fi
 [91.154.35.171])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3D6C1720;
 Thu, 30 Mar 2023 14:00:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1680177619;
 bh=INS3j7THq46BDZFVTbvaSakzwj8Grb10epzYiWC/T4c=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=lAq1MxVB/tK0vTW0+LTh3mFbhAq+HObaN2cl9Hz/YH9Ys6e7ljh5RZ7WF9T1npWS6
 mq4s6gB0SGwlrV6IHngYWWJz4EQGxU4zWlxb6h/t0NHU+Fuu1yk+wBBo/59xdvK/Mk
 RUhGh8YnEkEOA3OR8zpS0y3NLtQrt7D+Yh6//Euc=
Message-ID: <dde30db9-b660-5483-c6a7-5ad8bc59818c@ideasonboard.com>
Date: Thu, 30 Mar 2023 15:00:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 2/6] drm/omapdrm: Remove fb from struct omap_fbdev
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch
References: <20230330083205.12621-1-tzimmermann@suse.de>
 <20230330083205.12621-3-tzimmermann@suse.de>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230330083205.12621-3-tzimmermann@suse.de>
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
> Fbdev's struct fb_helper stores a pointer to the framebuffer. Remove
> struct omap_fbdev.fb, which contains the same value. No functional
> changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/omapdrm/omap_fbdev.c | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.c b/drivers/gpu/drm/omapdrm/omap_fbdev.c
> index a6c8542087ec..b3d57fe4e6ac 100644
> --- a/drivers/gpu/drm/omapdrm/omap_fbdev.c
> +++ b/drivers/gpu/drm/omapdrm/omap_fbdev.c
> @@ -25,7 +25,6 @@ module_param_named(ywrap, ywrap_enabled, bool, 0644);
>   
>   struct omap_fbdev {
>   	struct drm_fb_helper base;
> -	struct drm_framebuffer *fb;
>   	struct drm_gem_object *bo;
>   	bool ywrap_enabled;
>   
> @@ -170,7 +169,6 @@ static int omap_fbdev_create(struct drm_fb_helper *helper,
>   
>   	DBG("fbi=%p, dev=%p", fbi, dev);
>   
> -	fbdev->fb = fb;
>   	helper->fb = fb;
>   
>   	fbi->fbops = &omap_fb_ops;
> @@ -193,7 +191,7 @@ static int omap_fbdev_create(struct drm_fb_helper *helper,
>   
>   
>   	DBG("par=%p, %dx%d", fbi->par, fbi->var.xres, fbi->var.yres);
> -	DBG("allocated %dx%d fb", fbdev->fb->width, fbdev->fb->height);
> +	DBG("allocated %dx%d fb", fb->width, fb->height);
>   
>   	return 0;
>   
> @@ -266,6 +264,7 @@ void omap_fbdev_fini(struct drm_device *dev)
>   {
>   	struct omap_drm_private *priv = dev->dev_private;
>   	struct drm_fb_helper *helper = priv->fbdev;
> +	struct drm_framebuffer *fb;
>   	struct omap_fbdev *fbdev;
>   
>   	DBG();
> @@ -273,6 +272,8 @@ void omap_fbdev_fini(struct drm_device *dev)
>   	if (!helper)
>   		return;
>   
> +	fb = helper->fb;
> +
>   	drm_fb_helper_unregister_info(helper);
>   
>   	drm_fb_helper_fini(helper);
> @@ -284,8 +285,8 @@ void omap_fbdev_fini(struct drm_device *dev)
>   		omap_gem_unpin(fbdev->bo);
>   
>   	/* this will free the backing object */
> -	if (fbdev->fb)
> -		drm_framebuffer_remove(fbdev->fb);
> +	if (fb)
> +		drm_framebuffer_remove(fb);
>   
>   	drm_fb_helper_unprepare(helper);
>   	kfree(fbdev);


Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi

