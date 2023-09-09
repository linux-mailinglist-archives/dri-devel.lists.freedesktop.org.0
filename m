Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EAD799958
	for <lists+dri-devel@lfdr.de>; Sat,  9 Sep 2023 17:32:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A296210E173;
	Sat,  9 Sep 2023 15:32:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19DE610E1D7
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Sep 2023 15:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694273517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V00ZwrtbgHJ0FDC4W8l6/5KP8LNMj8JHTg7TalAfk6U=;
 b=OYmIX3x4wRnGNr3T+p+RCrL2pgCQyiSl4unNMCmK3qnCQjtFAALRmD5nCyRZA+89tyuJSv
 e6O+plN6jpARVJzM9Ut4P4QmvKpuwWQ3rsR0avp/H4cXR+w+wbzc8RzrtINuGL/3pnSSZs
 NtKTR9RgjJx1jkDoYMMTf5GNXPMmP7g=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-330-FZI3b08JMQaAHwQZ_u-Utg-1; Sat, 09 Sep 2023 11:31:55 -0400
X-MC-Unique: FZI3b08JMQaAHwQZ_u-Utg-1
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-500777449e5so3407956e87.2
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Sep 2023 08:31:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694273514; x=1694878314;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V00ZwrtbgHJ0FDC4W8l6/5KP8LNMj8JHTg7TalAfk6U=;
 b=xHvkbKEzyoa/JaV0YeKoOJwoiWeoGtY7hGj9GdSh54b9HBJeP4C+O5PO9/+huNejgK
 gRcRpVbv2Gn6KUBD2JSgaogH3trIoC4Ch5/ZB+HcseQ/rlS0QBUnDpsIFiqGQZdzJhED
 +OtaD4foVU7IMoYVo3XsgBhcsR1JxfPzEJF2I75K1fucuQ+9AFvoN7nYPnqrOsS/cHkV
 +GkH2XL0q2Ua8MMzeTexkdgsIJ5V+JGl8ccpB0HVqKzBbv7fC63vMQYcNpeAhu9KhC2j
 KDT9NY28szGWCTgYBzbWuACfmByZTVYIIZpyuNCP/hEiK351zg/GBVNCIiEstuY7Si7j
 5Rsg==
X-Gm-Message-State: AOJu0Ywh7IbOn7aGqPCotxNp1Vxlz3dn869nenXR+lCKGt5PuOAwIi+/
 Rhak2TuKzqjzmu3JKclTYLM2OFBYvxjgm4JWOs50uQFcLRUn3qr5uKazp4DZ/xZxYI+7SuVgaXM
 12CL4M8z+4YbFbBw9UaFNLyuIZvSZdAOFShff
X-Received: by 2002:a05:6512:2355:b0:500:7c2a:30da with SMTP id
 p21-20020a056512235500b005007c2a30damr4524162lfu.60.1694273513526; 
 Sat, 09 Sep 2023 08:31:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/abKgUcjV6QIM//ysw9x5BJGG8XYct6q+DCwJfJVsem+034Kct3sylaenAmUQDF3bT00jFg==
X-Received: by 2002:a05:6512:2355:b0:500:7c2a:30da with SMTP id
 p21-20020a056512235500b005007c2a30damr4524147lfu.60.1694273513089; 
 Sat, 09 Sep 2023 08:31:53 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 p19-20020a170906785300b009887f4e0291sm2471126ejm.27.2023.09.09.08.31.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Sep 2023 08:31:52 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, sarah.walker@imgtec.com,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith.ekstrand@collabora.com
Subject: [PATCH drm-misc-next v3 6/7] drm/gpuvm: generalize dma_resv/extobj
 handling and GEM validation
Date: Sat,  9 Sep 2023 17:31:13 +0200
Message-ID: <20230909153125.30032-7-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230909153125.30032-1-dakr@redhat.com>
References: <20230909153125.30032-1-dakr@redhat.com>
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

Big kudos to Boris Brezillon for his help to figure out locking for drivers
updating the GPU VA space within the fence signalling path.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/drm_gpuvm.c | 516 ++++++++++++++++++++++++++++++++++++
 include/drm/drm_gpuvm.h     | 197 ++++++++++++++
 2 files changed, 713 insertions(+)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index f4411047dbb3..8e62a043f719 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -73,6 +73,21 @@
  * &drm_gem_object list of &drm_gpuvm_bos for an existing instance of this
  * particular combination. If not existent a new instance is created and linked
  * to the &drm_gem_object.
