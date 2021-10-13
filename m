Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A6F42CF3D
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 01:37:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5190B6E889;
	Wed, 13 Oct 2021 23:37:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8CEF6E889
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 23:37:17 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10136"; a="250992258"
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="250992258"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 16:37:17 -0700
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="659743936"
Received: from thollida-mobl.amr.corp.intel.com (HELO
 achrisan-desk3.intel.com) ([10.212.111.141])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 16:37:16 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org,
	anitha.chrisanthus@intel.com
Cc: sam@ravnborg.org,
	edmund.j.dea@intel.com
Subject: [PATCH v3 4/7] drm/kmb: Disable change of plane parameters
Date: Wed, 13 Oct 2021 16:36:29 -0700
Message-Id: <20211013233632.471892-4-anitha.chrisanthus@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013233632.471892-1-anitha.chrisanthus@intel.com>
References: <20211013233632.471892-1-anitha.chrisanthus@intel.com>
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

From: Edmund Dea <edmund.j.dea@intel.com>

Due to HW limitations, KMB cannot change height, width, or
pixel format after initial plane configuration.

v2: removed memset disp_cfg as it is already zero.

Fixes: 7f7b96a8a0a1 ("drm/kmb: Add support for KeemBay Display")
Signed-off-by: Edmund Dea <edmund.j.dea@intel.com>
Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
---
 drivers/gpu/drm/kmb/kmb_drv.h   |  1 +
 drivers/gpu/drm/kmb/kmb_plane.c | 43 ++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/kmb/kmb_plane.h |  6 +++++
 3 files changed, 49 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/kmb/kmb_drv.h b/drivers/gpu/drm/kmb/kmb_drv.h
index d297218869e8..b3203f583a46 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.h
+++ b/drivers/gpu/drm/kmb/kmb_drv.h
@@ -57,6 +57,7 @@ struct kmb_drm_private {
 	spinlock_t			irq_lock;
 	int				irq_lcd;
 	int				sys_clk_mhz;
+	struct disp_cfg			init_disp_cfg[KMB_MAX_PLANES];
 	struct layer_status		plane_status[KMB_MAX_PLANES];
 	int				kmb_under_flow;
 	int				kmb_flush_done;
diff --git a/drivers/gpu/drm/kmb/kmb_plane.c b/drivers/gpu/drm/kmb/kmb_plane.c
index 06b0c42c9e91..00404ba4126d 100644
--- a/drivers/gpu/drm/kmb/kmb_plane.c
+++ b/drivers/gpu/drm/kmb/kmb_plane.c
@@ -67,8 +67,21 @@ static const u32 kmb_formats_v[] = {
 
 static unsigned int check_pixel_format(struct drm_plane *plane, u32 format)
 {
+	struct kmb_drm_private *kmb;
+	struct kmb_plane *kmb_plane = to_kmb_plane(plane);
 	int i;
+	int plane_id = kmb_plane->id;
+	struct disp_cfg init_disp_cfg;
 
+	kmb = to_kmb(plane->dev);
+	init_disp_cfg = kmb->init_disp_cfg[plane_id];
+	/* Due to HW limitations, changing pixel format after initial
+	 * plane configuration is not supported.
+	 */
+	if (init_disp_cfg.format && init_disp_cfg.format != format) {
+		drm_dbg(&kmb->drm, "Cannot change format after initial plane configuration");
+		return -EINVAL;
+	}
 	for (i = 0; i < plane->format_count; i++) {
 		if (plane->format_types[i] == format)
 			return 0;
@@ -81,11 +94,17 @@ static int kmb_plane_atomic_check(struct drm_plane *plane,
 {
 	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
 										 plane);
+	struct kmb_drm_private *kmb;
+	struct kmb_plane *kmb_plane = to_kmb_plane(plane);
+	int plane_id = kmb_plane->id;
+	struct disp_cfg init_disp_cfg;
 	struct drm_framebuffer *fb;
 	int ret;
 	struct drm_crtc_state *crtc_state;
 	bool can_position;
 
+	kmb = to_kmb(plane->dev);
+	init_disp_cfg = kmb->init_disp_cfg[plane_id];
 	fb = new_plane_state->fb;
 	if (!fb || !new_plane_state->crtc)
 		return 0;
@@ -99,6 +118,16 @@ static int kmb_plane_atomic_check(struct drm_plane *plane,
 	    new_plane_state->crtc_w < KMB_FB_MIN_WIDTH ||
 	    new_plane_state->crtc_h < KMB_FB_MIN_HEIGHT)
 		return -EINVAL;
+
+	/* Due to HW limitations, changing plane height or width after
+	 * initial plane configuration is not supported.
+	 */
+	if ((init_disp_cfg.width && init_disp_cfg.height) &&
+	    (init_disp_cfg.width != fb->width ||
+	    init_disp_cfg.height != fb->height)) {
+		drm_dbg(&kmb->drm, "Cannot change plane height or width after initial configuration");
+		return -EINVAL;
+	}
 	can_position = (plane->type == DRM_PLANE_TYPE_OVERLAY);
 	crtc_state =
 		drm_atomic_get_existing_crtc_state(state,
@@ -335,6 +364,7 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
 	unsigned char plane_id;
 	int num_planes;
 	static dma_addr_t addr[MAX_SUB_PLANES];
+	struct disp_cfg *init_disp_cfg;
 
 	if (!plane || !new_plane_state || !old_plane_state)
 		return;
@@ -357,7 +387,8 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
 	}
 	spin_unlock_irq(&kmb->irq_lock);
 
-	src_w = (new_plane_state->src_w >> 16);
+	init_disp_cfg = &kmb->init_disp_cfg[plane_id];
+	src_w = new_plane_state->src_w >> 16;
 	src_h = new_plane_state->src_h >> 16;
 	crtc_x = new_plane_state->crtc_x;
 	crtc_y = new_plane_state->crtc_y;
@@ -500,6 +531,16 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
 
 	/* Enable DMA */
 	kmb_write_lcd(kmb, LCD_LAYERn_DMA_CFG(plane_id), dma_cfg);
+
+	/* Save initial display config */
+	if (!init_disp_cfg->width ||
+	    !init_disp_cfg->height ||
+	    !init_disp_cfg->format) {
+		init_disp_cfg->width = width;
+		init_disp_cfg->height = height;
+		init_disp_cfg->format = fb->format->format;
+	}
+
 	drm_dbg(&kmb->drm, "dma_cfg=0x%x LCD_DMA_CFG=0x%x\n", dma_cfg,
 		kmb_read_lcd(kmb, LCD_LAYERn_DMA_CFG(plane_id)));
 
diff --git a/drivers/gpu/drm/kmb/kmb_plane.h b/drivers/gpu/drm/kmb/kmb_plane.h
index 6e8d22cf8819..b51144044fe8 100644
--- a/drivers/gpu/drm/kmb/kmb_plane.h
+++ b/drivers/gpu/drm/kmb/kmb_plane.h
@@ -63,6 +63,12 @@ struct layer_status {
 	u32 ctrl;
 };
 
+struct disp_cfg {
+	unsigned int width;
+	unsigned int height;
+	unsigned int format;
+};
+
 struct kmb_plane *kmb_plane_init(struct drm_device *drm);
 void kmb_plane_destroy(struct drm_plane *plane);
 #endif /* __KMB_PLANE_H__ */
-- 
2.25.1

