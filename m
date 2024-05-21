Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 527F78CA8AE
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 09:17:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8992C10E2CB;
	Tue, 21 May 2024 07:17:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BGWV67Cb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9905010E2A2;
 Tue, 21 May 2024 07:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716275818; x=1747811818;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=J1G7PdX+kCNsCf89KiVQOxJaDXU6ccV+SslomEehGQc=;
 b=BGWV67CbwuKwbMvbgnn2u0OXkk1pFY8L9kOUr0/HAsESnT0N63mR83/k
 tUjmPpvDo0iFTzxTAoJw5rZODCiZ+wV3AVM06pUgm6q9HSu1l/aVWaZzv
 zKEZKedqceh7Z5PXZOa0QKKs6A14VvRj4yDrDjuKNzwfkE2yx2+iqlzZE
 8Q2vCxjFqjVI6MVF3GaIW9q0ocqG7Iu9GtLgPCwrDdsIrlSKCMDE18Vnz
 UTCLMsED0VgfiY9qCnV+/Baiakdmm3iS58JpJTWWiHa70QvJHrfojqfYg
 DvfgXJ1+rGP9yWKFGv68vg85kgOnB8rIfIvWJJO1POmjQQM7N2OTrrY6Q Q==;
X-CSE-ConnectionGUID: YLuOpqN0SraHkY58j74HBQ==
X-CSE-MsgGUID: 6DV7FwwpRdKiSMo/g1i9/g==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="15393437"
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="15393437"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 00:16:57 -0700
X-CSE-ConnectionGUID: OcDD/kGNTyGHC5Ajo9E0xQ==
X-CSE-MsgGUID: gLSJsj+SRemxItNY4Ct+1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="37336629"
Received: from unknown (HELO fedora..) ([10.245.246.159])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 00:16:56 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH v3 00/21] TTM shrinker helpers and xe buffer object shrinker 
Date: Tue, 21 May 2024 09:16:18 +0200
Message-ID: <20240521071639.77614-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
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

This series implements TTM shrinker / eviction helpers and an xe bo
shrinker. It builds on two previous series, *and obsoletes these*. First

https://www.mail-archive.com/dri-devel@lists.freedesktop.org/msg484425.html

Second the previous TTM shrinker series

https://lore.kernel.org/linux-mm/b7491378-defd-4f1c-31e2-29e4c77e2d67@amd.com/T/

Where the comment about layering
https://lore.kernel.org/linux-mm/b7491378-defd-4f1c-31e2-29e4c77e2d67@amd.com/T/#ma918844aa8a6efe8768fdcda0c6590d5c93850c9

now addressed, and this version also implements shmem objects for backup
rather than direct swap-cache insertions, which was used in the previuos
series. It turns out that with per-page backup / shrinking, shmem objects
appears to work just as well as direct swap-cache insertions with the
added benefit that was introduced in the previous TTM shrinker series to
avoid running out of swap entries isn't really needed.

Patch 1-4 implements restartable LRU list iteration.

Patch 5 implements a LRU walker + resv locking helper

Patch 6 moves TTM swapping over to the walker.

Patch 7 moves TTM eviction over to the walker.

Patch 8 could in theory be skipped but introduces a possibility to easily
add or test multiple backup backends, like the direct swap-cache
insertion or even files into fast dedicated nvme storage for for example.

Patch 9 introduces helpers in the ttm_pool code for page-by-page shrinking
and recovery. It avoids having to temporarily allocate a huge amount of
memory to be able to shrink a buffer object. It also introduces the
possibility to immediately write-back pages if needed, since that tends
to be a bit delayed when left to kswapd.

Patch 10 Adds a simple error injection to the above code to help increase
test coverage.

Patch 11 Implements an xe bo shrinker and a common helper in TTM for
shrinking.

Patch 12-21 are really a separate POC series, for introducing drm_exec locking
in TTM. The patch touches both drm_exec and dma-buf and is for now marked as
an RFC:

Patch 12 Introduces dma_resv_trylock_ctx.

Patches 13-14 deal with introducing drm_exec_trylock.

Patch 15 adds a snapshot capability to drm_exec.

Patch 16 adds an evict mode locking capability to drm_exec

Patch 17 converts the LRU + locking walker to drm_exec.

Patch 18 converts TTM vm to use drm_exec.

Patch 19 converts the xe fault handler to drm_exec.

Patch 20 converts bo initialization locking to drm_exec

Patch 21 introduces drm_exec locking around some of the
bo validation callsites in drm_exec.

v2:
- Squash obsolete revision history in the patch commit messages.
- Fix a couple of review comments by Christian
- Don't store the mem_type in the TTM managers but in the
  resource cursor.
- Rename introduced TTM *back_up* function names to *backup*
- Add ttm pool recovery fault injection.
- Shrinker xe kunit test
- Various bugfixes

v3:
- Address some review comments from Matthew Brost and Christian König.
- Use the restartable LRU walk for TTM swapping and eviction.
- Provide a POC drm_exec locking implementation for exhaustive
  eviction. (Christian König).

Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <dri-devel@lists.freedesktop.org>

