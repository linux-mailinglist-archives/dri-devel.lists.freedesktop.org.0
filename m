Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C153DF73B
	for <lists+dri-devel@lfdr.de>; Wed,  4 Aug 2021 00:05:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B50C06E0A5;
	Tue,  3 Aug 2021 22:05:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1F2B6E05A
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Aug 2021 22:05:49 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10065"; a="277558107"
X-IronPort-AV: E=Sophos;i="5.84,292,1620716400"; d="scan'208";a="277558107"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2021 15:05:47 -0700
X-IronPort-AV: E=Sophos;i="5.84,292,1620716400"; d="scan'208";a="585154011"
Received: from tdpeach-mobl.amr.corp.intel.com (HELO achrisan-desk3.intel.com)
 ([10.212.91.220])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2021 15:05:47 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org, anitha.chrisanthus@intel.com,
 edmund.j.dea@intel.com
Subject: [PATCH v2 5/8] drm/kmb: Disable change of plane parameters
Date: Tue,  3 Aug 2021 15:04:49 -0700
Message-Id: <20210803220452.52379-5-anitha.chrisanthus@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210803220452.52379-1-anitha.chrisanthus@intel.com>
References: <20210803220452.52379-1-anitha.chrisanthus@intel.com>
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

Fixes: 7f7b96a8a0a1 ("drm/kmb: Add support for KeemBay Display")
Signed-off-by: Edmund Dea <edmund.j.dea@intel.com>
Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
---
 drivers/gpu/drm/kmb/kmb_crtc.c  |  2 ++
 drivers/gpu/drm/kmb/kmb_drv.h   |  1 +
 drivers/gpu/drm/kmb/kmb_plane.c | 44 ++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/kmb/kmb_plane.h |  6 +++++
 4 files changed, 52 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/kmb/kmb_crtc.c b/drivers/gpu/drm/kmb/kmb_crtc.c
index 08a45e813db7..0e42c40f0dce 100644
--- a/drivers/gpu/drm/kmb/kmb_crtc.c
+++ b/drivers/gpu/drm/kmb/kmb_crtc.c
@@ -232,6 +232,8 @@ int kmb_setup_crtc(struct drm_device *drm)
 	struct kmb_plane *primary;
 	int ret;
 
+	memset(kmb->init_disp_cfg, 0, sizeof(kmb->init_disp_cfg));
+
 	primary = kmb_plane_init(drm);
 	if (IS_ERR(primary))
 		return PTR_ERR(primary);
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
index e61c2798c206..ae4ebba5ea2a 100644
--- a/drivers/gpu/drm/kmb/kmb_plane.c
+++ b/drivers/gpu/drm/kmb/kmb_plane.c
@@ -71,12 +71,26 @@ static const u32 kmb_formats_v[] = {
 
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
 	}
+
 	return -EINVAL;
 }
 
@@ -85,11 +99,17 @@ static int kmb_plane_atomic_check(struct drm_plane *plane,
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
@@ -102,6 +122,16 @@ static int kmb_plane_atomic_check(struct drm_plane *plane,
 		return -EINVAL;
 	if (new_plane_state->crtc_w < KMB_MIN_WIDTH || new_plane_state->crtc_h < KMB_MIN_HEIGHT)
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
@@ -300,6 +330,7 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
 	unsigned char plane_id;
 	int num_planes;
 	static dma_addr_t addr[MAX_SUB_PLANES];
+	struct disp_cfg *init_disp_cfg;
 	struct viv_vidmem_metadata *md = NULL;
 	struct drm_gem_object *gem_obj;
 	unsigned int cb_stride, cr_stride;
@@ -324,7 +355,8 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
 	}
 	spin_unlock_irq(&kmb->irq_lock);
 
-	src_w = (new_plane_state->src_w >> 16);
+	init_disp_cfg = &kmb->init_disp_cfg[plane_id];
+	src_w = new_plane_state->src_w >> 16;
 	src_h = new_plane_state->src_h >> 16;
 	crtc_x = new_plane_state->crtc_x;
 	crtc_y = new_plane_state->crtc_y;
@@ -484,6 +516,16 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
 
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
index 486490f7a3ec..99207b35365c 100644
--- a/drivers/gpu/drm/kmb/kmb_plane.h
+++ b/drivers/gpu/drm/kmb/kmb_plane.h
@@ -62,6 +62,12 @@ struct layer_status {
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

