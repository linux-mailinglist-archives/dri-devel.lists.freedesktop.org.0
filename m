Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7523C7D3B
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 06:14:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 651B36E157;
	Wed, 14 Jul 2021 04:14:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EX13-EDG-OU-002.vmware.com (ex13-edg-ou-002.vmware.com
 [208.91.0.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38D0E89EF7
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 04:14:20 +0000 (UTC)
Received: from sc9-mailhost1.vmware.com (10.113.161.71) by
 EX13-EDG-OU-002.vmware.com (10.113.208.156) with Microsoft SMTP Server id
 15.0.1156.6; Tue, 13 Jul 2021 21:14:15 -0700
Received: from vertex.localdomain (unknown [10.21.244.34])
 by sc9-mailhost1.vmware.com (Postfix) with ESMTP id 106152024A;
 Tue, 13 Jul 2021 21:14:17 -0700 (PDT)
From: Zack Rusin <zackr@vmware.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/4] drm/vmwgfx: Add support for CursorMob and CursorBypass 4
Date: Wed, 14 Jul 2021 00:14:14 -0400
Message-ID: <20210714041417.221947-1-zackr@vmware.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (EX13-EDG-OU-002.vmware.com: zackr@vmware.com does not
 designate permitted sender hosts)
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
Cc: Martin Krastev <krastevm@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Martin Krastev <krastevm@vmware.com>

* Add support for CursorMob
* Add support for CursorBypass 4

Reviewed-by: Zack Rusin <zackr@vmware.com>
Signed-off-by: Martin Krastev <krastevm@vmware.com>
Signed-off-by: Zack Rusin <zackr@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 45 +++++++++++++++-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h |  6 +++
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 79 +++++++++++++++++++++++++++--
 3 files changed, 125 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 086dc75e7b42..7d8cc2f6b04e 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0 OR MIT
 /**************************************************************************
  *
- * Copyright 2009-2016 VMware, Inc., Palo Alto, CA., USA
+ * Copyright 2009-2021 VMware, Inc., Palo Alto, CA., USA
  *
  * Permission is hereby granted, free of charge, to any person obtaining a
  * copy of this software and associated documentation files (the
@@ -301,8 +301,12 @@ static void vmw_print_capabilities2(uint32_t capabilities2)
 		DRM_INFO("  Grow oTable.\n");
 	if (capabilities2 & SVGA_CAP2_INTRA_SURFACE_COPY)
 		DRM_INFO("  IntraSurface copy.\n");
+	if (capabilities2 & SVGA_CAP2_CURSOR_MOB)
+		DRM_INFO("  Cursor Mob.\n");
 	if (capabilities2 & SVGA_CAP2_DX3)
 		DRM_INFO("  DX3.\n");
+	if (capabilities2 & SVGA_CAP2_EXTRA_REGS)
+		DRM_INFO("  Extra Regs.\n");
 }
 
 static void vmw_print_capabilities(uint32_t capabilities)
@@ -505,6 +509,7 @@ static int vmw_request_device_late(struct vmw_private *dev_priv)
 static int vmw_request_device(struct vmw_private *dev_priv)
 {
 	int ret;
+	size_t i;
 
 	ret = vmw_device_init(dev_priv);
 	if (unlikely(ret != 0)) {
@@ -526,6 +531,37 @@ static int vmw_request_device(struct vmw_private *dev_priv)
 	if (unlikely(ret != 0))
 		goto out_no_query_bo;
 
+	/* Set up mobs for cursor updates */
+	if (dev_priv->has_mob && dev_priv->capabilities2 & SVGA_CAP2_CURSOR_MOB) {
+		const uint32_t cursor_max_dim = vmw_read(dev_priv, SVGA_REG_CURSOR_MAX_DIMENSION);
+
+		for (i = 0; i < ARRAY_SIZE(dev_priv->cursor_mob); i++) {
+			struct ttm_buffer_object **const bo = &dev_priv->cursor_mob[i];
+
+			ret = vmw_bo_create_kernel(dev_priv,
+				cursor_max_dim * cursor_max_dim * sizeof(u32) + sizeof(SVGAGBCursorHeader),
+				&vmw_mob_placement, bo);
+
+			if (ret != 0) {
+				DRM_ERROR("Unable to create CursorMob array.\n");
+				break;
+			}
+
+			BUG_ON((*bo)->resource->mem_type != VMW_PL_MOB);
+
+			/* Fence the mob creation so we are guarateed to have the mob */
+			ret = ttm_bo_reserve(*bo, false, true, NULL);
+			BUG_ON(ret);
+
+			vmw_bo_fence_single(*bo, NULL);
+
+			ttm_bo_unreserve(*bo);
+
+			DRM_INFO("Using CursorMob mobid %lu, max dimension %u\n",
+				 (*bo)->resource->start, cursor_max_dim);
+		}
+	}
+
 	return 0;
 
 out_no_query_bo:
@@ -556,6 +592,8 @@ static int vmw_request_device(struct vmw_private *dev_priv)
  */
 static void vmw_release_device_early(struct vmw_private *dev_priv)
 {
+	size_t i;
+
 	/*
 	 * Previous destructions should've released
 	 * the pinned bo.
@@ -570,6 +608,11 @@ static void vmw_release_device_early(struct vmw_private *dev_priv)
 	if (dev_priv->has_mob) {
 		struct ttm_resource_manager *man;
 
+		for (i = 0; i < ARRAY_SIZE(dev_priv->cursor_mob); i++) {
+			if (dev_priv->cursor_mob[i] != NULL)
+				ttm_bo_put(dev_priv->cursor_mob[i]);
+		}
+
 		man = ttm_manager_type(&dev_priv->bdev, VMW_PL_MOB);
 		ttm_resource_manager_evict_all(&dev_priv->bdev, man);
 		vmw_otables_takedown(dev_priv);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index 356f82c26f59..46bf54f6169a 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -642,6 +642,12 @@ struct vmw_private {
 	u8 mksstat_kern_top_timer[MKSSTAT_CAPACITY];
 	atomic_t mksstat_kern_pids[MKSSTAT_CAPACITY];
 #endif
+
+	/*
+	 * CursorMob buffer objects
+	 */
+	struct ttm_buffer_object *cursor_mob[2];
+	atomic_t cursor_mob_idx;
 };
 
 static inline struct vmw_surface *vmw_res_to_srf(struct vmw_resource *res)
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index 2ddf4932d62c..8d7844354774 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0 OR MIT
 /**************************************************************************
  *
- * Copyright 2009-2015 VMware, Inc., Palo Alto, CA., USA
+ * Copyright 2009-2021 VMware, Inc., Palo Alto, CA., USA
  *
  * Permission is hereby granted, free of charge, to any person obtaining a
  * copy of this software and associated documentation files (the
@@ -53,6 +53,10 @@ void vmw_du_cleanup(struct vmw_display_unit *du)
  * Display Unit Cursor functions
  */
 
+static int vmw_cursor_update_mob(struct vmw_private *dev_priv,
+				 u32 *image, u32 width, u32 height,
+				 u32 hotspotX, u32 hotspotY);
+
 static int vmw_cursor_update_image(struct vmw_private *dev_priv,
 				   u32 *image, u32 width, u32 height,
 				   u32 hotspotX, u32 hotspotY)
@@ -67,6 +71,10 @@ static int vmw_cursor_update_image(struct vmw_private *dev_priv,
 	if (!image)
 		return -EINVAL;
 
+	if (dev_priv->cursor_mob[ARRAY_SIZE(dev_priv->cursor_mob) - 1] != NULL)
+		return vmw_cursor_update_mob(dev_priv, image, width, height,
+					     hotspotX, hotspotY);
+
 	cmd = VMW_CMD_RESERVE(dev_priv, cmd_size);
 	if (unlikely(cmd == NULL))
 		return -ENOMEM;
@@ -87,6 +95,62 @@ static int vmw_cursor_update_image(struct vmw_private *dev_priv,
 	return 0;
 }
 
+static int vmw_cursor_update_mob(struct vmw_private *dev_priv,
+				 u32 *image, u32 width, u32 height,
+				 u32 hotspotX, u32 hotspotY)
+{
+	SVGAGBCursorHeader *header;
+	SVGAGBAlphaCursorHeader *alpha_header;
+	const u32 image_size = width * height * sizeof(*image);
+	const u32 mob_size = sizeof(*header) + image_size;
+
+	struct ttm_buffer_object *bo;
+	struct ttm_bo_kmap_obj map;
+	bool dummy;
+	int ret;
+
+	bo = dev_priv->cursor_mob[atomic_inc_return(&dev_priv->cursor_mob_idx) %
+		ARRAY_SIZE(dev_priv->cursor_mob)];
+	BUG_ON(bo == NULL);
+
+	ret = ttm_bo_reserve(bo, true, false, NULL);
+
+	if (unlikely(ret != 0)) {
+		DRM_ERROR("reserve failed\n");
+		return -EINVAL;
+	}
+
+	ret = ttm_bo_kmap(bo, 0, vmw_num_pages(mob_size), &map);
+
+	if (unlikely(ret != 0))
+		goto err_map;
+
+	header = (SVGAGBCursorHeader *)ttm_kmap_obj_virtual(&map, &dummy);
+	alpha_header = &header->header.alphaHeader;
+
+	header->type = SVGA_ALPHA_CURSOR;
+	header->sizeInBytes = image_size;
+
+	alpha_header->hotspotX = hotspotX;
+	alpha_header->hotspotY = hotspotY;
+	alpha_header->width = width;
+	alpha_header->height = height;
+
+	memcpy(header + 1, image, image_size);
+
+	ttm_bo_kunmap(&map);
+	ttm_bo_unreserve(bo);
+
+	vmw_write(dev_priv, SVGA_REG_CURSOR_MOBID, bo->resource->start);
+
+	return 0;
+
+err_map:
+	ttm_bo_unreserve(bo);
+
+	return ret;
+}
+
 static int vmw_cursor_update_bo(struct vmw_private *dev_priv,
 				struct vmw_buffer_object *bo,
 				u32 width, u32 height,
@@ -127,11 +191,18 @@ static int vmw_cursor_update_bo(struct vmw_private *dev_priv,
 static void vmw_cursor_update_position(struct vmw_private *dev_priv,
 				       bool show, int x, int y)
 {
+	const uint32_t svga_cursor_on = show ? SVGA_CURSOR_ON_SHOW
+					     : SVGA_CURSOR_ON_HIDE;
 	uint32_t count;
 
 	spin_lock(&dev_priv->cursor_lock);
-	if (vmw_is_cursor_bypass3_enabled(dev_priv)) {
-		vmw_fifo_mem_write(dev_priv, SVGA_FIFO_CURSOR_ON, show ? 1 : 0);
+	if (dev_priv->capabilities2 & SVGA_CAP2_EXTRA_REGS) {
+		vmw_write(dev_priv, SVGA_REG_CURSOR4_X, x);
+		vmw_write(dev_priv, SVGA_REG_CURSOR4_Y, y);
+		vmw_write(dev_priv, SVGA_REG_CURSOR4_ON, svga_cursor_on);
+		vmw_write(dev_priv, SVGA_REG_CURSOR4_SUBMIT, TRUE);
+	} else if (vmw_is_cursor_bypass3_enabled(dev_priv)) {
+		vmw_fifo_mem_write(dev_priv, SVGA_FIFO_CURSOR_ON, svga_cursor_on);
 		vmw_fifo_mem_write(dev_priv, SVGA_FIFO_CURSOR_X, x);
 		vmw_fifo_mem_write(dev_priv, SVGA_FIFO_CURSOR_Y, y);
 		count = vmw_fifo_mem_read(dev_priv, SVGA_FIFO_CURSOR_COUNT);
@@ -139,7 +210,7 @@ static void vmw_cursor_update_position(struct vmw_private *dev_priv,
 	} else {
 		vmw_write(dev_priv, SVGA_REG_CURSOR_X, x);
 		vmw_write(dev_priv, SVGA_REG_CURSOR_Y, y);
-		vmw_write(dev_priv, SVGA_REG_CURSOR_ON, show ? 1 : 0);
+		vmw_write(dev_priv, SVGA_REG_CURSOR_ON, svga_cursor_on);
 	}
 	spin_unlock(&dev_priv->cursor_lock);
 }
-- 
2.30.2

