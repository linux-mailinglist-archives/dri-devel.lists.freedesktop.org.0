Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29728125DDD
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 10:40:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88B8A6EAEF;
	Thu, 19 Dec 2019 09:40:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5284989C8F
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 09:40:27 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4A1EEE3B;
 Thu, 19 Dec 2019 10:40:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1576748425;
 bh=HEAoJY0mpBPHxvqgHqW2soCMXOz8x9DGC7tpHGXVQTs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=faqqoqkXZnn9lvb+oOuFLkESj8ANTNYcNW0G7WNArkyxQsJVEwTdC0wD+p5ozdQVi
 D5hiELnZPZsexfy/RsZ7xH2heswyJVy+wUySw8172U4EgEfM4WVXzZ/U+Mw/5TDv4P
 2Vk7LMh8/goYx14uKdEJsetiR5DAdHYKFuIsNdDk=
Date: Thu, 19 Dec 2019 11:40:13 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v3 45/50] drm/omap: dpi: Register a drm_bridge
Message-ID: <20191219094013.GA15002@pendragon.ideasonboard.com>
References: <20191210225750.15709-1-laurent.pinchart@ideasonboard.com>
 <20191210225750.15709-46-laurent.pinchart@ideasonboard.com>
 <8f7e454b-4d63-37cf-ef83-77e23e90e07d@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8f7e454b-4d63-37cf-ef83-77e23e90e07d@ti.com>
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

On Thu, Dec 19, 2019 at 11:21:03AM +0200, Tomi Valkeinen wrote:
> On 11/12/2019 00:57, Laurent Pinchart wrote:
> > In order to integrate with a chain of drm_bridge, the internal DPI
> > output has to expose its operations through the drm_bridge API.
> > Register a bridge at initialisation time to do so and remove the
> > omap_dss_device operations that are now unused.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> > Changes since v2:
> > 
> > - Unregister bridge if port initialisation fails
> > ---
> >   drivers/gpu/drm/omapdrm/dss/dpi.c | 197 ++++++++++++++++++------------
> >   1 file changed, 119 insertions(+), 78 deletions(-)
> 
> I don't think DPI is really a bridge, as it's really just direct
> output from the DISPC (level shifted). But that probably doesn't
> matter, and bridge is a good way to manage the DPI output.

No disagreement as long as we can use drm_bridge :-)

> > +static void dpi_bridge_mode_set(struct drm_bridge *bridge,
> > +				 const struct drm_display_mode *mode,
> > +				 const struct drm_display_mode *adjusted_mode)
> > +{
> > +	struct dpi_data *dpi = drm_bridge_to_dpi(bridge);
> > +
> > +	mutex_lock(&dpi->lock);
> > +	dpi->pixelclock = adjusted_mode->clock * 1000;
> > +	mutex_unlock(&dpi->lock);
> > +}
> 
> What's the lock protecting? Why do we lock here, but not e.g. in
> mode_fixup?

Not much anymore it seems.

> Do we ever get drm_bridge_funcs calls from multiple threads at the
> same time? Is there a difference between having a single DPI output,
> or multiple DPI outputs (i.e. can two different DPI outputs get calls
> simultaneously?).

I'll drop the lock, it's not needed. The core should serialize calls to
the bridge, at least per output. For different outputs, there's a
possibility I believe of atomic commits being handled concurrently if
they don't share any resource.

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
