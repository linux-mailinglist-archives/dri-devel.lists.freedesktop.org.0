Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C48CB0263
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 15:02:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7EBC10E5E7;
	Tue,  9 Dec 2025 14:02:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3620B10E5E7
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Dec 2025 14:02:05 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 549565BE39;
 Tue,  9 Dec 2025 14:02:02 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2E3393EA63;
 Tue,  9 Dec 2025 14:02:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id EFFACdkrOGm1OgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 09 Dec 2025 14:02:01 +0000
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
Subject: [PATCH 11/13] accel/amdxdna: Use GEM-UMA helpers for memory management
Date: Tue,  9 Dec 2025 14:42:08 +0100
Message-ID: <20251209140141.94407-12-tzimmermann@suse.de>
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
X-Rspamd-Queue-Id: 549565BE39
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

Convert amdxdna from GEM-SHMEM to GEM-UMA. The latter is just a copy,
so this change it merely renaming symbols. No functional changes.

GEM-SHMEM will become more self-contained for drivers without specific
memory management. GEM-UMA's interfaces will remain flexible for drivers
with UMA hardware, such as amdxdna.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/accel/amdxdna/Kconfig                 |  2 +-
 drivers/accel/amdxdna/aie2_ctx.c              |  1 -
 drivers/accel/amdxdna/aie2_message.c          |  1 -
 drivers/accel/amdxdna/aie2_pci.c              |  1 -
 drivers/accel/amdxdna/aie2_psp.c              |  1 -
 drivers/accel/amdxdna/aie2_smu.c              |  1 -
 drivers/accel/amdxdna/amdxdna_ctx.c           |  7 ++-
 drivers/accel/amdxdna/amdxdna_gem.c           | 49 +++++++++----------
 drivers/accel/amdxdna/amdxdna_gem.h           |  5 +-
 .../accel/amdxdna/amdxdna_mailbox_helper.c    |  1 -
 drivers/accel/amdxdna/amdxdna_pci_drv.c       |  1 -
 drivers/accel/amdxdna/amdxdna_sysfs.c         |  1 -
 12 files changed, 32 insertions(+), 39 deletions(-)

diff --git a/drivers/accel/amdxdna/Kconfig b/drivers/accel/amdxdna/Kconfig
index f39d7a87296c..a417b18b401f 100644
--- a/drivers/accel/amdxdna/Kconfig
+++ b/drivers/accel/amdxdna/Kconfig
@@ -6,8 +6,8 @@ config DRM_ACCEL_AMDXDNA
 	depends on DRM_ACCEL
 	depends on PCI && HAS_IOMEM
 	depends on X86_64
+	select DRM_GEM_UMA_HELPER
 	select DRM_SCHED
-	select DRM_GEM_SHMEM_HELPER
 	select FW_LOADER
 	select HMM_MIRROR
 	help
diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
index 42d876a427c5..7e82496495d3 100644
--- a/drivers/accel/amdxdna/aie2_ctx.c
+++ b/drivers/accel/amdxdna/aie2_ctx.c
@@ -6,7 +6,6 @@
 #include <drm/amdxdna_accel.h>
 #include <drm/drm_device.h>
 #include <drm/drm_gem.h>
-#include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_print.h>
 #include <drm/drm_syncobj.h>
 #include <linux/hmm.h>
diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/amdxdna/aie2_message.c
index d493bb1c3360..2f639c22ebf1 100644
--- a/drivers/accel/amdxdna/aie2_message.c
+++ b/drivers/accel/amdxdna/aie2_message.c
@@ -7,7 +7,6 @@
 #include <drm/drm_cache.h>
 #include <drm/drm_device.h>
 #include <drm/drm_gem.h>
-#include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_print.h>
 #include <drm/gpu_scheduler.h>
 #include <linux/bitfield.h>
diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
index ceef1c502e9e..498a23a070c9 100644
--- a/drivers/accel/amdxdna/aie2_pci.c
+++ b/drivers/accel/amdxdna/aie2_pci.c
@@ -6,7 +6,6 @@
 #include <drm/amdxdna_accel.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_print.h>
 #include <drm/gpu_scheduler.h>
diff --git a/drivers/accel/amdxdna/aie2_psp.c b/drivers/accel/amdxdna/aie2_psp.c
index f28a060a8810..81145210abf3 100644
--- a/drivers/accel/amdxdna/aie2_psp.c
+++ b/drivers/accel/amdxdna/aie2_psp.c
@@ -4,7 +4,6 @@
  */
 
 #include <drm/drm_device.h>
-#include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_print.h>
 #include <drm/gpu_scheduler.h>
diff --git a/drivers/accel/amdxdna/aie2_smu.c b/drivers/accel/amdxdna/aie2_smu.c
index bd94ee96c2bc..a16942aa10a1 100644
--- a/drivers/accel/amdxdna/aie2_smu.c
+++ b/drivers/accel/amdxdna/aie2_smu.c
@@ -4,7 +4,6 @@
  */
 
 #include <drm/drm_device.h>
