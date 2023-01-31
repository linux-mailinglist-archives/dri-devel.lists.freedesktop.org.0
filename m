Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA276822E6
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 04:36:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B1CD10E30C;
	Tue, 31 Jan 2023 03:36:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2838010E30C
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Jan 2023 03:35:50 +0000 (UTC)
Received: from vertex.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net
 [173.49.113.140]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id 889B63212C4;
 Tue, 31 Jan 2023 03:35:48 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1675136149; bh=MakGexs8aNLz3ZbuJXm6Q6Fnj5m5FJrF6cngzBtG+tE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=T57fd5AqzsA11VbZMdQZ5D48pmUK8yYdODZzX8X64dK/Chk0swrpVcXuB81h2R89u
 Vz5ixYuXxjo9kttk+AkjYx8ATxH+vyrLst9wMPmTrcklRu+vf2KbWWYeciJWgN0FyY
 6Ik8CWU5NJGGhfZTWG0sXzDtRSyTQ7esR5po9qT2vu1p0ASwhLMITDbsgaiHMlgRYe
 QmVw7mHFmr/vYgxkXXsEa1/PsAXf8DP8OFzifYx+9okGRDwn8oSUYPrtwL6iUkZeKw
 j3H4tWGGf7tOfDf6N6m2hw2lqL66VTt+lTS4UBDWvjd9AZTmpspyMFKQ4R8rKpsh0l
 riocwwgB3y3ag==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 4/8] drm/vmwgfx: Simplify fb pinning
Date: Mon, 30 Jan 2023 22:35:38 -0500
Message-Id: <20230131033542.953249-5-zack@kde.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230131033542.953249-1-zack@kde.org>
References: <20230131033542.953249-1-zack@kde.org>
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

Only the legacy display unit requires pinning of the fb memory in vram.
Both the screen objects and screen targets can present from any buffer.
That makes the pinning abstraction pointless. Simplify all of the code
and move it to the legacy display unit, the only place that needs it.

Signed-off-by: Zack Rusin <zackr@vmware.com>
Reviewed-by: Martin Krastev <krastevm@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c  |  8 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.h  |  4 --
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 66 -----------------------------
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h |  4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c | 57 +++++++++++++++++++++----
 5 files changed, 54 insertions(+), 85 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
index b6dc0baef350..c6dc733f6d45 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
@@ -73,10 +73,10 @@ static bool bo_is_vmw(struct ttm_buffer_object *bo)
  * Return: Zero on success, Negative error code on failure. In particular
  * -ERESTARTSYS if interrupted by a signal
  */
