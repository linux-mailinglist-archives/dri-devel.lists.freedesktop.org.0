Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCAF8CB50C
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 23:06:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F36BC10F0E6;
	Tue, 21 May 2024 21:06:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="TmsNTR85";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C6C510F0E6
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 21:06:11 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2e716e302bdso37744971fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 14:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716325569; x=1716930369; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=qPK03jlReQclNNAvffiFj78SrRlM/+sI3gzh9csucJ8=;
 b=TmsNTR85aDR1Au8lpbok9p+YqbBu/JYfykm7/hP86fHrV9b1HZcPhv+A3NQfHaUX26
 Vl0YeiPIJ1y92mgBCrCqc0DY1+6wQHT4366UFV/0p7BRQUheyW4Z7nAsva+foX6oCV+i
 oXP04UQ3qKpfBcAUb9JI//II85uhoVPhZhKe9LGbDg6ppNJgZbQNrEK+I44/x+FBYqaV
 /dGU7NLyNyaZqBxdHNfzca1FVa3XiZAdVuIcQB0/oCWaH7uMvewwIQX2TG0tRyZvbPWV
 ZPDWE2DlHaloghnPv/xsm89tkJjU8CMGges/K12kZBiicgz+bwRPcPrkJjSknmlnxSpM
 VGnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716325569; x=1716930369;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qPK03jlReQclNNAvffiFj78SrRlM/+sI3gzh9csucJ8=;
 b=W0af7E7cDuzEXrEMuK8qHepcohSnMp2hHaRnRVNbL0jNlrhSl1dbL4gL1ib/zlM37o
 cI2b0OTItAsc81aTUjME50ykODtA/nPInZH/ph8CfozmMhgTl3W7aLGBxISjM0DMKSvO
 UKC3pvNn4oJ2uLGrAOwCnq6pgBH7MPOZ9gulMxJMd6keS0Bz6JWEpzLyyVRixldQsIFD
 M4gM6TolojyjLXAndgYbg1AaUk4BlQL6Sx8Ix7Iog0Sz4SeBVsm4jtF7hU4naZ9MvSEW
 +GPXud4E7P4mdBazftNFxuZX5neaqQPedfEa50Y/CmuIyZ70bd7dqFTm7JN3GSJHcdMO
 GgOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbJgUSV+cGVoeO36QLat8IfrpViQ+GTbhAx8gnYWiWwbk+dQjn6BDC/8+Yc5pjm30vF8c1lg9noFvaEFqjtbMmq3M83F7VW27dlIdaDB5X
X-Gm-Message-State: AOJu0YzuaSEEfmDK23QM5D9IPTFY8sg3cLkyaA3DnhiOOBo397YgDZ7Q
 73rdGiE/XmW+tl25al7+aQM5n9gMQp22QlbqqWRFllIAQVaOXIziwx0H18UlCAA=
X-Google-Smtp-Source: AGHT+IGnVvWtJTGTU/HGT0c7ccNkcGTMRmrWrH0PEAiB5kZyvY5kPxMlL76swEnzZwZVBc5d2+ur2A==
X-Received: by 2002:a2e:809:0:b0:2e1:ec20:9ae5 with SMTP id
 38308e7fff4ca-2e6abda266bmr155696521fa.31.1716325569179; 
 Tue, 21 May 2024 14:06:09 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2e4d0ef09ffsm37909631fa.59.2024.05.21.14.06.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 May 2024 14:06:08 -0700 (PDT)
Date: Wed, 22 May 2024 00:06:07 +0300
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
Subject: Re: [PATCH v4 06/10] drm/vs: add vs plane api
Message-ID: <gcwvgco3ixpwaalnaq5qzwcp3sq44dgphps7vlqm6zdozu6ci2@vfq4ovpxk25n>
References: <20240521105817.3301-1-keith.zhao@starfivetech.com>
 <20240521105817.3301-7-keith.zhao@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521105817.3301-7-keith.zhao@starfivetech.com>
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

