Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B08FCB0278
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 15:02:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C52D310E5EC;
	Tue,  9 Dec 2025 14:02:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="gKrByR8o";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3ZszYtzY";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gKrByR8o";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3ZszYtzY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2628510E5EB
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Dec 2025 14:02:17 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 206BC336FA;
 Tue,  9 Dec 2025 14:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1765288921; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f2ZlLZsteXqs2Fwj3hwtwFsJvwq1OIfup6nGxNoro8w=;
 b=gKrByR8ojDnkQJ/RXX1oYHvrEIlnUUOmb2he6wqzJB6aeaiqJkGeIUV8hwMI5vGDVJ2EQB
 eYhL9gnjAT3EWsggpZMVaHt4u369FKuFeDlxPAYdm9bMXP+oJbp7fu/mPK4WXfCqw0vaIq
 al+k4NI/kNN1iixnDyCpTAeJdUKroZ8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1765288921;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f2ZlLZsteXqs2Fwj3hwtwFsJvwq1OIfup6nGxNoro8w=;
 b=3ZszYtzYF46C9R99DpPweNWoeF+cJXU/nhvf8aUugrfURQEs/ZRCpeE857x0ztZhRqFWzH
 n4A8f5VWZ/4nHrBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1765288921; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f2ZlLZsteXqs2Fwj3hwtwFsJvwq1OIfup6nGxNoro8w=;
 b=gKrByR8ojDnkQJ/RXX1oYHvrEIlnUUOmb2he6wqzJB6aeaiqJkGeIUV8hwMI5vGDVJ2EQB
 eYhL9gnjAT3EWsggpZMVaHt4u369FKuFeDlxPAYdm9bMXP+oJbp7fu/mPK4WXfCqw0vaIq
 al+k4NI/kNN1iixnDyCpTAeJdUKroZ8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1765288921;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f2ZlLZsteXqs2Fwj3hwtwFsJvwq1OIfup6nGxNoro8w=;
 b=3ZszYtzYF46C9R99DpPweNWoeF+cJXU/nhvf8aUugrfURQEs/ZRCpeE857x0ztZhRqFWzH
 n4A8f5VWZ/4nHrBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C3CA23EA65;
 Tue,  9 Dec 2025 14:01:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id eE1ELdcrOGm1OgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 09 Dec 2025 14:01:59 +0000
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
Subject: [PATCH 10/13] drm/virtgpu: Use GEM-UMA helpers for memory management
Date: Tue,  9 Dec 2025 14:42:07 +0100
Message-ID: <20251209140141.94407-11-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251209140141.94407-1-tzimmermann@suse.de>
References: <20251209140141.94407-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -6.80
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MID_CONTAINS_FROM(1.00)[]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
 RCPT_COUNT_TWELVE(0.00)[29]; MIME_TRACE(0.00)[0:+];
 TO_DN_SOME(0.00)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_TO(0.00)[collabora.com,ffwll.ch,gmail.com,kernel.org,linux.intel.com,amd.com,tomeuvizoso.net,imgtec.com,arm.com,igalia.com,redhat.com,chromium.org,lwn.net];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_TLS_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 R_RATELIMIT(0.00)[to_ip_from(RLzxzh56npx61idbi11ft8b9pb)];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
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

Convert virtgpu from GEM-SHMEM to GEM-UMA. The latter is just a copy,
so this change it merely renaming symbols. No functional changes.

GEM-SHMEM will become more self-contained for drivers without specific
memory management. GEM-UMA's interfaces will remain flexible for drivers
with UMA hardware, such as virtgpu.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/virtio/Kconfig          |  4 +-
 drivers/gpu/drm/virtio/virtgpu_drv.c    |  4 +-
 drivers/gpu/drm/virtio/virtgpu_drv.h    | 12 ++---
 drivers/gpu/drm/virtio/virtgpu_object.c | 64 ++++++++++++-------------
 drivers/gpu/drm/virtio/virtgpu_plane.c  |  6 +--
 drivers/gpu/drm/virtio/virtgpu_vq.c     |  6 +--
 6 files changed, 48 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/virtio/Kconfig b/drivers/gpu/drm/virtio/Kconfig
