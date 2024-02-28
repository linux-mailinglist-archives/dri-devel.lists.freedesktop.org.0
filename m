Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CBD86B3E6
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 16:58:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D993310E2D1;
	Wed, 28 Feb 2024 15:58:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UF7UvFrx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4F2010E2D1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 15:58:04 +0000 (UTC)
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi
 [89.27.53.110])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 915352B3;
 Wed, 28 Feb 2024 16:57:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1709135869;
 bh=SRubJFHQOytdTSbyaFMIxMPHS15HDeDucEiwQ0OgxMs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UF7UvFrxtYQtU2yrfbTWPNSBywHTGlZaz0D+XwjOv3MvseL/2MhW3hNANkO/kzHc/
 B5GCkPjbBIqm423DoMFNR8+DotwT++C2Uug17Vqa40QpjUYxWM/kRqYJ14aIX9zGcx
 77G/0U1fv1MCJqeOIlDvsTxM+TqnXQtLgWgQY4h8=
Date: Wed, 28 Feb 2024 17:58:03 +0200
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
Subject: Re: [PATCH 2/4] drm: xlnx: zynqmp_dpsub: Anounce supported input
 formats
Message-ID: <20240228155803.GC9863@pendragon.ideasonboard.com>
References: <20240226-dp-live-fmt-v1-0-b78c3f69c9d8@amd.com>
 <20240226-dp-live-fmt-v1-2-b78c3f69c9d8@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240226-dp-live-fmt-v1-2-b78c3f69c9d8@amd.com>
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

On Mon, Feb 26, 2024 at 08:44:43PM -0800, Anatoliy Klymenko wrote:
> DPSUB in bridge mode supports multiple input media bus formats.
> 
> Announce the list of supported input media bus formats via
> drm_bridge.atomic_get_input_bus_fmts callback.
> 
> Signed-off-by: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
> ---
>  drivers/gpu/drm/xlnx/zynqmp_disp.c | 37 +++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xlnx/zynqmp_disp.h | 10 ++++++++++
>  drivers/gpu/drm/xlnx/zynqmp_dp.c   |  1 +
>  3 files changed, 48 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> index e6d26ef60e89..ee99aad915ba 100644
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
> @@ -77,12 +78,14 @@ enum zynqmp_dpsub_layer_mode {
>  /**
>   * struct zynqmp_disp_format - Display subsystem format information
>   * @drm_fmt: DRM format (4CC)
> + * @bus_fmt: Media bus format
>   * @buf_fmt: AV buffer format
>   * @swap: Flag to swap R & B for RGB formats, and U & V for YUV formats
>   * @sf: Scaling factors for color components
>   */
>  struct zynqmp_disp_format {
>  	u32 drm_fmt;
> +	u32 bus_fmt;
>  	u32 buf_fmt;
>  	bool swap;
>  	const u32 *sf;
> @@ -364,6 +367,40 @@ static const struct zynqmp_disp_format avbuf_gfx_fmts[] = {
>  	},
>  };
>  
> +/* List of live video layer formats */
> +static const struct zynqmp_disp_format avbuf_live_fmts[] = {
> +	{
> +		.drm_fmt	= DRM_FORMAT_VYUY,
> +		.bus_fmt	= MEDIA_BUS_FMT_VYUY8_1X16,
> +		.buf_fmt	= ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_BPC_8 |
> +				  ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_YUV422,
> +		.sf		= scaling_factors_888,

Is there a reason to have a separate array, instead of populating
.bus_fmt in the existing arrays for the formats that can be supported
with the live input, and only reporting those from
zynqmp_disp_get_input_bus_fmts() ?

> +	},
> +};
> +
> +u32 *zynqmp_disp_get_input_bus_fmts(struct drm_bridge *bridge,
> +				    struct drm_bridge_state *bridge_state,
> +				    struct drm_crtc_state *crtc_state,
> +				    struct drm_connector_state *conn_state,
> +				    u32 output_fmt,
> +				    unsigned int *num_input_fmts)
> +{
> +	int i;
> +	u32 *input_fmts;
> +
> +	input_fmts = kcalloc(ARRAY_SIZE(avbuf_live_fmts), sizeof(*input_fmts), GFP_KERNEL);
> +	if (!input_fmts) {
> +		*num_input_fmts = 0;
> +		return input_fmts;
> +	}
> +
> +	for (i = 0; i < ARRAY_SIZE(avbuf_live_fmts); ++i)
> +		input_fmts[i] =  avbuf_live_fmts[i].bus_fmt;

Extra space.

> +	*num_input_fmts = ARRAY_SIZE(avbuf_live_fmts);
> +
> +	return input_fmts;
> +}
> +
>  static u32 zynqmp_disp_avbuf_read(struct zynqmp_disp *disp, int reg)
>  {
>  	return readl(disp->avbuf.base + reg);
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.h b/drivers/gpu/drm/xlnx/zynqmp_disp.h
> index 9b8b202224d9..c2c8dd4896ba 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_disp.h
> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.h
> @@ -27,6 +27,10 @@
>  struct device;
>  struct drm_format_info;
>  struct drm_plane_state;
> +struct drm_bridge;
> +struct drm_bridge_state;
> +struct drm_connector_state;
> +struct drm_crtc_state;
>  struct platform_device;
>  struct zynqmp_disp;
>  struct zynqmp_disp_layer;
> @@ -52,6 +56,12 @@ void zynqmp_disp_blend_set_global_alpha(struct zynqmp_disp *disp,
>  
>  u32 *zynqmp_disp_layer_drm_formats(struct zynqmp_disp_layer *layer,
>  				   unsigned int *num_formats);
> +u32 *zynqmp_disp_get_input_bus_fmts(struct drm_bridge *bridge,
> +				    struct drm_bridge_state *bridge_state,
> +				    struct drm_crtc_state *crtc_state,
> +				    struct drm_connector_state *conn_state,
> +				    u32 output_fmt,
> +				    unsigned int *num_input_fmts);

As this is a bridge operation, I think it would be better located in
zynqmp_dp.c. You can possibly expose the avbuf_live_fmts array in
zynqmp_disp.h, but that's not really nice as you'll be missing the size.
Another option would be to split the function in two, with the part that
handles the bridge API implemented in zynqmp_dp.c, and the part that
accesses the formats array in zynqmp_disp.c.

>  void zynqmp_disp_layer_enable(struct zynqmp_disp_layer *layer);
>  void zynqmp_disp_layer_disable(struct zynqmp_disp_layer *layer);
>  void zynqmp_disp_layer_set_format(struct zynqmp_disp_layer *layer,
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> index 04b6bcac3b07..9cb7ac9f3097 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> @@ -1580,6 +1580,7 @@ static const struct drm_bridge_funcs zynqmp_dp_bridge_funcs = {
>  	.atomic_check = zynqmp_dp_bridge_atomic_check,
>  	.detect = zynqmp_dp_bridge_detect,
>  	.edid_read = zynqmp_dp_bridge_edid_read,
> +	.atomic_get_input_bus_fmts = zynqmp_disp_get_input_bus_fmts,
>  };
>  
>  /* -----------------------------------------------------------------------------

-- 
Regards,

Laurent Pinchart
