Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA12A53FD4
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 02:26:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEDC510E89F;
	Thu,  6 Mar 2025 01:26:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YtIx49n0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E97410E89F;
 Thu,  6 Mar 2025 01:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741224359; x=1772760359;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KbUirHS6hdfTQ0XNhme/SidV6/kXAn55fpcFJkahobA=;
 b=YtIx49n0tjUcxyQ812sOzQUWRPrs7jXP9iYXOGD+7FZQO467qOgrmGf1
 bvkLMckW5Jx20D7cJmsOoDkWjUxZefK5UCqcxuZTucfNXIv9ABkBNLEMq
 sDZJGoudEKH5XATYja4E2y8s/GnT0tvvzPvkpyv3Yb8jaWZryAT+Y0DRT
 nzrsfEwduN04Ob2WBGDMZKrBCyEjDIoctQ9YkF33c3l+QR/bkdux4KwWN
 Ng/6CrA2+DgGKFG+hVRvkgRHyFtR8BgT2QgKkagiCAcwkpnbABfx81jjQ
 iunTP1BdGpM3DRNJnxrxb1GVxWiP3mYUoFdW+Z8l4DZXqsjaFqhZm5dJZ A==;
X-CSE-ConnectionGUID: GDONa4LwScyLWGROritEpA==
X-CSE-MsgGUID: dTBzRQb5S9+uBUOG5gN0hQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="52427447"
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; d="scan'208";a="52427447"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 17:25:55 -0800
X-CSE-ConnectionGUID: 6V07K2ioRgqoi3X1RNMaNQ==
X-CSE-MsgGUID: MpWKmrQSQym+vdU5b8TYzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="124063329"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 17:25:54 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v7 32/32] drm/doc: gpusvm: Add GPU SVM documentation
Date: Wed,  5 Mar 2025 17:26:57 -0800
Message-Id: <20250306012657.3505757-33-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306012657.3505757-1-matthew.brost@intel.com>
References: <20250306012657.3505757-1-matthew.brost@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add documentation for agree upon GPU SVM design principles, current
status, and future plans.

v4:
 - Address Thomas's feedback
v5:
 - s/Current/Basline (Thomas)
v7:
 - Add license (CI)
 - Add examples for design guideline reasoning (Alistair)
 - Add snippet about possible livelock with concurrent GPU and and CPU
   access (Alistair)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 Documentation/gpu/rfc/gpusvm.rst | 106 +++++++++++++++++++++++++++++++
 Documentation/gpu/rfc/index.rst  |   4 ++
 2 files changed, 110 insertions(+)
 create mode 100644 Documentation/gpu/rfc/gpusvm.rst

