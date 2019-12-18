Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 112BD123CBB
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 02:56:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DF0C6E0FA;
	Wed, 18 Dec 2019 01:56:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8C966E0FA
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 01:56:31 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2D1D833B;
 Wed, 18 Dec 2019 02:56:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1576634190;
 bh=mkmRncRS+H/ryYP4Tp8+TMi0WhwTaloTzwkyNGdF8h0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WAkUZsBRIGH7RPargR71cIZIvqXg8+bzc8CxlJaM/FTtdW9eTdaM7eVuTyDWo42jW
 LUW6K6BsvwutnozZ32/3bbO89hdvCb5cZU+ruJAxxmMsh4yBlY+lgpFkYD7V8WRHou
 U8J5L4jVSnOZuXZRxqul+eGeVUZMEgL/CpRhl1OI=
Date: Wed, 18 Dec 2019 03:56:19 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v3 35/50] drm/omap: Create connector for bridges
Message-ID: <20191218015619.GM4874@pendragon.ideasonboard.com>
References: <20191210225750.15709-1-laurent.pinchart@ideasonboard.com>
 <20191210225750.15709-36-laurent.pinchart@ideasonboard.com>
 <20191215100018.GB27552@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191215100018.GB27552@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, Sean Paul <sean@poorly.run>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

Thank you for the review.

On Sun, Dec 15, 2019 at 11:00:18AM +0100, Sam Ravnborg wrote:
> On Wed, Dec 11, 2019 at 12:57:35AM +0200, Laurent Pinchart wrote:
> > Use the drm_bridge_connector helper to create a connector for pipelines
> > that use drm_bridge. This allows splitting connector operations across
> > multiple bridges when necessary, instead of having the last bridge in
> > the chain creating the connector and handling all connector operations
> > internally.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> > Changes since v1:
> > 
> > - Squash with patch "drm/omap: Detach from panels at remove time"
> > ---
> >  drivers/gpu/drm/omapdrm/omap_drv.c | 79 +++++++++++++++++++++++++-----
> >  1 file changed, 67 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
> > index 1df509342b5d..097fbbaa5df0 100644
> > --- a/drivers/gpu/drm/omapdrm/omap_drv.c
> > +++ b/drivers/gpu/drm/omapdrm/omap_drv.c
> > @@ -12,10 +12,12 @@
> >  #include <drm/drm_atomic.h>
> >  #include <drm/drm_atomic_helper.h>
> >  #include <drm/drm_bridge.h>
> > +#include <drm/drm_bridge_connector.h>
> >  #include <drm/drm_drv.h>
> >  #include <drm/drm_fb_helper.h>
> >  #include <drm/drm_file.h>
> >  #include <drm/drm_ioctl.h>
> > +#include <drm/drm_panel.h>
> >  #include <drm/drm_prime.h>
> >  #include <drm/drm_probe_helper.h>
> >  #include <drm/drm_vblank.h>
> > @@ -291,9 +293,14 @@ static int omap_modeset_init(struct drm_device *dev)
> >  
> >  		if (pipe->output->bridge) {
> >  			ret = drm_bridge_attach(pipe->encoder,
> > -						pipe->output->bridge, NULL, 0);
> > -			if (ret < 0)
> > +						pipe->output->bridge, NULL,
> > +						DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> > +			if (ret < 0) {
> > +				dev_err(priv->dev,
> > +					"unable to attach bridge %pOF\n",
> > +					pipe->output->bridge->of_node);
> >  				return ret;
> > +			}
> >  		}
> >  
> >  		id = omap_display_id(pipe->output);
> > @@ -329,8 +336,28 @@ static int omap_modeset_init(struct drm_device *dev)
> >  							      encoder);
> >  			if (!pipe->connector)
> >  				return -ENOMEM;
> > +		} else {
> > +			pipe->connector = drm_bridge_connector_init(dev, encoder);
> > +			if (IS_ERR(pipe->connector)) {
> > +				dev_err(priv->dev,
> > +					"unable to create bridge connector for %s\n",
> > +					pipe->output->name);
> > +				return PTR_ERR(pipe->connector);
> > +			}
> > +		}
> >  
> > -			drm_connector_attach_encoder(pipe->connector, encoder);
> > +		drm_connector_attach_encoder(pipe->connector, encoder);
> > +
> > +		/*
> > +		 * FIXME: drm_panel should not store the drm_connector pointer
> > +		 * internally but should receive it in its .get_modes()
> > +		 * operation.
> > +		 */
>
> This FIXME is not fully up-to-date.
> drm_panel_attach ignores the connector argumant, and we could also pass
> NULL here.

You're right, I'll remove the comment.

> I am not convinced we need the drm_panel_(attach|detach) anymore, but
> this is not the thread to take that discussion.

Indeed :-) I think we should replace all direct panel usage with the DRM
panel bridge, then we'll be able to refactor the panel API freely.

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
