Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEC2950BD3
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 19:59:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40D3F10E3C3;
	Tue, 13 Aug 2024 17:59:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="VuY2Az3n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5197110E3BB
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 17:59:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9C3AE40004;
 Tue, 13 Aug 2024 17:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1723571945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O0iO3GOAWKe67x9zMAONdJ2m4wVUEYwmNeIGg4oZQP8=;
 b=VuY2Az3n6Ae0d6i1V3XQyfayj8s8Hkqt78T7lTTMbKpPJ5Q8hX0efxpsZTewvgtFCk5U2E
 cBdfUt+L7bx/YYB3gox+/csEk/YM4HX/yPZM04YNXf8XrLzbKBNZIDV8NjlYtBoisEJDMw
 XATSwIg5c8ZitILEP4LFJ9fKcswwikgJT18dWB4MSENTFjYG1dGKfEqWalaFdIM6ySe62h
 fahQZZSyXzFJPju62ZcQoRjLkSBuyDW60FRHJ3OiFxtKKIcf7oap8tZEsrPd2CEvNe+H85
 HRx9HtVagmpSHrgdVeLhjzcfgv6BbSW7DNCg2CzT7oh3z7EM4RB7YKYxJb3bQw==
Date: Tue, 13 Aug 2024 19:58:58 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Cc: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
 mairacanal@riseup.net, hamohammed.sa@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 09/17] drm/vkms: Allow to configure multiple overlay
 planes