On Tue, May 21, 2024 at 06:58:13PM +0800, keith wrote:
> add plane funs and helper funs
> add vs drm common struct and funs
> 
> Signed-off-by: keith <keith.zhao@starfivetech.com>
> ---
>  drivers/gpu/drm/verisilicon/Makefile   |   3 +-
>  drivers/gpu/drm/verisilicon/vs_drv.h   |  93 +++++
>  drivers/gpu/drm/verisilicon/vs_plane.c | 487 +++++++++++++++++++++++++
>  drivers/gpu/drm/verisilicon/vs_plane.h |  26 ++
>  4 files changed, 608 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_drv.h
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_plane.c
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_plane.h
> 
> diff --git a/drivers/gpu/drm/verisilicon/Makefile b/drivers/gpu/drm/verisilicon/Makefile
> index 536091f37378..1c593b943261 100644
> --- a/drivers/gpu/drm/verisilicon/Makefile
> +++ b/drivers/gpu/drm/verisilicon/Makefile
> @@ -1,6 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>  
>  vs_drm-objs := vs_dc_hw.o \
> -		vs_modeset.o
> +		vs_modeset.o \
> +		vs_plane.o
>  
>  obj-$(CONFIG_DRM_VERISILICON_DC8200) += vs_drm.o
> diff --git a/drivers/gpu/drm/verisilicon/vs_drv.h b/drivers/gpu/drm/verisilicon/vs_drv.h
> new file mode 100644
> index 000000000000..d9f6efa7c8f9
> --- /dev/null
> +++ b/drivers/gpu/drm/verisilicon/vs_drv.h
> @@ -0,0 +1,93 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2023 VeriSilicon Holdings Co., Ltd.
> + */
> +
> +#ifndef __VS_DRV_H__
> +#define __VS_DRV_H__
> +
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/clk.h>
> +#include <linux/reset.h>
> +
> +#include <drm/drm_drv.h>
> +#include <drm/drm_fourcc.h>
> +#include <drm/drm_gem.h>
> +#include <drm/drm_managed.h>
> +
> +#include "vs_dc_hw.h"
> +
> +/*@pitch_alignment: buffer pitch alignment required by sub-devices.*/

Is that all the docs you want to add?

> +struct vs_drm_device {
> +	struct drm_device base;
> +	unsigned int pitch_alignment;
> +	/* clocks */
> +	unsigned int clk_count;
> +	struct clk_bulk_data	*clks;
> +	struct reset_control	*rsts;
> +	struct vs_dc dc;
> +	int irq;

As usual, please drop unused fields and add them when required.

> +};
> +
> +static inline struct vs_drm_device *
> +to_vs_drm_private(const struct drm_device *dev)
> +{
> +	return container_of(dev, struct vs_drm_device, base);
> +}
> +
> +struct vs_crtc_state {
> +	struct drm_crtc_state base;
> +
> +	u32 output_fmt;
> +	u8 encoder_type;
> +	u8 bpp;
> +};

Not used here, drop.

> +
> +struct vs_crtc {
> +	struct drm_crtc base;
> +	struct device *dev;
> +};


