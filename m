Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DAB4341E6
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 01:07:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98C0289CF7;
	Tue, 19 Oct 2021 23:07:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A56D589CF7
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 23:07:43 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10142"; a="252126161"
X-IronPort-AV: E=Sophos;i="5.87,164,1631602800"; d="scan'208";a="252126161"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2021 16:07:42 -0700
X-IronPort-AV: E=Sophos;i="5.87,164,1631602800"; d="scan'208";a="662017392"
Received: from csha-mobl1.amr.corp.intel.com (HELO achrisan-desk3.intel.com)
 ([10.212.27.111])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2021 16:07:42 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org,
	anitha.chrisanthus@intel.com
Cc: sam@ravnborg.org,
	edmund.j.dea@intel.com,
	tzimmermann@suse.de
Subject: [PATCH v4 1/2] drm/kmb: Enable ADV bridge after modeset
Date: Tue, 19 Oct 2021 16:07:18 -0700
Message-Id: <20211019230719.789958-1-anitha.chrisanthus@intel.com>
X-Mailer: git-send-email 2.25.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On KMB, ADV bridge must be programmed and powered on prior to
MIPI DSI HW initialization.

v2: changed to atomic_bridge_chain_enable (Sam)

Fixes: 98521f4d4b4c ("drm/kmb: Mipi DSI part of the display driver")
Co-developed-by: Edmund Dea <edmund.j.dea@intel.com>
Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
---
 drivers/gpu/drm/kmb/kmb_crtc.c | 7 ++++---
 drivers/gpu/drm/kmb/kmb_dsi.c  | 9 +++++----
 drivers/gpu/drm/kmb/kmb_dsi.h  | 2 +-
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_crtc.c b/drivers/gpu/drm/kmb/kmb_crtc.c
index 44327bc629ca..4f240466cf63 100644
--- a/drivers/gpu/drm/kmb/kmb_crtc.c
+++ b/drivers/gpu/drm/kmb/kmb_crtc.c
@@ -66,7 +66,8 @@ static const struct drm_crtc_funcs kmb_crtc_funcs = {
 	.disable_vblank = kmb_crtc_disable_vblank,
 };
 
-static void kmb_crtc_set_mode(struct drm_crtc *crtc)
+static void kmb_crtc_set_mode(struct drm_crtc *crtc,
+			      struct drm_atomic_state *old_state)
 {
 	struct drm_device *dev = crtc->dev;
 	struct drm_display_mode *m = &crtc->state->adjusted_mode;
@@ -75,7 +76,7 @@ static void kmb_crtc_set_mode(struct drm_crtc *crtc)
 	unsigned int val = 0;
 
 	/* Initialize mipi */
-	kmb_dsi_mode_set(kmb->kmb_dsi, m, kmb->sys_clk_mhz);
+	kmb_dsi_mode_set(kmb->kmb_dsi, m, kmb->sys_clk_mhz, old_state);
 	drm_info(dev,
 		 "vfp= %d vbp= %d vsync_len=%d hfp=%d hbp=%d hsync_len=%d\n",
 		 m->crtc_vsync_start - m->crtc_vdisplay,
@@ -138,7 +139,7 @@ static void kmb_crtc_atomic_enable(struct drm_crtc *crtc,
 	struct kmb_drm_private *kmb = crtc_to_kmb_priv(crtc);
 
 	clk_prepare_enable(kmb->kmb_clk.clk_lcd);
-	kmb_crtc_set_mode(crtc);
+	kmb_crtc_set_mode(crtc, state);
 	drm_crtc_vblank_on(crtc);
 }
 
diff --git a/drivers/gpu/drm/kmb/kmb_dsi.c b/drivers/gpu/drm/kmb/kmb_dsi.c
index 1793cd31b117..e4cc61fa5219 100644
--- a/drivers/gpu/drm/kmb/kmb_dsi.c
+++ b/drivers/gpu/drm/kmb/kmb_dsi.c
@@ -1322,7 +1322,8 @@ static u32 mipi_tx_init_dphy(struct kmb_dsi *kmb_dsi,
 	return 0;
 }
 
-static void connect_lcd_to_mipi(struct kmb_dsi *kmb_dsi)
+static void connect_lcd_to_mipi(struct kmb_dsi *kmb_dsi,
+				struct drm_atomic_state *old_state)
 {
 	struct regmap *msscam;
 
@@ -1331,7 +1332,7 @@ static void connect_lcd_to_mipi(struct kmb_dsi *kmb_dsi)
 		dev_dbg(kmb_dsi->dev, "failed to get msscam syscon");
 		return;
 	}
-
+	drm_atomic_bridge_chain_enable(adv_bridge, old_state);
 	/* DISABLE MIPI->CIF CONNECTION */
 	regmap_write(msscam, MSS_MIPI_CIF_CFG, 0);
 
@@ -1342,7 +1343,7 @@ static void connect_lcd_to_mipi(struct kmb_dsi *kmb_dsi)
 }
 
 int kmb_dsi_mode_set(struct kmb_dsi *kmb_dsi, struct drm_display_mode *mode,
-		     int sys_clk_mhz)
+		     int sys_clk_mhz, struct drm_atomic_state *old_state)
 {
 	u64 data_rate;
 
@@ -1395,7 +1396,7 @@ int kmb_dsi_mode_set(struct kmb_dsi *kmb_dsi, struct drm_display_mode *mode,
 	/* Dphy initialization */
 	mipi_tx_init_dphy(kmb_dsi, &mipi_tx_init_cfg);
 
-	connect_lcd_to_mipi(kmb_dsi);
+	connect_lcd_to_mipi(kmb_dsi, old_state);
 	dev_info(kmb_dsi->dev, "mipi hw initialized");
 
 	return 0;
diff --git a/drivers/gpu/drm/kmb/kmb_dsi.h b/drivers/gpu/drm/kmb/kmb_dsi.h
index 66b7c500d9bc..09dc88743d77 100644
--- a/drivers/gpu/drm/kmb/kmb_dsi.h
+++ b/drivers/gpu/drm/kmb/kmb_dsi.h
@@ -380,7 +380,7 @@ int kmb_dsi_host_bridge_init(struct device *dev);
 struct kmb_dsi *kmb_dsi_init(struct platform_device *pdev);
 void kmb_dsi_host_unregister(struct kmb_dsi *kmb_dsi);
 int kmb_dsi_mode_set(struct kmb_dsi *kmb_dsi, struct drm_display_mode *mode,
-		     int sys_clk_mhz);
+		     int sys_clk_mhz, struct drm_atomic_state *old_state);
 int kmb_dsi_map_mmio(struct kmb_dsi *kmb_dsi);
 int kmb_dsi_clk_init(struct kmb_dsi *kmb_dsi);
 int kmb_dsi_encoder_init(struct drm_device *dev, struct kmb_dsi *kmb_dsi);
-- 
2.25.1

