Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BF773D2BA
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jun 2023 19:41:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D77210E0A4;
	Sun, 25 Jun 2023 17:41:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A24210E0A4
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jun 2023 17:41:05 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx0.riseup.net (Postfix) with ESMTPS id 4Qpyv42d48z9t4T;
 Sun, 25 Jun 2023 17:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1687714864; bh=I3LYfA8e9h4ijq8ca5BSc6fS1LcfpWqRIw+0+LwgaJc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jvFzyTJ9dOPitRr4qrOlNJxketyHMMmTENCD+4XMhLm/gCue02aAVeWdWeDH6FV7k
 64pf2om0O4sVg+8lQt9xu7aCbtIU6VAHQQAr6v1PZR6zPS2s9c5xI7ets5+IDBr5fT
 mZ4Hp4G16eY4TuYWNLRbzdWE5XvwWW2qb4cyRwRQ=
X-Riseup-User-ID: 3D2C24FC61F3C2B35CCC3CC9BB812BA60A21E30E071FE3CF8BB3E6B7EB634D4D
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4Qpyv02DcvzJp9N;
 Sun, 25 Jun 2023 17:41:00 +0000 (UTC)
Message-ID: <aadd1da1-8684-ca28-a3e9-9abeaf258aff@riseup.net>
Date: Sun, 25 Jun 2023 14:40:55 -0300
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/6] drm/vkms: Back VKMS with DRM memory management
 instead of static objects
To: Jim Shargo <jshargo@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Melissa Wen <melissa.srw@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20230623222353.97283-1-jshargo@chromium.org>
 <20230623222353.97283-2-jshargo@chromium.org>
Content-Language: en-US
From: Maira Canal <mairacanal@riseup.net>
In-Reply-To: <20230623222353.97283-2-jshargo@chromium.org>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jim,

Thanks for working on this great feature for the VKMS!

