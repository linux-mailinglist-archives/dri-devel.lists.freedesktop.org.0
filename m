Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DBC950BD2
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 19:59:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31E8710E3C1;
	Tue, 13 Aug 2024 17:59:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="AdlFFVVz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F57D10E3C1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 17:59:09 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3835820007;
 Tue, 13 Aug 2024 17:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1723571947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p2JpmoK7gE+KJoniDAykDf+cChXQcy8J8qPiiNB0oaE=;
 b=AdlFFVVz/2wIoUuSIBIWpt0L5th9pzQPNtXJTQloRv84SnmBEgVHSuY1KAwsbUFMFNJR0R
 mtq8Oa34sHOTzHS1o0+TVXb+fm67s2OyGOC4+PebjWSRopHb+R0AlMje2SfIpdLVF4DMaX
 rzZ3fjoHbxJ0E9cnr7jiiApOu3PpZ+8ej2QRkjmJI+rXQkbItAdARH2Tsa0o1lTbmC8rU5
 AYvRe8TGsSty063Xs+nzkrhNKJEVit+kDXMBt8t6S93r8tABo4zFPEKMjw5gkZ6tbR0+Vw
 UgUt6HvsZr5tH3brNHRASjoK6We8CtSptmfolypKzYLbrWl0fKc5R330vKq1zw==
Date: Tue, 13 Aug 2024 19:58:59 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Cc: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
 mairacanal@riseup.net, hamohammed.sa@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 13/17] drm/vkms: Allow to configure multiple encoders
 via configfs
Message-ID: <Zrue453QBrJSV4Rl@louis-chauvet-laptop>
Mail-Followup-To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?=
 <jose.exposito89@gmail.com>, 
 rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
 mairacanal@riseup.net, hamohammed.sa@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240813105134.17439-1-jose.exposito89@gmail.com>
 <20240813105134.17439-14-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240813105134.17439-14-jose.exposito89@gmail.com>
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
> Create a default subgroup at /config/vkms/encoders to allow to create as
> many encoders as required. When the encoder is created the
> possible_crtcs subgroup is created allowing to link encoders and CRTCs.

I did not test, but the issue about index for crtc are maybe the same for 
encoders.
 
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> ---
>  Documentation/gpu/vkms.rst           |  14 ++-
>  drivers/gpu/drm/vkms/vkms_config.h   |   3 +
>  drivers/gpu/drm/vkms/vkms_configfs.c | 127 +++++++++++++++++++++++++--
>  3 files changed, 136 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
> index 0886349ad4a0..c69be063d3b4 100644
> --- a/Documentation/gpu/vkms.rst
> +++ b/Documentation/gpu/vkms.rst
> @@ -76,7 +76,8 @@ And directories are created for each configurable item of the display pipeline::
>    tree /config/vkms/my-vkms
>      /config/vkms/my-vkms
>      ├── crtcs
> -    └── enabled
> +    ├── enabled
> +    └── encoders
>  
>  To add items to the display pipeline, create one or more directories under the
>  available paths.
> @@ -90,6 +91,15 @@ CRTCs have 2 configurable attributes:
>  - cursor: Enable or disable cursor plane support
>  - writeback: Enable or disable writeback connector support
>  
> +Continue by creating one or more encoders::
> +
> +  sudo mkdir /config/vkms/my-vkms/encoders/encoder0
> +
> +Encoders can be linked to CRTCs by creating a symbolic link under
> +``possible_crtcs``::
> +
> +  sudo ln -s /config/vkms/my-vkms/crtcs/crtc0 /config/vkms/my-vkms/encoders/encoder0/possible_crtcs
> +
>  Once you are done configuring the VKMS instance, enable it::
>  
>    echo "1" | sudo tee /config/vkms/my-vkms/enabled
> @@ -100,6 +110,8 @@ Finally, you can remove the VKMS instance disabling it::
>  
>  Or removing the top level directory and its subdirectories::
>  
> +  sudo rm /config/vkms/my-vkms/encoders/*/possible_crtcs/*
> +  sudo rmdir /config/vkms/my-vkms/encoders/*
>    sudo rmdir /config/vkms/my-vkms/crtcs/*
>    sudo rmdir /config/vkms/my-vkms

Same comment as previously, I think we should forbid this way to delete an 
instance.

> diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
> index f96a0456a3d7..f9423533a7f3 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.h
> +++ b/drivers/gpu/drm/vkms/vkms_config.h
> @@ -29,6 +29,9 @@ struct vkms_config_encoder {
>  	struct list_head list;
>  	unsigned int index;
>  	uint32_t possible_crtcs;
> +	/* only used if created from configfs */
> +	struct config_group encoder_group;
> +	struct config_group possible_crtcs_group;

