Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D397950BD6
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 19:59:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D77A010E3C8;
	Tue, 13 Aug 2024 17:59:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="HkexexWK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51ECE10E3BD
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 17:59:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5C6E440006;
 Tue, 13 Aug 2024 17:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1723571945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CoBpP89OgZFGywT54KB2Ssh40O1nk37JFkQwY/5K3qw=;
 b=HkexexWK49rn7SDKNfRK4QaF5rJb4YPkXFZIqBtHLq4glwWO3lHZq/7gIMkmvTAaRC9dcD
 K57oWAyl86+P2tZHAlo1zq755UEKzazt8HFz/4IVPX+UmRKpBP4Fi4v0kFfg+2Gw3nneN6
 Eombc6WnSiTWbw/txtsfSw36d1mQqfKHTbvSezuVcRLfua67Dx0telyhvseKOM1ivM6d+v
 0SbvNw/ASEDjnVCyQOEPlZ8nw2NsIsUFQIHwc6oXtZi8TBugvBcpuwIuW62GczyAdOch4p
 E/OmU+GFUKinF4LhQa9w9fvgNmapIR3CIvbVKnD/fML7bV7QGgwt/uQmIphFtQ==
Date: Tue, 13 Aug 2024 19:58:58 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Cc: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
 mairacanal@riseup.net, hamohammed.sa@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 08/17] drm/vkms: Allow to configure multiple connectors
Message-ID: <Zrue4sXhXYs-XVxN@louis-chauvet-laptop>
Mail-Followup-To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?=
 <jose.exposito89@gmail.com>, 
 rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
 mairacanal@riseup.net, hamohammed.sa@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240813105134.17439-1-jose.exposito89@gmail.com>
 <20240813105134.17439-9-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240813105134.17439-9-jose.exposito89@gmail.com>
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
> Add a list of connector configurations to vkms_config and add as many
> connector as configured during output initialization.
> 
> For backwards compatibility, create a single connector in the default
> configuration.
> 
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> ---
>  drivers/gpu/drm/vkms/vkms_config.c | 40 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_config.h | 12 +++++++++
>  drivers/gpu/drm/vkms/vkms_output.c | 11 +++++---
>  3 files changed, 59 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
> index 6a8dfebee24e..a456f9db3c66 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.c
> +++ b/drivers/gpu/drm/vkms/vkms_config.c
> @@ -19,6 +19,7 @@ struct vkms_config *vkms_config_create(char *dev_name)
>  	config->dev_name = dev_name;
>  	config->crtcs = (struct list_head)LIST_HEAD_INIT(config->crtcs);
>  	config->encoders = (struct list_head)LIST_HEAD_INIT(config->encoders);
> +	config->connectors = (struct list_head)LIST_HEAD_INIT(config->connectors);

Again, this cast seems useless
  
