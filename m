Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A47D4503EA
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 13:01:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 809256EA74;
	Mon, 15 Nov 2021 12:01:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61ECA6EA74
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 12:01:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D43BE1FD69;
 Mon, 15 Nov 2021 12:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1636977709; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mBlyCBQAaLOyoh7nWKE653eGcvH0MARo4kg5HDK0D74=;
 b=M3Dsa4XB8nglViJM4wGp2FPVFHEvY5+azKVrAK9Uol95jdDbst38rbbrzPCubggDg0+Upu
 vy26d5oj6nTJbeR3DMDR+6iHiUKh9Z7//5MW/YrZNYCqvgGl9Dwj4T7eRaAfAoFhuAw636
 eb7iQWAtq2A6IU7wKq8iqiXUdhX6+fA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1636977709;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mBlyCBQAaLOyoh7nWKE653eGcvH0MARo4kg5HDK0D74=;
 b=994mxrfSOIaaEqqrHltRXt3wa8y7nx4GgZmkTs11cc6F/1YspJ14QjQkpArEALoRo1zQzz
 oOLSW+Gium06jNBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 933F413E3A;
 Mon, 15 Nov 2021 12:01:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WOLyIi1MkmHKVgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 15 Nov 2021 12:01:49 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, laurent.pinchart@ideasonboard.com,
 kieran.bingham+renesas@ideasonboard.com, emma@anholt.net
Subject: [PATCH 1/3] drm/cma-helper: Move driver and file ops to the end of
 header
Date: Mon, 15 Nov 2021 13:01:46 +0100
Message-Id: <20211115120148.21766-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211115120148.21766-1-tzimmermann@suse.de>
References: <20211115120148.21766-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Cc: linux-renesas-soc@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Restructure the header file for CMA helpers by moving declarations
for driver and file operations to the end of the file. No functional
changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 include/drm/drm_gem_cma_helper.h | 114 ++++++++++++++++---------------
 1 file changed, 60 insertions(+), 54 deletions(-)

diff --git a/include/drm/drm_gem_cma_helper.h b/include/drm/drm_gem_cma_helper.h
index cd13508acbc1..e0fb7a0cf03f 100644
--- a/include/drm/drm_gem_cma_helper.h
+++ b/include/drm/drm_gem_cma_helper.h
@@ -32,77 +32,40 @@ struct drm_gem_cma_object {
 #define to_drm_gem_cma_obj(gem_obj) \
 	container_of(gem_obj, struct drm_gem_cma_object, base)
 
-#ifndef CONFIG_MMU
-#define DRM_GEM_CMA_UNMAPPED_AREA_FOPS \
-	.get_unmapped_area	= drm_gem_cma_get_unmapped_area,
-#else
-#define DRM_GEM_CMA_UNMAPPED_AREA_FOPS
-#endif
-
-/**
- * DEFINE_DRM_GEM_CMA_FOPS() - macro to generate file operations for CMA drivers
- * @name: name for the generated structure
- *
- * This macro autogenerates a suitable &struct file_operations for CMA based
- * drivers, which can be assigned to &drm_driver.fops. Note that this structure
- * cannot be shared between drivers, because it contains a reference to the
- * current module using THIS_MODULE.
- *
- * Note that the declaration is already marked as static - if you need a
- * non-static version of this you're probably doing it wrong and will break the
- * THIS_MODULE reference by accident.
- */
-#define DEFINE_DRM_GEM_CMA_FOPS(name) \
-	static const struct file_operations name = {\
-		.owner		= THIS_MODULE,\
-		.open		= drm_open,\
-		.release	= drm_release,\
-		.unlocked_ioctl	= drm_ioctl,\
-		.compat_ioctl	= drm_compat_ioctl,\
-		.poll		= drm_poll,\
-		.read		= drm_read,\
-		.llseek		= noop_llseek,\
-		.mmap		= drm_gem_mmap,\
-		DRM_GEM_CMA_UNMAPPED_AREA_FOPS \
-	}
-
 /* free GEM object */
 void drm_gem_cma_free_object(struct drm_gem_object *gem_obj);
 
-/* create memory region for DRM framebuffer */
-int drm_gem_cma_dumb_create_internal(struct drm_file *file_priv,
-				     struct drm_device *drm,
-				     struct drm_mode_create_dumb *args);
-
-/* create memory region for DRM framebuffer */
-int drm_gem_cma_dumb_create(struct drm_file *file_priv,
-			    struct drm_device *drm,
-			    struct drm_mode_create_dumb *args);
-
 /* allocate physical memory */
 struct drm_gem_cma_object *drm_gem_cma_create(struct drm_device *drm,
 					      size_t size);
 
 extern const struct vm_operations_struct drm_gem_cma_vm_ops;
 
-#ifndef CONFIG_MMU
-unsigned long drm_gem_cma_get_unmapped_area(struct file *filp,
-					    unsigned long addr,
-					    unsigned long len,
-					    unsigned long pgoff,
-					    unsigned long flags);
-#endif
-
 void drm_gem_cma_print_info(struct drm_printer *p, unsigned int indent,
 			    const struct drm_gem_object *obj);
 
 struct sg_table *drm_gem_cma_get_sg_table(struct drm_gem_object *obj);
+int drm_gem_cma_vmap(struct drm_gem_object *obj, struct dma_buf_map *map);
+int drm_gem_cma_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma);
+
+/*
+ * Driver ops
+ */
+
+/* create memory region for DRM framebuffer */
+int drm_gem_cma_dumb_create_internal(struct drm_file *file_priv,
+				     struct drm_device *drm,
+				     struct drm_mode_create_dumb *args);
+
+/* create memory region for DRM framebuffer */
+int drm_gem_cma_dumb_create(struct drm_file *file_priv,
+			    struct drm_device *drm,
+			    struct drm_mode_create_dumb *args);
+
 struct drm_gem_object *
 drm_gem_cma_prime_import_sg_table(struct drm_device *dev,
 				  struct dma_buf_attachment *attach,
 				  struct sg_table *sgt);
