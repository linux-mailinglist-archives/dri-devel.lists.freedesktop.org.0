Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3AFC08FC9
	for <lists+dri-devel@lfdr.de>; Sat, 25 Oct 2025 14:04:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6C8710E036;
	Sat, 25 Oct 2025 12:04:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SMru6+Lc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B78010E036;
 Sat, 25 Oct 2025 12:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761393876; x=1792929876;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YeaTaiYJchd5hgt7ETSdu7op9zqo0wPxn50nTiqdMA8=;
 b=SMru6+Lc8VPVvlDo30KbB5vRvN9jP2o330I3kH9C1XO+8d3qJAjx+vlT
 pbmA/i7sI69kng3ynRTQbnqpsYjXMHaC7mInZwHzHphJeRaW2kqKSSUOB
 IyZwu7swNTFI3MNpQHQzX8HBket9YqXBYUcwqVPBgd7MzG/Mlt4ha0YVN
 zFbmeqbCp4ZYr6/70ZRv/5l+Hjt3Nlc5gydhcUeaQF1yEr42TnZdTqMoO
 GQBcpt8/d7q9ZZX/AUYFXxQJU2iHusadAkR0jYauV4xYu5wGnBvs87HR4
 IDkIkwf+kiQykLW7GmNxOKJs1RXjMzC85GkeRuoH6Ge27wgF+kLVY+QYx w==;
X-CSE-ConnectionGUID: iHHDnDINQLONz4vT9k53UQ==
X-CSE-MsgGUID: XIXsD8uTQlm1jjxOq5jtSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63590369"
X-IronPort-AV: E=Sophos;i="6.19,254,1754982000"; d="scan'208";a="63590369"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2025 05:04:36 -0700
X-CSE-ConnectionGUID: 7eWzAw2tRgOLmquzZ42f3w==
X-CSE-MsgGUID: okMVuwMAT0ujte9IwBZ23Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,254,1754982000"; d="scan'208";a="189023661"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO fedora)
 ([10.245.245.168])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2025 05:04:32 -0700
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
Subject: [PATCH 00/15] Dynamic drm_pagemaps and Initial multi-device SVM
Date: Sat, 25 Oct 2025 14:03:57 +0200
Message-ID: <20251025120412.12262-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.0
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

Patches 1-6 deals with dynamic drm_pagemaps as described above.
Patches 7-11 adds infrastructure to handle remote drm_pagemaps with
fast interconnects.
Patch 12 extends the xe madvise() UAPI to handle remote drm_pagemaps.
Patch 13 adds a pcie-p2p dma SVM interconnect to the xe driver.
Patch 14-15 are minor improvements of the xe functionality.

What's still missing is the optimized p2p migration and implementation
of migration policies. That will be implemented in follow-up series. 

Thomas Hellström (15):
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
  drm/xe/vm: Add a prefetch debug printout
  drm/xe: Retry migration once

 drivers/gpu/drm/Makefile             |   3 +-
 drivers/gpu/drm/drm_pagemap.c        | 177 ++++++++-
 drivers/gpu/drm/drm_pagemap_util.c   | 544 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device.c       |  20 +
 drivers/gpu/drm/xe/xe_device.h       |   2 +
 drivers/gpu/drm/xe/xe_device_types.h |   5 +
 drivers/gpu/drm/xe/xe_svm.c          | 551 +++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_svm.h          |  78 +++-
 drivers/gpu/drm/xe/xe_tile.c         |  34 +-
 drivers/gpu/drm/xe/xe_tile.h         |  21 +
 drivers/gpu/drm/xe/xe_userptr.c      |   2 +-
 drivers/gpu/drm/xe/xe_vm.c           |  59 ++-
 drivers/gpu/drm/xe/xe_vm.h           |   1 +
 drivers/gpu/drm/xe/xe_vm_madvise.c   |  92 ++++-
 drivers/gpu/drm/xe/xe_vm_types.h     |  21 +-
 drivers/gpu/drm/xe/xe_vram_types.h   |  15 +-
 include/drm/drm_pagemap.h            |  91 ++++-
 include/drm/drm_pagemap_util.h       |  78 ++++
 include/uapi/drm/xe_drm.h            |   4 +-
 19 files changed, 1630 insertions(+), 168 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_pagemap_util.c
 create mode 100644 include/drm/drm_pagemap_util.h

-- 
2.51.0