Thomas Hellström (21):
  drm/ttm: Allow TTM LRU list nodes of different types
  drm/ttm: Slightly clean up LRU list iteration
  drm/ttm: Use LRU hitches
  drm/ttm, drm/amdgpu, drm/xe: Consider hitch moves within bulk sublist
    moves
  drm/ttm: Provide a generic LRU walker helper
  drm/ttm: Use the LRU walker helper for swapping
  drm/ttm: Use the LRU walker for eviction
  drm/ttm: Add a virtual base class for graphics memory backup
  drm/ttm/pool: Provide a helper to shrink pages
  drm/ttm: Use fault-injection to test error paths
  drm/ttm, drm/xe: Add a shrinker for xe bos
  dma-buf/dma-resv: Introduce dma_resv_trylock_ctx()
  drm/exec: Rework contended locking
  drm/exec: Introduce a drm_exec_trylock_obj() function
  drm/exec: Add a snapshot capability
  drm/exec: Introduce an evict mode
  drm/ttm: Support drm_exec locking for eviction and swapping
  drm/ttm: Convert ttm vm to using drm_exec
  drm/xe: Use drm_exec for fault locking
  drm/ttm: Use drm_exec_trylock for bo initialization
  drm/xe: Initial support for drm exec locking during validate

 drivers/gpu/drm/Kconfig                       |  10 +
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |  16 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c       |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c       |  12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c       |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_seq64.c     |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c  |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        |   4 +
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c          |   2 +-
 drivers/gpu/drm/drm_exec.c                    | 209 ++++++-
 drivers/gpu/drm/drm_gpuvm.c                   |   8 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c       |   4 +-
 drivers/gpu/drm/imagination/pvr_job.c         |   2 +-
 drivers/gpu/drm/msm/msm_gem_submit.c          |   2 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c         |   4 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c        |   2 +-
 drivers/gpu/drm/radeon/radeon_gem.c           |   4 +-
 drivers/gpu/drm/tests/drm_exec_test.c         |  12 +-
 drivers/gpu/drm/ttm/Makefile                  |   2 +-
 drivers/gpu/drm/ttm/ttm_backup_shmem.c        | 137 +++++
 drivers/gpu/drm/ttm/ttm_bo.c                  | 516 +++++++++---------
 drivers/gpu/drm/ttm/ttm_bo_util.c             | 241 ++++++++
 drivers/gpu/drm/ttm/ttm_bo_vm.c               | 101 ++--
 drivers/gpu/drm/ttm/ttm_device.c              |  29 +-
 drivers/gpu/drm/ttm/ttm_pool.c                | 412 +++++++++++++-
 drivers/gpu/drm/ttm/ttm_resource.c            | 264 +++++++--
 drivers/gpu/drm/ttm/ttm_tt.c                  |  37 ++
 drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c    |   6 +-
 drivers/gpu/drm/xe/Makefile                   |   1 +
 drivers/gpu/drm/xe/display/xe_fb_pin.c        |   2 +-
 drivers/gpu/drm/xe/tests/xe_bo.c              | 124 ++++-
 drivers/gpu/drm/xe/tests/xe_bo_test.c         |   1 +
 drivers/gpu/drm/xe/tests/xe_bo_test.h         |   1 +
 drivers/gpu/drm/xe/tests/xe_dma_buf.c         |   4 +-
 drivers/gpu/drm/xe/tests/xe_migrate.c         |   2 +-
 drivers/gpu/drm/xe/xe_bo.c                    | 173 ++++--
 drivers/gpu/drm/xe/xe_bo.h                    |   8 +-
 drivers/gpu/drm/xe/xe_device.c                |   8 +
 drivers/gpu/drm/xe/xe_device_types.h          |   2 +
 drivers/gpu/drm/xe/xe_dma_buf.c               |   2 +-
 drivers/gpu/drm/xe/xe_ggtt.c                  |   2 +-
 drivers/gpu/drm/xe/xe_gt_pagefault.c          |   6 +-
 drivers/gpu/drm/xe/xe_shrinker.c              | 224 ++++++++
 drivers/gpu/drm/xe/xe_shrinker.h              |  18 +
 drivers/gpu/drm/xe/xe_vm.c                    |  18 +-
 include/drm/drm_exec.h                        |  62 ++-
 include/drm/ttm/ttm_backup.h                  | 136 +++++
 include/drm/ttm/ttm_bo.h                      |  59 +-
 include/drm/ttm/ttm_pool.h                    |   5 +
 include/drm/ttm/ttm_resource.h                |  99 +++-
 include/drm/ttm/ttm_tt.h                      |  20 +
 include/linux/dma-resv.h                      |  23 +-
 53 files changed, 2535 insertions(+), 531 deletions(-)
 create mode 100644 drivers/gpu/drm/ttm/ttm_backup_shmem.c
 create mode 100644 drivers/gpu/drm/xe/xe_shrinker.c
 create mode 100644 drivers/gpu/drm/xe/xe_shrinker.h
 create mode 100644 include/drm/ttm/ttm_backup.h

-- 
2.44.0

