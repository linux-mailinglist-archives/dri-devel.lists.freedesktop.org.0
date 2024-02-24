Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 309A5862511
	for <lists+dri-devel@lfdr.de>; Sat, 24 Feb 2024 13:50:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F095910E07A;
	Sat, 24 Feb 2024 12:50:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=tuxon.dev header.i=@tuxon.dev header.b="Jp2LnRwA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 623FA10E165
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Feb 2024 12:50:08 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2d21cdbc85bso26615661fa.2
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Feb 2024 04:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tuxon.dev; s=google; t=1708779006; x=1709383806; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UWLUrudTsXeZL8OKt2PXQQa2J020DEfi8R8MNsXyq1I=;
 b=Jp2LnRwAAlmp4St2ThzKUVxGsJT8y7wxmWQEL3yYp98oNtqR+yYzweNf1iRA6DI7sq
 4gYtwKttvXDUth7bGp47S1AVz60MWOh69i5OXwdgdpQfjBTD8D0wgpcrV86NkBwPiOlU
 VUqrVBYDAcOFZ8vkQHFVixHkYvgsaRJStijS4bG2YKiOUZLtIa7fJ61ukq4OPoCSrPkJ
 D3y5vqJY3jK51GjjIgFktrUN5ScIlKqxx2WuhwbNBNrYL97KUJjl3Zoxnc9l48s4Z7DP
 +S9SbjPlZU6csMkG8SMNYO07+ljndUhCqeEipEuRe72dV+9Tzn2s1wV+MVW3vm9oIoqF
 F6NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708779006; x=1709383806;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UWLUrudTsXeZL8OKt2PXQQa2J020DEfi8R8MNsXyq1I=;
 b=RJh79Tt6FhkjV61TCZAcd4wdzXomg1BDzOCuxx3o6QBz7JAKIQcLbInNPINivie21y
 7TCnYzEjuhWPaEsjXdGguBSJpijcZxkIj8PRga/9ihjfnQXfMhYt0HrUWiw+gQYZDgvu
 EjNLYuAzgdWfKL/VYPot2Ely3d7mTz6W3uNcuAT+jEJPLlK/1Qp0le9rmBFo+k+wI1Sk
 UpgcHwYMuqFv48qTmJemGOOmJg2LUmK8FOFrWopeuDl9cihhpPGOVSZVZudoBIqKi+md
 pV+jd3gILoPF48AGyAAB07bkAePwzm6CgeW2jD9Hys25syHGzjE1JRAL7mSLFtDCIF7D
 a6lg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEWEmyVegQ+bziVmseGU9X7pnG/5OOynTJytt6HFxl+dg59Bur9M/4+zYzzPc+kGQ38118P1uoszTuZtTaKl6KKqe5dYxHZU0dF98xoJYg
X-Gm-Message-State: AOJu0YzKXAVy8kasVXDQQ3KiKHMHWWB+dLoaxSZ3VuY/tbzyEXrEu5c3
 fFvzaqvv/v0DojgQeE5e2YuO6Oy2SoleMDnElm500B+Y7HNVe5n1MbLxe3Ud0Yg=
X-Google-Smtp-Source: AGHT+IFbNct5gYeK0/5IJ7hvFd1YMtt5tLyp0kRZFqhsDsyFUmTMvUY9sbUro+8mNbym6OYsR62oOw==
X-Received: by 2002:a05:651c:d4:b0:2d2:4487:a3df with SMTP id
 20-20020a05651c00d400b002d24487a3dfmr1072284ljr.27.1708779005522; 
 Sat, 24 Feb 2024 04:50:05 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.99])
 by smtp.gmail.com with ESMTPSA id
 x9-20020aa7d6c9000000b005646c7b9712sm507336edr.16.2024.02.24.04.50.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Feb 2024 04:50:05 -0800 (PST)
