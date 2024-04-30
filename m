Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 306178B6C10
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2024 09:47:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCE8110F5EE;
	Tue, 30 Apr 2024 07:47:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="Q88HjlbH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90C7410E20B
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2024 07:47:06 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-41be416455bso1779885e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2024 00:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1714463224; x=1715068024; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Dl1GVdvN0rueQglXaHxovHAsGiDm4e1yNLBN8HxvIs4=;
 b=Q88HjlbHJJfd64YPPDULNiFYIy/f8yMj3ZYzaM/Z6+Nh+uZaEp604IUppXpm1r5uNe
 pRz/ACY7YFEtEhYmqSIbgi4VzAPZ67us1zBTvjn83bFtRb0gf2g7gCKWx45Ll58+sRWe
 3YPFDYocCK8HxP+wHEQ6E1bO36sX0kxD8oC2Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714463224; x=1715068024;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Dl1GVdvN0rueQglXaHxovHAsGiDm4e1yNLBN8HxvIs4=;
 b=uTNkU5C+vws12dm7yxl45JIN1JEokwdpEZNsL16Sat6BUdd3zT7CWOaItrYchJ9Edo
 /f1p8Xt6Z041CTY8LZjpckpgLnCHfUadhyzwGaMreyJgy15lJaC+sn7/0SYSfOrnY7Yf
 vwtHeXqTHmxYGW5isuDGLTR89LW4m9dvMbwrhzPsiIAQp4mQHxDlLthmC6EOR5QAhpWo
 lAcxwvVd/xmgQulxiklJk5ZLfpF/YQnjqJoBNnV7AHp5kZsBP10PnXXX9DZxKcRmSDnM
 YGinlvttN48ak0gJppVPxXJoQfqW7dSoowH2/WlacCPDmEn31grzmLbf0bat8YfUqbNQ
 Y7dg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVN5cKKM+KADt9CbHzF241DfUiRWY8zZVxxYFtrmd4ID0fcoa01Avh09DAXedfTN1QlWM6GgbnV53NmT+3RkqcVikNtFTlR9nrvuL3p9tfi
X-Gm-Message-State: AOJu0YyYLdYIXqlrAqmYurBghMz6bDEHIsvqOTC91y5Q/8L+PfFdFK1r
 DJtooHdF2sHPki69avsY1VwDy3+skXZUZLVg8CK/BNMXfIMIreOygingRkUAPYs=
X-Google-Smtp-Source: AGHT+IHuDyo23DJDpBF8JKqWWbigshhI7I6HT5tZcYEE0/M6RSPMqPV+XQRy0UmQoJM+uQ4/DbbzAQ==
X-Received: by 2002:a5d:53c8:0:b0:34c:9a04:4673 with SMTP id
 a8-20020a5d53c8000000b0034c9a044673mr5123632wrw.4.1714463224175; 
 Tue, 30 Apr 2024 00:47:04 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 u18-20020a5d6ad2000000b0034c66bddea3sm570314wrw.37.2024.04.30.00.47.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Apr 2024 00:47:03 -0700 (PDT)
Date: Tue, 30 Apr 2024 09:47:00 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Brandon Pollack <brpol@chromium.org>
Cc: marius.vlad@collabora.com, mairacanal@riseup.net, jshargo@chromium.org,
 hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com,
 linux-doc@vger.kernel.org, hirono@chromium.org, corbet@lwn.net,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 melissa.srw@gmail.com, mduggan@chromium.org, mripard@kernel.org,
 tzimmermann@suse.de
Subject: Re: [PATCH v6 1/7] drm/vkms: Back VKMS with DRM memory management
 instead of static objects
Message-ID: <ZjCh9DGnh2JQ3vtk@phenom.ffwll.local>
Mail-Followup-To: Brandon Pollack <brpol@chromium.org>,
 marius.vlad@collabora.com, mairacanal@riseup.net,
 jshargo@chromium.org, hamohammed.sa@gmail.com,
 rodrigosiqueiramelo@gmail.com, linux-doc@vger.kernel.org,
 hirono@chromium.org, corbet@lwn.net, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, melissa.srw@gmail.com,
 mduggan@chromium.org, mripard@kernel.org, tzimmermann@suse.de
References: <20230829053201.423261-1-brpol@chromium.org>
 <20230829053201.423261-2-brpol@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230829053201.423261-2-brpol@chromium.org>
X-Operating-System: Linux phenom 6.6.15-amd64 
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

