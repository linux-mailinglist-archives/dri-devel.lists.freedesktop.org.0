Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 348EC8A23F7
	for <lists+dri-devel@lfdr.de>; Fri, 12 Apr 2024 04:55:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CF5810EA64;
	Fri, 12 Apr 2024 02:55:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="WvLt6Cnn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C56910E145
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Apr 2024 02:55:25 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id
 d75a77b69052e-434c695ec3dso2404031cf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Apr 2024 19:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1712890524; x=1713495324;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fGKojFQEhsjedWxl5KhaG2UZ3+MbRWK8yTqEnsXfBUQ=;
 b=WvLt6Cnn12GrSlGk6Mimw+C9ODgS9HwG8l2BgbTBDZfApprgIRkO+tipJG/afpvzzj
 SpAFoZUMySge8tqKHcfXCAsA4OTk91vcAjAoHR0+7XwpraOp8WTyX+8lNdbDFGpAfkni
 Udm7QaIXPYxZTWMz8jqU+VelV3neooLubNLh0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712890524; x=1713495324;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fGKojFQEhsjedWxl5KhaG2UZ3+MbRWK8yTqEnsXfBUQ=;
 b=I03W4hKTqkGdnCDBMY9q/O/YGIlKTok/Ww5bxjhTlfaCSgt5+bGEVt4cHBD0CRYAcZ
 +WsunUDH0IOKhG77v6dZxHtiycZ2/XIYm1PN0hEweDV356M0BWkj7m0fUzlpqQ42YBTT
 u6VqFQvvDjEDJZVfbmyYb0Uh6FMwhwy8RYxQVchi/YviQ7UR6VSKi2ZLEQ+Rsf5gpHgw
 j7qcufgo7GaA0+zAKdPc45GZ/6AvXP2MJX8YLZcxBX6DHF0IyECwYMNnR/1GTD4D+zAK
 2PVx73eFzLaVJUCxk12I0hRzcLfhyJctEzteIEFIkdEvJnwsULfcd7xjB26GZ7gKZPRc
 wHNA==
X-Gm-Message-State: AOJu0YyP/x+LgEM+y8QYAAgivRJS/Gk5cpnW+olrHehXdB7Fx5Jjl1P+
 9c0D8wk8D0Ki8/qXawDKEs6nyzCkyntrQQBcuI6dsGBhm2D8hLSekw96Sq97aKi7LJkdLWa+8rf
 ad3xHJ4KzCx0MnWoBXpzL6vZYkBy0hlBHUr2Njs7Szcv4gl8lhwR24iuY8oqKQrEoLVYV8HHoK9
 M1QIusvTZsz18KAHXlVnxMFmkdFLCpg+Q8i7EkqNNVsGgq2XCFQw==
X-Google-Smtp-Source: AGHT+IElIZ4N5bwJ43r2NoFXp9cuMfZ67sSVJ5MObXkXRniYp+6Jj3v2pKTqhHhrmrTdR/Wra8wn7w==
X-Received: by 2002:a05:622a:24b:b0:434:3ee2:8e3c with SMTP id
 c11-20020a05622a024b00b004343ee28e3cmr1534320qtx.29.1712890523722; 
 Thu, 11 Apr 2024 19:55:23 -0700 (PDT)
Received: from vertex.vmware.com (pool-173-49-113-140.phlapa.fios.verizon.net.
 [173.49.113.140]) by smtp.gmail.com with ESMTPSA id
 t12-20020ac865cc000000b00434ab3072b0sm1682174qto.40.2024.04.11.19.55.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Apr 2024 19:55:23 -0700 (PDT)
From: Zack Rusin <zack.rusin@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, ian.forbes@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH v2 2/5] drm/vmwgfx: Implement virtual crc generation
Date: Thu, 11 Apr 2024 22:55:08 -0400
Message-Id: <20240412025511.78553-3-zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240412025511.78553-1-zack.rusin@broadcom.com>
References: <20240412025511.78553-1-zack.rusin@broadcom.com>
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

crc checksums are used to validate the output. Normally they're part
of the actual display hardware but on virtual stack there's nothing
to automatically generate them.

Implement crc generation for the vmwgfx stack. This works only on
screen targets, where it's possibly to easily make sure that the
guest side contents of the surface matches the host sides output.

Just like the vblank support, crc generation can only be enabled via:
guestinfo.vmwgfx.vkms_enable = "TRUE"
option in the vmx file.

