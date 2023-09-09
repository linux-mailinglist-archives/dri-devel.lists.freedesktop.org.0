Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 214C8799957
	for <lists+dri-devel@lfdr.de>; Sat,  9 Sep 2023 17:31:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06F7110E2A6;
	Sat,  9 Sep 2023 15:31:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 330FE10E2A1
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Sep 2023 15:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694273513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zLCDfx3B2Ap/FUpjEq7R7aRLlPQW1ihXo4G1AJdzSdQ=;
 b=Qat2pJET2iJSN8k1z+uZ3FbGVFtOZp47ERxb/MhFDTRwG1f+aljdJN+trTVld+ppk7FJVw
 IwAlIDs1ZoQsbcO307XSAMz9m7BawmKnV1P3y32VdvvS13rjqkiMG0jlD8fTVeNl09DG95
 8FPs4XF88dhD8xLdhDsPnWJgoIvXpt8=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-235-9Rn-bU5QPny99sowyBsLZQ-1; Sat, 09 Sep 2023 11:31:51 -0400
X-MC-Unique: 9Rn-bU5QPny99sowyBsLZQ-1
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-50092034189so3052059e87.3
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Sep 2023 08:31:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694273510; x=1694878310;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zLCDfx3B2Ap/FUpjEq7R7aRLlPQW1ihXo4G1AJdzSdQ=;
 b=A5FlkqFg0Xv4bZlr+khjl8Nh1Yn1FzJ6MZ3vz4UP/3xIM/OlBSd0hKJhx+O2n3DqWI
 b3RR6vah5bpPp/roMe5VORq2vXttq6PJbJCUoxNpZ9VDokfoZNno2OdQTVY4qeZI4/xv
 vUbnA1/0u37cJecPGlghiFSc1uWrNK0yatU7W3RGmyJvjPgZNp2ky8w442zOC41KLKGW
 Y9gV7fHUgO/x7dIaxvTL2DvuYxKVPFvIQpl9Qs0tIcJXKx0Z3g0421pGuBfmt3tahKH+
 KE99gkw8z1qMwVBKM5ezRUVyikGHe8CmAfhUDv94qMttBaat2aCsCbBCIRTSmaLAwmxd
 qzOw==
X-Gm-Message-State: AOJu0Yz42mOAHMkUmo98COuUQPxCI/mUZ0U6kUyQCPA+X/Mx48l3cogV
 WM7exNXSDvazSJHj7ZIXuH0PReJ90UNbNdAhdYPcWkXPY5sLBlVUewKG1/12OpbmTHYh9RCjTHg
 uQNE2z40I/JuIRf99iVd94eknJd8k
X-Received: by 2002:a05:6512:2507:b0:502:9fce:b6e3 with SMTP id
 be7-20020a056512250700b005029fceb6e3mr3660026lfb.7.1694273509480; 
 Sat, 09 Sep 2023 08:31:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMpnpMU5CJGtWC0ma+1Q9b7QN5OmJ57Ny6Ow6fadceQiD7MOKlNMRcKsFwR91NFN6ujSuhhg==
X-Received: by 2002:a05:6512:2507:b0:502:9fce:b6e3 with SMTP id
 be7-20020a056512250700b005029fceb6e3mr3660013lfb.7.1694273508996; 
 Sat, 09 Sep 2023 08:31:48 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 m21-20020a50ef15000000b005232ea6a330sm2273779eds.2.2023.09.09.08.31.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Sep 2023 08:31:48 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, sarah.walker@imgtec.com,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith.ekstrand@collabora.com
Subject: [PATCH drm-misc-next v3 5/7] drm/gpuvm: add an abstraction for a VM /
 BO combination
Date: Sat,  9 Sep 2023 17:31:12 +0200
Message-ID: <20230909153125.30032-6-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230909153125.30032-1-dakr@redhat.com>
References: <20230909153125.30032-1-dakr@redhat.com>
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

This patch adds an abstraction layer between the drm_gpuva mappings of
a particular drm_gem_object and this GEM object itself. The abstraction
represents a combination of a drm_gem_object and drm_gpuvm. The
drm_gem_object holds a list of drm_gpuvm_bo structures (the structure
representing this abstraction), while each drm_gpuvm_bo contains list of
mappings of this GEM object.

This has multiple advantages:

1) We can use the drm_gpuvm_bo structure to attach it to various lists
   of the drm_gpuvm. This is useful for tracking external and evicted
   objects per VM, which is introduced in subsequent patches.

2) Finding mappings of a certain drm_gem_object mapped in a certain
   drm_gpuvm becomes much cheaper.

3) Drivers can derive and extend the structure to easily represent
   driver specific states of a BO for a certain GPUVM.

The idea of this abstraction was taken from amdgpu, hence the credit for
this idea goes to the developers of amdgpu.

Cc: Christian König <christian.koenig@amd.com>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/drm_gpuvm.c            | 304 ++++++++++++++++++++++---
 drivers/gpu/drm/nouveau/nouveau_uvmm.c |  68 ++++--
 include/drm/drm_gem.h                  |  32 +--
 include/drm/drm_gpuvm.h                | 149 +++++++++++-
 4 files changed, 478 insertions(+), 75 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index 218204fe5068..f4411047dbb3 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -61,6 +61,18 @@
  * contained within struct drm_gpuva already. Hence, for inserting &drm_gpuva
  * entries from within dma-fence signalling critical sections it is enough to
  * pre-allocate the &drm_gpuva structures.
