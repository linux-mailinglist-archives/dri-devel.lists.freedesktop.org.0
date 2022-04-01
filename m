Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA2D4EEAD7
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 11:59:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12EC310E21E;
	Fri,  1 Apr 2022 09:59:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7F8C10E21E
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 09:58:58 +0000 (UTC)
Received: from pendragon.ideasonboard.com (85-76-78-4-nat.elisa-mobile.fi
 [85.76.78.4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 850A0F8;
 Fri,  1 Apr 2022 11:58:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1648807136;
 bh=dTWPmCCjy6b9dJ4ZjNnrKHUT7VqULi/xRJ1mlbqiPrE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YR3zqMT8fcikfNFRBdmLEF9wdgeYK7ieQTkNzsBquzn0CWEFhZT+6CsbibiIWT02M
 B+4i4KrcMyyi4HdgMQBMUh7MJ48y1Q5hwVzPB3edOqUt3NSCUz9446/s+L7ZYHTOjE
 XgLalRGp3xdefq5osvibleckLyQ/JsaMCj1tXWog=
Date: Fri, 1 Apr 2022 12:58:54 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] dt-bindings: display: bridge: Drop requirement on input
 port for DSI devices
Message-ID: <YkbM3lkX61F2gbxE@pendragon.ideasonboard.com>
References: <20220323154823.839469-1-maxime@cerno.tech>
 <YkY+1IZtQ8oSi7wR@robh.at.kernel.org>
 <b3dcf3fe-63a0-fbef-a3c4-f42e8cd395fe@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b3dcf3fe-63a0-fbef-a3c4-f42e8cd395fe@denx.de>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>, dri-devel@lists.freedesktop.org,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Frank Rowand <frowand.list@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 01, 2022 at 03:22:19AM +0200, Marek Vasut wrote:
> On 4/1/22 01:52, Rob Herring wrote:
> > On Wed, 23 Mar 2022 16:48:23 +0100, Maxime Ripard wrote:
> >> MIPI-DSI devices, if they are controlled through the bus itself, have to
> >> be described as a child node of the controller they are attached to.
> >>
> >> Thus, there's no requirement on the controller having an OF-Graph output
> >> port to model the data stream: it's assumed that it would go from the
> >> parent to the child.
> >>
> >> However, some bridges controlled through the DSI bus still require an
> >> input OF-Graph port, thus requiring a controller with an OF-Graph output
> >> port. This prevents those bridges from being used with the controllers
> >> that do not have one without any particular reason to.
> >>
> >> Let's drop that requirement.
> >>
> >> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> >> ---
> >>   .../devicetree/bindings/display/bridge/chipone,icn6211.yaml      | 1 -
> >>   .../devicetree/bindings/display/bridge/toshiba,tc358762.yaml     | 1 -
> >>   2 files changed, 2 deletions(-)
> >>
> > 
> > I tend to agree with port@0 not being needed and really like
> > consistency.
> 
> The consistent thing to do would be to always use port@0 and OF graph, no ?

I think that's the direction we should take in the long term. I'm not
opposed to a short-term consistency-focussed patch that makes the port
optional, as long as there's an agreement on the long term goal and this
patch won't be used as an argument against it in the future.

-- 
Regards,

Laurent Pinchart
