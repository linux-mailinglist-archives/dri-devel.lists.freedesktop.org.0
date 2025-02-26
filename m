Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C983A46534
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 16:43:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD6FF10E941;
	Wed, 26 Feb 2025 15:43:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ONhkYj1I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72E3E10E941
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 15:43:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id EFE77612DF;
 Wed, 26 Feb 2025 15:43:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 16D53C4CEE4;
 Wed, 26 Feb 2025 15:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740584589;
 bh=vToeMbjU8t0jB4Xe99q4NLmDcKF4K2Dllwyj2UJO+CU=;
 h=From:Date:Subject:To:Cc:Reply-To:From;
 b=ONhkYj1I70JJ+oVQBCmxr8IWS/2Lh6M9kQ9DFWyPANNjVX2JFJRkoQ3CZPznPkgqg
 w2tUtEtmrgqa6WN1ewrwyEHwGCg6qDaQqqzhao/USgA6llE/jb8b3Dq0vnLPKYn6e2
 m0myiaqmcHoQALv5Hy8eitrkJATe5v4sE/eIzsnnoO8FkXX7IYbyfqx+gU4rhJA81H
 TY0s3odYXYq5mVrzfNHTSpwdjV9KtUYEZKbgM5iTI/i0GZl0p8nc/tzOlMUChhc/2X
 O5uxpdcPu1V1F/PUtqMcKsN5Fc63++hSCRX/gw2NZvFsyvLSks/tSBcRUG1nXBNzgL
 bwGMLVX45eNTg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 0B4FDC19F2E;
 Wed, 26 Feb 2025 15:43:09 +0000 (UTC)
From: Brendan King via B4 Relay <devnull+Brendan.King.imgtec.com@kernel.org>
Date: Wed, 26 Feb 2025 15:43:06 +0000
Subject: [PATCH v2] drm/imagination: Hold drm_gem_gpuva lock for unmap
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250226-hold-drm_gem_gpuva-lock-for-unmap-v2-1-3fdacded227f@imgtec.com>
X-B4-Tracking: v=1; b=H4sIAIk2v2cC/5WNSw6CMBRFt0Le2Gf6ASOO2IchprYPaKSUtNBoC
 Hu3sgMHd3Du4JwNIgVLEW7FBoGSjdZPGcSpAD2oqSe0JjMIJiommMTBjwZNcI+e8uY1KRy9fmH
 nA66TUzMaVUp5lXX1FBKyZw7U2ffRuLeZBxsXHz5HMvHf+489ceRoDGfs0sm6ZKyxrl9In7V30
 O77/gXWiMuH0wAAAA==
X-Change-ID: 20250203-hold-drm_gem_gpuva-lock-for-unmap-da4338395b23
To: Frank Binns <frank.binns@imgtec.com>, 
 Matt Coster <matt.coster@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Brendan King <brendan.king@imgtec.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740584588; l=8971;
 i=Brendan.King@imgtec.com; s=20250203; h=from:subject:message-id;
 bh=oNc9LaZRivBoYlOEl/Er8MdAZzhlXTKhjoMsJS29CGU=;
 b=/mq55+VrLnxl6xU5bafIu5i2OO+zeMxvIVphWHf7CfN7EXL90O5APjlt/HUiXlFoMoLxDFXG+
 vbWkvl0H/PTCMww9cMC9ohpOqoGd2mv5syCMqhbHiZ5gWbkDhrghLWa
X-Developer-Key: i=Brendan.King@imgtec.com; a=ed25519;
 pk=i3JvC3unEBLW+4r5s/aEWQZFsRCWaCBrWdFbMXIXCqg=
X-Endpoint-Received: by B4 Relay for Brendan.King@imgtec.com/20250203 with
 auth_id=335
X-Original-From: Brendan King <Brendan.King@imgtec.com>
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
Reply-To: Brendan.King@imgtec.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Brendan King <Brendan.King@imgtec.com>

Avoid a warning from drm_gem_gpuva_assert_lock_held in drm_gpuva_unlink.

