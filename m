Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1419E970E
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 14:33:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 581E710E759;
	Mon,  9 Dec 2024 13:33:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="de3jv9Fg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50EE310E758;
 Mon,  9 Dec 2024 13:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733751211; x=1765287211;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2v8M/mohB2JjUcQ4ERt2TysBGXFiMkXizjbxDT7wpVA=;
 b=de3jv9FgKgzQ5KujPgydCwAl5z1DvF0RdlS9MWqYwaxQJy5h8QSr22ev
 Xi3MraQAbKX6P1myAOpAxwMU+4vgJjQz9DV/wmEx24UnZskY9CZ+zTeck
 CZ2zzNa56LCBT6c3YH2OYetkE11K3QtSLJRe1K9JI/7RQtu6nMBZBO/hN
 2totfqOmIb2eEDY3bZ2IVSRHCGRFsRf0FoAuyo4r8ep0yafXsiXnk7B4D
 FH4GN6SFzk5TLjdl8jWgFmbMR2TVcf1a0QPIBpZGtJwNq3rI154wx7Lux
 ZdrILMQXTTKFliaVWltDhLnAq5kmPmbTJsnGg1nBf3lG3MHIaVdczsE2F w==;
X-CSE-ConnectionGUID: Cxqg7IexQSaQo0WohpMuBw==
X-CSE-MsgGUID: mcNf0+TSRF+hzLObzTmxKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="34192091"
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="34192091"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 05:33:31 -0800
X-CSE-ConnectionGUID: Aqee65FOT9SSvXREuxWrTw==
X-CSE-MsgGUID: 1D+40wTLQYSr9i64bJKFtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="99531341"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 05:33:29 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 16/26] drm/xe: Attach debug metadata to vma
Date: Mon,  9 Dec 2024 15:33:07 +0200
Message-ID: <20241209133318.1806472-17-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241209133318.1806472-1-mika.kuoppala@linux.intel.com>
References: <20241209133318.1806472-1-mika.kuoppala@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>

Introduces a vm_bind_op extension, enabling users to attach metadata
objects to each [OP_MAP|OP_MAP_USERPTR] operation. This interface
will be utilized by the EU debugger to relay information about the
contents of specified VMAs from the debugee to the debugger process.

v2: move vma metadata handling behind Kconfig (Mika)

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_debug_metadata.c | 120 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_debug_metadata.h |  52 +++++++++++
 drivers/gpu/drm/xe/xe_vm.c             |  99 +++++++++++++++++++-
 drivers/gpu/drm/xe/xe_vm_types.h       |  27 ++++++
 include/uapi/drm/xe_drm.h              |  19 ++++
 5 files changed, 313 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debug_metadata.c b/drivers/gpu/drm/xe/xe_debug_metadata.c
index 1dfed9aed285..b045bdd77235 100644
--- a/drivers/gpu/drm/xe/xe_debug_metadata.c
+++ b/drivers/gpu/drm/xe/xe_debug_metadata.c
@@ -10,6 +10,113 @@
 
 #include "xe_device.h"
 #include "xe_macros.h"
