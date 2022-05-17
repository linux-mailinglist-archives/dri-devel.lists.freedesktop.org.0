Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9E752AAE7
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 20:32:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0170310E2B6;
	Tue, 17 May 2022 18:32:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B51510EF19;
 Tue, 17 May 2022 18:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652812358; x=1684348358;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kgMY3d+VXJZTia6qE/lU6k5AWa28MSbpnTEr8jKtB0g=;
 b=GWBITAvL+fYUJo0l0EUnqaJ0cbC6MGZ7MOiwH7RTyqiEEm8IeaA0KiwK
 FkcCg1cQY+PAXOyx9KedDczO4Z532hDZjlRJUPfKiO262Fs8i7ClygYFz
 Dz+5zDSex7TWcvk4stTk6i/FuF0e9xKeQTZ9DRMpxLWpDTE4ds19yaTgj
 5FgF8RCEG0kSLApRgx6RTRMTtpmxaG6Y0foxZtAj114vTyq+nJ5NygyJz
 Uuv2pE+ExthVEDmfxB3QatOYGqfrG5ZOq1tsi9dK4HEMmAkzRNPB5JA6M
 LxCpr8KSjvnnK4jkwRpfvKi/Njxxswg6yGN21fHZLhtu7wGonsKrSlIuo Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10350"; a="251179147"
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; d="scan'208";a="251179147"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2022 11:32:37 -0700
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; d="scan'208";a="597287382"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 17 May 2022 11:32:37 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@intel.com
Subject: [RFC v3 1/3] drm/doc/rfc: VM_BIND feature design document
Date: Tue, 17 May 2022 11:32:10 -0700
Message-Id: <20220517183212.20274-2-niranjana.vishwanathapura@intel.com>
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

VM_BIND design document with description of intended use cases.

v2: Add more documentation and format as per review comments
    from Daniel.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 Documentation/driver-api/dma-buf.rst   |   2 +
 Documentation/gpu/rfc/i915_vm_bind.rst | 304 +++++++++++++++++++++++++
 Documentation/gpu/rfc/index.rst        |   4 +
 3 files changed, 310 insertions(+)
 create mode 100644 Documentation/gpu/rfc/i915_vm_bind.rst

diff --git a/Documentation/driver-api/dma-buf.rst b/Documentation/driver-api/dma-buf.rst
index 36a76cbe9095..64cb924ec5bb 100644
--- a/Documentation/driver-api/dma-buf.rst
+++ b/Documentation/driver-api/dma-buf.rst
@@ -200,6 +200,8 @@ DMA Fence uABI/Sync File
 .. kernel-doc:: include/linux/sync_file.h
    :internal:
 
+.. _indefinite_dma_fences:
+
 Indefinite DMA Fences
 ~~~~~~~~~~~~~~~~~~~~~
 
