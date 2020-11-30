Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A950C2C825E
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 11:41:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1F586E44E;
	Mon, 30 Nov 2020 10:41:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E24FB6E44E
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 10:41:50 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4150799;
 Mon, 30 Nov 2020 11:41:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1606732909;
 bh=M6pUb2OoeX9QTWD3qLQMxG7hTSlwV3plPMj+VvhEpvQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YBrcBVuLRDyhSUIRAafEfi8T4lNxRyV7hm2EQIMEgPNaX0BAEYHSK9vjSPveH1LCZ
 NZzDRcWz89P0Z5DkyGi1BuSJIEEa4a7oaEBKcXk3/+iuqv9fyoIv8wEhVNCsnH3vnG
 iIFDqaBhvxW7UcF4vImszXFBaq4DNGwI79545M6U=
Date: Mon, 30 Nov 2020 12:41:41 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v2 3/5] drm/omap: Implement CTM property for CRTC using
 OVL managers CPR matrix
Message-ID: <20201130104141.GS4141@pendragon.ideasonboard.com>
References: <20201103080310.164453-1-tomi.valkeinen@ti.com>
 <20201103080310.164453-4-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201103080310.164453-4-tomi.valkeinen@ti.com>
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

Hi Tomi and Jyri,

Thank you for the patch.

On Tue, Nov 03, 2020 at 10:03:08AM +0200, Tomi Valkeinen wrote:
> From: Jyri Sarha <jsarha@ti.com>
> 
> Implement CTM color management property for OMAP CRTC using DSS
> overlay manager's Color Phase Rotation matrix. The CPR matrix does not
> exactly match the CTM property documentation. On DSS the CPR matrix is
> applied after gamma table look up. However, it seems stupid to add a
> custom property just for that.

Should this be updated now that the driver has switched to using degamma
?

> Signed-off-by: Jyri Sarha <jsarha@ti.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/omapdrm/omap_crtc.c | 39 +++++++++++++++++++++++++++--
>  1 file changed, 37 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/omap_crtc.c b/drivers/gpu/drm/omapdrm/omap_crtc.c
> index d40220b2f312..b2c251a8b404 100644
> --- a/drivers/gpu/drm/omapdrm/omap_crtc.c
> +++ b/drivers/gpu/drm/omapdrm/omap_crtc.c
> @@ -391,6 +391,33 @@ static void omap_crtc_manual_display_update(struct work_struct *data)
>  	}
>  }
>  
> +static s16 omap_crtc_s31_32_to_s2_8(s64 coef)
> +{
> +	u64 sign_bit = 1ULL << 63;
> +	u64 cbits = (u64)coef;
> +
> +	s16 ret = clamp_val(((cbits & ~sign_bit) >> 24), 0, 0x1ff);
> +
> +	if (cbits & sign_bit)
> +		ret = -ret;
> +
> +	return ret;
> +}
> +
> +static void omap_crtc_cpr_coefs_from_ctm(const struct drm_color_ctm *ctm,
> +					 struct omap_dss_cpr_coefs *cpr)
> +{
> +	cpr->rr = omap_crtc_s31_32_to_s2_8(ctm->matrix[0]);
> +	cpr->rg = omap_crtc_s31_32_to_s2_8(ctm->matrix[1]);
> +	cpr->rb = omap_crtc_s31_32_to_s2_8(ctm->matrix[2]);
> +	cpr->gr = omap_crtc_s31_32_to_s2_8(ctm->matrix[3]);
> +	cpr->gg = omap_crtc_s31_32_to_s2_8(ctm->matrix[4]);
> +	cpr->gb = omap_crtc_s31_32_to_s2_8(ctm->matrix[5]);
> +	cpr->br = omap_crtc_s31_32_to_s2_8(ctm->matrix[6]);
> +	cpr->bg = omap_crtc_s31_32_to_s2_8(ctm->matrix[7]);
> +	cpr->bb = omap_crtc_s31_32_to_s2_8(ctm->matrix[8]);
> +}
> +
>  static void omap_crtc_write_crtc_properties(struct drm_crtc *crtc)
>  {
>  	struct omap_drm_private *priv = crtc->dev->dev_private;
> @@ -402,7 +429,15 @@ static void omap_crtc_write_crtc_properties(struct drm_crtc *crtc)
>  	info.default_color = 0x000000;
>  	info.trans_enabled = false;
>  	info.partial_alpha_enabled = false;
> -	info.cpr_enable = false;
> +
> +	if (crtc->state->ctm) {
> +		struct drm_color_ctm *ctm = crtc->state->ctm->data;
> +
> +		info.cpr_enable = true;
> +		omap_crtc_cpr_coefs_from_ctm(ctm, &info.cpr_coefs);
> +	} else {
> +		info.cpr_enable = false;
> +	}
>  
>  	priv->dispc_ops->mgr_setup(priv->dispc, omap_crtc->channel, &info);
>  }
> @@ -842,7 +877,7 @@ struct drm_crtc *omap_crtc_init(struct drm_device *dev,
>  	if (priv->dispc_ops->mgr_gamma_size(priv->dispc, channel)) {
>  		unsigned int gamma_lut_size = 256;
>  
> -		drm_crtc_enable_color_mgmt(crtc, gamma_lut_size, false, 0);
> +		drm_crtc_enable_color_mgmt(crtc, gamma_lut_size, true, 0);
>  		drm_mode_crtc_set_gamma_size(crtc, gamma_lut_size);
>  	}
>  

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