+#include "xe_vm.h"
+
+void xe_eudebug_free_vma_metadata(struct xe_eudebug_vma_metadata *mdata)
+{
+	struct xe_vma_debug_metadata *vmad, *tmp;
+
+	list_for_each_entry_safe(vmad, tmp, &mdata->list, link) {
+		list_del(&vmad->link);
+		kfree(vmad);
+	}
+}
+
+static struct xe_vma_debug_metadata *
+vma_new_debug_metadata(u32 metadata_id, u64 cookie)
+{
+	struct xe_vma_debug_metadata *vmad;
+
+	vmad = kzalloc(sizeof(*vmad), GFP_KERNEL);
+	if (!vmad)
+		return ERR_PTR(-ENOMEM);
+
+	INIT_LIST_HEAD(&vmad->link);
+
+	vmad->metadata_id = metadata_id;
+	vmad->cookie = cookie;
+
+	return vmad;
+}
+
+int xe_eudebug_copy_vma_metadata(struct xe_eudebug_vma_metadata *from,
+				 struct xe_eudebug_vma_metadata *to)
+{
+	struct xe_vma_debug_metadata *vmad, *vma;
+
+	list_for_each_entry(vmad, &from->list, link) {
+		vma = vma_new_debug_metadata(vmad->metadata_id, vmad->cookie);
+		if (IS_ERR(vma))
+			return PTR_ERR(vma);
+
+		list_add_tail(&vmad->link, &to->list);
+	}
+
+	return 0;
+}
+
+static int vma_new_debug_metadata_op(struct xe_vma_op *op,
+				     u32 metadata_id, u64 cookie,
+				     u64 flags)
+{
+	struct xe_vma_debug_metadata *vmad;
+
+	vmad = vma_new_debug_metadata(metadata_id, cookie);
+	if (IS_ERR(vmad))
+		return PTR_ERR(vmad);
+
+	list_add_tail(&vmad->link, &op->map.eudebug.metadata.list);
+
+	return 0;
+}
+
+int vm_bind_op_ext_attach_debug(struct xe_device *xe,
+				struct xe_file *xef,
+				struct drm_gpuva_ops *ops,
+				u32 operation, u64 extension)
+{
+	u64 __user *address = u64_to_user_ptr(extension);
+	struct drm_xe_vm_bind_op_ext_attach_debug ext;
+	struct xe_debug_metadata *mdata;
+	struct drm_gpuva_op *__op;
+	int err;
+
+	err = __copy_from_user(&ext, address, sizeof(ext));
+	if (XE_IOCTL_DBG(xe, err))
+		return -EFAULT;
+
+	if (XE_IOCTL_DBG(xe,
+			 operation != DRM_XE_VM_BIND_OP_MAP_USERPTR &&
+			 operation != DRM_XE_VM_BIND_OP_MAP))
+		return -EINVAL;
+
+	if (XE_IOCTL_DBG(xe, ext.flags))
+		return -EINVAL;
+
+	mdata = xe_debug_metadata_get(xef, (u32)ext.metadata_id);
+	if (XE_IOCTL_DBG(xe, !mdata))
+		return -ENOENT;
+
+	/* care about metadata existence only on the time of attach */
+	xe_debug_metadata_put(mdata);
+
+	if (!ops)
+		return 0;
+
+	drm_gpuva_for_each_op(__op, ops) {
+		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
+
+		if (op->base.op == DRM_GPUVA_OP_MAP) {
+			err = vma_new_debug_metadata_op(op,
+							ext.metadata_id,
+							ext.cookie,
+							ext.flags);
+			if (err)
+				return err;
+		}
+	}
+	return 0;
+}
 
 static void xe_debug_metadata_release(struct kref *ref)
 {
@@ -24,6 +131,19 @@ void xe_debug_metadata_put(struct xe_debug_metadata *mdata)
 	kref_put(&mdata->refcount, xe_debug_metadata_release);
 }
 
+struct xe_debug_metadata *xe_debug_metadata_get(struct xe_file *xef, u32 id)
+{
+	struct xe_debug_metadata *mdata;
+
+	mutex_lock(&xef->eudebug.metadata.lock);
+	mdata = xa_load(&xef->eudebug.metadata.xa, id);
+	if (mdata)
+		kref_get(&mdata->refcount);
+	mutex_unlock(&xef->eudebug.metadata.lock);
+
+	return mdata;
+}
+
 int xe_debug_metadata_create_ioctl(struct drm_device *dev,
 				   void *data,
 				   struct drm_file *file)
diff --git a/drivers/gpu/drm/xe/xe_debug_metadata.h b/drivers/gpu/drm/xe/xe_debug_metadata.h
index 3266c25e657e..ba913a4d6def 100644
--- a/drivers/gpu/drm/xe/xe_debug_metadata.h
+++ b/drivers/gpu/drm/xe/xe_debug_metadata.h
@@ -6,13 +6,18 @@
 #ifndef _XE_DEBUG_METADATA_H_
 #define _XE_DEBUG_METADATA_H_
 
+#include <linux/types.h>
+
 struct drm_device;
 struct drm_file;
+struct xe_file;
 
 #if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
 
 #include "xe_debug_metadata_types.h"
+#include "xe_vm_types.h"
 
