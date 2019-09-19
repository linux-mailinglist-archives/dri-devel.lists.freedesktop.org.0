Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F28C5B7FD7
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2019 19:18:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C87636F4CA;
	Thu, 19 Sep 2019 17:17:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AD936F4CA
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 17:17:57 +0000 (UTC)
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B41C021928;
 Thu, 19 Sep 2019 17:17:56 +0000 (UTC)
Date: Thu, 19 Sep 2019 19:17:54 +0200
From: Maxime Ripard <mripard@kernel.org>
To: roman.stratiienko@globallogic.com, Jernej Skrabec <jernej.skrabec@siol.net>
Subject: Re: [PATCH] drm/sun4i: Use vi plane as primary
Message-ID: <20190919171754.x6lq73cctnqsjr4v@gilmour>
References: <20190919123703.8545-1-roman.stratiienko@globallogic.com>
MIME-Version: 1.0
In-Reply-To: <20190919123703.8545-1-roman.stratiienko@globallogic.com>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1568913477;
 bh=yFCy4+MpB1fuov38bUgmcauo0/reXN7yqVfN2hTHm3A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=1BHIg98sQU3RSKO5g6gKuadHx+gZTwc4PvbsYJlU5PDLAsU+nnEkskfkxWwJSEIl4
 3QsZ4iQa7QmLNILjU1Cn3HaCTFre3NJhVL2wkSK7uKGnbw4YnqXhtTath1ebCQgKyY
 DT5WC5o4gYOsrt/++Dq71vwkm+ofxCbsCdnOEeg4=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1642155536=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1642155536==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2rnnscmg2kp6rchv"
Content-Disposition: inline


--2rnnscmg2kp6rchv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Thu, Sep 19, 2019 at 03:37:03PM +0300, roman.stratiienko@globallogic.com wrote:
> From: Roman Stratiienko <roman.stratiienko@globallogic.com>
>
> DE2.0 blender does not take into the account alpha channel of vi layer.
> Thus makes overlaying of this layer totally opaque.
> Using vi layer as bottom solves this issue.
>
> Tested on Android.
>
> Signed-off-by: Roman Stratiienko <roman.stratiienko@globallogic.com>

It sounds like a workaround more than an actual fix.

If the VI planes can't use the alpha, then we should just stop
reporting that format.

Jernej, what do you think?

Maxime

