Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3E12DC1A9
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 14:55:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CF1E8994D;
	Wed, 16 Dec 2020 13:54:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B40DE8994D
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 13:54:55 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 02A812CF;
 Wed, 16 Dec 2020 14:54:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1608126893;
 bh=CxD6e4x60PgGXKkzVKWTYFHx3whsnMhCg7hpTadifsk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=j+dvUmul+zqSfn9XfbNJNwaavrgAT89siC7uFjhc46NngM3pog9TFEyn+A012CJbr
 94ZKsilDie6XM0t23I26ki8Yja6pKEtxdSwWkLIQ4CUXpVZWwR9uMy724ZNAMbdhsC
 YUK0LceGthCw4J1ckSN1TjFf0U2EKd+Dy7iCGdhY=
Date: Wed, 16 Dec 2020 15:54:45 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [PATCH v2 4/4] drm: rcar-du: Use drm_bridge_connector_init()
 helper
Message-ID: <X9oRpcPLzZTxb/mT@pendragon.ideasonboard.com>
References: <20201216005021.19518-1-laurent.pinchart+renesas@ideasonboard.com>
 <20201216005021.19518-5-laurent.pinchart+renesas@ideasonboard.com>
 <20201216115319.weukihjt3mrl7gnx@uno.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201216115319.weukihjt3mrl7gnx@uno.localdomain>
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
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jacopo,

On Wed, Dec 16, 2020 at 12:53:19PM +0100, Jacopo Mondi wrote:
> On Wed, Dec 16, 2020 at 02:50:21AM +0200, Laurent Pinchart wrote:
> > Use the drm_bridge_connector_init() helper to create a drm_connector for
> > each output, instead of relying on the bridge drivers doing so. Attach
> > the bridges with the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag to instruct
> > them not to create a connector.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> >  drivers/gpu/drm/rcar-du/rcar_du_encoder.c | 25 ++++++++++++++++++-----
> >  1 file changed, 20 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> > index ba8c6038cd63..10a66091391a 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> > @@ -11,6 +11,7 @@
> >  #include <linux/slab.h>
> >
> >  #include <drm/drm_bridge.h>
> > +#include <drm/drm_bridge_connector.h>
> >  #include <drm/drm_crtc.h>
> >  #include <drm/drm_managed.h>
> >  #include <drm/drm_modeset_helper_vtables.h>
> > @@ -61,6 +62,7 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
> >  			 struct device_node *enc_node)
> >  {
> >  	struct rcar_du_encoder *renc;
> > +	struct drm_connector *connector;
> >  	struct drm_bridge *bridge;
> >  	int ret;
> >
> > @@ -122,9 +124,22 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
> >  	if (ret)
> >  		return ret;
> >
> > -	/*
> > -	 * Attach the bridge to the encoder. The bridge will create the
> > -	 * connector.
> > -	 */
> > -	return drm_bridge_attach(&renc->base, bridge, NULL, 0);
> > +	/* Attach the bridge to the encoder. */
> > +	ret = drm_bridge_attach(&renc->base, bridge, NULL,
> > +				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> > +	if (ret) {
> > +		dev_err(rcdu->dev, "failed to attach bridge for output %u\n",
> > +			output);
> > +		return ret;
> > +	}
> > +
> > +	/* Create the connector for the chain of bridges. */
> > +	connector = drm_bridge_connector_init(&rcdu->ddev, &renc->base);
> > +	if (IS_ERR(connector)) {
> > +		dev_err(rcdu->dev,
> > +			"failed to created connector for output %u\n", output);
> > +		return PTR_ERR(connector);
> > +	}
> > +
> > +	return drm_connector_attach_encoder(connector, &renc->base);
> 
> Looks good
> Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> 
> I'm trying to figure out how deferred probe of a panel directly
> connected to the lvds encoder work. I assume there's no risk of
> creating the connector before the panel is probed, or this is not an
> issue.

If the panel isn't probed yet, the call to drm_of_find_panel_or_bridge()
in rcar_lvds_parse_dt() will defer probing of the LVDS encoder, which in
turn will defer probind of the DU as the LVDS bridge won't be
registered.

> >  }

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
