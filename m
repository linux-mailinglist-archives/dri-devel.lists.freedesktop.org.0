Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7370A3985F2
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 12:09:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C59C6EC39;
	Wed,  2 Jun 2021 10:09:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 143026EC35
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 10:09:18 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id ci15so2962231ejc.10
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 03:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=KItILXhT3wX/8irfPMRptmTM7UOWZFtzjlA/64FodiA=;
 b=Gn83TIjb7FzPi8ILrbFsZhY7UM33PolAo2GOAn066k1La0L98Q1tG2yq2iVinZ34hG
 IyIMV+4mYXEbtxOBOJ8gNYqaKXWXXk7Dm6hhVADk3fpOFe3XwP42xpIePoknKSHjIsay
 5/a6S5zUuv0qJ93nY3g6OM15Jfklx7ORxX4zTq2EnAHQ3jenPIXBsCZqvPjnAFRozgrT
 adwZjFDqX7lUYndx0bZZc0IxllYcx+HVolct315mCWIsUmyukjP+mnXwGv0CTFacTgcT
 I5/anFy0SNmtKHPsc56pipIfkfayUZFXid7FZFLm4wdIyxrTrPuYbCjtcyFS21rOmsBG
 qRyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KItILXhT3wX/8irfPMRptmTM7UOWZFtzjlA/64FodiA=;
 b=D285H+PHOvVBSn0/iHP/fP3o0KC+vNLF3VaIf6rltVHCTGyhnfwnuDutNAVJPs8HLK
 d+L0oLIMaBmYFJMSSg2P8rmBF9YDeK6FpzBeeSF2AdT8VBRNIqyiJGAqN0VhAPGjKBCL
 iAvSfef+4rFqtjRwZ98crzEdJnb0R/VdXF9OQWQYkJ+fBaClu9Wkb4Sqc4pQHWf+8TZ4
 aUVlCrW+Qp2x1e2nUh8j4Dh35QA92F7ghGwqB1QXU/bE+ZfxbdBIHikvLDw3NFwtqlLr
 400zhdGu9f1cCn5+yNM5P+ycJR+MYp13zVBHVTtlsZXW0nG7/AN8fuGOBKDB4DespFmM
 G0LA==
X-Gm-Message-State: AOAM530B+cHqtyjsLiVimmVCSE2BZ0nt1nPS+b6/qtwRs4v4UASu+L+a
 PpfD6pV6HWWR83SMdl8pM6c=
X-Google-Smtp-Source: ABdhPJzPHxfbqdzQRG6LXkBCB7mQds50Twyc8M20jZ1xDaAvJEZa/cmR7+tUk7d/cxzSiiHmX/RJDg==
X-Received: by 2002:a17:906:6549:: with SMTP id
 u9mr32579654ejn.506.1622628556669; 
 Wed, 02 Jun 2021 03:09:16 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:e6a4:731d:6be0:e698])
 by smtp.gmail.com with ESMTPSA id g4sm1017468edw.8.2021.06.02.03.09.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 03:09:16 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: matthew.auld@intel.com, thomas_os@shipmail.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 02/10] drm/ttm: flip over the range manager to self allocated
 nodes
Date: Wed,  2 Jun 2021 12:09:06 +0200
Message-Id: <20210602100914.46246-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210602100914.46246-1-christian.koenig@amd.com>
References: <20210602100914.46246-1-christian.koenig@amd.com>
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

Start with the range manager to make the resource object the base
class for the allocated nodes.

