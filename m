Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F89AB3947
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 15:31:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDEB410E40D;
	Mon, 12 May 2025 13:31:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="PvNf/K7W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17F9910E40E
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 13:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747056688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3nL/zBe+RYqA2g3WP6t0AICkYBiovyTH+hoAqX/RA9g=;
 b=PvNf/K7WGc/nS5vj8OJroRlyUhX8+gJuWWlZ2XA/5t4TpJklXvYQ4Ny/25nexwPGvBw7on
 HCjWS9q2VouZvAaudENWiSvK7Z0q4eJHDiBoHaDkpvW86CjOpQpT4HRniLyWF4gmfIVHVu
 NMvtYEM0bCaPPH/PYMz+ksIXM73DKTY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-401-bVI9mAg6OZquOItFodWFsw-1; Mon, 12 May 2025 09:31:25 -0400
X-MC-Unique: bVI9mAg6OZquOItFodWFsw-1
X-Mimecast-MFC-AGG-ID: bVI9mAg6OZquOItFodWFsw_1747056684
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3a0b9bbfa5dso1483414f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 06:31:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747056683; x=1747661483;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3nL/zBe+RYqA2g3WP6t0AICkYBiovyTH+hoAqX/RA9g=;
 b=Xbl3zBp9pHh5JBSeEc4zRazIbapJ3gQLoXx7P4d9vtwnu+SYwLOoi/T006KNCfyaHe
 eZ2MyCYEXRmeBiyQ6FBvaRmvYykDfcnNgp9y3/PgCvtyRi5c3qoYjRJFEy6PkfDjkQ3l
 9mWt/xNGbaEYdEyI9TTL441RFo16QZgm95vYXisOOiAJkBzm/KOhTgHS/qJ2mQvE3780
 CuoPduxc74pVN6bh5V94rZHlOn/h+g+rk02pKHCvTDaPBcXTaWAZhahiw4PyrWeBAzV5
 ljEUatZn181SznAmY1hYv2QNsj1hEmLiK/otZS1qUUWDnqutHPUn+Y3fPN1gpdLzvsVF
 ojOQ==
X-Gm-Message-State: AOJu0YzG24tx2FFZoXCotZd32VnMy78sB3OahSZ7g6hTN/7JSaKOhctS
 6YDWXMF2Ol8T5m+jOTlRC90LKq9/7dL6YoooUTIdHF0fQXwbqCpoayi7ckopCpCp1BfR3YqRjrE
 dQQAykRQT11BSEShepFM+3m32U4hVmoQC2nh5NwHOslX/4xFmWNP3NJrSOJIMzsQFMA==
X-Gm-Gg: ASbGncu1e3iNUi9vCRfSHUsSyguJd6MfRLGU+6R4+NOaQcBDhs9IMqrgqHspe2k3nrx
 udgtciipqs3CKiAe1+XlCs9yDf8EamBbJDKYPLhCkhXsDDYiMmONrktqmB+2SlKPSBbeApSM5eW
 7oChc3Qpopvm5jGpQr1aMOG+CHKJVo+hnDKlJbkAgU28NYDl3Jmm1jGBieM6zu1Vsp7ef4vPPGm
 Jeq46XfPa69kWREN90I7o+yRt3EUgb/b9t05yWKfOcXgn4IwgV8PjO2klEddR5pO2U4AJrqHm8I
 OlPVaDTmvaYTJI6h1WKXDroGfYurjdrxm9G9suSwbc7KLgCMRms=
X-Received: by 2002:a05:6000:3113:b0:3a0:b308:8427 with SMTP id
 ffacd0b85a97d-3a1f6482d31mr10749054f8f.37.1747056683610; 
 Mon, 12 May 2025 06:31:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFlNwjCyXGPn2EgWg4pTnX18lfwoffqTmlTe22WN5JHp0maCMXA9Xrndh4FMBKgLUXW1bN6Q==
X-Received: by 2002:a05:6000:3113:b0:3a0:b308:8427 with SMTP id
 ffacd0b85a97d-3a1f6482d31mr10749027f8f.37.1747056683137; 
 Mon, 12 May 2025 06:31:23 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a1f5a2ca47sm12521009f8f.73.2025.05.12.06.31.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 May 2025 06:31:22 -0700 (PDT)
