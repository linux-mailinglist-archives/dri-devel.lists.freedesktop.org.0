Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0317B12B541
	for <lists+dri-devel@lfdr.de>; Fri, 27 Dec 2019 15:41:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 720C56E114;
	Fri, 27 Dec 2019 14:41:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A4636E108
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Dec 2019 14:41:32 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 72A9928B933;
 Fri, 27 Dec 2019 14:41:30 +0000 (GMT)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Eric Anholt <eric@anholt.net>
Subject: [PATCH 2/3] drm/vc4: dsi: Fix bridge chain handling
Date: Fri, 27 Dec 2019 15:41:23 +0100
Message-Id: <20191227144124.210294-2-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191227144124.210294-1-boris.brezillon@collabora.com>
References: <20191227144124.210294-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 05193dc38197 ("drm/bridge: Make the bridge chain a double-linked
list") patched the bridge chain logic to use a double-linked list instead
of a single-linked list. This change induced changes to the VC4 driver
which was manually resetting the encoder->bridge element to NULL to
control the enable/disable sequence of the bridge chain. During this
conversion, 2 bugs were introduced:

1/ list_splice() was used to move chain elements to our own internal
   chain, but list_splice() does not reset the source list to an empty
   state, leading to unexpected bridge hook calls when
   drm_bridge_chain_xxx() helpers were called by the core. Replacing
   those list_splice() calls by list_splice_init() ones fixes this
   problem.

2/ drm_bridge_chain_xxx() helpers operate on the
   bridge->encoder->bridge_chain list, which is now empty. When the
   helper uses list_for_each_entry_reverse() we end up with no operation
   done which is not what we want. But that's even worse when the helper
   uses list_for_each_entry_from(), because in that case we end up in
   an infinite loop searching for the list head element which is no
   longer encoder->bridge_chain but vc4_dsi->bridge_chain. To address
   that problem we stop using the bridge chain helpers and call the
   hooks directly.

Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Eric Anholt <eric@anholt.net>
Fixes: 05193dc38197 ("drm/bridge: Make the bridge chain a double-linked list")
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/vc4/vc4_dsi.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index 6c5b80ad6154..fd8a2eb60505 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -753,10 +753,19 @@ static void vc4_dsi_encoder_disable(struct drm_encoder *encoder)
 	struct vc4_dsi_encoder *vc4_encoder = to_vc4_dsi_encoder(encoder);
 	struct vc4_dsi *dsi = vc4_encoder->dsi;
 	struct device *dev = &dsi->pdev->dev;
+	struct drm_bridge *iter;
+
+	list_for_each_entry_reverse(iter, &dsi->bridge_chain, chain_node) {
+		if (iter->funcs->disable)
+			iter->funcs->disable(iter);
+	}
 
-	drm_bridge_chain_disable(dsi->bridge);
 	vc4_dsi_ulps(dsi, true);
-	drm_bridge_chain_post_disable(dsi->bridge);
+
+	list_for_each_entry_from(iter, &dsi->bridge_chain, chain_node) {
+		if (iter->funcs->post_disable)
+			iter->funcs->post_disable(iter);
+	}
 
 	clk_disable_unprepare(dsi->pll_phy_clock);
 	clk_disable_unprepare(dsi->escape_clock);
@@ -824,6 +833,7 @@ static void vc4_dsi_encoder_enable(struct drm_encoder *encoder)
 	struct vc4_dsi *dsi = vc4_encoder->dsi;
 	struct device *dev = &dsi->pdev->dev;
 	bool debug_dump_regs = false;
+	struct drm_bridge *iter;
 	unsigned long hs_clock;
 	u32 ui_ns;
 	/* Minimum LP state duration in escape clock cycles. */
@@ -1056,7 +1066,10 @@ static void vc4_dsi_encoder_enable(struct drm_encoder *encoder)
 
 	vc4_dsi_ulps(dsi, false);
 
-	drm_bridge_chain_pre_enable(dsi->bridge);
+	list_for_each_entry_reverse(iter, &dsi->bridge_chain, chain_node) {
+		if (iter->funcs->pre_enable)
+			iter->funcs->pre_enable(iter);
+	}
 
 	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO) {
 		DSI_PORT_WRITE(DISP0_CTRL,
@@ -1073,7 +1086,10 @@ static void vc4_dsi_encoder_enable(struct drm_encoder *encoder)
 			       DSI_DISP0_ENABLE);
 	}
 
-	drm_bridge_chain_enable(dsi->bridge);
+	list_for_each_entry(iter, &dsi->bridge_chain, chain_node) {
+		if (iter->funcs->enable)
+			iter->funcs->enable(iter);
+	}
 
 	if (debug_dump_regs) {
 		struct drm_printer p = drm_info_printer(&dsi->pdev->dev);
@@ -1613,7 +1629,7 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
 	 * from our driver, since we need to sequence them within the
 	 * encoder's enable/disable paths.
 	 */
-	list_splice(&dsi->encoder->bridge_chain, &dsi->bridge_chain);
+	list_splice_init(&dsi->encoder->bridge_chain, &dsi->bridge_chain);
 
 	if (dsi->port == 0)
 		vc4_debugfs_add_regset32(drm, "dsi0_regs", &dsi->regset);
@@ -1639,7 +1655,7 @@ static void vc4_dsi_unbind(struct device *dev, struct device *master,
 	 * Restore the bridge_chain so the bridge detach procedure can happen
 	 * normally.
 	 */
-	list_splice(&dsi->bridge_chain, &dsi->encoder->bridge_chain);
+	list_splice_init(&dsi->bridge_chain, &dsi->encoder->bridge_chain);
 	vc4_dsi_encoder_destroy(dsi->encoder);
 
 	if (dsi->port == 1)
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
