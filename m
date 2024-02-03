Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 995FB848669
	for <lists+dri-devel@lfdr.de>; Sat,  3 Feb 2024 14:01:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D740510F237;
	Sat,  3 Feb 2024 13:01:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=tuxon.dev header.i=@tuxon.dev header.b="itSnB3TL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCAFD10F237
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Feb 2024 13:01:01 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-a36597a3104so401117166b.2
 for <dri-devel@lists.freedesktop.org>; Sat, 03 Feb 2024 05:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tuxon.dev; s=google; t=1706965260; x=1707570060; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gXXLhm+7PbWIgSfLKf0icn4+qsgOPzaBP/drVsTMN0k=;
 b=itSnB3TLRTr4Jma6I131SYXp2+GaB+5v4/nwL5m49W74p6S2pbW8N1cV1gNtHmTBl8
 pGBe7gM0lH2OyiNgMksMHPAqIV/EBCNhPxPNoTgCuA5krWKh1/p8Sm5awgVF+7jG74mD
 iyRJ0qOCxoG9vSWkIvbu5YyLwjBa47RCbxhAv0zTiBc66DxgTKC8ZpopQBnBjUhULSN1
 /PYzd3S28Y7P/EGB+XihC3W96lc+de8i+4s7Cvj7mJ+7iWzu4mDdjDJgPxuMrPMv1uZJ
 XHyeTKwAo8t2ot4zVAdAC/OSlVxP/FVs2wClv7WyWKojR4QbY43FMpE0rgQ8/dx5L6AH
 /ghQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706965260; x=1707570060;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gXXLhm+7PbWIgSfLKf0icn4+qsgOPzaBP/drVsTMN0k=;
 b=F5U8R8NkMpzs4V5w7JDaA83M33jtgnTTazsUkeWRh+eikeW70ZYc60L4rp+b8X4hHf
 1SpXB8pm4naPUlOYcqBDOAu9pD6xC2iqvemlUg9LrOU19HiCM8f9wHQXjfsk53SD7oQ/
 aD5FzB253Rv6TZMW0Q4UFwlhVE7j8z0uOnbKYB2G8tRYuVfvzJLkuZ40hh9HhsVTnMvO
 i4/zDMbs4j9kPggTgtCMEhQUsDnC2LbBOodFtpwwKUYa0WCB6flt8BjC7bY1IGxFT2py
 qvXFxNZ9ps9Pn0Dv7csGJw4ttf0L4Pa91LT4vtR4VzDXH0nZEQW0VPSuRLM010kjXFiz
 KfOA==
X-Gm-Message-State: AOJu0YzJ74p3pmtzg0RnP0pwwRNwncR2FsojcrSTgffVsATP/gmFIl4a
 uC7II4zkd41h9TVYbgDKKMW13/reL/zCZ1d+kgjl+IzzRFQM9y91EdOXKS+JjYQ=
X-Google-Smtp-Source: AGHT+IHGv+M6iG4sCXmqfFYzPiVgB9HE0HXDRy0iQ1U6z8YbHB5KAFcEahxCiKkjzWAduKFodubbJQ==
X-Received: by 2002:a17:906:185:b0:a36:1c9e:9169 with SMTP id
 5-20020a170906018500b00a361c9e9169mr3539702ejb.2.1706965260183; 
 Sat, 03 Feb 2024 05:01:00 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCX4Btk0cHulKHMkWDV+2Ft479Xlu0uv+dg/qyPdW+gZQlaCKx5szLMVFDi+EahFza9LvPpYQnnauDTlzOREreFkEKEYRJ8d6A1fzcbFvb69bJHZt9oKOdayLRXnNFOyM5BObUhhGFnty3qzn8EMQYby7Jv+YBA7XEn9YklDSwhOswtQmRJcyqHLmsmPbah4iijaC6OZ2CYHZz1o3HpTWRwJiW3yJ15OuXXXVlhX64Kup+5NlahZN8LyNA6IviieU4N7UTJtqyLDKTSmtWoNDiUeMb8FwR/KoZ0q1hl41iJS31utwxs6pfg7Ie4RXgNWBPL2E1iRy45xDxaYsjHsgIaJNchvF6aAY/08/J8KD4uFUxk11Jps+IULDFBuQH6Ph5Nq/bp6L3UAnv8ryo7a84rSxzLMUbgvJWBkJbq5ZTDXoN7I7Gf+clx9JwuMDX/RU/rzwwsKzsE6oZ3UTE5D4M7J11mnmRyR1tca+hmdDeo3A9xy6hA4hWBRPHiTUPSwCPGfNJUvkONdxyCl3rvBDzuXQ7PgYOk57kawOPG5Ho4XQUnlYykCy1D59ySvgKT55PCkvmOxiYXnfoqbfeai4Yaany8BSw9r5Q0WopRP2zrLgx9FWL0xxRk3Xipy6S2q9OcYUCbi3Tpc+evPmlEWeLA9f092wq6yk9nMPfKFKIv3+7mZsuC0oQ4=
