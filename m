Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5F813DB37
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2020 14:12:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CAEB6ECF7;
	Thu, 16 Jan 2020 13:12:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9832E6ECF7;
 Thu, 16 Jan 2020 13:12:53 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id g6so8329312plt.2;
 Thu, 16 Jan 2020 05:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=iHv20i5GlVESCxNO7NqZk3wCU3STi5OyfK0oNiVJ+rg=;
 b=TmAm6ePw9UR4F/VG6pUp7gZjkHgJ6hhiW71NKicLqgNA+wbjiC/wyfBKgBd21hj5g2
 VSFcwfAAmfLpy8kGcE0YFUYuobl7dRfm5+ZLnXmUAU3q+BhrS4IBbCvd5cU03NS/q2nv
 z8ym2ul9TF/vhskgMurH9D6eLI70elQnrjLmZ5S1245Tjdo5U/rUvpd9+x44g7OwdeGA
 vZ6zo0B4544ALcp5f48niAGmg+F9T+KyS18eXONJUqhRDh/UdLf59oKt6ifaGeOu0GJA
 +z31gQtQ10DLTAnhgfmObZPVi0BgWMeUvHSUQjIRE0pEdXh6R7RaJOtzANWJHLj12wNH
 xk5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=iHv20i5GlVESCxNO7NqZk3wCU3STi5OyfK0oNiVJ+rg=;
 b=r1MOl9N05uVeFyDWo9zzY7d5Eouf7mdyj2y1zbhu4PFXV5dJt01s1dN0eGoAFtrEL3
 AmvVh9xpBVxIscpKG93CVde6xQI0sbrhl1PK4XgK+9tpJySvF0jEilI6lcaLJJlIP3Bx
 KqVciDIjAdIocZV/v98piSIiqQf7O/O7X+iI5+tOEJzSoveAMu/2OozYNkElCzDPTNpo
 1/DNm1D26qk8qIV1ZKpNoqemQCcf/ZeXDj7ZkNwMJnmUB7go+h94lKjdZxR4fB3/+EwW
 8ULT4rsvdjsjJsDR9/H+oVURx+P5JDpUWuIRAyTw1gA7NGl37JVmuA8+LP6yKbIbwBfA
 9n7g==
X-Gm-Message-State: APjAAAVvglhdb71uY8KgmcrP6WNgcs0oEq/onlg18922bHkWC3nYOb5B
 zHbZX+IGyAqKBY3AcsovhLKl46XH
X-Google-Smtp-Source: APXvYqyiF2uSuaBBJLa/O3PGJtybEMVF14u7IDXDizgvhEiVLioKSbcVvoxZNgbT4BTCIQreKDvNlQ==
X-Received: by 2002:a17:902:a9c7:: with SMTP id
 b7mr31541213plr.255.1579180372921; 
 Thu, 16 Jan 2020 05:12:52 -0800 (PST)
Received: from localhost.localdomain ([103.219.195.110])
 by smtp.gmail.com with ESMTPSA id v9sm25945877pfi.37.2020.01.16.05.12.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2020 05:12:52 -0800 (PST)
From: Qiang Yu <yuq825@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/5] drm/lima: support heap buffer creation
Date: Thu, 16 Jan 2020 21:11:55 +0800
Message-Id: <20200116131157.13346-4-yuq825@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200116131157.13346-1-yuq825@gmail.com>
References: <20200116131157.13346-1-yuq825@gmail.com>
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
Cc: lima@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Andreas Baierl <ichgeh@imkreisrum.de>,
 Qiang Yu <yuq825@gmail.com>, Erico Nunes <nunes.erico@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

heap buffer is used as output of GP and input of PP for
Mali Utgard GPU. Size of heap buffer depends on the task
so is a runtime variable.

Previously we just create a large enough buffer as heap
buffer. Now we add a heap buffer type to be able to
increase the backup memory dynamically when GP fail due
to lack of heap memory.

