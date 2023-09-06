Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8182879455A
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 23:48:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F3C910E716;
	Wed,  6 Sep 2023 21:47:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A1FA10E723
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 21:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694036873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NVruo8+WaL18PY/f/PQckwTskKI4OUDG24U8LY+9fDU=;
 b=XIarJo6QbVBBB49af0GIkKjBqty9h2iEWC1uZFemF1MdHXxKSemntFne9WjRHgLXvyLp2Q
 duwaaRHeHPo+79qsAowzBs5jocl5ldrZfxiyK/MEIQ2tUUopyht7jyrfhwZzlWDaQQn4Lf
 B2Ghg6r+u5fmza5PBTPRb6e+0TXxRlU=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-1ggs-cmBOi-OyqzzUMMFug-1; Wed, 06 Sep 2023 17:47:52 -0400
X-MC-Unique: 1ggs-cmBOi-OyqzzUMMFug-1
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-500b95c69c3so222656e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Sep 2023 14:47:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694036871; x=1694641671;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NVruo8+WaL18PY/f/PQckwTskKI4OUDG24U8LY+9fDU=;
 b=ZIx6Xilygl2fqfff/c1YU1txLVp6CqAm4K3uq/oOGAO85Zffr/tlZdI396P0ESN2Pt
 VgAZuLsfccPtX4YiANLF9Mdif5k/01IHXqmNm7x7pZgAnI4LBPL7t1LXzrHy2kZvI6f3
 QuTOX5aI4c4id8WqgreKQr74UEYIh4X50WdTWCrhhF3rrisQrdsANEq3F1z5RYQ9t2jz
 4wegtErfTiGLFMsSoJ9AnS9xi5IsAr2a+9BvdNyVLnI4Iafi1/NYyS7h1BFd93LemTpe
 cguOKvw41VwBtUavkhRKA9Kox1Iag2TqqBFG00E0VanUasg9Rttig4igkFZF/SrP+WKg
 YZcQ==
X-Gm-Message-State: AOJu0YzVqdamPymn78LZrWATBwTZ4KLtkDQ48wutu67VJH8OsEC8hKnx
 hi61G2IIhgVJdA2kqRRpEFAbYZC4GHmicmW5kL8BCHdj8RDktShKegLv0h/bOGUep4NxAjcDUPV
 avWtvCdqJjE+XnwJB7rQPf1PfU80t
X-Received: by 2002:ac2:4c13:0:b0:4f8:e4e9:499e with SMTP id
 t19-20020ac24c13000000b004f8e4e9499emr2967987lfq.12.1694036870757; 
 Wed, 06 Sep 2023 14:47:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsVd5gAa3cnUK5NrtIiKIU3+tQJyk99R/PMq6bCB6Q0TaGBLRvqxzkFAFwpLrDrSn+VJUoVA==
X-Received: by 2002:ac2:4c13:0:b0:4f8:e4e9:499e with SMTP id
 t19-20020ac24c13000000b004f8e4e9499emr2967973lfq.12.1694036870396; 
 Wed, 06 Sep 2023 14:47:50 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 o21-20020a1709062e9500b009a13fdc139fsm9547503eji.183.2023.09.06.14.47.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Sep 2023 14:47:50 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, sarah.walker@imgtec.com,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith.ekstrand@collabora.com
Subject: [PATCH drm-misc-next v2 6/7] drm/gpuvm: generalize dma_resv/extobj
 handling and GEM validation
Date: Wed,  6 Sep 2023 23:47:14 +0200
Message-ID: <20230906214723.4393-7-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230906214723.4393-1-dakr@redhat.com>
References: <20230906214723.4393-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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

So far the DRM GPUVA manager offers common infrastructure to track GPU VA
allocations and mappings, generically connect GPU VA mappings to their
backing buffers and perform more complex mapping operations on the GPU VA
space.

However, there are more design patterns commonly used by drivers, which
can potentially be generalized in order to make the DRM GPUVA manager
represent a basic GPU-VM implementation. In this context, this patch aims
at generalizing the following elements.

