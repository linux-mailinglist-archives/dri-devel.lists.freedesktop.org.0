Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6015CCB696B
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 17:59:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B2D310E7B5;
	Thu, 11 Dec 2025 16:59:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZhcB6ruF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2C5010E7B5;
 Thu, 11 Dec 2025 16:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765472378; x=1797008378;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DVihb3Bq16k1n93EV2r6lG1i4KzyNM+ktGdb40/5wUo=;
 b=ZhcB6ruFrqDc0tvU/A6PVBEM4a6FHUhgNrrz15AHpzr1vjCIXl6sN68W
 aYzkKRjPt50nS0o0en+vJEJ7vg2jwwod/cNU1YNRUnk11fMV8bN6TU4uc
 Or8DOSPaUBjwk62WT95A5cWSshDRGxsBYIJBNmq+J81hdhzKFeDDltlcF
 XiiT7GASjTkwMDxGqw3c3aeREF9pLFQ8zKwZww72riehAr/l/FZ+9zT77
 wsBcSbz0xG4W960ciM2s7qUXMkrlsg+TgiBrzhbV+wA5wsM352RZrskHS
 8MMnIazWMxoO9QIZvyyAcZ2EF4D8LGiBlMXd1DRh6i78ew13Vcz5Z93w6 Q==;
X-CSE-ConnectionGUID: riDbRk+eSva1sPr7LO/OIg==
X-CSE-MsgGUID: 12F9lW05TmKTWFidcOTplg==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="71082987"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="71082987"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 08:59:37 -0800
X-CSE-ConnectionGUID: D7/da/LbS6qIPDUHsoIMnQ==
X-CSE-MsgGUID: hBtSuQ4bQnOYrGqhZYBJcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="196849423"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO fedora)
 ([10.245.244.197])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 08:59:34 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dakr@kernel.org, "Mrozek, Michal" <michal.mrozek@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PATCH v4 00/22] Dynamic drm_pagemaps and Initial multi-device SVM
Date: Thu, 11 Dec 2025 17:58:47 +0100
Message-ID: <20251211165909.219710-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.1
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

This series aims at providing an initial implementation of multi-device
SVM, where communitcation with peers (migration and direct execution out
of peer memory) uses some form of fast interconnect. In this series
we're using pcie p2p.

In a multi-device environment, the struct pages for device-private memory
(the dev_pagemap) may take up a significant amount of system memory. We
therefore want to provide a means of revoking / removing the dev_pagemaps
not in use. In particular when a device is offlined, we want to block
migrating *to* the device memory and migrate data already existing in the
devices memory to system. The dev_pagemap then becomes unused and can be
removed.

Removing and setting up a large dev_pagemap is also quite time-consuming,
so removal of unused dev_pagemaps only happens on system memory pressure
using a shrinker.

Patch 1 is a small debug printout fix.
Patch 2 fixes a condition where memory was used while being cleared.
Patches 3-8 deals with dynamic drm_pagemaps as described above.
Patches 9-13 adds infrastructure to handle remote drm_pagemaps with
fast interconnects.
Patch 14 extends the xe madvise() UAPI to handle remote drm_pagemaps.
Patch 15 adds a pcie-p2p dma SVM interconnect to the xe driver.
Patch 16 adds some SVM-related debug printouts for xe.
Patch 17 adds documentation on how the drm_pagemaps are reference counted.
Patch 18 Cleans up the usage of the dev_private owner.
Patch 19 Introduces a gpusvm function to scan the current CPU address space.
Patch 20 Uses the above function in Xe to avoid unnecessary migrations.
Patch 21 Adds drm_pagemap support for p2p destination migration.
Patch 22 Adds drm_pagemap support for p2p source migration.

What's still missing is implementation of migration policies.
That will be implemented in follow-up series. 

