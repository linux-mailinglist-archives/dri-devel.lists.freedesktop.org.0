Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F06677A9C
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 13:17:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4D0B10E1EA;
	Mon, 23 Jan 2023 12:17:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B22B10E1EA
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 12:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=metanate.com; s=stronger; h=In-Reply-To:Content-Type:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description; bh=r80bla368F0mccCTC7Gf0OTNLE2fXe2B5th7gyHTqbQ=; b=rNaVX
 +nePtYTn0zLA92rms+XZn/2Fb2GrjoCDlFkcXj7slSMQ6FylnlZIHeF/tKHUX6asHca60R5TWMBPm
 b07leiFLb7JI25QN4kE1vo3Tu7r0ehnoLTZyL8LS7Mrdi1bivbEDgaMAM9jQ8C6POFWxXo0ZfmMfm
 axpmvoCEvY3ke7MzpcbtPRhby8TEPmfHis9xBAsRamqSR1JP7hbiJ9ANVa8nBSh/hxzIIKdgwCDWx
 A06+YP0TkK+s7e0E3nTrpOPMEEwaDymYt0myD+kOrP7AlH6dFygXLSEAcCDkbeci/RjSoSr39pDHl
 MitYnMIpVqBI1u5SfyQzbNd/yqVjQ==;
Received: from [81.174.171.191] (helo=donbot)
 by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.95) (envelope-from <john@metanate.com>) id 1pJvkk-0004BB-RI;
 Mon, 23 Jan 2023 12:16:46 +0000
Date: Mon, 23 Jan 2023 12:16:45 +0000
From: John Keeping <john@metanate.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] drm/bridge: panel: Set orientation on panel_bridge
 connector
Message-ID: <Y856rWmtA4tQCcZz@donbot>
References: <20230120114313.2087015-1-john@metanate.com>
 <CAD=FV=UPD6c+NY8Ub37N7LmrRFpcr6gKOh0Os14DaKrf3bKo2A@mail.gmail.com>
 <Y8uo7vIcQ6caH9pu@ravnborg.org> <Y8wnswk++tvr9xMe@donbot>
 <Y81Px74OUYt21nj4@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y81Px74OUYt21nj4@pendragon.ideasonboard.com>
X-Authenticated: YES
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

Hi Laurent,

On Sun, Jan 22, 2023 at 05:01:27PM +0200, Laurent Pinchart wrote:
> On Sat, Jan 21, 2023 at 05:58:11PM +0000, John Keeping wrote:
> > On Sat, Jan 21, 2023 at 09:57:18AM +0100, Sam Ravnborg wrote:
> > > On Fri, Jan 20, 2023 at 01:44:38PM -0800, Doug Anderson wrote:
> > > > On Fri, Jan 20, 2023 at 3:43 AM John Keeping wrote:
> > > > >
> > > > > Commit 15b9ca1641f0 ("drm: Config orientation property if panel provides
> > > > > it") added a helper to set the panel panel orientation early but only
> > > > > connected this for drm_bridge_connector, which constructs a panel bridge
> > > > > with DRM_BRIDGE_ATTACH_NO_CONNECTOR and creates the connector itself.
> > > > >
> > > > > When the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag is not specified and the
> > > > > panel_bridge creates its own connector the orientation is not set unless
> > > > > the panel does it in .get_modes which is too late and leads to a warning
> > > > > splat from __drm_mode_object_add() because the device is already
> > > > > registered.
> > > > >
> > > > > Call the necessary function to set add the orientation property when the
> > > > > connector is created so that it is available before the device is
> > > > > registered.
> > > > 
> > > > I have no huge objection to your patch and it looks OK to me. That
> > > > being said, my understanding is that:
> > > > 
> > > > 1. DRM_BRIDGE_ATTACH_NO_CONNECTOR is "the future" and not using the
> > > > flag is "deprecated".
> > >
> > > Correct.
> > > Could we take a look at how much is required to move the relevant driver
> > > to use DRM_BRIDGE_ATTACH_NO_CONNECTOR?
> > >
> > > If this is too much work now we may land this simple patch, but the
> > > preference is to move all drivers to the new bridge handling and thus
> > > asking display drivers to create the connector.
> 
> I fully agree with Doug and Sam here. Let's see if we can keep the yak
> shaving minimal :-)
> 
> > > What display driver are we dealing with here?
> > 
> > This is dw-mipi-dsi-rockchip which uses the component path in
> > dw-mipi-dsi (and, in fact, is the only driver using that mode of
> > dw-mipi-dsi).
> > 
> > I'm not familiar enough with DRM to say whether it's easy to convert to
> > DRM_BRIDGE_ATTACH_NO_CONNECTOR - should dw-mipi-dsi-rockchip be moving
> > to use dw-mipi-dsi as a bridge driver or should dw_mipi_dsi_bind() have
> > a drm_bridge_attach_flags argument?  But I'm happy to test patches if it
> > looks easy to convert to you :-)
> 
> I'd go for the former (use dw_mipi_dsi_probe() and acquire the DSI
> bridge with of_drm_find_bridge() instead of using the component
> framework) if possible, but I don't know how intrusive that would be.

I'm a bit confused about what's required since dw-mipi-dsi-rockchip
already uses dw_mipi_dsi_probe(), but I think moving away from the
component framework would be significant work as that's how the MIPI
subdriver fits in to the overall Rockchip display driver.

Any changes / modernisation to the Rockchip MIPI driver look like it
will take more time than I have available to spend on this, so I'd
really like to see this patch land as it's a simple fix to an existing
working code path.


John
