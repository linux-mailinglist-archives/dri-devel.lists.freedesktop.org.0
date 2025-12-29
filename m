Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 506D8CE7B6E
	for <lists+dri-devel@lfdr.de>; Mon, 29 Dec 2025 18:14:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48B1110E5C4;
	Mon, 29 Dec 2025 17:14:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="E/Y1uaZn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A13F110E5C4
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 17:14:30 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id
 5b1f17b1804b1-4779aa4f928so92463965e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 09:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767028469; x=1767633269; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=WTI/U24baEJ9fAs5xJsCxvW/ApkzbnYPUtzjDdhtFs4=;
 b=E/Y1uaZn63+yuaughr4Sv+TA4PR9bivRXdBrVDIAE0a3xs0eizZKkU1J0lCqpHoPNj
 0/K9UYG60U0XFbMmarIc7ItxwHgMj5VZ233qfGqGqFrb4a3H05BxPxHyoiqUz85RZ2xJ
 6WwJpm8wdlFw91WjKUba0CMoxubECB7M/+uRzyASyV9aiPiQf35icIoqmWYaJ6phw6Of
 XV1t6z1Zbd/YklFWTFBQnhFxH1O+Gc1vqkKccHNebL4nuFE1/dgD3+516kg43soqpArX
 KLObhOQA1FszP+LtdDK8HkxeiXgqtjD07SD3F6iqoaN7SeDwF5/kXn4Jeppt4ArAuiEl
 2tAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767028469; x=1767633269;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WTI/U24baEJ9fAs5xJsCxvW/ApkzbnYPUtzjDdhtFs4=;
 b=DBN+ZnMI+lxKC5xP8SqOQFTNGH7S1CZAJTNuD5gis3KVu4Z+BHsqkzjULe0FkYH/kh
 cZBx+qYP/uKJVw0DAlOOQUua10Z7SmRSGFuUypM6fH0wW7QzFf7cM2Q0KeoMwnvzzLPw
 r8LdEMbbh/AZLTCyJs6E0pSB1zD4v7dvc8B/3KbUpnfP452etZxubeujH3nRcFq3QIPc
 zV0CFV8VWSUmt3wNAnj7SDAReH8YySfqxCCjVTQinpijVwZawl0UMC2vhaahsDOyRR8T
 nifcNHRSBGYwAMr1Su4ckH2gZRsHh/gR20TYmDuhvdjGWjc+LNJ6cnzXv1+5wvNMP+Nz
 D8KA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNRPugBwEge1qogTXYsl/2yA9X/CHczhYlbgx3RG+rnibzRmJYKU6baTjmH5Idal3QP7UxRhjpWC4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzKv98bOxPq96BNeFsgG5ZQl0qjda/rV2kIsjyiCnxJ7RwkAisY
 Ln8y6rq8/3hCLg3/0MeOjKfWdSLCnPWx8p2GY7btlS7UBLrTUeVhj+xv
X-Gm-Gg: AY/fxX5cMo1ImzQh5iFVexaqp31iiwHsEObZwRn1RVNMhjCt35ekbLvX2ta+aoWCN1u
 gnShZqhFUM7CIDEsrEfc59gfMhFCQ2B9/gFLTo+1Fd83MfxQCTfcV8sNOdggfFoP/uR4bJ8PBA8
 +aqJm1yVA2KYg+EO9l1Lv/NbwKel41wCz1mVP+B+mTCxndjLZhDOSCt2ZHNX6npAG1DqIW2PUir
 qsji90ZDGEXeB1VENnF+Y0J2zsrHqnbQsxw32SyZys9IaTB60IdZp68x4URu17MLx++zWkzWKVA
 aKrTjLKZ1x9p8W1eVBx2Onk57M1WEhMQ1S/P4zw1ZRwd55YX2TbiXmMwW/R39oVmuFBNoyLVg3u
 7OnHFbjnJDHI3LvurQf/YnPyNwv+lHXlwH9YgQlZGhDctX3pQeb3szIHqxWnyIql36qUR1/LGKW
 wLJkW2OLeUcQ==
X-Google-Smtp-Source: AGHT+IEBRzGXuLgSaz9wTV+nukamkWrWJa/t3Yey+9LK++9obBuXdopvSYIO5cdNq4uNXtWz3OkyiQ==
X-Received: by 2002:a05:600c:314f:b0:47d:4fbe:e6cc with SMTP id
 5b1f17b1804b1-47d4fbee749mr98214255e9.13.1767028468987; 
 Mon, 29 Dec 2025 09:14:28 -0800 (PST)