Signed-off-by: Qiang Yu <yuq825@gmail.com>
---
 drivers/gpu/drm/lima/lima_drv.c |   6 +-
 drivers/gpu/drm/lima/lima_drv.h |   1 +
 drivers/gpu/drm/lima/lima_gem.c | 130 ++++++++++++++++++++++++++++++--
 drivers/gpu/drm/lima/lima_gem.h |   4 +
 drivers/gpu/drm/lima/lima_vm.c  |   4 +-
 include/uapi/drm/lima_drm.h     |   9 ++-
 6 files changed, 143 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/lima/lima_drv.c b/drivers/gpu/drm/lima/lima_drv.c
index 124efe4fa97b..18f88aaef1a2 100644
--- a/drivers/gpu/drm/lima/lima_drv.c
+++ b/drivers/gpu/drm/lima/lima_drv.c
@@ -15,10 +15,14 @@
 #include "lima_vm.h"
 
 int lima_sched_timeout_ms;
+uint lima_heap_init_nr_pages = 8;
 
 MODULE_PARM_DESC(sched_timeout_ms, "task run timeout in ms");
 module_param_named(sched_timeout_ms, lima_sched_timeout_ms, int, 0444);
 
+MODULE_PARM_DESC(heap_init_nr_pages, "heap buffer init number of pages");
+module_param_named(heap_init_nr_pages, lima_heap_init_nr_pages, uint, 0444);
+
 static int lima_ioctl_get_param(struct drm_device *dev, void *data, struct drm_file *file)
 {
 	struct drm_lima_get_param *args = data;
@@ -68,7 +72,7 @@ static int lima_ioctl_gem_create(struct drm_device *dev, void *data, struct drm_
 	if (args->pad)
 		return -EINVAL;
 
-	if (args->flags)
+	if (args->flags & ~(LIMA_BO_FLAG_HEAP))
 		return -EINVAL;
 
 	if (args->size == 0)
diff --git a/drivers/gpu/drm/lima/lima_drv.h b/drivers/gpu/drm/lima/lima_drv.h
index 69c7344715c9..f492ecc6a5d9 100644
--- a/drivers/gpu/drm/lima/lima_drv.h
+++ b/drivers/gpu/drm/lima/lima_drv.h
@@ -9,6 +9,7 @@
 #include "lima_ctx.h"
 
 extern int lima_sched_timeout_ms;
+extern uint lima_heap_init_nr_pages;
 
 struct lima_vm;
 struct lima_bo;
diff --git a/drivers/gpu/drm/lima/lima_gem.c b/drivers/gpu/drm/lima/lima_gem.c
index d0059d8c97d8..24e1a086d5fe 100644
--- a/drivers/gpu/drm/lima/lima_gem.c
+++ b/drivers/gpu/drm/lima/lima_gem.c
@@ -4,6 +4,8 @@
 #include <linux/mm.h>
 #include <linux/sync_file.h>
 #include <linux/pagemap.h>
+#include <linux/shmem_fs.h>
+#include <linux/dma-mapping.h>
 
 #include <drm/drm_file.h>
 #include <drm/drm_syncobj.h>
@@ -15,6 +17,80 @@
 #include "lima_gem.h"
 #include "lima_vm.h"
 
+int lima_heap_alloc(struct lima_bo *bo, struct lima_vm *vm)
+{
+	struct page **pages;
+	struct address_space *mapping = bo->base.base.filp->f_mapping;
+	struct device *dev = bo->base.base.dev->dev;
+	size_t old_size = bo->heap_size;
+	size_t new_size = bo->heap_size ? bo->heap_size * 2 :
+		(lima_heap_init_nr_pages << PAGE_SHIFT);
+	struct sg_table sgt;
+	int i, ret;
+
+	if (bo->heap_size >= bo->base.base.size)
+		return -ENOSPC;
+
+	new_size = min(new_size, bo->base.base.size);
+
+	mutex_lock(&bo->base.pages_lock);
+
+	if (bo->base.pages)
+		pages = bo->base.pages;
+	else {
+		pages = kvmalloc_array(bo->base.base.size >> PAGE_SHIFT,
+				       sizeof(*pages), GFP_KERNEL | __GFP_ZERO);
+		if (!pages) {
+			mutex_unlock(&bo->base.pages_lock);
+			return -ENOMEM;
+		}
+
+		bo->base.pages = pages;
+		bo->base.pages_use_count = 1;
+
+		mapping_set_unevictable(mapping);
+	}
+
+	for (i = old_size >> PAGE_SHIFT; i < new_size >> PAGE_SHIFT; i++) {
+		struct page *page = shmem_read_mapping_page(mapping, i);
+		if (IS_ERR(page)) {
+			mutex_unlock(&bo->base.pages_lock);
+			return PTR_ERR(page);
+		}
+		pages[i] = page;
+	}
+
+	mutex_unlock(&bo->base.pages_lock);
+
+	ret = sg_alloc_table_from_pages(&sgt, pages, i, 0, new_size, GFP_KERNEL);
+	if (ret)
+		return ret;
+
+	if (bo->base.sgt) {
+		dma_unmap_sg(dev, bo->base.sgt->sgl, bo->base.sgt->nents, DMA_BIDIRECTIONAL);
+		sg_free_table(bo->base.sgt);
+	} else {
+		bo->base.sgt = kmalloc(sizeof(*bo->base.sgt), GFP_KERNEL);
+		if (!bo->base.sgt) {
+			sg_free_table(&sgt);
+			return -ENOMEM;
+		}
+	}
+
+	dma_map_sg(dev, sgt.sgl, sgt.nents, DMA_BIDIRECTIONAL);
+
+	*bo->base.sgt = sgt;
+
+	if (vm) {
+		ret = lima_vm_map_bo(vm, bo, old_size >> PAGE_SHIFT);
+		if (ret)
+			return ret;
+	}
+
+	bo->heap_size = new_size;
+	return 0;
+}
+
 int lima_gem_create_handle(struct drm_device *dev, struct drm_file *file,
 			   u32 size, u32 flags, u32 *handle)
 {
@@ -22,7 +98,8 @@ int lima_gem_create_handle(struct drm_device *dev, struct drm_file *file,
 	gfp_t mask;
 	struct drm_gem_shmem_object *shmem;
 	struct drm_gem_object *obj;
-	struct sg_table *sgt;
+	struct lima_bo *bo;
+	bool is_heap = flags & LIMA_BO_FLAG_HEAP;
 
 	shmem = drm_gem_shmem_create(dev, size);
 	if (IS_ERR(shmem))
@@ -36,10 +113,17 @@ int lima_gem_create_handle(struct drm_device *dev, struct drm_file *file,
 	mask |= __GFP_DMA32;
 	mapping_set_gfp_mask(obj->filp->f_mapping, mask);
 
-	sgt = drm_gem_shmem_get_pages_sgt(obj);
-	if (IS_ERR(sgt)) {
-		err = PTR_ERR(sgt);
-		goto out;
+	if (is_heap) {
+		bo = to_lima_bo(obj);
+		err = lima_heap_alloc(bo, NULL);
+		if (err)
+			goto out;
+	} else {
+		struct sg_table *sgt = drm_gem_shmem_get_pages_sgt(obj);
+		if (IS_ERR(sgt)) {
+			err = PTR_ERR(sgt);
+			goto out;
+		}
 	}
 
 	err = drm_gem_handle_create(file, obj, handle);
@@ -79,17 +163,47 @@ static void lima_gem_object_close(struct drm_gem_object *obj, struct drm_file *f
 	lima_vm_bo_del(vm, bo);
 }
 
+static int lima_gem_pin(struct drm_gem_object *obj)
+{
+	struct lima_bo *bo = to_lima_bo(obj);
+
+	if (bo->heap_size)
+		return -EINVAL;
+
+	return drm_gem_shmem_pin(obj);
+}
+
+static void *lima_gem_vmap(struct drm_gem_object *obj)
+{
+	struct lima_bo *bo = to_lima_bo(obj);
+
+	if (bo->heap_size)
+		return ERR_PTR(-EINVAL);
+
+	return drm_gem_shmem_vmap(obj);
+}
+
+static int lima_gem_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
+{
+	struct lima_bo *bo = to_lima_bo(obj);
+
+	if (bo->heap_size)
+		return -EINVAL;
+
+	return drm_gem_shmem_mmap(obj, vma);
+}
+
 static const struct drm_gem_object_funcs lima_gem_funcs = {
 	.free = lima_gem_free_object,
 	.open = lima_gem_object_open,
 	.close = lima_gem_object_close,
 	.print_info = drm_gem_shmem_print_info,
-	.pin = drm_gem_shmem_pin,
+	.pin = lima_gem_pin,
 	.unpin = drm_gem_shmem_unpin,
 	.get_sg_table = drm_gem_shmem_get_sg_table,
-	.vmap = drm_gem_shmem_vmap,
+	.vmap = lima_gem_vmap,
 	.vunmap = drm_gem_shmem_vunmap,
-	.mmap = drm_gem_shmem_mmap,
+	.mmap = lima_gem_mmap,
 };
 
 struct drm_gem_object *lima_gem_create_object(struct drm_device *dev, size_t size)
diff --git a/drivers/gpu/drm/lima/lima_gem.h b/drivers/gpu/drm/lima/lima_gem.h
index 1800feb3e47f..ccea06142f4b 100644
--- a/drivers/gpu/drm/lima/lima_gem.h
+++ b/drivers/gpu/drm/lima/lima_gem.h
@@ -7,12 +7,15 @@
 #include <drm/drm_gem_shmem_helper.h>
 
 struct lima_submit;
+struct lima_vm;
 
 struct lima_bo {
 	struct drm_gem_shmem_object base;
 
 	struct mutex lock;
 	struct list_head va;
+
+	size_t heap_size;
 };
 
 static inline struct lima_bo *
@@ -31,6 +34,7 @@ static inline struct dma_resv *lima_bo_resv(struct lima_bo *bo)
 	return bo->base.base.resv;
 }
 
+int lima_heap_alloc(struct lima_bo *bo, struct lima_vm *vm);
 struct drm_gem_object *lima_gem_create_object(struct drm_device *dev, size_t size);
 int lima_gem_create_handle(struct drm_device *dev, struct drm_file *file,
 			   u32 size, u32 flags, u32 *handle);
diff --git a/drivers/gpu/drm/lima/lima_vm.c b/drivers/gpu/drm/lima/lima_vm.c
index d46f2a69ab42..dff97502ca36 100644
--- a/drivers/gpu/drm/lima/lima_vm.c
+++ b/drivers/gpu/drm/lima/lima_vm.c
@@ -155,6 +155,7 @@ int lima_vm_bo_add(struct lima_vm *vm, struct lima_bo *bo, bool create)
 void lima_vm_bo_del(struct lima_vm *vm, struct lima_bo *bo)
 {
 	struct lima_bo_va *bo_va;
+	u32 size;
 
 	mutex_lock(&bo->lock);
 
@@ -166,8 +167,9 @@ void lima_vm_bo_del(struct lima_vm *vm, struct lima_bo *bo)
 
 	mutex_lock(&vm->lock);
 
+	size = bo->heap_size ? bo->heap_size : bo_va->node.size;
 	lima_vm_unmap_range(vm, bo_va->node.start,
-			    bo_va->node.start + bo_va->node.size - 1);
+			    bo_va->node.start + size - 1);
 
 	drm_mm_remove_node(&bo_va->node);
 
diff --git a/include/uapi/drm/lima_drm.h b/include/uapi/drm/lima_drm.h
index 95a00fb867e6..1ec58d652a5a 100644
--- a/include/uapi/drm/lima_drm.h
+++ b/include/uapi/drm/lima_drm.h
@@ -32,12 +32,19 @@ struct drm_lima_get_param {
 	__u64 value; /* out, parameter value */
 };
 
+/*
+ * heap buffer dynamically increase backup memory size when GP task fail
+ * due to lack of heap memory. size field of heap buffer is an up bound of
+ * the backup memory which can be set to a fairly large value.
+ */
+#define LIMA_BO_FLAG_HEAP  (1 << 0)
+
 /**
  * create a buffer for used by GPU
  */
 struct drm_lima_gem_create {
 	__u32 size;    /* in, buffer size */
-	__u32 flags;   /* in, currently no flags, must be zero */
+	__u32 flags;   /* in, buffer flags */
 	__u32 handle;  /* out, GEM buffer handle */
 	__u32 pad;     /* pad, must be zero */
 };
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
