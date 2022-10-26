Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFCE60EAC3
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 23:20:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1236010E324;
	Wed, 26 Oct 2022 21:20:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B890210E324
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Oct 2022 21:20:18 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id C0E6D84F30;
 Wed, 26 Oct 2022 23:20:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1666819217;
 bh=PcSiAcKpS75n3AgClfNSIBNY25+FijnaPwT6RvVECO0=;
 h=From:To:Cc:Subject:Date:From;
 b=R4t3o/hiDLHKn8tQFCF30iJ6o1BWyJqkUJ65hNIiEpRpN8rj60uAlE76DL9G4d1mB
 UN/r2UTUnHcRMUrvGmsekWKbVZ6qNCyJ0XymL5SgJi/4MJ6x6ylqxGP1Xpfw2/0A1Q
 VIJTNK6RjGs/Clezdc51JFzqEaCtRFhLP4/rT1v/5BBntctUp14qdzF05N4dGqH+qH
 PNvnn9diTtZjyb+dya8t/EBcYV4U9fh1xqNoxKIMNhx0o5B0PgyVyYfPPe2CC/RPOv
 K57WddyscZ2mAeHSO8i28BJI7FNNrFLxVzbmK65UvGpCyBQNFr+MbQCS5xbthN6K59
 VEFIjK1Jw6/9A==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: lcdif: Set and enable FIFO Panic threshold
Date: Wed, 26 Oct 2022 23:20:02 +0200
Message-Id: <20221026212002.542375-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
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
 Liu Ying <victor.liu@nxp.com>, Marco Felsch <m.felsch@pengutronix.de>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Martyn Welch <martyn.welch@collabora.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In case the LCDIFv3 is used to drive a 4k panel via i.MX8MP HDMI bridge,
the LCDIFv3 becomes susceptible to FIFO underflows, which lead to nasty
flicker of the image on the panel, or image being shifted by half frame
horizontally every second frame. The flicker can be easily triggered by
running 3D application on top of weston compositor, like neverball or
chromium. Surprisingly glmark2-es2-wayland or glmark2-es2-drm does not
trigger this effect so easily.

Configure the FIFO Panic threshold register and enable the FIFO Panic
mode, which internally boosts the NoC interconnect priority for LCDIFv3
transactions in case of possible underflow. This mitigates the flicker
effect on 4k panels as well.

Fixes: 9db35bb349a0 ("drm: lcdif: Add support for i.MX8MP LCDIF variant")
Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Liu Ying <victor.liu@nxp.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Marco Felsch <m.felsch@pengutronix.de>
Cc: Martyn Welch <martyn.welch@collabora.com>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/mxsfb/lcdif_kms.c  | 15 +++++++++++++++
 drivers/gpu/drm/mxsfb/lcdif_regs.h |  1 +
 2 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lcdif_kms.c
index a5302006c02cd..aee7babb5fa5c 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
@@ -341,6 +341,18 @@ static void lcdif_enable_controller(struct lcdif_drm_private *lcdif)
 	reg = readl(lcdif->base + LCDC_V8_CTRLDESCL0_5);
 	reg |= CTRLDESCL0_5_EN;
 	writel(reg, lcdif->base + LCDC_V8_CTRLDESCL0_5);
+
+	/* Set FIFO Panic watermarks, low 1/3, high 2/3 . */
+	writel(FIELD_PREP(PANIC0_THRES_LOW_MASK, 1 * PANIC0_THRES_RANGE / 3) |
+	       FIELD_PREP(PANIC0_THRES_HIGH_MASK, 2 * PANIC0_THRES_RANGE / 3),
+	       lcdif->base + LCDC_V8_PANIC0_THRES);
+
+	/*
+	 * Enable FIFO Panic, this does not generate interrupt, but
+	 * boosts NoC priority based on FIFO Panic watermarks.
+	 */
+	writel(INT_ENABLE_D1_PLANE_PANIC_EN,
+	       lcdif->base + LCDC_V8_INT_ENABLE_D1);
 }
 
 static void lcdif_disable_controller(struct lcdif_drm_private *lcdif)
@@ -348,6 +360,9 @@ static void lcdif_disable_controller(struct lcdif_drm_private *lcdif)
 	u32 reg;
 	int ret;
 
+	/* Disable FIFO Panic NoC priority booster. */
+	writel(0, lcdif->base + LCDC_V8_INT_ENABLE_D1);
+
 	reg = readl(lcdif->base + LCDC_V8_CTRLDESCL0_5);
 	reg &= ~CTRLDESCL0_5_EN;
 	writel(reg, lcdif->base + LCDC_V8_CTRLDESCL0_5);
diff --git a/drivers/gpu/drm/mxsfb/lcdif_regs.h b/drivers/gpu/drm/mxsfb/lcdif_regs.h
index fb74eb5ccbf1d..3d2f81d6f995e 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_regs.h
+++ b/drivers/gpu/drm/mxsfb/lcdif_regs.h
@@ -255,6 +255,7 @@
 
 #define PANIC0_THRES_LOW_MASK		GENMASK(24, 16)
 #define PANIC0_THRES_HIGH_MASK		GENMASK(8, 0)
+#define PANIC0_THRES_RANGE		512
 
 #define LCDIF_MIN_XRES			120
 #define LCDIF_MIN_YRES			120
-- 
2.35.1

