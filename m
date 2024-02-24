Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92370862513
	for <lists+dri-devel@lfdr.de>; Sat, 24 Feb 2024 13:50:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85BD510E0A9;
	Sat, 24 Feb 2024 12:50:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=tuxon.dev header.i=@tuxon.dev header.b="DjJYanqy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4A7F10E0A9
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Feb 2024 12:50:15 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-565a3910f86so599801a12.3
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Feb 2024 04:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tuxon.dev; s=google; t=1708779014; x=1709383814; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VuTlLyUo4uFAvQcCBLpwHyaTW/5qupONRWcPbYCKFqk=;
 b=DjJYanqyAFoqBwQ9W/vR0C8i2pLzrx6nrn8gxDc1MmwuyvLjGPwife8xJ6jww5Zjv8
 uKszrvQuXHblL/f9eQ0V0KAeEpbMqi6A4jK8DW5ohcOamhaELqehRR5RYxkh/LfTGET+
 xrpWrYfQ+0myWfuasxIy9Fv+uO/5K1z+g7E4dtm0oZvXoLyv+DgIycJ5OkUdb6Xkw5bn
 ru+TU7PE6nh58EyA1dcLnaZ/FdeeG6Rdi1yfEXoQrPoZpnVHUmRJPY36Av8QVdX9tTjL
 zVfodMBke+qy/2lNvWehBfNMu0bOcwJgAZFO5OZfZLS58YZwq9q2maAZOvrr7plolGRf
 +CPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708779014; x=1709383814;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VuTlLyUo4uFAvQcCBLpwHyaTW/5qupONRWcPbYCKFqk=;
 b=n/GdrFN9hUwkn7Gm1ThyCduG7PAR+FkS1SQfbjJsCeTgf4qZ9DAzNHH6evxZ2baPxI
 eu712+FqgKGmVZey4xIG6P0dhmI8AMm8SGSS+mDJANJ1mMr9RZU4JR9abV4LQL9Vvsz5
 Ct5D+o3ht9yEcSPuJf/PK21xpc/GpfI5NlfvkYL03bv1sZczXNFvO/Eh8kZp76a85MvU
 zlF1S9kf3cnWYyb0mHwYEPrdT5iuSZQ73dlnY0IZLYVd5clkXK2/0dpXjPUZ+hj8lP7/
 7LYkc2bsKljdyHEcPoAb9QT4kV8S8Dq7IRNSO6fRsrTMxF2SVWLXlYj7HzHy3Osn3CoK
 Jrsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAMIG4Q6EMQunqixIkQiuyw1Ho3ppO3UQPaaHfwmwWxnkW+ZtJ3jo+b2pDRhnldWZitv//60IW3RIzHTSJVKKTTNkQoDjhfr0aXHnxB30V
X-Gm-Message-State: AOJu0Yz4jmRIGyI+6E6hkIUOe55aoHeBZ0tBruvIKoYqEJEuVod8gR26
 h3n320nxF6hu+qtUaICdMZGBkTNzsTeWqLE9LQFf2R5WrmpwFTCF4Q+TEU8LoZo=
X-Google-Smtp-Source: AGHT+IHu9FCcbF9x8feK3ItjD8KyIY7xg1PR/SM2IT2reSS+4T7JX5wS/RLW92YXM1Gsl8SwUf0kdA==
X-Received: by 2002:a05:6402:340d:b0:564:2655:f1b4 with SMTP id
 k13-20020a056402340d00b005642655f1b4mr1618675edc.32.1708779013863; 
 Sat, 24 Feb 2024 04:50:13 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.99])
 by smtp.gmail.com with ESMTPSA id
 x9-20020aa7d6c9000000b005646c7b9712sm507336edr.16.2024.02.24.04.50.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Feb 2024 04:50:13 -0800 (PST)
Message-ID: <c75bd63c-05f8-4b45-bd01-99e1240b921a@tuxon.dev>
Date: Sat, 24 Feb 2024 14:50:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 6/7] drm: atmel-hlcdc: add support for DSI output
 formats
Content-Language: en-US
To: Manikandan Muralidharan <manikandan.m@microchip.com>, sam@ravnborg.org,
 bbrezillon@kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, lee@kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Hari.PrasathGE@microchip.com, Balamanikandan.Gunasundar@microchip.com,
 Durai.ManickamKR@microchip.com, Nayabbasha.Sayed@microchip.com,
 Dharma.B@microchip.com, Varshini.Rajendran@microchip.com,
 Balakrishnan.S@microchip.com, Charan.Pedumuru@microchip.com
References: <20240221053531.12701-1-manikandan.m@microchip.com>
 <20240221053531.12701-7-manikandan.m@microchip.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20240221053531.12701-7-manikandan.m@microchip.com>
Content-Type: text/plain; charset=UTF-8
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



