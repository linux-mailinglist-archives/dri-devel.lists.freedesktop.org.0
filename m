Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C976961C40
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 04:48:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA02010E440;
	Wed, 28 Aug 2024 02:48:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R6c9aNfR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0116A10E43F;
 Wed, 28 Aug 2024 02:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724813287; x=1756349287;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vfhJo4D3k1IEq3Y/gfTrM8efm9mJjx6x/dg+esD7Sjs=;
 b=R6c9aNfRErcMZ32uIyvJHwAcm2fGmYMF9Iz0OOHdNfIO73J1JlSxKEpV
 h8n4cSaZDYdF8WaUVcecw31frszmImX38TFJm54pNr91pb4USPyq5OI03
 BCFBqPHfeyC8pPn8g6GdUsMMvisMZNJQXR6p2v//264BxVwwgwCL7tw1p
 fDCjStgjLPMgc+lhfJwMG2vNrtr4q+whc9l61wX8F+qZeu3iuz6B9/PPF
 SL9jpVsgXnhh3N4seVegtnt4t5S/ZkgMHDRhq2lDQGue2wqED6lMM/I9S
 UARWjUp0kLGWDYaC3/0eoNmiouIWgZ3dcjHeDfAijXH0CRxkR0v0eMio4 w==;
X-CSE-ConnectionGUID: SHo40rW6QKmWewmUCkHpKg==
X-CSE-MsgGUID: AIvjD4gqS+KLic/5d5m9ag==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="13251842"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="13251842"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 19:48:06 -0700
X-CSE-ConnectionGUID: a5b6LzhZTEGQVeiD4wBnLA==
X-CSE-MsgGUID: PRWt00WaS9K3oaNQb3besQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="67224581"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 19:48:06 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: airlied@gmail.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, matthew.auld@intel.com, daniel@ffwll.ch
Subject: [RFC PATCH 00/28] Introduce GPU SVM and Xe SVM implementation
Date: Tue, 27 Aug 2024 19:48:33 -0700
Message-Id: <20240828024901.2582335-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Continuation of SVM work by Oak Zeng [1][2] based on community feedback.
Introduces GPU SVM layer and new Xe uAPI. Supports GPU page faults for
system allocations (e.g., malloc), runtime allocations (e.g., binding a
BO), migration to and from VRAM, and unified eviction (BO and SVM VRAM
allocations can evict each other). Fully tested; more on this below.

The patch breakdown is as follows:

1. Preparation patches already on the list [3].
	- Patches 1-3.
	- Please refrain from reviewing these here.	
2. New migrate layer functionality
	- Patch 4.
	- Required for eviction to avoid locking inversion between
	  dma-resv and mmap lock.
3. GPU SVM.
	- Patch 5.
	- This is what needs community review.
	- Inspired by GPUVM.
	- Kernel doc should explain design principles.
	- There is certainly room for optimization of the implementation
	  and improvements with existing core MM interaction. Pulling in
	  pending DMA mapping work [4] and additional core MM support
	  for SVM is also likely desired. However, this serves as a good
	  starting point for any SVM discussions and could be used as a
	  stepping stone to future core MM work.
3. Basic SVM support in Xe (i.e., SRAM backing only).
	- Patches 6-15.
	- The uAPI in the patch could benefit from community input.
4. SVM VRAM migration support in Xe.
	- Patches 16-23.
	- Using TMM BOs for SVM VRAM allocations could use community
	  input. Patch 23 has a detailed explaination of this design
	  choice in the commit message.
5. SVM eviction support in Xe.
	- Patch 24.
	- Should work with exhaustive eviction [5] when it merges.
6. Xe SVM debug / tuning.
	- Patch 25-28.

Kernel documentation and commit messages are relatively light, aside
from GPU SVM and uAPI patches as this is an RFC.

Testing has been conducted quite thoroughly with new IGT [6]. Various
system allocation types (malloc, mmap, mmap flags, huge pages, different
sizes, different alignments), mixing runtime allocations, unmapping
corners, invalid faults, and eviction have been tested. Testing scales
from single thread to multiple threads and multiple processes. Tests
pass on LNL, BMG, PVC 1 tile, and PVC 2 tile.

1. Multiple GPU support.
	- This is likely to follow or occur in parallel to this work.
2. Userptr unification with GPU SVM.
	- This is essentially designed in my head (likely involving a
	  few new GPU SVM layer functions) but would require some fairly
	  invasive changes to Xe KMD to test out. Therefore, I would
	  like GPU SVM to be reviewed first before proceeding with these
	  changes.
3. Madvise and prefetch IOCTLs
	- This is likely to follow or occur in parallel to this work.

