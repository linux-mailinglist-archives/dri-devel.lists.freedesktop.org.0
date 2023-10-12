Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D88E7C6F1C
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 15:26:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40BAC10E4ED;
	Thu, 12 Oct 2023 13:26:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44CF210E4ED;
 Thu, 12 Oct 2023 13:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697117205; x=1728653205;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FjNgeKKEcML4p120jTUCqmZCaXEbLMYWLcHA85fs++s=;
 b=e8wtwEcNw1cBOgHyySCSm8LFITgfokyCRH+gAKXRvk85KP1hPhfNy8Gw
 xNNOfe0DP3gMOhPTViNxLP00UPujUPz2M3aWSfmWA+QaomKiE645RJJCK
 K81jXj4KiV4SvZws04BTLN/a//tTt737krmhJyUmBgcePoLNy0+si1JP8
 t57Ut/MVseII7wfrSAp2QsJjuM9MFAXkh5Qm+alnbVW0DdLCGX3EcpKCt
 JR2jj6SVUHCZQ6Bc2k9n2EG8fYgBlHvjv6YINO31Ke0m1LA9VurscsR2i
 Rzw9sW0x4UQyjjTvEkmgyhPP3weFG/TuevqE1ia8RdF/2YubvXVgqrhlb w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="415967337"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; d="scan'208";a="415967337"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 06:26:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="870578033"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; d="scan'208";a="870578033"
Received: from dstacken-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.172])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 06:26:37 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v8] Documentation/gpu: Add a VM_BIND async document
Date: Thu, 12 Oct 2023 15:25:52 +0200
Message-ID: <20231012132552.20196-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Paulo R Zanoni <paulo.r.zanoni@intel.com>, linux-kernel@vger.kernel.org,
 Oak Zeng <oak.zeng@intel.com>, Danilo Krummrich <dakr@redhat.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a motivation for and description of asynchronous VM_BIND operation

v2:
- Fix typos (Nirmoy Das)
- Improve the description of a memory fence (Oak Zeng)
- Add a reference to the document in the Xe RFC.
- Add pointers to sample uAPI suggestions
v3:
- Address review comments (Danilo Krummrich)
- Formatting fixes
v4:
- Address typos (Francois Dugast)
- Explain why in-fences are not allowed for VM_BIND operations for long-
  running workloads (Matthew Brost)
v5:
- More typo- and style fixing
- Further clarify the implications of disallowing in-fences for VM_BIND
  operations for long-running workloads (Matthew Brost)
v6:
- Point out that a gpu_vm is a virtual GPU Address space.
  (Danilo Krummrich)
- For an explanation of dma-fences point to the dma-fence documentation.
  (Paulo Zanoni)
- Clarify that VM_BIND errors are reported synchronously. (Paulo Zanoni)
- Use an rst doc reference when pointing to the async vm_bind document
  from the xe merge plan.
- Add the VM_BIND documentation to the drm documentation table-of-content,
  using an intermediate "Misc DRM driver uAPI- and feature implementation
  guidelines"
v7:
- Update the error handling documentation to remove the VM error state.
v8:
- Clarify error handling and difference in operation support between
  async VM_BIND and sync VM_BIND. (Paulo Zanoni)
- Update the sample uAPI with a self-contained example. (Paulo Zanoni)

Cc: Paulo R Zanoni <paulo.r.zanoni@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Acked-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Danilo Krummrich <dakr@redhat.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
---
 Documentation/gpu/drm-vm-bind-async.rst       | 309 ++++++++++++++++++
 .../gpu/implementation_guidelines.rst         |   9 +
 Documentation/gpu/index.rst                   |   1 +
 Documentation/gpu/rfc/xe.rst                  |   4 +-
 4 files changed, 321 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/gpu/drm-vm-bind-async.rst
 create mode 100644 Documentation/gpu/implementation_guidelines.rst

