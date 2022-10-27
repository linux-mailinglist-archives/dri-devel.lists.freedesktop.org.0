Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CF160F25C
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 10:32:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB14510E57D;
	Thu, 27 Oct 2022 08:32:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F04DC10E585
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 08:32:24 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1onyJL-0000ZO-GM; Thu, 27 Oct 2022 10:32:23 +0200
Received: from mfe by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1onyJL-0007Xv-2S; Thu, 27 Oct 2022 10:32:23 +0200
Date: Thu, 27 Oct 2022 10:32:23 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] drm: lcdif: Set and enable FIFO Panic threshold
Message-ID: <20221027083223.cwgymey4ar247afe@pengutronix.de>
References: <20221026212002.542375-1-marex@denx.de>
 <20221027081323.luobufjh3n4isiy7@pengutronix.de>
 <9deaa960-778b-a640-a63e-0da5aaf9b934@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9deaa960-778b-a640-a63e-0da5aaf9b934@denx.de>
User-Agent: NeoMutt/20180716
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mfe@pengutronix.de
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
Cc: Peng Fan <peng.fan@nxp.com>, Liu Ying <victor.liu@nxp.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Martyn Welch <martyn.welch@collabora.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22-10-27, Marek Vasut wrote:
> On 10/27/22 10:13, Marco Felsch wrote:
> 
> Hi,
> 
> [...]
> 
> > > diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > > index a5302006c02cd..aee7babb5fa5c 100644
> > > --- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > > +++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > > @@ -341,6 +341,18 @@ static void lcdif_enable_controller(struct lcdif_drm_private *lcdif)
> > >   	reg = readl(lcdif->base + LCDC_V8_CTRLDESCL0_5);
> > >   	reg |= CTRLDESCL0_5_EN;
> > >   	writel(reg, lcdif->base + LCDC_V8_CTRLDESCL0_5);
> > > +
> > > +	/* Set FIFO Panic watermarks, low 1/3, high 2/3 . */
> > > +	writel(FIELD_PREP(PANIC0_THRES_LOW_MASK, 1 * PANIC0_THRES_RANGE / 3) |
> > > +	       FIELD_PREP(PANIC0_THRES_HIGH_MASK, 2 * PANIC0_THRES_RANGE / 3),
> > > +	       lcdif->base + LCDC_V8_PANIC0_THRES);
> > > +
> > > +	/*
> > > +	 * Enable FIFO Panic, this does not generate interrupt, but
> > > +	 * boosts NoC priority based on FIFO Panic watermarks.
> > > +	 */
> > > +	writel(INT_ENABLE_D1_PLANE_PANIC_EN,
> > > +	       lcdif->base + LCDC_V8_INT_ENABLE_D1);
> > 
> > Out of curiosity since we have a patch doing the exact same thing but
> > didn't saw any improvements. Is there a reason why you enabled it here?
> 
> It seems like the right thing to do here, when enabling the controller.
> 
> > We did this during lcdif_rpm_resume(). But as I said with a 1080P
> > display we still saw the flickering, it disappeared first after rising
> > the burst-size.
> 
> That's what the NXP downstream driver does too, isn't it ? That seems like
> the wrong place to me.

Yes, I think so. It's not about the place (if it wrong/correct) it is
more about the PANIC mode itself. I'm curios about:
 1) Do you still see the flickering with this patch and without the
    "burst-size increase" patch?
 2) Do you still saw flickering after the "burst-size increase" patch
    applied and without this patch?

I had no 4K display therefore I'm asking, but with 1080P we didn't saw
any improvements without increasing the burst-size. My assumption was:
if the panic mode does work, than I don't have to increase the
burst-size.

Regards,
  Marco
