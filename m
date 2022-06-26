Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F2455AE0F
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jun 2022 03:49:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1131F10E3FE;
	Sun, 26 Jun 2022 01:49:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA4A210E249;
 Sun, 26 Jun 2022 01:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656208177; x=1687744177;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WNo+lbKCtAsYUQwiYExAXf9hrcUP3w6mraTp5BSprOM=;
 b=E3t5bdTNgRzuMaICDYIj/elMBnPxvLSnIGnVWmHd3WIW7FeKNm4GiHRn
 nv0cCCLIMSOna8sbJD/Ww5vwyv0x/Jsb9poXeOhU4AlducaniDK4MvnWQ
 gDWc9cOrN/TiPUz5scpLVK64fBFJQgEqPRgi4M0fzH/E3PdJpCjap0m4t
 doTE4QPHOGMYY6UwW2Ljubf5gnXE7XyMqgPWop9rzJBALqwlm8cKy85gB
 Ys60n52a080HLfa4ehiFyCtKtc3s4tzYtzLIV/Z+zAEzOgXSgWbLzwg4T
 gBDvp2PwGzxdUJ2qVfZfAUnTYNhbJJeXmRZdgvcPJer0nd3ArmUpJqk+T g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10389"; a="269976234"
X-IronPort-AV: E=Sophos;i="5.92,223,1650956400"; d="scan'208";a="269976234"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2022 18:49:37 -0700
X-IronPort-AV: E=Sophos;i="5.92,223,1650956400"; d="scan'208";a="645844859"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 25 Jun 2022 18:49:36 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v6 3/3] drm/doc/rfc: VM_BIND uapi definition
Date: Sat, 25 Jun 2022 18:49:16 -0700
Message-Id: <20220626014916.5130-4-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20220626014916.5130-1-niranjana.vishwanathapura@intel.com>
References: <20220626014916.5130-1-niranjana.vishwanathapura@intel.com>
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
v5: Remove TLB flush requirement on VM_UNBIND.
    Add version support to stage implementation.
v6: Define and use drm_i915_gem_timeline_fence structure for
    all timeline fences.
v7: Rename I915_PARAM_HAS_VM_BIND to I915_PARAM_VM_BIND_VERSION.
    Update documentation on async vm_bind/unbind and versioning.
    Remove redundant vm_bind/unbind FENCE_VALID flag, execbuf3
    batch_count field and I915_EXEC3_SECURE flag.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 Documentation/gpu/rfc/i915_vm_bind.h | 280 +++++++++++++++++++++++++++
 1 file changed, 280 insertions(+)
 create mode 100644 Documentation/gpu/rfc/i915_vm_bind.h

