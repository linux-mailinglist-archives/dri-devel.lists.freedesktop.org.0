Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C651A38CA24
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 17:33:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C6916EB63;
	Fri, 21 May 2021 15:33:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25E056EB63;
 Fri, 21 May 2021 15:33:08 +0000 (UTC)
IronPort-SDR: eY5ZPSPZkVxt/iUF5yxFSdT5omqU2tXm7tgpY6hY4CODzOAP4cmsx6+JUITOKVuisCAdXvxdNp
 Y02Lq1xvHVlw==
X-IronPort-AV: E=McAfee;i="6200,9189,9990"; a="265415693"
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; d="scan'208";a="265415693"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2021 08:33:07 -0700
IronPort-SDR: UqKj4e8gTid7F9QhQspU/elwKDUvD9RXkjKvPejFVsE7Gk8yD45bccQbfeIJrBIHq11wsKJvK1
 NDItsapxJHcw==
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; d="scan'208";a="441125288"
Received: from imarinmo-mobl1.ger.corp.intel.com (HELO
 thellst-mobl1.intel.com) ([10.249.254.34])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2021 08:33:05 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 00/12] drm/i915: Move LMEM (VRAM) management over to TTM
Date: Fri, 21 May 2021 17:32:41 +0200
Message-Id: <20210521153253.518037-1-thomas.hellstrom@linux.intel.com>
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

v3:
- Drop TTM pagefaulting patches for now due changing approach due to a NAK.
- Address feedback on TTM patches
- Move the new TTM memcpy functionality into TTM.
- Move fast WC memcpy to drm
- Various fixes all over the place as shown in patch commit messages.

Cc: Christian König <christian.koenig@amd.com>

