Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F3E9E96F9
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 14:33:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE80510E732;
	Mon,  9 Dec 2024 13:32:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aUCb21xT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7700110E736;
 Mon,  9 Dec 2024 13:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733751178; x=1765287178;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uSqd/YWOnq+izwDYMwWH5rzyZbZRX39BPqa9EFvchyw=;
 b=aUCb21xTDNLJwv30xzuxc6tvAbkFKqXCqQ2d917jbVjP9ivV7fRVfCnN
 /ZP62cZxSOl0WJHwhKcjHHOM2o9lcYHqpyoCnSwzP8ReBI85jIU2y7aXS
 tMLToNM4l/pResZYneOxR9JPUaIO1v7OwiAiGuIY/+5GQiLehvH/UUaIJ
 k2uL2s9umfS7ZvfOVCfjinKMrBCjOn1n7RDbM2I1xcAa7tR3O3Epj1Hro
 bj+NyCEI4pnJwK1+sJ0N9TgRcoSIgijlKwtzVD9zBLHdL8tas2kFP6krr
 68PVKN1E2s03h5+Y0u3M5m+SJ0cN90dGFJbynMFMq11Uo738FjWmzjaJW A==;
X-CSE-ConnectionGUID: lcCQWHiVRHCWFriAS60ZwA==
X-CSE-MsgGUID: 381a8mchT+uqU4FWeS+CWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="34191877"
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="34191877"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 05:32:57 -0800
X-CSE-ConnectionGUID: I7FIlw9kTlWNfaEuYqt0Lw==
X-CSE-MsgGUID: SzjGNNc7RmSjVXWuAOJXMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="99531224"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 05:32:56 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 00/26] Intel Xe GPU debug support (eudebug) v3
Date: Mon,  9 Dec 2024 15:32:51 +0200
Message-ID: <20241209133318.1806472-1-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

Hi,

This is continuation of the first and second submission of
Intel Xe GPU debug support:

v1: https://lists.freedesktop.org/archives/intel-xe/2024-July/043605.html
v2: https://lists.freedesktop.org/archives/intel-xe/2024-October/052260.html

New features in v3:

 - EXEC_QUEUE_PLACEMENT events providing detailed information
   about engines participating on exec queue. (Dominik Grzegorzek)

 - EU thread page fault support (Gwan-gyeong Mun)

 - Fixed access to VRAM backed storage (Matthew Brost)
   Essential for BMG enabling. This work was already merged into
   xe driver and eudebug takes advantage of that (ttm_bo_access).
   [8].
   
 - Support for Pantherlake (Dominik Grzegorzek)

v3 supports:
 - Lunarlake (LNL)
 - Battlemage (BMG)
 - Pantherlake (PTL)

Thanks to all contributors!

Latest code can be found in:
[1] https://gitlab.freedesktop.org/miku/kernel/-/tree/eudebug-dev

Branch for this submission:
[2] https://gitlab.freedesktop.org/miku/kernel/-/tree/eudebug-v3

README/instructions:
[3] https://gitlab.freedesktop.org/miku/kernel

IGT tests (needs config switch 'xe_eudebug' to be set)
[4] https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
https://gitlab.freedesktop.org/gfx-ci/i915-infra/-/blob/master/kconfig/debug.kconfig

The user for this uapi:
[5] https://github.com/intel/compute-runtime
Event loop and thread control interaction can be found at:
https://github.com/intel/compute-runtime/tree/master/level_zero/tools/source/debug/linux/xe
And the wrappers in:
https://github.com/intel/compute-runtime/tree/master/shared/source/os_interface/linux/xe
https://github.com/intel/compute-runtime/blob/master/shared/source/os_interface/linux/xe/ioctl_helper_xe_debugger.cpp
Note that the XE support is disabled by default and you will need
NEO_ENABLE_XE_EU_DEBUG_SUPPORT enabled in order to test.

GDB support:
[6] https://github.com/intel/gdb/tree/upstream/intelgt-mvp
[7] https://github.com/intel/gdb/tree/upstream/intelgt-mvp-plus
GDB is preparing their own mailing list submission with above and based on v3.
I will reply to this cover letter and update README when it happens.

[8]: https://lists.freedesktop.org/archives/intel-xe/2024-November/060247.html
Fix non-contiguous VRAM BO access in Xe

Thanks,
Mika

Andrzej Hajda (2):
  drm/xe: add system memory page iterator support to xe_res_cursor
  drm/xe/eudebug: implement userptr_vma access

Christoph Manszewski (3):
  drm/xe/eudebug: Add vm bind and vm bind ops
  drm/xe/eudebug: Dynamically toggle debugger functionality
  drm/xe/eudebug_test: Introduce xe_eudebug wa kunit test

