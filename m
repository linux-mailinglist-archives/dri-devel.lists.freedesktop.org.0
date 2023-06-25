Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 599EA73D2EF
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jun 2023 20:19:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C279410E067;
	Sun, 25 Jun 2023 18:19:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB98410E067
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jun 2023 18:19:42 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4Qpzld6yfLzDqTd;
 Sun, 25 Jun 2023 18:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1687717182; bh=xsvIFhvgUYdxYwvrYe2HyUOmsEfpBrK8RvZ+xnuwhJI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Wi6J48T779MhMqAwTyDr1vqU7ETLPcl8EK1KOn7eilQdD2v/qPh021ApQJEK+8+Yp
 QOA7kwwx0ugCM5XM1EVmUQro/UhCykjHtQooEacOye2ohfrKHaiD+WjB7U/C9KBZ3y
 uWWHiNvFXKI4TVcwhzG5LRcgY6cAMXP65ajpm/XE=
X-Riseup-User-ID: 6FC0270397A989D013840BF5A3B8EE4EE8879C50E829AE8076A22E06A3D75BBB
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4QpzlY5BPYzJqCB;
 Sun, 25 Jun 2023 18:19:37 +0000 (UTC)
Message-ID: <936f3187-5049-76c2-393f-40aaba4a3908@riseup.net>
Date: Sun, 25 Jun 2023 15:19:34 -0300
MIME-Version: 1.0
Subject: Re: [PATCH v2 4/6] drm/vkms: Add ConfigFS scaffolding to VKMS
Content-Language: en-US
To: Jim Shargo <jshargo@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Melissa Wen <melissa.srw@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20230623222353.97283-1-jshargo@chromium.org>
 <20230623222353.97283-5-jshargo@chromium.org>
From: Maira Canal <mairacanal@riseup.net>
In-Reply-To: <20230623222353.97283-5-jshargo@chromium.org>
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

