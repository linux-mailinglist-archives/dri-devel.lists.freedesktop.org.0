Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8637F5A0F6E
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 13:40:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5562A112D47;
	Thu, 25 Aug 2022 11:40:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C33D2112D47
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 11:40:29 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1oRBDn-00051w-PA; Thu, 25 Aug 2022 13:40:27 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1oRBDl-0007yp-RE; Thu, 25 Aug 2022 13:40:25 +0200
Date: Thu, 25 Aug 2022 13:40:25 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 1/2] drm/rockchip: dw_hdmi: relax mode_valid hook
Message-ID: <20220825114025.GR17485@pengutronix.de>
References: <20220822152017.1523679-1-s.hauer@pengutronix.de>
 <20220822152017.1523679-2-s.hauer@pengutronix.de>
 <a279a697-6960-c517-8984-335aa207126a@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a279a697-6960-c517-8984-335aa207126a@arm.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
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
Cc: kernel@pengutronix.de, linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>,
 dri-devel@lists.freedesktop.org, Sandy Huang <hjc@rock-chips.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 24, 2022 at 05:07:50PM +0100, Robin Murphy wrote:
> On 2022-08-22 16:20, Sascha Hauer wrote:
> > The driver checks if the pixel clock of the given mode matches an entry
> > in the mpll config table. The frequencies in the mpll table are meant as
> > a frequency range up to which the entry works, not as a frequency that
> > must match the pixel clock. Return MODE_OK when the pixelclock is
> > smaller than one of the mpll frequencies to allow for more display
> > resolutions.
> 
> Has the issue been fixed that this table is also used to validate modes on
> RK3328, which doesn't even *have* the Synopsys phy? Last time I looked, that
> tended to lead to complete display breakage when the proper phy driver later
> decides it doesn't like a pixel clock that mode_valid already said was OK.
> 
> The more general concern is that these known-good clock rates are good, but
> others may not be even when nominally supported, which I suspect is the
> dirty secret of why it was implemented this way to begin with. I would
> really really love this patch so my RK3399 board can drive my 1920x1200
> monitor at native resolution, but on the other hand my RK3288 box generates
> such a crap 154MHz clock for that mode that - unless that's been improved in
> the meantime too - patch #2 might be almost be considered a regression if it
> means such a setup would start defaulting to an unusably glitchy display
> instead of falling back to 1920x1080 which does at least work perfectly
> (even if the slightly squished aspect ratio is ugly).

I could limit the change to rk3568 only. Would that be an option?
Not sure if I should rk3399 as well then as this would work, at least in
your setup.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
