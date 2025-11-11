Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EF1C4F15E
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 17:44:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B87FA10E611;
	Tue, 11 Nov 2025 16:44:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="frAQQMAx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8652110E60B;
 Tue, 11 Nov 2025 16:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762879473; x=1794415473;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TDU9mAfWebMOmL4LgbVHmMeK4etJIBvP5ccLd78Pt7s=;
 b=frAQQMAxdmsR8iiEh1p4h8B3rYPtbsVPF6N/dT45BKzdmcYzTkxDKBn5
 +FZRTh8T8AybujXmZOnueEdlI6gBc4Z7nUjc2F+2CdW9bmwuM1LmX6hzf
 hFBx5TvypcbO0MXnqQi8DabS3HbsK3KSut8UEGDrsCzuplpaegSDX7QO7
 BEu+70TtlzylwhHWcOMDmz9MW1hV8ePQxBXdQUcGibHpQpvahzMCdXSQ/
 JNKWsvTA6xcwLTkbAa+p1Uj8O2s6EkmOeKQL2kQ6GQx8U9RhNG44LDvPN
 BcgWJ3YqK8Zl1h+p/vA6R8tG44FDf8LxYljjG7dV0HcOD3NQA3ME9dF6O w==;
X-CSE-ConnectionGUID: hoWM1DqXQ4aPFv46XuHFLg==
X-CSE-MsgGUID: uUrQEy7rTKmbai5w8omYDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="75244603"
X-IronPort-AV: E=Sophos;i="6.19,297,1754982000"; d="scan'208";a="75244603"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 08:44:33 -0800
X-CSE-ConnectionGUID: ptMOFprYT4+Ay7TsdX+Jfg==
X-CSE-MsgGUID: q4wmtlILQ5KEXyG4klkjrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,297,1754982000"; d="scan'208";a="188646744"
Received: from rvuia-mobl.ger.corp.intel.com (HELO fedora) ([10.245.244.91])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 08:44:29 -0800
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
Subject: [PATCH v2 00/17] Dynamic drm_pagemaps and Initial multi-device SVM 
Date: Tue, 11 Nov 2025 17:43:50 +0100
Message-ID: <20251111164408.113070-1-thomas.hellstrom@linux.intel.com>
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
Patches 2-7 deals with dynamic drm_pagemaps as described above.
Patches 8-12 adds infrastructure to handle remote drm_pagemaps with
fast interconnects.
Patch 13 extends the xe madvise() UAPI to handle remote drm_pagemaps.
Patch 14 adds a pcie-p2p dma SVM interconnect to the xe driver.
Patch 15 adds some SVM-related debug printouts for xe.
Patch 16 adds direct interconnect migration.
Patch 17 adds some documentation.

What's still missing is implementation of migration policies.
That will be implemented in follow-up series. 

v2:
- Address review comments from Matt Brost.
- Fix compilation issues reported by automated testing
- Add patch 1, 17.
- What's now patch 16 was extended to support p2p migration.

Thomas Hellström (17):
  drm/xe/svm: Fix a debug printout
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
  drm/pagemap, drm/xe: Support migration over interconnect
  drm/xe/svm: Document how xe keeps drm_pagemap references

 drivers/gpu/drm/Makefile             |   3 +-
 drivers/gpu/drm/drm_gpusvm.c         |   4 +-
 drivers/gpu/drm/drm_pagemap.c        | 354 ++++++++++++---
 drivers/gpu/drm/drm_pagemap_util.c   | 568 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device.c       |  20 +
 drivers/gpu/drm/xe/xe_device.h       |   2 +
 drivers/gpu/drm/xe/xe_device_types.h |   5 +
 drivers/gpu/drm/xe/xe_svm.c          | 631 ++++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_svm.h          |  82 +++-
 drivers/gpu/drm/xe/xe_tile.c         |  34 +-
 drivers/gpu/drm/xe/xe_tile.h         |  21 +
 drivers/gpu/drm/xe/xe_userptr.c      |   2 +-
 drivers/gpu/drm/xe/xe_vm.c           |  65 ++-
 drivers/gpu/drm/xe/xe_vm.h           |   1 +
 drivers/gpu/drm/xe/xe_vm_madvise.c   | 106 ++++-
 drivers/gpu/drm/xe/xe_vm_types.h     |  21 +-
 drivers/gpu/drm/xe/xe_vram_types.h   |  15 +-
 include/drm/drm_pagemap.h            |  91 +++-
 include/drm/drm_pagemap_util.h       |  92 ++++
 include/uapi/drm/xe_drm.h            |  18 +-
 20 files changed, 1898 insertions(+), 237 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_pagemap_util.c
 create mode 100644 include/drm/drm_pagemap_util.h

-- 
2.51.1

