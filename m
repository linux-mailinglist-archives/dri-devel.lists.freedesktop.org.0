Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F1CA5E607
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 22:04:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFE7210E1A7;
	Wed, 12 Mar 2025 21:04:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fW9aZdte";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 550A010E1A7;
 Wed, 12 Mar 2025 21:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741813490; x=1773349490;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VtWJcM5RsAkQOoCttZUgCWjpeoMJ4sMJek7bKDslKO8=;
 b=fW9aZdteCIqaHoPGUyLcXW9Zg71E912WxXWnCPu7flG0VqZjuPBri1wN
 JpFMa6HoDnjNaeuIiuk+lACANMi7BT8hT1tn4f5w2Q+G81gd2U5Rl4071
 w3WVIttu8salwhbF58QaYcL4+WLLtciFIvjHO84egqMQezQnBbD5PD8sw
 gOlxSlhuucy+i3oUjJO2opMum94PUWGWerwBwmTbX9LJtGTrp9DyyEgpB
 i5haH7MviKQR6Yqx4i/Uj4gJH90f1TKP1h4EVJpPlH+0TB7EZQ8e3ndSr
 rlSsBTbl9PLdELOh0rR3IlCpM33eYk3pVw4/YfKKQdmqZcgmeKhpXBM4K g==;
X-CSE-ConnectionGUID: 8ON3cZ0dTaGj0rBsmRHM+Q==
X-CSE-MsgGUID: kCJNOJKsT76om88UvG0boA==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="46562099"
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; d="scan'208";a="46562099"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 14:04:50 -0700
X-CSE-ConnectionGUID: hAb5tOQQQwaTTTWEMnUe2w==
X-CSE-MsgGUID: 04II1SAIR6i5uI4DvQ4hpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; d="scan'208";a="120791031"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.73])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 14:04:45 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dakr@kernel.org, "Mrozek, Michal" <michal.mrozek@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [RFC PATCH 00/19] drm, drm/xe: Multi-device GPUSVM
Date: Wed, 12 Mar 2025 22:03:57 +0100
Message-ID: <20250312210416.3120-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.48.1
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

This RFC implements and requests comments for a way to handle SVM with multi-device,
typically with fast interconnects. It adds generic code and helpers in drm, and
device-specific code for xe.

For SVM, devices set up maps of device-private struct pages, using a struct dev_pagemap,
The CPU virtual address space (mm), can then be set up using special page-table entries
to point to such pages, but they can't be accessed directly by the CPU, but possibly
by other devices using a fast interconnect. This series aims to provide helpers to
identify pagemaps that take part in such a fast interconnect and to aid in migrating
between them.

This is initially done by augmenting the struct dev_pagemap with a struct drm_pagemap,
and having the struct drm_pagemap implement a "populate_mm" method, where a region of
the CPU virtual address space (mm) is populated with device_private pages from the
dev_pagemap associated with the drm_pagemap, migrating data from system memory or other
devices if necessary. The drm_pagemap_populate_mm() function is then typically called
from a fault handler, using the struct drm_pagemap pointer of choice. It could be
referencing a local drm_pagemap or a remote one. The migration is now completely done
by drm_pagemap callbacks, (typically using a copy-engine local to the dev_pagemap local
memory).

In addition there are helpers to build a drm_pagemap UAPI using file-descripors
representing struct drm_pagemaps, and a helper to register devices with a common
fast interconnect. The UAPI is intended to be private to the device, but if drivers
agree to identify struct drm_pagemaps by file descriptors one could in theory
do cross-driver multi-device SVM if a use-case were found.

The implementation for the Xe driver uses dynamic pagemaps which are created on first
use and removed 5s after the last reference is gone. Pagemaps are revoked on
device unbind, and data is then migrated to system.

Status:
This is a POC series. It has been tested with an IGT test soon to be published, with a
DG1 drm_pagemap and a BattleMage SVM client. There is separate work ongoing for the
gpu_madvise functionality.

The Xe implementation of the "populate_mm()" callback is
still rudimentary and doesn't migrate from foreign devices. It should be tuned to do
smarter choices.

Any feedback appreciated.

