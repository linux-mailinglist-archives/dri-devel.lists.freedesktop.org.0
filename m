Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC211614C2E
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 15:04:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 268B510E3ED;
	Tue,  1 Nov 2022 14:04:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6A4810E3CB
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Nov 2022 14:04:07 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1oprs6-0001Cd-7K; Tue, 01 Nov 2022 15:04:06 +0100
Received: from mfe by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1oprs4-0004Dx-Sk; Tue, 01 Nov 2022 15:04:04 +0100
Date: Tue, 1 Nov 2022 15:04:04 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH] drm: lcdif: Set and enable FIFO Panic threshold
Message-ID: <20221101140404.pwsxecee3rmot7st@pengutronix.de>
References: <20221026212002.542375-1-marex@denx.de>
 <2e9368bcc1c354ff01e63b9c451d839aa6a7a36f.camel@nxp.com>
 <9bd9ee85-3a20-f13a-3984-017a439e08cd@denx.de>
 <6398adb972ef8623fd594fd573b5ed6838948516.camel@nxp.com>
 <20221027174748.niz6wi7dqwj3nlyr@pengutronix.de>
 <45837065-f231-8c72-4818-d943133d66a5@denx.de>
 <57059f620dc6dbd63ef289a82c8dae685d048242.camel@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <57059f620dc6dbd63ef289a82c8dae685d048242.camel@nxp.com>
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

Hi Marek, Liu,

