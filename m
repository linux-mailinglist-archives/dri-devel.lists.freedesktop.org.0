Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A32B22E266
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jul 2020 21:57:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A56806E055;
	Sun, 26 Jul 2020 19:57:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37C246E055
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jul 2020 19:57:50 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 6D3E820023;
 Sun, 26 Jul 2020 21:57:44 +0200 (CEST)
Date: Sun, 26 Jul 2020 21:57:43 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 13/21] drm/bridge: megachips: add helper to create
 connector
Message-ID: <20200726195743.GA3676671@ravnborg.org>
References: <20200703192417.372164-1-sam@ravnborg.org>
 <20200703192417.372164-14-sam@ravnborg.org>
 <20200710223430.GQ5964@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200710223430.GQ5964@pendragon.ideasonboard.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=pGLkceISAAAA:8 a=OScXe70xAAAA:8
 a=gvl4HP8tAAAA:8 a=hD80L64hAAAA:8 a=IpJZQVW2AAAA:8 a=P1BnusSwAAAA:8
 a=RwHePtW7AAAA:8 a=e5mUnYsNAAAA:8 a=D9YjfHG8e1lcWXfFbEwA:9
 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22 a=X7_D5SgixhGjaE2bLVSS:22
 a=tRkgsvjveJ3YVe9fnr1q:22 a=IawgGOuG5U0WyFbmm1f5:22
 a=D0XLA9XvdZm18NrgonBM:22 a=FqraQwd7dyEg5dwJgZJs:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, kbuild test robot <lkp@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Peter Senna Tschudin <peter.senna@gmail.com>, dri-devel@lists.freedesktop.org,
 Martyn Welch <martyn.welch@collabora.co.uk>,
 Andrzej Hajda <a.hajda@samsung.com>, Jonas Karlman <jonas@kwiboo.se>,
 Thierry Reding <thierry.reding@gmail.com>,
 Martin Donnelly <martin.donnelly@ge.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jul 11, 2020 at 01:34:30AM +0300, Laurent Pinchart wrote:
> Hi Sam,
> 
> Thank you for the patch.
> 
> On Fri, Jul 03, 2020 at 09:24:09PM +0200, Sam Ravnborg wrote:
> > Factor out connector creation to a small helper function.
> > 
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Peter Senna Tschudin <peter.senna@gmail.com>
> > Cc: Martin Donnelly <martin.donnelly@ge.com>
> > Cc: Martyn Welch <martyn.welch@collabora.co.uk>
> > Cc: Andrzej Hajda <a.hajda@samsung.com>
> > Cc: Neil Armstrong <narmstrong@baylibre.com>
> > Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> > Cc: Jonas Karlman <jonas@kwiboo.se>
> > Cc: Jernej Skrabec <jernej.skrabec@siol.net>
> > ---
> >  .../bridge/megachips-stdpxxxx-ge-b850v3-fw.c  | 47 +++++++++++--------
> >  1 file changed, 27 insertions(+), 20 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> > index 6200f12a37e6..258e0525cdcc 100644
> > --- a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> > +++ b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> > @@ -191,6 +191,32 @@ static const struct drm_connector_funcs ge_b850v3_lvds_connector_funcs = {
> >  	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> >  };
> >  
> > +static int ge_b850v3_lvds_create_connector(struct drm_bridge *bridge)
> > +{
> > +	struct drm_connector *connector = &ge_b850v3_lvds_ptr->connector;
> 
> Wow, storing device state in a global variable... :-( How did this go
> past review ?
Took a short look at eliminating this.
But there are two module entries involved so I droppet it again.

> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> > +	int ret;
> > +
> > +	if (!bridge->encoder) {
> > +		DRM_ERROR("Parent encoder object not found");
> > +		return -ENODEV;
> > +	}
> > +
> > +	connector->polled = DRM_CONNECTOR_POLL_HPD;
> > +
> > +	drm_connector_helper_add(connector,
> > +				 &ge_b850v3_lvds_connector_helper_funcs);
> > +
> > +	ret = drm_connector_init(bridge->dev, connector,
> > +				 &ge_b850v3_lvds_connector_funcs,
> > +				 DRM_MODE_CONNECTOR_DisplayPort);
> > +	if (ret) {
> > +		DRM_ERROR("Failed to initialize connector with drm\n");
> > +		return ret;
> > +	}
> > +
> > +	return drm_connector_attach_encoder(connector, bridge->encoder);
> > +}
> > +
> >  static irqreturn_t ge_b850v3_lvds_irq_handler(int irq, void *dev_id)
> >  {
> >  	struct i2c_client *stdp4028_i2c
> > @@ -209,7 +235,6 @@ static irqreturn_t ge_b850v3_lvds_irq_handler(int irq, void *dev_id)
> >  static int ge_b850v3_lvds_attach(struct drm_bridge *bridge,
> >  				 enum drm_bridge_attach_flags flags)
> >  {
> > -	struct drm_connector *connector = &ge_b850v3_lvds_ptr->connector;
> >  	struct i2c_client *stdp4028_i2c
> >  			= ge_b850v3_lvds_ptr->stdp4028_i2c;
> >  	int ret;
> > @@ -219,25 +244,7 @@ static int ge_b850v3_lvds_attach(struct drm_bridge *bridge,
> >  		return -EINVAL;
> >  	}
> >  
> > -	if (!bridge->encoder) {
> > -		DRM_ERROR("Parent encoder object not found");
> > -		return -ENODEV;
> > -	}
> > -
> > -	connector->polled = DRM_CONNECTOR_POLL_HPD;
> > -
> > -	drm_connector_helper_add(connector,
> > -				 &ge_b850v3_lvds_connector_helper_funcs);
> > -
> > -	ret = drm_connector_init(bridge->dev, connector,
> > -				 &ge_b850v3_lvds_connector_funcs,
> > -				 DRM_MODE_CONNECTOR_DisplayPort);
> > -	if (ret) {
> > -		DRM_ERROR("Failed to initialize connector with drm\n");
> > -		return ret;
> > -	}
> > -
> > -	ret = drm_connector_attach_encoder(connector, bridge->encoder);
> > +	ret = ge_b850v3_lvds_create_connector(bridge);
> >  	if (ret)
> >  		return ret;
> >  
> 
> -- 
> Regards,
> 
> Laurent Pinchart
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
