Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A10CB0269
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 15:02:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6487610E5E8;
	Tue,  9 Dec 2025 14:02:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2687510E5EB
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Dec 2025 14:02:09 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DB03E5BDAB;
 Tue,  9 Dec 2025 14:02:04 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8B5973EA65;
 Tue,  9 Dec 2025 14:02:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id mE6QH9srOGm1OgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 09 Dec 2025 14:02:03 +0000
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
Subject: [PATCH 13/13] accel/rocket: Use GEM-UMA helpers for memory management
Date: Tue,  9 Dec 2025 14:42:10 +0100
Message-ID: <20251209140141.94407-14-tzimmermann@suse.de>
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
X-Rspamd-Queue-Id: DB03E5BDAB
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

Convert rocket from GEM-SHMEM to GEM-UMA. The latter is just a copy,
so this change it merely renaming symbols. No functional changes.

GEM-SHMEM will become more self-contained for drivers without specific
memory management. GEM-UMA's interfaces will remain flexible for drivers
with UMA hardware, such as rocket.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/accel/rocket/Kconfig      |  2 +-
 drivers/accel/rocket/rocket_gem.c | 46 +++++++++++++++----------------
 drivers/accel/rocket/rocket_gem.h |  6 ++--
 3 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/drivers/accel/rocket/Kconfig b/drivers/accel/rocket/Kconfig
index 16465abe0660..26f760afdd7a 100644
--- a/drivers/accel/rocket/Kconfig
+++ b/drivers/accel/rocket/Kconfig
@@ -6,8 +6,8 @@ config DRM_ACCEL_ROCKET
 	depends on (ARCH_ROCKCHIP && ARM64) || COMPILE_TEST
 	depends on ROCKCHIP_IOMMU || COMPILE_TEST
 	depends on MMU
+	select DRM_GEM_UMA_HELPER
 	select DRM_SCHED
-	select DRM_GEM_SHMEM_HELPER
 	help
 	  Choose this option if you have a Rockchip SoC that contains a
 	  compatible Neural Processing Unit (NPU), such as the RK3588. Called by
diff --git a/drivers/accel/rocket/rocket_gem.c b/drivers/accel/rocket/rocket_gem.c
index 624c4ecf5a34..1c7b75413065 100644
--- a/drivers/accel/rocket/rocket_gem.c
+++ b/drivers/accel/rocket/rocket_gem.c
@@ -29,19 +29,19 @@ static void rocket_gem_bo_free(struct drm_gem_object *obj)
 	rocket_iommu_domain_put(bo->domain);
 	bo->domain = NULL;
 
-	drm_gem_shmem_free(&bo->base);
+	drm_gem_uma_free(&bo->base);
 }
 
 static const struct drm_gem_object_funcs rocket_gem_funcs = {
 	.free = rocket_gem_bo_free,
-	.print_info = drm_gem_shmem_object_print_info,
-	.pin = drm_gem_shmem_object_pin,
-	.unpin = drm_gem_shmem_object_unpin,
-	.get_sg_table = drm_gem_shmem_object_get_sg_table,
-	.vmap = drm_gem_shmem_object_vmap,
-	.vunmap = drm_gem_shmem_object_vunmap,
-	.mmap = drm_gem_shmem_object_mmap,
-	.vm_ops = &drm_gem_shmem_vm_ops,
+	.print_info = drm_gem_uma_object_print_info,
+	.pin = drm_gem_uma_object_pin,
+	.unpin = drm_gem_uma_object_unpin,
+	.get_sg_table = drm_gem_uma_object_get_sg_table,
+	.vmap = drm_gem_uma_object_vmap,
+	.vunmap = drm_gem_uma_object_vunmap,
+	.mmap = drm_gem_uma_object_mmap,
+	.vm_ops = &drm_gem_uma_vm_ops,
 };
 
 struct drm_gem_object *rocket_gem_create_object(struct drm_device *dev, size_t size)