On 22-10-28, Liu Ying wrote:
> On Fri, 2022-10-28 at 02:03 +0200, Marek Vasut wrote:
> > On 10/27/22 19:47, Marco Felsch wrote:
> > > On 22-10-27, Liu Ying wrote:
> > > > On Thu, 2022-10-27 at 12:03 +0200, Marek Vasut wrote:
> > > > > On 10/27/22 07:45, Liu Ying wrote:
> > > > > 
> > > > > Hi,
> > > > > 
> > > > > [...]
> > > > > 
> > > > > > > diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > > > > > > b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > > > > > > index a5302006c02cd..aee7babb5fa5c 100644
> > > > > > > --- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > > > > > > +++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > > > > > > @@ -341,6 +341,18 @@ static void
> > > > > > > lcdif_enable_controller(struct
> > > > > > > lcdif_drm_private *lcdif)
> > > > > > >    	reg = readl(lcdif->base + LCDC_V8_CTRLDESCL0_5);
> > > > > > >    	reg |= CTRLDESCL0_5_EN;
> > > > > > >    	writel(reg, lcdif->base + LCDC_V8_CTRLDESCL0_5);
> > > > > > > +
> > > > > > > +	/* Set FIFO Panic watermarks, low 1/3, high 2/3 . */
> > > > > > > +	writel(FIELD_PREP(PANIC0_THRES_LOW_MASK, 1 *
> > > > > > > PANIC0_THRES_RANGE
> > > > > > > / 3) |
> > > > > > > +	       FIELD_PREP(PANIC0_THRES_HIGH_MASK, 2 *
> > > > > > > PANIC0_THRES_RANGE / 3),
> > > > > > 
> > > > > > Better to define PANIC0_THRES_{LOW,HIGH}(n) macros in
> > > > > > lcdif_regs.h?
> > > > > > 
> > > > > > Downstream kernel uses the below threshold values:
> > > > > > a) i.MX8mp EVK board with LPDDR4
> > > > > > 1/3 and 2/3 for LCDIF{1,2} + DSI/LVDS - default values in
> > > > > > driver
> > > > > > 1/2 and 3/4 for LCDIF3 + HDMI - set in device tree
> > > > > > 
> > > > > > b) i.MX8mp EVK board with DDR4
> > > > > > 1/3 and 2/3 for LCDIF{1,2} + DSI/LVDS - default values in
> > > > > > driver
> > > > > > 2/3 and 3/3 for LCDIF3 + HDMI - set in devic tree
> > > > > > 
> > > > > > Jian told me that LCDIF3 needs different sets of threshold
> > > > > > values
> > > > > > for
> > > > > > different types of DDR to avoid 4k HDMI display issues and
> > > > > > the
> > > > > > threshold values impact overall DDR/bus utilization(?), so
> > > > > > downstream
> > > > > > kernel chooses to get optional threshold value properties
> > > > > > from
> > > > > > LCDIF DT
> > > > > > node.
> > > > > > 
> > > > > > Instead of always using 1/3 and 2/3, maybe there are three
> > > > > > options:
> > > > > > 1) Same to downstream kernel, take 1/3 and 2/3 as default
> > > > > > values
> > > > > > and
> > > > > > get optional threshold values from DT properties - no
> > > > > > additional
> > > > > > properties are acceptable in the existing DT binding doc?
> > > > > > 2) Check pixel clock rate, and if it is greater than a
> > > > > > certain
> > > > > > value,
> > > > > > use 2/3 and 3/3.  Otherwise, use 1/3 and 2/3.
> > > > > > 3) Always use 2/3 and 3/3.
> > > > > 
> > > > > Why 2/3 and 3/3 instead of 1/3 and 2/3 ?
> > > > 
> > > > 2/3 and 3/3 trigger panic signal more easily than 1/3 and 2/3.
> > > > 
> > > > > 
> > > > > Seems like 1/3 and 2/3 provides enough FIFO margin for every
> > > > > scenario.
> > > > 
> > > > I didn't tune the threshold values.  What I was told is that some
> > > > usecases suffer from the FIFO underflows with 1/3 and 2/3.  And,
> > > > it
> > > > appears that FIFO doesn't underflow with 1/2 and 3/4 or 2/3 and
> > > > 3/3 in
> > > > those usecases.  That's why downstream kernel chooses to use 1/2
> > > > and
> > > > 3/4 or 2/3 and 3/3.
> > > 
> > > Hi Liu Marek,
> > > 
> > > I thought that: If the PANIC is enabled and the pre-configured
> > > panic-priority is high enough, nothing should interrupt the LCDIF
> > > in
> > > panic mode since it has the highest prio? So why does it the
> > > downstream
> > > kernel configure it differently for different use-cases?
> > > 
> > > Also IMHO the threshold should be taken wisely to not enter panic
> > > mode
> > > to early to not block others from the bus e.g. the GPU.
> > 
> > As far as I understand the PANIC0_THRES, both thresholds are really 
> > watermarks in the FIFO, 0=EMPTY, 1/3=LOW, 2/3=HIGH, 3/3=FULL. Under 
> > normal conditions, the FIFO is filled above 1/3. When the FIFO fill 
> > drops below LOW=1/3, the "PANIC" signal is asserted so the FIFO can
> > be 
> > refilled faster. When the FIFO fill raises above HIGH=2/3, the
> > "PANIC" 
> > signal is deasserted so the FIFO refills at normal rate again.

This matches exactly my picture of the hardware.

> > It seems to me the LOW=1/3 and HIGH=2/3 thresholds are the kind of
> > good 
> > balance. The LOW=2/3 and HIGH=FULL=3/3 seems like it would keep the 
> > "PANIC" signal asserted much longer, which could indeed block others 
> > from the bus.

Also I understood the thresholds in such a way, that the FIFO watermark
must be higher but there is no place left when it is set to 3/3. In such
case this means that the PANIC will never left once it was entered.

> > It also seems to me that tuning these thresholds might be related to 
> > some special use-case of the SoC, and it is most likely not just the 
> > LCDIF thresholds which have been adjusted in such case, I would
> > expect 
> > the NOC and GPV NIC priorities to be adjusted at that point too.

As far as I understood, the PANIC signal triggers the NOC to use the
PANIC signal priorities instead of the normal ones. I found a patch
laying in our downstream [1] repo which configures the threshold. This
raises the question which PANIC prio do you use? Do you have a patch for
this? If I remember correctly some TF-A's like the NXP downstream one
configure this but the upstream TF-A don't. Which TF-A do you use?

