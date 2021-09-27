Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 772B241A18B
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 23:53:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B23A89F43;
	Mon, 27 Sep 2021 21:53:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D859889F43
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Sep 2021 21:53:15 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 91B7110CA;
 Mon, 27 Sep 2021 23:53:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1632779593;
 bh=nHkvtcWiic42MnvXcuNo0n/ErjvgC5aPUQB8DJscSAM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IudbtgDefnH4PiktQH/lcHIrIgbu8XSbf8yktC37c2gxZu3UurfJztwVrG2M3uflV
 irW6Z3aPDu53lVifTJ+5j0JSmQ0JQ8ZPKhazBE2OznhP6exHYC6jlJSOk2vm56ezAL
 GPejbDYxO+MGBD2WPIYLUR/5FkE0nJ95n+GGH2MA=
Date: Tue, 28 Sep 2021 00:53:06 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <maxime@cerno.tech>
Cc: Robert Foss <robert.foss@linaro.org>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/3] drm/bridge: Add a function to abstract away panels
Message-ID: <YVI9QtkzcnZrpofG@pendragon.ideasonboard.com>
References: <20210910130941.1740182-1-maxime@cerno.tech>
 <20210910130941.1740182-2-maxime@cerno.tech>
 <YUvKcTv2hSrUqIvF@pendragon.ideasonboard.com>
 <20210927194344.avbex3qyw2swa7kz@gilmour>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210927194344.avbex3qyw2swa7kz@gilmour>
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

On Mon, Sep 27, 2021 at 09:43:44PM +0200, Maxime Ripard wrote:
> On Thu, Sep 23, 2021 at 03:29:37AM +0300, Laurent Pinchart wrote:
> > Hi Maxime,
> > 
> > Thank you for the patch.
> > 
> > I know this has already been merged, but I have a question.
> > 
> > On Fri, Sep 10, 2021 at 03:09:39PM +0200, Maxime Ripard wrote:
> > > Display drivers so far need to have a lot of boilerplate to first
> > > retrieve either the panel or bridge that they are connected to using
> > > drm_of_find_panel_or_bridge(), and then either deal with each with ad-hoc
> > > functions or create a drm panel bridge through drm_panel_bridge_add.
> > > 
> > > In order to reduce the boilerplate and hopefully create a path of least
> > > resistance towards using the DRM panel bridge layer, let's create the
> > > function devm_drm_of_get_next to reduce that boilerplate.
> > >
> > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > > ---
> > >  drivers/gpu/drm/drm_bridge.c | 42 ++++++++++++++++++++++++++++++++----
> > >  drivers/gpu/drm/drm_of.c     |  3 +++
> > >  include/drm/drm_bridge.h     |  2 ++
> > >  3 files changed, 43 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> > > index a8ed66751c2d..10ddca4638b0 100644
> > > --- a/drivers/gpu/drm/drm_bridge.c
> > > +++ b/drivers/gpu/drm/drm_bridge.c
> > > @@ -28,6 +28,7 @@
> > >  #include <drm/drm_atomic_state_helper.h>
> > >  #include <drm/drm_bridge.h>
> > >  #include <drm/drm_encoder.h>
> > > +#include <drm/drm_of.h>
> > >  #include <drm/drm_print.h>
> > >  
> > >  #include "drm_crtc_internal.h"
> > > @@ -51,10 +52,8 @@
> > >   *
> > >   * Display drivers are responsible for linking encoders with the first bridge
> > >   * in the chains. This is done by acquiring the appropriate bridge with
> > > - * of_drm_find_bridge() or drm_of_find_panel_or_bridge(), or creating it for a
> > > - * panel with drm_panel_bridge_add_typed() (or the managed version
> > > - * devm_drm_panel_bridge_add_typed()). Once acquired, the bridge shall be
> > > - * attached to the encoder with a call to drm_bridge_attach().
> > > + * devm_drm_of_get_bridge(). Once acquired, the bridge shall be attached to the
> > > + * encoder with a call to drm_bridge_attach().
> > >   *
> > >   * Bridges are responsible for linking themselves with the next bridge in the
> > >   * chain, if any. This is done the same way as for encoders, with the call to
> > > @@ -1233,6 +1232,41 @@ struct drm_bridge *of_drm_find_bridge(struct device_node *np)
> > >  	return NULL;
> > >  }
> > >  EXPORT_SYMBOL(of_drm_find_bridge);
> > > +
> > > +/**
> > > + * devm_drm_of_get_bridge - Return next bridge in the chain
> > > + * @dev: device to tie the bridge lifetime to
> > > + * @np: device tree node containing encoder output ports
> > > + * @port: port in the device tree node
> > > + * @endpoint: endpoint in the device tree node
> > > + *
> > > + * Given a DT node's port and endpoint number, finds the connected node
> > > + * and returns the associated bridge if any, or creates and returns a
> > > + * drm panel bridge instance if a panel is connected.
> > > + *
> > > + * Returns a pointer to the bridge if successful, or an error pointer
> > > + * otherwise.
> > > + */
> > > +struct drm_bridge *devm_drm_of_get_bridge(struct device *dev,
> > > +					  struct device_node *np,
> > > +					  unsigned int port,
> > > +					  unsigned int endpoint)
> > > +{
> > > +	struct drm_bridge *bridge;
> > > +	struct drm_panel *panel;
> > > +	int ret;
> > > +
> > > +	ret = drm_of_find_panel_or_bridge(np, port, endpoint,
> > > +					  &panel, &bridge);
> > > +	if (ret)
> > > +		return ERR_PTR(ret);
> > > +
> > > +	if (panel)
> > > +		bridge = devm_drm_panel_bridge_add(dev, panel);
> > > +
> > > +	return bridge;
> > 
> > I really like the idea, I've wanted to do something like this for a long
> > time. I however wonder if this is the best approach, or if we could get
> > the panel core to register the bridge itself. The part that bothers me
> > here is the assymetry in the lifetime of the bridges, the returned
> > pointer is either looked up or allocated.
> > 
> > Bridge lifetime is such a mess that it may not make a big difference,
> > but eventually we'll have to address that problem globally.
> 
> We can't have Rust soon enough :)

:-) Jokes aside, Rust or C, this would need a design overhaul as a first
step.

> Does it really matter though? I thought the bridges couldn't be unloaded
> from a DRM device anyway, so for all practical purposes this will be
> removed at around the same time: when the whole DRM device is going to
> be teared down?

Try to unbind a bridge device from its driver in sysfs, and it won't be
pretty.

-- 
Regards,

Laurent Pinchart
