Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D9F8CB510
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 23:08:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89E7B10F0E7;
	Tue, 21 May 2024 21:08:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UPQ4wp1i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56CAD10F0E7
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 21:08:04 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-52388d9ca98so8276093e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 14:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716325682; x=1716930482; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=lKzdnVo8xyLkqBoxHg4VI/rlSwMvqQ9IhIBfdqlNdKE=;
 b=UPQ4wp1iKvSMCCP2MtGWqlUWMq1AeBGppWmH0WYCR9mboTbcDkkA2O2ysLXduAt5qP
 G0CBHIxNdZWGLcGcunwZ1DeF/aW8PC4HpnN+b4qK/i08RPSpeJ3VTvmBF32pYfItnsgh
 b8Z/adQvKJY14lbI+BzzJgyG1WqQpTLmw/H+PQ2yXUjgSt5Ag9f4OY/P75VHXaFoFkUo
 +NF7Mj2+189qm5EnlNiWGwxaLC/nv7PLlWVNym2FuepgunkbLmxdBvVK1djI53pGfv0T
 JluraBA/Lf/pevWKrg8jeerYKxboB36+Vdy9hzz5LjdRHZlhoz6QpL04OjK1U3SYqNPq
 ILhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716325682; x=1716930482;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lKzdnVo8xyLkqBoxHg4VI/rlSwMvqQ9IhIBfdqlNdKE=;
 b=ISdgO757XvO6szzYd/ulfkuE6LXSe+xKitRfEiwG9FdLAJS+yF7eseFHZnLO7tUMIv
 rweI/vCotNVx359G0H21rMLaegcvKIpKAUPvQUJ/KGJHqRZh4r0KQZ+EP0gk1NNqfJ3Z
 pagrA6POQer4hopo1+rZUuwWWUkCi2dzpMZR0j4st434C98pZtaezp7RrEJMvDyoYrZe
 pcmd/+j/W2b70r2vvaBDdZ4/CBbIG28uMIhXZwVKygF2jlmBUbYAIxbGLG/oRJhS9MOw
 plrLF4ci3//Gi0Cd5t87TiB7p/u/RR0sWzlHKQC2ZGK7gUOO33PhqetpB9kWI/VA8Is4
 5G3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDk5w3A0XU5tTByBqymHy5evg7z5CIeGZKgpdx/HLMZRtnz5nNl8l8cQ+3R3qqycwhNzUD6f2AqCbhPfKwWhpxOL9d8TV2FOHs8BPmdeNd
X-Gm-Message-State: AOJu0YxtLDJSnpog8Xii80FqLpYOUGkKIRQdfmvAPsxdVqiD3Hpr8EQy
 LgAgpek0dh/s1CniVuh7E/HMFGv0ForPeJtfOBK5AIshz8pZipYNnS1nSvZblDI=
X-Google-Smtp-Source: AGHT+IEQMB9fSuo5GhA6Uya773c3FtzXnynu2FYH8CRrPDbEVoYXsTXJQY0WpUwbByG43Z5TSF8Dtw==
X-Received: by 2002:a19:761a:0:b0:519:e878:9385 with SMTP id
 2adb3069b0e04-5220fd7c7eemr25631406e87.18.1716325682296; 
 Tue, 21 May 2024 14:08:02 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f35ad584sm4797421e87.21.2024.05.21.14.08.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 May 2024 14:08:01 -0700 (PDT)
Date: Wed, 22 May 2024 00:08:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: keith <keith.zhao@starfivetech.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 daniel@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com, 
 xingyu.wu@starfivetech.com, p.zabel@pengutronix.de, jack.zhu@starfivetech.com, 
 shengyang.chen@starfivetech.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 07/10] drm/vs: add ctrc fun
Message-ID: <zevlkgeiezpi77uiiobmtzhaps7qkm7bur2kltlrqmbucrk4ad@af6lulqqllyj>
References: <20240521105817.3301-1-keith.zhao@starfivetech.com>
 <20240521105817.3301-8-keith.zhao@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521105817.3301-8-keith.zhao@starfivetech.com>
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

