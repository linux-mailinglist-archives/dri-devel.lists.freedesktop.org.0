Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CC360D99B
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 05:20:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A292A10E353;
	Wed, 26 Oct 2022 03:19:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8C5C10E2A4
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Oct 2022 03:19:44 +0000 (UTC)
Received: from vertex.vmware.com (pool-173-49-113-140.phlapa.fios.verizon.net
 [173.49.113.140]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id 1E40533F074;
 Wed, 26 Oct 2022 04:19:43 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1666754383; bh=YDoLnAM8pWxh3Ikn5lrOKT63SCRLPmD2FW7h5jN9rlI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=glpIOrLW/BDVojcXuWvxIOXcf7K/3EP55PG6D1bqnNj02rc05HBCNx6LRU9N42o3u
 DCcVyap8/wUaL2nngVme7BrF+wleVCS5AKSP7bkggn4B4RMWd+6/lsQgXwNeuGAFIg
 WF+sew84Z/etBTqgdqZL0mls9BoelJLmJbvi2RswoFrTQur9UBg4gE0MzauTPBmyhs
 ZSBRMMkOEVTvNA5piY3eJ/48LnInxN/1RJRyWnJVte8KdickR8i8zmFoUOIh92ftyG
 DSWaZV2r9OsSyE+8vj51B+CQiC76XaZ1fo8mfqCd8hnXw90CEKRooHTFuKrIxt8MWZ
 yr7y0hxBNwKBA==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/vmwgfx: Cleanup the cursor snooping code
Date: Tue, 25 Oct 2022 23:19:36 -0400
Message-Id: <20221026031936.1004280-2-zack@kde.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221026031936.1004280-1-zack@kde.org>
References: <20221026031936.1004280-1-zack@kde.org>
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
Reply-To: Zack Rusin <zackr@vmware.com>
Cc: krastevm@vmware.com, banackm@vmware.com, mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

Cursor snooping depended on implicit size and format which made debugging
quite difficult. Make the code easier to following by making everything
explicit and instead of using magic numbers predefine all the
parameters the code depends on.

Also fixes incorrectly computed pitches for non-aligned cursor snoops.
Fix which has no practical effect because non-aligned cursor snoops
are not used by the X11 driver and Wayland cursors will go through
mob cursors, instead of surface dma's.

Signed-off-by: Zack Rusin <zackr@vmware.com>
Reviewed-by: Michael Banack <banackm@vmware.com>
Reviewed-by: Martin Krastev <krastevm@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h     |  4 ++++
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c     | 29 +++++++++++++++----------
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c | 14 +++++++-----
 3 files changed, 30 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index 4eb7339dd121..b062b020b378 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -98,6 +98,10 @@
 #define VMW_RES_SHADER ttm_driver_type4
 #define VMW_RES_HT_ORDER 12
 
+#define VMW_CURSOR_SNOOP_FORMAT SVGA3D_A8R8G8B8
+#define VMW_CURSOR_SNOOP_WIDTH 64
+#define VMW_CURSOR_SNOOP_HEIGHT 64
+
 #define MKSSTAT_CAPACITY_LOG2 5U
 #define MKSSTAT_CAPACITY (1U << MKSSTAT_CAPACITY_LOG2)
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index d434b6ae1092..257f090071f1 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -25,6 +25,9 @@
  *
  **************************************************************************/
 
+#include "vmwgfx_kms.h"
+#include "vmw_surface_cache.h"
+
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_damage_helper.h>
@@ -32,8 +35,6 @@
 #include <drm/drm_rect.h>
 #include <drm/drm_sysfs.h>
 
-#include "vmwgfx_kms.h"
-
 void vmw_du_cleanup(struct vmw_display_unit *du)
 {
 	struct vmw_private *dev_priv = vmw_priv(du->primary.dev);
@@ -351,7 +352,6 @@ static void vmw_cursor_update_position(struct vmw_private *dev_priv,
 	spin_unlock(&dev_priv->cursor_lock);
 }
 
-
 void vmw_kms_cursor_snoop(struct vmw_surface *srf,
 			  struct ttm_object_file *tfile,
 			  struct ttm_buffer_object *bo,
@@ -369,6 +369,9 @@ void vmw_kms_cursor_snoop(struct vmw_surface *srf,
 		SVGA3dCmdSurfaceDMA dma;
 	} *cmd;
 	int i, ret;
+	const struct SVGA3dSurfaceDesc *desc =
+		vmw_surface_get_desc(VMW_CURSOR_SNOOP_FORMAT);
+	const u32 image_pitch = VMW_CURSOR_SNOOP_WIDTH * desc->pitchBytesPerBlock;
 
 	cmd = container_of(header, struct vmw_dma_cmd, header);
 
@@ -394,7 +397,7 @@ void vmw_kms_cursor_snoop(struct vmw_surface *srf,
 	    box->x != 0    || box->y != 0    || box->z != 0    ||
 	    box->srcx != 0 || box->srcy != 0 || box->srcz != 0 ||
 	    box->d != 1    || box_count != 1 ||
-	    box->w > 64 || box->h > 64) {
+	    box->w > VMW_CURSOR_SNOOP_WIDTH || box->h > VMW_CURSOR_SNOOP_HEIGHT) {
 		/* TODO handle none page aligned offsets */
 		/* TODO handle more dst & src != 0 */
 		/* TODO handle more then one copy */
@@ -408,7 +411,7 @@ void vmw_kms_cursor_snoop(struct vmw_surface *srf,
 	}
 
 	kmap_offset = cmd->dma.guest.ptr.offset >> PAGE_SHIFT;
-	kmap_num = (64*64*4) >> PAGE_SHIFT;
+	kmap_num = (VMW_CURSOR_SNOOP_HEIGHT*image_pitch) >> PAGE_SHIFT;
 
 	ret = ttm_bo_reserve(bo, true, false, NULL);
 	if (unlikely(ret != 0)) {
@@ -422,14 +425,15 @@ void vmw_kms_cursor_snoop(struct vmw_surface *srf,
 
 	virtual = ttm_kmap_obj_virtual(&map, &dummy);
 
-	if (box->w == 64 && cmd->dma.guest.pitch == 64*4) {
-		memcpy(srf->snooper.image, virtual, 64*64*4);
+	if (box->w == VMW_CURSOR_SNOOP_WIDTH && cmd->dma.guest.pitch == image_pitch) {
+		memcpy(srf->snooper.image, virtual,
+		       VMW_CURSOR_SNOOP_HEIGHT*image_pitch);
 	} else {
 		/* Image is unsigned pointer. */
 		for (i = 0; i < box->h; i++)
-			memcpy(srf->snooper.image + i * 64,
+			memcpy(srf->snooper.image + i * image_pitch,
 			       virtual + i * cmd->dma.guest.pitch,
-			       box->w * 4);
+			       box->w * desc->pitchBytesPerBlock);
 	}
 
 	srf->snooper.age++;
@@ -480,7 +484,8 @@ void vmw_kms_cursor_post_execbuf(struct vmw_private *dev_priv)
 		du->cursor_age = du->cursor_surface->snooper.age;
 		vmw_send_define_cursor_cmd(dev_priv,
 					   du->cursor_surface->snooper.image,
-					   64, 64,
+					   VMW_CURSOR_SNOOP_WIDTH,
+					   VMW_CURSOR_SNOOP_HEIGHT,
 					   du->hotspot_x + du->core_hotspot_x,
 					   du->hotspot_y + du->core_hotspot_y);
 	}
@@ -1806,7 +1811,7 @@ static struct drm_framebuffer *vmw_kms_fb_create(struct drm_device *dev,
 	if (IS_ERR(vfb)) {
 		ret = PTR_ERR(vfb);
 		goto err_out;
- 	}
+	}
 
 err_out:
 	/* vmw_user_lookup_handle takes one ref so does new_fb */
@@ -2326,7 +2331,7 @@ static int vmw_du_update_layout(struct vmw_private *dev_priv,
 			if (ret == -EDEADLK) {
 				drm_modeset_backoff(&ctx);
 				goto retry;
-      		}
+		}
 			goto out_fini;
 		}
 	}
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
index ace7ca150b03..3bc63ae768f3 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
@@ -815,11 +815,15 @@ int vmw_surface_define_ioctl(struct drm_device *dev, void *data,
 	res->backup_size = cur_bo_offset;
 	if (metadata->scanout &&
 	    metadata->num_sizes == 1 &&
-	    metadata->sizes[0].width == 64 &&
-	    metadata->sizes[0].height == 64 &&
-	    metadata->format == SVGA3D_A8R8G8B8) {
-
-		srf->snooper.image = kzalloc(64 * 64 * 4, GFP_KERNEL);
+	    metadata->sizes[0].width == VMW_CURSOR_SNOOP_WIDTH &&
+	    metadata->sizes[0].height == VMW_CURSOR_SNOOP_HEIGHT &&
+	    metadata->format == VMW_CURSOR_SNOOP_FORMAT) {
+		const struct SVGA3dSurfaceDesc *desc =
+			vmw_surface_get_desc(VMW_CURSOR_SNOOP_FORMAT);
+		const u32 cursor_size_bytes = VMW_CURSOR_SNOOP_WIDTH *
+					      VMW_CURSOR_SNOOP_HEIGHT *
+					      desc->pitchBytesPerBlock;
+		srf->snooper.image = kzalloc(cursor_size_bytes, GFP_KERNEL);
 		if (!srf->snooper.image) {
 			DRM_ERROR("Failed to allocate cursor_image\n");
 			ret = -ENOMEM;
-- 
2.34.1