-int drm_gem_cma_vmap(struct drm_gem_object *obj, struct dma_buf_map *map);
-int drm_gem_cma_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma);
 
 /**
  * DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE - CMA GEM driver operations
@@ -185,4 +148,47 @@ drm_gem_cma_prime_import_sg_table_vmap(struct drm_device *drm,
 				       struct dma_buf_attachment *attach,
 				       struct sg_table *sgt);
 
+/*
+ * File ops
+ */
+
+#ifndef CONFIG_MMU
+unsigned long drm_gem_cma_get_unmapped_area(struct file *filp,
+					    unsigned long addr,
+					    unsigned long len,
+					    unsigned long pgoff,
+					    unsigned long flags);
+#define DRM_GEM_CMA_UNMAPPED_AREA_FOPS \
+	.get_unmapped_area	= drm_gem_cma_get_unmapped_area,
+#else
+#define DRM_GEM_CMA_UNMAPPED_AREA_FOPS
+#endif
+
+/**
+ * DEFINE_DRM_GEM_CMA_FOPS() - macro to generate file operations for CMA drivers
+ * @name: name for the generated structure
+ *
+ * This macro autogenerates a suitable &struct file_operations for CMA based
+ * drivers, which can be assigned to &drm_driver.fops. Note that this structure
+ * cannot be shared between drivers, because it contains a reference to the
+ * current module using THIS_MODULE.
+ *
+ * Note that the declaration is already marked as static - if you need a
+ * non-static version of this you're probably doing it wrong and will break the
+ * THIS_MODULE reference by accident.
+ */
+#define DEFINE_DRM_GEM_CMA_FOPS(name) \
+	static const struct file_operations name = {\
+		.owner		= THIS_MODULE,\
+		.open		= drm_open,\
+		.release	= drm_release,\
+		.unlocked_ioctl	= drm_ioctl,\
+		.compat_ioctl	= drm_compat_ioctl,\
+		.poll		= drm_poll,\
+		.read		= drm_read,\
+		.llseek		= noop_llseek,\
+		.mmap		= drm_gem_mmap,\
+		DRM_GEM_CMA_UNMAPPED_AREA_FOPS \
+	}
+
 #endif /* __DRM_GEM_CMA_HELPER_H__ */
-- 
2.33.1

