Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF66545CD4
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 09:07:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6228312AC0C;
	Fri, 10 Jun 2022 07:07:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C348911B8AF;
 Fri, 10 Jun 2022 07:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654844855; x=1686380855;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iVOnlvWz4aFuCbbTWTQAsxMpGY40avuAXxatOstP/iM=;
 b=BVFBpIVKp5OWOn5WYYyEUyXir7UuiFzhNM1WvdnbHJvjaIxVb9McEIU2
 AO7xjPrj8dIN9ZVOYcnE5n1lCT/fUXWj5rHY7aLlsOLSN80CJFWTcgheW
 TyXTKUdsGKl+avksoAR26kovrmvS+VPgc51ck8VUzvkJ6WD0Vm0kDfMPX
 GLTPY52fV0eS4IgsXJsWJvUQH7v1r/BlP+H1/h2pMTwek6+nVpkhkpTJO
 W5tHMcyaC2rKC6rhA8d8SzJvMZnSYwjTyP+KrtTXkbnhfHIr/JApivybr
 8kT9q48Qav7bcgnEizxka67lw9hoHnrhMPrGKZl+S912+S78/iKsf5rB0 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="302914945"
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; d="scan'208";a="302914945"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 00:07:34 -0700
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; d="scan'208";a="586064044"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 10 Jun 2022 00:07:34 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@intel.com
Subject: [PATCH 3/3] drm/doc/rfc: VM_BIND uapi definition
Date: Fri, 10 Jun 2022 00:07:11 -0700
Message-Id: <20220610070711.32407-4-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20220610070711.32407-1-niranjana.vishwanathapura@intel.com>
References: <20220610070711.32407-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
 chris.p.wilson@intel.com, thomas.hellstrom@intel.com, oak.zeng@intel.com,
 matthew.auld@intel.com, jason@jlekstrand.net, lionel.g.landwerlin@intel.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VM_BIND and related uapi definitions

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 Documentation/gpu/rfc/i915_vm_bind.h | 490 +++++++++++++++++++++++++++
 1 file changed, 490 insertions(+)
 create mode 100644 Documentation/gpu/rfc/i915_vm_bind.h