Makes IGT's kms_pipe_crc_basic pass and allows a huge number of other
IGT tests which require CRC generation of the output to actually run
on vmwgfx. Makes it possible to actually validate a lof of the kms and
drm functionality with vmwgfx.

Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c      |   1 +
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h      |   2 +
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c      |  31 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h      |  15 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c |  32 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c     |  22 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c     | 457 ++++++++++++++++++++++-
 drivers/gpu/drm/vmwgfx/vmwgfx_vkms.h     |  28 +-
 8 files changed, 553 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index e34c48fd25d4..89d3679d2608 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -1198,6 +1198,7 @@ static void vmw_driver_unload(struct drm_device *dev)
 
 	vmw_svga_disable(dev_priv);
 
+	vmw_vkms_cleanup(dev_priv);
 	vmw_kms_close(dev_priv);
 	vmw_overlay_close(dev_priv);
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index 4f5d7d13c4aa..ddbceaa31b59 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -616,6 +616,7 @@ struct vmw_private {
 	uint32 *devcaps;
 
 	bool vkms_enabled;
+	struct workqueue_struct *crc_workq;
 
 	/*
 	 * mksGuestStat instance-descriptor and pid arrays
@@ -811,6 +812,7 @@ void vmw_resource_mob_attach(struct vmw_resource *res);
 void vmw_resource_mob_detach(struct vmw_resource *res);
 void vmw_resource_dirty_update(struct vmw_resource *res, pgoff_t start,
 			       pgoff_t end);
+int vmw_resource_clean(struct vmw_resource *res);
 int vmw_resources_clean(struct vmw_bo *vbo, pgoff_t start,
 			pgoff_t end, pgoff_t *num_prefault);
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index e763cf0e6cfc..e33e5993d8fc 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -40,14 +40,14 @@
 
 void vmw_du_init(struct vmw_display_unit *du)
 {
-	hrtimer_init(&du->vkms.timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-	du->vkms.timer.function = &vmw_vkms_vblank_simulate;
+	vmw_vkms_crtc_init(&du->crtc);
 }
 
 void vmw_du_cleanup(struct vmw_display_unit *du)
 {
 	struct vmw_private *dev_priv = vmw_priv(du->primary.dev);
-	hrtimer_cancel(&du->vkms.timer);
+
+	vmw_vkms_crtc_cleanup(&du->crtc);
 	drm_plane_cleanup(&du->primary);
 	if (vmw_cmd_supported(dev_priv))
 		drm_plane_cleanup(&du->cursor.base);
@@ -963,6 +963,7 @@ int vmw_du_crtc_atomic_check(struct drm_crtc *crtc,
 void vmw_du_crtc_atomic_begin(struct drm_crtc *crtc,
 			      struct drm_atomic_state *state)
 {
+	vmw_vkms_crtc_atomic_begin(crtc, state);
 }
 
 /**
@@ -2029,6 +2030,29 @@ vmw_kms_create_hotplug_mode_update_property(struct vmw_private *dev_priv)
 					  "hotplug_mode_update", 0, 1);
 }
 
+static void
+vmw_atomic_commit_tail(struct drm_atomic_state *old_state)
+{
+	struct vmw_private *vmw = vmw_priv(old_state->dev);
+	struct drm_crtc *crtc;
+	struct drm_crtc_state *old_crtc_state;
+	int i;
+
+	drm_atomic_helper_commit_tail(old_state);
+
+	if (vmw->vkms_enabled) {
+		for_each_old_crtc_in_state(old_state, crtc, old_crtc_state, i) {
+			struct vmw_display_unit *du = vmw_crtc_to_du(crtc);
+			(void)old_crtc_state;
+			flush_work(&du->vkms.crc_generator_work);
+		}
+	}
+}
+
+static const struct drm_mode_config_helper_funcs vmw_mode_config_helpers = {
+	.atomic_commit_tail = vmw_atomic_commit_tail,
+};
+
 int vmw_kms_init(struct vmw_private *dev_priv)
 {
 	struct drm_device *dev = &dev_priv->drm;
@@ -2048,6 +2072,7 @@ int vmw_kms_init(struct vmw_private *dev_priv)
 	dev->mode_config.max_width = dev_priv->texture_max_width;
 	dev->mode_config.max_height = dev_priv->texture_max_height;
 	dev->mode_config.preferred_depth = dev_priv->assume_16bpp ? 16 : 32;
+	dev->mode_config.helper_private = &vmw_mode_config_helpers;
 
 	drm_mode_create_suggested_offset_properties(dev);
 	vmw_kms_create_hotplug_mode_update_property(dev_priv);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
index 9e83a1553286..bf9931e3a728 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
@@ -378,9 +378,22 @@ struct vmw_display_unit {
 	int set_gui_y;
 
 	struct {
+		struct work_struct crc_generator_work;
 		struct hrtimer timer;
 		ktime_t period_ns;
-		struct drm_pending_vblank_event *event;
+
+		/* protects concurrent access to the vblank handler */
+		atomic_t atomic_lock;
+		/* protected by @atomic_lock */
+		bool crc_enabled;
+		struct vmw_surface *surface;
+
+		/* protects concurrent access to the crc worker */
+		spinlock_t crc_state_lock;
+		/* protected by @crc_state_lock */
+		bool crc_pending;
+		u64 frame_start;
+		u64 frame_end;
 	} vkms;
 };
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
index ca300c7427d2..848dba09981b 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
@@ -1064,6 +1064,22 @@ void vmw_resource_dirty_update(struct vmw_resource *res, pgoff_t start,
 					   end << PAGE_SHIFT);
 }
 