Given the size of the series, I have pushed a GitLab branch for
reference [7].

Matt

[1] https://patchwork.freedesktop.org/series/128910/
[2] https://patchwork.freedesktop.org/series/132229/
[3] https://patchwork.freedesktop.org/series/137805/
[4] https://lore.kernel.org/linux-rdma/cover.1709635535.git.leon@kernel.org/
[5] https://patchwork.freedesktop.org/series/133643/
[6] https://patchwork.freedesktop.org/patch/610942/?series=137545&rev=2
[7] https://gitlab.freedesktop.org/mbrost/xe-kernel-driver-svm-post-8-27-24/-/tree/post?ref_type=heads

Matthew Brost (28):
  dma-buf: Split out dma fence array create into alloc and arm functions
  drm/xe: Invalidate media_gt TLBs in PT code
  drm/xe: Retry BO allocation
  mm/migrate: Add migrate_device_vma_range
  drm/gpusvm: Add support for GPU Shared Virtual Memory
  drm/xe/uapi: Add DRM_XE_VM_BIND_FLAG_SYSTEM_ALLOCATON flag
  drm/xe: Add SVM init / fini to faulting VMs
  drm/xe: Add dma_addr res cursor
  drm/xe: Add SVM range invalidation
  drm/gpuvm: Add DRM_GPUVA_OP_USER
  drm/xe: Add (re)bind to SVM page fault handler
  drm/xe: Add SVM garbage collector
  drm/xe: Add unbind to SVM garbage collector
  drm/xe: Do not allow system allocator VMA unbind if the GPU has
    bindings
  drm/xe: Enable system allocator uAPI
  drm/xe: Add migrate layer functions for SVM support
  drm/xe: Add SVM device memory mirroring
  drm/xe: Add GPUSVM copy SRAM / VRAM vfunc functions
  drm/xe: Update PT layer to understand ranges in VRAM
  drm/xe: Add Xe SVM populate_vram_pfn vfunc
  drm/xe: Add Xe SVM vram_release vfunc
  drm/xe: Add BO flags required for SVM
  drm/xe: Add SVM VRAM migration
  drm/xe: Basic SVM BO eviction
  drm/xe: Add SVM debug
  drm/xe: Add modparam for SVM notifier size
  drm/xe: Add modparam for SVM prefault
  drm/gpusvm: Ensure all pages migrated upon eviction

 drivers/dma-buf/dma-fence-array.c    |   78 +-
 drivers/gpu/drm/xe/Makefile          |    4 +-
 drivers/gpu/drm/xe/drm_gpusvm.c      | 2213 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/drm_gpusvm.h      |  415 +++++
 drivers/gpu/drm/xe/xe_bo.c           |   54 +-
 drivers/gpu/drm/xe/xe_bo.h           |    2 +
 drivers/gpu/drm/xe/xe_bo_types.h     |    3 +
 drivers/gpu/drm/xe/xe_device_types.h |    8 +
 drivers/gpu/drm/xe/xe_gt_pagefault.c |   17 +-
 drivers/gpu/drm/xe/xe_migrate.c      |  150 ++
 drivers/gpu/drm/xe/xe_migrate.h      |   10 +
 drivers/gpu/drm/xe/xe_module.c       |    7 +
 drivers/gpu/drm/xe/xe_module.h       |    2 +
 drivers/gpu/drm/xe/xe_pt.c           |  456 +++++-
 drivers/gpu/drm/xe/xe_pt.h           |    3 +
 drivers/gpu/drm/xe/xe_pt_types.h     |    2 +
 drivers/gpu/drm/xe/xe_res_cursor.h   |   50 +-
 drivers/gpu/drm/xe/xe_svm.c          |  775 +++++++++
 drivers/gpu/drm/xe/xe_svm.h          |   70 +
 drivers/gpu/drm/xe/xe_tile.c         |    5 +
 drivers/gpu/drm/xe/xe_vm.c           |  286 +++-
 drivers/gpu/drm/xe/xe_vm.h           |   15 +-
 drivers/gpu/drm/xe/xe_vm_types.h     |   44 +
 include/drm/drm_gpuvm.h              |    5 +
 include/linux/dma-fence-array.h      |    6 +
 include/linux/migrate.h              |    3 +
 include/uapi/drm/xe_drm.h            |   19 +-
 mm/migrate_device.c                  |   53 +
 28 files changed, 4615 insertions(+), 140 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/drm_gpusvm.c
 create mode 100644 drivers/gpu/drm/xe/drm_gpusvm.h
 create mode 100644 drivers/gpu/drm/xe/xe_svm.c
 create mode 100644 drivers/gpu/drm/xe/xe_svm.h

-- 
2.34.1

