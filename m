Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA762D98C2
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 14:29:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DEF86E1D5;
	Mon, 14 Dec 2020 13:29:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BDC16E1D5
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 13:29:04 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1090C96;
 Mon, 14 Dec 2020 14:29:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1607952542;
 bh=aK2iQUCe5yEvWU5gP7jtW7GHSzuk2RGF6gQd30SKqY8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eLA94b2VWj49Z6WGMGrONL1NLFRobQwEN8Zp7pKz4mSUwE5jNpgZHibGo9EZ22vLb
 zXbE8eKzV65O4XWr7xrI9v4JuSCqvtpr7Pn5l9ymo5UuOvPeWB7jVc+RF+4ngQ7CA0
 bKsJ+rN2Ju3EVTZ7C3cBe4oVF/DsL8EGuz1656gU=
Date: Mon, 14 Dec 2020 15:28:56 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [PATCH 5/9] drm: rcar-du: Use DRM-managed allocation for encoders
Message-ID: <X9domDvwBxTw5npR@pendragon.ideasonboard.com>
References: <20201204220139.15272-1-laurent.pinchart+renesas@ideasonboard.com>
 <20201204220139.15272-6-laurent.pinchart+renesas@ideasonboard.com>
 <20201214103750.bpwmxe4icjtika4v@uno.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201214103750.bpwmxe4icjtika4v@uno.localdomain>
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
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jacopo,

On Mon, Dec 14, 2020 at 11:37:50AM +0100, Jacopo Mondi wrote:
> On Sat, Dec 05, 2020 at 12:01:35AM +0200, Laurent Pinchart wrote:
> > devm_kzalloc() is the wrong API to allocate encoders, as the lifetime of
> > the encoders is tied to the DRM device, not the device to driver
> > binding. drmm_kzalloc() isn't a good option either, as it would result
> > in the encoder being freed before being unregistered during the managed
> > cleanup of the DRM objects. Use a plain kzalloc(), and register a drmm
> > action to cleanup the encoder.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> >  drivers/gpu/drm/rcar-du/rcar_du_encoder.c | 47 ++++++++++++++---------
> >  1 file changed, 29 insertions(+), 18 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> > index 0edce24f2053..7c491ff72cd2 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> > @@ -8,12 +8,13 @@
> >   */
> >
> >  #include <linux/export.h>
> > +#include <linux/slab.h>
> >
> >  #include <drm/drm_bridge.h>
> >  #include <drm/drm_crtc.h>
> > +#include <drm/drm_managed.h>
> >  #include <drm/drm_modeset_helper_vtables.h>
> >  #include <drm/drm_panel.h>
> > -#include <drm/drm_simple_kms_helper.h>
> >
> >  #include "rcar_du_drv.h"
> >  #include "rcar_du_encoder.h"
> > @@ -44,6 +45,17 @@ static unsigned int rcar_du_encoder_count_ports(struct device_node *node)
> >  	return num_ports;
> >  }
> >
> > +static const struct drm_encoder_funcs rcar_du_encoder_funcs = {
> > +};
> > +
> > +static void rcar_du_encoder_release(struct drm_device *dev, void *res)
> > +{
> > +	struct rcar_du_encoder *renc = res;
> > +
> > +	drm_encoder_cleanup(&renc->base);
> > +	kfree(renc);
> > +}
> > +
> >  int rcar_du_encoder_init(struct rcar_du_device *rcdu,
> >  			 enum rcar_du_output output,
> >  			 struct device_node *enc_node)
> > @@ -53,7 +65,7 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
> >  	struct drm_bridge *bridge;
> >  	int ret;
> >
> > -	renc = devm_kzalloc(rcdu->dev, sizeof(*renc), GFP_KERNEL);
> > +	renc = kzalloc(sizeof(*renc), GFP_KERNEL);
> >  	if (renc == NULL)
> >  		return -ENOMEM;
> >
> > @@ -76,20 +88,20 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
> >
> >  		if (IS_ERR(panel)) {
> >  			ret = PTR_ERR(panel);
> > -			goto done;
> > +			goto error;
> >  		}
> >
> >  		bridge = devm_drm_panel_bridge_add_typed(rcdu->dev, panel,
> >  							 DRM_MODE_CONNECTOR_DPI);
> >  		if (IS_ERR(bridge)) {
> >  			ret = PTR_ERR(bridge);
> > -			goto done;
> > +			goto error;
> >  		}
> >  	} else {
> >  		bridge = of_drm_find_bridge(enc_node);
> >  		if (!bridge) {
> >  			ret = -EPROBE_DEFER;
> > -			goto done;
> > +			goto error;
> >  		}
> >
> >  		if (output == RCAR_DU_OUTPUT_LVDS0 ||
> > @@ -104,28 +116,27 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
> >  	if (rcdu->info->gen >= 3 && output == RCAR_DU_OUTPUT_LVDS1) {
> >  		if (rcar_lvds_dual_link(bridge)) {
> >  			ret = -ENOLINK;
> > -			goto done;
> > +			goto error;
> >  		}
> >  	}
> >
> > -	ret = drm_simple_encoder_init(rcdu->ddev, encoder,
> > -				      DRM_MODE_ENCODER_NONE);
> > +	ret = drm_encoder_init(rcdu->ddev, encoder, &rcar_du_encoder_funcs,
> > +			       DRM_MODE_ENCODER_NONE, NULL);
> 
> I might have missed the reason for this.
> Why add an action later instead of making rcar_du_encoder_release part
> of rcar_du_encoder_funcs ?

Because the subsystem is moving towards drmm_* instead of manual release
callbacks (I don't mind the manual release callbacks personally). Note
that there's "[PATCH v4 02/19] drm: add drmm_encoder_alloc()" that
should be merged soon, which will allow simplifying this.

> >  	if (ret < 0)
> > -		goto done;
> > +		goto error;
> > +
> > +	ret = drmm_add_action_or_reset(rcdu->ddev, rcar_du_encoder_release,
> > +				       renc);
> > +	if (ret)
> > +		return ret;
> >
> >  	/*
> >  	 * Attach the bridge to the encoder. The bridge will create the
> >  	 * connector.
> >  	 */
> > -	ret = drm_bridge_attach(encoder, bridge, NULL, 0);
> > -	if (ret) {
> > -		drm_encoder_cleanup(encoder);
> > -		return ret;
> > -	}
> > -
> > -done:
> > -	if (ret < 0)
> > -		devm_kfree(rcdu->dev, renc);
> > +	return drm_bridge_attach(encoder, bridge, NULL, 0);
> >
> > +error:
> > +	kfree(renc);
> >  	return ret;
> >  }

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
