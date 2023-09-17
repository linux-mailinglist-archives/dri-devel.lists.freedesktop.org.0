Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 559777A35D8
	for <lists+dri-devel@lfdr.de>; Sun, 17 Sep 2023 16:34:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6111E10E074;
	Sun, 17 Sep 2023 14:34:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc
 [IPv6:2a02:c205:3004:2154::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 193B210E071
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Sep 2023 14:34:46 +0000 (UTC)
Received: from [185.224.57.162] (helo=akair)
 by mail.andi.de1.cc with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <andreas@kemnade.info>)
 id 1qhsr9-003tmW-OQ; Sun, 17 Sep 2023 16:34:39 +0200
Date: Sun, 17 Sep 2023 16:34:35 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [RFC PATCH] drm: omapdrm: dsi: add refsel also for omap4
Message-ID: <20230917163435.6bc68110@akair>
In-Reply-To: <9efde4d8-385d-54da-fb0d-55625d3c4571@ideasonboard.com>
References: <20230913065911.1551166-1-andreas@kemnade.info>
 <48972ab0-e4ed-11b2-31fb-ad93695a4db1@ideasonboard.com>
 <20230913124828.GL5285@atomide.com>
 <9efde4d8-385d-54da-fb0d-55625d3c4571@ideasonboard.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: arnd@arndb.de, Tony Lindgren <tony@atomide.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sebastian Reichel <sre@kernel.org>, laurent.pinchart@ideasonboard.com,
 u.kleine-koenig@pengutronix.de, linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Wed, 13 Sep 2023 15:58:11 +0300
schrieb Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>:

> On 13/09/2023 15:48, Tony Lindgren wrote:
> > * Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> [230913 12:11]:  
> >> I'm somewhat sure that the upstream driver used to work on omap4
> >> sdp, which has two DSI panels. But I can't even remember what
> >> omap4 version it had.  
> > 
> > I think those were both dsi command mode panels though, not video
> > mode?  
> 
> Yes, true. If the PLL is totally wrong due to refsel, I'm sure a
> command mode panel would also fail. But it's true that video mode
> panels are more sensitive to the clock rate.
> 
hmm, still analyzing:
What works:
  OMAP5 + Pyra (Videomode display requiring some init commands) 
  some command mode stuff with OMAP4 (droid4)
 
What does not work:
  OMAP4 with some dsi videomode to something else (LVDS/DPI) converter
       if init commands are sent through dsi, then these commands fail
       with bta sync problems.

So sending init commands to video mode displays seems not to be a
principal problem.
But looking deeper at the drivers, there seem to be commands sent
to the converters to configure lanes on that side, e.g.
tc358762_write(ctx, DSI_LANEENABLE,
                       LANEENABLE_L0EN | LANEENABLE_CLEN);

There might be trouble if these are not sent in low power mode.

So probably the next analyzing step would be to check if things
are really sent in low power mode.

Regards,
Andreas
