Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 682A61A6B96
	for <lists+dri-devel@lfdr.de>; Mon, 13 Apr 2020 19:42:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7236989D2F;
	Mon, 13 Apr 2020 17:42:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC06F89D2F
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Apr 2020 17:42:27 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8F5C624B;
 Mon, 13 Apr 2020 19:42:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1586799746;
 bh=rFsMHhAgs/Z9TQ4mJld5f73X1Lffqdk5BQW8ZTT+78A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WhR/MsRIKDA7Pls1Ed5x5WnHQzgsCSkgf/hDGTKrc2A/92WkMVKcdSKT1H+fbnTGr
 iAibUt2gRYGcH9vM7IGnHw+8LdEvwi1/yZdZPXTuZQZuhB+HSzSl93AnPHuzumAVGp
 kciDbt5abWzSX0KtYQ/ML+j531yyYGqBmI/iUjHk=
Date: Mon, 13 Apr 2020 20:42:13 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 2/2] drm: bridge: simple-bridge: Make connector creation
 optional
Message-ID: <20200413174213.GF4875@pendragon.ideasonboard.com>
References: <20200409003636.11792-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200409003636.11792-3-laurent.pinchart+renesas@ideasonboard.com>
 <20200413054352.GB6324@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200413054352.GB6324@ravnborg.org>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Andrzej Hajda <a.hajda@samsung.com>, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

On Mon, Apr 13, 2020 at 07:43:52AM +0200, Sam Ravnborg wrote:
> On Thu, Apr 09, 2020 at 03:36:36AM +0300, Laurent Pinchart wrote:
> > Make the connector creation optional to enable usage of the
> > simple-bridge with the DRM bridge connector helper.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> Looks straightforward.
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> 
> Some rambling below you can ignore.
> 
> > ---
> >  drivers/gpu/drm/bridge/simple-bridge.c | 11 ++++-------
> >  1 file changed, 4 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
> > index bac223d0430d..bad638088029 100644
> > --- a/drivers/gpu/drm/bridge/simple-bridge.c
> > +++ b/drivers/gpu/drm/bridge/simple-bridge.c
> > @@ -101,16 +101,14 @@ static int simple_bridge_attach(struct drm_bridge *bridge,
> >  	struct simple_bridge *sbridge = drm_bridge_to_simple_bridge(bridge);
> 
> The code below uses both sbridge-> and bridge->
> It confused me that we access via bridge-> when possilbe and only
> reverts to the "upper" sbridge when needed.
> This is unrelated to this patch - just an observation.
> It makes code shorter so I can see why it is done.
> 
> >  	int ret;
> >  
> > -	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
> > -		DRM_ERROR("Fix bridge driver to make connector optional!");
> > -		return -EINVAL;
> > -	}
> > -
> >  	ret = drm_bridge_attach(bridge->encoder, sbridge->next_bridge, bridge,
> >  				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> >  	if (ret < 0)
> >  		return ret;
> >  
> > +	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
> > +		return 0;
> > +
> >  	if (!bridge->encoder) {
> >  		DRM_ERROR("Missing encoder\n");
> >  		return -ENODEV;
> > @@ -127,8 +125,7 @@ static int simple_bridge_attach(struct drm_bridge *bridge,
> >  		return ret;
> >  	}
> >  
> > -	drm_connector_attach_encoder(&sbridge->connector,
> > -					  bridge->encoder);
> > +	drm_connector_attach_encoder(&sbridge->connector, bridge->encoder);
>
> Unrelated change, but patch is trivial...

I tend not to split trivial cleanups like these in separate patches,
should I ?

> >  
> >  	return 0;
> >  }

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
