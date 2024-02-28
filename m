Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 330C886B42A
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 17:07:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B557510E40F;
	Wed, 28 Feb 2024 16:07:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZMkwLiBR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1452910E40F
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 16:07:43 +0000 (UTC)
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi
 [89.27.53.110])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D1CCC6B3;
 Wed, 28 Feb 2024 17:07:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1709136450;
 bh=FiRbaHPXoxiQwJ+RgsN41gLXp55/XWSH1L297zhy21I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZMkwLiBReuJPjxjMz597P8K210ciiqrnyTs7gw+PRWo98Vzr/2yGaIWkzD9kNvNem
 LCyVc39CGWjuO/PdhcSgYkZkAC8Zde6/XWAwKuYs7SbiY5y9BXXdIXreCxo5oV3MMC
 /wLMi5gSzi4gc8anJW4kQXqVOAyLc8cxn54Hqm34=
Date: Wed, 28 Feb 2024 18:07:44 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Michal Simek <michal.simek@amd.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] drm: xlnx: zynqmp_dpsub: Set input live format
Message-ID: <20240228160744.GD9863@pendragon.ideasonboard.com>
References: <20240226-dp-live-fmt-v1-0-b78c3f69c9d8@amd.com>
 <20240226-dp-live-fmt-v1-3-b78c3f69c9d8@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240226-dp-live-fmt-v1-3-b78c3f69c9d8@amd.com>
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

Hi Anatoliy,

Thank you for the patch.

On Mon, Feb 26, 2024 at 08:44:44PM -0800, Anatoliy Klymenko wrote:
> Program live video input format according to selected media bus format.
> 
> In the bridge mode of operation, DPSUB is connected to FPGA CRTC which
> almost certainly supports a single media bus format as its output. Expect
> this to be delivered via the new bridge atomic state. Program DPSUB
> registers accordingly.
> 
> Signed-off-by: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
> ---
>  drivers/gpu/drm/xlnx/zynqmp_disp.c      | 52 +++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xlnx/zynqmp_disp.h      |  2 ++
>  drivers/gpu/drm/xlnx/zynqmp_disp_regs.h |  8 ++---
>  drivers/gpu/drm/xlnx/zynqmp_dp.c        | 13 ++++++---
>  4 files changed, 67 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> index ee99aad915ba..1c3ffdee6b8e 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> @@ -416,6 +416,34 @@ static bool zynqmp_disp_layer_is_video(const struct zynqmp_disp_layer *layer)
>  	return layer->id == ZYNQMP_DPSUB_LAYER_VID;
>  }
>  
> +/**
> + * zynqmp_disp_avbuf_set_live_format - Set live input format for a layer
> + * @disp: Display controller
> + * @layer: The layer
> + * @fmt: The format information
> + *
> + * Set the live video input format for @layer to @fmt.
> + */
> +static void zynqmp_disp_avbuf_set_live_format(struct zynqmp_disp *disp,
> +					      struct zynqmp_disp_layer *layer,
> +					      const struct zynqmp_disp_format *fmt)
> +{
> +	u32 reg, i;
> +
> +	reg = zynqmp_disp_layer_is_video(layer)
> +	    ? ZYNQMP_DISP_AV_BUF_LIVE_VID_CONFIG
> +	    : ZYNQMP_DISP_AV_BUF_LIVE_GFX_CONFIG;
> +	zynqmp_disp_avbuf_write(disp, reg, fmt->buf_fmt);
> +
> +	for (i = 0; i < ZYNQMP_DISP_AV_BUF_NUM_SF; ++i) {
> +		reg = zynqmp_disp_layer_is_video(layer)
> +		    ? ZYNQMP_DISP_AV_BUF_LIVD_VID_COMP_SF(i)
> +		    : ZYNQMP_DISP_AV_BUF_LIVD_GFX_COMP_SF(i);
> +		zynqmp_disp_avbuf_write(disp, reg, fmt->sf[i]);
> +	}

This is identical to zynqmp_disp_avbuf_set_format(), you should avoid
duplicating code.

> +	layer->disp_fmt = fmt;
> +}
> +
>  /**
>   * zynqmp_disp_avbuf_set_format - Set the input format for a layer
>   * @disp: Display controller
> @@ -979,6 +1007,30 @@ void zynqmp_disp_layer_disable(struct zynqmp_disp_layer *layer)
>  	zynqmp_disp_blend_layer_disable(layer->disp, layer);
>  }
>  
> +/**
> + * zynqmp_disp_layer_set_live_format - Set live layer input format
> + * @layer: The layer
> + * @info: Input media bus format
> + *
> + * Set the live @layer input bus format. The layer must be disabled.
> + */
> +void zynqmp_disp_layer_set_live_format(struct zynqmp_disp_layer *layer,
> +				       u32 bus_format)

