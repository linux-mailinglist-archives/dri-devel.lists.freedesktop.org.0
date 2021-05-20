Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B2038A230
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 11:37:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 621EA6F39E;
	Thu, 20 May 2021 09:37:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F19B6F39E
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 09:37:30 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 71D99D41;
 Thu, 20 May 2021 11:37:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1621503448;
 bh=ofkOpfVLFznF+KtbJtdCz73RuV3QvyPcnQb202PcaVM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oWtq2QhRuQSBvfoBh5V0HRAVS+2uxxGLQ8gnzRuIS+2AVj5wWR5HsgeWuKSSaXu0b
 Sdy5gxiD7KSo30azER9jpcieLeUKEJcb7FT/pPJwNwJVVRa4ZKDSrPafY7DwxAQ/UC
 UYKBBldX3srUuB3+ixNF27UwiR8FQRlDA3x8jkQY=
Date: Thu, 20 May 2021 12:37:26 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: quanyang.wang@windriver.com
Subject: Re: [V2][PATCH 1/2] drm: xlnx: add is_layer_vid() to simplify the code
Message-ID: <YKYt1h54NbZrVe02@pendragon.ideasonboard.com>
References: <20210518095019.3855369-1-quanyang.wang@windriver.com>
 <20210518095019.3855369-2-quanyang.wang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210518095019.3855369-2-quanyang.wang@windriver.com>
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
Cc: Hyun Kwon <hyun.kwon@xilinx.com>, David Airlie <airlied@linux.ie>,
 Michal Simek <michal.simek@xilinx.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Quanyang,

Thank you for the patch.

On Tue, May 18, 2021 at 05:50:18PM +0800, quanyang.wang@windriver.com wrote:
> From: Quanyang Wang <quanyang.wang@windriver.com>
> 
> Add a new function is_layer_vid() to simplify the code that
> judges if a layer is the video layer.

I like this, and especially passing the layer pointer to functions
instead of the layer ID. I'm however wondering is we shouldn't name the
function xlnx_zynqmp_disp_layer_is_video(), for consistency. If that's
fine with you I can make the change when applying the patch to my tree,
there's no need to submit a new version.

