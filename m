Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 627054D0857
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 21:30:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1810810E184;
	Mon,  7 Mar 2022 20:30:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 691A610E175;
 Mon,  7 Mar 2022 20:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646685012; x=1678221012;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5N0gkIFroCOw+svEfGm5wl7vXcCMD538hE3lK74HXzU=;
 b=gLZtPTMw3Sm79doerfs9vMfkz0muudd19BHDqj1pbKTAskpScZZokAcy
 1IH+WU31XstW16QraBBUkKFjYZqLkfQ+e0VD1vCTMHEIAO3BKqMyCIyrm
 wy/xXU6fDShbdVqiZ8DhSWxePOCePhRfNeX5V9dWDIXZAGyE1RTvmSCH8
 2qsPkZARXm0biX55DEtV4dDfE1UNfXRs3yq9Dlg/f4JXpFwhwHB10XGVw
 efyGeYVSVuDKJGC5E78CrCAQqGzLzVmbfV93a+Ds5/B8aeTw/9tGEciOp
 VzFWmdhjRH92EKJheyXVuG7mms3KBRNbOml5PRhGi8MtDBjQgd9SSc8vS Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="254437545"
X-IronPort-AV: E=Sophos;i="5.90,163,1643702400"; d="scan'208";a="254437545"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 12:29:43 -0800
X-IronPort-AV: E=Sophos;i="5.90,163,1643702400"; d="scan'208";a="495188052"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 07 Mar 2022 12:29:41 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC v2 2/2] drm/doc/rfc: VM_BIND uapi definition
Date: Mon,  7 Mar 2022 12:31:46 -0800
Message-Id: <20220307203146.648-3-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20220307203146.648-1-niranjana.vishwanathapura@intel.com>
References: <20220307203146.648-1-niranjana.vishwanathapura@intel.com>
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
Cc: daniel.vetter@intel.com, thomas.hellstrom@intel.com,
 chris.p.wilson@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VM_BIND und related uapi definitions

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 Documentation/gpu/rfc/i915_vm_bind.h | 176 +++++++++++++++++++++++++++
 1 file changed, 176 insertions(+)
 create mode 100644 Documentation/gpu/rfc/i915_vm_bind.h

