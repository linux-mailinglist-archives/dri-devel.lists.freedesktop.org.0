Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2392DC26D
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 15:44:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C55556E0CF;
	Wed, 16 Dec 2020 14:44:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DA4E6E0CF
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 14:44:07 +0000 (UTC)
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it
 [93.34.118.233]) (Authenticated sender: jacopo@jmondi.org)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 610E0C000B;
 Wed, 16 Dec 2020 14:44:05 +0000 (UTC)
Date: Wed, 16 Dec 2020 15:44:15 +0100
From: Jacopo Mondi <jacopo@jmondi.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 1/4] drm: rcar-du: lvds: Convert to DRM panel bridge
 helper
Message-ID: <20201216144415.dobj5pn54ceres7j@uno.localdomain>
References: <20201216005021.19518-1-laurent.pinchart+renesas@ideasonboard.com>
 <20201216005021.19518-2-laurent.pinchart+renesas@ideasonboard.com>
 <20201216131656.hinoo4tpannaboqm@uno.localdomain>
 <X9oQZAEB3pbfGSZc@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <X9oQZAEB3pbfGSZc@pendragon.ideasonboard.com>
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

Hi Laurent,

On Wed, Dec 16, 2020 at 03:49:24PM +0200, Laurent Pinchart wrote:
> Hi Jacopo,
>
> > > +	if (lvds->panel) {
> > > +		lvds->next_bridge = devm_drm_panel_bridge_add(lvds->dev,
> > > +							      lvds->panel);
> >
> > Reading the devm_drm_panel_bridge_add() function documentation:
> >
> >  * devm_drm_panel_bridge_add - Creates a managed &drm_bridge and &drm_connector
> >
> > Doesn't this conflict with the drm_bridge_connector_init() called by
> > the encoder in [4/4] ?
>
> It would, if the documentation was right :-) The function only creates a
> bridge. A connector will only be created when the bridge is attached
> without DRM_BRIDGE_ATTACH_NO_CONNECTOR.

Well, reading it again, it is kind of implied that if NO_CONNECTOR is
given to the bridge, no connector will be registered at all.

>
> Would you like to send a patch to fix the documentation ?
>
> > > +		if (IS_ERR_OR_NULL(lvds->next_bridge)) {
> > > +			ret = -EINVAL;
> > > +			goto done;
> > > +		}
> > > +	}
> > > +
> > >  	if (lvds->info->quirks & RCAR_LVDS_QUIRK_DUAL_LINK)
> > >  		ret = rcar_lvds_parse_dt_companion(lvds);
> > >
>
> --
> Regards,
>
> Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
