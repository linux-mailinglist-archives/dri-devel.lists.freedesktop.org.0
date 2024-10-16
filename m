Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFC599FF5C
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 05:25:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70B2610E64C;
	Wed, 16 Oct 2024 03:24:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j5UxHdWD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1921C10E002;
 Wed, 16 Oct 2024 03:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729049097; x=1760585097;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cETArkjwFDrGY3XjWZUYmo2v+jean1bmbLgqNmLGltc=;
 b=j5UxHdWDrh3+LP7wIYP2/Bxmf5SQuZToPr0stgkYkoFcimp23WGuALwD
 OqKAqhmmC2B1bCyhRegZeFBPNg42XR0zLiWtIvJqR1omgoNW4U2hBakT/
 tfVa3cYWOQZ6O6KjjICD4qd0B+YyNXolP2C2a9U1PqdOXFZjf2xVwRN1d
 NHt+qODyPHPgDv8AIoRX2Ogx/eYNDdxvpEa3qoQJy1EJcjdDA1+yeJ71N
 4MIl8830yAWJNOO6MzSlxHHxkwOSHTLF7jWEk2xaCynjOWj+RWlYjoTO5
 MG7t7wh1Qzxj3YFvRRJBBbZy56tRZMDVYnP1ni0pCm2HcqK5496axq3af g==;
X-CSE-ConnectionGUID: mCdMAqxEQLmzcgcT5pod+A==
X-CSE-MsgGUID: 9aC9Tc7UTyuyq1LNwejpPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="39056323"
X-IronPort-AV: E=Sophos;i="6.11,206,1725346800"; d="scan'208";a="39056323"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 20:24:57 -0700
X-CSE-ConnectionGUID: oeaubz+yTw63EGeTwuKHyA==
X-CSE-MsgGUID: PRc1zwsETdGK/vrBV4ADXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,206,1725346800"; d="scan'208";a="78930249"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 20:24:56 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: apopple@nvidia.com, airlied@gmail.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v2 00/29] Introduce GPU SVM and Xe SVM implementation
Date: Tue, 15 Oct 2024 20:24:49 -0700
Message-Id: <20241016032518.539495-1-matthew.brost@intel.com>
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

Version 2 of GPU SVM has been promoted to the proper series from an RFC.
Thanks to everyone (especially Sima and Thomas) for their numerous
reviews on revision 1 and for helping to address many design issues.

This version has been tested with IGT [1] on PVC, BMG, and LNL.

Major changes in v2:
- Dropped mmap write abuse
- core MM locking and retry loops instead of driver locking to avoid races
- Removed physical to virtual references
- Embedded structure/ops for drm_gpusvm_devmem
- Fixed mremap and fork issues
- Added DRM pagemap
- Included RFC documentation in the kernel doc

Known issues in v2:
- gpusvm/pagemap is still located in the Xe directory; it can be moved
  to the drm directory in the next revision, but will remain in Xe for
  streamlined testing for now
- drm_gpusvm_range_evict looks up VMA; it may be possible to use
  hmm_range_fault here instead, with some minor tweaks to HMM

Matt

[1] https://patchwork.freedesktop.org/series/137545/#rev3

Matthew Brost (26):
  drm/xe: Retry BO allocation
  mm/migrate: Add migrate_device_prepopulated_range
  mm/migrate: Trylock device page in do_swap_page
  drm/gpusvm: Add support for GPU Shared Virtual Memory
  drm/xe/uapi: Add DRM_XE_VM_BIND_FLAG_SYSTEM_ALLOCATON flag
  drm/xe: Add SVM init / close / fini to faulting VMs
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
  drm/xe: Add drm_gpusvm_devmem to xe_bo
  drm/xe: Add GPUSVM devic memory copy vfunc functions
  drm/xe: Add Xe SVM populate_devmem_pfn vfunc
  drm/xe: Add Xe SVM devmem_release vfunc
  drm/xe: Add BO flags required for SVM
  drm/xe: Add SVM VRAM migration
  drm/xe: Basic SVM BO eviction
  drm/xe: Add SVM debug
  drm/xe: Add modparam for SVM notifier size
  drm/xe: Add always_migrate_to_vram modparam
  drm/doc: gpusvm: Add GPU SVM documentation

Thomas Hellström (3):
  drm/pagemap: Add DRM pagemap
  drm/xe: Add dma_addr res cursor
  drm/xe: Add drm_pagemap ops to SVM

 Documentation/gpu/rfc/gpusvm.rst     |   70 +
 Documentation/gpu/rfc/index.rst      |    4 +
 drivers/gpu/drm/xe/Makefile          |    4 +-
 drivers/gpu/drm/xe/drm_gpusvm.c      | 2074 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/drm_gpusvm.h      |  447 ++++++
 drivers/gpu/drm/xe/drm_pagemap.h     |  103 ++
 drivers/gpu/drm/xe/xe_bo.c           |   43 +-
 drivers/gpu/drm/xe/xe_bo.h           |    2 +
 drivers/gpu/drm/xe/xe_bo_types.h     |    5 +
 drivers/gpu/drm/xe/xe_device_types.h |   15 +
 drivers/gpu/drm/xe/xe_gt_pagefault.c |   17 +-
 drivers/gpu/drm/xe/xe_migrate.c      |  149 ++
 drivers/gpu/drm/xe/xe_migrate.h      |   10 +
 drivers/gpu/drm/xe/xe_module.c       |    7 +
 drivers/gpu/drm/xe/xe_module.h       |    2 +
 drivers/gpu/drm/xe/xe_pt.c           |  362 ++++-
 drivers/gpu/drm/xe/xe_pt.h           |    3 +
 drivers/gpu/drm/xe/xe_pt_types.h     |    2 +
 drivers/gpu/drm/xe/xe_res_cursor.h   |  116 +-
 drivers/gpu/drm/xe/xe_svm.c          |  840 +++++++++++
 drivers/gpu/drm/xe/xe_svm.h          |   60 +
 drivers/gpu/drm/xe/xe_tile.c         |    5 +
 drivers/gpu/drm/xe/xe_vm.c           |  286 +++-
 drivers/gpu/drm/xe/xe_vm.h           |   15 +-
 drivers/gpu/drm/xe/xe_vm_types.h     |   44 +
 include/drm/drm_gpuvm.h              |    5 +
 include/linux/migrate.h              |    1 +
 include/uapi/drm/xe_drm.h            |   19 +-
 mm/memory.c                          |   13 +-
 mm/migrate_device.c                  |  104 +-
 30 files changed, 4695 insertions(+), 132 deletions(-)
 create mode 100644 Documentation/gpu/rfc/gpusvm.rst
 create mode 100644 drivers/gpu/drm/xe/drm_gpusvm.c
 create mode 100644 drivers/gpu/drm/xe/drm_gpusvm.h
 create mode 100644 drivers/gpu/drm/xe/drm_pagemap.h
 create mode 100644 drivers/gpu/drm/xe/xe_svm.c
 create mode 100644 drivers/gpu/drm/xe/xe_svm.h

-- 
2.34.1

