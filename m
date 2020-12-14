Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A482D96EF
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 12:05:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97E136E15A;
	Mon, 14 Dec 2020 11:05:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F4666E15A
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 11:05:36 +0000 (UTC)
X-Originating-IP: 95.245.192.76
Received: from uno.localdomain (host-95-245-192-76.retail.telecomitalia.it
 [95.245.192.76]) (Authenticated sender: jacopo@jmondi.org)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 59DCD1C0026;
 Mon, 14 Dec 2020 11:05:33 +0000 (UTC)
Date: Mon, 14 Dec 2020 12:05:43 +0100
From: Jacopo Mondi <jacopo@jmondi.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH 9/9] drm: rcar-du: Drop local encoder variable
Message-ID: <20201214110543.v3bt3ckz3bsen6c2@uno.localdomain>
References: <20201204220139.15272-1-laurent.pinchart+renesas@ideasonboard.com>
 <20201204220139.15272-10-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201204220139.15272-10-laurent.pinchart+renesas@ideasonboard.com>
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
On Sat, Dec 05, 2020 at 12:01:39AM +0200, Laurent Pinchart wrote:

> The local encoder variable is an alias for &renc->base, and is only use
> twice. It doesn't help much, drop it, along with the
> rcar_encoder_to_drm_encoder() macro that is then unused.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
   j

> ---
>  drivers/gpu/drm/rcar-du/rcar_du_encoder.c | 6 ++----
>  drivers/gpu/drm/rcar-du/rcar_du_encoder.h | 2 --
>  2 files changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> index 49c0b27e2f5a..9a565bd3380d 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> @@ -61,7 +61,6 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
>  			 struct device_node *enc_node)
>  {
>  	struct rcar_du_encoder *renc;
> -	struct drm_encoder *encoder;
>  	struct drm_bridge *bridge;
>  	int ret;
>
> @@ -108,12 +107,11 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
>
>  	rcdu->encoders[output] = renc;
>  	renc->output = output;
> -	encoder = rcar_encoder_to_drm_encoder(renc);
>
>  	dev_dbg(rcdu->dev, "initializing encoder %pOF for output %u\n",
>  		enc_node, output);
>
> -	ret = drm_encoder_init(&rcdu->ddev, encoder, &rcar_du_encoder_funcs,
> +	ret = drm_encoder_init(&rcdu->ddev, &renc->base, &rcar_du_encoder_funcs,
>  			       DRM_MODE_ENCODER_NONE, NULL);
>  	if (ret < 0)
>  		goto error;
> @@ -127,7 +125,7 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
>  	 * Attach the bridge to the encoder. The bridge will create the
>  	 * connector.
>  	 */
> -	return drm_bridge_attach(encoder, bridge, NULL, 0);
> +	return drm_bridge_attach(&renc->base, bridge, NULL, 0);
>
>  error:
>  	kfree(renc);
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.h b/drivers/gpu/drm/rcar-du/rcar_du_encoder.h
> index df9be4524301..73560563fb31 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.h
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.h
> @@ -22,8 +22,6 @@ struct rcar_du_encoder {
>  #define to_rcar_encoder(e) \
>  	container_of(e, struct rcar_du_encoder, base)
>
> -#define rcar_encoder_to_drm_encoder(e)	(&(e)->base)
> -
>  int rcar_du_encoder_init(struct rcar_du_device *rcdu,
>  			 enum rcar_du_output output,
>  			 struct device_node *enc_node);
> --
> Regards,
>
> Laurent Pinchart
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
