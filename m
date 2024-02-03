Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CEC848664
	for <lists+dri-devel@lfdr.de>; Sat,  3 Feb 2024 14:00:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80E3B10F081;
	Sat,  3 Feb 2024 13:00:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=tuxon.dev header.i=@tuxon.dev header.b="b3+9kcHQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A769110E3FB
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Feb 2024 13:00:32 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-51025cafb51so4494133e87.2
 for <dri-devel@lists.freedesktop.org>; Sat, 03 Feb 2024 05:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tuxon.dev; s=google; t=1706965231; x=1707570031; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AVUyfz7WUW7XcdP5/LKYCmtcqOBYqv5sksk1vtX1nCA=;
 b=b3+9kcHQ2diF8/4Ap6eG9D5Igu6176NxxTHUF5lpB+pA1Z4SghCf4FhfzspZkQ5eG+
 Z0/+m/GdXTbkyS3GjraglCbSv2nDzu7It71D59f3+ChEjky/6+qPtzO77oUWgaqlGbFU
 JP+Ar9vbGzhX2Z3ds/I6pq0UNJfEZSeq7chrXJLv74LD+kzW+fH6MYwqWpjRyEAbtl6q
 zWTUJJOO4VBr7bvKn/DqPbusLnJ/Y2qmQ2nm4R2oNLEy1jN9bBEgJxbv+1SE9rGDG1aP
 5l4DJxxgGYiQVDo7Ecg916JFpwhetYj2NmhqJy6DUM2gpgEEIXKYVQ0jW9NAeKKnNrBw
 y+Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706965231; x=1707570031;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AVUyfz7WUW7XcdP5/LKYCmtcqOBYqv5sksk1vtX1nCA=;
 b=I1L36Qj67+iRWTCmqdWQcQ3IU1fAwItajlFWSJ2oMnQQatWDk8Al3liRTSzb4wsiMU
 Ma/XCTcpvCHiOL3GOoQsxFi7R8NaCZpfvUbkz4HC6BIzvz2SyWhdnZEVz6KyW4kUB7KG
 Qk1zHyzOF2JYL27rbAwfB5XnjbhF0bDpnIxGZ9YUh3lePyEXlktaQV87Ql2FywZZFlsw
 Oge//+pniRCPS0VxfByLJYOu5espQDz5aOAbmvwaoKVFtnBmnorN6PAvFqaCB9J2R67W
 EzTfAbD52sX66OjmXateRfc3a5Sl9Nzr05fpsNbXvZR3n0H8wljI3nptghqkaxQ911g4
 Gepw==
X-Gm-Message-State: AOJu0Yyxkx2DkRyGW1cdwCUdv1abf6+baVyMoLkojwC5QF+16PuMV1Tc
 LMmnrmAgd35WZliqS+Ud8wCMqMWrXOUKe151oft8XWufVmEEjOU31DEc8zvm8wI=
X-Google-Smtp-Source: AGHT+IEelo4Z3puO6Kda/3pUuLOa9r/xnRutr71fC2kSACe4n8LJMHYeywJebFaAOPWhv25RJtKK5g==
X-Received: by 2002:a19:6912:0:b0:50e:50ee:f378 with SMTP id
 e18-20020a196912000000b0050e50eef378mr2893908lfc.65.1706965230747; 
 Sat, 03 Feb 2024 05:00:30 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCVtpHdvk1nlX+i9KcvhNgNQxu+pGhsV71NQ595emyIcVEQB3VSZUMshj/VPH+SPlk6T7ciDFCr8eNthIP7HBiyBnqK+QXL3EhxZZR6egu5xOW1j4Cpczv9Dmoh38RlCETXLCAcSbnkYRyTabVYsijIWH2DkvdVszGKIdG1tZIxjYKFmmfwSH1Z2ZduZ6K1Q4SXkEFPWt9FzgztHTfFST79nm127m785g5Z6eTwydH537Gtpmnp6EWxFVkAjy9OZcmqPixBWqfxKiqV3l60SxqSQMX+n6rG2Fy1bHaRlYeovgpuRiNkhOQJTDd7DaXmOMx1DpuC7C4EPYk93wrm9yquZQVtEfBFGSFuUylo8OwVFJA/uCRecZQyYsLt1ch5RxgzIKfGbrzfLnuHHILSDi218ffhqXbWi++CxiwCJET8WFB1VIhFPkB6/OZuO/fVx9jWJxseCYFRHqP1aj5luShWcUCDnHq0oroRiE8sBMgukXSry5e7L9/Oj3XipYWnogTDQtBX3SveJbfWmZ+teNnce6+aRoKsifj0vAhivQYXbosx4QpO46IjKSVupJLWJxAhb/fz/xKQARFhLCmx6TzCGtQojMPn48mMQR50ZIBuydjpvpFX0kVCDMR5uw8qqAIyPf+ukhu8DLLJuD84a4D/QqEPAx8tP9HPwqH2W9gPX84WJTGL9cXM=
