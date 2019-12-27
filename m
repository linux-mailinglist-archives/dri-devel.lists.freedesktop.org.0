Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6089112B540
	for <lists+dri-devel@lfdr.de>; Fri, 27 Dec 2019 15:41:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 320256E108;
	Fri, 27 Dec 2019 14:41:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A4F16E114
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Dec 2019 14:41:32 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D1E17292853;
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
Subject: [PATCH 3/3] drm/exynos: dsi: Fix bridge chain handling
Date: Fri, 27 Dec 2019 15:41:24 +0100
Message-Id: <20191227144124.210294-3-boris.brezillon@collabora.com>
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
of a single-linked list. This change induced changes to the Exynos driver
which was manually resetting the encoder->bridge element to NULL to
control the enable/disable sequence of the bridge chain. During this
conversion, 2 bugs were introduced:

1/ list_splice() was used to move chain elements to our own internal
   chain, but list_splice() does not reset the source list to an empty
   state, leading to unexpected bridge hook calls when
   drm_bridge_chain_xxx() helpers were called by the core. Replacing
   the list_splice() call by list_splice_init() fixes this problem.

2/ drm_bridge_chain_xxx() helpers operate on the
   bridge->encoder->bridge_chain list, which is now empty. When the
   helper uses list_for_each_entry_reverse() we end up with no operation
   done which is not what we want. But that's even worse when the helper
   uses list_for_each_entry_from(), because in that case we end up in
   an infinite loop searching for the list head element which is no
   longer encoder->bridge_chain but exynos_dsi->bridge_chain. To address
   that problem we stop using the bridge chain helpers and call the
   hooks directly.

Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Fixes: 05193dc38197 ("drm/bridge: Make the bridge chain a double-linked list")
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
Hello Marek,

I'm perfectly fine applying your patch instead of this one if you prefer
to restrict the logic to a single bridge per chain. I just sent this
patch in case your okay with the slightly different version I propose
here.

Let me know what you want to do.

Regards,

Boris
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 29 ++++++++++++++++++++-----
 1 file changed, 24 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 3955f84dc893..33628d85edad 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1378,6 +1378,7 @@ static void exynos_dsi_unregister_te_irq(struct exynos_dsi *dsi)
 static void exynos_dsi_enable(struct drm_encoder *encoder)
 {
 	struct exynos_dsi *dsi = encoder_to_dsi(encoder);
+	struct drm_bridge *iter;
 	int ret;
 
 	if (dsi->state & DSIM_STATE_ENABLED)
@@ -1391,7 +1392,11 @@ static void exynos_dsi_enable(struct drm_encoder *encoder)
 		if (ret < 0)
 			goto err_put_sync;
 	} else {
-		drm_bridge_chain_pre_enable(dsi->out_bridge);
+		list_for_each_entry_reverse(iter, &dsi->bridge_chain,
+					    chain_node) {
+			if (iter->funcs->pre_enable)
+				iter->funcs->pre_enable(iter);
+		}
 	}
 
 	exynos_dsi_set_display_mode(dsi);
@@ -1402,7 +1407,10 @@ static void exynos_dsi_enable(struct drm_encoder *encoder)
 		if (ret < 0)
 			goto err_display_disable;
 	} else {
-		drm_bridge_chain_enable(dsi->out_bridge);
+		list_for_each_entry(iter, &dsi->bridge_chain, chain_node) {
+			if (iter->funcs->enable)
+				iter->funcs->enable(iter);
+		}
 	}
 
 	dsi->state |= DSIM_STATE_VIDOUT_AVAILABLE;
@@ -1420,6 +1428,7 @@ static void exynos_dsi_enable(struct drm_encoder *encoder)
 static void exynos_dsi_disable(struct drm_encoder *encoder)
 {
 	struct exynos_dsi *dsi = encoder_to_dsi(encoder);
+	struct drm_bridge *iter;
 
 	if (!(dsi->state & DSIM_STATE_ENABLED))
 		return;
@@ -1427,10 +1436,20 @@ static void exynos_dsi_disable(struct drm_encoder *encoder)
 	dsi->state &= ~DSIM_STATE_VIDOUT_AVAILABLE;
 
 	drm_panel_disable(dsi->panel);
-	drm_bridge_chain_disable(dsi->out_bridge);
+
+	list_for_each_entry_reverse(iter, &dsi->bridge_chain, chain_node) {
+		if (iter->funcs->disable)
+			iter->funcs->disable(iter);
+	}
+
 	exynos_dsi_set_display_enable(dsi, false);
 	drm_panel_unprepare(dsi->panel);
-	drm_bridge_chain_post_disable(dsi->out_bridge);
+
+	list_for_each_entry(iter, &dsi->bridge_chain, chain_node) {
+		if (iter->funcs->post_disable)
+			iter->funcs->post_disable(iter);
+	}
+
 	dsi->state &= ~DSIM_STATE_ENABLED;
 	pm_runtime_put_sync(dsi->dev);
 }
@@ -1523,7 +1542,7 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
 	if (out_bridge) {
 		drm_bridge_attach(encoder, out_bridge, NULL);
 		dsi->out_bridge = out_bridge;
-		list_splice(&encoder->bridge_chain, &dsi->bridge_chain);
+		list_splice_init(&encoder->bridge_chain, &dsi->bridge_chain);
 	} else {
 		int ret = exynos_dsi_create_connector(encoder);
 
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
