Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A144EA8AA
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 09:48:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C344010E7A0;
	Tue, 29 Mar 2022 07:47:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61D0E10E7A0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 07:47:58 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1nZ6a4-0003yk-GY; Tue, 29 Mar 2022 09:47:56 +0200
Message-ID: <b2fd62b4d3fa0eeb49d1f374cb2ae2687e6626b6.camel@pengutronix.de>
Subject: Re: [PATCH v4 00/11] drm/bridge: tc358767: Add DSI-to-DPI mode support
From: Lucas Stach <l.stach@pengutronix.de>
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Date: Tue, 29 Mar 2022 09:47:54 +0200
In-Reply-To: <20220328214324.252472-1-marex@denx.de>
References: <20220328214324.252472-1-marex@denx.de>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maxime Ripard <maxime@cerno.tech>, Jonas Karlman <jonas@kwiboo.se>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

Am Montag, dem 28.03.2022 um 23:43 +0200 schrieb Marek Vasut:
> The TC358767/TC358867/TC9595 are all capable of operating in multiple
> modes, DPI-to-(e)DP, DSI-to-(e)DP, DSI-to-DPI. Clean up the driver,
> switch to atomic ops, and add support for the DSI-to-DPI mode in
> addition to already supported DPI-to-(e)DP mode.
> 
Not sure if anyone else has any more comments. For what it is worth, I
just skimmed through the series again and it looks good to me now.

Regards,
Lucas

> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> To: dri-devel@lists.freedesktop.org
> 
> Marek Vasut (11):
>   dt-bindings: display: bridge: tc358867: Document DPI output support
>   dt-bindings: display: bridge: tc358867: Document DSI data-lanes
>     property
>   drm/bridge: tc358767: Change tc_ prefix to tc_edp_ for (e)DP specific
>     functions
>   drm/bridge: tc358767: Convert to atomic ops
>   drm/bridge: tc358767: Implement atomic_check callback
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
>  drivers/gpu/drm/bridge/Kconfig                |   1 +
>  drivers/gpu/drm/bridge/tc358767.c             | 566 ++++++++++++++++--
>  3 files changed, 529 insertions(+), 60 deletions(-)
> 


