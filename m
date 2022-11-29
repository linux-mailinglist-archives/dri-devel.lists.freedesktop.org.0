Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6840263BAC0
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 08:29:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D2B710E38E;
	Tue, 29 Nov 2022 07:29:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A06E210E37C;
 Tue, 29 Nov 2022 07:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669706809; x=1701242809;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=U3Pmno8MwAj6RcGJY6OORDcSspf5nmrR0ODH5qYIn0U=;
 b=eFzBO0BIZd2UVdYubLy7Oxv2bsBrjxc0ft+2Mf4oMAkOmRTIC5t7mFFd
 86F5giWHisWZ04SuW8A2oK2ZD1CIE7n0fRog9Ys3VWrOd/ZWRawkTTUTu
 rme/lu/JGF4WwAqZXjHPZqr1a1vZBW/82rUj2tcilgqtfdHejVs6+cudz
 YgCD2LMmKBe5lasNE2YxaUwV6WBVLYd5WuQS0Tqpy8H7OtjFN6NVQjqJj
 zeLfxi9F3Ywvz3gzy1fNefQH3XKR4i+rvmZK+Kfmng66YCYhjKKeEPvJN
 5TylYPAx44MxVIu1ncEXf8n+8Y14+by+h/ZdkobEXaeSUFreTulNAZkyv A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="295418397"
X-IronPort-AV: E=Sophos;i="5.96,202,1665471600"; d="scan'208";a="295418397"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2022 23:26:48 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="674525620"
X-IronPort-AV: E=Sophos;i="5.96,202,1665471600"; d="scan'208";a="674525620"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2022 23:26:48 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v8 22/22] drm/i915/vm_bind: Support capture of persistent
 mappings
Date: Mon, 28 Nov 2022 23:26:35 -0800
Message-Id: <20221129072635.847-23-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20221129072635.847-1-niranjana.vishwanathapura@intel.com>
References: <20221129072635.847-1-niranjana.vishwanathapura@intel.com>
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
Cc: matthew.brost@intel.com, paulo.r.zanoni@intel.com, tvrtko.ursulin@intel.com,
 jani.nikula@intel.com, lionel.g.landwerlin@intel.com,
 thomas.hellstrom@intel.com, matthew.auld@intel.com, jason@jlekstrand.net,
 andi.shyti@linux.intel.com, daniel.vetter@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Support dump capture of persistent mappings upon user request.

Signed-off-by: Brian Welty <brian.welty@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 .../drm/i915/gem/i915_gem_vm_bind_object.c    | 11 +++++++++++
 drivers/gpu/drm/i915/gt/intel_gtt.c           |  3 +++
 drivers/gpu/drm/i915/gt/intel_gtt.h           |  5 +++++
 drivers/gpu/drm/i915/i915_gpu_error.c         | 19 +++++++++++++++++++
 drivers/gpu/drm/i915/i915_vma.c               |  1 +
 drivers/gpu/drm/i915/i915_vma_types.h         |  2 ++
 include/uapi/drm/i915_drm.h                   |  3 ++-
 7 files changed, 43 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
