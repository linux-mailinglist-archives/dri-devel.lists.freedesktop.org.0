Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D7E3AF5C4
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 21:00:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EC8E6E3EB;
	Mon, 21 Jun 2021 19:00:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 930D46E3D6
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 19:00:40 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8ACCF5D6B;
 Mon, 21 Jun 2021 21:00:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1624302038;
 bh=xMbLrsqFQgLO000qHWcpbhX1PSnZ/Gn8gGSn4kGajJ4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UpCijo+cfC3dV8NbQC814d+KV57WlGiN1pIY5cx0igC9I2KcwTwcqvcMmd/WuRIIO
 E+OWjQthn5FMfr7uqGa0/Pm1PEYZZVzoHEVJRsjV29NnnCLPwc39xpx8XfOZWEMAvB
 98dwWEeS2vGPa69CSggVsz8AGF8RiIVlsJqnJJbc=
Date: Mon, 21 Jun 2021 22:00:11 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 0/5] ti-sn65dsi83: Finalize transition to atomic operations
Message-ID: <YNDhuwRErUEeE19+@pendragon.ideasonboard.com>
References: <20210621125518.13715-1-laurent.pinchart@ideasonboard.com>
 <20210621184953.GC918146@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210621184953.GC918146@ravnborg.org>
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
Cc: Marek Vasut <marex@denx.de>, Loic Poulain <loic.poulain@linaro.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Robert Foss <robert.foss@linaro.org>, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Valentin Raevsky <valentin@compulab.co.il>, Stephen Boyd <swboyd@chromium.org>,
 Adam Ford <aford173@gmail.com>, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

On Mon, Jun 21, 2021 at 08:49:53PM +0200, Sam Ravnborg wrote:
> On Mon, Jun 21, 2021 at 03:55:13PM +0300, Laurent Pinchart wrote:
> > Hello,
> > 
> > This patch series is based on top of "[PATCH] drm/bridge: ti-sn65dsi83:
> > Replace connector format patching with atomic_get_input_bus_fmts". It
> > completes the transition to atomic operations in the ti-sn65dsi83
> > driver. The main reason for this change is patch 4/5 that fixes a few
> > issues in the driver (see the patch's commit message for details), but
> > overall it also brings the driver to the most recent API which is nice
> > in itself.
> > 
> > Laurent Pinchart (5):
> >   drm: bridge: ti-sn65dsi83: Move LVDS format selection to .mode_set()
> >   drm: bridge: ti-sn65dsi83: Pass mode explicitly to helper functions
> >   drm: bridge: ti-sn65dsi83: Switch to atomic operations
> >   drm: bridge: ti-sn65dsi83: Retrieve output format from bridge state
> >   drm: bridge: ti-sn65dsi83: Retrieve the display mode from the state
> > 
> >  drivers/gpu/drm/bridge/ti-sn65dsi83.c | 166 +++++++++++++-------------
> >  1 file changed, 82 insertions(+), 84 deletions(-)
> 
> I have browsed the series and it all looked good.
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> 
> on them all.
> 
> It is news to me that the atomic ops are the way to go - but then I have
> been off-line for a while so no suprise or maybe I just missed it
> before.

They're not mandatory as such, but they give us access to the atomic
state, which is sometimes required. Overall I think it would be nice to
move to the atomic operations and drop the legacy ones, to avoid
maintaining two sets of operations. It will take time :-)

> It would be good if the comments in drm_bridge.h could point out what is
> deprecated, so we know what to avoid in new and updated bridge drivers.
> But this is all un-related to this series.

It's a good point. Would you like to submit a patch, or should I do so ?

-- 
Regards,

Laurent Pinchart
