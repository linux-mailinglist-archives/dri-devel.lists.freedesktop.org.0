Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DBE76F641
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 01:47:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA28F10E11F;
	Thu,  3 Aug 2023 23:47:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC8F810E11F
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 23:46:58 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9C8A8600;
 Fri,  4 Aug 2023 01:45:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1691106352;
 bh=LARjasZKXZft1eWgt1tSbyHUhnPtYt7pNqPHGzxGghM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PYpxz9vJtP5aDkBKL4REcLWam5NVsJMvouKgtZRJUsKBQyM9ek0jey42AQA9hczZB
 WsMnLFx+44a7DfA4rVBPLWAlaR5eUDutNN7Jv50eRs6YoD4UqVcvHgQInyihwtxE0h
 J+l23EtECE3KbAv25bIQmtEmfXw+pdTOiqWwW+Ao=
Date: Fri, 4 Aug 2023 02:47:03 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Damian Hobson-Garcia <dhobsong@igel.co.jp>
Subject: Re: [PATCH 1/2] drm: rcar-du: Add more formats to
 DRM_MODE_BLEND_PIXEL_NONE support
Message-ID: <20230803234703.GJ9722@pendragon.ideasonboard.com>
References: <20230728200714.2084223-1-dhobsong@igel.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230728200714.2084223-1-dhobsong@igel.co.jp>
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
 taki@igel.co.jp, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Damian,

Thank you for the patch.

On Fri, Jul 28, 2023 at 04:07:13PM -0400, Damian Hobson-Garcia wrote:
> Add additional pixel formats for which blending is disabling when

Did you mean "disabled" instead of "disabling" ?

> DRM_MODE_BLEND_PIXEL_NONE is set.
> 
> Refactor the fourcc selection into a separate function to handle the
> increased number of formats.
> 
> Signed-off-by: Damian Hobson-Garcia <dhobsong@igel.co.jp>
> ---
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c | 49 ++++++++++++-------
>  1 file changed, 32 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
> index 45c05d0ffc70..96241c03b60f 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
> @@ -176,6 +176,37 @@ static const u32 rcar_du_vsp_formats_gen4[] = {
>  	DRM_FORMAT_Y212,
>  };
>  
> +static u32 rcar_du_vsp_state_get_format(struct rcar_du_vsp_plane_state *state)
> +{
> +	u32 fourcc = state->format->fourcc;
> +
> +	if (state->state.pixel_blend_mode == DRM_MODE_BLEND_PIXEL_NONE) {
> +		switch (fourcc) {
> +		case DRM_FORMAT_ARGB1555:
> +			fourcc = DRM_FORMAT_XRGB1555;
> +			break;
> +
> +		case DRM_FORMAT_ARGB4444:
> +			fourcc = DRM_FORMAT_XRGB4444;
> +			break;
> +
> +		case DRM_FORMAT_ARGB8888:
> +			fourcc = DRM_FORMAT_XRGB8888;
> +			break;
> +
> +		case DRM_FORMAT_BGRA8888:
> +			fourcc = DRM_FORMAT_BGRX8888;
> +			break;
> +
> +		case DRM_FORMAT_RGBA1010102:
> +			fourcc = DRM_FORMAT_RGBX1010102;
> +			break;

Should DRM_FORMAT_ARGB2101010 be added as well, or did you leave it out
intentionally ?

> +		}
> +	}
> +
> +	return fourcc;
> +}
> +
>  static void rcar_du_vsp_plane_setup(struct rcar_du_vsp_plane *plane)
>  {
>  	struct rcar_du_vsp_plane_state *state =
> @@ -189,7 +220,7 @@ static void rcar_du_vsp_plane_setup(struct rcar_du_vsp_plane *plane)
>  		.alpha = state->state.alpha >> 8,
>  		.zpos = state->state.zpos,
>  	};
> -	u32 fourcc = state->format->fourcc;
> +	u32 fourcc = rcar_du_vsp_state_get_format(state);
>  	unsigned int i;
>  
>  	cfg.src.left = state->state.src.x1 >> 16;
> @@ -206,22 +237,6 @@ static void rcar_du_vsp_plane_setup(struct rcar_du_vsp_plane *plane)
>  		cfg.mem[i] = sg_dma_address(state->sg_tables[i].sgl)
>  			   + fb->offsets[i];
>  
> -	if (state->state.pixel_blend_mode == DRM_MODE_BLEND_PIXEL_NONE) {
> -		switch (fourcc) {
> -		case DRM_FORMAT_ARGB1555:
> -			fourcc = DRM_FORMAT_XRGB1555;
> -			break;
> -
> -		case DRM_FORMAT_ARGB4444:
> -			fourcc = DRM_FORMAT_XRGB4444;
> -			break;
> -
> -		case DRM_FORMAT_ARGB8888:
> -			fourcc = DRM_FORMAT_XRGB8888;
> -			break;
> -		}
> -	}
> -
>  	format = rcar_du_format_info(fourcc);
>  	cfg.pixelformat = format->v4l2;
>  

-- 
Regards,

Laurent Pinchart