> +
> +static inline u8 to_vs_display_id(struct vs_dc *dc, struct drm_crtc *crtc)
> +{
> +	u8 panel_num = dc->hw.info->panel_num;
> +	u32 index = drm_crtc_index(crtc);
> +	int i;
> +
> +	for (i = 0; i < panel_num; i++) {
> +		if (index == dc->crtc[i]->base.index)
> +			return i;
> +	}
> +
> +	return 0;
> +}
> +
> +static inline struct vs_crtc_state *
> +to_vs_crtc_state(struct drm_crtc_state *state)
> +{
> +	return container_of(state, struct vs_crtc_state, base);
> +}
> +
> +struct vs_plane_state {
> +	struct drm_plane_state base;
> +	dma_addr_t dma_addr[DRM_FORMAT_MAX_PLANES];
> +};
> +
> +struct vs_plane {
> +	struct drm_plane base;
> +	u8 id;
> +};
> +
> +static inline struct vs_plane *to_vs_plane(struct drm_plane *plane)
> +{
> +	return container_of(plane, struct vs_plane, base);
> +}
> +
> +static inline struct vs_plane_state *
> +to_vs_plane_state(struct drm_plane_state *state)
> +{
> +	return container_of(state, struct vs_plane_state, base);
> +}
> +
> +#endif /* __VS_DRV_H__ */
> diff --git a/drivers/gpu/drm/verisilicon/vs_plane.c b/drivers/gpu/drm/verisilicon/vs_plane.c
> new file mode 100644
> index 000000000000..653f0ce72ed6
> --- /dev/null
> +++ b/drivers/gpu/drm/verisilicon/vs_plane.c
> @@ -0,0 +1,487 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2023 VeriSilicon Holdings Co., Ltd.
> + */
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_blend.h>
> +#include <drm/drm_gem_dma_helper.h>
> +#include <drm/drm_fb_dma_helper.h>
> +#include <drm/drm_framebuffer.h>
> +#include <drm/drm_plane.h>
> +#include <drm/drm_plane_helper.h>
> +
> +#include "vs_plane.h"
> +
> +static void vs_plane_atomic_destroy_state(struct drm_plane *plane,
> +					  struct drm_plane_state *state)
> +{
> +	struct vs_plane_state *vs_plane_state = to_vs_plane_state(state);
> +
> +	__drm_atomic_helper_plane_destroy_state(state);
> +	kfree(vs_plane_state);
> +}
> +
> +static void vs_plane_reset(struct drm_plane *plane)
> +{
> +	struct vs_plane_state *state;
> +	struct vs_plane *vs_plane = to_vs_plane(plane);
> +
> +	if (plane->state)
> +		vs_plane_atomic_destroy_state(plane, plane->state);
> +
> +	state = kzalloc(sizeof(*state), GFP_KERNEL);
> +	if (!state)
> +		return;
> +
> +	state->base.zpos = vs_plane->id;
> +	__drm_atomic_helper_plane_reset(plane, &state->base);
> +}
> +
> +static struct drm_plane_state *
> +vs_plane_atomic_duplicate_state(struct drm_plane *plane)
> +{
> +	struct vs_plane_state *state;
> +
> +	if (WARN_ON(!plane->state))
> +		return NULL;
> +
> +	state = kzalloc(sizeof(*state), GFP_KERNEL);
> +	if (!state)
> +		return NULL;
> +
> +	__drm_atomic_helper_plane_duplicate_state(plane, &state->base);
> +
> +	return &state->base;
> +}
> +
> +static bool vs_format_mod_supported(struct drm_plane *plane,
> +				    u32 format,
> +				    u64 modifier)
> +{
> +	int i;
> +
> +	/* We always have to allow these modifiers:
> +	 * 1. Core DRM checks for LINEAR support if userspace does not provide modifiers.
> +	 * 2. Not passing any modifiers is the same as explicitly passing INVALID.
> +	 */
> +	if (modifier == DRM_FORMAT_MOD_LINEAR)
> +		return true;
> +
> +	/* Check that the modifier is on the list of the plane's supported modifiers. */
> +	for (i = 0; i < plane->modifier_count; i++) {
> +		if (modifier == plane->modifiers[i])
> +			break;
> +	}
> +
> +	if (i == plane->modifier_count)
> +		return false;
> +
> +	return true;
> +}
> +
> +const struct drm_plane_funcs vs_plane_funcs = {
> +	.update_plane		= drm_atomic_helper_update_plane,
> +	.disable_plane		= drm_atomic_helper_disable_plane,
> +	.reset			= vs_plane_reset,
> +	.atomic_duplicate_state = vs_plane_atomic_duplicate_state,
> +	.atomic_destroy_state	= vs_plane_atomic_destroy_state,
> +	.format_mod_supported	= vs_format_mod_supported,
> +};
> +
> +static unsigned char vs_get_plane_number(struct drm_framebuffer *fb)
> +{
> +	const struct drm_format_info *info;
> +
> +	if (!fb)
> +		return 0;
> +
> +	info = drm_format_info(fb->format->format);
> +	if (!info || info->num_planes > DRM_FORMAT_MAX_PLANES)
> +		return 0;
> +
> +	return info->num_planes;
> +}
> +
> +static bool vs_dc_mod_supported(const u64 *info_modifiers, u64 modifier)
> +{
> +	const u64 *mods;
> +
> +	if (!info_modifiers)
> +		return false;
> +
> +	for (mods = info_modifiers; *mods != DRM_FORMAT_MOD_INVALID; mods++) {
> +		if (*mods == modifier)
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
> +static int vs_primary_plane_atomic_check(struct drm_plane *plane, struct drm_atomic_state *state)
> +{
> +	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state, plane);
> +	struct vs_drm_device *priv = to_vs_drm_private(plane->dev);
> +	struct vs_dc *dc = &priv->dc;
> +	struct drm_framebuffer *fb = new_state->fb;
> +	const struct vs_plane_primary_info *primary_info;
> +	struct drm_crtc_state *crtc_state;
> +	int i;
> +
> +	if (!new_state->crtc || !new_state->fb)
> +		return 0;
> +	for (i = 0; i < dc->hw.info->primary_num; i++) {
> +		primary_info = (struct vs_plane_primary_info *)&dc->hw.info->primary[i];
> +		if (primary_info->id == to_vs_plane(plane)->id)
> +			break;
> +	}
> +
> +	primary_info = &dc->hw.info->primary[i];
> +
> +	if (fb->width < primary_info->min_width ||
> +	    fb->width > primary_info->max_width ||
> +	    fb->height < primary_info->min_height ||
> +	    fb->height > primary_info->max_height)
> +		drm_err_once(plane->dev, "buffer size may not support on plane%d.\n",
> +			     to_vs_plane(plane)->id);
> +
> +	if (!vs_dc_mod_supported(primary_info->modifiers, fb->modifier)) {
> +		drm_err(plane->dev, "unsupported modifier on plane%d.\n", to_vs_plane(plane)->id);
> +		return -EINVAL;
> +	}
> +
> +	crtc_state = drm_atomic_get_existing_crtc_state(new_state->state, new_state->crtc);
> +	return drm_atomic_helper_check_plane_state(new_state, crtc_state,
> +						   primary_info->min_scale,
> +						   primary_info->max_scale,
> +						   true, true);
> +}
> +
> +static int vs_overlay_plane_atomic_check(struct drm_plane *plane, struct drm_atomic_state *state)
> +{
> +	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state, plane);
> +	struct vs_drm_device *priv = to_vs_drm_private(plane->dev);
> +	struct vs_dc *dc = &priv->dc;
> +	struct drm_framebuffer *fb = new_state->fb;
> +	const struct vs_plane_overlay_info *overlay_info;
> +	struct drm_crtc_state *crtc_state;
> +	int i;
> +
> +	if (!new_state->crtc || !new_state->fb)
> +		return 0;
> +
> +	for (i = 0; i < dc->hw.info->overlay_num; i++) {
> +		overlay_info = (struct vs_plane_overlay_info *)&dc->hw.info->overlay[i];
> +		if (overlay_info->id == to_vs_plane(plane)->id)
> +			break;
> +	}
> +
> +	overlay_info = &dc->hw.info->overlay[i];
> +
> +	if (fb->width < overlay_info->min_width ||
> +	    fb->width > overlay_info->max_width ||
> +	    fb->height < overlay_info->min_height ||
> +	    fb->height > overlay_info->max_height)
> +		drm_err_once(plane->dev, "buffer size may not support on plane%d.\n",
> +			     to_vs_plane(plane)->id);
> +
> +	if (!vs_dc_mod_supported(overlay_info->modifiers, fb->modifier)) {
> +		drm_err(plane->dev, "unsupported modifier on plane%d.\n", to_vs_plane(plane)->id);
> +		return -EINVAL;
> +}
> +
> +	crtc_state = drm_atomic_get_existing_crtc_state(new_state->state, new_state->crtc);
> +	return drm_atomic_helper_check_plane_state(new_state, crtc_state,
> +						   overlay_info->min_scale,
> +						   overlay_info->max_scale,
> +						   true, true);
> +}
> +
> +static int vs_cursor_plane_atomic_check(struct drm_plane *plane, struct drm_atomic_state *state)
> +{
> +	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state, plane);
> +	struct vs_drm_device *priv = to_vs_drm_private(plane->dev);
> +	struct vs_dc *dc = &priv->dc;
> +	struct drm_framebuffer *fb = new_state->fb;
> +	const struct vs_plane_cursor_info *cursor_info;
> +	struct drm_crtc_state *crtc_state;
> +	int i;
> +
> +	if (!new_state->crtc || !new_state->fb)
> +		return 0;
> +
> +	for (i = 0; i < dc->hw.info->cursor_num; i++) {
> +		cursor_info = (struct vs_plane_cursor_info *)&dc->hw.info->cursor[i];
> +		if (cursor_info->id == to_vs_plane(plane)->id)
> +			break;
> +	}
> +
> +	cursor_info = &dc->hw.info->cursor[i];
> +
> +	if (fb->width < cursor_info->min_width ||
> +	    fb->width > cursor_info->max_width ||
> +	    fb->height < cursor_info->min_height ||
> +	    fb->height > cursor_info->max_height)
> +		drm_err_once(plane->dev, "buffer size may not support on plane%d.\n",
> +			     to_vs_plane(plane)->id);
> +
> +	crtc_state = drm_atomic_get_existing_crtc_state(new_state->state, new_state->crtc);
> +	return drm_atomic_helper_check_plane_state(new_state, crtc_state,
> +						   DRM_PLANE_NO_SCALING,
> +						   DRM_PLANE_NO_SCALING,
> +						   true, true);

