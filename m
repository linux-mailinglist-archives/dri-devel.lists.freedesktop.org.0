Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD50581E72
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jul 2022 05:56:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF34D112BB6;
	Wed, 27 Jul 2022 03:56:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4114A8FFEE
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jul 2022 03:56:26 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1oGY9k-0005EV-2K; Wed, 27 Jul 2022 05:56:20 +0200
Received: from mfe by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1oGY9i-0005uA-98; Wed, 27 Jul 2022 05:56:18 +0200
Date: Wed, 27 Jul 2022 05:56:18 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Liu Ying <victor.liu@oss.nxp.com>
Subject: Re: [PATCH] drm: lcdif: change burst size to 256B
Message-ID: <20220727035618.skhhwd5hja6cvqgx@pengutronix.de>
References: <20220726094302.2859456-1-m.felsch@pengutronix.de>
 <28dc6dfd-08a2-a207-4644-074fb7fee2f1@denx.de>
 <22f34394e6f12c633594572a64d5c6bb40ff4476.camel@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22f34394e6f12c633594572a64d5c6bb40ff4476.camel@oss.nxp.com>
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

Hi Marek, Liu,

On 22-07-26, Liu Ying wrote:
> On Tue, 2022-07-26 at 16:19 +0200, Marek Vasut wrote:
> > On 7/26/22 11:43, Marco Felsch wrote:
> > > FIFO underruns are seen if a AXI bus master with a higher priority
> > > do a
> > > lot of memory access. Increase the burst size to 256B to avoid such
> > > underruns and to improve the memory access efficiency.
> > 
> > Sigh, this again ...

I know.. we also tried the PANIC mode but this somehow didn't worked as
documented. So this was the only way to reduce the underruns without
adapting the interconnect prio for the hdmi-lcdif.

> > > diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > > b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > > index 1bec1279c8b5..1f22ea5896d5 100644
> > > --- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > > +++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > > @@ -143,8 +143,20 @@ static void lcdif_set_mode(struct
> > > lcdif_drm_private *lcdif, u32 bus_flags)
> > >   	       CTRLDESCL0_1_WIDTH(m->crtc_hdisplay),
> > >   	       lcdif->base + LCDC_V8_CTRLDESCL0_1);
> > >   
> > > -	writel(CTRLDESCL0_3_PITCH(lcdif->crtc.primary->state->fb-
> > > >pitches[0]),
> > > -	       lcdif->base + LCDC_V8_CTRLDESCL0_3);
> > > +	/*
> > > +	 * Undocumented P_SIZE and T_SIZE bit fields but according the
> > > +	 * downstream kernel they control the AXI burst size. As of now
> > > there
> 
> I'm not sure if it is AXI burst size or any other burst size, though it
> seems to be AXI burst size.
> 
> Cc'ing Jian who mentioned 'burst size' and changed it from 128B to 256B
> in the downstream kernel.

Thanks.

> > > +	 * are two known values:
> > > +	 *  1 - 128Byte
> > > +	 *  2 - 256Byte
> > > +	 *
> > > +	 * Downstream has set the burst size to 256Byte to improve the
> > > memory
> > > +	 * efficiency so set it here too. This also reduces the FIFO
> > > underrun
> > > +	 * possibility.
> > > +	 */
> > > +	ctrl = CTRLDESCL0_3_P_SIZE(2) | CTRLDESCL0_3_T_SIZE(2) |
> > > +	       CTRLDESCL0_3_PITCH(lcdif->crtc.primary->state->fb-
> > > >pitches[0]);
> > > +	writel(ctrl, lcdif->base + LCDC_V8_CTRLDESCL0_3);
> 
> Nit: I would write the register directly, instead of caching the value
> in ctrl.

IMHO it's more readable that way.

Regards,
  Marco

> > >   }
> > 
> > Sometimes I wonder whether this might be some successor of MXSFB 
> > LCDIF_CTRL2n OUTSTANDING_REQS and BURST_LEN_B fields.
> 
> No idea...
> 
> Liu Ying
> 
> > 
> > +CC Liu, who seems to have a lot of knowledge about this IP.
> > 
> > Reviewed-by: Marek Vasut <marex@denx.de>
> 
> 
