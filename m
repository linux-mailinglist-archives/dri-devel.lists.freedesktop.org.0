Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4609129F8A1
	for <lists+dri-devel@lfdr.de>; Thu, 29 Oct 2020 23:49:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06EF96E920;
	Thu, 29 Oct 2020 22:49:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 021466E920
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 22:49:07 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6596850E;
 Thu, 29 Oct 2020 23:49:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1604011746;
 bh=HpOj4aA4dmtkEDrOn7oenTsUJ/yzJlXRU2JcQ1eVp1k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eWSKjWD4zNlciuUf32v3aE46igPy5ULxFmPztTN1l5YENj+IUhj0LC04JccnLhBNt
 EcDXdQhW2OEP4mTBZe0dmq02McRNgtgU2YNjztmqOROpNMtYoq06VR7BnypsP5nggQ
 9fg8N0E5Dc68a0MpCYatsHQXGim7zpMnEDLAxRNE=
Date: Fri, 30 Oct 2020 00:48:17 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Nikhil Devshatwar <nikhil.nd@ti.com>
Subject: Re: [PATCH 3/5] drm: bridge: Propagate the bus flags from
 bridge->timings
Message-ID: <20201029224817.GH15024@pendragon.ideasonboard.com>
References: <20201016103917.26838-1-nikhil.nd@ti.com>
 <20201016103917.26838-4-nikhil.nd@ti.com>
 <fd65aa92-bc89-2420-bbc1-e131db1f6c25@ti.com>
 <20201028143453.njt3lak542wwx6jb@NiksLab>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201028143453.njt3lak542wwx6jb@NiksLab>
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, Sekhar Nori <nsekhar@ti.com>,
 Swapnil Jakhade <sjakhade@cadence.com>, dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

On Wed, Oct 28, 2020 at 08:04:53PM +0530, Nikhil Devshatwar wrote:
> On 14:31-20201021, Tomi Valkeinen wrote:
> > On 16/10/2020 13:39, Nikhil Devshatwar wrote:
> > > When the next bridge does not specify any bus flags, use the
> > > bridge->timings->input_bus_flags as fallback when propagating
> > > bus flags from next bridge to current bridge.
> > > 
> > > Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> > > ---
> > >  drivers/gpu/drm/drm_bridge.c | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> > > index 64f0effb52ac..8353723323ab 100644
> > > --- a/drivers/gpu/drm/drm_bridge.c
> > > +++ b/drivers/gpu/drm/drm_bridge.c
> > > @@ -975,6 +975,13 @@ drm_atomic_bridge_propagate_bus_flags(struct drm_bridge *bridge,
> > >  	 * duplicate the "dummy propagation" logic.
> > >  	 */
> > >  	bridge_state->input_bus_cfg.flags = output_flags;
> > > +
> > > +	/*
> > > +	 * Use the bridge->timings->input_bus_flags as fallback if the next bridge
> > > +	 * does not specify the flags
> > > +	 */
> > > +	if (!bridge_state->input_bus_cfg.flags)
> > > +		bridge_state->input_bus_cfg.flags = bridge->timings->input_bus_flags;
> > 
> > According to docs, timings can be NULL.

Correct.

> > And, hmm... It's too easy to get confused with these, but... If the bridge defines timings, and
> > timings->input_bus_flags != 0, should we always pick that, even if we got something via
> > output_flags? Logic being, if this bridge defines timings->input_bus_flags, it probably wants that
> > to be used regardless whether we got something from the next bridge.

timings->input_bus_flags is an API that predates format and flags
propagation along the pipeline. I would assume that drivers that
implement propagation should do so in a way that prioritize that API,
and either not report flags in the timings (in which case giving
priority to one or another wouldn't make a difference as both would
never be provided together), or would report flags in the timings as a
best effort fallback for display controller drivers that would look at
them exclusively without supporting the new API. I would thus think that
the flags obtained through format negotiation should be prioritized.

> Got it, the flags from timings if present should be prioritized rather
> than treating them as fallback.

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