> > So unless there are further details for that use-case which justify
> > making this somehow configurable, then maybe we should just stick to
> > 1/3 and 2/3 for now. And once there is a valid use-case which does
> > justify making this configurable, then we can add the DT properties
> > and all.
> > 
> > What do you think ?
>
> No strong opinion from me on using LOW=1/3 and HIGH=2/3 thresholds for
> now if they satisfy all current users of the upstream kernel.  Tuning
> them in a certain way will be indeed needed once an usecase comes along
> and still suffers from the FIFO underflows with those thresholds.

I think that 1/3 and 2/3 should be fine for now too.

Regards,
  Marco

[1]
8<---------------------------------------------------------------------
From b964a83b45c2e2610b8240fbcac776df075c88e2 Mon Sep 17 00:00:00 2001
From: Marco Felsch <m.felsch@pengutronix.de>
Date: Fri, 22 Jul 2022 11:08:19 +0200
Subject: [PATCH] soc: imx: imx8mp-blk-ctrl: set the LCDIF hurry priority

Status: WIP, needs clarification with NXP first.

Set the LCDIF hurry priority to highest possible value so FIFO underruns
can be avoided. The hurry priority will be set by the BLKCTL hw as soon
as the LCDIF panic signal is active and set back to 'normal' priority
after the panic signal is released.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/soc/imx/imx8mp-blk-ctrl.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/soc/imx/imx8mp-blk-ctrl.c b/drivers/soc/imx/imx8mp-blk-ctrl.c
index 9852714eb2a4..14e744772a01 100644
--- a/drivers/soc/imx/imx8mp-blk-ctrl.c
+++ b/drivers/soc/imx/imx8mp-blk-ctrl.c
@@ -201,6 +201,9 @@ static const struct imx8mp_blk_ctrl_data imx8mp_hsio_blk_ctl_dev_data = {
 #define HDMI_RTX_CLK_CTL3	0x70
 #define HDMI_RTX_CLK_CTL4	0x80
 #define HDMI_TX_CONTROL0	0x200
+#define HDMI_LCDIF_NOC_HURRY_PRIO_MASK	GENMASK(14, 12)
+#define HDMI_LCDIF_NOC_HURRY_PRIO(p)	\
+	(((p) << 12) & HDMI_LCDIF_NOC_HURRY_PRIO_MASK)
 
 static void imx8mp_hdmi_blk_ctrl_power_on(struct imx8mp_blk_ctrl *bc,
 					  struct imx8mp_blk_ctrl_domain *domain)
@@ -217,6 +220,8 @@ static void imx8mp_hdmi_blk_ctrl_power_on(struct imx8mp_blk_ctrl *bc,
 		regmap_set_bits(bc->regmap, HDMI_RTX_CLK_CTL1, BIT(11));
 		regmap_set_bits(bc->regmap, HDMI_RTX_RESET_CTL0,
 				BIT(4) | BIT(5) | BIT(6));
+		regmap_set_bits(bc->regmap, HDMI_TX_CONTROL0,
+				HDMI_LCDIF_NOC_HURRY_PRIO(7));
 		break;
 	case IMX8MP_HDMIBLK_PD_PAI:
 		regmap_set_bits(bc->regmap, HDMI_RTX_CLK_CTL1, BIT(17));
@@ -273,6 +278,12 @@ static void imx8mp_hdmi_blk_ctrl_power_off(struct imx8mp_blk_ctrl *bc,
 		regmap_clear_bits(bc->regmap, HDMI_RTX_CLK_CTL0,
 				  BIT(16) | BIT(17) | BIT(18) |
 				  BIT(19) | BIT(20));
+		/*
+		 * Set priority to highest level case of LCDIF panic to avoid
+		 * FIFO underruns.
+		 */
+		regmap_clear_bits(bc->regmap, HDMI_TX_CONTROL0,
+				  HDMI_LCDIF_NOC_HURRY_PRIO(7));
 		break;
 	case IMX8MP_HDMIBLK_PD_PAI:
 		regmap_clear_bits(bc->regmap, HDMI_RTX_RESET_CTL0, BIT(18));
-- 
2.30.2