+struct xe_debug_metadata *xe_debug_metadata_get(struct xe_file *xef, u32 id);
 void xe_debug_metadata_put(struct xe_debug_metadata *mdata);
 
 int xe_debug_metadata_create_ioctl(struct drm_device *dev,
@@ -22,11 +27,35 @@ int xe_debug_metadata_create_ioctl(struct drm_device *dev,
 int xe_debug_metadata_destroy_ioctl(struct drm_device *dev,
 				    void *data,
 				    struct drm_file *file);
+
+static inline void xe_eudebug_move_vma_metadata(struct xe_eudebug_vma_metadata *from,
+						struct xe_eudebug_vma_metadata *to)
+{
+	list_splice_tail_init(&from->list, &to->list);
+}
+
+int xe_eudebug_copy_vma_metadata(struct xe_eudebug_vma_metadata *from,
+				 struct xe_eudebug_vma_metadata *to);
+void xe_eudebug_free_vma_metadata(struct xe_eudebug_vma_metadata *mdata);
+
+int vm_bind_op_ext_attach_debug(struct xe_device *xe,
+				struct xe_file *xef,
+				struct drm_gpuva_ops *ops,
+				u32 operation, u64 extension);
+
 #else /* CONFIG_DRM_XE_EUDEBUG */
 
 #include <linux/errno.h>
 
 struct xe_debug_metadata;
+struct xe_device;
+struct xe_eudebug_vma_metadata;
+struct drm_gpuva_ops;
+
+static inline struct xe_debug_metadata *xe_debug_metadata_get(struct xe_file *xef, u32 id)
+{
+	return NULL;
+}
 
 static inline void xe_debug_metadata_put(struct xe_debug_metadata *mdata) { }
 
@@ -44,6 +73,29 @@ static inline int xe_debug_metadata_destroy_ioctl(struct drm_device *dev,
 	return -EOPNOTSUPP;
 }
 
+static inline void xe_eudebug_move_vma_metadata(struct xe_eudebug_vma_metadata *from,
+						struct xe_eudebug_vma_metadata *to)
+{
+}
+
+static inline int xe_eudebug_copy_vma_metadata(struct xe_eudebug_vma_metadata *from,
+					       struct xe_eudebug_vma_metadata *to)
+{
+	return 0;
+}
+
+static inline void xe_eudebug_free_vma_metadata(struct xe_eudebug_vma_metadata *mdata)
+{
+}
+
+static inline int vm_bind_op_ext_attach_debug(struct xe_device *xe,
+					      struct xe_file *xef,
+					      struct drm_gpuva_ops *ops,
+					      u32 operation, u64 extension)
+{
+	return -EINVAL;
+}
+
 #endif /* CONFIG_DRM_XE_EUDEBUG */
 
 
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 224ff9e16941..19c0b36c10b1 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -23,6 +23,7 @@
 #include "regs/xe_gtt_defs.h"
 #include "xe_assert.h"
 #include "xe_bo.h"
+#include "xe_debug_metadata.h"
 #include "xe_device.h"
 #include "xe_drm_client.h"
 #include "xe_eudebug.h"
@@ -944,6 +945,9 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 			vma->gpuva.gem.obj = &bo->ttm.base;
 	}
 
+#if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
+	INIT_LIST_HEAD(&vma->eudebug.metadata.list);
+#endif
 	INIT_LIST_HEAD(&vma->combined_links.rebind);
 
 	INIT_LIST_HEAD(&vma->gpuva.gem.entry);
@@ -1036,6 +1040,7 @@ static void xe_vma_destroy_late(struct xe_vma *vma)
 		xe_bo_put(xe_vma_bo(vma));
 	}
 
+	xe_eudebug_free_vma_metadata(&vma->eudebug.metadata);
 	xe_vma_free(vma);
 }
 
@@ -1979,6 +1984,9 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 			op->map.is_null = flags & DRM_XE_VM_BIND_FLAG_NULL;
 			op->map.dumpable = flags & DRM_XE_VM_BIND_FLAG_DUMPABLE;
 			op->map.pat_index = pat_index;
+#if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
+			INIT_LIST_HEAD(&op->map.eudebug.metadata.list);
+#endif
 		} else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
 			op->prefetch.region = prefetch_region;
 		}
@@ -2170,11 +2178,13 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 			flags |= op->map.dumpable ?
 				VMA_CREATE_FLAG_DUMPABLE : 0;
 
-			vma = new_vma(vm, &op->base.map, op->map.pat_index,
-				      flags);
+			vma = new_vma(vm, &op->base.map, op->map.pat_index, flags);
 			if (IS_ERR(vma))
 				return PTR_ERR(vma);
 