Patch overview:
Patch 1:
- Extends the way the Xe driver can compile out SVM support and pagemaps.
Patch 2:
- Fixes an existing potential UAF in the Xe SVM code.
Patch 3:
- Introduces the drm_pagemap.c file and moves drm_pagemap functionality to it.
Patch 4:
- Adds a populate_mm op to drm_pagemap.
Patch 5:
- Implement Xe's version of the populate_mm op.
Patch 6:
- Refcount struct drm_pagemap.
Patch 7:
- Cleanup patch.
Patch 8:
- Add a bo_remove callback for Xe, Used during device unbind.
Patch 9:
- Add a drm_pagemap utility to calculate a common owner structure
Patch 10:
- Adopt GPUSVM to a (sort of) dynamic owner.
Patch 11:
- Xe calculates the dev_private owner using the drm_pagemap utility.
Patch 12:
- Update the Xe page-table code to handle per range mixed system / device_private placement.
Patch 13:
- Modify GPUSVM to allow such placements.
Patch 14:
- Add a preferred pagemap to use by the Xe fault handler.
Patch 15:
- Add a utility that converts between drm_pagemaps and file-descriptors and back.
Patch 16:
- Fix Xe so that also devices without fault capability can publish drm_pagemaps.
Patch 17:
- Add the devmem_open UAPI, creating a drm_pagemap file descriptor from a
  (device, region) pair.
Patch 18:
- (Only for POC) Add an GPU madvise prefer_devmem IOCTL.
Patch 19:
- (Only for POC) Implement pcie p2p DMA as a fast interconnect and test.

Matthew Brost (1):
  drm/gpusvm, drm/pagemap: Move migration functionality to drm_pagemap

Thomas Hellström (18):
  drm/xe: Introduce CONFIG_DRM_XE_GPUSVM
  drm/xe/svm: Fix a potential bo UAF
  drm/pagemap: Add a populate_mm op
  drm/xe: Implement and use the drm_pagemap populate_mm op
  drm/pagemap, drm/xe: Add refcounting to struct drm_pagemap and manage
    lifetime
  drm/pagemap: Get rid of the struct
    drm_pagemap_zdd::device_private_page_owner field
  drm/xe/bo: Add a bo remove callback
  drm/pagemap_util: Add a utility to assign an owner to a set of
    interconnected gpus
  drm/gpusvm, drm/xe: Move the device private owner to the
    drm_gpusvm_ctx
  drm/xe: Use the drm_pagemap_util helper to get a svm pagemap owner
  drm/xe: Make the PT code handle placement per PTE rather than per vma
    / range
  drm/gpusvm: Allow mixed mappings
  drm/xe: Add a preferred dpagemap
  drm/pagemap/util: Add file descriptors pointing to struct drm_pagemap
  drm/xe/migrate: Allow xe_migrate_vram() also on non-pagefault capable
    devices
  drm/xe/uapi: Add the devmem_open ioctl
  drm/xe/uapi: HAX: Add the xe_madvise_prefer_devmem IOCTL
  drm/xe: HAX: Use pcie p2p dma to test fast interconnect

 Documentation/gpu/rfc/gpusvm.rst     |  12 +-
 drivers/gpu/drm/Makefile             |   7 +-
 drivers/gpu/drm/drm_gpusvm.c         | 782 +---------------------
 drivers/gpu/drm/drm_pagemap.c        | 940 +++++++++++++++++++++++++++
 drivers/gpu/drm/drm_pagemap_util.c   | 203 ++++++
 drivers/gpu/drm/xe/Kconfig           |  24 +-
 drivers/gpu/drm/xe/Makefile          |   2 +-
 drivers/gpu/drm/xe/xe_bo.c           |  65 +-
 drivers/gpu/drm/xe/xe_bo.h           |   2 +
 drivers/gpu/drm/xe/xe_bo_types.h     |   2 +-
 drivers/gpu/drm/xe/xe_device.c       |   8 +
 drivers/gpu/drm/xe/xe_device_types.h |  30 +-
 drivers/gpu/drm/xe/xe_migrate.c      |   8 +-
 drivers/gpu/drm/xe/xe_pt.c           | 112 ++--
 drivers/gpu/drm/xe/xe_query.c        |   2 +-
 drivers/gpu/drm/xe/xe_svm.c          | 716 +++++++++++++++++---
 drivers/gpu/drm/xe/xe_svm.h          | 158 ++++-
 drivers/gpu/drm/xe/xe_tile.c         |  20 +-
 drivers/gpu/drm/xe/xe_tile.h         |  33 +
 drivers/gpu/drm/xe/xe_vm.c           |   6 +-
 drivers/gpu/drm/xe/xe_vm_types.h     |   7 +
 include/drm/drm_gpusvm.h             | 102 +--
 include/drm/drm_pagemap.h            | 190 +++++-
 include/drm/drm_pagemap_util.h       |  59 ++
 include/uapi/drm/xe_drm.h            |  39 ++
 25 files changed, 2458 insertions(+), 1071 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_pagemap.c
 create mode 100644 drivers/gpu/drm/drm_pagemap_util.c
 create mode 100644 include/drm/drm_pagemap_util.h

-- 
2.48.1

