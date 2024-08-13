Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 986EE950BD1
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 19:59:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0F3010E3BE;
	Tue, 13 Aug 2024 17:59:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Ew7miZnl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A64210E3BB
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 17:59:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F335E1C0004;
 Tue, 13 Aug 2024 17:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1723571944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wo1iuzYTuIQLFCD/B6JQxxjdTcdk8Saaz2yCzCNhqGM=;
 b=Ew7miZnlN8v0alg1ZwRFOkzc2TDUpD9TkQr5yvIJz4lcEWaodPh5WUiRKYTeRfeE3+i7Kh
 vgZsCK6LF9CsDpP21TxJafLE68gqefD01NtzWWXdRNhT955F/I2PC9oRvzsa07D6ehG0k4
 69pBF7gnD7F6O9cYKLYCu2wZtuyT3sX79t6cWqgu9BvT1knm2vQ5tdcv/gEtiXIasc2F3K
 ZwuXnD4nr+zLYvLqSUn6/10szw8f9eUwAkLK4rEy8qzNfZNdwC/EZXQOK2NcGlcya9xMiP
 3cKu2CwK3c985jeUuroi1BhsZfqmGUZRZ+ReG7SG0gj6Siq8JEwnTl9/Ewqvew==
Date: Tue, 13 Aug 2024 19:58:57 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Cc: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
 mairacanal@riseup.net, hamohammed.sa@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 07/17] drm/vkms: Use managed memory to create
 connectors
Message-ID: <Zrue4VV8DCTBnH4F@louis-chauvet-laptop>
Mail-Followup-To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?=
 <jose.exposito89@gmail.com>, 
 rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
 mairacanal@riseup.net, hamohammed.sa@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240813105134.17439-1-jose.exposito89@gmail.com>
 <20240813105134.17439-8-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240813105134.17439-8-jose.exposito89@gmail.com>
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
> A future patch will allow to create multiple connectors. Use managed
> memory to simplify the code.
> 
> Refactor, no functional changes.
> 
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> ---
>  drivers/gpu/drm/vkms/vkms_drv.h    |  5 ---
>  drivers/gpu/drm/vkms/vkms_output.c | 53 +++++++++++++++++-------------
>  2 files changed, 31 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index 2466e8b0231f..cac37d21654a 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -121,14 +121,9 @@ struct vkms_crtc {
>  
>  struct vkms_config;
>  
> -struct vkms_output {
> -	struct drm_connector connector;
> -};
> -
>  struct vkms_device {
>  	struct drm_device drm;
>  	struct platform_device *platform;
> -	struct vkms_output output;
>  	struct list_head crtcs;
>  	const struct vkms_config *config;
>  };
> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
> index 7afe37aea52d..4413cf88afc7 100644
> --- a/drivers/gpu/drm/vkms/vkms_output.c
> +++ b/drivers/gpu/drm/vkms/vkms_output.c
> @@ -9,7 +9,6 @@
>  
>  static const struct drm_connector_funcs vkms_connector_funcs = {
>  	.fill_modes = drm_helper_probe_single_connector_modes,
> -	.destroy = drm_connector_cleanup,
>  	.reset = drm_atomic_helper_connector_reset,
>  	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
>  	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> @@ -29,6 +28,33 @@ static const struct drm_connector_helper_funcs vkms_conn_helper_funcs = {
>  	.get_modes    = vkms_conn_get_modes,
>  };
>  
> +static struct drm_connector *vkms_connector_init(struct vkms_device *vkms_device,
> +						 uint32_t possible_encoders)
> +{
> +	struct drm_connector *connector;
> +	int ret;
> +
> +	connector = drmm_kzalloc(&vkms_device->drm, sizeof(*connector), GFP_KERNEL);
> +	if (!connector) {
> +		DRM_ERROR("Failed to allocate connector\n");
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +	ret = drmm_connector_init(&vkms_device->drm, connector,
> +				  &vkms_connector_funcs,
> +				  DRM_MODE_CONNECTOR_VIRTUAL, NULL);
> +	if (ret) {
> +		DRM_ERROR("Failed to init connector\n");
> +		kfree(connector);

Again, connector is allocated with drmm_kzalloc, so drmm_kfree or nothing.

> +		return ERR_PTR(ret);
> +	}
> +
> +	connector->possible_encoders = possible_encoders;
> +	drm_connector_helper_add(connector, &vkms_conn_helper_funcs);
> +
> +	return connector;
> +}
> +
>  static struct drm_encoder *vkms_encoder_init(struct vkms_device *vkms_device,
>  					     uint32_t possible_crtcs,
>  					     unsigned int index)
> @@ -72,9 +98,8 @@ static int vkms_add_overlay_plane(struct vkms_device *vkmsdev, int index)
>  
>  int vkms_output_init(struct vkms_device *vkmsdev, int index)
>  {
> -	struct vkms_output *output = &vkmsdev->output;
>  	struct drm_device *dev = &vkmsdev->drm;
> -	struct drm_connector *connector = &output->connector;
> +	struct drm_connector *connector;
>  	struct drm_encoder *encoder;
>  	struct vkms_config_encoder *encoder_cfg;
>  	struct vkms_crtc *vkms_crtc;
> @@ -117,14 +142,9 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
>  		}
>  	}
>  
> -	ret = drm_connector_init(dev, connector, &vkms_connector_funcs,
> -				 DRM_MODE_CONNECTOR_VIRTUAL);
> -	if (ret) {
> -		DRM_ERROR("Failed to init connector\n");
> -		return ret;
> -	}
> -
> -	drm_connector_helper_add(connector, &vkms_conn_helper_funcs);
> +	connector = vkms_connector_init(vkmsdev, BIT(index));

As for CRTC, you can create multiple encoder but connector is always 
attached to the first? I assume this is intentionnal? Maybe you can attach 
it to all the created encoders?

> +	if (IS_ERR(connector))
> +		return PTR_ERR(connector);
>
>  	list_for_each_entry(encoder_cfg, &vkmsdev->config->encoders, list) {
>  		encoder = vkms_encoder_init(vkmsdev, encoder_cfg->possible_crtcs,
> @@ -133,18 +153,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
>  			return PTR_ERR(encoder);
>  	}
>  
> -	ret = drm_connector_attach_encoder(connector, encoder);
> -	if (ret) {
> -		DRM_ERROR("Failed to attach connector to encoder\n");
> -		goto err_attach;
> -	}
> -

The encoder is not attached to the connector?

>  	drm_mode_config_reset(dev);
>  
>  	return 0;
> -
> -err_attach:
> -	drm_connector_cleanup(connector);
> -
> -	return ret;
>  }
> -- 
> 2.46.0
> 

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