While at it cleanup a lot of the code around that.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c |  1 +
 drivers/gpu/drm/drm_gem_vram_helper.c   |  2 +
 drivers/gpu/drm/nouveau/nouveau_ttm.c   |  2 +
 drivers/gpu/drm/qxl/qxl_ttm.c           |  1 +
 drivers/gpu/drm/radeon/radeon_ttm.c     |  1 +
 drivers/gpu/drm/ttm/ttm_range_manager.c | 56 ++++++++++++++++++-------
 drivers/gpu/drm/ttm/ttm_resource.c      | 26 ++++++++----
 include/drm/ttm/ttm_bo_driver.h         | 26 ------------
 include/drm/ttm/ttm_range_manager.h     | 43 +++++++++++++++++++
 include/drm/ttm/ttm_resource.h          |  3 ++
 10 files changed, 111 insertions(+), 50 deletions(-)
 create mode 100644 include/drm/ttm/ttm_range_manager.h

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 69db89261650..df1f185faae9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -45,6 +45,7 @@
 #include <drm/ttm/ttm_bo_api.h>
 #include <drm/ttm/ttm_bo_driver.h>
 #include <drm/ttm/ttm_placement.h>
+#include <drm/ttm/ttm_range_manager.h>
 
 #include <drm/amdgpu_drm.h>
 
diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 83e7258c7f90..17a4c5d47b6a 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -17,6 +17,8 @@
 #include <drm/drm_prime.h>
 #include <drm/drm_simple_kms_helper.h>
 
+#include <drm/ttm/ttm_range_manager.h>
+
 static const struct drm_gem_object_funcs drm_gem_vram_object_funcs;
 
 /**
diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
index 65430912ff72..b08b8efeefba 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
@@ -26,6 +26,8 @@
 #include <linux/limits.h>
 #include <linux/swiotlb.h>
 
+#include <drm/ttm/ttm_range_manager.h>
+
 #include "nouveau_drv.h"
 #include "nouveau_gem.h"
 #include "nouveau_mem.h"
diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_ttm.c
index 8aa87b8edb9c..19fd39d9a00c 100644
--- a/drivers/gpu/drm/qxl/qxl_ttm.c
+++ b/drivers/gpu/drm/qxl/qxl_ttm.c
@@ -32,6 +32,7 @@
 #include <drm/ttm/ttm_bo_api.h>
 #include <drm/ttm/ttm_bo_driver.h>
 #include <drm/ttm/ttm_placement.h>
+#include <drm/ttm/ttm_range_manager.h>
 
 #include "qxl_drv.h"
 #include "qxl_object.h"
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index cdffa9b65108..ad2a5a791bba 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -45,6 +45,7 @@
 #include <drm/ttm/ttm_bo_api.h>
 #include <drm/ttm/ttm_bo_driver.h>
 #include <drm/ttm/ttm_placement.h>
+#include <drm/ttm/ttm_range_manager.h>
 
 #include "radeon_reg.h"
 #include "radeon.h"
diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c b/drivers/gpu/drm/ttm/ttm_range_manager.c
index b9d5da6e6a81..ce5d07ca384c 100644
--- a/drivers/gpu/drm/ttm/ttm_range_manager.c
+++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
@@ -29,12 +29,13 @@
  * Authors: Thomas Hellstrom <thellstrom-at-vmware-dot-com>
  */
 
-#include <drm/ttm/ttm_bo_driver.h>
+#include <drm/ttm/ttm_device.h>
 #include <drm/ttm/ttm_placement.h>
+#include <drm/ttm/ttm_range_manager.h>
+#include <drm/ttm/ttm_bo_api.h>
 #include <drm/drm_mm.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
