Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D349CB026F
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 15:02:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43DCE10E5E2;
	Tue,  9 Dec 2025 14:02:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7739910E5EA
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Dec 2025 14:02:13 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BDFDE33811;
 Tue,  9 Dec 2025 14:01:59 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 621243EA63;
 Tue,  9 Dec 2025 14:01:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id +AAGFdYrOGm1OgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 09 Dec 2025 14:01:58 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: boris.brezillon@collabora.com, simona@ffwll.ch, airlied@gmail.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com, ogabbay@kernel.org,
 mamin506@gmail.com, lizhi.hou@amd.com, maciej.falkowski@linux.intel.com,
 karol.wachowski@linux.intel.com, tomeu@tomeuvizoso.net,
 frank.binns@imgtec.com, matt.coster@imgtec.com, yuq825@gmail.com,
 robh@kernel.org, steven.price@arm.com, adrian.larumbe@collabora.com,
 liviu.dudau@arm.com, mwen@igalia.com, kraxel@redhat.com,
 dmitry.osipenko@collabora.com, gurchetansingh@chromium.org,
 olvaffe@gmail.com, corbet@lwn.net
Cc: dri-devel@lists.freedesktop.org, lima@lists.freedesktop.org,
 virtualization@lists.linux.dev, linux-doc@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 09/13] drm/v3d: Use GEM-UMA helpers for memory management
Date: Tue,  9 Dec 2025 14:42:06 +0100
Message-ID: <20251209140141.94407-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251209140141.94407-1-tzimmermann@suse.de>
References: <20251209140141.94407-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: BDFDE33811
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Level: 
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

Convert v3d from GEM-SHMEM to GEM-UMA. The latter is just a copy,
so this change it merely renaming symbols. No functional changes.

GEM-SHMEM will become more self-contained for drivers without specific
memory management. GEM-UMA's interfaces will remain flexible for drivers
with UMA hardware, such as v3d.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/v3d/Kconfig   |  2 +-
 drivers/gpu/drm/v3d/v3d_bo.c  | 45 +++++++++++++++++------------------
 drivers/gpu/drm/v3d/v3d_drv.h |  4 ++--
 drivers/gpu/drm/v3d/v3d_mmu.c |  9 ++++---
 4 files changed, 29 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/v3d/Kconfig b/drivers/gpu/drm/v3d/Kconfig
index ce62c5908e1d..4345cb0f4dd6 100644
--- a/drivers/gpu/drm/v3d/Kconfig
+++ b/drivers/gpu/drm/v3d/Kconfig
@@ -5,8 +5,8 @@ config DRM_V3D
 	depends on DRM
 	depends on COMMON_CLK
 	depends on MMU
+	select DRM_GEM_UMA_HELPER
 	select DRM_SCHED
-	select DRM_GEM_SHMEM_HELPER
 	help
 	  Choose this option if you have a system that has a Broadcom
 	  V3D 3.x or newer GPUs. SoCs supported include the BCM2711,
diff --git a/drivers/gpu/drm/v3d/v3d_bo.c b/drivers/gpu/drm/v3d/v3d_bo.c
index d9547f5117b9..842881e5f9a3 100644
--- a/drivers/gpu/drm/v3d/v3d_bo.c
+++ b/drivers/gpu/drm/v3d/v3d_bo.c
@@ -5,7 +5,7 @@
  * DOC: V3D GEM BO management support
  *
  * Compared to VC4 (V3D 2.x), V3D 3.3 introduces an MMU between the
- * GPU and the bus, allowing us to use shmem objects for our storage
+ * GPU and the bus, allowing us to use UMA objects for our storage
  * instead of CMA.
  *
  * Physically contiguous objects may still be imported to V3D, but the
@@ -59,20 +59,20 @@ void v3d_free_object(struct drm_gem_object *obj)
 	/* GPU execution may have dirtied any pages in the BO. */
 	bo->base.pages_mark_dirty_on_put = true;
 
-	drm_gem_shmem_free(&bo->base);
+	drm_gem_uma_free(&bo->base);
 }
 
 static const struct drm_gem_object_funcs v3d_gem_funcs = {
 	.free = v3d_free_object,
-	.print_info = drm_gem_shmem_object_print_info,
-	.pin = drm_gem_shmem_object_pin,
-	.unpin = drm_gem_shmem_object_unpin,
-	.get_sg_table = drm_gem_shmem_object_get_sg_table,
-	.vmap = drm_gem_shmem_object_vmap,
-	.vunmap = drm_gem_shmem_object_vunmap,
-	.mmap = drm_gem_shmem_object_mmap,
+	.print_info = drm_gem_uma_object_print_info,
+	.pin = drm_gem_uma_object_pin,
+	.unpin = drm_gem_uma_object_unpin,
+	.get_sg_table = drm_gem_uma_object_get_sg_table,
+	.vmap = drm_gem_uma_object_vmap,
+	.vunmap = drm_gem_uma_object_vunmap,
+	.mmap = drm_gem_uma_object_mmap,
 	.status = v3d_gem_status,
-	.vm_ops = &drm_gem_shmem_vm_ops,
+	.vm_ops = &drm_gem_uma_vm_ops,
 };
 
 /* gem_create_object function for allocating a BO struct and doing
@@ -108,9 +108,9 @@ v3d_bo_create_finish(struct drm_gem_object *obj)
 	int ret;
 
 	/* So far we pin the BO in the MMU for its lifetime, so use
-	 * shmem's helper for getting a lifetime sgt.
+	 * UMA's helper for getting a lifetime sgt.
 	 */