On 21.02.2024 07:35, Manikandan Muralidharan wrote:
> Add support for the following DPI mode if the encoder type
> is DSI as per the XLCDC IP datasheet:
> - 16BPPCFG1
> - 16BPPCFG2
> - 16BPPCFG3
> - 18BPPCFG1
> - 18BPPCFG2
> - 24BPP
> 
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> [durai.manickamkr@microchip.com: update output format using is_xlcdc flag]
> Signed-off-by: Durai Manickam KR <durai.manickamkr@microchip.com>
> ---
>  .../gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c    | 74 +++++++++++++++++--
>  1 file changed, 68 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
> index fdd3a6bc0f79..0dbe85686fc2 100644
> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
> @@ -301,11 +301,64 @@ static void atmel_hlcdc_crtc_atomic_enable(struct drm_crtc *c,
>  
>  }
>  
> -#define ATMEL_HLCDC_RGB444_OUTPUT	BIT(0)
> -#define ATMEL_HLCDC_RGB565_OUTPUT	BIT(1)
> -#define ATMEL_HLCDC_RGB666_OUTPUT	BIT(2)
> -#define ATMEL_HLCDC_RGB888_OUTPUT	BIT(3)
> -#define ATMEL_HLCDC_OUTPUT_MODE_MASK	GENMASK(3, 0)
> +#define ATMEL_HLCDC_RGB444_OUTPUT		BIT(0)
> +#define ATMEL_HLCDC_RGB565_OUTPUT		BIT(1)
> +#define ATMEL_HLCDC_RGB666_OUTPUT		BIT(2)
> +#define ATMEL_HLCDC_RGB888_OUTPUT		BIT(3)
> +#define ATMEL_HLCDC_DPI_RGB565C1_OUTPUT		BIT(4)
> +#define ATMEL_HLCDC_DPI_RGB565C2_OUTPUT		BIT(5)
> +#define ATMEL_HLCDC_DPI_RGB565C3_OUTPUT		BIT(6)
> +#define ATMEL_HLCDC_DPI_RGB666C1_OUTPUT		BIT(7)
> +#define ATMEL_HLCDC_DPI_RGB666C2_OUTPUT		BIT(8)
> +#define ATMEL_HLCDC_DPI_RGB888_OUTPUT		BIT(9)
> +#define ATMEL_HLCDC_OUTPUT_MODE_MASK		GENMASK(3, 0)
> +#define ATMEL_XLCDC_OUTPUT_MODE_MASK		GENMASK(9, 0)
> +
> +static int atmel_hlcdc_connector_output_dsi(struct drm_encoder *encoder,
> +					    struct drm_display_info *info)
> +{
> +	int j;
> +	unsigned int supported_fmts = 0;
> +
> +	switch (atmel_hlcdc_encoder_get_bus_fmt(encoder)) {
> +	case 0:
> +		break;
> +	case MEDIA_BUS_FMT_RGB565_1X16:
> +		return ATMEL_HLCDC_DPI_RGB565C1_OUTPUT;
> +	case MEDIA_BUS_FMT_RGB666_1X18:
> +		return ATMEL_HLCDC_DPI_RGB666C1_OUTPUT;
> +	case MEDIA_BUS_FMT_RGB666_1X24_CPADHI:
> +		return ATMEL_HLCDC_DPI_RGB666C2_OUTPUT;
> +	case MEDIA_BUS_FMT_RGB888_1X24:
> +		return ATMEL_HLCDC_DPI_RGB888_OUTPUT;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	for (j = 0; j < info->num_bus_formats; j++) {
> +		switch (info->bus_formats[j]) {
> +		case MEDIA_BUS_FMT_RGB565_1X16:
> +			supported_fmts |=
> +				ATMEL_HLCDC_DPI_RGB565C1_OUTPUT;

This can fit on the above line

> +			break;
> +		case MEDIA_BUS_FMT_RGB666_1X18:
> +			supported_fmts |=
> +				ATMEL_HLCDC_DPI_RGB666C1_OUTPUT;

Ditto

> +			break;
> +		case MEDIA_BUS_FMT_RGB666_1X24_CPADHI:
> +			supported_fmts |=
> +				ATMEL_HLCDC_DPI_RGB666C2_OUTPUT;

Ditto

> +			break;
> +		case MEDIA_BUS_FMT_RGB888_1X24:
> +			supported_fmts |=
> +				ATMEL_HLCDC_DPI_RGB888_OUTPUT;

Ditto

> +			break;
> +		default:
> +			break;
> +		}
> +	}
> +	return supported_fmts;
> +}
>  
>  static int atmel_hlcdc_connector_output_mode(struct drm_connector_state *state)
>  {
> @@ -318,6 +371,13 @@ static int atmel_hlcdc_connector_output_mode(struct drm_connector_state *state)
>  	encoder = state->best_encoder;
>  	if (!encoder)
>  		encoder = connector->encoder;
> +	/*
> +	 * atmel-hlcdc to support DSI formats with DSI video pipeline
> +	 * when DRM_MODE_ENCODER_DSI type is set by
> +	 * connector driver component.
> +	 */
> +	if (encoder->encoder_type == DRM_MODE_ENCODER_DSI)
> +		return atmel_hlcdc_connector_output_dsi(encoder, info);
>  
>  	switch (atmel_hlcdc_encoder_get_bus_fmt(encoder)) {
>  	case 0:
> @@ -358,7 +418,7 @@ static int atmel_hlcdc_connector_output_mode(struct drm_connector_state *state)
>  
>  static int atmel_hlcdc_crtc_select_output_mode(struct drm_crtc_state *state)
>  {
> -	unsigned int output_fmts = ATMEL_HLCDC_OUTPUT_MODE_MASK;
> +	unsigned int output_fmts;
>  	struct atmel_hlcdc_crtc_state *hstate;
>  	struct drm_connector_state *cstate;
>  	struct drm_connector *connector;
> @@ -366,6 +426,8 @@ static int atmel_hlcdc_crtc_select_output_mode(struct drm_crtc_state *state)
>  	int i;
>  
>  	crtc = drm_crtc_to_atmel_hlcdc_crtc(state->crtc);
> +	output_fmts = crtc->dc->desc->is_xlcdc ? ATMEL_XLCDC_OUTPUT_MODE_MASK :
> +		      ATMEL_HLCDC_OUTPUT_MODE_MASK;
>  
>  	for_each_new_connector_in_state(state->state, connector, cstate, i) {
>  		unsigned int supported_fmts = 0;
