Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C68B24F7A3D
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 10:48:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2087B10E65D;
	Thu,  7 Apr 2022 08:48:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8D098914E
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 08:48:04 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1ncNoB-0003W6-CH; Thu, 07 Apr 2022 10:48:03 +0200
Message-ID: <41a531191aaaa880b9a44096b8e4c366f50d1f77.camel@pengutronix.de>
Subject: Re: [PATCH 2/2] drm: lcdif: Add support for i.MX8MP LCDIF variant
From: Lucas Stach <l.stach@pengutronix.de>
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Date: Thu, 07 Apr 2022 10:48:01 +0200
In-Reply-To: <0ba4a237-e8ac-485f-5291-5c23398ba6d7@denx.de>
References: <20220322142853.125880-1-marex@denx.de>
 <20220322142853.125880-2-marex@denx.de>
 <97d0ed7496a65d70a79afed174a777d7d7abb4ae.camel@pengutronix.de>
 <0ba4a237-e8ac-485f-5291-5c23398ba6d7@denx.de>
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
Cc: Peng Fan <peng.fan@nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Donnerstag, dem 07.04.2022 um 01:22 +0200 schrieb Marek Vasut:
> On 4/4/22 14:23, Lucas Stach wrote:
> > Hi Marek,
> 
> Hi,
> 
> > not a full review right now, just the first things that I noticed while
> > playing around with this.
> > 
> > Am Dienstag, dem 22.03.2022 um 15:28 +0100 schrieb Marek Vasut:
> > > Add support for i.MX8MP LCDIF variant. This is called LCDIFv3 and is
> > > completely different from the LCDIFv3 found in i.MX23 in that it has
> > > a completely scrambled register layout compared to all previous LCDIF
> > > variants. The new LCDIFv3 also supports 36bit address space.
> > > 
> > > Add a separate driver which is really a fork of MXSFB driver with the
> > > i.MX8MP LCDIF variant handling filled in.
> 
> [...]
> 
> > >   drivers/gpu/drm/mxsfb/Kconfig      |  16 +
> > >   drivers/gpu/drm/mxsfb/Makefile     |   2 +
> > >   drivers/gpu/drm/mxsfb/lcdif_drv.c  | 367 +++++++++++++++++++++
> > >   drivers/gpu/drm/mxsfb/lcdif_drv.h  |  48 +++
> > >   drivers/gpu/drm/mxsfb/lcdif_kms.c  | 492 +++++++++++++++++++++++++++++
> > >   drivers/gpu/drm/mxsfb/lcdif_regs.h | 243 ++++++++++++++
> > 
> > Not sure about this placement. I know you hope to share some code with
> > the other mxsfb driver, but I would prefer to add this into
> > drivers/gpu/drm/imx, same as the DCSS. Another driver for the imx21-
> > lcdif will also be added there and we'll move the ipuv3 driver into its
> > own subdirectory to make it clear that there are multiple separate
> > drivers.
> 
> I do disagree with that. This new LCDIF and old LCDIF (mxsfb) are very 
> similar except for bit shuffling, and yes, I would like to share common 
> code between those two drivers as much as possible.
> 
> Placing this driver and mxsfb driver into the same directory makes it easy.

Lets postpone this discussion until the technical bits are settled.

> 
> > >   6 files changed, 1168 insertions(+)
> > >   create mode 100644 drivers/gpu/drm/mxsfb/lcdif_drv.c
> > >   create mode 100644 drivers/gpu/drm/mxsfb/lcdif_drv.h
> > >   create mode 100644 drivers/gpu/drm/mxsfb/lcdif_kms.c
> > >   create mode 100644 drivers/gpu/drm/mxsfb/lcdif_regs.h
> > > 
> > > diff --git a/drivers/gpu/drm/mxsfb/Kconfig b/drivers/gpu/drm/mxsfb/Kconfig
> > > index 987170e16ebd6..deb84f99d2fca 100644
> > > --- a/drivers/gpu/drm/mxsfb/Kconfig
> > > +++ b/drivers/gpu/drm/mxsfb/Kconfig
> > > @@ -19,3 +19,19 @@ config DRM_MXSFB
> > >   	  i.MX28, i.MX6SX, i.MX7 and i.MX8M).
> > >   
> > >   	  If M is selected the module will be called mxsfb.
> > > +
> > > +config DRM_LCDIF
> > 
> > The config option name and also the DRM driver name are way too
> > generic. Every 3rd SoC out there has a block called lcdif to drive a
> > panel...
> 
> Do you have any other example of LCDIF ? I only see LCDIF from MX23 
> (sgtl design) and this new LCDIF , which still seems like an evolution 
> of that sgtl design.
> 
I don't specifically mean in the FSL/NXP line, but LCF IF being a quite
common abbreviation for LCF interface, it just seems too generic.

> > Maybe something like CONFIG_FSL_LCDIF_V3 and fsl-lcdif-v3 for the name?
> 
> Except that LCDIF v3 is the LCDIF present in i.MX23 , which makes this 
> even more confusing. Any other ideas ?
> 
Yes, I wish the NXP guys already were a bit more creative with the
name, so we don't have to pull a distinctive name out of thin air.

Maybe we just drop this version stuff at all and just call the
controller with the shuffled register layout FSL_LCDIF_REV2?

