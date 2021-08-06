Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 135A23E22E1
	for <lists+dri-devel@lfdr.de>; Fri,  6 Aug 2021 07:30:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C39BA6EA29;
	Fri,  6 Aug 2021 05:30:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 645366EA29;
 Fri,  6 Aug 2021 05:30:35 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10067"; a="214041534"
X-IronPort-AV: E=Sophos;i="5.84,299,1620716400"; d="scan'208";a="214041534"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2021 22:30:30 -0700
X-IronPort-AV: E=Sophos;i="5.84,299,1620716400"; d="scan'208";a="481274635"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 05 Aug 2021 22:30:30 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: daniel.vetter@intel.com, chris.p.wilson@intel.com,
 thomas.hellstrom@intel.com, paulo.r.zanoni@intel.com
Subject: [RFC 2/2] drm/doc/rfc: VM_BIND uapi definition
Date: Thu,  5 Aug 2021 22:30:32 -0700
Message-Id: <20210806053032.2462-3-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20210806053032.2462-1-niranjana.vishwanathapura@intel.com>
References: <20210806053032.2462-1-niranjana.vishwanathapura@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VM_BIND and GEM_WAIT_USER_FENCE uapi document

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 Documentation/gpu/rfc/i915_vm_bind.h   | 113 +++++++++++++++++++++++++
 Documentation/gpu/rfc/i915_vm_bind.rst |   6 ++
 2 files changed, 119 insertions(+)
 create mode 100644 Documentation/gpu/rfc/i915_vm_bind.h

diff --git a/Documentation/gpu/rfc/i915_vm_bind.h b/Documentation/gpu/rfc/i915_vm_bind.h
new file mode 100644
index 000000000000..3aaf66e62aa0
--- /dev/null
+++ b/Documentation/gpu/rfc/i915_vm_bind.h
@@ -0,0 +1,113 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2021 Intel Corporation
+ */
+
+/* VM_BIND feature availability through drm_i915_getparam */
+#define I915_PARAM_HAS_VM_BIND          59
+
+/**
+ * struct drm_i915_gem_vm_bind - VA to object/buffer mapping to [un]bind.
+ */
+struct drm_i915_gem_vm_bind {
+	/** vm to [un]bind **/
+	__u32 vm_id;
+
+	/** BO handle or file descriptor. 'fd' to -1 for system pages (SVM) **/
+	union {
+		__u32 handle;
+		__s32 fd;
+	}
+
+	/** VA start to [un]bind **/
+	__u64 start;
+
+	/** Offset in object to [un]bind **/
+	__u64 offset;
+
+	/** VA length to [un]bind **/
+	__u64 length;
+
+	/** Flags **/
+	__u64 flags;
+	/** Bind the mapping immediately instead of during next submission */
+#define I915_GEM_VM_BIND_IMMEDIATE   (1 << 0)
+	/** Read-only mapping */
+#define I915_GEM_VM_BIND_READONLY    (1 << 1)
+	/** Capture this mapping in the dump upon GPU error */
+#define I915_GEM_VM_BIND_CAPTURE     (1 << 2)
+
+	/**
+	 * Zero-terminated chain of extensions.
+	 *
+	 * No current extensions defined; mbz.
+	 */
+	__u64 extensions;
+};
+
+/**
+ * struct drm_i915_vm_bind_ext_sync_fence - Bind completion signaling extension.
+ */
+struct drm_i915_vm_bind_ext_sync_fence {
+#define I915_VM_BIND_EXT_SYNC_FENCE     0
+	/** @base: Extension link. See struct i915_user_extension. */
+	struct i915_user_extension base;
+
+	/** User/Memory fence address */
+	__u64 addr;
+
+	/** User/Memory fence value to be written after bind completion */
+	__u64 val;
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
+struct drm_i915_gem_wait_user_fence {
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
diff --git a/Documentation/gpu/rfc/i915_vm_bind.rst b/Documentation/gpu/rfc/i915_vm_bind.rst
index dbc35262a554..dc843e32a1cd 100644
--- a/Documentation/gpu/rfc/i915_vm_bind.rst
+++ b/Documentation/gpu/rfc/i915_vm_bind.rst
@@ -117,6 +117,12 @@ VM_BIND interface can be used to map system memory directly (without gem BO
 abstraction) using the HMM interface.
 
 
+UAPI
+=====
+Uapi definiton can be found here:
+.. kernel-doc:: Documentation/gpu/rfc/i915_vm_bind.h
+
+
 Links:
 ======
 - Reference WIP VM_BIND implementation can be found here.
-- 
2.21.0.rc0.32.g243a4c7e27

