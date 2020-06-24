Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFAB820968C
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jun 2020 00:48:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F56C6E0D3;
	Wed, 24 Jun 2020 22:47:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C27E6E0D3
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 22:47:57 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 21CD22A8;
 Thu, 25 Jun 2020 00:47:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1593038875;
 bh=1phuELyAWC9kiLJ0qWlCpumeJ0WEjE52rPQPBrntzdU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uzkvI7/3NU65bdE16DR0ZnU58cC2uQGTek3RWQs5WYtZruSJi4ZeMZ8vPOp7xyzIu
 ho/8fi0PXgpTC9SUpq5vmEzNsH43eQZZ5veeuix7YW2OyDpLI5A8xoREXUj58kEfGh
 /SGkLTs9eACNuCF4tpF4Rm3dKHMiucQXs88hfGIk=
Date: Thu, 25 Jun 2020 01:47:54 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 27/27] drm: Add default modes for connectors in unknown
 state
Message-ID: <20200624224754.GJ5980@pendragon.ideasonboard.com>
References: <20200526011505.31884-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200526011505.31884-28-laurent.pinchart+renesas@ideasonboard.com>
 <20200621084000.GM74146@ravnborg.org>
 <20200624011209.GU5870@pendragon.ideasonboard.com>
 <20200624072304.GT20149@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200624072304.GT20149@phenom.ffwll.local>
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
 Jonas Karlman <jonas@kwiboo.se>, Neil Armstrong <narmstrong@baylibre.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Andrzej Hajda <a.hajda@samsung.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

On Wed, Jun 24, 2020 at 09:23:04AM +0200, Daniel Vetter wrote:
> On Wed, Jun 24, 2020 at 04:12:09AM +0300, Laurent Pinchart wrote:
> > On Sun, Jun 21, 2020 at 10:40:00AM +0200, Sam Ravnborg wrote:
> > > On Tue, May 26, 2020 at 04:15:05AM +0300, Laurent Pinchart wrote:
> > > > The DRM CRTC helpers add default modes to connectors in the connected
> > > > state if no mode can be retrieved from the connector. This behaviour is
> > > > useful for VGA or DVI outputs that have no connected DDC bus. However,
> > > > in such cases, the status of the output usually can't be retrieved and
> > > > is reported as connector_status_unknown.
> > > > 
> > > > Extend the addition of default modes to connectors in an unknown state
> > > > to support outputs that can retrieve neither the modes nor the
> > > > connection status.
> > > > 
> > > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > 
> > > From your description sounds like an OK approach.
> > > But this is not something I feel too familiar with.
> > > Acked-by: Sam Ravnborg <sam@ravnborg.org>
> > 
> > Thanks for the ack. I'd like to have Daniel's (CC'ed) feedback on this
> > too.
> 
> Makes sense, and at least pre-coffee me can't immediately think of a
> scenario where we're going to regret this. _unknown status is pretty much
> limited to old VGA and similar things where load detect somehow isn't well
> supported by the hw.
> 
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> > > > ---
> > > >  drivers/gpu/drm/drm_probe_helper.c       | 3 ++-
> > > >  include/drm/drm_modeset_helper_vtables.h | 8 +++++++-
> > > >  2 files changed, 9 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
> > > > index f5d141e0400f..9055d9573c90 100644
> > > > --- a/drivers/gpu/drm/drm_probe_helper.c
> > > > +++ b/drivers/gpu/drm/drm_probe_helper.c
> > > > @@ -491,7 +491,8 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
> > > >  	if (count == 0 && connector->status == connector_status_connected)
> > > >  		count = drm_add_override_edid_modes(connector);
> > > >  
> > > > -	if (count == 0 && connector->status == connector_status_connected)
> > > > +	if (count == 0 && (connector->status == connector_status_connected ||
> > > > +			   connector->status == connector_status_unknown))
> > > >  		count = drm_add_modes_noedid(connector, 1024, 768);
> > > >  	count += drm_helper_probe_add_cmdline_mode(connector);
> > > >  	if (count == 0)
> > > > diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
> > > > index 421a30f08463..afe55e2e93d2 100644
> > > > --- a/include/drm/drm_modeset_helper_vtables.h
> > > > +++ b/include/drm/drm_modeset_helper_vtables.h
> > > > @@ -876,13 +876,19 @@ struct drm_connector_helper_funcs {
> > > >  	 * The usual way to implement this is to cache the EDID retrieved in the
> > > >  	 * probe callback somewhere in the driver-private connector structure.
> > > >  	 * In this function drivers then parse the modes in the EDID and add
> > > > -	 * them by calling drm_add_edid_modes(). But connectors that driver a
> > > > +	 * them by calling drm_add_edid_modes(). But connectors that drive a
> > > >  	 * fixed panel can also manually add specific modes using
> > > >  	 * drm_mode_probed_add(). Drivers which manually add modes should also
> > > >  	 * make sure that the &drm_connector.display_info,
> > > >  	 * &drm_connector.width_mm and &drm_connector.height_mm fields are
> > > >  	 * filled in.
> > > >  	 *
> > > > +	 * Note that the caller function will automatically add standard VESA
> > > > +	 * DMT modes up to 1024x768 if the .get_modes() helper operation returns
> > > > +	 * no mode and if the connector status is connector_status_connected or
> > > > +	 * connector_status_unknown. There is no need to call
> > > > +	 * drm_add_edid_modes() manually in that case.
> 
> Hm calling drm_add_edid_modes if you have no edid is a bit a funny idea
> ... Personally I'd just leave out the last sentence, I think that only
> confuses readers. Or I'm not grasphing what you're trying to tell here.

Sorry, I meant drm_add_modes_noedid(). Is that clearer ?

> r-b with or without this change since imo super tiny nit.
> 
> > > > +	 *
> > > >  	 * Virtual drivers that just want some standard VESA mode with a given
> > > >  	 * resolution can call drm_add_modes_noedid(), and mark the preferred
> > > >  	 * one using drm_set_preferred_mode().

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
