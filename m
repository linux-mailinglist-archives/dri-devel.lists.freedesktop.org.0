Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE2460FF89
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 19:48:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D871310E6B9;
	Thu, 27 Oct 2022 17:47:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9757F10E6B9
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 17:47:52 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1oo6ys-0000U2-Sd; Thu, 27 Oct 2022 19:47:50 +0200
Received: from mfe by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1oo6yq-00072l-ST; Thu, 27 Oct 2022 19:47:48 +0200
Date: Thu, 27 Oct 2022 19:47:48 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH] drm: lcdif: Set and enable FIFO Panic threshold
Message-ID: <20221027174748.niz6wi7dqwj3nlyr@pengutronix.de>
References: <20221026212002.542375-1-marex@denx.de>
 <2e9368bcc1c354ff01e63b9c451d839aa6a7a36f.camel@nxp.com>
 <9bd9ee85-3a20-f13a-3984-017a439e08cd@denx.de>
 <6398adb972ef8623fd594fd573b5ed6838948516.camel@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6398adb972ef8623fd594fd573b5ed6838948516.camel@nxp.com>
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
Cc: Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
 Martyn Welch <martyn.welch@collabora.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, "jian.li" <jian.li@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22-10-27, Liu Ying wrote:
> On Thu, 2022-10-27 at 12:03 +0200, Marek Vasut wrote:
> > On 10/27/22 07:45, Liu Ying wrote:
> > 
> > Hi,
> > 
> > [...]
> > 
> > > > diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > > > b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > > > index a5302006c02cd..aee7babb5fa5c 100644
> > > > --- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > > > +++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > > > @@ -341,6 +341,18 @@ static void lcdif_enable_controller(struct
> > > > lcdif_drm_private *lcdif)
> > > >   	reg = readl(lcdif->base + LCDC_V8_CTRLDESCL0_5);
> > > >   	reg |= CTRLDESCL0_5_EN;
> > > >   	writel(reg, lcdif->base + LCDC_V8_CTRLDESCL0_5);
> > > > +
> > > > +	/* Set FIFO Panic watermarks, low 1/3, high 2/3 . */
> > > > +	writel(FIELD_PREP(PANIC0_THRES_LOW_MASK, 1 * PANIC0_THRES_RANGE
> > > > / 3) |
> > > > +	       FIELD_PREP(PANIC0_THRES_HIGH_MASK, 2 *
> > > > PANIC0_THRES_RANGE / 3),
> > > 
> > > Better to define PANIC0_THRES_{LOW,HIGH}(n) macros in lcdif_regs.h?
> > > 
> > > Downstream kernel uses the below threshold values:
> > > a) i.MX8mp EVK board with LPDDR4
> > > 1/3 and 2/3 for LCDIF{1,2} + DSI/LVDS - default values in driver
> > > 1/2 and 3/4 for LCDIF3 + HDMI - set in device tree
> > > 
> > > b) i.MX8mp EVK board with DDR4
> > > 1/3 and 2/3 for LCDIF{1,2} + DSI/LVDS - default values in driver
> > > 2/3 and 3/3 for LCDIF3 + HDMI - set in devic tree
> > > 
> > > Jian told me that LCDIF3 needs different sets of threshold values
> > > for
> > > different types of DDR to avoid 4k HDMI display issues and the
> > > threshold values impact overall DDR/bus utilization(?), so
> > > downstream
> > > kernel chooses to get optional threshold value properties from
> > > LCDIF DT
> > > node.
> > > 
> > > Instead of always using 1/3 and 2/3, maybe there are three options:
> > > 1) Same to downstream kernel, take 1/3 and 2/3 as default values
> > > and
> > > get optional threshold values from DT properties - no additional
> > > properties are acceptable in the existing DT binding doc?
> > > 2) Check pixel clock rate, and if it is greater than a certain
> > > value,
> > > use 2/3 and 3/3.  Otherwise, use 1/3 and 2/3.
> > > 3) Always use 2/3 and 3/3.
> > 
> > Why 2/3 and 3/3 instead of 1/3 and 2/3 ?
> 
> 2/3 and 3/3 trigger panic signal more easily than 1/3 and 2/3. 
> 
> > 
> > Seems like 1/3 and 2/3 provides enough FIFO margin for every
> > scenario.
> 
> I didn't tune the threshold values.  What I was told is that some
> usecases suffer from the FIFO underflows with 1/3 and 2/3.  And, it
> appears that FIFO doesn't underflow with 1/2 and 3/4 or 2/3 and 3/3 in
> those usecases.  That's why downstream kernel chooses to use 1/2 and
> 3/4 or 2/3 and 3/3.

Hi Liu Marek,

I thought that: If the PANIC is enabled and the pre-configured
panic-priority is high enough, nothing should interrupt the LCDIF in
panic mode since it has the highest prio? So why does it the downstream
kernel configure it differently for different use-cases?

Also IMHO the threshold should be taken wisely to not enter panic mode
to early to not block others from the bus e.g. the GPU.

Regards,
  Marco
