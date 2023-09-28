Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B822F7B1B48
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 13:36:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C901F10E04E;
	Thu, 28 Sep 2023 11:36:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CAC610E605
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 11:36:33 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1qlpJm-0001sM-Dv; Thu, 28 Sep 2023 13:36:30 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <l.stach@pengutronix.de>)
 id 1qlpJl-009Z8S-SW; Thu, 28 Sep 2023 13:36:29 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: Marek Vasut <marex@denx.de>,
	Liu Ying <victor.liu@nxp.com>
Subject: [PATCH v3 7/8] drm: lcdif: move pitch setup to plane atomic update
Date: Thu, 28 Sep 2023 13:36:28 +0200
Message-Id: <20230928113629.103188-7-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230928113629.103188-1-l.stach@pengutronix.de>
References: <20230928113629.103188-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
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
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, patchwork-lst@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The buffer pitch may change when switching the buffer on a
atomic update. As the register is double buffered it can be
safely changed while the display is active.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
Reviewed-by: Marek Vasut <marex@denx.de>
---
v2/3: no changes
---
 drivers/gpu/drm/mxsfb/lcdif_kms.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lcdif_kms.c
index a5859c83fe08..c3e31fa0335e 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
@@ -327,19 +327,6 @@ static void lcdif_set_mode(struct lcdif_drm_private *lcdif, u32 bus_flags)
 	writel(CTRLDESCL0_1_HEIGHT(m->vdisplay) |
 	       CTRLDESCL0_1_WIDTH(m->hdisplay),
 	       lcdif->base + LCDC_V8_CTRLDESCL0_1);
-
-	/*
-	 * The P_SIZE and T_SIZE bitfields are only documented in the
-	 * downstream driver. Those bitfields control the AXI burst size.
-	 * As of now there are two known values:
-	 *  1 - 128Byte
-	 *  2 - 256Byte
-	 * Downstream sets this to 256B burst size to improve the memory access
-	 * efficiency so set it here too.
-	 */
-	ctrl = CTRLDESCL0_3_P_SIZE(2) | CTRLDESCL0_3_T_SIZE(2) |
-	       CTRLDESCL0_3_PITCH(lcdif->crtc.primary->state->fb->pitches[0]);
-	writel(ctrl, lcdif->base + LCDC_V8_CTRLDESCL0_3);
 }
 
 static void lcdif_enable_controller(struct lcdif_drm_private *lcdif)
@@ -691,6 +678,19 @@ static void lcdif_plane_primary_atomic_update(struct drm_plane *plane,
 		writel(CTRLDESCL_HIGH0_4_ADDR_HIGH(upper_32_bits(paddr)),
 		       lcdif->base + LCDC_V8_CTRLDESCL_HIGH0_4);
 	}
+
+	/*
+	 * The P_SIZE and T_SIZE bitfields are only documented in the
+	 * downstream driver. Those bitfields control the AXI burst size.
+	 * As of now there are two known values:
+	 *  1 - 128Byte
+	 *  2 - 256Byte
+	 * Downstream sets this to 256B burst size to improve the memory access
+	 * efficiency so set it here too.
+	 */
+	writel(CTRLDESCL0_3_P_SIZE(2) | CTRLDESCL0_3_T_SIZE(2) |
+	       CTRLDESCL0_3_PITCH(new_pstate->fb->pitches[0]),
+	       lcdif->base + LCDC_V8_CTRLDESCL0_3);
 }
 
 static bool lcdif_format_mod_supported(struct drm_plane *plane,
-- 
2.39.2

