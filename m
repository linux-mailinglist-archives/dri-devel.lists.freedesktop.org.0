Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7FF3D84B4
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 02:32:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0529E6EB1E;
	Wed, 28 Jul 2021 00:32:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB6EF6EB1E
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 00:32:19 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10058"; a="209442008"
X-IronPort-AV: E=Sophos;i="5.84,275,1620716400"; d="scan'208";a="209442008"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2021 17:32:19 -0700
X-IronPort-AV: E=Sophos;i="5.84,275,1620716400"; d="scan'208";a="634583416"
Received: from mamarti1-mobl.amr.corp.intel.com (HELO
 achrisan-desk3.intel.com) ([10.212.71.161])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2021 17:32:19 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org, anitha.chrisanthus@intel.com,
 edmund.j.dea@intel.com
Subject: [PATCH 07/14] drm/kmb: Disable change of plane parameters
Date: Tue, 27 Jul 2021 17:31:19 -0700
Message-Id: <20210728003126.1425028-7-anitha.chrisanthus@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210728003126.1425028-1-anitha.chrisanthus@intel.com>
References: <20210728003126.1425028-1-anitha.chrisanthus@intel.com>
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
---
 drivers/gpu/drm/kmb/kmb_crtc.c  |  2 ++
 drivers/gpu/drm/kmb/kmb_drv.h   |  1 +
 drivers/gpu/drm/kmb/kmb_plane.c | 44 ++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/kmb/kmb_plane.h |  6 +++++
 4 files changed, 52 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/kmb/kmb_crtc.c b/drivers/gpu/drm/kmb/kmb_crtc.c
index 44626044c85e..42c8010ef2f6 100644
--- a/drivers/gpu/drm/kmb/kmb_crtc.c
+++ b/drivers/gpu/drm/kmb/kmb_crtc.c
@@ -226,6 +226,8 @@ int kmb_setup_crtc(struct drm_device *drm)
 	struct kmb_plane *primary;
 	int ret;
 
+	memset(kmb->init_disp_cfg, 0, sizeof(kmb->init_disp_cfg));
+
 	primary = kmb_plane_init(drm);
 	if (IS_ERR(primary))
 		return PTR_ERR(primary);
diff --git a/drivers/gpu/drm/kmb/kmb_drv.h b/drivers/gpu/drm/kmb/kmb_drv.h
index fefb1052058c..dc0679a70cc5 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.h
+++ b/drivers/gpu/drm/kmb/kmb_drv.h
@@ -56,6 +56,7 @@ struct kmb_drm_private {
 	spinlock_t			irq_lock;
 	int				irq_lcd;
 	int				sys_clk_mhz;
+	struct disp_cfg			init_disp_cfg[KMB_MAX_PLANES];
 	struct layer_status		plane_status[KMB_MAX_PLANES];
 	int				kmb_under_flow;
 	int				kmb_flush_done;
diff --git a/drivers/gpu/drm/kmb/kmb_plane.c b/drivers/gpu/drm/kmb/kmb_plane.c
index e45419d6ed96..dacec5c4266f 100644
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
 	int num_planes, i;
 	static dma_addr_t addr[MAX_SUB_PLANES];
+	struct disp_cfg *init_disp_cfg;
 	struct viv_vidmem_metadata *md = NULL;
 	struct drm_gem_object *gem_obj;
 
@@ -323,7 +354,8 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
 	}
 	spin_unlock_irq(&kmb->irq_lock);
 
-	src_w = (new_plane_state->src_w >> 16);
+	init_disp_cfg = &kmb->init_disp_cfg[plane_id];
+	src_w = new_plane_state->src_w >> 16;
 	src_h = new_plane_state->src_h >> 16;
 	crtc_x = new_plane_state->crtc_x;
 	crtc_y = new_plane_state->crtc_y;
@@ -478,6 +510,16 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
 
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

