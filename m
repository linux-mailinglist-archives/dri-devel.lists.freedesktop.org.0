Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD4016AC4A
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 17:55:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 277696E580;
	Mon, 24 Feb 2020 16:54:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1558 seconds by postgrey-1.36 at gabe;
 Mon, 24 Feb 2020 14:33:33 UTC
Received: from Galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0C266E509
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 14:33:33 +0000 (UTC)
Received: from localhost ([127.0.0.1] helo=flow.W.breakpoint.cc)
 by Galois.linutronix.de with esmtp (Exim 4.80)
 (envelope-from <bigeasy@linutronix.de>)
 id 1j6EOS-0003oV-Mk; Mon, 24 Feb 2020 15:07:32 +0100
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: VMware Graphics <linux-graphics-maintainer@vmware.com>
Subject: [PATCH 2/2] drm/vmwgfx: Remove a few unused functions
Date: Mon, 24 Feb 2020 15:07:26 +0100
Message-Id: <20200224140726.1550689-2-bigeasy@linutronix.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200224140726.1550689-1-bigeasy@linutronix.de>
References: <20200224140726.1550689-1-bigeasy@linutronix.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 24 Feb 2020 16:54:53 +0000
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Thomas Gleixner <tglx@linutronix.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I noticed that there is a prototype for vmw_fifo_ping_host_locked() but
no function. Then I looked further and noticed more functions which are
not used anymore or functions protoypes which remained after the
function was removed.

Remove unused function (prototypes).

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h     | 15 -----
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c     | 81 -------------------------
 drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c | 31 ----------
 3 files changed, 127 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index 86b69397d166e..0df2f6bc00a9c 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -900,7 +900,6 @@ extern void vmw_fifo_commit(struct vmw_private *dev_priv, uint32_t bytes);
 extern void vmw_fifo_commit_flush(struct vmw_private *dev_priv, uint32_t bytes);
 extern int vmw_fifo_send_fence(struct vmw_private *dev_priv,
 			       uint32_t *seqno);
-extern void vmw_fifo_ping_host_locked(struct vmw_private *, uint32_t reason);
 extern void vmw_fifo_ping_host(struct vmw_private *dev_priv, uint32_t reason);
 extern bool vmw_fifo_have_3d(struct vmw_private *dev_priv);
 extern bool vmw_fifo_have_pitchlock(struct vmw_private *dev_priv);
@@ -947,7 +946,6 @@ extern struct ttm_placement vmw_mob_placement;
 extern struct ttm_placement vmw_mob_ne_placement;
 extern struct ttm_placement vmw_nonfixed_placement;
 extern struct ttm_bo_driver vmw_bo_driver;
-extern int vmw_dma_quiescent(struct drm_device *dev);
 extern int vmw_bo_map_dma(struct ttm_buffer_object *bo);
 extern void vmw_bo_unmap_dma(struct ttm_buffer_object *bo);
 extern const struct vmw_sg_table *
@@ -1085,8 +1083,6 @@ int vmw_fb_on(struct vmw_private *vmw_priv);
 
 int vmw_kms_init(struct vmw_private *dev_priv);
 int vmw_kms_close(struct vmw_private *dev_priv);
-int vmw_kms_save_vga(struct vmw_private *vmw_priv);
-int vmw_kms_restore_vga(struct vmw_private *vmw_priv);
 int vmw_kms_cursor_bypass_ioctl(struct drm_device *dev, void *data,
 				struct drm_file *file_priv);
 void vmw_kms_cursor_post_execbuf(struct vmw_private *dev_priv);
@@ -1139,7 +1135,6 @@ int vmw_overlay_init(struct vmw_private *dev_priv);
 int vmw_overlay_close(struct vmw_private *dev_priv);
 int vmw_overlay_ioctl(struct drm_device *dev, void *data,
 		      struct drm_file *file_priv);
-int vmw_overlay_stop_all(struct vmw_private *dev_priv);
 int vmw_overlay_resume_all(struct vmw_private *dev_priv);
 int vmw_overlay_pause_all(struct vmw_private *dev_priv);
 int vmw_overlay_claim(struct vmw_private *dev_priv, uint32_t *out);
