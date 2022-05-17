Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE4852AAEC
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 20:32:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ABB010EF19;
	Tue, 17 May 2022 18:32:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F78C10ECED;
 Tue, 17 May 2022 18:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652812358; x=1684348358;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xyl1ZExm0x/rn2xxPx428gjWbcZjp+m0dgzi0bxeWRw=;
 b=J2TbS966RMUfcZ2ar2v9RSwxwOJzisaUXG3hjxsAUyvIYW4vxpvj5HBb
 57NTB+uzW1iJKP60i1szuuOAYBjevz6U7aF2v3Z89fpI5TKlAe0ndGey7
 6oYcX32RUI8kiHoTafD8T1+xZcTRjjPcdLS9todursZI9kC3MXvOdNuTy
 GQduRP4OOl4LHJLe9PDE3ZwG+lZV2Xu/KjYtEU8psXfk7WKpLXR6ycuaS
 5Qu8zx6DXDeL8hPgcWZCOUu9JlzhXM12C9IWL144y6GXyXsflxCH3IRQc
 B8zXGuqrZZsouVdH8Dc+es2a18Zy6A49VYSofF5YCwJQOOU5sdBtJDWo7 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10350"; a="251179148"
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; d="scan'208";a="251179148"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2022 11:32:38 -0700
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; d="scan'208";a="597287389"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 17 May 2022 11:32:37 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@intel.com
Subject: [RFC v3 2/3] drm/i915: Update i915 uapi documentation
Date: Tue, 17 May 2022 11:32:11 -0700
Message-Id: <20220517183212.20274-3-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20220517183212.20274-1-niranjana.vishwanathapura@intel.com>
References: <20220517183212.20274-1-niranjana.vishwanathapura@intel.com>
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
Cc: matthew.brost@intel.com, thomas.hellstrom@intel.com, jason@jlekstrand.net,
 chris.p.wilson@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add some missing i915 upai documentation which the new
i915 VM_BIND feature documentation will be refer to.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 include/uapi/drm/i915_drm.h | 153 +++++++++++++++++++++++++++---------
 1 file changed, 116 insertions(+), 37 deletions(-)

diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index a2def7b27009..8c834a31b56f 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -751,9 +751,16 @@ typedef struct drm_i915_irq_wait {
 
 /* Must be kept compact -- no holes and well documented */
 
+/**
+ * typedef drm_i915_getparam_t - Driver parameter query structure.
+ */
 typedef struct drm_i915_getparam {
+	/** @param: Driver parameter to query. */
 	__s32 param;
-	/*
+
+	/**
+	 * @value: Address of memory where queried value should be put.
+	 *
 	 * WARNING: Using pointers instead of fixed-size u64 means we need to write
 	 * compat32 code. Don't repeat this mistake.
 	 */
@@ -1239,76 +1246,114 @@ struct drm_i915_gem_exec_object2 {
 	__u64 rsvd2;
 };
 
+/**
+ * struct drm_i915_gem_exec_fence - An input or output fence for the execbuff
+ * ioctl.
+ *
+ * The request will wait for input fence to signal before submission.
+ *
+ * The returned output fence will be signaled after the completion of the
+ * request.
+ */
 struct drm_i915_gem_exec_fence {
-	/**
-	 * User's handle for a drm_syncobj to wait on or signal.
-	 */
+	/** @handle: User's handle for a drm_syncobj to wait on or signal. */
 	__u32 handle;
 
+	/**
+	 * @flags: Supported flags are,
+	 *
+	 * I915_EXEC_FENCE_WAIT:
+	 * Wait for the input fence before request submission.
+	 *
+	 * I915_EXEC_FENCE_SIGNAL:
+	 * Return request completion fence as output
+	 */
+	__u32 flags;
 #define I915_EXEC_FENCE_WAIT            (1<<0)
 #define I915_EXEC_FENCE_SIGNAL          (1<<1)
 #define __I915_EXEC_FENCE_UNKNOWN_FLAGS (-(I915_EXEC_FENCE_SIGNAL << 1))
-	__u32 flags;
 };
 
-/*
- * See drm_i915_gem_execbuffer_ext_timeline_fences.
- */
-#define DRM_I915_GEM_EXECBUFFER_EXT_TIMELINE_FENCES 0
-
-/*
+/**
+ * struct drm_i915_gem_execbuffer_ext_timeline_fences - Timeline fences
+ * for execbuff.
+ *
  * This structure describes an array of drm_syncobj and associated points for
  * timeline variants of drm_syncobj. It is invalid to append this structure to
  * the execbuf if I915_EXEC_FENCE_ARRAY is set.
  */
 struct drm_i915_gem_execbuffer_ext_timeline_fences {
+#define DRM_I915_GEM_EXECBUFFER_EXT_TIMELINE_FENCES 0
+	/** @base: Extension link. See struct i915_user_extension. */
 	struct i915_user_extension base;
 
 	/**
-	 * Number of element in the handles_ptr & value_ptr arrays.
+	 * @fence_count: Number of element in the @handles_ptr & @value_ptr
+	 * arrays.
 	 */
 	__u64 fence_count;
 
 	/**
-	 * Pointer to an array of struct drm_i915_gem_exec_fence of length
-	 * fence_count.
+	 * @handles_ptr: Pointer to an array of struct drm_i915_gem_exec_fence
+	 * of length @fence_count.
 	 */
 	__u64 handles_ptr;
 
 	/**
-	 * Pointer to an array of u64 values of length fence_count. Values
-	 * must be 0 for a binary drm_syncobj. A Value of 0 for a timeline
-	 * drm_syncobj is invalid as it turns a drm_syncobj into a binary one.
+	 * @values_ptr: Pointer to an array of u64 values of length
+	 * @fence_count.
+	 * Values must be 0 for a binary drm_syncobj. A Value of 0 for a
+	 * timeline drm_syncobj is invalid as it turns a drm_syncobj into a
+	 * binary one.
 	 */
 	__u64 values_ptr;
 };
 
+/**
+ * struct drm_i915_gem_execbuffer2 - Structure for execbuff submission
+ */
 struct drm_i915_gem_execbuffer2 {
-	/**
-	 * List of gem_exec_object2 structs
-	 */
+	/** @buffers_ptr: Pointer to a list of gem_exec_object2 structs */
 	__u64 buffers_ptr;
+
+	/** @buffer_count: Number of elements in @buffers_ptr array */
 	__u32 buffer_count;
 
-	/** Offset in the batchbuffer to start execution from. */
+	/**
+	 * @batch_start_offset: Offset in the batchbuffer to start execution
+	 * from.
+	 */
 	__u32 batch_start_offset;
-	/** Bytes used in batchbuffer from batch_start_offset */
+
+	/** @batch_len: Bytes used in batchbuffer from batch_start_offset */
 	__u32 batch_len;
+
+	/** @DR1: deprecated */
 	__u32 DR1;
+
+	/** @DR4: deprecated */
 	__u32 DR4;
+
+	/** @num_cliprects: See @cliprects_ptr */
 	__u32 num_cliprects;
+
 	/**
-	 * This is a struct drm_clip_rect *cliprects if I915_EXEC_FENCE_ARRAY
-	 * & I915_EXEC_USE_EXTENSIONS are not set.
+	 * @cliprects_ptr: Kernel clipping was a DRI1 misfeature.
+	 *
+	 * It is invalid to use this field if I915_EXEC_FENCE_ARRAY or
+	 * I915_EXEC_USE_EXTENSIONS flags are not set.
 	 *
 	 * If I915_EXEC_FENCE_ARRAY is set, then this is a pointer to an array
-	 * of struct drm_i915_gem_exec_fence and num_cliprects is the length
-	 * of the array.
+	 * of &drm_i915_gem_exec_fence and @num_cliprects is the length of the
+	 * array.
 	 *
 	 * If I915_EXEC_USE_EXTENSIONS is set, then this is a pointer to a
-	 * single struct i915_user_extension and num_cliprects is 0.
+	 * single &i915_user_extension and num_cliprects is 0.
 	 */
 	__u64 cliprects_ptr;
+
+	/** @flags: Execbuff flags */
+	__u64 flags;
 #define I915_EXEC_RING_MASK              (0x3f)
 #define I915_EXEC_DEFAULT                (0<<0)
 #define I915_EXEC_RENDER                 (1<<0)
@@ -1326,10 +1371,6 @@ struct drm_i915_gem_execbuffer2 {
 #define I915_EXEC_CONSTANTS_REL_GENERAL (0<<6) /* default */
 #define I915_EXEC_CONSTANTS_ABSOLUTE 	(1<<6)
 #define I915_EXEC_CONSTANTS_REL_SURFACE (2<<6) /* gen4/5 only */
-	__u64 flags;
-	__u64 rsvd1; /* now used for context info */
-	__u64 rsvd2;
-};
 
 /** Resets the SO write offset registers for transform feedback on gen7. */
 #define I915_EXEC_GEN7_SOL_RESET	(1<<8)
@@ -1432,9 +1473,23 @@ struct drm_i915_gem_execbuffer2 {
  * drm_i915_gem_execbuffer_ext enum.
  */
 #define I915_EXEC_USE_EXTENSIONS	(1 << 21)
-
 #define __I915_EXEC_UNKNOWN_FLAGS (-(I915_EXEC_USE_EXTENSIONS << 1))
 
+	/** @rsvd1: Context id */
+	__u64 rsvd1;
+
+	/**
+	 * @rsvd2: in and out sync_file file descriptors.
+	 *
+	 * When I915_EXEC_FENCE_IN or I915_EXEC_FENCE_SUBMIT flag is set, the
+	 * lower 32 bits of this field will have the in sync_file fd (input).
+	 *
+	 * When I915_EXEC_FENCE_OUT flag is set, the upper 32 bits of this
+	 * field will have the out sync_file fd (output).
+	 */
+	__u64 rsvd2;
+};
+
 #define I915_EXEC_CONTEXT_ID_MASK	(0xffffffff)
 #define i915_execbuffer2_set_context_id(eb2, context) \
 	(eb2).rsvd1 = context & I915_EXEC_CONTEXT_ID_MASK
@@ -1814,13 +1869,32 @@ struct drm_i915_gem_context_create {
 	__u32 pad;
 };
 
+/**
+ * struct drm_i915_gem_context_create_ext - Structure for creating contexts.
+ */
 struct drm_i915_gem_context_create_ext {
-	__u32 ctx_id; /* output: id of new context*/
+	/** @ctx_id: Id of the created context (output) */
+	__u32 ctx_id;
+
+	/**
+	 * @flags: Supported flags are,
+	 *
+	 * I915_CONTEXT_CREATE_FLAGS_USE_EXTENSIONS:
+	 *
+	 * Extensions may be appended to this structure and driver must check
+	 * for those.
+	 *
+	 * I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE
+	 *
+	 * Created context will have single timeline.
+	 */
 	__u32 flags;
 #define I915_CONTEXT_CREATE_FLAGS_USE_EXTENSIONS	(1u << 0)
 #define I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE	(1u << 1)
 #define I915_CONTEXT_CREATE_FLAGS_UNKNOWN \
 	(-(I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE << 1))
+
+	/** @extensions: Zero-terminated chain of extensions. */
 	__u64 extensions;
 };
 
@@ -2387,7 +2461,9 @@ struct drm_i915_gem_context_destroy {
 	__u32 pad;
 };
 
-/*
+/**
+ * struct drm_i915_gem_vm_control - Structure to create or destroy VM.
+ *
  * DRM_I915_GEM_VM_CREATE -
  *
  * Create a new virtual memory address space (ppGTT) for use within a context
@@ -2397,20 +2473,23 @@ struct drm_i915_gem_context_destroy {
  * The id of new VM (bound to the fd) for use with I915_CONTEXT_PARAM_VM is
  * returned in the outparam @id.
  *
- * No flags are defined, with all bits reserved and must be zero.
- *
  * An extension chain maybe provided, starting with @extensions, and terminated
  * by the @next_extension being 0. Currently, no extensions are defined.
  *
  * DRM_I915_GEM_VM_DESTROY -
  *
- * Destroys a previously created VM id, specified in @id.
+ * Destroys a previously created VM id, specified in @vm_id.
  *
  * No extensions or flags are allowed currently, and so must be zero.
  */
 struct drm_i915_gem_vm_control {
+	/** @extensions: Zero-terminated chain of extensions. */
 	__u64 extensions;
+
+	/** @flags: reserved for future usage, currently MBZ */
 	__u32 flags;
+
+	/** @vm_id: Id of the VM created or to be destroyed */
 	__u32 vm_id;
 };
 
-- 
2.21.0.rc0.32.g243a4c7e27

