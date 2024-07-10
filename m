Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB2692D42C
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 16:27:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBD8610E7F0;
	Wed, 10 Jul 2024 14:27:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="TjRXdCxF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E785810E7F2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 14:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720621620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ncEOEHSxWJTrcIH21ONeCWafzL4xQJHoRxWZIPekG7Y=;
 b=TjRXdCxFbE9rYgeds286NsJ+ecyCfp9Lr+MmhmmBE1g56G5IFHoR5s+31MWWUJbWmoTWrQ
 uGmWKzOUZSZ4q5vzMks0A+K+TbPnVTXubFtDsK+GcO6TyT2Zh0JhuvlqaMACps9+30Tci+
 Ehz7nRSuEo77NimDFYT5ek2MsSmJkqo=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-eFFIABEzMlyMS4l0MrVBRA-1; Wed, 10 Jul 2024 10:25:47 -0400
X-MC-Unique: eFFIABEzMlyMS4l0MrVBRA-1
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-2ee87546e5eso66320591fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 07:25:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720621546; x=1721226346;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ncEOEHSxWJTrcIH21ONeCWafzL4xQJHoRxWZIPekG7Y=;
 b=fwAR3P13BCdEN4EKdWLoRfAV1RgmzNwY/ZowV7etbocRsUDlDKFpJv7KwzBm6dvV0L
 evmJE69Xzk2uQoItJ79+KBlA6+ak8IbIeCDMR5+WrqhRd5yH35RYKESVBX1unNLVHQet
 uxKIcW3OstzGnD5aHJU8MYOc3BKo8Kp4lZkH/lcrqV8DJ6Hvj24ErY0DasOq4WE32ujD
 JuuXVW9u8Vyjfw0Z5WGP80XzgdeaEEhgS9gg1BG2/FopWEieEydm1HXg4TH1H5xztXpn
 HiKUQJlBJobYcHCQ6xAy5PWEHo4I+R3ttYZqsrG4/d5F+W/CGYYHz9R0OYZV2ROqC4UZ
 vppg==
X-Gm-Message-State: AOJu0YycMS4FZoX/jENZS/3uf6TAfY4Ug5scVO94FCi98LYRORUkYa5d
 y1eL6OZPMk+Vsi2/+4ty7MgmUaZ/zhLFvqW3Wz/bY179zAl3K/MRi4OHqRs2j4vWqeGLWvxl3B1
 s4DylHWNgrPpG3cfUNfEr6lh8ry6A7rW71URZ3srf9t/xJ+zlGaapbqj+nfGmTX9Pqw==
X-Received: by 2002:a05:651c:10b3:b0:2ee:7a3e:4723 with SMTP id
 38308e7fff4ca-2eeb3191333mr35434841fa.46.1720621545837; 
 Wed, 10 Jul 2024 07:25:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPiqFJ9mqWTziAZQEKszdNbXnb3xxZ34SpxrKJImDlZOygoqdNSVZMoYBlEaHBhKsRmzaC2w==
X-Received: by 2002:a05:651c:10b3:b0:2ee:7a3e:4723 with SMTP id
 38308e7fff4ca-2eeb3191333mr35434671fa.46.1720621545393; 
 Wed, 10 Jul 2024 07:25:45 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4266f6e0b19sm81219745e9.2.2024.07.10.07.25.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jul 2024 07:25:44 -0700 (PDT)
Message-ID: <29ed1a04-ceb7-4619-9b91-2ea35e53c9f2@redhat.com>
Date: Wed, 10 Jul 2024 16:25:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] drm/mgag200: Only set VIDRST bits in CRTC
 modesetting
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
References: <20240710084609.354578-1-tzimmermann@suse.de>
 <20240710084609.354578-2-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240710084609.354578-2-tzimmermann@suse.de>
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



On 10/07/2024 10:42, Thomas Zimmermann wrote:
> The VRSTEN and HRSTEN bits control whether a CRTC synchronizes its
> display signal with an external source on the VIDRST pin. The G200WB
> and G200EW3 models synchronize with a BMC chip, but different external
> video encoders, such as the Matrox Maven, can also be attached to the
> pin.
> 
> Only set VRSTEN and HRSTEN bits in the CRTC mode-setting code, so the
> bits are independent from the BMC. Add the field set_vidrst to the CRTC
> state for this purpose. Off by default, control the CRTC VIDRST setting
> from the CRTC's atomic_check helper.

Thanks, I think this has less chance for regression.

