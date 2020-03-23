Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B73BB190081
	for <lists+dri-devel@lfdr.de>; Mon, 23 Mar 2020 22:38:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C315897FD;
	Mon, 23 Mar 2020 21:38:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7D43897FD
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 21:38:48 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 8511120079;
 Mon, 23 Mar 2020 22:38:45 +0100 (CET)
Date: Mon, 23 Mar 2020 22:38:44 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH 02/21] drm: mxsfb: Use drm_panel_bridge
Message-ID: <20200323213844.GA15505@ravnborg.org>
References: <20200309195216.31042-1-laurent.pinchart@ideasonboard.com>
 <20200309195216.31042-3-laurent.pinchart@ideasonboard.com>
 <eb16f03d670a424a4a63d9c855fabe65@agner.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <eb16f03d670a424a4a63d9c855fabe65@agner.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=fH6z-WjluwaWOP4cKvwA:9 a=CjuIK1q_8ugA:10
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
Cc: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, kernel@pengutronix.de,
 linux-imx@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stefan.

On Mon, Mar 23, 2020 at 10:27:21PM +0100, Stefan Agner wrote:
> On 2020-03-09 20:51, Laurent Pinchart wrote:
> > Replace the manual connector implementation based on drm_panel with the
> > drm_panel_bridge helper. This simplifies the mxsfb driver by removing
> > connector-related code, and standardizing all pipeline control
> > operations on bridges.
> > 
> > A hack is needed to get hold of the connector, as that's our only source
> > of bus flags and formats for now. As soon as the bridge API provides us
> > with that information this can be fixed.
> 
> This seems like a nice simplification.
> 
> I gave this a go applied on today's drm-misc-next using a Colibri iMX7
> (imx7d-colibri-emmc-eval-v3.dts device tree). This device makes use of
> the simple panel driver. I get this when booting:
> 
> [    2.976698] [drm] Supports vblank timestamp caching Rev 2
> (21.10.2013).
> [    2.983526] ------------[ cut here ]------------
> [    2.988180] WARNING: CPU: 0 PID: 1 at
> drivers/gpu/drm/bridge/panel.c:267 devm_drm_panel_bridge_add+0x25/0x28

...

I think you hit one of the panels that does not yet specify a
connector_type.

If this is the case, we should fix the definition in panel-simple.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
