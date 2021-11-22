Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A94B54596E4
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 22:46:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2BA889D63;
	Mon, 22 Nov 2021 21:46:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B4E389B70;
 Mon, 22 Nov 2021 21:46:18 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10176"; a="258731315"
X-IronPort-AV: E=Sophos;i="5.87,255,1631602800"; d="scan'208";a="258731315"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2021 13:46:10 -0800
X-IronPort-AV: E=Sophos;i="5.87,255,1631602800"; d="scan'208";a="509136627"
Received: from asparren-mobl2.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.238])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2021 13:46:08 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v7 0/6] drm/i915/ttm: Async migration
Date: Mon, 22 Nov 2021 22:45:48 +0100
Message-Id: <20211122214554.371864-1-thomas.hellstrom@linux.intel.com>
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
 matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series deals with async migration and async vram management.
It still leaves an important part out, which is async unbinding which
will reduce latency further, at least when trying to migrate already active
objects.

Patch 1/6 deals with accessing and waiting for the TTM moving
fence from i915 GEM.
Patch 2 is pure code reorganization, no functional change.
Patch 3 breaks a refcounting loop involving the TTM moving fence.
Patch 4 makes the i915 TTM shinking code handle async moves.
Patch 5 uses TTM to implement the ttm move() callback async, it also
introduces a utility to collect dependencies and turn them into a
single dma_fence, which is needed for the intel_migrate code.
This also affects the gem object migrate code.
Patch 6 makes the object copy utility async as well, mainly for future
users since the only current user, suspend backup and restore, typically
will want to sync anyway.

v2:
- Fix a couple of SPARSE warnings.
v3:
- Fix a NULL pointer dereference.
v4:
- Squash what was previously patch 1 and 2 to patch1
- Ditch the moving fence waiting in i915_vma_pin_iomap()
- Rework how the refcounting loop is broken in patch 3. Drop region
  reference counting.
- Break what is now patch 4 out of patch 5. Add support for avoiding
  waiting for gpu when shrinking.
- A number of changes in patch 5. See the commit message for details.
v5:
- Some fixes to i915_vma_verify_bind_complete() (Matthew Auld)
- Update patches with R-B.
v6:
- Code comment update
- Re-check for fence signaled before returning -EBUSY (Matthew Auld)
- Use dma_resv_iter_is_exclusive() (Matthew Auld)
- Await all dma-resv fences before a migration blit (Matthew Auld)
v7:
- Fix yet another compilation failure in patch 1.

Maarten Lankhorst (1):
  drm/i915: Add support for moving fence waiting

Thomas Hellström (5):
  drm/i915/ttm: Move the i915_gem_obj_copy_ttm() function
  drm/i915/ttm: Drop region reference counting
  drm/i915/ttm: Correctly handle waiting for gpu when shrinking
  drm/i915/ttm: Implement asynchronous TTM moves
  drm/i915/ttm: Update i915_gem_obj_copy_ttm() to be asynchronous

 drivers/gpu/drm/i915/gem/i915_gem_object.c    |  52 +++
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |   6 +
 .../gpu/drm/i915/gem/i915_gem_object_types.h  |   1 +
 drivers/gpu/drm/i915/gem/i915_gem_pages.c     |   6 +
 drivers/gpu/drm/i915/gem/i915_gem_region.c    |   4 +-
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c     |   3 +-
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c  |   1 +
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c    |   6 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c       |  89 ++--
 drivers/gpu/drm/i915/gem/i915_gem_ttm.h       |   6 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c  | 409 ++++++++++++++++--
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.h  |  10 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c    |   3 +
 drivers/gpu/drm/i915/gem/i915_gem_wait.c      |   4 +-
 .../gpu/drm/i915/gem/selftests/huge_pages.c   |   2 +-
 drivers/gpu/drm/i915/gt/intel_region_lmem.c   |  10 +-
 drivers/gpu/drm/i915/i915_vma.c               |  43 +-
 drivers/gpu/drm/i915/intel_memory_region.c    |  26 +-
 drivers/gpu/drm/i915/intel_memory_region.h    |   9 +-
 drivers/gpu/drm/i915/intel_region_ttm.c       |  35 +-
 drivers/gpu/drm/i915/intel_region_ttm.h       |   2 +-
 .../drm/i915/selftests/intel_memory_region.c  |   8 +-
 drivers/gpu/drm/i915/selftests/mock_region.c  |   7 +-
 23 files changed, 599 insertions(+), 143 deletions(-)

-- 
2.31.1

