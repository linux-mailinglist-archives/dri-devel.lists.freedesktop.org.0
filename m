Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11933BF6091
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 13:31:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1546D10E5B7;
	Tue, 21 Oct 2025 11:31:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="hFz97SLd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D2F110E5B5;
 Tue, 21 Oct 2025 11:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1761046259;
 bh=CuwOTRfnqz+w9WvYPQf42tJBIJAB73+PJTT7bXQYwCA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hFz97SLdmfnFu/+ugr+38rsf6d1E+ducBJy9r1VqGNCQBbU1Cs2IMVLHjWfjH/Hq8
 TZQVoItGDA/LrvLKUhwgSWiHe3ko9AkvDhIorZSXZGmB6MFQ9VNHT6M4Y/1krj+9ou
 sr4X/6l7CJvt7GNdkDzSQ+JrF8q7EaZTBSXV3/NncJvQnREvyeImlmGABTOXVDx/N1
 f4Tib/vEeBcMa57BLCmqG77iL1rspTKVxTqruvMPOc0qFu0WYargm0maeHI5Js65bf
 vaWa9qWmrAHYe9l8rG9OIGoTlTIvKATg5Rwm/gg7MO/lNC2ByqAEyyFKNo/lXp4VpV
 NlmhC9dzXM7qg==