Message-ID: <0d794962-3403-41b5-b2fb-570d2882ac8a@tuxon.dev>
Date: Sat, 24 Feb 2024 14:50:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/7] drm: atmel-hlcdc: add driver ops to differentiate
 HLCDC and XLCDC IP
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
 <20240221053531.12701-2-manikandan.m@microchip.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20240221053531.12701-2-manikandan.m@microchip.com>
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
> Add LCD IP specific ops in driver data to differentiate
> HLCDC and XLCDC code within the atmel-hlcdc driver files.
> XLCDC in SAM9X7 has different sets of registers and additional
> configuration bits when compared to previous HLCDC IP. Read/write
> operation on the controller register and functionality is now
> separated using the LCD IP specific ops.
> 
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> ---
>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c  |   5 +
>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h  |  84 ++++++---
>  .../gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c   | 167 +++++++++++-------
>  3 files changed, 173 insertions(+), 83 deletions(-)
> 
> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
> index 84c54e8622d1..b09df821cbc0 100644
> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
> @@ -58,6 +58,7 @@ static const struct atmel_hlcdc_dc_desc atmel_hlcdc_dc_at91sam9n12 = {
>  	.conflicting_output_formats = true,
>  	.nlayers = ARRAY_SIZE(atmel_hlcdc_at91sam9n12_layers),
>  	.layers = atmel_hlcdc_at91sam9n12_layers,
> +	.ops = &atmel_hlcdc_ops,
>  };
>  
>  static const struct atmel_hlcdc_layer_desc atmel_hlcdc_at91sam9x5_layers[] = {
> @@ -151,6 +152,7 @@ static const struct atmel_hlcdc_dc_desc atmel_hlcdc_dc_at91sam9x5 = {
>  	.conflicting_output_formats = true,
>  	.nlayers = ARRAY_SIZE(atmel_hlcdc_at91sam9x5_layers),
>  	.layers = atmel_hlcdc_at91sam9x5_layers,
> +	.ops = &atmel_hlcdc_ops,
>  };
>  
>  static const struct atmel_hlcdc_layer_desc atmel_hlcdc_sama5d3_layers[] = {
> @@ -269,6 +271,7 @@ static const struct atmel_hlcdc_dc_desc atmel_hlcdc_dc_sama5d3 = {
>  	.conflicting_output_formats = true,
>  	.nlayers = ARRAY_SIZE(atmel_hlcdc_sama5d3_layers),
>  	.layers = atmel_hlcdc_sama5d3_layers,
> +	.ops = &atmel_hlcdc_ops,
>  };
>  
>  static const struct atmel_hlcdc_layer_desc atmel_hlcdc_sama5d4_layers[] = {
> @@ -364,6 +367,7 @@ static const struct atmel_hlcdc_dc_desc atmel_hlcdc_dc_sama5d4 = {
>  	.max_hpw = 0x3ff,
>  	.nlayers = ARRAY_SIZE(atmel_hlcdc_sama5d4_layers),
>  	.layers = atmel_hlcdc_sama5d4_layers,
> +	.ops = &atmel_hlcdc_ops,
>  };
>  
>  static const struct atmel_hlcdc_layer_desc atmel_hlcdc_sam9x60_layers[] = {
> @@ -460,6 +464,7 @@ static const struct atmel_hlcdc_dc_desc atmel_hlcdc_dc_sam9x60 = {
>  	.fixed_clksrc = true,
>  	.nlayers = ARRAY_SIZE(atmel_hlcdc_sam9x60_layers),
>  	.layers = atmel_hlcdc_sam9x60_layers,
> +	.ops = &atmel_hlcdc_ops,
>  };
>  
>  static const struct of_device_id atmel_hlcdc_of_match[] = {
> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h
> index 5b5c774e0edf..ad732edfef0b 100644
> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h
> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h
> @@ -288,6 +288,64 @@ atmel_hlcdc_layer_to_plane(struct atmel_hlcdc_layer *layer)
>  	return container_of(layer, struct atmel_hlcdc_plane, layer);
>  }
>  
> +/**
> + * Atmel HLCDC Display Controller.

This doens't comply w/ recommendation at
https://docs.kernel.org/doc-guide/kernel-doc.html#structure-union-and-enumeration-documentation

> + *
> + * @desc: HLCDC Display Controller description
> + * @dscrpool: DMA coherent pool used to allocate DMA descriptors
> + * @hlcdc: pointer to the atmel_hlcdc structure provided by the MFD device
> + * @fbdev: framebuffer device attached to the Display Controller
> + * @crtc: CRTC provided by the display controller
> + * @planes: instantiated planes
> + * @layers: active HLCDC layers
> + * @suspend: used to store the HLCDC state when entering suspend

Check this for nested struct documentation:
https://docs.kernel.org/doc-guide/kernel-doc.html#nested-structs-unions

> + */
> +struct atmel_hlcdc_dc {
> +	const struct atmel_hlcdc_dc_desc *desc;
> +	struct dma_pool *dscrpool;
> +	struct atmel_hlcdc *hlcdc;
> +	struct drm_crtc *crtc;
> +	struct atmel_hlcdc_layer *layers[ATMEL_HLCDC_MAX_LAYERS];
> +	struct {
> +		u32 imr;
> +		struct drm_atomic_state *state;
> +	} suspend;
> +};
> +
> +struct atmel_hlcdc_plane_state;
> +
> +/**
> + * struct atmel_lcdc_dc_ops - describes atmel_lcdc ops group
> + * to differentiate HLCDC and XLCDC IP code support
> + * @plane_setup_scaler: update the vertical and horizontal scaling factors
> + * @update_lcdc_buffers: update the each LCDC layers DMA registers
> + * @lcdc_atomic_disable: disable LCDC interrupts and layers
> + * @lcdc_update_general_settings: update each LCDC layers general
> + * confiugration register

s/confiugration/configuration

> + * @lcdc_atomic_update: enable the LCDC layers and interrupts
> + * @lcdc_csc_init: update the color space conversion co-efficient of
> + * High-end overlay register
> + * @lcdc_irq_dbg: to raise alert incase of interrupt overrun in any LCDC layer
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
> +extern const struct atmel_lcdc_dc_ops atmel_hlcdc_ops;
> +
>  /**
>   * Atmel HLCDC Display Controller description structure.
>   *
> @@ -306,6 +364,7 @@ atmel_hlcdc_layer_to_plane(struct atmel_hlcdc_layer *layer)
>   * @fixed_clksrc: true if clock source is fixed
>   * @layers: a layer description table describing available layers
>   * @nlayers: layer description table size
> + * @ops: atmel lcdc dc ops
>   */
>  struct atmel_hlcdc_dc_desc {
>  	int min_width;
> @@ -319,30 +378,7 @@ struct atmel_hlcdc_dc_desc {
>  	bool fixed_clksrc;
>  	const struct atmel_hlcdc_layer_desc *layers;
>  	int nlayers;
> -};
> -
> -/**
> - * Atmel HLCDC Display Controller.
> - *
> - * @desc: HLCDC Display Controller description
> - * @dscrpool: DMA coherent pool used to allocate DMA descriptors
> - * @hlcdc: pointer to the atmel_hlcdc structure provided by the MFD device
> - * @fbdev: framebuffer device attached to the Display Controller
> - * @crtc: CRTC provided by the display controller
> - * @planes: instantiated planes
> - * @layers: active HLCDC layers
> - * @suspend: used to store the HLCDC state when entering suspend
> - */
> -struct atmel_hlcdc_dc {
> -	const struct atmel_hlcdc_dc_desc *desc;
> -	struct dma_pool *dscrpool;
> -	struct atmel_hlcdc *hlcdc;
> -	struct drm_crtc *crtc;
> -	struct atmel_hlcdc_layer *layers[ATMEL_HLCDC_MAX_LAYERS];
> -	struct {
> -		u32 imr;
> -		struct drm_atomic_state *state;
> -	} suspend;
> +	const struct atmel_lcdc_dc_ops *ops;
>  };
>  
>  extern struct atmel_hlcdc_formats atmel_hlcdc_plane_rgb_formats;
> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
> index daa508504f47..3427546cd58c 100644
> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
> @@ -282,8 +282,9 @@ atmel_hlcdc_plane_scaler_set_phicoeff(struct atmel_hlcdc_plane *plane,
>  					    coeff_tab[i]);
>  }
>  
> -static void atmel_hlcdc_plane_setup_scaler(struct atmel_hlcdc_plane *plane,
> -					   struct atmel_hlcdc_plane_state *state)
> +static
> +void atmel_hlcdc_plane_setup_scaler(struct atmel_hlcdc_plane *plane,
> +				    struct atmel_hlcdc_plane_state *state)
>  {
>  	const struct atmel_hlcdc_layer_desc *desc = plane->layer.desc;
>  	u32 xfactor, yfactor;
> @@ -335,6 +336,7 @@ atmel_hlcdc_plane_update_pos_and_size(struct atmel_hlcdc_plane *plane,
>  				      struct atmel_hlcdc_plane_state *state)
>  {
>  	const struct atmel_hlcdc_layer_desc *desc = plane->layer.desc;
> +	struct atmel_hlcdc_dc *dc = plane->base.dev->dev_private;
>  
>  	if (desc->layout.size)
>  		atmel_hlcdc_layer_write_cfg(&plane->layer, desc->layout.size,
> @@ -352,12 +354,12 @@ atmel_hlcdc_plane_update_pos_and_size(struct atmel_hlcdc_plane *plane,
>  					ATMEL_HLCDC_LAYER_POS(state->crtc_x,
>  							      state->crtc_y));
>  
> -	atmel_hlcdc_plane_setup_scaler(plane, state);
> +	dc->desc->ops->plane_setup_scaler(plane, state);
>  }
>  
> -static void
> -atmel_hlcdc_plane_update_general_settings(struct atmel_hlcdc_plane *plane,
> -					struct atmel_hlcdc_plane_state *state)
> +static
> +void atmel_hlcdc_plane_update_general_settings(struct atmel_hlcdc_plane *plane,
> +					       struct atmel_hlcdc_plane_state *state)
>  {
>  	unsigned int cfg = ATMEL_HLCDC_LAYER_DMA_BLEN_INCR16 | state->ahb_id;
>  	const struct atmel_hlcdc_layer_desc *desc = plane->layer.desc;
> @@ -437,10 +439,33 @@ static void atmel_hlcdc_plane_update_clut(struct atmel_hlcdc_plane *plane,
>  	}
>  }
>  
> +static void update_hlcdc_buffers(struct atmel_hlcdc_plane *plane,

would be good to keep in in the atmel_hlcdc/atmel namespace thus, rename it
something like:

*atmel_hlcdc*_update_buffers()

to avoid conflicting with any subsystem specific APIs, if any. And also
keep consistency with the rest of the HLCDC driver code.

> +				 struct atmel_hlcdc_plane_state *state,
> +				 u32 sr, int i)
> +{
> +	atmel_hlcdc_layer_write_reg(&plane->layer,
> +				    ATMEL_HLCDC_LAYER_PLANE_HEAD(i),
> +				    state->dscrs[i]->self);
> +
> +	if (sr & ATMEL_HLCDC_LAYER_EN)
> +		return;
> +
> +	atmel_hlcdc_layer_write_reg(&plane->layer,
> +				    ATMEL_HLCDC_LAYER_PLANE_ADDR(i),
> +				    state->dscrs[i]->addr);
> +	atmel_hlcdc_layer_write_reg(&plane->layer,
> +				    ATMEL_HLCDC_LAYER_PLANE_CTRL(i),
> +				    state->dscrs[i]->ctrl);
> +	atmel_hlcdc_layer_write_reg(&plane->layer,
> +				    ATMEL_HLCDC_LAYER_PLANE_NEXT(i),
> +				    state->dscrs[i]->self);
> +}
> +
>  static void atmel_hlcdc_plane_update_buffers(struct atmel_hlcdc_plane *plane,
> -					struct atmel_hlcdc_plane_state *state)
> +					     struct atmel_hlcdc_plane_state *state)
>  {
>  	const struct atmel_hlcdc_layer_desc *desc = plane->layer.desc;
> +	struct atmel_hlcdc_dc *dc = plane->base.dev->dev_private;
>  	struct drm_framebuffer *fb = state->base.fb;
>  	u32 sr;
>  	int i;
> @@ -452,21 +477,7 @@ static void atmel_hlcdc_plane_update_buffers(struct atmel_hlcdc_plane *plane,
>  
>  		state->dscrs[i]->addr = gem->dma_addr + state->offsets[i];
>  
> -		atmel_hlcdc_layer_write_reg(&plane->layer,
> -					    ATMEL_HLCDC_LAYER_PLANE_HEAD(i),
> -					    state->dscrs[i]->self);
> -
> -		if (!(sr & ATMEL_HLCDC_LAYER_EN)) {
> -			atmel_hlcdc_layer_write_reg(&plane->layer,
> -					ATMEL_HLCDC_LAYER_PLANE_ADDR(i),
> -					state->dscrs[i]->addr);
> -			atmel_hlcdc_layer_write_reg(&plane->layer,
> -					ATMEL_HLCDC_LAYER_PLANE_CTRL(i),
> -					state->dscrs[i]->ctrl);
> -			atmel_hlcdc_layer_write_reg(&plane->layer,
> -					ATMEL_HLCDC_LAYER_PLANE_NEXT(i),
> -					state->dscrs[i]->self);
> -		}
> +		dc->desc->ops->update_lcdc_buffers(plane, state, sr, i);
>  
>  		if (desc->layout.xstride[i])
>  			atmel_hlcdc_layer_write_cfg(&plane->layer,
> @@ -712,11 +723,8 @@ static int atmel_hlcdc_plane_atomic_check(struct drm_plane *p,
>  	return 0;
>  }
>  
> -static void atmel_hlcdc_plane_atomic_disable(struct drm_plane *p,
> -					     struct drm_atomic_state *state)
> +static void hlcdc_atomic_disable(struct atmel_hlcdc_plane *plane)

Same here, e.g., *atmel_hlcdc*_atomic_disable()

>  {
> -	struct atmel_hlcdc_plane *plane = drm_plane_to_atmel_hlcdc_plane(p);
> -
>  	/* Disable interrupts */
>  	atmel_hlcdc_layer_write_reg(&plane->layer, ATMEL_HLCDC_LAYER_IDR,
>  				    0xffffffff);
> @@ -731,6 +739,34 @@ static void atmel_hlcdc_plane_atomic_disable(struct drm_plane *p,
>  	atmel_hlcdc_layer_read_reg(&plane->layer, ATMEL_HLCDC_LAYER_ISR);
>  }
>  
> +static void atmel_hlcdc_plane_atomic_disable(struct drm_plane *p,
> +					     struct drm_atomic_state *state)
> +{
> +	struct atmel_hlcdc_plane *plane = drm_plane_to_atmel_hlcdc_plane(p);
> +	struct atmel_hlcdc_dc *dc = plane->base.dev->dev_private;
> +
> +	dc->desc->ops->lcdc_atomic_disable(plane);
> +}
> +
> +static void hlcdc_atomic_update(struct atmel_hlcdc_plane *plane,
> +				struct atmel_hlcdc_dc *dc)

Same here, e.g., *atmel_hlcdc*_hlcdc_atomic_update()

> +{
> +	u32 sr;
> +
> +	/* Enable the overrun interrupts. */
> +	atmel_hlcdc_layer_write_reg(&plane->layer, ATMEL_HLCDC_LAYER_IER,
> +				    ATMEL_HLCDC_LAYER_OVR_IRQ(0) |
> +				    ATMEL_HLCDC_LAYER_OVR_IRQ(1) |
> +				    ATMEL_HLCDC_LAYER_OVR_IRQ(2));
> +
> +	/* Apply the new config at the next SOF event. */
> +	sr = atmel_hlcdc_layer_read_reg(&plane->layer, ATMEL_HLCDC_LAYER_CHSR);
> +	atmel_hlcdc_layer_write_reg(&plane->layer, ATMEL_HLCDC_LAYER_CHER,
> +				    ATMEL_HLCDC_LAYER_UPDATE |
> +				    (sr & ATMEL_HLCDC_LAYER_EN ?
> +				    ATMEL_HLCDC_LAYER_A2Q : ATMEL_HLCDC_LAYER_EN));
> +}
> +
>  static void atmel_hlcdc_plane_atomic_update(struct drm_plane *p,
>  					    struct drm_atomic_state *state)
>  {
> @@ -739,7 +775,7 @@ static void atmel_hlcdc_plane_atomic_update(struct drm_plane *p,
>  	struct atmel_hlcdc_plane *plane = drm_plane_to_atmel_hlcdc_plane(p);
>  	struct atmel_hlcdc_plane_state *hstate =
>  			drm_plane_state_to_atmel_hlcdc_plane_state(new_s);
> -	u32 sr;
> +	struct atmel_hlcdc_dc *dc = p->dev->dev_private;
>  
>  	if (!new_s->crtc || !new_s->fb)
>  		return;
> @@ -750,29 +786,39 @@ static void atmel_hlcdc_plane_atomic_update(struct drm_plane *p,
>  	}
>  
>  	atmel_hlcdc_plane_update_pos_and_size(plane, hstate);
> -	atmel_hlcdc_plane_update_general_settings(plane, hstate);
> +	dc->desc->ops->lcdc_update_general_settings(plane, hstate);
>  	atmel_hlcdc_plane_update_format(plane, hstate);
>  	atmel_hlcdc_plane_update_clut(plane, hstate);
>  	atmel_hlcdc_plane_update_buffers(plane, hstate);
>  	atmel_hlcdc_plane_update_disc_area(plane, hstate);
>  
> -	/* Enable the overrun interrupts. */
> -	atmel_hlcdc_layer_write_reg(&plane->layer, ATMEL_HLCDC_LAYER_IER,
> -				    ATMEL_HLCDC_LAYER_OVR_IRQ(0) |
> -				    ATMEL_HLCDC_LAYER_OVR_IRQ(1) |
> -				    ATMEL_HLCDC_LAYER_OVR_IRQ(2));
> +	dc->desc->ops->lcdc_atomic_update(plane, dc);
> +}
>  
> -	/* Apply the new config at the next SOF event. */
> -	sr = atmel_hlcdc_layer_read_reg(&plane->layer, ATMEL_HLCDC_LAYER_CHSR);
> -	atmel_hlcdc_layer_write_reg(&plane->layer, ATMEL_HLCDC_LAYER_CHER,
> -			ATMEL_HLCDC_LAYER_UPDATE |
> -			(sr & ATMEL_HLCDC_LAYER_EN ?
> -			 ATMEL_HLCDC_LAYER_A2Q : ATMEL_HLCDC_LAYER_EN));
> +static void hlcdc_csc_init(struct atmel_hlcdc_plane *plane,
> +			   const struct atmel_hlcdc_layer_desc *desc)

Same here.

> +{
> +	/*
> +	 * TODO: declare a "yuv-to-rgb-conv-factors" property to let
> +	 * userspace modify these factors (using a BLOB property ?).
> +	 */
> +	static const u32 hlcdc_csc_coeffs[] = {
> +		0x4c900091,
> +		0x7a5f5090,
> +		0x40040890
> +	};
> +
> +	for (int i = 0; i < ARRAY_SIZE(hlcdc_csc_coeffs); i++) {
> +		atmel_hlcdc_layer_write_cfg(&plane->layer,
> +					    desc->layout.csc + i,
> +					    hlcdc_csc_coeffs[i]);
> +	}
>  }
>  
>  static int atmel_hlcdc_plane_init_properties(struct atmel_hlcdc_plane *plane)
>  {
>  	const struct atmel_hlcdc_layer_desc *desc = plane->layer.desc;
> +	struct atmel_hlcdc_dc *dc = plane->base.dev->dev_private;
>  
>  	if (desc->type == ATMEL_HLCDC_OVERLAY_LAYER ||
>  	    desc->type == ATMEL_HLCDC_CURSOR_LAYER) {
> @@ -796,31 +842,16 @@ static int atmel_hlcdc_plane_init_properties(struct atmel_hlcdc_plane *plane)
>  			return ret;
>  	}
>  
> -	if (desc->layout.csc) {
> -		/*
> -		 * TODO: decare a "yuv-to-rgb-conv-factors" property to let
> -		 * userspace modify these factors (using a BLOB property ?).
> -		 */
> -		atmel_hlcdc_layer_write_cfg(&plane->layer,
> -					    desc->layout.csc,
> -					    0x4c900091);
> -		atmel_hlcdc_layer_write_cfg(&plane->layer,
> -					    desc->layout.csc + 1,
> -					    0x7a5f5090);
> -		atmel_hlcdc_layer_write_cfg(&plane->layer,
> -					    desc->layout.csc + 2,
> -					    0x40040890);
> -	}
> +	if (desc->layout.csc)
> +		dc->desc->ops->lcdc_csc_init(plane, desc);
>  
>  	return 0;
>  }
>  
> -void atmel_hlcdc_plane_irq(struct atmel_hlcdc_plane *plane)
> +static void hlcdc_irq_dbg(struct atmel_hlcdc_plane *plane,
> +			  const struct atmel_hlcdc_layer_desc *desc)

same here.

>  {
> -	const struct atmel_hlcdc_layer_desc *desc = plane->layer.desc;
> -	u32 isr;
> -
> -	isr = atmel_hlcdc_layer_read_reg(&plane->layer, ATMEL_HLCDC_LAYER_ISR);
> +	u32 isr = atmel_hlcdc_layer_read_reg(&plane->layer, ATMEL_HLCDC_LAYER_ISR);
>  
>  	/*
>  	 * There's not much we can do in case of overrun except informing
> @@ -834,6 +865,24 @@ void atmel_hlcdc_plane_irq(struct atmel_hlcdc_plane *plane)
>  			desc->name);
>  }
>  
> +void atmel_hlcdc_plane_irq(struct atmel_hlcdc_plane *plane)
> +{
> +	const struct atmel_hlcdc_layer_desc *desc = plane->layer.desc;
> +	struct atmel_hlcdc_dc *dc = plane->base.dev->dev_private;
> +
> +	dc->desc->ops->lcdc_irq_dbg(plane, desc);
> +}
> +
> +const struct atmel_lcdc_dc_ops atmel_hlcdc_ops = {
> +	.plane_setup_scaler = atmel_hlcdc_plane_setup_scaler,
> +	.update_lcdc_buffers = update_hlcdc_buffers,
> +	.lcdc_atomic_disable = hlcdc_atomic_disable,
> +	.lcdc_update_general_settings = atmel_hlcdc_plane_update_general_settings,
> +	.lcdc_atomic_update = hlcdc_atomic_update,
> +	.lcdc_csc_init = hlcdc_csc_init,
> +	.lcdc_irq_dbg = hlcdc_irq_dbg,
> +};
> +
>  static const struct drm_plane_helper_funcs atmel_hlcdc_layer_plane_helper_funcs = {
>  	.atomic_check = atmel_hlcdc_plane_atomic_check,
>  	.atomic_update = atmel_hlcdc_plane_atomic_update,