Looking at these three functions:
- Define a common struct for plane info;
- Define a single function handling common case;
- Extend it as necessary for primary / overlay cases (or just skip the
  corresponding check for cursor plane type).

> +}
> +
> +static void vs_plane_atomic_update(struct drm_plane *plane, struct drm_atomic_state *state)
> +{
> +	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state, plane);
> +	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state, plane);
> +
> +	unsigned char i, num_planes, display_id, id;
> +	u32 format;
> +	bool is_yuv;
> +	struct vs_plane *vs_plane = to_vs_plane(plane);
> +	struct vs_plane_state *plane_state = to_vs_plane_state(new_state);
> +	struct vs_drm_device *priv = to_vs_drm_private(plane->dev);
> +	struct vs_dc *dc = &priv->dc;
> +
> +	if (!new_state->fb || !new_state->crtc)
> +		return;
> +
> +	drm_fb_dma_sync_non_coherent(plane->dev, old_state, new_state);
> +
> +	num_planes = vs_get_plane_number(new_state->fb);
> +
> +	for (i = 0; i < num_planes; i++) {
> +		dma_addr_t dma_addr;
> +
> +		dma_addr = drm_fb_dma_get_gem_addr(new_state->fb, new_state, i);
> +		plane_state->dma_addr[i] = dma_addr;
> +	}
> +
> +	display_id = to_vs_display_id(dc, new_state->crtc);
> +	format = new_state->fb->format->format;
> +	is_yuv = new_state->fb->format->is_yuv;
> +	id = vs_plane->id;
> +
> +	plane_hw_update_format_colorspace(dc, format, new_state->color_encoding, id, is_yuv);
> +	if (new_state->visible)
> +		plane_hw_update_address(dc, id, format, plane_state->dma_addr,
> +					new_state->fb, &new_state->src);
> +	plane_hw_update_format(dc, format, new_state->color_encoding, new_state->rotation,
> +			       new_state->visible, new_state->zpos, id, display_id);
> +	plane_hw_update_scale(dc, &new_state->src, &new_state->dst, id,
> +			      display_id, new_state->rotation);
> +	plane_hw_update_blend(dc, new_state->alpha, new_state->pixel_blend_mode,
> +			      id, display_id);
> +}
> +
> +static void vs_cursor_plane_atomic_update(struct drm_plane *plane, struct drm_atomic_state *state)
> +{
> +	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
> +									   plane);
> +	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
> +									   plane);
> +	struct vs_drm_device *priv = to_vs_drm_private(plane->dev);
> +	struct vs_dc *dc = &priv->dc;
> +	unsigned char display_id;
> +	u32 crtc_w, crtc_x, crtc_y;
> +	s32 hotspot_x, hotspot_y;
> +	dma_addr_t dma_addr;
> +
> +	display_id = to_vs_display_id(dc, new_state->crtc);
> +
> +	if (!new_state->fb || !new_state->crtc)
> +		return;
> +
> +	drm_fb_dma_sync_non_coherent(new_state->fb->dev, old_state, new_state);
> +	dma_addr = drm_fb_dma_get_gem_addr(new_state->fb, new_state, 0);
> +	crtc_w = new_state->crtc_w;
> +
> +	if (new_state->crtc_x > 0) {
> +		crtc_x = new_state->crtc_x;
> +		hotspot_x = 0;
> +	} else {
> +		hotspot_x = -new_state->crtc_x;
> +		crtc_x = 0;
> +	}
> +	if (new_state->crtc_y > 0) {
> +		crtc_y = new_state->crtc_y;
> +		hotspot_y = 0;
> +	} else {
> +		hotspot_y = -new_state->crtc_y;
> +		crtc_y = 0;
> +	}
> +	dc_hw_update_cursor(&dc->hw, display_id, dma_addr, crtc_w, crtc_x,
> +			    crtc_y, hotspot_x, hotspot_y);
> +}
> +
> +static void vs_plane_atomic_disable(struct drm_plane *plane, struct drm_atomic_state *state)
> +{
> +	struct vs_plane *vs_plane = to_vs_plane(plane);
> +	struct vs_drm_device *priv = to_vs_drm_private(plane->dev);
> +	struct vs_dc *dc = &priv->dc;
> +
> +	dc_hw_disable_plane(dc, vs_plane->id);
> +}
> +
> +static void vs_cursor_plane_atomic_disable(struct drm_plane *plane, struct drm_atomic_state *state)
> +{
> +	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state, plane);
> +	struct vs_drm_device *priv = to_vs_drm_private(plane->dev);
> +	struct vs_dc *dc = &priv->dc;
> +	unsigned char display_id;
> +
> +	display_id = to_vs_display_id(dc, old_state->crtc);
> +	dc_hw_disable_cursor(&dc->hw, display_id);
> +}
> +
> +const struct drm_plane_helper_funcs primary_plane_helpers = {
> +	.atomic_check	= vs_primary_plane_atomic_check,
> +	.atomic_update	= vs_plane_atomic_update,
> +	.atomic_disable = vs_plane_atomic_disable,
> +};
> +
> +const struct drm_plane_helper_funcs overlay_plane_helpers = {
> +	.atomic_check	= vs_overlay_plane_atomic_check,
> +	.atomic_update	= vs_plane_atomic_update,
> +	.atomic_disable = vs_plane_atomic_disable,
> +};
> +
> +const struct drm_plane_helper_funcs cursor_plane_helpers = {
> +	.atomic_check	= vs_cursor_plane_atomic_check,
> +	.atomic_update	= vs_cursor_plane_atomic_update,
> +	.atomic_disable = vs_cursor_plane_atomic_disable,
> +};
> +
> +struct vs_plane *vs_plane_primary_create(struct drm_device *drm_dev,
> +					 struct vs_plane_primary_info *info,
> +					 unsigned int layer_num,
> +					 unsigned int possible_crtcs)
> +{
> +	struct vs_plane *plane;
> +	int ret;
> +
> +	if (!info)
> +		return NULL;
> +
> +	plane = drmm_universal_plane_alloc(drm_dev, struct vs_plane, base,
> +					   possible_crtcs,
> +					   &vs_plane_funcs,
> +					   info->formats, info->num_formats,
> +					   info->modifiers, DRM_PLANE_TYPE_PRIMARY,
> +					   NULL);
> +	if (IS_ERR(plane))
> +		return ERR_CAST(plane);
> +
> +	drm_plane_helper_add(&plane->base, &primary_plane_helpers);
> +
> +	drm_plane_create_alpha_property(&plane->base);
> +	drm_plane_create_blend_mode_property(&plane->base,
> +					     BIT(DRM_MODE_BLEND_PIXEL_NONE) |
> +					     BIT(DRM_MODE_BLEND_PREMULTI) |
> +					     BIT(DRM_MODE_BLEND_COVERAGE));
> +
> +	if (info->color_encoding) {
> +		ret = drm_plane_create_color_properties(&plane->base, info->color_encoding,
> +							BIT(DRM_COLOR_YCBCR_LIMITED_RANGE),
> +							DRM_COLOR_YCBCR_BT709,
> +							DRM_COLOR_YCBCR_LIMITED_RANGE);
> +		if (ret)
> +			return NULL;
> +	}
> +
> +	if (info->rotation) {
> +		ret = drm_plane_create_rotation_property(&plane->base,
> +							 DRM_MODE_ROTATE_0,
> +							 info->rotation);
> +		if (ret)
> +			return NULL;
> +	}
> +
> +	ret = drm_plane_create_zpos_property(&plane->base, info->zpos, 0, layer_num - 1);
> +	if (ret)
> +		return NULL;
> +
> +	return plane;
> +}
> +
> +struct vs_plane *vs_plane_overlay_create(struct drm_device *drm_dev,
> +					 struct vs_plane_overlay_info *info,
> +					 unsigned int layer_num,
> +					 unsigned int possible_crtcs)