+ *
+ * In order to connect a struct drm_gpuva its backing &drm_gem_object each
+ * &drm_gem_object maintains a list of &drm_gpuvm_bo structures, and each
+ * &drm_gpuvm_bo contains a list of &&drm_gpuva structures.
+ *
+ * A &drm_gpuvm_bo is an abstraction that represents a combination of a
+ * &drm_gpuvm and a &drm_gem_object. Every such combination should be unique.
+ * This is ensured by the API through drm_gpuvm_bo_obtain() and
+ * drm_gpuvm_bo_obtain_prealloc() which first look into the corresponding
+ * &drm_gem_object list of &drm_gpuvm_bos for an existing instance of this
+ * particular combination. If not existent a new instance is created and linked
+ * to the &drm_gem_object.
  */
 
 /**
@@ -393,14 +405,21 @@
  * split / merge or prefetch.
  *
  * The GPU VA manager also does not take care of the locking of the backing
- * &drm_gem_object buffers GPU VA lists by itself; drivers are responsible to
- * enforce mutual exclusion using either the GEMs dma_resv lock or alternatively
- * a driver specific external lock. For the latter see also
- * drm_gem_gpuva_set_lock().
+ * &drm_gem_object buffers GPU VA lists and &drm_gpuvm_bo abstractions by
+ * itself; drivers are responsible to enforce mutual exclusion using either the
+ * GEMs dma_resv lock or alternatively a driver specific external lock. For the
+ * latter see also drm_gem_gpuva_set_lock().
  *
  * However, the GPU VA manager contains lockdep checks to ensure callers of its
  * API hold the corresponding lock whenever the &drm_gem_objects GPU VA list is
- * accessed by functions such as drm_gpuva_link() or drm_gpuva_unlink().
+ * accessed by functions such as drm_gpuva_link() or drm_gpuva_unlink(), but
+ * also drm_gpuvm_bo_obtain() and drm_gpuvm_bo_put().
+ *
+ * The latter is required since on creation and destruction of a &drm_gpuvm_bo
+ * the &drm_gpuvm_bo is attached / removed from the &drm_gem_objects gpuva list.
+ * Subsequent calls to drm_gpuvm_bo_obtain() for the same &drm_gpuvm and
+ * &drm_gem_object must be able to observe previous creations and destructions
+ * of &drm_gpuvm_bos in order to keep instances unique.
  */
 
 /**
@@ -430,6 +449,7 @@
  *	{
  *		struct drm_gpuva_ops *ops;
  *		struct drm_gpuva_op *op
+ *		struct drm_gpuvm_bo *vm_bo;
  *
  *		driver_lock_va_space();
  *		ops = drm_gpuvm_sm_map_ops_create(gpuvm, addr, range,
@@ -437,6 +457,10 @@
  *		if (IS_ERR(ops))
  *			return PTR_ERR(ops);
  *
+ *		vm_bo = drm_gpuvm_bo_obtain(gpuvm, obj);
+ *		if (IS_ERR(vm_bo))
+ *			return PTR_ERR(vm_bo);
+ *
  *		drm_gpuva_for_each_op(op, ops) {
  *			struct drm_gpuva *va;
  *
@@ -449,7 +473,7 @@
  *
  *				driver_vm_map();
  *				drm_gpuva_map(gpuvm, va, &op->map);
- *				drm_gpuva_link(va);
+ *				drm_gpuva_link(va, vm_bo);
  *
  *				break;
  *			case DRM_GPUVA_OP_REMAP: {
@@ -476,11 +500,11 @@
  *				driver_vm_remap();
  *				drm_gpuva_remap(prev, next, &op->remap);
  *
- *				drm_gpuva_unlink(va);
  *				if (prev)
- *					drm_gpuva_link(prev);
+ *					drm_gpuva_link(prev, va->vm_bo);
  *				if (next)
- *					drm_gpuva_link(next);
+ *					drm_gpuva_link(next, va->vm_bo);
+ *				drm_gpuva_unlink(va);
  *
  *				break;
  *			}
@@ -496,6 +520,7 @@
  *				break;
  *			}
  *		}
+ *		drm_gpuvm_bo_put(vm_bo);
  *		driver_unlock_va_space();
  *
  *		return 0;
@@ -505,6 +530,7 @@
  *
  *	struct driver_context {
  *		struct drm_gpuvm *gpuvm;
+ *		struct drm_gpuvm_bo *vm_bo;
  *		struct drm_gpuva *new_va;
  *		struct drm_gpuva *prev_va;
  *		struct drm_gpuva *next_va;
@@ -525,6 +551,7 @@
  *				  struct drm_gem_object *obj, u64 offset)
  *	{
  *		struct driver_context ctx;
+ *		struct drm_gpuvm_bo *vm_bo;
  *		struct drm_gpuva_ops *ops;
  *		struct drm_gpuva_op *op;
  *		int ret = 0;
@@ -534,16 +561,23 @@
  *		ctx.new_va = kzalloc(sizeof(*ctx.new_va), GFP_KERNEL);
  *		ctx.prev_va = kzalloc(sizeof(*ctx.prev_va), GFP_KERNEL);
  *		ctx.next_va = kzalloc(sizeof(*ctx.next_va), GFP_KERNEL);
- *		if (!ctx.new_va || !ctx.prev_va || !ctx.next_va) {
+ *		ctx.vm_bo = drm_gpuvm_bo_create(gpuvm, obj);
+ *		if (!ctx.new_va || !ctx.prev_va || !ctx.next_va || !vm_bo) {
  *			ret = -ENOMEM;
  *			goto out;
  *		}
  *
+ *		// Typically protected with a driver specific GEM gpuva lock
+ *		// used in the fence signaling path for drm_gpuva_link() and
+ *		// drm_gpuva_unlink(), hence pre-allocate.
+ *		ctx.vm_bo = drm_gpuvm_bo_obtain_prealloc(ctx.vm_bo);
+ *
  *		driver_lock_va_space();
  *		ret = drm_gpuvm_sm_map(gpuvm, &ctx, addr, range, obj, offset);
  *		driver_unlock_va_space();
  *
  *	out:
+ *		drm_gpuvm_bo_put(ctx.vm_bo);
  *		kfree(ctx.new_va);
  *		kfree(ctx.prev_va);
  *		kfree(ctx.next_va);
@@ -556,7 +590,7 @@
  *
  *		drm_gpuva_map(ctx->vm, ctx->new_va, &op->map);
  *
- *		drm_gpuva_link(ctx->new_va);
+ *		drm_gpuva_link(ctx->new_va, ctx->vm_bo);
  *
  *		// prevent the new GPUVA from being freed in
  *		// driver_mapping_create()
@@ -568,22 +602,23 @@
  *	int driver_gpuva_remap(struct drm_gpuva_op *op, void *__ctx)
  *	{
  *		struct driver_context *ctx = __ctx;
+ *		struct drm_gpuva *va = op->remap.unmap->va;
  *
  *		drm_gpuva_remap(ctx->prev_va, ctx->next_va, &op->remap);
  *
- *		drm_gpuva_unlink(op->remap.unmap->va);
- *		kfree(op->remap.unmap->va);
- *
  *		if (op->remap.prev) {
- *			drm_gpuva_link(ctx->prev_va);
+ *			drm_gpuva_link(ctx->prev_va, va->vm_bo);
  *			ctx->prev_va = NULL;
  *		}
  *
  *		if (op->remap.next) {
- *			drm_gpuva_link(ctx->next_va);
+ *			drm_gpuva_link(ctx->next_va, va->vm_bo);
  *			ctx->next_va = NULL;
  *		}
  *
+ *		drm_gpuva_unlink(va);
+ *		kfree(va);
+ *
  *		return 0;
  *	}
  *
@@ -723,6 +758,186 @@ drm_gpuvm_destroy(struct drm_gpuvm *gpuvm)
 }
 EXPORT_SYMBOL_GPL(drm_gpuvm_destroy);
 
+/**
+ * drm_gpuvm_bo_create() - create a new instance of struct drm_gpuvm_bo
+ * @gpuvm: The &drm_gpuvm the @obj is mapped in.
+ * @obj: The &drm_gem_object being mapped in the @gpuvm.
+ *
+ * If provided by the driver, this function uses the &drm_gpuvm_ops
+ * vm_bo_alloc() callback to allocate.
+ *
+ * Returns: a pointer to the &drm_gpuvm_bo on success, NULL on failure
+ */
+struct drm_gpuvm_bo *
+drm_gpuvm_bo_create(struct drm_gpuvm *gpuvm,
+		    struct drm_gem_object *obj)
+{
+	const struct drm_gpuvm_ops *ops = gpuvm->ops;
+	struct drm_gpuvm_bo *vm_bo;
+
+	if (ops && ops->vm_bo_alloc)
+		vm_bo = ops->vm_bo_alloc();
+	else
+		vm_bo = kzalloc(sizeof(*vm_bo), GFP_KERNEL);
+
+	if (unlikely(!vm_bo))
+		return NULL;
+
+	vm_bo->vm = gpuvm;
+	vm_bo->obj = obj;
+
+	kref_init(&vm_bo->kref);
+	INIT_LIST_HEAD(&vm_bo->list.gpuva);
+	INIT_LIST_HEAD(&vm_bo->list.entry.gem);
+
+	drm_gem_object_get(obj);
+
+	return vm_bo;
+}
+EXPORT_SYMBOL_GPL(drm_gpuvm_bo_create);
+
+static void
+drm_gpuvm_bo_destroy(struct kref *kref)
+{
+	struct drm_gpuvm_bo *vm_bo = container_of(kref, struct drm_gpuvm_bo,
+						  kref);
+	struct drm_gpuvm *gpuvm = vm_bo->vm;
+	const struct drm_gpuvm_ops *ops = gpuvm->ops;
+	struct drm_gem_object *obj = vm_bo->obj;
+
+	drm_gem_gpuva_assert_lock_held(vm_bo->obj);
+
+	list_del(&vm_bo->list.entry.gem);
+
+	drm_gem_object_put(obj);
+
+	if (ops && ops->vm_bo_free)
+		ops->vm_bo_free(vm_bo);
+	else
+		kfree(vm_bo);
+}
+
+/**
+ * drm_gpuvm_bo_put() - drop a struct drm_gpuvm_bo reference
+ * @vm_bo: the &drm_gpuvm_bo to release the reference of
+ *
+ * This releases a reference to @vm_bo.
+ */
+void
+drm_gpuvm_bo_put(struct drm_gpuvm_bo *vm_bo)
+{
+	if (vm_bo)
+		kref_put(&vm_bo->kref, drm_gpuvm_bo_destroy);
+}
+EXPORT_SYMBOL_GPL(drm_gpuvm_bo_put);
+
+static struct drm_gpuvm_bo *
+__drm_gpuvm_bo_find(struct drm_gpuvm *gpuvm,
+		    struct drm_gem_object *obj)
+{
+	struct drm_gpuvm_bo *vm_bo;
+
+	drm_gem_gpuva_assert_lock_held(obj);
+
+	drm_gem_for_each_gpuvm_bo(vm_bo, obj)
+		if (vm_bo->vm == gpuvm)
+			return vm_bo;
+
+	return NULL;
+}
+
+/**
+ * drm_gpuvm_bo_find() - find the &drm_gpuvm_bo for the given
+ * &drm_gpuvm and &drm_gem_object
+ * @gpuvm: The &drm_gpuvm the @obj is mapped in.
+ * @obj: The &drm_gem_object being mapped in the @gpuvm.
+ *
+ * Find the &drm_gpuvm_bo representing the combination of the given
+ * &drm_gpuvm and &drm_gem_object. If found, increases the reference
+ * count of the &drm_gpuvm_bo accordingly.
+ *
+ * Returns: a pointer to the &drm_gpuvm_bo on success, NULL on failure
+ */
+struct drm_gpuvm_bo *
+drm_gpuvm_bo_find(struct drm_gpuvm *gpuvm,
+		  struct drm_gem_object *obj)
+{
+	struct drm_gpuvm_bo *vm_bo = __drm_gpuvm_bo_find(gpuvm, obj);
+
+	return vm_bo ? drm_gpuvm_bo_get(vm_bo) : NULL;
+}
+EXPORT_SYMBOL_GPL(drm_gpuvm_bo_find);
+
+/**
+ * drm_gpuvm_bo_obtain() - obtains and instance of the &drm_gpuvm_bo for the
+ * given &drm_gpuvm and &drm_gem_object
+ * @gpuvm: The &drm_gpuvm the @obj is mapped in.
+ * @obj: The &drm_gem_object being mapped in the @gpuvm.
+ *
+ * Find the &drm_gpuvm_bo representing the combination of the given
+ * &drm_gpuvm and &drm_gem_object. If found, increases the reference
+ * count of the &drm_gpuvm_bo accordingly. If not found, allocates a new
+ * &drm_gpuvm_bo.
+ *
+ * A new &drm_gpuvm_bo is added to the GEMs gpuva list.
+ *
+ * Returns: a pointer to the &drm_gpuvm_bo on success, an ERR_PTR on failure
+ */
+struct drm_gpuvm_bo *
+drm_gpuvm_bo_obtain(struct drm_gpuvm *gpuvm,
+		    struct drm_gem_object *obj)
+{
+	struct drm_gpuvm_bo *vm_bo;
+
+	vm_bo = drm_gpuvm_bo_find(gpuvm, obj);
+	if (vm_bo)
+		return vm_bo;
+
+	vm_bo = drm_gpuvm_bo_create(gpuvm, obj);
+	if (!vm_bo)
+		return ERR_PTR(-ENOMEM);
+
+	list_add_tail(&vm_bo->list.entry.gem, &obj->gpuva.list);
+
+	return vm_bo;
+}
+EXPORT_SYMBOL_GPL(drm_gpuvm_bo_obtain);
+
+/**
+ * drm_gpuvm_bo_obtain_prealloc() - obtains and instance of the &drm_gpuvm_bo
+ * for the given &drm_gpuvm and &drm_gem_object
+ * @__vm_bo: A pre-allocated struct drm_gpuvm_bo.
+ *
+ * Find the &drm_gpuvm_bo representing the combination of the given
+ * &drm_gpuvm and &drm_gem_object. If found, increases the reference
+ * count of the found &drm_gpuvm_bo accordingly, while the @__vm_bo reference
+ * count is decreased. If not found @__vm_bo is returned without further
+ * increase of the reference count.
+ *
+ * A new &drm_gpuvm_bo is added to the GEMs gpuva list.
+ *
+ * Returns: a pointer to the found &drm_gpuvm_bo or @__vm_bo if no existing
+ * &drm_gpuvm_bo was found
+ */
+struct drm_gpuvm_bo *
+drm_gpuvm_bo_obtain_prealloc(struct drm_gpuvm_bo *__vm_bo)
+{
+	struct drm_gpuvm *gpuvm = __vm_bo->vm;
+	struct drm_gem_object *obj = __vm_bo->obj;
+	struct drm_gpuvm_bo *vm_bo;
+
+	vm_bo = drm_gpuvm_bo_find(gpuvm, obj);
+	if (vm_bo) {
+		drm_gpuvm_bo_put(__vm_bo);
+		return vm_bo;
+	}
+
+	list_add_tail(&__vm_bo->list.entry.gem, &obj->gpuva.list);
+
+	return __vm_bo;
+}
+EXPORT_SYMBOL_GPL(drm_gpuvm_bo_obtain_prealloc);
+
 static int
 __drm_gpuva_insert(struct drm_gpuvm *gpuvm,
 		   struct drm_gpuva *va)
