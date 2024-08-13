Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C21950BD8
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 19:59:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFE9C10E3C7;
	Tue, 13 Aug 2024 17:59:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ccMIbM99";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED66710E3BC
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 17:59:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1D824FF804;
 Tue, 13 Aug 2024 17:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1723571943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mc+jxQ95A2HtQfBlm7npzABiXn/B3pHmSD9CDEThevM=;
 b=ccMIbM99E4EPEuIl8V+zl5RqDHbpJ0ZJ2Pmeepjf+xRTaee9588hOY+OplFxdko4oy3SFs
 x5kumNZ9eLaE2Gb1M6bKkP8U8c5ae/0BDAoIXc39Xqjy3JWlBt25MymvcvP8rjyTtZaP35
 ZUWrBEa745Oycokqgk98uN+uRZFZ1uRUaBkL5gSKj2SZte9gnu2GT9vvXJZp4mma5hP1NL
 7/anql/HL6loYHg9Ul0A+T6b6F6q6Ig015nWB9iLC8QgncS47JuYb8uL08h5ydo899Tci7
 fmRMckr822k8svMH507sntdUH6LvlktkhB11foGeQJQCaxKwc+DRZ0UC+L1d5A==
Date: Tue, 13 Aug 2024 19:58:55 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Cc: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
 mairacanal@riseup.net, hamohammed.sa@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 03/17] drm/vkms: Set device name from vkms_config
Message-ID: <Zrue381iv_jpPhnz@louis-chauvet-laptop>
Mail-Followup-To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?=
 <jose.exposito89@gmail.com>, 
 rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
 mairacanal@riseup.net, hamohammed.sa@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240813105134.17439-1-jose.exposito89@gmail.com>
 <20240813105134.17439-4-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240813105134.17439-4-jose.exposito89@gmail.com>
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
> In order to be able to create multiple devices, the device name needs to
> be unique.
> 
> Allow to set it in the VKMS configuration.
> 
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> ---
>  drivers/gpu/drm/vkms/vkms_config.c | 7 +++++--
>  drivers/gpu/drm/vkms/vkms_config.h | 3 ++-
>  drivers/gpu/drm/vkms/vkms_drv.c    | 2 +-
>  drivers/gpu/drm/vkms/vkms_drv.h    | 2 ++
>  4 files changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
> index 4c7cda16dfd8..6ab8091bf72f 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.c
> +++ b/drivers/gpu/drm/vkms/vkms_config.c
> @@ -8,7 +8,7 @@
>  #include "vkms_config.h"
>  #include "vkms_drv.h"
>  
> -struct vkms_config *vkms_config_create(void)
> +struct vkms_config *vkms_config_create(char *dev_name)
>  {
>  	struct vkms_config *config;
>  
> @@ -16,6 +16,8 @@ struct vkms_config *vkms_config_create(void)
>  	if (!config)
>  		return ERR_PTR(-ENOMEM);
>  
> +	config->dev_name = dev_name;
> +
>  	return config;
>  }

I think it can make sense to copy the device name here. If I look at your 
ConfigFS implementation, this pointer is managed by configfs, not vkms. 

I think it could be nice to avoid mixing different lifetime and let vkms 
fully manage its own objects.
  
> @@ -25,7 +27,7 @@ struct vkms_config *vkms_config_default_create(bool enable_cursor,
>  {
>  	struct vkms_config *config;
>  
> -	config = vkms_config_create();
> +	config = vkms_config_create(DEFAULT_DEVICE_NAME);
>  	if (IS_ERR(config))
>  		return config;
>  
> @@ -47,6 +49,7 @@ static int vkms_config_show(struct seq_file *m, void *data)
>  	struct drm_device *dev = entry->dev;
>  	struct vkms_device *vkmsdev = drm_device_to_vkms_device(dev);
>  
> +	seq_printf(m, "dev_name=%s\n", vkmsdev->config->dev_name);
>  	seq_printf(m, "writeback=%d\n", vkmsdev->config->writeback);
>  	seq_printf(m, "cursor=%d\n", vkmsdev->config->cursor);
>  	seq_printf(m, "overlay=%d\n", vkmsdev->config->overlay);
> diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
> index 83181760b02b..ba06aad32799 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.h
> +++ b/drivers/gpu/drm/vkms/vkms_config.h
> @@ -8,6 +8,7 @@
>  struct vkms_device;
>  
>  struct vkms_config {
> +	char *dev_name;
>  	bool writeback;
>  	bool cursor;
>  	bool overlay;
> @@ -16,7 +17,7 @@ struct vkms_config {
>  };
>  
>  /* VKMS Config */
> -struct vkms_config *vkms_config_create(void);
> +struct vkms_config *vkms_config_create(char *dev_name);
>  struct vkms_config *vkms_config_default_create(bool enable_cursor,
>  					       bool enable_writeback,
>  					       bool enable_overlay);
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> index 4e36989589f9..2f9d1db0cfae 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -160,7 +160,7 @@ static int vkms_create(struct vkms_config *config)
>  	struct platform_device *pdev;
>  	struct vkms_device *vkms_device;
>  
> -	pdev = platform_device_register_simple(DRIVER_NAME, -1, NULL, 0);
> +	pdev = platform_device_register_simple(config->dev_name, -1, NULL, 0);
>  	if (IS_ERR(pdev))
>  		return PTR_ERR(pdev);
>  
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index 5c523ca27f22..87e44b51a03f 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -12,6 +12,8 @@
>  #include <drm/drm_encoder.h>
>  #include <drm/drm_writeback.h>
>  
> +#define DEFAULT_DEVICE_NAME "vkms"
> +
>  #define XRES_MIN    10
>  #define YRES_MIN    10
>  
> -- 
> 2.46.0
> 

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
