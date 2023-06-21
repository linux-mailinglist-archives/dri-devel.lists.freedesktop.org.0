Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2158E737F43
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 12:05:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20C2F10E433;
	Wed, 21 Jun 2023 10:05:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D878810E431;
 Wed, 21 Jun 2023 10:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687341899; x=1718877899;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HOW6aUjKbZBqBWZV7FD3yv7Ct7F9SuAFZay752VVcis=;
 b=eQ0sJK+ctETFZea/U6FMTgbSjgVT+uZPYRJOmvjfLespsnHeD5hqgnrc
 1yVl2TFNGZENixDOM3M4DIsI0fdDmoE7UJ782Yb4lU2yAI9c1PmqiQawh
 YMpm7MIFR0jxSlNh1yArRc+xz9ymevTD0jSC1SFMP3u2n/ERK66gfCPqP
 MwldFn0cf7vMStPKs0aKCJmAMPvuj6so+gszdYqKUFHtJ0Q4e1te80OHp
 s2P7q2d90lWUlIgV/D5Q4P5o9cVhMb+vTqkgIav+2G+oUfpku5eDaHcT9
 UNGlyaRz3i1EQOSfBXOLHh16Sv7r+v0LH6l6qoqD1xkB2qxJ62bY84mIU Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="426081791"
X-IronPort-AV: E=Sophos;i="6.00,260,1681196400"; d="scan'208";a="426081791"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2023 03:04:58 -0700
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="748593093"
X-IronPort-AV: E=Sophos;i="6.00,260,1681196400"; d="scan'208";a="748593093"
Received: from uniemimu-mobl1.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.76])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2023 03:04:55 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2] Documentation/gpu: Add a VM_BIND async draft document
Date: Wed, 21 Jun 2023 12:04:35 +0200
Message-Id: <20230621100435.54425-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.40.1
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
 linux-kernel@vger.kernel.org, Oak Zeng <oak.zeng@intel.com>,
 Danilo Krummrich <dakr@redhat.com>, dri-devel@lists.freedesktop.org,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a motivation for and description of asynchronous VM_BIND operation

v2:
- Fix typos (Nirmoy Das)
- Improve the description of a memory fence (Oak Zeng)
- Add a reference to the document in the Xe RFC.
- Add pointers to sample uAPI suggestions

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Acked-by: Nirmoy Das <nirmoy.das@intel.com>
---
 Documentation/gpu/drm-vm-bind-async.rst | 145 ++++++++++++++++++++++++
 Documentation/gpu/rfc/xe.rst            |   4 +-
 2 files changed, 147 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/gpu/drm-vm-bind-async.rst