+int vmw_resource_clean(struct vmw_resource *res)
+{
+	int ret = 0;
+
+	if (res->res_dirty) {
+		if (!res->func->clean)
+			return -EINVAL;
+
+		ret = res->func->clean(res);
+		if (ret)
+			return ret;
+		res->res_dirty = false;
+	}
+	return ret;
+}
+
 /**
  * vmw_resources_clean - Clean resources intersecting a mob range
  * @vbo: The mob buffer object
@@ -1080,6 +1096,7 @@ int vmw_resources_clean(struct vmw_bo *vbo, pgoff_t start,
 	unsigned long res_start = start << PAGE_SHIFT;
 	unsigned long res_end = end << PAGE_SHIFT;
 	unsigned long last_cleaned = 0;
+	int ret;
 
 	/*
 	 * Find the resource with lowest backup_offset that intersects the
@@ -1106,18 +1123,9 @@ int vmw_resources_clean(struct vmw_bo *vbo, pgoff_t start,
 	 * intersecting the range.
 	 */
 	while (found) {
-		if (found->res_dirty) {
-			int ret;
-
-			if (!found->func->clean)
-				return -EINVAL;
-
-			ret = found->func->clean(found);
-			if (ret)
-				return ret;
-
-			found->res_dirty = false;
-		}
+		ret = vmw_resource_clean(found);
+		if (ret)
+			return ret;
 		last_cleaned = found->guest_memory_offset + found->guest_memory_size;
 		cur = rb_next(&found->mob_node);
 		if (!cur)
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
index 665bde7e0be0..2041c4d48daa 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
@@ -409,11 +409,6 @@ static void vmw_stdu_crtc_mode_set_nofb(struct drm_crtc *crtc)
 			  crtc->x, crtc->y);
 }
 