Message-ID: <61e26230-e1c2-449c-965a-1f84ede0ac2e@redhat.com>
Date: Mon, 12 May 2025 15:31:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] drm: Add helpers for programming hardware gamma LUTs
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 airlied@redhat.com, simona@ffwll.ch, airlied@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org
References: <20250509083911.39018-1-tzimmermann@suse.de>
 <20250509083911.39018-2-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250509083911.39018-2-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zm-YKeQbFSVTvuI4h0c16o8R2fcu_YS-ocAUDLIxXEY_1747056684
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
> Provide helpers that program hardware gamma LUTs. Tha gamma ramp is
> either provided by the driver or generated by the helper.
> 
> The DRM driver exports the GAMMA_LUT property with a fixed number of
> entries per color component, such as 256 on 8-bit-wide components. The
> entries describe the gamma ramp of each individual component. The new
> helper drm_crtc_load_gamma_888() loads such gamma ramp to hardware. The
> hardware uses each displayed pixel's individial components as indeces
> into the hardware gamma table.
> 
> For color modes with less than 8 bits per color component, the helpers
> drm_crtc_load_gamma_565_from() and drm_crtc_load_gamma_555_from_888()
> interpolate the provided gamma ramp to reduce it to the correct number
> of entries; 5/6/5 for RGB565-like formats and 5/5/5 for RGB1555-like
> formats.
> 
> If no gamma ramp has been provided, drivers can use the new helper
> drm_crtc_fill_gamma_888() to load a default gamma ramp with 256 entries
> per color component. For color modes with less bits, the new helpers
> drm_crtc_fill_gamma_565() and drm_crtc_fill_gamma_555() are available.
> The default gamma ramp uses a gamma factor of 1. Later patches can
> change this. For PCs, a gamma factor of 2.2 is common.
> 
> For color modes with palette, drm_crtc_load_palette_8() load an 8-bit
> palette into the hardware. If no palette has been specified,
> drm_crtc_fill_palette_8() load a system-specific default palette. This
> is currently only a grey-scale palette with increasing luminance, but
> later patches can change this. For PCs, a VGA default palette could
> be used.

