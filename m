Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C51CC848665
	for <lists+dri-devel@lfdr.de>; Sat,  3 Feb 2024 14:00:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9AA510E3FB;
	Sat,  3 Feb 2024 13:00:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=tuxon.dev header.i=@tuxon.dev header.b="g2s9vOl8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0872A10E3FB
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Feb 2024 13:00:39 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-a354fc17f24so373655766b.0
 for <dri-devel@lists.freedesktop.org>; Sat, 03 Feb 2024 05:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tuxon.dev; s=google; t=1706965237; x=1707570037; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/knouVfmu2O6HKWIkN4QLW0HPNxmrcNHEzX5pnbWez0=;
 b=g2s9vOl8fhBX4yjVUI9KQB4Q9geQj2MjxE0sRrn6FzNCe23BEHttAa48uvU89pGZGn
 aUqOAwxnttYOxouXrjhDZLzr5rz37c/ZWSmvXHxYGsre2orEwsTzzzKGJjfmZa6sIbUr
 yGuWhrHepd/nkEnGadZHXJ6UWmZPaGCPU9kZv9rGui6eHVO8QSc0C7cUGNpCuUKq4/Wq
 1iHE8z8Dc68ZyMAiQICTjkliCdx67CNwllmcm7xPv1eWF7yaYkh0b+eS7yO/ggjqdusE
 PyLhSR4DvbfkVq4Boq8BQplDI9cE6n6bIOUyC9vqcdZwzMHsRgFsSH+tDi/5OVk4bd1G
 sf2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706965237; x=1707570037;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/knouVfmu2O6HKWIkN4QLW0HPNxmrcNHEzX5pnbWez0=;
 b=FCvIi264zVezUkmlbshBhNz18NFySmnthb9QCfCOU8d+Vl/q8LsUjTeUt/XyipsB6W
 1Z0p/BJ6Vu7dIj3TipiCIRuKj1dYfWaMvKXshamAyeok+X9TQ6e1JTXIJ2oXPDP5wLNl
 dThtqWRwb6ywB6p/ax7IOJk3WTowJP8S0YGkvILgfhLfe9P2sb0WQVlDkZ5g0ARJtTot
 7zr3IXwo6mupwMabNfrKqJe5CVAGq43g5R5A8xNt16+IKnHIMooqBH5mg+7Pic8eoG9u
 asKdzGvWay9S029P+UaqvAVxhTYgdfLmEzLC04mgHpLz5ZRxEadF2YHd43HDnUL6mWBo
 nxrA==
X-Gm-Message-State: AOJu0YzKFu3u4co9SxNH9d+yr1kCuxgdsw8e/BX8p+yFXLPBPrVXHt3O
 HE5gE3bNmUZcw/jdRmLwe/7N28jOn4qS2XIlPBz8Cowb2FGiaQJTYY/eg8xfFPw=
X-Google-Smtp-Source: AGHT+IGcqzSYhDb0vBtztqAQum5kNZ6be4LcMVRFNOgC7L1qc3DpRQIhwo4gWJZM0mZXHqYrIfVm4A==
X-Received: by 2002:a17:907:7746:b0:a36:f811:44f5 with SMTP id
 kx6-20020a170907774600b00a36f81144f5mr3169564ejc.47.1706965237199; 
 Sat, 03 Feb 2024 05:00:37 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCX4mfY1aeG51v6exRdlFHfaH4DKgOjFMUPYuFvbwhTZ96TA9Nt1ozweHFZzFQypMezx2e7PDLei2Aqi6hHhPqHMDJYJEZb4r2MSeI62aFoEsF12Mcfc87HlTUXvqAzCHufQbfAgO7u4oKMwf2iVD21SuyE3Gdrggsp0UtcFlOvw/WYFsK7HA1YrxCMMMKysSmpIKFfvYHqQ17nvBoHM0gIHjZYPgEQXj92aNUF1JITTnxgsZtKPbsopHH4Pb2UKnrznLO3V31Ybp04cNwFvccMPsV0dXheal1QStWlBB+jlfFVNFEqEYpKKNtO4dj2X7hQ4IQ4LwbkeK4WMNLNotnKV8WfqEm8vUUv1pIZ5ja12763L+6fAvQCLGgX9+54TT16InSNJV8xJ0sRaXn7liTYmI9wKbtzfgC5NqAgXJve04xw2S2V/AqJXU+q1W6TustbU8Q9UcXe91ZgHGRWQfH1q0i2GCxYyXqBEUWyvJu7CTNo+OcIg4nRwUeBOwXONKgnXKrza/cvBNQPzmYaTmvtOoBquOzN4km2pxbbMOorC5ogOkxmi8iKvlJRcbrxmRfBkyT/KfZ3Lx5gKGZFTmccmFR1sOp4iut1rbJfK46ej/tSKSC8GvZfOkFGOPKNfj7dY21Ts0GhwsddiNwCZSEZNW2+twpfkNs0PehTMMciD3RQ2NhX3cQQ=
Received: from [192.168.50.4] ([82.78.167.154])
 by smtp.gmail.com with ESMTPSA id
 j20-20020a170906475400b00a353ca3d907sm1958807ejs.217.2024.02.03.05.00.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 03 Feb 2024 05:00:36 -0800 (PST)
