Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7726E87F458
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 01:05:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B41F10F1E3;
	Tue, 19 Mar 2024 00:05:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Z3zl3nbp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26C5B10F1E3
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 00:05:04 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 730F0480;
 Tue, 19 Mar 2024 01:04:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1710806676;
 bh=qUH+g0HruDEXB3YbYdk5MPO634/Ais9TzewOfl8eAFI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Z3zl3nbpBuIjWC7upKjiBFujOL3nIfU43/iXfgDl8B/qFWxahSarqHuPFyqKEvG5y
 8p2wAMa7C0j3sPZ6wl0qG8Ne3A4cnlYd7wIQrpEsCH74lEUx+Qz1/m2mwhKtlhizS4
 Ita7Df/heP/ubrS3UpTcviglMV/F8eAWR+pZL6KE=
Date: Tue, 19 Mar 2024 02:05:00 +0200
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
Subject: Re: [PATCH v2 3/8] drm: xlnx: zynqmp_dpsub: Anounce supported input
 formats
Message-ID: <20240319000500.GU13682@pendragon.ideasonboard.com>
References: <20240312-dp-live-fmt-v2-0-a9c35dc5c50d@amd.com>
 <20240312-dp-live-fmt-v2-3-a9c35dc5c50d@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240312-dp-live-fmt-v2-3-a9c35dc5c50d@amd.com>
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