I'd prefer reusing zynqmp_disp_layer_set_format(), and handling the
differences between live and non-live input there. There's already a
dma_enabled check in that function.

> +{
> +	int i;
> +	const struct zynqmp_disp_format *fmt;
> +
> +	for (i = 0; i < ARRAY_SIZE(avbuf_live_fmts); ++i) {
> +		fmt = &avbuf_live_fmts[i];
> +		if (fmt->bus_fmt == bus_format) {
> +			layer->disp_fmt = fmt;
> +			layer->drm_fmt = drm_format_info(fmt->drm_fmt);
> +			zynqmp_disp_avbuf_set_live_format(layer->disp, layer, fmt);
> +			return;
> +		}
> +	}
> +}
> +
>  /**
>   * zynqmp_disp_layer_set_format - Set the layer format
>   * @layer: The layer
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.h b/drivers/gpu/drm/xlnx/zynqmp_disp.h
> index c2c8dd4896ba..f244b7d2346a 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_disp.h
> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.h
> @@ -66,6 +66,8 @@ void zynqmp_disp_layer_enable(struct zynqmp_disp_layer *layer);
>  void zynqmp_disp_layer_disable(struct zynqmp_disp_layer *layer);
>  void zynqmp_disp_layer_set_format(struct zynqmp_disp_layer *layer,
>  				  const struct drm_format_info *info);
> +void zynqmp_disp_layer_set_live_format(struct zynqmp_disp_layer *layer,
> +				       u32 bus_format);
>  int zynqmp_disp_layer_update(struct zynqmp_disp_layer *layer,
>  			     struct drm_plane_state *state);
>  
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp_regs.h b/drivers/gpu/drm/xlnx/zynqmp_disp_regs.h
> index f92a006d5070..fa3935384834 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_disp_regs.h
> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp_regs.h
> @@ -165,10 +165,10 @@
>  #define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_BPC_10		0x2
>  #define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_BPC_12		0x3
>  #define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_BPC_MASK		GENMASK(2, 0)
> -#define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_RGB		0x0
> -#define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_YUV444	0x1
> -#define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_YUV422	0x2
> -#define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_YONLY	0x3
> +#define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_RGB		(0x0 << 4)
> +#define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_YUV444	(0x1 << 4)
> +#define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_YUV422	(0x2 << 4)
> +#define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_YONLY	(0x3 << 4)

This change isn't even mentioned in the commit message. It should be
split to a separate patch.

>  #define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_MASK		GENMASK(5, 4)
>  #define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_CB_FIRST		BIT(8)
>  #define ZYNQMP_DISP_AV_BUF_PALETTE_MEMORY		0x400
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> index 9cb7ac9f3097..0d5dffd20ad1 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> @@ -1281,7 +1281,8 @@ static void zynqmp_dp_disp_enable(struct zynqmp_dp *dp,
>  {
>  	enum zynqmp_dpsub_layer_id layer_id;
>  	struct zynqmp_disp_layer *layer;
> -	const struct drm_format_info *info;
> +	struct drm_bridge_state *bridge_state;
> +	u32 bus_fmt;
>  
>  	if (dp->dpsub->connected_ports & BIT(ZYNQMP_DPSUB_PORT_LIVE_VIDEO))
>  		layer_id = ZYNQMP_DPSUB_LAYER_VID;
> @@ -1291,10 +1292,14 @@ static void zynqmp_dp_disp_enable(struct zynqmp_dp *dp,
>  		return;
>  
>  	layer = dp->dpsub->layers[layer_id];
> +	bridge_state = drm_atomic_get_new_bridge_state(old_bridge_state->base.state,
> +						       old_bridge_state->bridge);
> +	if (bridge_state) {
> +		bus_fmt = bridge_state->input_bus_cfg.format;
> +		zynqmp_disp_layer_set_live_format(layer, bus_fmt);
> +	} else
> +		return;

	if (!bridge_state)
		return;

	bus_fmt = bridge_state->input_bus_cfg.format;
	zynqmp_disp_layer_set_live_format(layer, bus_fmt);

But more importantly, why would this fail ? If it does something is
seriously wrong and the display won't be working. I'd expect at least a
warning, but you should instead ensure it never fails.

>  
> -	/* TODO: Make the format configurable. */
> -	info = drm_format_info(DRM_FORMAT_YUV422);
> -	zynqmp_disp_layer_set_format(layer, info);
>  	zynqmp_disp_layer_enable(layer);
>  
>  	if (layer_id == ZYNQMP_DPSUB_LAYER_GFX)
> 

-- 
Regards,

Laurent Pinchart