-	sgt = drm_gem_shmem_get_pages_sgt(&bo->base);
+	sgt = drm_gem_uma_get_pages_sgt(&bo->base);
 	if (IS_ERR(sgt))
 		return PTR_ERR(sgt);
 
@@ -149,26 +149,25 @@ v3d_bo_create_finish(struct drm_gem_object *obj)
 struct v3d_bo *v3d_bo_create(struct drm_device *dev, struct drm_file *file_priv,
 			     size_t unaligned_size)
 {
-	struct drm_gem_shmem_object *shmem_obj;
+	struct drm_gem_uma_object *uma_obj;
 	struct v3d_dev *v3d = to_v3d_dev(dev);
 	struct v3d_bo *bo;
 	int ret;
 
-	shmem_obj = drm_gem_shmem_create_with_mnt(dev, unaligned_size,
-						  v3d->gemfs);
-	if (IS_ERR(shmem_obj))
-		return ERR_CAST(shmem_obj);
-	bo = to_v3d_bo(&shmem_obj->base);
+	uma_obj = drm_gem_uma_create_with_mnt(dev, unaligned_size, v3d->gemfs);
+	if (IS_ERR(uma_obj))
+		return ERR_CAST(uma_obj);
+	bo = to_v3d_bo(&uma_obj->base);
 	bo->vaddr = NULL;
 
-	ret = v3d_bo_create_finish(&shmem_obj->base);
+	ret = v3d_bo_create_finish(&uma_obj->base);
 	if (ret)
 		goto free_obj;
 
 	return bo;
 
 free_obj:
-	drm_gem_shmem_free(shmem_obj);
+	drm_gem_uma_free(uma_obj);
 	return ERR_PTR(ret);
 }
 
@@ -180,13 +179,13 @@ v3d_prime_import_sg_table(struct drm_device *dev,
 	struct drm_gem_object *obj;
 	int ret;
 
-	obj = drm_gem_shmem_prime_import_sg_table(dev, attach, sgt);
+	obj = drm_gem_uma_prime_import_sg_table(dev, attach, sgt);
 	if (IS_ERR(obj))
 		return obj;
 
 	ret = v3d_bo_create_finish(obj);
 	if (ret) {
-		drm_gem_shmem_free(&to_v3d_bo(obj)->base);
+		drm_gem_uma_free(&to_v3d_bo(obj)->base);
 		return ERR_PTR(ret);
 	}
 
@@ -195,7 +194,7 @@ v3d_prime_import_sg_table(struct drm_device *dev,
 
 void v3d_get_bo_vaddr(struct v3d_bo *bo)
 {
-	struct drm_gem_shmem_object *obj = &bo->base;
+	struct drm_gem_uma_object *obj = &bo->base;
 
 	bo->vaddr = vmap(obj->pages, obj->base.size >> PAGE_SHIFT, VM_MAP,
 			 pgprot_writecombine(PAGE_KERNEL));
diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
index 1884686985b8..3843d10fbd72 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.h
+++ b/drivers/gpu/drm/v3d/v3d_drv.h
@@ -8,7 +8,7 @@
 
 #include <drm/drm_encoder.h>
 #include <drm/drm_gem.h>
-#include <drm/drm_gem_shmem_helper.h>
+#include <drm/drm_gem_uma_helper.h>
 #include <drm/gpu_scheduler.h>
 
 #include "v3d_performance_counters.h"
@@ -243,7 +243,7 @@ struct v3d_file_priv {
 };
 
 struct v3d_bo {
-	struct drm_gem_shmem_object base;
+	struct drm_gem_uma_object base;
 
 	struct drm_mm_node node;
 
diff --git a/drivers/gpu/drm/v3d/v3d_mmu.c b/drivers/gpu/drm/v3d/v3d_mmu.c
index a25d25a8ae61..a634ac3eaaf6 100644
--- a/drivers/gpu/drm/v3d/v3d_mmu.c
+++ b/drivers/gpu/drm/v3d/v3d_mmu.c
@@ -82,13 +82,13 @@ int v3d_mmu_set_page_table(struct v3d_dev *v3d)
 
 void v3d_mmu_insert_ptes(struct v3d_bo *bo)
 {
-	struct drm_gem_shmem_object *shmem_obj = &bo->base;
-	struct v3d_dev *v3d = to_v3d_dev(shmem_obj->base.dev);
+	struct drm_gem_uma_object *uma_obj = &bo->base;
+	struct v3d_dev *v3d = to_v3d_dev(uma_obj->base.dev);
 	u32 page = bo->node.start;
 	struct scatterlist *sgl;
 	unsigned int count;
 
-	for_each_sgtable_dma_sg(shmem_obj->sgt, sgl, count) {
+	for_each_sgtable_dma_sg(uma_obj->sgt, sgl, count) {
 		dma_addr_t dma_addr = sg_dma_address(sgl);
 		u32 pfn = dma_addr >> V3D_MMU_PAGE_SHIFT;
 		unsigned int len = sg_dma_len(sgl);
@@ -121,8 +121,7 @@ void v3d_mmu_insert_ptes(struct v3d_bo *bo)
 		}
 	}
 
-	WARN_ON_ONCE(page - bo->node.start !=
-		     shmem_obj->base.size >> V3D_MMU_PAGE_SHIFT);
+	WARN_ON_ONCE(page - bo->node.start != uma_obj->base.size >> V3D_MMU_PAGE_SHIFT);
 
 	if (v3d_mmu_flush_all(v3d))
 		dev_err(v3d->drm.dev, "MMU flush timeout\n");
-- 
2.52.0

