Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 046E3AB54C0
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 14:27:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6149B10E59E;
	Tue, 13 May 2025 12:27:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="JIkP3aCN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 990A110E59E
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 12:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747139238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X/p3h5e9wmTs8dI9Ka3t/mD4p4fAO+nuYBKiFrLyMw0=;
 b=JIkP3aCNQZAfp/G6nHYc68cBL1H3Lfos4K5QuXc9dRKYnAfdc6rPT2vIzvk1aDDSy+KxqT
 bk3Mkw1e0ylDggAWl/gNCQoWEbY0BY39EpLdzGvbSWnPmZKozWgh6dDNSsKQ6qdFRHa30M
 opzjwmWnEgYg8Gb22LcMwWwbKkMC2fM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-152-WwJPas6kM_OVg0k6cg5vXQ-1; Tue, 13 May 2025 08:27:15 -0400
X-MC-Unique: WwJPas6kM_OVg0k6cg5vXQ-1
X-Mimecast-MFC-AGG-ID: WwJPas6kM_OVg0k6cg5vXQ_1747139234
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3a0adce033bso1887819f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 05:27:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747139234; x=1747744034;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=X/p3h5e9wmTs8dI9Ka3t/mD4p4fAO+nuYBKiFrLyMw0=;
 b=FSoMUozbQ7RgnOiFJSyoIA1wEoBZbtMKoUE14bYtOoYViRfOLY7hKSFwFM8xBI+dwG
 7G9AO4J3ai9Mp8mRf82DoLAWhpJdta3rbcPa/nY4QShqEqg2S7CqepZrejCdsEaVPbe2
 Nl8KvKbf8zvZpg/uuC9IRe34WQ/Wja3bKZ3CteEgEjcEZhVbUHmqXAxIGHBFPA/siVJW
 9/ELdDj8E2LtaM9U0S9sCuLB3TCBGBEZeDi3O111hzmyDnILuD/8NkTE1UlllmSXOKzP
 1UzwD/cR7AYWILBqeL3PCypMBjCqvdBhtqbe+ruJj+VqP6DzO0M90KNo8R1XyAi6Srx4
 1R8A==
X-Gm-Message-State: AOJu0Yzsn+INm3LYKj8Jjuhdoed27/vR171UgsRS8QOf9asNRoB+ZwET
 83uOoXJfFQR34pwjaSiFggOB0yGGwdWQsGGRt/GRPMv1W9M9NiZ/PJuv1/rP2m4VMRPjlRL9p8A
 7p4EXSI19hEM0LH1Pl5NgVAnr2JT0PS16DEzI/lb+ot9ZQGQlitUx7mFc4CzVlQqRZw==
X-Gm-Gg: ASbGncv8xE2OqzlkKUQxgylBqO4kZGvGuAxQ8fkyiiDBhOG4HQLPY3GIVG4yxIkUzV6
 gop2v9ozAeYCixkgSrNNmlsN7lkJ11n3wpsjMM4j6ExCt7qrRy4JxPppcVe5b2HUhRZQNLn1aGV
 EWbEZliWzYGCznV9mrWlnuVhF4jrdQN+tyGNKqrm45BNmVakAIX23Syb4+L9MhowwCwrkNqr6dt
 O8203IavmY0oJUR0FYoqgDcNwVT70KClkrk3WOkVxKqZgsYpY2G9l1R2fDDDpYCLQXRhp+Ei50X
 3h8qQSfaBO6+bx7JcxnM+Gp7TLcdG4MwY9KwYga1K1QKPrx8Skk=
X-Received: by 2002:a05:6000:402a:b0:3a1:f5c7:c50 with SMTP id
 ffacd0b85a97d-3a1f6488071mr12143266f8f.47.1747139234293; 
 Tue, 13 May 2025 05:27:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFrrxj3IwXdKUV2CELEqv0QBfuZbCQ3r3I4UNOECD2kxQZkxX4AjMG3Z/asswcNELawoNcng==
X-Received: by 2002:a05:6000:402a:b0:3a1:f5c7:c50 with SMTP id
 ffacd0b85a97d-3a1f6488071mr12143244f8f.47.1747139233794; 
 Tue, 13 May 2025 05:27:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a1f58f396asm16352827f8f.59.2025.05.13.05.27.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 May 2025 05:27:13 -0700 (PDT)
