Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFBF950BD5
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 19:59:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEF3A10E3C5;
	Tue, 13 Aug 2024 17:59:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="GD0YIdoz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DC8B10E3BE
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 17:59:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4AC89E0006;
 Tue, 13 Aug 2024 17:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1723571946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iK1Hgz4c/YTwt/ibtJWfVTb12twNiGxk2RJjkM+WeL4=;
 b=GD0YIdozFLicL1Hedj2WLuhatMOCLf9+pVOQuHFSKzJifkv0evSGD8Ii8dKEAZ8vyY/hJI
 wmSGnn/yxwV14gyV8za9njOf9RFBLNHkpf6L2R7W8hF/qScZd0n20JWBfScdJYGkozvIvu
 ftomxHN1bAb1FolwyXY5Ci5oOfpZ8cjeqzHxA4Xn0VCa+mPAs7WHbz9ReWIGhXnXHumkse
 m9EfbIslHQuyaSr/74wx2dn8L5xev9bNneWVidgv3/IptJwuzLP7JXwkPsgMnwi2KQPo4d
 OTk76CGGd48lcXy+FIZ9QQh18+QlgSE70X3V+I0rnglVeHa7F2GWJySEi/lSSQ==
Date: Tue, 13 Aug 2024 19:58:59 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Cc: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
 mairacanal@riseup.net, hamohammed.sa@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 11/17] drm/vkms: Add and remove VKMS instances via
 configfs
Message-ID: <Zrue4wWhKmMnJ2fR@louis-chauvet-laptop>
Mail-Followup-To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?=
 <jose.exposito89@gmail.com>, 
 rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
 mairacanal@riseup.net, hamohammed.sa@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240813105134.17439-1-jose.exposito89@gmail.com>
 <20240813105134.17439-12-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240813105134.17439-12-jose.exposito89@gmail.com>
X-GND-Sasl: louis.chauvet@bootlin.com
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

Le 13/08/24 - 12:44, José Expósito a écrit :
> Allow to create, enable, disable and destroy VKMS instances using
> configfs.
> 
> For the moment, add one primary plane, one CRC, one encoder and one
> connector until we add support to configure them via configfs.
> 
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> ---
>  Documentation/gpu/vkms.rst           |  32 +++++
>  drivers/gpu/drm/vkms/Kconfig         |   1 +
>  drivers/gpu/drm/vkms/Makefile        |   3 +-
>  drivers/gpu/drm/vkms/vkms_configfs.c | 198 +++++++++++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_configfs.h |   9 ++
>  drivers/gpu/drm/vkms/vkms_drv.c      |  19 ++-
>  drivers/gpu/drm/vkms/vkms_drv.h      |   4 +
>  7 files changed, 262 insertions(+), 4 deletions(-)
>  create mode 100644 drivers/gpu/drm/vkms/vkms_configfs.c
>  create mode 100644 drivers/gpu/drm/vkms/vkms_configfs.h
> 
> diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
> index ba04ac7c2167..9895a9ae76f4 100644
> --- a/Documentation/gpu/vkms.rst
> +++ b/Documentation/gpu/vkms.rst
> @@ -51,6 +51,38 @@ To disable the driver, use ::
>  
>    sudo modprobe -r vkms
>  
> +Configuring With Configfs
> +=========================
> +
> +It is possible to create and configure multiple VKMS instances via configfs.
> +
> +Start by mounting configfs and loading VKMS::
> +
> +  sudo mount -t configfs none /config
> +  sudo modprobe vkms
> +
> +Once VKMS is loaded, ``/config/vkms`` is created automatically. Each directory
> +under ``/config/vkms`` represents a VKMS instance, create a new one::
> +
> +  sudo mkdir /config/vkms/my-vkms
> +
> +By default, the instance is disabled::
> +
> +  cat /config/vkms/my-vkms/enabled
> +  0
> +
> +Once you are done configuring the VKMS instance, enable it::
> +
> +  echo "1" | sudo tee /config/vkms/my-vkms/enabled
> +
> +Finally, you can remove the VKMS instance disabling it::
> +
> +  echo "0" | sudo tee /config/vkms/my-vkms/enabled
> +
> +Or removing the top level directory::
> +
> +  sudo rmdir /config/vkms/my-vkms
> +

