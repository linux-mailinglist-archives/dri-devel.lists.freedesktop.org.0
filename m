Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E120E22F697
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jul 2020 19:27:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E69D489E3B;
	Mon, 27 Jul 2020 17:26:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AA1A89E3B
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 17:26:57 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 5AF2B2002C;
 Mon, 27 Jul 2020 19:26:54 +0200 (CEST)
Date: Mon, 27 Jul 2020 19:26:53 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v5 0/5] drm/bridge: Update tc358767 and nxp-ptn3460 to
 support chained bridges
Message-ID: <20200727172653.GA960826@ravnborg.org>
References: <20200727170320.959777-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200727170320.959777-1-sam@ravnborg.org>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=DpMF2YBpyC8SxPmEn3oA:9 a=CjuIK1q_8ugA:10
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
Cc: Andrzej Hajda <a.hajda@samsung.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all.

On Mon, Jul 27, 2020 at 07:03:15PM +0200, Sam Ravnborg wrote:
> This patch-set aims to make connector creation optional
> and prepare the bridge drivers for use in a chained setup.
> 
> The objective is that all bridge drivers shall support a chained setup
> connector creation is moved to the display drivers.
> This is just one step on this path.
> 
> The general approach for the bridge drivers:
> - Introduce bridge operations
> - Introduce use of panel bridge and make connector creation optional
> 
> v5:
>   - Applied reviewed patches, so we went from 15 to 5
>   - Fixed bug in connector creation in both drivers
> 
> v4:
>   - Dropped patch for ti-sn65dsi86. Await full conversion
>   - Dropped patch for ti-tpd12s015. It was wrong (Laurent)
>   - Drop boe,hv070wsa-100 patch, it was applied
>   - Combined a few patches to fix connector created twice (Laurent)
>   - Fix memory leak in get_edid (Laurent)
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
> 
> Sam Ravnborg (5):
>       drm/bridge: tc358767: add detect bridge operation
>       drm/bridge: tc358767: add get_edid bridge operation
>       drm/bridge: tc358767: add drm_panel_bridge support
>       drm/bridge: nxp-ptn3460: add get_edid bridge operation
>       drm/bridge: nxp-ptn3460: add drm_panel_bridge support

Fixed up per Laurent's suggestion and applied to drm-misc-next.

	Sam


> 
>  drivers/gpu/drm/bridge/nxp-ptn3460.c | 103 +++++++++++++---------------
>  drivers/gpu/drm/bridge/tc358767.c    | 126 +++++++++++++++++++----------------
>  2 files changed, 114 insertions(+), 115 deletions(-)
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
