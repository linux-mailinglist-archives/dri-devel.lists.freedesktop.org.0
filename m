Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B099F5A5F
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 00:33:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37B9910E309;
	Tue, 17 Dec 2024 23:33:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PjrulP2C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5D2010E2FE;
 Tue, 17 Dec 2024 23:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734478388; x=1766014388;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Yd0ZMkAiOx7dBCoM5jNLJ4U7okKk5s/n2c/h+dBhI+4=;
 b=PjrulP2Cq/qCsgFBwXluU+aZ6yEjKnruZOyD8liRmpTiLwgFAShx1uAV
 +/cPWwtD8M+/yxCesGipPY/K1ZPM+IoASwIfQie053l1g6Mvt23uu+s+X
 OqqMZNPRRh8rvBM9C+5i876GZyQVz45XCww9Jr6F+oMAh6n9z81kqEyX/
 Lff4U8RE77f/zI3UQ326Soih1nkmLH3b1cO0T0mgLwCg+pJaYlKUpfCnE
 /i976zVP5WnazgX7k3Bfs4mgOpP5eXpQ/ow6fQ9Jf0prFvx/YKZDVsHkR
 6VIv67p8mu6RzDcmrkb8wbbDQ8KaltyTuB5moXudISK1yK/SQwYp7cp60 g==;
X-CSE-ConnectionGUID: ZyfO+neYQJWi94f79ccslw==
X-CSE-MsgGUID: 2103H4MISdWPI5aPMvH+1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="22517322"
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; d="scan'208";a="22517322"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 15:33:07 -0800
X-CSE-ConnectionGUID: z04G2oD6SwyLp5LBJwCOvA==
X-CSE-MsgGUID: QhfrrQxASzKcXti6L/ieog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="102273421"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 15:33:07 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: apopple@nvidia.com, airlied@gmail.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v3 00/30] Introduce GPU SVM and Xe SVM implementation
Date: Tue, 17 Dec 2024 15:33:18 -0800
Message-Id: <20241217233348.3519726-1-matthew.brost@intel.com>
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

Version 3 of GPU SVM has been promoted to the proper series from an RFC.
Thanks to everyone (especially Sima and Thomas) for their numerous
reviews on revision 1, 2 and for helping to address many design issues.

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

Known issues in v3:
- Check pages still exists, changed to threshold in this version which
  is better but still need to root cause cross process page finding on
  small user allocations.
- Dropped documentation patch, fairly large rewrite and will send out
  independently once finished.

Matt

[1] https://patchwork.freedesktop.org/series/137545/#rev3
[2] https://github.com/intel/compute-runtime/pull/782

Matthew Brost (27):
  drm/xe: Retry BO allocation
  mm/migrate: Add migrate_device_pfns
  mm/migrate: Trylock device page in do_swap_page
  drm/gpusvm: Add support for GPU Shared Virtual Memory
  drm/xe: Select DRM_GPUSVM Kconfig
  drm/xe/uapi: Add DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR flag
  drm/xe: Add SVM init / close / fini to faulting VMs
  drm/xe: Nuke VM's mapping upon close
  drm/xe: Add SVM range invalidation and page fault handler
  drm/gpuvm: Add DRM_GPUVA_OP_DRIVER
  drm/xe: Add (re)bind to SVM page fault handler
  drm/xe: Add SVM garbage collector
  drm/xe: Add unbind to SVM garbage collector
  drm/xe: Do not allow CPU address mirror VMA unbind if the GPU has
    bindings
  drm/xe: Enable CPU address mirror uAPI
  drm/xe: Add migrate layer functions for SVM support
  drm/xe: Add SVM device memory mirroring
  drm/xe: Add drm_gpusvm_devmem to xe_bo
  drm/xe: Add GPUSVM device memory copy vfunc functions
  drm/xe: Add Xe SVM populate_devmem_pfn GPU SVM vfunc
  drm/xe: Add Xe SVM devmem_release GPU SVM vfunc
  drm/xe: Add BO flags required for SVM
  drm/xe: Add SVM VRAM migration
  drm/xe: Basic SVM BO eviction
  drm/xe: Add SVM debug
  drm/xe: Add modparam for SVM notifier size
  drm/xe: Add always_migrate_to_vram modparam

Thomas Hellström (3):
  drm/pagemap: Add DRM pagemap
  drm/xe: Add dma_addr res cursor
  drm/xe: Add drm_pagemap ops to SVM

 drivers/gpu/drm/Kconfig                     |    8 +
 drivers/gpu/drm/Makefile                    |    1 +
 drivers/gpu/drm/drm_gpusvm.c                | 2220 +++++++++++++++++++
 drivers/gpu/drm/xe/Kconfig                  |   10 +
 drivers/gpu/drm/xe/Makefile                 |    1 +
 drivers/gpu/drm/xe/xe_bo.c                  |   20 +-
 drivers/gpu/drm/xe/xe_bo.h                  |    1 +
 drivers/gpu/drm/xe/xe_bo_types.h            |    4 +
 drivers/gpu/drm/xe/xe_device_types.h        |   15 +
 drivers/gpu/drm/xe/xe_gt_pagefault.c        |   17 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |   24 +
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h |    2 +
 drivers/gpu/drm/xe/xe_migrate.c             |  175 ++
 drivers/gpu/drm/xe/xe_migrate.h             |   10 +
 drivers/gpu/drm/xe/xe_module.c              |    7 +
 drivers/gpu/drm/xe/xe_module.h              |    2 +
 drivers/gpu/drm/xe/xe_pt.c                  |  393 +++-
 drivers/gpu/drm/xe/xe_pt.h                  |    5 +
 drivers/gpu/drm/xe/xe_pt_types.h            |    2 +
 drivers/gpu/drm/xe/xe_res_cursor.h          |  116 +-
 drivers/gpu/drm/xe/xe_svm.c                 |  948 ++++++++
 drivers/gpu/drm/xe/xe_svm.h                 |   83 +
 drivers/gpu/drm/xe/xe_tile.c                |    5 +
 drivers/gpu/drm/xe/xe_vm.c                  |  375 +++-
 drivers/gpu/drm/xe/xe_vm.h                  |   15 +-
 drivers/gpu/drm/xe/xe_vm_types.h            |   57 +
 include/drm/drm_gpusvm.h                    |  445 ++++
 include/drm/drm_gpuvm.h                     |    5 +
 include/drm/drm_pagemap.h                   |  103 +
 include/linux/migrate.h                     |    1 +
 include/uapi/drm/xe_drm.h                   |   19 +-
 mm/memory.c                                 |   13 +-
 mm/migrate_device.c                         |  116 +-
 33 files changed, 5061 insertions(+), 157 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_gpusvm.c
 create mode 100644 drivers/gpu/drm/xe/xe_svm.c
 create mode 100644 drivers/gpu/drm/xe/xe_svm.h
 create mode 100644 include/drm/drm_gpusvm.h
 create mode 100644 include/drm/drm_pagemap.h

-- 
2.34.1

