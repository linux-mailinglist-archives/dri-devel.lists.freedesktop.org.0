Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 877A44BD86F
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 10:12:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5143A112956;
	Mon, 21 Feb 2022 09:12:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66A63112959
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 09:12:08 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1nM4jm-0002ek-NM; Mon, 21 Feb 2022 10:12:06 +0100
Message-ID: <15821a06946264bb5a6df671d664a29ebfcabbb9.camel@pengutronix.de>
Subject: Re: [PATCH V2 05/11] drm/bridge: tc358767: Move hardware init to
 enable callback
From: Lucas Stach <l.stach@pengutronix.de>
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Date: Mon, 21 Feb 2022 10:12:04 +0100
In-Reply-To: <64715cae-ab3c-2a14-dfa5-00f93d4db678@denx.de>
References: <20220218010054.315026-1-marex@denx.de>
 <20220218010054.315026-6-marex@denx.de>
 <fcf1f83690ea7faa8b0667840eef7a9f4967cf72.camel@pengutronix.de>
 <64715cae-ab3c-2a14-dfa5-00f93d4db678@denx.de>
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

Am Samstag, dem 19.02.2022 um 03:39 +0100 schrieb Marek Vasut:
> On 2/18/22 18:49, Lucas Stach wrote:
> > Am Freitag, dem 18.02.2022 um 02:00 +0100 schrieb Marek Vasut:
> > > The TC358767/TC358867/TC9595 are all capable of operating either from
> > > attached Xtal or from DSI clock lane clock. In case the later is used,
> > > all I2C accesses will fail until the DSI clock lane is running and
> > > supplying clock to the chip.
> > > 
> > > Move all hardware initialization to enable callback to guarantee the
> > > DSI clock lane is running before accessing the hardware. In case Xtal
> > > is attached to the chip, this change has no effect.
> > 
> > I'm not sure if that last statement is correct. When the chip is
> > bridging to eDP, the aux channel and HPD handling is needed to be
> > functional way before the atomic enable happen. I have no idea how this
> > would interact with the clock supplied from the DSI lanes. Maybe it
> > doesn't work at all and proper eDP support always needs a external
> > reference clock?
> 
> The driver currently assumes the TC358767 always gets RefClk from Xtal.
> 
> There is subsequent series which adds support for deriving clock which 
> drive the TC358767 PLLs from DSI HS clock instead of Xtal in case the 
> bridge operates in DSI-to-DPI mode. That needs additional plumbing, as 
> the TC358767 must be able to select specific clock frequency on the DSI 
> HS clock lane, because its PLLs need specific frequencies, see:
> 
> [RFC][PATCH 0/7] drm/bridge: Add support for selecting DSI host HS clock 
> from DSI bridge
> 
> If someone needs to implement DSI-to-(e)DP mode without Xtal, ugh, that 
> would likely need to have a way to figure out the DSI HS clock frequency 
> already in probe and then enable those DSI HS clock very early on too ?
> 
Probably, but that was really just something I wondered about while
passing by.

The real issue is that I think _this_ patch breaks eDP operation, as
now the chip is initialized way too late, as the AUX channel
functionality needs to be available long before the atomic bridge
enable callback is called. The AUX channel is used to fetch the display
EDID, so before you can even set a mode it needs to be functional.
Unconditionally moving the chip init is probably (I haven't tested it
yet) going to break this.

Regards,
Lucas

> > I think we should make the "ref" clock a optional clock to properly
> > describe the fact that the chip can operate without this clock in DSI
> > input mode and then either do the chip init in the probe routine when
> > the ref clock is present, or defer it to atomic enable when the ref
> > clock is absent.
> 
> See the RFC patchset above, that patchset does exactly that, it makes 
> RefClk optional.
> 
> [...]