>  	return config;
>  }
> @@ -30,6 +31,7 @@ struct vkms_config *vkms_config_default_create(bool enable_cursor,
>  	struct vkms_config *config;
>  	struct vkms_config_crtc *crtc_cfg;
>  	struct vkms_config_encoder *encoder_cfg;
> +	struct vkms_config_connector *connector_cfg;
>  
>  	config = vkms_config_create(DEFAULT_DEVICE_NAME);
>  	if (IS_ERR(config))
> @@ -46,6 +48,10 @@ struct vkms_config *vkms_config_default_create(bool enable_cursor,
>  	if (IS_ERR(encoder_cfg))
>  		return ERR_CAST(encoder_cfg);
>  
> +	connector_cfg = vkms_config_add_connector(config, BIT(0));
> +	if (IS_ERR(connector_cfg))
> +		return ERR_CAST(connector_cfg);
> +

The config pointer is leaked here.

>  	return config;
>  }
>  
> @@ -53,6 +59,7 @@ void vkms_config_destroy(struct vkms_config *config)
>  {
>  	struct vkms_config_crtc *crtc_cfg, *crtc_tmp;
>  	struct vkms_config_encoder *encoder_cfg, *encoder_tmp;
> +	struct vkms_config_connector *connector_cfg, *connector_tmp;
>  
>  	list_for_each_entry_safe(crtc_cfg, crtc_tmp, &config->crtcs, list)
>  		vkms_config_destroy_crtc(config, crtc_cfg);
> @@ -60,6 +67,9 @@ void vkms_config_destroy(struct vkms_config *config)
>  	list_for_each_entry_safe(encoder_cfg, encoder_tmp, &config->encoders, list)
>  		vkms_config_destroy_encoder(config, encoder_cfg);
>  
> +	list_for_each_entry_safe(connector_cfg, connector_tmp, &config->connectors, list)
> +		vkms_config_destroy_connector(config, connector_cfg);
> +
>  	kfree(config);
>  }
>  
> @@ -70,6 +80,7 @@ static int vkms_config_show(struct seq_file *m, void *data)
>  	struct vkms_device *vkmsdev = drm_device_to_vkms_device(dev);
>  	struct vkms_config_crtc *crtc_cfg;
>  	struct vkms_config_encoder *encoder_cfg;
> +	struct vkms_config_connector *connector_cfg;
>  	int n;
>  
>  	seq_printf(m, "dev_name=%s\n", vkmsdev->config->dev_name);
> @@ -90,6 +101,13 @@ static int vkms_config_show(struct seq_file *m, void *data)
>  		n++;
>  	}
>  
> +	n = 0;
> +	list_for_each_entry(connector_cfg, &vkmsdev->config->connectors, list) {
> +		seq_printf(m, "connector(%d).possible_encoders=%d\n", n,
> +			   connector_cfg->possible_encoders);
> +		n++;
> +	}
> +
>  	return 0;
>  }
>  
> @@ -166,3 +184,25 @@ void vkms_config_destroy_encoder(struct vkms_config *config,
>  	list_del(&encoder_cfg->list);
>  	kfree(encoder_cfg);
>  }
> +
> +struct vkms_config_connector *vkms_config_add_connector(struct vkms_config *config,
> +							uint32_t possible_encoders)
> +{
> +	struct vkms_config_connector *connector_cfg;
> +
> +	connector_cfg = kzalloc(sizeof(*connector_cfg), GFP_KERNEL);
> +	if (!connector_cfg)
> +		return ERR_PTR(-ENOMEM);
> +
> +	connector_cfg->possible_encoders = possible_encoders;

For config_encoder destruction you need to remove it from this 
possible_encoders list.

> +	list_add_tail(&connector_cfg->list, &config->connectors);
> +
> +	return connector_cfg;
> +}
> +
> +void vkms_config_destroy_connector(struct vkms_config *config,
> +				   struct vkms_config_connector *connector_cfg)
> +{
> +	list_del(&connector_cfg->list);
> +	kfree(connector_cfg);
> +}
> diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
> index b717b5c0d3d9..f1dd59fc6300 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.h
> +++ b/drivers/gpu/drm/vkms/vkms_config.h
> @@ -20,12 +20,18 @@ struct vkms_config_encoder {
>  	uint32_t possible_crtcs;
>  };
>  
> +struct vkms_config_connector {
> +	struct list_head list;
> +	uint32_t possible_encoders;
> +};
> +
>  struct vkms_config {
>  	char *dev_name;
>  	bool cursor;
>  	bool overlay;
>  	struct list_head crtcs;
>  	struct list_head encoders;
> +	struct list_head connectors;
>  	/* only set when instantiated */
>  	struct vkms_device *dev;
>  };
> @@ -52,4 +58,10 @@ struct vkms_config_encoder *vkms_config_add_encoder(struct vkms_config *config,
>  void vkms_config_destroy_encoder(struct vkms_config *config,
>  				 struct vkms_config_encoder *encoder_cfg);
>  
> +/* Connectors */
> +struct vkms_config_connector *vkms_config_add_connector(struct vkms_config *config,
> +							uint32_t possible_encoders);
> +void vkms_config_destroy_connector(struct vkms_config *config,
> +				   struct vkms_config_connector *connector_cfg);
> +
>  #endif /* _VKMS_CONFIG_H_ */
> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
> index 4413cf88afc7..021a491de817 100644
> --- a/drivers/gpu/drm/vkms/vkms_output.c
> +++ b/drivers/gpu/drm/vkms/vkms_output.c
> @@ -100,6 +100,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
>  {
>  	struct drm_device *dev = &vkmsdev->drm;
>  	struct drm_connector *connector;
> +	struct vkms_config_connector *connector_cfg;
>  	struct drm_encoder *encoder;
>  	struct vkms_config_encoder *encoder_cfg;
>  	struct vkms_crtc *vkms_crtc;
> @@ -142,10 +143,6 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
>  		}
>  	}
>  
> -	connector = vkms_connector_init(vkmsdev, BIT(index));
> -	if (IS_ERR(connector))
> -		return PTR_ERR(connector);
> -
>  	list_for_each_entry(encoder_cfg, &vkmsdev->config->encoders, list) {
>  		encoder = vkms_encoder_init(vkmsdev, encoder_cfg->possible_crtcs,
>  					    encoder_cfg->index);
> @@ -153,6 +150,12 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
>  			return PTR_ERR(encoder);
>  	}
>  
> +	list_for_each_entry(connector_cfg, &vkmsdev->config->connectors, list) {
> +		connector = vkms_connector_init(vkmsdev, connector_cfg->possible_encoders);
> +		if (IS_ERR(connector))
> +			return PTR_ERR(connector);
> +	}
> +
>  	drm_mode_config_reset(dev);
>  
>  	return 0;
> -- 
> 2.46.0
> 

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