+			xe_eudebug_move_vma_metadata(&op->map.eudebug.metadata,
+						     &vma->eudebug.metadata);
+
 			op->map.vma = vma;
 			if (op->map.immediate || !xe_vm_in_fault_mode(vm))
 				xe_vma_ops_incr_pt_update_ops(vops,
@@ -2205,6 +2215,9 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 				if (IS_ERR(vma))
 					return PTR_ERR(vma);
 
+				xe_eudebug_move_vma_metadata(&old->eudebug.metadata,
+							     &vma->eudebug.metadata);
+
 				op->remap.prev = vma;
 
 				/*
@@ -2244,6 +2257,16 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 				if (IS_ERR(vma))
 					return PTR_ERR(vma);
 
+				if (op->base.remap.prev) {
+					err = xe_eudebug_copy_vma_metadata(&op->remap.prev->eudebug.metadata,
+									   &vma->eudebug.metadata);
+					if (err)
+						return err;
+				} else {
+					xe_eudebug_move_vma_metadata(&old->eudebug.metadata,
+								     &vma->eudebug.metadata);
+				}
+
 				op->remap.next = vma;
 
 				/*
@@ -2294,6 +2317,7 @@ static void xe_vma_op_unwind(struct xe_vm *vm, struct xe_vma_op *op,
 	switch (op->base.op) {
 	case DRM_GPUVA_OP_MAP:
 		if (op->map.vma) {
+			xe_eudebug_free_vma_metadata(&op->map.eudebug.metadata);
 			prep_vma_destroy(vm, op->map.vma, post_commit);
 			xe_vma_destroy_unlocked(op->map.vma);
 		}
@@ -2532,6 +2556,58 @@ static int vm_ops_setup_tile_args(struct xe_vm *vm, struct xe_vma_ops *vops)
 	}
 
 	return number_tiles;
+};
+
+typedef int (*xe_vm_bind_op_user_extension_fn)(struct xe_device *xe,
+					       struct xe_file *xef,
+					       struct drm_gpuva_ops *ops,
+					       u32 operation, u64 extension);
+
+static const xe_vm_bind_op_user_extension_fn vm_bind_op_extension_funcs[] = {
+	[XE_VM_BIND_OP_EXTENSIONS_ATTACH_DEBUG] = vm_bind_op_ext_attach_debug,
+};
+
+#define MAX_USER_EXTENSIONS	16
+static int vm_bind_op_user_extensions(struct xe_device *xe,
+				      struct xe_file *xef,
+				      struct drm_gpuva_ops *ops,
+				      u32 operation,
+				      u64 extensions, int ext_number)
+{
+	u64 __user *address = u64_to_user_ptr(extensions);
+	struct drm_xe_user_extension ext;
+	int err;
+
+	if (XE_IOCTL_DBG(xe, ext_number >= MAX_USER_EXTENSIONS))
+		return -E2BIG;
+
+	err = __copy_from_user(&ext, address, sizeof(ext));
+	if (XE_IOCTL_DBG(xe, err))
+		return -EFAULT;
+
+	if (XE_IOCTL_DBG(xe, ext.pad) ||
+	    XE_IOCTL_DBG(xe, ext.name >=
+			 ARRAY_SIZE(vm_bind_op_extension_funcs)))
+		return -EINVAL;
+
+	err = vm_bind_op_extension_funcs[ext.name](xe, xef, ops,
+						   operation, extensions);
+	if (XE_IOCTL_DBG(xe, err))
+		return err;
+
+	if (ext.next_extension)
+		return vm_bind_op_user_extensions(xe, xef, ops,
+						  operation, ext.next_extension,
+						  ++ext_number);
+
+	return 0;
+}
+
+static int vm_bind_op_user_extensions_check(struct xe_device *xe,
+					    struct xe_file *xef,
+					    u32 operation, u64 extensions)
+{
+	return vm_bind_op_user_extensions(xe, xef, NULL, operation, extensions, 0);
 }
 
 static struct dma_fence *ops_execute(struct xe_vm *vm,
@@ -2729,6 +2805,7 @@ ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_execute, ERRNO);
 #define ALL_DRM_XE_SYNCS_FLAGS (DRM_XE_SYNCS_FLAG_WAIT_FOR_OP)
 
 static int vm_bind_ioctl_check_args(struct xe_device *xe,
+				    struct xe_file *xef,
 				    struct drm_xe_vm_bind *args,
 				    struct drm_xe_vm_bind_op **bind_ops)
 {
@@ -2773,6 +2850,7 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 		u64 obj_offset = (*bind_ops)[i].obj_offset;
 		u32 prefetch_region = (*bind_ops)[i].prefetch_mem_region_instance;
 		bool is_null = flags & DRM_XE_VM_BIND_FLAG_NULL;
+		u64 extensions = (*bind_ops)[i].extensions;
 		u16 pat_index = (*bind_ops)[i].pat_index;
 		u16 coh_mode;
 
@@ -2833,6 +2911,13 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 			err = -EINVAL;
 			goto free_bind_ops;
 		}
+
+		if (extensions) {
+			err = vm_bind_op_user_extensions_check(xe, xef, op, extensions);
+			if (err)
+				goto free_bind_ops;
+		}
+
 	}
 
 	return 0;
@@ -2944,7 +3029,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	int err;
 	int i;
 
-	err = vm_bind_ioctl_check_args(xe, args, &bind_ops);
+	err = vm_bind_ioctl_check_args(xe, xef, args, &bind_ops);
 	if (err)
 		return err;
 
@@ -3073,11 +3158,17 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		u64 obj_offset = bind_ops[i].obj_offset;
 		u32 prefetch_region = bind_ops[i].prefetch_mem_region_instance;
 		u16 pat_index = bind_ops[i].pat_index;
+		u64 extensions = bind_ops[i].extensions;
 
 		ops[i] = vm_bind_ioctl_ops_create(vm, bos[i], obj_offset,
 						  addr, range, op, flags,
 						  prefetch_region, pat_index);
-		if (IS_ERR(ops[i])) {
+		if (!IS_ERR(ops[i]) && extensions) {
+			err = vm_bind_op_user_extensions(xe, xef, ops[i],
+							 op, extensions, 0);
+			if (err)
+				goto unwind_ops;
+		} else if (IS_ERR(ops[i])) {
 			err = PTR_ERR(ops[i]);
 			ops[i] = NULL;
 			goto unwind_ops;
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 557b047ebdd7..1c5776194e54 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -70,6 +70,14 @@ struct xe_userptr {
 #endif
 };
 
+#if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
+struct xe_eudebug_vma_metadata {
+	struct list_head list;
+};
+#else
+struct xe_eudebug_vma_metadata { };
+#endif
+
 struct xe_vma {
 	/** @gpuva: Base GPUVA object */
 	struct drm_gpuva gpuva;
@@ -121,6 +129,11 @@ struct xe_vma {
 	 * Needs to be signalled before UNMAP can be processed.
 	 */
 	struct xe_user_fence *ufence;
+
+	struct {
+		/** @metadata: List of vma debug metadata */
+		struct xe_eudebug_vma_metadata metadata;
+	} eudebug;
 };
 
 /**
@@ -311,6 +324,10 @@ struct xe_vma_op_map {
 	bool dumpable;
 	/** @pat_index: The pat index to use for this operation. */
 	u16 pat_index;
+	struct  {
+		/** @vma_metadata: List of vma debug metadata */
+		struct xe_eudebug_vma_metadata metadata;
+	} eudebug;
 };
 
 /** struct xe_vma_op_remap - VMA remap operation */