Thanks for this work. I've one comment below regarding the 
drm_crtc_set_lut_func prototype.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/drm_color_mgmt.c | 206 +++++++++++++++++++++++++++++++
>   include/drm/drm_color_mgmt.h     |  27 ++++
>   2 files changed, 233 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
> index 3969dc548cff..dd3e06605180 100644
> --- a/drivers/gpu/drm/drm_color_mgmt.c
> +++ b/drivers/gpu/drm/drm_color_mgmt.c
> @@ -630,3 +630,209 @@ int drm_color_lut_check(const struct drm_property_blob *lut, u32 tests)
>   	return 0;
>   }
>   EXPORT_SYMBOL(drm_color_lut_check);
> +
> +/*
> + * Gamma-LUT programming
> + */
> +
> +/**
> + * drm_crtc_load_gamma_888 - Programs gamma ramp for RGB888-like formats
> + * @crtc: The displaying CRTC
> + * @lut: The gamma ramp to program
> + * @set_gamma: Callback for programming the hardware gamma LUT
> + *
> + * Programs the gamma ramp specified in @lut to hardware. The input gamma
> + * ramp must have 256 entries per color component.
> + */
> +void drm_crtc_load_gamma_888(struct drm_crtc *crtc, const struct drm_color_lut *lut,
> +			     drm_crtc_set_lut_func set_gamma)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < 256; ++i)
> +		set_gamma(crtc, i, lut[i].red, lut[i].green, lut[i].blue);
> +}
> +EXPORT_SYMBOL(drm_crtc_load_gamma_888);
> +
> +/**
> + * drm_crtc_load_gamma_565_from_888 - Programs gamma ramp for RGB565-like formats
> + * @crtc: The displaying CRTC
> + * @lut: The gamma ramp to program
> + * @set_gamma: Callback for programming the hardware gamma LUT
> + *
> + * Programs the gamma ramp specified in @lut to hardware. The input gamma
> + * ramp must have 256 entries per color component. The helper interpolates
> + * the individual color components to reduce the number of entries to 5/6/5.
> + */
> +void drm_crtc_load_gamma_565_from_888(struct drm_crtc *crtc, const struct drm_color_lut *lut,
> +				      drm_crtc_set_lut_func set_gamma)
> +{
> +	unsigned int i;
> +	u16 r, g, b;
> +
> +	for (i = 0; i < 32; ++i) {
> +		r = lut[i * 8 + i / 4].red;
> +		g = lut[i * 4 + i / 16].green;
> +		b = lut[i * 8 + i / 4].blue;
> +		set_gamma(crtc, i, r, g, b);
> +	}
> +	/* Green has one more bit, so add padding with 0 for red and blue. */
> +	for (i = 32; i < 64; ++i) {
> +		g = lut[i * 4 + i / 16].green;
> +		set_gamma(crtc, i, 0, g, 0);
> +	}
> +}
> +EXPORT_SYMBOL(drm_crtc_load_gamma_565_from_888);
> +
> +/**
> + * drm_crtc_load_gamma_555_from_888 - Programs gamma ramp for RGB555-like formats
> + * @crtc: The displaying CRTC
> + * @lut: The gamma ramp to program
> + * @set_gamma: Callback for programming the hardware gamma LUT
> + *
> + * Programs the gamma ramp specified in @lut to hardware. The input gamma
> + * ramp must have 256 entries per color component. The helper interpolates
> + * the individual color components to reduce the number of entries to 5/5/5.
> + */
> +void drm_crtc_load_gamma_555_from_888(struct drm_crtc *crtc, const struct drm_color_lut *lut,
> +				      drm_crtc_set_lut_func set_gamma)
> +{
> +	unsigned int i;
> +	u16 r, g, b;
> +
> +	for (i = 0; i < 32; ++i) {
> +		r = lut[i * 8 + i / 4].red;
> +		g = lut[i * 8 + i / 4].green;
> +		b = lut[i * 8 + i / 4].blue;
> +		set_gamma(crtc, i, r, g, b);
> +	}
> +}
> +EXPORT_SYMBOL(drm_crtc_load_gamma_555_from_888);
> +
> +static void fill_gamma_888(struct drm_crtc *crtc, unsigned int i, u16 r, u16 g, u16 b,
> +			   drm_crtc_set_lut_func set_gamma)
> +{
> +	r = (r << 8) | r;
> +	g = (g << 8) | g;
> +	b = (b << 8) | b;
> +
> +	set_gamma(crtc, i, r, g, b);
> +}
> +
> +/**
> + * drm_crtc_fill_gamma_888 - Programs a default gamma ramp for RGB888-like formats
> + * @crtc: The displaying CRTC
> + * @set_gamma: Callback for programming the hardware gamma LUT
> + *
> + * Programs a default gamma ramp to hardware.
> + */
> +void drm_crtc_fill_gamma_888(struct drm_crtc *crtc, drm_crtc_set_lut_func set_gamma)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < 256; ++i)
> +		fill_gamma_888(crtc, i, i, i, i, set_gamma);
> +}
> +EXPORT_SYMBOL(drm_crtc_fill_gamma_888);
> +
> +static void fill_gamma_565(struct drm_crtc *crtc, unsigned int i, u16 r, u16 g, u16 b,
> +			   drm_crtc_set_lut_func set_gamma)
> +{
> +	r = (r << 11) | (r << 6) | (r << 1) | (r >> 4);
> +	g = (g << 10) | (g << 4) | (g >> 2);
> +	b = (b << 11) | (b << 6) | (b << 1) | (b >> 4);
> +
> +	set_gamma(crtc, i, r, g, b);
> +}
> +
> +/**
> + * drm_crtc_fill_gamma_565 - Programs a default gamma ramp for RGB565-like formats
> + * @crtc: The displaying CRTC
> + * @set_gamma: Callback for programming the hardware gamma LUT
> + *
> + * Programs a default gamma ramp to hardware.
> + */
> +void drm_crtc_fill_gamma_565(struct drm_crtc *crtc, drm_crtc_set_lut_func set_gamma)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < 32; ++i)
> +		fill_gamma_565(crtc, i, i, i, i, set_gamma);
> +	/* Green has one more bit, so add padding with 0 for red and blue. */
> +	for (i = 32; i < 64; ++i)
> +		fill_gamma_565(crtc, i, 0, i, 0, set_gamma);
> +}
> +EXPORT_SYMBOL(drm_crtc_fill_gamma_565);
> +
> +static void fill_gamma_555(struct drm_crtc *crtc, unsigned int i, u16 r, u16 g, u16 b,
> +			   drm_crtc_set_lut_func set_gamma)
> +{
> +	r = (r << 11) | (r << 6) | (r << 1) | (r >> 4);
> +	g = (g << 11) | (g << 6) | (g << 1) | (g >> 4);
> +	b = (b << 11) | (b << 6) | (b << 1) | (r >> 4);
> +
> +	set_gamma(crtc, i, r, g, b);
> +}
> +
> +/**
> + * drm_crtc_fill_gamma_555 - Programs a default gamma ramp for RGB555-like formats
> + * @crtc: The displaying CRTC
> + * @set_gamma: Callback for programming the hardware gamma LUT
> + *
> + * Programs a default gamma ramp to hardware.
> + */
> +void drm_crtc_fill_gamma_555(struct drm_crtc *crtc, drm_crtc_set_lut_func set_gamma)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < 32; ++i)
> +		fill_gamma_555(crtc, i, i, i, i, set_gamma);
> +}
> +EXPORT_SYMBOL(drm_crtc_fill_gamma_555);
> +
> +/*
> + * Color-LUT programming
> + */
> +
> +/**
> + * drm_crtc_load_palette_8 - Programs palette for C8-like formats
> + * @crtc: The displaying CRTC
> + * @lut: The palette to program
> + * @set_palette: Callback for programming the hardware palette
> + *
> + * Programs the palette specified in @lut to hardware. The input palette
> + * must have 256 entries per color component.
> + */
> +void drm_crtc_load_palette_8(struct drm_crtc *crtc, const struct drm_color_lut *lut,
> +			     drm_crtc_set_lut_func set_palette)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < 256; ++i)
> +		set_palette(crtc, i, lut[i].red, lut[i].green, lut[i].blue);
> +}
> +EXPORT_SYMBOL(drm_crtc_load_palette_8);
> +
> +static void fill_palette_8(struct drm_crtc *crtc, unsigned int i,
> +			   drm_crtc_set_lut_func set_palette)
> +{
> +	u16 Y = (i << 8) | i; // relative luminance
> +
> +	set_palette(crtc, i, Y, Y, Y);
> +}
> +
> +/**
> + * drm_crtc_fill_palette_8 - Programs a default palette for C8-like formats
> + * @crtc: The displaying CRTC
> + * @set_palette: Callback for programming the hardware gamma LUT
> + *
> + * Programs a default palette to hardware.
> + */
> +void drm_crtc_fill_palette_8(struct drm_crtc *crtc, drm_crtc_set_lut_func set_palette)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < 256; ++i)
> +		fill_palette_8(crtc, i, set_palette);
> +}
> +EXPORT_SYMBOL(drm_crtc_fill_palette_8);
> diff --git a/include/drm/drm_color_mgmt.h b/include/drm/drm_color_mgmt.h
> index ed81741036d7..6cb577f6dba6 100644
> --- a/include/drm/drm_color_mgmt.h
> +++ b/include/drm/drm_color_mgmt.h
> @@ -118,4 +118,31 @@ enum drm_color_lut_tests {
>   };
>   
>   int drm_color_lut_check(const struct drm_property_blob *lut, u32 tests);
> +
> +/*
> + * Gamma-LUT programming
> + */
> +
> +typedef void (*drm_crtc_set_lut_func)(struct drm_crtc *, unsigned int, u16, u16, u16);

