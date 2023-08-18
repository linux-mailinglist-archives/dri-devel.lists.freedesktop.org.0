Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 291F578050A
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 06:13:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 401F110E441;
	Fri, 18 Aug 2023 04:13:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1447110E441
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 04:13:15 +0000 (UTC)
Received: from vertex.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net
 [173.49.113.140]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id C2403327CB6;
 Fri, 18 Aug 2023 05:13:12 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1692331993; bh=Z90lYTsnk2rL97KwndbL2rx3/QIIQtqV4IsDi0aUcCY=;
 h=From:To:Cc:Subject:Date:From;
 b=nHunDvVknX/PrApH0jQ296pWMtL60PVsqYX4JdKg62mHwNOOHRBggZyKjQE+wd230
 XiwM3MkNmqo5wPXU9zKXSbJ7VpRvm28omb8E4g6vqTMVgvOjKCFzIo159GPwtbf/Y+
 VfMQEzHIs2Cie5oR039zOlenLwX2cNlyqJwGNq+NKY+ilezHhEkJvPrFLDhku5mtiy
 JOipVEpHYbaLoLcsYHN/fQYctnAgXgI9nzDVzKfuM4btMHMAhy09mMhbqeHLBcJ3c+
 wLm+Qi/i/FbSlkIi617J5JBk45kq7rTrA/C0nUOpaMju0I8z+csbYshOpUi7rL9tnV
 oWq7StDuIMomg==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/vmwgfx: Fix possible invalid drm gem put calls
Date: Fri, 18 Aug 2023 00:13:01 -0400
Message-Id: <20230818041301.407636-1-zack@kde.org>
X-Mailer: git-send-email 2.39.2
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
Cc: stable@vger.kernel.org, krastevm@vmware.com, banackm@vmware.com,
 iforbes@vmware.com, mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

vmw_bo_unreference sets the input buffer to null on exit, resulting in
null ptr deref's on the subsequent drm gem put calls.

This went unnoticed because only very old userspace would be exercising
those paths but it wouldn't be hard to hit on old distros with brand
new kernels.

Introduce a new function that abstracts unrefing of user bo's to make
the code cleaner and more explicit.

Signed-off-by: Zack Rusin <zackr@vmware.com>
Reported-by: Ian Forbes <iforbes@vmware.com>
Fixes: 9ef8d83e8e25 ("drm/vmwgfx: Do not drop the reference to the handle too soon")
Cc: <stable@vger.kernel.org> # v6.4+
---
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c      | 6 ++----
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.h      | 8 ++++++++
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c | 6 ++----
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c     | 6 ++----
 drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c | 3 +--
 drivers/gpu/drm/vmwgfx/vmwgfx_shader.c  | 3 +--
 6 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
index 82094c137855..c43853597776 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
@@ -497,10 +497,9 @@ static int vmw_user_bo_synccpu_release(struct drm_file *filp,
 		if (!(flags & drm_vmw_synccpu_allow_cs)) {
 			atomic_dec(&vmw_bo->cpu_writers);
 		}
-		ttm_bo_put(&vmw_bo->tbo);
+		vmw_user_bo_unref(vmw_bo);
 	}
 
-	drm_gem_object_put(&vmw_bo->tbo.base);
 	return ret;
 }
 
@@ -540,8 +539,7 @@ int vmw_user_bo_synccpu_ioctl(struct drm_device *dev, void *data,
 			return ret;
 
 		ret = vmw_user_bo_synccpu_grab(vbo, arg->flags);
-		vmw_bo_unreference(&vbo);
-		drm_gem_object_put(&vbo->tbo.base);
+		vmw_user_bo_unref(vbo);
 		if (unlikely(ret != 0)) {
 			if (ret == -ERESTARTSYS || ret == -EBUSY)
 				return -EBUSY;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
index 50a836e70994..1d433fceed3d 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
@@ -195,6 +195,14 @@ static inline struct vmw_bo *vmw_bo_reference(struct vmw_bo *buf)
 	return buf;
 }
 
+static inline void vmw_user_bo_unref(struct vmw_bo *vbo)
+{
+	if (vbo) {
+		ttm_bo_put(&vbo->tbo);
+		drm_gem_object_put(&vbo->tbo.base);
+	}
+}
+
 static inline struct vmw_bo *to_vmw_bo(struct drm_gem_object *gobj)
 {
 	return container_of((gobj), struct vmw_bo, tbo.base);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
index 6b9aa2b4ef54..25b96821df0f 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
@@ -1164,8 +1164,7 @@ static int vmw_translate_mob_ptr(struct vmw_private *dev_priv,
 	}
 	vmw_bo_placement_set(vmw_bo, VMW_BO_DOMAIN_MOB, VMW_BO_DOMAIN_MOB);
 	ret = vmw_validation_add_bo(sw_context->ctx, vmw_bo);
-	ttm_bo_put(&vmw_bo->tbo);
-	drm_gem_object_put(&vmw_bo->tbo.base);
+	vmw_user_bo_unref(vmw_bo);
 	if (unlikely(ret != 0))
 		return ret;
 
@@ -1221,8 +1220,7 @@ static int vmw_translate_guest_ptr(struct vmw_private *dev_priv,
 	vmw_bo_placement_set(vmw_bo, VMW_BO_DOMAIN_GMR | VMW_BO_DOMAIN_VRAM,
 			     VMW_BO_DOMAIN_GMR | VMW_BO_DOMAIN_VRAM);
 	ret = vmw_validation_add_bo(sw_context->ctx, vmw_bo);
-	ttm_bo_put(&vmw_bo->tbo);
-	drm_gem_object_put(&vmw_bo->tbo.base);
+	vmw_user_bo_unref(vmw_bo);
 	if (unlikely(ret != 0))
 		return ret;
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index b62207be3363..1489ad73c103 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -1665,10 +1665,8 @@ static struct drm_framebuffer *vmw_kms_fb_create(struct drm_device *dev,
 
 err_out:
 	/* vmw_user_lookup_handle takes one ref so does new_fb */
-	if (bo) {
-		vmw_bo_unreference(&bo);
-		drm_gem_object_put(&bo->tbo.base);
-	}
+	if (bo)
+		vmw_user_bo_unref(bo);
 	if (surface)
 		vmw_surface_unreference(&surface);
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c b/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c
index 7e112319a23c..fb85f244c3d0 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c
@@ -451,8 +451,7 @@ int vmw_overlay_ioctl(struct drm_device *dev, void *data,
 
 	ret = vmw_overlay_update_stream(dev_priv, buf, arg, true);
 
-	vmw_bo_unreference(&buf);
-	drm_gem_object_put(&buf->tbo.base);
+	vmw_user_bo_unref(buf);
 
 out_unlock:
 	mutex_unlock(&overlay->mutex);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c b/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c
index e7226db8b242..1e81ff2422cf 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c
@@ -809,8 +809,7 @@ static int vmw_shader_define(struct drm_device *dev, struct drm_file *file_priv,
 				    shader_type, num_input_sig,
 				    num_output_sig, tfile, shader_handle);
 out_bad_arg:
-	vmw_bo_unreference(&buffer);
-	drm_gem_object_put(&buffer->tbo.base);
+	vmw_user_bo_unref(buffer);
 	return ret;
 }
 
-- 
2.39.2