1) Provide a common dma-resv for GEM objects not being used outside of
   this GPU-VM.

2) Provide tracking of external GEM objects (GEM objects which are
   shared with other GPU-VMs).

3) Provide functions to efficiently lock all GEM objects dma-resv the
   GPU-VM contains mappings of.

4) Provide tracking of evicted GEM objects the GPU-VM contains mappings
   of, such that validation of evicted GEM objects is accelerated.

5) Provide some convinience functions for common patterns.

Rather than being designed as a "framework", the target is to make all
features appear as a collection of optional helper functions, such that
drivers are free to make use of the DRM GPUVA managers basic
functionality and opt-in for other features without setting any feature
flags, just by making use of the corresponding functions.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/drm_gpuva_mgr.c | 335 +++++++++++++++++++++++++++++++-
 include/drm/drm_gpuva_mgr.h     | 235 +++++++++++++++++++++-
 2 files changed, 564 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuva_mgr.c b/drivers/gpu/drm/drm_gpuva_mgr.c
index da7a6e1aabe0..db4ef4fadc4b 100644
--- a/drivers/gpu/drm/drm_gpuva_mgr.c
+++ b/drivers/gpu/drm/drm_gpuva_mgr.c
@@ -678,6 +678,10 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm, struct drm_device *drm,
 	gpuvm->rb.tree = RB_ROOT_CACHED;
 	INIT_LIST_HEAD(&gpuvm->rb.list);
 
+	INIT_LIST_HEAD(&gpuvm->extobj.list);
+	INIT_LIST_HEAD(&gpuvm->evict.list);
+	spin_lock_init(&gpuvm->evict.lock);
+
 	drm_gpuva_check_overflow(start_offset, range);
 	gpuvm->mm_start = start_offset;
 	gpuvm->mm_range = range;
@@ -719,10 +723,291 @@ drm_gpuvm_destroy(struct drm_gpuvm *gpuvm)
 	WARN(!RB_EMPTY_ROOT(&gpuvm->rb.tree.rb_root),
 	     "GPUVA tree is not empty, potentially leaking memory.\n");
 
+	WARN(!list_empty(&gpuvm->extobj.list), "Extobj list should be empty.\n");
+	WARN(!list_empty(&gpuvm->evict.list), "Evict list should be empty.\n");
+
 	drm_gem_private_object_fini(&gpuvm->d_obj);
 }
 EXPORT_SYMBOL_GPL(drm_gpuvm_destroy);
 