+ *
+ * &drm_gpuvm_bo structures, since unique for a given &drm_gpuvm, are also used
+ * as entry for the &drm_gpuvm's lists of external and evicted objects. Those
+ * list are maintained in order to accelerate locking of dma-resv locks and
+ * validation of evicted objects bound in a &drm_gpuvm. For instance the all
+ * &drm_gem_object's &dma_resv of a given &drm_gpuvm can be locked by calling
+ * drm_gpuvm_exec_lock(). Once locked drivers can call drm_gpuvm_validate() in
+ * order to validate all evicted &drm_gem_objects. It is also possible to lock
+ * additional &drm_gem_objects by providing the corresponding parameters to
+ * drm_gpuvm_exec_lock() as well as open code the &drm_exec loop while making
+ * use of helper functions such as drm_gpuvm_prepare_range() or
+ * drm_gpuvm_prepare_objects().
+ *
+ * Every bound &drm_gem_object is treated as external object when its &dma_resv
+ * structure is different than the &drm_gpuvm's common &dma_resv structure.
  */
 
 /**
@@ -420,6 +435,20 @@
  * Subsequent calls to drm_gpuvm_bo_obtain() for the same &drm_gpuvm and
  * &drm_gem_object must be able to observe previous creations and destructions
  * of &drm_gpuvm_bos in order to keep instances unique.
+ *
+ * The &drm_gpuvm's lists for keeping track of external and evicted objects are
+ * protected against concurrent insertion / removal and iteration internally.
+ *
+ * However, drivers still need ensure to protect concurrent calls to functions
+ * iterating those lists, such as drm_gpuvm_validate() and
+ * drm_gpuvm_prepare_objects(). Every such function contains a particular
+ * comment and lockdep checks if possible.
+ *
+ * Functions adding or removing entries from those lists, such as
+ * drm_gpuvm_bo_evict() or drm_gpuvm_bo_extobj_add() may be called with external
+ * locks being held, e.g. in order to avoid the corresponding list to be
+ * (safely) modified while potentially being iternated by other API functions.
+ * However, this is entirely optional.
  */
 
 /**
@@ -632,6 +661,131 @@
  *	}
  */
 