-
-static void vmw_stdu_crtc_helper_prepare(struct drm_crtc *crtc)
-{
-}
-
 static void vmw_stdu_crtc_atomic_disable(struct drm_crtc *crtc,
 					 struct drm_atomic_state *state)
 {
@@ -783,6 +778,9 @@ static const struct drm_crtc_funcs vmw_stdu_crtc_funcs = {
 	.enable_vblank		= vmw_vkms_enable_vblank,
 	.disable_vblank		= vmw_vkms_disable_vblank,
 	.get_vblank_timestamp	= vmw_vkms_get_vblank_timestamp,
+	.get_crc_sources	= vmw_vkms_get_crc_sources,
+	.set_crc_source		= vmw_vkms_set_crc_source,
+	.verify_crc_source	= vmw_vkms_verify_crc_source,
 };
 
 
@@ -1414,6 +1412,17 @@ vmw_stdu_primary_plane_atomic_update(struct drm_plane *plane,
 		vmw_fence_obj_unreference(&fence);
 }
 
+static void
+vmw_stdu_crtc_atomic_flush(struct drm_crtc *crtc,
+			   struct drm_atomic_state *state)
+{
+	struct vmw_private *vmw = vmw_priv(crtc->dev);
+	struct vmw_screen_target_display_unit *stdu = vmw_crtc_to_stdu(crtc);
+
+	if (vmw->vkms_enabled)
+		vmw_vkms_set_crc_surface(crtc, stdu->display_srf);
+	vmw_vkms_crtc_atomic_flush(crtc, state);
+}
 
 static const struct drm_plane_funcs vmw_stdu_plane_funcs = {
 	.update_plane = drm_atomic_helper_update_plane,
@@ -1454,11 +1463,10 @@ drm_plane_helper_funcs vmw_stdu_primary_plane_helper_funcs = {
 };
 
 static const struct drm_crtc_helper_funcs vmw_stdu_crtc_helper_funcs = {
-	.prepare = vmw_stdu_crtc_helper_prepare,
 	.mode_set_nofb = vmw_stdu_crtc_mode_set_nofb,
 	.atomic_check = vmw_du_crtc_atomic_check,
 	.atomic_begin = vmw_du_crtc_atomic_begin,
-	.atomic_flush = vmw_vkms_crtc_atomic_flush,
+	.atomic_flush = vmw_stdu_crtc_atomic_flush,
 	.atomic_enable = vmw_vkms_crtc_atomic_enable,
 	.atomic_disable = vmw_stdu_crtc_atomic_disable,
 };
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c
index ff76bfd70f91..7e93a45948f7 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c
@@ -28,33 +28,179 @@
 
 #include "vmwgfx_vkms.h"
 
+#include "vmwgfx_bo.h"
 #include "vmwgfx_drv.h"
 #include "vmwgfx_kms.h"
 #include "vmwgfx_vkms.h"
 
+#include "vmw_surface_cache.h"
+
 #include <drm/drm_crtc.h>
+#include <drm/drm_debugfs_crc.h>
 #include <drm/drm_print.h>
 #include <drm/drm_vblank.h>
 
+#include <linux/crc32.h>
+#include <linux/delay.h>
+
 #define GUESTINFO_VBLANK  "guestinfo.vmwgfx.vkms_enable"
 
-enum hrtimer_restart
+static int
+vmw_surface_sync(struct vmw_private *vmw,
+		 struct vmw_surface *surf)
+{
+	int ret;
+	struct vmw_fence_obj *fence = NULL;
+	struct vmw_bo *bo = surf->res.guest_memory_bo;
+
+	vmw_resource_clean(&surf->res);
+
+	ret = ttm_bo_reserve(&bo->tbo, false, false, NULL);
+	if (ret != 0) {
+		drm_warn(&vmw->drm, "%s: failed reserve\n", __func__);
+		goto done;
+	}
+
+	ret = vmw_execbuf_fence_commands(NULL, vmw, &fence, NULL);
+	if (ret != 0) {
+		drm_warn(&vmw->drm, "%s: failed execbuf\n", __func__);
+		ttm_bo_unreserve(&bo->tbo);
+		goto done;
+	}
+
+	dma_fence_wait(&fence->base, false);
+	dma_fence_put(&fence->base);
+
+	ttm_bo_unreserve(&bo->tbo);
+done:
+	return ret;
+}
+
+static int
+compute_crc(struct drm_crtc *crtc,
+	    struct vmw_surface *surf,
+	    u32 *crc)
+{
+	u8 *mapped_surface;
+	struct vmw_bo *bo = surf->res.guest_memory_bo;
+	const struct SVGA3dSurfaceDesc *desc =
+		vmw_surface_get_desc(surf->metadata.format);
+	u32 row_pitch_bytes;
+	SVGA3dSize blocks;
+	u32 y;
+
+	*crc = 0;
+
+	vmw_surface_get_size_in_blocks(desc, &surf->metadata.base_size, &blocks);
+	row_pitch_bytes = blocks.width * desc->pitchBytesPerBlock;
+	WARN_ON(!bo);
+	mapped_surface = vmw_bo_map_and_cache(bo);
+
+	for (y = 0; y < blocks.height; y++) {
+		*crc = crc32_le(*crc, mapped_surface, row_pitch_bytes);
+		mapped_surface += row_pitch_bytes;
+	}
+
+	vmw_bo_unmap(bo);
+
+	return 0;
+}
+
+static void
+crc_generate_worker(struct work_struct *work)
+{
+	struct vmw_display_unit *du =
+		container_of(work, struct vmw_display_unit, vkms.crc_generator_work);
+	struct drm_crtc *crtc = &du->crtc;
+	struct vmw_private *vmw = vmw_priv(crtc->dev);
+	bool crc_pending;
+	u64 frame_start, frame_end;
+	u32 crc32 = 0;
+	struct vmw_surface *surf = 0;
+	int ret;
+
+	spin_lock_irq(&du->vkms.crc_state_lock);
+	crc_pending = du->vkms.crc_pending;
+	spin_unlock_irq(&du->vkms.crc_state_lock);
+
+	/*
+	 * We raced with the vblank hrtimer and previous work already computed
+	 * the crc, nothing to do.
+	 */
+	if (!crc_pending)
+		return;
+
+	spin_lock_irq(&du->vkms.crc_state_lock);
+	surf = du->vkms.surface;
+	spin_unlock_irq(&du->vkms.crc_state_lock);
+
+	if (vmw_surface_sync(vmw, surf)) {
+		drm_warn(crtc->dev, "CRC worker wasn't able to sync the crc surface!\n");
+		return;
+	}
+
+	ret = compute_crc(crtc, surf, &crc32);
+	if (ret)
+		return;
+
+	spin_lock_irq(&du->vkms.crc_state_lock);
+	frame_start = du->vkms.frame_start;
+	frame_end = du->vkms.frame_end;
+	crc_pending = du->vkms.crc_pending;
+	du->vkms.frame_start = 0;
+	du->vkms.frame_end = 0;
+	du->vkms.crc_pending = false;
+	spin_unlock_irq(&du->vkms.crc_state_lock);
+
+	/*
+	 * The worker can fall behind the vblank hrtimer, make sure we catch up.
+	 */
+	while (frame_start <= frame_end)
+		drm_crtc_add_crc_entry(crtc, true, frame_start++, &crc32);
+}
+
+static enum hrtimer_restart
 vmw_vkms_vblank_simulate(struct hrtimer *timer)
 {
 	struct vmw_display_unit *du = container_of(timer, struct vmw_display_unit, vkms.timer);
 	struct drm_crtc *crtc = &du->crtc;
+	struct vmw_private *vmw = vmw_priv(crtc->dev);
+	struct vmw_surface *surf = NULL;
 	u64 ret_overrun;
-	bool ret;
+	bool locked, ret;
 
 	ret_overrun = hrtimer_forward_now(&du->vkms.timer,
 					  du->vkms.period_ns);
 	if (ret_overrun != 1)
-		DRM_WARN("%s: vblank timer overrun\n", __func__);
+		drm_dbg_driver(crtc->dev, "vblank timer missed %lld frames.\n",
+			       ret_overrun - 1);
 
+	locked = vmw_vkms_vblank_trylock(crtc);
 	ret = drm_crtc_handle_vblank(crtc);
-	/* Don't queue timer again when vblank is disabled. */
-	if (!ret)
-		return HRTIMER_NORESTART;
+	WARN_ON(!ret);
+	if (!locked)
+		return HRTIMER_RESTART;
+	surf = du->vkms.surface;
+	vmw_vkms_unlock(crtc);
+
+	if (du->vkms.crc_enabled && surf) {
+		u64 frame = drm_crtc_accurate_vblank_count(crtc);
+
+		spin_lock(&du->vkms.crc_state_lock);
+		if (!du->vkms.crc_pending)
+			du->vkms.frame_start = frame;
+		else
+			drm_dbg_driver(crtc->dev,
+				       "crc worker falling behind, frame_start: %llu, frame_end: %llu\n",
+				       du->vkms.frame_start, frame);
+		du->vkms.frame_end = frame;
+		du->vkms.crc_pending = true;
+		spin_unlock(&du->vkms.crc_state_lock);
+
+		ret = queue_work(vmw->crc_workq, &du->vkms.crc_generator_work);
+		if (!ret)
+			drm_dbg_driver(crtc->dev, "Composer worker already queued\n");
+	}
 
 	return HRTIMER_RESTART;
 }
@@ -78,8 +224,21 @@ vmw_vkms_init(struct vmw_private *vmw)
 	if (!ret && vmw->vkms_enabled) {
 		ret = drm_vblank_init(&vmw->drm, VMWGFX_NUM_DISPLAY_UNITS);
 		vmw->vkms_enabled = (ret == 0);
-		drm_info(&vmw->drm, "vkms_enabled = %d\n", vmw->vkms_enabled);
 	}
+
+	vmw->crc_workq = alloc_ordered_workqueue("vmwgfx_crc_generator", 0);
+	if (!vmw->crc_workq) {
+		drm_warn(&vmw->drm, "crc workqueue allocation failed. Disabling vkms.");
+		vmw->vkms_enabled = false;
+	}
+	if (vmw->vkms_enabled)
+		drm_info(&vmw->drm, "VKMS enabled\n");
+}
+
+void
+vmw_vkms_cleanup(struct vmw_private *vmw)
+{
+	destroy_workqueue(vmw->crc_workq);
 }
 
 bool
@@ -133,6 +292,8 @@ vmw_vkms_enable_vblank(struct drm_crtc *crtc)
 
 	drm_calc_timestamping_constants(crtc, &crtc->mode);
 
+	hrtimer_init(&du->vkms.timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
+	du->vkms.timer.function = &vmw_vkms_vblank_simulate;
 	du->vkms.period_ns = ktime_set(0, vblank->framedur_ns);
 	hrtimer_start(&du->vkms.timer, du->vkms.period_ns, HRTIMER_MODE_REL);
 
@@ -148,7 +309,46 @@ vmw_vkms_disable_vblank(struct drm_crtc *crtc)
 	if (!vmw->vkms_enabled)
 		return;
 
-	hrtimer_try_to_cancel(&du->vkms.timer);
+	hrtimer_cancel(&du->vkms.timer);
+	du->vkms.surface = NULL;
+	du->vkms.period_ns = ktime_set(0, 0);
+}
+
+enum vmw_vkms_lock_state {
+	VMW_VKMS_LOCK_UNLOCKED     = 0,
+	VMW_VKMS_LOCK_MODESET      = 1,
+	VMW_VKMS_LOCK_VBLANK       = 2
+};
+
+void
+vmw_vkms_crtc_init(struct drm_crtc *crtc)
+{
+	struct vmw_display_unit *du = vmw_crtc_to_du(crtc);
+
+	atomic_set(&du->vkms.atomic_lock, VMW_VKMS_LOCK_UNLOCKED);
+	spin_lock_init(&du->vkms.crc_state_lock);
+
+	INIT_WORK(&du->vkms.crc_generator_work, crc_generate_worker);
+	du->vkms.surface = NULL;
+}
+
+void
+vmw_vkms_crtc_cleanup(struct drm_crtc *crtc)
+{
+	struct vmw_display_unit *du = vmw_crtc_to_du(crtc);
+
+	WARN_ON(work_pending(&du->vkms.crc_generator_work));
+	hrtimer_cancel(&du->vkms.timer);
+}
+
+void
+vmw_vkms_crtc_atomic_begin(struct drm_crtc *crtc,
+			   struct drm_atomic_state *state)
+{
+	struct vmw_private *vmw = vmw_priv(crtc->dev);
+
+	if (vmw->vkms_enabled)
+		vmw_vkms_modeset_lock(crtc);
 }
 
 void
@@ -158,7 +358,10 @@ vmw_vkms_crtc_atomic_flush(struct drm_crtc *crtc,
 	unsigned long flags;
 	struct vmw_private *vmw = vmw_priv(crtc->dev);
 
-	if (vmw->vkms_enabled && crtc->state->event) {
+	if (!vmw->vkms_enabled)
+		return;
+
+	if (crtc->state->event) {
 		spin_lock_irqsave(&crtc->dev->event_lock, flags);
 
 		if (drm_crtc_vblank_get(crtc) != 0)
@@ -170,6 +373,8 @@ vmw_vkms_crtc_atomic_flush(struct drm_crtc *crtc,
 
 		crtc->state->event = NULL;
 	}
+
+	vmw_vkms_unlock(crtc);
 }
 
 void
@@ -191,3 +396,237 @@ vmw_vkms_crtc_atomic_disable(struct drm_crtc *crtc,
 	if (vmw->vkms_enabled)
 		drm_crtc_vblank_off(crtc);
 }
+
+static bool
+is_crc_supported(struct drm_crtc *crtc)
+{
+	struct vmw_private *vmw = vmw_priv(crtc->dev);
+
+	if (!vmw->vkms_enabled)
+		return false;
+
+	if (vmw->active_display_unit != vmw_du_screen_target)
+		return false;
+
+	return true;
+}
+
+static const char * const pipe_crc_sources[] = {"auto"};
+
+static int
+crc_parse_source(const char *src_name,
+		 bool *enabled)
+{
+	int ret = 0;
+
+	if (!src_name) {
+		*enabled = false;
+	} else if (strcmp(src_name, "auto") == 0) {
+		*enabled = true;
+	} else {
+		*enabled = false;
+		ret = -EINVAL;
+	}
+
+	return ret;
+}
+
+const char *const *
+vmw_vkms_get_crc_sources(struct drm_crtc *crtc,
+			 size_t *count)
+{
+	*count = 0;
+	if (!is_crc_supported(crtc))
+		return NULL;
+
+	*count = ARRAY_SIZE(pipe_crc_sources);
+	return pipe_crc_sources;
+}
+
+int
+vmw_vkms_verify_crc_source(struct drm_crtc *crtc,
+			   const char *src_name,
+			   size_t *values_cnt)
+{
+	bool enabled;
+
+	if (!is_crc_supported(crtc))
+		return -EINVAL;
+
+	if (crc_parse_source(src_name, &enabled) < 0) {
+		drm_dbg_driver(crtc->dev, "unknown source '%s'\n", src_name);
+		return -EINVAL;
+	}
+
+	*values_cnt = 1;
+
+	return 0;
+}
+
+int
+vmw_vkms_set_crc_source(struct drm_crtc *crtc,
+			const char *src_name)
+{
+	struct vmw_display_unit *du = vmw_crtc_to_du(crtc);
+	bool enabled, prev_enabled, locked;
+	int ret;
+
+	if (!is_crc_supported(crtc))
+		return -EINVAL;
+
+	ret = crc_parse_source(src_name, &enabled);
+
+	if (enabled)
+		drm_crtc_vblank_get(crtc);
+
+	locked = vmw_vkms_modeset_lock_relaxed(crtc);
+	prev_enabled = du->vkms.crc_enabled;
+	du->vkms.crc_enabled = enabled;
+	if (locked)
+		vmw_vkms_unlock(crtc);
+
+	if (prev_enabled)
+		drm_crtc_vblank_put(crtc);
+
+	return ret;
+}
+
+void
+vmw_vkms_set_crc_surface(struct drm_crtc *crtc,
+			 struct vmw_surface *surf)
+{
+	struct vmw_display_unit *du = vmw_crtc_to_du(crtc);
+	struct vmw_private *vmw = vmw_priv(crtc->dev);
+
+	if (vmw->vkms_enabled) {
+		WARN_ON(atomic_read(&du->vkms.atomic_lock) != VMW_VKMS_LOCK_MODESET);
+		du->vkms.surface = surf;
+	}
+}
+
+/**
+ * vmw_vkms_lock_max_wait_ns - Return the max wait for the vkms lock
+ * @du: The vmw_display_unit from which to grab the vblank timings
+ *
+ * Returns the maximum wait time used to acquire the vkms lock. By
+ * default uses a time of a single frame and in case where vblank
+ * was not initialized for the display unit 1/60th of a second.
+ */
+static inline u64
+vmw_vkms_lock_max_wait_ns(struct vmw_display_unit *du)
+{
+	s64 nsecs = ktime_to_ns(du->vkms.period_ns);
+
+	return  (nsecs > 0) ? nsecs : 16666666;
+}
+
+/**
+ * vmw_vkms_modeset_lock - Protects access to crtc during modeset
+ * @crtc: The crtc to lock for vkms
+ *
+ * This function prevents the VKMS timers/callbacks from being called
+ * while a modeset operation is in process. We don't want the callbacks
+ * e.g. the vblank simulator to be trying to access incomplete state
+ * so we need to make sure they execute only when the modeset has
+ * finished.
+ *
+ * Normally this would have been done with a spinlock but locking the
+ * entire atomic modeset with vmwgfx is impossible because kms prepare
+ * executes non-atomic ops (e.g. vmw_validation_prepare holds a mutex to
+ * guard various bits of state). Which means that we need to synchronize
+ * atomic context (the vblank handler) with the non-atomic entirity
+ * of kms - so use an atomic_t to track which part of vkms has access
+ * to the basic vkms state.
+ */
+void
+vmw_vkms_modeset_lock(struct drm_crtc *crtc)
+{
+	struct vmw_display_unit *du = vmw_crtc_to_du(crtc);
+	const u64 nsecs_delay = 10;
+	const u64 MAX_NSECS_DELAY = vmw_vkms_lock_max_wait_ns(du);
+	u64 total_delay = 0;
+	int ret;
+
+	do {
+		ret = atomic_cmpxchg(&du->vkms.atomic_lock,
+				     VMW_VKMS_LOCK_UNLOCKED,
+				     VMW_VKMS_LOCK_MODESET);
+		if (ret == VMW_VKMS_LOCK_UNLOCKED || total_delay >= MAX_NSECS_DELAY)
+			break;
+		ndelay(nsecs_delay);
+		total_delay += nsecs_delay;
+	} while (1);
+
+	if (total_delay >= MAX_NSECS_DELAY) {
+		drm_warn(crtc->dev, "VKMS lock expired! total_delay = %lld, ret = %d, cur = %d\n",
+			 total_delay, ret, atomic_read(&du->vkms.atomic_lock));
+	}
+}
+
+/**
+ * vmw_vkms_modeset_lock_relaxed - Protects access to crtc during modeset
+ * @crtc: The crtc to lock for vkms
+ *
+ * Much like vmw_vkms_modeset_lock except that when the crtc is currently
+ * in a modeset it will return immediately.
+ *
+ * Returns true if actually locked vkms to modeset or false otherwise.
+ */
+bool
+vmw_vkms_modeset_lock_relaxed(struct drm_crtc *crtc)
+{
+	struct vmw_display_unit *du = vmw_crtc_to_du(crtc);
+	const u64 nsecs_delay = 10;
+	const u64 MAX_NSECS_DELAY = vmw_vkms_lock_max_wait_ns(du);
+	u64 total_delay = 0;
+	int ret;
+
+	do {
+		ret = atomic_cmpxchg(&du->vkms.atomic_lock,
+				     VMW_VKMS_LOCK_UNLOCKED,
+				     VMW_VKMS_LOCK_MODESET);
+		if (ret == VMW_VKMS_LOCK_UNLOCKED ||
+		    ret == VMW_VKMS_LOCK_MODESET ||
+		    total_delay >= MAX_NSECS_DELAY)
+			break;
+		ndelay(nsecs_delay);
+		total_delay += nsecs_delay;
+	} while (1);
+
+	if (total_delay >= MAX_NSECS_DELAY) {
+		drm_warn(crtc->dev, "VKMS relaxed lock expired!\n");
+		return false;
+	}
+
+	return ret == VMW_VKMS_LOCK_UNLOCKED;
+}
+
+/**
+ * vmw_vkms_vblank_trylock - Protects access to crtc during vblank
+ * @crtc: The crtc to lock for vkms
+ *
+ * Tries to lock vkms for vblank, returns immediately.
+ *
+ * Returns true if locked vkms to vblank or false otherwise.
+ */
+bool
+vmw_vkms_vblank_trylock(struct drm_crtc *crtc)
+{
+	struct vmw_display_unit *du = vmw_crtc_to_du(crtc);
+	u32 ret;
+
+	ret = atomic_cmpxchg(&du->vkms.atomic_lock,
+			     VMW_VKMS_LOCK_UNLOCKED,
+			     VMW_VKMS_LOCK_VBLANK);
+
+	return ret == VMW_VKMS_LOCK_UNLOCKED;
+}
+
+void
+vmw_vkms_unlock(struct drm_crtc *crtc)
+{
+	struct vmw_display_unit *du = vmw_crtc_to_du(crtc);
+
+	/* Release flag; mark it as unlocked. */
+	atomic_set(&du->vkms.atomic_lock, VMW_VKMS_LOCK_UNLOCKED);
+}
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_vkms.h b/drivers/gpu/drm/vmwgfx/vmwgfx_vkms.h
index 0f6d4ab9ebe3..69ddd33a8444 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_vkms.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_vkms.h
@@ -32,22 +32,44 @@
 #include <linux/hrtimer_types.h>
 #include <linux/types.h>
 
-struct vmw_private;
-struct drm_crtc;
 struct drm_atomic_state;
+struct drm_crtc;
+struct vmw_private;
+struct vmw_surface;
 
 void vmw_vkms_init(struct vmw_private *vmw);
+void vmw_vkms_cleanup(struct vmw_private *vmw);
+
+void vmw_vkms_modeset_lock(struct drm_crtc *crtc);
+bool vmw_vkms_modeset_lock_relaxed(struct drm_crtc *crtc);
+bool vmw_vkms_vblank_trylock(struct drm_crtc *crtc);
+void vmw_vkms_unlock(struct drm_crtc *crtc);
+
 bool vmw_vkms_get_vblank_timestamp(struct drm_crtc *crtc,
 				   int *max_error,
 				   ktime_t *vblank_time,
 				   bool in_vblank_irq);
 int vmw_vkms_enable_vblank(struct drm_crtc *crtc);
 void vmw_vkms_disable_vblank(struct drm_crtc *crtc);
+
+void vmw_vkms_crtc_init(struct drm_crtc *crtc);
+void vmw_vkms_crtc_cleanup(struct drm_crtc *crtc);
+void  vmw_vkms_crtc_atomic_begin(struct drm_crtc *crtc,
+				 struct drm_atomic_state *state);
 void vmw_vkms_crtc_atomic_flush(struct drm_crtc *crtc, struct drm_atomic_state *state);
-enum hrtimer_restart vmw_vkms_vblank_simulate(struct hrtimer *timer);
 void vmw_vkms_crtc_atomic_enable(struct drm_crtc *crtc,
 				 struct drm_atomic_state *state);
 void vmw_vkms_crtc_atomic_disable(struct drm_crtc *crtc,
 				  struct drm_atomic_state *state);
 
+const char *const *vmw_vkms_get_crc_sources(struct drm_crtc *crtc,
+					    size_t *count);
+int vmw_vkms_verify_crc_source(struct drm_crtc *crtc,
+			       const char *src_name,
+			       size_t *values_cnt);
+int vmw_vkms_set_crc_source(struct drm_crtc *crtc,
+			    const char *src_name);
+void vmw_vkms_set_crc_surface(struct drm_crtc *crtc,
+			      struct vmw_surface *surf);
+
 #endif
-- 
2.40.1

