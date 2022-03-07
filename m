Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6234D0852
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 21:30:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AB1410E17A;
	Mon,  7 Mar 2022 20:30:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B12D010E173;
 Mon,  7 Mar 2022 20:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646685005; x=1678221005;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/4F4SAwj8com9NdxTxbhkS5t+ooXG3AchyPGGvLaJgU=;
 b=j/kmm67geZxFdqJl8JclcFPf5cyXBV1JLREAu0SGQXUOAPC5oPHEwkO+
 EMi7aW3YyQSk2SL+ERqDhR7qnX5wjr3zJ4xWqJMV1Snd/d4yzYO8ajkPi
 /WIPv3VXZ0tKQJkRqEZGRVdpjHzJ69DW0Qq1WZmrLXRA9yOy8JlTHAIye
 yhRmckrVFXYhoFV82ER3nO7lYPsY7Qy8TKNv7mu1UXojkeuPhqm7z0r/S
 vsfHeRvSk3Tdi6ZHNglD+m6TFTo3ydobI7GBQCewJwkrm9eQ/8JmaJms+
 Xplagv90mLt6AlYYSyWabK6AhDG2bgFWtWN4rWkaBNqOFmDWoxxmPVUeY w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="241932981"
X-IronPort-AV: E=Sophos;i="5.90,163,1643702400"; d="scan'208";a="241932981"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 12:29:43 -0800
X-IronPort-AV: E=Sophos;i="5.90,163,1643702400"; d="scan'208";a="495188049"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 07 Mar 2022 12:29:41 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC v2 1/2] drm/doc/rfc: VM_BIND feature design document
Date: Mon,  7 Mar 2022 12:31:45 -0800
Message-Id: <20220307203146.648-2-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20220307203146.648-1-niranjana.vishwanathapura@intel.com>
References: <20220307203146.648-1-niranjana.vishwanathapura@intel.com>
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
Cc: daniel.vetter@intel.com, thomas.hellstrom@intel.com,
 chris.p.wilson@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VM_BIND design document with description of intended use cases.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 Documentation/gpu/rfc/i915_vm_bind.rst | 210 +++++++++++++++++++++++++
 Documentation/gpu/rfc/index.rst        |   4 +
 2 files changed, 214 insertions(+)
 create mode 100644 Documentation/gpu/rfc/i915_vm_bind.rst

