Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 428A29275BF
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 14:14:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B711A10EAAD;
	Thu,  4 Jul 2024 12:14:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="HUGbl8Hs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF1D510EAAD
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2024 12:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720095239;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7oFdg2x1PtfaAbXusElUVAHbsqqyuqlxIdjRWkcJ+S4=;
 b=HUGbl8Hsm1XuUhEJM3WX37nkIjiO0jTQAdLv27Q4gLgJ+RtlirshktWSC4CHlsi6ihGLBU
 cOBQBZZjTMLokvJuczxMDMeTU9WhSYqhKa/KcGPYp7ltHI64yIaaXJPLdPOA/0FhIRuVDp
 tVjqdMjEduHg4U6wT55YqmrRm0hl3l8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-207-ECJhr_bBMZ2VdMwXGWLNCA-1; Thu, 04 Jul 2024 08:13:57 -0400
X-MC-Unique: ECJhr_bBMZ2VdMwXGWLNCA-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4257dd7d594so3961965e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jul 2024 05:13:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720095236; x=1720700036;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7oFdg2x1PtfaAbXusElUVAHbsqqyuqlxIdjRWkcJ+S4=;
 b=NSbf4PehV+VE0FKauyi1B8puk9JNaerc6BheVHx6/s34/rDBpjbHYxMX+8F745GP6B
 11dlUuJvoDkcESu53Y83pGg1jnwZRMOVfmdlKoxgflAVSyFMxdzVC8tCmwr17PpmYv+Q
 dWEfd8JV+tPC7l7vi6wdpyWPRcImxTGdnMpDW8PRPZHj2OyjhPKtp5LRkoBHneMADhT5
 TeXAeulWdOGD73p7hDUh0pZhBymNWTeuHg8SK9vREcQhOwKxFYbVzZctRGqXjgMQTtoP
 U9K+y2g/CaQ9S5OZuwW36seE6YtcAj/em7ia+Lg85S7ol17/jzZL2N3vNzoD/SIDG1Tq
 BIRg==
X-Gm-Message-State: AOJu0YzxF+7ueNcp4thNFhKnNK6NogF80zKKFU6qRNEhMO5mdDJ1wLMS
 2kRtPPEunzNS/7lwZDdbSOLmWJtEW4krVF9k6ZjemL25aQMoSGBJEOfr/zuU/pAmL3vvhj2M8f6
 sdYbZCnHMxVLpzT6mJgJSdRHrwMO9ENAQ5U1vF8mZ6TIpi7mrF9bjpZhZWO85ad/SOw==
X-Received: by 2002:a05:600c:3217:b0:421:7f30:7cf2 with SMTP id
 5b1f17b1804b1-4264a3d8726mr11098555e9.1.1720095236546; 
 Thu, 04 Jul 2024 05:13:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQVB5seqDi19vMX9RMWI7O11dM6/6SGShsnjEZzUz+OrdwFXheqoE1BjMkSg7/kb5HHjS77w==