diff --git a/Documentation/gpu/rfc/i915_vm_bind.h b/Documentation/gpu/rfc/i915_vm_bind.h
new file mode 100644
index 000000000000..a93e08bceee6
--- /dev/null
+++ b/Documentation/gpu/rfc/i915_vm_bind.h
@@ -0,0 +1,280 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+
+/**
+ * DOC: I915_PARAM_VM_BIND_VERSION
+ *
+ * VM_BIND feature version supported.
+ * See typedef drm_i915_getparam_t param.
+ *
+ * Specifies the VM_BIND feature version supported.
+ * The following versions of VM_BIND have been defined:
+ *
+ * 0: No VM_BIND support.
+ *
+ * 1: In VM_UNBIND calls, the UMD must specify the exact mappings created
+ *    previously with VM_BIND, the ioctl will not support unbinding multiple
+ *    mappings or splitting them. Similarly, VM_BIND calls will not replace
+ *    any existing mappings.
+ *
+ * 2: The restrictions on unbinding partial or multiple mappings is
+ *    lifted, Similarly, binding will replace any mappings in the given range.
+ *
+ * See struct drm_i915_gem_vm_bind and struct drm_i915_gem_vm_unbind.
+ */
+#define I915_PARAM_VM_BIND_VERSION	57
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
+ * struct drm_i915_gem_timeline_fence - An input or output timeline fence.
+ *
+ * The operation will wait for input fence to signal.
+ *
+ * The returned output fence will be signaled after the completion of the
+ * operation.
+ */
+struct drm_i915_gem_timeline_fence {
+	/** @handle: User's handle for a drm_syncobj to wait on or signal. */
+	__u32 handle;
+
+	/**
+	 * @flags: Supported flags are:
+	 *
+	 * I915_TIMELINE_FENCE_WAIT:
+	 * Wait for the input fence before the operation.
+	 *
+	 * I915_TIMELINE_FENCE_SIGNAL:
+	 * Return operation completion fence as output.
+	 */
+	__u32 flags;
+#define I915_TIMELINE_FENCE_WAIT            (1 << 0)
+#define I915_TIMELINE_FENCE_SIGNAL          (1 << 1)
+#define __I915_TIMELINE_FENCE_UNKNOWN_FLAGS (-(I915_TIMELINE_FENCE_SIGNAL << 1))
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
+ * The @start, @offset and @length must be 4K page aligned. However the DG2
+ * and XEHPSDV has 64K page size for device local-memory and has compact page
+ * table. On those platforms, for binding device local-memory objects, the
+ * @start must be 2M aligned, @offset and @length must be 64K aligned.
+ * Also, for such mappings, i915 will reserve the whole 2M range for it so as
+ * to not allow multiple mappings in that 2M range (Compact page tables do not
+ * allow 64K page and 4K page bindings in the same 2M range).
+ *
+ * Error code -EINVAL will be returned if @start, @offset and @length are not
+ * properly aligned. In version 1 (See I915_PARAM_VM_BIND_VERSION), error code
+ * -ENOSPC will be returned if the VA range specified can't be reserved.
+ *
+ * VM_BIND/UNBIND ioctl calls executed on different CPU threads concurrently
+ * are not ordered. Furthermore, parts of the VM_BIND operation can be done
+ * asynchronously, if valid @fence is specified.
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
+	 * I915_GEM_VM_BIND_READONLY:
+	 * Mapping is read-only.
+	 *
+	 * I915_GEM_VM_BIND_CAPTURE:
+	 * Capture this mapping in the dump upon GPU error.
+	 */
+	__u64 flags;
+#define I915_GEM_VM_BIND_READONLY	(1 << 1)
+#define I915_GEM_VM_BIND_CAPTURE	(1 << 2)
+
+	/**
+	 * @fence: Timeline fence for bind completion signaling.
+	 *
+	 * It is an out fence, hence using I915_TIMELINE_FENCE_WAIT flag
+	 * is invalid, and an error will be returned.
+	 */
+	struct drm_i915_gem_timeline_fence fence;
+
+	/**
+	 * @extensions: Zero-terminated chain of extensions.
+	 *
+	 * For future extensions. See struct i915_user_extension.
+	 */
+	__u64 extensions;
+};
+
+/**
+ * struct drm_i915_gem_vm_unbind - VA to object mapping to unbind.
+ *
+ * This structure is passed to VM_UNBIND ioctl and specifies the GPU virtual
+ * address (VA) range that should be unbound from the device page table of the
+ * specified address space (VM). VM_UNBIND will force unbind the specified
+ * range from device page table without waiting for any GPU job to complete.
+ * It is UMDs responsibility to ensure the mapping is no longer in use before
+ * calling VM_UNBIND.
+ *
+ * If the specified mapping is not found, the ioctl will simply return without
+ * any error.
+ *
+ * VM_BIND/UNBIND ioctl calls executed on different CPU threads concurrently
+ * are not ordered. Furthermore, parts of the VM_UNBIND operation can be done
+ * asynchronously, if valid @fence is specified.
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
+	/** @flags: Currently reserved, MBZ */
+	__u64 flags;
+
+	/**
+	 * @fence: Timeline fence for unbind completion signaling.
+	 *
+	 * It is an out fence, hence using I915_TIMELINE_FENCE_WAIT flag
+	 * is invalid, and an error will be returned.
+	 */
+	struct drm_i915_gem_timeline_fence fence;
+
+	/**
+	 * @extensions: Zero-terminated chain of extensions.
+	 *
+	 * For future extensions. See struct i915_user_extension.
+	 */
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
+	/**
+	 * @batch_address: Batch gpu virtual address/es.
+	 *
+	 * For normal submission, it is the gpu virtual address of the batch
+	 * buffer. For parallel submission, it is a pointer to an array of
+	 * batch buffer gpu virtual addresses with array size equal to the
+	 * number of (parallel) engines involved in that submission (See
+	 * struct i915_context_engines_parallel_submit).
+	 */
+	__u64 batch_address;
+
+	/** @flags: Currently reserved, MBZ */
+	__u64 flags;
+
+	/** @rsvd1: Reserved, MBZ */
+	__u32 rsvd1;
+
+	/** @fence_count: Number of fences in @timeline_fences array. */
+	__u32 fence_count;
+
+	/**
+	 * @timeline_fences: Pointer to an array of timeline fences.
+	 *
+	 * Timeline fences are of format struct drm_i915_gem_timeline_fence.
+	 */
+	__u64 timeline_fences;
+
+	/** @rsvd2: Reserved, MBZ */
+	__u64 rsvd2;
+
+	/**
+	 * @extensions: Zero-terminated chain of extensions.
+	 *
+	 * For future extensions. See struct i915_user_extension.
+	 */
+	__u64 extensions;
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

