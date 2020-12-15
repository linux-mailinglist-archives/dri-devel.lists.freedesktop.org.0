Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F472DAB36
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 11:48:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4119A6E215;
	Tue, 15 Dec 2020 10:48:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E71A6E20A
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 10:47:55 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BFAlsZh124180
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 04:47:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1608029274;
 bh=ekHmIUwDHfYHi3MzLMhu76pw/ZIhHoDg8i5bOMDCc6s=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=yMRWmRyE8uMm5m7bZRtKILQLgU5RjRziuHFZcKognuHA92Vt2w4FlRBjZne3ejDay
 8oI8INYgWgsWaTIZwz491+RPqaXH1C1jqks+FHbOf178xNeoCzUoVEcmQPj/RNHwNk
 RfXEofDcThv8AKlyBRqSD4WY3UrzN6pfRfGqwDjs=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BFAls4A023539
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 04:47:54 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 15
 Dec 2020 04:47:54 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 15 Dec 2020 04:47:54 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BFAkwad046467;
 Tue, 15 Dec 2020 04:47:53 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v6 53/84] drm/omap: remove dispc_ops
Date: Tue, 15 Dec 2020 12:46:26 +0200
Message-ID: <20201215104657.802264-54-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201215104657.802264-1-tomi.valkeinen@ti.com>
References: <20201215104657.802264-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: tomi.valkeinen@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dispc_ops was created to help with the multi-module architecture and
giving us the possibility of multiple dispc implementations. Neither of
these is valid anymore, and we can remove dispc_ops and use direct
calls to dispc.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/omapdrm/dss/base.c    |   5 --
 drivers/gpu/drm/omapdrm/dss/dispc.c   | 101 +++++++-------------------
 drivers/gpu/drm/omapdrm/dss/dss.h     |  71 +++++++++++++++++-
 drivers/gpu/drm/omapdrm/dss/omapdss.h |  71 ------------------
 drivers/gpu/drm/omapdrm/omap_crtc.c   |  30 ++++----
 drivers/gpu/drm/omapdrm/omap_drv.c    |  15 ++--
 drivers/gpu/drm/omapdrm/omap_drv.h    |   2 +-
 drivers/gpu/drm/omapdrm/omap_irq.c    |  34 ++++-----
 drivers/gpu/drm/omapdrm/omap_plane.c  |  12 +--
 9 files changed, 143 insertions(+), 198 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/base.c b/drivers/gpu/drm/omapdrm/dss/base.c
index 028c0cd73934..050ca7eafac5 100644
--- a/drivers/gpu/drm/omapdrm/dss/base.c
+++ b/drivers/gpu/drm/omapdrm/dss/base.c
@@ -21,11 +21,6 @@ struct dispc_device *dispc_get_dispc(struct dss_device *dss)
 	return dss->dispc;
 }
 
-const struct dispc_ops *dispc_get_ops(struct dss_device *dss)
-{
-	return dss->dispc_ops;
-}
-
 /* -----------------------------------------------------------------------------
  * OMAP DSS Devices Handling
  */
