Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D646950BDA
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 19:59:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAE9210E3CA;
	Tue, 13 Aug 2024 17:59:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="gzk5Bn6N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EB6410E3C1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 17:59:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A753EFF807;
 Tue, 13 Aug 2024 17:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1723571947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j6lnY0cMAsNxhUdibvgQ6GBpVyXcAk2hquuJau8xGc8=;
 b=gzk5Bn6NR6w6R3RDhSZQcozFm5PuTq4/OA0n9LxtOA+XNRBs+YBs+2XlkHCxj0H7I4RzQ4
 XZLWI1L1IxATgrnrj/KIZT8Xj0cS3MhRHSPEUk0yc4G1aG/8gtZwnPfltN1K/GGGm+jYuf
 uRxM53UAyLGb0XP+j3B/eWXvtWWdC0nD5irxfyfZ/xkPKU81CMI1+nEC3PP6W6pxaLpBoR
 PYHpDdzekyXAnJOO8vLQ2mi/LmkbgNdbHHX7HhxM6FZnbIbfwbC7EsDY4UJpnIkxe+YTYD
 njEtUzUUe4nLSwjCXM4s+311QHX2sauvGgGoeAPzTq5+aghMueoSo+5gwb4zzw==
Date: Tue, 13 Aug 2024 19:59:00 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Cc: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
 mairacanal@riseup.net, hamohammed.sa@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 15/17] drm/vkms: Allow to configure multiple planes
 via configfs
Message-ID: <Zrue5EQOASdi3Q_v@louis-chauvet-laptop>
Mail-Followup-To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?=
 <jose.exposito89@gmail.com>, 
 rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
 mairacanal@riseup.net, hamohammed.sa@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240813105134.17439-1-jose.exposito89@gmail.com>
 <20240813105134.17439-16-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240813105134.17439-16-jose.exposito89@gmail.com>
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
> Create a default subgroup at /config/vkms/planes to allow to create as
> many overlay planes as required. When the plane is created the
> possible_crtcs subgroup is created allowing to link planes and CRTCs.

I think my comment about updating possible_crtc and indexes is very 
important here as the userspace can create and delete crtcs. I don't have 
the time to test today, but there is probably issues again with crtc 
creation/deletion.

> Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> ---
>  Documentation/gpu/vkms.rst           |  13 ++-
>  drivers/gpu/drm/vkms/vkms_config.h   |   3 +
>  drivers/gpu/drm/vkms/vkms_configfs.c | 121 +++++++++++++++++++++++++++
>  3 files changed, 136 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
> index b6ceb8c48310..ee71d1a569dd 100644
> --- a/Documentation/gpu/vkms.rst
> +++ b/Documentation/gpu/vkms.rst
> @@ -78,7 +78,8 @@ And directories are created for each configurable item of the display pipeline::
>      ├── connectors
>      ├── crtcs
>      ├── enabled
> -    └── encoders
> +    ├── encoders
> +    └── planes
>  
>  To add items to the display pipeline, create one or more directories under the
>  available paths.
> @@ -111,6 +112,14 @@ linked to encoders by creating a symbolic link under ``possible_encoders``::
>  
>    sudo ln -s /config/vkms/my-vkms/encoders/encoder0 /config/vkms/my-vkms/connectors/connector0/possible_encoders
>  
> +Finally, create zero or more overlay planes::
> +
> +  sudo mkdir /config/vkms/my-vkms/planes/plane0
> +
> +And link them with their ``possible_crtcs``::
> +
> +  sudo ln -s /config/vkms/my-vkms/crtcs/crtc0 /config/vkms/my-vkms/planes/plane0/possible_crtcs
> +
>  Once you are done configuring the VKMS instance, enable it::
>  
>    echo "1" | sudo tee /config/vkms/my-vkms/enabled
> @@ -128,6 +137,8 @@ Or removing the top level directory and its subdirectories::
>    sudo rmdir /config/vkms/my-vkms/connectors/*
>    sudo rm /config/vkms/my-vkms/encoders/*/possible_crtcs/*
>    sudo rmdir /config/vkms/my-vkms/encoders/*
> +  sudo rm /config/vkms/my-vkms/planes/*/possible_crtcs/*
> +  sudo rmdir /config/vkms/my-vkms/planes/*
>    sudo rmdir /config/vkms/my-vkms/crtcs/*
>    sudo rmdir /config/vkms/my-vkms
>  
> diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
> index cf45e3f6ae92..2ec08bb58ec4 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.h
> +++ b/drivers/gpu/drm/vkms/vkms_config.h
> @@ -14,6 +14,9 @@ struct vkms_device;
>  struct vkms_config_plane {
>  	struct list_head list;
>  	uint32_t possible_crtcs;
> +	/* only used if created from configfs */
> +	struct config_group plane_group;
> +	struct config_group possible_crtcs_group;
>  };
>  
>  struct vkms_config_crtc {
> diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
> index d2369f53e2d8..0b5ac0767da0 100644
> --- a/drivers/gpu/drm/vkms/vkms_configfs.c
> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
> @@ -23,6 +23,8 @@ static bool is_configfs_registered;
>   * "/config/vkms/encoders". Each of its items represent a encoder
>   * @connectors_group: Default subgroup of @device_group at
>   * "/config/vkms/connectors". Each of its items represent a connector
> + * @planes_group: Default subgroup of @device_group at "/config/vkms/planes".
> + * Each of its items represent an overlay plane
>   * @lock: Lock used to project concurrent access to the configuration attributes
>   * @enabled: Protected by @lock. The device is created or destroyed when this
>   * option changes
> @@ -33,6 +35,7 @@ struct vkms_configfs {
>  	struct config_group crtcs_group;
>  	struct config_group encoders_group;
>  	struct config_group connectors_group;
> +	struct config_group planes_group;
>  
>  	/* protected by @lock */
>  	struct mutex lock;
> @@ -72,6 +75,15 @@ struct vkms_configfs {
>  #define connector_possible_encoders_item_to_vkms_config_connector(item) \
>  	container_of(to_config_group(item), struct vkms_config_connector, possible_encoders_group)
>  
> +#define planes_group_to_vkms_configfs(group) \
> +	container_of(group, struct vkms_configfs, planes_group)
> +
> +#define planes_item_to_vkms_config_plane(item) \
> +	container_of(to_config_group(item), struct vkms_config_plane, plane_group)
> +
> +#define plane_possible_crtcs_item_to_vkms_config_plane(item) \
> +	container_of(to_config_group(item), struct vkms_config_plane, possible_crtcs_group)
> +
>  static ssize_t crtc_cursor_show(struct config_item *item, char *page)
>  {
>  	struct vkms_config_crtc *crtc_cfg = crtcs_item_to_vkms_config_crtc(item);
> @@ -450,6 +462,110 @@ static struct config_item_type connectors_group_type = {
>  	.ct_owner = THIS_MODULE,
>  };
>  
> +static int plane_possible_crtcs_allow_link(struct config_item *src,
> +					   struct config_item *target)
> +{
> +	struct vkms_config_plane *plane_cfg;
> +	struct vkms_config_crtc *crtc_cfg;
> +
> +	if (target->ci_type != &crtc_group_type)
> +		return -EINVAL;
> +
> +	plane_cfg = plane_possible_crtcs_item_to_vkms_config_plane(src);
> +	crtc_cfg = crtcs_item_to_vkms_config_crtc(target);
> +
> +	if (plane_cfg->possible_crtcs & BIT(crtc_cfg->index))
> +		return -EINVAL;
> +
> +	plane_cfg->possible_crtcs |= BIT(crtc_cfg->index);
> +
> +	return 0;
> +}
> +
> +static void plane_possible_crtcs_drop_link(struct config_item *src,
> +					   struct config_item *target)
> +{
> +	struct vkms_config_plane *plane_cfg;
> +	struct vkms_config_crtc *crtc_cfg;
> +
> +	plane_cfg = plane_possible_crtcs_item_to_vkms_config_plane(src);
> +	crtc_cfg = crtcs_item_to_vkms_config_crtc(target);
> +
> +	plane_cfg->possible_crtcs &= ~BIT(crtc_cfg->index);
> +}
> +
> +static struct configfs_item_operations plane_possible_crtcs_item_ops = {
> +	.allow_link = &plane_possible_crtcs_allow_link,
> +	.drop_link = &plane_possible_crtcs_drop_link,
> +};
> +
> +static struct config_item_type plane_possible_crtcs_group_type = {
> +	.ct_item_ops = &plane_possible_crtcs_item_ops,
> +	.ct_owner = THIS_MODULE,
> +};
> +
> +static const struct config_item_type plane_group_type = {
> +	.ct_owner = THIS_MODULE,
> +};
> +
> +static struct config_group *make_planes_group(struct config_group *group,
> +					      const char *name)
> +{
> +	struct vkms_configfs *configfs = planes_group_to_vkms_configfs(group);
> +	struct vkms_config_plane *plane_cfg;
> +	int ret;
> +
> +	mutex_lock(&configfs->lock);
> +
> +	if (configfs->enabled) {
> +		ret = -EINVAL;
> +		goto err_unlock;
> +	}
> +
> +	plane_cfg = vkms_config_add_overlay_plane(configfs->vkms_config, 0);
> +	if (IS_ERR(plane_cfg)) {
> +		ret = PTR_ERR(plane_cfg);
> +		goto err_unlock;
> +	}
> +
> +	config_group_init_type_name(&plane_cfg->plane_group, name,
> +				    &plane_group_type);
> +
> +	config_group_init_type_name(&plane_cfg->possible_crtcs_group,
> +				    "possible_crtcs",
> +				    &plane_possible_crtcs_group_type);
> +	configfs_add_default_group(&plane_cfg->possible_crtcs_group,
> +				   &plane_cfg->plane_group);
> +
> +	mutex_unlock(&configfs->lock);
> +
> +	return &plane_cfg->plane_group;
> +
> +err_unlock:
> +	mutex_unlock(&configfs->lock);
> +	return ERR_PTR(ret);
> +}

If I understand properly your code, there is no way to configure primary 
and cursor planes? If we want to introduce it later, I think we will break 
the uAPI, so it will be difficult.

> +
> +static void drop_planes_group(struct config_group *group,
> +			      struct config_item *item)
> +{
> +	struct vkms_configfs *configfs = planes_group_to_vkms_configfs(group);
> +	struct vkms_config_plane *plane_cfg =
> +		planes_item_to_vkms_config_plane(item);
> +
> +	vkms_config_destroy_overlay_plane(configfs->vkms_config, plane_cfg);
> +}
> +
> +static struct configfs_group_operations planes_group_ops = {
> +	.make_group = &make_planes_group,
> +	.drop_item = &drop_planes_group,
> +};
> +
> +static struct config_item_type planes_group_type = {
> +	.ct_group_ops = &planes_group_ops,
> +	.ct_owner = THIS_MODULE,
> +};
> +
>  static ssize_t device_enabled_show(struct config_item *item, char *page)
>  {
>  	struct vkms_configfs *configfs = config_item_to_vkms_configfs(item);
> @@ -538,6 +654,11 @@ static struct config_group *make_device_group(struct config_group *group,
>  	configfs_add_default_group(&configfs->connectors_group,
>  				   &configfs->device_group);
>  
> +	config_group_init_type_name(&configfs->planes_group, "planes",
> +				    &planes_group_type);
> +	configfs_add_default_group(&configfs->planes_group,
> +				   &configfs->device_group);
> +
>  	return &configfs->device_group;
>  }
>  
> -- 
> 2.46.0
> 

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
