Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 614B44F78BF
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 10:02:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9944210E0A2;
	Thu,  7 Apr 2022 08:01:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3A9310E5F1
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 08:01:56 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1ncN5X-0003z2-9o; Thu, 07 Apr 2022 10:01:55 +0200
Message-ID: <b48364e7e0b0d9fc925ec8edf2b03adafe77a30b.camel@pengutronix.de>
Subject: Re: [PATCH v2 2/7] drm: mxsfb: Simplify LCDIF IRQ handling
From: Lucas Stach <l.stach@pengutronix.de>
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Date: Thu, 07 Apr 2022 10:01:54 +0200
In-Reply-To: <3f46927b-b458-81bf-0b9b-03171e9bbcb5@denx.de>
References: <20220311170601.50995-1-marex@denx.de>
 <20220311170601.50995-2-marex@denx.de>
 <ffc23134df69d9fe6ba7229e6a3239ebd131e68e.camel@pengutronix.de>
 <3f46927b-b458-81bf-0b9b-03171e9bbcb5@denx.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Peng Fan <peng.fan@nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Donnerstag, dem 07.04.2022 um 00:03 +0200 schrieb Marek Vasut:
> On 4/6/22 21:41, Lucas Stach wrote:
> > Am Freitag, dem 11.03.2022 um 18:05 +0100 schrieb Marek Vasut:
> > > The call to drm_crtc_vblank_off(&lcdif->crtc); disables IRQ generation
> > > from the LCDIF block already and this is called in mxsfb_load() before
> > > request_irq(), so explicitly disabling IRQ using custom function like
> > > mxsfb_irq_disable() is not needed, remove it.
> > > 
> > 
> > Have you checked that the drm_vblank_off in probe actually results in a
> > call to mxsfb_crtc_disable_vblank? From my reading of the core code,
> > this should be a no-op without a previous drm_vblank_on, so it would
> > not result in the desired masking before the IRQ is requested.
> 
> I must've missed the vblank->enabled check, but then, I am also not 
> getting any interrupts, so presumably they are already disabled after 
> the IP is reset.

Yep, it should be the default for every peripheral to not send any
unsolicited interrupts. But then I don't see explicit reset of the IP
in the driver probe. So maybe this is a workaround for situation where
something running before Linux has already enabled the display
controller and for whatever reason also enabled the interrupt
requests? 

Either we should have a proper reset of the block in the probe path, or
this interrupt masking must be kept in one form or the other. My vote
would be on just masking the IRQs and dropping the useless
drm_vblank_off.

Regards,
Lucas

