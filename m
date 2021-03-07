Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B52330486
	for <lists+dri-devel@lfdr.de>; Sun,  7 Mar 2021 21:29:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83DEF6E7E6;
	Sun,  7 Mar 2021 20:29:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B0C56E7E6
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Mar 2021 20:29:10 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 2/5] drm: Add and export function
 drm_gem_cma_dumb_create_noncoherent
Date: Sun,  7 Mar 2021 20:28:32 +0000
Message-Id: <20210307202835.253907-3-paul@crapouillou.net>
In-Reply-To: <20210307202835.253907-1-paul@crapouillou.net>
References: <20210307202835.253907-1-paul@crapouillou.net>
MIME-Version: 1.0
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>, od@zcrc.me,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This function can be used by drivers to create dumb buffers with
non-coherent backing memory.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/drm_gem_cma_helper.c | 37 +++++++++++++++++++++++++---
 include/drm/drm_gem_cma_helper.h     |  5 ++++
 2 files changed, 38 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm_gem_cma_helper.c
index 917b092b23c2..d100c5f9c140 100644
--- a/drivers/gpu/drm/drm_gem_cma_helper.c
+++ b/drivers/gpu/drm/drm_gem_cma_helper.c
@@ -181,6 +181,7 @@ EXPORT_SYMBOL_GPL(drm_gem_cma_create);
  * @drm: DRM device
  * @size: size of the object to allocate
  * @handle: return location for the GEM handle
+ * @noncoherent: allocate object with non-coherent cache attribute
  *
  * This function creates a CMA GEM object, allocating a physically contiguous
  * chunk of memory as backing store. The GEM object is then added to the list
@@ -193,13 +194,13 @@ EXPORT_SYMBOL_GPL(drm_gem_cma_create);
 static struct drm_gem_cma_object *
 drm_gem_cma_create_with_handle(struct drm_file *file_priv,
 			       struct drm_device *drm, size_t size,
-			       uint32_t *handle)
+			       uint32_t *handle, bool noncoherent)
 {
 	struct drm_gem_cma_object *cma_obj;
 	struct drm_gem_object *gem_obj;
 	int ret;
 
-	cma_obj = drm_gem_cma_create(drm, size);
+	cma_obj = drm_gem_cma_create_with_cache_param(drm, size, noncoherent);
 	if (IS_ERR(cma_obj))
 		return cma_obj;
 
@@ -276,7 +277,7 @@ int drm_gem_cma_dumb_create_internal(struct drm_file *file_priv,
 		args->size = args->pitch * args->height;
 
 	cma_obj = drm_gem_cma_create_with_handle(file_priv, drm, args->size,
-						 &args->handle);
+						 &args->handle, false);
 	return PTR_ERR_OR_ZERO(cma_obj);
 }
 EXPORT_SYMBOL_GPL(drm_gem_cma_dumb_create_internal);
@@ -309,11 +310,39 @@ int drm_gem_cma_dumb_create(struct drm_file *file_priv,
 	args->size = args->pitch * args->height;
 
 	cma_obj = drm_gem_cma_create_with_handle(file_priv, drm, args->size,
-						 &args->handle);
+						 &args->handle, false);
 	return PTR_ERR_OR_ZERO(cma_obj);
 }
 EXPORT_SYMBOL_GPL(drm_gem_cma_dumb_create);
 
+/**
+ * drm_gem_cma_dumb_create_noncoherent - create a dumb buffer object with
+ *     non-coherent cache attribute
+ * @file_priv: DRM file-private structure to create the dumb buffer for
+ * @drm: DRM device
+ * @args: IOCTL data
+ *
+ * Same as drm_gem_cma_dumb_create, but the dumb buffer object created has
+ * the non-coherent cache attribute set.
+ *
+ * Returns:
+ * 0 on success or a negative error code on failure.
+ */
+int drm_gem_cma_dumb_create_noncoherent(struct drm_file *file_priv,
+					struct drm_device *drm,
+					struct drm_mode_create_dumb *args)
+{
+	struct drm_gem_cma_object *cma_obj;
+
+	args->pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
+	args->size = args->pitch * args->height;
+
+	cma_obj = drm_gem_cma_create_with_handle(file_priv, drm, args->size,
+						 &args->handle, true);
+	return PTR_ERR_OR_ZERO(cma_obj);
+}
+EXPORT_SYMBOL_GPL(drm_gem_cma_dumb_create_noncoherent);
+
 const struct vm_operations_struct drm_gem_cma_vm_ops = {
 	.open = drm_gem_vm_open,
 	.close = drm_gem_vm_close,
diff --git a/include/drm/drm_gem_cma_helper.h b/include/drm/drm_gem_cma_helper.h
index 360771f5f485..6b44e7492a63 100644
--- a/include/drm/drm_gem_cma_helper.h
+++ b/include/drm/drm_gem_cma_helper.h
@@ -76,6 +76,11 @@ int drm_gem_cma_dumb_create(struct drm_file *file_priv,
 			    struct drm_device *drm,
 			    struct drm_mode_create_dumb *args);
 
+/* create non-coherent memory region for DRM framebuffer */
+int drm_gem_cma_dumb_create_noncoherent(struct drm_file *file_priv,
+					struct drm_device *drm,
+					struct drm_mode_create_dumb *args);
+
 /* allocate physical memory */
 struct drm_gem_cma_object *drm_gem_cma_create(struct drm_device *drm,
 					      size_t size);
-- 
2.30.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
