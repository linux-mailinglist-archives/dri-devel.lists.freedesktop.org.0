Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A14422F5DC
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jul 2020 18:56:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2424B89D99;
	Mon, 27 Jul 2020 16:56:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDBE289D99
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 16:56:27 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id A3333804A4;
 Mon, 27 Jul 2020 18:56:23 +0200 (CEST)
Date: Mon, 27 Jul 2020 18:56:22 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v4 0/15] drm/bridge: support chained bridges + panel
 updates
Message-ID: <20200727165622.GA891939@ravnborg.org>
References: <20200726203324.3722593-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200726203324.3722593-1-sam@ravnborg.org>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=e5mUnYsNAAAA:8 a=hkVmIG1S_xXsaS0GYzwA:9
 a=CjuIK1q_8ugA:10 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Martyn Welch <martyn.welch@collabora.co.uk>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Peter Senna Tschudin <peter.senna@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Jonas Karlman <jonas@kwiboo.se>,
 Thierry Reding <thierry.reding@gmail.com>,
 Martin Donnelly <martin.donnelly@ge.com>, kbuild test robot <lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent/all.

On Sun, Jul 26, 2020 at 10:33:09PM +0200, Sam Ravnborg wrote:
> The objective is that all bridge drivers shall support a chained setup
> connector creation is moved to the display drivers.
> This is just one step on this path.
> 
> The general approach for the bridge drivers:
> - Introduce bridge operations
> - Introduce use of panel bridge and make connector creation optional
> 
> v4:
>   - Dropped patch for ti-sn65dsi86. Await full conversion.
>   - Dropped patch for ti-tpd12s015. It was wrong (Laurent)
>   - Drop boe,hv070wsa-100 patch, it was applied
>   - Combined a few patches to fix connector created twice (Laurent)
>   - Fix memory leak in get_edid in several drivers (Laurent)
>   - Added patch to validate panel descriptions in panel-simple
>   - Set bridge.type in relevant drivers
>  
> v3:
>   - Rebase on top of drm-misc-next
>   - Address kbuild test robot feedback
>  
> v2:
>   - Updated bus_flags for boe,hv070wsa-100
>   - Collected r-b, but did not apply patches yet
>   - On the panel side the panel-simple driver gained a default
>     connector type for all the dumb panels that do not
>     include so in their description.
>     With this change panels always provide a connector type,
>     and we have the potential to drop most uses of
>     devm_drm_panel_bridge_add_typed().
>   - Added conversion of a few more bridge drivers
> 
> Patches can build but no run-time testing.
> So both test and review feedback appreciated!
> 
> 	Sam
> 
> Sam Ravnborg (15):
>       drm/panel: panel-simple: validate panel description
>       drm/panel: panel-simple: add default connector_type
>       drm/bridge: tc358764: drop drm_connector_(un)register
>       drm/bridge: tc358764: add drm_panel_bridge support
>       drm/bridge: tc358767: add detect bridge operation
>       drm/bridge: tc358767: add get_edid bridge operation
>       drm/bridge: tc358767: add drm_panel_bridge support
>       drm/bridge: parade-ps8622: add drm_panel_bridge support
>       drm/bridge: megachips: add helper to create connector
>       drm/bridge: megachips: get drm_device from bridge
>       drm/bridge: megachips: enable detect bridge operation
>       drm/bridge: megachips: add get_edid bridge operation
>       drm/bridge: megachips: make connector creation optional
>       drm/bridge: nxp-ptn3460: add get_edid bridge operation
>       drm/bridge: nxp-ptn3460: add drm_panel_bridge support

Laurent reviewed the full series - thanks!
I went ahead and applied the patches for drivers where all
patches was reviewed.

I will send a v5 soon for tc358767 and nxp-ptn3460 where I have fixed
my brown paper bag bugs
.
I am very happy Laurent spotted these before we applied the patches.
This also gives a good indication of the quality of the review.

	Sam

> 
>  .../drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c   |  97 +++++++++-------
>  drivers/gpu/drm/bridge/nxp-ptn3460.c               | 103 ++++++++---------
>  drivers/gpu/drm/bridge/parade-ps8622.c             | 100 +++-------------
>  drivers/gpu/drm/bridge/tc358764.c                  | 110 +++---------------
>  drivers/gpu/drm/bridge/tc358767.c                  | 126 +++++++++++----------
>  drivers/gpu/drm/panel/panel-simple.c               |  48 +++++++-
>  6 files changed, 242 insertions(+), 342 deletions(-)
> 
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
