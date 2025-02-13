Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C10A3352D
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 03:10:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E5D010E26B;
	Thu, 13 Feb 2025 02:10:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iZ6Nn3jz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 071E510E1C0;
 Thu, 13 Feb 2025 02:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739412615; x=1770948615;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=egvVuBSTritaocCnrUDFqkus6nSSyAMNhVpPVtxt8lA=;
 b=iZ6Nn3jzVV3VbBFihsKai2O4gTdTPaev7d9+Tpbu3gQoBqDj0Drcu5jp
 ghjXKhza0nb22QZskMEgKPi++csNtmwoOJMWJpRu7pnMTlRxBRWJaK+0s
 G4B4PdatS8bK2CW3qMxPEvDkPjqr+yK+bAD8X0fpTP0u8DeMKkX5YHqtA
 Sswp/2gZHP8j2DVPjhymrs24v3WkBTSdhuDgihbRYVXtLbBEhBwt7GIz6
 oNvwDF6GVRkRDubgTuT4qie8IqRK9qPETNt+8iJo3P079N4XDxq29Ivi+
 5meAFukGg1BN21/2hsAQMKfMH6kLP3rMLpdFEWD0pEHSVrOJFn2ki7IUU g==;
X-CSE-ConnectionGUID: FGqyWnIVRYG55DW8TUSgnw==
X-CSE-MsgGUID: Wyt/d3EmQIieyomHyijMMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="65455885"
X-IronPort-AV: E=Sophos;i="6.13,281,1732608000"; d="scan'208";a="65455885"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 18:10:14 -0800
X-CSE-ConnectionGUID: T3Vl+BmMTSq8YMwXESXMGA==
X-CSE-MsgGUID: RwdzZhWeS7qCDWZRAqHBvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="117945032"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 18:10:14 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v5 00/32] Introduce GPU SVM and Xe SVM implementation
Date: Wed, 12 Feb 2025 18:10:40 -0800
Message-Id: <20250213021112.1228481-1-matthew.brost@intel.com>
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

Version 5 of GPU SVM. Thanks to everyone (especially Sima, Thomas,
Alistair, Himal) for their numerous reviews on revision 1, 2, 3  and for
helping to address many design issues.

This version has been tested with IGT [1] on PVC, BMG, and LNL. Also
tested with level0 (UMD) PR [2].

Major changes in v2:
- Dropped mmap write abuse
- core MM locking and retry loops instead of driver locking to avoid races
- Removed physical to virtual references
- Embedded structure/ops for drm_gpusvm_devmem
- Fixed mremap and fork issues
- Added DRM pagemap
- Included RFC documentation in the kernel doc

Major changes in v3:
- Move GPU SVM and DRM pagemap to DRM level
- Mostly addresses Thomas's feedback, lots of small changes documented
  in each individual patch change log

Major changes in v4:
- Pull documentation patch in
- Fix Kconfig / VRAM migration issue
- Address feedback which came out of internal multi-GPU implementation

Major changes in v5:
- Rebase on s/xe_mem_region/xe_vram_region
- Bit for uAPI has changed given PXP has landed

Known issues in v5:
- Check pages still exists, changed to threshold in this version which
  is better but still need to root cause cross process page finding on
  small user allocations.

Matt

[1] https://patchwork.freedesktop.org/series/137545/#rev3
[2] https://github.com/intel/compute-runtime/pull/782

