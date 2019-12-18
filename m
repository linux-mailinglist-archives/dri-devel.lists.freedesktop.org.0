Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD92123C53
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 02:18:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EBC66E20D;
	Wed, 18 Dec 2019 01:18:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34E6E6E20D
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 01:18:05 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id AE77633B;
 Wed, 18 Dec 2019 02:18:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1576631883;
 bh=BQvenkVBq3FEvw/dKlr9MKDvAukZ1hiY+8zNV4C6NGY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=INAuL3CtTLIyzT5H4Wys/vccPYjI/VbHi3TCEMOU6ISSefonppCa67c7Mlrte4UQm
 YIS07R6wneuaqIsQsvTZAkNetvCenHS4aSkyviNcAkzEvG6FQY/12Wlhz+P0ZRvYno
 3jrC9S1vqtNIQ6ArSQqh46UYFZSZYBr/EEjL1cvo=
Date: Wed, 18 Dec 2019 03:17:53 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v3 05/50] drm/bridge: Extend bridge API to disable
 connector creation
Message-ID: <20191218011753.GJ4874@pendragon.ideasonboard.com>
References: <20191210225750.15709-1-laurent.pinchart@ideasonboard.com>
 <20191210225750.15709-6-laurent.pinchart@ideasonboard.com>
 <2a52470e-4663-ae58-aece-a91469ce6b5d@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2a52470e-4663-ae58-aece-a91469ce6b5d@ti.com>
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
Cc: Boris Brezillon <bbrezillon@kernel.org>, Sean Paul <sean@poorly.run>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

On Tue, Dec 17, 2019 at 02:12:59PM +0200, Tomi Valkeinen wrote:
> On 11/12/2019 00:57, Laurent Pinchart wrote:
> > Most bridge drivers create a DRM connector to model the connector at the
> > output of the bridge. This model is historical and has worked pretty
> > well so far, but causes several issues:
> > 
> > - It prevents supporting more complex display pipelines where DRM
> > connector operations are split over multiple components. For instance a
> > pipeline with a bridge connected to the DDC signals to read EDID data,
> > and another one connected to the HPD signal to detect connection and
> > disconnection, will not be possible to support through this model.
> > 
> > - It requires every bridge driver to implement similar connector
> > handling code, resulting in code duplication.
> > 
> > - It assumes that a bridge will either be wired to a connector or to
> > another bridge, but doesn't support bridges that can be used in both
> > positions very well (although there is some ad-hoc support for this in
> > the analogix_dp bridge driver).
> > 
> > In order to solve these issues, ownership of the connector should be
> > moved to the display controller driver (where it can be implemented
> > using helpers provided by the core).
> > 
> > Extend the bridge API to allow disabling connector creation in bridge
> > drivers as a first step towards the new model. The new flags argument to
> > the bridge .attach() operation allows instructing the bridge driver to
> > skip creating a connector. Unconditionally set the new flags argument to
> > 0 for now to keep the existing behaviour, and modify all existing bridge
> > drivers to return an error when connector creation is not requested as
> > they don't support this feature yet.
> > 
> > The change is based on the following semantic patch, with manual review
> > and edits.
> > 
> > @ rule1 @
> > identifier funcs;
> > identifier fn;
> > @@
> >   struct drm_bridge_funcs funcs = {
> >   	...,
> >   	.attach = fn
> >   };
> > 
> > @ depends on rule1 @
> > identifier rule1.fn;
> > identifier bridge;
> > statement S, S1;
> > @@
> >   int fn(
> >   	struct drm_bridge *bridge
> > +	, enum drm_bridge_attach_flags flags
> >   )
> >   {
> >   	... when != S
> > +	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
> > +		return -EINVAL;
> > +
> 
> Should there be a dev_err or such here? This should only happen when your setting up a new board, 
> and you try to use a bridge that doesn't support no-connector-mode yet, right?
> 
> I hit this when trying out AM4 EVM with SiI9022 driver. It wasn't too difficult to pinpoint where 
> the failure happens, but an error would have made it immediately obvious.

I hate that you're right as it forces me to re-review the change
manually :-) I'll fix this.

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
