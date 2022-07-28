Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8630A583AD9
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 11:00:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E586F96A0F;
	Thu, 28 Jul 2022 09:00:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 076B496C82
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 09:00:14 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1oGzNJ-0004A8-DP; Thu, 28 Jul 2022 11:00:09 +0200
Received: from mfe by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1oGzNH-0006c4-09; Thu, 28 Jul 2022 11:00:07 +0200
Date: Thu, 28 Jul 2022 11:00:06 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Liu Ying <victor.liu@oss.nxp.com>
Subject: Re: [PATCH] drm: lcdif: change burst size to 256B
Message-ID: <20220728090006.kh6p7gsbvtdsn7lb@pengutronix.de>
References: <20220726094302.2859456-1-m.felsch@pengutronix.de>
 <28dc6dfd-08a2-a207-4644-074fb7fee2f1@denx.de>
 <22f34394e6f12c633594572a64d5c6bb40ff4476.camel@oss.nxp.com>
 <20220727035618.skhhwd5hja6cvqgx@pengutronix.de>
 <786c65bce75c5b73f162184e11ff8cf078845c4f.camel@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <786c65bce75c5b73f162184e11ff8cf078845c4f.camel@oss.nxp.com>
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
Cc: Marek Vasut <marex@denx.de>, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, linux-imx@nxp.com, kernel@pengutronix.de,
 sam@ravnborg.org, jian.li@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22-07-28, Liu Ying wrote:
> On Wed, 2022-07-27 at 05:56 +0200, Marco Felsch wrote:
> > Hi Marek, Liu,
> > 
> > On 22-07-26, Liu Ying wrote:
> > > On Tue, 2022-07-26 at 16:19 +0200, Marek Vasut wrote:
> > > > On 7/26/22 11:43, Marco Felsch wrote:
> > > > > FIFO underruns are seen if a AXI bus master with a higher
> > > > > priority
> > > > > do a
> > > > > lot of memory access. Increase the burst size to 256B to avoid
> > > > > such
> > > > > underruns and to improve the memory access efficiency.
> > > > 
> > > > Sigh, this again ...
> > 
> > I know.. we also tried the PANIC mode but this somehow didn't worked
> > as
> > documented. So this was the only way to reduce the underruns without
> > adapting the interconnect prio for the hdmi-lcdif.
> > 
> > > > > diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > > > > b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > > > > index 1bec1279c8b5..1f22ea5896d5 100644
> > > > > --- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > > > > +++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > > > > @@ -143,8 +143,20 @@ static void lcdif_set_mode(struct
> > > > > lcdif_drm_private *lcdif, u32 bus_flags)
> > > > >   	       CTRLDESCL0_1_WIDTH(m->crtc_hdisplay),
> > > > >   	       lcdif->base + LCDC_V8_CTRLDESCL0_1);
> > > > >   
> > > > > -	writel(CTRLDESCL0_3_PITCH(lcdif->crtc.primary->state-
> > > > > >fb-
> > > > > > pitches[0]),
> > > > > 
> > > > > -	       lcdif->base + LCDC_V8_CTRLDESCL0_3);
> > > > > +	/*
> > > > > +	 * Undocumented P_SIZE and T_SIZE bit fields but
> > > > > according the
> > > > > +	 * downstream kernel they control the AXI burst size.
> > > > > As of now
> > > > > there
> > > 
> > > I'm not sure if it is AXI burst size or any other burst size,
> > > though it
> > > seems to be AXI burst size.
> > > 
> > > Cc'ing Jian who mentioned 'burst size' and changed it from 128B to
> > > 256B
> > > in the downstream kernel.
> > 
> > Thanks.
> 
> Jian told me that it's AXI burst size.

Thanks for asking him. Do you know anything about the PANIC mode? We
tested it by:
 - using the interconnect patchsets [1]
 - added a patch for configuring the hdmi-lcdif interconnect via DT [not
   send upstream yet]
 - setting the PANIC threshold to thresh-low:1/2 and tresh-high:3/4 and
   enabled the INT_ENABLE_D1_PLANE_PANIC_EN within
   LCDC_V8_INT_ENABLE_D1 (like the downstream kernel) [no send upstream
   yet]
 - configured the 'LCDIF_NOC_HURRY' to 0x7 (highest prio) like you do
   within your downstream TF-A.

But this didn't worked for us and for Marek if I got him correctly. My
question is: Is the PANIC mode working as documented or are there some
missing bits?

You can test if the PANIC mode is working on the downstream kernel by
reducing the AXI burst size back to 64B, connect a display with at least
1080P and do some heavy memory access. If panic mode is working you
shouldn't see any display artifacts. I tested this before increasing the
AXI burst size by setting the HDMI-LCDIF prio staticlly to a high prio
like 0x5 and it was working with a 64B AXI burst size.

Regards,
  Marco

> Reviewed-by: Liu Ying <victor.liu@nxp.com>
> 
> 