-#include <linux/module.h>
 
 /*
  * Currently we use a spinlock for the lock, but a mutex *may* be
@@ -60,8 +61,8 @@ static int ttm_range_man_alloc(struct ttm_resource_manager *man,
 			       struct ttm_resource *mem)
 {
 	struct ttm_range_manager *rman = to_range_manager(man);
+	struct ttm_range_mgr_node *node;
 	struct drm_mm *mm = &rman->mm;
-	struct drm_mm_node *node;
 	enum drm_mm_insert_mode mode;
 	unsigned long lpfn;
 	int ret;
@@ -70,7 +71,7 @@ static int ttm_range_man_alloc(struct ttm_resource_manager *man,
 	if (!lpfn)
 		lpfn = man->size;
 
-	node = kzalloc(sizeof(*node), GFP_KERNEL);
+	node = kzalloc(struct_size(node, mm_nodes, 1), GFP_KERNEL);
 	if (!node)
 		return -ENOMEM;
 
@@ -78,17 +79,19 @@ static int ttm_range_man_alloc(struct ttm_resource_manager *man,
 	if (place->flags & TTM_PL_FLAG_TOPDOWN)
 		mode = DRM_MM_INSERT_HIGH;
 
+	ttm_resource_init(bo, place, &node->base);
+
 	spin_lock(&rman->lock);
-	ret = drm_mm_insert_node_in_range(mm, node, mem->num_pages,
-					  bo->page_alignment, 0,
+	ret = drm_mm_insert_node_in_range(mm, &node->mm_nodes[0],
+					  mem->num_pages, bo->page_alignment, 0,
 					  place->fpfn, lpfn, mode);
 	spin_unlock(&rman->lock);
 
 	if (unlikely(ret)) {
 		kfree(node);
 	} else {
-		mem->mm_node = node;
-		mem->start = node->start;
+		mem->mm_node = &node->mm_nodes[0];
+		mem->start = node->mm_nodes[0].start;
 	}
 
 	return ret;
@@ -98,15 +101,19 @@ static void ttm_range_man_free(struct ttm_resource_manager *man,
 			       struct ttm_resource *mem)
 {
 	struct ttm_range_manager *rman = to_range_manager(man);
+	struct ttm_range_mgr_node *node;
 
-	if (mem->mm_node) {
-		spin_lock(&rman->lock);
-		drm_mm_remove_node(mem->mm_node);
-		spin_unlock(&rman->lock);
+	if (!mem->mm_node)
+		return;
 
-		kfree(mem->mm_node);
-		mem->mm_node = NULL;
-	}
+	node = to_ttm_range_mgr_node(mem);
+
+	spin_lock(&rman->lock);
+	drm_mm_remove_node(&node->mm_nodes[0]);
+	spin_unlock(&rman->lock);
+
+	kfree(node);
+	mem->mm_node = NULL;
 }
 
 static void ttm_range_man_debug(struct ttm_resource_manager *man,
@@ -125,6 +132,17 @@ static const struct ttm_resource_manager_func ttm_range_manager_func = {
 	.debug = ttm_range_man_debug
 };
 
+/**
+ * ttm_range_man_init
+ *
+ * @bdev: ttm device
+ * @type: memory manager type
+ * @use_tt: if the memory manager uses tt
+ * @p_size: size of area to be managed in pages.
+ *
+ * Initialise a generic range manager for the selected memory type.
+ * The range manager is installed for this device in the type slot.
+ */
 int ttm_range_man_init(struct ttm_device *bdev,
 		       unsigned type, bool use_tt,
 		       unsigned long p_size)
@@ -152,6 +170,14 @@ int ttm_range_man_init(struct ttm_device *bdev,
 }
 EXPORT_SYMBOL(ttm_range_man_init);
 
