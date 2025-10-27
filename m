Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D9FC0EE2D
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 16:17:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28B6A89CAC;
	Mon, 27 Oct 2025 15:17:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CEhlG9Pk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8F9E89CAC
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 15:17:55 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-475dae5d473so25225965e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 08:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761578274; x=1762183074; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=EHnoeFxjinik7hVKNnr5X5XP1SZWgPi7b+K7uMiOxyo=;
 b=CEhlG9Pk7zcmRRLAjVXNdOKyUvT+v58FniaUev6/dMYVJXq+z1L4MkTvTz5paJ6WPk
 zLjpnDitzYNNNFJySu+2WR8DzhQwev2q+SWmzNH8/A/7CA7WKGuIkkkuqNQEft2nCsKd
 I45wbDxST59kuUExDYMCBIL81UP6ezXuaadj+OVIVKEFJ7OMpK75xYrAPLUrJS0DLAOW
 ZDRr3hu/xS6GioKEHTTBSUbeQUXoiMLs2urDifgS4tIlkRQcmMDHnrpyjSO6P+OvV1G0
 8RBBjD+Ir+7ed/T9REjKxWC8eTxpmyU5nXTHYX0hCujwJgeBBMLFsIwQlLLpo6wZcXRM
 tKrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761578274; x=1762183074;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EHnoeFxjinik7hVKNnr5X5XP1SZWgPi7b+K7uMiOxyo=;
 b=Tj3tGkJLLUHoe7zwyHzHcpaEeKnuzIGYHvB62DGoIDbRGu3mgFVPKpratOXbv3DnSa
 H9mUAxr8RdnZPKPrbsETstX+QgUJyQSnvt1+LyIsiiSEocsYm1TOY6gWIF/E+l6PIIHK
 Sqg9R1Ug+4Je2lAi/jOiVyzAldue/JnLiL+6mrAcqBqRWb4rasZA6GoZPhlA6t8GxuSY
 kq/tFcm33Po05y+/Df5TI7Q9uHL4gJ/VXtPG5QwObYboBcnM1D5ZuJKVCw5N7Sg7UvkA
 fIuzAAmaHaf5guH4oJGgij1G73d5Rz9YLOo64y9/1A53HfnFQYX4SwD566FqbGy4j/jo
 UMqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9ndZwEujNf+O+m73bPvjzMfW4b/eJI8essbcDQSaLI0TmHwxfn17bTIcc4t+q72yCB7jP1LcQBnc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyuNZZnZc3v5PXFs63lwn9UnQrN2IvrPadsUOiiqH21LEdFMTLM
 kwl6EAQ6rVU9/Lt1kwYtGxiZuYyXDnltRxSgjgX/wvmsfYnw/LjooA6A
X-Gm-Gg: ASbGncu3Fvx4oH63jdNHP7G8tOdiwKsULBznH7lPYHJI89HMB/EtuaHQb5BDgn89dSa
 Ps7PpoCnP+uCEZ4ViIomm//j8Qd1LSN72M4zmIBMjyXidtpuASbZW8ZLeFjG4adgTTlxchzZSHl
 FZo5CMn3NDjg3LJtFTNXEno1d0szJopGdDF7m+JXUPgQXlT7XBFKInF+mtaRLI4sx+ce4QbbX6B
 kGRTTllYE+RZwrOFEu34N607hjMD1x1BgobvG6ZN8quEkKKvV6hIUm8okKaYzHosUBBTDFi2rGP
 q4R/ZptD+1L56GUeRX0MzLAyNzwXiHZuOOz1qunPcxFecGfIxuUJnkRBERpPgksALtmGEHNDTws
 ODWpdy97cnMoSwRR6/5AuiaPfTPGhbuiaRSD5T/tz4JY5yODGqsb05ZzqxyFwHM7AtfFVOpomhg
 ==
X-Google-Smtp-Source: AGHT+IFOtqqzmpz2GumwnMXeJudQB/bQ0NunpiqCBwdwJ3NphuydAK4zzTw+idu6gtpPu+OCGje9sA==
X-Received: by 2002:a05:600c:4ed4:b0:45d:f83b:96aa with SMTP id
 5b1f17b1804b1-47717df5505mr322525e9.7.1761578273978; 
 Mon, 27 Oct 2025 08:17:53 -0700 (PDT)