Thomas Hellström (12):
  drm/i915: Untangle the vma pages_mutex
  drm/i915: Don't free shared locks while shared
  drm/i915: Fix i915_sg_page_sizes to record dma segments rather than
    physical pages
  drm/i915/ttm Initialize the ttm device and memory managers
  drm/i915/ttm: Embed a ttm buffer object in the i915 gem object
  drm/ttm: Add a generic TTM memcpy move for page-based iomem
  drm, drm/i915: Move the memcpy_from_wc functionality to core drm
  drm/ttm: Use drm_memcpy_from_wc_dbm for TTM bo moves
  drm/ttm: Document and optimize ttm_bo_pipeline_gutting()
  drm/ttm, drm/amdgpu: Allow the driver some control over swapping
  drm/i915/ttm: Introduce a TTM i915 gem object backend
  drm/i915/lmem: Verify checks for lmem residency

 drivers/gpu/drm/Makefile                      |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |   4 +
 drivers/gpu/drm/drm_drv.c                     |   2 +
 .../drm/{i915/i915_memcpy.c => drm_memcpy.c}  |  63 +-
 drivers/gpu/drm/i915/Kconfig                  |   1 +
 drivers/gpu/drm/i915/Makefile                 |   4 +-
 drivers/gpu/drm/i915/display/intel_display.c  |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_create.c    |   9 +-
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |   2 +-
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |   4 +-
 drivers/gpu/drm/i915/gem/i915_gem_lmem.c      |  71 +-
 drivers/gpu/drm/i915/gem/i915_gem_lmem.h      |   5 -
 drivers/gpu/drm/i915/gem/i915_gem_object.c    | 154 +++-
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |  13 +
 .../gpu/drm/i915/gem/i915_gem_object_types.h  |  49 +-
 drivers/gpu/drm/i915/gem/i915_gem_pages.c     |   3 +-
 drivers/gpu/drm/i915/gem/i915_gem_phys.c      |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_region.c    | 126 +--
 drivers/gpu/drm/i915/gem/i915_gem_region.h    |   4 -
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c     |   4 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c    |  10 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.h    |   9 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c       | 531 ++++++++++++
 drivers/gpu/drm/i915/gem/i915_gem_ttm.h       |  50 ++
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c   |   2 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c          |  19 +-
 drivers/gpu/drm/i915/gt/intel_gt.c            |   2 -
 drivers/gpu/drm/i915/gt/intel_gtt.c           |  45 +-
 drivers/gpu/drm/i915/gt/intel_gtt.h           |  28 +-
 drivers/gpu/drm/i915/gt/intel_ppgtt.c         |   2 +-
 drivers/gpu/drm/i915/gt/intel_region_lmem.c   |  30 +-
 drivers/gpu/drm/i915/gt/selftest_reset.c      |   7 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c    |  11 +-
 drivers/gpu/drm/i915/i915_buddy.c             | 435 ----------
 drivers/gpu/drm/i915/i915_buddy.h             | 131 ---
 drivers/gpu/drm/i915/i915_cmd_parser.c        |   4 +-
 drivers/gpu/drm/i915/i915_drv.c               |  15 +-
 drivers/gpu/drm/i915/i915_drv.h               |   7 +-
 drivers/gpu/drm/i915/i915_gem.c               |   6 +-
 drivers/gpu/drm/i915/i915_globals.c           |   1 -
 drivers/gpu/drm/i915/i915_globals.h           |   1 -
 drivers/gpu/drm/i915/i915_gpu_error.c         |   8 +-
 drivers/gpu/drm/i915/i915_memcpy.h            |  34 -
 drivers/gpu/drm/i915/i915_scatterlist.c       |  70 ++
 drivers/gpu/drm/i915/i915_scatterlist.h       |  20 +-
 drivers/gpu/drm/i915/i915_vma.c               |  29 +-
 drivers/gpu/drm/i915/intel_memory_region.c    | 181 ++--
 drivers/gpu/drm/i915/intel_memory_region.h    |  45 +-
 drivers/gpu/drm/i915/intel_region_ttm.c       | 332 ++++++++
 drivers/gpu/drm/i915/intel_region_ttm.h       |  38 +
 drivers/gpu/drm/i915/selftests/i915_buddy.c   | 789 ------------------
 .../drm/i915/selftests/i915_mock_selftests.h  |   1 -
 .../drm/i915/selftests/intel_memory_region.c  | 140 +---
 drivers/gpu/drm/i915/selftests/mock_region.c  |  52 +-
 drivers/gpu/drm/ttm/ttm_bo.c                  |  63 +-
 drivers/gpu/drm/ttm/ttm_bo_util.c             | 337 ++++----
 drivers/gpu/drm/ttm/ttm_module.c              |  35 +
 drivers/gpu/drm/ttm/ttm_resource.c            | 166 ++++
 drivers/gpu/drm/ttm/ttm_tt.c                  |  50 ++
 include/drm/drm_memcpy.h                      |  47 ++
 include/drm/ttm/ttm_bo_driver.h               |  28 +
 include/drm/ttm/ttm_caching.h                 |   2 +
 include/drm/ttm/ttm_kmap_iter.h               |  61 ++
 include/drm/ttm/ttm_resource.h                |  61 ++
 include/drm/ttm/ttm_tt.h                      |  26 +
 65 files changed, 2322 insertions(+), 2163 deletions(-)
 rename drivers/gpu/drm/{i915/i915_memcpy.c => drm_memcpy.c} (70%)
 create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_ttm.c
 create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_ttm.h
 delete mode 100644 drivers/gpu/drm/i915/i915_buddy.c
 delete mode 100644 drivers/gpu/drm/i915/i915_buddy.h
 delete mode 100644 drivers/gpu/drm/i915/i915_memcpy.h
 create mode 100644 drivers/gpu/drm/i915/intel_region_ttm.c
 create mode 100644 drivers/gpu/drm/i915/intel_region_ttm.h
 delete mode 100644 drivers/gpu/drm/i915/selftests/i915_buddy.c
 create mode 100644 include/drm/drm_memcpy.h
 create mode 100644 include/drm/ttm/ttm_kmap_iter.h

-- 
2.31.1