-int vmw_bo_pin_in_placement(struct vmw_private *dev_priv,
-			    struct vmw_bo *buf,
-			    struct ttm_placement *placement,
-			    bool interruptible)
+static int vmw_bo_pin_in_placement(struct vmw_private *dev_priv,
+				   struct vmw_bo *buf,
+				   struct ttm_placement *placement,
+				   bool interruptible)
 {
 	struct ttm_operation_ctx ctx = {interruptible, false };
 	struct ttm_buffer_object *bo = &buf->base;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
index 03ef4059c0d2..e2dadd68a16d 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
@@ -82,10 +82,6 @@ int vmw_bo_init(struct vmw_private *dev_priv,
 int vmw_bo_unref_ioctl(struct drm_device *dev, void *data,
 		       struct drm_file *file_priv);
 
-int vmw_bo_pin_in_placement(struct vmw_private *vmw_priv,
-			    struct vmw_bo *bo,
-			    struct ttm_placement *placement,
-			    bool interruptible);
 int vmw_bo_pin_in_vram(struct vmw_private *dev_priv,
 		       struct vmw_bo *buf,
 		       bool interruptible);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index ad41396c0a5d..6780391c57ea 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -1487,69 +1487,6 @@ static const struct drm_framebuffer_funcs vmw_framebuffer_bo_funcs = {
 	.dirty = vmw_framebuffer_bo_dirty_ext,
 };
 
-/*
- * Pin the bofer in a location suitable for access by the
- * display system.
- */
-static int vmw_framebuffer_pin(struct vmw_framebuffer *vfb)
-{
-	struct vmw_private *dev_priv = vmw_priv(vfb->base.dev);
-	struct vmw_bo *buf;
-	struct ttm_placement *placement;
-	int ret;
-
-	buf = vfb->bo ?  vmw_framebuffer_to_vfbd(&vfb->base)->buffer :
-		vmw_framebuffer_to_vfbs(&vfb->base)->surface->res.backup;
-
-	if (!buf)
-		return 0;
-
-	switch (dev_priv->active_display_unit) {
-	case vmw_du_legacy:
-		vmw_overlay_pause_all(dev_priv);
-		ret = vmw_bo_pin_in_start_of_vram(dev_priv, buf, false);
-		vmw_overlay_resume_all(dev_priv);
-		break;
-	case vmw_du_screen_object:
-	case vmw_du_screen_target:
-		if (vfb->bo) {
-			if (dev_priv->capabilities & SVGA_CAP_3D) {
-				/*
-				 * Use surface DMA to get content to
-				 * sreen target surface.
-				 */
-				placement = &vmw_vram_gmr_placement;
-			} else {
-				/* Use CPU blit. */
-				placement = &vmw_sys_placement;
-			}
-		} else {
-			/* Use surface / image update */
-			placement = &vmw_mob_placement;
-		}
-
-		return vmw_bo_pin_in_placement(dev_priv, buf, placement, false);
-	default:
-		return -EINVAL;
-	}
-
-	return ret;
-}
-
-static int vmw_framebuffer_unpin(struct vmw_framebuffer *vfb)
-{
-	struct vmw_private *dev_priv = vmw_priv(vfb->base.dev);
-	struct vmw_bo *buf;
-
-	buf = vfb->bo ?  vmw_framebuffer_to_vfbd(&vfb->base)->buffer :
-		vmw_framebuffer_to_vfbs(&vfb->base)->surface->res.backup;
-
-	if (WARN_ON(!buf))
-		return 0;
-
-	return vmw_bo_unpin(dev_priv, buf, false);
-}
-
 /**
  * vmw_create_bo_proxy - create a proxy surface for the buffer object
  *
@@ -1766,9 +1703,6 @@ vmw_kms_new_framebuffer(struct vmw_private *dev_priv,
 	if (ret)
 		return ERR_PTR(ret);
 
-	vfb->pin = vmw_framebuffer_pin;
-	vfb->unpin = vmw_framebuffer_unpin;
-
 	return vfb;
 }
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
index 2d097ba20ad8..7a97e53e8e51 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0 OR MIT */
 /**************************************************************************
  *
- * Copyright 2009-2022 VMware, Inc., Palo Alto, CA., USA
+ * Copyright 2009-2023 VMware, Inc., Palo Alto, CA., USA
  *
  * Permission is hereby granted, free of charge, to any person obtaining a
  * copy of this software and associated documentation files (the
@@ -217,8 +217,6 @@ struct vmw_kms_dirty {
  */
 struct vmw_framebuffer {
 	struct drm_framebuffer base;
-	int (*pin)(struct vmw_framebuffer *fb);
-	int (*unpin)(struct vmw_framebuffer *fb);
 	bool bo;
 	uint32_t user_handle;
 };
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
index a56e5d0ca3c6..b77fe0bc18a7 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0 OR MIT
 /**************************************************************************
  *
- * Copyright 2009-2022 VMware, Inc., Palo Alto, CA., USA
+ * Copyright 2009-2023 VMware, Inc., Palo Alto, CA., USA
  *
  * Permission is hereby granted, free of charge, to any person obtaining a
  * copy of this software and associated documentation files (the
@@ -25,11 +25,13 @@
  *
  **************************************************************************/
 
+#include "vmwgfx_bo.h"
+#include "vmwgfx_kms.h"
+
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_fourcc.h>
 
-#include "vmwgfx_kms.h"
 
 #define vmw_crtc_to_ldu(x) \
 	container_of(x, struct vmw_legacy_display_unit, base.crtc)
@@ -134,6 +136,47 @@ static int vmw_ldu_commit_list(struct vmw_private *dev_priv)
 	return 0;
 }
 
+/*
+ * Pin the buffer in a location suitable for access by the
+ * display system.
+ */
+static int vmw_ldu_fb_pin(struct vmw_framebuffer *vfb)
+{
+	struct vmw_private *dev_priv = vmw_priv(vfb->base.dev);
+	struct vmw_bo *buf;
+	int ret;
+
+	buf = vfb->bo ?  vmw_framebuffer_to_vfbd(&vfb->base)->buffer :
+		vmw_framebuffer_to_vfbs(&vfb->base)->surface->res.backup;
+
+	if (!buf)
+		return 0;
+	WARN_ON(dev_priv->active_display_unit != vmw_du_legacy);
+
+	if (dev_priv->active_display_unit == vmw_du_legacy) {
+		vmw_overlay_pause_all(dev_priv);
+		ret = vmw_bo_pin_in_start_of_vram(dev_priv, buf, false);
+		vmw_overlay_resume_all(dev_priv);
+	} else
+		ret = -EINVAL;
+
+	return ret;
+}
+
+static int vmw_ldu_fb_unpin(struct vmw_framebuffer *vfb)
+{
+	struct vmw_private *dev_priv = vmw_priv(vfb->base.dev);
+	struct vmw_bo *buf;
+
+	buf = vfb->bo ?  vmw_framebuffer_to_vfbd(&vfb->base)->buffer :
+		vmw_framebuffer_to_vfbs(&vfb->base)->surface->res.backup;
+
+	if (WARN_ON(!buf))
+		return 0;
+
+	return vmw_bo_unpin(dev_priv, buf, false);
+}
+
 static int vmw_ldu_del_active(struct vmw_private *vmw_priv,
 			      struct vmw_legacy_display_unit *ldu)
 {
@@ -145,8 +188,7 @@ static int vmw_ldu_del_active(struct vmw_private *vmw_priv,
 	list_del_init(&ldu->active);
 	if (--(ld->num_active) == 0) {
 		BUG_ON(!ld->fb);
-		if (ld->fb->unpin)
-			ld->fb->unpin(ld->fb);
+		WARN_ON(vmw_ldu_fb_unpin(ld->fb));
 		ld->fb = NULL;
 	}
 
@@ -163,11 +205,10 @@ static int vmw_ldu_add_active(struct vmw_private *vmw_priv,
 
 	BUG_ON(!ld->num_active && ld->fb);
 	if (vfb != ld->fb) {
-		if (ld->fb && ld->fb->unpin)
-			ld->fb->unpin(ld->fb);
+		if (ld->fb)
+			WARN_ON(vmw_ldu_fb_unpin(ld->fb));
 		vmw_svga_enable(vmw_priv);
-		if (vfb->pin)
-			vfb->pin(vfb);
+		WARN_ON(vmw_ldu_fb_pin(vfb));
 		ld->fb = vfb;
 	}
 
-- 
2.38.1