Message-ID: <66c4553e-17ec-428e-8a3b-73a51af65cc1@redhat.com>
Date: Tue, 13 May 2025 14:27:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] drm/mgag200: Use helpers for programming gamma ramps
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 airlied@redhat.com, simona@ffwll.ch, airlied@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org
References: <20250509083911.39018-1-tzimmermann@suse.de>
 <20250509083911.39018-4-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250509083911.39018-4-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: k7QZEKISrugvBoIugYpHNAmBX3s1xIJHJfhCKaX_1WE_1747139234
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

On 09/05/2025 10:23, Thomas Zimmermann wrote:
> Replace mgag200's code for programming the hardware gamma LUT with
> DRM helpers. Either load a provided gamma ramp or program a default.
> Set the individual entries with a callback.
> 
> Each gamma value is given as 3 individual 16-bit values for red,
> green and blue. The driver reduces them to 8 bit to make them fit
> into hardware registers.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/mgag200/mgag200_drv.h    |  4 +-
>   drivers/gpu/drm/mgag200/mgag200_g200er.c |  4 +-
>   drivers/gpu/drm/mgag200/mgag200_g200ev.c |  4 +-
>   drivers/gpu/drm/mgag200/mgag200_g200se.c |  4 +-
>   drivers/gpu/drm/mgag200/mgag200_mode.c   | 78 ++++++++++--------------
>   5 files changed, 40 insertions(+), 54 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
> index 819a7e9381e3..7d481e11f9d6 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_drv.h
> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
> @@ -382,8 +382,8 @@ int mgag200_primary_plane_helper_get_scanout_buffer(struct drm_plane *plane,
>   	.destroy = drm_plane_cleanup, \
>   	DRM_GEM_SHADOW_PLANE_FUNCS
>   
> -void mgag200_crtc_set_gamma_linear(struct mga_device *mdev, const struct drm_format_info *format);
> -void mgag200_crtc_set_gamma(struct mga_device *mdev,
> +void mgag200_crtc_fill_gamma(struct mga_device *mdev, const struct drm_format_info *format);
> +void mgag200_crtc_load_gamma(struct mga_device *mdev,
>   			    const struct drm_format_info *format,
>   			    struct drm_color_lut *lut);
>   
> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200er.c b/drivers/gpu/drm/mgag200/mgag200_g200er.c
> index c20ed0ab50ec..23debc70dc54 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_g200er.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_g200er.c
> @@ -200,9 +200,9 @@ static void mgag200_g200er_crtc_helper_atomic_enable(struct drm_crtc *crtc,
>   	mgag200_g200er_reset_tagfifo(mdev);
>   
>   	if (crtc_state->gamma_lut)
> -		mgag200_crtc_set_gamma(mdev, format, crtc_state->gamma_lut->data);
> +		mgag200_crtc_load_gamma(mdev, format, crtc_state->gamma_lut->data);
>   	else
> -		mgag200_crtc_set_gamma_linear(mdev, format);
> +		mgag200_crtc_fill_gamma(mdev, format);
>   
>   	mgag200_enable_display(mdev);
>   }
> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ev.c b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
> index 78be964eb97c..f8796e2b7a0f 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_g200ev.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
> @@ -201,9 +201,9 @@ static void mgag200_g200ev_crtc_helper_atomic_enable(struct drm_crtc *crtc,
>   	mgag200_g200ev_set_hiprilvl(mdev);
>   
>   	if (crtc_state->gamma_lut)
> -		mgag200_crtc_set_gamma(mdev, format, crtc_state->gamma_lut->data);
> +		mgag200_crtc_load_gamma(mdev, format, crtc_state->gamma_lut->data);
>   	else
> -		mgag200_crtc_set_gamma_linear(mdev, format);
> +		mgag200_crtc_fill_gamma(mdev, format);
>   
>   	mgag200_enable_display(mdev);
>   }
> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200se.c b/drivers/gpu/drm/mgag200/mgag200_g200se.c
> index 7a32d3b1d226..e80da12ba1fe 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_g200se.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_g200se.c
> @@ -332,9 +332,9 @@ static void mgag200_g200se_crtc_helper_atomic_enable(struct drm_crtc *crtc,
>   	mgag200_g200se_set_hiprilvl(mdev, adjusted_mode, format);
>   
>   	if (crtc_state->gamma_lut)
> -		mgag200_crtc_set_gamma(mdev, format, crtc_state->gamma_lut->data);
> +		mgag200_crtc_load_gamma(mdev, format, crtc_state->gamma_lut->data);
>   	else
> -		mgag200_crtc_set_gamma_linear(mdev, format);
> +		mgag200_crtc_fill_gamma(mdev, format);
>   
>   	mgag200_enable_display(mdev);
>   }
> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
> index 6067d08aeee3..39bfb9f4b205 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
> @@ -13,6 +13,7 @@
>   
>   #include <drm/drm_atomic.h>
>   #include <drm/drm_atomic_helper.h>
> +#include <drm/drm_color_mgmt.h>
>   #include <drm/drm_damage_helper.h>
>   #include <drm/drm_edid.h>
>   #include <drm/drm_format_helper.h>
> @@ -30,35 +31,37 @@
>    * This file contains setup code for the CRTC.
>    */
>   
> -void mgag200_crtc_set_gamma_linear(struct mga_device *mdev,
> -				   const struct drm_format_info *format)
> +static void mgag200_set_gamma_lut(struct drm_crtc *crtc, unsigned int index,
> +				  u16 red, u16 green, u16 blue)
>   {
> -	int i;
> +	struct drm_device *dev = crtc->dev;
> +	struct mga_device *mdev = to_mga_device(dev);
> +	u8 i8 = index & 0xff;
> +	u8 r8 = red >> 8;
> +	u8 g8 = green >> 8;
> +	u8 b8 = blue >> 8;
> +
> +	if (drm_WARN_ON_ONCE(dev, index != i8))
> +		return; /* driver bug */
> +
> +	WREG8(DAC_INDEX + MGA1064_INDEX, i8);
> +	WREG8(DAC_INDEX + MGA1064_COL_PAL, r8);
> +	WREG8(DAC_INDEX + MGA1064_COL_PAL, g8);
> +	WREG8(DAC_INDEX + MGA1064_COL_PAL, b8);
> +}
>   
> -	WREG8(DAC_INDEX + MGA1064_INDEX, 0);
> +void mgag200_crtc_fill_gamma(struct mga_device *mdev,
> +			     const struct drm_format_info *format)
> +{
> +	struct drm_crtc *crtc = &mdev->crtc;
>   
>   	switch (format->format) {
>   	case DRM_FORMAT_RGB565:
> -		/* Use better interpolation, to take 32 values from 0 to 255 */
> -		for (i = 0; i < MGAG200_LUT_SIZE / 8; i++) {
> -			WREG8(DAC_INDEX + MGA1064_COL_PAL, i * 8 + i / 4);
> -			WREG8(DAC_INDEX + MGA1064_COL_PAL, i * 4 + i / 16);
> -			WREG8(DAC_INDEX + MGA1064_COL_PAL, i * 8 + i / 4);
> -		}
> -		/* Green has one more bit, so add padding with 0 for red and blue. */
> -		for (i = MGAG200_LUT_SIZE / 8; i < MGAG200_LUT_SIZE / 4; i++) {
> -			WREG8(DAC_INDEX + MGA1064_COL_PAL, 0);
> -			WREG8(DAC_INDEX + MGA1064_COL_PAL, i * 4 + i / 16);
> -			WREG8(DAC_INDEX + MGA1064_COL_PAL, 0);
> -		}
> +		drm_crtc_fill_gamma_565(crtc, mgag200_set_gamma_lut);
>   		break;
>   	case DRM_FORMAT_RGB888:
>   	case DRM_FORMAT_XRGB8888:
> -		for (i = 0; i < MGAG200_LUT_SIZE; i++) {
> -			WREG8(DAC_INDEX + MGA1064_COL_PAL, i);
> -			WREG8(DAC_INDEX + MGA1064_COL_PAL, i);
> -			WREG8(DAC_INDEX + MGA1064_COL_PAL, i);
> -		}
> +		drm_crtc_fill_gamma_888(crtc, mgag200_set_gamma_lut);
>   		break;
>   	default:
>   		drm_warn_once(&mdev->base, "Unsupported format %p4cc for gamma correction\n",
> @@ -67,36 +70,19 @@ void mgag200_crtc_set_gamma_linear(struct mga_device *mdev,
>   	}
>   }
>   
> -void mgag200_crtc_set_gamma(struct mga_device *mdev,
> +void mgag200_crtc_load_gamma(struct mga_device *mdev,
>   			    const struct drm_format_info *format,
>   			    struct drm_color_lut *lut)
>   {
> -	int i;
> -
> -	WREG8(DAC_INDEX + MGA1064_INDEX, 0);
> +	struct drm_crtc *crtc = &mdev->crtc;
>   
>   	switch (format->format) {
>   	case DRM_FORMAT_RGB565:
> -		/* Use better interpolation, to take 32 values from lut[0] to lut[255] */
> -		for (i = 0; i < MGAG200_LUT_SIZE / 8; i++) {
> -			WREG8(DAC_INDEX + MGA1064_COL_PAL, lut[i * 8 + i / 4].red >> 8);
> -			WREG8(DAC_INDEX + MGA1064_COL_PAL, lut[i * 4 + i / 16].green >> 8);
> -			WREG8(DAC_INDEX + MGA1064_COL_PAL, lut[i * 8 + i / 4].blue >> 8);
> -		}
> -		/* Green has one more bit, so add padding with 0 for red and blue. */
> -		for (i = MGAG200_LUT_SIZE / 8; i < MGAG200_LUT_SIZE / 4; i++) {
> -			WREG8(DAC_INDEX + MGA1064_COL_PAL, 0);
> -			WREG8(DAC_INDEX + MGA1064_COL_PAL, lut[i * 4 + i / 16].green >> 8);
> -			WREG8(DAC_INDEX + MGA1064_COL_PAL, 0);
> -		}
> +		drm_crtc_load_gamma_565_from_888(crtc, lut, mgag200_set_gamma_lut);
>   		break;
>   	case DRM_FORMAT_RGB888:
>   	case DRM_FORMAT_XRGB8888:
> -		for (i = 0; i < MGAG200_LUT_SIZE; i++) {
> -			WREG8(DAC_INDEX + MGA1064_COL_PAL, lut[i].red >> 8);
> -			WREG8(DAC_INDEX + MGA1064_COL_PAL, lut[i].green >> 8);
> -			WREG8(DAC_INDEX + MGA1064_COL_PAL, lut[i].blue >> 8);
> -		}
> +		drm_crtc_load_gamma_888(crtc, lut, mgag200_set_gamma_lut);
>   		break;
>   	default:
>   		drm_warn_once(&mdev->base, "Unsupported format %p4cc for gamma correction\n",
> @@ -642,9 +628,9 @@ void mgag200_crtc_helper_atomic_flush(struct drm_crtc *crtc, struct drm_atomic_s
>   		const struct drm_format_info *format = mgag200_crtc_state->format;
>   
>   		if (crtc_state->gamma_lut)
> -			mgag200_crtc_set_gamma(mdev, format, crtc_state->gamma_lut->data);
> +			mgag200_crtc_load_gamma(mdev, format, crtc_state->gamma_lut->data);
>   		else
> -			mgag200_crtc_set_gamma_linear(mdev, format);
> +			mgag200_crtc_fill_gamma(mdev, format);
>   	}
>   }
>   
> @@ -665,9 +651,9 @@ void mgag200_crtc_helper_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_
>   		funcs->pixpllc_atomic_update(crtc, old_state);
>   
>   	if (crtc_state->gamma_lut)
> -		mgag200_crtc_set_gamma(mdev, format, crtc_state->gamma_lut->data);
> +		mgag200_crtc_load_gamma(mdev, format, crtc_state->gamma_lut->data);
>   	else
> -		mgag200_crtc_set_gamma_linear(mdev, format);
> +		mgag200_crtc_fill_gamma(mdev, format);
>   
>   	mgag200_enable_display(mdev);
>   }