The Imagination driver uses the GEM object reservation lock to protect
the gpuva list, but the GEM object was not always known in the code
paths that ended up calling drm_gpuva_unlink. When the GEM object isn't
known, it is found by calling drm_gpuva_find to lookup the object
associated with a given virtual address range, or by calling
drm_gpuva_find_first when removing all mappings.

Cc: stable@vger.kernel.org
Fixes: 4bc736f890ce ("drm/imagination: vm: make use of GPUVM's drm_exec helper")
Signed-off-by: Brendan King <brendan.king@imgtec.com>
---
Changes in v2:
- Added 'Cc:' and 'Fixes:' tags
- Link to v1: https://lore.kernel.org/r/20250203-hold-drm_gem_gpuva-lock-for-unmap-v1-1-dd1006f39400@imgtec.com
---
 drivers/gpu/drm/imagination/pvr_fw_meta.c |   6 +-
 drivers/gpu/drm/imagination/pvr_vm.c      | 134 ++++++++++++++++++++++++------
 drivers/gpu/drm/imagination/pvr_vm.h      |   3 +
 3 files changed, 115 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_fw_meta.c b/drivers/gpu/drm/imagination/pvr_fw_meta.c
index c39beb70c3173ebdab13b4e810ce5d9a3419f0ba..6d13864851fc2e83bdaa94f16435b97841e5de94 100644
--- a/drivers/gpu/drm/imagination/pvr_fw_meta.c
+++ b/drivers/gpu/drm/imagination/pvr_fw_meta.c
@@ -527,8 +527,10 @@ pvr_meta_vm_map(struct pvr_device *pvr_dev, struct pvr_fw_object *fw_obj)
 static void
 pvr_meta_vm_unmap(struct pvr_device *pvr_dev, struct pvr_fw_object *fw_obj)
 {
-	pvr_vm_unmap(pvr_dev->kernel_vm_ctx, fw_obj->fw_mm_node.start,
-		     fw_obj->fw_mm_node.size);
+	struct pvr_gem_object *pvr_obj = fw_obj->gem;
+
+	pvr_vm_unmap_obj(pvr_dev->kernel_vm_ctx, pvr_obj,
+			 fw_obj->fw_mm_node.start, fw_obj->fw_mm_node.size);
 }
 
 static bool
diff --git a/drivers/gpu/drm/imagination/pvr_vm.c b/drivers/gpu/drm/imagination/pvr_vm.c
index 363f885a709826efa3d45a906c5f65131f7ed7b9..2896fa7501b1ccddaae48b212b6a724d152df9f2 100644
--- a/drivers/gpu/drm/imagination/pvr_vm.c
+++ b/drivers/gpu/drm/imagination/pvr_vm.c
@@ -293,8 +293,9 @@ pvr_vm_bind_op_map_init(struct pvr_vm_bind_op *bind_op,
 
 static int
 pvr_vm_bind_op_unmap_init(struct pvr_vm_bind_op *bind_op,
-			  struct pvr_vm_context *vm_ctx, u64 device_addr,
-			  u64 size)
+			  struct pvr_vm_context *vm_ctx,
+			  struct pvr_gem_object *pvr_obj,
+			  u64 device_addr, u64 size)
 {
 	int err;
 
@@ -318,6 +319,7 @@ pvr_vm_bind_op_unmap_init(struct pvr_vm_bind_op *bind_op,
 		goto err_bind_op_fini;
 	}
 
+	bind_op->pvr_obj = pvr_obj;
 	bind_op->vm_ctx = vm_ctx;
 	bind_op->device_addr = device_addr;
 	bind_op->size = size;
@@ -597,20 +599,6 @@ pvr_vm_create_context(struct pvr_device *pvr_dev, bool is_userspace_context)
 	return ERR_PTR(err);
 }
 
