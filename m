Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEE6614E47
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 16:26:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B10A310E3EA;
	Tue,  1 Nov 2022 15:26:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B5B910E3EC
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Nov 2022 15:26:41 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id EB2BA84F20;
 Tue,  1 Nov 2022 16:26:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1667316400;
 bh=NQ3K3Y2PWUkiRqYNuuZad/5FcUkWuZr6jIJpfIf3uho=;
 h=From:To:Cc:Subject:Date:From;
 b=hY7OghlNN2mGbm13dEPDz8g2iLNRK0AFz2V0Cl+WlAYs9AHrhit/R1gRYPuXZw/id
 2/CGQVJ4B6EETjwvohF1nETLDLhAOwSI52iIVzHUVXpVPTVi2MGEKdPbUcnZW5oMQQ
 kYESXmoVrr2I2oZs/M4n2Cl5qrUGVPT+eBOCdq9G098dVlkIBqAkzYZ9WiNbxjvnY6
 GHL0HOVmTcx4qf2WYDa2F4YQ14w/9JsQT3pcgfEGR5tvR2EGfvwrnhJ0w+tdpRaXTV
 dCYyDEPU/iLnYZszDfM4Ql+OiQZeZ7slTrwfte5MVwgd8XaUw5NNou4kSrR6n6+NYA
 HkOzR+OxW9Ugg==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm: lcdif: Set and enable FIFO Panic threshold
Date: Tue,  1 Nov 2022 16:26:29 +0100
Message-Id: <20221101152629.21768-1-marex@denx.de>
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
the LCDIFv3 becomes susceptible to FIFO underflows, these lead to nasty
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
V2: - Include bitfield.h to always obtain FIELD_PREP definition
    - Rename PANIC0_THRES_RANGE to PANIC0_THRES_MAX and set to 511
    - Move threshold configuration and enable before FIFO and
      scanout enable and vice versa for disable
---
 drivers/gpu/drm/mxsfb/lcdif_kms.c  | 16 ++++++++++++++++
 drivers/gpu/drm/mxsfb/lcdif_regs.h |  1 +
 2 files changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lcdif_kms.c
index a5302006c02cd..09280c6c3bbc1 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
@@ -5,6 +5,7 @@
  * This code is based on drivers/gpu/drm/mxsfb/mxsfb*
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
@@ -334,6 +335,18 @@ static void lcdif_enable_controller(struct lcdif_drm_private *lcdif)
 {
 	u32 reg;
 
+	/* Set FIFO Panic watermarks, low 1/3, high 2/3 . */
+	writel(FIELD_PREP(PANIC0_THRES_LOW_MASK, 1 * PANIC0_THRES_MAX / 3) |
+	       FIELD_PREP(PANIC0_THRES_HIGH_MASK, 2 * PANIC0_THRES_MAX / 3),
+	       lcdif->base + LCDC_V8_PANIC0_THRES);
+
+	/*
+	 * Enable FIFO Panic, this does not generate interrupt, but
+	 * boosts NoC priority based on FIFO Panic watermarks.
+	 */
+	writel(INT_ENABLE_D1_PLANE_PANIC_EN,
+	       lcdif->base + LCDC_V8_INT_ENABLE_D1);
+
 	reg = readl(lcdif->base + LCDC_V8_DISP_PARA);
 	reg |= DISP_PARA_DISP_ON;
 	writel(reg, lcdif->base + LCDC_V8_DISP_PARA);
@@ -361,6 +374,9 @@ static void lcdif_disable_controller(struct lcdif_drm_private *lcdif)
 	reg = readl(lcdif->base + LCDC_V8_DISP_PARA);
 	reg &= ~DISP_PARA_DISP_ON;
 	writel(reg, lcdif->base + LCDC_V8_DISP_PARA);
+
+	/* Disable FIFO Panic NoC priority booster. */
+	writel(0, lcdif->base + LCDC_V8_INT_ENABLE_D1);
 }
 
 static void lcdif_reset_block(struct lcdif_drm_private *lcdif)
diff --git a/drivers/gpu/drm/mxsfb/lcdif_regs.h b/drivers/gpu/drm/mxsfb/lcdif_regs.h
index fb74eb5ccbf1d..c55dfb236c1d3 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_regs.h
+++ b/drivers/gpu/drm/mxsfb/lcdif_regs.h
@@ -255,6 +255,7 @@
 
 #define PANIC0_THRES_LOW_MASK		GENMASK(24, 16)
 #define PANIC0_THRES_HIGH_MASK		GENMASK(8, 0)
+#define PANIC0_THRES_MAX		511
 
 #define LCDIF_MIN_XRES			120
 #define LCDIF_MIN_YRES			120
-- 
2.35.1

