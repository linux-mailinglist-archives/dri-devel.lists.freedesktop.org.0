Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C21FCB025A
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 15:02:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 369C710E5DE;
	Tue,  9 Dec 2025 14:02:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="cqhBHfT4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="P4xhmoDW";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cqhBHfT4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="P4xhmoDW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25B0910E5D8
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Dec 2025 14:02:05 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7FB913381F;
 Tue,  9 Dec 2025 14:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1765288914; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0BPRgbn+VMryxVwhHXcyhnZPXvAx2CN2OA0mb4bhkZY=;
 b=cqhBHfT4pNTWYDg4G8B4VENEH2pSqX1lXi3JrpgjV5R+7oADbiQWXEnlO/eipjCt+1uEM0
 BBaJsZY3n33cOYeudFVc08ZLIaZo7xwJovfXKrLpoPVU9X5TvelCW5QO0EAJICtSKcX73K
 xU8OQW//jAH/WYfNcOFdquKLRzRRwTM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1765288914;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0BPRgbn+VMryxVwhHXcyhnZPXvAx2CN2OA0mb4bhkZY=;
 b=P4xhmoDWethhltskM0M32zeqougROc9GOfJ8loMc54OPLbrWVzlggZSZtenv4eA4vVdiHH
 3U037udh+jqcrSCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1765288914; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0BPRgbn+VMryxVwhHXcyhnZPXvAx2CN2OA0mb4bhkZY=;
 b=cqhBHfT4pNTWYDg4G8B4VENEH2pSqX1lXi3JrpgjV5R+7oADbiQWXEnlO/eipjCt+1uEM0
 BBaJsZY3n33cOYeudFVc08ZLIaZo7xwJovfXKrLpoPVU9X5TvelCW5QO0EAJICtSKcX73K
 xU8OQW//jAH/WYfNcOFdquKLRzRRwTM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1765288914;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0BPRgbn+VMryxVwhHXcyhnZPXvAx2CN2OA0mb4bhkZY=;
 b=P4xhmoDWethhltskM0M32zeqougROc9GOfJ8loMc54OPLbrWVzlggZSZtenv4eA4vVdiHH
 3U037udh+jqcrSCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3822B3EA65;
 Tue,  9 Dec 2025 14:01:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 8HsLC9ErOGm1OgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 09 Dec 2025 14:01:53 +0000
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
Subject: [PATCH 05/13] drm/imagination: Use GEM-UMA helpers for memory
 management
Date: Tue,  9 Dec 2025 14:42:02 +0100
Message-ID: <20251209140141.94407-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251209140141.94407-1-tzimmermann@suse.de>
References: <20251209140141.94407-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MID_CONTAINS_FROM(1.00)[]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-0.998]; MIME_GOOD(-0.10)[text/plain];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
 RCPT_COUNT_TWELVE(0.00)[29]; MIME_TRACE(0.00)[0:+];
 TO_DN_SOME(0.00)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_TO(0.00)[collabora.com,ffwll.ch,gmail.com,kernel.org,linux.intel.com,amd.com,tomeuvizoso.net,imgtec.com,arm.com,igalia.com,redhat.com,chromium.org,lwn.net];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_TLS_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 R_RATELIMIT(0.00)[to_ip_from(RLzxzh56npx61idbi11ft8b9pb)];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -6.80
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

Convert imagination from GEM-SHMEM to GEM-UMA. The latter is just a
copy, so this change it merely renaming symbols. No functional changes.

GEM-SHMEM will become more self-contained for drivers without specific
memory management. GEM-UMA's interfaces will remain flexible for drivers
with UMA hardware, such as imagination.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/imagination/Kconfig         |  4 +-
 drivers/gpu/drm/imagination/pvr_drv.c       |  2 +-
 drivers/gpu/drm/imagination/pvr_free_list.c |  2 +-
 drivers/gpu/drm/imagination/pvr_gem.c       | 74 ++++++++++-----------
 drivers/gpu/drm/imagination/pvr_gem.h       | 12 ++--
 5 files changed, 47 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/imagination/Kconfig b/drivers/gpu/drm/imagination/Kconfig
index 0482bfcefdde..ee796c9cfdf2 100644
--- a/drivers/gpu/drm/imagination/Kconfig
+++ b/drivers/gpu/drm/imagination/Kconfig
@@ -9,9 +9,9 @@ config DRM_POWERVR
 	depends on PM
 	depends on POWER_SEQUENCING || !POWER_SEQUENCING
 	select DRM_EXEC
-	select DRM_GEM_SHMEM_HELPER
-	select DRM_SCHED
+	select DRM_GEM_UMA_HELPER
 	select DRM_GPUVM