diff --git a/drivers/gpu/drm/omapdrm/dss/dispc.c b/drivers/gpu/drm/omapdrm/dss/dispc.c
index 599183879caf..319f90f3b099 100644
--- a/drivers/gpu/drm/omapdrm/dss/dispc.c
+++ b/drivers/gpu/drm/omapdrm/dss/dispc.c
@@ -351,8 +351,6 @@ static unsigned long dispc_plane_pclk_rate(struct dispc_device *dispc,
 static unsigned long dispc_plane_lclk_rate(struct dispc_device *dispc,
 					   enum omap_plane_id plane);
 
-static void dispc_clear_irqstatus(struct dispc_device *dispc, u32 mask);
-
 static inline void dispc_write_reg(struct dispc_device *dispc, u16 idx, u32 val)
 {
 	__raw_writel(val, dispc->base + idx);
@@ -379,12 +377,12 @@ static void mgr_fld_write(struct dispc_device *dispc, enum omap_channel channel,
 	REG_FLD_MOD(dispc, rfld->reg, val, rfld->high, rfld->low);
 }
 
-static int dispc_get_num_ovls(struct dispc_device *dispc)
+int dispc_get_num_ovls(struct dispc_device *dispc)
 {
 	return dispc->feat->num_ovls;
 }
 
-static int dispc_get_num_mgrs(struct dispc_device *dispc)
+int dispc_get_num_mgrs(struct dispc_device *dispc)
 {
 	return dispc->feat->num_mgrs;
 }
@@ -670,13 +668,13 @@ void dispc_runtime_put(struct dispc_device *dispc)
 	WARN_ON(r < 0 && r != -ENOSYS);
 }
 
-static u32 dispc_mgr_get_vsync_irq(struct dispc_device *dispc,
+u32 dispc_mgr_get_vsync_irq(struct dispc_device *dispc,
 				   enum omap_channel channel)
 {
 	return mgr_desc[channel].vsync_irq;
 }
 
-static u32 dispc_mgr_get_framedone_irq(struct dispc_device *dispc,
+u32 dispc_mgr_get_framedone_irq(struct dispc_device *dispc,
 				       enum omap_channel channel)
 {
 	if (channel == OMAP_DSS_CHANNEL_DIGIT && dispc->feat->no_framedone_tv)
@@ -685,18 +683,18 @@ static u32 dispc_mgr_get_framedone_irq(struct dispc_device *dispc,
 	return mgr_desc[channel].framedone_irq;
 }
 
-static u32 dispc_mgr_get_sync_lost_irq(struct dispc_device *dispc,
+u32 dispc_mgr_get_sync_lost_irq(struct dispc_device *dispc,
 				       enum omap_channel channel)
 {
 	return mgr_desc[channel].sync_lost_irq;
 }
 
-static u32 dispc_wb_get_framedone_irq(struct dispc_device *dispc)
+u32 dispc_wb_get_framedone_irq(struct dispc_device *dispc)
 {
 	return DISPC_IRQ_FRAMEDONEWB;
 }
 
-static void dispc_mgr_enable(struct dispc_device *dispc,
+void dispc_mgr_enable(struct dispc_device *dispc,
 			     enum omap_channel channel, bool enable)
 {
 	mgr_fld_write(dispc, channel, DISPC_MGR_FLD_ENABLE, enable);
@@ -710,13 +708,13 @@ static bool dispc_mgr_is_enabled(struct dispc_device *dispc,
 	return !!mgr_fld_read(dispc, channel, DISPC_MGR_FLD_ENABLE);
 }
 
-static bool dispc_mgr_go_busy(struct dispc_device *dispc,
+bool dispc_mgr_go_busy(struct dispc_device *dispc,
 			      enum omap_channel channel)
 {
 	return mgr_fld_read(dispc, channel, DISPC_MGR_FLD_GO) == 1;
 }
 
-static void dispc_mgr_go(struct dispc_device *dispc, enum omap_channel channel)
+void dispc_mgr_go(struct dispc_device *dispc, enum omap_channel channel)
 {
 	WARN_ON(!dispc_mgr_is_enabled(dispc, channel));
 	WARN_ON(dispc_mgr_go_busy(dispc, channel));
@@ -726,12 +724,12 @@ static void dispc_mgr_go(struct dispc_device *dispc, enum omap_channel channel)
 	mgr_fld_write(dispc, channel, DISPC_MGR_FLD_GO, 1);
 }
 
-static bool dispc_wb_go_busy(struct dispc_device *dispc)
+bool dispc_wb_go_busy(struct dispc_device *dispc)
 {
 	return REG_GET(dispc, DISPC_CONTROL2, 6, 6) == 1;
 }
 
-static void dispc_wb_go(struct dispc_device *dispc)
+void dispc_wb_go(struct dispc_device *dispc)
 {
 	enum omap_plane_id plane = OMAP_DSS_WB;
 	bool enable, go;
@@ -1285,7 +1283,7 @@ static bool dispc_ovl_color_mode_supported(struct dispc_device *dispc,
 	return false;
 }
 
-static const u32 *dispc_ovl_get_color_modes(struct dispc_device *dispc,
+const u32 *dispc_ovl_get_color_modes(struct dispc_device *dispc,
 					    enum omap_plane_id plane)
 {
 	return dispc->feat->supported_color_modes[plane];
@@ -2764,7 +2762,7 @@ static int dispc_ovl_setup_common(struct dispc_device *dispc,
 	return 0;
 }
 
-static int dispc_ovl_setup(struct dispc_device *dispc,
+int dispc_ovl_setup(struct dispc_device *dispc,
 			   enum omap_plane_id plane,
 			   const struct omap_overlay_info *oi,
 			   const struct videomode *vm, bool mem_to_mem,
@@ -2791,7 +2789,7 @@ static int dispc_ovl_setup(struct dispc_device *dispc,
 	return r;
 }
 
-static int dispc_wb_setup(struct dispc_device *dispc,
+int dispc_wb_setup(struct dispc_device *dispc,
 		   const struct omap_dss_writeback_info *wi,
 		   bool mem_to_mem, const struct videomode *vm,
 		   enum dss_writeback_channel channel_in)
@@ -2874,12 +2872,12 @@ static int dispc_wb_setup(struct dispc_device *dispc,
 	return 0;
 }
 
-static bool dispc_has_writeback(struct dispc_device *dispc)
+bool dispc_has_writeback(struct dispc_device *dispc)
 {
 	return dispc->feat->has_writeback;
 }
 
-static int dispc_ovl_enable(struct dispc_device *dispc,
+int dispc_ovl_enable(struct dispc_device *dispc,
 			    enum omap_plane_id plane, bool enable)
 {
 	DSSDBG("dispc_enable_plane %d, %d\n", plane, enable);
@@ -2970,7 +2968,7 @@ static void dispc_mgr_enable_alpha_fixed_zorder(struct dispc_device *dispc,
 		REG_FLD_MOD(dispc, DISPC_CONFIG, enable, 19, 19);
 }
 
-static void dispc_mgr_setup(struct dispc_device *dispc,
+void dispc_mgr_setup(struct dispc_device *dispc,
 			    enum omap_channel channel,
 			    const struct omap_overlay_manager_info *info)
 {
@@ -3049,7 +3047,7 @@ static void dispc_mgr_enable_stallmode(struct dispc_device *dispc,
 	mgr_fld_write(dispc, channel, DISPC_MGR_FLD_STALLMODE, enable);
 }
 
-static void dispc_mgr_set_lcd_config(struct dispc_device *dispc,
+void dispc_mgr_set_lcd_config(struct dispc_device *dispc,
 				     enum omap_channel channel,
 				     const struct dss_lcd_mgr_config *config)
 {
@@ -3098,7 +3096,7 @@ static bool _dispc_mgr_pclk_ok(struct dispc_device *dispc,
 		return pclk <= dispc->feat->max_tv_pclk;
 }
 
-static int dispc_mgr_check_timings(struct dispc_device *dispc,
+int dispc_mgr_check_timings(struct dispc_device *dispc,
 				   enum omap_channel channel,
 				   const struct videomode *vm)
 {
@@ -3191,7 +3189,7 @@ static int vm_flag_to_int(enum display_flags flags, enum display_flags high,
 }
 
 /* change name to mode? */
-static void dispc_mgr_set_timings(struct dispc_device *dispc,
+void dispc_mgr_set_timings(struct dispc_device *dispc,
 				  enum omap_channel channel,
 				  const struct videomode *vm)
 {
@@ -3735,17 +3733,17 @@ int dispc_mgr_get_clock_div(struct dispc_device *dispc,
 	return 0;
 }
 
-static u32 dispc_read_irqstatus(struct dispc_device *dispc)
+u32 dispc_read_irqstatus(struct dispc_device *dispc)
 {
 	return dispc_read_reg(dispc, DISPC_IRQSTATUS);
 }
 
-static void dispc_clear_irqstatus(struct dispc_device *dispc, u32 mask)
+void dispc_clear_irqstatus(struct dispc_device *dispc, u32 mask)
 {
 	dispc_write_reg(dispc, DISPC_IRQSTATUS, mask);
 }
 
-static void dispc_write_irqenable(struct dispc_device *dispc, u32 mask)
+void dispc_write_irqenable(struct dispc_device *dispc, u32 mask)
 {
 	u32 old_mask = dispc_read_reg(dispc, DISPC_IRQENABLE);
 
@@ -3769,7 +3767,7 @@ void dispc_disable_sidle(struct dispc_device *dispc)
 	REG_FLD_MOD(dispc, DISPC_SYSCONFIG, 1, 4, 3);	/* SIDLEMODE: no idle */
 }
 
-static u32 dispc_mgr_gamma_size(struct dispc_device *dispc,
+u32 dispc_mgr_gamma_size(struct dispc_device *dispc,
 				enum omap_channel channel)
 {
 	const struct dispc_gamma_desc *gdesc = &mgr_desc[channel].gamma;
@@ -3824,7 +3822,7 @@ static const struct drm_color_lut dispc_mgr_gamma_default_lut[] = {
 	{ .red = U16_MAX, .green = U16_MAX, .blue = U16_MAX, },
 };
 
-static void dispc_mgr_set_gamma(struct dispc_device *dispc,
+void dispc_mgr_set_gamma(struct dispc_device *dispc,
 				enum omap_channel channel,
 				const struct drm_color_lut *lut,
 				unsigned int length)
@@ -4482,7 +4480,7 @@ static irqreturn_t dispc_irq_handler(int irq, void *arg)
 	return dispc->user_handler(irq, dispc->user_data);
 }
 
-static int dispc_request_irq(struct dispc_device *dispc, irq_handler_t handler,
+int dispc_request_irq(struct dispc_device *dispc, irq_handler_t handler,
 			     void *dev_id)
 {
 	int r;
@@ -4506,7 +4504,7 @@ static int dispc_request_irq(struct dispc_device *dispc, irq_handler_t handler,
 	return r;
 }
 
-static void dispc_free_irq(struct dispc_device *dispc, void *dev_id)
+void dispc_free_irq(struct dispc_device *dispc, void *dev_id)
 {
 	devm_free_irq(&dispc->pdev->dev, dispc->irq, dispc);
 
@@ -4514,7 +4512,7 @@ static void dispc_free_irq(struct dispc_device *dispc, void *dev_id)
 	dispc->user_data = NULL;
 }
 
-static u32 dispc_get_memory_bandwidth_limit(struct dispc_device *dispc)
+u32 dispc_get_memory_bandwidth_limit(struct dispc_device *dispc)
 {
 	u32 limit = 0;
 
@@ -4684,47 +4682,6 @@ static void dispc_errata_i734_wa(struct dispc_device *dispc)
 	REG_FLD_MOD(dispc, DISPC_CONFIG, gatestate, 8, 4);
 }
 
-static const struct dispc_ops dispc_ops = {
-	.read_irqstatus = dispc_read_irqstatus,
-	.clear_irqstatus = dispc_clear_irqstatus,
-	.write_irqenable = dispc_write_irqenable,
-
-	.request_irq = dispc_request_irq,
-	.free_irq = dispc_free_irq,
-
-	.runtime_get = dispc_runtime_get,
-	.runtime_put = dispc_runtime_put,
-
-	.get_num_ovls = dispc_get_num_ovls,
-	.get_num_mgrs = dispc_get_num_mgrs,
-
-	.get_memory_bandwidth_limit = dispc_get_memory_bandwidth_limit,
-
-	.mgr_enable = dispc_mgr_enable,
-	.mgr_is_enabled = dispc_mgr_is_enabled,
-	.mgr_get_vsync_irq = dispc_mgr_get_vsync_irq,
-	.mgr_get_framedone_irq = dispc_mgr_get_framedone_irq,
-	.mgr_get_sync_lost_irq = dispc_mgr_get_sync_lost_irq,
-	.mgr_go_busy = dispc_mgr_go_busy,
-	.mgr_go = dispc_mgr_go,
-	.mgr_set_lcd_config = dispc_mgr_set_lcd_config,
-	.mgr_check_timings = dispc_mgr_check_timings,
-	.mgr_set_timings = dispc_mgr_set_timings,
-	.mgr_setup = dispc_mgr_setup,
-	.mgr_gamma_size = dispc_mgr_gamma_size,
-	.mgr_set_gamma = dispc_mgr_set_gamma,
-
-	.ovl_enable = dispc_ovl_enable,
-	.ovl_setup = dispc_ovl_setup,
-	.ovl_get_color_modes = dispc_ovl_get_color_modes,
-
-	.wb_get_framedone_irq = dispc_wb_get_framedone_irq,
-	.wb_setup = dispc_wb_setup,
-	.has_writeback = dispc_has_writeback,
-	.wb_go_busy = dispc_wb_go_busy,
-	.wb_go = dispc_wb_go,
-};
-
 /* DISPC HW IP initialisation */
 static const struct of_device_id dispc_of_match[] = {
 	{ .compatible = "ti,omap2-dispc", .data = &omap24xx_dispc_feats },
@@ -4826,7 +4783,6 @@ static int dispc_bind(struct device *dev, struct device *master, void *data)
 	dispc_runtime_put(dispc);
 
 	dss->dispc = dispc;
-	dss->dispc_ops = &dispc_ops;
 
 	dispc->debugfs = dss_debugfs_create_file(dss, "dispc", dispc_dump_regs,
 						 dispc);
@@ -4848,7 +4804,6 @@ static void dispc_unbind(struct device *dev, struct device *master, void *data)
 	dss_debugfs_remove_file(dispc->debugfs);
 
 	dss->dispc = NULL;
-	dss->dispc_ops = NULL;
 
 	pm_runtime_disable(dev);
 
diff --git a/drivers/gpu/drm/omapdrm/dss/dss.h b/drivers/gpu/drm/omapdrm/dss/dss.h
index 2b404bcb41dd..96f702314c8c 100644
--- a/drivers/gpu/drm/omapdrm/dss/dss.h
+++ b/drivers/gpu/drm/omapdrm/dss/dss.h
@@ -257,7 +257,6 @@ struct dss_device {
 	struct dss_pll	*video2_pll;
 
 	struct dispc_device *dispc;
-	const struct dispc_ops *dispc_ops;
 	const struct dss_mgr_ops *mgr_ops;
 	struct omap_drm_private *mgr_ops_priv;
 };
@@ -393,6 +392,76 @@ void dispc_dump_clocks(struct dispc_device *dispc, struct seq_file *s);
 int dispc_runtime_get(struct dispc_device *dispc);
 void dispc_runtime_put(struct dispc_device *dispc);
 
+int dispc_get_num_ovls(struct dispc_device *dispc);
+int dispc_get_num_mgrs(struct dispc_device *dispc);
+
+const u32 *dispc_ovl_get_color_modes(struct dispc_device *dispc,
+					    enum omap_plane_id plane);
+
+u32 dispc_read_irqstatus(struct dispc_device *dispc);
+void dispc_clear_irqstatus(struct dispc_device *dispc, u32 mask);
+void dispc_write_irqenable(struct dispc_device *dispc, u32 mask);
+
+int dispc_request_irq(struct dispc_device *dispc, irq_handler_t handler,
+			     void *dev_id);
+void dispc_free_irq(struct dispc_device *dispc, void *dev_id);
+
+u32 dispc_mgr_get_vsync_irq(struct dispc_device *dispc,
+				   enum omap_channel channel);
+u32 dispc_mgr_get_framedone_irq(struct dispc_device *dispc,
+				       enum omap_channel channel);
+u32 dispc_mgr_get_sync_lost_irq(struct dispc_device *dispc,
+				       enum omap_channel channel);
+u32 dispc_wb_get_framedone_irq(struct dispc_device *dispc);
+
+u32 dispc_get_memory_bandwidth_limit(struct dispc_device *dispc);
+
+void dispc_mgr_enable(struct dispc_device *dispc,
+			     enum omap_channel channel, bool enable);
+
+bool dispc_mgr_go_busy(struct dispc_device *dispc,
+			      enum omap_channel channel);
+
+void dispc_mgr_go(struct dispc_device *dispc, enum omap_channel channel);
+
+void dispc_mgr_set_lcd_config(struct dispc_device *dispc,
+				     enum omap_channel channel,
+				     const struct dss_lcd_mgr_config *config);
+void dispc_mgr_set_timings(struct dispc_device *dispc,
+				  enum omap_channel channel,
+				  const struct videomode *vm);
+void dispc_mgr_setup(struct dispc_device *dispc,
+			    enum omap_channel channel,
+			    const struct omap_overlay_manager_info *info);
+
+int dispc_mgr_check_timings(struct dispc_device *dispc,
+				   enum omap_channel channel,
+				   const struct videomode *vm);
+
+u32 dispc_mgr_gamma_size(struct dispc_device *dispc,
+				enum omap_channel channel);
+void dispc_mgr_set_gamma(struct dispc_device *dispc,
+				enum omap_channel channel,
+				const struct drm_color_lut *lut,
+				unsigned int length);
+
+int dispc_ovl_setup(struct dispc_device *dispc,
+			   enum omap_plane_id plane,
+			   const struct omap_overlay_info *oi,
+			   const struct videomode *vm, bool mem_to_mem,
+			   enum omap_channel channel);
+
+int dispc_ovl_enable(struct dispc_device *dispc,
+			    enum omap_plane_id plane, bool enable);
+
+bool dispc_has_writeback(struct dispc_device *dispc);
+int dispc_wb_setup(struct dispc_device *dispc,
+		   const struct omap_dss_writeback_info *wi,
+		   bool mem_to_mem, const struct videomode *vm,
+		   enum dss_writeback_channel channel_in);
+bool dispc_wb_go_busy(struct dispc_device *dispc);
+void dispc_wb_go(struct dispc_device *dispc);
+
 void dispc_enable_sidle(struct dispc_device *dispc);
 void dispc_disable_sidle(struct dispc_device *dispc);
 
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index 17345cc5c638..fee6e1dd474c 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -376,78 +376,7 @@ int dss_mgr_register_framedone_handler(struct omap_dss_device *dssdev,
 void dss_mgr_unregister_framedone_handler(struct omap_dss_device *dssdev,
 		void (*handler)(void *), void *data);
 
-/* dispc ops */
-
-struct dispc_ops {
-	u32 (*read_irqstatus)(struct dispc_device *dispc);
-	void (*clear_irqstatus)(struct dispc_device *dispc, u32 mask);
-	void (*write_irqenable)(struct dispc_device *dispc, u32 mask);
-
-	int (*request_irq)(struct dispc_device *dispc, irq_handler_t handler,
-			   void *dev_id);
-	void (*free_irq)(struct dispc_device *dispc, void *dev_id);
-
-	int (*runtime_get)(struct dispc_device *dispc);
-	void (*runtime_put)(struct dispc_device *dispc);
-
-	int (*get_num_ovls)(struct dispc_device *dispc);
-	int (*get_num_mgrs)(struct dispc_device *dispc);
-
-	u32 (*get_memory_bandwidth_limit)(struct dispc_device *dispc);
-
-	void (*mgr_enable)(struct dispc_device *dispc,
-			   enum omap_channel channel, bool enable);
-	bool (*mgr_is_enabled)(struct dispc_device *dispc,
-			       enum omap_channel channel);
-	u32 (*mgr_get_vsync_irq)(struct dispc_device *dispc,
-				 enum omap_channel channel);
-	u32 (*mgr_get_framedone_irq)(struct dispc_device *dispc,
-				     enum omap_channel channel);
-	u32 (*mgr_get_sync_lost_irq)(struct dispc_device *dispc,
-				     enum omap_channel channel);
-	bool (*mgr_go_busy)(struct dispc_device *dispc,
-			    enum omap_channel channel);
-	void (*mgr_go)(struct dispc_device *dispc, enum omap_channel channel);
-	void (*mgr_set_lcd_config)(struct dispc_device *dispc,
-				   enum omap_channel channel,
-				   const struct dss_lcd_mgr_config *config);
-	int (*mgr_check_timings)(struct dispc_device *dispc,
-				 enum omap_channel channel,
-				 const struct videomode *vm);
-	void (*mgr_set_timings)(struct dispc_device *dispc,
-				enum omap_channel channel,
-				const struct videomode *vm);
-	void (*mgr_setup)(struct dispc_device *dispc, enum omap_channel channel,
-			  const struct omap_overlay_manager_info *info);
-	u32 (*mgr_gamma_size)(struct dispc_device *dispc,
-			      enum omap_channel channel);
-	void (*mgr_set_gamma)(struct dispc_device *dispc,
-			      enum omap_channel channel,
-			      const struct drm_color_lut *lut,
-			      unsigned int length);
-
-	int (*ovl_enable)(struct dispc_device *dispc, enum omap_plane_id plane,
-			  bool enable);
-	int (*ovl_setup)(struct dispc_device *dispc, enum omap_plane_id plane,
-			 const struct omap_overlay_info *oi,
-			 const struct videomode *vm, bool mem_to_mem,
-			 enum omap_channel channel);
-
-	const u32 *(*ovl_get_color_modes)(struct dispc_device *dispc,
-					  enum omap_plane_id plane);
-
-	u32 (*wb_get_framedone_irq)(struct dispc_device *dispc);
-	int (*wb_setup)(struct dispc_device *dispc,
-		const struct omap_dss_writeback_info *wi,
-		bool mem_to_mem, const struct videomode *vm,
-		enum dss_writeback_channel channel_in);
-	bool (*has_writeback)(struct dispc_device *dispc);
-	bool (*wb_go_busy)(struct dispc_device *dispc);
-	void (*wb_go)(struct dispc_device *dispc);
-};
-
 struct dispc_device *dispc_get_dispc(struct dss_device *dss);
-const struct dispc_ops *dispc_get_ops(struct dss_device *dss);
 
 bool omapdss_stack_is_ready(void);
 void omapdss_gather_components(struct device *dev);
diff --git a/drivers/gpu/drm/omapdrm/omap_crtc.c b/drivers/gpu/drm/omapdrm/omap_crtc.c
index 09a255c942c1..053450a10ece 100644
--- a/drivers/gpu/drm/omapdrm/omap_crtc.c
+++ b/drivers/gpu/drm/omapdrm/omap_crtc.c
@@ -103,7 +103,7 @@ int omap_crtc_wait_pending(struct drm_crtc *crtc)
 static void omap_crtc_dss_start_update(struct omap_drm_private *priv,
 				       enum omap_channel channel)
 {
-	priv->dispc_ops->mgr_enable(priv->dispc, channel, true);
+	dispc_mgr_enable(priv->dispc, channel, true);
 }
 
 /* Called only from the encoder enable/disable and suspend/resume handlers. */
@@ -128,7 +128,7 @@ static void omap_crtc_set_enabled(struct drm_crtc *crtc, bool enable)
 	}
 
 	if (omap_crtc->pipe->output->type == OMAP_DISPLAY_TYPE_HDMI) {
-		priv->dispc_ops->mgr_enable(priv->dispc, channel, enable);
+		dispc_mgr_enable(priv->dispc, channel, enable);
 		omap_crtc->enabled = enable;
 		return;
 	}
@@ -141,9 +141,9 @@ static void omap_crtc_set_enabled(struct drm_crtc *crtc, bool enable)
 		omap_crtc->ignore_digit_sync_lost = true;
 	}
 
-	framedone_irq = priv->dispc_ops->mgr_get_framedone_irq(priv->dispc,
+	framedone_irq = dispc_mgr_get_framedone_irq(priv->dispc,
 							       channel);
-	vsync_irq = priv->dispc_ops->mgr_get_vsync_irq(priv->dispc, channel);
+	vsync_irq = dispc_mgr_get_vsync_irq(priv->dispc, channel);
 
 	if (enable) {
 		wait = omap_irq_wait_init(dev, vsync_irq, 1);
@@ -163,7 +163,7 @@ static void omap_crtc_set_enabled(struct drm_crtc *crtc, bool enable)
 			wait = omap_irq_wait_init(dev, vsync_irq, 2);
 	}
 
-	priv->dispc_ops->mgr_enable(priv->dispc, channel, enable);
+	dispc_mgr_enable(priv->dispc, channel, enable);
 	omap_crtc->enabled = enable;
 
 	ret = omap_irq_wait(dev, wait, msecs_to_jiffies(100));
@@ -186,7 +186,7 @@ static int omap_crtc_dss_enable(struct omap_drm_private *priv,
 	struct drm_crtc *crtc = priv->channels[channel]->crtc;
 	struct omap_crtc *omap_crtc = to_omap_crtc(crtc);
 
-	priv->dispc_ops->mgr_set_timings(priv->dispc, omap_crtc->channel,
+	dispc_mgr_set_timings(priv->dispc, omap_crtc->channel,
 					 &omap_crtc->vm);
 	omap_crtc_set_enabled(&omap_crtc->base, true);
 
@@ -221,7 +221,7 @@ static void omap_crtc_dss_set_lcd_config(struct omap_drm_private *priv,
 	struct omap_crtc *omap_crtc = to_omap_crtc(crtc);
 
 	DBG("%s", omap_crtc->name);
-	priv->dispc_ops->mgr_set_lcd_config(priv->dispc, omap_crtc->channel,
+	dispc_mgr_set_lcd_config(priv->dispc, omap_crtc->channel,
 					    config);
 }
 
@@ -300,7 +300,7 @@ void omap_crtc_vblank_irq(struct drm_crtc *crtc)
 	 * If the dispc is busy we're racing the flush operation. Try again on
 	 * the next vblank interrupt.
 	 */
-	if (priv->dispc_ops->mgr_go_busy(priv->dispc, omap_crtc->channel)) {
+	if (dispc_mgr_go_busy(priv->dispc, omap_crtc->channel)) {
 		spin_unlock(&crtc->dev->event_lock);
 		return;
 	}
@@ -391,7 +391,7 @@ static void omap_crtc_write_crtc_properties(struct drm_crtc *crtc)
 	info.partial_alpha_enabled = false;
 	info.cpr_enable = false;
 
-	priv->dispc_ops->mgr_setup(priv->dispc, omap_crtc->channel, &info);
+	dispc_mgr_setup(priv->dispc, omap_crtc->channel, &info);
 }
 
 /* -----------------------------------------------------------------------------
@@ -432,7 +432,7 @@ static void omap_crtc_atomic_enable(struct drm_crtc *crtc,
 
 	DBG("%s", omap_crtc->name);
 
-	priv->dispc_ops->runtime_get(priv->dispc);
+	dispc_runtime_get(priv->dispc);
 
 	/* manual updated display will not trigger vsync irq */
 	if (omap_state->manually_updated)
@@ -471,7 +471,7 @@ static void omap_crtc_atomic_disable(struct drm_crtc *crtc,
 
 	drm_crtc_vblank_off(crtc);
 
-	priv->dispc_ops->runtime_put(priv->dispc);
+	dispc_runtime_put(priv->dispc);
 }
 
 static enum drm_mode_status omap_crtc_mode_valid(struct drm_crtc *crtc,
@@ -490,7 +490,7 @@ static enum drm_mode_status omap_crtc_mode_valid(struct drm_crtc *crtc,
 	 * proper DISPC mode later.
 	 */
 	if (omap_crtc->pipe->output->type != OMAP_DISPLAY_TYPE_DSI) {
-		r = priv->dispc_ops->mgr_check_timings(priv->dispc,
+		r = dispc_mgr_check_timings(priv->dispc,
 						       omap_crtc->channel,
 						       &vm);
 		if (r)
@@ -608,7 +608,7 @@ static void omap_crtc_atomic_flush(struct drm_crtc *crtc,
 			length = crtc->state->gamma_lut->length /
 				sizeof(*lut);
 		}
-		priv->dispc_ops->mgr_set_gamma(priv->dispc, omap_crtc->channel,
+		dispc_mgr_set_gamma(priv->dispc, omap_crtc->channel,
 					       lut, length);
 	}
 
@@ -633,7 +633,7 @@ static void omap_crtc_atomic_flush(struct drm_crtc *crtc,
 	WARN_ON(ret != 0);
 
 	spin_lock_irq(&crtc->dev->event_lock);
-	priv->dispc_ops->mgr_go(priv->dispc, omap_crtc->channel);
+	dispc_mgr_go(priv->dispc, omap_crtc->channel);
 	omap_crtc_arm_event(crtc);
 	spin_unlock_irq(&crtc->dev->event_lock);
 }
@@ -824,7 +824,7 @@ struct drm_crtc *omap_crtc_init(struct drm_device *dev,
 	 * extracted with dispc_mgr_gamma_size(). If it returns 0
 	 * gamma table is not supported.
 	 */
-	if (priv->dispc_ops->mgr_gamma_size(priv->dispc, channel)) {
+	if (dispc_mgr_gamma_size(priv->dispc, channel)) {
 		unsigned int gamma_lut_size = 256;
 
 		drm_crtc_enable_color_mgmt(crtc, 0, false, gamma_lut_size);
diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
index fea85cd973bf..2f2ead897427 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.c
+++ b/drivers/gpu/drm/omapdrm/omap_drv.c
@@ -69,7 +69,7 @@ static void omap_atomic_commit_tail(struct drm_atomic_state *old_state)
 	struct drm_device *dev = old_state->dev;
 	struct omap_drm_private *priv = dev->dev_private;
 
-	priv->dispc_ops->runtime_get(priv->dispc);
+	dispc_runtime_get(priv->dispc);
 
 	/* Apply the atomic update. */
 	drm_atomic_helper_commit_modeset_disables(dev, old_state);
@@ -113,7 +113,7 @@ static void omap_atomic_commit_tail(struct drm_atomic_state *old_state)
 
 	drm_atomic_helper_cleanup_planes(dev, old_state);
 
-	priv->dispc_ops->runtime_put(priv->dispc);
+	dispc_runtime_put(priv->dispc);
 }
 
 static const struct drm_mode_config_helper_funcs omap_mode_config_helper_funcs = {
@@ -192,7 +192,7 @@ static int omap_compare_pipelines(const void *a, const void *b)
 static int omap_modeset_init_properties(struct drm_device *dev)
 {
 	struct omap_drm_private *priv = dev->dev_private;
-	unsigned int num_planes = priv->dispc_ops->get_num_ovls(priv->dispc);
+	unsigned int num_planes = dispc_get_num_ovls(priv->dispc);
 
 	priv->zorder_prop = drm_property_create_range(dev, 0, "zorder", 0,
 						      num_planes - 1);
@@ -221,8 +221,8 @@ static int omap_display_id(struct omap_dss_device *output)
 static int omap_modeset_init(struct drm_device *dev)
 {
 	struct omap_drm_private *priv = dev->dev_private;
-	int num_ovls = priv->dispc_ops->get_num_ovls(priv->dispc);
-	int num_mgrs = priv->dispc_ops->get_num_mgrs(priv->dispc);
+	int num_ovls = dispc_get_num_ovls(priv->dispc);
+	int num_mgrs = dispc_get_num_mgrs(priv->dispc);
 	unsigned int i;
 	int ret;
 	u32 plane_crtc_mask;
@@ -571,7 +571,6 @@ static int omapdrm_init(struct omap_drm_private *priv, struct device *dev)
 	priv->dev = dev;
 	priv->dss = pdata->dss;
 	priv->dispc = dispc_get_dispc(priv->dss);
-	priv->dispc_ops = dispc_get_ops(priv->dss);
 
 	omap_crtc_pre_init(priv);
 
@@ -583,9 +582,7 @@ static int omapdrm_init(struct omap_drm_private *priv, struct device *dev)
 	INIT_LIST_HEAD(&priv->obj_list);
 
 	/* Get memory bandwidth limits */
-	if (priv->dispc_ops->get_memory_bandwidth_limit)
-		priv->max_bandwidth =
-			priv->dispc_ops->get_memory_bandwidth_limit(priv->dispc);
+	priv->max_bandwidth = dispc_get_memory_bandwidth_limit(priv->dispc);
 
 	omap_gem_init(ddev);
 
diff --git a/drivers/gpu/drm/omapdrm/omap_drv.h b/drivers/gpu/drm/omapdrm/omap_drv.h
index 38e15962c980..d6f136984da9 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.h
+++ b/drivers/gpu/drm/omapdrm/omap_drv.h
@@ -12,6 +12,7 @@
 #include <linux/workqueue.h>
 
 #include "dss/omapdss.h"
+#include "dss/dss.h"
 
 #include <drm/drm_gem.h>
 #include <drm/omap_drm.h>
@@ -46,7 +47,6 @@ struct omap_drm_private {
 
 	struct dss_device *dss;
 	struct dispc_device *dispc;
-	const struct dispc_ops *dispc_ops;
 
 	unsigned int num_pipes;
 	struct omap_drm_pipeline pipes[8];
diff --git a/drivers/gpu/drm/omapdrm/omap_irq.c b/drivers/gpu/drm/omapdrm/omap_irq.c
index 97c83b959f7e..15148d4b35b5 100644
--- a/drivers/gpu/drm/omapdrm/omap_irq.c
+++ b/drivers/gpu/drm/omapdrm/omap_irq.c
@@ -29,7 +29,7 @@ static void omap_irq_update(struct drm_device *dev)
 
 	DBG("irqmask=%08x", irqmask);
 
-	priv->dispc_ops->write_irqenable(priv->dispc, irqmask);
+	dispc_write_irqenable(priv->dispc, irqmask);
 }
 
 static void omap_irq_wait_handler(struct omap_irq_wait *wait)
@@ -83,7 +83,7 @@ int omap_irq_enable_framedone(struct drm_crtc *crtc, bool enable)
 	unsigned long flags;
 	enum omap_channel channel = omap_crtc_channel(crtc);
 	int framedone_irq =
-		priv->dispc_ops->mgr_get_framedone_irq(priv->dispc, channel);
+		dispc_mgr_get_framedone_irq(priv->dispc, channel);
 
 	DBG("dev=%p, crtc=%u, enable=%d", dev, channel, enable);
 
@@ -120,7 +120,7 @@ int omap_irq_enable_vblank(struct drm_crtc *crtc)
 	DBG("dev=%p, crtc=%u", dev, channel);
 
 	spin_lock_irqsave(&priv->wait_lock, flags);
-	priv->irq_mask |= priv->dispc_ops->mgr_get_vsync_irq(priv->dispc,
+	priv->irq_mask |= dispc_mgr_get_vsync_irq(priv->dispc,
 							     channel);
 	omap_irq_update(dev);
 	spin_unlock_irqrestore(&priv->wait_lock, flags);
@@ -146,7 +146,7 @@ void omap_irq_disable_vblank(struct drm_crtc *crtc)
 	DBG("dev=%p, crtc=%u", dev, channel);
 
 	spin_lock_irqsave(&priv->wait_lock, flags);
-	priv->irq_mask &= ~priv->dispc_ops->mgr_get_vsync_irq(priv->dispc,
+	priv->irq_mask &= ~dispc_mgr_get_vsync_irq(priv->dispc,
 							      channel);
 	omap_irq_update(dev);
 	spin_unlock_irqrestore(&priv->wait_lock, flags);
@@ -211,9 +211,9 @@ static irqreturn_t omap_irq_handler(int irq, void *arg)
 	unsigned int id;
 	u32 irqstatus;
 
-	irqstatus = priv->dispc_ops->read_irqstatus(priv->dispc);
-	priv->dispc_ops->clear_irqstatus(priv->dispc, irqstatus);
-	priv->dispc_ops->read_irqstatus(priv->dispc);	/* flush posted write */
+	irqstatus = dispc_read_irqstatus(priv->dispc);
+	dispc_clear_irqstatus(priv->dispc, irqstatus);
+	dispc_read_irqstatus(priv->dispc);	/* flush posted write */
 
 	VERB("irqs: %08x", irqstatus);
 
@@ -221,15 +221,15 @@ static irqreturn_t omap_irq_handler(int irq, void *arg)
 		struct drm_crtc *crtc = priv->pipes[id].crtc;
 		enum omap_channel channel = omap_crtc_channel(crtc);
 
-		if (irqstatus & priv->dispc_ops->mgr_get_vsync_irq(priv->dispc, channel)) {
+		if (irqstatus & dispc_mgr_get_vsync_irq(priv->dispc, channel)) {
 			drm_handle_vblank(dev, id);
 			omap_crtc_vblank_irq(crtc);
 		}
 
-		if (irqstatus & priv->dispc_ops->mgr_get_sync_lost_irq(priv->dispc, channel))
+		if (irqstatus & dispc_mgr_get_sync_lost_irq(priv->dispc, channel))
 			omap_crtc_error_irq(crtc, irqstatus);
 
-		if (irqstatus & priv->dispc_ops->mgr_get_framedone_irq(priv->dispc, channel))
+		if (irqstatus & dispc_mgr_get_framedone_irq(priv->dispc, channel))
 			omap_crtc_framedone_irq(crtc, irqstatus);
 	}
 
@@ -263,7 +263,7 @@ static const u32 omap_underflow_irqs[] = {
 int omap_drm_irq_install(struct drm_device *dev)
 {
 	struct omap_drm_private *priv = dev->dev_private;
-	unsigned int num_mgrs = priv->dispc_ops->get_num_mgrs(priv->dispc);
+	unsigned int num_mgrs = dispc_get_num_mgrs(priv->dispc);
 	unsigned int max_planes;
 	unsigned int i;
 	int ret;
@@ -281,13 +281,13 @@ int omap_drm_irq_install(struct drm_device *dev)
 	}
 
 	for (i = 0; i < num_mgrs; ++i)
-		priv->irq_mask |= priv->dispc_ops->mgr_get_sync_lost_irq(priv->dispc, i);
+		priv->irq_mask |= dispc_mgr_get_sync_lost_irq(priv->dispc, i);
 
-	priv->dispc_ops->runtime_get(priv->dispc);
-	priv->dispc_ops->clear_irqstatus(priv->dispc, 0xffffffff);
-	priv->dispc_ops->runtime_put(priv->dispc);
+	dispc_runtime_get(priv->dispc);
+	dispc_clear_irqstatus(priv->dispc, 0xffffffff);
+	dispc_runtime_put(priv->dispc);
 
-	ret = priv->dispc_ops->request_irq(priv->dispc, omap_irq_handler, dev);
+	ret = dispc_request_irq(priv->dispc, omap_irq_handler, dev);
 	if (ret < 0)
 		return ret;
 
@@ -305,5 +305,5 @@ void omap_drm_irq_uninstall(struct drm_device *dev)
 
 	dev->irq_enabled = false;
 
-	priv->dispc_ops->free_irq(priv->dispc, dev);
+	dispc_free_irq(priv->dispc, dev);
 }
diff --git a/drivers/gpu/drm/omapdrm/omap_plane.c b/drivers/gpu/drm/omapdrm/omap_plane.c
index 21e0b9785599..d20535b53307 100644
--- a/drivers/gpu/drm/omapdrm/omap_plane.c
+++ b/drivers/gpu/drm/omapdrm/omap_plane.c
@@ -70,17 +70,17 @@ static void omap_plane_atomic_update(struct drm_plane *plane,
 			&info.paddr, &info.p_uv_addr);
 
 	/* and finally, update omapdss: */
-	ret = priv->dispc_ops->ovl_setup(priv->dispc, omap_plane->id, &info,
+	ret = dispc_ovl_setup(priv->dispc, omap_plane->id, &info,
 			      omap_crtc_timings(state->crtc), false,
 			      omap_crtc_channel(state->crtc));
 	if (ret) {
 		dev_err(plane->dev->dev, "Failed to setup plane %s\n",
 			omap_plane->name);
-		priv->dispc_ops->ovl_enable(priv->dispc, omap_plane->id, false);
+		dispc_ovl_enable(priv->dispc, omap_plane->id, false);
 		return;
 	}
 
-	priv->dispc_ops->ovl_enable(priv->dispc, omap_plane->id, true);
+	dispc_ovl_enable(priv->dispc, omap_plane->id, true);
 }
 
 static void omap_plane_atomic_disable(struct drm_plane *plane,
@@ -93,7 +93,7 @@ static void omap_plane_atomic_disable(struct drm_plane *plane,
 	plane->state->zpos = plane->type == DRM_PLANE_TYPE_PRIMARY
 			   ? 0 : omap_plane->id;
 
-	priv->dispc_ops->ovl_enable(priv->dispc, omap_plane->id, false);
+	dispc_ovl_enable(priv->dispc, omap_plane->id, false);
 }
 
 static int omap_plane_atomic_check(struct drm_plane *plane,
@@ -252,7 +252,7 @@ struct drm_plane *omap_plane_init(struct drm_device *dev,
 		u32 possible_crtcs)
 {
 	struct omap_drm_private *priv = dev->dev_private;
-	unsigned int num_planes = priv->dispc_ops->get_num_ovls(priv->dispc);
+	unsigned int num_planes = dispc_get_num_ovls(priv->dispc);
 	struct drm_plane *plane;
 	struct omap_plane *omap_plane;
 	enum omap_plane_id id;
@@ -271,7 +271,7 @@ struct drm_plane *omap_plane_init(struct drm_device *dev,
 	if (!omap_plane)
 		return ERR_PTR(-ENOMEM);
 
-	formats = priv->dispc_ops->ovl_get_color_modes(priv->dispc, id);
+	formats = dispc_ovl_get_color_modes(priv->dispc, id);
 	for (nformats = 0; formats[nformats]; ++nformats)
 		;
 	omap_plane->id = id;
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