v2:
- Address review comments from Matt Brost.
- Fix compilation issues reported by automated testing
- Add patch 1, 17.
- What's now patch 16 was extended to support p2p migration.
v3:
- Add patches 2, 18, 19, 10, 22. Main functionality is the address space
  scan to avoid unnecessary migration, and p2p source migration which
  is needed on Xe to decompress and to flush out the L2 cache.
- Rework what's now Patch 21 slightly.
- Minor fixes all over the place.
v4:
- Fix a build error (CI)
- Fix possibly incorrect waiting for the pre_migrate_fence.

Test-with: 20251204085432.35023-1-nishit.sharma@intel.com

Thomas Hellström (22):
  drm/xe/svm: Fix a debug printout
  drm/pagemap, drm/xe: Ensure that the devmem allocation is idle before
    use
  drm/pagemap, drm/xe: Add refcounting to struct drm_pagemap
  drm/pagemap: Add a refcounted drm_pagemap backpointer to struct
    drm_pagemap_zdd
  drm/pagemap, drm/xe: Manage drm_pagemap provider lifetimes
  drm/pagemap: Add a drm_pagemap cache and shrinker
  drm/xe: Use the drm_pagemap cache and shrinker
  drm/pagemap: Remove the drm_pagemap_create() interface
  drm/pagemap_util: Add a utility to assign an owner to a set of
    interconnected gpus
  drm/xe: Use the drm_pagemap_util helper to get a svm pagemap owner
  drm/xe: Pass a drm_pagemap pointer around with the memory advise
    attributes
  drm/xe: Use the vma attibute drm_pagemap to select where to migrate
  drm/xe: Simplify madvise_preferred_mem_loc()
  drm/xe/uapi: Extend the madvise functionality to support foreign
    pagemap placement for svm
  drm/xe: Support pcie p2p dma as a fast interconnect
  drm/xe/vm: Add a couple of VM debug printouts
  drm/xe/svm: Document how xe keeps drm_pagemap references
  drm/pagemap, drm/xe: Clean up the use of the device-private page owner
  drm/gpusvm: Introduce a function to scan the current migration state
  drm/xe: Use drm_gpusvm_scan_mm()
  drm/pagemap, drm/xe: Support destination migration over interconnect
  drm/pagemap: Support source migration over interconnect

 drivers/gpu/drm/Makefile             |   3 +-
 drivers/gpu/drm/drm_gpusvm.c         | 124 +++++
 drivers/gpu/drm/drm_pagemap.c        | 552 +++++++++++++++++---
 drivers/gpu/drm/drm_pagemap_util.c   | 568 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device.c       |  20 +
 drivers/gpu/drm/xe/xe_device.h       |   2 +
 drivers/gpu/drm/xe/xe_device_types.h |   5 +
 drivers/gpu/drm/xe/xe_migrate.c      |   4 +-
 drivers/gpu/drm/xe/xe_svm.c          | 721 ++++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_svm.h          |  85 +++-
 drivers/gpu/drm/xe/xe_tile.c         |  34 +-
 drivers/gpu/drm/xe/xe_tile.h         |  21 +
 drivers/gpu/drm/xe/xe_userptr.c      |   2 +-
 drivers/gpu/drm/xe/xe_vm.c           |  65 ++-
 drivers/gpu/drm/xe/xe_vm.h           |   1 +
 drivers/gpu/drm/xe/xe_vm_madvise.c   | 106 +++-
 drivers/gpu/drm/xe/xe_vm_types.h     |  21 +-
 drivers/gpu/drm/xe/xe_vram_types.h   |  15 +-
 include/drm/drm_gpusvm.h             |  29 ++
 include/drm/drm_pagemap.h            | 128 ++++-
 include/drm/drm_pagemap_util.h       |  92 ++++
 include/uapi/drm/xe_drm.h            |  18 +-
 22 files changed, 2326 insertions(+), 290 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_pagemap_util.c
 create mode 100644 include/drm/drm_pagemap_util.h

-- 
2.51.1

