Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB603606F1
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 12:18:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34BE26EA34;
	Thu, 15 Apr 2021 10:17:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1CB06EA27;
 Thu, 15 Apr 2021 10:17:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5E1DCAE20;
 Thu, 15 Apr 2021 10:17:47 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, bskeggs@redhat.com, ray.huang@amd.com,
 linux-graphics-maintainer@vmware.com, sroland@vmware.com, zackr@vmware.com,
 shashank.sharma@amd.com, sam@ravnborg.org, emil.velikov@collabora.com,
 Felix.Kuehling@amd.com, nirmoy.das@amd.com
Subject: [PATCH v2 5/7] drm/vmwgfx: Inline ttm_bo_mmap() into vmwgfx driver
Date: Thu, 15 Apr 2021 12:17:38 +0200
Message-Id: <20210415101740.21847-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210415101740.21847-1-tzimmermann@suse.de>
References: <20210415101740.21847-1-tzimmermann@suse.de>
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
Cc: nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The vmwgfx driver is the only remaining user of ttm_bo_mmap(). Inline
the code. The internal helper ttm_bo_vm_lookup() is now also part of
vmwgfx as vmw_bo_vm_lookup().

v2:
	* replace pr_err() with drm_err() (Zack)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Zack Rusin <zackr@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c | 56 ++++++++++++++++++++++--
 1 file changed, 53 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
index cb9975889e2f..c8b6543b4e39 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
@@ -27,6 +27,32 @@
 
 #include "vmwgfx_drv.h"
 
+static struct ttm_buffer_object *vmw_bo_vm_lookup(struct ttm_device *bdev,
+						  unsigned long offset,
+						  unsigned long pages)
+{
+	struct vmw_private *dev_priv = container_of(bdev, struct vmw_private, bdev);
+	struct drm_device *drm = &dev_priv->drm;
+	struct drm_vma_offset_node *node;
+	struct ttm_buffer_object *bo = NULL;
+
+	drm_vma_offset_lock_lookup(bdev->vma_manager);
+
+	node = drm_vma_offset_lookup_locked(bdev->vma_manager, offset, pages);
+	if (likely(node)) {
+		bo = container_of(node, struct ttm_buffer_object,
+				  base.vma_node);
+		bo = ttm_bo_get_unless_zero(bo);
+	}
+
+	drm_vma_offset_unlock_lookup(bdev->vma_manager);
+
+	if (!bo)
+		drm_err(drm, "Could not find buffer object to map\n");
+
+	return bo;
+}
+
 int vmw_mmap(struct file *filp, struct vm_area_struct *vma)
 {
 	static const struct vm_operations_struct vmw_vm_ops = {
@@ -41,10 +67,28 @@ int vmw_mmap(struct file *filp, struct vm_area_struct *vma)
 	};
 	struct drm_file *file_priv = filp->private_data;
 	struct vmw_private *dev_priv = vmw_priv(file_priv->minor->dev);
-	int ret = ttm_bo_mmap(filp, vma, &dev_priv->bdev);
+	struct ttm_device *bdev = &dev_priv->bdev;
+	struct ttm_buffer_object *bo;
+	int ret;
+
+	if (unlikely(vma->vm_pgoff < DRM_FILE_PAGE_OFFSET_START))
+		return -EINVAL;
+
+	bo = vmw_bo_vm_lookup(bdev, vma->vm_pgoff, vma_pages(vma));
+	if (unlikely(!bo))
+		return -EINVAL;
 
-	if (ret)
-		return ret;
+	if (unlikely(!bo->bdev->funcs->verify_access)) {
+		ret = -EPERM;
+		goto out_unref;
+	}
+	ret = bo->bdev->funcs->verify_access(bo, filp);
+	if (unlikely(ret != 0))
+		goto out_unref;
+
+	ret = ttm_bo_mmap_obj(vma, bo);
+	if (unlikely(ret != 0))
+		goto out_unref;
 
 	vma->vm_ops = &vmw_vm_ops;
 
@@ -52,7 +96,13 @@ int vmw_mmap(struct file *filp, struct vm_area_struct *vma)
 	if (!is_cow_mapping(vma->vm_flags))
 		vma->vm_flags = (vma->vm_flags & ~VM_MIXEDMAP) | VM_PFNMAP;
 
+	ttm_bo_put(bo); /* release extra ref taken by ttm_bo_mmap_obj() */
+
 	return 0;
+
+out_unref:
+	ttm_bo_put(bo);
+	return ret;
 }
 
 /* struct vmw_validation_mem callback */
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
