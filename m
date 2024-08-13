Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3513950BD4
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 19:59:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B81ED10E3C6;
	Tue, 13 Aug 2024 17:59:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="L8DBYdUk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90AD110E3BB
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 17:59:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A3098FF805;
 Tue, 13 Aug 2024 17:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1723571944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hd9J9EKfv2sdRZkxyUfAfp2CeFjnjj0VqWnVYFJQ7YQ=;
 b=L8DBYdUkE1WxgggjhopSucX+usECP/ryD4cV2Xv+hacH/5AijHEpwR6MZPxG/wdCeXHlr5
 W7eOY35FImOsRuvdVesrDyWUAvIKCYFJS7USgXCa+0c8WI6q15ITr4Ukq5fv5UeuYUz/6h
 OzCktmDhG5VtpchFDEaiGf6QY9saxj3ThQjmg/jfcfyQkag2ooEjejyoQROYJR2RW8CQz3
 /YCf1ytYmV52LZpkIyVz+C/AwrvtDzD9XEhmf2QK6VXnuT98WD+KmuXI5TRTzZmrKt0N98
 Oett/q59WfTYY9Ono1ZpLJln9e4J4F8Hrnp8hcyy7kBPe+SXwO00yGYNEUr+fQ==
Date: Tue, 13 Aug 2024 19:58:57 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Cc: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
 mairacanal@riseup.net, hamohammed.sa@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 06/17] drm/vkms: Allow to configure multiple encoders
Message-ID: <Zrue4d_1W4vDz8wh@louis-chauvet-laptop>
Mail-Followup-To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?=
 <jose.exposito89@gmail.com>, 
 rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
 mairacanal@riseup.net, hamohammed.sa@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240813105134.17439-1-jose.exposito89@gmail.com>
 <20240813105134.17439-7-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240813105134.17439-7-jose.exposito89@gmail.com>
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
> Add a list of encoder configurations to vkms_config and add as many
> encoders as configured during output initialization.
> 
> For backwards compatibility, create a single encoder in the default
> configuration.

You don't manage the deletion of crtc in vkms_config_destroy_crtc. As you 
use vkms_config_encoder.possible_crtc to initialize a CRTC, it may be an 
issue for DRM.

> Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> ---
>  drivers/gpu/drm/vkms/vkms_config.c | 50 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_config.h | 13 ++++++++
>  drivers/gpu/drm/vkms/vkms_output.c | 14 ++++++---
>  3 files changed, 73 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
> index 3af750071f04..6a8dfebee24e 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.c
> +++ b/drivers/gpu/drm/vkms/vkms_config.c
> @@ -18,6 +18,7 @@ struct vkms_config *vkms_config_create(char *dev_name)
>  
>  	config->dev_name = dev_name;
>  	config->crtcs = (struct list_head)LIST_HEAD_INIT(config->crtcs);
> +	config->encoders = (struct list_head)LIST_HEAD_INIT(config->encoders);

Again, why there is a cast? And why you don't use INIT_LIST_HEAD? I think 
LIST_HEAD_INIT is used to initialize static structure and 
INIT_LIST_HEAD for dynamic structures.
  
