Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8C777CD2F
	for <lists+dri-devel@lfdr.de>; Tue, 15 Aug 2023 15:12:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 886B410E1B6;
	Tue, 15 Aug 2023 13:12:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7909710E182;
 Tue, 15 Aug 2023 13:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692105136; x=1723641136;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=atd57xgbwjpMIEvd12NuIH1rfQR5AtnfgdNfQWZfXwc=;
 b=QraJdlFi7IF6cbJaQ7sMPFHmIMmr0LUK9d1+imdpDFfUYatEX7M90VcE
 Xu9jQN5wZkPU7FdgIWACjxGpN9xnxcP8aPA8NYi5Y23+WW+gTfTNbITbO
 3JuNpae8Sxd0coUfA7/7GmeggdznD7fWeXgoOvbeQOFQn3o+pjR0wJNoV
 tInvgtT4f2+pYj0kd6TK9L3PNvwHCgEJHkvfAfVXgIukqCOfxja0XAQM6
 gGQyEVUm2bPhjDJsIV4glB03ACtOLIAYyz6/nAhWVUZJYilLp1Ky5s4zr
 NBTeuij8sJiwmLzN3v313pNAikfaso6fCcc7CW7OrxKuwcyQOpakrXimO g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="436165697"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; d="scan'208";a="436165697"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2023 06:12:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="768811686"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; d="scan'208";a="768811686"
Received: from fnygreen-mobl1.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.187])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2023 06:12:07 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v6] Documentation/gpu: Add a VM_BIND async document
Date: Tue, 15 Aug 2023 15:11:40 +0200
Message-ID: <20230815131140.37844-1-thomas.hellstrom@linux.intel.com>
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
	Paulo R <paulo.r.zanoni@intel.com>, linux-kernel@vger.kernel.org,
	Oak Zeng <oak.zeng@intel.com>, Danilo Krummrich <dakr@redhat.com>,
	dri-devel@lists.freedesktop.org,
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Zanoni@freedesktop.org,
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
  (Paolo Zanoni)
- Clarify that VM_BIND errors are reported synchronously. (Paolo Zanoni)
- Use an rst doc reference when pointing to the async vm_bind document
  from the xe merge plan.
- Add the VM_BIND documentation to the drm documentation table-of-content,
  using an intermediate "Misc DRM driver uAPI- and feature implementation
  guidelines"

Cc: Zanoni, Paulo R <paulo.r.zanoni@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Acked-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Danilo Krummrich <dakr@redhat.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 Documentation/gpu/drm-vm-bind-async.rst       | 178 ++++++++++++++++++
 .../gpu/implementation_guidelines.rst         |  11 ++
 Documentation/gpu/index.rst                   |   1 +
 Documentation/gpu/rfc/xe.rst                  |   4 +-
 4 files changed, 192 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/gpu/drm-vm-bind-async.rst
 create mode 100644 Documentation/gpu/implementation_guidelines.rst

diff --git a/Documentation/gpu/drm-vm-bind-async.rst b/Documentation/gpu/drm-vm-bind-async.rst
new file mode 100644
index 000000000000..80cd93a5b59c
--- /dev/null
+++ b/Documentation/gpu/drm-vm-bind-async.rst
@@ -0,0 +1,178 @@
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
+To aid in supporting user-space queues, the VM_BIND may take a bind context.
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
+Also for VM_BINDS for long-running gpu_vms the user-mode driver should typically
+select memory fences as out-fences since that gives greater flexibility for
+the kernel mode driver to inject other operations into the bind /
+unbind operations. Like for example inserting breakpoints into batch
+buffers. The workload execution can then easily be pipelined behind
+the bind completion using the memory out-fence as the signal condition
+for a GPU semaphore embedded by UMD in the workload.
+
+Multi-operation VM_BIND IOCTL error handling and interrupts
+===========================================================
+
+The VM_BIND operations of the IOCTL may error due to lack of resources
+to complete and also due to interrupted waits. In both situations UMD
+should preferably restart the IOCTL after taking suitable action. If
+UMD has over-committed a memory resource, an -ENOSPC error will be
+returned, and UMD may then unbind resources that are not used at the
+moment and restart the IOCTL. On -EINTR, UMD should simply restart the
+IOCTL and on -ENOMEM user-space may either attempt to free known
+system memory resources or abort the operation. If aborting as a
+result of a failed operation in a list of operations, some operations
+may still have completed, and to get back to a known state, user-space
+should therefore attempt to unbind all virtual memory regions touched
+by the failing IOCTL.
+Unbind operations are guaranteed not to cause any errors due to
+resource constraints.
+In between a failed VM_BIND IOCTL and a successful restart there may
+be implementation defined restrictions on the use of the gpu_vm. For a
+description why, please see KMD implementation details under `error
+state saving`_.
+
+Sample uAPI implementations
+===========================
+Suggested uAPI implementations at the moment of writing can be found for
+the `Nouveau driver
+<https://patchwork.freedesktop.org/patch/543260/?series=112994&rev=6>`_.
+and for the `Xe driver
+<https://cgit.freedesktop.org/drm/drm-xe/diff/include/uapi/drm/xe_drm.h?h=drm-xe-next&id=9cb016ebbb6a275f57b1cb512b95d5a842391ad7>`_.
+
+KMD implementation details
+==========================
+
+Error state saving
+__________________
+Open: When the VM_BIND IOCTL returns an error, some or even parts of
+an operation may have been completed. If the IOCTL is restarted, in
+order to know where to restart, the KMD can either put the gpu_vm in
+an error state and save one instance of the needed restart state
+internally. In this case, KMD needs to block further modifications of
+the gpu_vm state that may cause additional failures requiring a
+restart state save, until the error has been fully resolved. If the
+uAPI instead defines a pointer to a UMD allocated cookie in the IOCTL
+struct, it could also choose to store the restart state in that cookie.
+
+The restart state may, for example, be the number of successfully
+completed operations.
+
+Easiest for UMD would of course be if KMD did a full unwind on error
+so that no error state needs to be saved.
diff --git a/Documentation/gpu/implementation_guidelines.rst b/Documentation/gpu/implementation_guidelines.rst
new file mode 100644
index 000000000000..32907bbf4c99
--- /dev/null
+++ b/Documentation/gpu/implementation_guidelines.rst
@@ -0,0 +1,11 @@
+.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+===========================================================
+Misc DRM driver uAPI- and feature implementation guidelines
+===========================================================
+
+.. toctree::
+
+   drm-vm-bind-async
+
+  
diff --git a/Documentation/gpu/index.rst b/Documentation/gpu/index.rst
index eee5996acf2c..015b3fe726de 100644
--- a/Documentation/gpu/index.rst
+++ b/Documentation/gpu/index.rst
@@ -17,6 +17,7 @@ GPU Driver Developer's Guide
    backlight
    vga-switcheroo
    vgaarbiter
+   implementation_guidelines
    todo
    rfc/index
 
diff --git a/Documentation/gpu/rfc/xe.rst b/Documentation/gpu/rfc/xe.rst
index 2516fe141db6..e095b23e3dfd 100644
--- a/Documentation/gpu/rfc/xe.rst
+++ b/Documentation/gpu/rfc/xe.rst
@@ -138,8 +138,8 @@ memory fences. Ideally with helper support so people don't get it wrong in all
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

