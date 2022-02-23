Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D35E64C1892
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 17:25:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 399AE10EF19;
	Wed, 23 Feb 2022 16:25:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A449B10EF0F
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 16:25:40 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 10E72DD;
 Wed, 23 Feb 2022 17:25:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1645633539;
 bh=jrmCHWFRGOLJqkMq11kwRKSZJYAjy2AX+di5X8gmw4U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WOlx9DB0zVMVtsuVjN83dGX3leXY0eHBBf5QaPSm9p+gxvgJwbZZwjgdCmkiv/f+e
 JB2K2fdAa/8MzTgpaRmx6JbsBmi5KoeBKNr5+aG7h1JDXJRr/3h1ob6vJTN1SqVaFT
 O1MTsLSHrfqNqYjrZ3HnYVtRjS1YNeDWlTQbkGi8=
Date: Wed, 23 Feb 2022 18:25:28 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: Re: [PATCH] drm/bridge_connector: enable HPD by default if supported
Message-ID: <YhZf+Fs2AP+btuJj@pendragon.ideasonboard.com>
References: <20211225063151.2110878-1-nikita.yoush@cogentembedded.com>
 <Yczy3UYpU2UMFQ6N@pendragon.ideasonboard.com>
 <164563304251.4066078.10022034509552549983@Monstersaurus>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <164563304251.4066078.10022034509552549983@Monstersaurus>
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
Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Jacopo Mondi <jacopo+renesas@jmondi.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

On Wed, Feb 23, 2022 at 04:17:22PM +0000, Kieran Bingham wrote:
> Quoting Laurent Pinchart (2021-12-29 23:44:29)
> > On Sat, Dec 25, 2021 at 09:31:51AM +0300, Nikita Yushchenko wrote:
> > > Hotplug events reported by bridge drivers over drm_bridge_hpd_notify()
> > > get ignored unless somebody calls drm_bridge_hpd_enable(). When the
> > > connector for the bridge is bridge_connector, such a call is done from
> > > drm_bridge_connector_enable_hpd().
> > > 
> > > However drm_bridge_connector_enable_hpd() is never called on init paths,
> > > documentation suggests that it is intended for suspend/resume paths.
> > 
> > Hmmmm... I'm in two minds about this. The problem description is
> > correct, but I wonder if HPD should be enabled unconditionally here, or
> > if this should be left to display drivers to control.
> > drivers/gpu/drm/imx/dcss/dcss-kms.c enables HPD manually at init time,
> > other drivers don't.
> > 
> > It feels like this should be under control of the display controller
> > driver, but I can't think of a use case for not enabling HPD at init
> > time. Any second opinion from anyone ?
> 
> This patch solves an issue I have where I have recently enabled HPD on
> the SN65DSI86, but without this, I do not get calls to my .hpd_enable or
> .hpd_disable hooks that I have added to the ti_sn_bridge_funcs.
> 
> So it needs to be enabled somewhere, and this seems reasonable to me?
> It's not directly related to the display controller - as it's a factor
> of the bridge?
> 
> On Falcon-V3U with HPD additions to SN65DSI86:
> Tested-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

If you think this is right, then

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> > > In result, once encoders are switched to bridge_connector,
> > > bridge-detected HPD stops working.
> > > 
> > > This patch adds a call to that API on init path.
> > > 
> > > This fixes HDMI HPD with rcar-du + adv7513 case when adv7513 reports HPD
> > > events via interrupts.
> > > 
> > > Fixes: c24110a8fd09 ("drm: rcar-du: Use drm_bridge_connector_init() helper")
> > > Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
> > > ---
> > >  drivers/gpu/drm/drm_bridge_connector.c | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
> > > index 791379816837..4f20137ef21d 100644
> > > --- a/drivers/gpu/drm/drm_bridge_connector.c
> > > +++ b/drivers/gpu/drm/drm_bridge_connector.c
> > > @@ -369,8 +369,10 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
> > >                                   connector_type, ddc);
> > >       drm_connector_helper_add(connector, &drm_bridge_connector_helper_funcs);
> > >  
> > > -     if (bridge_connector->bridge_hpd)
> > > +     if (bridge_connector->bridge_hpd) {
> > >               connector->polled = DRM_CONNECTOR_POLL_HPD;
> > > +             drm_bridge_connector_enable_hpd(connector);
> > > +     }
> > >       else if (bridge_connector->bridge_detect)
> > >               connector->polled = DRM_CONNECTOR_POLL_CONNECT
> > >                                 | DRM_CONNECTOR_POLL_DISCONNECT;

-- 
Regards,

Laurent Pinchart
