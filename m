Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD222C8252
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 11:39:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D3896E44C;
	Mon, 30 Nov 2020 10:39:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3601E6E44C
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 10:39:13 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A28CCB26;
 Mon, 30 Nov 2020 11:39:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1606732751;
 bh=TfvvGS9KiyvrGSW0/M7dlrp2eM4LpA82MkLE39TWd/o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tLgNPIim1ZcXcWLE7wqck4nX26O2pQmf697ZAZQUhDtexd014E4cNlYp+ZynaXBD4
 11zZVjs8OkNFRP2L7rUvjNXdelvOd8I6XcIX2U8uZW45QnmT4Bblj2FXLz79SWlDSA
 qkMuLmiuHQNdEhONVsCJJ04jqlwcEYA46emirFCE=
Date: Mon, 30 Nov 2020 12:39:03 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v2 2/5] drm/omap: use degamma property for gamma table
Message-ID: <20201130103903.GA7220@pendragon.ideasonboard.com>
References: <20201103080310.164453-1-tomi.valkeinen@ti.com>
 <20201103080310.164453-3-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201103080310.164453-3-tomi.valkeinen@ti.com>
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Sekhar Nori <nsekhar@ti.com>, Jyri Sarha <jsarha@ti.com>,
 Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

Thank you for the patch.

On Tue, Nov 03, 2020 at 10:03:07AM +0200, Tomi Valkeinen wrote:
> omapdrm supports gamma via GAMMA_LUT property. However, the HW we have
> is:
> 
> gamma -> ctm -> out
> 
> instead of what the model DRM framework uses:
> 
> ctm -> gamma -> out
> 
> As the following patches add CTM support for omapdrm, lets first fix the
> gamma.
> 
> This patch changes the property from GAMMA_LUT to DEGAMMA_LUT, and uses
> drm_atomic_helper_legacy_degamma_set for gamma_set helper. Thus we will
> have:
> 
> degamma -> ctm -> out
> 
> and the legacy ioctl will continue working as before.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/omapdrm/omap_crtc.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/omap_crtc.c b/drivers/gpu/drm/omapdrm/omap_crtc.c
> index d7442aa55f89..d40220b2f312 100644
> --- a/drivers/gpu/drm/omapdrm/omap_crtc.c
> +++ b/drivers/gpu/drm/omapdrm/omap_crtc.c
> @@ -575,8 +575,8 @@ static int omap_crtc_atomic_check(struct drm_crtc *crtc,
>  									  crtc);
>  	struct drm_plane_state *pri_state;
>  
> -	if (crtc_state->color_mgmt_changed && crtc_state->gamma_lut) {
> -		unsigned int length = crtc_state->gamma_lut->length /
> +	if (crtc_state->color_mgmt_changed && crtc_state->degamma_lut) {
> +		unsigned int length = crtc_state->degamma_lut->length /
>  			sizeof(struct drm_color_lut);
>  
>  		if (length < 2)
> @@ -617,10 +617,10 @@ static void omap_crtc_atomic_flush(struct drm_crtc *crtc,
>  		struct drm_color_lut *lut = NULL;
>  		unsigned int length = 0;
>  
> -		if (crtc->state->gamma_lut) {
> +		if (crtc->state->degamma_lut) {
>  			lut = (struct drm_color_lut *)
> -				crtc->state->gamma_lut->data;
> -			length = crtc->state->gamma_lut->length /
> +				crtc->state->degamma_lut->data;
> +			length = crtc->state->degamma_lut->length /
>  				sizeof(*lut);
>  		}
>  		priv->dispc_ops->mgr_set_gamma(priv->dispc, omap_crtc->channel,
> @@ -741,7 +741,7 @@ static const struct drm_crtc_funcs omap_crtc_funcs = {
>  	.set_config = drm_atomic_helper_set_config,
>  	.destroy = omap_crtc_destroy,
>  	.page_flip = drm_atomic_helper_page_flip,
> -	.gamma_set = drm_atomic_helper_legacy_gamma_set,
> +	.gamma_set = drm_atomic_helper_legacy_degamma_set,
>  	.atomic_duplicate_state = omap_crtc_duplicate_state,
>  	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
>  	.atomic_set_property = omap_crtc_atomic_set_property,
> @@ -842,7 +842,7 @@ struct drm_crtc *omap_crtc_init(struct drm_device *dev,
>  	if (priv->dispc_ops->mgr_gamma_size(priv->dispc, channel)) {
>  		unsigned int gamma_lut_size = 256;
>  
> -		drm_crtc_enable_color_mgmt(crtc, 0, false, gamma_lut_size);
> +		drm_crtc_enable_color_mgmt(crtc, gamma_lut_size, false, 0);
>  		drm_mode_crtc_set_gamma_size(crtc, gamma_lut_size);
>  	}
>  
> 

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
