Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9DB3E22E5
	for <lists+dri-devel@lfdr.de>; Fri,  6 Aug 2021 07:31:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D261B6EA3F;
	Fri,  6 Aug 2021 05:30:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAF5B6EA3C;
 Fri,  6 Aug 2021 05:30:38 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10067"; a="214041533"
X-IronPort-AV: E=Sophos;i="5.84,299,1620716400"; d="scan'208";a="214041533"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2021 22:30:30 -0700
X-IronPort-AV: E=Sophos;i="5.84,299,1620716400"; d="scan'208";a="481274633"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 05 Aug 2021 22:30:30 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: daniel.vetter@intel.com, chris.p.wilson@intel.com,
 thomas.hellstrom@intel.com, paulo.r.zanoni@intel.com
Subject: [RFC 1/2] drm/doc/rfc: VM_BIND feature design document
Date: Thu,  5 Aug 2021 22:30:31 -0700
Message-Id: <20210806053032.2462-2-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20210806053032.2462-1-niranjana.vishwanathapura@intel.com>
References: <20210806053032.2462-1-niranjana.vishwanathapura@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VM_BIND design document with description of intended use cases.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 Documentation/gpu/rfc/i915_vm_bind.rst | 126 +++++++++++++++++++++++++
 Documentation/gpu/rfc/index.rst        |   4 +
 2 files changed, 130 insertions(+)
 create mode 100644 Documentation/gpu/rfc/i915_vm_bind.rst

diff --git a/Documentation/gpu/rfc/i915_vm_bind.rst b/Documentation/gpu/rfc/i915_vm_bind.rst
new file mode 100644
index 000000000000..dbc35262a554
--- /dev/null
+++ b/Documentation/gpu/rfc/i915_vm_bind.rst
@@ -0,0 +1,126 @@
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
+across multiple GPU submissions (execbuff) issued by the UMD, making execbuff
+path leaner with fast path submission latency of O(1) w.r.t the number of
+objects required for that submission.
+
+UMDs can still send BOs of these persistent mappings in execlist of execbuff
+for specifying BO dependencies (implicit fencing) and to use BO as a batch.
+
+The persistent mappings are not individually tracked, instead the address
+space (VM) they are mapped in is tracked to determine if the mappings are
+being referred by GPU job (active) or not.
+
+VM_BIND features include:
+- Different VA mappings can map to the same physical pages of an object
+  (aliasing).
+- VA mapping can map to a partial section of the BO (partial binding).
+- Support capture of mapping in the dump upon GPU error.
+- TLB is flushed upon unbind completion.
+- Asynchronous vm_bind and vm_unbind support.
+- VM_BIND uses user/memory fence mechanism (explained below) for signaling
+  bind completion.
+
+
+User/Memory Fence
+==================
+The idea is to take a user process virtual address and install an interrupt
+handler to wake up the current task when the memory location passes the user
+supplied filter.
+
+It also allows the user to emit their own MI_FLUSH/PIPE_CONTROL notify
+interrupt within their batches after updating the value on the GPU to
+have sub-batch precision on the wakeup.
+
+User/Memory fence <user address and value pair> can also be supplied to the
+kernel driver to signal/wake up the user process after completion of an
+asynchronous operation.
+
+This feature will be derived from the below original work:
+https://patchwork.freedesktop.org/patch/349417/
+
+When VM_BIND ioctl was provided with a user/memory fence via SYNC_FENCE
+extension, it will be signaled upon the completion of binding of that
+mapping. All async binds/unbinds are serialized, hence signaling of
+user/memory fence also indicate the completion of all previous binds/unbinds.
+
+
+TODOs
+======
+- Rebase VM_BIND on top of ongoing i915 TTM adoption changes including
+  eviction support.
+- Various optimizations like around LRU ordering of persistent mappings,
+  batching of TLB flushes etc.
+
+
+Intended use cases
+===================
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
+Compute
+--------
+Usage of dma-fence expects that they complete in reasonable amount of time.
+Compute on the other hand can be long running. Hence it is appropriate for
+compute to use user/memory fence (explained above) and dma-fence usage will
+be limited to in kernel consumption only. Compute must opt-in for this
+mechanism during context creation time with a 'compute_ctx' flag.
+
+Where GPU page faults are not available, kernel driver upon buffer invalidation
+must initiate a compute context suspend with a dma-fence attached to it.
+And upon completion of that suspend fence, finish the invalidation and then
+resume the compute context.
+
+This is much easier to support with VM_BIND instead of the current heavier
+execbuff path resource attachment.
+
+Low Latency Submission
+-----------------------
+Allow compute UMDs to directly submit GPU jobs instead of through execbuff
+ioctl. VM_BIND allows map/unmap of BOs required for directly submitted jobs.
+
+Shared Virtual Memory (SVM) support
+------------------------------------
+VM_BIND interface can be used to map system memory directly (without gem BO
+abstraction) using the HMM interface.
+
+
+Links:
+======
+- Reference WIP VM_BIND implementation can be found here.
+  https://gitlab.freedesktop.org/nvishwa1/nvishwa1-drm-tip
+
+  NOTE: It is WIP and not fully functional. There are known issues which
+  are being worked upon.
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