+/**
+ * ttm_range_man_fini
+ *
+ * @bdev: ttm device
+ * @type: memory manager type
+ *
+ * Remove the generic range manager from a slot and tear it down.
+ */
 int ttm_range_man_fini(struct ttm_device *bdev,
 		       unsigned type)
 {
diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index 65451e1bc303..2a51ace17614 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -25,6 +25,22 @@
 #include <drm/ttm/ttm_resource.h>
 #include <drm/ttm/ttm_bo_driver.h>
 
+void ttm_resource_init(struct ttm_buffer_object *bo,
+                       const struct ttm_place *place,
+                       struct ttm_resource *res)
+{
+	res->mm_node = NULL;
+	res->start = 0;
+	res->num_pages = PFN_UP(bo->base.size);
+	res->mem_type = place->mem_type;
+	res->placement = place->flags;
+	res->bus.addr = NULL;
+	res->bus.offset = 0;
+	res->bus.is_iomem = false;
+	res->bus.caching = ttm_cached;
+}
+EXPORT_SYMBOL(ttm_resource_init);
+
 int ttm_resource_alloc(struct ttm_buffer_object *bo,
 		       const struct ttm_place *place,
 		       struct ttm_resource **res_ptr)
@@ -38,15 +54,7 @@ int ttm_resource_alloc(struct ttm_buffer_object *bo,
 	if (!res)
 		return -ENOMEM;
 
-	res->mm_node = NULL;
-	res->start = 0;
-	res->num_pages = PFN_UP(bo->base.size);
-	res->mem_type = place->mem_type;
-	res->placement = place->flags;
-	res->bus.addr = NULL;
-	res->bus.offset = 0;
-	res->bus.is_iomem = false;
-	res->bus.caching = ttm_cached;
+	ttm_resource_init(bo, place, res);
 	r = man->func->alloc(man, bo, place, res);
 	if (r) {
 		kfree(res);
diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
index ead0ef7136c8..b266971c1974 100644
--- a/include/drm/ttm/ttm_bo_driver.h
+++ b/include/drm/ttm/ttm_bo_driver.h
@@ -304,30 +304,4 @@ int ttm_bo_tt_bind(struct ttm_buffer_object *bo, struct ttm_resource *mem);
  */
 void ttm_bo_tt_destroy(struct ttm_buffer_object *bo);
 
-/**
- * ttm_range_man_init
- *
- * @bdev: ttm device
- * @type: memory manager type
- * @use_tt: if the memory manager uses tt
- * @p_size: size of area to be managed in pages.
- *
- * Initialise a generic range manager for the selected memory type.
- * The range manager is installed for this device in the type slot.
- */
-int ttm_range_man_init(struct ttm_device *bdev,
-		       unsigned type, bool use_tt,
-		       unsigned long p_size);
-
-/**
- * ttm_range_man_fini
- *
- * @bdev: ttm device
- * @type: memory manager type
- *
- * Remove the generic range manager from a slot and tear it down.
- */
-int ttm_range_man_fini(struct ttm_device *bdev,
-		       unsigned type);
-
 #endif
diff --git a/include/drm/ttm/ttm_range_manager.h b/include/drm/ttm/ttm_range_manager.h
new file mode 100644
index 000000000000..983f452ce54b
--- /dev/null
+++ b/include/drm/ttm/ttm_range_manager.h
@@ -0,0 +1,43 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+
+#ifndef _TTM_RANGE_MANAGER_H_
+#define _TTM_RANGE_MANAGER_H_
+
+#include <drm/ttm/ttm_resource.h>
+#include <drm/drm_mm.h>
+
+/**
+ * struct ttm_range_mgr_node
+ *
+ * @base: base clase we extend
+ * @mm_nodes: MM nodes, usually 1
+ *
+ * Extending the ttm_resource object to manage an address space allocation with
+ * one or more drm_mm_nodes.
+ */
+struct ttm_range_mgr_node {
+	struct ttm_resource base;
+	struct drm_mm_node mm_nodes[];
+};
+
+/**
+ * to_ttm_range_mgr_node
+ *
+ * @res: the resource to upcast
+ *
+ * Upcast the ttm_resource object into a ttm_range_mgr_node object.
+ */
+static inline struct ttm_range_mgr_node *
+to_ttm_range_mgr_node(struct ttm_resource *res)
+{
+	return container_of(res->mm_node, struct ttm_range_mgr_node,
+			    mm_nodes[0]);
+}
+
+int ttm_range_man_init(struct ttm_device *bdev,
+		       unsigned type, bool use_tt,
+		       unsigned long p_size);
+int ttm_range_man_fini(struct ttm_device *bdev,
+		       unsigned type);
+
+#endif
diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
index c17c1a52070d..803e4875d779 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -223,6 +223,9 @@ ttm_resource_manager_cleanup(struct ttm_resource_manager *man)
 	man->move = NULL;
 }
 
+void ttm_resource_init(struct ttm_buffer_object *bo,
+                       const struct ttm_place *place,
+                       struct ttm_resource *res);
 int ttm_resource_alloc(struct ttm_buffer_object *bo,
 		       const struct ttm_place *place,
 		       struct ttm_resource **res);
-- 
2.25.1