All drivers using this code, have 256 LUT size, and use 8bits value.
So I would prefer to have it declared like this:
typedef void (*drm_crtc_set_lut_func)(struct drm_crtc *, u8, u8, u8, u8);

This will avoid to upcast from u8 to u16, and then from u16 to u8 in 
each driver.

> +
> +void drm_crtc_load_gamma_888(struct drm_crtc *crtc, const struct drm_color_lut *lut,
> +			     drm_crtc_set_lut_func set_gamma);
> +void drm_crtc_load_gamma_565_from_888(struct drm_crtc *crtc, const struct drm_color_lut *lut,
> +				      drm_crtc_set_lut_func set_gamma);
> +void drm_crtc_load_gamma_555_from_888(struct drm_crtc *crtc, const struct drm_color_lut *lut,
> +				      drm_crtc_set_lut_func set_gamma);
> +
> +void drm_crtc_fill_gamma_888(struct drm_crtc *crtc, drm_crtc_set_lut_func set_gamma);
> +void drm_crtc_fill_gamma_565(struct drm_crtc *crtc, drm_crtc_set_lut_func set_gamma);
> +void drm_crtc_fill_gamma_555(struct drm_crtc *crtc, drm_crtc_set_lut_func set_gamma);
> +
> +/*
> + * Color-LUT programming
> + */
> +
> +void drm_crtc_load_palette_8(struct drm_crtc *crtc, const struct drm_color_lut *lut,
> +			     drm_crtc_set_lut_func set_palette);
> +
> +void drm_crtc_fill_palette_8(struct drm_crtc *crtc, drm_crtc_set_lut_func set_palette);
> +
>   #endif


Best regards,

-- 

Jocelyn