I've only a small nitpick below.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> v2:
> - keep logic entirely in CRTC (Jocelyn)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/mgag200/mgag200_bmc.c    |  5 -----
>   drivers/gpu/drm/mgag200/mgag200_drv.h    |  5 ++++-
>   drivers/gpu/drm/mgag200/mgag200_g200er.c |  2 +-
>   drivers/gpu/drm/mgag200/mgag200_g200ev.c |  2 +-
>   drivers/gpu/drm/mgag200/mgag200_g200se.c |  2 +-
>   drivers/gpu/drm/mgag200/mgag200_mode.c   | 14 ++++++++++----
>   6 files changed, 17 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mgag200/mgag200_bmc.c b/drivers/gpu/drm/mgag200/mgag200_bmc.c
> index 23ef85aa7e37..1c7aa4f36787 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_bmc.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_bmc.c
> @@ -77,11 +77,6 @@ void mgag200_bmc_enable_vidrst(struct mga_device *mdev)
>   {
>   	u8 tmp;
>   
> -	/* Ensure that the vrsten and hrsten are set */
> -	WREG8(MGAREG_CRTCEXT_INDEX, 1);
> -	tmp = RREG8(MGAREG_CRTCEXT_DATA);
> -	WREG8(MGAREG_CRTCEXT_DATA, tmp | 0x88);
> -
>   	/* Assert rstlvl2 */
>   	WREG8(DAC_INDEX, MGA1064_REMHEADCTL2);
>   	tmp = RREG8(DAC_DATA);
> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
> index 7f7dfbd0f013..4b75613de882 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_drv.h
> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
> @@ -179,6 +179,8 @@ struct mgag200_crtc_state {
>   	const struct drm_format_info *format;
>   
>   	struct mgag200_pll_values pixpllc;
> +
> +	bool set_vidrst;
>   };
>   
>   static inline struct mgag200_crtc_state *to_mgag200_crtc_state(struct drm_crtc_state *base)
> @@ -430,7 +432,8 @@ void mgag200_crtc_atomic_destroy_state(struct drm_crtc *crtc, struct drm_crtc_st
>   	.atomic_duplicate_state = mgag200_crtc_atomic_duplicate_state, \
>   	.atomic_destroy_state = mgag200_crtc_atomic_destroy_state
>   
> -void mgag200_set_mode_regs(struct mga_device *mdev, const struct drm_display_mode *mode);
> +void mgag200_set_mode_regs(struct mga_device *mdev, const struct drm_display_mode *mode,
> +			   bool set_vidrst);
>   void mgag200_set_format_regs(struct mga_device *mdev, const struct drm_format_info *format);
>   void mgag200_enable_display(struct mga_device *mdev);
>   void mgag200_init_registers(struct mga_device *mdev);
> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200er.c b/drivers/gpu/drm/mgag200/mgag200_g200er.c
> index 4e8a1756138d..abfbed6ec390 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_g200er.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_g200er.c
> @@ -195,7 +195,7 @@ static void mgag200_g200er_crtc_helper_atomic_enable(struct drm_crtc *crtc,
>   		funcs->disable_vidrst(mdev);
>   
>   	mgag200_set_format_regs(mdev, format);
> -	mgag200_set_mode_regs(mdev, adjusted_mode);
> +	mgag200_set_mode_regs(mdev, adjusted_mode, mgag200_crtc_state->set_vidrst);
>   
>   	if (funcs->pixpllc_atomic_update)
>   		funcs->pixpllc_atomic_update(crtc, old_state);
> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ev.c b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
> index d884f3cb0ec7..acc99999e2b5 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_g200ev.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
> @@ -196,7 +196,7 @@ static void mgag200_g200ev_crtc_helper_atomic_enable(struct drm_crtc *crtc,
>   		funcs->disable_vidrst(mdev);
>   
>   	mgag200_set_format_regs(mdev, format);
> -	mgag200_set_mode_regs(mdev, adjusted_mode);
> +	mgag200_set_mode_regs(mdev, adjusted_mode, mgag200_crtc_state->set_vidrst);
>   
>   	if (funcs->pixpllc_atomic_update)
>   		funcs->pixpllc_atomic_update(crtc, old_state);
> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200se.c b/drivers/gpu/drm/mgag200/mgag200_g200se.c
> index a824bb8ad579..be4e124102c6 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_g200se.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_g200se.c
> @@ -327,7 +327,7 @@ static void mgag200_g200se_crtc_helper_atomic_enable(struct drm_crtc *crtc,
>   		funcs->disable_vidrst(mdev);
>   
>   	mgag200_set_format_regs(mdev, format);
> -	mgag200_set_mode_regs(mdev, adjusted_mode);
> +	mgag200_set_mode_regs(mdev, adjusted_mode, mgag200_crtc_state->set_vidrst);
>   
>   	if (funcs->pixpllc_atomic_update)
>   		funcs->pixpllc_atomic_update(crtc, old_state);
> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
> index d4550e4b3b01..e746f365fecf 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
> @@ -201,9 +201,9 @@ void mgag200_init_registers(struct mga_device *mdev)
>   	WREG8(MGA_MISC_OUT, misc);
>   }
>   
> -void mgag200_set_mode_regs(struct mga_device *mdev, const struct drm_display_mode *mode)
> +void mgag200_set_mode_regs(struct mga_device *mdev, const struct drm_display_mode *mode,
> +			   bool set_vidrst)
>   {
> -	const struct mgag200_device_info *info = mdev->info;
>   	unsigned int hdisplay, hsyncstart, hsyncend, htotal;
>   	unsigned int vdisplay, vsyncstart, vsyncend, vtotal;
>   	u8 misc, crtcext1, crtcext2, crtcext5;
> @@ -238,9 +238,11 @@ void mgag200_set_mode_regs(struct mga_device *mdev, const struct drm_display_mod
>   		   ((hdisplay & 0x100) >> 7) |
>   		   ((hsyncstart & 0x100) >> 6) |
>   		    (htotal & 0x40);
> -	if (info->has_vidrst)
> +	if (set_vidrst)
>   		crtcext1 |= MGAREG_CRTCEXT1_VRSTEN |
>   			    MGAREG_CRTCEXT1_HRSTEN;
> +	else
> +		crtcext1 &= ~(MGAREG_CRTCEXT1_VRSTEN | MGAREG_CRTCEXT1_HRSTEN);

The else case is useless, as crtcext1 has already this bits set to 0 
unconditionnaly.

>   
>   	crtcext2 = ((vtotal & 0xc00) >> 10) |
>   		   ((vdisplay & 0x400) >> 8) |
> @@ -597,6 +599,7 @@ int mgag200_crtc_helper_atomic_check(struct drm_crtc *crtc, struct drm_atomic_st
>   	struct mga_device *mdev = to_mga_device(dev);
>   	const struct mgag200_device_funcs *funcs = mdev->funcs;
>   	struct drm_crtc_state *new_crtc_state = drm_atomic_get_new_crtc_state(new_state, crtc);
> +	struct mgag200_crtc_state *new_mgag200_crtc_state = to_mgag200_crtc_state(new_crtc_state);
>   	struct drm_property_blob *new_gamma_lut = new_crtc_state->gamma_lut;
>   	int ret;
>   
> @@ -607,6 +610,8 @@ int mgag200_crtc_helper_atomic_check(struct drm_crtc *crtc, struct drm_atomic_st
>   	if (ret)
>   		return ret;
>   
> +	new_mgag200_crtc_state->set_vidrst = mdev->info->has_vidrst;
> +
>   	if (new_crtc_state->mode_changed) {
>   		if (funcs->pixpllc_atomic_check) {
>   			ret = funcs->pixpllc_atomic_check(crtc, new_state);
> @@ -656,7 +661,7 @@ void mgag200_crtc_helper_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_
>   		funcs->disable_vidrst(mdev);
>   
>   	mgag200_set_format_regs(mdev, format);
> -	mgag200_set_mode_regs(mdev, adjusted_mode);
> +	mgag200_set_mode_regs(mdev, adjusted_mode, mgag200_crtc_state->set_vidrst);
>   
>   	if (funcs->pixpllc_atomic_update)
>   		funcs->pixpllc_atomic_update(crtc, old_state);
> @@ -717,6 +722,7 @@ struct drm_crtc_state *mgag200_crtc_atomic_duplicate_state(struct drm_crtc *crtc
>   	new_mgag200_crtc_state->format = mgag200_crtc_state->format;
>   	memcpy(&new_mgag200_crtc_state->pixpllc, &mgag200_crtc_state->pixpllc,
>   	       sizeof(new_mgag200_crtc_state->pixpllc));
> +	new_mgag200_crtc_state->set_vidrst = mgag200_crtc_state->set_vidrst;
>   
>   	return &new_mgag200_crtc_state->base;
>   }