diff --git a/Documentation/gpu/drm-vm-bind-async.rst b/Documentation/gpu/drm-vm-bind-async.rst
new file mode 100644
index 000000000000..69aff250b62f
--- /dev/null
+++ b/Documentation/gpu/drm-vm-bind-async.rst
@@ -0,0 +1,145 @@
+====================
+Asynchronous VM_BIND
+====================
+
+Nomenclature:
+=============
+
+* VRAM: On-device memory. Sometimes referred to as device local memory.
+
+* vm: A GPU address space. Typically per process, but can be shared by
+  multiple processes.
+
+* VM_BIND: An operation or a list of operations to modify a vm using
+  an IOCTL. The operations include mapping and unmapping system- or
+  VRAM memory.
+
+* syncobj: A container that abstracts synchronization objects. The
+  synchronization objects can be either generic, like dma-fences or
+  driver specific. A syncobj typically indicates the type of the
+  underlying synchronization object.
+
+* in-syncobj: Argument to a VM_BIND IOCTL, the VM_BIND operation waits
+  for these before starting.
+
+* out-syncbj: Argument to a VM_BIND_IOCTL, the VM_BIND operation
+  signals these when the bind operation is complete.
+
+* memory fence: A synchronization object, different from a dma-fence.
+  A memory fence uses the value of a specified memory location to determine
+  signaled status. A memory fence can be awaited and signaled by both
+  the GPU and CPU. Memory fences are sometimes referred to as
+  user-fences, and do not necessarily bey the dma-fence rule of
+  signalling within a "reasonable amount of time". The kernel should
+  thus avoid waiting for memory fences with locks held.
+
+* long-running workload: A workload that may take more than the
+  current stipulated dma-fence maximum signal delay to complete and
+  which therefore needs to set the VM or the GPU execution context in
+  a certain mode that disallows completion dma-fences.
+
+* UMD: User-mode driver.
+
+* KMD: Kernel-mode driver.
+
+
+Synchronous / Asynchronous VM_BIND operation
+============================================
+
+Synchronous VM_BIND
+___________________
+With Synchronous VM_BIND, the VM_BIND operations all complete before the
+ioctl returns. A synchronous VM_BIND takes neither in-fences nor
+out-fences. Synchronous VM_BIND may block and wait for GPU operations;
+for example swapin or clearing, or even previous binds.
+
+Asynchronous VM_BIND
+____________________
+Asynchronous VM_BIND accepts both in-syncobjs and out-syncobjs. While the
+IOCTL may return immediately, the VM_BIND operations wait for the in-syncobjs
+before modifying the GPU page-tables, and signal the out-syncobjs when
+the modification is done in the sense that the next execbuf that
+awaits for the out-syncobjs will see the change. Errors are reported
+synchronously assuming that the asynchronous part of the job never errors.
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
+To aid in supporting user-space queues, the VM_BIND may take a bind context
+AKA bind engine identifier argument. All VM_BIND operations using the same
+bind engine can then be assumed, where it matters, to complete in
+order. No such assumptions can be made between VM_BIND operations
+using separate bind contexts.
+
+The purpose of an Asynchronous VM_BIND operation is for user-mode
+drivers to be able to pipeline interleaved vm modifications and
+execbufs. For long-running workloads, such pipelining of a bind
+operation is not allowed and any in-fences need to be awaited
+synchronously.
+
+Also for VM_BINDS for long-running VMs the user-mode driver should typically
+select memory fences as out-fences since that gives greater flexibility for
+the kernel mode driver to inject other  operations into the bind /
+unbind operations. Like for example inserting breakpoints into batch
+buffers. The workload execution can then easily be pipelined behind
+the bind completion using the memory out-fence as the signal condition
+for a gpu semaphore embedded by UMD in the workload.
+
+Multi-operation VM_BIND IOCTL error handling and interrupts
+========================================
+
+The VM_BIND operations of the ioctl may error due to lack of resources
+to complete and also due to interrupted waits. In both situations UMD
+should preferably restart the IOCTL after taking suitable action. If
+UMD has overcommitted a memory resource, an -ENOSPC error will be
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
+In between a failed VM_BIND ioctl and a successful restart there may
+be implementation defined restrictions on the use of the VM. For a
+description why, please see KMD implementation details under [error
+state saving]_.
+
+Sample uAPI implementations
+======================
+Suggested uAPI implementations at the moment of writing can be found for
+the Nouveau driver `here: https://patchwork.freedesktop.org/patch/543260/?series=112994&rev=6`
+and for the Xe driver `here: https://cgit.freedesktop.org/drm/drm-xe/diff/include/uapi/drm/xe_drm.h?h=drm-xe-next&id=9cb016ebbb6a275f57b1cb512b95d5a842391ad7`
+
+KMD implementation details
+==========================
+
+.. [error state saving] Open: When the VM_BIND ioctl returns an error, some
+			or even parts of an operation may have been
+			completed. If the ioctl is restarted, in order
+			to know where to restart, the KMD can
+			either put the VM in an error state and save
+			one instance of the needed restart state
+			internally. In this case, KMD needs to block
+			further modifications of the VM state that may
+			cause additional failures requiring a restart
+			state save, until the error has been fully resolved.
+			If the uAPI instead defines a pointer to a
+			UMD allocated cookie in the IOCTL struct, it
+			could also choose to store the restart state
+			in that cookie.
+
+			The restart state may, for example, be the
+			number of successfully completed operations.
+
+			Easiest for UMD would of course be if KMD did
+			a full unwind on error so that no error state
+			needs to be saved.
diff --git a/Documentation/gpu/rfc/xe.rst b/Documentation/gpu/rfc/xe.rst
index 2516fe141db6..0f062e1346d2 100644
--- a/Documentation/gpu/rfc/xe.rst
+++ b/Documentation/gpu/rfc/xe.rst
@@ -138,8 +138,8 @@ memory fences. Ideally with helper support so people don't get it wrong in all
 possible ways.
 
 As a key measurable result, the benefits of ASYNC VM_BIND and a discussion of
-various flavors, error handling and a sample API should be documented here or in
-a separate document pointed to by this document.
+various flavors, error handling and sample API suggestions are documented in
+Documentation/gpu/drm-vm-bind-async.rst
 
 Userptr integration and vm_bind
 -------------------------------
-- 
2.40.1