>  	return config;
>  }
> @@ -28,6 +29,7 @@ struct vkms_config *vkms_config_default_create(bool enable_cursor,
>  {
>  	struct vkms_config *config;
>  	struct vkms_config_crtc *crtc_cfg;
> +	struct vkms_config_encoder *encoder_cfg;
>  
>  	config = vkms_config_create(DEFAULT_DEVICE_NAME);
>  	if (IS_ERR(config))
> @@ -40,16 +42,24 @@ struct vkms_config *vkms_config_default_create(bool enable_cursor,
>  	if (IS_ERR(crtc_cfg))
>  		return ERR_CAST(crtc_cfg);
>  
> +	encoder_cfg = vkms_config_add_encoder(config, BIT(0));

Why do you use a magic value here and not what is set by 
vkms_config_add_crtc?

	encoder_cfg = vkms_config_add_encoder(config, crtc_cfg->index);

> +	if (IS_ERR(encoder_cfg))
> +		return ERR_CAST(encoder_cfg);
> +

Here the kzalloc from vkms_config_create is leaked.

>  	return config;
>  }
>  
>  void vkms_config_destroy(struct vkms_config *config)
>  {
>  	struct vkms_config_crtc *crtc_cfg, *crtc_tmp;
> +	struct vkms_config_encoder *encoder_cfg, *encoder_tmp;
>  
>  	list_for_each_entry_safe(crtc_cfg, crtc_tmp, &config->crtcs, list)
>  		vkms_config_destroy_crtc(config, crtc_cfg);
>  
> +	list_for_each_entry_safe(encoder_cfg, encoder_tmp, &config->encoders, list)
> +		vkms_config_destroy_encoder(config, encoder_cfg);
> +
>  	kfree(config);
>  }
>  
> @@ -59,6 +69,7 @@ static int vkms_config_show(struct seq_file *m, void *data)
>  	struct drm_device *dev = entry->dev;
>  	struct vkms_device *vkmsdev = drm_device_to_vkms_device(dev);
>  	struct vkms_config_crtc *crtc_cfg;
> +	struct vkms_config_encoder *encoder_cfg;
>  	int n;
>  
>  	seq_printf(m, "dev_name=%s\n", vkmsdev->config->dev_name);
> @@ -72,6 +83,13 @@ static int vkms_config_show(struct seq_file *m, void *data)
>  		n++;
>  	}
>  
> +	n = 0;
> +	list_for_each_entry(encoder_cfg, &vkmsdev->config->encoders, list) {
> +		seq_printf(m, "encoder(%d).possible_crtcs=%d\n", n,
> +			   encoder_cfg->possible_crtcs);
> +		n++;
> +	}
> +
>  	return 0;
>  }
>  
> @@ -116,3 +134,35 @@ void vkms_config_destroy_crtc(struct vkms_config *config,
>  	list_del(&crtc_cfg->list);
>  	kfree(crtc_cfg);
>  }
> +
> +struct vkms_config_encoder *vkms_config_add_encoder(struct vkms_config *config,
> +						    uint32_t possible_crtcs)
> +{
> +	struct vkms_config_encoder *encoder_cfg;
> +
> +	encoder_cfg = kzalloc(sizeof(*encoder_cfg), GFP_KERNEL);
> +	if (!encoder_cfg)
> +		return ERR_PTR(-ENOMEM);
> +
> +	encoder_cfg->possible_crtcs = possible_crtcs;
> +
> +	encoder_cfg->index = 0;
> +	if (!list_empty(&config->encoders)) {
> +		struct vkms_config_encoder *last;
> +
> +		last = list_last_entry(&config->encoders,
> +				       struct vkms_config_encoder, list);
> +		encoder_cfg->index = last->index + 1;

Same here, drm core is already managing indexes, can we avoid 
reimplementing this logic?

There is the same issue as in CRTC, if you create 32 encoders, remove one 
and add one, the index will be invalid for drm.

> +	}
> +
> +	list_add_tail(&encoder_cfg->list, &config->encoders);
> +
> +	return encoder_cfg;
> +}
> +
> +void vkms_config_destroy_encoder(struct vkms_config *config,
> +				 struct vkms_config_encoder *encoder_cfg)
> +{
> +	list_del(&encoder_cfg->list);
> +	kfree(encoder_cfg);
> +}
> diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
> index bc40a0e3859a..b717b5c0d3d9 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.h
> +++ b/drivers/gpu/drm/vkms/vkms_config.h
> @@ -14,11 +14,18 @@ struct vkms_config_crtc {
>  	bool writeback;
>  };
>  
> +struct vkms_config_encoder {
> +	struct list_head list;
> +	unsigned int index;
> +	uint32_t possible_crtcs;
> +};
> +
>  struct vkms_config {
>  	char *dev_name;
>  	bool cursor;
>  	bool overlay;
>  	struct list_head crtcs;
> +	struct list_head encoders;
>  	/* only set when instantiated */
>  	struct vkms_device *dev;
>  };
> @@ -39,4 +46,10 @@ struct vkms_config_crtc *vkms_config_add_crtc(struct vkms_config *config,
>  void vkms_config_destroy_crtc(struct vkms_config *config,
>  			      struct vkms_config_crtc *crtc_cfg);
>  
> +/* Encoders */
> +struct vkms_config_encoder *vkms_config_add_encoder(struct vkms_config *config,
> +						    uint32_t possible_crtcs);
> +void vkms_config_destroy_encoder(struct vkms_config *config,
> +				 struct vkms_config_encoder *encoder_cfg);
> +
>  #endif /* _VKMS_CONFIG_H_ */
> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
> index 15f0b72af325..7afe37aea52d 100644
> --- a/drivers/gpu/drm/vkms/vkms_output.c
> +++ b/drivers/gpu/drm/vkms/vkms_output.c
> @@ -30,7 +30,8 @@ static const struct drm_connector_helper_funcs vkms_conn_helper_funcs = {
>  };
>  
>  static struct drm_encoder *vkms_encoder_init(struct vkms_device *vkms_device,
> -					     uint32_t possible_crtcs)
> +					     uint32_t possible_crtcs,
> +					     unsigned int index)
>  {
>  	struct drm_encoder *encoder;
>  	int ret;
> @@ -49,6 +50,7 @@ static struct drm_encoder *vkms_encoder_init(struct vkms_device *vkms_device,
>  		return ERR_PTR(ret);
>  	}
>  
> +	encoder->index = index;
>  	encoder->possible_crtcs = possible_crtcs;
>  
>  	return encoder;
> @@ -74,6 +76,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
>  	struct drm_device *dev = &vkmsdev->drm;
>  	struct drm_connector *connector = &output->connector;
>  	struct drm_encoder *encoder;
> +	struct vkms_config_encoder *encoder_cfg;
>  	struct vkms_crtc *vkms_crtc;
>  	struct vkms_config_crtc *crtc_cfg;
>  	struct vkms_plane *primary, *cursor = NULL;
> @@ -123,9 +126,12 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
>  
>  	drm_connector_helper_add(connector, &vkms_conn_helper_funcs);
>  
> -	encoder = vkms_encoder_init(vkmsdev, BIT(0));
> -	if (IS_ERR(encoder))
> -		return PTR_ERR(encoder);
> +	list_for_each_entry(encoder_cfg, &vkmsdev->config->encoders, list) {
> +		encoder = vkms_encoder_init(vkmsdev, encoder_cfg->possible_crtcs,
> +					    encoder_cfg->index);
> +		if (IS_ERR(encoder))
> +			return PTR_ERR(encoder);
> +	}
>  
>  	ret = drm_connector_attach_encoder(connector, encoder);
>  	if (ret) {
> -- 
> 2.46.0
> 

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
