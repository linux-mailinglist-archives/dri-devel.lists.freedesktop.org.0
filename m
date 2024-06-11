Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 111D0903EFC
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2024 16:40:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A48010E15F;
	Tue, 11 Jun 2024 14:40:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="PNoIY2Ms";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFAE010E15F
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 14:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718116823;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nVJP0VSR7tVGQj2nQAQbJ843pVocJWyKgXyKL63ZGE4=;
 b=PNoIY2MsbwhzSIZtuCi/+asSwqa62tCDUCBeE3dMQTTr8qQ+YVA4W2adnpx1Jzz2b6jnUu
 oi3eJ6UOaMMR5rNnVg7iznlxVyicLtwMxKzWmUF3SgBL7100C0KhgRSEeLcxdArmeRKcxE
 /rgRmyNntSqxRzhIKPu57wwItJHf8Ag=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-186-dipCOJOzNbSbPXn6n9Rg0w-1; Tue, 11 Jun 2024 10:40:22 -0400
X-MC-Unique: dipCOJOzNbSbPXn6n9Rg0w-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-421739476b3so33854125e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 07:40:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718116821; x=1718721621;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nVJP0VSR7tVGQj2nQAQbJ843pVocJWyKgXyKL63ZGE4=;
 b=uUfZtzKuQ+YkzGium6sq/6xYqDZA1kbD4BYVxWq7eoP7ojqgNGn5fKIX/VskVR2OfR
 bzjBujeh2U7uxvYM0ld4dB72tVMih30L3Yn7Kk/BiWHjtrwbLyOlbqVTRLHTy1idn5y/
 ji5344AfgRH45RkgJoa26p0VmEuMVcNZelDNwQ+OWKHa6SvrXMFBsm1+MYjReI9zxvW+
 uWoFa3RdB7ktCEt6z5J9wZY3e7tTM3La4Tuwa5GOSFdERZHV7fAb2ZfLQYiYuvipV9B2
 yWMu4rePIx3qwx1qWydxFoGwKACraoLPb1n7Noi81+dU70MBR7UUnvAyxiRoGjUN/GCR
 iFow==
X-Gm-Message-State: AOJu0YyQpEAav1inrf6eTfr9+owdNkx/J+BzwxkupZQ7Ug9ix7iIGeF1
 nqFwPERlkfODBkqgC+oHpPtdm9vScNh5yeswgmNOyTub8rQt/CeDQm8XlS/I0/54Vn5LMnovaPG
 nN7wz/YewGB1G8EGLXA5k5j0PAbUcDfGaYPHSm3+nwWYwXTA/G7UnVpalaep9ITlJbg==
X-Received: by 2002:a05:600c:c14:b0:422:7ad4:be7c with SMTP id
 5b1f17b1804b1-4227ad4bfb9mr1619865e9.34.1718116820803; 
 Tue, 11 Jun 2024 07:40:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGyGWg2sBoMAeMFFIOGi5mzTBIyrSLuJ/AgwIxiYyxURpiJwakgLfUbuwtjDPOEux3X5beGQ==
X-Received: by 2002:a05:600c:c14:b0:422:7ad4:be7c with SMTP id
 5b1f17b1804b1-4227ad4bfb9mr1619385e9.34.1718116820391; 
 Tue, 11 Jun 2024 07:40:20 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e?
 ([2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4226acc3808sm18692265e9.2.2024.06.11.07.40.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jun 2024 07:40:19 -0700 (PDT)
Message-ID: <893778f9-3eb7-4e4a-881b-6af334899b29@redhat.com>
Date: Tue, 11 Jun 2024 16:40:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] drm/mgag200: Add BMC output
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
References: <20240610141141.29527-1-tzimmermann@suse.de>
 <20240610141141.29527-3-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240610141141.29527-3-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 10/06/2024 16:06, Thomas Zimmermann wrote:
> The BMC output can be viewed via the BMC's web interface or a
> similar client. Represent it as virtual encoder and connector.
> It's attached to the same CRTC as the VGA connector.
> 
> The connector's status depends on the physical connector's status.
> The BMC is only connected if the physical connector is not. This
> is necessary to support userspace clients that can only handle a
> single output per CRTC.
> 
> The BMC is a server feature. Add a BMC output for all server chips,
> but not the desktop models.

Thanks, I think it makes thing clearer for userspace, even if it's not 
perfect yet. It also allows to have bigger resolution when no vga 
monitor are connected.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/mgag200/mgag200_bmc.c     | 107 ++++++++++++++++++++++
>   drivers/gpu/drm/mgag200/mgag200_drv.h     |  10 ++
>   drivers/gpu/drm/mgag200/mgag200_g200eh.c  |   4 +
>   drivers/gpu/drm/mgag200/mgag200_g200eh3.c |   4 +
>   drivers/gpu/drm/mgag200/mgag200_g200er.c  |   4 +
>   drivers/gpu/drm/mgag200/mgag200_g200ev.c  |   4 +
>   drivers/gpu/drm/mgag200/mgag200_g200ew3.c |   4 +
>   drivers/gpu/drm/mgag200/mgag200_g200se.c  |   4 +
>   drivers/gpu/drm/mgag200/mgag200_g200wb.c  |   4 +
>   9 files changed, 145 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mgag200/mgag200_bmc.c b/drivers/gpu/drm/mgag200/mgag200_bmc.c
> index 2ba2e3c5086a5..23ef85aa7e378 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_bmc.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_bmc.c
> @@ -2,8 +2,18 @@
>   
>   #include <linux/delay.h>
>   
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_edid.h>
> +#include <drm/drm_managed.h>
> +#include <drm/drm_probe_helper.h>
> +
>   #include "mgag200_drv.h"
>   
> +static struct mgag200_bmc_connector *to_mgag200_bmc_connector(struct drm_connector *connector)
> +{
> +	return container_of(connector, struct mgag200_bmc_connector, base);
> +}
> +
>   void mgag200_bmc_disable_vidrst(struct mga_device *mdev)
>   {
>   	u8 tmp;
> @@ -97,3 +107,100 @@ void mgag200_bmc_enable_vidrst(struct mga_device *mdev)
>   	tmp &= ~0x10;
>   	WREG_DAC(MGA1064_GEN_IO_DATA, tmp);
>   }
> +
> +static const struct drm_encoder_funcs mgag200_bmc_encoder_funcs = {
> +	.destroy = drm_encoder_cleanup,
> +};
> +
> +static int mgag200_bmc_connector_helper_detect_ctx(struct drm_connector *connector,
> +						   struct drm_modeset_acquire_ctx *ctx,
> +						   bool force)
> +{
> +	struct mgag200_bmc_connector *bmc_connector = to_mgag200_bmc_connector(connector);
> +	struct drm_connector *physical_connector = bmc_connector->physical_connector;
> +
> +	/*
> +	 * Most user-space compositors cannot handle more than one connected
> +	 * connector per CRTC. Hence, we only mark the BMC as connected if the
> +	 * physical connector is disconnected. If the physical connector's status
> +	 * is connected or unknown, the BMC remains disconnected. This has no
> +	 * effect on the output of the BMC.
> +	 *
> +	 * FIXME: Remove this logic once user-space compositors can handle more
> +	 *        than one connector per CRTC. The BMC should always be connected.
> +	 */
> +
> +	if (physical_connector && physical_connector->status == connector_status_disconnected)
> +		return connector_status_connected;
> +
> +	return connector_status_disconnected;
> +}
> +
> +static int mgag200_bmc_connector_helper_get_modes(struct drm_connector *connector)
> +{
> +	struct drm_device *dev = connector->dev;
> +	struct mga_device *mdev = to_mga_device(dev);
> +	const struct mgag200_device_info *minfo = mdev->info;
> +
> +	return drm_add_modes_noedid(connector, minfo->max_hdisplay, minfo->max_vdisplay);
> +}
> +
> +static const struct drm_connector_helper_funcs mgag200_bmc_connector_helper_funcs = {
> +	.get_modes = mgag200_bmc_connector_helper_get_modes,
> +	.detect_ctx = mgag200_bmc_connector_helper_detect_ctx,
> +};
> +
> +static const struct drm_connector_funcs mgag200_bmc_connector_funcs = {
> +	.reset = drm_atomic_helper_connector_reset,
> +	.fill_modes = drm_helper_probe_single_connector_modes,
> +	.destroy = drm_connector_cleanup,
> +	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> +};
> +
> +static int mgag200_bmc_connector_init(struct drm_device *dev,
> +				      struct mgag200_bmc_connector *bmc_connector,
> +				      struct drm_connector *physical_connector)
> +{
> +	struct drm_connector *connector = &bmc_connector->base;
> +	int ret;
> +
> +	ret = drm_connector_init(dev, connector, &mgag200_bmc_connector_funcs,
> +				 DRM_MODE_CONNECTOR_VIRTUAL);
> +	if (ret)
> +		return ret;
> +	drm_connector_helper_add(connector, &mgag200_bmc_connector_helper_funcs);
> +
> +	bmc_connector->physical_connector = physical_connector;
> +
> +	return 0;
> +}
> +
> +int mgag200_bmc_output_init(struct mga_device *mdev, struct drm_connector *physical_connector)
> +{
> +	struct drm_device *dev = &mdev->base;
> +	struct drm_crtc *crtc = &mdev->crtc;
> +	struct drm_encoder *encoder;
> +	struct mgag200_bmc_connector *bmc_connector;
> +	struct drm_connector *connector;
> +	int ret;
> +
> +	encoder = &mdev->output.bmc.encoder;
> +	ret = drm_encoder_init(dev, encoder, &mgag200_bmc_encoder_funcs,
> +			       DRM_MODE_ENCODER_VIRTUAL, NULL);
> +	if (ret)
> +		return ret;
> +	encoder->possible_crtcs = drm_crtc_mask(crtc);
> +
> +	bmc_connector = &mdev->output.bmc.bmc_connector;
> +	ret = mgag200_bmc_connector_init(dev, bmc_connector, physical_connector);
> +	if (ret)
> +		return ret;
> +	connector = &bmc_connector->base;
> +
> +	ret = drm_connector_attach_encoder(connector, encoder);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
> index db89fddc26dcb..7f7dfbd0f0134 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_drv.h
> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
> @@ -186,6 +186,11 @@ static inline struct mgag200_crtc_state *to_mgag200_crtc_state(struct drm_crtc_s
>   	return container_of(base, struct mgag200_crtc_state, base);
>   }
>   
> +struct mgag200_bmc_connector {
> +	struct drm_connector base;
> +	struct drm_connector *physical_connector;
> +};
> +
>   enum mga_type {
>   	G200_PCI,
>   	G200_AGP,
> @@ -288,6 +293,10 @@ struct mga_device {
>   			struct drm_encoder encoder;
>   			struct drm_connector connector;
>   		} vga;
> +		struct {
> +			struct drm_encoder encoder;
> +			struct mgag200_bmc_connector bmc_connector;
> +		} bmc;
>   	} output;
>   };
>   
> @@ -433,5 +442,6 @@ int mgag200_vga_output_init(struct mga_device *mdev);
>   				/* mgag200_bmc.c */
>   void mgag200_bmc_disable_vidrst(struct mga_device *mdev);
>   void mgag200_bmc_enable_vidrst(struct mga_device *mdev);
> +int mgag200_bmc_output_init(struct mga_device *mdev, struct drm_connector *physical_connector);
>   
>   #endif				/* __MGAG200_DRV_H__ */
> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200eh.c b/drivers/gpu/drm/mgag200/mgag200_g200eh.c
> index df00b25efb895..6f31c5249f0b1 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_g200eh.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_g200eh.c
> @@ -218,6 +218,10 @@ static int mgag200_g200eh_pipeline_init(struct mga_device *mdev)
>   	if (ret)
>   		return ret;
>   
> +	ret = mgag200_bmc_output_init(mdev, &mdev->output.vga.connector);
> +	if (ret)
> +		return ret;
> +
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200eh3.c b/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
> index be42b1291e357..5befe8da4beb2 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
> @@ -122,6 +122,10 @@ static int mgag200_g200eh3_pipeline_init(struct mga_device *mdev)
>   	if (ret)
>   		return ret;
>   
> +	ret = mgag200_bmc_output_init(mdev, &mdev->output.vga.connector);
> +	if (ret)
> +		return ret;
> +
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200er.c b/drivers/gpu/drm/mgag200/mgag200_g200er.c
> index 6f2c07af38c4f..55c275180cde2 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_g200er.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_g200er.c
> @@ -261,6 +261,10 @@ static int mgag200_g200er_pipeline_init(struct mga_device *mdev)
>   	if (ret)
>   		return ret;
>   
> +	ret = mgag200_bmc_output_init(mdev, &mdev->output.vga.connector);
> +	if (ret)
> +		return ret;
> +
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ev.c b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
> index 908d04d4c862c..2466126140db6 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_g200ev.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
> @@ -262,6 +262,10 @@ static int mgag200_g200ev_pipeline_init(struct mga_device *mdev)
>   	if (ret)
>   		return ret;
>   
> +	ret = mgag200_bmc_output_init(mdev, &mdev->output.vga.connector);
> +	if (ret)
> +		return ret;
> +
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ew3.c b/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
> index 8b69af543e2be..a52e60609c3de 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
> @@ -131,6 +131,10 @@ static int mgag200_g200ew3_pipeline_init(struct mga_device *mdev)
>   	if (ret)
>   		return ret;
>   
> +	ret = mgag200_bmc_output_init(mdev, &mdev->output.vga.connector);
> +	if (ret)
> +		return ret;
> +
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200se.c b/drivers/gpu/drm/mgag200/mgag200_g200se.c
> index 6d7fbdf62b97a..212770acdd477 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_g200se.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_g200se.c
> @@ -393,6 +393,10 @@ static int mgag200_g200se_pipeline_init(struct mga_device *mdev)
>   	if (ret)
>   		return ret;
>   
> +	ret = mgag200_bmc_output_init(mdev, &mdev->output.vga.connector);
> +	if (ret)
> +		return ret;
> +
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200wb.c b/drivers/gpu/drm/mgag200/mgag200_g200wb.c
> index 564d1f3ecc108..cb6daa0426fbc 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_g200wb.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_g200wb.c
> @@ -265,6 +265,10 @@ static int mgag200_g200wb_pipeline_init(struct mga_device *mdev)
>   	if (ret)
>   		return ret;
>   
> +	ret = mgag200_bmc_output_init(mdev, &mdev->output.vga.connector);
> +	if (ret)
> +		return ret;
> +
>   	return 0;
>   }
>   

