Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1113948E92
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 14:10:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D50310E33D;
	Tue,  6 Aug 2024 12:10:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="YwVoqYdA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9486310E33D
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2024 12:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1722946245;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jP29AazkCwWf5U3YWxwBKJ9SouX8BirObca7M3d1Gn8=;
 b=YwVoqYdA7PLy42MWz002h0iPGC9SdfexewNZdJsj5Ar/ffXztZA4Or9P1oE1t31zj23h9t
 1Lc95P1Zs9Z9UWOO3JTrWurrq+20y1ybApIdLb1Sf8zoo/LeegrgnCWGVJgYG/wPp65dRg
 zsuwHenNCzWAdeaMsZFVRxdVAOSBPRU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-76-rPm6fcguOO6sAMGOiMGGGA-1; Tue, 06 Aug 2024 08:10:44 -0400
X-MC-Unique: rPm6fcguOO6sAMGOiMGGGA-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-428e48612acso6666275e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Aug 2024 05:10:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722946243; x=1723551043;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jP29AazkCwWf5U3YWxwBKJ9SouX8BirObca7M3d1Gn8=;
 b=gCqDMffxVGXd83S0ZZiUY+KcuYBh7/yzqr/ZNTQuLlt+7U55KI/grpzyMYriZjpvlq
 JwB6XtaYV9Wx7TkPfSIoQylei1Z8+wHCzBgTRxpp8im1poo1l96I+xNf0/ceKa+acMRh
 1o6ib1kZ8WOkH00Vn0fl2/+5zNMbB0YU5nqtxXnO/A2iRBnYMPum6rxMmQKza9qr/hkK
 kVRvsBFUKgMc8ncTVrdCYWHfyL9z0YceJpTGsoQfflNgbL5AZ6kYcroE9DC5DuVeFFJV
 iMNC8br5DM4H5kdzracdNLhZksXupDXFRrfs8/AsA4r4Ik9VExwinmfh5Q5XRAF0fYEo
 eUaA==
X-Gm-Message-State: AOJu0Yzpjb+iGQ9gHYcaUqfogb5bdQjoF4+JTSkVHhzuMEEwEF+7/4UX
 VVXQaTSWj5zc0SqPRUFiSZL6D9NK6hluV3hFkQufAyH4QJv7O5X70x/ZXseL6g+omz2TvCi7e9Q
 CaoLEVrfoYNyyYDpxvIY+a9BlVxZ1B1pcTvStZV92U2fcet+rUCjtgT/R4xGGpSj2pgx8YIX8PQ
 ==
X-Received: by 2002:a05:600c:3c84:b0:426:6ee7:d594 with SMTP id
 5b1f17b1804b1-428e6af2443mr130428875e9.7.1722946242689; 
 Tue, 06 Aug 2024 05:10:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSXm3lTj7lIz/MjogO1dHU/BtdEqGfmsICbDg9XIjAs2EsRYbLh5GRt1Hcb07hSRSWWKVvbA==
