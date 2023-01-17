Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 472E3671958
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 11:42:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B85B10E6FF;
	Wed, 18 Jan 2023 10:42:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14BF210E53C
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 13:52:16 +0000 (UTC)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 464FE7F8;
 Tue, 17 Jan 2023 14:52:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1673963534;
 bh=L99YGDzzTbqbieWnC8cqQjbsz6I2by92epxdF6ewtvg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ztc73Q/CiFlMxpPJLagAtwFUiilyMmBfMOaPY85ZDErmrTBNAK+L1pQ0stkP2qhna
 890W2NrHxyFaYVj1sSMoP7rpdGIO+FPzKi1OzQEg9Zu+dgZnRSwgBD8IwrNqG2mjYu
 gzivRXnU1b/PfYKBMwqVFO/ftxn6BHq+EBbmqUoQ=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH 3/6] drm: rcar-du: Fix LVDS stop sequence
Date: Tue, 17 Jan 2023 15:51:51 +0200
Message-Id: <20230117135154.387208-4-tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230117135154.387208-1-tomi.valkeinen+renesas@ideasonboard.com>
References: <20230117135154.387208-1-tomi.valkeinen+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 18 Jan 2023 10:42:12 +0000
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
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
 LUU HOAI <hoai.luu.ub@renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>

According to H/W manual, LVDCR0 register must be cleared bit by bit when
disabling LVDS.

Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Signed-off-by: LUU HOAI <hoai.luu.ub@renesas.com>
[tomi.valkeinen: simplified the code a bit]
Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_lvds.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
index 674b727cdaa2..01800cef1c33 100644
--- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
@@ -87,6 +87,11 @@ static void rcar_lvds_write(struct rcar_lvds *lvds, u32 reg, u32 data)
 	iowrite32(data, lvds->mmio + reg);
 }
 
+static u32 rcar_lvds_read(struct rcar_lvds *lvds, u32 reg)
+{
+	return ioread32(lvds->mmio + reg);
+}
+
 /* -----------------------------------------------------------------------------
  * PLL Setup
  */
@@ -549,8 +554,28 @@ static void rcar_lvds_atomic_disable(struct drm_bridge *bridge,
 				     struct drm_bridge_state *old_bridge_state)
 {
 	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
+	u32 lvdcr0;
+
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
 
-	rcar_lvds_write(lvds, LVDCR0, 0);
 	rcar_lvds_write(lvds, LVDCR1, 0);
 	rcar_lvds_write(lvds, LVDPLLCR, 0);
 
-- 
2.34.1

