Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA2287F4A2
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 01:35:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EB06112367;
	Tue, 19 Mar 2024 00:35:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="G3C4LgSr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A367112362
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 00:35:28 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0614F480;
 Tue, 19 Mar 2024 01:34:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1710808500;
 bh=evt/QjjewDa5FyHkyULrULdNpk3hc17dFGup/YxaVVE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G3C4LgSr6TPfDOFVC1xkw6FIzkOyvHyt+X0wjg6d1WuuatSGibUEmxq6m8DoqBAkD
 F8tLyiV37TUekoASi3EGXifXz64wLX5nHt/UrArTJArUMrf1Ys0oAaVWkDhuO57//N
 N/4Cfk77ApWqTJYzr+Nr92IRGMNdxDcT7Ys/g2To=
Date: Tue, 19 Mar 2024 02:35:23 +0200
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
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v2 5/8] drm: xlnx: zynqmp_dpsub: Set input live format
Message-ID: <20240319003523.GW13682@pendragon.ideasonboard.com>
References: <20240312-dp-live-fmt-v2-0-a9c35dc5c50d@amd.com>
 <20240312-dp-live-fmt-v2-5-a9c35dc5c50d@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240312-dp-live-fmt-v2-5-a9c35dc5c50d@amd.com>
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

On Tue, Mar 12, 2024 at 05:55:02PM -0700, Anatoliy Klymenko wrote:
> Program live video input format according to selected media bus format.
> 
> In the bridge mode of operation, DPSUB is connected to FPGA CRTC which
> almost certainly supports a single media bus format as its output. Expect
> this to be delivered via the new bridge atomic state. Program DPSUB
> registers accordingly.

No line breaks within paragraphs. Add a blank line if you want to
paragraphs, remove the line break otherwise.

