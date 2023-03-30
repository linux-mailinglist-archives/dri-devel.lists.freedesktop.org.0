Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9196D0620
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 15:13:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A676E10E343;
	Thu, 30 Mar 2023 13:13:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A540210E343
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 13:13:26 +0000 (UTC)
Received: from [192.168.88.20] (91-154-35-171.elisa-laajakaista.fi
 [91.154.35.171])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 556FE6E0;
 Thu, 30 Mar 2023 15:13:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1680182004;
 bh=hzOuzj3SypIhJZ0uylZDtjC1ajs5sKse200AUOMkO8g=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Scsxj9SFRCJD8YZEBX+LT2DlNZ3TI8wAEoie/u6RzEFENNqbEm6Rd/kVedKh0p5kt
 3eRzC2WcqA9GdrthFv8mOh0XKPMUcp2xFg2Sth3P8qfOPJPIRe1gAfnSzip9ewr7yU
 ZDigD7lrymQN9n8DqhPvKz2Y8nPwOosVNEJl3bSs=
Message-ID: <f93625f4-e915-69c4-fca4-59ab6c666bc2@ideasonboard.com>
Date: Thu, 30 Mar 2023 16:13:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 6/6] drm/omapdrm: Implement fbdev emulation as in-kernel
 client
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch
References: <20230330083205.12621-1-tzimmermann@suse.de>
 <20230330083205.12621-7-tzimmermann@suse.de>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230330083205.12621-7-tzimmermann@suse.de>
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
> Move code from ad-hoc fbdev callbacks into DRM client functions
> and remove the old callbacks. The functions instruct the client
> to poll for changed output or restore the display. The DRM core
> calls both, the old callbacks and the new client helpers, from
> the same places. The new functions perform the same operation as
> before, so there's no change in functionality.
> 
> Replace all code that initializes or releases fbdev emulation
> throughout the driver. Instead initialize the fbdev client by a
> single call to omapdrm_fbdev_setup() after omapdrm has registered
> its DRM device. As in most drivers, omapdrm's fbdev emulation now
> acts like a regular DRM client.
> 
> The fbdev client setup consists of the initial preparation and the
> hot-plugging of the display. The latter creates the fbdev device
> and sets up the fbdev framebuffer. The setup performs display
> hot-plugging once. If no display can be detected, DRM probe helpers
> re-run the detection on each hotplug event.
> 
> A call to drm_dev_unregister() releases the client automatically.
> No further action is required within omapdrm. If the fbdev
> framebuffer has been fully set up, struct fb_ops.fb_destroy
> implements the release. For partially initialized emulation, the
> fbdev client reverts the initial setup.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/omapdrm/omap_drv.c   |  11 +--
>   drivers/gpu/drm/omapdrm/omap_fbdev.c | 136 ++++++++++++++-------------
>   drivers/gpu/drm/omapdrm/omap_fbdev.h |   9 +-
>   3 files changed, 77 insertions(+), 79 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
> index 6a2f446c960f..5ed549726104 100644
> --- a/drivers/gpu/drm/omapdrm/omap_drv.c
> +++ b/drivers/gpu/drm/omapdrm/omap_drv.c
> @@ -15,7 +15,6 @@
>   #include <drm/drm_bridge.h>
>   #include <drm/drm_bridge_connector.h>
>   #include <drm/drm_drv.h>
> -#include <drm/drm_fb_helper.h>
>   #include <drm/drm_file.h>
>   #include <drm/drm_ioctl.h>
>   #include <drm/drm_panel.h>
> @@ -221,7 +220,6 @@ static const struct drm_mode_config_helper_funcs omap_mode_config_helper_funcs =
>   
>   static const struct drm_mode_config_funcs omap_mode_config_funcs = {
>   	.fb_create = omap_framebuffer_create,
> -	.output_poll_changed = drm_fb_helper_output_poll_changed,
>   	.atomic_check = omap_atomic_check,
>   	.atomic_commit = drm_atomic_helper_commit,
>   };
> @@ -654,7 +652,6 @@ static const struct drm_driver omap_drm_driver = {
>   	.driver_features = DRIVER_MODESET | DRIVER_GEM  |
>   		DRIVER_ATOMIC | DRIVER_RENDER,
>   	.open = dev_open,
> -	.lastclose = drm_fb_helper_lastclose,
>   #ifdef CONFIG_DEBUG_FS
>   	.debugfs_init = omap_debugfs_init,
>   #endif
> @@ -743,8 +740,6 @@ static int omapdrm_init(struct omap_drm_private *priv, struct device *dev)
>   		goto err_cleanup_modeset;
>   	}
>   
> -	omap_fbdev_init(ddev);
> -
>   	drm_kms_helper_poll_init(ddev);
>   
>   	/*
> @@ -755,12 +750,12 @@ static int omapdrm_init(struct omap_drm_private *priv, struct device *dev)
>   	if (ret)
>   		goto err_cleanup_helpers;
>   
> +	omap_fbdev_setup(ddev);
> +
>   	return 0;
>   
>   err_cleanup_helpers:
>   	drm_kms_helper_poll_fini(ddev);
> -
> -	omap_fbdev_fini(ddev);
>   err_cleanup_modeset:
>   	omap_modeset_fini(ddev);
>   err_free_overlays:
> @@ -786,8 +781,6 @@ static void omapdrm_cleanup(struct omap_drm_private *priv)
>   
>   	drm_kms_helper_poll_fini(ddev);
>   
> -	omap_fbdev_fini(ddev);
> -
>   	drm_atomic_helper_shutdown(ddev);
>   
>   	omap_modeset_fini(ddev);
> diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.c b/drivers/gpu/drm/omapdrm/omap_fbdev.c
> index f0e35f4764a7..cd63142a4705 100644
> --- a/drivers/gpu/drm/omapdrm/omap_fbdev.c
> +++ b/drivers/gpu/drm/omapdrm/omap_fbdev.c
> @@ -4,13 +4,14 @@
>    * Author: Rob Clark <rob@ti.com>
>    */
>   
> -#include <drm/drm_crtc.h>
> -#include <drm/drm_util.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_crtc_helper.h>
>   #include <drm/drm_fb_helper.h>
>   #include <drm/drm_file.h>
>   #include <drm/drm_fourcc.h>
>   #include <drm/drm_framebuffer.h>
>   #include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_util.h>
>   
>   #include "omap_drv.h"
>   
> @@ -72,6 +73,25 @@ static int omap_fbdev_pan_display(struct fb_var_screeninfo *var,
>   	return drm_fb_helper_pan_display(var, fbi);
>   }
>   
> +static void omap_fbdev_fb_destroy(struct fb_info *info)
> +{
> +	struct drm_fb_helper *helper = info->par;
> +	struct drm_framebuffer *fb = helper->fb;
> +	struct drm_gem_object *bo = drm_gem_fb_get_obj(fb, 0);
> +	struct omap_fbdev *fbdev = to_omap_fbdev(helper);
> +
> +	DBG();
> +
> +	drm_fb_helper_fini(helper);
> +
> +	omap_gem_unpin(bo);
> +	drm_framebuffer_remove(fb);
> +
> +	drm_client_release(&helper->client);
> +	drm_fb_helper_unprepare(helper);
> +	kfree(fbdev);
> +}
> +
>   static const struct fb_ops omap_fb_ops = {
>   	.owner = THIS_MODULE,
>   
> @@ -87,6 +107,8 @@ static const struct fb_ops omap_fb_ops = {
>   	.fb_fillrect = drm_fb_helper_sys_fillrect,
>   	.fb_copyarea = drm_fb_helper_sys_copyarea,
>   	.fb_imageblit = drm_fb_helper_sys_imageblit,
> +
> +	.fb_destroy = omap_fbdev_fb_destroy,
>   };
>   
>   static int omap_fbdev_create(struct drm_fb_helper *helper,
> @@ -226,16 +248,52 @@ static struct drm_fb_helper *get_fb(struct fb_info *fbi)
>    */
>   
>   static void omap_fbdev_client_unregister(struct drm_client_dev *client)
> -{ }
> +{
> +	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
> +
> +	if (fb_helper->info) {
> +		drm_fb_helper_unregister_info(fb_helper);

Just trying to understand the code flow. So this is called if we have 
had a display connected, and have called omap_fbdev_create()? And 
drm_fb_helper_unregister_info() ends up calling omap_fbdev_fb_destroy().

> +	} else {
> +		drm_client_release(&fb_helper->client);
> +		drm_fb_helper_unprepare(fb_helper);
> +		kfree(fb_helper);

And this path is for the case where we haven't created the fbdev.

> +	}
> +}
>   
>   static int omap_fbdev_client_restore(struct drm_client_dev *client)
>   {
> +	drm_fb_helper_lastclose(client->dev);
> +
>   	return 0;
>   }
>   
>   static int omap_fbdev_client_hotplug(struct drm_client_dev *client)
>   {
> +	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
> +	struct drm_device *dev = client->dev;
> +	int ret;
> +
> +	if (dev->fb_helper)

And this tests if this is not the first call to 
omap_fbdev_client_hotplug()?

> +		return drm_fb_helper_hotplug_event(dev->fb_helper);
> +
> +	ret = drm_fb_helper_init(dev, fb_helper);
> +	if (ret)
> +		goto err_drm_err;
> +
> +	if (!drm_drv_uses_atomic_modeset(dev))

Why do we need this? omapdrm supports atomic.

That's my only real comment. Kernel test bot had one comment too. But 
other than that:

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

I tested this series on TI DRA76 EVM, and worked fine for me.

  Tomi

> +		drm_helper_disable_unused_functions(dev);
> +
> +	ret = drm_fb_helper_initial_config(fb_helper);
> +	if (ret)
> +		goto err_drm_fb_helper_fini;
> +
>   	return 0;
> +
> +err_drm_fb_helper_fini:
> +	drm_fb_helper_fini(fb_helper);
> +err_drm_err:
> +	drm_err(dev, "Failed to setup fbdev emulation (ret=%d)\n", ret);
> +	return ret;
>   }
>   
>   static const struct drm_client_funcs omap_fbdev_client_funcs = {
> @@ -245,85 +303,37 @@ static const struct drm_client_funcs omap_fbdev_client_funcs = {
>   	.hotplug	= omap_fbdev_client_hotplug,
>   };
>   
> -/* initialize fbdev helper */
> -void omap_fbdev_init(struct drm_device *dev)
> +void omap_fbdev_setup(struct drm_device *dev)
>   {
> -	struct omap_drm_private *priv = dev->dev_private;
> -	struct omap_fbdev *fbdev = NULL;
> +	struct omap_fbdev *fbdev;
>   	struct drm_fb_helper *helper;
> -	int ret = 0;
> +	int ret;
>   
> -	if (!priv->num_pipes)
> -		return;
> +	drm_WARN(dev, !dev->registered, "Device has not been registered.\n");
> +	drm_WARN(dev, dev->fb_helper, "fb_helper is already set!\n");
>   
>   	fbdev = kzalloc(sizeof(*fbdev), GFP_KERNEL);
>   	if (!fbdev)
>   		return;
> -
> -	INIT_WORK(&fbdev->work, pan_worker);
> -
>   	helper = &fbdev->base;
>   
>   	drm_fb_helper_prepare(dev, helper, 32, &omap_fb_helper_funcs);
>   
>   	ret = drm_client_init(dev, &helper->client, "fbdev", &omap_fbdev_client_funcs);
>   	if (ret)
> -		goto fail;
> +		goto err_drm_client_init;
>   
> -	ret = drm_fb_helper_init(dev, helper);
> -	if (ret)
> -		goto err_drm_client_release;
> +	INIT_WORK(&fbdev->work, pan_worker);
>   
> -	ret = drm_fb_helper_initial_config(helper);
> +	ret = omap_fbdev_client_hotplug(&helper->client);
>   	if (ret)
> -		goto fini;
> -
> -	return;
> +		drm_dbg_kms(dev, "client hotplug ret=%d\n", ret);
>   
> -fini:
> -	drm_fb_helper_fini(helper);
> -err_drm_client_release:
> -	drm_client_release(&helper->client);
> -fail:
> -	drm_fb_helper_unprepare(helper);
> -	kfree(fbdev);
> +	drm_client_register(&helper->client);
>   
> -	dev_warn(dev->dev, "omap_fbdev_init failed\n");
> -}
> -
> -void omap_fbdev_fini(struct drm_device *dev)
> -{
> -	struct drm_fb_helper *helper = dev->fb_helper;
> -	struct drm_framebuffer *fb;
> -	struct drm_gem_object *bo;
> -	struct omap_fbdev *fbdev;
> -
> -	DBG();
> -
> -	if (!helper)
> -		return;
> -
> -	fb = helper->fb;
> -
> -	drm_fb_helper_unregister_info(helper);
> -
> -	drm_fb_helper_fini(helper);
> -
> -	fbdev = to_omap_fbdev(helper);
> -
> -	bo = drm_gem_fb_get_obj(fb, 0);
> -
> -	/* unpin the GEM object pinned in omap_fbdev_create() */
> -	if (bo)
> -		omap_gem_unpin(bo);
> -
> -	/* this will free the backing object */
> -	if (fb)
> -		drm_framebuffer_remove(fb);
> +	return;
>   
> -	drm_client_release(&helper->client);
> +err_drm_client_init:
>   	drm_fb_helper_unprepare(helper);
>   	kfree(fbdev);
> -
> -	dev->fb_helper = NULL;
>   }
> diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.h b/drivers/gpu/drm/omapdrm/omap_fbdev.h
> index 74a68a5a6eab..74c691a8d45f 100644
> --- a/drivers/gpu/drm/omapdrm/omap_fbdev.h
> +++ b/drivers/gpu/drm/omapdrm/omap_fbdev.h
> @@ -10,16 +10,11 @@
>   #define __OMAPDRM_FBDEV_H__
>   
>   struct drm_device;
> -struct drm_fb_helper;
>   
>   #ifdef CONFIG_DRM_FBDEV_EMULATION
> -void omap_fbdev_init(struct drm_device *dev);
> -void omap_fbdev_fini(struct drm_device *dev);
> +void omap_fbdev_setup(struct drm_device *dev);
>   #else
> -static inline void omap_fbdev_init(struct drm_device *dev)
> -{
> -}
> -static inline void omap_fbdev_fini(struct drm_device *dev)
> +static inline void omap_fbdev_setup(struct drm_device *dev)
>   {
>   }
>   #endif