@@ -812,24 +1027,33 @@ EXPORT_SYMBOL_GPL(drm_gpuva_remove);
 /**
  * drm_gpuva_link() - link a &drm_gpuva
  * @va: the &drm_gpuva to link
+ * @vm_bo: the &drm_gpuvm_bo to add the &drm_gpuva to
  *
- * This adds the given &va to the GPU VA list of the &drm_gem_object it is
- * associated with.
+ * This adds the given &va to the GPU VA list of the &drm_gpuvm_bo and the
+ * &drm_gpuvm_bo to the &drm_gem_object it is associated with.
+ *
+ * For every &drm_gpuva entry added to the &drm_gpuvm_bo an additional
+ * reference of the latter is taken.
  *
  * This function expects the caller to protect the GEM's GPUVA list against
- * concurrent access using the GEMs dma_resv lock.
+ * concurrent access using either the GEMs dma_resv lock or a driver specific
+ * lock set through drm_gem_gpuva_set_lock().
  */
 void
-drm_gpuva_link(struct drm_gpuva *va)
+drm_gpuva_link(struct drm_gpuva *va, struct drm_gpuvm_bo *vm_bo)
 {
 	struct drm_gem_object *obj = va->gem.obj;
 
 	if (unlikely(!obj))
 		return;
 
+	WARN_ON(obj != vm_bo->obj);
 	drm_gem_gpuva_assert_lock_held(obj);
 
-	list_add_tail(&va->gem.entry, &obj->gpuva.list);
+	drm_gpuvm_bo_get(vm_bo);
+	va->vm_bo = vm_bo;
+
+	list_add_tail(&va->gem.entry, &vm_bo->list.gpuva);
 }
 EXPORT_SYMBOL_GPL(drm_gpuva_link);
 