@@ -61,17 +61,17 @@ int rocket_ioctl_create_bo(struct drm_device *dev, void *data, struct drm_file *
 {
 	struct rocket_file_priv *rocket_priv = file->driver_priv;
 	struct drm_rocket_create_bo *args = data;
-	struct drm_gem_shmem_object *shmem_obj;
+	struct drm_gem_uma_object *uma_obj;
 	struct rocket_gem_object *rkt_obj;
 	struct drm_gem_object *gem_obj;
 	struct sg_table *sgt;
 	int ret;
 
-	shmem_obj = drm_gem_shmem_create(dev, args->size);
-	if (IS_ERR(shmem_obj))
-		return PTR_ERR(shmem_obj);
+	uma_obj = drm_gem_uma_create(dev, args->size);
+	if (IS_ERR(uma_obj))
+		return PTR_ERR(uma_obj);
 
-	gem_obj = &shmem_obj->base;
+	gem_obj = &uma_obj->base;
 	rkt_obj = to_rocket_bo(gem_obj);
 
 	rkt_obj->driver_priv = rocket_priv;
@@ -84,7 +84,7 @@ int rocket_ioctl_create_bo(struct drm_device *dev, void *data, struct drm_file *
 	if (ret)
 		goto err;
 
-	sgt = drm_gem_shmem_get_pages_sgt(shmem_obj);
+	sgt = drm_gem_uma_get_pages_sgt(uma_obj);
 	if (IS_ERR(sgt)) {
 		ret = PTR_ERR(sgt);
 		goto err;
@@ -98,7 +98,7 @@ int rocket_ioctl_create_bo(struct drm_device *dev, void *data, struct drm_file *
 
 	ret = iommu_map_sgtable(rocket_priv->domain->domain,
 				rkt_obj->mm.start,
-				shmem_obj->sgt,
+				uma_obj->sgt,
 				IOMMU_READ | IOMMU_WRITE);
 	if (ret < 0 || ret < args->size) {
 		drm_err(dev, "failed to map buffer: size=%d request_size=%u\n",
@@ -120,7 +120,7 @@ int rocket_ioctl_create_bo(struct drm_device *dev, void *data, struct drm_file *
 	mutex_unlock(&rocket_priv->mm_lock);
 
 err:
-	drm_gem_shmem_object_free(gem_obj);
+	drm_gem_uma_object_free(gem_obj);
 
 	return ret;
 }
@@ -130,7 +130,7 @@ int rocket_ioctl_prep_bo(struct drm_device *dev, void *data, struct drm_file *fi
 	struct drm_rocket_prep_bo *args = data;
 	unsigned long timeout = drm_timeout_abs_to_jiffies(args->timeout_ns);
 	struct drm_gem_object *gem_obj;
-	struct drm_gem_shmem_object *shmem_obj;
+	struct drm_gem_uma_object *uma_obj;
 	long ret = 0;
 
 	if (args->reserved != 0) {
@@ -146,9 +146,9 @@ int rocket_ioctl_prep_bo(struct drm_device *dev, void *data, struct drm_file *fi
 	if (!ret)
 		ret = timeout ? -ETIMEDOUT : -EBUSY;
 
-	shmem_obj = &to_rocket_bo(gem_obj)->base;
+	uma_obj = &to_rocket_bo(gem_obj)->base;
 
-	dma_sync_sgtable_for_cpu(dev->dev, shmem_obj->sgt, DMA_BIDIRECTIONAL);
+	dma_sync_sgtable_for_cpu(dev->dev, uma_obj->sgt, DMA_BIDIRECTIONAL);
 
 	drm_gem_object_put(gem_obj);
 
@@ -158,7 +158,7 @@ int rocket_ioctl_prep_bo(struct drm_device *dev, void *data, struct drm_file *fi
 int rocket_ioctl_fini_bo(struct drm_device *dev, void *data, struct drm_file *file)
 {
 	struct drm_rocket_fini_bo *args = data;
-	struct drm_gem_shmem_object *shmem_obj;
+	struct drm_gem_uma_object *uma_obj;
 	struct rocket_gem_object *rkt_obj;
 	struct drm_gem_object *gem_obj;
 
@@ -172,9 +172,9 @@ int rocket_ioctl_fini_bo(struct drm_device *dev, void *data, struct drm_file *fi
 		return -ENOENT;
 
 	rkt_obj = to_rocket_bo(gem_obj);
-	shmem_obj = &rkt_obj->base;
+	uma_obj = &rkt_obj->base;
 
-	dma_sync_sgtable_for_device(dev->dev, shmem_obj->sgt, DMA_BIDIRECTIONAL);
+	dma_sync_sgtable_for_device(dev->dev, uma_obj->sgt, DMA_BIDIRECTIONAL);
 
 	drm_gem_object_put(gem_obj);
 
diff --git a/drivers/accel/rocket/rocket_gem.h b/drivers/accel/rocket/rocket_gem.h
index 240430334509..d5ea539519e7 100644
--- a/drivers/accel/rocket/rocket_gem.h
+++ b/drivers/accel/rocket/rocket_gem.h
@@ -4,10 +4,10 @@
 #ifndef __ROCKET_GEM_H__
 #define __ROCKET_GEM_H__
 
-#include <drm/drm_gem_shmem_helper.h>
+#include <drm/drm_gem_uma_helper.h>
 
 struct rocket_gem_object {
-	struct drm_gem_shmem_object base;
+	struct drm_gem_uma_object base;
 
 	struct rocket_file_priv *driver_priv;
 
@@ -28,7 +28,7 @@ int rocket_ioctl_fini_bo(struct drm_device *dev, void *data, struct drm_file *fi
 static inline
 struct  rocket_gem_object *to_rocket_bo(struct drm_gem_object *obj)
 {
-	return container_of(to_drm_gem_shmem_obj(obj), struct rocket_gem_object, base);
+	return container_of(to_drm_gem_uma_obj(obj), struct rocket_gem_object, base);
 }
 
 #endif
-- 
2.52.0

