Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E090F7A875C
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 16:44:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E55E310E4FA;
	Wed, 20 Sep 2023 14:44:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6669510E4FC
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 14:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695221037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iQPbjtFVrzDYCVzGttBEJ06W/nbwGsvZVq5sC4DOEr8=;
 b=MC8Eh7Pr+FGjp8yT0zxYqgwfgukKtjCAWWvdLcjVzdQG8hDHrZ0Mrkvp1ne1w6cpSK3bxF
 QppSF4b4l80L53ESBfDOroZnLYFoIuhK3Bavsryt/QROfBQE3otJh59yZMz9OMxtC6pi/P
 Fh3N3dM6wZRrHdllt51VUQ81LfJ6HtU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-589-BW07ooNLNH-7QiGjBsF8Kw-1; Wed, 20 Sep 2023 10:43:56 -0400
X-MC-Unique: BW07ooNLNH-7QiGjBsF8Kw-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-99bebfada8cso500108966b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 07:43:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695221034; x=1695825834;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iQPbjtFVrzDYCVzGttBEJ06W/nbwGsvZVq5sC4DOEr8=;
 b=RhSw35XAJLeg4rSEAbEah8RgbfchX8YJ53AEcVsoOi2LThJa0glkhFX2vzuRKj4+nE
 W6um5u+IQOEdqtDFSUeFgKdvaXuuJuZ9qkwG0YFkUKJdxdzwgK368kIkfydCNrLRlPe0
 VR7i3ZNwLY9yv8Lj3O2c/WwfGzhF1lIkcfv3MR+BORAtcFg8CkoimJp99MUn4axXl2pL
 wGpxY+ZhmrvZmRxTCjNGnIXqiwFgFdbQO1idBm2cXp8zxxMXOOLK7pTOYnROniR4j/R5
 JkqbLHVVaazZMcO6aP6xMWONkwzm9SSnDmgHGWdJImSC4A41GVEjpSEHFnlAB3nRrIjC
 7rcQ==
X-Gm-Message-State: AOJu0YytidChsYr+DAOwPtB3jcLWWAUf8st7JVZ/qlovX8A14DSZhwcO
 c3BqD7CLLn4WP2pcIIkSm1ZzO8jzKFEH8Pue36JPz9+MS1NumtybKR9WTxNEM5XZ5b61NGe1fM3
 9BVyvbcg0zH0FFiDZmRK5VUUBBWll
X-Received: by 2002:a17:906:8465:b0:99d:fab5:e888 with SMTP id
 hx5-20020a170906846500b0099dfab5e888mr2535855ejc.34.1695221033467; 
 Wed, 20 Sep 2023 07:43:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPOdE9FCo+oExrzR3pcB1mrD8uHlN1HDqUfEiIlQBAGT/xbk66gRyPuQdRy7FBwvE9srI2lg==
X-Received: by 2002:a17:906:8465:b0:99d:fab5:e888 with SMTP id
 hx5-20020a170906846500b0099dfab5e888mr2535815ejc.34.1695221032829; 
 Wed, 20 Sep 2023 07:43:52 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 vr6-20020a170907a50600b009adce1c97ccsm8032083ejc.53.2023.09.20.07.43.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Sep 2023 07:43:52 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, sarah.walker@imgtec.com,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith.ekstrand@collabora.com
Subject: [PATCH drm-misc-next v4 1/8] drm/gpuvm: rename struct
 drm_gpuva_manager to struct drm_gpuvm
Date: Wed, 20 Sep 2023 16:42:34 +0200
Message-ID: <20230920144343.64830-2-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230920144343.64830-1-dakr@redhat.com>
References: <20230920144343.64830-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: nouveau@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rename struct drm_gpuva_manager to struct drm_gpuvm including
corresponding functions. This way the GPUVA manager's structures align
very well with the documentation of VM_BIND [1] and VM_BIND locking [2].

It also provides a better foundation for the naming of data structures
and functions introduced for implementing a common dma-resv per GPU-VM
including tracking of external and evicted objects in subsequent
patches.

[1] Documentation/gpu/drm-vm-bind-async.rst
[2] Documentation/gpu/drm-vm-bind-locking.rst

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/Makefile                      |   2 +-
 drivers/gpu/drm/drm_debugfs.c                 |  16 +-
 .../gpu/drm/{drm_gpuva_mgr.c => drm_gpuvm.c}  | 400 +++++++++---------
 drivers/gpu/drm/nouveau/nouveau_exec.c        |   2 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c        |  24 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.h        |   6 +-
 include/drm/drm_debugfs.h                     |   6 +-
 include/drm/{drm_gpuva_mgr.h => drm_gpuvm.h}  | 153 ++++---
 8 files changed, 304 insertions(+), 305 deletions(-)
 rename drivers/gpu/drm/{drm_gpuva_mgr.c => drm_gpuvm.c} (78%)
 rename include/drm/{drm_gpuva_mgr.h => drm_gpuvm.h} (78%)

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 215e78e79125..7a84b3cddeab 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -45,7 +45,7 @@ drm-y := \
 	drm_vblank.o \
 	drm_vblank_work.o \
 	drm_vma_manager.o \
-	drm_gpuva_mgr.o \
+	drm_gpuvm.o \
 	drm_writeback.o
 drm-$(CONFIG_DRM_LEGACY) += \
 	drm_agpsupport.o \
diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 44ecd7d0daac..f291fb4b359f 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -40,7 +40,7 @@
 #include <drm/drm_file.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_managed.h>
-#include <drm/drm_gpuva_mgr.h>
+#include <drm/drm_gpuvm.h>
 
 #include "drm_crtc_internal.h"
 #include "drm_internal.h"
@@ -189,31 +189,31 @@ static const struct file_operations drm_debugfs_fops = {
 /**
  * drm_debugfs_gpuva_info - dump the given DRM GPU VA space
  * @m: pointer to the &seq_file to write
- * @mgr: the &drm_gpuva_manager representing the GPU VA space
+ * @gpuvm: the &drm_gpuvm representing the GPU VA space
  *
  * Dumps the GPU VA mappings of a given DRM GPU VA manager.
  *
  * For each DRM GPU VA space drivers should call this function from their
  * &drm_info_list's show callback.
  *
- * Returns: 0 on success, -ENODEV if the &mgr is not initialized
+ * Returns: 0 on success, -ENODEV if the &gpuvm is not initialized
  */
 int drm_debugfs_gpuva_info(struct seq_file *m,
-			   struct drm_gpuva_manager *mgr)
+			   struct drm_gpuvm *gpuvm)
 {
-	struct drm_gpuva *va, *kva = &mgr->kernel_alloc_node;
+	struct drm_gpuva *va, *kva = &gpuvm->kernel_alloc_node;
 
-	if (!mgr->name)
+	if (!gpuvm->name)
 		return -ENODEV;
 
 	seq_printf(m, "DRM GPU VA space (%s) [0x%016llx;0x%016llx]\n",
-		   mgr->name, mgr->mm_start, mgr->mm_start + mgr->mm_range);
+		   gpuvm->name, gpuvm->mm_start, gpuvm->mm_start + gpuvm->mm_range);
 	seq_printf(m, "Kernel reserved node [0x%016llx;0x%016llx]\n",
 		   kva->va.addr, kva->va.addr + kva->va.range);
 	seq_puts(m, "\n");
 	seq_puts(m, " VAs | start              | range              | end                | object             | object offset\n");
 	seq_puts(m, "-------------------------------------------------------------------------------------------------------------\n");