-#include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_print.h>
 #include <drm/gpu_scheduler.h>
 #include <linux/iopoll.h>
diff --git a/drivers/accel/amdxdna/amdxdna_ctx.c b/drivers/accel/amdxdna/amdxdna_ctx.c
index d17aef89a0ad..1c02a97b1865 100644
--- a/drivers/accel/amdxdna/amdxdna_ctx.c
+++ b/drivers/accel/amdxdna/amdxdna_ctx.c
@@ -8,7 +8,6 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
 #include <drm/drm_gem.h>
-#include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_print.h>
 #include <drm/gpu_scheduler.h>
 #include <linux/xarray.h>
@@ -387,7 +386,7 @@ amdxdna_arg_bos_lookup(struct amdxdna_client *client,
 		gobj = drm_gem_object_lookup(client->filp, bo_hdls[i]);
 		if (!gobj) {
 			ret = -ENOENT;
-			goto put_shmem_bo;
+			goto put_bos;
 		}
 		abo = to_xdna_obj(gobj);
 
@@ -402,7 +401,7 @@ amdxdna_arg_bos_lookup(struct amdxdna_client *client,
 		if (ret) {
 			mutex_unlock(&abo->lock);
 			drm_gem_object_put(gobj);
-			goto put_shmem_bo;
+			goto put_bos;
 		}
 		abo->pinned = true;
 		mutex_unlock(&abo->lock);
@@ -412,7 +411,7 @@ amdxdna_arg_bos_lookup(struct amdxdna_client *client,
 
 	return 0;
 
-put_shmem_bo:
+put_bos:
 	amdxdna_arg_bos_put(job);
 	return ret;
 }
diff --git a/drivers/accel/amdxdna/amdxdna_gem.c b/drivers/accel/amdxdna/amdxdna_gem.c
index dfa916eeb2d9..33c48498d1eb 100644
--- a/drivers/accel/amdxdna/amdxdna_gem.c
+++ b/drivers/accel/amdxdna/amdxdna_gem.c
@@ -7,7 +7,6 @@
 #include <drm/drm_cache.h>
 #include <drm/drm_device.h>
 #include <drm/drm_gem.h>
-#include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_print.h>
 #include <drm/gpu_scheduler.h>
 #include <linux/dma-buf.h>
@@ -277,9 +276,9 @@ static int amdxdna_insert_pages(struct amdxdna_gem_obj *abo,
 	int ret;
 
 	if (!is_import_bo(abo)) {
-		ret = drm_gem_shmem_mmap(&abo->base, vma);
+		ret = drm_gem_uma_mmap(&abo->base, vma);
 		if (ret) {
-			XDNA_ERR(xdna, "Failed shmem mmap %d", ret);
+			XDNA_ERR(xdna, "Failed uma mmap %d", ret);
 			return ret;
 		}
 
@@ -358,11 +357,11 @@ static int amdxdna_gem_dmabuf_mmap(struct dma_buf *dma_buf, struct vm_area_struc
 	unsigned long num_pages = vma_pages(vma);
 	int ret;
 
-	vma->vm_ops = &drm_gem_shmem_vm_ops;
+	vma->vm_ops = &drm_gem_uma_vm_ops;
 	vma->vm_private_data = gobj;
 
 	drm_gem_object_get(gobj);
-	ret = drm_gem_shmem_mmap(&abo->base, vma);
+	ret = drm_gem_uma_mmap(&abo->base, vma);
 	if (ret)
 		goto put_obj;
 
@@ -474,23 +473,23 @@ static void amdxdna_gem_obj_free(struct drm_gem_object *gobj)
 		return;
 	}
 
-	drm_gem_shmem_free(&abo->base);
+	drm_gem_uma_free(&abo->base);
 }
 
 static const struct drm_gem_object_funcs amdxdna_gem_dev_obj_funcs = {
 	.free = amdxdna_gem_dev_obj_free,
 };
 
-static const struct drm_gem_object_funcs amdxdna_gem_shmem_funcs = {
+static const struct drm_gem_object_funcs amdxdna_gem_uma_funcs = {
 	.free = amdxdna_gem_obj_free,
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
 	.mmap = amdxdna_gem_obj_mmap,
-	.vm_ops = &drm_gem_shmem_vm_ops,
+	.vm_ops = &drm_gem_uma_vm_ops,
 	.export = amdxdna_gem_prime_export,
 };
 
@@ -525,21 +524,21 @@ amdxdna_gem_create_object_cb(struct drm_device *dev, size_t size)
 	if (IS_ERR(abo))
 		return ERR_CAST(abo);
 
-	to_gobj(abo)->funcs = &amdxdna_gem_shmem_funcs;
+	to_gobj(abo)->funcs = &amdxdna_gem_uma_funcs;
 
 	return to_gobj(abo);
 }
 
 static struct amdxdna_gem_obj *
-amdxdna_gem_create_shmem_object(struct drm_device *dev, size_t size)
+amdxdna_gem_create_uma_object(struct drm_device *dev, size_t size)
 {
-	struct drm_gem_shmem_object *shmem = drm_gem_shmem_create(dev, size);
+	struct drm_gem_uma_object *uma = drm_gem_uma_create(dev, size);
 
-	if (IS_ERR(shmem))
-		return ERR_CAST(shmem);
+	if (IS_ERR(uma))
+		return ERR_CAST(uma);
 
-	shmem->map_wc = false;
-	return to_xdna_obj(&shmem->base);
+	uma->map_wc = false;
+	return to_xdna_obj(&uma->base);
 }
 
 static struct amdxdna_gem_obj *
@@ -589,7 +588,7 @@ amdxdna_gem_create_object(struct drm_device *dev,
 	if (args->vaddr)
 		return amdxdna_gem_create_ubuf_object(dev, args);
 
-	return amdxdna_gem_create_shmem_object(dev, aligned_sz);
+	return amdxdna_gem_create_uma_object(dev, aligned_sz);
 }
 
 struct drm_gem_object *
@@ -615,7 +614,7 @@ amdxdna_gem_prime_import(struct drm_device *dev, struct dma_buf *dma_buf)
 		goto fail_detach;
 	}
 
-	gobj = drm_gem_shmem_prime_import_sg_table(dev, attach, sgt);
+	gobj = drm_gem_uma_prime_import_sg_table(dev, attach, sgt);
 	if (IS_ERR(gobj)) {
 		ret = PTR_ERR(gobj);
 		goto fail_unmap;
@@ -836,7 +835,7 @@ int amdxdna_gem_pin_nolock(struct amdxdna_gem_obj *abo)
 	if (is_import_bo(abo))
 		return 0;
 
-	ret = drm_gem_shmem_pin(&abo->base);
+	ret = drm_gem_uma_pin(&abo->base);
 
 	XDNA_DBG(xdna, "BO type %d ret %d", abo->type, ret);
 	return ret;
@@ -862,7 +861,7 @@ void amdxdna_gem_unpin(struct amdxdna_gem_obj *abo)
 		return;
 
 	mutex_lock(&abo->lock);
-	drm_gem_shmem_unpin(&abo->base);
+	drm_gem_uma_unpin(&abo->base);
 	mutex_unlock(&abo->lock);
 }
 
diff --git a/drivers/accel/amdxdna/amdxdna_gem.h b/drivers/accel/amdxdna/amdxdna_gem.h
index f79fc7f3c93b..74c78c86125e 100644
--- a/drivers/accel/amdxdna/amdxdna_gem.h
+++ b/drivers/accel/amdxdna/amdxdna_gem.h
@@ -7,6 +7,9 @@
 #define _AMDXDNA_GEM_H_
 
 #include <linux/hmm.h>
+
+#include <drm/drm_gem_uma_helper.h>
+
 #include "amdxdna_pci_drv.h"
 
 struct amdxdna_umap {
@@ -33,7 +36,7 @@ struct amdxdna_mem {
 };
 
 struct amdxdna_gem_obj {
-	struct drm_gem_shmem_object	base;
+	struct drm_gem_uma_object	base;
 	struct amdxdna_client		*client;
 	u8				type;
 	bool				pinned;
diff --git a/drivers/accel/amdxdna/amdxdna_mailbox_helper.c b/drivers/accel/amdxdna/amdxdna_mailbox_helper.c
index 6d0c24513476..63c3b82ff1b0 100644
--- a/drivers/accel/amdxdna/amdxdna_mailbox_helper.c
+++ b/drivers/accel/amdxdna/amdxdna_mailbox_helper.c
@@ -7,7 +7,6 @@
 #include <drm/drm_device.h>
 #include <drm/drm_print.h>
 #include <drm/drm_gem.h>
-#include <drm/drm_gem_shmem_helper.h>
 #include <drm/gpu_scheduler.h>
 #include <linux/completion.h>
 
diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/amdxdna/amdxdna_pci_drv.c
index 1973ab67721b..ae069b8805c7 100644
--- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
+++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
@@ -7,7 +7,6 @@
 #include <drm/drm_accel.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_gem.h>
-#include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_managed.h>
 #include <drm/gpu_scheduler.h>
diff --git a/drivers/accel/amdxdna/amdxdna_sysfs.c b/drivers/accel/amdxdna/amdxdna_sysfs.c
index f27e4ee960a0..d7fcb9c9b7b5 100644
--- a/drivers/accel/amdxdna/amdxdna_sysfs.c
+++ b/drivers/accel/amdxdna/amdxdna_sysfs.c
@@ -5,7 +5,6 @@
 
 #include <drm/amdxdna_accel.h>
 #include <drm/drm_device.h>
-#include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_print.h>
 #include <drm/gpu_scheduler.h>
 #include <linux/types.h>
-- 
2.52.0