Message-ID: <a6e3f9b7-2ff4-4c07-ad4c-675a7e1a0ae1@tuxon.dev>
Date: Sat, 3 Feb 2024 15:00:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v7 2/7] drm: atmel-hlcdc: add LCD controller layer
 definition for sam9x75
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
 <20240129092319.199365-3-manikandan.m@microchip.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20240129092319.199365-3-manikandan.m@microchip.com>
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
> Add the LCD controller layer definition and descriptor structure for
> sam9x75 for the following layers:
> - Base Layer
> - Overlay1 Layer
> - Overlay2 Layer
> - High End Overlay
> 
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> ---
>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c | 97 ++++++++++++++++++++
>  1 file changed, 97 insertions(+)
> 
> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
> index fa0f9a93d50d..d30aec174aa2 100644
> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
> @@ -462,6 +462,99 @@ static const struct atmel_hlcdc_dc_desc atmel_hlcdc_dc_sam9x60 = {
>  	.layers = atmel_hlcdc_sam9x60_layers,
>  };
>  
> +static const struct atmel_hlcdc_layer_desc atmel_xlcdc_sam9x75_layers[] = {
> +	{
> +		.name = "base",
> +		.formats = &atmel_hlcdc_plane_rgb_formats,
> +		.regs_offset = 0x60,
> +		.id = 0,
> +		.type = ATMEL_HLCDC_BASE_LAYER,
> +		.cfgs_offset = 0x1c,
> +		.layout = {
> +			.xstride = { 2 },
> +			.default_color = 3,
> +			.general_config = 4,
> +			.disc_pos = 5,
> +			.disc_size = 6,
> +		},
> +		.clut_offset = 0x700,
> +	},
> +	{
> +		.name = "overlay1",
> +		.formats = &atmel_hlcdc_plane_rgb_formats,
> +		.regs_offset = 0x160,
> +		.id = 1,
> +		.type = ATMEL_HLCDC_OVERLAY_LAYER,
> +		.cfgs_offset = 0x1c,
> +		.layout = {
> +			.pos = 2,
> +			.size = 3,
> +			.xstride = { 4 },
> +			.pstride = { 5 },
> +			.default_color = 6,
> +			.chroma_key = 7,
> +			.chroma_key_mask = 8,
> +			.general_config = 9,
> +		},
> +		.clut_offset = 0xb00,
> +	},
> +	{
> +		.name = "overlay2",
> +		.formats = &atmel_hlcdc_plane_rgb_formats,
> +		.regs_offset = 0x260,
> +		.id = 2,
> +		.type = ATMEL_HLCDC_OVERLAY_LAYER,
> +		.cfgs_offset = 0x1c,
> +		.layout = {
> +			.pos = 2,
> +			.size = 3,
> +			.xstride = { 4 },
> +			.pstride = { 5 },
> +			.default_color = 6,
> +			.chroma_key = 7,
> +			.chroma_key_mask = 8,
> +			.general_config = 9,
> +		},
> +		.clut_offset = 0xf00,
> +	},
> +	{
> +		.name = "high-end-overlay",
> +		.formats = &atmel_hlcdc_plane_rgb_and_yuv_formats,
> +		.regs_offset = 0x360,
> +		.id = 3,
> +		.type = ATMEL_HLCDC_OVERLAY_LAYER,
> +		.cfgs_offset = 0x30,
> +		.layout = {
> +			.pos = 2,
> +			.size = 3,
> +			.memsize = 4,
> +			.xstride = { 5, 7 },
> +			.pstride = { 6, 8 },
> +			.default_color = 9,
> +			.chroma_key = 10,
> +			.chroma_key_mask = 11,
> +			.general_config = 12,
> +			.csc = 16,
> +			.scaler_config = 23,
> +		},
> +		.clut_offset = 0x1300,
> +	},
> +};
> +
> +static const struct atmel_hlcdc_dc_desc atmel_xlcdc_dc_sam9x75 = {
> +	.min_width = 0,
> +	.min_height = 0,
> +	.max_width = 2048,
> +	.max_height = 2048,
> +	.max_spw = 0xff,
> +	.max_vpw = 0xff,
> +	.max_hpw = 0x3ff,
> +	.fixed_clksrc = true,
> +	.is_xlcdc = true,
> +	.nlayers = ARRAY_SIZE(atmel_xlcdc_sam9x75_layers),
> +	.layers = atmel_xlcdc_sam9x75_layers,
> +};
> +
>  static const struct of_device_id atmel_hlcdc_of_match[] = {
>  	{
>  		.compatible = "atmel,at91sam9n12-hlcdc",
> @@ -487,6 +580,10 @@ static const struct of_device_id atmel_hlcdc_of_match[] = {
>  		.compatible = "microchip,sam9x60-hlcdc",
>  		.data = &atmel_hlcdc_dc_sam9x60,
>  	},
> +	{
> +		.compatible = "microchip,sam9x75-xlcdc",
> +		.data = &atmel_xlcdc_dc_sam9x75,

Will SAM9X75 XLCDC work only with this patch and the previous one? If not
then, organize the patches such that the SAM9X75 will work when introduced.

> +	},
>  	{ /* sentinel */ },
>  };
>  MODULE_DEVICE_TABLE(of, atmel_hlcdc_of_match);