Received: from fedora ([94.73.38.14]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475dcff9101sm72738225e9.1.2025.10.27.08.17.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 08:17:53 -0700 (PDT)
Date: Mon, 27 Oct 2025 16:17:51 +0100
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
Subject: Re: [PATCH 22/22] drm/vkms: Allows the creation of connector at
 runtime
Message-ID: <aP-NH2IWRl_juhaI@fedora>
References: <20251018-vkms-all-config-v1-0-a7760755d92d@bootlin.com>
 <20251018-vkms-all-config-v1-22-a7760755d92d@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251018-vkms-all-config-v1-22-a7760755d92d@bootlin.com>
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

On Sat, Oct 18, 2025 at 04:01:22AM +0200, Louis Chauvet wrote:
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
>  Documentation/gpu/vkms.rst           |   6 +-
>  drivers/gpu/drm/vkms/vkms_configfs.c | 146 ++++++++++++++++++++++++++++++++---
>  2 files changed, 139 insertions(+), 13 deletions(-)
> 
> diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
> index bbd03f61e61c..8b17aaa28eeb 100644
> --- a/Documentation/gpu/vkms.rst
> +++ b/Documentation/gpu/vkms.rst
> @@ -135,7 +135,7 @@ Last but not least, create one or more connectors::
>  
>    sudo mkdir /config/vkms/my-vkms/connectors/connector0
>  
> -Connectors have 5 configurable attribute:
> +Connectors have 7 configurable attribute:
>  
>  - status: Connection status: 1 connected, 2 disconnected, 3 unknown (same values
>    as those exposed by the "status" property of a connector)
> @@ -147,7 +147,9 @@ Connectors have 5 configurable attribute:
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
> index a977c0842cd6..937b749142ad 100644
> --- a/drivers/gpu/drm/vkms/vkms_configfs.c
> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
> @@ -1115,8 +1115,12 @@ static ssize_t connector_status_store(struct config_item *item,
>  	scoped_guard(mutex, &connector->dev->lock) {
>  		vkms_config_connector_set_status(connector->config, status);
>  
> -		if (connector->dev->enabled)
> -			vkms_trigger_connector_hotplug(connector->dev->config->dev);
> +		if (connector->dev->enabled) {
> +			if (connector->config->dynamic && connector->config->enabled)
> +				vkms_trigger_connector_hotplug(connector->dev->config->dev);
> +			if (!connector->config->dynamic)
> +				vkms_trigger_connector_hotplug(connector->dev->config->dev);

To avoid duplicating code, we could do something like:

	bool hotplug = !connector->config->dynamic ||
		       (connector->config->dynamic && connector->config->enabled);
	if (hotplug)
		vkms_trigger_connector_hotplug(connector->dev->config->dev);


> +		}
>  	}
>  
>  	return (ssize_t)count;
> @@ -1176,8 +1180,12 @@ static ssize_t connector_type_store(struct config_item *item,
>  	}
>  
>  	scoped_guard(mutex, &connector->dev->lock) {
> -		if (connector->dev->enabled)
> -			return -EINVAL;
> +		if (connector->dev->enabled) {
> +			if (connector->config->dynamic && connector->config->enabled)
> +				return -EBUSY;
> +			if (!connector->config->dynamic)
> +				return -EBUSY;
> +		}

And something similar here. Also, instead of returning -EINVAL
in "drm/vkms: Introduce configfs for connector type", you could return
-EBUSY and avoid changing the return type here.

>  		vkms_config_connector_set_type(connector->config, val);
>  	}
>  
> @@ -1293,6 +1301,102 @@ static ssize_t connector_edid_store(struct config_item *item,
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
> +
> +	if (!connector->dev->enabled) {
> +		vkms_config_connector_set_enabled(connector_cfg, enabled);
> +	} else {
> +		// Only dynamic connector can be enabled/disabled at runtime
> +		if (!connector_cfg->dynamic)
> +			return -EBUSY;
> +
> +		was_enabled = vkms_config_connector_is_enabled(connector_cfg);
> +		vkms_config_connector_set_enabled(connector_cfg, enabled);
> +
> +		// Resulting configuration is invalid (missing encoder for example)
> +		// Early return to avoid drm core issue
> +		if (!vkms_config_is_valid(connector->dev->config)) {
> +			vkms_config_connector_set_enabled(connector_cfg, was_enabled);
> +			return -EINVAL;
> +		}
> +
> +		if (!was_enabled && enabled) {
> +			// Adding the connector
> +			connector_cfg->connector = vkms_connector_hot_add(connector->dev->config->dev,
> +									  connector_cfg);
> +			if (IS_ERR(connector_cfg->connector)) {
> +				vkms_config_connector_set_enabled(connector_cfg, was_enabled);
> +				return PTR_ERR(connector_cfg->connector);
> +			}
> +		} else if (was_enabled && !enabled) {
> +			vkms_connector_hot_remove(connector->dev->config->dev,
> +						  connector_cfg->connector);
> +		}
> +	}
> +	return count;

As a suggestion, we could add a "goto rollback;" and avoid duplicating error
handling:

	rollback:
		vkms_config_connector_set_enabled(connector_cfg, was_enabled);
		return ret;

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
> @@ -1302,6 +1406,8 @@ CONFIGFS_ATTR(connector_, type);
>  CONFIGFS_ATTR(connector_, supported_colorspaces);
>  CONFIGFS_ATTR(connector_, edid_enabled);
>  CONFIGFS_ATTR(connector_, edid);
> +CONFIGFS_ATTR(connector_, dynamic);
> +CONFIGFS_ATTR(connector_, enabled);
>  
>  static struct configfs_attribute *connector_item_attrs[] = {
>  	&connector_attr_status,
> @@ -1309,19 +1415,28 @@ static struct configfs_attribute *connector_item_attrs[] = {
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
> @@ -1340,6 +1455,7 @@ static int connector_possible_encoders_allow_link(struct config_item *src,
>  						  struct config_item *target)
>  {
>  	struct vkms_configfs_connector *connector;
> +	struct vkms_config_connector *connector_cfg;
>  	struct vkms_configfs_encoder *encoder;
>  	int ret;
>  
> @@ -1347,16 +1463,25 @@ static int connector_possible_encoders_allow_link(struct config_item *src,
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
> @@ -1394,9 +1519,6 @@ static struct config_group *make_connector_group(struct config_group *group,
>  	dev = child_group_to_vkms_configfs_device(group);
>  
>  	scoped_guard(mutex, &dev->lock) {
> -		if (dev->enabled)
> -			return ERR_PTR(-EBUSY);
> -
>  		connector = kzalloc(sizeof(*connector), GFP_KERNEL);
>  		if (!connector)
>  			return ERR_PTR(-ENOMEM);
> @@ -1409,9 +1531,11 @@ static struct config_group *make_connector_group(struct config_group *group,
>  			return ERR_CAST(connector->config);
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
> 2.51.0
> 
