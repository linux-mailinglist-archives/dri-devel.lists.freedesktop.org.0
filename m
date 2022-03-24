Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A5B4E6445
	for <lists+dri-devel@lfdr.de>; Thu, 24 Mar 2022 14:43:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D7D610E8D8;
	Thu, 24 Mar 2022 13:43:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC57810E8D8
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 13:43:45 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C07341844;
 Thu, 24 Mar 2022 14:43:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1648129424;
 bh=yKojlimx3X2qR4ZurdIw6SsvekJenUgptF2ST/1O3YU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=n5v11cXDEPG6qh/00PsIcpx3JqMHHzwsLHwnQIYz/aznuoEk/Jtugt0lSoweyGk37
 j6F9Z+cB2xYm1peSt5xWvS1fTt9gLfoaQqrTW/OpJqimeLyCAPYr6au+DNE80HLv2H
 yP3TGMdHqLsk+5sspZDipQ6JiytWzlr28mf08U9I=
Date: Thu, 24 Mar 2022 15:43:42 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH] dt-bindings: display: bridge: Drop requirement on input
 port for DSI devices
Message-ID: <Yjx1jjB2hWqOPGsi@pendragon.ideasonboard.com>
References: <20220323154823.839469-1-maxime@cerno.tech>
 <YjuFO45Gr1vmKxWG@pendragon.ideasonboard.com>
 <20220324081819.niz4pdqu3j7n2ivh@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220324081819.niz4pdqu3j7n2ivh@houat>
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Sakari Ailus <sakari.ailus@iki.fi>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Frank Rowand <frowand.list@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On Thu, Mar 24, 2022 at 09:18:19AM +0100, Maxime Ripard wrote:
> On Wed, Mar 23, 2022 at 10:38:19PM +0200, Laurent Pinchart wrote:
> > Hi Maxime,
> > 
> > (CC'ing Sakari)
> > 
> > Thank you for the patch.
> > 
> > On Wed, Mar 23, 2022 at 04:48:23PM +0100, Maxime Ripard wrote:
> > > MIPI-DSI devices, if they are controlled through the bus itself, have to
> > > be described as a child node of the controller they are attached to.
> > > 
> > > Thus, there's no requirement on the controller having an OF-Graph output
> > > port to model the data stream: it's assumed that it would go from the
> > > parent to the child.
> > > 
> > > However, some bridges controlled through the DSI bus still require an
> > > input OF-Graph port, thus requiring a controller with an OF-Graph output
> > > port. This prevents those bridges from being used with the controllers
> > > that do not have one without any particular reason to.
> > > 
> > > Let's drop that requirement.
> > 
> > I'm sure this won't come as a surprise, I'm very much opposed to this
> > change, for two reasons.
> > 
> > First, ports are part of the hardware, even if they're not connected. It
> > thus simplifies handling in drivers if they're always present.
> > 
> > Then, and that's the most important reason, I think it's a mistake not
> > to model the DSI data connection using OF graph unconditionally, even
> > when the DSI sink device is also controlled through the DSI bus (using
> > DCS) and is in that case a child of the DSI source device in the DT
> > hierarchy.
> 
> That's the way we do for any other device though. You never addressed
> that comment, but it's very much the same that occurs for i2c or spi
> controllers and their device. They all get their data from the parent
> bus. I don't see you advocate for using OF-Graph for those devices.

Those are different, there's no data stream independent of the control
communications.

> > The device tree describes a control hierarchy between devices. OF graph
> > overlays on top of that a data transfer graph. The two are different
> > concepts, and the fact that DSI can sometimes be used as a control bus
> > doesn't change the concept. Using OF graph unconditionally to describe
> > the data connections for DSI leads to less variation in the device tree
> > structure, and thus less complexity in the implementation. We're
> > suffering from the fact we haven't made it a requirement in the first
> > place, which can't be fixed due to ABI breakage constraints, but let's
> > not acknowledge it as a good idea.
> 
> Honestly, it doesn't matter one bit.
> 
> We have a huge discrepancy here today, and only a couple of bridges have
> that arbitrary restriction. The situation you don't want to acknowledge
> is the de-facto standard, by the generic binding and by what all the
> bridges and panels are implementing. Even panel-simple-dsi is doing it.
> So it's very much there already.

It's here, and I think we should move away from it for new DSI sinks.
I'd like OF graph to be used consistently for new drivers. We can't
change existing DT bindings and drivers to drop support for the
non-OF-graph description due to ABI stability, but we can avoid
repeating the mistake going forward.

> What I'm trying to address here is that some controllers that do
> everything right can't be used because that restriction is completely
> arbitrary and in opposition to the consensus. And they can't be used
> *today*.
> 
> If we want to change that consensus, fine, but we should still have one.
> Having some bridges enforcing custom rules for no reason is very much
> unacceptable.
> 
> And changing that consensus won't happen overtime, we'll have to take
> care of the backward compatibility, etc. So it won't fix the issue that
> we can't use any bridge with any controller any time soon.

I don't think that's the issue at hand here. You can still use a
non-OF-graph DT event if the nodes for the two bridges affected by this
patch define a port@0. It can just be left unconnected.

I do agree it will cause some DT bindings for DCS-based DSI sinks to
have ports will others won't. If your concern is that all DT bindings
should be coherent, would you be OK with a patch that makes the sink
port mandatory in all DT bindings for DSI bridges and panels (and fixes
the mainline DT sources accordingly to make sure they validate) ? The
port would not be connected of course (at least when used with DSI
source drivers that don't use OF graph today). That would make DT
bindings coherent, and would be a first step towards using OF graph
everywhere.

-- 
Regards,

Laurent Pinchart
