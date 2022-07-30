Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BB1585C87
	for <lists+dri-devel@lfdr.de>; Sun, 31 Jul 2022 00:36:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35ACD10E298;
	Sat, 30 Jul 2022 22:36:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ABA810E72F
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Jul 2022 22:36:45 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1AA69415;
 Sun, 31 Jul 2022 00:36:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1659220603;
 bh=14Tzs1PO+Qt1tNZVsm22hOzJ4ymMQ1fyMrdYUuh37Uw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=loZyF05QD4JpJWUBuUWIn8M5asGlPEy6V0U3zYwLNxVMcfRUNLoEct0bMk6j1T4+R
 5559wv/Pz1BQwklMpeully0WLBDe6RH174DwpspVE1mxZMHI2u8azt0vGNYp1HkRgh
 DAtNQ+hKEkR6mqX0J6gZzN7FF3TogFpRdOHLBt9U=
Date: Sun, 31 Jul 2022 01:36:39 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Takanari Hayama <taki@igel.co.jp>
Subject: Re: [PATCH 2/3] media: vsp1: add blend mode support
Message-ID: <YuWyd2YGLx1J5vPW@pendragon.ideasonboard.com>
References: <20220704025231.3911138-1-taki@igel.co.jp>
 <20220704025231.3911138-3-taki@igel.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220704025231.3911138-3-taki@igel.co.jp>
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
Cc: linux-renesas-soc@vger.kernel.org, kieran.bingham+renesas@ideasonboard.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Hayama-san,

Thank you for the patch.

On Mon, Jul 04, 2022 at 11:52:30AM +0900, Takanari Hayama wrote:
> To support DRM blend mode in R-Car DU driver, we must add blend mode
> support in VSP1. Although VSP1 hardware is capable to support all blend
> mode defined in DRM, the current R-Car DU driver implicitly supports
> DRM_MODE_BLEND_COVERAGE only.
> 
> We add a new property to vsp1_du_atomic_config, so that R-Car DU driver
> can pass the desired blend mode.
> 
> Signed-off-by: Takanari Hayama <taki@igel.co.jp>
> ---
>  drivers/media/platform/renesas/vsp1/vsp1_drm.c | 11 +++++++++++
>  include/media/vsp1.h                           | 14 ++++++++++++++
>  2 files changed, 25 insertions(+)
> 
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drm.c b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> index 9ec3ac835987..ed0cf552fce2 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> @@ -861,6 +861,17 @@ int vsp1_du_atomic_update(struct device *dev, unsigned int pipe_index,
>  	vsp1->drm->inputs[rpf_index].compose = cfg->dst;
>  	vsp1->drm->inputs[rpf_index].zpos = cfg->zpos;
>  
> +	switch (cfg->blend_mode) {
> +	case VSP1_DU_BLEND_MODE_PREMULTI:
> +		rpf->format.flags = V4L2_PIX_FMT_FLAG_PREMUL_ALPHA;
> +		break;
> +	case VSP1_DU_BLEND_MODE_PIXEL_NONE:
> +		rpf->pixel_alpha = false;
> +		fallthrough;
> +	case VSP1_DU_BLEND_MODE_COVERAGE:
> +		rpf->format.flags = 0;
> +	}

This should work, but wouldn't it be simpler to override the format
passed in cfg->pixelformat in rcar_du_vsp_plane_setup() with the
non-alpha variant when state->state.pixel_blend_mode is set to
DRM_MODE_BLEND_PIXEL_NONE ? That way you could drop rpf->pixel_alpha,
turn cfg->blend_mode into a premult bool flag, and drop the
vsp1_du_blend_mode enum. There's only three formats with an alpha
channel that the rcar-du driver supports (DRM_FORMAT_ARGB4444,
DRM_FORMAT_ARGB1555 and DRM_FORMAT_ARGB8888), so the override could be
as simple as a switch (state->format->fourcc) when the blend mode is
NONE.

> +
>  	drm_pipe->pipe.inputs[rpf_index] = rpf;
>  
>  	return 0;
> diff --git a/include/media/vsp1.h b/include/media/vsp1.h
> index cc1b0d42ce95..1ba7459b7a06 100644
> --- a/include/media/vsp1.h
> +++ b/include/media/vsp1.h
> @@ -42,6 +42,18 @@ struct vsp1_du_lif_config {
>  int vsp1_du_setup_lif(struct device *dev, unsigned int pipe_index,
>  		      const struct vsp1_du_lif_config *cfg);
>  
> +/**
> + * enum vsp1_du_blend_mode - Pixel blend mode
> + * @VSP1_DU_BLEND_MODE_PREMULTI: Pixel alpha is pre-mutiplied
> + * @VSP1_DU_BLEND_MODE_COVERAGE: Pixel alpha is not pre-mutiplied
> + * @VSP1_DU_BLEND_MODE_PIXEL_NONE: Ignores the pixel alpha
> + */
> +enum vsp1_du_blend_mode {
> +	VSP1_DU_BLEND_MODE_PREMULTI,
> +	VSP1_DU_BLEND_MODE_COVERAGE,
> +	VSP1_DU_BLEND_MODE_PIXEL_NONE,
> +};
> +
>  /**
>   * struct vsp1_du_atomic_config - VSP atomic configuration parameters
>   * @pixelformat: plane pixel format (V4L2 4CC)
> @@ -51,6 +63,7 @@ int vsp1_du_setup_lif(struct device *dev, unsigned int pipe_index,
>   * @dst: destination rectangle on the display (integer coordinates)
>   * @alpha: alpha value (0: fully transparent, 255: fully opaque)
>   * @zpos: Z position of the plane (from 0 to number of planes minus 1)
> + * @blend_mode: Pixel blend mode of the plane
>   */
>  struct vsp1_du_atomic_config {
>  	u32 pixelformat;
> @@ -60,6 +73,7 @@ struct vsp1_du_atomic_config {
>  	struct v4l2_rect dst;
>  	unsigned int alpha;
>  	unsigned int zpos;
> +	enum vsp1_du_blend_mode blend_mode;
>  };
>  
>  /**

-- 
Regards,

Laurent Pinchart