+/**
+ * get_next_vm_bo_from_list() - get the next vm_bo element
+ * @__gpuvm: The GPU VM
+ * @__list_name: The name of the list we're iterating on
+ * @__local_list: A pointer to the local list used to store already iterated items
+ * @__prev_vm_bo: The previous element we got from drm_gpuvm_get_next_cached_vm_bo()
+ *
+ * This helper is here to provide lockless list iteration. Lockless as in, the
+ * iterator releases the lock immediately after picking the first element from
+ * the list, so list insertion deletion can happen concurrently.
+ *
+ * Elements popped from the original list are kept in a local list, so removal
+ * and is_empty checks can still happen while we're iterating the list.
+ */
+#define get_next_vm_bo_from_list(__gpuvm, __list_name, __local_list, __prev_vm_bo)	\
+	({										\
+		struct drm_gpuvm_bo *__vm_bo;						\
+											\
+		drm_gpuvm_bo_put(__prev_vm_bo);						\
+											\
+		spin_lock(&(__gpuvm)->__list_name.lock);				\
+		while (!list_empty(&(__gpuvm)->__list_name.list)) {			\
+			__vm_bo = list_first_entry(&(__gpuvm)->__list_name.list,	\
+						   struct drm_gpuvm_bo,			\
+						   list.entry.__list_name);		\
+			if (drm_gpuvm_bo_get_unless_zero(__vm_bo)) {			\
+				list_move_tail(&(__vm_bo)->list.entry.__list_name,	\
+					       __local_list);				\
+				break;							\
+			} else {							\
+				list_del_init(&(__vm_bo)->list.entry.__list_name);	\
+				__vm_bo = NULL;						\
+			}								\
+		}									\
+		spin_unlock(&(__gpuvm)->__list_name.lock);				\
+											\
+		__vm_bo;								\
+	})
+
+/**
+ * for_each_vm_bo_in_list() - internal vm_bo list iterator
+ *
+ * This helper is here to provide lockless list iteration. Lockless as in, the
+ * iterator releases the lock immediately after picking the first element from the
+ * list, so list insertion and deletion can happen concurrently.
+ *
+ * Typical use:
+ *
+ *	struct drm_gpuvm_bo *vm_bo;
+ *	LIST_HEAD(my_local_list);
+ *
+ *	ret = 0;
+ *	drm_gpuvm_for_each_vm_bo(gpuvm, <list_name>, &my_local_list, vm_bo) {
+ *		ret = do_something_with_vm_bo(..., vm_bo);
+ *		if (ret)
+ *			break;
+ *	}
+ *	drm_gpuvm_bo_put(vm_bo);
+ *	drm_gpuvm_restore_vm_bo_list(gpuvm, <list_name>, &my_local_list);
+ *
+ *
+ * Only used for internal list iterations, not meant to be exposed to the outside
+ * world.
+ */
+#define for_each_vm_bo_in_list(__gpuvm, __list_name, __local_list, __vm_bo)	\
+	for (__vm_bo = get_next_vm_bo_from_list(__gpuvm, __list_name,		\
+						__local_list, NULL);		\
+	     __vm_bo;								\
+	     __vm_bo = get_next_vm_bo_from_list(__gpuvm, __list_name,		\
+						__local_list, __vm_bo))		\
+
+/**
+ * restore_vm_bo_list() - move vm_bo elements back to their original list
+ * @__gpuvm: The GPU VM
+ * @__list_name: The name of the list we're iterating on
+ * @__local_list: A pointer to the local list used to store already iterated items
+ *
+ * When we're done iterating a vm_bo list, we should call restore_vm_bo_list()
+ * to restore the original state and let new iterations take place.
+ */
+#define restore_vm_bo_list(__gpuvm, __list_name, __local_list)				\
+	do {										\
+		/* Merge back the two lists, moving local list elements to the		\
+		 * head to preserve previous ordering, in case it matters.		\
+		 */									\
+		spin_lock(&(__gpuvm)->__list_name.lock);				\
+		list_splice(__local_list, &(__gpuvm)->__list_name.list);		\
+		spin_unlock(&(__gpuvm)->__list_name.lock);				\
+	} while (0)
+/**
+ * drm_gpuvm_bo_list_add() - insert a vm_bo into the given list
+ * @__vm_bo: the &drm_gpuvm_bo
+ * @__list_name: the name of the list to insert into
+ *
+ * Inserts the given @__vm_bo into the list specified by @__list_name and
+ * increases the vm_bo's reference count.
+ */
+#define drm_gpuvm_bo_list_add(__vm_bo, __list_name)				\
+	do {									\
+		spin_lock(&(__vm_bo)->vm->__list_name.lock);			\
+		if (list_empty(&(__vm_bo)->list.entry.__list_name))		\
+			list_add_tail(&(__vm_bo)->list.entry.__list_name,	\
+				      &(__vm_bo)->vm->__list_name.list);	\
+		spin_unlock(&(__vm_bo)->vm->__list_name.lock);			\
+	} while (0)
+
+/**
+ * drm_gpuvm_bo_list_del() - remove a vm_bo from the given list
+ * @__vm_bo: the &drm_gpuvm_bo
+ * @__list_name: the name of the list to insert into
+ *
+ * Removes the given @__vm_bo from the list specified by @__list_name and
+ * decreases the vm_bo's reference count.
+ */
+#define drm_gpuvm_bo_list_del(__vm_bo, __list_name)				\
+	do {									\
+		spin_lock(&(__vm_bo)->vm->__list_name.lock);			\
+		if (!list_empty(&(__vm_bo)->list.entry.__list_name))		\
+			list_del_init(&(__vm_bo)->list.entry.__list_name);	\
+		spin_unlock(&(__vm_bo)->vm->__list_name.lock);			\
+	} while (0)
+
+static int __must_check
+drm_gpuvm_bo_get_unless_zero(struct drm_gpuvm_bo *vm_bo);
+
 #define to_drm_gpuva(__node)	container_of((__node), struct drm_gpuva, rb.node)
 
 #define GPUVA_START(node) ((node)->va.addr)
@@ -713,6 +867,12 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm, struct drm_device *drm,
 	gpuvm->rb.tree = RB_ROOT_CACHED;
 	INIT_LIST_HEAD(&gpuvm->rb.list);
 
