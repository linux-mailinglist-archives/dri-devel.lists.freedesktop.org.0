Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2421C46FD01
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 09:51:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26F9710E44F;
	Fri, 10 Dec 2021 08:51:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F164210E44F
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Dec 2021 08:51:24 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1mvbcg-00005I-4U; Fri, 10 Dec 2021 09:51:22 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1mvbcb-0002DW-GS; Fri, 10 Dec 2021 09:51:17 +0100
Date: Fri, 10 Dec 2021 09:51:17 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Heiko =?iso-8859-15?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 18/18] [HACK, RFC] clk: rk3568: do not divide dclk_vop0
Message-ID: <20211210085117.GB25513@pengutronix.de>
References: <20211208151230.3695378-1-s.hauer@pengutronix.de>
 <20211208151230.3695378-19-s.hauer@pengutronix.de>
 <10508489.WJHl9KOmCk@diego>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <10508489.WJHl9KOmCk@diego>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:37:55 up 295 days, 12:01, 148 users,  load average: 0.30, 0.19,
 0.16
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Peter Geis <pgwipeout@gmail.com>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Andy Yan <andy.yan@rock-chips.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 08, 2021 at 05:51:43PM +0100, Heiko Stübner wrote:
> Hi Sascha,
> 
> Am Mittwoch, 8. Dezember 2021, 16:12:30 CET schrieb Sascha Hauer:
> > On the rk3568 we have this (simplified) situation:
> > 
> >  .--------.     .-----.    .---------.
> > -| hpll   |--.--| /n  |----|dclk_vop0|-
> >  `--------´  |  `-----´    `---------´
> >              |  .-----.    .---------.
> >              `--| /m  |----|dclk_vop1|-
> >              |  `-----´    `---------´
> >              |             .---------.
> >              `-------------|hdmi_ref |-
> >                            `---------´
> > 
> > hpll is the PLL that drives the HDMI reference clock and the pixel
> > clocks for the different CRTCs (dclk_vop0/1). Between the pixel clocks
> > and the hpll there are programmable dividers whereas the HDMI reference
> > clock is directly connected to the hpll.
> > 
> > For the HDMI output to work the pixel clock must be the same as the HDMI
> > reference clock, hence the dividers must be programmed to 1. Normally a
> > rate change on dclk_vop0/1 propagates through to the hpll and the clock
> > framework picks a suitable combination of hpll and divider settings. by
> > accident it picks a divider setting of 1 for the standard 1080p case,
> > but other divider settings for most other resolutions leaving the HDMI
> > port non working.
> > 
> > This patch is not a solution, it merely puts the finger in the wound. We
> > leave out the divider for the composite clock for dclk_vop0 which then
> > leaves the divider at the bootloader default setting of 1. I assume
> > the divider is disturbing only for the HDMI case, but needed for other
> > outputs. Any thoughts how this can be handled?
> 
> I'm not even sure if/how the common clock framework keeps track of
> diverging wishes to parent-rates :-) .

I don't think the common clock framework tries to keep track of that.

> 
> But I do see two direct issues in the _existing_ code.
> 
> dclk_vop0/1 uses CLK_SET_RATE_PARENT so is allowed to change
> the rates of its parent clock(s).
> 
> Its parent clocks are not only hpll but can also be vpll, gpll and cpll.
> So this can cause even more mayhem, if the ccf for example decides
> to select the gpll and then change its rate,which may result in a lot
> of peripherals getting their rates changed under them ;-) .

Right, we can only allow the CLK_SET_RATE_PARENT parent flag on the dclk
clocks when the parent is HPLL. Since we can't be sure that HPLL is the
parent we have to remove the flag.

> 
> On the other hand I see in the clock driver that hdmi-ref is not allowed
> to change its parent rate, so can only select between hpll and hpll_ph0
> (1/2 the rate?).
> 
> So I guess, one way could be:
> - add CLK_SET_RATE_PARENT to the hdmi-ref clock
> - drop CLK_SET_RATE_PARENT from the dclks
> - make sure hdmi-clock is set before the dclk

That solves it for the HDMI case. I can imagine that for a LVDS user the
CLK_SET_RATE_PARENT flag on the dclks is quite handy to get a PLL
frequency suitable for the display. Otherwise he would have to set a
suitable PLL frequency using assigned-clock-rates in the device tree.
That's still possible so this might be a good compromise.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
