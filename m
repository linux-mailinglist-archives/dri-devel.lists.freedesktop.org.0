Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A4C30FCE9
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 20:35:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AB326EE41;
	Thu,  4 Feb 2021 19:34:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.siol.net (mailoutvs40.siol.net [185.57.226.231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E91C66EE36
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Feb 2021 18:48:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTP id 2DF32523FBF;
 Thu,  4 Feb 2021 19:48:17 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta11.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta11.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id 7kZew-YskHbH; Thu,  4 Feb 2021 19:48:16 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTPS id D1DDC523FB1;
 Thu,  4 Feb 2021 19:48:16 +0100 (CET)
Received: from kista.localdomain (cpe-86-58-58-53.static.triera.net
 [86.58.58.53]) (Authenticated sender: 031275009)
 by mail.siol.net (Postfix) with ESMTPSA id 72F66523FC5;
 Thu,  4 Feb 2021 19:48:14 +0100 (CET)
From: Jernej Skrabec <jernej.skrabec@siol.net>
To: mripard@kernel.org,
	wens@csie.org
Subject: [PATCH 2/5] drm/sun4i: tcon: set sync polarity for tcon1 channel
Date: Thu,  4 Feb 2021 19:47:07 +0100
Message-Id: <20210204184710.1880895-3-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210204184710.1880895-1-jernej.skrabec@siol.net>
References: <20210204184710.1880895-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 04 Feb 2021 19:34:32 +0000
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
Cc: sboyd@kernel.org, mturquette@baylibre.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, airlied@linux.ie,
 linux-sunxi@googlegroups.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Channel 1 has polarity bits for vsync and hsync signals but driver never
sets them. It turns out that with pre-HDMI2 controllers seemingly there
is no issue if polarity is not set. However, with HDMI2 controllers
(H6) there often comes to de-synchronization due to phase shift. This
causes flickering screen. It's safe to assume that similar issues might
happen also with pre-HDMI2 controllers.

Solve issue with setting vsync and hsync polarity. Note that display
stacks with tcon top have polarity bits actually in tcon0 polarity
register.

Fixes: 9026e0d122ac ("drm: Add Allwinner A10 Display Engine support")
Tested-by: Andre Heider <a.heider@gmail.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 24 ++++++++++++++++++++++++
 drivers/gpu/drm/sun4i/sun4i_tcon.h |  5 +++++
 2 files changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index 6b9af4c08cd6..0d132dae58c0 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -672,6 +672,29 @@ static void sun4i_tcon1_mode_set(struct sun4i_tcon *tcon,
 		     SUN4I_TCON1_BASIC5_V_SYNC(vsync) |
 		     SUN4I_TCON1_BASIC5_H_SYNC(hsync));
 
+	/* Setup the polarity of sync signals */
+	if (tcon->quirks->polarity_in_ch0) {
+		val = 0;
+
+		if (mode->flags & DRM_MODE_FLAG_PHSYNC)
+			val |= SUN4I_TCON0_IO_POL_HSYNC_POSITIVE;
+
+		if (mode->flags & DRM_MODE_FLAG_PVSYNC)
+			val |= SUN4I_TCON0_IO_POL_VSYNC_POSITIVE;
+
+		regmap_write(tcon->regs, SUN4I_TCON0_IO_POL_REG, val);
+	} else {
+		val = SUN4I_TCON1_IO_POL_UNKNOWN;
+
+		if (mode->flags & DRM_MODE_FLAG_PHSYNC)
+			val |= SUN4I_TCON1_IO_POL_HSYNC_POSITIVE;
+
+		if (mode->flags & DRM_MODE_FLAG_PVSYNC)
+			val |= SUN4I_TCON1_IO_POL_VSYNC_POSITIVE;
+
+		regmap_write(tcon->regs, SUN4I_TCON1_IO_POL_REG, val);
+	}
+
 	/* Map output pins to channel 1 */
 	regmap_update_bits(tcon->regs, SUN4I_TCON_GCTL_REG,
 			   SUN4I_TCON_GCTL_IOMAP_MASK,
@@ -1500,6 +1523,7 @@ static const struct sun4i_tcon_quirks sun8i_a83t_tv_quirks = {
 
 static const struct sun4i_tcon_quirks sun8i_r40_tv_quirks = {
 	.has_channel_1		= true,
+	.polarity_in_ch0	= true,
 	.set_mux		= sun8i_r40_tcon_tv_set_mux,
 };
 
diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.h b/drivers/gpu/drm/sun4i/sun4i_tcon.h
index c5ac1b02482c..b504fb2d3de5 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.h
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.h
@@ -154,6 +154,10 @@
 #define SUN4I_TCON1_BASIC5_V_SYNC(height)		(((height) - 1) & 0x3ff)
 
 #define SUN4I_TCON1_IO_POL_REG			0xf0
+#define SUN4I_TCON1_IO_POL_UNKNOWN			BIT(26)
+#define SUN4I_TCON1_IO_POL_HSYNC_POSITIVE		BIT(25)
+#define SUN4I_TCON1_IO_POL_VSYNC_POSITIVE		BIT(24)
+
 #define SUN4I_TCON1_IO_TRI_REG			0xf4
 
 #define SUN4I_TCON_ECC_FIFO_REG			0xf8
@@ -236,6 +240,7 @@ struct sun4i_tcon_quirks {
 	bool	needs_de_be_mux; /* sun6i needs mux to select backend */
 	bool    needs_edp_reset; /* a80 edp reset needed for tcon0 access */
 	bool	supports_lvds;   /* Does the TCON support an LVDS output? */
+	bool	polarity_in_ch0; /* some tcon1 channels have polarity bits in tcon0 pol register */
 	u8	dclk_min_div;	/* minimum divider for TCON0 DCLK */
 
 	/* callback to handle tcon muxing options */
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
