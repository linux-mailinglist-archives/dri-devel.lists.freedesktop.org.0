Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 167179B1B11
	for <lists+dri-devel@lfdr.de>; Sun, 27 Oct 2024 00:00:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1797310E033;
	Sat, 26 Oct 2024 22:00:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="huPsk1e/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50C2210E033
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Oct 2024 22:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=v8HoMq4531jF00RJXMw2xIWyQpbKLYJOPjHbtvEZNF0=; b=huPsk1e/0Jtaey5E
 b3BLMp7507U79Tvukvaf42QI91uzvBas1ztGwyCrqLSSumUYBrx9o0dhusTrc48omKiv/46Wfx7IF
 GikcMR47m+Sn7G5A1Lxp+QDp1V09F54xHzISVBYNjZni/b1lX2lEp9JFUf+W5FQlZgutFl+T/6p7X
 5GupH1STIfG2cBg8grHovWGIseC+nzCMzK2S/g6zlrjgin+vwNceSYT58Et17xkwK43DGWic7BRXY
 PCNhHNJCSGtMIIEG0PDqhDw52E/bnpWcMwWzScZskP5suakpjl1W26Aqo5vrdgcerLon9OAtPmVQy
 x4nbWxCwlnxVqfuEAg==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1t4opP-00DjmR-1v;
 Sat, 26 Oct 2024 22:00:11 +0000
From: linux@treblig.org
To: tomi.valkeinen@ideasonboard.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] drm/omap: Clean up deadcode functions
Date: Sat, 26 Oct 2024 23:00:10 +0100
Message-ID: <20241026220010.93773-1-linux@treblig.org>
X-Mailer: git-send-email 2.47.0
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

From: "Dr. David Alan Gilbert" <linux@treblig.org>

dispc_enable_fifomerge() last use was removed by 2012's
commit 85099f11bd03 ("Revert "OMAPDSS: APPLY: add fifo merge support
funcs"")

dispc_has_writeback(), dispc_wb_get_framedone_irq(), dispc_wb_go(),
dispc_wb_go_busy() and dispc_wb_setup() were changed from statics
to public symbols and unwired from a structure by 2020's
commit dac62bcafeaa ("drm/omap: remove dispc_ops")
but didn't have any users.

dispc_mgr_get_clock_div() got renamed from dispc_get_clock_div()
and it's last use was removed in 2011 by commit
42c9dee82129 ("OMAP: DSS2: Remove FB_OMAP_BOOTLOADER_INIT support")

Remove them.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/gpu/drm/omapdrm/dss/dispc.c | 146 ----------------------------
 drivers/gpu/drm/omapdrm/dss/dss.h   |  13 ---
 2 files changed, 159 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dispc.c b/drivers/gpu/drm/omapdrm/dss/dispc.c
index 993691b3cc7e..9344855c4887 100644
--- a/drivers/gpu/drm/omapdrm/dss/dispc.c
+++ b/drivers/gpu/drm/omapdrm/dss/dispc.c
@@ -691,11 +691,6 @@ u32 dispc_mgr_get_sync_lost_irq(struct dispc_device *dispc,
 	return mgr_desc[channel].sync_lost_irq;
 }
 
-u32 dispc_wb_get_framedone_irq(struct dispc_device *dispc)
-{
-	return DISPC_IRQ_FRAMEDONEWB;
-}
-
 void dispc_mgr_enable(struct dispc_device *dispc,
 			     enum omap_channel channel, bool enable)
 {
@@ -726,30 +721,6 @@ void dispc_mgr_go(struct dispc_device *dispc, enum omap_channel channel)
 	mgr_fld_write(dispc, channel, DISPC_MGR_FLD_GO, 1);
 }
 
-bool dispc_wb_go_busy(struct dispc_device *dispc)
-{
-	return REG_GET(dispc, DISPC_CONTROL2, 6, 6) == 1;
-}
-
-void dispc_wb_go(struct dispc_device *dispc)
-{
-	enum omap_plane_id plane = OMAP_DSS_WB;
-	bool enable, go;
-
-	enable = REG_GET(dispc, DISPC_OVL_ATTRIBUTES(plane), 0, 0) == 1;
-
-	if (!enable)
-		return;
-
-	go = REG_GET(dispc, DISPC_CONTROL2, 6, 6) == 1;
-	if (go) {
-		DSSERR("GO bit not down for WB\n");
-		return;
-	}
-
-	REG_FLD_MOD(dispc, DISPC_CONTROL2, 1, 6, 6);
-}
-
 static void dispc_ovl_write_firh_reg(struct dispc_device *dispc,
 				     enum omap_plane_id plane, int reg,
 				     u32 value)
