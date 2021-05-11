Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC6837A775
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 15:25:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DBEE6EA2D;
	Tue, 11 May 2021 13:25:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8F296E216;
 Tue, 11 May 2021 13:25:55 +0000 (UTC)
IronPort-SDR: r1aIqZ/GdjKTcFFCEhVMyKuMqWUm2Uc5LwQAMGEwXPFsNjjfVW3ltVxT48BhgHCYSlJaBUycgz
 pZS7slaHpeJg==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="186574053"
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="186574053"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 06:25:54 -0700
IronPort-SDR: TN+5U8rRlw3xUmbnEhIiGegsgnc77NlmCzq1e0JaK5Hxc/HiAx8iU0M9kd7xKs4908vwcx3ezu
 dkp8nd8cVxNw==
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="468905322"
Received: from kjeldbeg-mobl2.ger.corp.intel.com (HELO
 thellst-mobl1.intel.com) ([10.249.254.168])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 06:25:53 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 0/7] drm/i915: Move LMEM (VRAM) management over to TTM
Date: Tue, 11 May 2021 15:25:18 +0200
Message-Id: <20210511132525.377190-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.30.2
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
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
- TTM CPU pagefaulting
- Pipelined accelerated moves / migration


Thomas Hellström (7):
  drm/i915: Untangle the vma pages_mutex
  drm/i915: Don't free shared locks while shared
  drm/i915/ttm, drm/ttm: Initialize the ttm device and memory managers.
  drm/i915/ttm: Embed a ttm buffer object in the i915 gem object
  drm/i915/ttm, drm/ttm: Add a generic TTM memcpy move for page-based
    iomem
  drm/i915/ttm, drm/ttm: Introduce a TTM i915 gem object backend
  drm/i915/lmem: Verify checks for lmem residency

 drivers/gpu/drm/i915/Kconfig                  |   1 +
 drivers/gpu/drm/i915/Makefile                 |   4 +-
 drivers/gpu/drm/i915/display/intel_display.c  |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_lmem.c      |  71 +-
 drivers/gpu/drm/i915/gem/i915_gem_lmem.h      |   5 -
 drivers/gpu/drm/i915/gem/i915_gem_object.c    | 161 +++-
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |  13 +
 .../gpu/drm/i915/gem/i915_gem_object_types.h  |  37 +-
 drivers/gpu/drm/i915/gem/i915_gem_pages.c     |   3 +-
 drivers/gpu/drm/i915/gem/i915_gem_region.c    | 126 +--
 drivers/gpu/drm/i915/gem/i915_gem_region.h    |   4 -
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c     |   4 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c    |  10 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.h    |   9 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c       | 534 ++++++++++++
 drivers/gpu/drm/i915/gem/i915_gem_ttm.h       |  48 ++
 .../gpu/drm/i915/gem/i915_gem_ttm_bo_util.c   | 155 ++++
 .../gpu/drm/i915/gem/i915_gem_ttm_bo_util.h   | 141 ++++
 drivers/gpu/drm/i915/gt/intel_ggtt.c          |  13 +-
 drivers/gpu/drm/i915/gt/intel_gt.c            |   2 -
 drivers/gpu/drm/i915/gt/intel_gtt.c           |  45 +-
 drivers/gpu/drm/i915/gt/intel_gtt.h           |  29 +-
 drivers/gpu/drm/i915/gt/intel_ppgtt.c         |   2 +-
 drivers/gpu/drm/i915/gt/intel_region_lmem.c   |  30 +-
 drivers/gpu/drm/i915/i915_buddy.c             | 435 ----------
 drivers/gpu/drm/i915/i915_buddy.h             | 131 ---
 drivers/gpu/drm/i915/i915_drv.c               |   8 +
 drivers/gpu/drm/i915/i915_drv.h               |   7 +-
 drivers/gpu/drm/i915/i915_gem.c               |   6 +-
 drivers/gpu/drm/i915/i915_globals.c           |   1 -
 drivers/gpu/drm/i915/i915_globals.h           |   1 -
 drivers/gpu/drm/i915/i915_scatterlist.c       |  70 ++
 drivers/gpu/drm/i915/i915_scatterlist.h       |  35 +
 drivers/gpu/drm/i915/i915_vma.c               |  33 +-
 drivers/gpu/drm/i915/intel_memory_region.c    | 181 ++--
 drivers/gpu/drm/i915/intel_memory_region.h    |  45 +-
 drivers/gpu/drm/i915/intel_region_ttm.c       | 247 ++++++
 drivers/gpu/drm/i915/intel_region_ttm.h       |  32 +
 drivers/gpu/drm/i915/selftests/i915_buddy.c   | 789 ------------------
 .../drm/i915/selftests/i915_mock_selftests.h  |   1 -
 .../drm/i915/selftests/intel_memory_region.c  | 133 +--
 drivers/gpu/drm/i915/selftests/mock_region.c  |  51 +-
 drivers/gpu/drm/ttm/ttm_bo.c                  |  13 +
 drivers/gpu/drm/ttm/ttm_range_manager.c       |  55 +-
 include/drm/ttm/ttm_bo_driver.h               |  23 +
 include/drm/ttm/ttm_device.h                  |   9 +
 46 files changed, 1876 insertions(+), 1879 deletions(-)
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
2.30.2

