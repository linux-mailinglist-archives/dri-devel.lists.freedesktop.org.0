Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F842A3E98
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 09:16:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A923A6EC4A;
	Tue,  3 Nov 2020 08:14:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0611E6E591
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 22:07:34 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 3/5] drm: Add and export function drm_gem_cma_mmap_noncoherent
Date: Mon,  2 Nov 2020 22:06:49 +0000
Message-Id: <20201102220651.22069-4-paul@crapouillou.net>
In-Reply-To: <20201102220651.22069-1-paul@crapouillou.net>
References: <20201102220651.22069-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 03 Nov 2020 08:14:25 +0000
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
Cc: Paul Cercueil <paul@crapouillou.net>, od@zcrc.me,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This function can be used by drivers that need to mmap dumb buffers
created with non-coherent backing memory.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/drm_gem_cma_helper.c | 39 ++++++++++++++++++++++++++++
 include/drm/drm_gem_cma_helper.h     |  2 ++
 2 files changed, 41 insertions(+)

diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm_gem_cma_helper.c
index 3bdd67795e20..4ed63f4896bd 100644
--- a/drivers/gpu/drm/drm_gem_cma_helper.c
+++ b/drivers/gpu/drm/drm_gem_cma_helper.c
@@ -387,6 +387,45 @@ int drm_gem_cma_mmap(struct file *filp, struct vm_area_struct *vma)
 }
 EXPORT_SYMBOL_GPL(drm_gem_cma_mmap);
 
+/**
+ * drm_gem_cma_mmap_noncoherent - memory-map a CMA GEM object with
+ *     non-coherent cache attribute
+ * @filp: file object
+ * @vma: VMA for the area to be mapped
+ *
+ * Just like drm_gem_cma_mmap, but for a GEM object backed by non-coherent
+ * memory.
+ *
+ * Returns:
+ * 0 on success or a negative error code on failure.
+ */
+int drm_gem_cma_mmap_noncoherent(struct file *filp, struct vm_area_struct *vma)
+{
+	struct drm_gem_cma_object *cma_obj;
+	int ret;
+
+	ret = drm_gem_mmap(filp, vma);
+	if (ret)
+		return ret;
+
+	cma_obj = to_drm_gem_cma_obj(vma->vm_private_data);
+
+	/*
+	 * Clear the VM_PFNMAP flag that was set by drm_gem_mmap(), and set the
+	 * vm_pgoff (used as a fake buffer offset by DRM) to 0 as we want to map
+	 * the whole buffer.
+	 */
+	vma->vm_flags &= ~VM_PFNMAP;
+	vma->vm_pgoff = 0;
+	vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
+
+	return remap_pfn_range(vma, vma->vm_start,
+			       cma_obj->paddr >> PAGE_SHIFT,
+			       vma->vm_end - vma->vm_start,
+			       vma->vm_page_prot);
+}
+EXPORT_SYMBOL_GPL(drm_gem_cma_mmap_noncoherent);
+
 #ifndef CONFIG_MMU
 /**
  * drm_gem_cma_get_unmapped_area - propose address for mapping in noMMU cases
diff --git a/include/drm/drm_gem_cma_helper.h b/include/drm/drm_gem_cma_helper.h
index d0e6a1cd0950..6b01ad5581c3 100644
--- a/include/drm/drm_gem_cma_helper.h
+++ b/include/drm/drm_gem_cma_helper.h
@@ -83,6 +83,8 @@ int drm_gem_cma_dumb_create_noncoherent(struct drm_file *file_priv,
 /* set vm_flags and we can change the VM attribute to other one at here */
 int drm_gem_cma_mmap(struct file *filp, struct vm_area_struct *vma);
 
+int drm_gem_cma_mmap_noncoherent(struct file *filep, struct vm_area_struct *vma);
+
 /* allocate physical memory */
 struct drm_gem_cma_object *drm_gem_cma_create(struct drm_device *drm,
 					      size_t size);
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