Matthew Brost (28):
  drm/xe: Retry BO allocation
  mm/migrate: Add migrate_device_pfns
  mm/migrate: Trylock device page in do_swap_page
  drm/gpusvm: Add support for GPU Shared Virtual Memory
  drm/xe: Select DRM_GPUSVM Kconfig
  drm/xe/uapi: Add DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR
  drm/xe: Add SVM init / close / fini to faulting VMs
  drm/xe: Nuke VM's mapping upon close
  drm/xe: Add SVM range invalidation and page fault
  drm/gpuvm: Add DRM_GPUVA_OP_DRIVER
  drm/xe: Add (re)bind to SVM page fault handler
  drm/xe: Add SVM garbage collector
  drm/xe: Add unbind to SVM garbage collector
  drm/xe: Do not allow CPU address mirror VMA unbind if the GPU has
    bindings
  drm/xe: Enable CPU address mirror uAPI
  drm/xe/uapi: Add DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR
  drm/xe: Add migrate layer functions for SVM support
  drm/xe: Add SVM device memory mirroring
  drm/xe: Add drm_gpusvm_devmem to xe_bo
  drm/xe: Add GPUSVM device memory copy vfunc functions
  drm/xe: Add Xe SVM populate_devmem_pfn GPU SVM vfunc
  drm/xe: Add Xe SVM devmem_release GPU SVM vfunc
  drm/xe: Add SVM VRAM migration
  drm/xe: Basic SVM BO eviction
  drm/xe: Add SVM debug
  drm/xe: Add modparam for SVM notifier size
  drm/xe: Add always_migrate_to_vram modparam
  drm/doc: gpusvm: Add GPU SVM documentation

Thomas Hellström (4):
  drm/pagemap: Add DRM pagemap
  drm/xe/bo: Introduce xe_bo_put_async
  drm/xe: Add dma_addr res cursor
  drm/xe: Add drm_pagemap ops to SVM

 Documentation/gpu/rfc/gpusvm.rst            |   84 +
 Documentation/gpu/rfc/index.rst             |    4 +
 drivers/gpu/drm/Kconfig                     |    9 +
 drivers/gpu/drm/Makefile                    |    1 +
 drivers/gpu/drm/drm_gpusvm.c                | 2230 +++++++++++++++++++
 drivers/gpu/drm/xe/Kconfig                  |   10 +
 drivers/gpu/drm/xe/Makefile                 |    1 +
 drivers/gpu/drm/xe/xe_bo.c                  |   54 +
 drivers/gpu/drm/xe/xe_bo.h                  |   20 +
 drivers/gpu/drm/xe/xe_bo_types.h            |    4 +
 drivers/gpu/drm/xe/xe_device.c              |    3 +
 drivers/gpu/drm/xe/xe_device_types.h        |   22 +
 drivers/gpu/drm/xe/xe_gt_pagefault.c        |   18 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |   22 +
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h |    2 +
 drivers/gpu/drm/xe/xe_migrate.c             |  175 ++
 drivers/gpu/drm/xe/xe_migrate.h             |   10 +
 drivers/gpu/drm/xe/xe_module.c              |    7 +
 drivers/gpu/drm/xe/xe_module.h              |    2 +
 drivers/gpu/drm/xe/xe_pt.c                  |  393 +++-
 drivers/gpu/drm/xe/xe_pt.h                  |    5 +
 drivers/gpu/drm/xe/xe_pt_types.h            |    2 +
 drivers/gpu/drm/xe/xe_query.c               |    5 +-
 drivers/gpu/drm/xe/xe_res_cursor.h          |  116 +-
 drivers/gpu/drm/xe/xe_svm.c                 |  964 ++++++++
 drivers/gpu/drm/xe/xe_svm.h                 |   96 +
 drivers/gpu/drm/xe/xe_tile.c                |    5 +
 drivers/gpu/drm/xe/xe_vm.c                  |  374 +++-
 drivers/gpu/drm/xe/xe_vm.h                  |   15 +-
 drivers/gpu/drm/xe/xe_vm_types.h            |   57 +
 include/drm/drm_gpusvm.h                    |  507 +++++
 include/drm/drm_gpuvm.h                     |    5 +
 include/drm/drm_pagemap.h                   |  105 +
 include/linux/migrate.h                     |    1 +
 include/uapi/drm/xe_drm.h                   |   22 +-
 mm/memory.c                                 |   13 +-
 mm/migrate_device.c                         |  116 +-
 37 files changed, 5326 insertions(+), 153 deletions(-)
 create mode 100644 Documentation/gpu/rfc/gpusvm.rst
 create mode 100644 drivers/gpu/drm/drm_gpusvm.c
 create mode 100644 drivers/gpu/drm/xe/xe_svm.c
 create mode 100644 drivers/gpu/drm/xe/xe_svm.h
 create mode 100644 include/drm/drm_gpusvm.h
 create mode 100644 include/drm/drm_pagemap.h

-- 
2.34.1