-/**
- * pvr_vm_unmap_all() - Unmap all mappings associated with a VM context.
- * @vm_ctx: Target VM context.
- *
- * This function ensures that no mappings are left dangling by unmapping them
- * all in order of ascending device-virtual address.
- */
-void
-pvr_vm_unmap_all(struct pvr_vm_context *vm_ctx)
-{
-	WARN_ON(pvr_vm_unmap(vm_ctx, vm_ctx->gpuvm_mgr.mm_start,
-			     vm_ctx->gpuvm_mgr.mm_range));
-}
-
 /**
  * pvr_vm_context_release() - Teardown a VM context.
  * @ref_count: Pointer to reference counter of the VM context.
@@ -703,11 +691,7 @@ pvr_vm_lock_extra(struct drm_gpuvm_exec *vm_exec)
 	struct pvr_vm_bind_op *bind_op = vm_exec->extra.priv;
 	struct pvr_gem_object *pvr_obj = bind_op->pvr_obj;
 
-	/* Unmap operations don't have an object to lock. */
-	if (!pvr_obj)
-		return 0;
-
-	/* Acquire lock on the GEM being mapped. */
+	/* Acquire lock on the GEM object being mapped/unmapped. */
 	return drm_exec_lock_obj(&vm_exec->exec, gem_from_pvr_gem(pvr_obj));
 }
 
@@ -772,8 +756,10 @@ pvr_vm_map(struct pvr_vm_context *vm_ctx, struct pvr_gem_object *pvr_obj,
 }
 
 /**
- * pvr_vm_unmap() - Unmap an already mapped section of device-virtual memory.
+ * pvr_vm_unmap_obj_locked() - Unmap an already mapped section of device-virtual
+ * memory.
  * @vm_ctx: Target VM context.
+ * @pvr_obj: Target PowerVR memory object.
  * @device_addr: Virtual device address at the start of the target mapping.
  * @size: Size of the target mapping.
  *
@@ -784,9 +770,13 @@ pvr_vm_map(struct pvr_vm_context *vm_ctx, struct pvr_gem_object *pvr_obj,
  *  * Any error encountered while performing internal operations required to
  *    destroy the mapping (returned from pvr_vm_gpuva_unmap or
  *    pvr_vm_gpuva_remap).
+ *
+ * The vm_ctx->lock must be held when calling this function.
  */
-int
-pvr_vm_unmap(struct pvr_vm_context *vm_ctx, u64 device_addr, u64 size)
+static int
+pvr_vm_unmap_obj_locked(struct pvr_vm_context *vm_ctx,
+			struct pvr_gem_object *pvr_obj,
+			u64 device_addr, u64 size)
 {
 	struct pvr_vm_bind_op bind_op = {0};
 	struct drm_gpuvm_exec vm_exec = {
@@ -799,11 +789,13 @@ pvr_vm_unmap(struct pvr_vm_context *vm_ctx, u64 device_addr, u64 size)
 		},
 	};
 
-	int err = pvr_vm_bind_op_unmap_init(&bind_op, vm_ctx, device_addr,
-					    size);
+	int err = pvr_vm_bind_op_unmap_init(&bind_op, vm_ctx, pvr_obj,
+					    device_addr, size);
 	if (err)
 		return err;
 
+	pvr_gem_object_get(pvr_obj);
+
 	err = drm_gpuvm_exec_lock(&vm_exec);
 	if (err)
 		goto err_cleanup;
@@ -818,6 +810,96 @@ pvr_vm_unmap(struct pvr_vm_context *vm_ctx, u64 device_addr, u64 size)
 	return err;
 }
 