On 6/23/23 19:23, Jim Shargo wrote:
> This is a small refactor to make ConfigFS support easier. Once we
> support ConfigFS, there can be multiple devices instantiated by the
> driver, and so moving everything into managed memory makes things much
> easier.
> 
> This should be a no-op refactor.
> 
> Signed-off-by: Jim Shargo <jshargo@chromium.org>
> ---
>   drivers/gpu/drm/vkms/vkms_drv.c    | 130 +++++++++++++++--------------
>   drivers/gpu/drm/vkms/vkms_drv.h    |   4 +-
>   drivers/gpu/drm/vkms/vkms_output.c |   6 +-
>   3 files changed, 72 insertions(+), 68 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> index e3c9c9571c8d..f07454fff046 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -9,10 +9,12 @@
>    * the GPU in DRM API tests.
>    */
>   
> +#include <linux/device.h>
>   #include <linux/module.h>
>   #include <linux/platform_device.h>
>   #include <linux/dma-mapping.h>
>   
> +#include <drm/drm_device.h>
>   #include <drm/drm_gem.h>
>   #include <drm/drm_atomic.h>
>   #include <drm/drm_atomic_helper.h>
> @@ -37,8 +39,6 @@
>   #define DRIVER_MAJOR	1
>   #define DRIVER_MINOR	0
>   
> -static struct vkms_config *default_config;
> -
>   static bool enable_cursor = true;
>   module_param_named(enable_cursor, enable_cursor, bool, 0444);
>   MODULE_PARM_DESC(enable_cursor, "Enable/Disable cursor support");
> @@ -92,13 +92,13 @@ static void vkms_atomic_commit_tail(struct drm_atomic_state *old_state)
>   
>   static int vkms_config_show(struct seq_file *m, void *data)
>   {
> -	struct drm_debugfs_entry *entry = m->private;
> -	struct drm_device *dev = entry->dev;
> -	struct vkms_device *vkmsdev = drm_device_to_vkms_device(dev);
> +	struct drm_info_node *drm_info = m->private;

The VKMS already moved to the new DRM debugfs interface, there is no
need to move back to the old interface. I believe you should keep
using struct drm_debugfs_entry.

Also, that's probably the reason why the vkms_config file is not being
properly updated:

[root@fedora ~]# modprobe vkms enable_overlay=1 enable_cursor=1 
enable_writeback=1
[root@fedora ~]# cd /sys/kernel/debug/dri/0
[root@fedora 0]# cat vkms_config
writeback=0
cursor=0
overlay=0

> +	struct vkms_device *vkms_device =
> +		drm_device_to_vkms_device(drm_info->minor->dev);
>   
> -	seq_printf(m, "writeback=%d\n", vkmsdev->config->writeback);
> -	seq_printf(m, "cursor=%d\n", vkmsdev->config->cursor);
> -	seq_printf(m, "overlay=%d\n", vkmsdev->config->overlay);
> +	seq_printf(m, "writeback=%d\n", vkms_device->config.writeback);
> +	seq_printf(m, "cursor=%d\n", vkms_device->config.cursor);
> +	seq_printf(m, "overlay=%d\n", vkms_device->config.overlay);
>   
>   	return 0;
>   }
> @@ -155,114 +155,120 @@ static int vkms_modeset_init(struct vkms_device *vkmsdev)
>   	return vkms_output_init(vkmsdev, 0);
>   }
>   
> -static int vkms_create(struct vkms_config *config)
> +static int vkms_platform_probe(struct platform_device *pdev)
>   {
>   	int ret;
> -	struct platform_device *pdev;
>   	struct vkms_device *vkms_device;
> +	void *grp;
>   
> -	pdev = platform_device_register_simple(DRIVER_NAME, -1, NULL, 0);
> -	if (IS_ERR(pdev))
> -		return PTR_ERR(pdev);
> -
> -	if (!devres_open_group(&pdev->dev, NULL, GFP_KERNEL)) {
> -		ret = -ENOMEM;
> -		goto out_unregister;
> +	grp = devres_open_group(&pdev->dev, NULL, GFP_KERNEL);
> +	if (!grp) {
> +		return -ENOMEM;
>   	}
>   
>   	vkms_device = devm_drm_dev_alloc(&pdev->dev, &vkms_driver,
>   					 struct vkms_device, drm);
>   	if (IS_ERR(vkms_device)) {
>   		ret = PTR_ERR(vkms_device);
> -		goto out_devres;
> +		goto out_release_group;
>   	}
> +
>   	vkms_device->platform = pdev;
> -	vkms_device->config = config;
> -	config->dev = vkms_device;
> +	vkms_device->config.cursor = enable_cursor;
> +	vkms_device->config.writeback = enable_writeback;
> +	vkms_device->config.overlay = enable_overlay;
>   
>   	ret = dma_coerce_mask_and_coherent(vkms_device->drm.dev,
>   					   DMA_BIT_MASK(64));
> -
>   	if (ret) {
>   		DRM_ERROR("Could not initialize DMA support\n");
> -		goto out_devres;
> +		goto out_release_group;
>   	}
>   
>   	ret = drm_vblank_init(&vkms_device->drm, 1);
>   	if (ret) {
>   		DRM_ERROR("Failed to vblank\n");
> -		goto out_devres;
> +		goto out_release_group;
>   	}
>   
>   	ret = vkms_modeset_init(vkms_device);
> -	if (ret)
> -		goto out_devres;
> +	if (ret) {
> +		DRM_ERROR("Unable to initialize modesetting\n");
> +		goto out_release_group;
> +	}
>   
>   	drm_debugfs_add_files(&vkms_device->drm, vkms_config_debugfs_list,
>   			      ARRAY_SIZE(vkms_config_debugfs_list));
>   
>   	ret = drm_dev_register(&vkms_device->drm, 0);
> -	if (ret)
> -		goto out_devres;
> +	if (ret) {
> +		DRM_ERROR("Unable to register device\n");
> +		return ret;

Shouldn't you go to out_release_group inside of just returning?

Best Regards,
- Maíra

> +	}
>   
>   	drm_fbdev_generic_setup(&vkms_device->drm, 0);
> +	platform_set_drvdata(pdev, vkms_device);
> +	devres_close_group(&pdev->dev, grp);
>   
>   	return 0;
>   
> -out_devres:
> -	devres_release_group(&pdev->dev, NULL);
> -out_unregister:
> -	platform_device_unregister(pdev);
> +out_release_group:
> +	devres_release_group(&pdev->dev, grp);
>   	return ret;
>   }
>   
> -static int __init vkms_init(void)
> +static int vkms_platform_remove(struct platform_device *pdev)
>   {
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
>   }
>   
> -static void vkms_destroy(struct vkms_config *config)
> +static struct platform_driver vkms_platform_driver = {
> +	.probe = vkms_platform_probe,
> +	.remove = vkms_platform_remove,
> +	.driver.name = DRIVER_NAME,
> +};
> +
> +static int __init vkms_init(void)
>   {
> +	int ret;
>   	struct platform_device *pdev;
>   
> -	if (!config->dev) {
> -		DRM_INFO("vkms_device is NULL.\n");
> -		return;
> +	ret = platform_driver_register(&vkms_platform_driver);
> +	if (ret) {
> +		DRM_ERROR("Unable to register platform driver\n");
> +		return ret;
>   	}
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
>   }
>   
>   static void __exit vkms_exit(void)
>   {
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
>   }
>   
>   module_init(vkms_init);
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index 5f1a0a44a78c..e87c8aea6fb3 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -114,15 +114,13 @@ struct vkms_config {
>   	bool writeback;
>   	bool cursor;
>   	bool overlay;
> -	/* only set when instantiated */
> -	struct vkms_device *dev;
>   };
>   
>   struct vkms_device {
>   	struct drm_device drm;
>   	struct platform_device *platform;
>   	struct vkms_output output;
> -	const struct vkms_config *config;
> +	struct vkms_config config;
>   };
>   
>   #define drm_crtc_to_vkms_output(target) \
> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
> index 5ce70dd946aa..963a64cf068b 100644
> --- a/drivers/gpu/drm/vkms/vkms_output.c
> +++ b/drivers/gpu/drm/vkms/vkms_output.c
> @@ -62,7 +62,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
>   	if (IS_ERR(primary))
>   		return PTR_ERR(primary);
>   
> -	if (vkmsdev->config->overlay) {
> +	if (vkmsdev->config.overlay) {
>   		for (n = 0; n < NUM_OVERLAY_PLANES; n++) {
>   			ret = vkms_add_overlay_plane(vkmsdev, index, crtc);
>   			if (ret)
> @@ -70,7 +70,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
>   		}
>   	}
>   
> -	if (vkmsdev->config->cursor) {
> +	if (vkmsdev->config.cursor) {
>   		cursor = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_CURSOR, index);
>   		if (IS_ERR(cursor))
>   			return PTR_ERR(cursor);
> @@ -103,7 +103,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
>   		goto err_attach;
>   	}
>   
> -	if (vkmsdev->config->writeback) {
> +	if (vkmsdev->config.writeback) {
>   		writeback = vkms_enable_writeback_connector(vkmsdev);
>   		if (writeback)
>   			DRM_ERROR("Failed to init writeback connector\n");
