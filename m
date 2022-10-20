Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC37605603
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 05:42:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 793C410E2FD;
	Thu, 20 Oct 2022 03:42:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F9CF10E2DE
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 03:41:49 +0000 (UTC)
Received: from vertex.vmware.com (pool-173-49-113-140.phlapa.fios.verizon.net
 [173.49.113.140]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id 68EAC33EF60;
 Thu, 20 Oct 2022 04:41:47 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1666237307; bh=U/ixmqXEsYm9uI4/0DUw4kcOXE6LPBr34a2RxYEzcIU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OKhBcELe7o2hO30Ko1zhoVSLmGcN8SnnnWTZLOjfoRrX75AYXEiAlK0cUnqO+xnOb
 d1zQxTxKEiJuMU+PRfcXgXjsKmfdNW+hvhcMeBmhuWXgfRTt7epMBSavogIRs6Gph7
 fj4/xImvXx4FoLaPqq5aMAPyqTZkLwZ/Kek2Sp3T6eR2IMrbyprtHiD0/ScTJH1RKv
 IiNlJq2y96X7nesPCH3wFIclQULAB8MM2I8BGIabFV+CE/6jCE2AGwxZbHPETm14ul
 gk9kufonB5Xpu1IFacUudVyAmWpfOhgw94GrRLYkfZS36m1Tqs/0b+GIkeqYHcjr5Z
 5hUiYhDBHXzlg==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 14/16] drm/vmwgfx: Remove explicit and broken vblank
 handling
Date: Wed, 19 Oct 2022 23:41:29 -0400
Message-Id: <20221020034131.491973-15-zack@kde.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020034131.491973-1-zack@kde.org>
References: <20221020034131.491973-1-zack@kde.org>
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

The explicit vblank handling was never finished. The driver never had
the full implementation of vblank and what was there is emulated
by DRM when the driver doesn't pretend to be implementing it itself.

Let DRM handle the vblank emulation and stop pretending the driver is
doing anything special with vblank. In the future it would make sense
to implement helpers for full vblank handling because vkms and
amdgpu_vkms already have that code. Exporting it to common helpers and
having all three drivers share it would make sense (that would be largely
just to allow more of igt to run).