> [...]
> 
> > > +static struct drm_framebuffer *
> > > +lcdif_fb_create(struct drm_device *dev, struct drm_file *file_priv,
> > > +		const struct drm_mode_fb_cmd2 *mode_cmd)
> > > +{
> > > +	const struct drm_format_info *info;
> > > +
> > > +	info = drm_get_format_info(dev, mode_cmd);
> > > +	if (!info)
> > > +		return ERR_PTR(-EINVAL);
> > > +
> > > +	if (mode_cmd->width * info->cpp[0] != mode_cmd->pitches[0]) {
> > > +		dev_dbg(dev->dev, "Invalid pitch: fb width must match pitch\n");
> > > +		return ERR_PTR(-EINVAL);
> > > +	}
> > 
> > That's not true. One of the major advantages of the LCDIFv3 vs. the
> > other controllers supported by mxsfb is that it actually has a
> > configurable pitch (CTRLDESCL0_3) separate from the display width.
> 
> Right, dropped.
> 
> [...]
> 
> > > +static int lcdif_rpm_suspend(struct device *dev)
> > > +{
> > > +	struct drm_device *drm = dev_get_drvdata(dev);
> > > +	struct lcdif_drm_private *lcdif = drm->dev_private;
> > > +
> > > +	/* These clock supply the DISPLAY CLOCK Domain */
> > > +	clk_disable_unprepare(lcdif->clk);
> > 
> > The pixel clock is really only needed when the display is active, so I
> > think it would be better to keep this in the modeset path.
> 
> Let's continue this in the MXSFB patch discussion so its in one place.
> 
> [...]
> 
> > > +static void
> > > +lcdif_update_buffer(struct lcdif_drm_private *lcdif, struct drm_plane *plane)
> > > +{
> > > +	dma_addr_t paddr;
> > > +	u32 reg;
> > > +
> > > +	paddr = lcdif_get_fb_paddr(plane);
> > > +	if (!paddr)
> > > +		return;
> > > +
> > > +	writel(lower_32_bits(paddr),
> > > +	       lcdif->base + LCDC_V8_CTRLDESCL_LOW0_4);
> > > +	writel(CTRLDESCL_HIGH0_4_ADDR_HIGH(upper_32_bits(paddr)),
> > > +	       lcdif->base + LCDC_V8_CTRLDESCL_HIGH0_4);
> > > +
> > > +	reg = readl(lcdif->base + LCDC_V8_CTRLDESCL0_5);
> > > +	reg |= CTRLDESCL0_5_SHADOW_LOAD_EN;
> > > +	writel(reg, lcdif->base + LCDC_V8_CTRLDESCL0_5);
> > 
> > The shadow load enable should typically go into the atomic_flush
> > function, together with drm_crtc_arm_vblank_event to avoid races.
> 
> Can you elaborate on this further ? Why ? What races ?

It doesn't really matter if you just have one plane like on this
controller, but generally the atomic update is always racing with the
vblank IRQ, which sends out the DRM vblank events. Those events signal
the completion of a atomic commit when the vblank event is armed. After
the event has been sent, userspace is free to reuse or scrap the
buffers from the previous atomic state. So you really want to make sure
that any races between commit and IRQ only ever result in the event
being sent too late rather than too early, as this results in the
display scanning out garbage or freed memory.

So the general flow should always look like this:

In the atomic commit:
  1. program all crtc/plane state
  2. enable shadow load to be executed on next vblank
  3. arm vblank event

In the IRQ handler:
  1. check if shadow load was actually executed
    -> send armed vblank event

This way the vblank happening in the middle of your atomic commit or
the shadow laod being enabled too late for HW to execute it in the
current vblank never results in the vblank event being sent too early,
but just defers it to the next vblank. Then the inherent races only
lead to a skipped frame, rather than scanning out garbage, which is a
much nicer user experience. ;)

> 
> > > +static void lcdif_set_mode(struct lcdif_drm_private *lcdif, u32 bus_flags)
> > > +{
> > > +	struct drm_display_mode *m = &lcdif->crtc.state->adjusted_mode;
> > > +	u32 ctrl = 0;
> > > +
> > > +	if (m->flags & DRM_MODE_FLAG_PHSYNC)
> > > +		ctrl |= CTRL_INV_HS;
> > > +	if (m->flags & DRM_MODE_FLAG_PVSYNC)
> > > +		ctrl |= CTRL_INV_VS;
> > > +	/* Make sure Data Enable is high active by default */
> > > +	if (!(bus_flags & DRM_BUS_FLAG_DE_LOW))
> > > +		ctrl |= CTRL_INV_DE;
> > 
> > The above three controls seems to have the wrong polarity. Bit set
> > means low active according to the register documentation and the PVI in
> > the HDMI path, which has configurable input signal polarity, seems to
> > agree with that.
> 
> I seem to recall seeing something about DE polarity being inverted in 
> odd way in the NXP downstream driver, and differently for each LCDIF 
> instance. Isn't that what you're seeing with HDMI ?
> 
Yes, there seems to be some funky business going on here. I guess for
the MIPI DSI path it's the same as on the i.MX8MM where the DSI core
always expects the sync to be low active IIRC. In the HDMI path there
is a block called PVI, which can be configured on what sync polarity to
expect on the input. My experiments show that if I program the PVI for
high active sync signals, the CTRL_INV_* bits must not be set in the
LCDIF for the PVI to pick up the signal, which is consistent with the
documentation of those bits in the LCDIF register map. 

> [...]
> 
> > > +static void lcdif_disable_controller(struct lcdif_drm_private *lcdif)
> > > +{
> > > +	u32 reg;
> > > +
> > > +	reg = readl(lcdif->base + LCDC_V8_CTRLDESCL0_5);
> > > +	reg &= ~CTRLDESCL0_5_EN;
> > > +	writel(reg, lcdif->base + LCDC_V8_CTRLDESCL0_5);
> > 
> > The downstream driver claims that this bit only takes effect on the end
> > of frame, so we should wait here to make sure that DMA is really
> > stopped.
> 
> [...]
> 
> The rest should be fixed.