diff --git a/Documentation/gpu/rfc/i915_vm_bind.rst b/Documentation/gpu/rfc/i915_vm_bind.rst
new file mode 100644
index 000000000000..cdc6bb25b942
--- /dev/null
+++ b/Documentation/gpu/rfc/i915_vm_bind.rst
@@ -0,0 +1,210 @@
+==========================================
+I915 VM_BIND feature design and use cases
+==========================================
+
+VM_BIND feature
+================
+DRM_I915_GEM_VM_BIND/UNBIND ioctls allows UMD to bind/unbind GEM buffer
+objects (BOs) or sections of a BOs at specified GPU virtual addresses on
+a specified address space (VM).
+
+These mappings (also referred to as persistent mappings) will be persistent
+across multiple GPU submissions (execbuff) issued by the UMD, without user
+having to provide a list of all required mappings during each submission
+(as required by older execbuff mode).
+
+VM_BIND ioctl deferes binding the mappings until next execbuff submission
+where it will be required, or immediately if I915_GEM_VM_BIND_IMMEDIATE
+flag is set (useful if mapping is required for an active context).
+
+VM_BIND feature is advertised to user via I915_PARAM_HAS_VM_BIND.
+User has to opt-in for VM_BIND mode of binding for an address space (VM)
+during VM creation time via I915_VM_CREATE_FLAGS_USE_VM_BIND extension.
+A VM in VM_BIND mode will not support older execbuff mode of binding.
+
+UMDs can still send BOs of these persistent mappings in execlist of execbuff
+for specifying BO dependencies (implicit fencing) and to use BO as a batch,
+but those BOs should be mapped ahead via vm_bind ioctl.
+
+VM_BIND features include,
+- Multiple Virtual Address (VA) mappings can map to the same physical pages
+  of an object (aliasing).
+- VA mapping can map to a partial section of the BO (partial binding).
+- Support capture of persistent mappings in the dump upon GPU error.
+- TLB is flushed upon unbind completion. Batching of TLB flushes in some
+  usecases will be helpful.
+- Asynchronous vm_bind and vm_unbind support.
+- VM_BIND uses user/memory fence mechanism for signaling bind completion
+  and for signaling batch completion in long running contexts (explained
+  below).
+
+VM_PRIVATE objects
+------------------
+By default, BOs can be mapped on multiple VMs and can also be dma-buf
+exported. Hence these BOs are referred to as Shared BOs.
+During each execbuff submission, the request fence must be added to the
+dma-resv fence list of all shared BOs mapped on the VM.
+
+VM_BIND feature introduces an optimization where user can create BO which
+is private to a specified VM via I915_GEM_CREATE_EXT_VM_PRIVATE flag during
+BO creation. Unlike Shared BOs, these VM private BOs can only be mapped on
+the VM they are private to and can't be dma-buf exported.
+All private BOs of a VM share the dma-resv object. Hence during each execbuff
+submission, they need only one dma-resv fence list updated. Thus the fast
+path (where required mappings are already bound) submission latency is O(1)
+w.r.t the number of VM private BOs.
+
+VM_BIND locking hirarchy
+-------------------------
+VM_BIND locking order is as below.
+
+1) A vm_bind mutex will protect vm_bind lists. This lock is taken in vm_bind/
+   vm_unbind ioctl calls, in the execbuff path and while releasing the mapping.
+
+   In future, when GPU page faults are supported, we can potentially use a
+   rwsem instead, so that multiple pagefault handlers can take the read side
+   lock to lookup the mapping and hence can run in parallel.
+
+2) The BO's dma-resv lock will protect i915_vma state and needs to be held
+   while binding a vma and while updating dma-resv fence list of a BO.
+   The private BOs of a VM will all share a dma-resv object.
+
+   This lock is held in vm_bind call for immediate binding, during vm_unbind
+   call for unbinding and during execbuff path for binding the mapping and
+   updating the dma-resv fence list of the BO.
+
+3) Spinlock/s to protect some of the VM's lists.
+
+We will also need support for bluk LRU movement of persistent mapping to
+avoid additional latencies in execbuff path.
+
+GPU page faults
+----------------
+Both older execbuff mode and the newer VM_BIND mode of binding will require
+using dma-fence to ensure residency.
+In future when GPU page faults are supported, no dma-fence usage is required
+as residency is purely managed by installing and removing/invalidating ptes.
+
+
+User/Memory Fence
+==================
+The idea is to take a user specified virtual address and install an interrupt
+handler to wake up the current task when the memory location passes the user
+supplied filter.
+
+User/Memory fence is a <address, value> pair. To signal the user fence,
+specified value will be written at the specified virtual address and
+wakeup the waiting process. User can wait on an user fence with the
+gem_wait_user_fence ioctl.
+
+It also allows the user to emit their own MI_FLUSH/PIPE_CONTROL notify
+interrupt within their batches after updating the value to have sub-batch
+precision on the wakeup. Each batch can signal an user fence to indicate
+the completion of next level batch. The completion of very first level batch
+needs to be signaled by the command streamer. The user must provide the
+user/memory fence for this via the DRM_I915_GEM_EXECBUFFER_EXT_USER_FENCE
+extension of execbuff ioctl, so that KMD can setup the command streamer to
+signal it.
+
+User/Memory fence can also be supplied to the kernel driver to signal/wake up
+the user process after completion of an asynchronous operation.
+
+When VM_BIND ioctl was provided with a user/memory fence via the
+I915_VM_BIND_EXT_USER_FENCE extension, it will be signaled upon the completion
+of binding of that mapping. All async binds/unbinds are serialized, hence
+signaling of user/memory fence also indicate the completion of all previous
+binds/unbinds.
+
+This feature will be derived from the below original work:
+https://patchwork.freedesktop.org/patch/349417/
+
+
+VM_BIND use cases
+==================
+
+Long running Compute contexts
+------------------------------
+Usage of dma-fence expects that they complete in reasonable amount of time.
+Compute on the other hand can be long running. Hence it is appropriate for
+compute to use user/memory fence and dma-fence usage will be limited to
+in-kernel consumption only. This requires an execbuff uapi extension to pass
+in user fence. Compute must opt-in for this mechanism with
+I915_CONTEXT_CREATE_FLAGS_LONG_RUNNING flag during context creation.
+
+The dma-fence based user interfaces like gem_wait ioctl, execbuff out fence
+and implicit dependency setting is not allowed on long running contexts.
+
+Where GPU page faults are not available, kernel driver upon buffer invalidation
+will initiate a suspend (preemption) of long running context with a dma-fence
+attached to it. And upon completion of that suspend fence, finish the
+invalidation, revalidate the BO and then resume the compute context. This is
+done by having a per-context fence (called suspend fence) proxying as
+i915_request fence. This suspend fence is enabled when there is a wait on it,
+which triggers the context preemption.
+
+This is much easier to support with VM_BIND compared to the current heavier
+execbuff path resource attachment.
+
+Low Latency Submission
+-----------------------
+Allows compute UMD to directly submit GPU jobs instead of through execbuff
+ioctl. VM_BIND allows map/unmap of BOs required for directly submitted jobs.
+
+Debugger
+---------
+With debug event interface user space process (debugger) is able to keep track
+of and act upon resources created by another process (debuggee) and attached
+to GPU via vm_bind interface.
+
+Mesa/Valkun
+------------
+VM_BIND can potentially reduce the CPU-overhead in Mesa thus improving
+performance. For Vulkan it should be straightforward to use VM_BIND.
+For Iris implicit buffer tracking must be implemented before we can harness
+VM_BIND benefits. With increasing GPU hardware performance reducing CPU
+overhead becomes more important.
+
+Page level hints settings
+--------------------------
+VM_BIND allows any hints setting per mapping instead of per BO.
+Possible hints include read-only, placement and atomicity.
+Sub-BO level placement hint will be even more relevant with
+upcoming GPU on-demand page fault support.
+
+Page level Cache/CLOS settings
+-------------------------------
+VM_BIND allows cache/CLOS settings per mapping instead of per BO.
+
+Shared Virtual Memory (SVM) support
+------------------------------------
+VM_BIND interface can be used to map system memory directly (without gem BO
+abstraction) using the HMM interface.
+
+
+Broder i915 cleanups
+=====================
+Supporting this whole new vm_bind mode of binding which comes with its own
+usecases to support and the locking requirements requires proper integration
+with the existing i915 driver. This calls for some broader i915 driver
+cleanups/simplifications for maintainability of the driver going forward.
+Here are few things identified and are being looked into.
+
+- Make pagetable allocations evictable and manage them similar to VM_BIND
+  mapped objects. Page table pages are similar to persistent mappings of a
+  VM (difference here are that the page table pages will not
+  have an i915_vma structure and after swapping pages back in, parent page
+  link needs to be updated).
+- Remove vma lookup cache (eb->gem_context->handles_vma). VM_BIND feature
+  do not use it and complexity it brings in is probably more than the
+  performance advantage we get in legacy execbuff case.
+- Remove vma->open_count counting
+- Remove i915_vma active reference tracking. Instead use underlying BO's
+  dma-resv fence list to determine if a i915_vma is active or not.
+
+These can be worked upon after intitial vm_bind support is added.
+
+
+UAPI
+=====
+Uapi definiton can be found here:
+.. kernel-doc:: Documentation/gpu/rfc/i915_vm_bind.h
diff --git a/Documentation/gpu/rfc/index.rst b/Documentation/gpu/rfc/index.rst
index 91e93a705230..7d10c36b268d 100644
--- a/Documentation/gpu/rfc/index.rst
+++ b/Documentation/gpu/rfc/index.rst
@@ -23,3 +23,7 @@ host such documentation:
 .. toctree::
 
     i915_scheduler.rst
+
+.. toctree::
+
+    i915_vm_bind.rst
-- 
2.21.0.rc0.32.g243a4c7e27