On Tue, Aug 29, 2023 at 05:30:53AM +0000, Brandon Pollack wrote:
> From: Jim Shargo <jshargo@chromium.org>
> 
> This is a small refactor to make ConfigFS support easier. Once we
> support ConfigFS, there can be multiple devices instantiated by the
> driver, and so moving everything into managed memory makes things much
> easier.
> 
> This should be a no-op refactor.
> 
> Signed-off-by: Jim Shargo <jshargo@chromium.org>
> Signed-off-by: Brandon Pollack <brpol@chromium.org>

Ok a few things on more the design of this all:

- This patch switches vkms over to be a real platform driver with
  probe/remove hooks. Fine with me, but would need to be split out and
  properly justified with some reason.

  Also if we do this, we don't need our own devres group anymore, that's
  redundant.

- Now on the actual configfs prep work, the issue is that configfs and
  drm_device have independent lifetimes, and we cannot have links between
  the two. The configfs structures might have shorter lifetime thatn the
  vkms_device (and there's no refcounting on configfs afaict), which means
  we cannot have a backpointer from vkms_device to configfs. We can only
  rely on configfs being around during the probe/init code, thanks to the
  configfs mutex.

  This is why the refactoring to use vkms_config was done, so that
  configfs becomes a two-step process: 1. convert the configfs data into a
  struct vkms_config 2. initialize the vkms device using that stand-alone
  vkms_config.

  Now I understand that this is quite a bit of work, but I think it would
  also lead to somewhat more robust code (stuff like the lifetime bugs in
  the connector hotplug patch become impossible). So before we go into
  details, we need to make a decision whether we stick with the
  vkms_config design, or whether we just have two separate paths: a)
  default device setup and b) configfs dynamic setup. Imo this also needs
  an ack from Maíra.