On Tue, May 21, 2024 at 06:58:14PM +0800, keith wrote:
> add crtc funs and helper funs
> 
> Signed-off-by: keith <keith.zhao@starfivetech.com>
> ---
>  drivers/gpu/drm/verisilicon/Makefile  |   3 +-
>  drivers/gpu/drm/verisilicon/vs_crtc.c | 241 ++++++++++++++++++++++++++
>  drivers/gpu/drm/verisilicon/vs_crtc.h |  17 ++
>  3 files changed, 260 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_crtc.c
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_crtc.h
> 
> diff --git a/drivers/gpu/drm/verisilicon/Makefile b/drivers/gpu/drm/verisilicon/Makefile
> index 1c593b943261..26a43ca0fd36 100644
> --- a/drivers/gpu/drm/verisilicon/Makefile
> +++ b/drivers/gpu/drm/verisilicon/Makefile
> @@ -2,6 +2,7 @@
>  
>  vs_drm-objs := vs_dc_hw.o \
>  		vs_modeset.o \
> -		vs_plane.o
> +		vs_plane.o \
> +		vs_crtc.o
>  
>  obj-$(CONFIG_DRM_VERISILICON_DC8200) += vs_drm.o
> diff --git a/drivers/gpu/drm/verisilicon/vs_crtc.c b/drivers/gpu/drm/verisilicon/vs_crtc.c
> new file mode 100644
> index 000000000000..ea7640a63c28
> --- /dev/null
> +++ b/drivers/gpu/drm/verisilicon/vs_crtc.c
> @@ -0,0 +1,241 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2023 VeriSilicon Holdings Co., Ltd.
> + *
> + */
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_crtc.h>
> +#include <drm/drm_gem_atomic_helper.h>
> +#include <drm/drm_vblank.h>
> +
> +#include "vs_crtc.h"
> +
> +static void vs_crtc_atomic_destroy_state(struct drm_crtc *crtc,
> +					 struct drm_crtc_state *state)
> +{
> +	__drm_atomic_helper_crtc_destroy_state(state);
> +	kfree(to_vs_crtc_state(state));
> +}
> +
> +static void vs_crtc_reset(struct drm_crtc *crtc)
> +{
> +	struct vs_crtc_state *state;
> +
> +	if (crtc->state)
> +		vs_crtc_atomic_destroy_state(crtc, crtc->state);
> +
> +	state = kzalloc(sizeof(*state), GFP_KERNEL);
> +	if (!state)
> +		return;
> +
> +	__drm_atomic_helper_crtc_reset(crtc, &state->base);
> +}
> +
> +static struct drm_crtc_state *
> +vs_crtc_atomic_duplicate_state(struct drm_crtc *crtc)
> +{
> +	struct vs_crtc_state *old_state;
> +	struct vs_crtc_state *state;
> +
> +	if (!crtc->state)
> +		return NULL;
> +
> +	old_state = to_vs_crtc_state(crtc->state);
> +
> +	state = kmemdup(old_state, sizeof(*old_state), GFP_KERNEL);
> +		if (!state)
> +			return NULL;
> +
> +	__drm_atomic_helper_crtc_duplicate_state(crtc, &state->base);
> +
> +	return &state->base;
> +}
> +
> +static int vs_crtc_enable_vblank(struct drm_crtc *crtc)
> +{
> +	struct vs_drm_device *priv = to_vs_drm_private(crtc->dev);
> +	struct vs_dc *dc = &priv->dc;
> +
> +	dc_hw_enable_interrupt(&dc->hw);
> +
> +	return 0;
> +}
> +
> +static void vs_crtc_disable_vblank(struct drm_crtc *crtc)
> +{
> +	struct vs_drm_device *priv = to_vs_drm_private(crtc->dev);
> +	struct vs_dc *dc = &priv->dc;
> +
> +	dc_hw_disable_interrupt(&dc->hw);
> +}
> +
> +static const struct drm_crtc_funcs vs_crtc_funcs = {
> +	.set_config		= drm_atomic_helper_set_config,
> +	.page_flip		= drm_atomic_helper_page_flip,
> +	.reset			= vs_crtc_reset,
> +	.atomic_duplicate_state = vs_crtc_atomic_duplicate_state,
> +	.atomic_destroy_state	= vs_crtc_atomic_destroy_state,
> +	.enable_vblank		= vs_crtc_enable_vblank,
> +	.disable_vblank		= vs_crtc_disable_vblank,
> +};
> +
> +static void vs_crtc_atomic_enable(struct drm_crtc *crtc,
> +				  struct drm_atomic_state *state)
> +{
> +	struct vs_drm_device *priv = to_vs_drm_private(crtc->dev);
> +	struct vs_dc *dc = &priv->dc;
> +
> +	struct vs_crtc_state *crtc_state = to_vs_crtc_state(crtc->state);
> +	struct drm_display_mode *mode = &crtc->state->adjusted_mode;
> +	int id;
> +
> +	id = to_vs_display_id(dc, crtc);
> +	if (crtc_state->encoder_type == DRM_MODE_ENCODER_DSI) {
> +		dc_hw_set_out(&dc->hw, OUT_DPI, id);
> +		clk_set_rate(priv->clks[7].clk, mode->clock * 1000);
> +		clk_set_parent(priv->clks[5].clk, priv->clks[7].clk);
> +	} else {
> +		dc_hw_set_out(&dc->hw, OUT_DP, id);
> +		clk_set_parent(priv->clks[4].clk, priv->clks[6].clk);
> +	}
> +
> +	dc_hw_enable(&dc->hw, id, mode, crtc_state->encoder_type, crtc_state->output_fmt);
> +
> +	enable_irq(priv->irq);
> +
> +	drm_crtc_vblank_on(crtc);
> +}
> +
> +static void vs_crtc_atomic_disable(struct drm_crtc *crtc,
> +				   struct drm_atomic_state *state)
> +{
> +	struct vs_drm_device *priv = to_vs_drm_private(crtc->dev);
> +	struct vs_dc *dc = &priv->dc;
> +	int id;
> +
> +	drm_crtc_vblank_off(crtc);
> +
> +	disable_irq(priv->irq);
> +
> +	id = to_vs_display_id(dc, crtc);
> +	dc_hw_disable(&dc->hw, id);
> +
> +	if (crtc->state->event && !crtc->state->active) {
> +		spin_lock_irq(&crtc->dev->event_lock);
> +		drm_crtc_send_vblank_event(crtc, crtc->state->event);
> +		crtc->state->event = NULL;
> +		spin_unlock_irq(&crtc->dev->event_lock);
> +	}
> +}
> +
> +static void vs_dc_set_gamma(struct vs_dc *dc, struct drm_crtc *crtc,
> +			    struct drm_color_lut *lut, unsigned int size)
> +{
> +	u16 i, r, g, b;
> +	u8 bits, id;
> +
> +	if (size != dc->hw.info->gamma_size) {
> +		drm_err(crtc->dev, "gamma size does not match!\n");
> +		return;
> +	}
> +
> +	id = to_vs_display_id(dc, crtc);
> +
> +	bits = dc->hw.info->gamma_bits;
> +	for (i = 0; i < size; i++) {
> +		r = drm_color_lut_extract(lut[i].red, bits);
> +		g = drm_color_lut_extract(lut[i].green, bits);
> +		b = drm_color_lut_extract(lut[i].blue, bits);
> +		dc_hw_update_gamma(&dc->hw, id, i, r, g, b);
> +
> +		if (i >= dc->hw.info->gamma_size)
> +			return;
> +
> +		dc->hw.gamma[id].gamma[i][0] = r;
> +		dc->hw.gamma[id].gamma[i][1] = g;
> +		dc->hw.gamma[id].gamma[i][2] = b;
> +	}
> +}
> +
> +static void vs_crtc_atomic_begin(struct drm_crtc *crtc,
> +				 struct drm_atomic_state *state)
> +{
> +	struct drm_crtc_state *new_state = drm_atomic_get_new_crtc_state(state,
> +									  crtc);
> +
> +	struct drm_property_blob *blob = new_state->gamma_lut;
> +	struct drm_color_lut *lut;
> +	struct vs_drm_device *priv = to_vs_drm_private(crtc->dev);
> +	struct vs_dc *dc = &priv->dc;
> +	u8 id;
> +
> +	id = to_vs_display_id(dc, crtc);
> +	if (new_state->color_mgmt_changed) {
> +		if (blob && blob->length) {
> +			lut = blob->data;
> +			vs_dc_set_gamma(dc, crtc, lut,
> +					blob->length / sizeof(*lut));
> +			dc_hw_enable_gamma(&dc->hw, id, true);
> +		} else {
> +			dc_hw_enable_gamma(&dc->hw, id, false);
> +		}
> +	}
> +}
> +
> +static void vs_crtc_atomic_flush(struct drm_crtc *crtc,
> +				 struct drm_atomic_state *state)
> +{
> +	struct drm_pending_vblank_event *event = crtc->state->event;
> +	struct vs_drm_device *priv = to_vs_drm_private(crtc->dev);
> +	struct vs_dc *dc = &priv->dc;
> +
> +	dc_hw_enable_shadow_register(dc, false);
> +
> +	if (event) {
> +		WARN_ON(drm_crtc_vblank_get(crtc) != 0);
> +
> +		spin_lock_irq(&crtc->dev->event_lock);
> +		drm_crtc_arm_vblank_event(crtc, event);
> +		crtc->state->event = NULL;
> +		spin_unlock_irq(&crtc->dev->event_lock);
> +	}
> +
> +	dc_hw_enable_shadow_register(dc, true);
> +}
> +
> +static const struct drm_crtc_helper_funcs vs_crtc_helper_funcs = {
> +	.atomic_check = drm_crtc_helper_atomic_check,
> +	.atomic_enable	= vs_crtc_atomic_enable,
> +	.atomic_disable = vs_crtc_atomic_disable,
> +	.atomic_begin	= vs_crtc_atomic_begin,
> +	.atomic_flush	= vs_crtc_atomic_flush,
> +};
> +
> +struct vs_crtc *vs_crtc_create(struct drm_device *drm_dev,
> +			       struct vs_dc_info *info)
> +{
> +	struct vs_crtc *crtc;
> +	int ret;
> +
> +	if (!info)
> +		return NULL;
> +
> +	crtc = drmm_crtc_alloc_with_planes(drm_dev, struct vs_crtc, base, NULL,
> +					   NULL, &vs_crtc_funcs,
> +					   info->name ? info->name : NULL);
> +
> +	drm_crtc_helper_add(&crtc->base, &vs_crtc_helper_funcs);
> +
> +	if (info->gamma_size) {
> +		ret = drm_mode_crtc_set_gamma_size(&crtc->base,
> +						   info->gamma_size);
> +		if (ret)
> +			return NULL;
> +
> +		drm_crtc_enable_color_mgmt(&crtc->base, 0, false,
> +					   info->gamma_size);
> +	}
> +
> +	return crtc;
> +}
> diff --git a/drivers/gpu/drm/verisilicon/vs_crtc.h b/drivers/gpu/drm/verisilicon/vs_crtc.h
> new file mode 100644
> index 000000000000..b1e588bb780d
> --- /dev/null
> +++ b/drivers/gpu/drm/verisilicon/vs_crtc.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2023 VeriSilicon Holdings Co., Ltd.
> + */
> +
> +#ifndef __VS_CRTC_H__
> +#define __VS_CRTC_H__
> +
> +#include <drm/drm_crtc.h>
> +#include <drm/drm_crtc_helper.h>

Do you really need to include them here?

> +
> +#include "vs_drv.h"
> +
> +struct vs_crtc *vs_crtc_create(struct drm_device *drm_dev,
> +			       struct vs_dc_info *info);
> +
> +#endif /* __VS_CRTC_H__ */
> -- 
> 2.27.0
> 

-- 
With best wishes
Dmitry
