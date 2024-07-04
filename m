Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 415789275AD
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 14:04:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BFAA10EAA9;
	Thu,  4 Jul 2024 12:04:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="gON8WAud";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1923310EA1E
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2024 12:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720094639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ij+cvqiVcwLi+pPwpy2D2G8CqUu7htfoPEjWLTB11Ms=;
 b=gON8WAudOwB20q9BIROMTu0C4yuk/eqjrD7xT9+gJH9l/GHfK0xhdufTSHZU8HysVvr53q
 58fcpBglBsJUVEgXwmxSpfLMELPp8EXD5+NDKDwkT4rRglFRwglPgoDYFZLxihl7gDEk4V
 eRmCMGUZtDzi/+sygT8s8c00YxB8gOM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-76-mzOLWNlIPymb-eHIADAWxw-1; Thu, 04 Jul 2024 08:03:57 -0400
X-MC-Unique: mzOLWNlIPymb-eHIADAWxw-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-367987e6ebcso481814f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jul 2024 05:03:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720094636; x=1720699436;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ij+cvqiVcwLi+pPwpy2D2G8CqUu7htfoPEjWLTB11Ms=;
 b=aV1cVJiE4GcU5jBPHfJJZOHKo0/IXhz6u+vd/PyIv+3F1+AkJbZWGJDOQHct4loDbH
 HWH00U0Cb9wLCMaV+D4SO00taVabtiyuPE1JVaCSuIXROVcSc8CK3aGzoixkiUesvC9+
 oITnFfM9/Pfmb06VDUHfIf4aalaO34yEZR39BE4b3JVLbPUyLV31eyjvhUlsOCGCtrHV
 /ovSMHPawmYtK5j6yfsbi3QDIIXUtDvEdwKLfmJ0sqvbFSI8+7nApT4g3Wh0HFdS3MWd
 D1jEtUPeXehZ4yhR414KvUPuj747d14Rw6Ymu7IvEQIB0fzfKnRfPgGsQcMVd4mX8zZw
 oD0w==
X-Gm-Message-State: AOJu0Yw4cZiFQZj+9cbKWiC6mg2w3XJ/yoKFUtKVytgTU+3jujoYriug
 tIPD7Zc2YOJOToKIfNTwCdBM9sNSlWpv4L6v+fKW7yaQZkw5EfrwLhU3qB8uK6DR6RdffyG8a4D
 LnwDMjIBqkMWmlOO1ZKofwEFRtecyQ5f2YaeaiVdTieDy3iqZZubkPHA5Y2Qmtftbtw==
X-Received: by 2002:adf:f3d1:0:b0:35f:48e:fe59 with SMTP id
 ffacd0b85a97d-3679dd73fadmr1033180f8f.66.1720094636354; 
 Thu, 04 Jul 2024 05:03:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhAGddAm1hrr/XaVPu2aCeMtHJk6kFVs3Q5iel8rBnGX20lNNQa9O8WuJrElFeoxsKUhlEng==