diff --git a/Documentation/gpu/rfc/i915_vm_bind.h b/Documentation/gpu/rfc/i915_vm_bind.h
new file mode 100644
index 000000000000..9fc854969cfb
--- /dev/null
+++ b/Documentation/gpu/rfc/i915_vm_bind.h
@@ -0,0 +1,490 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+
+/**
+ * DOC: I915_PARAM_HAS_VM_BIND
+ *
+ * VM_BIND feature availability.
+ * See typedef drm_i915_getparam_t param.
+ * bit[0]: If set, VM_BIND is supported, otherwise not.
+ * bits[8-15]: VM_BIND implementation version.
+ * version 0 will not have VM_BIND/UNBIND timeline fence array support.
+ */
+#define I915_PARAM_HAS_VM_BIND		57
+
+/**
+ * DOC: I915_VM_CREATE_FLAGS_USE_VM_BIND
+ *
+ * Flag to opt-in for VM_BIND mode of binding during VM creation.
+ * See struct drm_i915_gem_vm_control flags.
+ *
+ * The older execbuf2 ioctl will not support VM_BIND mode of operation.
+ * For VM_BIND mode, we have new execbuf3 ioctl which will not accept any
+ * execlist (See struct drm_i915_gem_execbuffer3 for more details).
+ *
+ */
+#define I915_VM_CREATE_FLAGS_USE_VM_BIND	(1 << 0)
+
+/**
+ * DOC: I915_CONTEXT_CREATE_FLAGS_LONG_RUNNING
+ *
+ * Flag to declare context as long running.
+ * See struct drm_i915_gem_context_create_ext flags.
+ *
+ * Usage of dma-fence expects that they complete in reasonable amount of time.
+ * Compute on the other hand can be long running. Hence it is not appropriate
+ * for compute contexts to export request completion dma-fence to user.
+ * The dma-fence usage will be limited to in-kernel consumption only.
+ * Compute contexts need to use user/memory fence.
+ *
+ * So, long running contexts do not support output fences. Hence,
+ * I915_EXEC_FENCE_SIGNAL (See &drm_i915_gem_exec_fence.flags) is expected
+ * to be not used. DRM_I915_GEM_WAIT ioctl call is also not supported for
+ * objects mapped to long running contexts.
+ */
+#define I915_CONTEXT_CREATE_FLAGS_LONG_RUNNING   (1u << 2)
+
+/* VM_BIND related ioctls */
+#define DRM_I915_GEM_VM_BIND		0x3d
+#define DRM_I915_GEM_VM_UNBIND		0x3e
+#define DRM_I915_GEM_EXECBUFFER3	0x3f
+#define DRM_I915_GEM_WAIT_USER_FENCE	0x40
+
+#define DRM_IOCTL_I915_GEM_VM_BIND		DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_VM_BIND, struct drm_i915_gem_vm_bind)
+#define DRM_IOCTL_I915_GEM_VM_UNBIND		DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_VM_UNBIND, struct drm_i915_gem_vm_bind)
+#define DRM_IOCTL_I915_GEM_EXECBUFFER3		DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_EXECBUFFER3, struct drm_i915_gem_execbuffer3)
+#define DRM_IOCTL_I915_GEM_WAIT_USER_FENCE	DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_WAIT_USER_FENCE, struct drm_i915_gem_wait_user_fence)
+
+/**
+ * struct drm_i915_gem_vm_bind - VA to object mapping to bind.
+ *
+ * This structure is passed to VM_BIND ioctl and specifies the mapping of GPU
+ * virtual address (VA) range to the section of an object that should be bound
+ * in the device page table of the specified address space (VM).
+ * The VA range specified must be unique (ie., not currently bound) and can
+ * be mapped to whole object or a section of the object (partial binding).
+ * Multiple VA mappings can be created to the same section of the object
+ * (aliasing).
+ *
+ * The @queue_idx specifies the queue to use for binding. Same queue can be
+ * used for both VM_BIND and VM_UNBIND calls. All submitted bind and unbind
+ * operations in a queue are performed in the order of submission.
+ *
+ * The @start, @offset and @length should be 4K page aligned. However the DG2
+ * and XEHPSDV has 64K page size for device local-memory and has compact page
+ * table. On those platforms, for binding device local-memory objects, the
+ * @start should be 2M aligned, @offset and @length should be 64K aligned.
+ * Also, on those platforms, it is not allowed to bind an device local-memory
+ * object and a system memory object in a single 2M section of VA range.
+ */
+struct drm_i915_gem_vm_bind {
+	/** @vm_id: VM (address space) id to bind */
+	__u32 vm_id;
+
+	/** @queue_idx: Index of queue for binding */
+	__u32 queue_idx;
+
+	/** @rsvd: Reserved, MBZ */
+	__u32 rsvd;
+
+	/** @handle: Object handle */
+	__u32 handle;
+
+	/** @start: Virtual Address start to bind */
+	__u64 start;
+
+	/** @offset: Offset in object to bind */
+	__u64 offset;
+
+	/** @length: Length of mapping to bind */
+	__u64 length;
+
+	/**
+	 * @flags: Supported flags are:
+	 *
+	 * I915_GEM_VM_BIND_READONLY:
+	 * Mapping is read-only.
+	 *
+	 * I915_GEM_VM_BIND_CAPTURE:
+	 * Capture this mapping in the dump upon GPU error.
+	 */
+	__u64 flags;
+#define I915_GEM_VM_BIND_READONLY    (1 << 0)
+#define I915_GEM_VM_BIND_CAPTURE     (1 << 1)
+
+	/**
+	 * @extensions: 0-terminated chain of extensions for this operation.
+	 *
+	 * I915_VM_BIND_EXT_TIMELINE_FENCES:
+	 * Specifies an array of input or output timeline fences for this
+	 * binding operation. See struct drm_i915_vm_bind_ext_timeline_fences.
+	 *
+	 * I915_VM_BIND_EXT_USER_FENCES:
+	 * Specifies an array of input or output user fences for this
+	 * binding operation. See struct drm_i915_vm_bind_ext_user_fence.
+	 * This is required for compute contexts.
+	 */
+	__u64 extensions;
+#define I915_VM_BIND_EXT_TIMELINE_FENCES	0
+#define I915_VM_BIND_EXT_USER_FENCES		1
+};
+
+/**
+ * struct drm_i915_gem_vm_unbind - VA to object mapping to unbind.
+ *
+ * This structure is passed to VM_UNBIND ioctl and specifies the GPU virtual
+ * address (VA) range that should be unbound from the device page table of the
+ * specified address space (VM). The specified VA range must match one of the
+ * mappings created with the VM_BIND ioctl. TLB is flushed upon unbind
+ * completion.
+ *
+ * The @queue_idx specifies the queue to use for unbinding.
+ * See struct drm_i915_gem_vm_unbind for more information on @queue_idx.
+ *
+ * The @start and @length musy specify a unique mapping bound with VM_BIND
+ * ioctl.
+ */
+struct drm_i915_gem_vm_unbind {
+	/** @vm_id: VM (address space) id to bind */
+	__u32 vm_id;
+
+	/** @queue_idx: Index of queue for unbinding */
+	__u32 queue_idx;
+
+	/** @start: Virtual Address start to unbind */
+	__u64 start;
+
+	/** @length: Length of mapping to unbind */
+	__u64 length;
+
+	/** @flags: Reserved for future usage, currently MBZ */
+	__u64 flags;
+
+	/**
+	 * @extensions: 0-terminated chain of extensions for this operation.
+	 *
+	 * I915_VM_UNBIND_EXT_TIMELINE_FENCES:
+	 * Specifies an array of input or output timeline fences for this
+	 * unbind operation.
+	 * It has same format as struct drm_i915_vm_bind_ext_timeline_fences.
+	 *
+	 * I915_VM_UNBIND_EXT_USER_FENCES:
+	 * Specifies an array of input or output user fences for this
+	 * unbind operation. This is required for compute contexts.
+	 * It has same format as struct drm_i915_vm_bind_ext_user_fence.
+	 */
+	__u64 extensions;
+#define I915_VM_UNBIND_EXT_TIMELINE_FENCES	0
+#define I915_VM_UNBIND_EXT_USER_FENCES		1
+};
+
+/**
+ * struct drm_i915_vm_bind_fence - An input or output fence for the vm_bind
+ * or the vm_unbind work.
+ *
+ * The vm_bind or vm_unbind aync worker will wait for input fence to signal
+ * before starting the binding or unbinding.
+ *
+ * The vm_bind or vm_unbind async worker will signal the returned output fence
+ * after the completion of binding or unbinding.
+ */
+struct drm_i915_vm_bind_fence {
+	/** @handle: User's handle for a drm_syncobj to wait on or signal. */
+	__u32 handle;
+
+	/**
+	 * @flags: Supported flags are:
+	 *
+	 * I915_VM_BIND_FENCE_WAIT:
+	 * Wait for the input fence before binding/unbinding
+	 *
+	 * I915_VM_BIND_FENCE_SIGNAL:
+	 * Return bind/unbind completion fence as output
+	 */
+	__u32 flags;
+#define I915_VM_BIND_FENCE_WAIT            (1<<0)
+#define I915_VM_BIND_FENCE_SIGNAL          (1<<1)
+#define __I915_VM_BIND_FENCE_UNKNOWN_FLAGS (-(I915_VM_BIND_FENCE_SIGNAL << 1))
+};
+
+/**
+ * struct drm_i915_vm_bind_ext_timeline_fences - Timeline fences for vm_bind
+ * and vm_unbind.
+ *
+ * This structure describes an array of timeline drm_syncobj and associated
+ * points for timeline variants of drm_syncobj. These timeline 'drm_syncobj's
+ * can be input or output fences (See struct drm_i915_vm_bind_fence).
+ */
+struct drm_i915_vm_bind_ext_timeline_fences {
+	/** @base: Extension link. See struct i915_user_extension. */
+	struct i915_user_extension base;
+
+	/**
+	 * @fence_count: Number of elements in the @handles_ptr & @value_ptr
+	 * arrays.
+	 */
+	__u64 fence_count;
+
+	/**
+	 * @handles_ptr: Pointer to an array of struct drm_i915_vm_bind_fence
+	 * of length @fence_count.
+	 */
+	__u64 handles_ptr;
+
+	/**
+	 * @values_ptr: Pointer to an array of u64 values of length
+	 * @fence_count.
+	 * Values must be 0 for a binary drm_syncobj. A Value of 0 for a
+	 * timeline drm_syncobj is invalid as it turns a drm_syncobj into a
+	 * binary one.
+	 */
+	__u64 values_ptr;
+};
+
+/**
+ * struct drm_i915_vm_bind_user_fence - An input or output user fence for the
+ * vm_bind or the vm_unbind work.
+ *
+ * The vm_bind or vm_unbind aync worker will wait for the input fence (value at
+ * @addr to become equal to @val) before starting the binding or unbinding.
+ *
+ * The vm_bind or vm_unbind async worker will signal the output fence after
+ * the completion of binding or unbinding by writing @val to memory location at
+ * @addr
+ */
+struct drm_i915_vm_bind_user_fence {
+	/** @addr: User/Memory fence qword aligned process virtual address */
+	__u64 addr;
+
+	/** @val: User/Memory fence value to be written after bind completion */
+	__u64 val;
+
+	/**
+	 * @flags: Supported flags are:
+	 *
+	 * I915_VM_BIND_USER_FENCE_WAIT:
+	 * Wait for the input fence before binding/unbinding
+	 *
+	 * I915_VM_BIND_USER_FENCE_SIGNAL:
+	 * Return bind/unbind completion fence as output
+	 */
+	__u32 flags;
+#define I915_VM_BIND_USER_FENCE_WAIT            (1<<0)
+#define I915_VM_BIND_USER_FENCE_SIGNAL          (1<<1)
+#define __I915_VM_BIND_USER_FENCE_UNKNOWN_FLAGS \
+	(-(I915_VM_BIND_USER_FENCE_SIGNAL << 1))
+};
+
+/**
+ * struct drm_i915_vm_bind_ext_user_fence - User/memory fences for vm_bind
+ * and vm_unbind.
+ *
+ * These user fences can be input or output fences
+ * (See struct drm_i915_vm_bind_user_fence).
+ */
+struct drm_i915_vm_bind_ext_user_fence {
+	/** @base: Extension link. See struct i915_user_extension. */
+	struct i915_user_extension base;
+
+	/** @fence_count: Number of elements in the @user_fence_ptr array. */
+	__u64 fence_count;
+
+	/**
+	 * @user_fence_ptr: Pointer to an array of
+	 * struct drm_i915_vm_bind_user_fence of length @fence_count.
+	 */
+	__u64 user_fence_ptr;
+};
+
+/**
+ * struct drm_i915_gem_execbuffer3 - Structure for DRM_I915_GEM_EXECBUFFER3
+ * ioctl.
+ *
+ * DRM_I915_GEM_EXECBUFFER3 ioctl only works in VM_BIND mode and VM_BIND mode
+ * only works with this ioctl for submission.
+ * See I915_VM_CREATE_FLAGS_USE_VM_BIND.
+ */
+struct drm_i915_gem_execbuffer3 {
+	/**
+	 * @ctx_id: Context id
+	 *
+	 * Only contexts with user engine map are allowed.
+	 */
+	__u32 ctx_id;
+
+	/**
+	 * @engine_idx: Engine index
+	 *
+	 * An index in the user engine map of the context specified by @ctx_id.
+	 */
+	__u32 engine_idx;
+
+	/** @rsvd1: Reserved, MBZ */
+	__u32 rsvd1;
+
+	/**
+	 * @batch_count: Number of batches in @batch_address array.
+	 *
+	 * 0 is invalid. For parallel submission, it should be equal to the
+	 * number of (parallel) engines involved in that submission.
+	 */
+	__u32 batch_count;
+
+	/**
+	 * @batch_address: Array of batch gpu virtual addresses.
+	 *
+	 * If @batch_count is 1, then it is the gpu virtual address of the
+	 * batch buffer. If @batch_count > 1, then it is a pointer to an array
+	 * of batch buffer gpu virtual addresses.
+	 */
+	__u64 batch_address;
+
+	/**
+	 * @flags: Supported flags are:
+	 *
+	 * I915_EXEC3_SECURE:
+	 * Request a privileged ("secure") batch buffer/s.
+	 * It is only available for DRM_ROOT_ONLY | DRM_MASTER processes.
+	 */
+	__u64 flags;
+#define I915_EXEC3_SECURE	(1<<0)
+
+	/** @rsvd2: Reserved, MBZ */
+	__u64 rsvd2;
+
+	/**
+	 * @extensions: Zero-terminated chain of extensions.
+	 *
+	 * DRM_I915_GEM_EXECBUFFER3_EXT_TIMELINE_FENCES:
+	 * It has same format as DRM_I915_GEM_EXECBUFFER_EXT_TIMELINE_FENCES.
+	 * See struct drm_i915_gem_execbuffer_ext_timeline_fences.
+	 * 
+	 * DRM_I915_GEM_EXECBUFFER3_EXT_USER_FENCE:
+	 * First level batch completion signaling extension.
+	 * See struct drm_i915_gem_execbuffer3_ext_user_fence.
+	 */
+	__u64 extensions;
+#define DRM_I915_GEM_EXECBUFFER3_EXT_TIMELINE_FENCES	0
+#define DRM_I915_GEM_EXECBUFFER3_EXT_USER_FENCE		1
+};
+
+/**
+ * struct drm_i915_gem_execbuffer3_ext_user_fence - First level batch completion
+ * signaling extension.
+ *
+ * This extension allows user to attach a user fence (@addr, @value pair) to
+ * execbuf3, to be signaled by the command streamer after the completion of first
+ * level batch, by writing the @value at specified @addr and triggering an
+ * interrupt.
+ * User can either poll for this user fence to signal or can also wait on it
+ * with i915_gem_wait_user_fence ioctl.
+ * This is very much usefaul for long running contexts where waiting on dma-fence
+ * by user (like i915_gem_wait ioctl) is not supported.
+ */
+struct drm_i915_gem_execbuffer3_ext_user_fence {
+	/** @base: Extension link. See struct i915_user_extension. */
+	struct i915_user_extension base;
+
+	/**
+	 * @addr: User/Memory fence qword aligned GPU virtual address.
+	 *
+	 * Address has to be a valid GPU virtual address at the time of
+	 * first level batch completion.
+	 */
+	__u64 addr;
+
+	/**
+	 * @value: User/Memory fence Value to be written to above address
+	 * after first level batch completes.
+	 */
+	__u64 value;
+
+	/** @rsvd: Reserved, MBZ */
+	__u64 rsvd;
+};
+
+/**
+ * struct drm_i915_gem_create_ext_vm_private - Extension to make the object
+ * private to the specified VM.
+ *
+ * See struct drm_i915_gem_create_ext.
+ */
+struct drm_i915_gem_create_ext_vm_private {
+#define I915_GEM_CREATE_EXT_VM_PRIVATE		2
+	/** @base: Extension link. See struct i915_user_extension. */
+	struct i915_user_extension base;
+
+	/** @vm_id: Id of the VM to which the object is private */
+	__u32 vm_id;
+};
+
+/**
+ * struct drm_i915_gem_wait_user_fence - Wait on user/memory fence.
+ *
+ * User/Memory fence can be woken up either by:
+ *
+ * 1. GPU context indicated by @ctx_id, or,
+ * 2. Kerrnel driver async worker upon I915_UFENCE_WAIT_SOFT.
+ *    @ctx_id is ignored when this flag is set.
+ *
+ * Wakeup condition is,
+ * ``((*addr & mask) op (value & mask))``
+ *
+ * See :ref:`Documentation/driver-api/dma-buf.rst <indefinite_dma_fences>`
+ */
+struct drm_i915_gem_wait_user_fence {
+	/** @extensions: Zero-terminated chain of extensions. */
+	__u64 extensions;
+
+	/** @addr: User/Memory fence address */
+	__u64 addr;
+
+	/** @ctx_id: Id of the Context which will signal the fence. */
+	__u32 ctx_id;
+
+	/** @op: Wakeup condition operator */
+	__u16 op;
+#define I915_UFENCE_WAIT_EQ      0
+#define I915_UFENCE_WAIT_NEQ     1
+#define I915_UFENCE_WAIT_GT      2
+#define I915_UFENCE_WAIT_GTE     3
+#define I915_UFENCE_WAIT_LT      4
+#define I915_UFENCE_WAIT_LTE     5
+#define I915_UFENCE_WAIT_BEFORE  6
+#define I915_UFENCE_WAIT_AFTER   7
+
+	/**
+	 * @flags: Supported flags are:
+	 *
+	 * I915_UFENCE_WAIT_SOFT:
+	 *
+	 * To be woken up by i915 driver async worker (not by GPU).
+	 *
+	 * I915_UFENCE_WAIT_ABSTIME:
+	 *
+	 * Wait timeout specified as absolute time.
+	 */
+	__u16 flags;
+#define I915_UFENCE_WAIT_SOFT    0x1
+#define I915_UFENCE_WAIT_ABSTIME 0x2
+
+	/** @value: Wakeup value */
+	__u64 value;
+
+	/** @mask: Wakeup mask */
+	__u64 mask;
+#define I915_UFENCE_WAIT_U8     0xffu
+#define I915_UFENCE_WAIT_U16    0xffffu
+#define I915_UFENCE_WAIT_U32    0xfffffffful
+#define I915_UFENCE_WAIT_U64    0xffffffffffffffffull
+
+	/**
+	 * @timeout: Wait timeout in nanoseconds.
+	 *
+	 * If I915_UFENCE_WAIT_ABSTIME flag is set, then time timeout is the
+	 * absolute time in nsec.
+	 */
+	__s64 timeout;
+};
-- 
2.21.0.rc0.32.g243a4c7e27