Signed-off-by: Zack Rusin <zackr@vmware.com>
Reviewed-by: Maaz Mombasawala <mombasawalam@vmware.com>
Reviewed-by: Martin Krastev <krastevm@vmware.com>
Reviewed-by: Michael Banack <banackm@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h  |  3 ---
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c  | 34 ----------------------------
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c  |  8 -------
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c | 31 +------------------------
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c | 26 ---------------------
 5 files changed, 1 insertion(+), 101 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index ad470e54d586..4eb7339dd121 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -1208,9 +1208,6 @@ int vmw_kms_write_svga(struct vmw_private *vmw_priv,
 bool vmw_kms_validate_mode_vram(struct vmw_private *dev_priv,
 				uint32_t pitch,
 				uint32_t height);
-u32 vmw_get_vblank_counter(struct drm_crtc *crtc);
-int vmw_enable_vblank(struct drm_crtc *crtc);
-void vmw_disable_vblank(struct drm_crtc *crtc);
 int vmw_kms_present(struct vmw_private *dev_priv,
 		    struct drm_file *file_priv,
 		    struct vmw_framebuffer *vfb,
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index 3153e3b4c8fc..36c98ba3c87e 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -31,7 +31,6 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_rect.h>
 #include <drm/drm_sysfs.h>
-#include <drm/drm_vblank.h>
 
 #include "vmwgfx_kms.h"
 
@@ -981,15 +980,6 @@ void vmw_du_crtc_atomic_begin(struct drm_crtc *crtc,
 void vmw_du_crtc_atomic_flush(struct drm_crtc *crtc,
 			      struct drm_atomic_state *state)
 {
-	struct drm_pending_vblank_event *event = crtc->state->event;
-
-	if (event) {
-		crtc->state->event = NULL;
-
-		spin_lock_irq(&crtc->dev->event_lock);
-		drm_crtc_send_vblank_event(crtc, event);
-		spin_unlock_irq(&crtc->dev->event_lock);
-	}
 }
 
 
@@ -2305,30 +2295,6 @@ bool vmw_kms_validate_mode_vram(struct vmw_private *dev_priv,
 		 dev_priv->max_primary_mem : dev_priv->vram_size);
 }
 
-
-/*
- * Function called by DRM code called with vbl_lock held.
- */
-u32 vmw_get_vblank_counter(struct drm_crtc *crtc)
-{
-	return 0;
-}
-
-/*
- * Function called by DRM code called with vbl_lock held.
- */
-int vmw_enable_vblank(struct drm_crtc *crtc)
-{
-	return -EINVAL;
-}
-
-/*
- * Function called by DRM code called with vbl_lock held.
- */
-void vmw_disable_vblank(struct drm_crtc *crtc)
-{
-}
-
 /**
  * vmw_du_update_layout - Update the display unit with topology from resolution
  * plugin and generate DRM uevent
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
index b8761f16dd78..a56e5d0ca3c6 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
@@ -28,7 +28,6 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_fourcc.h>
-#include <drm/drm_vblank.h>
 
 #include "vmwgfx_kms.h"
 
@@ -235,9 +234,6 @@ static const struct drm_crtc_funcs vmw_legacy_crtc_funcs = {
 	.atomic_duplicate_state = vmw_du_crtc_duplicate_state,
 	.atomic_destroy_state = vmw_du_crtc_destroy_state,
 	.set_config = drm_atomic_helper_set_config,
-	.get_vblank_counter = vmw_get_vblank_counter,
-	.enable_vblank = vmw_enable_vblank,
-	.disable_vblank = vmw_disable_vblank,
 };
 
 
@@ -507,10 +503,6 @@ int vmw_kms_ldu_init_display(struct vmw_private *dev_priv)
 	dev_priv->ldu_priv->last_num_active = 0;
 	dev_priv->ldu_priv->fb = NULL;
 
-	ret = drm_vblank_init(dev, num_display_units);
-	if (ret != 0)
-		goto err_free;
-
 	vmw_kms_create_implicit_placement_property(dev_priv);
 
 	for (i = 0; i < num_display_units; ++i) {
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c b/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
index ecd3c2fc978b..8db61c541a80 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
@@ -29,7 +29,6 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_fourcc.h>
-#include <drm/drm_vblank.h>
 
 #include "vmwgfx_kms.h"
 
@@ -320,9 +319,6 @@ static const struct drm_crtc_funcs vmw_screen_object_crtc_funcs = {
 	.atomic_destroy_state = vmw_du_crtc_destroy_state,
 	.set_config = drm_atomic_helper_set_config,
 	.page_flip = drm_atomic_helper_page_flip,
-	.get_vblank_counter = vmw_get_vblank_counter,
-	.enable_vblank = vmw_enable_vblank,
-	.disable_vblank = vmw_disable_vblank,
 };
 
 /*
@@ -730,7 +726,6 @@ vmw_sou_primary_plane_atomic_update(struct drm_plane *plane,
 	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state, plane);
 	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state, plane);
 	struct drm_crtc *crtc = new_state->crtc;
-	struct drm_pending_vblank_event *event = NULL;
 	struct vmw_fence_obj *fence = NULL;
 	int ret;
 
@@ -754,24 +749,6 @@ vmw_sou_primary_plane_atomic_update(struct drm_plane *plane,
 		return;
 	}
 
-	/* For error case vblank event is send from vmw_du_crtc_atomic_flush */
-	event = crtc->state->event;
-	if (event && fence) {
-		struct drm_file *file_priv = event->base.file_priv;
-
-		ret = vmw_event_fence_action_queue(file_priv,
-						   fence,
-						   &event->base,
-						   &event->event.vbl.tv_sec,
-						   &event->event.vbl.tv_usec,
-						   true);
-
-		if (unlikely(ret != 0))
-			DRM_ERROR("Failed to queue event on fence.\n");
-		else
-			crtc->state->event = NULL;
-	}
-
 	if (fence)
 		vmw_fence_obj_unreference(&fence);
 }
@@ -947,18 +924,12 @@ static int vmw_sou_init(struct vmw_private *dev_priv, unsigned unit)
 int vmw_kms_sou_init_display(struct vmw_private *dev_priv)
 {
 	struct drm_device *dev = &dev_priv->drm;
-	int i, ret;
+	int i;
 
 	if (!(dev_priv->capabilities & SVGA_CAP_SCREEN_OBJECT_2)) {
 		return -ENOSYS;
 	}
 
-	ret = -ENOMEM;
-
-	ret = drm_vblank_init(dev, VMWGFX_NUM_DISPLAY_UNITS);
-	if (unlikely(ret != 0))
-		return ret;
-
 	for (i = 0; i < VMWGFX_NUM_DISPLAY_UNITS; ++i)
 		vmw_sou_init(dev_priv, i);
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
index 8650c3aea8f0..0090abe89254 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
@@ -29,7 +29,6 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_fourcc.h>
-#include <drm/drm_vblank.h>
 
 #include "vmwgfx_kms.h"
 #include "vmw_surface_cache.h"
@@ -925,9 +924,6 @@ static const struct drm_crtc_funcs vmw_stdu_crtc_funcs = {
 	.atomic_destroy_state = vmw_du_crtc_destroy_state,
 	.set_config = drm_atomic_helper_set_config,
 	.page_flip = drm_atomic_helper_page_flip,
-	.get_vblank_counter = vmw_get_vblank_counter,
-	.enable_vblank = vmw_enable_vblank,
-	.disable_vblank = vmw_disable_vblank,
 };
 
 
@@ -1591,7 +1587,6 @@ vmw_stdu_primary_plane_atomic_update(struct drm_plane *plane,
 	struct vmw_plane_state *vps = vmw_plane_state_to_vps(new_state);
 	struct drm_crtc *crtc = new_state->crtc;
 	struct vmw_screen_target_display_unit *stdu;
-	struct drm_pending_vblank_event *event;
 	struct vmw_fence_obj *fence = NULL;
 	struct vmw_private *dev_priv;
 	int ret;
@@ -1640,23 +1635,6 @@ vmw_stdu_primary_plane_atomic_update(struct drm_plane *plane,
 		return;
 	}
 
-	/* In case of error, vblank event is send in vmw_du_crtc_atomic_flush */
-	event = crtc->state->event;
-	if (event && fence) {
-		struct drm_file *file_priv = event->base.file_priv;
-
-		ret = vmw_event_fence_action_queue(file_priv,
-						   fence,
-						   &event->base,
-						   &event->event.vbl.tv_sec,
-						   &event->event.vbl.tv_usec,
-						   true);
-		if (ret)
-			DRM_ERROR("Failed to queue event on fence.\n");
-		else
-			crtc->state->event = NULL;
-	}
-
 	if (fence)
 		vmw_fence_obj_unreference(&fence);
 }
@@ -1883,10 +1861,6 @@ int vmw_kms_stdu_init_display(struct vmw_private *dev_priv)
 	if (!(dev_priv->capabilities & SVGA_CAP_GBOBJECTS))
 		return -ENOSYS;
 
-	ret = drm_vblank_init(dev, VMWGFX_NUM_DISPLAY_UNITS);
-	if (unlikely(ret != 0))
-		return ret;
-
 	dev_priv->active_display_unit = vmw_du_screen_target;
 
 	for (i = 0; i < VMWGFX_NUM_DISPLAY_UNITS; ++i) {
-- 
2.34.1