Message-ID: <Zrue4p9OEK12W59A@louis-chauvet-laptop>
Mail-Followup-To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?=
 <jose.exposito89@gmail.com>, 
 rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
 mairacanal@riseup.net, hamohammed.sa@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240813105134.17439-1-jose.exposito89@gmail.com>
 <20240813105134.17439-10-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240813105134.17439-10-jose.exposito89@gmail.com>
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
> Add a list of overlay planes to vkms_config and add as many overlay
> planes as configured during output initialization.
> 
> For backwards compatibility, add NUM_OVERLAY_PLANES to the default
> configuration.
> 
> Note that a primary plane is created for each CRTC and it is not
> possible to configure it.
> A cursor plane is added conditionally if it is enabled in the CRTC
> configuration.
> 
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> ---
>  drivers/gpu/drm/vkms/vkms_config.c | 53 +++++++++++++++++++++++++++---
>  drivers/gpu/drm/vkms/vkms_config.h | 16 +++++++--
>  drivers/gpu/drm/vkms/vkms_drv.c    |  2 +-
>  drivers/gpu/drm/vkms/vkms_drv.h    |  5 +--
>  drivers/gpu/drm/vkms/vkms_output.c | 43 ++++++++++++------------
>  drivers/gpu/drm/vkms/vkms_plane.c  |  6 ++--
>  6 files changed, 91 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
> index a456f9db3c66..d95a42a6745a 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.c
> +++ b/drivers/gpu/drm/vkms/vkms_config.c
> @@ -17,6 +17,7 @@ struct vkms_config *vkms_config_create(char *dev_name)
>  		return ERR_PTR(-ENOMEM);
>  
>  	config->dev_name = dev_name;
> +	config->planes = (struct list_head)LIST_HEAD_INIT(config->planes);
>  	config->crtcs = (struct list_head)LIST_HEAD_INIT(config->crtcs);
>  	config->encoders = (struct list_head)LIST_HEAD_INIT(config->encoders);
>  	config->connectors = (struct list_head)LIST_HEAD_INIT(config->connectors);
> @@ -32,15 +33,22 @@ struct vkms_config *vkms_config_default_create(bool enable_cursor,
>  	struct vkms_config_crtc *crtc_cfg;
>  	struct vkms_config_encoder *encoder_cfg;
>  	struct vkms_config_connector *connector_cfg;
> +	struct vkms_config_plane *plane_cfg;
> +	int n;
>  
>  	config = vkms_config_create(DEFAULT_DEVICE_NAME);
>  	if (IS_ERR(config))
>  		return config;
>  
> -	config->cursor = enable_cursor;
> -	config->overlay = enable_overlay;
> +	if (enable_overlay) {
> +		for (n = 0; n < NUM_OVERLAY_PLANES; n++) {
> +			plane_cfg = vkms_config_add_overlay_plane(config, BIT(0));
> +			if (IS_ERR(plane_cfg))
> +				return ERR_CAST(plane_cfg);

The config pointer is leaked here.

> +		}
> +	}
>  
> -	crtc_cfg = vkms_config_add_crtc(config, enable_writeback);
> +	crtc_cfg = vkms_config_add_crtc(config, enable_cursor, enable_writeback);
>  	if (IS_ERR(crtc_cfg))
>  		return ERR_CAST(crtc_cfg);
>  
> @@ -57,10 +65,14 @@ struct vkms_config *vkms_config_default_create(bool enable_cursor,
>  
>  void vkms_config_destroy(struct vkms_config *config)
>  {
> +	struct vkms_config_plane *plane_cfg, *plane_tmp;
>  	struct vkms_config_crtc *crtc_cfg, *crtc_tmp;
>  	struct vkms_config_encoder *encoder_cfg, *encoder_tmp;
>  	struct vkms_config_connector *connector_cfg, *connector_tmp;
>  
> +	list_for_each_entry_safe(plane_cfg, plane_tmp, &config->planes, list)
> +		vkms_config_destroy_overlay_plane(config, plane_cfg);
> +
>  	list_for_each_entry_safe(crtc_cfg, crtc_tmp, &config->crtcs, list)
>  		vkms_config_destroy_crtc(config, crtc_cfg);
>  
> @@ -78,17 +90,24 @@ static int vkms_config_show(struct seq_file *m, void *data)
>  	struct drm_debugfs_entry *entry = m->private;
>  	struct drm_device *dev = entry->dev;
>  	struct vkms_device *vkmsdev = drm_device_to_vkms_device(dev);
> +	struct vkms_config_plane *plane_cfg;
>  	struct vkms_config_crtc *crtc_cfg;
>  	struct vkms_config_encoder *encoder_cfg;
>  	struct vkms_config_connector *connector_cfg;
>  	int n;
>  
>  	seq_printf(m, "dev_name=%s\n", vkmsdev->config->dev_name);
> -	seq_printf(m, "cursor=%d\n", vkmsdev->config->cursor);
> -	seq_printf(m, "overlay=%d\n", vkmsdev->config->overlay);
> +
> +	n = 0;
> +	list_for_each_entry(plane_cfg, &vkmsdev->config->planes, list) {
> +		seq_printf(m, "plane(%d).possible_crtcs=%d\n", n,
> +			   plane_cfg->possible_crtcs);
> +		n++;
> +	}
>  
>  	n = 0;
>  	list_for_each_entry(crtc_cfg, &vkmsdev->config->crtcs, list) {
> +		seq_printf(m, "crtc(%d).cursor=%d\n", n, crtc_cfg->cursor);
>  		seq_printf(m, "crtc(%d).writeback=%d\n", n,
>  			   crtc_cfg->writeback);
>  		n++;
> @@ -121,7 +140,30 @@ void vkms_config_debugfs_init(struct vkms_device *vkms_device)
>  			      ARRAY_SIZE(vkms_config_debugfs_list));
>  }
>  
> +struct vkms_config_plane *vkms_config_add_overlay_plane(struct vkms_config *config,
> +							uint32_t possible_crtcs)
> +{
> +	struct vkms_config_plane *plane_cfg;
> +
> +	plane_cfg = kzalloc(sizeof(*plane_cfg), GFP_KERNEL);
> +	if (!plane_cfg)
> +		return ERR_PTR(-ENOMEM);
> +
> +	plane_cfg->possible_crtcs = possible_crtcs;
> +	list_add_tail(&plane_cfg->list, &config->planes);
> +
> +	return plane_cfg;
> +}
> +
> +void vkms_config_destroy_overlay_plane(struct vkms_config *config,
> +				       struct vkms_config_plane *plane_cfg)
> +{
> +	list_del(&plane_cfg->list);
> +	kfree(plane_cfg);
> +}
> +
>  struct vkms_config_crtc *vkms_config_add_crtc(struct vkms_config *config,
> +					      bool enable_cursor,
>  					      bool enable_writeback)
>  {
>  	struct vkms_config_crtc *crtc_cfg;
> @@ -130,6 +172,7 @@ struct vkms_config_crtc *vkms_config_add_crtc(struct vkms_config *config,
>  	if (!crtc_cfg)
>  		return ERR_PTR(-ENOMEM);
>  
> +	crtc_cfg->cursor = enable_cursor;
>  	crtc_cfg->writeback = enable_writeback;
>  
>  	crtc_cfg->index = 0;
> diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
> index f1dd59fc6300..25dab63e7ae7 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.h
> +++ b/drivers/gpu/drm/vkms/vkms_config.h
> @@ -8,9 +8,15 @@
>  
>  struct vkms_device;
>  
> +struct vkms_config_plane {
> +	struct list_head list;
> +	uint32_t possible_crtcs;

As for encoder and connector, the crtc cleanup does not change 
possible_crtcs value, so you may end up with an invalid configuration.

> +};
> +
>  struct vkms_config_crtc {
>  	struct list_head list;
>  	unsigned int index;
> +	bool cursor;
>  	bool writeback;
>  };
>  
> @@ -27,8 +33,7 @@ struct vkms_config_connector {
>  
>  struct vkms_config {
>  	char *dev_name;
> -	bool cursor;
> -	bool overlay;
> +	struct list_head planes;
>  	struct list_head crtcs;
>  	struct list_head encoders;
>  	struct list_head connectors;
> @@ -46,8 +51,15 @@ void vkms_config_destroy(struct vkms_config *config);
>  /* DebugFS */
>  void vkms_config_debugfs_init(struct vkms_device *vkms_device);
>  
> +/* Planes */
> +struct vkms_config_plane *vkms_config_add_overlay_plane(struct vkms_config *config,
> +							uint32_t possible_crtcs);
> +void vkms_config_destroy_overlay_plane(struct vkms_config *config,
> +				       struct vkms_config_plane *plane_cfg);
> +
>  /* CRTCs */
>  struct vkms_config_crtc *vkms_config_add_crtc(struct vkms_config *config,
> +					      bool enable_cursor,
>  					      bool enable_writeback);
>  void vkms_config_destroy_crtc(struct vkms_config *config,
>  			      struct vkms_config_crtc *crtc_cfg);
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> index 15a2ba26d190..b0a079eb4598 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -154,7 +154,7 @@ static int vkms_modeset_init(struct vkms_device *vkmsdev)
>  	dev->mode_config.preferred_depth = 0;
>  	dev->mode_config.helper_private = &vkms_mode_config_helpers;
>  
> -	return vkms_output_init(vkmsdev, 0);
> +	return vkms_output_init(vkmsdev);
>  }
>  
>  static int vkms_create(struct vkms_config *config)
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index cac37d21654a..76394285dc68 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -149,10 +149,11 @@ struct vkms_crtc *vkms_crtc_init(struct drm_device *dev,
>  				 struct drm_plane *cursor,
>  				 unsigned int index);
>  
> -int vkms_output_init(struct vkms_device *vkmsdev, int index);
> +int vkms_output_init(struct vkms_device *vkmsdev);
>  
>  struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
> -				   enum drm_plane_type type, int index);
> +				   enum drm_plane_type type,
> +				   uint32_t possible_crtcs);
>  
>  /* CRC Support */
>  const char *const *vkms_get_crc_sources(struct drm_crtc *crtc,
> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
> index 021a491de817..a5b1ab326cdd 100644
> --- a/drivers/gpu/drm/vkms/vkms_output.c
> +++ b/drivers/gpu/drm/vkms/vkms_output.c
> @@ -82,21 +82,22 @@ static struct drm_encoder *vkms_encoder_init(struct vkms_device *vkms_device,
>  	return encoder;
>  }
>  
> -static int vkms_add_overlay_plane(struct vkms_device *vkmsdev, int index)
> +static int vkms_add_overlay_plane(struct vkms_device *vkmsdev,
> +				  uint32_t possible_crtcs)
>  {
>  	struct vkms_plane *overlay;
>  
> -	overlay = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_OVERLAY, index);
> +	overlay = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_OVERLAY, possible_crtcs);
>  	if (IS_ERR(overlay))
>  		return PTR_ERR(overlay);
>  
>  	if (!overlay->base.possible_crtcs)
> -		overlay->base.possible_crtcs = BIT(index);
> +		overlay->base.possible_crtcs = possible_crtcs;
>  
>  	return 0;
>  }
>  
> -int vkms_output_init(struct vkms_device *vkmsdev, int index)
> +int vkms_output_init(struct vkms_device *vkmsdev)
>  {
>  	struct drm_device *dev = &vkmsdev->drm;
>  	struct drm_connector *connector;
> @@ -106,29 +107,27 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
>  	struct vkms_crtc *vkms_crtc;
>  	struct vkms_config_crtc *crtc_cfg;
>  	struct vkms_plane *primary, *cursor = NULL;
> +	struct vkms_config_plane *plane_cfg;
>  	int ret;
>  	int writeback;
> -	unsigned int n;
>  
> -	primary = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_PRIMARY, index);
> -	if (IS_ERR(primary))
> -		return PTR_ERR(primary);
> -
> -	if (vkmsdev->config->overlay) {
> -		for (n = 0; n < NUM_OVERLAY_PLANES; n++) {
> -			ret = vkms_add_overlay_plane(vkmsdev, index);
> -			if (ret)
> -				return ret;
> -		}
> -	}
> -
> -	if (vkmsdev->config->cursor) {
> -		cursor = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_CURSOR, index);
> -		if (IS_ERR(cursor))
> -			return PTR_ERR(cursor);
> +	list_for_each_entry(plane_cfg, &vkmsdev->config->planes, list) {
> +		ret = vkms_add_overlay_plane(vkmsdev, plane_cfg->possible_crtcs);
> +		if (ret)
> +			return ret;
>  	}
>  
>  	list_for_each_entry(crtc_cfg, &vkmsdev->config->crtcs, list) {
> +		primary = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_PRIMARY, 0);
> +		if (IS_ERR(primary))
> +			return PTR_ERR(primary);
> +
> +		if (crtc_cfg->cursor) {
> +			cursor = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_CURSOR, 0);

Why are you hardcoding the primary and cursor plane here? I think it is 
easier to manage them as "normal" planes with vkms_config_plane, and use 
the enum drm_plane_type to find the correct one here.

Otherwise we will need either to:
- duplicate all the plane configuration for those primary and cursor 
  planes
- rework this part of the code to use vkms_config_plane.

> +			if (IS_ERR(cursor))
> +				return PTR_ERR(cursor);
> +		}
> +
>  		vkms_crtc = vkms_crtc_init(dev, &primary->base, &cursor->base,
>  					   crtc_cfg->index);
>  		if (IS_ERR(vkms_crtc))
> @@ -141,6 +140,8 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
>  			if (writeback)
>  				DRM_ERROR("Failed to init writeback connector\n");
>  		}
> +
> +		cursor = NULL;
>  	}
>  
>  	list_for_each_entry(encoder_cfg, &vkmsdev->config->encoders, list) {
> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
> index e5c625ab8e3e..eb3edf4cb928 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> @@ -198,13 +198,13 @@ static const struct drm_plane_helper_funcs vkms_plane_helper_funcs = {
>  };
>  
>  struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
> -				   enum drm_plane_type type, int index)
> +				   enum drm_plane_type type, uint32_t possible_crtcs)
>  {
>  	struct drm_device *dev = &vkmsdev->drm;
>  	struct vkms_plane *plane;
>  
> -	plane = drmm_universal_plane_alloc(dev, struct vkms_plane, base, 1 << index,
> -					   &vkms_plane_funcs,
> +	plane = drmm_universal_plane_alloc(dev, struct vkms_plane, base,
> +					   possible_crtcs, &vkms_plane_funcs,
>  					   vkms_formats, ARRAY_SIZE(vkms_formats),
>  					   NULL, type, NULL);
>  	if (IS_ERR(plane))
> -- 
> 2.46.0
> 

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