Dominik Grzegorzek (11):
  drm/xe/eudebug: Introduce exec_queue events
  drm/xe/eudebug: Introduce exec queue placements event
  drm/xe/eudebug: hw enablement for eudebug
  drm/xe: Add EUDEBUG_ENABLE exec queue property
  drm/xe/eudebug: Introduce per device attention scan worker
  drm/xe/eudebug: Introduce EU control interface
  drm/xe: Debug metadata create/destroy ioctls
  drm/xe: Attach debug metadata to vma
  drm/xe/eudebug: Add debug metadata support for xe_eudebug
  drm/xe/eudebug/ptl: Add support for extra attention register
  drm/xe/eudebug/ptl: Add RCU_DEBUG_1 register support for xe3

Gwan-gyeong Mun (4):
  drm/xe/eudebug: Add read/count/compare helper for eu attention
  drm/xe/eudebug: Introduce EU pagefault handling interface
  drm/xe/vm: Support for adding null page VMA to VM on request
  drm/xe/eudebug: Enable EU pagefault handling

Mika Kuoppala (6):
  ptrace: export ptrace_may_access
  drm/xe/eudebug: Introduce eudebug support
  drm/xe/eudebug: Introduce discovery for resources
  drm/xe/eudebug: Add UFENCE events with acks
  drm/xe/eudebug: vm open/pread/pwrite
  drm/xe/eudebug: Implement vm_bind_op discovery

 drivers/gpu/drm/xe/Kconfig                   |   10 +
 drivers/gpu/drm/xe/Makefile                  |    4 +
 drivers/gpu/drm/xe/regs/xe_engine_regs.h     |    7 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h         |   43 +
 drivers/gpu/drm/xe/tests/xe_eudebug.c        |  176 +
 drivers/gpu/drm/xe/tests/xe_live_test_mod.c  |    5 +
 drivers/gpu/drm/xe/xe_debug_metadata.c       |  233 +
 drivers/gpu/drm/xe/xe_debug_metadata.h       |  102 +
 drivers/gpu/drm/xe/xe_debug_metadata_types.h |   25 +
 drivers/gpu/drm/xe/xe_device.c               |   25 +-
 drivers/gpu/drm/xe/xe_device.h               |   36 +
 drivers/gpu/drm/xe/xe_device_types.h         |   54 +
 drivers/gpu/drm/xe/xe_eudebug.c              | 4451 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_eudebug.h              |  128 +
 drivers/gpu/drm/xe/xe_eudebug_types.h        |  448 ++
 drivers/gpu/drm/xe/xe_exec.c                 |    2 +-
 drivers/gpu/drm/xe/xe_exec_queue.c           |   56 +-
 drivers/gpu/drm/xe/xe_exec_queue.h           |    2 +
 drivers/gpu/drm/xe/xe_exec_queue_types.h     |    7 +
 drivers/gpu/drm/xe/xe_execlist.c             |    2 +-
 drivers/gpu/drm/xe/xe_gt_debug.c             |  212 +
 drivers/gpu/drm/xe/xe_gt_debug.h             |   46 +
 drivers/gpu/drm/xe/xe_gt_pagefault.c         |   87 +-
 drivers/gpu/drm/xe/xe_gt_pagefault.h         |    2 +
 drivers/gpu/drm/xe/xe_hw_engine.c            |    1 +
 drivers/gpu/drm/xe/xe_lrc.c                  |   16 +-
 drivers/gpu/drm/xe/xe_lrc.h                  |    4 +-
 drivers/gpu/drm/xe/xe_oa.c                   |    3 +-
 drivers/gpu/drm/xe/xe_reg_sr.c               |   21 +-
 drivers/gpu/drm/xe/xe_reg_sr.h               |    4 +-
 drivers/gpu/drm/xe/xe_res_cursor.h           |   51 +-
 drivers/gpu/drm/xe/xe_rtp.c                  |    2 +-
 drivers/gpu/drm/xe/xe_sync.c                 |   45 +-
 drivers/gpu/drm/xe/xe_sync.h                 |    8 +-
 drivers/gpu/drm/xe/xe_sync_types.h           |   28 +-
 drivers/gpu/drm/xe/xe_vm.c                   |  196 +-
 drivers/gpu/drm/xe/xe_vm.h                   |    5 +
 drivers/gpu/drm/xe/xe_vm_types.h             |   40 +
 drivers/gpu/drm/xe/xe_wa_oob.rules           |    2 +
 include/uapi/drm/xe_drm.h                    |   96 +-
 include/uapi/drm/xe_drm_eudebug.h            |  256 +
 kernel/ptrace.c                              |    1 +
 42 files changed, 6869 insertions(+), 73 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_eudebug.c
 create mode 100644 drivers/gpu/drm/xe/xe_debug_metadata.c
 create mode 100644 drivers/gpu/drm/xe/xe_debug_metadata.h
 create mode 100644 drivers/gpu/drm/xe/xe_debug_metadata_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_eudebug.c
 create mode 100644 drivers/gpu/drm/xe/xe_eudebug.h
 create mode 100644 drivers/gpu/drm/xe/xe_eudebug_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_debug.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_debug.h
 create mode 100644 include/uapi/drm/xe_drm_eudebug.h

-- 
2.43.0

