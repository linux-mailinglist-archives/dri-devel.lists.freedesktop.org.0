Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE634EA168
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 22:22:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17D4510EDB8;
	Mon, 28 Mar 2022 20:22:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58D0110EDB8
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 20:22:46 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1nYvsy-00040C-RK; Mon, 28 Mar 2022 22:22:44 +0200
Message-ID: <c7f5d57776a9ea08b9898004734a64a0b86fb768.camel@pengutronix.de>
Subject: Re: [PATCH V3 00/12] drm/bridge: tc358767: Add DSI-to-DPI mode support
From: Lucas Stach <l.stach@pengutronix.de>
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Date: Mon, 28 Mar 2022 22:22:44 +0200
In-Reply-To: <20220224195817.68504-1-marex@denx.de>
References: <20220224195817.68504-1-marex@denx.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Jonas Karlman <jonas@kwiboo.se>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maxime Ripard <maxime@cerno.tech>, Neil Armstrong <narmstrong@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Donnerstag, dem 24.02.2022 um 20:58 +0100 schrieb Marek Vasut:
> The TC358767/TC358867/TC9595 are all capable of operating in multiple
> modes, DPI-to-(e)DP, DSI-to-(e)DP, DSI-to-DPI. Clean up the driver,
> switch to atomic ops, and add support for the DSI-to-DPI mode in
> addition to already supported DPI-to-(e)DP mode.
> 
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> To: dri-devel@lists.freedesktop.org

Tested-by: Lucas Stach <l.stach@pengutronix.de>

In both DPI to eDP and DSI to DPI mode.

Regards,
Lucas

> 
> Marek Vasut (12):
>   dt-bindings: display: bridge: tc358867: Document DPI output support
>   dt-bindings: display: bridge: tc358867: Document DSI data-lanes
>     property
>   drm/bridge: tc358767: Change tc_ prefix to tc_edp_ for (e)DP specific
>     functions
>   drm/bridge: tc358767: Convert to atomic ops
>   drm/bridge: tc358767: Implement atomic_check callback
>   drm/bridge: tc358767: Move hardware init to enable callback
>   drm/bridge: tc358767: Move (e)DP bridge endpoint parsing into
>     dedicated function
>   drm/bridge: tc358767: Wrap (e)DP aux I2C registration into
>     tc_aux_link_setup()
>   drm/bridge: tc358767: Move bridge ops setup into
>     tc_probe_edp_bridge_endpoint()
>   drm/bridge: tc358767: Detect bridge mode from connected endpoints in
>     DT
>   drm/bridge: tc358767: Split tc_set_video_mode() into common and (e)DP
>     part
>   drm/bridge: tc358767: Add DSI-to-DPI mode support
> 
>  .../display/bridge/toshiba,tc358767.yaml      |  22 +-
>  drivers/gpu/drm/bridge/tc358767.c             | 681 +++++++++++++++---
>  2 files changed, 596 insertions(+), 107 deletions(-)
> 


