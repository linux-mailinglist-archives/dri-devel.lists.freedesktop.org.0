Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B5C718986
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 20:45:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FC2B10E073;
	Wed, 31 May 2023 18:45:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88E8210E1E7
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 18:45:32 +0000 (UTC)
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1q4Qp7-0006ld-Or; Wed, 31 May 2023 20:45:29 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: Marek Vasut <marex@denx.de>
Subject: [PATCH 1/2] drm: lcdif: move pitch setup to plane atomic update
Date: Wed, 31 May 2023 20:45:26 +0200
Message-Id: <20230531184527.1220305-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
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
Cc: dri-devel@lists.freedesktop.org, patchwork-lst@pengutronix.de,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The buffer pitch may change when switching the buffer on a
atomic update. As the register is double buffered it can be
safely changed while the display is active.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/gpu/drm/mxsfb/lcdif_kms.c | 30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lcdif_kms.c
index 262bc43b1079..bbea44ee7a66 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
@@ -314,19 +314,6 @@ static void lcdif_set_mode(struct lcdif_drm_private *lcdif, u32 bus_flags)
 	writel(CTRLDESCL0_1_HEIGHT(m->vdisplay) |
 	       CTRLDESCL0_1_WIDTH(m->hdisplay),
 	       lcdif->base + LCDC_V8_CTRLDESCL0_1);
-
-	/*
-	 * Undocumented P_SIZE and T_SIZE register but those written in the
-	 * downstream kernel those registers control the AXI burst size. As of
-	 * now there are two known values:
-	 *  1 - 128Byte
-	 *  2 - 256Byte
-	 * Downstream set it to 256B burst size to improve the memory
-	 * efficiency so set it here too.
-	 */
-	ctrl = CTRLDESCL0_3_P_SIZE(2) | CTRLDESCL0_3_T_SIZE(2) |
-	       CTRLDESCL0_3_PITCH(lcdif->crtc.primary->state->fb->pitches[0]);
-	writel(ctrl, lcdif->base + LCDC_V8_CTRLDESCL0_3);
 }
 
 static void lcdif_enable_controller(struct lcdif_drm_private *lcdif)
@@ -502,6 +489,10 @@ static void lcdif_crtc_atomic_enable(struct drm_crtc *crtc,
 		writel(CTRLDESCL_HIGH0_4_ADDR_HIGH(upper_32_bits(paddr)),
 		       lcdif->base + LCDC_V8_CTRLDESCL_HIGH0_4);
 	}
+	writel(CTRLDESCL0_3_P_SIZE(2) | CTRLDESCL0_3_T_SIZE(2) |
+	       CTRLDESCL0_3_PITCH(new_pstate->fb->pitches[0]),
+	       lcdif->base + LCDC_V8_CTRLDESCL0_3);
+
 	lcdif_enable_controller(lcdif);
 
 	drm_crtc_vblank_on(crtc);
@@ -611,6 +602,19 @@ static void lcdif_plane_primary_atomic_update(struct drm_plane *plane,
 		writel(CTRLDESCL_HIGH0_4_ADDR_HIGH(upper_32_bits(paddr)),
 		       lcdif->base + LCDC_V8_CTRLDESCL_HIGH0_4);
 	}
+
+	/*
+	 * Undocumented P_SIZE and T_SIZE bitfields written in the downstream
+	 * driver. Those bitfields control the AXI burst size. As of now there
+	 * are two known values:
+	 *  1 - 128Byte
+	 *  2 - 256Byte
+	 * Downstream set it to 256B burst size to improve the memory
+	 * efficiency so set it here too.
+	 */
+	writel(CTRLDESCL0_3_P_SIZE(2) | CTRLDESCL0_3_T_SIZE(2) |
+	       CTRLDESCL0_3_PITCH(new_pstate->fb->pitches[0]),
+	       lcdif->base + LCDC_V8_CTRLDESCL0_3);
 }
 
 static bool lcdif_format_mod_supported(struct drm_plane *plane,
-- 
2.39.2