@@ -840,13 +1064,22 @@ EXPORT_SYMBOL_GPL(drm_gpuva_link);
  * This removes the given &va from the GPU VA list of the &drm_gem_object it is
  * associated with.
  *
+ * This removes the given &va from the GPU VA list of the &drm_gpuvm_bo and
+ * the &drm_gpuvm_bo from the &drm_gem_object it is associated with in case
+ * this call unlinks the last &drm_gpuva from the &drm_gpuvm_bo.
+ *
+ * For every &drm_gpuva entry removed from the &drm_gpuvm_bo a reference of
+ * the latter is dropped.
+ *
  * This function expects the caller to protect the GEM's GPUVA list against
- * concurrent access using the GEMs dma_resv lock.
+ * concurrent access using either the GEMs dma_resv lock or a driver specific
+ * lock set through drm_gem_gpuva_set_lock().
  */
 void
 drm_gpuva_unlink(struct drm_gpuva *va)
 {
 	struct drm_gem_object *obj = va->gem.obj;
+	struct drm_gpuvm_bo *vm_bo = va->vm_bo;
 
 	if (unlikely(!obj))
 		return;
@@ -854,6 +1087,9 @@ drm_gpuva_unlink(struct drm_gpuva *va)
 	drm_gem_gpuva_assert_lock_held(obj);
 
 	list_del_init(&va->gem.entry);
+
+	va->vm_bo = NULL;
+	drm_gpuvm_bo_put(vm_bo);
 }
 EXPORT_SYMBOL_GPL(drm_gpuva_unlink);
 
