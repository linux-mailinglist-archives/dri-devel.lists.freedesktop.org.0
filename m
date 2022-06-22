Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DA355539B
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 20:51:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4D1E10E849;
	Wed, 22 Jun 2022 18:51:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79CCC10E7A6;
 Wed, 22 Jun 2022 18:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655923869; x=1687459869;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hqmxVFYLRDvjKZkBm75CxHAO0h061l5kpTkB0/97AGo=;
 b=Wro1ewEsujJgEWNTX9jwaB5LHSwmgcRFNld8GNScVAu8mOdmS7xSnzOA
 Y4TXXilDtnNGgbu6FcJJylXAF4ruAX3t0faoIm/jaLDPHb4pAx5yyeK6J
 sWJuCpDWHnv1PMJhct8Zx6677PtoU+LeWaQgKuKbSnJNsB9B55zQlf9dD
 iRXl9fg5dMXTB/U20oLGTnghzkQfWzDOOBo72GF9XZg7iGRMzQsAFMIrK
 sggVWS31bxfx8JKAS7PcZPUzhyXk7Z1d4dBTzkb0QKJNh2o9qiAhqQI9h
 q9wSAfhyENkiIenrKfpIlX47T9iVHsDEsWr40j/KWW3RV+Egko38Yf/Qo A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10386"; a="269236653"
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="269236653"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 11:51:08 -0700
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="644344790"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 22 Jun 2022 11:51:08 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 3/3] drm/doc/rfc: VM_BIND uapi definition
Date: Wed, 22 Jun 2022 11:50:47 -0700
Message-Id: <20220622185047.3763-4-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20220622185047.3763-1-niranjana.vishwanathapura@intel.com>
References: <20220622185047.3763-1-niranjana.vishwanathapura@intel.com>
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
Cc: matthew.brost@intel.com, paulo.r.zanoni@intel.com,
 lionel.g.landwerlin@intel.com, tvrtko.ursulin@intel.com,
 chris.p.wilson@intel.com, thomas.hellstrom@intel.com, oak.zeng@intel.com,
 matthew.auld@intel.com, jason@jlekstrand.net, daniel.vetter@intel.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VM_BIND and related uapi definitions

v2: Reduce the scope to simple Mesa use case.
v3: Expand VM_UNBIND documentation and add
    I915_GEM_VM_BIND/UNBIND_FENCE_VALID
    and I915_GEM_VM_BIND_TLB_FLUSH flags.
v4: Remove I915_GEM_VM_BIND_TLB_FLUSH flag and add additional
    documentation for vm_bind/unbind.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 Documentation/gpu/rfc/i915_vm_bind.h | 252 +++++++++++++++++++++++++++
 1 file changed, 252 insertions(+)
 create mode 100644 Documentation/gpu/rfc/i915_vm_bind.h