Again, I don't like mixing configfs and vkms_config. Can we keep both 
stuff splitted?

>  };
>  
>  struct vkms_config_connector {
> diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
> index 04278a39cd3c..c0b62fb93dc0 100644
> --- a/drivers/gpu/drm/vkms/vkms_configfs.c
> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
> @@ -19,6 +19,8 @@ static bool is_configfs_registered;
>   * Initialized when a new directory is created under "/config/vkms/"
>   * @crtcs_group: Default subgroup of @device_group at "/config/vkms/crtcs".
>   * Each of its items represent a CRTC
> + * @encoders_group: Default subgroup of @device_group at
> + * "/config/vkms/encoders". Each of its items represent a encoder
>   * @lock: Lock used to project concurrent access to the configuration attributes
>   * @enabled: Protected by @lock. The device is created or destroyed when this
>   * option changes
> @@ -27,6 +29,7 @@ struct vkms_configfs {
>  	struct vkms_config *vkms_config;
>  	struct config_group device_group;
>  	struct config_group crtcs_group;
> +	struct config_group encoders_group;
>  
>  	/* protected by @lock */
>  	struct mutex lock;
> @@ -45,6 +48,15 @@ struct vkms_configfs {
>  #define crtcs_item_to_vkms_config_crtc(item) \
>  	container_of(to_config_group(item), struct vkms_config_crtc, crtc_group)
>  
> +#define encoders_group_to_vkms_configfs(group) \
> +	container_of(group, struct vkms_configfs, encoders_group)
> +
> +#define encoders_item_to_vkms_config_encoder(item) \
> +	container_of(to_config_group(item), struct vkms_config_encoder, encoder_group)
> +
> +#define encoder_possible_crtcs_item_to_vkms_config_encoder(item) \
> +	container_of(to_config_group(item), struct vkms_config_encoder, possible_crtcs_group)
> +
>  static ssize_t crtc_cursor_show(struct config_item *item, char *page)
>  {
>  	struct vkms_config_crtc *crtc_cfg = crtcs_item_to_vkms_config_crtc(item);
> @@ -171,6 +183,110 @@ static struct config_item_type crtcs_group_type = {
>  	.ct_owner = THIS_MODULE,
>  };
>  
> +static int encoder_possible_crtcs_allow_link(struct config_item *src,
> +					     struct config_item *target)
> +{
> +	struct vkms_config_encoder *encoder_cfg;
> +	struct vkms_config_crtc *crtc_cfg;
> +
> +	if (target->ci_type != &crtc_group_type)
> +		return -EINVAL;

I also need to check on my implementation, be we also need to check if the 
target is in the correct device, not only the correct type :)

> +
> +	encoder_cfg = encoder_possible_crtcs_item_to_vkms_config_encoder(src);
> +	crtc_cfg = crtcs_item_to_vkms_config_crtc(target);
> +
> +	if (encoder_cfg->possible_crtcs & BIT(crtc_cfg->index))
> +		return -EINVAL;
> +
> +	encoder_cfg->possible_crtcs |= BIT(crtc_cfg->index);
> +
> +	return 0;
> +}
> +
> +static void encoder_possible_crtcs_drop_link(struct config_item *src,
> +					     struct config_item *target)
> +{
> +	struct vkms_config_encoder *encoder_cfg;
> +	struct vkms_config_crtc *crtc_cfg;
> +
> +	encoder_cfg = encoder_possible_crtcs_item_to_vkms_config_encoder(src);
> +	crtc_cfg = crtcs_item_to_vkms_config_crtc(target);
> +
> +	encoder_cfg->possible_crtcs &= ~BIT(crtc_cfg->index);
> +}
> +
> +static struct configfs_item_operations encoder_possible_crtcs_item_ops = {
> +	.allow_link = &encoder_possible_crtcs_allow_link,
> +	.drop_link = &encoder_possible_crtcs_drop_link,
> +};
> +
> +static struct config_item_type encoder_possible_crtcs_group_type = {
> +	.ct_item_ops = &encoder_possible_crtcs_item_ops,
> +	.ct_owner = THIS_MODULE,
> +};
> +
> +static const struct config_item_type encoder_group_type = {
> +	.ct_owner = THIS_MODULE,
> +};
> +
> +static struct config_group *make_encoders_group(struct config_group *group,
> +						const char *name)
> +{
> +	struct vkms_configfs *configfs = encoders_group_to_vkms_configfs(group);
> +	struct vkms_config_encoder *encoder_cfg;
> +	int ret;
> +
> +	mutex_lock(&configfs->lock);
> +
> +	if (configfs->enabled) {
> +		ret = -EINVAL;
> +		goto err_unlock;
> +	}
> +
> +	encoder_cfg = vkms_config_add_encoder(configfs->vkms_config, 0);
> +	if (IS_ERR(encoder_cfg)) {
> +		ret = PTR_ERR(encoder_cfg);
> +		goto err_unlock;
> +	}
> +
> +	config_group_init_type_name(&encoder_cfg->encoder_group, name,
> +				    &encoder_group_type);
> +
> +	config_group_init_type_name(&encoder_cfg->possible_crtcs_group,
> +				    "possible_crtcs",
> +				    &encoder_possible_crtcs_group_type);
> +	configfs_add_default_group(&encoder_cfg->possible_crtcs_group,
> +				   &encoder_cfg->encoder_group);
> +
> +	mutex_unlock(&configfs->lock);
> +
> +	return &encoder_cfg->encoder_group;
> +
> +err_unlock:
> +	mutex_unlock(&configfs->lock);
> +	return ERR_PTR(ret);
> +}
> +
> +static void drop_encoders_group(struct config_group *group,
> +				struct config_item *item)
> +{
> +	struct vkms_configfs *configfs = encoders_group_to_vkms_configfs(group);
> +	struct vkms_config_encoder *encoder_cfg =
> +		encoders_item_to_vkms_config_encoder(item);
> +
> +	vkms_config_destroy_encoder(configfs->vkms_config, encoder_cfg);
> +}

Same, I think there should not be any free in drop.

> +
> +static struct configfs_group_operations encoders_group_ops = {
> +	.make_group = &make_encoders_group,
> +	.drop_item = &drop_encoders_group,
> +};
> +
> +static struct config_item_type encoders_group_type = {
> +	.ct_group_ops = &encoders_group_ops,
> +	.ct_owner = THIS_MODULE,
> +};
> +
>  static ssize_t device_enabled_show(struct config_item *item, char *page)
>  {
>  	struct vkms_configfs *configfs = config_item_to_vkms_configfs(item);
> @@ -225,7 +341,6 @@ static struct config_group *make_device_group(struct config_group *group,
>  					      const char *name)
>  {
>  	struct vkms_configfs *configfs;
> -	struct vkms_config_encoder *encoder_cfg = NULL;
>  	struct vkms_config_connector *connector_cfg = NULL;
>  	char *config_name;
>  	int ret;
> @@ -252,11 +367,10 @@ static struct config_group *make_device_group(struct config_group *group,
>  	configfs_add_default_group(&configfs->crtcs_group,
>  				   &configfs->device_group);
>  
> -	encoder_cfg = vkms_config_add_encoder(configfs->vkms_config, BIT(0));
> -	if (IS_ERR(encoder_cfg)) {
> -		ret = PTR_ERR(encoder_cfg);
> -		goto err_kfree;
> -	}
> +	config_group_init_type_name(&configfs->encoders_group, "encoders",
> +				    &encoders_group_type);
> +	configfs_add_default_group(&configfs->encoders_group,
> +				   &configfs->device_group);
>  
>  	connector_cfg = vkms_config_add_connector(configfs->vkms_config, BIT(0),
>  						  connector_status_connected);
> @@ -269,7 +383,6 @@ static struct config_group *make_device_group(struct config_group *group,
>  
>  err_kfree:
>  	kfree(configfs);
> -	kfree(encoder_cfg);
>  	kfree(connector_cfg);
>  	return ERR_PTR(ret);
>  }
> -- 
> 2.46.0
> 

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
