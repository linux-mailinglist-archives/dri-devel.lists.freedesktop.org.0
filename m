Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13313A7412B
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 23:52:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01D5510E15D;
	Thu, 27 Mar 2025 22:52:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="N8Qs+4qJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE65B10E15D
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 22:52:35 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id BC509446;
 Thu, 27 Mar 2025 23:50:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1743115845;
 bh=04MuPzuXvPrWYZpyfrG/qxOsUxH6sKfHzhd+lnURa04=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=N8Qs+4qJ/w31JqrublP+vX9igLskTPOvYYYH0hRLBZiGDKCJFOScz1C6gSOSiEaeQ
 JOb9I7pHgSh1vhwWW+WQnWmJceRYCLwc3QPg+Fz9PYQs+SRrQ+E2PE9Kx5OqAM+U/3
 kdeWvISioZ3MswcRgNteAYnwdB50LOgAJD3v5rCs=
Date: Fri, 28 Mar 2025 00:52:09 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Vishal Sagar <vishal.sagar@amd.com>,
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Michal Simek <michal.simek@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v4 09/11] drm: xlnx: zynqmp: Add support for Y8 and Y10_P32
Message-ID: <20250327225209.GB16629@pendragon.ideasonboard.com>
References: <20250326-xilinx-formats-v4-0-322a300c6d72@ideasonboard.com>
 <20250326-xilinx-formats-v4-9-322a300c6d72@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250326-xilinx-formats-v4-9-322a300c6d72@ideasonboard.com>
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

Hi Tomi,

Thank you for the patch.

On Wed, Mar 26, 2025 at 03:22:52PM +0200, Tomi Valkeinen wrote:
> Add support for Y8 and Y10_P32 formats. We also need to add new csc
> matrices for the y-only formats.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/gpu/drm/xlnx/zynqmp_disp.c | 26 +++++++++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> index 1dc77f2e4262..ae8b4073edf6 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> @@ -307,6 +307,16 @@ static const struct zynqmp_disp_format avbuf_vid_fmts[] = {
>  		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YV16CI_10,
>  		.swap		= false,
>  		.sf		= scaling_factors_101010,
> +	}, {
> +		.drm_fmt	= DRM_FORMAT_Y8,
> +		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_MONO,
> +		.swap		= false,
> +		.sf		= scaling_factors_888,
> +	}, {
> +		.drm_fmt	= DRM_FORMAT_Y10_P32,
> +		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YONLY_10,
> +		.swap		= false,
> +		.sf		= scaling_factors_101010,

Assuming the DRM format definitions get approved, this looks good to me.

>  	},
>  };
>  
> @@ -697,6 +707,16 @@ static const u32 csc_sdtv_to_rgb_offsets[] = {
>  	0x0, 0x1800, 0x1800
>  };
>  
> +static const u16 csc_sdtv_to_rgb_yonly_matrix[] = {

TODO: Add support for colorspaces to the driver.

> +	0x0, 0x0, 0x1000,
> +	0x0, 0x0, 0x1000,
> +	0x0, 0x0, 0x1000,

This surprises me a bit, I was expecting 0x1000 to be in the first
column. What am I missing ?

> +};
> +
> +static const u32 csc_sdtv_to_rgb_yonly_offsets[] = {
> +	0x1800, 0x1800, 0x0

Why do you need offsets ? Those values correspond to -128 in a 8-bit
range, and that's what would need to be applied to the chroma values.
There's no chroma here. I think you could use csc_zero_offsets.

> +};
> +
>  /**
>   * zynqmp_disp_blend_set_output_format - Set the output format of the blender
>   * @disp: Display controller
> @@ -846,7 +866,11 @@ static void zynqmp_disp_blend_layer_enable(struct zynqmp_disp *disp,
>  				ZYNQMP_DISP_V_BLEND_LAYER_CONTROL(layer->id),
>  				val);
>  
> -	if (layer->drm_fmt->is_yuv) {
> +	if (layer->drm_fmt->format == DRM_FORMAT_Y8 ||
> +	    layer->drm_fmt->format == DRM_FORMAT_Y10_P32) {
> +		coeffs = csc_sdtv_to_rgb_yonly_matrix;
> +		offsets = csc_sdtv_to_rgb_yonly_offsets;
> +	} else if (layer->drm_fmt->is_yuv) {
>  		coeffs = csc_sdtv_to_rgb_matrix;
>  		offsets = csc_sdtv_to_rgb_offsets;
>  	} else {

-- 
Regards,

Laurent Pinchart