index fc884fb57b7e..eee61fce17fc 100644
--- a/drivers/gpu/drm/virtio/Kconfig
+++ b/drivers/gpu/drm/virtio/Kconfig
@@ -2,10 +2,10 @@
 config DRM_VIRTIO_GPU
 	tristate "Virtio GPU driver"
 	depends on DRM && VIRTIO_MENU && MMU
-	select VIRTIO
 	select DRM_CLIENT_SELECTION
+	select DRM_GEM_UMA_HELPER
 	select DRM_KMS_HELPER
-	select DRM_GEM_SHMEM_HELPER
+	select VIRTIO
 	select VIRTIO_DMA_SHARED_BUFFER
 	help
 	   This is the virtual GPU driver for virtio.  It can be used with
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index a5ce96fb8a1d..8dbaa021f90f 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -37,7 +37,7 @@
 #include <drm/drm.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fbdev_shmem.h>
+#include <drm/drm_fbdev_uma.h>
 #include <drm/drm_file.h>
 #include <drm/drm_print.h>
 
@@ -234,7 +234,7 @@ static const struct drm_driver driver = {
 
 	.dumb_create = virtio_gpu_mode_dumb_create,
 
-	DRM_FBDEV_SHMEM_DRIVER_OPS,
+	DRM_FBDEV_UMA_DRIVER_OPS,
 
 #if defined(CONFIG_DEBUG_FS)
 	.debugfs_init = virtio_gpu_debugfs_init,
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index f17660a71a3e..d7a2293cc794 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -38,7 +38,7 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem.h>
-#include <drm/drm_gem_shmem_helper.h>
+#include <drm/drm_gem_uma_helper.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/virtgpu_drm.h>
@@ -87,7 +87,7 @@ struct virtio_gpu_object_params {
 };
 
 struct virtio_gpu_object {
-	struct drm_gem_shmem_object base;
+	struct drm_gem_uma_object base;
 	struct sg_table *sgt;
 	uint32_t hw_res_handle;
 	bool dumb;
@@ -102,7 +102,7 @@ struct virtio_gpu_object {
 #define gem_to_virtio_gpu_obj(gobj) \
 	container_of((gobj), struct virtio_gpu_object, base.base)
 
-struct virtio_gpu_object_shmem {
+struct virtio_gpu_object_uma {
 	struct virtio_gpu_object base;
 };
 
@@ -113,8 +113,8 @@ struct virtio_gpu_object_vram {
 	struct drm_mm_node vram_node;
 };
 
-#define to_virtio_gpu_shmem(virtio_gpu_object) \
-	container_of((virtio_gpu_object), struct virtio_gpu_object_shmem, base)
+#define to_virtio_gpu_uma(virtio_gpu_object) \
+	container_of((virtio_gpu_object), struct virtio_gpu_object_uma, base)
 
 #define to_virtio_gpu_vram(virtio_gpu_object) \
 	container_of((virtio_gpu_object), struct virtio_gpu_object_vram, base)
@@ -474,7 +474,7 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 			     struct virtio_gpu_object **bo_ptr,
 			     struct virtio_gpu_fence *fence);
 
-bool virtio_gpu_is_shmem(struct virtio_gpu_object *bo);
+bool virtio_gpu_is_uma(struct virtio_gpu_object *bo);
 
 int virtio_gpu_resource_id_get(struct virtio_gpu_device *vgdev,
 			       uint32_t *resid);
diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index 4270bfede7b9..31cc96b9b5a0 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -68,8 +68,8 @@ void virtio_gpu_cleanup_object(struct virtio_gpu_object *bo)
 	struct virtio_gpu_device *vgdev = bo->base.base.dev->dev_private;
 
 	virtio_gpu_resource_id_put(vgdev, bo->hw_res_handle);
-	if (virtio_gpu_is_shmem(bo)) {
-		drm_gem_shmem_free(&bo->base);
+	if (virtio_gpu_is_uma(bo)) {
+		drm_gem_uma_free(&bo->base);
 	} else if (virtio_gpu_is_vram(bo)) {
 		struct virtio_gpu_object_vram *vram = to_virtio_gpu_vram(bo);
 
@@ -123,52 +123,52 @@ int virtio_gpu_detach_object_fenced(struct virtio_gpu_object *bo)
 	return 0;
 }
 
-static const struct drm_gem_object_funcs virtio_gpu_shmem_funcs = {
+static const struct drm_gem_object_funcs virtio_gpu_uma_funcs = {
 	.free = virtio_gpu_free_object,
 	.open = virtio_gpu_gem_object_open,
 	.close = virtio_gpu_gem_object_close,
-	.print_info = drm_gem_shmem_object_print_info,
+	.print_info = drm_gem_uma_object_print_info,
 	.export = virtgpu_gem_prime_export,
-	.pin = drm_gem_shmem_object_pin,
-	.unpin = drm_gem_shmem_object_unpin,
-	.get_sg_table = drm_gem_shmem_object_get_sg_table,
-	.vmap = drm_gem_shmem_object_vmap,
-	.vunmap = drm_gem_shmem_object_vunmap,
-	.mmap = drm_gem_shmem_object_mmap,
-	.vm_ops = &drm_gem_shmem_vm_ops,
+	.pin = drm_gem_uma_object_pin,
+	.unpin = drm_gem_uma_object_unpin,
+	.get_sg_table = drm_gem_uma_object_get_sg_table,
+	.vmap = drm_gem_uma_object_vmap,
+	.vunmap = drm_gem_uma_object_vunmap,
+	.mmap = drm_gem_uma_object_mmap,
+	.vm_ops = &drm_gem_uma_vm_ops,
 };
 
-bool virtio_gpu_is_shmem(struct virtio_gpu_object *bo)
+bool virtio_gpu_is_uma(struct virtio_gpu_object *bo)
 {
-	return bo->base.base.funcs == &virtio_gpu_shmem_funcs;
+	return bo->base.base.funcs == &virtio_gpu_uma_funcs;
 }
 
 struct drm_gem_object *virtio_gpu_create_object(struct drm_device *dev,
 						size_t size)
 {
-	struct virtio_gpu_object_shmem *shmem;
-	struct drm_gem_shmem_object *dshmem;
+	struct virtio_gpu_object_uma *vguma;
+	struct drm_gem_uma_object *uma;
 
-	shmem = kzalloc(sizeof(*shmem), GFP_KERNEL);
-	if (!shmem)
+	vguma = kzalloc(sizeof(*vguma), GFP_KERNEL);
+	if (!vguma)
 		return ERR_PTR(-ENOMEM);
 
-	dshmem = &shmem->base.base;
-	dshmem->base.funcs = &virtio_gpu_shmem_funcs;
-	return &dshmem->base;
+	uma = &vguma->base.base;
+	uma->base.funcs = &virtio_gpu_uma_funcs;
+	return &uma->base;
 }
 
-static int virtio_gpu_object_shmem_init(struct virtio_gpu_device *vgdev,
-					struct virtio_gpu_object *bo,
-					struct virtio_gpu_mem_entry **ents,
-					unsigned int *nents)
+static int virtio_gpu_object_uma_init(struct virtio_gpu_device *vgdev,
+				      struct virtio_gpu_object *bo,
+				      struct virtio_gpu_mem_entry **ents,
+				      unsigned int *nents)
 {
 	bool use_dma_api = !virtio_has_dma_quirk(vgdev->vdev);
 	struct scatterlist *sg;
 	struct sg_table *pages;
 	int si;
 
-	pages = drm_gem_shmem_get_pages_sgt(&bo->base);
+	pages = drm_gem_uma_get_pages_sgt(&bo->base);
 	if (IS_ERR(pages))
 		return PTR_ERR(pages);
 
@@ -208,7 +208,7 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 			     struct virtio_gpu_fence *fence)
 {
 	struct virtio_gpu_object_array *objs = NULL;
-	struct drm_gem_shmem_object *shmem_obj;
+	struct drm_gem_uma_object *uma_obj;
 	struct virtio_gpu_object *bo;
 	struct virtio_gpu_mem_entry *ents = NULL;
 	unsigned int nents;
@@ -217,10 +217,10 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 	*bo_ptr = NULL;
 
 	params->size = roundup(params->size, PAGE_SIZE);
-	shmem_obj = drm_gem_shmem_create(vgdev->ddev, params->size);
-	if (IS_ERR(shmem_obj))
-		return PTR_ERR(shmem_obj);
-	bo = gem_to_virtio_gpu_obj(&shmem_obj->base);
+	uma_obj = drm_gem_uma_create(vgdev->ddev, params->size);
+	if (IS_ERR(uma_obj))
+		return PTR_ERR(uma_obj);
+	bo = gem_to_virtio_gpu_obj(&uma_obj->base);
 
 	ret = virtio_gpu_resource_id_get(vgdev, &bo->hw_res_handle);
 	if (ret < 0)
@@ -228,7 +228,7 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 
 	bo->dumb = params->dumb;
 
-	ret = virtio_gpu_object_shmem_init(vgdev, bo, &ents, &nents);
+	ret = virtio_gpu_object_uma_init(vgdev, bo, &ents, &nents);
 	if (ret != 0)
 		goto err_put_id;
 
@@ -270,6 +270,6 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 err_put_id:
 	virtio_gpu_resource_id_put(vgdev, bo->hw_res_handle);
 err_free_gem:
-	drm_gem_shmem_free(shmem_obj);
+	drm_gem_uma_free(uma_obj);
 	return ret;
 }
diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index a7863f8ee4ee..a80027e02612 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -515,12 +515,12 @@ static int virtio_drm_get_scanout_buffer(struct drm_plane *plane,
 	if (bo->base.vaddr) {
 		iosys_map_set_vaddr(&sb->map[0], bo->base.vaddr);
 	} else {
-		struct drm_gem_shmem_object *shmem = &bo->base;
+		struct drm_gem_uma_object *uma = &bo->base;
 
-		if (!shmem->pages)
+		if (!uma->pages)
 			return -ENODEV;
 		/* map scanout buffer later */
-		sb->pages = shmem->pages;
+		sb->pages = uma->pages;
 	}
 
 	sb->format = plane->state->fb->format;
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 0c194b4e9488..9c6607239629 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -726,7 +726,7 @@ int virtio_gpu_panic_cmd_transfer_to_host_2d(struct virtio_gpu_device *vgdev,
 	struct virtio_gpu_vbuffer *vbuf;
 	bool use_dma_api = !virtio_has_dma_quirk(vgdev->vdev);
 
-	if (virtio_gpu_is_shmem(bo) && use_dma_api)
+	if (virtio_gpu_is_uma(bo) && use_dma_api)
 		dma_sync_sgtable_for_device(vgdev->vdev->dev.parent,
 					    bo->base.sgt, DMA_TO_DEVICE);
 
@@ -757,7 +757,7 @@ void virtio_gpu_cmd_transfer_to_host_2d(struct virtio_gpu_device *vgdev,
 	struct virtio_gpu_vbuffer *vbuf;
 	bool use_dma_api = !virtio_has_dma_quirk(vgdev->vdev);
 
-	if (virtio_gpu_is_shmem(bo) && use_dma_api)
+	if (virtio_gpu_is_uma(bo) && use_dma_api)
 		dma_sync_sgtable_for_device(vgdev->vdev->dev.parent,
 					    bo->base.sgt, DMA_TO_DEVICE);
 
@@ -1195,7 +1195,7 @@ void virtio_gpu_cmd_transfer_to_host_3d(struct virtio_gpu_device *vgdev,
 	struct virtio_gpu_vbuffer *vbuf;
 	bool use_dma_api = !virtio_has_dma_quirk(vgdev->vdev);
 
-	if (virtio_gpu_is_shmem(bo) && use_dma_api)
+	if (virtio_gpu_is_uma(bo) && use_dma_api)
 		dma_sync_sgtable_for_device(vgdev->vdev->dev.parent,
 					    bo->base.sgt, DMA_TO_DEVICE);
 
-- 
2.52.0

