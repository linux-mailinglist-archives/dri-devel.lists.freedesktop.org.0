Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93FA74FB7FE
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 11:46:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B80810F7CD;
	Mon, 11 Apr 2022 09:46:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A2BF10F7CD
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 09:46:44 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1ndqd9-000758-2H; Mon, 11 Apr 2022 11:46:43 +0200
Message-ID: <83fdef763a46987423acc31c7e82c7dca9f04553.camel@pengutronix.de>
Subject: Re: [PATCH v2 4/7] drm: mxsfb: Move mxsfb_get_fb_paddr() away from
 register IO functions
From: Lucas Stach <l.stach@pengutronix.de>
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Date: Mon, 11 Apr 2022 11:46:40 +0200
In-Reply-To: <141af457-18df-13c5-a6d4-08ea1fd2f511@denx.de>
References: <20220311170601.50995-1-marex@denx.de>
 <20220311170601.50995-4-marex@denx.de>
 <5f7eb7a214ec0f219c4c9ce87e6c8c87bc7f0aeb.camel@pengutronix.de>
 <2e038048-c3ac-4c33-fb98-ba6bec705d5b@denx.de>
 <ef4d8f36a16edda8abf9b6d818cd17f15b0b67cf.camel@pengutronix.de>
 <141af457-18df-13c5-a6d4-08ea1fd2f511@denx.de>
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

Am Montag, dem 11.04.2022 um 00:17 +0200 schrieb Marek Vasut:
> On 4/7/22 11:47, Lucas Stach wrote:
> > Am Donnerstag, dem 07.04.2022 um 00:05 +0200 schrieb Marek Vasut:
> > > On 4/6/22 21:45, Lucas Stach wrote:
> > > > Am Freitag, dem 11.03.2022 um 18:05 +0100 schrieb Marek Vasut:
> > > > > Move mxsfb_get_fb_paddr() out of the way, away from register IO functions.
> > > > > This is a clean up. No functional change.
> > > > > 
> > > > > Signed-off-by: Marek Vasut <marex@denx.de>
> > > > > Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > > > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > > Cc: Lucas Stach <l.stach@pengutronix.de>
> > > > > Cc: Peng Fan <peng.fan@nxp.com>
> > > > > Cc: Robby Cai <robby.cai@nxp.com>
> > > > > Cc: Sam Ravnborg <sam@ravnborg.org>
> > > > > Cc: Stefan Agner <stefan@agner.ch>
> > > > 
> > > > Hm, I don't see any real benefit, but I also fail to see why it
> > > > shouldn't be done so:
> > > 
> > > The entire point of this series is to clean up the mxsfb and isolate
> > > lcdif (the original lcdif) from any of the common code.
> > 
> > Actually, just use drm_fb_cma_get_gem_addr() instead?
> 
> That function seems to add only extra code that is executed, 
> 
Yep, and thus it is the correct way to do it, as it actually takes into
account the FB offset parameter. Currently mxsfb seems to just do the
wrong thing when the FB is not at offset 0 in the GEM object.

> but does not do away with the !fb check anyway. 
> 
And that one seems bogus. If you have no FB there is no way you can
reasonably start scanout or flip to the next buffer. What would you
scan out in that case? Random memory? FB should never be NULL in those
code paths.

> So, why ? (Also, seems unrelated to this patch)

Because you aim to clean up the driver and make the code reusable, so
why not use the reusable and correct DRM helper?

Regards,
Lucas