@@ -388,4 +405,14 @@ struct xe_vma_ops {
 #endif
 };
 
+struct xe_vma_debug_metadata {
+	/** @debug.metadata: id of attached xe_debug_metadata */
+	u32 metadata_id;
+	/** @debug.cookie: user defined cookie */
+	u64 cookie;
+
+	/** @link: list of metadata attached to vma */
+	struct list_head link;
+};
+
 #endif
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 1a452a8d2a2a..176c348c3fdd 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -888,6 +888,23 @@ struct drm_xe_vm_destroy {
 	__u64 reserved[2];
 };
 
+struct drm_xe_vm_bind_op_ext_attach_debug {
+	/** @base: base user extension */
+	struct drm_xe_user_extension base;
+
+	/** @id: Debug object id from create metadata */
+	__u64 metadata_id;
+
+	/** @flags: Flags */
+	__u64 flags;
+
+	/** @cookie: Cookie */
+	__u64 cookie;
+
+	/** @reserved: Reserved */
+	__u64 reserved;
+};
+
 /**
  * struct drm_xe_vm_bind_op - run bind operations
  *
@@ -912,7 +929,9 @@ struct drm_xe_vm_destroy {
  *    handle MBZ, and the BO offset MBZ. This flag is intended to
  *    implement VK sparse bindings.
  */
+
 struct drm_xe_vm_bind_op {
+#define XE_VM_BIND_OP_EXTENSIONS_ATTACH_DEBUG 0
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
-- 
2.43.0

