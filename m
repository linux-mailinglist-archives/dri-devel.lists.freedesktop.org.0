Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A17950BD0
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 19:59:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35B8F10E3BF;
	Tue, 13 Aug 2024 17:59:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="d7uMedKy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D23A10E3BD
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 17:59:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9B0CCE0007;
 Tue, 13 Aug 2024 17:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1723571946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lIkQrkEd8n0E04wxF41n7IQIaihwVSISMemOCN1Jpac=;
 b=d7uMedKy3TPH4rzYdOAlnGnuZYJFx01wkNRTwZKW1mhRKcSYhLw6osmAXpaPn2y23JQINW
 N9prRwMiFCPfXrsw+oGp8E7FkiIxBsNcs0kcpHhcLQzHSsUkkHo+EfAirJnuKBYLVZqV/P
 4MTFZjHAmp00crqpI43m0uN5ls6F1LrswaP1kEawR1vBjHrVkXDtLaZwvzn8l7f2lUHUWR
 XOihZMJtqofitC10hKFJS+x6QL/rymhTMyFB29ewXy7Qyf1JL0p9+44oEfcBL41s+ltY3j
 lIuDQcKkdzQ7lJUBIBqXP2wTvp7rAPNBEdQV9sVFpvdNMwLCqwbCRzaHJr0BKw==
Date: Tue, 13 Aug 2024 19:58:59 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Cc: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
 mairacanal@riseup.net, hamohammed.sa@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 12/17] drm/vkms: Allow to configure multiple CRTCs
 via configfs
Message-ID: <Zrue4yt_tGpufiMb@louis-chauvet-laptop>
Mail-Followup-To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?=
 <jose.exposito89@gmail.com>, 
 rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
 mairacanal@riseup.net, hamohammed.sa@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240813105134.17439-1-jose.exposito89@gmail.com>
 <20240813105134.17439-13-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240813105134.17439-13-jose.exposito89@gmail.com>
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
> Create a default subgroup at /config/vkms/crtcs to allow to create as
> many CRTCs as required. When a CRTC is created, allow to configure the
> equivalent of the module parameters enable_cursor and enable_writeback.

I think this commit is not bissectable, you have issue with:

	mkdir /config/vkms/my-vkms
	mkdir /config/vkms/my-vkms/crtcs/1
	rmdir /config/vkms/my-vkms/crtcs/1
	mkdir /config/vkms/my-vkms/crtcs/1
	echo 1 > /config/vkms/my-vkms/enabled
	# Not a crash, but drm is complaining
	
and also when creating many crtcs:

	mkdir /config/vkms/my-vkms
	mkdir /config/vkms/my-vkms/crtcs/{1..32}
	mkdir /config/vkms/my-vkms/crtcs/33 # Should be forbidden (I also 
					forgot to manage this case)
	echo 1 > /config/vkms/my-vkms/enabled
	# DRM is complaining

or

	mkdir /config/vkms/my-vkms
	mkdir /config/vkms/my-vkms/crtcs/{1..32}
	rmdir /config/vkms/my-vkms/crtcs/31 # not 32 because the index 
						will works "by chance"
	mkdir /config/vkms/my-vkms/crtcs/31
	echo 1 > /config/vkms/my-vkms/enabled
       	# DRM is complaining

> Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> ---
>  Documentation/gpu/vkms.rst           |  22 +++-
>  drivers/gpu/drm/vkms/vkms_config.h   |   3 +
>  drivers/gpu/drm/vkms/vkms_configfs.c | 149 +++++++++++++++++++++++++--
>  3 files changed, 166 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
> index 9895a9ae76f4..0886349ad4a0 100644
> --- a/Documentation/gpu/vkms.rst
> +++ b/Documentation/gpu/vkms.rst
> @@ -71,6 +71,25 @@ By default, the instance is disabled::
>    cat /config/vkms/my-vkms/enabled
>    0
>  
> +And directories are created for each configurable item of the display pipeline::
> +
> +  tree /config/vkms/my-vkms
> +    /config/vkms/my-vkms
> +    ├── crtcs
> +    └── enabled
> +
> +To add items to the display pipeline, create one or more directories under the
> +available paths.
> +
> +Start by creating one or more CRTCs::
> +
> +  sudo mkdir /config/vkms/my-vkms/crtcs/crtc0
> +
> +CRTCs have 2 configurable attributes:
> +
> +- cursor: Enable or disable cursor plane support
> +- writeback: Enable or disable writeback connector support
> +
>  Once you are done configuring the VKMS instance, enable it::
>  
>    echo "1" | sudo tee /config/vkms/my-vkms/enabled
> @@ -79,8 +98,9 @@ Finally, you can remove the VKMS instance disabling it::
>  
>    echo "0" | sudo tee /config/vkms/my-vkms/enabled
>  
> -Or removing the top level directory::
> +Or removing the top level directory and its subdirectories::
>  
> +  sudo rmdir /config/vkms/my-vkms/crtcs/*
>    sudo rmdir /config/vkms/my-vkms

Here, I really don't like this way to delete a device, because you may 
lost objects later.

For example, if we take a connector, we want the let the userspace 
connecting and disconnecting it, so something like

	echo 1 > /config/vkms/my-vkms/connectors/my_conn/connected
	echo 0 > /config/vkms/my-vkms/connectors/my_conn/connected
  
But in the same time, we allows the userspace to delete directory, so you 
may "loose" your connector

	echo 1 > /config/vkms/my-vkms/connectors/my_conn/connected
	rmdir /config/vkms/my-vkms/connectors/my_conn/
	# no way to disconnect it now! you must completly delete the 
	# device and create a new one

So I think we should totally forbid the deletion of anything if 
the device is enabled. So to delete one device, you have to:

	echo 0 > /config/vkms/my-vkms/enabled
	rmdir /config/vkms/my_vkms/{everything}

>  Testing With IGT
> diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
> index 3237406fa3a3..f96a0456a3d7 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.h
> +++ b/drivers/gpu/drm/vkms/vkms_config.h
> @@ -3,6 +3,7 @@
>  #ifndef _VKMS_CONFIG_H_
>  #define _VKMS_CONFIG_H_
>  
> +#include <linux/configfs.h>
>  #include <linux/list.h>
>  #include <linux/types.h>
>  
> @@ -20,6 +21,8 @@ struct vkms_config_crtc {
>  	unsigned int index;
>  	bool cursor;
>  	bool writeback;
> +	/* only used if created from configfs */
> +	struct config_group crtc_group;