X-Received: by 2002:adf:f3d1:0:b0:35f:48e:fe59 with SMTP id
 ffacd0b85a97d-3679dd73fadmr1033151f8f.66.1720094635881; 
 Thu, 04 Jul 2024 05:03:55 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:680e:9bf4:b6a9:959b?
 ([2a01:e0a:d5:a000:680e:9bf4:b6a9:959b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3678a23b349sm6504035f8f.36.2024.07.04.05.03.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jul 2024 05:03:55 -0700 (PDT)
Message-ID: <bdc20978-933d-4b57-8350-3775fa01e145@redhat.com>
Date: Thu, 4 Jul 2024 14:03:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/mgag200: Only set VIDRST bits in CRTC modesetting
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
References: <20240703135502.29190-1-tzimmermann@suse.de>
 <20240703135502.29190-2-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240703135502.29190-2-tzimmermann@suse.de>
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
> The VRSTEN and HRSTEN bits control whether a CRTC synchronizes its
> display signal with an external source on the VIDRST pin. The G200WB
> and G200EW3 models synchronize with a BMC chip, but different external
> video encoders, such as the Matrox Maven, can also be attached to the
> pin.

If I understand correctly, it's a kind of VSYNC with the BMC, to avoid
tearing when using the remote console ?

> 
> Only set VRSTEN and HRSTEN bits in the CRTC mode-setting code, so the
> driver maintains the bits independently from the BMC. Add the field
> set_vidrst to the CRTC state for this purpose. Off by default, control
> the CRTC VIDRST setting from the BMC's atomic_check helper. So if a
> BMC (or another external clock) requires synchronization, it instructs
> the CRTC to synchronize. >
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/mgag200/mgag200_bmc.c    | 26 +++++++++++++++++++-----
>   drivers/gpu/drm/mgag200/mgag200_drv.h    |  5 ++++-
>   drivers/gpu/drm/mgag200/mgag200_g200er.c |  2 +-
>   drivers/gpu/drm/mgag200/mgag200_g200ev.c |  2 +-
>   drivers/gpu/drm/mgag200/mgag200_g200se.c |  2 +-
>   drivers/gpu/drm/mgag200/mgag200_mode.c   | 11 ++++++----
>   6 files changed, 35 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mgag200/mgag200_bmc.c b/drivers/gpu/drm/mgag200/mgag200_bmc.c
> index 23ef85aa7e37..cb5400333862 100644
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
> @@ -108,6 +103,25 @@ void mgag200_bmc_enable_vidrst(struct mga_device *mdev)
>   	WREG_DAC(MGA1064_GEN_IO_DATA, tmp);
>   }
>   
> +static int mgag200_bmc_encoder_helper_atomic_check(struct drm_encoder *encoder,
> +						   struct drm_crtc_state *crtc_state,
> +						   struct drm_connector_state *conn_state)
> +{
> +	struct mga_device *mdev = to_mga_device(encoder->dev);
> +	struct mgag200_crtc_state *mgag200_crtc_state = to_mgag200_crtc_state(crtc_state);
> +
> +	if (mdev->info->has_vidrst)
> +		mgag200_crtc_state->set_vidrst = true;
> +	else
> +		mgag200_crtc_state->set_vidrst = false;
> +

I think you can simplify it with:

mgag200_crtc_state->set_vidrst = mdev->info->has_vidrst;

> +	return 0;
> +}
> +
> +static const struct drm_encoder_helper_funcs mgag200_bmc_encoder_helper_funcs = {
> +	.atomic_check = mgag200_bmc_encoder_helper_atomic_check,
> +};
> +
>   static const struct drm_encoder_funcs mgag200_bmc_encoder_funcs = {
>   	.destroy = drm_encoder_cleanup,
>   };
> @@ -190,6 +204,8 @@ int mgag200_bmc_output_init(struct mga_device *mdev, struct drm_connector *physi
>   			       DRM_MODE_ENCODER_VIRTUAL, NULL);
>   	if (ret)
>   		return ret;
> +	drm_encoder_helper_add(encoder, &mgag200_bmc_encoder_helper_funcs);
> +
>   	encoder->possible_crtcs = drm_crtc_mask(crtc);
>   
>   	bmc_connector = &mdev->output.bmc.bmc_connector;
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
> index bb6204002cb3..4f4612192e30 100644
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
>   
>   	crtcext2 = ((vtotal & 0xc00) >> 10) |
>   		   ((vdisplay & 0x400) >> 8) |
> @@ -656,7 +658,7 @@ void mgag200_crtc_helper_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_
>   		funcs->disable_vidrst(mdev);
>   
>   	mgag200_set_format_regs(mdev, format);
> -	mgag200_set_mode_regs(mdev, adjusted_mode);
> +	mgag200_set_mode_regs(mdev, adjusted_mode, mgag200_crtc_state->set_vidrst);
>   
>   	if (funcs->pixpllc_atomic_update)
>   		funcs->pixpllc_atomic_update(crtc, old_state);
> @@ -717,6 +719,7 @@ struct drm_crtc_state *mgag200_crtc_atomic_duplicate_state(struct drm_crtc *crtc
>   	new_mgag200_crtc_state->format = mgag200_crtc_state->format;
>   	memcpy(&new_mgag200_crtc_state->pixpllc, &mgag200_crtc_state->pixpllc,
>   	       sizeof(new_mgag200_crtc_state->pixpllc));
> +	new_mgag200_crtc_state->set_vidrst = mgag200_crtc_state->set_vidrst;
>   
>   	return &new_mgag200_crtc_state->base;
>   }

With the small nitpick.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>


-- 

Jocelyn