I will explain more in the next commit, but you must not be able to delete 
the device directory without disabling it first.

>  Testing With IGT
>  ================
>  
> diff --git a/drivers/gpu/drm/vkms/Kconfig b/drivers/gpu/drm/vkms/Kconfig
> index b9ecdebecb0b..de218b21a579 100644
> --- a/drivers/gpu/drm/vkms/Kconfig
> +++ b/drivers/gpu/drm/vkms/Kconfig
> @@ -6,6 +6,7 @@ config DRM_VKMS
>  	select DRM_KMS_HELPER
>  	select DRM_GEM_SHMEM_HELPER
>  	select CRC32
> +	select CONFIGFS_FS
>  	default n
>  	help
>  	  Virtual Kernel Mode-Setting (VKMS) is used for testing or for
> diff --git a/drivers/gpu/drm/vkms/Makefile b/drivers/gpu/drm/vkms/Makefile
> index b371b5d70ee3..81c257d37689 100644
> --- a/drivers/gpu/drm/vkms/Makefile
> +++ b/drivers/gpu/drm/vkms/Makefile
> @@ -7,6 +7,7 @@ vkms-y := \
>  	vkms_crtc.o \
>  	vkms_composer.o \
>  	vkms_writeback.o \
> -	vkms_config.o
> +	vkms_config.o \
> +	vkms_configfs.o
>  
>  obj-$(CONFIG_DRM_VKMS) += vkms.o
> diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
> new file mode 100644
> index 000000000000..3f25295f7788
> --- /dev/null
> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
> @@ -0,0 +1,198 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +
> +#include <linux/configfs.h>
> +#include <linux/mutex.h>
> +#include <linux/slab.h>
> +
> +#include "vkms_drv.h"
> +#include "vkms_config.h"
> +#include "vkms_configfs.h"
> +
> +/* To avoid registering configfs more than once or unregistering on error */
> +static bool is_configfs_registered;
> +
> +/**
> + * struct vkms_configfs - Configfs configuration for a VKMS device
> + *
> + * @vkms_config: Configuration of the VKMS device
> + * @device_group: Top level configuration group that represents a VKMS device.
> + * Initialized when a new directory is created under "/config/vkms/"
> + * @lock: Lock used to project concurrent access to the configuration attributes
> + * @enabled: Protected by @lock. The device is created or destroyed when this
> + * option changes
> + */
> +struct vkms_configfs {
> +	struct vkms_config *vkms_config;
> +	struct config_group device_group;
> +
> +	/* protected by @lock */
> +	struct mutex lock;
> +	bool enabled;
> +};
> +
> +#define config_item_to_vkms_configfs(item) \
> +	container_of(to_config_group(item), struct vkms_configfs, device_group)
> +
> +static ssize_t device_enabled_show(struct config_item *item, char *page)
> +{
> +	struct vkms_configfs *configfs = config_item_to_vkms_configfs(item);
> +
> +	return sprintf(page, "%d\n", configfs->enabled);
> +}
> +
> +static ssize_t device_enabled_store(struct config_item *item, const char *page,
> +				    size_t count)
> +{
> +	struct vkms_configfs *configfs = config_item_to_vkms_configfs(item);
> +	bool enabled;
> +	int ret = 0;
> +
> +	if (kstrtobool(page, &enabled))
> +		return -EINVAL;
> +
> +	mutex_lock(&configfs->lock);
> +
> +	if (!configfs->enabled && enabled)
> +		ret = vkms_create(configfs->vkms_config);
> +	else if (configfs->enabled && !enabled)
> +		vkms_destroy(configfs->vkms_config);
> +
> +	if (ret)
> +		goto err_unlock;
> +
> +	configfs->enabled = enabled;
> +
> +	mutex_unlock(&configfs->lock);
> +
> +	return (ssize_t)count;
> +
> +err_unlock:
> +	mutex_unlock(&configfs->lock);
> +	return ret;
> +}
> +
> +CONFIGFS_ATTR(device_, enabled);
> +
> +static struct configfs_attribute *device_group_attrs[] = {
> +	&device_attr_enabled,
> +	NULL,
> +};
> +
> +static const struct config_item_type device_group_type = {
> +	.ct_attrs = device_group_attrs,
> +	.ct_owner = THIS_MODULE,
> +};
> +
> +static struct config_group *make_device_group(struct config_group *group,
> +					      const char *name)
> +{
> +	struct vkms_configfs *configfs;
> +	struct vkms_config_crtc *crtc_cfg = NULL;
> +	struct vkms_config_encoder *encoder_cfg = NULL;
> +	struct vkms_config_connector *connector_cfg = NULL;
> +	char *config_name;
> +	int ret;
> +
> +	if (strcmp(name, DEFAULT_DEVICE_NAME) == 0)
> +		return ERR_PTR(-EINVAL);
> +
> +	configfs = kzalloc(sizeof(*configfs), GFP_KERNEL);
> +	if (!configfs)
> +		return ERR_PTR(-ENOMEM);
> +
> +	config_group_init_type_name(&configfs->device_group, name, &device_group_type);
> +	mutex_init(&configfs->lock);
> +
> +	config_name = config_item_name(&configfs->device_group.cg_item);
> +	configfs->vkms_config = vkms_config_create(config_name);

Here, config_name is managed by configfs, but you use it in a vkms_config 
structure. I don't think this is a good idea, I would prefer to avoid 
mixing lifetimes.

> +	if (IS_ERR(configfs->vkms_config)) {
> +		ret = PTR_ERR(configfs->vkms_config);
> +		goto err_kfree;
> +	}
> +
> +	crtc_cfg = vkms_config_add_crtc(configfs->vkms_config, false, false);
> +	if (IS_ERR(crtc_cfg)) {
> +		ret = PTR_ERR(crtc_cfg);
> +		goto err_kfree;
> +	}
> +
> +	encoder_cfg = vkms_config_add_encoder(configfs->vkms_config, BIT(0));
> +	if (IS_ERR(encoder_cfg)) {
> +		ret = PTR_ERR(encoder_cfg);
> +		goto err_kfree;
> +	}
> +
> +	connector_cfg = vkms_config_add_connector(configfs->vkms_config, BIT(0),
> +						  connector_status_connected);
> +	if (IS_ERR(connector_cfg)) {
> +		ret = PTR_ERR(connector_cfg);
> +		goto err_kfree;
> +	}
> +
> +	return &configfs->device_group;
> +
> +err_kfree:
> +	kfree(configfs);
> +	kfree(crtc_cfg);
> +	kfree(encoder_cfg);
> +	kfree(connector_cfg);

You are not freeing configfs->vkms_config. And it will automatically free 
*_cfg for you ;)