+/**
+ * pvr_vm_unmap_obj() - Unmap an already mapped section of device-virtual
+ * memory.
+ * @vm_ctx: Target VM context.
+ * @pvr_obj: Target PowerVR memory object.
+ * @device_addr: Virtual device address at the start of the target mapping.
+ * @size: Size of the target mapping.
+ *
+ * Return:
+ *  * 0 on success,
+ *  * Any error encountered by pvr_vm_unmap_obj_locked.
+ */
+int
+pvr_vm_unmap_obj(struct pvr_vm_context *vm_ctx, struct pvr_gem_object *pvr_obj,
+		 u64 device_addr, u64 size)
+{
+	int err;
+
+	mutex_lock(&vm_ctx->lock);
+	err = pvr_vm_unmap_obj_locked(vm_ctx, pvr_obj, device_addr, size);
+	mutex_unlock(&vm_ctx->lock);
+
+	return err;
+}
+
+/**
+ * pvr_vm_unmap() - Unmap an already mapped section of device-virtual memory.
+ * @vm_ctx: Target VM context.
+ * @device_addr: Virtual device address at the start of the target mapping.
+ * @size: Size of the target mapping.
+ *
+ * Return:
+ *  * 0 on success,
+ *  * Any error encountered by drm_gpuva_find,
+ *  * Any error encountered by pvr_vm_unmap_obj_locked.
+ */
+int
+pvr_vm_unmap(struct pvr_vm_context *vm_ctx, u64 device_addr, u64 size)
+{
+	struct pvr_gem_object *pvr_obj;
+	struct drm_gpuva *va;
+	int err;
+
+	mutex_lock(&vm_ctx->lock);
+
+	va = drm_gpuva_find(&vm_ctx->gpuvm_mgr, device_addr, size);
+	if (va) {
+		pvr_obj = gem_to_pvr_gem(va->gem.obj);
+		err = pvr_vm_unmap_obj_locked(vm_ctx, pvr_obj,
+					      va->va.addr, va->va.range);
+	} else {
+		err = -ENOENT;
+	}
+
+	mutex_unlock(&vm_ctx->lock);
+
+	return err;
+}
+
+/**
+ * pvr_vm_unmap_all() - Unmap all mappings associated with a VM context.
+ * @vm_ctx: Target VM context.
+ *
+ * This function ensures that no mappings are left dangling by unmapping them
+ * all in order of ascending device-virtual address.
+ */
+void
+pvr_vm_unmap_all(struct pvr_vm_context *vm_ctx)
+{
+	mutex_lock(&vm_ctx->lock);
+
+	for (;;) {
+		struct pvr_gem_object *pvr_obj;
+		struct drm_gpuva *va;
+
+		va = drm_gpuva_find_first(&vm_ctx->gpuvm_mgr,
+					  vm_ctx->gpuvm_mgr.mm_start,
+					  vm_ctx->gpuvm_mgr.mm_range);
+		if (!va)
+			break;
+
+		pvr_obj = gem_to_pvr_gem(va->gem.obj);
+
+		WARN_ON(pvr_vm_unmap_obj_locked(vm_ctx, pvr_obj,
+						va->va.addr, va->va.range));
+	}
+
+	mutex_unlock(&vm_ctx->lock);
+}
+
 /* Static data areas are determined by firmware. */
 static const struct drm_pvr_static_data_area static_data_areas[] = {
 	{
diff --git a/drivers/gpu/drm/imagination/pvr_vm.h b/drivers/gpu/drm/imagination/pvr_vm.h
index 79406243617c1f025c0119eb8deeaa13c0415586..b0528dffa7f1ba4342c98c2abd7fac31d254d0e7 100644
--- a/drivers/gpu/drm/imagination/pvr_vm.h
+++ b/drivers/gpu/drm/imagination/pvr_vm.h
@@ -38,6 +38,9 @@ struct pvr_vm_context *pvr_vm_create_context(struct pvr_device *pvr_dev,
 int pvr_vm_map(struct pvr_vm_context *vm_ctx,
 	       struct pvr_gem_object *pvr_obj, u64 pvr_obj_offset,
 	       u64 device_addr, u64 size);
+int pvr_vm_unmap_obj(struct pvr_vm_context *vm_ctx,
+		     struct pvr_gem_object *pvr_obj,
+		     u64 device_addr, u64 size);
 int pvr_vm_unmap(struct pvr_vm_context *vm_ctx, u64 device_addr, u64 size);
 void pvr_vm_unmap_all(struct pvr_vm_context *vm_ctx);
 

---
base-commit: 3ab334814dc7dff39075e055e12847d51878916e
change-id: 20250203-hold-drm_gem_gpuva-lock-for-unmap-da4338395b23

Best regards,
-- 
Brendan King <Brendan.King@imgtec.com>


