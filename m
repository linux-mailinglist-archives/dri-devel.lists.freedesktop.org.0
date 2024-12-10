Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 024D69EAF6A
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 12:13:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F352010E3A4;
	Tue, 10 Dec 2024 11:13:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jonzwLt1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C354110E3A4
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 11:13:25 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 58AAC496;
 Tue, 10 Dec 2024 12:12:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1733829172;
 bh=hPCDCY/RZqYfTWHTMRDlMEBiTSaxa6rs2fmrcjOAJ2g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jonzwLt15KHBuq7llkTJp03dz5Ggl6/dv8+qz8tOKrzMCIh0LgIg9ilRohG23E6C5
 hCpEWZMjK0M170IIDjYLXTI0wSHMPrtkZR2XRorb0qZ/VrGH2wXiZczHsL+gSHqldU
 3XJSakEyfTCrcJaGZhzyD2pRK8fhD12GbJFdeE1I=
Date: Tue, 10 Dec 2024 13:13:08 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH v2 2/2] drm: renesas: rz-du: rzg2l_du_encoder: Fix max
 dot clock for DPI
Message-ID: <20241210111308.GF573@pendragon.ideasonboard.com>
References: <20241022082433.32513-1-biju.das.jz@bp.renesas.com>
 <20241022082433.32513-3-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241022082433.32513-3-biju.das.jz@bp.renesas.com>
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

Hi Biju,

Thank you for the patch.

On Tue, Oct 22, 2024 at 09:24:24AM +0100, Biju Das wrote:
> As per the RZ/G2UL hardware manual Table 33.4 Clock List, the maximum
> dot clock for the DPI interface is 83.5 MHz. Add mode_valid callback
> to reject modes greater than 83.5 MHz.
> 
> Suggested-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> Changes in v2:
>  * Moved .mode_valid from crtc to encoder as the new state is not
>    available in crtc and instead, we could check renc->output for
>    .mode_valid() function of drm_encoder.
>  * Dropped rzg2l_du_crtc_atomic_check().
> ---
>  .../gpu/drm/renesas/rz-du/rzg2l_du_encoder.c   | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
> index 339cbaaea0b5..564ab4cb3d37 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
> @@ -10,6 +10,7 @@
>  #include <linux/export.h>
>  #include <linux/of.h>
>  
> +#include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_bridge_connector.h>
>  #include <drm/drm_panel.h>
> @@ -24,6 +25,22 @@
>  static const struct drm_encoder_funcs rzg2l_du_encoder_funcs = {
>  };
>  
> +static enum drm_mode_status
> +rzg2l_du_encoder_mode_valid(struct drm_encoder *encoder,
> +			    const struct drm_display_mode *mode)
> +{
> +	struct rzg2l_du_encoder *renc = to_rzg2l_encoder(encoder);
> +
> +	if (renc->output == RZG2L_DU_OUTPUT_DPAD0 && mode->clock > 83500)
> +		return MODE_CLOCK_HIGH;
> +
> +	return MODE_OK;
> +}
> +
> +static const struct drm_encoder_helper_funcs rzg2l_du_encoder_helper_funcs = {
> +	.mode_valid = rzg2l_du_encoder_mode_valid,
> +};
> +
>  int rzg2l_du_encoder_init(struct rzg2l_du_device  *rcdu,
>  			  enum rzg2l_du_output output,
>  			  struct device_node *enc_node)
> @@ -48,6 +65,7 @@ int rzg2l_du_encoder_init(struct rzg2l_du_device  *rcdu,
>  		return PTR_ERR(renc);
>  
>  	renc->output = output;
> +	drm_encoder_helper_add(&renc->base, &rzg2l_du_encoder_helper_funcs);
>  
>  	/* Attach the bridge to the encoder. */
>  	ret = drm_bridge_attach(&renc->base, bridge, NULL,

-- 
Regards,

Laurent Pinchart