@@ -1186,10 +1181,6 @@ extern void vmw_otables_takedown(struct vmw_private *dev_priv);
 
 extern const struct vmw_user_resource_conv *user_context_converter;
 
-extern int vmw_context_check(struct vmw_private *dev_priv,
-			     struct ttm_object_file *tfile,
-			     int id,
-			     struct vmw_resource **p_res);
 extern int vmw_context_define_ioctl(struct drm_device *dev, void *data,
 				    struct drm_file *file_priv);
 extern int vmw_extended_context_define_ioctl(struct drm_device *dev, void *data,
@@ -1219,7 +1210,6 @@ vmw_context_get_dx_query_mob(struct vmw_resource *ctx_res);
 
 extern const struct vmw_user_resource_conv *user_surface_converter;
 
-extern void vmw_surface_res_free(struct vmw_resource *res);
 extern int vmw_surface_destroy_ioctl(struct drm_device *dev, void *data,
 				     struct drm_file *file_priv);
 extern int vmw_surface_define_ioctl(struct drm_device *dev, void *data,
@@ -1230,11 +1220,6 @@ extern int vmw_gb_surface_define_ioctl(struct drm_device *dev, void *data,
 				       struct drm_file *file_priv);
 extern int vmw_gb_surface_reference_ioctl(struct drm_device *dev, void *data,
 					  struct drm_file *file_priv);
-extern int vmw_surface_check(struct vmw_private *dev_priv,
-			     struct ttm_object_file *tfile,
-			     uint32_t handle, int *id);
-extern int vmw_surface_validate(struct vmw_private *dev_priv,
-				struct vmw_surface *srf);
 int vmw_surface_gb_priv_define(struct drm_device *dev,
 			       uint32_t user_accounting_size,
 			       SVGA3dSurfaceAllFlags svga3d_flags,
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index f47d5710cc951..dbd80fcf0c6aa 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -1897,87 +1897,6 @@ int vmw_kms_write_svga(struct vmw_private *vmw_priv,
 	return 0;
 }
 
-int vmw_kms_save_vga(struct vmw_private *vmw_priv)
-{
-	struct vmw_vga_topology_state *save;
-	uint32_t i;
-
-	vmw_priv->vga_width = vmw_read(vmw_priv, SVGA_REG_WIDTH);
-	vmw_priv->vga_height = vmw_read(vmw_priv, SVGA_REG_HEIGHT);
-	vmw_priv->vga_bpp = vmw_read(vmw_priv, SVGA_REG_BITS_PER_PIXEL);
-	if (vmw_priv->capabilities & SVGA_CAP_PITCHLOCK)
-		vmw_priv->vga_pitchlock =
-		  vmw_read(vmw_priv, SVGA_REG_PITCHLOCK);
-	else if (vmw_fifo_have_pitchlock(vmw_priv))
-		vmw_priv->vga_pitchlock = vmw_mmio_read(vmw_priv->mmio_virt +
-							SVGA_FIFO_PITCHLOCK);
-
-	if (!(vmw_priv->capabilities & SVGA_CAP_DISPLAY_TOPOLOGY))
-		return 0;
-
-	vmw_priv->num_displays = vmw_read(vmw_priv,
-					  SVGA_REG_NUM_GUEST_DISPLAYS);
-
-	if (vmw_priv->num_displays == 0)
-		vmw_priv->num_displays = 1;
-
-	for (i = 0; i < vmw_priv->num_displays; ++i) {
-		save = &vmw_priv->vga_save[i];
-		vmw_write(vmw_priv, SVGA_REG_DISPLAY_ID, i);
-		save->primary = vmw_read(vmw_priv, SVGA_REG_DISPLAY_IS_PRIMARY);
-		save->pos_x = vmw_read(vmw_priv, SVGA_REG_DISPLAY_POSITION_X);
-		save->pos_y = vmw_read(vmw_priv, SVGA_REG_DISPLAY_POSITION_Y);
-		save->width = vmw_read(vmw_priv, SVGA_REG_DISPLAY_WIDTH);
-		save->height = vmw_read(vmw_priv, SVGA_REG_DISPLAY_HEIGHT);
-		vmw_write(vmw_priv, SVGA_REG_DISPLAY_ID, SVGA_ID_INVALID);
-		if (i == 0 && vmw_priv->num_displays == 1 &&
-		    save->width == 0 && save->height == 0) {
-
-			/*
-			 * It should be fairly safe to assume that these
-			 * values are uninitialized.
-			 */
-
-			save->width = vmw_priv->vga_width - save->pos_x;
-			save->height = vmw_priv->vga_height - save->pos_y;
-		}
-	}
-
-	return 0;
-}
-
-int vmw_kms_restore_vga(struct vmw_private *vmw_priv)
-{
-	struct vmw_vga_topology_state *save;
-	uint32_t i;
-
-	vmw_write(vmw_priv, SVGA_REG_WIDTH, vmw_priv->vga_width);
-	vmw_write(vmw_priv, SVGA_REG_HEIGHT, vmw_priv->vga_height);
-	vmw_write(vmw_priv, SVGA_REG_BITS_PER_PIXEL, vmw_priv->vga_bpp);
-	if (vmw_priv->capabilities & SVGA_CAP_PITCHLOCK)
-		vmw_write(vmw_priv, SVGA_REG_PITCHLOCK,
-			  vmw_priv->vga_pitchlock);
-	else if (vmw_fifo_have_pitchlock(vmw_priv))
-		vmw_mmio_write(vmw_priv->vga_pitchlock,
-			       vmw_priv->mmio_virt + SVGA_FIFO_PITCHLOCK);
-
-	if (!(vmw_priv->capabilities & SVGA_CAP_DISPLAY_TOPOLOGY))
-		return 0;
-
-	for (i = 0; i < vmw_priv->num_displays; ++i) {
-		save = &vmw_priv->vga_save[i];
-		vmw_write(vmw_priv, SVGA_REG_DISPLAY_ID, i);
-		vmw_write(vmw_priv, SVGA_REG_DISPLAY_IS_PRIMARY, save->primary);
-		vmw_write(vmw_priv, SVGA_REG_DISPLAY_POSITION_X, save->pos_x);
-		vmw_write(vmw_priv, SVGA_REG_DISPLAY_POSITION_Y, save->pos_y);
-		vmw_write(vmw_priv, SVGA_REG_DISPLAY_WIDTH, save->width);
-		vmw_write(vmw_priv, SVGA_REG_DISPLAY_HEIGHT, save->height);
-		vmw_write(vmw_priv, SVGA_REG_DISPLAY_ID, SVGA_ID_INVALID);
-	}
-
-	return 0;
-}
-
 bool vmw_kms_validate_mode_vram(struct vmw_private *dev_priv,
 				uint32_t pitch,
 				uint32_t height)
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c b/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c
index fdb52f6d29fb1..cd7ed1650d60c 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c
@@ -353,37 +353,6 @@ static int vmw_overlay_update_stream(struct vmw_private *dev_priv,
 	return 0;
 }
 
-/**
- * Stop all streams.
- *
- * Used by the fb code when starting.
- *
- * Takes the overlay lock.
- */
-int vmw_overlay_stop_all(struct vmw_private *dev_priv)
-{
-	struct vmw_overlay *overlay = dev_priv->overlay_priv;
-	int i, ret;
-
-	if (!overlay)
-		return 0;
-
-	mutex_lock(&overlay->mutex);
-
-	for (i = 0; i < VMW_MAX_NUM_STREAMS; i++) {
-		struct vmw_stream *stream = &overlay->stream[i];
-		if (!stream->buf)
-			continue;
-
-		ret = vmw_overlay_stop(dev_priv, i, false, false);
-		WARN_ON(ret != 0);
-	}
-
-	mutex_unlock(&overlay->mutex);
-
-	return 0;
-}
-
 /**
  * Try to resume all paused streams.
  *
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
