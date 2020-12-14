Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AD22D96ED
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 12:04:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73E4A89B62;
	Mon, 14 Dec 2020 11:04:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 797BC89B62
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 11:04:43 +0000 (UTC)
X-Originating-IP: 95.245.192.76
Received: from uno.localdomain (host-95-245-192-76.retail.telecomitalia.it
 [95.245.192.76]) (Authenticated sender: jacopo@jmondi.org)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 172A0FF814;
 Mon, 14 Dec 2020 11:04:39 +0000 (UTC)
Date: Mon, 14 Dec 2020 12:04:49 +0100
From: Jacopo Mondi <jacopo@jmondi.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH 8/9] drm: rcar-du: Skip encoder allocation for LVDS1 in
 dual-link mode
Message-ID: <20201214110449.sjeixugm2ap2wfsj@uno.localdomain>
References: <20201204220139.15272-1-laurent.pinchart+renesas@ideasonboard.com>
 <20201204220139.15272-9-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201204220139.15272-9-laurent.pinchart+renesas@ideasonboard.com>
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
Cc: linux-renesas-soc@vger.kernel.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Sat, Dec 05, 2020 at 12:01:38AM +0200, Laurent Pinchart wrote:
> The rcar-du driver skips registration of the encoder for the LVDS1
> output when LVDS is used in dual-link mode, as the LVDS0 and LVDS1 links
> are bundled and handled through the LVDS0 output. It however still
> allocates the encoder and immediately destroys it, which is pointless.
> Skip allocation of the encoder altogether in that case.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_encoder.c | 51 ++++++++++-------------
>  1 file changed, 22 insertions(+), 29 deletions(-)
>
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> index e4f35a88d00f..49c0b27e2f5a 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> @@ -65,17 +65,6 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
>  	struct drm_bridge *bridge;
>  	int ret;
>
> -	renc = kzalloc(sizeof(*renc), GFP_KERNEL);
> -	if (renc == NULL)
> -		return -ENOMEM;
> -
> -	rcdu->encoders[output] = renc;
> -	renc->output = output;
> -	encoder = rcar_encoder_to_drm_encoder(renc);
> -
> -	dev_dbg(rcdu->dev, "initializing encoder %pOF for output %u\n",
> -		enc_node, output);
> -
>  	/*
>  	 * Locate the DRM bridge from the DT node. For the DPAD outputs, if the
>  	 * DT node has a single port, assume that it describes a panel and
> @@ -86,23 +75,17 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
>  	    rcar_du_encoder_count_ports(enc_node) == 1) {
>  		struct drm_panel *panel = of_drm_find_panel(enc_node);
>
> -		if (IS_ERR(panel)) {
> -			ret = PTR_ERR(panel);
> -			goto error;
> -		}
> +		if (IS_ERR(panel))
> +			return PTR_ERR(panel);
>
>  		bridge = devm_drm_panel_bridge_add_typed(rcdu->dev, panel,
>  							 DRM_MODE_CONNECTOR_DPI);
> -		if (IS_ERR(bridge)) {
> -			ret = PTR_ERR(bridge);
> -			goto error;
> -		}
> +		if (IS_ERR(bridge))
> +			return PTR_ERR(bridge);
>  	} else {
>  		bridge = of_drm_find_bridge(enc_node);
> -		if (!bridge) {
> -			ret = -EPROBE_DEFER;
> -			goto error;
> -		}
> +		if (!bridge)
> +			return -EPROBE_DEFER;
>
>  		if (output == RCAR_DU_OUTPUT_LVDS0 ||
>  		    output == RCAR_DU_OUTPUT_LVDS1)
> @@ -110,16 +93,26 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
>  	}
>
>  	/*
> -	 * On Gen3 skip the LVDS1 output if the LVDS1 encoder is used as a
> -	 * companion for LVDS0 in dual-link mode.
> +	 * Create and initialize the encoder. On Gen3 skip the LVDS1 output if
> +	 * the LVDS1 encoder is used as a companion for LVDS0 in dual-link
> +	 * mode.

Oh, here's the answer to my question on 1/9, I should have not looked
at DTS but to the driver

>  	 */
>  	if (rcdu->info->gen >= 3 && output == RCAR_DU_OUTPUT_LVDS1) {
> -		if (rcar_lvds_dual_link(bridge)) {
> -			ret = -ENOLINK;
> -			goto error;
> -		}
> +		if (rcar_lvds_dual_link(bridge))
> +			return -ENOLINK;
>  	}
>
> +	renc = kzalloc(sizeof(*renc), GFP_KERNEL);
> +	if (renc == NULL)
> +		return -ENOMEM;
> +
> +	rcdu->encoders[output] = renc;
> +	renc->output = output;
> +	encoder = rcar_encoder_to_drm_encoder(renc);
> +
> +	dev_dbg(rcdu->dev, "initializing encoder %pOF for output %u\n",
> +		enc_node, output);
> +
>  	ret = drm_encoder_init(&rcdu->ddev, encoder, &rcar_du_encoder_funcs,
>  			       DRM_MODE_ENCODER_NONE, NULL);
>  	if (ret < 0)

Do you have any other caller of the 'done:' label left apart from the
one after this last line ? In case you don't you can call devm_kfree()
here

With or without this addressed:
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

> --
> Regards,
>
> Laurent Pinchart

>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