+	INIT_LIST_HEAD(&gpuvm->extobj.list);
+	spin_lock_init(&gpuvm->extobj.lock);
+
+	INIT_LIST_HEAD(&gpuvm->evict.list);
+	spin_lock_init(&gpuvm->evict.lock);
+
 	drm_gpuva_check_overflow(start_offset, range);
 	gpuvm->mm_start = start_offset;
 	gpuvm->mm_range = range;
@@ -754,10 +914,302 @@ drm_gpuvm_destroy(struct drm_gpuvm *gpuvm)
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
+ * Note: This function is safe against concurrent insertion and removal of
+ * external objects, however it is not safe against concurrent usage itself.
+ *
+ * Drivers need to make sure to protect this case with either an outer VM lock
+ * or by calling drm_gpuvm_prepare_vm() before this function within the
+ * drm_exec_until_all_locked() loop, such that the GPUVM's dma-resv lock ensures
+ * mutual exclusion.
+ *
+ * Returns: 0 on success, negative error code on failure.
+ */
+int
+drm_gpuvm_prepare_objects(struct drm_gpuvm *gpuvm,
+			  struct drm_exec *exec,
+			  unsigned int num_fences)
+{
+	struct drm_gpuvm_bo *vm_bo;
+	LIST_HEAD(extobjs);
+	int ret = 0;
+
+	for_each_vm_bo_in_list(gpuvm, extobj, &extobjs, vm_bo) {
+		ret = drm_exec_prepare_obj(exec, vm_bo->obj, num_fences);
+		if (ret)
+			break;
+	}
+	/* Drop ref in case we break out of the loop. */
+	drm_gpuvm_bo_put(vm_bo);
+	restore_vm_bo_list(gpuvm, extobj, &extobjs);
+
+	return ret;
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
+	LIST_HEAD(evict);
+	int ret = 0;
+
+	if (unlikely(!ops || !ops->bo_validate))
+		return -ENOTSUPP;
+
+	for_each_vm_bo_in_list(gpuvm, evict, &evict, vm_bo) {
+		dma_resv_assert_held(vm_bo->obj->resv);
+		ret = ops->bo_validate(vm_bo->obj);
+		if (ret)
+			break;
+	}
+	/* Drop ref in case we break out of the loop. */
+	drm_gpuvm_bo_put(vm_bo);
+	restore_vm_bo_list(gpuvm, evict, &evict);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(drm_gpuvm_validate);
+
+/**
+ * drm_gpuvm_resv_add_fence - add fence to private and all extobj
+ * dma-resv
+ * @gpuvm: the &drm_gpuvm to add a fence to
+ * @exec: the &drm_exec locking context
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
+		dma_resv_assert_held(obj->resv);
+		dma_resv_add_fence(obj->resv, fence,
+				   drm_gpuvm_is_extobj(gpuvm, obj) ?
+				   private_usage : extobj_usage);
+	}
+}
+EXPORT_SYMBOL_GPL(drm_gpuvm_resv_add_fence);
+
 /**
  * drm_gpuvm_bo_create() - create a new instance of struct drm_gpuvm_bo
  * @gpuvm: The &drm_gpuvm the @obj is mapped in.
@@ -790,6 +1242,9 @@ drm_gpuvm_bo_create(struct drm_gpuvm *gpuvm,
 	INIT_LIST_HEAD(&vm_bo->list.gpuva);
 	INIT_LIST_HEAD(&vm_bo->list.entry.gem);
 
+	INIT_LIST_HEAD(&vm_bo->list.entry.extobj);
+	INIT_LIST_HEAD(&vm_bo->list.entry.evict);
+
 	drm_gem_object_get(obj);
 
 	return vm_bo;
@@ -807,6 +1262,14 @@ drm_gpuvm_bo_destroy(struct kref *kref)
 
 	drm_gem_gpuva_assert_lock_held(vm_bo->obj);
 
+	spin_lock(&gpuvm->extobj.lock);
+	list_del(&vm_bo->list.entry.extobj);
+	spin_unlock(&gpuvm->extobj.lock);
+
+	spin_lock(&gpuvm->evict.lock);
+	list_del(&vm_bo->list.entry.evict);
+	spin_unlock(&gpuvm->evict.lock);
+
 	list_del(&vm_bo->list.entry.gem);
 
 	drm_gem_object_put(obj);
@@ -822,6 +1285,11 @@ drm_gpuvm_bo_destroy(struct kref *kref)
  * @vm_bo: the &drm_gpuvm_bo to release the reference of
  *
  * This releases a reference to @vm_bo.
+ *
+ * If the reference count drops to zero, the &gpuvm_bo is destroyed, which
+ * includes removing it from the GEMs gpuva list. Hence, if a call to this
+ * function can potentially let the reference count to zero the caller must
+ * hold the dma-resv or driver specific GEM gpuva lock.
  */
 void
 drm_gpuvm_bo_put(struct drm_gpuvm_bo *vm_bo)
@@ -831,6 +1299,12 @@ drm_gpuvm_bo_put(struct drm_gpuvm_bo *vm_bo)
 }
 EXPORT_SYMBOL_GPL(drm_gpuvm_bo_put);
 