diff --git a/Documentation/gpu/rfc/i915_vm_bind.h b/Documentation/gpu/rfc/i915_vm_bind.h
new file mode 100644
index 000000000000..7248791a4513
--- /dev/null
+++ b/Documentation/gpu/rfc/i915_vm_bind.h
@@ -0,0 +1,252 @@
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
+/* VM_BIND related ioctls */
+#define DRM_I915_GEM_VM_BIND		0x3d
+#define DRM_I915_GEM_VM_UNBIND		0x3e
+#define DRM_I915_GEM_EXECBUFFER3	0x3f
+
+#define DRM_IOCTL_I915_GEM_VM_BIND		DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_VM_BIND, struct drm_i915_gem_vm_bind)
+#define DRM_IOCTL_I915_GEM_VM_UNBIND		DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_VM_UNBIND, struct drm_i915_gem_vm_bind)
+#define DRM_IOCTL_I915_GEM_EXECBUFFER3		DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_EXECBUFFER3, struct drm_i915_gem_execbuffer3)
+
+/**
+ * struct drm_i915_gem_vm_bind_fence - Bind/unbind completion notification.
+ *
+ * A timeline out fence for vm_bind/unbind completion notification.
+ */
+struct drm_i915_gem_vm_bind_fence {
+	/** @handle: User's handle for a drm_syncobj to signal. */
+	__u32 handle;
+
+	/** @rsvd: Reserved, MBZ */
+	__u32 rsvd;
+
+	/**
+	 * @value: A point in the timeline.
+	 * Value must be 0 for a binary drm_syncobj. A Value of 0 for a
+	 * timeline drm_syncobj is invalid as it turns a drm_syncobj into a
+	 * binary one.
+	 */
+	__u64 value;
+};
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
+ * The @start, @offset and @length should be 4K page aligned. However the DG2
+ * and XEHPSDV has 64K page size for device local-memory and has compact page
+ * table. On those platforms, for binding device local-memory objects, the
+ * @start should be 2M aligned, @offset and @length should be 64K aligned.
+ * Also, on those platforms, error -ENOSPC will be returned if user tries to
+ * bind a device local-memory object and a system memory object in a single 2M
+ * section of VA range.
+ *
+ * Error code -EINVAL will be returned if @start, @offset and @length are not
+ * properly aligned. Error code of -ENOSPC will be returned if the VA range
+ * specified can't be reserved.
+ *
+ * The bind operation can get completed asynchronously and out of submission
+ * order. When I915_GEM_VM_BIND_FENCE_VALID flag is set, the @fence will be
+ * signaled upon completion of bind operation.
+ */
+struct drm_i915_gem_vm_bind {
+	/** @vm_id: VM (address space) id to bind */
+	__u32 vm_id;
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
+	 * I915_GEM_VM_BIND_FENCE_VALID:
+	 * @fence is valid, needs bind completion notification.
+	 *
+	 * I915_GEM_VM_BIND_READONLY:
+	 * Mapping is read-only.
+	 *
+	 * I915_GEM_VM_BIND_CAPTURE:
+	 * Capture this mapping in the dump upon GPU error.
+	 */
+	__u64 flags;
+#define I915_GEM_VM_BIND_FENCE_VALID	(1 << 0)
+#define I915_GEM_VM_BIND_READONLY	(1 << 1)
+#define I915_GEM_VM_BIND_CAPTURE	(1 << 2)
+
+	/** @fence: Timeline fence for bind completion signaling */
+	struct drm_i915_gem_vm_bind_fence fence;
+
+	/** @extensions: 0-terminated chain of extensions */
+	__u64 extensions;
+};
+
+/**
+ * struct drm_i915_gem_vm_unbind - VA to object mapping to unbind.
+ *
+ * This structure is passed to VM_UNBIND ioctl and specifies the GPU virtual
+ * address (VA) range that should be unbound from the device page table of the
+ * specified address space (VM). The specified VA range must match one of the
+ * mappings created with the VM_BIND ioctl. TLB is flushed upon unbind
+ * completion. The unbind operation will force unbind the specified range from
+ * device page table without waiting for any GPU job to complete. It is UMDs
+ * responsibility to ensure the mapping is no longer in use before calling
+ * VM_UNBIND.
+ *
+ * If the specified mapping is not found, the ioctl will simply return without
+ * any error.
+ *
+ * The unbind operation can get completed asynchronously and out of submission
+ * order. When I915_GEM_VM_UNBIND_FENCE_VALID flag is set, the @fence will be
+ * signaled upon completion of unbind operation.
+ */
+struct drm_i915_gem_vm_unbind {
+	/** @vm_id: VM (address space) id to bind */
+	__u32 vm_id;
+
+	/** @rsvd: Reserved, MBZ */
+	__u32 rsvd;
+
+	/** @start: Virtual Address start to unbind */
+	__u64 start;
+
+	/** @length: Length of mapping to unbind */
+	__u64 length;
+
+	/**
+	 * @flags: Supported flags are:
+	 *
+	 * I915_GEM_VM_UNBIND_FENCE_VALID:
+	 * @fence is valid, needs unbind completion notification.
+	 */
+	__u64 flags;
+#define I915_GEM_VM_UNBIND_FENCE_VALID	(1 << 0)
+
+	/** @fence: Timeline fence for unbind completion signaling */
+	struct drm_i915_gem_vm_bind_fence fence;
+
+	/** @extensions: 0-terminated chain of extensions */
+	__u64 extensions;
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
+	 */
+	__u64 extensions;
+#define DRM_I915_GEM_EXECBUFFER3_EXT_TIMELINE_FENCES	0
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
-- 
2.21.0.rc0.32.g243a4c7e27

