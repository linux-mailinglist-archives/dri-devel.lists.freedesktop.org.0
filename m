Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5D23B2E6E
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 14:01:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8A6D6EB5C;
	Thu, 24 Jun 2021 12:01:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 002886EB5C
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 12:01:15 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1lwO2k-0001GB-Jf; Thu, 24 Jun 2021 14:01:14 +0200
Message-ID: <fc2eeee51e5ef448aa814e572c27bf7f225078a7.camel@pengutronix.de>
Subject: Re: [PATCH] drm: mxsfb: Clear FIFO_CLEAR bit
From: Lucas Stach <l.stach@pengutronix.de>
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Date: Thu, 24 Jun 2021 14:01:13 +0200
In-Reply-To: <d539afbd-c101-6a30-0a61-c52696521be7@denx.de>
References: <20210620224946.189524-1-marex@denx.de>
 <be290a3283ecadeb9269bd00e85adac99434eb82.camel@pengutronix.de>
 <85372867-2b5b-e97f-aa04-ed976db1eddb@denx.de>
 <07f58c1181e2e66277d0355055ff794fb091991d.camel@pengutronix.de>
 <d539afbd-c101-6a30-0a61-c52696521be7@denx.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.1 (3.40.1-1.fc34) 
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
Cc: Daniel Abrecht <public@danielabrecht.ch>,
 Emil Velikov <emil.l.velikov@gmail.com>, ch@denx.de,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Dienstag, dem 22.06.2021 um 11:33 +0200 schrieb Marek Vasut:
> On 6/22/21 9:28 AM, Lucas Stach wrote:
> > Am Montag, dem 21.06.2021 um 18:30 +0200 schrieb Marek Vasut:
> > > On 6/21/21 2:14 PM, Lucas Stach wrote:
> > > 
> > > [...]
> > > 
> > > > > diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> > > > > index 98d8ba0bae84..22cb749fc9bc 100644
> > > > > --- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> > > > > +++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> > > > > @@ -241,6 +241,9 @@ static void mxsfb_crtc_mode_set_nofb(struct mxsfb_drm_private *mxsfb,
> > > > >    
> > > > >    	/* Clear the FIFOs */
> > > > >    	writel(CTRL1_FIFO_CLEAR, mxsfb->base + LCDC_CTRL1 + REG_SET);
> > > > > +	readl(mxsfb->base + LCDC_CTRL1);
> > > > 
> > > > Do you really need those readbacks? As both writes are targeting the
> > > > same slave interface, the memory barrier in the clear write should push
> > > > the set write.
> > > 
> > > What would push the clear write then ? We can drop one of the readl()s,
> > > but not the last one.
> > 
> > There are a lot of more writes with barriers to the controller slave
> > interface in that function after clearing the FIFO. I don't see why
> > this readback would be required.
> 
> Because you really do want to make sure the fifo is cleared before you 
> start doing any of those other writes or configuring the controller in 
> any way.

I still don't see the reason. What additional properties do you think
the readback provides that isn't already provided by the barriers in
the following writes?

Regards,
Lucas

