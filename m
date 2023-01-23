Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2AE8678B0B
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 23:50:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A3DB10E5B8;
	Mon, 23 Jan 2023 22:50:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B33F310E5B8
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 22:50:18 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1A4192D9;
 Mon, 23 Jan 2023 23:50:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1674514217;
 bh=iLnTqa8o8JUF2ADJgz2DwEoAGOoKy5OWZwjTdqT5Tkg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=o9iDMzVBcYh84iQ+F9eNeiwvAws4akMy/jgUFlSOFyKZ+7s2zRWeOo6bDT1LWo6Oy
 xDgf7Oxny1tj9a7ZhmCjIgdhx8cm22KceMIRm9nkyS2tpfahnZowz8vBOOnsf3jcOM
 GSY0J3cG71/Vh7Sl3YTYZBVHZ6z2keZenXs1PuoU=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3.1 4/7] drm: rcar-du: lvds: Fix stop sequence
Date: Tue, 24 Jan 2023 00:50:13 +0200
Message-Id: <20230123225013.10476-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230123104742.227460-5-tomi.valkeinen+renesas@ideasonboard.com>
References: <20230123104742.227460-5-tomi.valkeinen+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-renesas-soc@vger.kernel.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>

According to hardware manual, LVDCR0 register must be cleared bit by bit
when disabling LVDS.

Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Signed-off-by: LUU HOAI <hoai.luu.ub@renesas.com>
[tomi.valkeinen: simplified the code a bit]
Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v3:

- Add comment explaining the register clear sequence
---
 drivers/gpu/drm/rcar-du/rcar_lvds.c | 31 +++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
index a11201e4d31b..260ea5d8624e 100644
--- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
@@ -83,6 +83,11 @@ struct rcar_lvds {
 #define bridge_to_rcar_lvds(b) \
 	container_of(b, struct rcar_lvds, bridge)
 
+static u32 rcar_lvds_read(struct rcar_lvds *lvds, u32 reg)
+{
+	return ioread32(lvds->mmio + reg);
+}
+
 static void rcar_lvds_write(struct rcar_lvds *lvds, u32 reg, u32 data)
 {
 	iowrite32(data, lvds->mmio + reg);
@@ -544,6 +549,32 @@ static void rcar_lvds_atomic_disable(struct drm_bridge *bridge,
 				     struct drm_bridge_state *old_bridge_state)
 {
 	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
+	u32 lvdcr0;
+
+	/*
+	 * Clear the LVDCR0 bits in the order specified by the hardware
+	 * documentation, ending with a write of 0 to the full register to
+	 * clear all remaining bits.
+	 */
+	lvdcr0 = rcar_lvds_read(lvds, LVDCR0);
+
+	lvdcr0 &= ~LVDCR0_LVRES;
+	rcar_lvds_write(lvds, LVDCR0, lvdcr0);
+
+	if (lvds->info->quirks & RCAR_LVDS_QUIRK_GEN3_LVEN) {
+		lvdcr0 &= ~LVDCR0_LVEN;
+		rcar_lvds_write(lvds, LVDCR0, lvdcr0);
+	}
+
+	if (lvds->info->quirks & RCAR_LVDS_QUIRK_PWD) {
+		lvdcr0 &= ~LVDCR0_PWD;
+		rcar_lvds_write(lvds, LVDCR0, lvdcr0);
+	}
+
+	if (!(lvds->info->quirks & RCAR_LVDS_QUIRK_EXT_PLL)) {
+		lvdcr0 &= ~LVDCR0_PLLON;
+		rcar_lvds_write(lvds, LVDCR0, lvdcr0);
+	}
 
 	rcar_lvds_write(lvds, LVDCR0, 0);
 	rcar_lvds_write(lvds, LVDCR1, 0);
-- 
Regards,

Laurent Pinchart