> +	return ERR_PTR(ret);
> +}
> +
> +static void drop_device_group(struct config_group *group,
> +			      struct config_item *item)
> +{
> +	struct vkms_configfs *configfs = config_item_to_vkms_configfs(item);
> +
> +	mutex_lock(&configfs->lock);
> +
> +	if (configfs->enabled)
> +		vkms_destroy(configfs->vkms_config);
> +
> +	kfree(configfs->vkms_config);

You are not freeing stuff added with vkms_config_add_*

> +
> +	mutex_unlock(&configfs->lock);
> +
> +	kfree(configfs);
> +}

If I understood well the configfs documentation, the free of memory should 
not occur in drop, but in release.

Drop should only call configfs_group_put (default behavior) and configfs 
will manage the call to release for you. The same will apply for all the 
next commits.

> +static struct configfs_group_operations device_group_ops = {
> +	.make_group = &make_device_group,
> +	.drop_item = &drop_device_group,
> +};
> +
> +static struct config_item_type vkms_type = {
> +	.ct_group_ops = &device_group_ops,
> +	.ct_owner = THIS_MODULE,
> +};
> +
> +static struct configfs_subsystem vkms_subsys = {
> +	.su_group = {
> +		.cg_item = {
> +			.ci_name = "vkms",
> +			.ci_type = &vkms_type,
> +		},
> +	},
> +	.su_mutex = __MUTEX_INITIALIZER(vkms_subsys.su_mutex),
> +};
> +
> +int vkms_configfs_register(void)
> +{
> +	int ret;
> +
> +	if (is_configfs_registered)
> +		return 0;
> +
> +	config_group_init(&vkms_subsys.su_group);
> +	ret = configfs_register_subsystem(&vkms_subsys);
> +
> +	is_configfs_registered = ret == 0;
> +
> +	return ret;
> +}
> +
> +void vkms_configfs_unregister(void)
> +{
> +	if (is_configfs_registered)
> +		configfs_unregister_subsystem(&vkms_subsys);

I don't see any other users of configfs_unregister_subsystem protecting 
the call. Is it really needed to have is_configfs_registered?

> +}
> diff --git a/drivers/gpu/drm/vkms/vkms_configfs.h b/drivers/gpu/drm/vkms/vkms_configfs.h
> new file mode 100644
> index 000000000000..b5d7fab877d5
> --- /dev/null
> +++ b/drivers/gpu/drm/vkms/vkms_configfs.h
> @@ -0,0 +1,9 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +
> +#ifndef _VKMS_CONFIGFS_H_
> +#define _VKMS_CONFIGFS_H_
> +
> +int vkms_configfs_register(void);
> +void vkms_configfs_unregister(void);
> +
> +#endif /* _VKMS_CONFIGFS_H_ */
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> index b0a079eb4598..f524a9550017 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -27,6 +27,7 @@
>  #include <drm/drm_vblank.h>
>  
>  #include "vkms_config.h"
> +#include "vkms_configfs.h"
>  #include "vkms_drv.h"
>  
>  #define DRIVER_NAME	"vkms"
> @@ -157,7 +158,7 @@ static int vkms_modeset_init(struct vkms_device *vkmsdev)
>  	return vkms_output_init(vkmsdev);
>  }
>  
> -static int vkms_create(struct vkms_config *config)
> +int vkms_create(struct vkms_config *config)
>  {
>  	int ret;
>  	struct platform_device *pdev;
> @@ -231,12 +232,22 @@ static int __init vkms_init(void)
>  
>  	ret = vkms_create(config);
>  	if (ret)
> -		vkms_config_destroy(config);
> +		goto err_kfree;
>  
> +	ret = vkms_configfs_register();
> +	if (ret)
> +		goto err_destroy;
> +
> +	return 0;
> +
> +err_destroy:
> +	vkms_destroy(config);
> +err_kfree:
> +	vkms_config_destroy(config);
>  	return ret;
>  }
>  
> -static void vkms_destroy(struct vkms_config *config)
> +void vkms_destroy(struct vkms_config *config)
>  {
>  	struct platform_device *pdev;
>  
> @@ -257,6 +268,8 @@ static void vkms_destroy(struct vkms_config *config)
>  
>  static void __exit vkms_exit(void)
>  {
> +	vkms_configfs_unregister();
> +
>  	if (default_config->dev)
>  		vkms_destroy(default_config);
>  
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index 76394285dc68..eb32440e9f94 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -143,6 +143,10 @@ struct vkms_device {
>  #define to_vkms_plane_state(target)\
>  	container_of(target, struct vkms_plane_state, base.base)
>  
> +/* VKMS device */
> +int vkms_create(struct vkms_config *config);
> +void vkms_destroy(struct vkms_config *config);
>
>  /* CRTC */
>  struct vkms_crtc *vkms_crtc_init(struct drm_device *dev,
>  				 struct drm_plane *primary,
> -- 
> 2.46.0
> 

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