+	select DRM_SCHED
 	select FW_LOADER
 	help
 	  Choose this option if you have a system that has an Imagination
diff --git a/drivers/gpu/drm/imagination/pvr_drv.c b/drivers/gpu/drm/imagination/pvr_drv.c
index 916b40ced7eb..61bcbbef208c 100644
--- a/drivers/gpu/drm/imagination/pvr_drv.c
+++ b/drivers/gpu/drm/imagination/pvr_drv.c
@@ -1392,7 +1392,7 @@ static struct drm_driver pvr_drm_driver = {
 	.minor = PVR_DRIVER_MINOR,
 	.patchlevel = PVR_DRIVER_PATCHLEVEL,
 
-	.gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table,
+	.gem_prime_import_sg_table = drm_gem_uma_prime_import_sg_table,
 	.gem_create_object = pvr_gem_create_object,
 };
 
diff --git a/drivers/gpu/drm/imagination/pvr_free_list.c b/drivers/gpu/drm/imagination/pvr_free_list.c
index 5228e214491c..5b43f7ca2a6c 100644
--- a/drivers/gpu/drm/imagination/pvr_free_list.c
+++ b/drivers/gpu/drm/imagination/pvr_free_list.c
@@ -281,7 +281,7 @@ pvr_free_list_insert_node_locked(struct pvr_free_list_node *free_list_node)
 	offset = (start_page * FREE_LIST_ENTRY_SIZE) &
 		  ~((u64)ROGUE_BIF_PM_FREELIST_BASE_ADDR_ALIGNSIZE - 1);
 
-	sgt = drm_gem_shmem_get_pages_sgt(&free_list_node->mem_obj->base);
+	sgt = drm_gem_uma_get_pages_sgt(&free_list_node->mem_obj->base);
 	if (WARN_ON(IS_ERR(sgt)))
 		return PTR_ERR(sgt);
 
diff --git a/drivers/gpu/drm/imagination/pvr_gem.c b/drivers/gpu/drm/imagination/pvr_gem.c
index a66cf082af24..f29c9808f4e2 100644
--- a/drivers/gpu/drm/imagination/pvr_gem.c
+++ b/drivers/gpu/drm/imagination/pvr_gem.c
@@ -25,30 +25,30 @@
 
 static void pvr_gem_object_free(struct drm_gem_object *obj)
 {
-	drm_gem_shmem_object_free(obj);
+	drm_gem_uma_object_free(obj);
 }
 
 static int pvr_gem_mmap(struct drm_gem_object *gem_obj, struct vm_area_struct *vma)
 {
 	struct pvr_gem_object *pvr_obj = gem_to_pvr_gem(gem_obj);
-	struct drm_gem_shmem_object *shmem_obj = shmem_gem_from_pvr_gem(pvr_obj);
+	struct drm_gem_uma_object *uma_obj = uma_gem_from_pvr_gem(pvr_obj);
 
 	if (!(pvr_obj->flags & DRM_PVR_BO_ALLOW_CPU_USERSPACE_ACCESS))
 		return -EINVAL;
 
-	return drm_gem_shmem_mmap(shmem_obj, vma);
+	return drm_gem_uma_mmap(uma_obj, vma);
 }
 
 static const struct drm_gem_object_funcs pvr_gem_object_funcs = {
 	.free = pvr_gem_object_free,
-	.print_info = drm_gem_shmem_object_print_info,
-	.pin = drm_gem_shmem_object_pin,
-	.unpin = drm_gem_shmem_object_unpin,
-	.get_sg_table = drm_gem_shmem_object_get_sg_table,
-	.vmap = drm_gem_shmem_object_vmap,
-	.vunmap = drm_gem_shmem_object_vunmap,
+	.print_info = drm_gem_uma_object_print_info,
+	.pin = drm_gem_uma_object_pin,
+	.unpin = drm_gem_uma_object_unpin,
+	.get_sg_table = drm_gem_uma_object_get_sg_table,
+	.vmap = drm_gem_uma_object_vmap,
+	.vunmap = drm_gem_uma_object_vunmap,
 	.mmap = pvr_gem_mmap,
-	.vm_ops = &drm_gem_shmem_vm_ops,
+	.vm_ops = &drm_gem_uma_vm_ops,
 };
 
 /**
@@ -195,25 +195,25 @@ pvr_gem_object_from_handle(struct pvr_file *pvr_file, u32 handle)
 void *
 pvr_gem_object_vmap(struct pvr_gem_object *pvr_obj)
 {
-	struct drm_gem_shmem_object *shmem_obj = shmem_gem_from_pvr_gem(pvr_obj);
+	struct drm_gem_uma_object *uma_obj = uma_gem_from_pvr_gem(pvr_obj);
 	struct drm_gem_object *obj = gem_from_pvr_gem(pvr_obj);
 	struct iosys_map map;
 	int err;
 
 	dma_resv_lock(obj->resv, NULL);
 
-	err = drm_gem_shmem_vmap_locked(shmem_obj, &map);
+	err = drm_gem_uma_vmap_locked(uma_obj, &map);
 	if (err)
 		goto err_unlock;
 
 	if (pvr_obj->flags & PVR_BO_CPU_CACHED) {
-		struct device *dev = shmem_obj->base.dev->dev;
+		struct device *dev = uma_obj->base.dev->dev;
 
-		/* If shmem_obj->sgt is NULL, that means the buffer hasn't been mapped
+		/* If uma_obj->sgt is NULL, that means the buffer hasn't been mapped
 		 * in GPU space yet.
 		 */