On 6/23/23 19:23, Jim Shargo wrote:
> This change adds the basic scaffolding for ConfigFS, including setting
> up the default directories. It does not allow for the registration of
> configfs-backed devices, which is complex and provided in a follow-up
> commit.
> 
> This CL includes docs about using ConfigFS with VKMS, but I'll summarize
> in brief here as well (assuming ConfigFS is mounted at /config/):
> 
> To create a new device, you can do so via `mkdir
> /config/vkms/my-device`.
> 
> This will create a number of directories and files automatically:
> 
> 	/config
> 	`-- vkms
> 	    `-- my-device
> 		|-- connectors
> 		|-- crtcs
> 		|-- encoders
> 		|-- planes
> 		`-- enabled
> 
> You can then configure objects by mkdir'ing in each of the directories.
> 
> When you're satisfied, you can `echo 1 > /config/vkms/my-device/enabled`.
> This will create a new device according to your configuration.
> 
> For now, this will fail, but the next change will add support for it.
> 
> Signed-off-by: Jim Shargo <jshargo@chromium.org>
> ---
>   Documentation/gpu/vkms.rst           |  17 +-
>   drivers/gpu/drm/Kconfig              |   1 +
>   drivers/gpu/drm/vkms/Makefile        |   1 +
>   drivers/gpu/drm/vkms/vkms_configfs.c | 646 +++++++++++++++++++++++++++
>   drivers/gpu/drm/vkms/vkms_drv.c      |  52 ++-
>   drivers/gpu/drm/vkms/vkms_drv.h      |  92 +++-
>   drivers/gpu/drm/vkms/vkms_output.c   |   5 +
>   7 files changed, 799 insertions(+), 15 deletions(-)
>   create mode 100644 drivers/gpu/drm/vkms/vkms_configfs.c
> 
> diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
> index ba04ac7c2167..2c342ef0fb7b 100644
> --- a/Documentation/gpu/vkms.rst
> +++ b/Documentation/gpu/vkms.rst
> @@ -51,6 +51,12 @@ To disable the driver, use ::
>   
>     sudo modprobe -r vkms
>   
> +Configuration With ConfigFS
> +===========================
> +
> +.. kernel-doc:: drivers/gpu/drm/vkms/vkms_configfs.c
> +   :doc: ConfigFS Support for VKMS
> +
>   Testing With IGT
>   ================
>   
> @@ -135,22 +141,15 @@ project.
>   Runtime Configuration
>   ---------------------
>   
> -We want to be able to reconfigure vkms instance without having to reload the
> -module. Use/Test-cases:
> +We want to vkms instances without having to reload the module. Such

I believe that there is a verb missing here.

> +configuration can be added as extensions to vkms's ConfigFS support. Use-cases:
>   
>   - Hotplug/hotremove connectors on the fly (to be able to test DP MST handling
>     of compositors).
>   
> -- Configure planes/crtcs/connectors (we'd need some code to have more than 1 of
> -  them first).
> -
>   - Change output configuration: Plug/unplug screens, change EDID, allow changing
>     the refresh rate.
>   
> -The currently proposed solution is to expose vkms configuration through
> -configfs. All existing module options should be supported through configfs
> -too.
> -
>   Writeback support
>   -----------------
>   
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index afb3b2f5f425..71eb913b378f 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -262,6 +262,7 @@ config DRM_VKMS
>   	depends on DRM && MMU
>   	select DRM_KMS_HELPER
>   	select DRM_GEM_SHMEM_HELPER
> +	select CONFIGFS_FS
>   	select CRC32
>   	default n
>   	help
> diff --git a/drivers/gpu/drm/vkms/Makefile b/drivers/gpu/drm/vkms/Makefile
> index 1b28a6a32948..6b83907ad554 100644
> --- a/drivers/gpu/drm/vkms/Makefile
> +++ b/drivers/gpu/drm/vkms/Makefile
> @@ -1,5 +1,6 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   vkms-y := \
> +	vkms_configfs.o \
>   	vkms_drv.o \
>   	vkms_plane.o \
>   	vkms_output.o \
> diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
> new file mode 100644
> index 000000000000..544024735d19
> --- /dev/null
> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
> @@ -0,0 +1,646 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +
> +#include <linux/configfs.h>
> +#include <linux/mutex.h>
> +#include <linux/platform_device.h>
> +
> +#include <drm/drm_plane.h>
> +#include <drm/drm_print.h>
> +
> +#include "vkms_drv.h"
> +
> +/**
> + * DOC: ConfigFS Support for VKMS
> + *
> + * VKMS is instrumented with support for configuration via :doc:`ConfigFS
> + * <../filesystems/configfs>`.
> + *
> + * With VKMS installed, you can mount ConfigFS at ``/config/`` like so::
> + *
> + *   mkdir -p /config/
> + *   sudo mount -t configfs none /config
> + *
> + * This allows you to configure multiple virtual devices in addition to an
> + * immutable "default" device created by the driver at initialization time. Note
> + * that the default device is immutable because we cannot pre-populate ConfigFS
> + * directories with normal files.
> + *
> + * To set up a new device, create a new directory under the VKMS configfs
> + * directory::
> + *
> + *   mkdir /config/vkms/test
> + *
> + * With your device created you'll find an new directory ready to be
> + * configured::
> + *
> + *   /config
> + *   `-- vkms
> + *       |-- default
> + *       |   `-- enabled
> + *       `-- test
> + *           |-- connectors
> + *           |-- crtcs
> + *           |-- encoders
> + *           |-- planes
> + *           `-- enabled

I followed this steps and ended up with the following tree:

[root@fedora config]# tree vkms
vkms
└── test
     ├── connectors
     ├── crtcs
     ├── enabled
     ├── encoders
     ├── id
     └── planes

I'm not sure if I did something wrong or if the folder "default" really
shouldn't show. If the folder "default" shouldn't show, it would be nice
to remove it from the docs.

> + *
> + * Each directory you add within the connectors, crtcs, encoders, and planes
> + * directories will let you configure a new object of that type. Adding new
> + * objects will automatically create a set of default files and folders you can
> + * use to configure that object.
> + *
> + * For instance, we can set up a two-output device like so::
> + *
> + *   DRM_PLANE_TYPE_PRIMARY=1
> + *   DRM_PLANE_TYPE_CURSOR=2
> + *   DRM_PLANE_TYPE_OVERLAY=0
> + *
> + *   mkdir /config/vkms/test/planes/primary
> + *   echo $DRM_PLANE_TYPE_PRIMARY > /config/vkms/test/planes/primary/type
> + *
> + *   mkdir /config/vkms/test/planes/other_primary
> + *   echo $DRM_PLANE_TYPE_PRIMARY > /config/vkms/test/planes/other_primary/type
> + *
> + *   mkdir /config/vkms/test/planes/cursor
> + *   echo $DRM_PLANE_TYPE_CURSOR > /config/vkms/test/planes/cursor/type
> + *
> + *   mkdir /config/vkms/test/planes/overlay
> + *   echo $DRM_PLANE_TYPE_OVERLAY > /config/vkms/test/planes/overlay/type
> + *
> + *   mkdir /config/vkms/test/crtcs/crtc
> + *   mkdir /config/vkms/test/crtcs/crtc_other
> + *   mkdir /config/vkms/test/encoders/encoder
> + *   mkdir /config/vkms/test/connectors/connector
> + *
> + * You can see that specific attributes, such as ``.../<plane>/type``, can be
> + * configured by writing into them. Associating objects together can be done via
> + * symlinks::
> + *
> + *   ln -s /config/vkms/test/encoders/encoder /config/vkms/test/connectors/connector/possible_encoders
> + *
> + *   ln -s /config/vkms/test/crtcs/crtc /config/vkms/test/encoders/encoder/possible_crtcs/
> + *   ln -s /config/vkms/test/crtcs/crtc /config/vkms/test/planes/primary/possible_crtcs/
> + *   ln -s /config/vkms/test/crtcs/crtc /config/vkms/test/planes/cursor/possible_crtcs/
> + *   ln -s /config/vkms/test/crtcs/crtc /config/vkms/test/planes/overlay/possible_crtcs/
> + *
> + *   ln -s /config/vkms/test/crtcs/crtc_other /config/vkms/test/planes/overlay/possible_crtcs/
> + *   ln -s /config/vkms/test/crtcs/crtc_other /config/vkms/test/planes/other_primary/possible_crtcs/
> + *
> + * Finally, to enable your configured device, just write 1 to the ``enabled``
> + * file::
> + *
> + *   echo 1 > /config/vkms/test/enabled
> + *
> + * When you're done with the virtual device, you can clean up the device like
> + * so::
> + *
> + *   echo 0 > /config/vkms/test/enabled
> + *
> + *   rm /config/vkms/test/connectors/connector/possible_encoders/encoder
> + *   rm /config/vkms/test/encoders/encoder/possible_crtcs/crtc
> + *   rm /config/vkms/test/planes/primary/possible_crtcs/crtc
> + *   rm /config/vkms/test/planes/cursor/possible_crtcs/crtc
> + *   rm /config/vkms/test/planes/overlay/possible_crtcs/crtc
> + *   rm /config/vkms/test/planes/overlay/possible_crtcs/crtc_other
> + *   rm /config/vkms/test/planes/other_primary/possible_crtcs/crtc_other
> + *
> + *   rmdir /config/vkms/test/planes/primary
> + *   rmdir /config/vkms/test/planes/other_primary
> + *   rmdir /config/vkms/test/planes/cursor
> + *   rmdir /config/vkms/test/planes/overlay
> + *   rmdir /config/vkms/test/crtcs/crtc
> + *   rmdir /config/vkms/test/crtcs/crtc_other
> + *   rmdir /config/vkms/test/encoders/encoder
> + *   rmdir /config/vkms/test/connectors/connector
> + *
> + *   rmdir /config/vkms/test
> + */
> +
> +/*

[...]

> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> index d43121addf66..1b5b7143792f 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -9,7 +9,10 @@
>    * the GPU in DRM API tests.
>    */
>   
> +#include <linux/configfs.h>
>   #include <linux/device.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/err.h>
>   #include <linux/module.h>
>   #include <linux/platform_device.h>
>   #include <linux/dma-mapping.h>
> @@ -152,8 +155,8 @@ static int vkms_modeset_init(struct vkms_device *vkmsdev)
>   	dev->mode_config.preferred_depth = 0;
>   	dev->mode_config.helper_private = &vkms_mode_config_helpers;
>   
> -	return vkmsdev->is_default ? vkms_output_init_default(vkmsdev) :
> -				     -ENOSYS;

Is this middle step really needed?

Best Regards,
- Maíra

> +	return vkmsdev->configfs ? vkms_output_init(vkmsdev) :
> +				   vkms_output_init_default(vkmsdev);
>   }
>   
>   static int vkms_platform_probe(struct platform_device *pdev)
> @@ -165,6 +168,7 @@ static int vkms_platform_probe(struct platform_device *pdev)
>   
>   	grp = devres_open_group(&pdev->dev, NULL, GFP_KERNEL);
>   	if (!grp) {
> +		DRM_ERROR("Could not open devres group\n");
>   		return -ENOMEM;
>   	}
>   
> @@ -179,7 +183,7 @@ static int vkms_platform_probe(struct platform_device *pdev)
>   	vkms_device->config.cursor = enable_cursor;
>   	vkms_device->config.writeback = enable_writeback;
>   	vkms_device->config.overlay = enable_overlay;
> -	vkms_device->is_default = vkms_device_setup->is_default;
> +	vkms_device->configfs = vkms_device_setup->configfs;
>   
>   	ret = dma_coerce_mask_and_coherent(vkms_device->drm.dev,
>   					   DMA_BIT_MASK(64));
> @@ -239,12 +243,43 @@ static struct platform_driver vkms_platform_driver = {
>   	.driver.name = DRIVER_NAME,
>   };
>   
> +struct vkms_device *vkms_add_device(struct vkms_configfs *configfs)
> +{
> +	struct device *dev = NULL;
> +	struct platform_device *pdev;
> +	int max_id = 1;
> +	struct vkms_device_setup vkms_device_setup = {
> +		.configfs = configfs,
> +	};
> +
> +	while ((dev = platform_find_device_by_driver(
> +			dev, &vkms_platform_driver.driver))) {
> +		pdev = to_platform_device(dev);
> +		max_id = max(max_id, pdev->id);
> +	}
> +
> +	pdev = platform_device_register_data(NULL, DRIVER_NAME, max_id + 1,
> +					     &vkms_device_setup,
> +					     sizeof(vkms_device_setup));
> +	if (IS_ERR(pdev)) {
> +		DRM_ERROR("Unable to register vkms device'\n");
> +		return ERR_PTR(PTR_ERR(pdev));
> +	}
> +
> +	return platform_get_drvdata(pdev);
> +}
> +
> +void vkms_remove_device(struct vkms_device *vkms_device)
> +{
> +	platform_device_unregister(vkms_device->platform);
> +}
> +
>   static int __init vkms_init(void)
>   {
>   	int ret;
>   	struct platform_device *pdev;
>   	struct vkms_device_setup vkms_device_setup = {
> -		.is_default = true,
> +		.configfs = NULL,
>   	};
>   
>   	ret = platform_driver_register(&vkms_platform_driver);
> @@ -262,6 +297,13 @@ static int __init vkms_init(void)
>   		return PTR_ERR(pdev);
>   	}
>   
> +	ret = vkms_init_configfs();
> +	if (ret) {
> +		DRM_ERROR("Unable to initialize configfs\n");
> +		platform_device_unregister(pdev);
> +		platform_driver_unregister(&vkms_platform_driver);
> +	}
> +
>   	return 0;
>   }
>   
> @@ -269,6 +311,8 @@ static void __exit vkms_exit(void)
>   {
>   	struct device *dev;
>   
> +	vkms_unregister_configfs();
> +
>   	while ((dev = platform_find_device_by_driver(
>   			NULL, &vkms_platform_driver.driver))) {
>   		// platform_find_device_by_driver increments the refcount. Drop
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index 84b35aa1dc5a..3634eeeb4548 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -3,6 +3,7 @@
>   #ifndef _VKMS_DRV_H_
>   #define _VKMS_DRV_H_
>   
> +#include <linux/configfs.h>
>   #include <linux/hrtimer.h>
>   
>   #include <drm/drm.h>
> @@ -10,6 +11,7 @@
>   #include <drm/drm_gem.h>
>   #include <drm/drm_gem_atomic_helper.h>
>   #include <drm/drm_encoder.h>
> +#include <drm/drm_plane.h>
>   #include <drm/drm_writeback.h>
>   
>   #define XRES_MIN    10
> @@ -127,14 +129,65 @@ struct vkms_config {
>   	bool overlay;
>   };
>   
> +struct vkms_config_links {
> +	struct config_group group;
> +	unsigned long linked_object_bitmap;
> +};
> +
> +struct vkms_config_connector {
> +	struct config_group config_group;
> +	struct vkms_config_links possible_encoders;
> +};
> +
> +struct vkms_config_crtc {
> +	struct config_group config_group;
> +	unsigned long crtc_config_idx;
> +};
> +
> +struct vkms_config_encoder {
> +	struct config_group config_group;
> +	struct vkms_config_links possible_crtcs;
> +	unsigned long encoder_config_idx;
> +};
> +
> +struct vkms_config_plane {
> +	struct vkms_configfs *configfs;
> +	struct config_group config_group;
> +	struct vkms_config_links possible_crtcs;
> +	enum drm_plane_type type;
> +};
> +
> +struct vkms_configfs {
> +	/* Directory group containing connector configs, e.g. /config/vkms/device/ */
> +	struct config_group device_group;
> +	/* Directory group containing connector configs, e.g. /config/vkms/device/connectors/ */
> +	struct config_group connectors_group;
> +	/* Directory group containing CRTC configs, e.g. /config/vkms/device/crtcs/ */
> +	struct config_group crtcs_group;
> +	/* Directory group containing encoder configs, e.g. /config/vkms/device/encoders/ */
> +	struct config_group encoders_group;
> +	/* Directory group containing plane configs, e.g. /config/vkms/device/planes/ */
> +	struct config_group planes_group;
> +
> +	unsigned long allocated_crtcs;
> +	unsigned long allocated_encoders;
> +
> +	struct mutex lock;
> +
> +	/* The platform device if this is registered, otherwise NULL */
> +	struct vkms_device *vkms_device;
> +};
> +
>   struct vkms_device_setup {
> -	bool is_default;
> +	// Is NULL in the case of the default card.
> +	struct vkms_configfs *configfs;
>   };
>   
>   struct vkms_device {
>   	struct drm_device drm;
>   	struct platform_device *platform;
> -	bool is_default;
> +	// Is NULL in the case of the default card.
> +	struct vkms_configfs *configfs;
>   	struct vkms_output output;
>   	struct vkms_config config;
>   };
> @@ -153,11 +206,42 @@ struct vkms_device {
>   #define to_vkms_plane_state(target)\
>   	container_of(target, struct vkms_plane_state, base.base)
>   
> +#define item_to_configfs(item) \
> +	container_of(to_config_group(item), struct vkms_configfs, device_group)
> +
> +#define item_to_config_connector(item)                                    \
> +	container_of(to_config_group(item), struct vkms_config_connector, \
> +		     config_group)
> +
> +#define item_to_config_crtc(item)                                    \
> +	container_of(to_config_group(item), struct vkms_config_crtc, \
> +		     config_group)
> +
> +#define item_to_config_encoder(item)                                    \
> +	container_of(to_config_group(item), struct vkms_config_encoder, \
> +		     config_group)
> +
> +#define item_to_config_plane(item)                                    \
> +	container_of(to_config_group(item), struct vkms_config_plane, \
> +		     config_group)
> +
> +#define item_to_config_links(item) \
> +	container_of(to_config_group(item), struct vkms_config_links, group)
> +
> +#define plane_item_to_configfs(item)                                         \
> +	container_of(to_config_group(item->ci_parent), struct vkms_configfs, \
> +		     planes_group)
> +
> +/* Devices */
> +struct vkms_device *vkms_add_device(struct vkms_configfs *configfs);
> +void vkms_remove_device(struct vkms_device *vkms_device);
> +
>   /* CRTC */
>   struct vkms_crtc *vkms_crtc_init(struct vkms_device *vkmsdev,
>   				 struct drm_plane *primary,
>   				 struct drm_plane *cursor);
>   
> +int vkms_output_init(struct vkms_device *vkmsdev);
>   int vkms_output_init_default(struct vkms_device *vkmsdev);
>   
>   struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
> @@ -179,4 +263,8 @@ void vkms_compose_row(struct line_buffer *stage_buffer, struct vkms_plane_state
>   int vkms_enable_writeback_connector(struct vkms_device *vkmsdev,
>   				    struct vkms_crtc *vkms_crtc);
>   
> +/* ConfigFS Support */
> +int vkms_init_configfs(void);
> +void vkms_unregister_configfs(void);
> +
>   #endif /* _VKMS_DRV_H_ */
> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
> index 3b5e272a8b33..c9e6c653de19 100644
> --- a/drivers/gpu/drm/vkms/vkms_output.c
> +++ b/drivers/gpu/drm/vkms/vkms_output.c
> @@ -177,3 +177,8 @@ int vkms_output_init_default(struct vkms_device *vkmsdev)
>   
>   	return ret;
>   }
> +
> +int vkms_output_init(struct vkms_device *vkmsdev)
> +{
> +	return -ENOTSUPP;
> +}