@@ -998,10 +1234,10 @@ drm_gpuva_remap(struct drm_gpuva *prev,
 		struct drm_gpuva *next,
 		struct drm_gpuva_op_remap *op)
 {
-	struct drm_gpuva *curr = op->unmap->va;
-	struct drm_gpuvm *gpuvm = curr->vm;
+	struct drm_gpuva *va = op->unmap->va;
+	struct drm_gpuvm *gpuvm = va->vm;
 
-	drm_gpuva_remove(curr);
+	drm_gpuva_remove(va);
 
 	if (op->prev) {
 		drm_gpuva_init_from_op(prev, op->prev);
@@ -1645,9 +1881,8 @@ drm_gpuvm_prefetch_ops_create(struct drm_gpuvm *gpuvm,
 EXPORT_SYMBOL_GPL(drm_gpuvm_prefetch_ops_create);
 
 /**
- * drm_gpuvm_gem_unmap_ops_create() - creates the &drm_gpuva_ops to unmap a GEM
- * @gpuvm: the &drm_gpuvm representing the GPU VA space
- * @obj: the &drm_gem_object to unmap
+ * drm_gpuvm_bo_unmap_ops_create() - creates the &drm_gpuva_ops to unmap a GEM
+ * @vm_bo: the &drm_gpuvm_bo abstraction
  *
  * This function creates a list of operations to perform unmapping for every
  * GPUVA attached to a GEM.
@@ -1664,15 +1899,14 @@ EXPORT_SYMBOL_GPL(drm_gpuvm_prefetch_ops_create);
  * Returns: a pointer to the &drm_gpuva_ops on success, an ERR_PTR on failure
  */
 struct drm_gpuva_ops *
-drm_gpuvm_gem_unmap_ops_create(struct drm_gpuvm *gpuvm,
-			       struct drm_gem_object *obj)
+drm_gpuvm_bo_unmap_ops_create(struct drm_gpuvm_bo *vm_bo)
 {
 	struct drm_gpuva_ops *ops;
 	struct drm_gpuva_op *op;
 	struct drm_gpuva *va;
 	int ret;
 
-	drm_gem_gpuva_assert_lock_held(obj);
+	drm_gem_gpuva_assert_lock_held(vm_bo->obj);
 
 	ops = kzalloc(sizeof(*ops), GFP_KERNEL);
 	if (!ops)
@@ -1680,8 +1914,8 @@ drm_gpuvm_gem_unmap_ops_create(struct drm_gpuvm *gpuvm,
 
 	INIT_LIST_HEAD(&ops->list);
 
-	drm_gem_for_each_gpuva(va, obj) {
-		op = gpuva_op_alloc(gpuvm);
+	drm_gpuvm_bo_for_each_va(va, vm_bo) {
+		op = gpuva_op_alloc(vm_bo->vm);
 		if (!op) {
 			ret = -ENOMEM;
 			goto err_free_ops;
@@ -1695,10 +1929,10 @@ drm_gpuvm_gem_unmap_ops_create(struct drm_gpuvm *gpuvm,
 	return ops;
 
 err_free_ops:
-	drm_gpuva_ops_free(gpuvm, ops);
+	drm_gpuva_ops_free(vm_bo->vm, ops);
 	return ERR_PTR(ret);
 }
-EXPORT_SYMBOL_GPL(drm_gpuvm_gem_unmap_ops_create);
+EXPORT_SYMBOL_GPL(drm_gpuvm_bo_unmap_ops_create);
 
 /**
  * drm_gpuva_ops_free() - free the given &drm_gpuva_ops
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index a80ac8767843..cf709afd2ac7 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -62,6 +62,8 @@ struct bind_job_op {
 	enum vm_bind_op op;
 	u32 flags;
 
+	struct drm_gpuvm_bo *vm_bo;
+
 	struct {
 		u64 addr;
 		u64 range;
@@ -1113,22 +1115,28 @@ bind_validate_region(struct nouveau_job *job)
 }
 
 static void
-bind_link_gpuvas(struct drm_gpuva_ops *ops, struct nouveau_uvma_prealloc *new)
+bind_link_gpuvas(struct bind_job_op *bop)
 {
+	struct nouveau_uvma_prealloc *new = &bop->new;
+	struct drm_gpuvm_bo *vm_bo = bop->vm_bo;
+	struct drm_gpuva_ops *ops = bop->ops;
 	struct drm_gpuva_op *op;
 
 	drm_gpuva_for_each_op(op, ops) {
 		switch (op->op) {
 		case DRM_GPUVA_OP_MAP:
-			drm_gpuva_link(&new->map->va);
+			drm_gpuva_link(&new->map->va, vm_bo);
 			break;
-		case DRM_GPUVA_OP_REMAP:
+		case DRM_GPUVA_OP_REMAP: {
+			struct drm_gpuva *va = op->remap.unmap->va;
+
 			if (op->remap.prev)
-				drm_gpuva_link(&new->prev->va);
+				drm_gpuva_link(&new->prev->va, va->vm_bo);
 			if (op->remap.next)
-				drm_gpuva_link(&new->next->va);
-			drm_gpuva_unlink(op->remap.unmap->va);
+				drm_gpuva_link(&new->next->va, va->vm_bo);
+			drm_gpuva_unlink(va);
 			break;
+		}
 		case DRM_GPUVA_OP_UNMAP:
 			drm_gpuva_unlink(op->unmap.va);
 			break;
@@ -1150,10 +1158,18 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *job)
 
 	list_for_each_op(op, &bind_job->ops) {
 		if (op->op == OP_MAP) {
-			op->gem.obj = drm_gem_object_lookup(job->file_priv,
-							    op->gem.handle);
-			if (!op->gem.obj)
+			struct drm_gem_object *obj;
+
+			obj = drm_gem_object_lookup(job->file_priv,
+						    op->gem.handle);
+			if (!(op->gem.obj = obj))
 				return -ENOENT;
+
+			dma_resv_lock(obj->resv, NULL);
+			op->vm_bo = drm_gpuvm_bo_obtain(&uvmm->base, obj);
+			dma_resv_unlock(obj->resv);
+			if (IS_ERR(op->vm_bo))
+				return PTR_ERR(op->vm_bo);
 		}
 
 		ret = bind_validate_op(job, op);
@@ -1364,7 +1380,7 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *job)
 		case OP_UNMAP_SPARSE:
 		case OP_MAP:
 		case OP_UNMAP:
-			bind_link_gpuvas(op->ops, &op->new);
+			bind_link_gpuvas(op);
 			break;
 		default:
 			break;
@@ -1511,6 +1527,12 @@ nouveau_uvmm_bind_job_free_work_fn(struct work_struct *work)
 		if (!IS_ERR_OR_NULL(op->ops))
 			drm_gpuva_ops_free(&uvmm->base, op->ops);
 
+		if (!IS_ERR_OR_NULL(op->vm_bo)) {
+			dma_resv_lock(obj->resv, NULL);
+			drm_gpuvm_bo_put(op->vm_bo);
+			dma_resv_unlock(obj->resv);
+		}
+
 		if (obj)
 			drm_gem_object_put(obj);
 	}
@@ -1776,15 +1798,18 @@ void
 nouveau_uvmm_bo_map_all(struct nouveau_bo *nvbo, struct nouveau_mem *mem)
 {
 	struct drm_gem_object *obj = &nvbo->bo.base;
+	struct drm_gpuvm_bo *vm_bo;
 	struct drm_gpuva *va;
 
 	dma_resv_assert_held(obj->resv);
 
-	drm_gem_for_each_gpuva(va, obj) {
-		struct nouveau_uvma *uvma = uvma_from_va(va);
+	drm_gem_for_each_gpuvm_bo(vm_bo, obj) {
+		drm_gpuvm_bo_for_each_va(va, vm_bo) {
+			struct nouveau_uvma *uvma = uvma_from_va(va);
 
-		nouveau_uvma_map(uvma, mem);
-		drm_gpuva_invalidate(va, false);
+			nouveau_uvma_map(uvma, mem);
+			drm_gpuva_invalidate(va, false);
+		}
 	}
 }
 
@@ -1792,15 +1817,18 @@ void
 nouveau_uvmm_bo_unmap_all(struct nouveau_bo *nvbo)
 {
 	struct drm_gem_object *obj = &nvbo->bo.base;
+	struct drm_gpuvm_bo *vm_bo;
 	struct drm_gpuva *va;
 
 	dma_resv_assert_held(obj->resv);
 
-	drm_gem_for_each_gpuva(va, obj) {
-		struct nouveau_uvma *uvma = uvma_from_va(va);
+	drm_gem_for_each_gpuvm_bo(vm_bo, obj) {
+		drm_gpuvm_bo_for_each_va(va, vm_bo) {
+			struct nouveau_uvma *uvma = uvma_from_va(va);
 
-		nouveau_uvma_unmap(uvma);
-		drm_gpuva_invalidate(va, true);
+			nouveau_uvma_unmap(uvma);
+			drm_gpuva_invalidate(va, true);
+		}
 	}
 }
 
@@ -1847,14 +1875,14 @@ nouveau_uvmm_init(struct nouveau_uvmm *uvmm, struct nouveau_cli *cli,
 			    kernel_managed_addr, kernel_managed_size,
 			    NULL, 0, &cli->uvmm.vmm.vmm);
 	if (ret)
-		goto out_free_gpuva_mgr;
+		goto out_free_gpuvm;
 
 	cli->uvmm.vmm.cli = cli;
 	mutex_unlock(&cli->mutex);
 
 	return 0;
 
-out_free_gpuva_mgr:
+out_free_gpuvm:
 	drm_gpuvm_destroy(&uvmm->base);
 out_unlock:
 	mutex_unlock(&cli->mutex);
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index bc9f6aa2f3fe..7147978d82d8 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -571,7 +571,7 @@ int drm_gem_evict(struct drm_gem_object *obj);
  * drm_gem_gpuva_init() - initialize the gpuva list of a GEM object
  * @obj: the &drm_gem_object
  *
- * This initializes the &drm_gem_object's &drm_gpuva list.
+ * This initializes the &drm_gem_object's &drm_gpuvm_bo list.
  *
  * Calling this function is only necessary for drivers intending to support the
  * &drm_driver_feature DRIVER_GEM_GPUVA.
@@ -584,28 +584,28 @@ static inline void drm_gem_gpuva_init(struct drm_gem_object *obj)
 }
 
 /**
- * drm_gem_for_each_gpuva() - iternator to walk over a list of gpuvas
- * @entry__: &drm_gpuva structure to assign to in each iteration step
- * @obj__: the &drm_gem_object the &drm_gpuvas to walk are associated with
+ * drm_gem_for_each_gpuvm_bo() - iterator to walk over a list of &drm_gpuvm_bo
+ * @entry__: &drm_gpuvm_bo structure to assign to in each iteration step
+ * @obj__: the &drm_gem_object the &drm_gpuvm_bo to walk are associated with
  *
- * This iterator walks over all &drm_gpuva structures associated with the
- * &drm_gpuva_manager.
+ * This iterator walks over all &drm_gpuvm_bo structures associated with the
+ * &drm_gem_object.
  */
-#define drm_gem_for_each_gpuva(entry__, obj__) \
-	list_for_each_entry(entry__, &(obj__)->gpuva.list, gem.entry)
+#define drm_gem_for_each_gpuvm_bo(entry__, obj__) \
+	list_for_each_entry(entry__, &(obj__)->gpuva.list, list.entry.gem)
 
 /**
- * drm_gem_for_each_gpuva_safe() - iternator to safely walk over a list of
- * gpuvas
- * @entry__: &drm_gpuva structure to assign to in each iteration step
- * @next__: &next &drm_gpuva to store the next step
- * @obj__: the &drm_gem_object the &drm_gpuvas to walk are associated with
+ * drm_gem_for_each_gpuvm_bo_safe() - iterator to safely walk over a list of
+ * &drm_gpuvm_bo
+ * @entry__: &drm_gpuvm_bostructure to assign to in each iteration step
+ * @next__: &next &drm_gpuvm_bo to store the next step
+ * @obj__: the &drm_gem_object the &drm_gpuvm_bo to walk are associated with
  *
- * This iterator walks over all &drm_gpuva structures associated with the
+ * This iterator walks over all &drm_gpuvm_bo structures associated with the
  * &drm_gem_object. It is implemented with list_for_each_entry_safe(), hence
  * it is save against removal of elements.
  */
-#define drm_gem_for_each_gpuva_safe(entry__, next__, obj__) \
-	list_for_each_entry_safe(entry__, next__, &(obj__)->gpuva.list, gem.entry)
+#define drm_gem_for_each_gpuvm_bo_safe(entry__, next__, obj__) \
+	list_for_each_entry_safe(entry__, next__, &(obj__)->gpuva.list, list.entry.gem)
 
 #endif /* __DRM_GEM_H__ */
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index 4abc753c01eb..afa50b9059a2 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -32,6 +32,7 @@
 #include <drm/drm_gem.h>
 
 struct drm_gpuvm;
+struct drm_gpuvm_bo;
 struct drm_gpuvm_ops;
 
 /**
@@ -72,6 +73,12 @@ struct drm_gpuva {
 	 */
 	struct drm_gpuvm *vm;
 
+	/**
+	 * @vm_bo: the &drm_gpuvm_bo abstraction for the mapped
+	 * &drm_gem_object
+	 */
+	struct drm_gpuvm_bo *vm_bo;
+
 	/**
 	 * @flags: the &drm_gpuva_flags for this mapping
 	 */
@@ -107,7 +114,7 @@ struct drm_gpuva {
 		struct drm_gem_object *obj;
 
 		/**
-		 * @entry: the &list_head to attach this object to a &drm_gem_object
+		 * @entry: the &list_head to attach this object to a &drm_gpuvm_bo
 		 */
 		struct list_head entry;
 	} gem;
@@ -140,7 +147,7 @@ struct drm_gpuva {
 int drm_gpuva_insert(struct drm_gpuvm *gpuvm, struct drm_gpuva *va);
 void drm_gpuva_remove(struct drm_gpuva *va);
 
-void drm_gpuva_link(struct drm_gpuva *va);
+void drm_gpuva_link(struct drm_gpuva *va, struct drm_gpuvm_bo *vm_bo);
 void drm_gpuva_unlink(struct drm_gpuva *va);
 
 struct drm_gpuva *drm_gpuva_find(struct drm_gpuvm *gpuvm,
@@ -339,6 +346,117 @@ __drm_gpuva_next(struct drm_gpuva *va)
 #define drm_gpuvm_for_each_va_safe(va__, next__, gpuvm__) \
 	list_for_each_entry_safe(va__, next__, &(gpuvm__)->rb.list, rb.entry)
 
+/**
+ * struct drm_gpuvm_bo - structure representing a &drm_gpuvm and
+ * &drm_gem_object combination
+ *
+ * This structure is an abstraction representing a &drm_gpuvm and
+ * &drm_gem_object combination. It serves as an indirection to accelerate
+ * iterating all &drm_gpuvas within a &drm_gpuvm backed by the same
+ * &drm_gem_object.
+ *
+ * Furthermore it is used cache evicted GEM objects for a certain GPU-VM to
+ * accelerate validation.
+ *
+ * Typically, drivers want to create an instance of a struct drm_gpuvm_bo once
+ * a GEM object is mapped first in a GPU-VM and release the instance once the
+ * last mapping of the GEM object in this GPU-VM is unmapped.
+ */
+struct drm_gpuvm_bo {
+
+	/**
+	 * @gpuvm: The &drm_gpuvm the @obj is mapped in.
+	 */
+	struct drm_gpuvm *vm;
+
+	/**
+	 * @obj: The &drm_gem_object being mapped in the @gpuvm.
+	 */
+	struct drm_gem_object *obj;
+
+	/**
+	 * @kref: The reference count for this &drm_gpuvm_bo.
+	 */
+	struct kref kref;
+
+	/**
+	 * @list: Structure containing all &list_heads.
+	 */
+	struct {
+		/**
+		 * @gpuva: The list of linked &drm_gpuvas.
+		 */
+		struct list_head gpuva;
+
+		/**
+		 * @entry: Structure containing all &list_heads serving as
+		 * entry.
+		 */
+		struct {
+			/**
+			 * @gem: List entry to attach to the &drm_gem_objects
+			 * gpuva list.
+			 */
+			struct list_head gem;
+		} entry;
+	} list;
+};
+
+struct drm_gpuvm_bo *
+drm_gpuvm_bo_create(struct drm_gpuvm *gpuvm,
+		    struct drm_gem_object *obj);
+
+struct drm_gpuvm_bo *
+drm_gpuvm_bo_obtain(struct drm_gpuvm *gpuvm,
+		    struct drm_gem_object *obj);
+struct drm_gpuvm_bo *
+drm_gpuvm_bo_obtain_prealloc(struct drm_gpuvm_bo *vm_bo);
+
+/**
+ * drm_gpuvm_bo_get() - acquire a struct drm_gpuvm_bo reference
+ * @vm_bo: the &drm_gpuvm_bo to acquire the reference of
+ *
+ * This function acquires an additional reference to @vm_bo. It is illegal to
+ * call this without already holding a reference. No locks required.
+ */
+static inline struct drm_gpuvm_bo *
+drm_gpuvm_bo_get(struct drm_gpuvm_bo *vm_bo)
+{
+	kref_get(&vm_bo->kref);
+	return vm_bo;
+}
+
+void drm_gpuvm_bo_put(struct drm_gpuvm_bo *vm_bo);
+
+struct drm_gpuvm_bo *
+drm_gpuvm_bo_find(struct drm_gpuvm *gpuvm,
+		  struct drm_gem_object *obj);
+
+/**
+ * drm_gpuvm_bo_for_each_va() - iterator to walk over a list of &drm_gpuva
+ * @va__: &drm_gpuva structure to assign to in each iteration step
+ * @vm_bo__: the &drm_gpuvm_bo the &drm_gpuva to walk are associated with
+ *
+ * This iterator walks over all &drm_gpuva structures associated with the
+ * &drm_gpuvm_bo.
+ */
+#define drm_gpuvm_bo_for_each_va(va__, vm_bo__) \
+	list_for_each_entry(va__, &(vm_bo)->list.gpuva, gem.entry)
+
+/**
+ * drm_gpuvm_bo_for_each_va_safe() - iterator to safely walk over a list of
+ * &drm_gpuva
+ * @va__: &drm_gpuva structure to assign to in each iteration step
+ * @next__: &next &drm_gpuva to store the next step
+ * @vm_bo__: the &drm_gpuvm_bo the &drm_gpuva to walk are associated with
+ *
+ * This iterator walks over all &drm_gpuva structures associated with the
+ * &drm_gpuvm_bo. It is implemented with list_for_each_entry_safe(), hence
+ * it is save against removal of elements.
+ */
+#define drm_gpuvm_bo_for_each_va_safe(va__, next__, vm_bo__) \
+	list_for_each_entry_safe(va__, next__, &(vm_bo)->list.gpuva, gem.entry)
+
 /**
  * enum drm_gpuva_op_type - GPU VA operation type
  *
@@ -608,8 +726,7 @@ drm_gpuvm_prefetch_ops_create(struct drm_gpuvm *gpuvm,
 				 u64 addr, u64 range);
 
 struct drm_gpuva_ops *
-drm_gpuvm_gem_unmap_ops_create(struct drm_gpuvm *gpuvm,
-			       struct drm_gem_object *obj);
+drm_gpuvm_bo_unmap_ops_create(struct drm_gpuvm_bo *vm_bo);
 
 void drm_gpuva_ops_free(struct drm_gpuvm *gpuvm,
 			struct drm_gpuva_ops *ops);
@@ -653,6 +770,30 @@ struct drm_gpuvm_ops {
 	 */
 	void (*op_free)(struct drm_gpuva_op *op);
 
+	/**
+	 * @vm_bo_alloc: called when the &drm_gpuvm allocates
+	 * a struct drm_gpuvm_bo
+	 *
+	 * Some drivers may want to embed struct drm_gpuvm_bo into driver
+	 * specific structures. By implementing this callback drivers can
+	 * allocate memory accordingly.
+	 *
+	 * This callback is optional.
+	 */
+	struct drm_gpuvm_bo *(*vm_bo_alloc)(void);
+
+	/**
+	 * @vm_bo_free: called when the &drm_gpuvm frees a
+	 * struct drm_gpuvm_bo
+	 *
+	 * Some drivers may want to embed struct drm_gpuvm_bo into driver
+	 * specific structures. By implementing this callback drivers can
+	 * free the previously allocated memory accordingly.
+	 *
+	 * This callback is optional.
+	 */
+	void (*vm_bo_free)(struct drm_gpuvm_bo *vm_bo);
+
 	/**
 	 * @sm_step_map: called from &drm_gpuvm_sm_map to finally insert the
 	 * mapping once all previous steps were completed
-- 
2.41.0