- If we stick with the split approach then we need a few changes.

  - The vkms_device->configfs backpointer needs to go, it's fundamentally
    busted. Instead I think it's best we pass the configfs pointer around
    directly during init time.

  - I think we should clearly split the default and configfs paths with
    explicit suffixes in the relevant functions (like
    vkms_output_init_default/configfs) and explicitly passing parameters
    around.

  - the vkms_config design doesn't have a use anymore, imo we should
    simplify the _default() paths to again just look at the module
    parameters. But only if we go the route of having split setup paths.

  - Data that's only relevant for one or the other paths needs to be
    removed from global structures. This would be vkms_config and
    vkms_output in vkms_device (the latter is left around, which is very
    confusing since the configfs path doesn't use that at all).

  - Going with a real platform driver means passing arguments to
    probe/init becomes tricky. Using the platform data seems like a good
    approach, but we must ensure that we clear that again when we remove
    the platform_device. Note that with a real driver userspace can
    unbind/rebind the driver through sysfs, which means we must keep the
    configfs pointer valid until the device is removed, to make sure that
    these subsequent re-probe calls still work. These complications are
    also the reasons why I think we should only switch to a real platform
    driver if there's a reason, a lot of things become a lot more
    complicated and dynamic and tricky with this.

    Also this means that driver code could try to look at configfs even
    after probe/init is finished, which is buggy but would mostly work
    (unless you really carefully race hotunplug against other driver
    code). So potential for some tricky bugs. That's why I think we should
    explicitly pass the configfs pointer as a function parameter and only
    grab it from the platform_data in ->probe once (and put a comment
    there why this is really tricky).

Anyway before we proceed I think we need consensus on these 2 design
questions.
-Sima

> ---
>  drivers/gpu/drm/vkms/vkms_drv.c    | 128 +++++++++++++++--------------
>  drivers/gpu/drm/vkms/vkms_drv.h    |   4 +-
>  drivers/gpu/drm/vkms/vkms_output.c |   6 +-
>  3 files changed, 71 insertions(+), 67 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> index dd0af086e7fa..387c832f5dc9 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -9,10 +9,12 @@
>   * the GPU in DRM API tests.
>   */
>  
> +#include <linux/device.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  #include <linux/dma-mapping.h>
>  
> +#include <drm/drm_device.h>
>  #include <drm/drm_gem.h>
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
> @@ -37,8 +39,6 @@
>  #define DRIVER_MAJOR	1
>  #define DRIVER_MINOR	0
>  
> -static struct vkms_config *default_config;
> -
>  static bool enable_cursor = true;
>  module_param_named(enable_cursor, enable_cursor, bool, 0444);
>  MODULE_PARM_DESC(enable_cursor, "Enable/Disable cursor support");
> @@ -96,9 +96,9 @@ static int vkms_config_show(struct seq_file *m, void *data)
>  	struct drm_device *dev = entry->dev;
>  	struct vkms_device *vkmsdev = drm_device_to_vkms_device(dev);
>  
> -	seq_printf(m, "writeback=%d\n", vkmsdev->config->writeback);
> -	seq_printf(m, "cursor=%d\n", vkmsdev->config->cursor);
> -	seq_printf(m, "overlay=%d\n", vkmsdev->config->overlay);
> +	seq_printf(m, "writeback=%d\n", vkmsdev->config.writeback);
> +	seq_printf(m, "cursor=%d\n", vkmsdev->config.cursor);
> +	seq_printf(m, "overlay=%d\n", vkmsdev->config.overlay);
>  
>  	return 0;
>  }
> @@ -166,121 +166,127 @@ static int vkms_modeset_init(struct vkms_device *vkmsdev)
>  	dev->mode_config.cursor_height = 512;
>  	/* FIXME: There's a confusion between bpp and depth between this and
>  	 * fbdev helpers. We have to go with 0, meaning "pick the default",
> -	 * which ix XRGB8888 in all cases. */
> +	 * which ix XRGB8888 in all cases.
> +	 */
>  	dev->mode_config.preferred_depth = 0;
>  	dev->mode_config.helper_private = &vkms_mode_config_helpers;
>  
>  	return vkms_output_init(vkmsdev, 0);
>  }
>  
> -static int vkms_create(struct vkms_config *config)
> +static int vkms_platform_probe(struct platform_device *pdev)
>  {
>  	int ret;
> -	struct platform_device *pdev;
>  	struct vkms_device *vkms_device;
> +	void *grp;
>  
> -	pdev = platform_device_register_simple(DRIVER_NAME, -1, NULL, 0);
> -	if (IS_ERR(pdev))
> -		return PTR_ERR(pdev);
> -
> -	if (!devres_open_group(&pdev->dev, NULL, GFP_KERNEL)) {
> -		ret = -ENOMEM;
> -		goto out_unregister;
> -	}
> +	grp = devres_open_group(&pdev->dev, NULL, GFP_KERNEL);
> +	if (!grp)
> +		return -ENOMEM;
>  
>  	vkms_device = devm_drm_dev_alloc(&pdev->dev, &vkms_driver,
>  					 struct vkms_device, drm);
>  	if (IS_ERR(vkms_device)) {
>  		ret = PTR_ERR(vkms_device);
> -		goto out_devres;
> +		goto out_release_group;
>  	}
> +
>  	vkms_device->platform = pdev;
> -	vkms_device->config = config;
> -	config->dev = vkms_device;
> +	vkms_device->config.cursor = enable_cursor;
> +	vkms_device->config.writeback = enable_writeback;
> +	vkms_device->config.overlay = enable_overlay;
>  
>  	ret = dma_coerce_mask_and_coherent(vkms_device->drm.dev,
>  					   DMA_BIT_MASK(64));
> -
>  	if (ret) {
>  		DRM_ERROR("Could not initialize DMA support\n");
> -		goto out_devres;
> +		goto out_release_group;
>  	}
>  
>  	ret = drm_vblank_init(&vkms_device->drm, 1);
>  	if (ret) {
>  		DRM_ERROR("Failed to vblank\n");
> -		goto out_devres;
> +		goto out_release_group;
>  	}
>  
>  	ret = vkms_modeset_init(vkms_device);
> -	if (ret)
> -		goto out_devres;
> +	if (ret) {
> +		DRM_ERROR("Unable to initialize modesetting\n");
> +		goto out_release_group;
> +	}
>  
>  	drm_debugfs_add_files(&vkms_device->drm, vkms_config_debugfs_list,
>  			      ARRAY_SIZE(vkms_config_debugfs_list));
>  
>  	ret = drm_dev_register(&vkms_device->drm, 0);
> -	if (ret)
> -		goto out_devres;
> +	if (ret) {
> +		DRM_ERROR("Unable to register device with id %d\n", pdev->id);
> +		goto out_release_group;
> +	}
>  
>  	drm_fbdev_generic_setup(&vkms_device->drm, 0);
> +	platform_set_drvdata(pdev, vkms_device);
> +	devres_close_group(&pdev->dev, grp);
>  
>  	return 0;
>  
> -out_devres:
> -	devres_release_group(&pdev->dev, NULL);
> -out_unregister:
> -	platform_device_unregister(pdev);
> +out_release_group:
> +	devres_release_group(&pdev->dev, grp);
>  	return ret;
>  }
>  
> -static int __init vkms_init(void)
> +static int vkms_platform_remove(struct platform_device *pdev)
>  {
> -	int ret;
> -	struct vkms_config *config;
> -
> -	config = kmalloc(sizeof(*config), GFP_KERNEL);
> -	if (!config)
> -		return -ENOMEM;
> -
> -	default_config = config;
> +	struct vkms_device *vkms_device;
>  
> -	config->cursor = enable_cursor;
> -	config->writeback = enable_writeback;
> -	config->overlay = enable_overlay;
> +	vkms_device = platform_get_drvdata(pdev);
> +	if (!vkms_device)
> +		return 0;
>  
> -	ret = vkms_create(config);
> -	if (ret)
> -		kfree(config);
> -
> -	return ret;
> +	drm_dev_unregister(&vkms_device->drm);
> +	drm_atomic_helper_shutdown(&vkms_device->drm);
> +	return 0;
>  }
>  
> -static void vkms_destroy(struct vkms_config *config)
> +static struct platform_driver vkms_platform_driver = {
> +	.probe = vkms_platform_probe,
> +	.remove = vkms_platform_remove,
> +	.driver.name = DRIVER_NAME,
> +};
> +
> +static int __init vkms_init(void)
>  {
> +	int ret;
>  	struct platform_device *pdev;
>  
> -	if (!config->dev) {
> -		DRM_INFO("vkms_device is NULL.\n");
> -		return;
> +	ret = platform_driver_register(&vkms_platform_driver);
> +	if (ret) {
> +		DRM_ERROR("Unable to register platform driver\n");
> +		return ret;
>  	}
>  
> -	pdev = config->dev->platform;
> -
> -	drm_dev_unregister(&config->dev->drm);
> -	drm_atomic_helper_shutdown(&config->dev->drm);
> -	devres_release_group(&pdev->dev, NULL);
> -	platform_device_unregister(pdev);
> +	pdev = platform_device_register_simple(DRIVER_NAME, -1, NULL, 0);
> +	if (IS_ERR(pdev)) {
> +		platform_driver_unregister(&vkms_platform_driver);
> +		return PTR_ERR(pdev);
> +	}
>  
> -	config->dev = NULL;
> +	return 0;
>  }
>  
>  static void __exit vkms_exit(void)
>  {
> -	if (default_config->dev)
> -		vkms_destroy(default_config);
> +	struct device *dev;
> +
> +	while ((dev = platform_find_device_by_driver(
> +			NULL, &vkms_platform_driver.driver))) {
> +		// platform_find_device_by_driver increments the refcount. Drop
> +		// it so we don't leak memory.
> +		put_device(dev);
> +		platform_device_unregister(to_platform_device(dev));
> +	}
>  
> -	kfree(default_config);
> +	platform_driver_unregister(&vkms_platform_driver);
>  }
>  
>  module_init(vkms_init);
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index c7ae6c2ba1df..4c35d6305f2a 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -124,15 +124,13 @@ struct vkms_config {
>  	bool writeback;
>  	bool cursor;
>  	bool overlay;
> -	/* only set when instantiated */
> -	struct vkms_device *dev;
>  };
>  
>  struct vkms_device {
>  	struct drm_device drm;
>  	struct platform_device *platform;
>  	struct vkms_output output;
> -	const struct vkms_config *config;
> +	struct vkms_config config;
>  };
>  
>  #define drm_crtc_to_vkms_output(target) \
> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
> index 5ce70dd946aa..963a64cf068b 100644
> --- a/drivers/gpu/drm/vkms/vkms_output.c
> +++ b/drivers/gpu/drm/vkms/vkms_output.c
> @@ -62,7 +62,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
>  	if (IS_ERR(primary))
>  		return PTR_ERR(primary);
>  
> -	if (vkmsdev->config->overlay) {
> +	if (vkmsdev->config.overlay) {
>  		for (n = 0; n < NUM_OVERLAY_PLANES; n++) {
>  			ret = vkms_add_overlay_plane(vkmsdev, index, crtc);
>  			if (ret)
> @@ -70,7 +70,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
>  		}
>  	}
>  
> -	if (vkmsdev->config->cursor) {
> +	if (vkmsdev->config.cursor) {
>  		cursor = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_CURSOR, index);
>  		if (IS_ERR(cursor))
>  			return PTR_ERR(cursor);
> @@ -103,7 +103,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
>  		goto err_attach;
>  	}
>  
> -	if (vkmsdev->config->writeback) {
> +	if (vkmsdev->config.writeback) {
>  		writeback = vkms_enable_writeback_connector(vkmsdev);
>  		if (writeback)
>  			DRM_ERROR("Failed to init writeback connector\n");
> -- 
> 2.42.0.rc2.253.gd59a3bf2b4-goog
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