Received: from [192.168.50.4] ([82.78.167.154])
 by smtp.gmail.com with ESMTPSA id
 j20-20020a170906475400b00a353ca3d907sm1958807ejs.217.2024.02.03.05.00.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 03 Feb 2024 05:00:59 -0800 (PST)
Message-ID: <d78559db-65c4-4a1b-9921-4c0217b5e2f7@tuxon.dev>
Date: Sat, 3 Feb 2024 15:00:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v7 7/7] drm: atmel-hlcdc: add support for DSI
 output formats
Content-Language: en-US
To: Manikandan Muralidharan <manikandan.m@microchip.com>, sam@ravnborg.org,
 bbrezillon@kernel.org, airlied@gmail.com, daniel@ffwll.ch,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, lee@kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Hari.PrasathGE@microchip.com, Balamanikandan.Gunasundar@microchip.com,
 Durai.ManickamKR@microchip.com, Nayabbasha.Sayed@microchip.com,
 Dharma.B@microchip.com, Varshini.Rajendran@microchip.com,
 Balakrishnan.S@microchip.com
References: <20240129092319.199365-1-manikandan.m@microchip.com>
 <20240129092319.199365-8-manikandan.m@microchip.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20240129092319.199365-8-manikandan.m@microchip.com>
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



On 29.01.2024 11:23, Manikandan Muralidharan wrote:
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
>  .../gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c    | 123 +++++++++++++-----
>  1 file changed, 88 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
> index 1899be2eb6a3..6f529769b036 100644
> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
> @@ -295,11 +295,18 @@ static void atmel_hlcdc_crtc_atomic_enable(struct drm_crtc *c,
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
>  
>  static int atmel_hlcdc_connector_output_mode(struct drm_connector_state *state)
>  {
> @@ -313,53 +320,99 @@ static int atmel_hlcdc_connector_output_mode(struct drm_connector_state *state)
>  	if (!encoder)
>  		encoder = connector->encoder;
>  
> -	switch (atmel_hlcdc_encoder_get_bus_fmt(encoder)) {
> -	case 0:
> -		break;
> -	case MEDIA_BUS_FMT_RGB444_1X12:
> -		return ATMEL_HLCDC_RGB444_OUTPUT;
> -	case MEDIA_BUS_FMT_RGB565_1X16:
> -		return ATMEL_HLCDC_RGB565_OUTPUT;
> -	case MEDIA_BUS_FMT_RGB666_1X18:
> -		return ATMEL_HLCDC_RGB666_OUTPUT;
> -	case MEDIA_BUS_FMT_RGB888_1X24:
> -		return ATMEL_HLCDC_RGB888_OUTPUT;
> -	default:
> -		return -EINVAL;
> -	}
> -
> -	for (j = 0; j < info->num_bus_formats; j++) {
> -		switch (info->bus_formats[j]) {
> -		case MEDIA_BUS_FMT_RGB444_1X12:
> -			supported_fmts |= ATMEL_HLCDC_RGB444_OUTPUT;

To generate less diff here and have a cleaner code you can move all this
DSI specific code in a different function and have here something like:

	if (encoder->encoder_type == DRM_MODE_ENCODER_DSI)
		return atmel_hlcdc_connector_output_dsi();

> +	if (encoder->encoder_type == DRM_MODE_ENCODER_DSI) {
> +		/*
> +		 * atmel-hlcdc to support DSI formats with DSI video pipeline
> +		 * when DRM_MODE_ENCODER_DSI type is set by
> +		 * connector driver component.
> +		 */
> +		switch (atmel_hlcdc_encoder_get_bus_fmt(encoder)) {
> +		case 0:
>  			break;
>  		case MEDIA_BUS_FMT_RGB565_1X16:
> -			supported_fmts |= ATMEL_HLCDC_RGB565_OUTPUT;
> -			break;
> +			return ATMEL_HLCDC_DPI_RGB565C1_OUTPUT;
>  		case MEDIA_BUS_FMT_RGB666_1X18:
> -			supported_fmts |= ATMEL_HLCDC_RGB666_OUTPUT;
> -			break;
> +			return ATMEL_HLCDC_DPI_RGB666C1_OUTPUT;
> +		case MEDIA_BUS_FMT_RGB666_1X24_CPADHI:
> +			return ATMEL_HLCDC_DPI_RGB666C2_OUTPUT;
>  		case MEDIA_BUS_FMT_RGB888_1X24:
> -			supported_fmts |= ATMEL_HLCDC_RGB888_OUTPUT;
> -			break;
> +			return ATMEL_HLCDC_DPI_RGB888_OUTPUT;
>  		default:
> +			return -EINVAL;
> +		}
> +
> +		for (j = 0; j < info->num_bus_formats; j++) {
> +			switch (info->bus_formats[j]) {
> +			case MEDIA_BUS_FMT_RGB565_1X16:
> +				supported_fmts |=
> +					ATMEL_HLCDC_DPI_RGB565C1_OUTPUT;
> +				break;
> +			case MEDIA_BUS_FMT_RGB666_1X18:
> +				supported_fmts |=
> +					ATMEL_HLCDC_DPI_RGB666C1_OUTPUT;
> +				break;
> +			case MEDIA_BUS_FMT_RGB666_1X24_CPADHI:
> +				supported_fmts |=
> +					ATMEL_HLCDC_DPI_RGB666C2_OUTPUT;
> +				break;
> +			case MEDIA_BUS_FMT_RGB888_1X24:
> +				supported_fmts |=
> +					ATMEL_HLCDC_DPI_RGB888_OUTPUT;
> +				break;
> +			default:
> +				break;
> +			}
> +		}
> +	} else {
> +		switch (atmel_hlcdc_encoder_get_bus_fmt(encoder)) {
> +		case 0:
>  			break;
> +		case MEDIA_BUS_FMT_RGB444_1X12:
> +			return ATMEL_HLCDC_RGB444_OUTPUT;
> +		case MEDIA_BUS_FMT_RGB565_1X16:
> +			return ATMEL_HLCDC_RGB565_OUTPUT;
> +		case MEDIA_BUS_FMT_RGB666_1X18:
> +			return ATMEL_HLCDC_RGB666_OUTPUT;
> +		case MEDIA_BUS_FMT_RGB888_1X24:
> +			return ATMEL_HLCDC_RGB888_OUTPUT;
> +		default:
> +			return -EINVAL;
>  		}
> -	}
>  
> +		for (j = 0; j < info->num_bus_formats; j++) {
> +			switch (info->bus_formats[j]) {
> +			case MEDIA_BUS_FMT_RGB444_1X12:
> +				supported_fmts |= ATMEL_HLCDC_RGB444_OUTPUT;
> +				break;
> +			case MEDIA_BUS_FMT_RGB565_1X16:
> +				supported_fmts |= ATMEL_HLCDC_RGB565_OUTPUT;
> +				break;
> +			case MEDIA_BUS_FMT_RGB666_1X18:
> +				supported_fmts |= ATMEL_HLCDC_RGB666_OUTPUT;
> +				break;
> +			case MEDIA_BUS_FMT_RGB888_1X24:
> +				supported_fmts |= ATMEL_HLCDC_RGB888_OUTPUT;
> +				break;
> +			default:
> +				break;
> +			}
> +		}
> +	}
>  	return supported_fmts;
>  }
>  
>  static int atmel_hlcdc_crtc_select_output_mode(struct drm_crtc_state *state)
>  {
> -	unsigned int output_fmts = ATMEL_HLCDC_OUTPUT_MODE_MASK;
> +	unsigned int output_fmts;
>  	struct atmel_hlcdc_crtc_state *hstate;
>  	struct drm_connector_state *cstate;
>  	struct drm_connector *connector;
> -	struct atmel_hlcdc_crtc *crtc;
> +	struct atmel_hlcdc_crtc *crtc = drm_crtc_to_atmel_hlcdc_crtc(state->crtc);

Previous code uses reverse christmass tree order for variable, thus, try to
keep it the same.

>  	int i;
> +	bool is_xlcdc = crtc->dc->desc->is_xlcdc;
>  
> -	crtc = drm_crtc_to_atmel_hlcdc_crtc(state->crtc);
> +	output_fmts = is_xlcdc ? ATMEL_XLCDC_OUTPUT_MODE_MASK :
> +		      ATMEL_HLCDC_OUTPUT_MODE_MASK;
>  
>  	for_each_new_connector_in_state(state->state, connector, cstate, i) {
>  		unsigned int supported_fmts = 0;
> @@ -380,7 +433,7 @@ static int atmel_hlcdc_crtc_select_output_mode(struct drm_crtc_state *state)
>  
>  	hstate = drm_crtc_state_to_atmel_hlcdc_crtc_state(state);
>  	hstate->output_mode = fls(output_fmts) - 1;
> -	if (crtc->dc->desc->is_xlcdc) {
> +	if (is_xlcdc) {
>  		/* check if MIPI DPI bit needs to be set */
>  		if (fls(output_fmts) > 3) {
>  			hstate->output_mode -= 4;