diff --git a/Documentation/gpu/rfc/i915_vm_bind.rst b/Documentation/gpu/rfc/i915_vm_bind.rst
new file mode 100644
index 000000000000..f1be560d313c
--- /dev/null
+++ b/Documentation/gpu/rfc/i915_vm_bind.rst
@@ -0,0 +1,304 @@
+==========================================
+I915 VM_BIND feature design and use cases
+==========================================
+
+VM_BIND feature
+================
+DRM_I915_GEM_VM_BIND/UNBIND ioctls allows UMD to bind/unbind GEM buffer
+objects (BOs) or sections of a BOs at specified GPU virtual addresses on a
+specified address space (VM). These mappings (also referred to as persistent
+mappings) will be persistent across multiple GPU submissions (execbuff calls)
+issued by the UMD, without user having to provide a list of all required
+mappings during each submission (as required by older execbuff mode).
+
+VM_BIND/UNBIND ioctls will support 'in' and 'out' fences to allow userpace
+to specify how the binding/unbinding should sync with other operations
+like the GPU job submission. These fences will be timeline 'drm_syncobj's
+for non-Compute contexts (See struct drm_i915_vm_bind_ext_timeline_fences).
+For Compute contexts, they will be user/memory fences (See struct
+drm_i915_vm_bind_ext_user_fence).
+
+VM_BIND feature is advertised to user via I915_PARAM_HAS_VM_BIND.
+User has to opt-in for VM_BIND mode of binding for an address space (VM)
+during VM creation time via I915_VM_CREATE_FLAGS_USE_VM_BIND extension.
+
+VM_BIND/UNBIND ioctl will immediately start binding/unbinding the mapping in an
+async worker. The binding and unbinding will work like a special GPU engine.
+The binding and unbinding operations are serialized and will wait on specified
+input fences before the operation and will signal the output fences upon the
+completion of the operation. Due to serialization, completion of an operation
+will also indicate that all previous operations are also complete.
+
+VM_BIND features include:
+
+* Multiple Virtual Address (VA) mappings can map to the same physical pages
+  of an object (aliasing).
+* VA mapping can map to a partial section of the BO (partial binding).
+* Support capture of persistent mappings in the dump upon GPU error.
+* TLB is flushed upon unbind completion. Batching of TLB flushes in some
+  use cases will be helpful.
+* Asynchronous vm_bind and vm_unbind support with 'in' and 'out' fences.
+* Support for userptr gem objects (no special uapi is required for this).
+
+Execbuff ioctl in VM_BIND mode
+-------------------------------
+The execbuff ioctl handling in VM_BIND mode differs significantly from the
+older method. A VM in VM_BIND mode will not support older execbuff mode of
+binding. In VM_BIND mode, execbuff ioctl will not accept any execlist. Hence,
+no support for implicit sync. It is expected that the below work will be able
+to support requirements of object dependency setting in all use cases:
+
+"dma-buf: Add an API for exporting sync files"
+(https://lwn.net/Articles/859290/)
+
+This also means, we need an execbuff extension to pass in the batch
+buffer addresses (See struct drm_i915_gem_execbuffer_ext_batch_addresses).
+
+If at all execlist support in execbuff ioctl is deemed necessary for
+implicit sync in certain use cases, then support can be added later.
+
+In VM_BIND mode, VA allocation is completely managed by the user instead of
+the i915 driver. Hence all VA assignment, eviction are not applicable in
+VM_BIND mode. Also, for determining object activeness, VM_BIND mode will not
+be using the i915_vma active reference tracking. It will instead use dma-resv
+object for that (See `VM_BIND dma_resv usage`_).
+
+So, a lot of existing code in the execbuff path like relocations, VA evictions,
+vma lookup table, implicit sync, vma active reference tracking etc., are not
+applicable in VM_BIND mode. Hence, the execbuff path needs to be cleaned up
+by clearly separating out the functionalities where the VM_BIND mode differs
+from older method and they should be moved to separate files.
+
+VM_PRIVATE objects
+-------------------
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
+submission, they need only one dma-resv fence list updated. Thus, the fast
+path (where required mappings are already bound) submission latency is O(1)
+w.r.t the number of VM private BOs.
+
+VM_BIND locking hirarchy
+-------------------------
+The locking design here supports the older (execlist based) execbuff mode, the
+newer VM_BIND mode, the VM_BIND mode with GPU page faults and possible future
+system allocator support (See `Shared Virtual Memory (SVM) support`_).
+The older execbuff mode and the newer VM_BIND mode without page faults manages
+residency of backing storage using dma_fence. The VM_BIND mode with page faults
+and the system allocator support do not use any dma_fence at all.
+
+VM_BIND locking order is as below.
+
+1) Lock-A: A vm_bind mutex will protect vm_bind lists. This lock is taken in
+   vm_bind/vm_unbind ioctl calls, in the execbuff path and while releasing the
+   mapping.
+
+   In future, when GPU page faults are supported, we can potentially use a
+   rwsem instead, so that multiple page fault handlers can take the read side
+   lock to lookup the mapping and hence can run in parallel.
+   The older execbuff mode of binding do not need this lock.
+
+2) Lock-B: The object's dma-resv lock will protect i915_vma state and needs to
+   be held while binding/unbinding a vma in the async worker and while updating
+   dma-resv fence list of an object. Note that private BOs of a VM will all
+   share a dma-resv object.
+
+   The future system allocator support will use the HMM prescribed locking
+   instead.
+
+3) Lock-C: Spinlock/s to protect some of the VM's lists like the list of
+   invalidated vmas (due to eviction and userptr invalidation) etc.
+
+When GPU page faults are supported, the execbuff path do not take any of these
+locks. There we will simply smash the new batch buffer address into the ring and
+then tell the scheduler run that. The lock taking only happens from the page
+fault handler, where we take lock-A in read mode, whichever lock-B we need to
+find the backing storage (dma_resv lock for gem objects, and hmm/core mm for
+system allocator) and some additional locks (lock-D) for taking care of page
+table races. Page fault mode should not need to ever manipulate the vm lists,
+so won't ever need lock-C.
+
+VM_BIND LRU handling
+---------------------
+We need to ensure VM_BIND mapped objects are properly LRU tagged to avoid
+performance degradation. We will also need support for bulk LRU movement of
+VM_BIND objects to avoid additional latencies in execbuff path.
+
+The page table pages are similar to VM_BIND mapped objects (See
+`Evictable page table allocations`_) and are maintained per VM and needs to
+be pinned in memory when VM is made active (ie., upon an execbuff call with
+that VM). So, bulk LRU movement of page table pages is also needed.
+
+The i915 shrinker LRU has stopped being an LRU. So, it should also be moved
+over to the ttm LRU in some fashion to make sure we once again have a reasonable
+and consistent memory aging and reclaim architecture.
+
+VM_BIND dma_resv usage
+-----------------------
+Fences needs to be added to all VM_BIND mapped objects. During each execbuff
+submission, they are added with DMA_RESV_USAGE_BOOKKEEP usage to prevent
+over sync (See enum dma_resv_usage). One can override it with either
+DMA_RESV_USAGE_READ or DMA_RESV_USAGE_WRITE usage during object dependency
+setting (either through explicit or implicit mechanism).
+
+When vm_bind is called for a non-private object while the VM is already
+active, the fences need to be copied from VM's shared dma-resv object
+(common to all private objects of the VM) to this non-private object.
+If this results in performance degradation, then some optimization will
+be needed here. This is not a problem for VM's private objects as they use
+shared dma-resv object which is always updated on each execbuff submission.
+
+Also, in VM_BIND mode, use dma-resv apis for determining object activeness
+(See dma_resv_test_signaled() and dma_resv_wait_timeout()) and do not use the
+older i915_vma active reference tracking which is deprecated. This should be
+easier to get it working with the current TTM backend. We can remove the
+i915_vma active reference tracking fully while supporting TTM backend for igfx.
+
+Evictable page table allocations
+---------------------------------
+Make pagetable allocations evictable and manage them similar to VM_BIND
+mapped objects. Page table pages are similar to persistent mappings of a
+VM (difference here are that the page table pages will not have an i915_vma
+structure and after swapping pages back in, parent page link needs to be
+updated).
+
+Mesa use case
+--------------
+VM_BIND can potentially reduce the CPU overhead in Mesa (both Vulkan and Iris),
+hence improving performance of CPU-bound applications. It also allows us to
+implement Vulkan's Sparse Resources. With increasing GPU hardware performance,
+reducing CPU overhead becomes more impactful.
+
+
+VM_BIND Compute support
+========================
+
+User/Memory Fence
+------------------
+The idea is to take a user specified virtual address and install an interrupt
+handler to wake up the current task when the memory location passes the user
+supplied filter. User/Memory fence is a <address, value> pair. To signal the
+user fence, specified value will be written at the specified virtual address
+and wakeup the waiting process. User can wait on a user fence with the
+gem_wait_user_fence ioctl.
+
+It also allows the user to emit their own MI_FLUSH/PIPE_CONTROL notify
+interrupt within their batches after updating the value to have sub-batch
+precision on the wakeup. Each batch can signal a user fence to indicate
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
+Long running Compute contexts
+------------------------------
+Usage of dma-fence expects that they complete in reasonable amount of time.
+Compute on the other hand can be long running. Hence it is appropriate for
+compute to use user/memory fence and dma-fence usage will be limited to
+in-kernel consumption only. This requires an execbuff uapi extension to pass
+in user fence (See struct drm_i915_vm_bind_ext_user_fence). Compute must opt-in
+for this mechanism with I915_CONTEXT_CREATE_FLAGS_LONG_RUNNING flag during
+context creation. The dma-fence based user interfaces like gem_wait ioctl and
+execbuff out fence are not allowed on long running contexts. Implicit sync is
+not valid as well and is anyway not supported in VM_BIND mode.
+
+Where GPU page faults are not available, kernel driver upon buffer invalidation
+will initiate a suspend (preemption) of long running context with a dma-fence
+attached to it. And upon completion of that suspend fence, finish the
+invalidation, revalidate the BO and then resume the compute context. This is
+done by having a per-context preempt fence (also called suspend fence) proxying
+as i915_request fence. This suspend fence is enabled when someone tries to wait
+on it, which then triggers the context preemption.
+
+As this support for context suspension using a preempt fence and the resume work
+for the compute mode contexts can get tricky to get it right, it is better to
+add this support in drm scheduler so that multiple drivers can make use of it.
+That means, it will have a dependency on i915 drm scheduler conversion with GuC
+scheduler backend. This should be fine, as the plan is to support compute mode
+contexts only with GuC scheduler backend (at least initially). This is much
+easier to support with VM_BIND mode compared to the current heavier execbuff
+path resource attachment.
+
+Low Latency Submission
+-----------------------
+Allows compute UMD to directly submit GPU jobs instead of through execbuff
+ioctl. This is made possible by VM_BIND is not being synchronized against
+execbuff. VM_BIND allows bind/unbind of mappings required for the directly
+submitted jobs.
+
+Other VM_BIND use cases
+========================
+
+Debugger
+---------
+With debug event interface user space process (debugger) is able to keep track
+of and act upon resources created by another process (debugged) and attached
+to GPU via vm_bind interface.
+
+GPU page faults
+----------------
+GPU page faults when supported (in future), will only be supported in the
+VM_BIND mode. While both the older execbuff mode and the newer VM_BIND mode of
+binding will require using dma-fence to ensure residency, the GPU page faults
+mode when supported, will not use any dma-fence as residency is purely managed
+by installing and removing/invalidating page table entries.
+
+Page level hints settings
+--------------------------
+VM_BIND allows any hints setting per mapping instead of per BO.
+Possible hints include read-only mapping, placement and atomicity.
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
+abstraction) using the HMM interface. SVM is only supported with GPU page
+faults enabled.
+
+
+Broder i915 cleanups
+=====================
+Supporting this whole new vm_bind mode of binding which comes with its own
+use cases to support and the locking requirements requires proper integration
+with the existing i915 driver. This calls for some broader i915 driver
+cleanups/simplifications for maintainability of the driver going forward.
+Here are few things identified and are being looked into.
+
+- Remove vma lookup cache (eb->gem_context->handles_vma). VM_BIND feature
+  do not use it and complexity it brings in is probably more than the
+  performance advantage we get in legacy execbuff case.
+- Remove vma->open_count counting
+- Remove i915_vma active reference tracking. VM_BIND feature will not be using
+  it. Instead use underlying BO's dma-resv fence list to determine if a i915_vma
+  is active or not.
+
+
+VM_BIND UAPI
+=============
+
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

