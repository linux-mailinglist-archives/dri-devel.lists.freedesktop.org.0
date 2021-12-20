Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F067E47B33A
	for <lists+dri-devel@lfdr.de>; Mon, 20 Dec 2021 19:51:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E24D113B36;
	Mon, 20 Dec 2021 18:51:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42F9D113B36
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 18:51:14 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1mzNke-0006Cr-I2; Mon, 20 Dec 2021 19:51:12 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1mzNkX-0002xy-1W; Mon, 20 Dec 2021 19:51:05 +0100
Date: Mon, 20 Dec 2021 19:51:05 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
Subject: Re: [PATCH 22/22] drm: rockchip: Add VOP2 driver
Message-ID: <20211220185105.GX6003@pengutronix.de>
References: <20211220110630.3521121-1-s.hauer@pengutronix.de>
 <20211220110630.3521121-23-s.hauer@pengutronix.de>
 <5637649.G3HFo5JPcS@archbook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5637649.G3HFo5JPcS@archbook>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 19:33:51 up 10 days,  3:19, 41 users,  load average: 1.02, 1.08, 1.08
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Peter Geis <pgwipeout@gmail.com>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Andy Yan <andy.yan@rock-chips.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 20, 2021 at 03:16:55PM +0100, Nicolas Frattaroli wrote:
> On Montag, 20. Dezember 2021 12:06:30 CET Sascha Hauer wrote:
> > From: Andy Yan <andy.yan@rock-chips.com>
> > 
> > The VOP2 unit is found on Rockchip SoCs beginning with rk3566/rk3568.
> > It replaces the VOP unit found in the older Rockchip SoCs.
> > 
> > This driver has been derived from the downstream Rockchip Kernel and
> > heavily modified:
> > 
> > - All nonstandard DRM properties have been removed
> > - dropped struct vop2_plane_state and pass around less data between
> >   functions
> > - Dropped all DRM_FORMAT_* not known on upstream
> > - rework register access to get rid of excessively used macros
> > - Drop all waiting for framesyncs
> > 
> > The driver is tested with HDMI and MIPI-DSI display on a RK3568-EVB
> > board. Overlay support is tested with the modetest utility. AFBC support
> > on the cluster windows is tested with weston-simple-dmabuf-egl on
> > weston using the (yet to be upstreamed) panfrost driver support.
> > 
> > Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> > ---
> 
> Hi Sascha,
> 
> sadly I'm getting
> 
> [    1.668856] rockchip-drm display-subsystem: [drm] *ERROR* failed to get vop2 register byname
> [    1.669621] rockchip-drm display-subsystem: failed to bind fe040000.vop (ops vop2_component_ops): -22
> [    1.670584] rockchip-drm display-subsystem: master bind failed: -22
> [    1.671164] dwhdmi-rockchip: probe of fe0a0000.hdmi failed with error -22
> 
> on a Quartz64 Model A.
> 
> 
> > +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "regs");
> > +	if (!res) {
> > +		drm_err(vop2->drm, "failed to get vop2 register byname\n");
> > +		return -EINVAL;
> > +	}
> 
> This seems to be the code that triggers it.
> 
> Any ideas as to what could be causing this?

Gnaa, this was a last minute change I did and thought it was too trivial
to fail :(

The binding previously had:

	reg = <0x0 0xfe040000 0x0 0x3000>, <0x0 0xfe044000 0x0 0x1000>;
	reg-names = "regs", "gamma_lut";

I thought that I can merge these two regions into one bigger region.
Apart from the fact that I got it wrong (The driver still requests a
resource "regs" as you found out), it doesnt work, because the space
between those two regions is not unused, the iommu is in between them.

I'll have to revert that change for the next round. Please use the
attached fixup patch in the meantime.

Sascha

-------------------------------8<------------------------------

From 9b3dee3d8584f5a9cc24f21ff8c5895465c4b3ae Mon Sep 17 00:00:00 2001
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Mon, 20 Dec 2021 19:49:14 +0100
Subject: [PATCH] fixup! arm64: dts: rockchip: rk356x: Add VOP2 nodes

---
 arch/arm64/boot/dts/rockchip/rk356x.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk356x.dtsi b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
index 6d93b8fcee179..cce4b789d6d58 100644
--- a/arch/arm64/boot/dts/rockchip/rk356x.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
@@ -453,7 +453,8 @@ gmac1_mtl_tx_setup: tx-queues-config {
 	};
 
 	vop: vop@fe040000 {
-		reg = <0x0 0xfe040000 0x0 0x5000>;
+		reg = <0x0 0xfe040000 0x0 0x3000>, <0x0 0xfe044000 0x0 0x1000>;
+		reg-names = "regs", "gamma_lut";
 		interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&cru ACLK_VOP>, <&cru HCLK_VOP>, <&cru DCLK_VOP0>, <&cru DCLK_VOP1>, <&cru DCLK_VOP2>;
 		clock-names = "aclk_vop", "hclk_vop", "dclk_vp0", "dclk_vp1", "dclk_vp2";
-- 
2.30.2


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