X-Received: by 2002:a05:600c:3217:b0:421:7f30:7cf2 with SMTP id
 5b1f17b1804b1-4264a3d8726mr11098385e9.1.1720095236137; 
 Thu, 04 Jul 2024 05:13:56 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:680e:9bf4:b6a9:959b?
 ([2a01:e0a:d5:a000:680e:9bf4:b6a9:959b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4264a1d0b24sm22663585e9.3.2024.07.04.05.13.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jul 2024 05:13:54 -0700 (PDT)
Message-ID: <61aa2068-c513-42da-a563-acd9d1db4d06@redhat.com>
Date: Thu, 4 Jul 2024 14:13:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] drm/mgag200: Start/stop BMC scanout in BMC encoder
 helpers
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
References: <20240703135502.29190-1-tzimmermann@suse.de>
 <20240703135502.29190-3-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240703135502.29190-3-tzimmermann@suse.de>
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



On 03/07/2024 15:40, Thomas Zimmermann wrote:
> Start and stop the BMC scanout from the BMC encoder's atomic_enable
> and atomic_disable helpers. The BMC stops scanning out at the beginning
> of a modeset operation and restarts the scanout at the end of the
> modeset.
> 
> Only G200EW3 and G200WB require this procedure. Drop the original
> vidrst callbacks for these model's support, as they are now obsolete.

Thanks, that makes the BMC connector more useful.

I'm just wondering, in case you use both a VGA output and the BMC, 
before this patch, vidrst would be enabled, and after, as the BMC 
connector is "unconnected" it should be disabled ?

Will that have a visible impact for users ?


> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/mgag200/mgag200_bmc.c     | 24 +++++++++++++++++++++--
>   drivers/gpu/drm/mgag200/mgag200_drv.h     |  4 +---
>   drivers/gpu/drm/mgag200/mgag200_g200ew3.c |  2 --
>   drivers/gpu/drm/mgag200/mgag200_g200wb.c  |  2 --
>   4 files changed, 23 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mgag200/mgag200_bmc.c b/drivers/gpu/drm/mgag200/mgag200_bmc.c
> index cb5400333862..74feb6d8db45 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_bmc.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_bmc.c
> @@ -14,7 +14,7 @@ static struct mgag200_bmc_connector *to_mgag200_bmc_connector(struct drm_connect
>   	return container_of(connector, struct mgag200_bmc_connector, base);
>   }
>   
> -void mgag200_bmc_disable_vidrst(struct mga_device *mdev)
> +static void mgag200_bmc_disable_vidrst(struct mga_device *mdev)
>   {
>   	u8 tmp;
>   	int iter_max;
> @@ -73,7 +73,16 @@ void mgag200_bmc_disable_vidrst(struct mga_device *mdev)
>   	}
>   }
>   
> -void mgag200_bmc_enable_vidrst(struct mga_device *mdev)
> +static void mgag200_bmc_encoder_helper_atomic_disable(struct drm_encoder *encoder,
> +						      struct drm_atomic_state *state)
> +{
> +	struct mga_device *mdev = to_mga_device(encoder->dev);
> +
> +	if (mdev->info->has_vidrst)
> +		mgag200_bmc_disable_vidrst(mdev);
> +}
> +
> +static void mgag200_bmc_enable_vidrst(struct mga_device *mdev)
>   {
>   	u8 tmp;
>   
> @@ -103,6 +112,15 @@ void mgag200_bmc_enable_vidrst(struct mga_device *mdev)
>   	WREG_DAC(MGA1064_GEN_IO_DATA, tmp);
>   }
>   
> +static void mgag200_bmc_encoder_helper_atomic_enable(struct drm_encoder *encoder,
> +						     struct drm_atomic_state *state)
> +{
> +	struct mga_device *mdev = to_mga_device(encoder->dev);
> +
> +	if (mdev->info->has_vidrst)
> +		mgag200_bmc_enable_vidrst(mdev);
> +}
> +
>   static int mgag200_bmc_encoder_helper_atomic_check(struct drm_encoder *encoder,
>   						   struct drm_crtc_state *crtc_state,
>   						   struct drm_connector_state *conn_state)
> @@ -119,6 +137,8 @@ static int mgag200_bmc_encoder_helper_atomic_check(struct drm_encoder *encoder,
>   }
>   
>   static const struct drm_encoder_helper_funcs mgag200_bmc_encoder_helper_funcs = {
> +	.atomic_disable = mgag200_bmc_encoder_helper_atomic_disable,
> +	.atomic_enable = mgag200_bmc_encoder_helper_atomic_enable,
>   	.atomic_check = mgag200_bmc_encoder_helper_atomic_check,
>   };
>   
> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
> index 4b75613de882..b1365795234b 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_drv.h
> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
> @@ -442,9 +442,7 @@ int mgag200_mode_config_init(struct mga_device *mdev, resource_size_t vram_avail
>   /* mgag200_vga.c */
>   int mgag200_vga_output_init(struct mga_device *mdev);
>   
> -				/* mgag200_bmc.c */
> -void mgag200_bmc_disable_vidrst(struct mga_device *mdev);
> -void mgag200_bmc_enable_vidrst(struct mga_device *mdev);
> +/* mgag200_bmc.c */
>   int mgag200_bmc_output_init(struct mga_device *mdev, struct drm_connector *physical_connector);
>   
>   #endif				/* __MGAG200_DRV_H__ */
> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ew3.c b/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
> index 839401e8b465..265f3e95830a 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
> @@ -146,8 +146,6 @@ static const struct mgag200_device_info mgag200_g200ew3_device_info =
>   	MGAG200_DEVICE_INFO_INIT(2048, 2048, 0, true, 0, 1, false);
>   
>   static const struct mgag200_device_funcs mgag200_g200ew3_device_funcs = {
> -	.disable_vidrst = mgag200_bmc_disable_vidrst,
> -	.enable_vidrst = mgag200_bmc_enable_vidrst,
>   	.pixpllc_atomic_check = mgag200_g200ew3_pixpllc_atomic_check,
>   	.pixpllc_atomic_update = mgag200_g200wb_pixpllc_atomic_update, // same as G200WB
>   };
> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200wb.c b/drivers/gpu/drm/mgag200/mgag200_g200wb.c
> index 835df0f4fc13..e25477347c3e 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_g200wb.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_g200wb.c
> @@ -280,8 +280,6 @@ static const struct mgag200_device_info mgag200_g200wb_device_info =
>   	MGAG200_DEVICE_INFO_INIT(1280, 1024, 31877, true, 0, 1, false);
>   
>   static const struct mgag200_device_funcs mgag200_g200wb_device_funcs = {
> -	.disable_vidrst = mgag200_bmc_disable_vidrst,
> -	.enable_vidrst = mgag200_bmc_enable_vidrst,
>   	.pixpllc_atomic_check = mgag200_g200wb_pixpllc_atomic_check,
>   	.pixpllc_atomic_update = mgag200_g200wb_pixpllc_atomic_update,
>   };

