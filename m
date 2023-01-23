Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4E66780E0
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 17:05:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 966F710E501;
	Mon, 23 Jan 2023 16:05:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB1EB10E4FA
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 16:05:20 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2507B2D9;
 Mon, 23 Jan 2023 17:05:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1674489919;
 bh=rtpuuM/0/Ik1tlzGJltsRahHhvIG5qRN19lfY1L+tQ0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=F+lBd06HpR8XKUcTZXgOOjRqgm/WVRT5I/LPrzW7jqaDXk371mYahDJRF3A06eqld
 f0QjJVd6x/thjXTTO/mcFh5W720DMJfg0tghGaEn2SKUG65NmXrYbayqK3TcQlnKl7
 lw6w53vzWYyCm+Mb+ligdulLJ34QXi0VINWawI4s=
Date: Mon, 23 Jan 2023 18:05:15 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: John Keeping <john@metanate.com>
Subject: Re: [PATCH] drm/bridge: panel: Set orientation on panel_bridge
 connector
Message-ID: <Y86wO8nvFbC81b1S@pendragon.ideasonboard.com>
References: <20230120114313.2087015-1-john@metanate.com>
 <CAD=FV=UPD6c+NY8Ub37N7LmrRFpcr6gKOh0Os14DaKrf3bKo2A@mail.gmail.com>
 <Y8uo7vIcQ6caH9pu@ravnborg.org> <Y8wnswk++tvr9xMe@donbot>
 <Y81Px74OUYt21nj4@pendragon.ideasonboard.com>
 <Y856rWmtA4tQCcZz@donbot>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y856rWmtA4tQCcZz@donbot>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Doug Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi John,

On Mon, Jan 23, 2023 at 12:16:45PM +0000, John Keeping wrote:
> On Sun, Jan 22, 2023 at 05:01:27PM +0200, Laurent Pinchart wrote:
> > On Sat, Jan 21, 2023 at 05:58:11PM +0000, John Keeping wrote:
> > > On Sat, Jan 21, 2023 at 09:57:18AM +0100, Sam Ravnborg wrote:
> > > > On Fri, Jan 20, 2023 at 01:44:38PM -0800, Doug Anderson wrote:
> > > > > On Fri, Jan 20, 2023 at 3:43 AM John Keeping wrote:
> > > > > >
> > > > > > Commit 15b9ca1641f0 ("drm: Config orientation property if panel provides
> > > > > > it") added a helper to set the panel panel orientation early but only
> > > > > > connected this for drm_bridge_connector, which constructs a panel bridge
> > > > > > with DRM_BRIDGE_ATTACH_NO_CONNECTOR and creates the connector itself.
> > > > > >
> > > > > > When the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag is not specified and the
> > > > > > panel_bridge creates its own connector the orientation is not set unless
> > > > > > the panel does it in .get_modes which is too late and leads to a warning
> > > > > > splat from __drm_mode_object_add() because the device is already
> > > > > > registered.
> > > > > >
> > > > > > Call the necessary function to set add the orientation property when the
> > > > > > connector is created so that it is available before the device is
> > > > > > registered.
> > > > > 
> > > > > I have no huge objection to your patch and it looks OK to me. That
> > > > > being said, my understanding is that:
> > > > > 
> > > > > 1. DRM_BRIDGE_ATTACH_NO_CONNECTOR is "the future" and not using the
> > > > > flag is "deprecated".
> > > >
> > > > Correct.
> > > > Could we take a look at how much is required to move the relevant driver
> > > > to use DRM_BRIDGE_ATTACH_NO_CONNECTOR?
> > > >
> > > > If this is too much work now we may land this simple patch, but the
> > > > preference is to move all drivers to the new bridge handling and thus
> > > > asking display drivers to create the connector.
> > 
> > I fully agree with Doug and Sam here. Let's see if we can keep the yak
> > shaving minimal :-)
> > 
> > > > What display driver are we dealing with here?
> > > 
> > > This is dw-mipi-dsi-rockchip which uses the component path in
> > > dw-mipi-dsi (and, in fact, is the only driver using that mode of
> > > dw-mipi-dsi).
> > > 
> > > I'm not familiar enough with DRM to say whether it's easy to convert to
> > > DRM_BRIDGE_ATTACH_NO_CONNECTOR - should dw-mipi-dsi-rockchip be moving
> > > to use dw-mipi-dsi as a bridge driver or should dw_mipi_dsi_bind() have
> > > a drm_bridge_attach_flags argument?  But I'm happy to test patches if it
> > > looks easy to convert to you :-)
> > 
> > I'd go for the former (use dw_mipi_dsi_probe() and acquire the DSI
> > bridge with of_drm_find_bridge() instead of using the component
> > framework) if possible, but I don't know how intrusive that would be.
> 
> I'm a bit confused about what's required since dw-mipi-dsi-rockchip
> already uses dw_mipi_dsi_probe(),

Indeed, my bad.

> but I think moving away from the
> component framework would be significant work as that's how the MIPI
> subdriver fits in to the overall Rockchip display driver.

It will be some work, yes. It however doesn't mean that the whole
Rockchip display driver needs to move away from the component framework,
it can be limited to the DSI encoder. It's not immediately clear to me
why the DSI encoder uses the component framework in the first place, and
if it would be difficult to move away from it.

> Any changes / modernisation to the Rockchip MIPI driver look like it
> will take more time than I have available to spend on this, so I'd
> really like to see this patch land as it's a simple fix to an existing
> working code path.

So who volunteers for fixing it properly ? :-)

I'll let Doug and Sam decide regarding mering this patch.

-- 
Regards,

Laurent Pinchart
