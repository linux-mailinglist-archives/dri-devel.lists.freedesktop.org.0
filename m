Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C270DA224AF
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 20:51:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9678910E888;
	Wed, 29 Jan 2025 19:51:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ij1yutWD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBD8E10E177;
 Wed, 29 Jan 2025 19:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738180280; x=1769716280;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kJIMNdbUvU3Ao280imIOAe2qe9hwgnfMcJiZ+Hd2rgY=;
 b=ij1yutWDCE6hE8H8bdDfdaDv9FaEfrO1KWr5lYUwABnUhRL4WBtiJKdX
 DvJRBft1yb8zXb+8uMJHjNIMNPiadqTpSFQG41pvRjRwFsedL9EwIOqFY
 p79s/8X6MgnQWsJ20oXNmH62gn5MmwNLLNX/V0TUa/kVwh7dU+bowwnZD
 eZbx7T8Xm9pzd8xS2yFC0XBbQRqI2+p9a6q/Xl3XaGoDKMKb2kLYGQncJ
 5d8ccv+ElEUJMAp9URHpFClzI537OMSBE3w1fyywJli5YTMo9fYnM1zY2
 RpgxNpcGqWETdIgNf47jq8M9EgW1K540YhCNK/sEtJ9qOeZLTr+mWX5O7 w==;
X-CSE-ConnectionGUID: AUv3W7voQCGjnzFk+kUzxQ==
X-CSE-MsgGUID: KgUUjZDsRQmSOJEQYrhyrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50132700"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="50132700"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 11:51:20 -0800
X-CSE-ConnectionGUID: SZOp0G6UQJKwiOPEz4kg0A==
X-CSE-MsgGUID: 20JvvdM3TDmDI7/dqYrhdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="132392097"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 11:51:19 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v4 00/33] Introduce GPU SVM and Xe SVM implementation
Date: Wed, 29 Jan 2025 11:51:39 -0800
Message-Id: <20250129195212.745731-1-matthew.brost@intel.com>
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

Version 4 of GPU SVM. Thanks to everyone (especially Sima, Thomas,
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

Known issues in v4:
- Check pages still exists, changed to threshold in this version which
  is better but still need to root cause cross process page finding on
  small user allocations.

Matt

[1] https://patchwork.freedesktop.org/series/137545/#rev3
[2] https://github.com/intel/compute-runtime/pull/782

Matthew Brost (29):
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
  drm/xe/uapi: Add DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR
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
 drivers/gpu/drm/drm_gpusvm.c                | 2240 +++++++++++++++++++
 drivers/gpu/drm/xe/Kconfig                  |   10 +
 drivers/gpu/drm/xe/Makefile                 |    1 +
 drivers/gpu/drm/xe/xe_bo.c                  |   63 +-
 drivers/gpu/drm/xe/xe_bo.h                  |   14 +
 drivers/gpu/drm/xe/xe_bo_types.h            |    4 +
 drivers/gpu/drm/xe/xe_device.c              |    3 +
 drivers/gpu/drm/xe/xe_device_types.h        |   22 +
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
 drivers/gpu/drm/xe/xe_query.c               |    5 +-
 drivers/gpu/drm/xe/xe_res_cursor.h          |  116 +-
 drivers/gpu/drm/xe/xe_svm.c                 |  946 ++++++++
 drivers/gpu/drm/xe/xe_svm.h                 |   84 +
 drivers/gpu/drm/xe/xe_tile.c                |    5 +
 drivers/gpu/drm/xe/xe_vm.c                  |  375 +++-
 drivers/gpu/drm/xe/xe_vm.h                  |   15 +-
 drivers/gpu/drm/xe/xe_vm_types.h            |   57 +
 include/drm/drm_gpusvm.h                    |  445 ++++
 include/drm/drm_gpuvm.h                     |    5 +
 include/drm/drm_pagemap.h                   |  105 +
 include/linux/migrate.h                     |    1 +
 include/uapi/drm/xe_drm.h                   |   22 +-
 mm/memory.c                                 |   13 +-
 mm/migrate_device.c                         |  116 +-
 37 files changed, 5245 insertions(+), 157 deletions(-)
 create mode 100644 Documentation/gpu/rfc/gpusvm.rst
 create mode 100644 drivers/gpu/drm/drm_gpusvm.c
 create mode 100644 drivers/gpu/drm/xe/xe_svm.c
 create mode 100644 drivers/gpu/drm/xe/xe_svm.h
 create mode 100644 include/drm/drm_gpusvm.h
 create mode 100644 include/drm/drm_pagemap.h

-- 
2.34.1