-	drm_gpuva_for_each_va(va, mgr) {
+	drm_gpuvm_for_each_va(va, gpuvm) {
 		if (unlikely(va == kva))
 			continue;
 
diff --git a/drivers/gpu/drm/drm_gpuva_mgr.c b/drivers/gpu/drm/drm_gpuvm.c
similarity index 78%
rename from drivers/gpu/drm/drm_gpuva_mgr.c
rename to drivers/gpu/drm/drm_gpuvm.c
index f86bfad74ff8..7074bcad5b28 100644
--- a/drivers/gpu/drm/drm_gpuva_mgr.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -25,7 +25,7 @@
  *
  */
 
-#include <drm/drm_gpuva_mgr.h>
+#include <drm/drm_gpuvm.h>
 
 #include <linux/interval_tree_generic.h>
 #include <linux/mm.h>
@@ -33,8 +33,8 @@
 /**
  * DOC: Overview
  *
- * The DRM GPU VA Manager, represented by struct drm_gpuva_manager keeps track
- * of a GPU's virtual address (VA) space and manages the corresponding virtual
+ * The DRM GPU VA Manager, represented by struct drm_gpuvm keeps track of a
+ * GPU's virtual address (VA) space and manages the corresponding virtual
  * mappings represented by &drm_gpuva objects. It also keeps track of the
  * mapping's backing &drm_gem_object buffers.
  *
@@ -47,28 +47,28 @@
  * The GPU VA manager internally uses a rb-tree to manage the
  * &drm_gpuva mappings within a GPU's virtual address space.
  *
- * The &drm_gpuva_manager contains a special &drm_gpuva representing the
+ * The &drm_gpuvm structure contains a special &drm_gpuva representing the
  * portion of VA space reserved by the kernel. This node is initialized together
  * with the GPU VA manager instance and removed when the GPU VA manager is
  * destroyed.
  *
- * In a typical application drivers would embed struct drm_gpuva_manager and
+ * In a typical application drivers would embed struct drm_gpuvm and
  * struct drm_gpuva within their own driver specific structures, there won't be
  * any memory allocations of its own nor memory allocations of &drm_gpuva
  * entries.
  *
- * The data structures needed to store &drm_gpuvas within the &drm_gpuva_manager
- * are contained within struct drm_gpuva already. Hence, for inserting
- * &drm_gpuva entries from within dma-fence signalling critical sections it is
- * enough to pre-allocate the &drm_gpuva structures.
+ * The data structures needed to store &drm_gpuvas within the &drm_gpuvm are
+ * contained within struct drm_gpuva already. Hence, for inserting &drm_gpuva
+ * entries from within dma-fence signalling critical sections it is enough to
+ * pre-allocate the &drm_gpuva structures.
  */
 
 /**
  * DOC: Split and Merge
  *
  * Besides its capability to manage and represent a GPU VA space, the
- * &drm_gpuva_manager also provides functions to let the &drm_gpuva_manager
- * calculate a sequence of operations to satisfy a given map or unmap request.
+ * GPU VA manager also provides functions to let the &drm_gpuvm calculate a
+ * sequence of operations to satisfy a given map or unmap request.
  *
  * Therefore the DRM GPU VA manager provides an algorithm implementing splitting
  * and merging of existent GPU VA mappings with the ones that are requested to
@@ -76,16 +76,16 @@
  * implement Vulkan 'Sparse Memory Bindings' - drivers UAPIs often refer to this
  * as VM BIND.
  *
- * Drivers can call drm_gpuva_sm_map() to receive a sequence of callbacks
+ * Drivers can call drm_gpuvm_sm_map() to receive a sequence of callbacks
  * containing map, unmap and remap operations for a given newly requested
  * mapping. The sequence of callbacks represents the set of operations to
  * execute in order to integrate the new mapping cleanly into the current state
  * of the GPU VA space.
  *
  * Depending on how the new GPU VA mapping intersects with the existent mappings
- * of the GPU VA space the &drm_gpuva_fn_ops callbacks contain an arbitrary
- * amount of unmap operations, a maximum of two remap operations and a single
- * map operation. The caller might receive no callback at all if no operation is
+ * of the GPU VA space the &drm_gpuvm_ops callbacks contain an arbitrary amount
+ * of unmap operations, a maximum of two remap operations and a single map
+ * operation. The caller might receive no callback at all if no operation is
  * required, e.g. if the requested mapping already exists in the exact same way.
  *
  * The single map operation represents the original map operation requested by
@@ -95,7 +95,7 @@
  * &drm_gpuva to unmap is physically contiguous with the original mapping
  * request. Optionally, if 'keep' is set, drivers may keep the actual page table
  * entries for this &drm_gpuva, adding the missing page table entries only and
- * update the &drm_gpuva_manager's view of things accordingly.
+ * update the &drm_gpuvm's view of things accordingly.
  *
  * Drivers may do the same optimization, namely delta page table updates, also
  * for remap operations. This is possible since &drm_gpuva_op_remap consists of
@@ -106,34 +106,34 @@
  * the beginning and one at the end of the new mapping, hence there is a
  * maximum of two remap operations.
  *
- * Analogous to drm_gpuva_sm_map() drm_gpuva_sm_unmap() uses &drm_gpuva_fn_ops
- * to call back into the driver in order to unmap a range of GPU VA space. The
+ * Analogous to drm_gpuvm_sm_map() drm_gpuvm_sm_unmap() uses &drm_gpuvm_ops to
+ * call back into the driver in order to unmap a range of GPU VA space. The
  * logic behind this function is way simpler though: For all existent mappings
  * enclosed by the given range unmap operations are created. For mappings which
  * are only partically located within the given range, remap operations are
  * created such that those mappings are split up and re-mapped partically.
  *
- * As an alternative to drm_gpuva_sm_map() and drm_gpuva_sm_unmap(),
- * drm_gpuva_sm_map_ops_create() and drm_gpuva_sm_unmap_ops_create() can be used
+ * As an alternative to drm_gpuvm_sm_map() and drm_gpuvm_sm_unmap(),
+ * drm_gpuvm_sm_map_ops_create() and drm_gpuvm_sm_unmap_ops_create() can be used
  * to directly obtain an instance of struct drm_gpuva_ops containing a list of
  * &drm_gpuva_op, which can be iterated with drm_gpuva_for_each_op(). This list
  * contains the &drm_gpuva_ops analogous to the callbacks one would receive when
- * calling drm_gpuva_sm_map() or drm_gpuva_sm_unmap(). While this way requires
+ * calling drm_gpuvm_sm_map() or drm_gpuvm_sm_unmap(). While this way requires
  * more memory (to allocate the &drm_gpuva_ops), it provides drivers a way to
  * iterate the &drm_gpuva_op multiple times, e.g. once in a context where memory
  * allocations are possible (e.g. to allocate GPU page tables) and once in the
  * dma-fence signalling critical path.
  *
- * To update the &drm_gpuva_manager's view of the GPU VA space
- * drm_gpuva_insert() and drm_gpuva_remove() may be used. These functions can
- * safely be used from &drm_gpuva_fn_ops callbacks originating from
- * drm_gpuva_sm_map() or drm_gpuva_sm_unmap(). However, it might be more
- * convenient to use the provided helper functions drm_gpuva_map(),
- * drm_gpuva_remap() and drm_gpuva_unmap() instead.
+ * To update the &drm_gpuvm's view of the GPU VA space drm_gpuva_insert() and
+ * drm_gpuva_remove() may be used. These functions can safely be used from
+ * &drm_gpuvm_ops callbacks originating from drm_gpuvm_sm_map() or
+ * drm_gpuvm_sm_unmap(). However, it might be more convenient to use the
+ * provided helper functions drm_gpuva_map(), drm_gpuva_remap() and
+ * drm_gpuva_unmap() instead.
  *
  * The following diagram depicts the basic relationships of existent GPU VA
  * mappings, a newly requested mapping and the resulting mappings as implemented
- * by drm_gpuva_sm_map() - it doesn't cover any arbitrary combinations of these.
+ * by drm_gpuvm_sm_map() - it doesn't cover any arbitrary combinations of these.
  *
  * 1) Requested mapping is identical. Replace it, but indicate the backing PTEs
  *    could be kept.
@@ -421,10 +421,10 @@
  *	// Allocates a new &drm_gpuva.
  *	struct drm_gpuva * driver_gpuva_alloc(void);
  *
- *	// Typically drivers would embedd the &drm_gpuva_manager and &drm_gpuva
+ *	// Typically drivers would embedd the &drm_gpuvm and &drm_gpuva
  *	// structure in individual driver structures and lock the dma-resv with
  *	// drm_exec or similar helpers.
- *	int driver_mapping_create(struct drm_gpuva_manager *mgr,
+ *	int driver_mapping_create(struct drm_gpuvm *gpuvm,
  *				  u64 addr, u64 range,
  *				  struct drm_gem_object *obj, u64 offset)
  *	{
@@ -432,7 +432,7 @@
  *		struct drm_gpuva_op *op
  *
  *		driver_lock_va_space();
- *		ops = drm_gpuva_sm_map_ops_create(mgr, addr, range,
+ *		ops = drm_gpuvm_sm_map_ops_create(gpuvm, addr, range,
  *						  obj, offset);
  *		if (IS_ERR(ops))
  *			return PTR_ERR(ops);
@@ -448,7 +448,7 @@
  *					  // free memory and unlock
  *
  *				driver_vm_map();
- *				drm_gpuva_map(mgr, va, &op->map);
+ *				drm_gpuva_map(gpuvm, va, &op->map);
  *				drm_gpuva_link(va);
  *
  *				break;
@@ -504,23 +504,23 @@
  * 2) Receive a callback for each &drm_gpuva_op to create a new mapping::
  *
  *	struct driver_context {
- *		struct drm_gpuva_manager *mgr;
+ *		struct drm_gpuvm *gpuvm;
  *		struct drm_gpuva *new_va;
  *		struct drm_gpuva *prev_va;
  *		struct drm_gpuva *next_va;
  *	};
  *
- *	// ops to pass to drm_gpuva_manager_init()
- *	static const struct drm_gpuva_fn_ops driver_gpuva_ops = {
+ *	// ops to pass to drm_gpuvm_init()
+ *	static const struct drm_gpuvm_ops driver_gpuvm_ops = {
  *		.sm_step_map = driver_gpuva_map,
  *		.sm_step_remap = driver_gpuva_remap,
  *		.sm_step_unmap = driver_gpuva_unmap,
  *	};
  *
- *	// Typically drivers would embedd the &drm_gpuva_manager and &drm_gpuva
+ *	// Typically drivers would embedd the &drm_gpuvm and &drm_gpuva
  *	// structure in individual driver structures and lock the dma-resv with
  *	// drm_exec or similar helpers.
- *	int driver_mapping_create(struct drm_gpuva_manager *mgr,
+ *	int driver_mapping_create(struct drm_gpuvm *gpuvm,
  *				  u64 addr, u64 range,
  *				  struct drm_gem_object *obj, u64 offset)
  *	{
@@ -529,7 +529,7 @@
  *		struct drm_gpuva_op *op;
  *		int ret = 0;
  *
- *		ctx.mgr = mgr;
+ *		ctx.gpuvm = gpuvm;
  *
  *		ctx.new_va = kzalloc(sizeof(*ctx.new_va), GFP_KERNEL);
  *		ctx.prev_va = kzalloc(sizeof(*ctx.prev_va), GFP_KERNEL);
@@ -540,7 +540,7 @@
  *		}
  *
  *		driver_lock_va_space();
- *		ret = drm_gpuva_sm_map(mgr, &ctx, addr, range, obj, offset);
+ *		ret = drm_gpuvm_sm_map(gpuvm, &ctx, addr, range, obj, offset);
  *		driver_unlock_va_space();
  *
  *	out:
@@ -554,7 +554,7 @@
  *	{
  *		struct driver_context *ctx = __ctx;
  *
- *		drm_gpuva_map(ctx->mgr, ctx->new_va, &op->map);
+ *		drm_gpuva_map(ctx->vm, ctx->new_va, &op->map);
  *
  *		drm_gpuva_link(ctx->new_va);
  *
@@ -609,12 +609,12 @@ INTERVAL_TREE_DEFINE(struct drm_gpuva, rb.node, u64, rb.__subtree_last,
 		     GPUVA_START, GPUVA_LAST, static __maybe_unused,
 		     drm_gpuva_it)
 
-static int __drm_gpuva_insert(struct drm_gpuva_manager *mgr,
+static int __drm_gpuva_insert(struct drm_gpuvm *gpuvm,
 			      struct drm_gpuva *va);
 static void __drm_gpuva_remove(struct drm_gpuva *va);
 
 static bool
-drm_gpuva_check_overflow(u64 addr, u64 range)
+drm_gpuvm_check_overflow(u64 addr, u64 range)
 {
 	u64 end;
 
@@ -623,121 +623,121 @@ drm_gpuva_check_overflow(u64 addr, u64 range)
 }
 
 static bool
-drm_gpuva_in_mm_range(struct drm_gpuva_manager *mgr, u64 addr, u64 range)
+drm_gpuvm_in_mm_range(struct drm_gpuvm *gpuvm, u64 addr, u64 range)
 {
 	u64 end = addr + range;
-	u64 mm_start = mgr->mm_start;
-	u64 mm_end = mm_start + mgr->mm_range;
+	u64 mm_start = gpuvm->mm_start;
+	u64 mm_end = mm_start + gpuvm->mm_range;
 
 	return addr >= mm_start && end <= mm_end;
 }
 
 static bool
-drm_gpuva_in_kernel_node(struct drm_gpuva_manager *mgr, u64 addr, u64 range)
+drm_gpuvm_in_kernel_node(struct drm_gpuvm *gpuvm, u64 addr, u64 range)
 {
 	u64 end = addr + range;
-	u64 kstart = mgr->kernel_alloc_node.va.addr;
-	u64 krange = mgr->kernel_alloc_node.va.range;
+	u64 kstart = gpuvm->kernel_alloc_node.va.addr;
+	u64 krange = gpuvm->kernel_alloc_node.va.range;
 	u64 kend = kstart + krange;
 
 	return krange && addr < kend && kstart < end;
 }
 
 static bool
-drm_gpuva_range_valid(struct drm_gpuva_manager *mgr,
+drm_gpuva_range_valid(struct drm_gpuvm *gpuvm,
 		      u64 addr, u64 range)
 {
-	return !drm_gpuva_check_overflow(addr, range) &&
-	       drm_gpuva_in_mm_range(mgr, addr, range) &&
-	       !drm_gpuva_in_kernel_node(mgr, addr, range);
+	return !drm_gpuvm_check_overflow(addr, range) &&
+	       drm_gpuvm_in_mm_range(gpuvm, addr, range) &&
+	       !drm_gpuvm_in_kernel_node(gpuvm, addr, range);
 }
 
 /**
- * drm_gpuva_manager_init() - initialize a &drm_gpuva_manager
- * @mgr: pointer to the &drm_gpuva_manager to initialize
+ * drm_gpuvm_init() - initialize a &drm_gpuvm
+ * @gpuvm: pointer to the &drm_gpuvm to initialize
  * @name: the name of the GPU VA space
  * @start_offset: the start offset of the GPU VA space
  * @range: the size of the GPU VA space
  * @reserve_offset: the start of the kernel reserved GPU VA area
  * @reserve_range: the size of the kernel reserved GPU VA area
- * @ops: &drm_gpuva_fn_ops called on &drm_gpuva_sm_map / &drm_gpuva_sm_unmap
+ * @ops: &drm_gpuvm_ops called on &drm_gpuvm_sm_map / &drm_gpuvm_sm_unmap
  *
- * The &drm_gpuva_manager must be initialized with this function before use.
+ * The &drm_gpuvm must be initialized with this function before use.
  *
- * Note that @mgr must be cleared to 0 before calling this function. The given
+ * Note that @gpuvm must be cleared to 0 before calling this function. The given
  * &name is expected to be managed by the surrounding driver structures.
  */
 void
-drm_gpuva_manager_init(struct drm_gpuva_manager *mgr,
-		       const char *name,
-		       u64 start_offset, u64 range,
-		       u64 reserve_offset, u64 reserve_range,
-		       const struct drm_gpuva_fn_ops *ops)
+drm_gpuvm_init(struct drm_gpuvm *gpuvm,
+	       const char *name,
+	       u64 start_offset, u64 range,
+	       u64 reserve_offset, u64 reserve_range,
+	       const struct drm_gpuvm_ops *ops)
 {
-	mgr->rb.tree = RB_ROOT_CACHED;
-	INIT_LIST_HEAD(&mgr->rb.list);
+	gpuvm->rb.tree = RB_ROOT_CACHED;
+	INIT_LIST_HEAD(&gpuvm->rb.list);
 
-	drm_gpuva_check_overflow(start_offset, range);
-	mgr->mm_start = start_offset;
-	mgr->mm_range = range;
+	drm_gpuvm_check_overflow(start_offset, range);
+	gpuvm->mm_start = start_offset;
+	gpuvm->mm_range = range;
 
-	mgr->name = name ? name : "unknown";
-	mgr->ops = ops;
+	gpuvm->name = name ? name : "unknown";
+	gpuvm->ops = ops;
 
-	memset(&mgr->kernel_alloc_node, 0, sizeof(struct drm_gpuva));
+	memset(&gpuvm->kernel_alloc_node, 0, sizeof(struct drm_gpuva));
 
 	if (reserve_range) {
-		mgr->kernel_alloc_node.va.addr = reserve_offset;
-		mgr->kernel_alloc_node.va.range = reserve_range;
+		gpuvm->kernel_alloc_node.va.addr = reserve_offset;
+		gpuvm->kernel_alloc_node.va.range = reserve_range;
 
-		if (likely(!drm_gpuva_check_overflow(reserve_offset,
+		if (likely(!drm_gpuvm_check_overflow(reserve_offset,
 						     reserve_range)))
-			__drm_gpuva_insert(mgr, &mgr->kernel_alloc_node);
+			__drm_gpuva_insert(gpuvm, &gpuvm->kernel_alloc_node);
 	}
 }
-EXPORT_SYMBOL_GPL(drm_gpuva_manager_init);
+EXPORT_SYMBOL_GPL(drm_gpuvm_init);
 
 /**
- * drm_gpuva_manager_destroy() - cleanup a &drm_gpuva_manager
- * @mgr: pointer to the &drm_gpuva_manager to clean up
+ * drm_gpuvm_destroy() - cleanup a &drm_gpuvm
+ * @gpuvm: pointer to the &drm_gpuvm to clean up
  *
  * Note that it is a bug to call this function on a manager that still
  * holds GPU VA mappings.
  */
 void
-drm_gpuva_manager_destroy(struct drm_gpuva_manager *mgr)
+drm_gpuvm_destroy(struct drm_gpuvm *gpuvm)
 {
-	mgr->name = NULL;
+	gpuvm->name = NULL;
 
-	if (mgr->kernel_alloc_node.va.range)
-		__drm_gpuva_remove(&mgr->kernel_alloc_node);
+	if (gpuvm->kernel_alloc_node.va.range)
+		__drm_gpuva_remove(&gpuvm->kernel_alloc_node);
 
-	WARN(!RB_EMPTY_ROOT(&mgr->rb.tree.rb_root),
+	WARN(!RB_EMPTY_ROOT(&gpuvm->rb.tree.rb_root),
 	     "GPUVA tree is not empty, potentially leaking memory.");
 }
-EXPORT_SYMBOL_GPL(drm_gpuva_manager_destroy);
+EXPORT_SYMBOL_GPL(drm_gpuvm_destroy);
 
 static int
-__drm_gpuva_insert(struct drm_gpuva_manager *mgr,
+__drm_gpuva_insert(struct drm_gpuvm *gpuvm,
 		   struct drm_gpuva *va)
 {
 	struct rb_node *node;
 	struct list_head *head;
 
-	if (drm_gpuva_it_iter_first(&mgr->rb.tree,
+	if (drm_gpuva_it_iter_first(&gpuvm->rb.tree,
 				    GPUVA_START(va),
 				    GPUVA_LAST(va)))
 		return -EEXIST;
 
-	va->mgr = mgr;
+	va->vm = gpuvm;
 
-	drm_gpuva_it_insert(va, &mgr->rb.tree);
+	drm_gpuva_it_insert(va, &gpuvm->rb.tree);
 
 	node = rb_prev(&va->rb.node);
 	if (node)
 		head = &(to_drm_gpuva(node))->rb.entry;
 	else
-		head = &mgr->rb.list;
+		head = &gpuvm->rb.list;
 
 	list_add(&va->rb.entry, head);
 
@@ -746,36 +746,36 @@ __drm_gpuva_insert(struct drm_gpuva_manager *mgr,
 
 /**
  * drm_gpuva_insert() - insert a &drm_gpuva
- * @mgr: the &drm_gpuva_manager to insert the &drm_gpuva in
+ * @gpuvm: the &drm_gpuvm to insert the &drm_gpuva in
  * @va: the &drm_gpuva to insert
  *
  * Insert a &drm_gpuva with a given address and range into a
- * &drm_gpuva_manager.
+ * &drm_gpuvm.
  *
  * It is safe to use this function using the safe versions of iterating the GPU
- * VA space, such as drm_gpuva_for_each_va_safe() and
- * drm_gpuva_for_each_va_range_safe().
+ * VA space, such as drm_gpuvm_for_each_va_safe() and
+ * drm_gpuvm_for_each_va_range_safe().
  *
  * Returns: 0 on success, negative error code on failure.
  */
 int
-drm_gpuva_insert(struct drm_gpuva_manager *mgr,
+drm_gpuva_insert(struct drm_gpuvm *gpuvm,
 		 struct drm_gpuva *va)
 {
 	u64 addr = va->va.addr;
 	u64 range = va->va.range;
 
-	if (unlikely(!drm_gpuva_range_valid(mgr, addr, range)))
+	if (unlikely(!drm_gpuva_range_valid(gpuvm, addr, range)))
 		return -EINVAL;
 
-	return __drm_gpuva_insert(mgr, va);
+	return __drm_gpuva_insert(gpuvm, va);
 }
 EXPORT_SYMBOL_GPL(drm_gpuva_insert);
 
 static void
 __drm_gpuva_remove(struct drm_gpuva *va)
 {
-	drm_gpuva_it_remove(va, &va->mgr->rb.tree);
+	drm_gpuva_it_remove(va, &va->vm->rb.tree);
 	list_del_init(&va->rb.entry);
 }
 
@@ -786,15 +786,15 @@ __drm_gpuva_remove(struct drm_gpuva *va)
  * This removes the given &va from the underlaying tree.
  *
  * It is safe to use this function using the safe versions of iterating the GPU
- * VA space, such as drm_gpuva_for_each_va_safe() and
- * drm_gpuva_for_each_va_range_safe().
+ * VA space, such as drm_gpuvm_for_each_va_safe() and
+ * drm_gpuvm_for_each_va_range_safe().
  */
 void
 drm_gpuva_remove(struct drm_gpuva *va)
 {
-	struct drm_gpuva_manager *mgr = va->mgr;
+	struct drm_gpuvm *gpuvm = va->vm;
 
-	if (unlikely(va == &mgr->kernel_alloc_node)) {
+	if (unlikely(va == &gpuvm->kernel_alloc_node)) {
 		WARN(1, "Can't destroy kernel reserved node.\n");
 		return;
 	}
@@ -853,37 +853,37 @@ EXPORT_SYMBOL_GPL(drm_gpuva_unlink);
 
 /**
  * drm_gpuva_find_first() - find the first &drm_gpuva in the given range
- * @mgr: the &drm_gpuva_manager to search in
+ * @gpuvm: the &drm_gpuvm to search in
  * @addr: the &drm_gpuvas address
  * @range: the &drm_gpuvas range
  *
  * Returns: the first &drm_gpuva within the given range
  */
 struct drm_gpuva *
-drm_gpuva_find_first(struct drm_gpuva_manager *mgr,
+drm_gpuva_find_first(struct drm_gpuvm *gpuvm,
 		     u64 addr, u64 range)
 {
 	u64 last = addr + range - 1;
 
-	return drm_gpuva_it_iter_first(&mgr->rb.tree, addr, last);
+	return drm_gpuva_it_iter_first(&gpuvm->rb.tree, addr, last);
 }
 EXPORT_SYMBOL_GPL(drm_gpuva_find_first);
 
 /**
  * drm_gpuva_find() - find a &drm_gpuva
- * @mgr: the &drm_gpuva_manager to search in
+ * @gpuvm: the &drm_gpuvm to search in
  * @addr: the &drm_gpuvas address
  * @range: the &drm_gpuvas range
  *
  * Returns: the &drm_gpuva at a given &addr and with a given &range
  */
 struct drm_gpuva *
-drm_gpuva_find(struct drm_gpuva_manager *mgr,
+drm_gpuva_find(struct drm_gpuvm *gpuvm,
 	       u64 addr, u64 range)
 {
 	struct drm_gpuva *va;
 
-	va = drm_gpuva_find_first(mgr, addr, range);
+	va = drm_gpuva_find_first(gpuvm, addr, range);
 	if (!va)
 		goto out;
 
@@ -900,7 +900,7 @@ EXPORT_SYMBOL_GPL(drm_gpuva_find);
 
 /**
  * drm_gpuva_find_prev() - find the &drm_gpuva before the given address
- * @mgr: the &drm_gpuva_manager to search in
+ * @gpuvm: the &drm_gpuvm to search in
  * @start: the given GPU VA's start address
  *
  * Find the adjacent &drm_gpuva before the GPU VA with given &start address.
@@ -911,18 +911,18 @@ EXPORT_SYMBOL_GPL(drm_gpuva_find);
  * Returns: a pointer to the found &drm_gpuva or NULL if none was found
  */
 struct drm_gpuva *
-drm_gpuva_find_prev(struct drm_gpuva_manager *mgr, u64 start)
+drm_gpuva_find_prev(struct drm_gpuvm *gpuvm, u64 start)
 {
-	if (!drm_gpuva_range_valid(mgr, start - 1, 1))
+	if (!drm_gpuva_range_valid(gpuvm, start - 1, 1))
 		return NULL;
 
-	return drm_gpuva_it_iter_first(&mgr->rb.tree, start - 1, start);
+	return drm_gpuva_it_iter_first(&gpuvm->rb.tree, start - 1, start);
 }
 EXPORT_SYMBOL_GPL(drm_gpuva_find_prev);
 
 /**
  * drm_gpuva_find_next() - find the &drm_gpuva after the given address
- * @mgr: the &drm_gpuva_manager to search in
+ * @gpuvm: the &drm_gpuvm to search in
  * @end: the given GPU VA's end address
  *
  * Find the adjacent &drm_gpuva after the GPU VA with given &end address.
@@ -933,47 +933,47 @@ EXPORT_SYMBOL_GPL(drm_gpuva_find_prev);
  * Returns: a pointer to the found &drm_gpuva or NULL if none was found
  */
 struct drm_gpuva *
-drm_gpuva_find_next(struct drm_gpuva_manager *mgr, u64 end)
+drm_gpuva_find_next(struct drm_gpuvm *gpuvm, u64 end)
 {
-	if (!drm_gpuva_range_valid(mgr, end, 1))
+	if (!drm_gpuva_range_valid(gpuvm, end, 1))
 		return NULL;
 
-	return drm_gpuva_it_iter_first(&mgr->rb.tree, end, end + 1);
+	return drm_gpuva_it_iter_first(&gpuvm->rb.tree, end, end + 1);
 }
 EXPORT_SYMBOL_GPL(drm_gpuva_find_next);
 
 /**
  * drm_gpuva_interval_empty() - indicate whether a given interval of the VA space
  * is empty
- * @mgr: the &drm_gpuva_manager to check the range for
+ * @gpuvm: the &drm_gpuvm to check the range for
  * @addr: the start address of the range
  * @range: the range of the interval
  *
  * Returns: true if the interval is empty, false otherwise
  */
 bool
-drm_gpuva_interval_empty(struct drm_gpuva_manager *mgr, u64 addr, u64 range)
+drm_gpuva_interval_empty(struct drm_gpuvm *gpuvm, u64 addr, u64 range)
 {
-	return !drm_gpuva_find_first(mgr, addr, range);
+	return !drm_gpuva_find_first(gpuvm, addr, range);
 }
 EXPORT_SYMBOL_GPL(drm_gpuva_interval_empty);
 
 /**
  * drm_gpuva_map() - helper to insert a &drm_gpuva according to a
  * &drm_gpuva_op_map
- * @mgr: the &drm_gpuva_manager
+ * @gpuvm: the &drm_gpuvm
  * @va: the &drm_gpuva to insert
  * @op: the &drm_gpuva_op_map to initialize @va with
  *
- * Initializes the @va from the @op and inserts it into the given @mgr.
+ * Initializes the @va from the @op and inserts it into the given @gpuvm.
  */
 void
-drm_gpuva_map(struct drm_gpuva_manager *mgr,
+drm_gpuva_map(struct drm_gpuvm *gpuvm,
 	      struct drm_gpuva *va,
 	      struct drm_gpuva_op_map *op)
 {
 	drm_gpuva_init_from_op(va, op);
-	drm_gpuva_insert(mgr, va);
+	drm_gpuva_insert(gpuvm, va);
 }
 EXPORT_SYMBOL_GPL(drm_gpuva_map);
 
@@ -993,18 +993,18 @@ drm_gpuva_remap(struct drm_gpuva *prev,
 		struct drm_gpuva_op_remap *op)
 {
 	struct drm_gpuva *curr = op->unmap->va;
-	struct drm_gpuva_manager *mgr = curr->mgr;
+	struct drm_gpuvm *gpuvm = curr->vm;
 
 	drm_gpuva_remove(curr);
 
 	if (op->prev) {
 		drm_gpuva_init_from_op(prev, op->prev);
-		drm_gpuva_insert(mgr, prev);
+		drm_gpuva_insert(gpuvm, prev);
 	}
 
 	if (op->next) {
 		drm_gpuva_init_from_op(next, op->next);
-		drm_gpuva_insert(mgr, next);
+		drm_gpuva_insert(gpuvm, next);
 	}
 }
 EXPORT_SYMBOL_GPL(drm_gpuva_remap);
@@ -1024,7 +1024,7 @@ drm_gpuva_unmap(struct drm_gpuva_op_unmap *op)
 EXPORT_SYMBOL_GPL(drm_gpuva_unmap);
 
 static int
-op_map_cb(const struct drm_gpuva_fn_ops *fn, void *priv,
+op_map_cb(const struct drm_gpuvm_ops *fn, void *priv,
 	  u64 addr, u64 range,
 	  struct drm_gem_object *obj, u64 offset)
 {
@@ -1040,7 +1040,7 @@ op_map_cb(const struct drm_gpuva_fn_ops *fn, void *priv,
 }
 
 static int
-op_remap_cb(const struct drm_gpuva_fn_ops *fn, void *priv,
+op_remap_cb(const struct drm_gpuvm_ops *fn, void *priv,
 	    struct drm_gpuva_op_map *prev,
 	    struct drm_gpuva_op_map *next,
 	    struct drm_gpuva_op_unmap *unmap)
@@ -1058,7 +1058,7 @@ op_remap_cb(const struct drm_gpuva_fn_ops *fn, void *priv,
 }
 
 static int
-op_unmap_cb(const struct drm_gpuva_fn_ops *fn, void *priv,
+op_unmap_cb(const struct drm_gpuvm_ops *fn, void *priv,
 	    struct drm_gpuva *va, bool merge)
 {
 	struct drm_gpuva_op op = {};
@@ -1071,8 +1071,8 @@ op_unmap_cb(const struct drm_gpuva_fn_ops *fn, void *priv,
 }
 
 static int
-__drm_gpuva_sm_map(struct drm_gpuva_manager *mgr,
-		   const struct drm_gpuva_fn_ops *ops, void *priv,
+__drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
+		   const struct drm_gpuvm_ops *ops, void *priv,
 		   u64 req_addr, u64 req_range,
 		   struct drm_gem_object *req_obj, u64 req_offset)
 {
@@ -1080,10 +1080,10 @@ __drm_gpuva_sm_map(struct drm_gpuva_manager *mgr,
 	u64 req_end = req_addr + req_range;
 	int ret;
 
-	if (unlikely(!drm_gpuva_range_valid(mgr, req_addr, req_range)))
+	if (unlikely(!drm_gpuva_range_valid(gpuvm, req_addr, req_range)))
 		return -EINVAL;
 
-	drm_gpuva_for_each_va_range_safe(va, next, mgr, req_addr, req_end) {
+	drm_gpuvm_for_each_va_range_safe(va, next, gpuvm, req_addr, req_end) {
 		struct drm_gem_object *obj = va->gem.obj;
 		u64 offset = va->gem.offset;
 		u64 addr = va->va.addr;
@@ -1215,18 +1215,18 @@ __drm_gpuva_sm_map(struct drm_gpuva_manager *mgr,
 }
 
 static int
-__drm_gpuva_sm_unmap(struct drm_gpuva_manager *mgr,
-		     const struct drm_gpuva_fn_ops *ops, void *priv,
+__drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm,
+		     const struct drm_gpuvm_ops *ops, void *priv,
 		     u64 req_addr, u64 req_range)
 {
 	struct drm_gpuva *va, *next;
 	u64 req_end = req_addr + req_range;
 	int ret;
 
-	if (unlikely(!drm_gpuva_range_valid(mgr, req_addr, req_range)))
+	if (unlikely(!drm_gpuva_range_valid(gpuvm, req_addr, req_range)))
 		return -EINVAL;
 
-	drm_gpuva_for_each_va_range_safe(va, next, mgr, req_addr, req_end) {
+	drm_gpuvm_for_each_va_range_safe(va, next, gpuvm, req_addr, req_end) {
 		struct drm_gpuva_op_map prev = {}, next = {};
 		bool prev_split = false, next_split = false;
 		struct drm_gem_object *obj = va->gem.obj;
@@ -1273,8 +1273,8 @@ __drm_gpuva_sm_unmap(struct drm_gpuva_manager *mgr,
 }
 
 /**
- * drm_gpuva_sm_map() - creates the &drm_gpuva_op split/merge steps
- * @mgr: the &drm_gpuva_manager representing the GPU VA space
+ * drm_gpuvm_sm_map() - creates the &drm_gpuva_op split/merge steps
+ * @gpuvm: the &drm_gpuvm representing the GPU VA space
  * @req_addr: the start address of the new mapping
  * @req_range: the range of the new mapping
  * @req_obj: the &drm_gem_object to map
@@ -1282,15 +1282,15 @@ __drm_gpuva_sm_unmap(struct drm_gpuva_manager *mgr,
  * @priv: pointer to a driver private data structure
  *
  * This function iterates the given range of the GPU VA space. It utilizes the
- * &drm_gpuva_fn_ops to call back into the driver providing the split and merge
+ * &drm_gpuvm_ops to call back into the driver providing the split and merge
  * steps.
  *
  * Drivers may use these callbacks to update the GPU VA space right away within
  * the callback. In case the driver decides to copy and store the operations for
- * later processing neither this function nor &drm_gpuva_sm_unmap is allowed to
- * be called before the &drm_gpuva_manager's view of the GPU VA space was
+ * later processing neither this function nor &drm_gpuvm_sm_unmap is allowed to
+ * be called before the &drm_gpuvm's view of the GPU VA space was
  * updated with the previous set of operations. To update the
- * &drm_gpuva_manager's view of the GPU VA space drm_gpuva_insert(),
+ * &drm_gpuvm's view of the GPU VA space drm_gpuva_insert(),
  * drm_gpuva_destroy_locked() and/or drm_gpuva_destroy_unlocked() should be
  * used.
  *
@@ -1305,39 +1305,39 @@ __drm_gpuva_sm_unmap(struct drm_gpuva_manager *mgr,
  * Returns: 0 on success or a negative error code
  */
 int
-drm_gpuva_sm_map(struct drm_gpuva_manager *mgr, void *priv,
+drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm, void *priv,
 		 u64 req_addr, u64 req_range,
 		 struct drm_gem_object *req_obj, u64 req_offset)
 {
-	const struct drm_gpuva_fn_ops *ops = mgr->ops;
+	const struct drm_gpuvm_ops *ops = gpuvm->ops;
 
 	if (unlikely(!(ops && ops->sm_step_map &&
 		       ops->sm_step_remap &&
 		       ops->sm_step_unmap)))
 		return -EINVAL;
 
-	return __drm_gpuva_sm_map(mgr, ops, priv,
+	return __drm_gpuvm_sm_map(gpuvm, ops, priv,
 				  req_addr, req_range,
 				  req_obj, req_offset);
 }
-EXPORT_SYMBOL_GPL(drm_gpuva_sm_map);
+EXPORT_SYMBOL_GPL(drm_gpuvm_sm_map);
 
 /**
- * drm_gpuva_sm_unmap() - creates the &drm_gpuva_ops to split on unmap
- * @mgr: the &drm_gpuva_manager representing the GPU VA space
+ * drm_gpuvm_sm_unmap() - creates the &drm_gpuva_ops to split on unmap
+ * @gpuvm: the &drm_gpuvm representing the GPU VA space
  * @priv: pointer to a driver private data structure
  * @req_addr: the start address of the range to unmap
  * @req_range: the range of the mappings to unmap
  *
  * This function iterates the given range of the GPU VA space. It utilizes the
- * &drm_gpuva_fn_ops to call back into the driver providing the operations to
+ * &drm_gpuvm_ops to call back into the driver providing the operations to
  * unmap and, if required, split existent mappings.
  *
  * Drivers may use these callbacks to update the GPU VA space right away within
  * the callback. In case the driver decides to copy and store the operations for
- * later processing neither this function nor &drm_gpuva_sm_map is allowed to be
- * called before the &drm_gpuva_manager's view of the GPU VA space was updated
- * with the previous set of operations. To update the &drm_gpuva_manager's view
+ * later processing neither this function nor &drm_gpuvm_sm_map is allowed to be
+ * called before the &drm_gpuvm's view of the GPU VA space was updated
+ * with the previous set of operations. To update the &drm_gpuvm's view
  * of the GPU VA space drm_gpuva_insert(), drm_gpuva_destroy_locked() and/or
  * drm_gpuva_destroy_unlocked() should be used.
  *
@@ -1350,24 +1350,24 @@ EXPORT_SYMBOL_GPL(drm_gpuva_sm_map);
  * Returns: 0 on success or a negative error code
  */
 int
-drm_gpuva_sm_unmap(struct drm_gpuva_manager *mgr, void *priv,
+drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm, void *priv,
 		   u64 req_addr, u64 req_range)
 {
-	const struct drm_gpuva_fn_ops *ops = mgr->ops;
+	const struct drm_gpuvm_ops *ops = gpuvm->ops;
 
 	if (unlikely(!(ops && ops->sm_step_remap &&
 		       ops->sm_step_unmap)))
 		return -EINVAL;
 
-	return __drm_gpuva_sm_unmap(mgr, ops, priv,
+	return __drm_gpuvm_sm_unmap(gpuvm, ops, priv,
 				    req_addr, req_range);
 }
-EXPORT_SYMBOL_GPL(drm_gpuva_sm_unmap);
+EXPORT_SYMBOL_GPL(drm_gpuvm_sm_unmap);
 
 static struct drm_gpuva_op *
-gpuva_op_alloc(struct drm_gpuva_manager *mgr)
+gpuva_op_alloc(struct drm_gpuvm *gpuvm)
 {
-	const struct drm_gpuva_fn_ops *fn = mgr->ops;
+	const struct drm_gpuvm_ops *fn = gpuvm->ops;
 	struct drm_gpuva_op *op;
 
 	if (fn && fn->op_alloc)
@@ -1382,10 +1382,10 @@ gpuva_op_alloc(struct drm_gpuva_manager *mgr)
 }
 
 static void
-gpuva_op_free(struct drm_gpuva_manager *mgr,
+gpuva_op_free(struct drm_gpuvm *gpuvm,
 	      struct drm_gpuva_op *op)
 {
-	const struct drm_gpuva_fn_ops *fn = mgr->ops;
+	const struct drm_gpuvm_ops *fn = gpuvm->ops;
 
 	if (fn && fn->op_free)
 		fn->op_free(op);
@@ -1398,14 +1398,14 @@ drm_gpuva_sm_step(struct drm_gpuva_op *__op,
 		  void *priv)
 {
 	struct {
-		struct drm_gpuva_manager *mgr;
+		struct drm_gpuvm *vm;
 		struct drm_gpuva_ops *ops;
 	} *args = priv;
-	struct drm_gpuva_manager *mgr = args->mgr;
+	struct drm_gpuvm *gpuvm = args->vm;
 	struct drm_gpuva_ops *ops = args->ops;
 	struct drm_gpuva_op *op;
 
-	op = gpuva_op_alloc(mgr);
+	op = gpuva_op_alloc(gpuvm);
 	if (unlikely(!op))
 		goto err;
 
@@ -1444,20 +1444,20 @@ drm_gpuva_sm_step(struct drm_gpuva_op *__op,
 err_free_prev:
 	kfree(op->remap.prev);
 err_free_op:
-	gpuva_op_free(mgr, op);
+	gpuva_op_free(gpuvm, op);
 err:
 	return -ENOMEM;
 }
 
-static const struct drm_gpuva_fn_ops gpuva_list_ops = {
+static const struct drm_gpuvm_ops gpuvm_list_ops = {
 	.sm_step_map = drm_gpuva_sm_step,
 	.sm_step_remap = drm_gpuva_sm_step,
 	.sm_step_unmap = drm_gpuva_sm_step,
 };
 
 /**
- * drm_gpuva_sm_map_ops_create() - creates the &drm_gpuva_ops to split and merge
- * @mgr: the &drm_gpuva_manager representing the GPU VA space
+ * drm_gpuvm_sm_map_ops_create() - creates the &drm_gpuva_ops to split and merge
+ * @gpuvm: the &drm_gpuvm representing the GPU VA space
  * @req_addr: the start address of the new mapping
  * @req_range: the range of the new mapping
  * @req_obj: the &drm_gem_object to map
@@ -1476,9 +1476,9 @@ static const struct drm_gpuva_fn_ops gpuva_list_ops = {
  * map operation requested by the caller.
  *
  * Note that before calling this function again with another mapping request it
- * is necessary to update the &drm_gpuva_manager's view of the GPU VA space. The
+ * is necessary to update the &drm_gpuvm's view of the GPU VA space. The
  * previously obtained operations must be either processed or abandoned. To
- * update the &drm_gpuva_manager's view of the GPU VA space drm_gpuva_insert(),
+ * update the &drm_gpuvm's view of the GPU VA space drm_gpuva_insert(),
  * drm_gpuva_destroy_locked() and/or drm_gpuva_destroy_unlocked() should be
  * used.
  *
@@ -1488,13 +1488,13 @@ static const struct drm_gpuva_fn_ops gpuva_list_ops = {
  * Returns: a pointer to the &drm_gpuva_ops on success, an ERR_PTR on failure
  */
 struct drm_gpuva_ops *
-drm_gpuva_sm_map_ops_create(struct drm_gpuva_manager *mgr,
+drm_gpuvm_sm_map_ops_create(struct drm_gpuvm *gpuvm,
 			    u64 req_addr, u64 req_range,
 			    struct drm_gem_object *req_obj, u64 req_offset)
 {
 	struct drm_gpuva_ops *ops;
 	struct {
-		struct drm_gpuva_manager *mgr;
+		struct drm_gpuvm *vm;
 		struct drm_gpuva_ops *ops;
 	} args;
 	int ret;
@@ -1505,10 +1505,10 @@ drm_gpuva_sm_map_ops_create(struct drm_gpuva_manager *mgr,
 
 	INIT_LIST_HEAD(&ops->list);
 
-	args.mgr = mgr;
+	args.vm = gpuvm;
 	args.ops = ops;
 
-	ret = __drm_gpuva_sm_map(mgr, &gpuva_list_ops, &args,
+	ret = __drm_gpuvm_sm_map(gpuvm, &gpuvm_list_ops, &args,
 				 req_addr, req_range,
 				 req_obj, req_offset);
 	if (ret)
@@ -1517,15 +1517,15 @@ drm_gpuva_sm_map_ops_create(struct drm_gpuva_manager *mgr,
 	return ops;
 
 err_free_ops:
-	drm_gpuva_ops_free(mgr, ops);
+	drm_gpuva_ops_free(gpuvm, ops);
 	return ERR_PTR(ret);
 }
-EXPORT_SYMBOL_GPL(drm_gpuva_sm_map_ops_create);
+EXPORT_SYMBOL_GPL(drm_gpuvm_sm_map_ops_create);
 
 /**
- * drm_gpuva_sm_unmap_ops_create() - creates the &drm_gpuva_ops to split on
+ * drm_gpuvm_sm_unmap_ops_create() - creates the &drm_gpuva_ops to split on
  * unmap
- * @mgr: the &drm_gpuva_manager representing the GPU VA space
+ * @gpuvm: the &drm_gpuvm representing the GPU VA space
  * @req_addr: the start address of the range to unmap
  * @req_range: the range of the mappings to unmap
  *
@@ -1540,9 +1540,9 @@ EXPORT_SYMBOL_GPL(drm_gpuva_sm_map_ops_create);
  * remap operations.
  *
  * Note that before calling this function again with another range to unmap it
- * is necessary to update the &drm_gpuva_manager's view of the GPU VA space. The
+ * is necessary to update the &drm_gpuvm's view of the GPU VA space. The
  * previously obtained operations must be processed or abandoned. To update the
- * &drm_gpuva_manager's view of the GPU VA space drm_gpuva_insert(),
+ * &drm_gpuvm's view of the GPU VA space drm_gpuva_insert(),
  * drm_gpuva_destroy_locked() and/or drm_gpuva_destroy_unlocked() should be
  * used.
  *
@@ -1552,12 +1552,12 @@ EXPORT_SYMBOL_GPL(drm_gpuva_sm_map_ops_create);
  * Returns: a pointer to the &drm_gpuva_ops on success, an ERR_PTR on failure
  */
 struct drm_gpuva_ops *
-drm_gpuva_sm_unmap_ops_create(struct drm_gpuva_manager *mgr,
+drm_gpuvm_sm_unmap_ops_create(struct drm_gpuvm *gpuvm,
 			      u64 req_addr, u64 req_range)
 {
 	struct drm_gpuva_ops *ops;
 	struct {
-		struct drm_gpuva_manager *mgr;
+		struct drm_gpuvm *vm;
 		struct drm_gpuva_ops *ops;
 	} args;
 	int ret;
@@ -1568,10 +1568,10 @@ drm_gpuva_sm_unmap_ops_create(struct drm_gpuva_manager *mgr,
 
 	INIT_LIST_HEAD(&ops->list);
 
-	args.mgr = mgr;
+	args.vm = gpuvm;
 	args.ops = ops;
 
-	ret = __drm_gpuva_sm_unmap(mgr, &gpuva_list_ops, &args,
+	ret = __drm_gpuvm_sm_unmap(gpuvm, &gpuvm_list_ops, &args,
 				   req_addr, req_range);
 	if (ret)
 		goto err_free_ops;
@@ -1579,14 +1579,14 @@ drm_gpuva_sm_unmap_ops_create(struct drm_gpuva_manager *mgr,
 	return ops;
 
 err_free_ops:
-	drm_gpuva_ops_free(mgr, ops);
+	drm_gpuva_ops_free(gpuvm, ops);
 	return ERR_PTR(ret);
 }
-EXPORT_SYMBOL_GPL(drm_gpuva_sm_unmap_ops_create);
+EXPORT_SYMBOL_GPL(drm_gpuvm_sm_unmap_ops_create);
 
 /**
- * drm_gpuva_prefetch_ops_create() - creates the &drm_gpuva_ops to prefetch
- * @mgr: the &drm_gpuva_manager representing the GPU VA space
+ * drm_gpuvm_prefetch_ops_create() - creates the &drm_gpuva_ops to prefetch
+ * @gpuvm: the &drm_gpuvm representing the GPU VA space
  * @addr: the start address of the range to prefetch
  * @range: the range of the mappings to prefetch
  *
@@ -1603,7 +1603,7 @@ EXPORT_SYMBOL_GPL(drm_gpuva_sm_unmap_ops_create);
  * Returns: a pointer to the &drm_gpuva_ops on success, an ERR_PTR on failure
  */
 struct drm_gpuva_ops *
-drm_gpuva_prefetch_ops_create(struct drm_gpuva_manager *mgr,
+drm_gpuvm_prefetch_ops_create(struct drm_gpuvm *gpuvm,
 			      u64 addr, u64 range)
 {
 	struct drm_gpuva_ops *ops;
@@ -1618,8 +1618,8 @@ drm_gpuva_prefetch_ops_create(struct drm_gpuva_manager *mgr,
 
 	INIT_LIST_HEAD(&ops->list);
 
-	drm_gpuva_for_each_va_range(va, mgr, addr, end) {
-		op = gpuva_op_alloc(mgr);
+	drm_gpuvm_for_each_va_range(va, gpuvm, addr, end) {
+		op = gpuva_op_alloc(gpuvm);
 		if (!op) {
 			ret = -ENOMEM;
 			goto err_free_ops;
@@ -1633,14 +1633,14 @@ drm_gpuva_prefetch_ops_create(struct drm_gpuva_manager *mgr,
 	return ops;
 
 err_free_ops:
-	drm_gpuva_ops_free(mgr, ops);
+	drm_gpuva_ops_free(gpuvm, ops);
 	return ERR_PTR(ret);
 }
-EXPORT_SYMBOL_GPL(drm_gpuva_prefetch_ops_create);
+EXPORT_SYMBOL_GPL(drm_gpuvm_prefetch_ops_create);
 
 /**
- * drm_gpuva_gem_unmap_ops_create() - creates the &drm_gpuva_ops to unmap a GEM
- * @mgr: the &drm_gpuva_manager representing the GPU VA space
+ * drm_gpuvm_gem_unmap_ops_create() - creates the &drm_gpuva_ops to unmap a GEM
+ * @gpuvm: the &drm_gpuvm representing the GPU VA space
  * @obj: the &drm_gem_object to unmap
  *
  * This function creates a list of operations to perform unmapping for every
@@ -1658,7 +1658,7 @@ EXPORT_SYMBOL_GPL(drm_gpuva_prefetch_ops_create);
  * Returns: a pointer to the &drm_gpuva_ops on success, an ERR_PTR on failure
  */
 struct drm_gpuva_ops *
-drm_gpuva_gem_unmap_ops_create(struct drm_gpuva_manager *mgr,
+drm_gpuvm_gem_unmap_ops_create(struct drm_gpuvm *gpuvm,
 			       struct drm_gem_object *obj)
 {
 	struct drm_gpuva_ops *ops;
@@ -1675,7 +1675,7 @@ drm_gpuva_gem_unmap_ops_create(struct drm_gpuva_manager *mgr,
 	INIT_LIST_HEAD(&ops->list);
 
 	drm_gem_for_each_gpuva(va, obj) {
-		op = gpuva_op_alloc(mgr);
+		op = gpuva_op_alloc(gpuvm);
 		if (!op) {
 			ret = -ENOMEM;
 			goto err_free_ops;
@@ -1689,21 +1689,21 @@ drm_gpuva_gem_unmap_ops_create(struct drm_gpuva_manager *mgr,
 	return ops;
 
 err_free_ops:
-	drm_gpuva_ops_free(mgr, ops);
+	drm_gpuva_ops_free(gpuvm, ops);
 	return ERR_PTR(ret);
 }
-EXPORT_SYMBOL_GPL(drm_gpuva_gem_unmap_ops_create);
+EXPORT_SYMBOL_GPL(drm_gpuvm_gem_unmap_ops_create);
 
 /**
  * drm_gpuva_ops_free() - free the given &drm_gpuva_ops
- * @mgr: the &drm_gpuva_manager the ops were created for
+ * @gpuvm: the &drm_gpuvm the ops were created for
  * @ops: the &drm_gpuva_ops to free
  *
  * Frees the given &drm_gpuva_ops structure including all the ops associated
  * with it.
  */
 void
-drm_gpuva_ops_free(struct drm_gpuva_manager *mgr,
+drm_gpuva_ops_free(struct drm_gpuvm *gpuvm,
 		   struct drm_gpuva_ops *ops)
 {
 	struct drm_gpuva_op *op, *next;
@@ -1717,7 +1717,7 @@ drm_gpuva_ops_free(struct drm_gpuva_manager *mgr,
 			kfree(op->remap.unmap);
 		}
 
-		gpuva_op_free(mgr, op);
+		gpuva_op_free(gpuvm, op);
 	}
 
 	kfree(ops);
diff --git a/drivers/gpu/drm/nouveau/nouveau_exec.c b/drivers/gpu/drm/nouveau/nouveau_exec.c
index a90c4cd8cbb2..c001952cd678 100644
--- a/drivers/gpu/drm/nouveau/nouveau_exec.c
+++ b/drivers/gpu/drm/nouveau/nouveau_exec.c
@@ -106,7 +106,7 @@ nouveau_exec_job_submit(struct nouveau_job *job)
 	drm_exec_until_all_locked(exec) {
 		struct drm_gpuva *va;
 
-		drm_gpuva_for_each_va(va, &uvmm->umgr) {
+		drm_gpuvm_for_each_va(va, &uvmm->umgr) {
 			if (unlikely(va == &uvmm->umgr.kernel_alloc_node))
 				continue;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index aae780e4a4aa..c750072cb268 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -444,7 +444,7 @@ op_map_prepare_unwind(struct nouveau_uvma *uvma)
 static void
 op_unmap_prepare_unwind(struct drm_gpuva *va)
 {
-	drm_gpuva_insert(va->mgr, va);
+	drm_gpuva_insert(va->vm, va);
 }
 
 static void
@@ -1194,7 +1194,7 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *job)
 				goto unwind_continue;
 			}
 
-			op->ops = drm_gpuva_sm_unmap_ops_create(&uvmm->umgr,
+			op->ops = drm_gpuvm_sm_unmap_ops_create(&uvmm->umgr,
 								op->va.addr,
 								op->va.range);
 			if (IS_ERR(op->ops)) {
@@ -1240,7 +1240,7 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *job)
 				}
 			}
 
-			op->ops = drm_gpuva_sm_map_ops_create(&uvmm->umgr,
+			op->ops = drm_gpuvm_sm_map_ops_create(&uvmm->umgr,
 							      op->va.addr,
 							      op->va.range,
 							      op->gem.obj,
@@ -1264,7 +1264,7 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *job)
 			break;
 		}
 		case OP_UNMAP:
-			op->ops = drm_gpuva_sm_unmap_ops_create(&uvmm->umgr,
+			op->ops = drm_gpuvm_sm_unmap_ops_create(&uvmm->umgr,
 								op->va.addr,
 								op->va.range);
 			if (IS_ERR(op->ops)) {
@@ -1836,11 +1836,11 @@ nouveau_uvmm_init(struct nouveau_uvmm *uvmm, struct nouveau_cli *cli,
 	uvmm->kernel_managed_addr = kernel_managed_addr;
 	uvmm->kernel_managed_size = kernel_managed_size;
 
-	drm_gpuva_manager_init(&uvmm->umgr, cli->name,
-			       NOUVEAU_VA_SPACE_START,
-			       NOUVEAU_VA_SPACE_END,
-			       kernel_managed_addr, kernel_managed_size,
-			       NULL);
+	drm_gpuvm_init(&uvmm->umgr, cli->name,
+		       NOUVEAU_VA_SPACE_START,
+		       NOUVEAU_VA_SPACE_END,
+		       kernel_managed_addr, kernel_managed_size,
+		       NULL);
 
 	ret = nvif_vmm_ctor(&cli->mmu, "uvmm",
 			    cli->vmm.vmm.object.oclass, RAW,
@@ -1855,7 +1855,7 @@ nouveau_uvmm_init(struct nouveau_uvmm *uvmm, struct nouveau_cli *cli,
 	return 0;
 
 out_free_gpuva_mgr:
-	drm_gpuva_manager_destroy(&uvmm->umgr);
+	drm_gpuvm_destroy(&uvmm->umgr);
 out_unlock:
 	mutex_unlock(&cli->mutex);
 	return ret;
@@ -1877,7 +1877,7 @@ nouveau_uvmm_fini(struct nouveau_uvmm *uvmm)
 	wait_event(entity->job.wq, list_empty(&entity->job.list.head));
 
 	nouveau_uvmm_lock(uvmm);
-	drm_gpuva_for_each_va_safe(va, next, &uvmm->umgr) {
+	drm_gpuvm_for_each_va_safe(va, next, &uvmm->umgr) {
 		struct nouveau_uvma *uvma = uvma_from_va(va);
 		struct drm_gem_object *obj = va->gem.obj;
 
@@ -1910,7 +1910,7 @@ nouveau_uvmm_fini(struct nouveau_uvmm *uvmm)
 
 	mutex_lock(&cli->mutex);
 	nouveau_vmm_fini(&uvmm->vmm);
-	drm_gpuva_manager_destroy(&uvmm->umgr);
+	drm_gpuvm_destroy(&uvmm->umgr);
 	mutex_unlock(&cli->mutex);
 
 	dma_resv_fini(&uvmm->resv);
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.h b/drivers/gpu/drm/nouveau/nouveau_uvmm.h
index fc7f6fd2a4e1..e96c9919d1bd 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.h
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.h
@@ -3,13 +3,13 @@
 #ifndef __NOUVEAU_UVMM_H__
 #define __NOUVEAU_UVMM_H__
 
-#include <drm/drm_gpuva_mgr.h>
+#include <drm/drm_gpuvm.h>
 
 #include "nouveau_drv.h"
 
 struct nouveau_uvmm {
 	struct nouveau_vmm vmm;
-	struct drm_gpuva_manager umgr;
+	struct drm_gpuvm umgr;
 	struct maple_tree region_mt;
 	struct mutex mutex;
 	struct dma_resv resv;
@@ -44,7 +44,7 @@ struct nouveau_uvma {
 #define uvmm_from_mgr(x) container_of((x), struct nouveau_uvmm, umgr)
 #define uvma_from_va(x) container_of((x), struct nouveau_uvma, va)
 
-#define to_uvmm(x) uvmm_from_mgr((x)->va.mgr)
+#define to_uvmm(x) uvmm_from_mgr((x)->va.vm)
 
 struct nouveau_uvmm_bind_job {
 	struct nouveau_job base;
diff --git a/include/drm/drm_debugfs.h b/include/drm/drm_debugfs.h
index 3bba169f9bae..cf06cee4343f 100644
--- a/include/drm/drm_debugfs.h
+++ b/include/drm/drm_debugfs.h
@@ -35,7 +35,7 @@
 #include <linux/types.h>
 #include <linux/seq_file.h>
 
-#include <drm/drm_gpuva_mgr.h>
+#include <drm/drm_gpuvm.h>
 
 /**
  * DRM_DEBUGFS_GPUVA_INFO - &drm_info_list entry to dump a GPU VA space
@@ -152,7 +152,7 @@ void drm_debugfs_add_files(struct drm_device *dev,
 			   const struct drm_debugfs_info *files, int count);
 
 int drm_debugfs_gpuva_info(struct seq_file *m,
-			   struct drm_gpuva_manager *mgr);
+			   struct drm_gpuvm *gpuvm);
 #else
 static inline void drm_debugfs_create_files(const struct drm_info_list *files,
 					    int count, struct dentry *root,
@@ -177,7 +177,7 @@ static inline void drm_debugfs_add_files(struct drm_device *dev,
 {}
 
 static inline int drm_debugfs_gpuva_info(struct seq_file *m,
-					 struct drm_gpuva_manager *mgr)
+					 struct drm_gpuvm *gpuvm)
 {
 	return 0;
 }
diff --git a/include/drm/drm_gpuva_mgr.h b/include/drm/drm_gpuvm.h
similarity index 78%
rename from include/drm/drm_gpuva_mgr.h
rename to include/drm/drm_gpuvm.h
index ed8d50200cc3..0e802676e0a9 100644
--- a/include/drm/drm_gpuva_mgr.h
+++ b/include/drm/drm_gpuvm.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
-#ifndef __DRM_GPUVA_MGR_H__
-#define __DRM_GPUVA_MGR_H__
+#ifndef __DRM_GPUVM_H__
+#define __DRM_GPUVM_H__
 
 /*
  * Copyright (c) 2022 Red Hat.
@@ -31,8 +31,8 @@
 
 #include <drm/drm_gem.h>
 
-struct drm_gpuva_manager;
-struct drm_gpuva_fn_ops;
+struct drm_gpuvm;
+struct drm_gpuvm_ops;
 
 /**
  * enum drm_gpuva_flags - flags for struct drm_gpuva
@@ -62,15 +62,15 @@ enum drm_gpuva_flags {
  * struct drm_gpuva - structure to track a GPU VA mapping
  *
  * This structure represents a GPU VA mapping and is associated with a
- * &drm_gpuva_manager.
+ * &drm_gpuvm.
  *
  * Typically, this structure is embedded in bigger driver structures.
  */
 struct drm_gpuva {
 	/**
-	 * @mgr: the &drm_gpuva_manager this object is associated with
+	 * @vm: the &drm_gpuvm this object is associated with
 	 */
-	struct drm_gpuva_manager *mgr;
+	struct drm_gpuvm *vm;
 
 	/**
 	 * @flags: the &drm_gpuva_flags for this mapping
@@ -137,20 +137,20 @@ struct drm_gpuva {
 	} rb;
 };
 
-int drm_gpuva_insert(struct drm_gpuva_manager *mgr, struct drm_gpuva *va);
+int drm_gpuva_insert(struct drm_gpuvm *gpuvm, struct drm_gpuva *va);
 void drm_gpuva_remove(struct drm_gpuva *va);
 
 void drm_gpuva_link(struct drm_gpuva *va);
 void drm_gpuva_unlink(struct drm_gpuva *va);
 
-struct drm_gpuva *drm_gpuva_find(struct drm_gpuva_manager *mgr,
+struct drm_gpuva *drm_gpuva_find(struct drm_gpuvm *gpuvm,
 				 u64 addr, u64 range);
-struct drm_gpuva *drm_gpuva_find_first(struct drm_gpuva_manager *mgr,
+struct drm_gpuva *drm_gpuva_find_first(struct drm_gpuvm *gpuvm,
 				       u64 addr, u64 range);
-struct drm_gpuva *drm_gpuva_find_prev(struct drm_gpuva_manager *mgr, u64 start);
-struct drm_gpuva *drm_gpuva_find_next(struct drm_gpuva_manager *mgr, u64 end);
+struct drm_gpuva *drm_gpuva_find_prev(struct drm_gpuvm *gpuvm, u64 start);
+struct drm_gpuva *drm_gpuva_find_next(struct drm_gpuvm *gpuvm, u64 end);
 
-bool drm_gpuva_interval_empty(struct drm_gpuva_manager *mgr, u64 addr, u64 range);
+bool drm_gpuva_interval_empty(struct drm_gpuvm *gpuvm, u64 addr, u64 range);
 
 static inline void drm_gpuva_init(struct drm_gpuva *va, u64 addr, u64 range,
 				  struct drm_gem_object *obj, u64 offset)
@@ -186,7 +186,7 @@ static inline bool drm_gpuva_invalidated(struct drm_gpuva *va)
 }
 
 /**
- * struct drm_gpuva_manager - DRM GPU VA Manager
+ * struct drm_gpuvm - DRM GPU VA Manager
  *
  * The DRM GPU VA Manager keeps track of a GPU's virtual address space by using
  * &maple_tree structures. Typically, this structure is embedded in bigger
@@ -197,7 +197,7 @@ static inline bool drm_gpuva_invalidated(struct drm_gpuva *va)
  *
  * There should be one manager instance per GPU virtual address space.
  */
-struct drm_gpuva_manager {
+struct drm_gpuvm {
 	/**
 	 * @name: the name of the DRM GPU VA space
 	 */
@@ -237,100 +237,99 @@ struct drm_gpuva_manager {
 	struct drm_gpuva kernel_alloc_node;
 
 	/**
-	 * @ops: &drm_gpuva_fn_ops providing the split/merge steps to drivers
+	 * @ops: &drm_gpuvm_ops providing the split/merge steps to drivers
 	 */
-	const struct drm_gpuva_fn_ops *ops;
+	const struct drm_gpuvm_ops *ops;
 };
 
-void drm_gpuva_manager_init(struct drm_gpuva_manager *mgr,
-			    const char *name,
-			    u64 start_offset, u64 range,
-			    u64 reserve_offset, u64 reserve_range,
-			    const struct drm_gpuva_fn_ops *ops);
-void drm_gpuva_manager_destroy(struct drm_gpuva_manager *mgr);
+void drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
+		    u64 start_offset, u64 range,
+		    u64 reserve_offset, u64 reserve_range,
+		    const struct drm_gpuvm_ops *ops);
+void drm_gpuvm_destroy(struct drm_gpuvm *gpuvm);
 
 static inline struct drm_gpuva *
 __drm_gpuva_next(struct drm_gpuva *va)
 {
-	if (va && !list_is_last(&va->rb.entry, &va->mgr->rb.list))
+	if (va && !list_is_last(&va->rb.entry, &va->vm->rb.list))
 		return list_next_entry(va, rb.entry);
 
 	return NULL;
 }
 
 /**
- * drm_gpuva_for_each_va_range() - iterate over a range of &drm_gpuvas
+ * drm_gpuvm_for_each_va_range() - iterate over a range of &drm_gpuvas
  * @va__: &drm_gpuva structure to assign to in each iteration step
- * @mgr__: &drm_gpuva_manager to walk over
+ * @gpuvm__: &drm_gpuvm to walk over
  * @start__: starting offset, the first gpuva will overlap this
  * @end__: ending offset, the last gpuva will start before this (but may
  * overlap)
  *
- * This iterator walks over all &drm_gpuvas in the &drm_gpuva_manager that lie
+ * This iterator walks over all &drm_gpuvas in the &drm_gpuvm that lie
  * between @start__ and @end__. It is implemented similarly to list_for_each(),
- * but is using the &drm_gpuva_manager's internal interval tree to accelerate
+ * but is using the &drm_gpuvm's internal interval tree to accelerate
  * the search for the starting &drm_gpuva, and hence isn't safe against removal
  * of elements. It assumes that @end__ is within (or is the upper limit of) the
- * &drm_gpuva_manager. This iterator does not skip over the &drm_gpuva_manager's
+ * &drm_gpuvm. This iterator does not skip over the &drm_gpuvm's
  * @kernel_alloc_node.
  */
-#define drm_gpuva_for_each_va_range(va__, mgr__, start__, end__) \
-	for (va__ = drm_gpuva_find_first((mgr__), (start__), (end__) - (start__)); \
+#define drm_gpuvm_for_each_va_range(va__, gpuvm__, start__, end__) \
+	for (va__ = drm_gpuva_find_first((gpuvm__), (start__), (end__) - (start__)); \
 	     va__ && (va__->va.addr < (end__)); \
 	     va__ = __drm_gpuva_next(va__))
 
 /**
- * drm_gpuva_for_each_va_range_safe() - safely iterate over a range of
+ * drm_gpuvm_for_each_va_range_safe() - safely iterate over a range of
  * &drm_gpuvas
  * @va__: &drm_gpuva to assign to in each iteration step
  * @next__: another &drm_gpuva to use as temporary storage
- * @mgr__: &drm_gpuva_manager to walk over
+ * @gpuvm__: &drm_gpuvm to walk over
  * @start__: starting offset, the first gpuva will overlap this
  * @end__: ending offset, the last gpuva will start before this (but may
  * overlap)
  *
- * This iterator walks over all &drm_gpuvas in the &drm_gpuva_manager that lie
+ * This iterator walks over all &drm_gpuvas in the &drm_gpuvm that lie
  * between @start__ and @end__. It is implemented similarly to
- * list_for_each_safe(), but is using the &drm_gpuva_manager's internal interval
+ * list_for_each_safe(), but is using the &drm_gpuvm's internal interval
  * tree to accelerate the search for the starting &drm_gpuva, and hence is safe
  * against removal of elements. It assumes that @end__ is within (or is the
- * upper limit of) the &drm_gpuva_manager. This iterator does not skip over the
- * &drm_gpuva_manager's @kernel_alloc_node.
+ * upper limit of) the &drm_gpuvm. This iterator does not skip over the
+ * &drm_gpuvm's @kernel_alloc_node.
  */
-#define drm_gpuva_for_each_va_range_safe(va__, next__, mgr__, start__, end__) \
-	for (va__ = drm_gpuva_find_first((mgr__), (start__), (end__) - (start__)), \
+#define drm_gpuvm_for_each_va_range_safe(va__, next__, gpuvm__, start__, end__) \
+	for (va__ = drm_gpuva_find_first((gpuvm__), (start__), (end__) - (start__)), \
 	     next__ = __drm_gpuva_next(va__); \
 	     va__ && (va__->va.addr < (end__)); \
 	     va__ = next__, next__ = __drm_gpuva_next(va__))
 
 /**
- * drm_gpuva_for_each_va() - iterate over all &drm_gpuvas
+ * drm_gpuvm_for_each_va() - iterate over all &drm_gpuvas
  * @va__: &drm_gpuva to assign to in each iteration step
- * @mgr__: &drm_gpuva_manager to walk over
+ * @gpuvm__: &drm_gpuvm to walk over
  *
  * This iterator walks over all &drm_gpuva structures associated with the given
- * &drm_gpuva_manager.
+ * &drm_gpuvm.
  */
-#define drm_gpuva_for_each_va(va__, mgr__) \
-	list_for_each_entry(va__, &(mgr__)->rb.list, rb.entry)
+#define drm_gpuvm_for_each_va(va__, gpuvm__) \
+	list_for_each_entry(va__, &(gpuvm__)->rb.list, rb.entry)
 
 /**
- * drm_gpuva_for_each_va_safe() - safely iterate over all &drm_gpuvas
+ * drm_gpuvm_for_each_va_safe() - safely iterate over all &drm_gpuvas
  * @va__: &drm_gpuva to assign to in each iteration step
  * @next__: another &drm_gpuva to use as temporary storage
- * @mgr__: &drm_gpuva_manager to walk over
+ * @gpuvm__: &drm_gpuvm to walk over
  *
  * This iterator walks over all &drm_gpuva structures associated with the given
- * &drm_gpuva_manager. It is implemented with list_for_each_entry_safe(), and
+ * &drm_gpuvm. It is implemented with list_for_each_entry_safe(), and
  * hence safe against the removal of elements.
  */
-#define drm_gpuva_for_each_va_safe(va__, next__, mgr__) \
-	list_for_each_entry_safe(va__, next__, &(mgr__)->rb.list, rb.entry)
+#define drm_gpuvm_for_each_va_safe(va__, next__, gpuvm__) \
+	list_for_each_entry_safe(va__, next__, &(gpuvm__)->rb.list, rb.entry)
 
 /**
  * enum drm_gpuva_op_type - GPU VA operation type
  *
- * Operations to alter the GPU VA mappings tracked by the &drm_gpuva_manager.
+ * Operations to alter the GPU VA mappings tracked by the &drm_gpuvm.
  */
 enum drm_gpuva_op_type {
 	/**
@@ -413,7 +412,7 @@ struct drm_gpuva_op_unmap {
 	 *
 	 * Optionally, if &keep is set, drivers may keep the actual page table
 	 * mappings for this &drm_gpuva, adding the missing page table entries
-	 * only and update the &drm_gpuva_manager accordingly.
+	 * only and update the &drm_gpuvm accordingly.
 	 */
 	bool keep;
 };
@@ -584,22 +583,22 @@ struct drm_gpuva_ops {
 #define drm_gpuva_next_op(op) list_next_entry(op, entry)
 
 struct drm_gpuva_ops *
-drm_gpuva_sm_map_ops_create(struct drm_gpuva_manager *mgr,
+drm_gpuvm_sm_map_ops_create(struct drm_gpuvm *gpuvm,
 			    u64 addr, u64 range,
 			    struct drm_gem_object *obj, u64 offset);
 struct drm_gpuva_ops *
-drm_gpuva_sm_unmap_ops_create(struct drm_gpuva_manager *mgr,
+drm_gpuvm_sm_unmap_ops_create(struct drm_gpuvm *gpuvm,
 			      u64 addr, u64 range);
 
 struct drm_gpuva_ops *
-drm_gpuva_prefetch_ops_create(struct drm_gpuva_manager *mgr,
+drm_gpuvm_prefetch_ops_create(struct drm_gpuvm *gpuvm,
 				 u64 addr, u64 range);
 
 struct drm_gpuva_ops *
-drm_gpuva_gem_unmap_ops_create(struct drm_gpuva_manager *mgr,
+drm_gpuvm_gem_unmap_ops_create(struct drm_gpuvm *gpuvm,
 			       struct drm_gem_object *obj);
 
-void drm_gpuva_ops_free(struct drm_gpuva_manager *mgr,
+void drm_gpuva_ops_free(struct drm_gpuvm *gpuvm,
 			struct drm_gpuva_ops *ops);
 
 static inline void drm_gpuva_init_from_op(struct drm_gpuva *va,
@@ -610,15 +609,15 @@ static inline void drm_gpuva_init_from_op(struct drm_gpuva *va,
 }
 
 /**
- * struct drm_gpuva_fn_ops - callbacks for split/merge steps
+ * struct drm_gpuvm_ops - callbacks for split/merge steps
  *
- * This structure defines the callbacks used by &drm_gpuva_sm_map and
- * &drm_gpuva_sm_unmap to provide the split/merge steps for map and unmap
+ * This structure defines the callbacks used by &drm_gpuvm_sm_map and
+ * &drm_gpuvm_sm_unmap to provide the split/merge steps for map and unmap
  * operations to drivers.
  */
-struct drm_gpuva_fn_ops {
+struct drm_gpuvm_ops {
 	/**
-	 * @op_alloc: called when the &drm_gpuva_manager allocates
+	 * @op_alloc: called when the &drm_gpuvm allocates
 	 * a struct drm_gpuva_op
 	 *
 	 * Some drivers may want to embed struct drm_gpuva_op into driver
@@ -630,7 +629,7 @@ struct drm_gpuva_fn_ops {
 	struct drm_gpuva_op *(*op_alloc)(void);
 
 	/**
-	 * @op_free: called when the &drm_gpuva_manager frees a
+	 * @op_free: called when the &drm_gpuvm frees a
 	 * struct drm_gpuva_op
 	 *
 	 * Some drivers may want to embed struct drm_gpuva_op into driver
@@ -642,19 +641,19 @@ struct drm_gpuva_fn_ops {
 	void (*op_free)(struct drm_gpuva_op *op);
 
 	/**
-	 * @sm_step_map: called from &drm_gpuva_sm_map to finally insert the
+	 * @sm_step_map: called from &drm_gpuvm_sm_map to finally insert the
 	 * mapping once all previous steps were completed
 	 *
 	 * The &priv pointer matches the one the driver passed to
-	 * &drm_gpuva_sm_map or &drm_gpuva_sm_unmap, respectively.
+	 * &drm_gpuvm_sm_map or &drm_gpuvm_sm_unmap, respectively.
 	 *
-	 * Can be NULL if &drm_gpuva_sm_map is used.
+	 * Can be NULL if &drm_gpuvm_sm_map is used.
 	 */
 	int (*sm_step_map)(struct drm_gpuva_op *op, void *priv);
 
 	/**
-	 * @sm_step_remap: called from &drm_gpuva_sm_map and
-	 * &drm_gpuva_sm_unmap to split up an existent mapping
+	 * @sm_step_remap: called from &drm_gpuvm_sm_map and
+	 * &drm_gpuvm_sm_unmap to split up an existent mapping
 	 *
 	 * This callback is called when existent mapping needs to be split up.
 	 * This is the case when either a newly requested mapping overlaps or
@@ -662,38 +661,38 @@ struct drm_gpuva_fn_ops {
 	 * mapping is requested.
 	 *
 	 * The &priv pointer matches the one the driver passed to
-	 * &drm_gpuva_sm_map or &drm_gpuva_sm_unmap, respectively.
+	 * &drm_gpuvm_sm_map or &drm_gpuvm_sm_unmap, respectively.
 	 *
-	 * Can be NULL if neither &drm_gpuva_sm_map nor &drm_gpuva_sm_unmap is
+	 * Can be NULL if neither &drm_gpuvm_sm_map nor &drm_gpuvm_sm_unmap is
 	 * used.
 	 */
 	int (*sm_step_remap)(struct drm_gpuva_op *op, void *priv);
 
 	/**
-	 * @sm_step_unmap: called from &drm_gpuva_sm_map and
-	 * &drm_gpuva_sm_unmap to unmap an existent mapping
+	 * @sm_step_unmap: called from &drm_gpuvm_sm_map and
+	 * &drm_gpuvm_sm_unmap to unmap an existent mapping
 	 *
 	 * This callback is called when existent mapping needs to be unmapped.
 	 * This is the case when either a newly requested mapping encloses an
 	 * existent mapping or an unmap of an existent mapping is requested.
 	 *
 	 * The &priv pointer matches the one the driver passed to
-	 * &drm_gpuva_sm_map or &drm_gpuva_sm_unmap, respectively.
+	 * &drm_gpuvm_sm_map or &drm_gpuvm_sm_unmap, respectively.
 	 *
-	 * Can be NULL if neither &drm_gpuva_sm_map nor &drm_gpuva_sm_unmap is
+	 * Can be NULL if neither &drm_gpuvm_sm_map nor &drm_gpuvm_sm_unmap is
 	 * used.
 	 */
 	int (*sm_step_unmap)(struct drm_gpuva_op *op, void *priv);
 };
 
-int drm_gpuva_sm_map(struct drm_gpuva_manager *mgr, void *priv,
+int drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm, void *priv,
 		     u64 addr, u64 range,
 		     struct drm_gem_object *obj, u64 offset);
 
-int drm_gpuva_sm_unmap(struct drm_gpuva_manager *mgr, void *priv,
+int drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm, void *priv,
 		       u64 addr, u64 range);
 
-void drm_gpuva_map(struct drm_gpuva_manager *mgr,
+void drm_gpuva_map(struct drm_gpuvm *gpuvm,
 		   struct drm_gpuva *va,
 		   struct drm_gpuva_op_map *op);
 
@@ -703,4 +702,4 @@ void drm_gpuva_remap(struct drm_gpuva *prev,
 
 void drm_gpuva_unmap(struct drm_gpuva_op_unmap *op);
 
-#endif /* __DRM_GPUVA_MGR_H__ */
+#endif /* __DRM_GPUVM_H__ */
-- 
2.41.0