X-Received: by 2002:a05:600c:3c84:b0:426:6ee7:d594 with SMTP id
 5b1f17b1804b1-428e6af2443mr130419185e9.7.1722946226881; 
 Tue, 06 Aug 2024 05:10:26 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:d3ea:62cf:3052:fac6?
 ([2a01:e0a:d5:a000:d3ea:62cf:3052:fac6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36bbd01402csm12825902f8f.39.2024.08.06.05.10.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Aug 2024 05:10:26 -0700 (PDT)
Message-ID: <66b37cce-49e5-40ee-a65c-4e3de6048496@redhat.com>
Date: Tue, 6 Aug 2024 14:10:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] drm/mgag200: vga-bmc: Control BMC scanout from encoder
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
References: <20240805130622.63458-1-tzimmermann@suse.de>
 <20240805130622.63458-5-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240805130622.63458-5-tzimmermann@suse.de>
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
> Move calls to stop and start BMC scanout from CRTC helpers to the
> VGA-BMC encoder's atomic_disable and atomic_enable. Makes the BMC
> scanout transparent to the CRTC.
> 
> DRM's atomic helpers call an encoder's atomic_disable and atomic_enable
> helpers for all enabled encoders. The BMC stops scanning out the VGA
> signal if modeset disables the VGA encoder, and starts scanning out
> if the modeset enables the VGA encoder.
> 

Thanks for this work.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/mgag200/mgag200_g200er.c  |  3 ---
>   drivers/gpu/drm/mgag200/mgag200_g200ev.c  |  3 ---
>   drivers/gpu/drm/mgag200/mgag200_g200se.c  |  3 ---
>   drivers/gpu/drm/mgag200/mgag200_mode.c    |  6 ------
>   drivers/gpu/drm/mgag200/mgag200_vga_bmc.c | 20 ++++++++++++++++++++
>   5 files changed, 20 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200er.c b/drivers/gpu/drm/mgag200/mgag200_g200er.c
> index e0f7816ad87a..b99b308a7e54 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_g200er.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_g200er.c
> @@ -207,9 +207,6 @@ static void mgag200_g200er_crtc_helper_atomic_enable(struct drm_crtc *crtc,
>   
>   	mgag200_enable_display(mdev);
>   
> -	if (mdev->info->sync_bmc)
> -		mgag200_bmc_start_scanout(mdev);
> -
>   	drm_crtc_vblank_on(crtc);
>   }
>   
> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ev.c b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
> index a2c683f82127..717e4357adcc 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_g200ev.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
> @@ -208,9 +208,6 @@ static void mgag200_g200ev_crtc_helper_atomic_enable(struct drm_crtc *crtc,
>   
>   	mgag200_enable_display(mdev);
>   
> -	if (mdev->info->sync_bmc)
> -		mgag200_bmc_start_scanout(mdev);
> -
>   	drm_crtc_vblank_on(crtc);
>   }
>   
> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200se.c b/drivers/gpu/drm/mgag200/mgag200_g200se.c
> index b83f3f31ed0e..0db7e14e3328 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_g200se.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_g200se.c
> @@ -339,9 +339,6 @@ static void mgag200_g200se_crtc_helper_atomic_enable(struct drm_crtc *crtc,
>   
>   	mgag200_enable_display(mdev);
>   
> -	if (mdev->info->sync_bmc)
> -		mgag200_bmc_start_scanout(mdev);
> -
>   	drm_crtc_vblank_on(crtc);
>   }
>   
> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
> index 8dc16821e1cd..7159909aca1e 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
> @@ -693,9 +693,6 @@ void mgag200_crtc_helper_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_
>   
>   	mgag200_enable_display(mdev);
>   
> -	if (mdev->info->sync_bmc)
> -		mgag200_bmc_start_scanout(mdev);
> -
>   	drm_crtc_vblank_on(crtc);
>   }
>   
> @@ -705,9 +702,6 @@ void mgag200_crtc_helper_atomic_disable(struct drm_crtc *crtc, struct drm_atomic
>   
>   	drm_crtc_vblank_off(crtc);
>   
> -	if (mdev->info->sync_bmc)
> -		mgag200_bmc_stop_scanout(mdev);
> -
>   	mgag200_disable_display(mdev);
>   }
>   
> diff --git a/drivers/gpu/drm/mgag200/mgag200_vga_bmc.c b/drivers/gpu/drm/mgag200/mgag200_vga_bmc.c
> index 77340f2dee17..a5a3ac108bd5 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_vga_bmc.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_vga_bmc.c
> @@ -8,6 +8,24 @@
>   #include "mgag200_ddc.h"
>   #include "mgag200_drv.h"
>   
> +static void mgag200_vga_bmc_encoder_atomic_disable(struct drm_encoder *encoder,
> +						   struct drm_atomic_state *state)
> +{
> +	struct mga_device *mdev = to_mga_device(encoder->dev);
> +
> +	if (mdev->info->sync_bmc)
> +		mgag200_bmc_stop_scanout(mdev);
> +}
> +
> +static void mgag200_vga_bmc_encoder_atomic_enable(struct drm_encoder *encoder,
> +						  struct drm_atomic_state *state)
> +{
> +	struct mga_device *mdev = to_mga_device(encoder->dev);
> +
> +	if (mdev->info->sync_bmc)
> +		mgag200_bmc_start_scanout(mdev);
> +}
> +
>   static int mgag200_vga_bmc_encoder_atomic_check(struct drm_encoder *encoder,
>   						struct drm_crtc_state *new_crtc_state,
>   						struct drm_connector_state *new_connector_state)
> @@ -21,6 +39,8 @@ static int mgag200_vga_bmc_encoder_atomic_check(struct drm_encoder *encoder,
>   }
>   
>   static const struct drm_encoder_helper_funcs mgag200_dac_encoder_helper_funcs = {
> +	.atomic_disable = mgag200_vga_bmc_encoder_atomic_disable,
> +	.atomic_enable = mgag200_vga_bmc_encoder_atomic_enable,
>   	.atomic_check = mgag200_vga_bmc_encoder_atomic_check,
>   };
>   

