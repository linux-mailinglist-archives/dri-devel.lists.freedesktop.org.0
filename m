Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DCE330484
	for <lists+dri-devel@lfdr.de>; Sun,  7 Mar 2021 21:29:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3654C6E1E8;
	Sun,  7 Mar 2021 20:29:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E9CB6E1E8
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Mar 2021 20:29:03 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 1/5] drm: Add and export function
 drm_gem_cma_create_noncoherent
Date: Sun,  7 Mar 2021 20:28:31 +0000
Message-Id: <20210307202835.253907-2-paul@crapouillou.net>
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

This function can be used by drivers that need to create a GEM object
with non-coherent backing memory.

Creating non-coherent CMA objects is useful on architectures where
writing to a buffer with the non-coherent cache attribute set then
invalidating the cache is faster than writing to the same buffer with
the write-combine cache attribute set. This is the case for instance on
some Ingenic SoCs.

v2: Add inline doc about why we need this, and improve commit message

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/drm_gem_cma_helper.c | 76 +++++++++++++++++++++-------
 include/drm/drm_gem_cma_helper.h     |  2 +
 2 files changed, 61 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm_gem_cma_helper.c
index 7942cf05cd93..917b092b23c2 100644
--- a/drivers/gpu/drm/drm_gem_cma_helper.c
+++ b/drivers/gpu/drm/drm_gem_cma_helper.c
@@ -90,21 +90,10 @@ __drm_gem_cma_create(struct drm_device *drm, size_t size)
 	return ERR_PTR(ret);
 }
 
-/**
- * drm_gem_cma_create - allocate an object with the given size
- * @drm: DRM device
- * @size: size of the object to allocate
- *
- * This function creates a CMA GEM object and allocates a contiguous chunk of
- * memory as backing store. The backing memory has the writecombine attribute
- * set.
- *
- * Returns:
- * A struct drm_gem_cma_object * on success or an ERR_PTR()-encoded negative
- * error code on failure.
- */
-struct drm_gem_cma_object *drm_gem_cma_create(struct drm_device *drm,
-					      size_t size)
+static struct drm_gem_cma_object *
+drm_gem_cma_create_with_cache_param(struct drm_device *drm,
+				    size_t size,
+				    bool noncoherent)
 {
 	struct drm_gem_cma_object *cma_obj;
 	int ret;
@@ -115,8 +104,16 @@ struct drm_gem_cma_object *drm_gem_cma_create(struct drm_device *drm,
 	if (IS_ERR(cma_obj))
 		return cma_obj;
 
-	cma_obj->vaddr = dma_alloc_wc(drm->dev, size, &cma_obj->paddr,
-				      GFP_KERNEL | __GFP_NOWARN);
+	if (noncoherent) {
+		cma_obj->vaddr = dma_alloc_noncoherent(drm->dev, size,
+						       &cma_obj->paddr,
+						       DMA_TO_DEVICE,
+						       GFP_KERNEL | __GFP_NOWARN);
+
+	} else {
+		cma_obj->vaddr = dma_alloc_wc(drm->dev, size, &cma_obj->paddr,
+					      GFP_KERNEL | __GFP_NOWARN);
+	}
 	if (!cma_obj->vaddr) {
 		drm_dbg(drm, "failed to allocate buffer with size %zu\n",
 			 size);
@@ -130,6 +127,51 @@ struct drm_gem_cma_object *drm_gem_cma_create(struct drm_device *drm,
 	drm_gem_object_put(&cma_obj->base);
 	return ERR_PTR(ret);
 }
+
+/**
+ * drm_gem_cma_create_noncoherent - allocate an object with the given size
+ *     and non-coherent cache attribute
+ * @drm: DRM device
+ * @size: size of the object to allocate
+ *
+ * This function creates a CMA GEM object and allocates a contiguous chunk of
+ * memory as backing store. The backing memory has the noncoherent attribute
+ * set.
+ *
+ * Creating non-coherent CMA objects is useful on architectures where writing
+ * to a buffer with the non-coherent cache attribute set then invalidating the
+ * cache is faster than writing to the same buffer with the write-combine cache
+ * attribute set. This is the case for instance on some Ingenic SoCs.
+ *
+ * Returns:
+ * A struct drm_gem_cma_object * on success or an ERR_PTR()-encoded negative
+ * error code on failure.
+ */
+struct drm_gem_cma_object *
+drm_gem_cma_create_noncoherent(struct drm_device *drm, size_t size)
+{
+	return drm_gem_cma_create_with_cache_param(drm, size, true);
+}
+EXPORT_SYMBOL_GPL(drm_gem_cma_create_noncoherent);
+
+/**
+ * drm_gem_cma_create - allocate an object with the given size
+ * @drm: DRM device
+ * @size: size of the object to allocate
+ *
+ * This function creates a CMA GEM object and allocates a contiguous chunk of
+ * memory as backing store. The backing memory has the writecombine attribute
+ * set.
+ *
+ * Returns:
+ * A struct drm_gem_cma_object * on success or an ERR_PTR()-encoded negative
+ * error code on failure.
+ */
+struct drm_gem_cma_object *drm_gem_cma_create(struct drm_device *drm,
+					      size_t size)
+{
+	return drm_gem_cma_create_with_cache_param(drm, size, false);
+}
 EXPORT_SYMBOL_GPL(drm_gem_cma_create);
 
 /**
diff --git a/include/drm/drm_gem_cma_helper.h b/include/drm/drm_gem_cma_helper.h
index 0a9711caa3e8..360771f5f485 100644
--- a/include/drm/drm_gem_cma_helper.h
+++ b/include/drm/drm_gem_cma_helper.h
@@ -79,6 +79,8 @@ int drm_gem_cma_dumb_create(struct drm_file *file_priv,
 /* allocate physical memory */
 struct drm_gem_cma_object *drm_gem_cma_create(struct drm_device *drm,
 					      size_t size);
+struct drm_gem_cma_object *
+drm_gem_cma_create_noncoherent(struct drm_device *drm, size_t size);
 
 extern const struct vm_operations_struct drm_gem_cma_vm_ops;
 
-- 
2.30.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
