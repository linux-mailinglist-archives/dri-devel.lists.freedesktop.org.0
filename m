Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBF83873E0
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 10:27:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15AF36E850;
	Tue, 18 May 2021 08:27:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B63E6E842;
 Tue, 18 May 2021 08:27:25 +0000 (UTC)
IronPort-SDR: ORN3XC/AG4TnOb87rexsaIL0WfPRE93ygg3jaj/bLg64PSF0smDILLTsZdbbODCySf3BOEwLMu
 WUk/Dhy0LkTw==
X-IronPort-AV: E=McAfee;i="6200,9189,9987"; a="200707430"
X-IronPort-AV: E=Sophos;i="5.82,309,1613462400"; d="scan'208";a="200707430"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2021 01:27:24 -0700
IronPort-SDR: xu7Uf8tGohbOV56SMJvUmyGje0v78V8xMQ21klQ96ghpvblmO+Yxmc5w8q0tKl0NgHMYsDmrDL
 qLPJaZmN98cw==
X-IronPort-AV: E=Sophos;i="5.82,309,1613462400"; d="scan'208";a="611892261"
Received: from cmutgix-mobl.gar.corp.intel.com (HELO thellst-mobl1.intel.com)
 ([10.249.254.195])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2021 01:27:19 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 00/15] drm/i915: Move LMEM (VRAM) management over to TTM
Date: Tue, 18 May 2021 10:26:46 +0200
Message-Id: <20210518082701.997251-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an initial patch series to move discrete memory management over to
TTM. It will be followed up shortly with adding more functionality.

The buddy allocator is temporarily removed along with its selftests and
It is replaced with the TTM range manager and some selftests are adjusted
to account for introduced fragmentation. Work is ongoing to reintroduce the
buddy allocator as a TTM resource manager.

A new memcpy ttm move is introduced that uses kmap_local() functionality
rather than vmap(). Among other things stated in the patch commit message
it helps us deal with page-pased LMEM memory. It is generic enough to replace
the ttm memcpy move with some additional work if so desired. On x86 it also
enables prefetching reads from write-combined memory.

Finally the old i915 gem object LMEM backend is replaced with a
i915 gem object TTM backend and some additional i915 gem object ops are
introduced to support the added functionality.
Currently it is used only to support management and eviction of the LMEM
region, but work is underway to extend the support to system memory. In this
way we use TTM the way it was originally intended, having the GPU binding
taken care of by driver code.

Intention is to follow up with
- System memory support
- Pipelined accelerated moves / migration
- Re-added buddy allocator in the TTM framework

v2:
- Add patches to move pagefaulting over to TTM
- Break out TTM changes to separate patches
- Address various review comments as detailed in the affected patches

Cc: Christian König <christian.koenig@amd.com>

Maarten Lankhorst (4):
  drm/i915: Disable mmap ioctl for gen12+
  drm/ttm: Add BO and offset arguments for vm_access and vm_fault ttm
    handlers.
  drm/i915: Use ttm mmap handling for ttm bo's.
  drm/i915/ttm: Add io sgt caching to i915_ttm_io_mem_pfn