diff --git a/Documentation/gpu/rfc/i915_vm_bind.h b/Documentation/gpu/rfc/i915_vm_bind.h
new file mode 100644
index 000000000000..80f00ee6c8a1
--- /dev/null
+++ b/Documentation/gpu/rfc/i915_vm_bind.h
@@ -0,0 +1,176 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+
+/* VM_BIND feature availability through drm_i915_getparam */
+#define I915_PARAM_HAS_VM_BIND		57
+
+/* VM_BIND related ioctls */
+#define DRM_I915_GEM_VM_BIND		0x3d
+#define DRM_I915_GEM_VM_UNBIND		0x3e
+#define DRM_I915_GEM_WAIT_USER_FENCE	0x3f
+
+#define DRM_IOCTL_I915_GEM_VM_BIND		DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_VM_BIND, struct drm_i915_gem_vm_bind)
+#define DRM_IOCTL_I915_GEM_VM_UNBIND		DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_VM_UNBIND, struct drm_i915_gem_vm_bind)
+#define DRM_IOCTL_I915_GEM_WAIT_USER_FENCE	DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_WAIT_USER_FENCE, struct drm_i915_gem_wait_user_fence)
+
+/**
+ * struct drm_i915_gem_vm_bind - VA to object/buffer mapping to [un]bind.
+ */
+struct drm_i915_gem_vm_bind {
+	/** vm to [un]bind */
+	__u32 vm_id;
+
+	/**
+	 * BO handle or file descriptor.
+	 * 'fd' value of -1 is reserved for system pages (SVM)
+	 */
+	union {
+		__u32 handle; /* For unbind, it is reserved and must be 0 */
+		__s32 fd;
+	}
+
+	/** VA start to [un]bind */
+	__u64 start;
+
+	/** Offset in object to [un]bind */
+	__u64 offset;
+
+	/** VA length to [un]bind */
+	__u64 length;
+
+	/** Flags */
+	__u64 flags;
+	/** Bind the mapping immediately instead of during next submission */
+#define I915_GEM_VM_BIND_IMMEDIATE   (1 << 0)
+	/** Read-only mapping */
+#define I915_GEM_VM_BIND_READONLY    (1 << 1)
+	/** Capture this mapping in the dump upon GPU error */
+#define I915_GEM_VM_BIND_CAPTURE     (1 << 2)
+
+	/** Zero-terminated chain of extensions */
+	__u64 extensions;
+};
+
+/**
+ * struct drm_i915_vm_bind_ext_user_fence - Bind completion signaling extension.
+ */
+struct drm_i915_vm_bind_ext_user_fence {
+#define I915_VM_BIND_EXT_USER_FENCE	0
+	/** @base: Extension link. See struct i915_user_extension. */
+	struct i915_user_extension base;
+
+	/** User/Memory fence qword alinged process virtual address */
+	__u64 addr;
+
+	/** User/Memory fence value to be written after bind completion */
+	__u64 val;
+
+	/** Reserved for future extensions */
+	__u64 rsvd;
+};
+
+/**
+ * struct drm_i915_gem_execbuffer_ext_user_fence - First level batch completion
+ * signaling extension.
+ *
+ * This extension allows user to attach a user fence (<addr, value> pair) to an
+ * execbuf to be signaled by the command streamer after the completion of 1st
+ * level batch, by writing the <value> at specified <addr> and triggering an
+ * interrupt.
+ * User can either poll for this user fence to signal or can also wait on it
+ * with i915_gem_wait_user_fence ioctl.
+ * This is very much usefaul for long running contexts where waiting on dma-fence
+ * by user (like i915_gem_wait ioctl) is not supported.
+ */
+struct drm_i915_gem_execbuffer_ext_user_fence {
+#define DRM_I915_GEM_EXECBUFFER_EXT_USER_FENCE		0
+	/** @base: Extension link. See struct i915_user_extension. */
+	struct i915_user_extension base;
+
+	/**
+	 * User/Memory fence qword aligned GPU virtual address.
+	 * Address has to be a valid GPU virtual address at the time of
+	 * 1st level batch completion.
+	 */
+	__u64 addr;
+
+	/**
+	 * User/Memory fence Value to be written to above address
+	 * after 1st level batch completes.
+	 */
+	__u64 value;
+
+	/** Reserved for future extensions */
+	__u64 rsvd;
+};
+
+struct drm_i915_gem_vm_control {
+/** Flag to opt-in for VM_BIND mode of binding during VM creation */
+#define I915_VM_CREATE_FLAGS_USE_VM_BIND	(1 << 0)
+};
+
+
+struct drm_i915_gem_create_ext {
+/** Extension to make the object private to a specified VM */
+#define I915_GEM_CREATE_EXT_VM_PRIVATE		2
+};
+
+
+struct prelim_drm_i915_gem_context_create_ext {
+/** Flag to declare context as long running */
+#define I915_CONTEXT_CREATE_FLAGS_LONG_RUNNING   (1u << 2)
+};
+
+/**
+ * struct drm_i915_gem_wait_user_fence
+ *
+ * Wait on user/memory fence. User/Memory fence can be woken up either by,
+ *    1. GPU context indicated by 'ctx_id', or,
+ *    2. Kerrnel driver async worker upon I915_UFENCE_WAIT_SOFT.
+ *       'ctx_id' is ignored when this flag is set.
+ *
+ * Wakeup when below condition is true.
+ * (*addr & MASK) OP (VALUE & MASK)
+ *
+ */
+~struct drm_i915_gem_wait_user_fence {
+	/** @base: Extension link. See struct i915_user_extension. */
+	__u64 extensions;
+
+	/** User/Memory fence address */
+	__u64 addr;
+
+	/** Id of the Context which will signal the fence. */
+	__u32 ctx_id;
+
+	/** Wakeup condition operator */
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
+	/** Flags */
+	__u16 flags;
+#define I915_UFENCE_WAIT_SOFT    0x1
+#define I915_UFENCE_WAIT_ABSTIME 0x2
+
+	/** Wakeup value */
+	__u64 value;
+
+	/** Wakeup mask */
+	__u64 mask;
+#define I915_UFENCE_WAIT_U8     0xffu
+#define I915_UFENCE_WAIT_U16    0xffffu
+#define I915_UFENCE_WAIT_U32    0xfffffffful
+#define I915_UFENCE_WAIT_U64    0xffffffffffffffffull
+
+	/** Timeout */
+	__s64 timeout;
+};
-- 
2.21.0.rc0.32.g243a4c7e27