Received: from debian-rockchip-rock5b-rk3588.. (unknown
 [IPv6:2a01:e0a:5e3:6100:826d:bc07:e98c:84a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: loicmolinari)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id C2AC517E1414;
 Tue, 21 Oct 2025 13:30:58 +0200 (CEST)
From: =?UTF-8?q?Lo=C3=AFc=20Molinari?= <loic.molinari@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Hugh Dickins <hughd@google.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?q?Lo=C3=AFc=20Molinari?= <loic.molinari@collabora.com>,
 Al Viro <viro@zeniv.linux.org.uk>,
 =?UTF-8?q?Miko=C5=82aj=20Wasiak?= <mikolaj.wasiak@intel.com>,
 Christian Brauner <brauner@kernel.org>,
 Nitin Gote <nitin.r.gote@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Christopher Healy <healych@amazon.com>,
 Matthew Wilcox <willy@infradead.org>, Bagas Sanjaya <bagasdotme@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, kernel@collabora.com
Subject: [PATCH v5 04/12] drm/gem: Introduce drm_gem_get_unmapped_area() fop
Date: Tue, 21 Oct 2025 13:30:41 +0200
Message-ID: <20251021113049.17242-5-loic.molinari@collabora.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251021113049.17242-1-loic.molinari@collabora.com>
References: <20251021113049.17242-1-loic.molinari@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

mmap() calls on the DRM file pointer currently always end up using
mm_get_unmapped_area() to get a free mapping region. On builds with
CONFIG_TRANSPARENT_HUGEPAGE enabled, this isn't ideal for GEM objects
backed by shmem buffers on mountpoints setting the 'huge=' option
because it can't correctly figure out the potentially huge address
alignment required.

This commit introduces the drm_gem_get_unmapped_area() function which
is meant to be used as a get_unmapped_area file operation on the DRM
file pointer to lookup GEM objects based on their fake offsets and get
a properly aligned region by calling shmem_get_unmapped_area() with
the right file pointer. If a GEM object isn't available at the given
offset or if the caller isn't granted access to it, the function falls
back to mm_get_unmapped_area().

This also makes drm_gem_get_unmapped_area() part of the default GEM
file operations so that all the DRM drivers can benefit from more
efficient mappings thanks to the huge page fault handler introduced in
previous commit 'drm/shmem-helper: Add huge page fault handler'.

The shmem_get_unmapped_area() function needs to be exported so that
it can be used from the DRM subsystem.

v3:
- add missing include: 'linux/sched/mm.h'
- forward to shmem layer in builds with CONFIG_TRANSPARENT_HUGEPAGE=n

Signed-off-by: Loïc Molinari <loic.molinari@collabora.com>
---
 drivers/gpu/drm/drm_gem.c | 107 ++++++++++++++++++++++++++++++--------
 include/drm/drm_gem.h     |   4 ++
 mm/shmem.c                |   1 +
 3 files changed, 90 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index a1a9c828938b..a98d5744cc6c 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -36,6 +36,7 @@
 #include <linux/module.h>
 #include <linux/pagemap.h>
 #include <linux/pagevec.h>
+#include <linux/sched/mm.h>
 #include <linux/shmem_fs.h>
 #include <linux/slab.h>
 #include <linux/string_helpers.h>
@@ -1187,36 +1188,27 @@ int drm_gem_mmap_obj(struct drm_gem_object *obj, unsigned long obj_size,
 }
 EXPORT_SYMBOL(drm_gem_mmap_obj);
 
-/**
- * drm_gem_mmap - memory map routine for GEM objects
- * @filp: DRM file pointer
- * @vma: VMA for the area to be mapped
- *
- * If a driver supports GEM object mapping, mmap calls on the DRM file
- * descriptor will end up here.
- *
- * Look up the GEM object based on the offset passed in (vma->vm_pgoff will
- * contain the fake offset we created when the GTT map ioctl was called on
- * the object) and map it with a call to drm_gem_mmap_obj().
- *
- * If the caller is not granted access to the buffer object, the mmap will fail
- * with EACCES. Please see the vma manager for more information.
+/*
+ * Look up a GEM object in offset space based on the exact start address. The
+ * caller must be granted access to the object. Returns a GEM object on success
+ * or a negative error code on failure. The returned GEM object needs to be
+ * released with drm_gem_object_put().
  */
-int drm_gem_mmap(struct file *filp, struct vm_area_struct *vma)
+static struct drm_gem_object *
+drm_gem_object_lookup_from_offset(struct file *filp, unsigned long start,
+				  unsigned long pages)
 {
 	struct drm_file *priv = filp->private_data;
 	struct drm_device *dev = priv->minor->dev;
 	struct drm_gem_object *obj = NULL;
 	struct drm_vma_offset_node *node;
-	int ret;
 
 	if (drm_dev_is_unplugged(dev))
-		return -ENODEV;
+		return ERR_PTR(-ENODEV);
 
 	drm_vma_offset_lock_lookup(dev->vma_offset_manager);
 	node = drm_vma_offset_exact_lookup_locked(dev->vma_offset_manager,
-						  vma->vm_pgoff,
-						  vma_pages(vma));
+						  start, pages);
 	if (likely(node)) {
 		obj = container_of(node, struct drm_gem_object, vma_node);
 		/*
@@ -1235,14 +1227,85 @@ int drm_gem_mmap(struct file *filp, struct vm_area_struct *vma)
 	drm_vma_offset_unlock_lookup(dev->vma_offset_manager);
 
 	if (!obj)
-		return -EINVAL;
+		return ERR_PTR(-EINVAL);
 
 	if (!drm_vma_node_is_allowed(node, priv)) {
 		drm_gem_object_put(obj);
-		return -EACCES;
+		return ERR_PTR(-EACCES);
 	}
 
-	ret = drm_gem_mmap_obj(obj, drm_vma_node_size(node) << PAGE_SHIFT,
+	return obj;
+}
+
+/**
+ * drm_gem_get_unmapped_area - get memory mapping region routine for GEM objects
+ * @filp: DRM file pointer
+ * @uaddr: User address hint
+ * @len: Mapping length
+ * @pgoff: Offset (in pages)
+ * @flags: Mapping flags
+ *
+ * If a driver supports GEM object mapping, before ending up in drm_gem_mmap(),
+ * mmap calls on the DRM file descriptor will first try to find a free linear
+ * address space large enough for a mapping. Since GEM objects are backed by
+ * shmem buffers, this should preferably be handled by the shmem virtual memory
+ * filesystem which can appropriately align addresses to huge page sizes when
+ * needed.
+ *
+ * Look up the GEM object based on the offset passed in (vma->vm_pgoff will
+ * contain the fake offset we created) and call shmem_get_unmapped_area() with
+ * the right file pointer.
+ *
+ * If a GEM object is not available at the given offset or if the caller is not
+ * granted access to it, fall back to mm_get_unmapped_area().
+ */
+unsigned long drm_gem_get_unmapped_area(struct file *filp, unsigned long uaddr,
+					unsigned long len, unsigned long pgoff,
+					unsigned long flags)
+{
+	struct drm_gem_object *obj;
+	unsigned long ret;
+
+	obj = drm_gem_object_lookup_from_offset(filp, pgoff, len >> PAGE_SHIFT);
+	if (IS_ERR(obj))
+		return mm_get_unmapped_area(current->mm, filp, uaddr, len, 0,
+					    flags);
+
+	ret = shmem_get_unmapped_area(obj->filp, uaddr, len, 0, flags);
+
+	drm_gem_object_put(obj);
+
+	return ret;
+}
+EXPORT_SYMBOL(drm_gem_get_unmapped_area);
+
+/**
+ * drm_gem_mmap - memory map routine for GEM objects
+ * @filp: DRM file pointer
+ * @vma: VMA for the area to be mapped
+ *
+ * If a driver supports GEM object mapping, mmap calls on the DRM file
+ * descriptor will end up here.
+ *
+ * Look up the GEM object based on the offset passed in (vma->vm_pgoff will
+ * contain the fake offset we created) and map it with a call to
+ * drm_gem_mmap_obj().
+ *
+ * If the caller is not granted access to the buffer object, the mmap will fail
+ * with EACCES. Please see the vma manager for more information.
+ */
+int drm_gem_mmap(struct file *filp, struct vm_area_struct *vma)
+{
+	struct drm_gem_object *obj;
+	int ret;
+
+	obj = drm_gem_object_lookup_from_offset(filp, vma->vm_pgoff,
+						vma_pages(vma));
+	if (IS_ERR(obj))
+		return PTR_ERR(obj);
+
+	ret = drm_gem_mmap_obj(obj,
+			       drm_vma_node_size(&obj->vma_node) << PAGE_SHIFT,
 			       vma);
 
 	drm_gem_object_put(obj);
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index 8d48d2af2649..7c8bd67d087c 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -469,6 +469,7 @@ struct drm_gem_object {
 	.poll		= drm_poll,\
 	.read		= drm_read,\
 	.llseek		= noop_llseek,\
+	.get_unmapped_area	= drm_gem_get_unmapped_area,\
 	.mmap		= drm_gem_mmap, \
 	.fop_flags	= FOP_UNSIGNED_OFFSET
 
@@ -506,6 +507,9 @@ void drm_gem_vm_close(struct vm_area_struct *vma);
 int drm_gem_mmap_obj(struct drm_gem_object *obj, unsigned long obj_size,
 		     struct vm_area_struct *vma);
 int drm_gem_mmap(struct file *filp, struct vm_area_struct *vma);
+unsigned long drm_gem_get_unmapped_area(struct file *filp, unsigned long uaddr,
+					unsigned long len, unsigned long pgoff,
+					unsigned long flags);
 
 /**
  * drm_gem_object_get - acquire a GEM buffer object reference
diff --git a/mm/shmem.c b/mm/shmem.c
index b9081b817d28..612218fc95cb 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -2851,6 +2851,7 @@ unsigned long shmem_get_unmapped_area(struct file *file,
 		return addr;
 	return inflated_addr;
 }
+EXPORT_SYMBOL_GPL(shmem_get_unmapped_area);
 
 #ifdef CONFIG_NUMA
 static int shmem_set_policy(struct vm_area_struct *vma, struct mempolicy *mpol)
-- 
2.47.3