diff --git a/Documentation/gpu/rfc/gpusvm.rst b/Documentation/gpu/rfc/gpusvm.rst
new file mode 100644
index 000000000000..87d9f9506155
--- /dev/null
+++ b/Documentation/gpu/rfc/gpusvm.rst
@@ -0,0 +1,106 @@
+.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+===============
+GPU SVM Section
+===============
+
+Agreed upon design principles
+=============================
+
+* migrate_to_ram path
+	* Rely only on core MM concepts (migration PTEs, page references, and
+	  page locking).
+	* No driver specific locks other than locks for hardware interaction in
+	  this path. These are not required and generally a bad idea to
+	  invent driver defined locks to seal core MM races.
+	* An example of a driver-specific lock causing issues occurred before
+	  fixing do_swap_page to lock the faulting page. A driver-exclusive lock
+	  in migrate_to_ram produced a stable livelock if enough threads read
+	  the faulting page.
+	* Partial migration is supported (i.e., a subset of pages attempting to
+	  migrate can actually migrate, with only the faulting page guaranteed
+	  to migrate).
+	* Driver handles mixed migrations via retry loops rather than locking.
+* Eviction
+	* Eviction is defined as migrating data from the GPU back to the
+	  CPU without a virtual address to free up GPU memory.
+	* Only looking at physical memory data structures and locks as opposed to
+	  looking at virtual memory data structures and locks.
+	* No looking at mm/vma structs or relying on those being locked.
+	* The rationale for the above two points is that CPU virtual addresses
+	  can change at any moment, while the physical pages remain stable.
+	* GPU page table invalidation, which requires a GPU virtual address, is
+	  handled via the notifier that has access to the GPU virtual address.
+* GPU fault side
+	* mmap_read only used around core MM functions which require this lock
+	  and should strive to take mmap_read lock only in GPU SVM layer.
+	* Big retry loop to handle all races with the mmu notifier under the gpu
+	  pagetable locks/mmu notifier range lock/whatever we end up calling
+          those.
+	* Races (especially against concurrent eviction or migrate_to_ram)
+	  should not be handled on the fault side by trying to hold locks;
+	  rather, they should be handled using retry loops. One possible
+	  exception is holding a BO's dma-resv lock during the initial migration
+	  to VRAM, as this is a well-defined lock that can be taken underneath
+	  the mmap_read lock.
+	* One possible issue with the above approach is if a driver has a strict
+	  migration policy requiring GPU access to occur in GPU memory.
+	  Concurrent CPU access could cause a livelock due to endless retries.
+	  While no current user (Xe) of GPU SVM has such a policy, it is likely
+	  to be added in the future. Ideally, this should be resolved on the
+	  core-MM side rather than through a driver-side lock.
+* Physical memory to virtual backpointer
+	* This does not work, as no pointers from physical memory to virtual
+	  memory should exist. mremap() is an example of the core MM updating
+	  the virtual address without notifying the driver.
+	* The physical memory backpointer (page->zone_device_data) should remain
+	  stable from allocation to page free. Safely updating this against a
+	  concurrent user would be very difficult unless the page is free.
+* GPU pagetable locking
+	* Notifier lock only protects range tree, pages valid state for a range
+	  (rather than seqno due to wider notifiers), pagetable entries, and
+	  mmu notifier seqno tracking, it is not a global lock to protect
+          against races.
+	* All races handled with big retry as mentioned above.
+
+Overview of baseline design
+===========================
+
+Baseline design is simple as possible to get a working basline in which can be
+built upon.
+
+.. kernel-doc:: drivers/gpu/drm/xe/drm_gpusvm.c
+   :doc: Overview
+   :doc: Locking
+   :doc: Migrataion
+   :doc: Partial Unmapping of Ranges
+   :doc: Examples
+
+Possible future design features
+===============================
+
+* Concurrent GPU faults
+	* CPU faults are concurrent so makes sense to have concurrent GPU
+	  faults.
+	* Should be possible with fined grained locking in the driver GPU
+	  fault handler.
+	* No expected GPU SVM changes required.
+* Ranges with mixed system and device pages
+	* Can be added if required to drm_gpusvm_get_pages fairly easily.
+* Multi-GPU support
+	* Work in progress and patches expected after initially landing on GPU
+	  SVM.
+	* Ideally can be done with little to no changes to GPU SVM.
+* Drop ranges in favor of radix tree
+	* May be desirable for faster notifiers.
+* Compound device pages
+	* Nvidia, AMD, and Intel all have agreed expensive core MM functions in
+	  migrate device layer are a performance bottleneck, having compound
+	  device pages should help increase performance by reducing the number
+	  of these expensive calls.
+* Higher order dma mapping for migration
+	* 4k dma mapping adversely affects migration performance on Intel
+	  hardware, higher order (2M) dma mapping should help here.
+* Build common userptr implementation on top of GPU SVM
+* Driver side madvise implementation and migration policies
+* Pull in pending dma-mapping API changes from Leon / Nvidia when these land
diff --git a/Documentation/gpu/rfc/index.rst b/Documentation/gpu/rfc/index.rst
index 476719771eef..396e535377fb 100644
--- a/Documentation/gpu/rfc/index.rst
+++ b/Documentation/gpu/rfc/index.rst
@@ -16,6 +16,10 @@ host such documentation:
 * Once the code has landed move all the documentation to the right places in
   the main core, helper or driver sections.
 
+.. toctree::
+
+    gpusvm.rst
+
 .. toctree::
 
     i915_gem_lmem.rst
-- 
2.34.1