> Update zynqmp_disp_layer_set_format() API to fit both live and non-live
> layer types.
> 
> Signed-off-by: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
> ---
>  drivers/gpu/drm/xlnx/zynqmp_disp.c | 93 +++++++++++++++++++++++++++++++-------
>  drivers/gpu/drm/xlnx/zynqmp_disp.h |  2 +-
>  drivers/gpu/drm/xlnx/zynqmp_dp.c   | 13 ++++--
>  drivers/gpu/drm/xlnx/zynqmp_kms.c  |  2 +-
>  4 files changed, 87 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> index dd48fa60fa9a..0cacd597f4b8 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> @@ -383,7 +383,7 @@ static const struct zynqmp_disp_format avbuf_live_fmts[] = {
>  				  ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_RGB,
>  		.sf		= scaling_factors_666,
>  	}, {
> -		.bus_fmt	= MEDIA_BUS_FMT_UYVY8_1X24,
> +		.bus_fmt	= MEDIA_BUS_FMT_RBG888_1X24,

Does this belong to a previous patch ?

>  		.buf_fmt	= ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_BPC_8 |
>  				  ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_RGB,
>  		.sf		= scaling_factors_888,
> @@ -433,19 +433,28 @@ static void zynqmp_disp_avbuf_set_format(struct zynqmp_disp *disp,
>  					 const struct zynqmp_disp_format *fmt)
>  {
>  	unsigned int i;
> -	u32 val;
> +	u32 val, reg;
>  
> -	val = zynqmp_disp_avbuf_read(disp, ZYNQMP_DISP_AV_BUF_FMT);
> -	val &= zynqmp_disp_layer_is_video(layer)
> -	    ? ~ZYNQMP_DISP_AV_BUF_FMT_NL_VID_MASK
> -	    : ~ZYNQMP_DISP_AV_BUF_FMT_NL_GFX_MASK;
> -	val |= fmt->buf_fmt;
> -	zynqmp_disp_avbuf_write(disp, ZYNQMP_DISP_AV_BUF_FMT, val);
> +	layer->disp_fmt = fmt;
> +	if (layer->mode == ZYNQMP_DPSUB_LAYER_NONLIVE) {
> +		reg = ZYNQMP_DISP_AV_BUF_FMT;
> +		val = zynqmp_disp_avbuf_read(disp, ZYNQMP_DISP_AV_BUF_FMT);
> +		val &= zynqmp_disp_layer_is_video(layer)
> +		    ? ~ZYNQMP_DISP_AV_BUF_FMT_NL_VID_MASK
> +		    : ~ZYNQMP_DISP_AV_BUF_FMT_NL_GFX_MASK;
> +		val |= fmt->buf_fmt;
> +	} else {
> +		reg = zynqmp_disp_layer_is_video(layer)
> +		    ? ZYNQMP_DISP_AV_BUF_LIVE_VID_CONFIG
> +		    : ZYNQMP_DISP_AV_BUF_LIVE_GFX_CONFIG;
> +		val = fmt->buf_fmt;
> +	}
> +	zynqmp_disp_avbuf_write(disp, reg, val);
>  
>  	for (i = 0; i < ZYNQMP_DISP_AV_BUF_NUM_SF; i++) {
> -		unsigned int reg = zynqmp_disp_layer_is_video(layer)
> -				 ? ZYNQMP_DISP_AV_BUF_VID_COMP_SF(i)
> -				 : ZYNQMP_DISP_AV_BUF_GFX_COMP_SF(i);
> +		reg = zynqmp_disp_layer_is_video(layer)
> +		    ? ZYNQMP_DISP_AV_BUF_VID_COMP_SF(i)
> +		    : ZYNQMP_DISP_AV_BUF_GFX_COMP_SF(i);
>  
>  		zynqmp_disp_avbuf_write(disp, reg, fmt->sf[i]);
>  	}
> @@ -984,23 +993,73 @@ void zynqmp_disp_layer_disable(struct zynqmp_disp_layer *layer)
>  	zynqmp_disp_blend_layer_disable(layer->disp, layer);
>  }
>  
> +struct zynqmp_disp_bus_to_drm {
> +	u32 bus_fmt;
> +	u32 drm_fmt;
> +};
> +
> +/**
> + * zynqmp_disp_reference_drm_format - Get reference DRM format corresponding
> + * to the given media bus format.
> + * @bus_format: Media bus format
> + *
> + * Map media bus format to some DRM format that represents the same color space
> + * and chroma subsampling as the @bus_format video signal. These DRM format
> + * properties are required to program the blender.
> + *
> + * Return: DRM format code corresponding to @bus_format
> + */
> +static u32 zynqmp_disp_reference_drm_format(u32 bus_format)
> +{
> +	static const struct zynqmp_disp_bus_to_drm format_map[] = {
> +		{
> +			.bus_fmt = MEDIA_BUS_FMT_RGB666_1X18,
> +			.drm_fmt = DRM_FORMAT_RGB565,
> +		}, {
> +			.bus_fmt = MEDIA_BUS_FMT_RBG888_1X24,
> +			.drm_fmt = DRM_FORMAT_RGB888,
> +		}, {
> +			.bus_fmt = MEDIA_BUS_FMT_UYVY8_1X16,
> +			.drm_fmt = DRM_FORMAT_YUV422,
> +		}, {
> +			.bus_fmt = MEDIA_BUS_FMT_VUY8_1X24,
> +			.drm_fmt = DRM_FORMAT_YUV444,
> +		}, {
> +			.bus_fmt = MEDIA_BUS_FMT_UYVY10_1X20,
> +			.drm_fmt = DRM_FORMAT_P210,
> +		},

Hmmmm... Looking at this, I think you should have both bus_fmt and
drm_fmt in zynqmp_disp_format. It seems it would simplify the code flow
and make things more readable. If you would like me to give it a try,
please let me know.

> +	};
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(format_map); ++i)
> +		if (format_map[i].bus_fmt == bus_format)
> +			return format_map[i].drm_fmt;
> +
> +	return DRM_FORMAT_INVALID;
> +}
> +
>  /**
>   * zynqmp_disp_layer_set_format - Set the layer format
>   * @layer: The layer
> - * @info: The format info
> + * @drm_or_bus_format: DRM or media bus format
>   *
>   * Set the format for @layer to @info. The layer must be disabled.
>   */
>  void zynqmp_disp_layer_set_format(struct zynqmp_disp_layer *layer,
> -				  const struct drm_format_info *info)
> +				  u32 drm_or_bus_format)
>  {
>  	unsigned int i;
>  
> -	layer->disp_fmt = zynqmp_disp_layer_find_format(layer, info->format);
> -	layer->drm_fmt = info;
> -
> +	layer->disp_fmt = zynqmp_disp_layer_find_format(layer, drm_or_bus_format);
>  	zynqmp_disp_avbuf_set_format(layer->disp, layer, layer->disp_fmt);
>  
> +	if (layer->mode == ZYNQMP_DPSUB_LAYER_LIVE)
> +		drm_or_bus_format = zynqmp_disp_reference_drm_format(drm_or_bus_format);
> +
> +	layer->drm_fmt = drm_format_info(drm_or_bus_format);
> +	if (!layer->drm_fmt)
> +		return;
> +
>  	if (layer->mode == ZYNQMP_DPSUB_LAYER_LIVE)
>  		return;
>  
> @@ -1008,7 +1067,7 @@ void zynqmp_disp_layer_set_format(struct zynqmp_disp_layer *layer,
>  	 * Set pconfig for each DMA channel to indicate they're part of a
>  	 * video group.
>  	 */
> -	for (i = 0; i < info->num_planes; i++) {
> +	for (i = 0; i < layer->drm_fmt->num_planes; i++) {
>  		struct zynqmp_disp_layer_dma *dma = &layer->dmas[i];
>  		struct xilinx_dpdma_peripheral_config pconfig = {
>  			.video_group = true,
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.h b/drivers/gpu/drm/xlnx/zynqmp_disp.h
> index 88c285a12e23..9f9a5f50ffbc 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_disp.h
> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.h
> @@ -55,7 +55,7 @@ u32 *zynqmp_disp_layer_formats(struct zynqmp_disp_layer *layer,
>  void zynqmp_disp_layer_enable(struct zynqmp_disp_layer *layer);
>  void zynqmp_disp_layer_disable(struct zynqmp_disp_layer *layer);
>  void zynqmp_disp_layer_set_format(struct zynqmp_disp_layer *layer,
> -				  const struct drm_format_info *info);
> +				  u32 drm_or_bus_format);
>  int zynqmp_disp_layer_update(struct zynqmp_disp_layer *layer,
>  			     struct drm_plane_state *state);
>  
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> index a0d169ac48c0..fc6b1d783c28 100644
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
> +	if (WARN_ON(!bridge_state))
> +		return;
> +
> +	bus_fmt = bridge_state->input_bus_cfg.format;
> +	zynqmp_disp_layer_set_format(layer, bus_fmt);
>  
> -	/* TODO: Make the format configurable. */
> -	info = drm_format_info(DRM_FORMAT_YUV422);
> -	zynqmp_disp_layer_set_format(layer, info);
>  	zynqmp_disp_layer_enable(layer);
>  
>  	if (layer_id == ZYNQMP_DPSUB_LAYER_GFX)
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c b/drivers/gpu/drm/xlnx/zynqmp_kms.c
> index bf9fba01df0e..d96b3f3f2e3a 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_kms.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
> @@ -111,7 +111,7 @@ static void zynqmp_dpsub_plane_atomic_update(struct drm_plane *plane,
>  		if (old_state->fb)
>  			zynqmp_disp_layer_disable(layer);
>  
> -		zynqmp_disp_layer_set_format(layer, new_state->fb->format);
> +		zynqmp_disp_layer_set_format(layer, new_state->fb->format->format);
>  	}
>  
>  	zynqmp_disp_layer_update(layer, new_state);
> 

-- 
Regards,

Laurent Pinchart