diff --git a/Documentation/gpu/drm-vm-bind-async.rst b/Documentation/gpu/drm-vm-bind-async.rst
new file mode 100644
index 000000000000..3d709d02099c
--- /dev/null
+++ b/Documentation/gpu/drm-vm-bind-async.rst
@@ -0,0 +1,309 @@
+.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+====================
+Asynchronous VM_BIND
+====================
+
+Nomenclature:
+=============
+
+* ``VRAM``: On-device memory. Sometimes referred to as device local memory.
+
+* ``gpu_vm``: A virtual GPU address space. Typically per process, but
+  can be shared by multiple processes.
+
+* ``VM_BIND``: An operation or a list of operations to modify a gpu_vm using
+  an IOCTL. The operations include mapping and unmapping system- or
+  VRAM memory.
+
+* ``syncobj``: A container that abstracts synchronization objects. The
+  synchronization objects can be either generic, like dma-fences or
+  driver specific. A syncobj typically indicates the type of the
+  underlying synchronization object.
+
+* ``in-syncobj``: Argument to a VM_BIND IOCTL, the VM_BIND operation waits
+  for these before starting.
+
+* ``out-syncobj``: Argument to a VM_BIND_IOCTL, the VM_BIND operation
+  signals these when the bind operation is complete.
+
+* ``dma-fence``: A cross-driver synchronization object. A basic
+  understanding of dma-fences is required to digest this
+  document. Please refer to the ``DMA Fences`` section of the
+  :doc:`dma-buf doc </driver-api/dma-buf>`.
+
+* ``memory fence``: A synchronization object, different from a dma-fence.
+  A memory fence uses the value of a specified memory location to determine
+  signaled status. A memory fence can be awaited and signaled by both
+  the GPU and CPU. Memory fences are sometimes referred to as
+  user-fences, userspace-fences or gpu futexes and do not necessarily obey
+  the dma-fence rule of signaling within a "reasonable amount of time".
+  The kernel should thus avoid waiting for memory fences with locks held.
+
+* ``long-running workload``: A workload that may take more than the
+  current stipulated dma-fence maximum signal delay to complete and
+  which therefore needs to set the gpu_vm or the GPU execution context in
+  a certain mode that disallows completion dma-fences.
+
+* ``exec function``: An exec function is a function that revalidates all
+  affected gpu_vmas, submits a GPU command batch and registers the
+  dma_fence representing the GPU command's activity with all affected
+  dma_resvs. For completeness, although not covered by this document,
+  it's worth mentioning that an exec function may also be the
+  revalidation worker that is used by some drivers in compute /
+  long-running mode.
+
+* ``bind context``: A context identifier used for the VM_BIND
+  operation. VM_BIND operations that use the same bind context can be
+  assumed, where it matters, to complete in order of submission. No such
+  assumptions can be made for VM_BIND operations using separate bind contexts.
+
+* ``UMD``: User-mode driver.
+
+* ``KMD``: Kernel-mode driver.
+
+
+Synchronous / Asynchronous VM_BIND operation
+============================================
+
+Synchronous VM_BIND
+___________________
+With Synchronous VM_BIND, the VM_BIND operations all complete before the
+IOCTL returns. A synchronous VM_BIND takes neither in-fences nor
+out-fences. Synchronous VM_BIND may block and wait for GPU operations;
+for example swap-in or clearing, or even previous binds.
+
+Asynchronous VM_BIND
+____________________
+Asynchronous VM_BIND accepts both in-syncobjs and out-syncobjs. While the
+IOCTL may return immediately, the VM_BIND operations wait for the in-syncobjs
+before modifying the GPU page-tables, and signal the out-syncobjs when
+the modification is done in the sense that the next exec function that
+awaits for the out-syncobjs will see the change. Errors are reported
+synchronously.
+In low-memory situations the implementation may block, performing the
+VM_BIND synchronously, because there might not be enough memory
+immediately available for preparing the asynchronous operation.
+
+If the VM_BIND IOCTL takes a list or an array of operations as an argument,
+the in-syncobjs needs to signal before the first operation starts to
+execute, and the out-syncobjs signal after the last operation
+completes. Operations in the operation list can be assumed, where it
+matters, to complete in order.
+
+Since asynchronous VM_BIND operations may use dma-fences embedded in
+out-syncobjs and internally in KMD to signal bind completion,  any
+memory fences given as VM_BIND in-fences need to be awaited
+synchronously before the VM_BIND ioctl returns, since dma-fences,
+required to signal in a reasonable amount of time, can never be made
+to depend on memory fences that don't have such a restriction.
+
+The purpose of an Asynchronous VM_BIND operation is for user-mode
+drivers to be able to pipeline interleaved gpu_vm modifications and
+exec functions. For long-running workloads, such pipelining of a bind
+operation is not allowed and any in-fences need to be awaited
+synchronously. The reason for this is twofold. First, any memory
+fences gated by a long-running workload and used as in-syncobjs for the
+VM_BIND operation will need to be awaited synchronously anyway (see
+above). Second, any dma-fences used as in-syncobjs for VM_BIND
+operations for long-running workloads will not allow for pipelining
+anyway since long-running workloads don't allow for dma-fences as
+out-syncobjs, so while theoretically possible the use of them is
+questionable and should be rejected until there is a valuable use-case.
+Note that this is not a limitation imposed by dma-fence rules, but
+rather a limitation imposed to keep KMD implementation simple. It does
+not affect using dma-fences as dependencies for the long-running
+workload itself, which is allowed by dma-fence rules, but rather for
+the VM_BIND operation only.
+
+An asynchronous VM_BIND operation may take substantial time to
+complete and signal the out_fence. In particular if the operation is
+deeply pipelined behind other VM_BIND operations and workloads
+submitted using exec functions. In that case, UMD might want to avoid a
+subsequent VM_BIND operation to be queued behind the first one if
+there are no explicit dependencies. In order to circumvent such a queue-up, a
+VM_BIND implementation may allow for VM_BIND contexts to be
+created. For each context, VM_BIND operations will be guaranteed to
+complete in the order they were submitted, but that is not the case
+for VM_BIND operations executing on separate VM_BIND contexts. Instead
+KMD will attempt to execute such VM_BIND operations in parallel but
+leaving no guarantee that they will actually be executed in
+parallel. There may be internal implicit dependencies that only KMD knows
+about, for example page-table structure changes. A way to attempt
+to avoid such internal dependencies is to have different VM_BIND
+contexts use separate regions of a VM.
+
+Also for VM_BINDS for long-running gpu_vms the user-mode driver should typically
+select memory fences as out-fences since that gives greater flexibility for
+the kernel mode driver to inject other operations into the bind /
+unbind operations. Like for example inserting breakpoints into batch
+buffers. The workload execution can then easily be pipelined behind
+the bind completion using the memory out-fence as the signal condition
+for a GPU semaphore embedded by UMD in the workload.
+
+There is no difference in the operations supported or in
+multi-operation support between asynchronous VM_BIND and synchronous VM_BIND.
+
+Multi-operation VM_BIND IOCTL error handling and interrupts
+===========================================================
+
+The VM_BIND operations of the IOCTL may error for various reasons, for
+example due to lack of resources to complete and due to interrupted
+waits.
+In these situations UMD should preferably restart the IOCTL after
+taking suitable action.
+If UMD has over-committed a memory resource, an -ENOSPC error will be
+returned, and UMD may then unbind resources that are not used at the
+moment and rerun the IOCTL. On -EINTR, UMD should simply rerun the
+IOCTL and on -ENOMEM user-space may either attempt to free known
+system memory resources or fail. In case of UMD deciding to fail a
+bind operation, due to an error return, no additional action is needed
+to clean up the failed operation, and the VM is left in the same state
+as it was before the failing IOCTL.
+Unbind operations are guaranteed not to return any errors due to
+resource constraints, but may return errors due to, for example,
+invalid arguments or the gpu_vm being banned.
+In the case an unexpected error happens during the asynchronous bind
+process, the gpu_vm will be banned, and attempts to use it after banning
+will return -ENOENT.
+
+Example: The Xe VM_BIND uAPI
+============================
+
+Starting with the VM_BIND operation struct, the IOCTL call can take
+zero, one or many such operations. A zero number means only the
+synchronization part of the IOCTL is carried out: an asynchronous
+VM_BIND updates the syncobjects, whereas a sync VM_BIND waits for the
+implicit dependencies to be fulfilled.
+
+.. code-block:: c
+
+   struct drm_xe_vm_bind_op {
+	/**
+	 * @obj: GEM object to operate on, MBZ for MAP_USERPTR, MBZ for UNMAP
+	 */
+	__u32 obj;
+
+	/** @pad: MBZ */
+	__u32 pad;
+
+	union {
+		/**
+		 * @obj_offset: Offset into the object for MAP.
+		 */
+		__u64 obj_offset;
+
+		/** @userptr: user virtual address for MAP_USERPTR */
+		__u64 userptr;
+	};
+
+	/**
+	 * @range: Number of bytes from the object to bind to addr, MBZ for UNMAP_ALL
+	 */
+	__u64 range;
+
+	/** @addr: Address to operate on, MBZ for UNMAP_ALL */
+	__u64 addr;
+
+	/**
+	 * @tile_mask: Mask for which tiles to create binds for, 0 == All tiles,
+	 * only applies to creating new VMAs
+	 */
+	__u64 tile_mask;
+
+       /* Map (parts of) an object into the GPU virtual address range.
+    #define XE_VM_BIND_OP_MAP		0x0
+        /* Unmap a GPU virtual address range */
+    #define XE_VM_BIND_OP_UNMAP		0x1
+        /*
+	 * Map a CPU virtual address range into a GPU virtual
+	 * address range.
+	 */
+    #define XE_VM_BIND_OP_MAP_USERPTR	0x2
+        /* Unmap a gem object from the VM. */
+    #define XE_VM_BIND_OP_UNMAP_ALL	0x3
+        /*
+	 * Make the backing memory of an address range resident if
+	 * possible. Note that this doesn't pin backing memory.
+	 */
+    #define XE_VM_BIND_OP_PREFETCH	0x4
+
+        /* Make the GPU map readonly. */
+    #define XE_VM_BIND_FLAG_READONLY	(0x1 << 16)
+	/*
+	 * Valid on a faulting VM only, do the MAP operation immediately rather
+	 * than deferring the MAP to the page fault handler.
+	 */
+    #define XE_VM_BIND_FLAG_IMMEDIATE	(0x1 << 17)
+	/*
+	 * When the NULL flag is set, the page tables are setup with a special
+	 * bit which indicates writes are dropped and all reads return zero.  In
+	 * the future, the NULL flags will only be valid for XE_VM_BIND_OP_MAP
+	 * operations, the BO handle MBZ, and the BO offset MBZ. This flag is
+	 * intended to implement VK sparse bindings.
+	 */
+    #define XE_VM_BIND_FLAG_NULL	(0x1 << 18)
+	/** @op: Operation to perform (lower 16 bits) and flags (upper 16 bits) */
+	__u32 op;
+
+	/** @mem_region: Memory region to prefetch VMA to, instance not a mask */
+	__u32 region;
+
+	/** @reserved: Reserved */
+	__u64 reserved[2];
+   };
+
+
+The VM_BIND IOCTL argument itself, looks like follows. Note that for
+synchronous VM_BIND, the num_syncs and syncs fields must be zero. Here
+the ``exec_queue_id`` field is the VM_BIND context discussed previously
+that is used to facilitate out-of-order VM_BINDs.
+
+.. code-block:: c
+
+    struct drm_xe_vm_bind {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
+	/** @vm_id: The ID of the VM to bind to */
+	__u32 vm_id;
+
+	/**
+	 * @exec_queue_id: exec_queue_id, must be of class DRM_XE_ENGINE_CLASS_VM_BIND
+	 * and exec queue must have same vm_id. If zero, the default VM bind engine
+	 * is used.
+	 */
+	__u32 exec_queue_id;
+
+	/** @num_binds: number of binds in this IOCTL */
+	__u32 num_binds;
+
+        /* If set, perform an async VM_BIND, if clear a sync VM_BIND */
+    #define XE_VM_BIND_IOCTL_FLAG_ASYNC	(0x1 << 0)
+
+	/** @flag: Flags controlling all operations in this ioctl. */
+	__u32 flags;
+
+	union {
+		/** @bind: used if num_binds == 1 */
+		struct drm_xe_vm_bind_op bind;
+
+		/**
+		 * @vector_of_binds: userptr to array of struct
+		 * drm_xe_vm_bind_op if num_binds > 1
+		 */
+		__u64 vector_of_binds;
+	};
+
+	/** @num_syncs: amount of syncs to wait for or to signal on completion. */
+	__u32 num_syncs;
+
+	/** @pad2: MBZ */
+	__u32 pad2;
+
+	/** @syncs: pointer to struct drm_xe_sync array */
+	__u64 syncs;
+
+	/** @reserved: Reserved */
+	__u64 reserved[2];
+    };
diff --git a/Documentation/gpu/implementation_guidelines.rst b/Documentation/gpu/implementation_guidelines.rst
new file mode 100644
index 000000000000..138e637dcc6b
--- /dev/null
+++ b/Documentation/gpu/implementation_guidelines.rst
@@ -0,0 +1,9 @@
+.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+===========================================================
+Misc DRM driver uAPI- and feature implementation guidelines
+===========================================================
+
+.. toctree::
+
+   drm-vm-bind-async
diff --git a/Documentation/gpu/index.rst b/Documentation/gpu/index.rst
index e45ff0915246..37e383ccf73f 100644
--- a/Documentation/gpu/index.rst
+++ b/Documentation/gpu/index.rst
@@ -18,6 +18,7 @@ GPU Driver Developer's Guide
    vga-switcheroo
    vgaarbiter
    automated_testing
+   implementation_guidelines
    todo
    rfc/index
 
diff --git a/Documentation/gpu/rfc/xe.rst b/Documentation/gpu/rfc/xe.rst
index b67f8e6a1825..c29113a0ac30 100644
--- a/Documentation/gpu/rfc/xe.rst
+++ b/Documentation/gpu/rfc/xe.rst
@@ -97,8 +97,8 @@ memory fences. Ideally with helper support so people don't get it wrong in all
 possible ways.
 
 As a key measurable result, the benefits of ASYNC VM_BIND and a discussion of
-various flavors, error handling and a sample API should be documented here or in
-a separate document pointed to by this document.
+various flavors, error handling and sample API suggestions are documented in
+:doc:`The ASYNC VM_BIND document </gpu/drm-vm-bind-async>`.
 
 Userptr integration and vm_bind
 -------------------------------
-- 
2.41.0