Received: from [192.168.50.4] ([82.78.167.154])
 by smtp.gmail.com with ESMTPSA id
 j20-20020a170906475400b00a353ca3d907sm1958807ejs.217.2024.02.03.05.00.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 03 Feb 2024 05:00:30 -0800 (PST)
Message-ID: <397c97ce-2912-42c1-823a-7ad151d73307@tuxon.dev>
Date: Sat, 3 Feb 2024 15:00:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v7 1/7] drm: atmel-hlcdc: add flag and driver ops
 to differentiate XLCDC and HLCDC IP
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
 <20240129092319.199365-2-manikandan.m@microchip.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20240129092319.199365-2-manikandan.m@microchip.com>
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

Hi, Manikandan,

On 29.01.2024 11:23, Manikandan Muralidharan wrote:
> Add is_xlcdc flag and LCD IP specific ops in driver data to differentiate
> XLCDC and HLCDC code within the atmel-hlcdc driver files.

I would first prepare the current code base for the addition of XLCDC by
first adding the struct atmel_lcdc_dc_ops, update current code to use it
and after that add XLCDC.

> 
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> ---
>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h | 37 ++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h
> index 5b5c774e0edf..d5e01ff8c7f9 100644
> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h
> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h
> @@ -177,6 +177,9 @@ struct atmel_hlcdc_layer_cfg_layout {
>  	int csc;
>  };
>  
> +struct atmel_hlcdc_plane_state;

You can move this forward declaration close the the structure that needs it
(struct atmel_lcdc_dc_ops).

> +struct atmel_hlcdc_dc;

And you can get rid if this one if you move struct atmel_lcdc_dc_ops after
struct atmel_hlcdc_dc definition.

> +
>  /**
>   * Atmel HLCDC DMA descriptor structure
>   *
> @@ -288,6 +291,36 @@ atmel_hlcdc_layer_to_plane(struct atmel_hlcdc_layer *layer)
>  	return container_of(layer, struct atmel_hlcdc_plane, layer);
>  }
>  
> +/**
> + * struct atmel_lcdc_dc_ops - describes atmel_lcdc ops group
> + * to differentiate HLCDC and XLCDC IP code support.
> + * @plane_setup_scaler: update the vertical and horizontal scaling factors
> + * @update_lcdc_buffers: update the each LCDC layers DMA registers.
> + * @lcdc_atomic_disable: disable LCDC interrupts and layers
> + * @lcdc_update_general_settings: update each LCDC layers general
> + * confiugration register.
s/confiugration/configuration

> + * @lcdc_atomic_update: enable the LCDC layers and interrupts.

You may want to keep consistency by adding or not '.' at the end of the
documentation statement (I consider '.' is useless)

> + * @lcdc_csc_init: update the color space conversion co-efficient of
> + * High-end overlay register.
> + * @lcdc_irq_dbg: to raise alert incase of interrupt overrun in any LCDC layer.

s/incase/in case

> + */
> +struct atmel_lcdc_dc_ops {
> +	void (*plane_setup_scaler)(struct atmel_hlcdc_plane *plane,
> +				   struct atmel_hlcdc_plane_state *state);
> +	void (*update_lcdc_buffers)(struct atmel_hlcdc_plane *plane,
> +				    struct atmel_hlcdc_plane_state *state,
> +				    u32 sr, int i);
> +	void (*lcdc_atomic_disable)(struct atmel_hlcdc_plane *plane);
> +	void (*lcdc_update_general_settings)(struct atmel_hlcdc_plane *plane,
> +					     struct atmel_hlcdc_plane_state *state);
> +	void (*lcdc_atomic_update)(struct atmel_hlcdc_plane *plane,
> +				   struct atmel_hlcdc_dc *dc);
> +	void (*lcdc_csc_init)(struct atmel_hlcdc_plane *plane,
> +			      const struct atmel_hlcdc_layer_desc *desc);
> +	void (*lcdc_irq_dbg)(struct atmel_hlcdc_plane *plane,
> +			     const struct atmel_hlcdc_layer_desc *desc);
> +};
> +
>  /**
>   * Atmel HLCDC Display Controller description structure.
>   *
> @@ -304,8 +337,10 @@ atmel_hlcdc_layer_to_plane(struct atmel_hlcdc_layer *layer)
>   * @conflicting_output_formats: true if RGBXXX output formats conflict with
>   *				each other.
>   * @fixed_clksrc: true if clock source is fixed
> + * @is_xlcdc: true if XLCDC IP is supported
>   * @layers: a layer description table describing available layers
>   * @nlayers: layer description table size
> + * @ops: atmel lcdc dc ops
>   */
>  struct atmel_hlcdc_dc_desc {
>  	int min_width;
> @@ -317,8 +352,10 @@ struct atmel_hlcdc_dc_desc {
>  	int max_hpw;
>  	bool conflicting_output_formats;
>  	bool fixed_clksrc;
> +	bool is_xlcdc;
>  	const struct atmel_hlcdc_layer_desc *layers;
>  	int nlayers;
> +	const struct atmel_lcdc_dc_ops *ops;
>  };
>  
>  /**