This looks almost like a previous function. Consider merging them.

> +{
> +	struct vs_plane *plane;
> +	int ret;
> +
> +	if (!info)
> +		return NULL;
> +
> +	plane = drmm_universal_plane_alloc(drm_dev, struct vs_plane, base,
> +					   possible_crtcs,
> +					   &vs_plane_funcs,
> +					   info->formats, info->num_formats,
> +					   info->modifiers, DRM_PLANE_TYPE_OVERLAY,
> +					   NULL);
> +	if (IS_ERR(plane))
> +		return ERR_CAST(plane);
> +
> +	drm_plane_helper_add(&plane->base, &overlay_plane_helpers);
> +
> +	drm_plane_create_alpha_property(&plane->base);
> +	drm_plane_create_blend_mode_property(&plane->base,
> +					     BIT(DRM_MODE_BLEND_PIXEL_NONE) |
> +					     BIT(DRM_MODE_BLEND_PREMULTI) |
> +					     BIT(DRM_MODE_BLEND_COVERAGE));
> +
> +	if (info->color_encoding) {
> +		ret = drm_plane_create_color_properties(&plane->base, info->color_encoding,
> +							BIT(DRM_COLOR_YCBCR_LIMITED_RANGE),
> +							DRM_COLOR_YCBCR_BT709,
> +							DRM_COLOR_YCBCR_LIMITED_RANGE);
> +		if (ret)
> +			return NULL;
> +	}
> +
> +	if (info->rotation) {
> +		ret = drm_plane_create_rotation_property(&plane->base,
> +							 DRM_MODE_ROTATE_0,
> +							 info->rotation);
> +		if (ret)
> +			return NULL;
> +	}
> +
> +	ret = drm_plane_create_zpos_property(&plane->base, info->zpos, 0, layer_num - 1);
> +	if (ret)
> +		return NULL;
> +
> +	return plane;
> +}
> +
> +struct vs_plane *vs_plane_cursor_create(struct drm_device *drm_dev,
> +					struct vs_plane_cursor_info *info,
> +					unsigned int possible_crtcs)
> +{
> +	struct vs_plane *plane;
> +	int ret;
> +
> +	if (!info)
> +		return NULL;
> +
> +	plane = drmm_universal_plane_alloc(drm_dev, struct vs_plane, base,
> +					   possible_crtcs,
> +					   &vs_plane_funcs,
> +					   info->formats, info->num_formats,
> +					   NULL, DRM_PLANE_TYPE_CURSOR,
> +					   NULL);
> +	if (IS_ERR(plane))
> +		return ERR_CAST(plane);
> +
> +	drm_plane_helper_add(&plane->base, &cursor_plane_helpers);
> +
> +	ret = drm_plane_create_zpos_immutable_property(&plane->base, info->zpos);
> +	if (ret)
> +		return NULL;
> +
> +	return plane;
> +}
> diff --git a/drivers/gpu/drm/verisilicon/vs_plane.h b/drivers/gpu/drm/verisilicon/vs_plane.h
> new file mode 100644
> index 000000000000..0416146226a8
> --- /dev/null
> +++ b/drivers/gpu/drm/verisilicon/vs_plane.h
> @@ -0,0 +1,26 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2023 VeriSilicon Holdings Co., Ltd.
> + */
> +
> +#ifndef __VS_PLANE_H__
> +#define __VS_PLANE_H__
> +
> +#include <drm/drm_plane_helper.h>
> +
> +#include "vs_drv.h"
> +
> +struct vs_plane *vs_plane_primary_create(struct drm_device *drm_dev,
> +					 struct vs_plane_primary_info *info,
> +					 unsigned int layer_num,
> +					 unsigned int possible_crtcs);
> +
> +struct vs_plane *vs_plane_overlay_create(struct drm_device *drm_dev,
> +					 struct vs_plane_overlay_info *info,
> +					 unsigned int layer_num,
> +					 unsigned int possible_crtcs);
> +
> +struct vs_plane *vs_plane_cursor_create(struct drm_device *drm_dev,
> +					struct vs_plane_cursor_info *info,
> +					unsigned int possible_crtcs);
> +#endif /* __VS_PLANE_H__ */
> -- 
> 2.27.0
> 

-- 
With best wishes
Dmitry