Thomas Hellström (11):
  drm/i915: Untangle the vma pages_mutex
  drm/i915: Don't free shared locks while shared
  drm/i915: Fix i915_sg_page_sizes to record dma segments rather than
    physical pages
  drm/ttm: Export functions to initialize and finalize the ttm range
    manager standalone
  drm/i915/ttm Initialize the ttm device and memory managers
  drm/i915/ttm: Embed a ttm buffer object in the i915 gem object
  drm/ttm: Export ttm_bo_tt_destroy()
  drm/i915/ttm Add a generic TTM memcpy move for page-based iomem
  drm/ttm, drm/amdgpu: Allow the driver some control over swapping
  drm/i915/ttm: Introduce a TTM i915 gem object backend
  drm/i915/lmem: Verify checks for lmem residency

 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |   8 +-
 drivers/gpu/drm/i915/Kconfig                  |   1 +
 drivers/gpu/drm/i915/Makefile                 |   4 +-
 drivers/gpu/drm/i915/display/intel_display.c  |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_lmem.c      |  71 +-
 drivers/gpu/drm/i915/gem/i915_gem_lmem.h      |   5 -
 drivers/gpu/drm/i915/gem/i915_gem_mman.c      |  24 +-
 drivers/gpu/drm/i915/gem/i915_gem_mman.h      |   2 +
 drivers/gpu/drm/i915/gem/i915_gem_object.c    | 149 +++-
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |  19 +-
 .../gpu/drm/i915/gem/i915_gem_object_types.h  |  39 +-
 drivers/gpu/drm/i915/gem/i915_gem_pages.c     |   6 +-
 drivers/gpu/drm/i915/gem/i915_gem_phys.c      |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_region.c    | 126 +--
 drivers/gpu/drm/i915/gem/i915_gem_region.h    |   4 -
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c     |   4 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c    |  10 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.h    |   9 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c       | 626 ++++++++++++++
 drivers/gpu/drm/i915/gem/i915_gem_ttm.h       |  48 ++
 .../gpu/drm/i915/gem/i915_gem_ttm_bo_util.c   | 194 +++++
 .../gpu/drm/i915/gem/i915_gem_ttm_bo_util.h   | 107 +++
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c   |   2 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c          |  19 +-
 drivers/gpu/drm/i915/gt/intel_gt.c            |   2 -
 drivers/gpu/drm/i915/gt/intel_gtt.c           |  45 +-
 drivers/gpu/drm/i915/gt/intel_gtt.h           |  30 +-
 drivers/gpu/drm/i915/gt/intel_ppgtt.c         |   2 +-
 drivers/gpu/drm/i915/gt/intel_region_lmem.c   |  30 +-
 drivers/gpu/drm/i915/i915_buddy.c             | 435 ----------
 drivers/gpu/drm/i915/i915_buddy.h             | 131 ---
 drivers/gpu/drm/i915/i915_drv.c               |  13 +
 drivers/gpu/drm/i915/i915_drv.h               |   7 +-
 drivers/gpu/drm/i915/i915_gem.c               |   6 +-
 drivers/gpu/drm/i915/i915_globals.c           |   1 -
 drivers/gpu/drm/i915/i915_globals.h           |   1 -
 drivers/gpu/drm/i915/i915_scatterlist.c       |  70 ++
 drivers/gpu/drm/i915/i915_scatterlist.h       |  20 +-
 drivers/gpu/drm/i915/i915_vma.c               |  33 +-
 drivers/gpu/drm/i915/intel_memory_region.c    | 181 ++--
 drivers/gpu/drm/i915/intel_memory_region.h    |  45 +-
 drivers/gpu/drm/i915/intel_region_ttm.c       | 246 ++++++
 drivers/gpu/drm/i915/intel_region_ttm.h       |  32 +
 drivers/gpu/drm/i915/selftests/i915_buddy.c   | 789 ------------------
 .../drm/i915/selftests/i915_mock_selftests.h  |   1 -
 .../drm/i915/selftests/intel_memory_region.c  | 133 +--
 drivers/gpu/drm/i915/selftests/mock_region.c  |  50 +-
 drivers/gpu/drm/nouveau/nouveau_ttm.c         |   4 +-
 drivers/gpu/drm/radeon/radeon_ttm.c           |   4 +-
 drivers/gpu/drm/ttm/ttm_bo.c                  |  42 +-
 drivers/gpu/drm/ttm/ttm_bo_vm.c               |  84 +-
 drivers/gpu/drm/ttm/ttm_range_manager.c       |  55 +-
 drivers/gpu/drm/ttm/ttm_tt.c                  |   4 +
 drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c    |   8 +-
 include/drm/ttm/ttm_bo_api.h                  |   9 +-
 include/drm/ttm/ttm_bo_driver.h               |  23 +
 57 files changed, 2068 insertions(+), 1951 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_ttm.c
 create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_ttm.h
 create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_ttm_bo_util.c
 create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_ttm_bo_util.h
 delete mode 100644 drivers/gpu/drm/i915/i915_buddy.c
 delete mode 100644 drivers/gpu/drm/i915/i915_buddy.h
 create mode 100644 drivers/gpu/drm/i915/intel_region_ttm.c
 create mode 100644 drivers/gpu/drm/i915/intel_region_ttm.h
 delete mode 100644 drivers/gpu/drm/i915/selftests/i915_buddy.c

-- 
2.31.1