-		if (shmem_obj->sgt)
-			dma_sync_sgtable_for_cpu(dev, shmem_obj->sgt, DMA_BIDIRECTIONAL);
+		if (uma_obj->sgt)
+			dma_sync_sgtable_for_cpu(dev, uma_obj->sgt, DMA_BIDIRECTIONAL);
 	}
 
 	dma_resv_unlock(obj->resv);
@@ -237,8 +237,8 @@ pvr_gem_object_vmap(struct pvr_gem_object *pvr_obj)
 void
 pvr_gem_object_vunmap(struct pvr_gem_object *pvr_obj)
 {
-	struct drm_gem_shmem_object *shmem_obj = shmem_gem_from_pvr_gem(pvr_obj);
-	struct iosys_map map = IOSYS_MAP_INIT_VADDR(shmem_obj->vaddr);
+	struct drm_gem_uma_object *uma_obj = uma_gem_from_pvr_gem(pvr_obj);
+	struct iosys_map map = IOSYS_MAP_INIT_VADDR(uma_obj->vaddr);
 	struct drm_gem_object *obj = gem_from_pvr_gem(pvr_obj);
 
 	if (WARN_ON(!map.vaddr))
@@ -247,16 +247,16 @@ pvr_gem_object_vunmap(struct pvr_gem_object *pvr_obj)
 	dma_resv_lock(obj->resv, NULL);
 
 	if (pvr_obj->flags & PVR_BO_CPU_CACHED) {
-		struct device *dev = shmem_obj->base.dev->dev;
+		struct device *dev = uma_obj->base.dev->dev;
 
-		/* If shmem_obj->sgt is NULL, that means the buffer hasn't been mapped
+		/* If uma_obj->sgt is NULL, that means the buffer hasn't been mapped
 		 * in GPU space yet.
 		 */
-		if (shmem_obj->sgt)
-			dma_sync_sgtable_for_device(dev, shmem_obj->sgt, DMA_BIDIRECTIONAL);
+		if (uma_obj->sgt)
+			dma_sync_sgtable_for_device(dev, uma_obj->sgt, DMA_BIDIRECTIONAL);
 	}
 
-	drm_gem_shmem_vunmap_locked(shmem_obj, &map);
+	drm_gem_uma_vunmap_locked(uma_obj, &map);
 
 	dma_resv_unlock(obj->resv);
 }
@@ -336,7 +336,7 @@ struct pvr_gem_object *
 pvr_gem_object_create(struct pvr_device *pvr_dev, size_t size, u64 flags)
 {
 	struct drm_device *drm_dev = from_pvr_device(pvr_dev);
-	struct drm_gem_shmem_object *shmem_obj;
+	struct drm_gem_uma_object *uma_obj;
 	struct pvr_gem_object *pvr_obj;
 	struct sg_table *sgt;
 	int err;
@@ -348,19 +348,19 @@ pvr_gem_object_create(struct pvr_device *pvr_dev, size_t size, u64 flags)
 	if (device_get_dma_attr(drm_dev->dev) == DEV_DMA_COHERENT)
 		flags |= PVR_BO_CPU_CACHED;
 
-	shmem_obj = drm_gem_shmem_create(drm_dev, size);
-	if (IS_ERR(shmem_obj))
-		return ERR_CAST(shmem_obj);
+	uma_obj = drm_gem_uma_create(drm_dev, size);
+	if (IS_ERR(uma_obj))
+		return ERR_CAST(uma_obj);
 
-	shmem_obj->pages_mark_dirty_on_put = true;
-	shmem_obj->map_wc = !(flags & PVR_BO_CPU_CACHED);
-	pvr_obj = shmem_gem_to_pvr_gem(shmem_obj);
+	uma_obj->pages_mark_dirty_on_put = true;
+	uma_obj->map_wc = !(flags & PVR_BO_CPU_CACHED);
+	pvr_obj = uma_gem_to_pvr_gem(uma_obj);
 	pvr_obj->flags = flags;
 
-	sgt = drm_gem_shmem_get_pages_sgt(shmem_obj);
+	sgt = drm_gem_uma_get_pages_sgt(uma_obj);
 	if (IS_ERR(sgt)) {
 		err = PTR_ERR(sgt);
-		goto err_shmem_object_free;
+		goto err_uma_object_free;
 	}
 
 	dma_sync_sgtable_for_device(drm_dev->dev, sgt, DMA_BIDIRECTIONAL);
@@ -373,8 +373,8 @@ pvr_gem_object_create(struct pvr_device *pvr_dev, size_t size, u64 flags)
 
 	return pvr_obj;
 
-err_shmem_object_free:
-	drm_gem_shmem_free(shmem_obj);
+err_uma_object_free:
+	drm_gem_uma_free(uma_obj);
 
 	return ERR_PTR(err);
 }
