Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C12962DBFCA
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 12:53:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D5B06E19C;
	Wed, 16 Dec 2020 11:53:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 87271 seconds by postgrey-1.36 at gabe;
 Wed, 16 Dec 2020 11:53:12 UTC
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 389646E19B
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 11:53:11 +0000 (UTC)
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it
 [93.34.118.233]) (Authenticated sender: jacopo@jmondi.org)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 42E58100008;
 Wed, 16 Dec 2020 11:53:09 +0000 (UTC)
Date: Wed, 16 Dec 2020 12:53:19 +0100
From: Jacopo Mondi <jacopo@jmondi.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 4/4] drm: rcar-du: Use drm_bridge_connector_init()
 helper
Message-ID: <20201216115319.weukihjt3mrl7gnx@uno.localdomain>
References: <20201216005021.19518-1-laurent.pinchart+renesas@ideasonboard.com>
 <20201216005021.19518-5-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201216005021.19518-5-laurent.pinchart+renesas@ideasonboard.com>
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
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Wed, Dec 16, 2020 at 02:50:21AM +0200, Laurent Pinchart wrote:
> Use the drm_bridge_connector_init() helper to create a drm_connector for
> each output, instead of relying on the bridge drivers doing so. Attach
> the bridges with the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag to instruct
> them not to create a connector.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_encoder.c | 25 ++++++++++++++++++-----
>  1 file changed, 20 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> index ba8c6038cd63..10a66091391a 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> @@ -11,6 +11,7 @@
>  #include <linux/slab.h>
>
>  #include <drm/drm_bridge.h>
> +#include <drm/drm_bridge_connector.h>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_managed.h>
>  #include <drm/drm_modeset_helper_vtables.h>
> @@ -61,6 +62,7 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
>  			 struct device_node *enc_node)
>  {
>  	struct rcar_du_encoder *renc;
> +	struct drm_connector *connector;
>  	struct drm_bridge *bridge;
>  	int ret;
>
> @@ -122,9 +124,22 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
>  	if (ret)
>  		return ret;
>
> -	/*
> -	 * Attach the bridge to the encoder. The bridge will create the
> -	 * connector.
> -	 */
> -	return drm_bridge_attach(&renc->base, bridge, NULL, 0);
> +	/* Attach the bridge to the encoder. */
> +	ret = drm_bridge_attach(&renc->base, bridge, NULL,
> +				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> +	if (ret) {
> +		dev_err(rcdu->dev, "failed to attach bridge for output %u\n",
> +			output);
> +		return ret;
> +	}
> +
> +	/* Create the connector for the chain of bridges. */
> +	connector = drm_bridge_connector_init(&rcdu->ddev, &renc->base);
> +	if (IS_ERR(connector)) {
> +		dev_err(rcdu->dev,
> +			"failed to created connector for output %u\n", output);
> +		return PTR_ERR(connector);
> +	}
> +
> +	return drm_connector_attach_encoder(connector, &renc->base);

Looks good
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

I'm trying to figure out how deferred probe of a panel directly
connected to the lvds encoder work. I assume there's no risk of
creating the connector before the panel is probed, or this is not an
issue.

>  }
> --
> Regards,
>
> Laurent Pinchart
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