> ---
>  drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 33 -----------------------
>  drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 36 +++++++++++++++++++++++++-
>  2 files changed, 35 insertions(+), 34 deletions(-)
>
> diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> index dd2a1c851939..25183badc85f 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> @@ -99,36 +99,6 @@ static int sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int channel,
>  	insize = SUN8I_MIXER_SIZE(src_w, src_h);
>  	outsize = SUN8I_MIXER_SIZE(dst_w, dst_h);
>
> -	if (plane->type == DRM_PLANE_TYPE_PRIMARY) {
> -		bool interlaced = false;
> -		u32 val;
> -
> -		DRM_DEBUG_DRIVER("Primary layer, updating global size W: %u H: %u\n",
> -				 dst_w, dst_h);
> -		regmap_write(mixer->engine.regs,
> -			     SUN8I_MIXER_GLOBAL_SIZE,
> -			     outsize);
> -		regmap_write(mixer->engine.regs,
> -			     SUN8I_MIXER_BLEND_OUTSIZE(bld_base), outsize);
> -
> -		if (state->crtc)
> -			interlaced = state->crtc->state->adjusted_mode.flags
> -				& DRM_MODE_FLAG_INTERLACE;
> -
> -		if (interlaced)
> -			val = SUN8I_MIXER_BLEND_OUTCTL_INTERLACED;
> -		else
> -			val = 0;
> -
> -		regmap_update_bits(mixer->engine.regs,
> -				   SUN8I_MIXER_BLEND_OUTCTL(bld_base),
> -				   SUN8I_MIXER_BLEND_OUTCTL_INTERLACED,
> -				   val);
> -
> -		DRM_DEBUG_DRIVER("Switching display mixer interlaced mode %s\n",
> -				 interlaced ? "on" : "off");
> -	}
> -
>  	/* Set height and width */
>  	DRM_DEBUG_DRIVER("Layer source offset X: %d Y: %d\n",
>  			 state->src.x1 >> 16, state->src.y1 >> 16);
> @@ -349,9 +319,6 @@ struct sun8i_ui_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
>  	if (!layer)
>  		return ERR_PTR(-ENOMEM);
>
> -	if (index == 0)
> -		type = DRM_PLANE_TYPE_PRIMARY;
> -
>  	/* possible crtcs are set later */
>  	ret = drm_universal_plane_init(drm, &layer->plane, 0,
>  				       &sun8i_ui_layer_funcs,
> diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> index 07c27e6a4b77..49c4074e164f 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> @@ -116,6 +116,36 @@ static int sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int channel,
>  	insize = SUN8I_MIXER_SIZE(src_w, src_h);
>  	outsize = SUN8I_MIXER_SIZE(dst_w, dst_h);
>
> +	if (plane->type == DRM_PLANE_TYPE_PRIMARY) {
> +		bool interlaced = false;
> +		u32 val;
> +
> +		DRM_DEBUG_DRIVER("Primary layer, updating global size W: %u H: %u\n",
> +				 dst_w, dst_h);
> +		regmap_write(mixer->engine.regs,
> +			     SUN8I_MIXER_GLOBAL_SIZE,
> +			     outsize);
> +		regmap_write(mixer->engine.regs,
> +			     SUN8I_MIXER_BLEND_OUTSIZE(bld_base), outsize);
> +
> +		if (state->crtc)
> +			interlaced = state->crtc->state->adjusted_mode.flags
> +				& DRM_MODE_FLAG_INTERLACE;
> +
> +		if (interlaced)
> +			val = SUN8I_MIXER_BLEND_OUTCTL_INTERLACED;
> +		else
> +			val = 0;
> +
> +		regmap_update_bits(mixer->engine.regs,
> +				   SUN8I_MIXER_BLEND_OUTCTL(bld_base),
> +				   SUN8I_MIXER_BLEND_OUTCTL_INTERLACED,
> +				   val);
> +
> +		DRM_DEBUG_DRIVER("Switching display mixer interlaced mode %s\n",
> +				 interlaced ? "on" : "off");
> +	}
> +
>  	/* Set height and width */
>  	DRM_DEBUG_DRIVER("Layer source offset X: %d Y: %d\n",
>  			 (state->src.x1 >> 16) & ~(format->hsub - 1),
> @@ -445,6 +475,7 @@ struct sun8i_vi_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
>  					       struct sun8i_mixer *mixer,
>  					       int index)
>  {
> +	enum drm_plane_type type = DRM_PLANE_TYPE_OVERLAY;
>  	struct sun8i_vi_layer *layer;
>  	unsigned int plane_cnt;
>  	int ret;
> @@ -453,12 +484,15 @@ struct sun8i_vi_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
>  	if (!layer)
>  		return ERR_PTR(-ENOMEM);
>
> +	if (index == 0)
> +		type = DRM_PLANE_TYPE_PRIMARY;
> +
>  	/* possible crtcs are set later */
>  	ret = drm_universal_plane_init(drm, &layer->plane, 0,
>  				       &sun8i_vi_layer_funcs,
>  				       sun8i_vi_layer_formats,
>  				       ARRAY_SIZE(sun8i_vi_layer_formats),
> -				       NULL, DRM_PLANE_TYPE_OVERLAY, NULL);
> +				       NULL, type, NULL);
>  	if (ret) {
>  		dev_err(drm->dev, "Couldn't initialize layer\n");
>  		return ERR_PTR(ret);
> --
> 2.17.1
>

--2rnnscmg2kp6rchv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXYO4QgAKCRDj7w1vZxhR
xTy3AQCFKpFFunsqQpH5S3NlmWIGIAVm1V7QMGnmSYwKpmq2AAD9HuR+fErdd4gi
hWcnK9n6BG95SzVHYdPnJwAevIKEQgQ=
=2o4M
-----END PGP SIGNATURE-----

--2rnnscmg2kp6rchv--

--===============1642155536==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1642155536==--