@@ -394,13 +394,13 @@ int
 pvr_gem_get_dma_addr(struct pvr_gem_object *pvr_obj, u32 offset,
 		     dma_addr_t *dma_addr_out)
 {
-	struct drm_gem_shmem_object *shmem_obj = shmem_gem_from_pvr_gem(pvr_obj);
+	struct drm_gem_uma_object *uma_obj = uma_gem_from_pvr_gem(pvr_obj);
 	u32 accumulated_offset = 0;
 	struct scatterlist *sgl;
 	unsigned int sgt_idx;
 
-	WARN_ON(!shmem_obj->sgt);
-	for_each_sgtable_dma_sg(shmem_obj->sgt, sgl, sgt_idx) {
+	WARN_ON(!uma_obj->sgt);
+	for_each_sgtable_dma_sg(uma_obj->sgt, sgl, sgt_idx) {
 		u32 new_offset = accumulated_offset + sg_dma_len(sgl);
 
 		if (offset >= accumulated_offset && offset < new_offset) {
diff --git a/drivers/gpu/drm/imagination/pvr_gem.h b/drivers/gpu/drm/imagination/pvr_gem.h
index c99f30cc6208..59223876b3f7 100644
--- a/drivers/gpu/drm/imagination/pvr_gem.h
+++ b/drivers/gpu/drm/imagination/pvr_gem.h
@@ -10,7 +10,7 @@
 #include <uapi/drm/pvr_drm.h>
 
 #include <drm/drm_gem.h>
-#include <drm/drm_gem_shmem_helper.h>
+#include <drm/drm_gem_uma_helper.h>
 #include <drm/drm_mm.h>
 
 #include <linux/bitfield.h>
@@ -82,12 +82,12 @@ struct pvr_file;
  */
 struct pvr_gem_object {
 	/**
-	 * @base: The underlying &struct drm_gem_shmem_object.
+	 * @base: The underlying &struct drm_gem_uma_object.
 	 *
 	 * Do not access this member directly, instead call
 	 * shem_gem_from_pvr_gem().
 	 */
-	struct drm_gem_shmem_object base;
+	struct drm_gem_uma_object base;
 
 	/**
 	 * @flags: Options set at creation-time. Some of these options apply to
@@ -111,9 +111,9 @@ struct pvr_gem_object {
 static_assert(offsetof(struct pvr_gem_object, base) == 0,
 	      "offsetof(struct pvr_gem_object, base) not zero");
 
-#define shmem_gem_from_pvr_gem(pvr_obj) (&(pvr_obj)->base)
+#define uma_gem_from_pvr_gem(pvr_obj) (&(pvr_obj)->base)
 
-#define shmem_gem_to_pvr_gem(shmem_obj) container_of_const(shmem_obj, struct pvr_gem_object, base)
+#define uma_gem_to_pvr_gem(uma_obj) container_of_const(uma_obj, struct pvr_gem_object, base)
 
 #define gem_from_pvr_gem(pvr_obj) (&(pvr_obj)->base.base)
 
@@ -134,7 +134,7 @@ struct pvr_gem_object *pvr_gem_object_from_handle(struct pvr_file *pvr_file,
 static __always_inline struct sg_table *
 pvr_gem_object_get_pages_sgt(struct pvr_gem_object *pvr_obj)
 {
-	return drm_gem_shmem_get_pages_sgt(shmem_gem_from_pvr_gem(pvr_obj));
+	return drm_gem_uma_get_pages_sgt(uma_gem_from_pvr_gem(pvr_obj));
 }
 
 void *pvr_gem_object_vmap(struct pvr_gem_object *pvr_obj);
-- 
2.52.0