I don't really like the idea of mixing configfs structure and vkms 
configuration. Both can have different lifetime and are created in 
different places.

You already created a vkms_configfs_device structure, why not for a 
vkms_configfs_crtc?

>  };
>  
>  struct vkms_config_encoder {
> diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
> index 3f25295f7788..04278a39cd3c 100644
> --- a/drivers/gpu/drm/vkms/vkms_configfs.c
> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
> @@ -17,6 +17,8 @@ static bool is_configfs_registered;
>   * @vkms_config: Configuration of the VKMS device
>   * @device_group: Top level configuration group that represents a VKMS device.
>   * Initialized when a new directory is created under "/config/vkms/"
> + * @crtcs_group: Default subgroup of @device_group at "/config/vkms/crtcs".
> + * Each of its items represent a CRTC
>   * @lock: Lock used to project concurrent access to the configuration attributes
>   * @enabled: Protected by @lock. The device is created or destroyed when this
>   * option changes
> @@ -24,6 +26,7 @@ static bool is_configfs_registered;
>  struct vkms_configfs {
>  	struct vkms_config *vkms_config;
>  	struct config_group device_group;
> +	struct config_group crtcs_group;
>  
>  	/* protected by @lock */
>  	struct mutex lock;
> @@ -33,6 +36,141 @@ struct vkms_configfs {
>  #define config_item_to_vkms_configfs(item) \
>  	container_of(to_config_group(item), struct vkms_configfs, device_group)
>  
> +#define crtcs_group_to_vkms_configfs(group) \
> +	container_of(group, struct vkms_configfs, crtcs_group)
> +
> +#define crtcs_item_to_vkms_configfs(item) \
> +	container_of(to_config_group(item), struct vkms_configfs, crtcs_group)
> +
> +#define crtcs_item_to_vkms_config_crtc(item) \
> +	container_of(to_config_group(item), struct vkms_config_crtc, crtc_group)
> +
> +static ssize_t crtc_cursor_show(struct config_item *item, char *page)
> +{
> +	struct vkms_config_crtc *crtc_cfg = crtcs_item_to_vkms_config_crtc(item);
> +
> +	return sprintf(page, "%d\n", crtc_cfg->cursor);
> +}
> +
> +static ssize_t crtc_cursor_store(struct config_item *item, const char *page,
> +				 size_t count)
> +{
> +	struct vkms_configfs *configfs = crtcs_item_to_vkms_configfs(item->ci_parent);
> +	struct vkms_config_crtc *crtc_cfg = crtcs_item_to_vkms_config_crtc(item);
> +	bool cursor;
> +
> +	if (kstrtobool(page, &cursor))
> +		return -EINVAL;
> +
> +	mutex_lock(&configfs->lock);
> +
> +	if (configfs->enabled) {
> +		mutex_unlock(&configfs->lock);
> +		return -EINVAL;
> +	}
> +
> +	crtc_cfg->cursor = cursor;
> +
> +	mutex_unlock(&configfs->lock);
> +
> +	return (ssize_t)count;

Same comment as for vkms_config, why cursor is hardcoded here? It should 
be as configurable as other planes (size, color formats...).

> +
> +static ssize_t crtc_writeback_show(struct config_item *item, char *page)
> +{
> +	struct vkms_config_crtc *crtc_cfg = crtcs_item_to_vkms_config_crtc(item);
> +
> +	return sprintf(page, "%d\n", crtc_cfg->writeback);
> +}
>
> +static ssize_t crtc_writeback_store(struct config_item *item, const char *page,
> +				    size_t count)
> +{
> +	struct vkms_configfs *configfs = crtcs_item_to_vkms_configfs(item->ci_parent);
> +	struct vkms_config_crtc *crtc_cfg = crtcs_item_to_vkms_config_crtc(item);
> +	bool writeback;
> +
> +	if (kstrtobool(page, &writeback))
> +		return -EINVAL;
> +
> +	mutex_lock(&configfs->lock);
> +
> +	if (configfs->enabled) {
> +		mutex_unlock(&configfs->lock);
> +		return -EINVAL;
> +	}
> +
> +	crtc_cfg->writeback = writeback;
> +
> +	mutex_unlock(&configfs->lock);
> +
> +	return (ssize_t)count;
> +}
> +
> +CONFIGFS_ATTR(crtc_, cursor);
> +CONFIGFS_ATTR(crtc_, writeback);
> +
> +static struct configfs_attribute *crtc_group_attrs[] = {
> +	&crtc_attr_cursor,
> +	&crtc_attr_writeback,
> +	NULL,
> +};
> +
> +static const struct config_item_type crtc_group_type = {
> +	.ct_attrs = crtc_group_attrs,
> +	.ct_owner = THIS_MODULE,
> +};
> +
> +static struct config_group *make_crtcs_group(struct config_group *group,
> +					     const char *name)
> +{
> +	struct vkms_configfs *configfs = crtcs_group_to_vkms_configfs(group);
> +	struct vkms_config_crtc *crtc_cfg;
> +	int ret;
> +
> +	mutex_lock(&configfs->lock);
> +
> +	if (configfs->enabled) {
> +		ret = -EINVAL;
> +		goto err_unlock;
> +	}
> +
> +	crtc_cfg = vkms_config_add_crtc(configfs->vkms_config, false, false);
> +	if (IS_ERR(crtc_cfg)) {
> +		ret = PTR_ERR(crtc_cfg);
> +		goto err_unlock;
> +	}
> +
> +	config_group_init_type_name(&crtc_cfg->crtc_group, name, &crtc_group_type);
> +
> +	mutex_unlock(&configfs->lock);
> +
> +	return &crtc_cfg->crtc_group;
> +
> +err_unlock:
> +	mutex_unlock(&configfs->lock);
> +	return ERR_PTR(ret);
> +}
> +
> +static void drop_crtcs_group(struct config_group *group,
> +			     struct config_item *item)
> +{
> +	struct vkms_configfs *configfs = crtcs_group_to_vkms_configfs(group);
> +	struct vkms_config_crtc *crtc_cfg = crtcs_item_to_vkms_config_crtc(item);
> +
> +	vkms_config_destroy_crtc(configfs->vkms_config, crtc_cfg);
> +}

Again, free should be in release, not in drop.

And by the way, here you will have the problem I described before: the 
vkms_config_destroy_crtc does not update possible_crtcs fields, so they 
became complelty invalids.

And you also have the issue of invalid index, you can create 32 crtcs, 
delete 32 and recreate 32, the userspace expect it to works (only 32 
crtcs, wich is the maximum allowed by drm), but the index used in 
vkms_config are 32..64, which are invalid.

> +
> +static struct configfs_group_operations crtcs_group_ops = {
> +	.make_group = &make_crtcs_group,
> +	.drop_item = &drop_crtcs_group,
> +};
> +
> +static struct config_item_type crtcs_group_type = {
> +	.ct_group_ops = &crtcs_group_ops,
> +	.ct_owner = THIS_MODULE,
> +};
> +
>  static ssize_t device_enabled_show(struct config_item *item, char *page)
>  {
>  	struct vkms_configfs *configfs = config_item_to_vkms_configfs(item);
> @@ -87,7 +225,6 @@ static struct config_group *make_device_group(struct config_group *group,
>  					      const char *name)
>  {
>  	struct vkms_configfs *configfs;
> -	struct vkms_config_crtc *crtc_cfg = NULL;
>  	struct vkms_config_encoder *encoder_cfg = NULL;
>  	struct vkms_config_connector *connector_cfg = NULL;
>  	char *config_name;
> @@ -110,11 +247,10 @@ static struct config_group *make_device_group(struct config_group *group,
>  		goto err_kfree;
>  	}
>  
> -	crtc_cfg = vkms_config_add_crtc(configfs->vkms_config, false, false);
> -	if (IS_ERR(crtc_cfg)) {
> -		ret = PTR_ERR(crtc_cfg);
> -		goto err_kfree;
> -	}
> +	config_group_init_type_name(&configfs->crtcs_group, "crtcs",
> +				    &crtcs_group_type);
> +	configfs_add_default_group(&configfs->crtcs_group,
> +				   &configfs->device_group);
>
>  	encoder_cfg = vkms_config_add_encoder(configfs->vkms_config, BIT(0));
>  	if (IS_ERR(encoder_cfg)) {
> @@ -133,7 +269,6 @@ static struct config_group *make_device_group(struct config_group *group,
>  
>  err_kfree:
>  	kfree(configfs);
> -	kfree(crtc_cfg);
>  	kfree(encoder_cfg);
>  	kfree(connector_cfg);
>  	return ERR_PTR(ret);
> -- 
> 2.46.0
> 

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