+/**
+ * drm_gpuvm_prepare_objects() - prepare all assoiciated BOs
+ * @gpuvm: the &drm_gpuvm
+ * @exec: the &drm_exec locking context
+ * @num_fences: the amount of &dma_fences to reserve
+ *
+ * Calls drm_exec_prepare_obj() for all &drm_gem_objects the given
+ * &drm_gpuvm contains mappings of.
+ *
+ * Using this function directly, it is the drivers responsibility to call
+ * drm_exec_init() and drm_exec_fini() accordingly.
+ *
+ * Returns: 0 on success, negative error code on failure.
+ */
+int
+drm_gpuvm_prepare_objects(struct drm_gpuvm *gpuvm,
+			  struct drm_exec *exec,
+			  unsigned int num_fences)
+{
+	struct drm_gpuvm_bo *vm_bo;
+	int ret;
+
+	list_for_each_entry(vm_bo, &gpuvm->extobj.list, list.entry.extobj) {
+		struct drm_gem_object *obj = vm_bo->obj;
+
+		ret = drm_exec_prepare_obj(exec, obj, num_fences);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(drm_gpuvm_prepare_objects);
+
+/**
+ * drm_gpuvm_prepare_range() - prepare all BOs mapped within a given range
+ * @gpuvm: the &drm_gpuvm
+ * @exec: the &drm_exec locking context
+ * @addr: the start address within the VA space
+ * @range: the range to iterate within the VA space
+ * @num_fences: the amount of &dma_fences to reserve
+ *
+ * Calls drm_exec_prepare_obj() for all &drm_gem_objects mapped between @addr
+ * and @addr + @range.
+ *
+ * Returns: 0 on success, negative error code on failure.
+ */
+int
+drm_gpuvm_prepare_range(struct drm_gpuvm *gpuvm, struct drm_exec *exec,
+			u64 addr, u64 range, unsigned int num_fences)
+{
+	struct drm_gpuva *va;
+	u64 end = addr + range;
+	int ret;
+
+	drm_gpuvm_for_each_va_range(va, gpuvm, addr, end) {
+		struct drm_gem_object *obj = va->gem.obj;
+
+		ret = drm_exec_prepare_obj(exec, obj, num_fences);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(drm_gpuvm_prepare_range);
+
+/**
+ * drm_gpuvm_exec_lock() - lock all dma-resv of all assoiciated BOs
+ * @vm_exec: the &drm_gpuvm_exec abstraction
+ * @num_fences: the amount of &dma_fences to reserve
+ * @interruptible: sleep interruptible if waiting
+ *
+ * Acquires all dma-resv locks of all &drm_gem_objects the given
+ * &drm_gpuvm contains mappings of.
+ *
+ * Addionally, when calling this function with struct drm_gpuvm_exec::extra
+ * being set the driver receives the given @fn callback to lock additional
+ * dma-resv in the context of the &drm_gpuvm_exec instance. Typically, drivers
+ * would call drm_exec_prepare_obj() from within this callback.
+ *
+ * Returns: 0 on success, negative error code on failure.
+ */
+int
+drm_gpuvm_exec_lock(struct drm_gpuvm_exec *vm_exec,
+		    unsigned int num_fences,
+		    bool interruptible)
+{
+	struct drm_gpuvm *gpuvm = vm_exec->vm;
+	struct drm_exec *exec = &vm_exec->exec;
+	uint32_t flags;
+	int ret;
+
+	flags = interruptible ? DRM_EXEC_INTERRUPTIBLE_WAIT : 0 |
+		DRM_EXEC_IGNORE_DUPLICATES;
+
+	drm_exec_init(exec, flags);
+
+	drm_exec_until_all_locked(exec) {
+		ret = drm_gpuvm_prepare_vm(gpuvm, exec, num_fences);
+		drm_exec_retry_on_contention(exec);
+		if (ret)
+			goto err;
+
+		ret = drm_gpuvm_prepare_objects(gpuvm, exec, num_fences);
+		drm_exec_retry_on_contention(exec);
+		if (ret)
+			goto err;
+
+		if (vm_exec->extra.fn) {
+			ret = vm_exec->extra.fn(vm_exec, num_fences);
+			drm_exec_retry_on_contention(exec);
+			if (ret)
+				goto err;
+		}
+	}
+
+	return 0;
+
+err:
+	drm_exec_fini(exec);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(drm_gpuvm_exec_lock);
+
+static int
+fn_lock_array(struct drm_gpuvm_exec *vm_exec, unsigned int num_fences)
+{
+	struct {
+		struct drm_gem_object **objs;
+		unsigned int num_objs;
+	} *args = vm_exec->extra.priv;
+
+	return drm_exec_prepare_array(&vm_exec->exec, args->objs,
+				      args->num_objs, num_fences);
+}
+
+/**
+ * drm_gpuvm_exec_lock_array() - lock all dma-resv of all assoiciated BOs
+ * @vm_exec: the &drm_gpuvm_exec abstraction
+ * @objs: additional &drm_gem_objects to lock
+ * @num_objs: the number of additional &drm_gem_objects to lock
+ * @num_fences: the amount of &dma_fences to reserve
+ * @interruptible: sleep interruptible if waiting
+ *
+ * Acquires all dma-resv locks of all &drm_gem_objects the given &drm_gpuvm
+ * contains mappings of, plus the ones given through @objs.
+ *
+ * Returns: 0 on success, negative error code on failure.
+ */
+int
+drm_gpuvm_exec_lock_array(struct drm_gpuvm_exec *vm_exec,
+			  struct drm_gem_object **objs,
+			  unsigned int num_objs,
+			  unsigned int num_fences,
+			  bool interruptible)
+{
+	struct {
+		struct drm_gem_object **objs;
+		unsigned int num_objs;
+	} args;
+
+	args.objs = objs;
+	args.num_objs = num_objs;
+
+	vm_exec->extra.fn = fn_lock_array;
+	vm_exec->extra.priv = &args;
+
+	return drm_gpuvm_exec_lock(vm_exec, num_fences, interruptible);
+}
+EXPORT_SYMBOL_GPL(drm_gpuvm_exec_lock_array);
+
+/**
+ * drm_gpuvm_exec_lock_range() - prepare all BOs mapped within a given range
+ * @vm_exec: the &drm_gpuvm_exec abstraction
+ * @addr: the start address within the VA space
+ * @range: the range to iterate within the VA space
+ * @num_fences: the amount of &dma_fences to reserve
+ * @interruptible: sleep interruptible if waiting
+ *
+ * Acquires all dma-resv locks of all &drm_gem_objects mapped between @addr and
+ * @addr + @range.
+ *
+ * Returns: 0 on success, negative error code on failure.
+ */
+int
+drm_gpuvm_exec_lock_range(struct drm_gpuvm_exec *vm_exec,
+			  u64 addr, u64 range,
+			  unsigned int num_fences,
+			  bool interruptible)
+{
+	struct drm_gpuvm *gpuvm = vm_exec->vm;
+	struct drm_exec *exec = &vm_exec->exec;
+	uint32_t flags;
+	int ret;
+
+	flags = interruptible ? DRM_EXEC_INTERRUPTIBLE_WAIT : 0 |
+		DRM_EXEC_IGNORE_DUPLICATES;
+
+	drm_exec_init(exec, flags);
+
+	drm_exec_until_all_locked(exec) {
+		ret = drm_gpuvm_prepare_range(gpuvm, exec, addr, range,
+					      num_fences);
+		drm_exec_retry_on_contention(exec);
+		if (ret)
+			goto err;
+	}
+
+	return ret;
+
+err:
+	drm_exec_fini(exec);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(drm_gpuvm_exec_lock_range);
+
+/**
+ * drm_gpuvm_validate() - validate all BOs marked as evicted
+ * @gpuvm: the &drm_gpuvm to validate evicted BOs
+ *
+ * Calls the &drm_gpuvm_ops.bo_validate callback for all evicted buffer
+ * objects being mapped in the given &drm_gpuvm.
+ *
+ * Returns: 0 on success, negative error code on failure.
+ */
+int
+drm_gpuvm_validate(struct drm_gpuvm *gpuvm)
+{
+	const struct drm_gpuvm_ops *ops = gpuvm->ops;
+	struct drm_gpuvm_bo *vm_bo;
+	int ret;
+
+	if (unlikely(!ops || !ops->bo_validate))
+		return -ENOTSUPP;
+
+	/* At this point we should hold all dma-resv locks of all GEM objects
+	 * associated with this GPU-VM, hence it is safe to walk the list.
+	 */
+	list_for_each_entry(vm_bo, &gpuvm->evict.list, list.entry.evict) {
+		dma_resv_assert_held(vm_bo->obj->resv);
+
+		ret = ops->bo_validate(vm_bo->obj);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(drm_gpuvm_validate);
+
+/**
+ * drm_gpuvm_resv_add_fence - add fence to private and all extobj
+ * dma-resv
+ * @gpuvm: the &drm_gpuvm to add a fence to
+ * @fence: fence to add
+ * @private_usage: private dma-resv usage
+ * @extobj_usage: extobj dma-resv usage
+ */
+void
+drm_gpuvm_resv_add_fence(struct drm_gpuvm *gpuvm,
+			 struct drm_exec *exec,
+			 struct dma_fence *fence,
+			 enum dma_resv_usage private_usage,
+			 enum dma_resv_usage extobj_usage)
+{
+	struct drm_gem_object *obj;
+	unsigned long index;
+
+	drm_exec_for_each_locked_object(exec, index, obj) {
+			dma_resv_assert_held(obj->resv);
+			dma_resv_add_fence(obj->resv, fence,
+					   drm_gpuvm_is_extobj(gpuvm, obj) ?
+					   private_usage : extobj_usage);
+	}
+}
+EXPORT_SYMBOL_GPL(drm_gpuvm_resv_add_fence);
+
 /**
  * drm_gpuvm_bo_create() - create a new instance of struct drm_gpuvm_bo
  * @gpuvm: The &drm_gpuvm the @obj is mapped in.
@@ -754,6 +1039,8 @@ drm_gpuvm_bo_create(struct drm_gpuvm *gpuvm,
 	kref_init(&vm_bo->kref);
 	INIT_LIST_HEAD(&vm_bo->list.gpuva);
 	INIT_LIST_HEAD(&vm_bo->list.entry.gem);
+	INIT_LIST_HEAD(&vm_bo->list.entry.extobj);
+	INIT_LIST_HEAD(&vm_bo->list.entry.evict);
 
 	drm_gem_object_get(obj);
 
@@ -878,6 +1165,46 @@ drm_gpuvm_bo_obtain_prealloc(struct drm_gpuvm *gpuvm,
 }
 EXPORT_SYMBOL_GPL(drm_gpuvm_bo_obtain_prealloc);
 
+/**
+ * drm_gpuvm_bo_evict() - add / remove a &drm_gem_object to / from a
+ * &drm_gpuvms evicted list
+ * @obj: the &drm_gem_object to add or remove
+ * @evict: indicates whether the object is evicted
+ *
+ * Adds a &drm_gem_object to or removes it from all &drm_gpuvms evicted
+ * list containing a mapping of this &drm_gem_object.
+ */
+void
+drm_gpuvm_bo_evict(struct drm_gem_object *obj, bool evict)
+{
+	struct drm_gpuvm_bo *vm_bo;
+
+	/* Required for iterating the GEMs GPUVA GEM list. If no driver specific
+	 * lock has been set, the list is protected with the GEMs dma-resv lock.
+	 */
+	drm_gem_gpuva_assert_lock_held(obj);
+
+	/* Required to protect the GPUVA managers evict list against concurrent
+	 * access through drm_gpuvm_validate(). Concurrent insertions to
+	 * the evict list through different GEM object evictions are protected
+	 * by the GPUVA managers evict lock.
+	 */
+	dma_resv_assert_held(obj->resv);
+
+	drm_gem_for_each_gpuva_gem(vm_bo, obj) {
+		struct drm_gpuvm *gpuvm = vm_bo->vm;
+
+		spin_lock(&gpuvm->evict.lock);
+		if (evict)
+			list_add_tail(&vm_bo->list.entry.evict,
+				      &gpuvm->evict.list);
+		else
+			list_del_init(&vm_bo->list.entry.evict);
+		spin_unlock(&gpuvm->evict.lock);
+	}
+}
+EXPORT_SYMBOL_GPL(drm_gpuvm_bo_evict);
+
 static int
 __drm_gpuva_insert(struct drm_gpuvm *gpuvm,
 		   struct drm_gpuva *va)
@@ -1032,10 +1359,14 @@ drm_gpuva_unlink(struct drm_gpuva *va)
 	list_del_init(&va->gem.entry);
 
 	/* This is the last mapping being unlinked for this GEM object, hence
-	 * also remove the VM_BO from the GEM's gpuva list.
+	 * also remove the VM_BO from the GEM's gpuva list as well as from the
+	 * external and evicted object lists.
 	 */
-	if (list_empty(&vm_bo->list.gpuva))
+	if (list_empty(&vm_bo->list.gpuva)) {
 		list_del_init(&vm_bo->list.entry.gem);
+		list_del_init(&vm_bo->list.entry.extobj);
+		list_del_init(&vm_bo->list.entry.evict);
+	}
 	drm_gpuvm_bo_put(vm_bo);
 }
 EXPORT_SYMBOL_GPL(drm_gpuva_unlink);
diff --git a/include/drm/drm_gpuva_mgr.h b/include/drm/drm_gpuva_mgr.h
index f8f29c1c858d..805982370be7 100644
--- a/include/drm/drm_gpuva_mgr.h
+++ b/include/drm/drm_gpuva_mgr.h
@@ -26,10 +26,12 @@
  */
 
 #include <linux/list.h>
+#include <linux/dma-resv.h>
 #include <linux/rbtree.h>
 #include <linux/types.h>
 
 #include <drm/drm_gem.h>
+#include <drm/drm_exec.h>
 
 struct drm_gpuvm;
 struct drm_gpuvm_bo;
@@ -253,6 +255,34 @@ struct drm_gpuvm {
 	 * space
 	 */
 	struct dma_resv *resv;
+
+	/**
+	 * @extobj: structure holding the extobj list
+	 */
+	struct {
+		/**
+		 * @list: &list_head storing &drm_gpuvm_bos serving as
+		 * external object
+		 */
+		struct list_head list;
+	} extobj;
+
+	/**
+	 * @evict: structure holding the evict list and evict list lock
+	 */
+	struct {
+		/**
+		 * @list: &list_head storing &drm_gpuvm_bos currently being
+		 * evicted
+		 */
+		struct list_head list;
+
+		/**
+		 * @lock: spinlock to protect the evict list against concurrent
+		 * insertion / removal of different &drm_gpuvm_bos
+		 */
+		spinlock_t lock;
+	} evict;
 };
 
 void drm_gpuvm_init(struct drm_gpuvm *gpuvm, struct drm_device *drm,
@@ -262,6 +292,21 @@ void drm_gpuvm_init(struct drm_gpuvm *gpuvm, struct drm_device *drm,
 		    const struct drm_gpuvm_ops *ops);
 void drm_gpuvm_destroy(struct drm_gpuvm *gpuvm);
 
+/**
+ * drm_gpuvm_is_extobj() - indicates whether the given &drm_gem_object is an
+ * external object
+ * @gpuvm: the &drm_gpuvm to check
+ * @obj: the &drm_gem_object to check
+ *
+ * Returns: true if the &drm_gem_object &dma_resv differs from the
+ * &drm_gpuvms &dma_resv, false otherwise
+ */
+static inline bool drm_gpuvm_is_extobj(struct drm_gpuvm *gpuvm,
+				       struct drm_gem_object *obj)
+{
+	return obj && obj->resv != gpuvm->resv;
+}
+
 static inline struct drm_gpuva *
 __drm_gpuva_next(struct drm_gpuva *va)
 {
@@ -340,6 +385,128 @@ __drm_gpuva_next(struct drm_gpuva *va)
 #define drm_gpuvm_for_each_va_safe(va__, next__, gpuvm__) \
 	list_for_each_entry_safe(va__, next__, &(gpuvm__)->rb.list, rb.entry)
 
+/**
+ * struct drm_gpuvm_exec - &drm_gpuvm abstraction of &drm_exec
+ *
+ * This structure should be created on the stack as &drm_exec should be.
+ *
+ * Optionally, @extra can be set in order to lock additional &drm_gem_objects.
+ */
+struct drm_gpuvm_exec {
+	/**
+	 * @exec: the &drm_exec structure
+	 */
+	struct drm_exec exec;
+
+	/**
+	 * @vm: the &drm_gpuvm to lock its DMA reservations
+	 */
+	struct drm_gpuvm *vm;
+
+	/**
+	 * @extra: Callback and corresponding private data for the driver to
+	 * lock arbitrary additional &drm_gem_objects.
+	 */
+	struct {
+		/**
+		 * @fn: The driver callback to lock additional &drm_gem_objects.
+		 */
+		int (*fn)(struct drm_gpuvm_exec *vm_exec,
+			  unsigned int num_fences);
+
+		/**
+		 * @priv: driver private data for the @fn callback
+		 */
+		void *priv;
+	} extra;
+};
+
+/**
+ * drm_gpuvm_prepare_vm() - prepare the GPUVMs common dma-resv
+ * @gpuvm: the &drm_gpuvm
+ * @exec: the &drm_exec context
+ * @num_fences: the amount of &dma_fences to reserve
+ *
+ * Calls drm_exec_prepare_obj() for the GPUVMs dummy &drm_gem_object.
+ *
+ * Using this function directly, it is the drivers responsibility to call
+ * drm_exec_init() and drm_exec_fini() accordingly.
+ *
+ * Returns: 0 on success, negative error code on failure.
+ */
+static inline int
+drm_gpuvm_prepare_vm(struct drm_gpuvm *gpuvm,
+		     struct drm_exec *exec,
+		     unsigned int num_fences)
+{
+	return drm_exec_prepare_obj(exec, &gpuvm->d_obj, num_fences);
+}
+
+int drm_gpuvm_prepare_objects(struct drm_gpuvm *gpuvm,
+			      struct drm_exec *exec,
+			      unsigned int num_fences);
+
+int drm_gpuvm_prepare_range(struct drm_gpuvm *gpuvm,
+			    struct drm_exec *exec,
+			    u64 addr, u64 range,
+			    unsigned int num_fences);
+
+int drm_gpuvm_exec_lock(struct drm_gpuvm_exec *vm_exec,
+			unsigned int num_fences,
+			bool interruptible);
+
+int drm_gpuvm_exec_lock_array(struct drm_gpuvm_exec *vm_exec,
+			      struct drm_gem_object **objs,
+			      unsigned int num_objs,
+			      unsigned int num_fences,
+			      bool interruptible);
+
+int drm_gpuvm_exec_lock_range(struct drm_gpuvm_exec *vm_exec,
+			      u64 addr, u64 range,
+			      unsigned int num_fences,
+			      bool interruptible);
+
+/**
+ * drm_gpuvm_lock() - lock all dma-resv of all assoiciated BOs
+ * @gpuvm: the &drm_gpuvm
+ *
+ * Releases all dma-resv locks of all &drm_gem_objects previously acquired
+ * through drm_gpuvm_lock() or its variants.
+ *
+ * Returns: 0 on success, negative error code on failure.
+ */
+static inline void
+drm_gpuvm_exec_unlock(struct drm_gpuvm_exec *vm_exec)
+{
+	drm_exec_fini(&vm_exec->exec);
+}
+
+int drm_gpuvm_validate(struct drm_gpuvm *gpuvm);
+void drm_gpuvm_resv_add_fence(struct drm_gpuvm *gpuvm,
+			      struct drm_exec *exec,
+			      struct dma_fence *fence,
+			      enum dma_resv_usage private_usage,
+			      enum dma_resv_usage extobj_usage);
+
+/**
+ * drm_gpuvm_exec_resv_add_fence()
+ * @vm_exec: the &drm_gpuvm_exec abstraction
+ * @fence: fence to add
+ * @private_usage: private dma-resv usage
+ * @extobj_usage: extobj dma-resv usage
+ *
+ * See drm_gpuvm_resv_add_fence().
+ */
+static inline void
+drm_gpuvm_exec_resv_add_fence(struct drm_gpuvm_exec *vm_exec,
+			      struct dma_fence *fence,
+			      enum dma_resv_usage private_usage,
+			      enum dma_resv_usage extobj_usage)
+{
+	drm_gpuvm_resv_add_fence(vm_exec->vm, &vm_exec->exec, fence,
+				 private_usage, extobj_usage);
+}
+
 /**
  * struct drm_gpuvm_bo - structure representing a &drm_gpuvm and
  * &drm_gem_object combination
@@ -392,6 +559,18 @@ struct drm_gpuvm_bo {
 			 * gpuva list.
 			 */
 			struct list_head gem;
+
+			/**
+			 * @evict: List entry to attach to the &drm_gpuvms
+			 * extobj list.
+			 */
+			struct list_head extobj;
+
+			/**
+			 * @evict: List entry to attach to the &drm_gpuvms evict
+			 * list.
+			 */
+			struct list_head evict;
 		} entry;
 	} list;
 };
@@ -404,15 +583,52 @@ drm_gpuvm_bo_obtain_prealloc(struct drm_gpuvm *gpuvm,
 			      struct drm_gem_object *obj,
 			      struct drm_gpuvm_bo *__vm_bo);
 
-struct drm_gpuvm_bo *
-drm_gpuvm_bo_find(struct drm_gpuvm *gpuvm,
-		  struct drm_gem_object *obj);
-
 struct drm_gpuvm_bo *
 drm_gpuvm_bo_create(struct drm_gpuvm *gpuvm,
 		    struct drm_gem_object *obj);
 void drm_gpuvm_bo_destroy(struct kref *kref);
 
+struct drm_gpuvm_bo *
+drm_gpuvm_bo_find(struct drm_gpuvm *gpuvm,
+		  struct drm_gem_object *obj);
+
+void drm_gpuvm_bo_evict(struct drm_gem_object *obj, bool evict);
+
+/**
+ * drm_gpuvm_bo_extobj_add() - adds the &drm_gpuvm_bo to its &drm_gpuvm's
+ * extobj list
+ * @vm_bo: The &drm_gpuvm_bo to add to its &drm_gpuvm's the extobj list.
+ *
+ * Adds the given @vm_bo to its &drm_gpuvm's extobj list if not on the list
+ * already and if the corresponding &drm_gem_object is an external object,
+ * actually.
+ */
+static inline void
+drm_gpuvm_bo_extobj_add(struct drm_gpuvm_bo *vm_bo)
+{
+	struct drm_gpuvm *gpuvm = vm_bo->vm;
+
+	if (drm_gpuvm_is_extobj(gpuvm, vm_bo->obj) &&
+	    list_empty(&vm_bo->list.entry.extobj))
+		list_add_tail(&vm_bo->list.entry.extobj, &gpuvm->extobj.list);
+}
+
+/**
+ * drm_gpuvm_bo_extobj_remove() - removes the &drm_gpuvm_bo from its
+ * &drm_gpuvm's extobj list
+ * @vm_bo: The &drm_gpuvm_bo to remove from its &drm_gpuvm's the extobj list.
+ *
+ * Removes the given @vm_bo from its &drm_gpuvm's extobj list. Drivers should
+ * only call that from an unwind path. Typically the extobj is removed from the
+ * extobj list through drm_gpuva_unlink().
+ */
+static inline void
+drm_gpuvm_bo_extobj_remove(struct drm_gpuvm_bo *vm_bo)
+{
+	if (likely(!list_empty(&vm_bo->list.entry.extobj)))
+		list_del(&vm_bo->list.entry.extobj);
+}
+
 /**
  * drm_gpuvm_bo_get() - acquire a struct drm_gpuvm_bo reference
  * @vm_bo: the &drm_gpuvm_bo to acquire the reference of
@@ -845,6 +1061,17 @@ struct drm_gpuvm_ops {
 	 * used.
 	 */
 	int (*sm_step_unmap)(struct drm_gpuva_op *op, void *priv);
+
+	/**
+	 * @bo_validate: called from drm_gpuvm_validate()
+	 *
+	 * Drivers receive this callback for every evicted &drm_gem_object being
+	 * mapped in the corresponding &drm_gpuvm.
+	 *
+	 * Typically, drivers would call their driver specific variant of
+	 * ttm_bo_validate() from within this callback.
+	 */
+	int (*bo_validate)(struct drm_gem_object *obj);
 };
 
 int drm_gpuva_sm_map(struct drm_gpuvm *gpuvm, void *priv,
-- 
2.41.0