Received: from fedora ([94.73.37.171]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47be3aa9971sm235149495e9.13.2025.12.29.09.14.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Dec 2025 09:14:28 -0800 (PST)
Date: Mon, 29 Dec 2025 18:14:26 +0100
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Melissa Wen <melissa.srw@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 victoria@system76.com, sebastian.wick@redhat.com,
 thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 33/33] drm/vkms: Introduce configfs for dynamic
 connector creation
Message-ID: <aVK28mBT6PwD7Rkr@fedora>
References: <20251222-vkms-all-config-v3-0-ba42dc3fb9ff@bootlin.com>
 <20251222-vkms-all-config-v3-33-ba42dc3fb9ff@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251222-vkms-all-config-v3-33-ba42dc3fb9ff@bootlin.com>
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

On Mon, Dec 22, 2025 at 11:11:35AM +0100, Louis Chauvet wrote:
> DRM allows the connector to be created after the device. To allows
> emulating this, add two configfs attributes to connector to allows this.
> 
> Using the dynamic attribute you can set if a connector will be dynamic or
> not.
> Using the enabled attribute, you can set at runtime if a dynamic connector
> is present or not.
> 
> Co-developed-by: José Expósito <jose.exposito89@gmail.com>
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  Documentation/ABI/testing/configfs-vkms |  14 +++
>  Documentation/gpu/vkms.rst              |   6 +-
>  drivers/gpu/drm/vkms/vkms_configfs.c    | 146 ++++++++++++++++++++++++++++++--
>  3 files changed, 155 insertions(+), 11 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/configfs-vkms b/Documentation/ABI/testing/configfs-vkms
> index 4061ada5d88b..a7fce35fcf91 100644
> --- a/Documentation/ABI/testing/configfs-vkms
> +++ b/Documentation/ABI/testing/configfs-vkms
> @@ -62,6 +62,20 @@ Description:
>          Content of the EDID for this connector. Ignored if
>          edid_enabled is not set.
>  
> +What:		/sys/kernel/config/vkms/<device>/connectors/<connector>/dynamic
> +Date:		Nov 2025
> +Contact:	dri-devel@lists.freedesktop.org
> +Description:
> +        Set to 1 to create a dynamic connector (emulates DP MST).
> +        Value: 1 - dynamic, 0 - static.
> +
> +What:		/sys/kernel/config/vkms/<device>/connectors/<connector>/enabled
> +Date:		Nov 2025
> +Contact:	dri-devel@lists.freedesktop.org
> +Description:
> +        For dynamic connectors, set to 1 to create the connector,
> +        0 to remove it. Value: 1 - enabled, 0 - disabled.
> +
>  What:		/sys/kernel/config/vkms/<device>/connectors/<connector>/possible_encoders
>  Date:		Nov 2025
>  Contact:	dri-devel@lists.freedesktop.org
> diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
> index 60367fd1bd65..fce229fbfc7c 100644
> --- a/Documentation/gpu/vkms.rst
> +++ b/Documentation/gpu/vkms.rst
> @@ -138,7 +138,7 @@ Last but not least, create one or more connectors::
>  
>    sudo mkdir /config/vkms/my-vkms/connectors/connector0
>  
> -Connectors have 5 configurable attribute:
> +Connectors have 7 configurable attribute:
>  
>  - status: Connection status: 1 connected, 2 disconnected, 3 unknown (same values
>    as those exposed by the "status" property of a connector)
> @@ -150,7 +150,9 @@ Connectors have 5 configurable attribute:
>  - edid_enabled: Enable or not EDID for this connector. Some connectors may not have an
>    EDID but just a list of modes, this attribute allows to disable EDID property.
>  - edid: Content of the EDID. Ignored if edid_enabled is not set
> -
> +- dynamic: Set to 1 while configuring the device to create a dynamic connector. A dynamic
> +  connector can be used to emulate DP MST connectors.
> +- enabled: For dynamic connector, set it to 1 to create the connector, 0 to remove it.
>  
>  To finish the configuration, link the different pipeline items::
>  
> diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
> index 20f5150e8b24..657381a8a4c2 100644
> --- a/drivers/gpu/drm/vkms/vkms_configfs.c
> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
> @@ -1144,6 +1144,12 @@ static ssize_t connector_status_show(struct config_item *item, char *page)
>  	return sprintf(page, "%u", status);
>  }
>  
> +static bool connector_is_enabled(struct vkms_config_connector *connector_cfg)
> +{
> +	return !connector_cfg->dynamic ||
> +	       (connector_cfg->dynamic && connector_cfg->enabled);
> +}
> +
>  static ssize_t connector_status_store(struct config_item *item,
>  				      const char *page, size_t count)
>  {
> @@ -1163,7 +1169,7 @@ static ssize_t connector_status_store(struct config_item *item,
>  	scoped_guard(mutex, &connector->dev->lock) {
>  		vkms_config_connector_set_status(connector->config, status);
>  
> -		if (connector->dev->enabled)
> +		if (connector->dev->enabled && connector_is_enabled(connector->config))
>  			vkms_trigger_connector_hotplug(connector->dev->config->dev);
>  	}
>  
> @@ -1224,7 +1230,7 @@ static ssize_t connector_type_store(struct config_item *item,
>  	}
>  
>  	scoped_guard(mutex, &connector->dev->lock) {
> -		if (connector->dev->enabled)
> +		if (connector->dev->enabled && connector_is_enabled(connector->config))
>  			return -EBUSY;
>  
>  		vkms_config_connector_set_type(connector->config, val);
> @@ -1343,6 +1349,107 @@ static ssize_t connector_edid_store(struct config_item *item,
>  		    connector_status_disconnected)
>  			vkms_trigger_connector_hotplug(connector->dev->config->dev);
>  	}
> +	return count;
> +}
> +
> +static ssize_t connector_enabled_show(struct config_item *item, char *page)
> +{
> +	struct vkms_configfs_connector *connector;
> +	bool enabled;
> +
> +	connector = connector_item_to_vkms_configfs_connector(item);
> +
> +	scoped_guard(mutex, &connector->dev->lock)
> +		enabled = vkms_config_connector_is_enabled(connector->config);
> +
> +	return sprintf(page, "%d\n", enabled);
> +}
> +
> +static ssize_t connector_enabled_store(struct config_item *item,
> +				       const char *page, size_t count)
> +{
> +	struct vkms_configfs_connector *connector;
> +	struct vkms_config_connector *connector_cfg;
> +	bool enabled, was_enabled;
> +
> +	connector = connector_item_to_vkms_configfs_connector(item);
> +	connector_cfg = connector->config;
> +
> +	if (kstrtobool(page, &enabled))
> +		return -EINVAL;
> +	scoped_guard(mutex, &connector->dev->lock) {
> +		if (!connector->dev->enabled) {
> +			vkms_config_connector_set_enabled(connector_cfg, enabled);
> +		} else {
> +			// Only dynamic connector can be enabled/disabled at runtime
> +			if (!connector_cfg->dynamic)
> +				return -EBUSY;
> +
> +			was_enabled = vkms_config_connector_is_enabled(connector_cfg);
> +			vkms_config_connector_set_enabled(connector_cfg, enabled);
> +
> +			// Resulting configuration is invalid (missing encoder for example)
> +			// Early return to avoid drm core issue
> +			if (!vkms_config_is_valid(connector->dev->config)) {
> +				count = -EINVAL;
> +				goto rollback;

Since this rollback jumps out of the guard, there is a chance that, while the connector is
"enabled" (enabled as in the variable) and before is set to "was_enabled", another thread
is executed and reads an invalid value.

The cleanup path needs to be inside the guard.

Jose

> +			}
> +
> +			if (!was_enabled && enabled) {
> +				// Adding the connector
> +				connector_cfg->connector = vkms_connector_hot_add(connector->dev->config->dev,
> +										  connector_cfg);
> +				if (IS_ERR(connector_cfg->connector)) {
> +					count = PTR_ERR(connector_cfg->connector);
> +					goto rollback;
> +				}
> +			} else if (was_enabled && !enabled) {
> +				vkms_connector_hot_remove(connector->dev->config->dev,
> +							  connector_cfg->connector);
> +			}
> +		}
> +	}
> +	return count;
> +
> +rollback:
> +	vkms_config_connector_set_enabled(connector_cfg, was_enabled);
> +	return count;
> +}
> +
> +static ssize_t connector_dynamic_show(struct config_item *item, char *page)
> +{
> +	struct vkms_configfs_connector *connector;
> +	bool enabled;
> +
> +	connector = connector_item_to_vkms_configfs_connector(item);
> +
> +	scoped_guard(mutex, &connector->dev->lock) {
> +		enabled = vkms_config_connector_is_dynamic(connector->config);
> +	}
> +
> +	return sprintf(page, "%d\n", enabled);
> +}
> +
> +static ssize_t connector_dynamic_store(struct config_item *item,
> +				       const char *page, size_t count)
> +{
> +	struct vkms_configfs_connector *connector;
> +	struct vkms_config_connector *connector_cfg;
> +	bool dynamic;
> +
> +	connector = connector_item_to_vkms_configfs_connector(item);
> +	connector_cfg = connector->config;
> +
> +	if (kstrtobool(page, &dynamic))
> +		return -EINVAL;
> +
> +	scoped_guard(mutex, &connector->dev->lock) {
> +		// Can't change the dynamic status when the device is activated
> +		if (connector->dev->enabled)
> +			return -EBUSY;
> +
> +		vkms_config_connector_set_dynamic(connector_cfg, dynamic);
> +	}
>  
>  	return count;
>  }
> @@ -1352,6 +1459,8 @@ CONFIGFS_ATTR(connector_, type);
>  CONFIGFS_ATTR(connector_, supported_colorspaces);
>  CONFIGFS_ATTR(connector_, edid_enabled);
>  CONFIGFS_ATTR(connector_, edid);
> +CONFIGFS_ATTR(connector_, dynamic);
> +CONFIGFS_ATTR(connector_, enabled);
>  
>  static struct configfs_attribute *connector_item_attrs[] = {
>  	&connector_attr_status,
> @@ -1359,19 +1468,28 @@ static struct configfs_attribute *connector_item_attrs[] = {
>  	&connector_attr_supported_colorspaces,
>  	&connector_attr_edid_enabled,
>  	&connector_attr_edid,
> +	&connector_attr_dynamic,
> +	&connector_attr_enabled,
>  	NULL,
>  };
>  
>  static void connector_release(struct config_item *item)
>  {
>  	struct vkms_configfs_connector *connector;
> +	struct vkms_config_connector *connector_cfg;
>  	struct mutex *lock;
>  
>  	connector = connector_item_to_vkms_configfs_connector(item);
> +	connector_cfg = connector->config;
>  	lock = &connector->dev->lock;
>  
>  	scoped_guard(mutex, lock) {
> +		if (connector->dev->enabled && connector_cfg->dynamic && connector_cfg->enabled)
> +			vkms_connector_hot_remove(connector->dev->config->dev,
> +						  connector_cfg->connector);
> +
>  		vkms_config_destroy_connector(connector->config);
> +
>  		kfree(connector);
>  	}
>  }
> @@ -1390,6 +1508,7 @@ static int connector_possible_encoders_allow_link(struct config_item *src,
>  						  struct config_item *target)
>  {
>  	struct vkms_configfs_connector *connector;
> +	struct vkms_config_connector *connector_cfg;
>  	struct vkms_configfs_encoder *encoder;
>  	int ret;
>  
> @@ -1397,16 +1516,26 @@ static int connector_possible_encoders_allow_link(struct config_item *src,
>  		return -EINVAL;
>  
>  	connector = connector_possible_encoders_item_to_vkms_configfs_connector(src);
> +	connector_cfg = connector->config;
>  	encoder = encoder_item_to_vkms_configfs_encoder(target);
>  
>  	scoped_guard(mutex, &connector->dev->lock) {
> -		if (connector->dev->enabled)
> -			return -EBUSY;
> +		if (connector->dev->enabled && connector_cfg->enabled) {
> +			if (!connector_cfg->dynamic)
> +				return -EBUSY;
> +
> +			ret = vkms_connector_hot_attach_encoder(connector->dev->config->dev,
> +								connector->config->connector,
> +								encoder->config->encoder);
> +			if (ret)
> +				return ret;
> +		}
>  
>  		ret = vkms_config_connector_attach_encoder(connector->config,
>  							   encoder->config);
> +		if (ret)
> +			return ret;
>  	}
> -
>  	return ret;
>  }
>  
> @@ -1445,9 +1574,6 @@ static struct config_group *make_connector_group(struct config_group *group,
>  	dev = child_group_to_vkms_configfs_device(group);
>  
>  	scoped_guard(mutex, &dev->lock) {
> -		if (dev->enabled)
> -			return ERR_PTR(-EBUSY);
> -
>  		connector = kzalloc(sizeof(*connector), GFP_KERNEL);
>  		if (!connector)
>  			return ERR_PTR(-ENOMEM);
> @@ -1461,9 +1587,11 @@ static struct config_group *make_connector_group(struct config_group *group,
>  			return ERR_PTR(ret);
>  		}
>  
> +		vkms_config_connector_set_dynamic(connector->config, connector->dev->enabled);
> +		vkms_config_connector_set_enabled(connector->config, !connector->dev->enabled);
> +
>  		config_group_init_type_name(&connector->group, name,
>  					    &connector_item_type);
> -
>  		config_group_init_type_name(&connector->possible_encoders_group,
>  					    "possible_encoders",
>  					    &connector_possible_encoders_group_type);
> 
> -- 
> 2.51.2
> 