+static int __must_check
+drm_gpuvm_bo_get_unless_zero(struct drm_gpuvm_bo *vm_bo)
+{
+	return kref_get_unless_zero(&vm_bo->kref);
+}
+
 static struct drm_gpuvm_bo *
 __drm_gpuvm_bo_find(struct drm_gpuvm *gpuvm,
 		    struct drm_gem_object *obj)
@@ -938,6 +1412,48 @@ drm_gpuvm_bo_obtain_prealloc(struct drm_gpuvm_bo *__vm_bo)
 }
 EXPORT_SYMBOL_GPL(drm_gpuvm_bo_obtain_prealloc);
 
+/**
+ * drm_gpuvm_bo_extobj_add() - adds the &drm_gpuvm_bo to its &drm_gpuvm's
+ * extobj list
+ * @vm_bo: The &drm_gpuvm_bo to add to its &drm_gpuvm's the extobj list.
+ *
+ * Adds the given @vm_bo to its &drm_gpuvm's extobj list if not on the list
+ * already and if the corresponding &drm_gem_object is an external object,
+ * actually.
+ */
+void
+drm_gpuvm_bo_extobj_add(struct drm_gpuvm_bo *vm_bo)
+{
+	struct drm_gpuvm *gpuvm = vm_bo->vm;
+
+	if (drm_gpuvm_is_extobj(gpuvm, vm_bo->obj))
+		drm_gpuvm_bo_list_add(vm_bo, extobj);
+}
+EXPORT_SYMBOL_GPL(drm_gpuvm_bo_extobj_add);
+
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
+	drm_gem_for_each_gpuvm_bo(vm_bo, obj) {
+		if (evict)
+			drm_gpuvm_bo_list_add(vm_bo, evict);
+		else
+			drm_gpuvm_bo_list_del(vm_bo, evict);
+	}
+}
+EXPORT_SYMBOL_GPL(drm_gpuvm_bo_evict);
+
 static int
 __drm_gpuva_insert(struct drm_gpuvm *gpuvm,
 		   struct drm_gpuva *va)
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index afa50b9059a2..834bb6d6617e 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
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
@@ -259,6 +261,38 @@ struct drm_gpuvm {
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
+
+		/**
+		 * @lock: spinlock to protect the extobj list
+		 */
+		spinlock_t lock;
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
+		 * @lock: spinlock to protect the evict list
+		 */
+		spinlock_t lock;
+	} evict;
 };
 
 void drm_gpuvm_init(struct drm_gpuvm *gpuvm, struct drm_device *drm,
@@ -268,6 +302,21 @@ void drm_gpuvm_init(struct drm_gpuvm *gpuvm, struct drm_device *drm,
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
@@ -346,6 +395,128 @@ __drm_gpuva_next(struct drm_gpuva *va)
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
@@ -398,6 +569,18 @@ struct drm_gpuvm_bo {
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
@@ -432,6 +615,9 @@ struct drm_gpuvm_bo *
 drm_gpuvm_bo_find(struct drm_gpuvm *gpuvm,
 		  struct drm_gem_object *obj);
 
+void drm_gpuvm_bo_evict(struct drm_gem_object *obj, bool evict);
+void drm_gpuvm_bo_extobj_add(struct drm_gpuvm_bo *vm_bo);
+
 /**
  * drm_gpuvm_bo_for_each_va() - iterator to walk over a list of &drm_gpuva
  * @va__: &drm_gpuva structure to assign to in each iteration step
@@ -837,6 +1023,17 @@ struct drm_gpuvm_ops {
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
 
 int drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm, void *priv,
-- 
2.41.0