On Tue, Mar 12, 2024 at 05:55:00PM -0700, Anatoliy Klymenko wrote:
> DPSUB in bridge mode supports multiple input media bus formats.
> 
> Announce the list of supported input media bus formats via
> drm_bridge.atomic_get_input_bus_fmts callback.
> Introduce a set of live input formats, supported by DPSUB.
> Rename zynqmp_disp_layer_drm_formats() to zynqmp_disp_layer_formats() to
> reflect semantics for both live and non-live layer format lists.
> 
> Signed-off-by: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
> ---
>  drivers/gpu/drm/xlnx/zynqmp_disp.c | 67 +++++++++++++++++++++++++++++++++-----
>  drivers/gpu/drm/xlnx/zynqmp_disp.h |  4 +--
>  drivers/gpu/drm/xlnx/zynqmp_dp.c   | 26 +++++++++++++++
>  drivers/gpu/drm/xlnx/zynqmp_kms.c  |  2 +-
>  4 files changed, 88 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> index e6d26ef60e89..af851190f447 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> @@ -18,6 +18,7 @@
>  #include <linux/dma/xilinx_dpdma.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/dmaengine.h>
> +#include <linux/media-bus-format.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
> @@ -77,12 +78,16 @@ enum zynqmp_dpsub_layer_mode {
>  /**
>   * struct zynqmp_disp_format - Display subsystem format information
>   * @drm_fmt: DRM format (4CC)
> + * @bus_fmt: Media bus format
>   * @buf_fmt: AV buffer format
>   * @swap: Flag to swap R & B for RGB formats, and U & V for YUV formats
>   * @sf: Scaling factors for color components
>   */
>  struct zynqmp_disp_format {
> -	u32 drm_fmt;
> +	union {
> +		u32 drm_fmt;
> +		u32 bus_fmt;
> +	};

I'm not a big fan of the union, but I can live with it.

>  	u32 buf_fmt;
>  	bool swap;
>  	const u32 *sf;
> @@ -182,6 +187,12 @@ static const u32 scaling_factors_565[] = {
>  	ZYNQMP_DISP_AV_BUF_5BIT_SF,
>  };
>  
> +static const u32 scaling_factors_666[] = {
> +	ZYNQMP_DISP_AV_BUF_6BIT_SF,
> +	ZYNQMP_DISP_AV_BUF_6BIT_SF,
> +	ZYNQMP_DISP_AV_BUF_6BIT_SF,
> +};
> +
>  static const u32 scaling_factors_888[] = {
>  	ZYNQMP_DISP_AV_BUF_8BIT_SF,
>  	ZYNQMP_DISP_AV_BUF_8BIT_SF,
> @@ -364,6 +375,36 @@ static const struct zynqmp_disp_format avbuf_gfx_fmts[] = {
>  	},
>  };
>  
> +/* List of live video layer formats */
> +static const struct zynqmp_disp_format avbuf_live_fmts[] = {
> +	{
> +		.bus_fmt	= MEDIA_BUS_FMT_RGB666_1X18,
> +		.buf_fmt	= ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_BPC_6 |
> +				  ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_RGB,
> +		.sf		= scaling_factors_666,
> +	}, {
> +		.bus_fmt	= MEDIA_BUS_FMT_UYVY8_1X24,
> +		.buf_fmt	= ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_BPC_8 |
> +				  ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_RGB,
> +		.sf		= scaling_factors_888,
> +	}, {
> +		.bus_fmt	= MEDIA_BUS_FMT_UYVY8_1X16,
> +		.buf_fmt	= ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_BPC_8 |
> +				  ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_YUV422,
> +		.sf		= scaling_factors_888,
> +	}, {
> +		.bus_fmt	= MEDIA_BUS_FMT_VUY8_1X24,
> +		.buf_fmt	= ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_BPC_8 |
> +				  ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_YUV444,
> +		.sf		= scaling_factors_888,
> +	}, {
> +		.bus_fmt	= MEDIA_BUS_FMT_UYVY10_1X20,
> +		.buf_fmt	= ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_BPC_10 |
> +				  ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_YUV422,
> +		.sf		= scaling_factors_101010,
> +	},
> +};
> +
>  static u32 zynqmp_disp_avbuf_read(struct zynqmp_disp *disp, int reg)
>  {
>  	return readl(disp->avbuf.base + reg);
> @@ -883,16 +924,17 @@ zynqmp_disp_layer_find_format(struct zynqmp_disp_layer *layer,
>  }
>  
>  /**
> - * zynqmp_disp_layer_drm_formats - Return the DRM formats supported by the layer
> + * zynqmp_disp_layer_formats - Return DRM or media bus formats supported by
> + * the layer
>   * @layer: The layer
>   * @num_formats: Pointer to the returned number of formats
>   *
> - * Return: A newly allocated u32 array that stores all the DRM formats
> + * Return: A newly allocated u32 array that stores all DRM or media bus formats
>   * supported by the layer. The number of formats in the array is returned
>   * through the num_formats argument.
>   */
> -u32 *zynqmp_disp_layer_drm_formats(struct zynqmp_disp_layer *layer,
> -				   unsigned int *num_formats)
> +u32 *zynqmp_disp_layer_formats(struct zynqmp_disp_layer *layer,
> +			       unsigned int *num_formats)
>  {
>  	unsigned int i;
>  	u32 *formats;
> @@ -1131,6 +1173,11 @@ static int zynqmp_disp_create_layers(struct zynqmp_disp *disp)
>  			.num_channels = 1,
>  		},
>  	};
> +	static const struct zynqmp_disp_layer_info live_layer_info = {
> +		.formats = avbuf_live_fmts,
> +		.num_formats = ARRAY_SIZE(avbuf_live_fmts),
> +		.num_channels = 0,
> +	};
>  
>  	unsigned int i;
>  	int ret;
> @@ -1140,12 +1187,16 @@ static int zynqmp_disp_create_layers(struct zynqmp_disp *disp)
>  
>  		layer->id = i;
>  		layer->disp = disp;
> -		layer->info = &layer_info[i];
>  		/* For now assume dpsub works in either live or non-live mode for both layers.

While are it, could you please turn this into

  		/*
		 * For now assume dpsub works in either live or non-live mode for both layers.

with a blank line just above it ?

>  		 * Hybrid mode is not supported yet.
>  		 */
> -		layer->mode = disp->dpsub->dma_enabled ? ZYNQMP_DPSUB_LAYER_NONLIVE
> -						       : ZYNQMP_DPSUB_LAYER_LIVE;
> +		if (disp->dpsub->dma_enabled) {
> +			layer->mode = ZYNQMP_DPSUB_LAYER_NONLIVE;
> +			layer->info = &layer_info[i];
> +		} else {
> +			layer->mode = ZYNQMP_DPSUB_LAYER_LIVE;
> +			layer->info = &live_layer_info;
> +		}
>  
>  		ret = zynqmp_disp_layer_request_dma(disp, layer);
>  		if (ret)
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.h b/drivers/gpu/drm/xlnx/zynqmp_disp.h
> index 9b8b202224d9..88c285a12e23 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_disp.h
> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.h
> @@ -50,8 +50,8 @@ int zynqmp_disp_setup_clock(struct zynqmp_disp *disp,
>  void zynqmp_disp_blend_set_global_alpha(struct zynqmp_disp *disp,
>  					bool enable, u32 alpha);
>  
> -u32 *zynqmp_disp_layer_drm_formats(struct zynqmp_disp_layer *layer,
> -				   unsigned int *num_formats);
> +u32 *zynqmp_disp_layer_formats(struct zynqmp_disp_layer *layer,
> +			       unsigned int *num_formats);
>  void zynqmp_disp_layer_enable(struct zynqmp_disp_layer *layer);
>  void zynqmp_disp_layer_disable(struct zynqmp_disp_layer *layer);
>  void zynqmp_disp_layer_set_format(struct zynqmp_disp_layer *layer,
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> index 04b6bcac3b07..a0d169ac48c0 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> @@ -1568,6 +1568,31 @@ static const struct drm_edid *zynqmp_dp_bridge_edid_read(struct drm_bridge *brid
>  	return drm_edid_read_ddc(connector, &dp->aux.ddc);
>  }
>  
> +static u32 *
> +zynqmp_dp_bridge_get_input_bus_fmts(struct drm_bridge *bridge,
> +				    struct drm_bridge_state *bridge_state,
> +				    struct drm_crtc_state *crtc_state,
> +				    struct drm_connector_state *conn_state,
> +				    u32 output_fmt,
> +				    unsigned int *num_input_fmts)
> +{
> +	struct zynqmp_dp *dp = bridge_to_dp(bridge);
> +	struct zynqmp_disp_layer *layer;
> +	enum zynqmp_dpsub_layer_id layer_id;
> +
> +	if (dp->dpsub->connected_ports & BIT(ZYNQMP_DPSUB_PORT_LIVE_VIDEO))
> +		layer_id = ZYNQMP_DPSUB_LAYER_VID;
> +	else if (dp->dpsub->connected_ports & BIT(ZYNQMP_DPSUB_PORT_LIVE_GFX))
> +		layer_id = ZYNQMP_DPSUB_LAYER_GFX;
> +	else {
> +		*num_input_fmts = 0;
> +		return NULL;
> +	}

You need curly braces around all branches if one of them has multiple
statements.

Given that the above pattern is repeated twice already, a helper
function that returns the layer pointer would be useful. Then you could
simply write

	layer = ...(dp);
	if (!layer) {
		*num_input_fmts = 0;
		return NULL;
	}

With these small issues addressed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +	layer = dp->dpsub->layers[layer_id];
> +
> +	return zynqmp_disp_layer_formats(layer, num_input_fmts);
> +}
> +
>  static const struct drm_bridge_funcs zynqmp_dp_bridge_funcs = {
>  	.attach = zynqmp_dp_bridge_attach,
>  	.detach = zynqmp_dp_bridge_detach,
> @@ -1580,6 +1605,7 @@ static const struct drm_bridge_funcs zynqmp_dp_bridge_funcs = {
>  	.atomic_check = zynqmp_dp_bridge_atomic_check,
>  	.detect = zynqmp_dp_bridge_detect,
>  	.edid_read = zynqmp_dp_bridge_edid_read,
> +	.atomic_get_input_bus_fmts = zynqmp_dp_bridge_get_input_bus_fmts,
>  };
>  
>  /* -----------------------------------------------------------------------------
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c b/drivers/gpu/drm/xlnx/zynqmp_kms.c
> index 43bf416b33d5..bf9fba01df0e 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_kms.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
> @@ -152,7 +152,7 @@ static int zynqmp_dpsub_create_planes(struct zynqmp_dpsub *dpsub)
>  		unsigned int num_formats;
>  		u32 *formats;
>  
> -		formats = zynqmp_disp_layer_drm_formats(layer, &num_formats);
> +		formats = zynqmp_disp_layer_formats(layer, &num_formats);
>  		if (!formats)
>  			return -ENOMEM;
>  
> 

-- 
Regards,

Laurent Pinchart