index 78e7c0642c5f..50969613daf6 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
@@ -88,6 +88,11 @@ static void i915_gem_vm_bind_remove(struct i915_vma *vma, bool release_obj)
 {
 	lockdep_assert_held(&vma->vm->vm_bind_lock);
 
+	spin_lock(&vma->vm->vm_capture_lock);
+	if (!list_empty(&vma->vm_capture_link))
+		list_del_init(&vma->vm_capture_link);
+	spin_unlock(&vma->vm->vm_capture_lock);
+
 	spin_lock(&vma->vm->vm_rebind_lock);
 	if (!list_empty(&vma->vm_rebind_link))
 		list_del_init(&vma->vm_rebind_link);
@@ -357,6 +362,12 @@ static int i915_gem_vm_bind_obj(struct i915_address_space *vm,
 				continue;
 		}
 
+		if (va->flags & I915_GEM_VM_BIND_CAPTURE) {
+			spin_lock(&vm->vm_capture_lock);
+			list_add_tail(&vma->vm_capture_link, &vm->vm_capture_list);
+			spin_unlock(&vm->vm_capture_lock);
+		}
+
 		list_add_tail(&vma->vm_bind_link, &vm->vm_bound_list);
 		i915_vm_bind_it_insert(vma, &vm->va);
 		if (!obj->priv_root)
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
index ebf6830574a0..bdabe13fc30e 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
@@ -297,6 +297,9 @@ void i915_address_space_init(struct i915_address_space *vm, int subclass)
 	spin_lock_init(&vm->vm_rebind_lock);
 	spin_lock_init(&vm->userptr_invalidated_lock);
 	INIT_LIST_HEAD(&vm->userptr_invalidated_list);
+
+	INIT_LIST_HEAD(&vm->vm_capture_list);
+	spin_lock_init(&vm->vm_capture_lock);
 }
 
 void *__px_vaddr(struct drm_i915_gem_object *p)
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
index 87e5b6568a00..8e4ddd073348 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
@@ -281,6 +281,11 @@ struct i915_address_space {
 	/** @root_obj: root object for dma-resv sharing by private objects */
 	struct drm_i915_gem_object *root_obj;
 
+	/* @vm_capture_list: list of vm captures */
+	struct list_head vm_capture_list;
+	/* @vm_capture_lock: protects vm_capture_list */
+	spinlock_t vm_capture_lock;
+
 	/* Global GTT */
 	bool is_ggtt:1;
 
diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index 9d5d5a397b64..3b2b12a739f7 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -1460,6 +1460,22 @@ capture_vma(struct intel_engine_capture_vma *next,
 	return next;
 }
 
+static struct intel_engine_capture_vma *
+capture_user_vm(struct intel_engine_capture_vma *capture,
+		struct i915_address_space *vm, gfp_t gfp)
+{
+	struct i915_vma *vma;
+
+	spin_lock(&vm->vm_capture_lock);
+	/* vma->resource must be valid here as persistent vmas are bound */
+	list_for_each_entry(vma, &vm->vm_capture_list, vm_capture_link)
+		capture = capture_vma_snapshot(capture, vma->resource,
+					       gfp, "user");
+	spin_unlock(&vm->vm_capture_lock);
+
+	return capture;
+}
+
 static struct intel_engine_capture_vma *
 capture_user(struct intel_engine_capture_vma *capture,
 	     const struct i915_request *rq,
@@ -1471,6 +1487,9 @@ capture_user(struct intel_engine_capture_vma *capture,
 		capture = capture_vma_snapshot(capture, c->vma_res, gfp,
 					       "user");
 
+	capture = capture_user_vm(capture, rq->context->vm,
+				  GFP_NOWAIT | __GFP_NOWARN);
+
 	return capture;
 }
 
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 68a9ac77b4f2..0244864e94f7 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -248,6 +248,7 @@ vma_create(struct drm_i915_gem_object *obj,
 	INIT_LIST_HEAD(&vma->non_priv_vm_bind_link);
 	INIT_LIST_HEAD(&vma->vm_rebind_link);
 	INIT_LIST_HEAD(&vma->userptr_invalidated_link);
+	INIT_LIST_HEAD(&vma->vm_capture_link);
 	return vma;
 
 err_unlock:
diff --git a/drivers/gpu/drm/i915/i915_vma_types.h b/drivers/gpu/drm/i915/i915_vma_types.h
index 90471dc0b235..10ae9f739d57 100644
--- a/drivers/gpu/drm/i915/i915_vma_types.h
+++ b/drivers/gpu/drm/i915/i915_vma_types.h
@@ -309,6 +309,8 @@ struct i915_vma {
 	struct list_head vm_rebind_link; /* Link in vm_rebind_list */
 	/** @userptr_invalidated_link: link to the vm->userptr_invalidated_list */
 	struct list_head userptr_invalidated_link;
+	/* @vm_capture_link: link to the captureable VMA list */
+	struct list_head vm_capture_link;
 
 	/** Timeline fence for vm_bind completion notification */
 	struct {
diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index b9167f950327..0744651ad5b0 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -3930,7 +3930,8 @@ struct drm_i915_gem_vm_bind {
 	 * Note that @fence carries its own flags.
 	 */
 	__u64 flags;
-#define __I915_GEM_VM_BIND_UNKNOWN_FLAGS (~0ull)
+#define I915_GEM_VM_BIND_CAPTURE           (1 << 0)
+#define __I915_GEM_VM_BIND_UNKNOWN_FLAGS   (-(I915_GEM_VM_BIND_CAPTURE << 1))
 
 	/** @rsvd: Reserved, MBZ */
 	__u64 rsvd[2];
-- 
2.21.0.rc0.32.g243a4c7e27