@@ -1498,17 +1469,6 @@ void dispc_ovl_set_fifo_threshold(struct dispc_device *dispc,
 				min(high, 0xfffu));
 }
 
-void dispc_enable_fifomerge(struct dispc_device *dispc, bool enable)
-{
-	if (!dispc_has_feature(dispc, FEAT_FIFO_MERGE)) {
-		WARN_ON(enable);
-		return;
-	}
-
-	DSSDBG("FIFO merge %s\n", enable ? "enabled" : "disabled");
-	REG_FLD_MOD(dispc, DISPC_CONFIG, enable ? 1 : 0, 14, 14);
-}
-
 void dispc_ovl_compute_fifo_thresholds(struct dispc_device *dispc,
 				       enum omap_plane_id plane,
 				       u32 *fifo_low, u32 *fifo_high,
@@ -2814,95 +2774,6 @@ int dispc_ovl_setup(struct dispc_device *dispc,
 	return r;
 }
 
-int dispc_wb_setup(struct dispc_device *dispc,
-		   const struct omap_dss_writeback_info *wi,
-		   bool mem_to_mem, const struct videomode *vm,
-		   enum dss_writeback_channel channel_in)
-{
-	int r;
-	u32 l;
-	enum omap_plane_id plane = OMAP_DSS_WB;
-	const int pos_x = 0, pos_y = 0;
-	const u8 zorder = 0, global_alpha = 0;
-	const bool replication = true;
-	bool truncation;
-	int in_width = vm->hactive;
-	int in_height = vm->vactive;
-	enum omap_overlay_caps caps =
-		OMAP_DSS_OVL_CAP_SCALE | OMAP_DSS_OVL_CAP_PRE_MULT_ALPHA;
-
-	if (vm->flags & DISPLAY_FLAGS_INTERLACED)
-		in_height /= 2;
-
-	DSSDBG("dispc_wb_setup, pa %x, pa_uv %x, %d,%d -> %dx%d, cmode %x, "
-		"rot %d\n", wi->paddr, wi->p_uv_addr, in_width,
-		in_height, wi->width, wi->height, wi->fourcc, wi->rotation);
-
-	r = dispc_ovl_setup_common(dispc, plane, caps, wi->paddr, wi->p_uv_addr,
-		wi->buf_width, pos_x, pos_y, in_width, in_height, wi->width,
-		wi->height, wi->fourcc, wi->rotation, zorder,
-		wi->pre_mult_alpha, global_alpha, wi->rotation_type,
-		replication, vm, mem_to_mem, DRM_COLOR_YCBCR_BT601,
-		DRM_COLOR_YCBCR_LIMITED_RANGE);
-	if (r)
-		return r;
-
-	switch (wi->fourcc) {
-	case DRM_FORMAT_RGB565:
-	case DRM_FORMAT_RGB888:
-	case DRM_FORMAT_ARGB4444:
-	case DRM_FORMAT_RGBA4444:
-	case DRM_FORMAT_RGBX4444:
-	case DRM_FORMAT_ARGB1555:
-	case DRM_FORMAT_XRGB1555:
-	case DRM_FORMAT_XRGB4444:
-		truncation = true;
-		break;
-	default:
-		truncation = false;
-		break;
-	}
-
-	/* setup extra DISPC_WB_ATTRIBUTES */
-	l = dispc_read_reg(dispc, DISPC_OVL_ATTRIBUTES(plane));
-	l = FLD_MOD(l, truncation, 10, 10);	/* TRUNCATIONENABLE */
-	l = FLD_MOD(l, channel_in, 18, 16);	/* CHANNELIN */
-	l = FLD_MOD(l, mem_to_mem, 19, 19);	/* WRITEBACKMODE */
-	if (mem_to_mem)
-		l = FLD_MOD(l, 1, 26, 24);	/* CAPTUREMODE */
-	else
-		l = FLD_MOD(l, 0, 26, 24);	/* CAPTUREMODE */
-	dispc_write_reg(dispc, DISPC_OVL_ATTRIBUTES(plane), l);
-
-	if (mem_to_mem) {
-		/* WBDELAYCOUNT */
-		REG_FLD_MOD(dispc, DISPC_OVL_ATTRIBUTES2(plane), 0, 7, 0);
-	} else {
-		u32 wbdelay;
-
-		if (channel_in == DSS_WB_TV_MGR)
-			wbdelay = vm->vsync_len + vm->vback_porch;
-		else
-			wbdelay = vm->vfront_porch + vm->vsync_len +
-				vm->vback_porch;
-
-		if (vm->flags & DISPLAY_FLAGS_INTERLACED)
-			wbdelay /= 2;
-
-		wbdelay = min(wbdelay, 255u);
-
-		/* WBDELAYCOUNT */
-		REG_FLD_MOD(dispc, DISPC_OVL_ATTRIBUTES2(plane), wbdelay, 7, 0);
-	}
-
-	return 0;
-}
-
-bool dispc_has_writeback(struct dispc_device *dispc)
-{
-	return dispc->feat->has_writeback;
-}
-
 int dispc_ovl_enable(struct dispc_device *dispc,
 			    enum omap_plane_id plane, bool enable)
 {
@@ -3742,23 +3613,6 @@ void dispc_mgr_set_clock_div(struct dispc_device *dispc,
 				  cinfo->pck_div);
 }
 
-int dispc_mgr_get_clock_div(struct dispc_device *dispc,
-			    enum omap_channel channel,
-			    struct dispc_clock_info *cinfo)
-{
-	unsigned long fck;
-
-	fck = dispc_fclk_rate(dispc);
-
-	cinfo->lck_div = REG_GET(dispc, DISPC_DIVISORo(channel), 23, 16);
-	cinfo->pck_div = REG_GET(dispc, DISPC_DIVISORo(channel), 7, 0);
-
-	cinfo->lck = fck / cinfo->lck_div;
-	cinfo->pck = cinfo->lck / cinfo->pck_div;
-
-	return 0;
-}
-
 u32 dispc_read_irqstatus(struct dispc_device *dispc)
 {
 	return dispc_read_reg(dispc, DISPC_IRQSTATUS);
diff --git a/drivers/gpu/drm/omapdrm/dss/dss.h b/drivers/gpu/drm/omapdrm/dss/dss.h
index 4ff02fbc0e71..a8b231ed4f4b 100644
--- a/drivers/gpu/drm/omapdrm/dss/dss.h
+++ b/drivers/gpu/drm/omapdrm/dss/dss.h
@@ -416,7 +416,6 @@ u32 dispc_mgr_get_framedone_irq(struct dispc_device *dispc,
 				       enum omap_channel channel);
 u32 dispc_mgr_get_sync_lost_irq(struct dispc_device *dispc,
 				       enum omap_channel channel);
-u32 dispc_wb_get_framedone_irq(struct dispc_device *dispc);
 
 u32 dispc_get_memory_bandwidth_limit(struct dispc_device *dispc);
 
@@ -458,20 +457,11 @@ int dispc_ovl_setup(struct dispc_device *dispc,
 int dispc_ovl_enable(struct dispc_device *dispc,
 			    enum omap_plane_id plane, bool enable);
 
-bool dispc_has_writeback(struct dispc_device *dispc);
-int dispc_wb_setup(struct dispc_device *dispc,
-		   const struct omap_dss_writeback_info *wi,
-		   bool mem_to_mem, const struct videomode *vm,
-		   enum dss_writeback_channel channel_in);
-bool dispc_wb_go_busy(struct dispc_device *dispc);
-void dispc_wb_go(struct dispc_device *dispc);
-
 void dispc_enable_sidle(struct dispc_device *dispc);
 void dispc_disable_sidle(struct dispc_device *dispc);
 
 void dispc_lcd_enable_signal(struct dispc_device *dispc, bool enable);
 void dispc_pck_free_enable(struct dispc_device *dispc, bool enable);
-void dispc_enable_fifomerge(struct dispc_device *dispc, bool enable);
 
 typedef bool (*dispc_div_calc_func)(int lckd, int pckd, unsigned long lck,
 		unsigned long pck, void *data);
@@ -494,9 +484,6 @@ void dispc_ovl_compute_fifo_thresholds(struct dispc_device *dispc,
 void dispc_mgr_set_clock_div(struct dispc_device *dispc,
 			     enum omap_channel channel,
 			     const struct dispc_clock_info *cinfo);
-int dispc_mgr_get_clock_div(struct dispc_device *dispc,
-			    enum omap_channel channel,
-			    struct dispc_clock_info *cinfo);
 void dispc_set_tv_pclk(struct dispc_device *dispc, unsigned long pclk);
 
 #ifdef CONFIG_OMAP2_DSS_COLLECT_IRQ_STATS
-- 
2.47.0

