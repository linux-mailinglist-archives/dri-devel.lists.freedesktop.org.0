Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E426D045F
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 14:09:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA00910E2B9;
	Thu, 30 Mar 2023 12:09:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7043210E2B9
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 12:09:02 +0000 (UTC)
Received: from [192.168.88.20] (91-154-35-171.elisa-laajakaista.fi
 [91.154.35.171])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B6FF86E1;
 Thu, 30 Mar 2023 14:09:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1680178141;
 bh=Zb/UXlqNEGBcLjkFklcbhAwKTg1KOyAbYPDDVvL8b/A=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=At+xev11MpjrtqQLR6eUxWFas7Oxqz0qiCuPRhc1dBOYAaOa4yBzAvyTG/8ix6eRI
 nkpduJRt2HFVoweguxSW2vJK6lqAWG947dKy9CZHXhNmD6uyS0CaA1kIcPEgjKXRdX
 lQIvkaJw4zWXuWVTGbKrgZ8lvJqUyDHbOYM4K+Ic=
Message-ID: <4198992b-b2b9-6cf6-4d04-88df43b68ea9@ideasonboard.com>
Date: Thu, 30 Mar 2023 15:08:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 4/6] drm/omapdrm: Remove fbdev from struct omap_drm_private
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch
References: <20230330083205.12621-1-tzimmermann@suse.de>
 <20230330083205.12621-5-tzimmermann@suse.de>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230330083205.12621-5-tzimmermann@suse.de>
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
> The DRM device stores a pointer to the fbdev helper. Remove struct
> omap_drm_private.fbdev, which contains the same value. No functional
> changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/omapdrm/omap_debugfs.c | 6 +++---
>   drivers/gpu/drm/omapdrm/omap_drv.c     | 1 +
>   drivers/gpu/drm/omapdrm/omap_drv.h     | 3 ---
>   drivers/gpu/drm/omapdrm/omap_fbdev.c   | 7 ++-----
>   4 files changed, 6 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/omap_debugfs.c b/drivers/gpu/drm/omapdrm/omap_debugfs.c
> index bfb2ccb40bd1..a3d470468e5b 100644
> --- a/drivers/gpu/drm/omapdrm/omap_debugfs.c
> +++ b/drivers/gpu/drm/omapdrm/omap_debugfs.c
> @@ -47,15 +47,15 @@ static int fb_show(struct seq_file *m, void *arg)
>   {
>   	struct drm_info_node *node = (struct drm_info_node *) m->private;
>   	struct drm_device *dev = node->minor->dev;
> -	struct omap_drm_private *priv = dev->dev_private;
> +	struct drm_fb_helper *helper = dev->fb_helper;
>   	struct drm_framebuffer *fb;
>   
>   	seq_printf(m, "fbcon ");
> -	omap_framebuffer_describe(priv->fbdev->fb, m);
> +	omap_framebuffer_describe(helper->fb, m);
>   
>   	mutex_lock(&dev->mode_config.fb_lock);
>   	list_for_each_entry(fb, &dev->mode_config.fb_list, head) {
> -		if (fb == priv->fbdev->fb)
> +		if (fb == helper->fb)
>   			continue;
>   
>   		seq_printf(m, "user ");
> diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
> index fb403b44769c..6a2f446c960f 100644
> --- a/drivers/gpu/drm/omapdrm/omap_drv.c
> +++ b/drivers/gpu/drm/omapdrm/omap_drv.c
> @@ -25,6 +25,7 @@
>   
>   #include "omap_dmm_tiler.h"
>   #include "omap_drv.h"
> +#include "omap_fbdev.h"
>   
>   #define DRIVER_NAME		MODULE_NAME
>   #define DRIVER_DESC		"OMAP DRM"
> diff --git a/drivers/gpu/drm/omapdrm/omap_drv.h b/drivers/gpu/drm/omapdrm/omap_drv.h
> index 825960fd3ea9..4c7217b35f6b 100644
> --- a/drivers/gpu/drm/omapdrm/omap_drv.h
> +++ b/drivers/gpu/drm/omapdrm/omap_drv.h
> @@ -21,7 +21,6 @@
>   #include "omap_crtc.h"
>   #include "omap_encoder.h"
>   #include "omap_fb.h"
> -#include "omap_fbdev.h"
>   #include "omap_gem.h"
>   #include "omap_irq.h"
>   #include "omap_plane.h"
> @@ -77,8 +76,6 @@ struct omap_drm_private {
>   
>   	struct drm_private_obj glob_obj;
>   
> -	struct drm_fb_helper *fbdev;
> -
>   	struct workqueue_struct *wq;
>   
>   	/* lock for obj_list below */
> diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.c b/drivers/gpu/drm/omapdrm/omap_fbdev.c
> index d04a20f95e3d..79e417b391bf 100644
> --- a/drivers/gpu/drm/omapdrm/omap_fbdev.c
> +++ b/drivers/gpu/drm/omapdrm/omap_fbdev.c
> @@ -250,8 +250,6 @@ void omap_fbdev_init(struct drm_device *dev)
>   	if (ret)
>   		goto fini;
>   
> -	priv->fbdev = helper;
> -
>   	return;
>   
>   fini:
> @@ -265,8 +263,7 @@ void omap_fbdev_init(struct drm_device *dev)
>   
>   void omap_fbdev_fini(struct drm_device *dev)
>   {
> -	struct omap_drm_private *priv = dev->dev_private;
> -	struct drm_fb_helper *helper = priv->fbdev;
> +	struct drm_fb_helper *helper = dev->fb_helper;
>   	struct drm_framebuffer *fb;
>   	struct drm_gem_object *bo;
>   	struct omap_fbdev *fbdev;
> @@ -297,5 +294,5 @@ void omap_fbdev_fini(struct drm_device *dev)
>   	drm_fb_helper_unprepare(helper);
>   	kfree(fbdev);
>   
> -	priv->fbdev = NULL;
> +	dev->fb_helper = NULL;

Is this line needed anymore? As you dropped the priv->fbdev assignment 
in omap_fbdev_init(), it would look symmetrical to also drop this one. 
I'm sure it doesn't hurt, just wondering if this is something drivers 
are supposed to do, or is this just an extra line in the driver.

In either case:

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi

