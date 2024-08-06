Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D30A948E97
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 14:10:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8755B10E33F;
	Tue,  6 Aug 2024 12:10:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="XaaakyB9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51AB510E353
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2024 12:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1722946250;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xhjzYI4fRb+Pzb3xXoCTTD6JYerTmTGyfeUF0Z2qSDU=;
 b=XaaakyB9yQ4Yk+GyJKIwDjY/zbIrlTi5wo4qFd/dphiABNI7kpQgIwRWqquab54XRcBUQT
 s60Wpo7BwVBNY8hdokZBI3IGJyauEpidZ4jZnX67rBxowsw1dv6wpgiqWY7qzCME0253qy
 5IRKpESAeNYr0YsKNAZiomTKnli+jkA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-550-ULXPMv1mP-CRI_8-20OD9w-1; Tue, 06 Aug 2024 08:10:49 -0400
X-MC-Unique: ULXPMv1mP-CRI_8-20OD9w-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-36873ed688dso418021f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Aug 2024 05:10:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722946248; x=1723551048;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xhjzYI4fRb+Pzb3xXoCTTD6JYerTmTGyfeUF0Z2qSDU=;
 b=fNAs+tCFFD+OdYovdfWqjFvDOeUi885VrcTux+KDp4jSLR16Ac1fzsxZB61Y0LK6Bh
 Ys8ZziPiSMSJ2Ic8IY2WvgFectBcNtvi9X1y/Ax+haAUHUGjqzH60AHQJRHhFilbWrwv
 H5sALTkZIlONOJw/dUe0pxcB2YLBT42RW78XqMsvoqComiui4PW6Mc94tLq0SJlETflF
 XHz1kQT0+Og1D/z26XYefz9ovd+p5RFcxGGEewQXfFxIl+VJviv9Rg+UAQJLRt/4ERwC
 iogG6r7Sb7d2cSui65AGd3JO59bDs8W6sEl8Bt7mqHvMJBhdmHRcOumHeuy8tAUNxMj3
 MCFQ==
X-Gm-Message-State: AOJu0YzhS9Wx9lgDfDcCqtoX+pgvCUsXc183s6mVBW+kDKkcg78g98DX
 Unq/CnJxy0J2JYatfbDPTZec8A5nxmlP4ImWXBeeHw/RTq49r8e3dtLNLKD1ddANCbuDBxMXSgq
 0EXcQ1cNal7L1EajADdlpBptq+m64b4Q2Pj9YgSUSDzPPz0Olgf/eclvbhPAVU02k6eaabw0rgQ
 ==
X-Received: by 2002:a5d:5248:0:b0:368:3f74:f7dd with SMTP id
 ffacd0b85a97d-36bbc109629mr8338754f8f.20.1722946247756; 
 Tue, 06 Aug 2024 05:10:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPni+LxZL3mnP3yqmluyxgqA4xcUHqkJjG46/9aNvBvMHGtupJRspGC5eUUmcEtdkA0xL6ew==
X-Received: by 2002:a5d:5248:0:b0:368:3f74:f7dd with SMTP id
 ffacd0b85a97d-36bbc109629mr8338733f8f.20.1722946247199; 
 Tue, 06 Aug 2024 05:10:47 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:d3ea:62cf:3052:fac6?
 ([2a01:e0a:d5:a000:d3ea:62cf:3052:fac6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36bbcf1daeesm12865742f8f.33.2024.08.06.05.10.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Aug 2024 05:10:46 -0700 (PDT)
Message-ID: <651b5244-8295-4e99-a35a-9b6ce28a98e5@redhat.com>
Date: Tue, 6 Aug 2024 14:10:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] drm/mgag200: Remove BMC output
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
References: <20240805130622.63458-1-tzimmermann@suse.de>
 <20240805130622.63458-6-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240805130622.63458-6-tzimmermann@suse.de>
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

On 05/08/2024 15:06, Thomas Zimmermann wrote:
> Mgag200's BMC connector tracks the status of an underlying physical
> connector and updates the BMC status accordingly. This functionality
> works around GNOME's settings app, which cannot handle multiple
> outputs on the same CRTC.
> 
> The workaround is now obsolete as the VGA-BMC connector handles BMC
> support internally. Hence, remove the driver's code and the BMC output
> entirely.


Thanks for this work.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/mgag200/mgag200_bmc.c     | 102 ----------------------
>   drivers/gpu/drm/mgag200/mgag200_drv.h     |  10 ---
>   drivers/gpu/drm/mgag200/mgag200_g200eh.c  |   4 -
>   drivers/gpu/drm/mgag200/mgag200_g200eh3.c |   4 -
>   drivers/gpu/drm/mgag200/mgag200_g200er.c  |   4 -
>   drivers/gpu/drm/mgag200/mgag200_g200ev.c  |   4 -
>   drivers/gpu/drm/mgag200/mgag200_g200ew3.c |   4 -
>   drivers/gpu/drm/mgag200/mgag200_g200se.c  |   4 -
>   drivers/gpu/drm/mgag200/mgag200_g200wb.c  |   4 -
>   9 files changed, 140 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mgag200/mgag200_bmc.c b/drivers/gpu/drm/mgag200/mgag200_bmc.c
> index 45e35dffb3ea..a689c71ff165 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_bmc.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_bmc.c
> @@ -9,11 +9,6 @@
>   
>   #include "mgag200_drv.h"
>   
> -static struct mgag200_bmc_connector *to_mgag200_bmc_connector(struct drm_connector *connector)
> -{
> -	return container_of(connector, struct mgag200_bmc_connector, base);
> -}
> -
>   void mgag200_bmc_stop_scanout(struct mga_device *mdev)
>   {
>   	u8 tmp;
> @@ -102,100 +97,3 @@ void mgag200_bmc_start_scanout(struct mga_device *mdev)
>   	tmp &= ~0x10;
>   	WREG_DAC(MGA1064_GEN_IO_DATA, tmp);
>   }
> -
> -static const struct drm_encoder_funcs mgag200_bmc_encoder_funcs = {
> -	.destroy = drm_encoder_cleanup,
> -};
> -
> -static int mgag200_bmc_connector_helper_detect_ctx(struct drm_connector *connector,
> -						   struct drm_modeset_acquire_ctx *ctx,
> -						   bool force)
> -{
> -	struct mgag200_bmc_connector *bmc_connector = to_mgag200_bmc_connector(connector);
> -	struct drm_connector *physical_connector = bmc_connector->physical_connector;
> -
> -	/*
> -	 * Most user-space compositors cannot handle more than one connected
> -	 * connector per CRTC. Hence, we only mark the BMC as connected if the
> -	 * physical connector is disconnected. If the physical connector's status
> -	 * is connected or unknown, the BMC remains disconnected. This has no
> -	 * effect on the output of the BMC.
> -	 *
> -	 * FIXME: Remove this logic once user-space compositors can handle more
> -	 *        than one connector per CRTC. The BMC should always be connected.
> -	 */
> -
> -	if (physical_connector && physical_connector->status == connector_status_disconnected)
> -		return connector_status_connected;
> -
> -	return connector_status_disconnected;
> -}
> -
> -static int mgag200_bmc_connector_helper_get_modes(struct drm_connector *connector)
> -{
> -	struct drm_device *dev = connector->dev;
> -	struct mga_device *mdev = to_mga_device(dev);
> -	const struct mgag200_device_info *minfo = mdev->info;
> -
> -	return drm_add_modes_noedid(connector, minfo->max_hdisplay, minfo->max_vdisplay);
> -}
> -
> -static const struct drm_connector_helper_funcs mgag200_bmc_connector_helper_funcs = {
> -	.get_modes = mgag200_bmc_connector_helper_get_modes,
> -	.detect_ctx = mgag200_bmc_connector_helper_detect_ctx,
> -};
> -
> -static const struct drm_connector_funcs mgag200_bmc_connector_funcs = {
> -	.reset = drm_atomic_helper_connector_reset,
> -	.fill_modes = drm_helper_probe_single_connector_modes,
> -	.destroy = drm_connector_cleanup,
> -	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> -	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> -};
> -
> -static int mgag200_bmc_connector_init(struct drm_device *dev,
> -				      struct mgag200_bmc_connector *bmc_connector,
> -				      struct drm_connector *physical_connector)
> -{
> -	struct drm_connector *connector = &bmc_connector->base;
> -	int ret;
> -
> -	ret = drm_connector_init(dev, connector, &mgag200_bmc_connector_funcs,
> -				 DRM_MODE_CONNECTOR_VIRTUAL);
> -	if (ret)
> -		return ret;
> -	drm_connector_helper_add(connector, &mgag200_bmc_connector_helper_funcs);
> -
> -	bmc_connector->physical_connector = physical_connector;
> -
> -	return 0;
> -}
> -
> -int mgag200_bmc_output_init(struct mga_device *mdev, struct drm_connector *physical_connector)
> -{
> -	struct drm_device *dev = &mdev->base;
> -	struct drm_crtc *crtc = &mdev->crtc;
> -	struct drm_encoder *encoder;
> -	struct mgag200_bmc_connector *bmc_connector;
> -	struct drm_connector *connector;
> -	int ret;
> -
> -	encoder = &mdev->output.bmc.encoder;
> -	ret = drm_encoder_init(dev, encoder, &mgag200_bmc_encoder_funcs,
> -			       DRM_MODE_ENCODER_VIRTUAL, NULL);
> -	if (ret)
> -		return ret;
> -	encoder->possible_crtcs = drm_crtc_mask(crtc);
> -
> -	bmc_connector = &mdev->output.bmc.bmc_connector;
> -	ret = mgag200_bmc_connector_init(dev, bmc_connector, physical_connector);
> -	if (ret)
> -		return ret;
> -	connector = &bmc_connector->base;
> -
> -	ret = drm_connector_attach_encoder(connector, encoder);
> -	if (ret)
> -		return ret;
> -
> -	return 0;
> -}
> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
> index 1301d3066a49..4760ba92871b 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_drv.h
> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
> @@ -188,11 +188,6 @@ static inline struct mgag200_crtc_state *to_mgag200_crtc_state(struct drm_crtc_s
>   	return container_of(base, struct mgag200_crtc_state, base);
>   }
>   
> -struct mgag200_bmc_connector {
> -	struct drm_connector base;
> -	struct drm_connector *physical_connector;
> -};
> -
>   enum mga_type {
>   	G200_PCI,
>   	G200_AGP,
> @@ -283,10 +278,6 @@ struct mga_device {
>   			struct drm_encoder encoder;
>   			struct drm_connector connector;
>   		} vga;
> -		struct {
> -			struct drm_encoder encoder;
> -			struct mgag200_bmc_connector bmc_connector;
> -		} bmc;
>   	} output;
>   };
>   
> @@ -446,6 +437,5 @@ int mgag200_vga_output_init(struct mga_device *mdev);
>   /* mgag200_bmc.c */
>   void mgag200_bmc_stop_scanout(struct mga_device *mdev);
>   void mgag200_bmc_start_scanout(struct mga_device *mdev);
> -int mgag200_bmc_output_init(struct mga_device *mdev, struct drm_connector *physical_connector);
>   
>   #endif				/* __MGAG200_DRV_H__ */
> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200eh.c b/drivers/gpu/drm/mgag200/mgag200_g200eh.c
> index 1824c0e59c03..09ced65c1d2f 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_g200eh.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_g200eh.c
> @@ -219,10 +219,6 @@ static int mgag200_g200eh_pipeline_init(struct mga_device *mdev)
>   	if (ret)
>   		return ret;
>   
> -	ret = mgag200_bmc_output_init(mdev, &mdev->output.vga.connector);
> -	if (ret)
> -		return ret;
> -
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200eh3.c b/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
> index 9cb2a165e460..5daa469137bd 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
> @@ -123,10 +123,6 @@ static int mgag200_g200eh3_pipeline_init(struct mga_device *mdev)
>   	if (ret)
>   		return ret;
>   
> -	ret = mgag200_bmc_output_init(mdev, &mdev->output.vga.connector);
> -	if (ret)
> -		return ret;
> -
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200er.c b/drivers/gpu/drm/mgag200/mgag200_g200er.c
> index b99b308a7e54..09cfffafe130 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_g200er.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_g200er.c
> @@ -259,10 +259,6 @@ static int mgag200_g200er_pipeline_init(struct mga_device *mdev)
>   	if (ret)
>   		return ret;
>   
> -	ret = mgag200_bmc_output_init(mdev, &mdev->output.vga.connector);
> -	if (ret)
> -		return ret;
> -
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ev.c b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
> index 717e4357adcc..3d48baa91d8b 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_g200ev.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
> @@ -260,10 +260,6 @@ static int mgag200_g200ev_pipeline_init(struct mga_device *mdev)
>   	if (ret)
>   		return ret;
>   
> -	ret = mgag200_bmc_output_init(mdev, &mdev->output.vga.connector);
> -	if (ret)
> -		return ret;
> -
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ew3.c b/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
> index 7a2806be2d2e..dabc778e64e8 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
> @@ -132,10 +132,6 @@ static int mgag200_g200ew3_pipeline_init(struct mga_device *mdev)
>   	if (ret)
>   		return ret;
>   
> -	ret = mgag200_bmc_output_init(mdev, &mdev->output.vga.connector);
> -	if (ret)
> -		return ret;
> -
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200se.c b/drivers/gpu/drm/mgag200/mgag200_g200se.c
> index 0db7e14e3328..9dcbe8304271 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_g200se.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_g200se.c
> @@ -391,10 +391,6 @@ static int mgag200_g200se_pipeline_init(struct mga_device *mdev)
>   	if (ret)
>   		return ret;
>   
> -	ret = mgag200_bmc_output_init(mdev, &mdev->output.vga.connector);
> -	if (ret)
> -		return ret;
> -
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200wb.c b/drivers/gpu/drm/mgag200/mgag200_g200wb.c
> index cb971ca5e306..83a24aedbf2f 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_g200wb.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_g200wb.c
> @@ -266,10 +266,6 @@ static int mgag200_g200wb_pipeline_init(struct mga_device *mdev)
>   	if (ret)
>   		return ret;
>   
> -	ret = mgag200_bmc_output_init(mdev, &mdev->output.vga.connector);
> -	if (ret)
> -		return ret;
> -
>   	return 0;
>   }
>   