> Acked-by: Paul Cercueil <paul@crapouillou.net>
> Signed-off-by: Quanyang Wang <quanyang.wang@windriver.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/xlnx/zynqmp_disp.c | 39 +++++++++++++++++-------------
>  1 file changed, 22 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> index 109d627968ac..eefb278e24c6 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> @@ -434,30 +434,35 @@ static void zynqmp_disp_avbuf_write(struct zynqmp_disp_avbuf *avbuf,
>  	writel(val, avbuf->base + reg);
>  }
>  
> +static bool is_layer_vid(const struct zynqmp_disp_layer *layer)
> +{
> +	return layer->id == ZYNQMP_DISP_LAYER_VID;
> +}
> +
>  /**
>   * zynqmp_disp_avbuf_set_format - Set the input format for a layer
>   * @avbuf: Audio/video buffer manager
> - * @layer: The layer ID
> + * @layer: The layer
>   * @fmt: The format information
>   *
>   * Set the video buffer manager format for @layer to @fmt.
>   */
>  static void zynqmp_disp_avbuf_set_format(struct zynqmp_disp_avbuf *avbuf,
> -					 enum zynqmp_disp_layer_id layer,
> +					 struct zynqmp_disp_layer *layer,
>  					 const struct zynqmp_disp_format *fmt)
>  {
>  	unsigned int i;
>  	u32 val;
>  
>  	val = zynqmp_disp_avbuf_read(avbuf, ZYNQMP_DISP_AV_BUF_FMT);
> -	val &= layer == ZYNQMP_DISP_LAYER_VID
> +	val &= is_layer_vid(layer)
>  	    ? ~ZYNQMP_DISP_AV_BUF_FMT_NL_VID_MASK
>  	    : ~ZYNQMP_DISP_AV_BUF_FMT_NL_GFX_MASK;
>  	val |= fmt->buf_fmt;
>  	zynqmp_disp_avbuf_write(avbuf, ZYNQMP_DISP_AV_BUF_FMT, val);
>  
>  	for (i = 0; i < ZYNQMP_DISP_AV_BUF_NUM_SF; i++) {
> -		unsigned int reg = layer == ZYNQMP_DISP_LAYER_VID
> +		unsigned int reg = is_layer_vid(layer)
>  				 ? ZYNQMP_DISP_AV_BUF_VID_COMP_SF(i)
>  				 : ZYNQMP_DISP_AV_BUF_GFX_COMP_SF(i);
>  
> @@ -573,19 +578,19 @@ static void zynqmp_disp_avbuf_disable_audio(struct zynqmp_disp_avbuf *avbuf)
>  /**
>   * zynqmp_disp_avbuf_enable_video - Enable a video layer
>   * @avbuf: Audio/video buffer manager
> - * @layer: The layer ID
> + * @layer: The layer
>   * @mode: Operating mode of layer
>   *
>   * Enable the video/graphics buffer for @layer.
>   */
>  static void zynqmp_disp_avbuf_enable_video(struct zynqmp_disp_avbuf *avbuf,
> -					   enum zynqmp_disp_layer_id layer,
> +					   struct zynqmp_disp_layer *layer,
>  					   enum zynqmp_disp_layer_mode mode)
>  {
>  	u32 val;
>  
>  	val = zynqmp_disp_avbuf_read(avbuf, ZYNQMP_DISP_AV_BUF_OUTPUT);
> -	if (layer == ZYNQMP_DISP_LAYER_VID) {
> +	if (is_layer_vid(layer)) {
>  		val &= ~ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_MASK;
>  		if (mode == ZYNQMP_DISP_LAYER_NONLIVE)
>  			val |= ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_MEM;
> @@ -605,17 +610,17 @@ static void zynqmp_disp_avbuf_enable_video(struct zynqmp_disp_avbuf *avbuf,
>  /**
>   * zynqmp_disp_avbuf_disable_video - Disable a video layer
>   * @avbuf: Audio/video buffer manager
> - * @layer: The layer ID
> + * @layer: The layer
>   *
>   * Disable the video/graphics buffer for @layer.
>   */
>  static void zynqmp_disp_avbuf_disable_video(struct zynqmp_disp_avbuf *avbuf,
> -					    enum zynqmp_disp_layer_id layer)
> +					    struct zynqmp_disp_layer *layer)
>  {
>  	u32 val;
>  
>  	val = zynqmp_disp_avbuf_read(avbuf, ZYNQMP_DISP_AV_BUF_OUTPUT);
> -	if (layer == ZYNQMP_DISP_LAYER_VID) {
> +	if (is_layer_vid(layer)) {
>  		val &= ~ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_MASK;
>  		val |= ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_NONE;
>  	} else {
> @@ -807,7 +812,7 @@ static void zynqmp_disp_blend_layer_set_csc(struct zynqmp_disp_blend *blend,
>  		}
>  	}
>  
> -	if (layer->id == ZYNQMP_DISP_LAYER_VID)
> +	if (is_layer_vid(layer))
>  		reg = ZYNQMP_DISP_V_BLEND_IN1CSC_COEFF(0);
>  	else
>  		reg = ZYNQMP_DISP_V_BLEND_IN2CSC_COEFF(0);
> @@ -818,7 +823,7 @@ static void zynqmp_disp_blend_layer_set_csc(struct zynqmp_disp_blend *blend,
>  		zynqmp_disp_blend_write(blend, reg + 8, coeffs[i + swap[2]]);
>  	}
>  
> -	if (layer->id == ZYNQMP_DISP_LAYER_VID)
> +	if (is_layer_vid(layer))
>  		reg = ZYNQMP_DISP_V_BLEND_IN1CSC_OFFSET(0);
>  	else
>  		reg = ZYNQMP_DISP_V_BLEND_IN2CSC_OFFSET(0);
> @@ -1025,7 +1030,7 @@ zynqmp_disp_layer_find_format(struct zynqmp_disp_layer *layer,
>   */
>  static void zynqmp_disp_layer_enable(struct zynqmp_disp_layer *layer)
>  {
> -	zynqmp_disp_avbuf_enable_video(&layer->disp->avbuf, layer->id,
> +	zynqmp_disp_avbuf_enable_video(&layer->disp->avbuf, layer,
>  				       ZYNQMP_DISP_LAYER_NONLIVE);
>  	zynqmp_disp_blend_layer_enable(&layer->disp->blend, layer);
>  
> @@ -1046,7 +1051,7 @@ static void zynqmp_disp_layer_disable(struct zynqmp_disp_layer *layer)
>  	for (i = 0; i < layer->drm_fmt->num_planes; i++)
>  		dmaengine_terminate_sync(layer->dmas[i].chan);
>  
> -	zynqmp_disp_avbuf_disable_video(&layer->disp->avbuf, layer->id);
> +	zynqmp_disp_avbuf_disable_video(&layer->disp->avbuf, layer);
>  	zynqmp_disp_blend_layer_disable(&layer->disp->blend, layer);
>  }
>  
> @@ -1067,7 +1072,7 @@ static void zynqmp_disp_layer_set_format(struct zynqmp_disp_layer *layer,
>  	layer->disp_fmt = zynqmp_disp_layer_find_format(layer, info->format);
>  	layer->drm_fmt = info;
>  
> -	zynqmp_disp_avbuf_set_format(&layer->disp->avbuf, layer->id,
> +	zynqmp_disp_avbuf_set_format(&layer->disp->avbuf, layer,
>  				     layer->disp_fmt);
>  
>  	/*
> @@ -1244,8 +1249,8 @@ static int zynqmp_disp_create_planes(struct zynqmp_disp *disp)
>  			drm_formats[j] = layer->info->formats[j].drm_fmt;
>  
>  		/* Graphics layer is primary, and video layer is overlay. */
> -		type = i == ZYNQMP_DISP_LAYER_GFX
> -		     ? DRM_PLANE_TYPE_PRIMARY : DRM_PLANE_TYPE_OVERLAY;
> +		type = is_layer_vid(layer)
> +		     ? DRM_PLANE_TYPE_OVERLAY : DRM_PLANE_TYPE_PRIMARY;
>  		ret = drm_universal_plane_init(disp->drm, &layer->plane, 0,
>  					       &zynqmp_disp_plane_funcs,
>  					       drm_formats,

-- 
Regards,

Laurent Pinchart
