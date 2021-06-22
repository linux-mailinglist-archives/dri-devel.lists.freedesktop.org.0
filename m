Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A05173B005F
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 11:34:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 518696E463;
	Tue, 22 Jun 2021 09:34:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 455EC6E463;
 Tue, 22 Jun 2021 09:34:36 +0000 (UTC)
IronPort-SDR: 9DliDrBPyf2bVMpbHYauBh/H7DMiuEJToTuM0Fvm1sJJDt6fFlD3YZU22kJmCTgk/ptTEUDJ4s
 g/d6uzdpTYdw==
X-IronPort-AV: E=McAfee;i="6200,9189,10022"; a="194159543"
X-IronPort-AV: E=Sophos;i="5.83,291,1616482800"; d="scan'208";a="194159543"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2021 02:34:30 -0700
IronPort-SDR: KeqS7mHu9PNmf/r2dmT4j3QomvlEKAHoCGg01W5Igm1rhZ+dkuMzvrWXZ9uhJE6OBJKCu6OHr+
 mDOrsXxRVvFA==
X-IronPort-AV: E=Sophos;i="5.83,291,1616482800"; d="scan'208";a="623409974"
Received: from clanggaa-mobl1.ger.corp.intel.com (HELO
 thellst-mobl1.intel.com) ([10.249.254.95])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2021 02:34:27 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v7 0/3] drm/i915: Move system memory to TTM for discrete
Date: Tue, 22 Jun 2021 11:34:15 +0200
Message-Id: <20210622093418.153400-1-thomas.hellstrom@linux.intel.com>
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

Early implementation of moving system memory for discrete cards over to
TTM. We first add the notion of objects being migratable under the object
lock to i915 gem, and add some asserts to verify that objects are either
locked or pinned when the placement is checked by the gem code.

Patch 2 deals with updating the i915 gem bookkeeping after a TTM move,
Patch 3 moves system over from shmem to TTM for discrete

Note that the mock device doesn't consider itself discrete so the TTM
system path is not checked by the mock selftests.

v2:
- Style fixes (reported by Matthew Auld)
- Drop the last patch (migration) It needs selftests and some additional work.
- Unconditionally add VM_IO at mmap time.

v3:
- More style fixes (reported by Matthew Auld)
- Don't overfill the busy placement vector (reported by Matthew Auld)

v4:
- Remove confusion around shrinkable objects (reported by Matthew Auld)

v5:
- Remove confusion around shrinkable objects again, but this time in the
  correct patch. (reported by Matthew Auld)

v6:
- One patch already committed.
- Introduce a __i915_gem_object_is_lmem() to be used in situations where we
  know that a fence that can't currently signal keeps the object from being
  migrated or evicted.
- Rebase on accelerated TTM moves
- Fix TODO:s for supporting system memory with TTM.
- Update the object GEM region after a TTM move if compatible.
- Move a couple of warnings for shmem on DGFX.

v7:
- Just updated a commit message with version history under dashes.

Thomas Hellström (3):
  drm/i915: Update object placement flags to be mutable
  drm/i915/ttm: Adjust gem flags and caching settings after a move
  drm/i915/ttm: Use TTM for system memory

 drivers/gpu/drm/i915/gem/i915_gem_internal.c  |   4 +-
 drivers/gpu/drm/i915/gem/i915_gem_lmem.c      |  22 ++
 drivers/gpu/drm/i915/gem/i915_gem_lmem.h      |   2 +
 drivers/gpu/drm/i915/gem/i915_gem_mman.c      |  12 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c    |  38 ++++
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |  14 +-
 .../gpu/drm/i915/gem/i915_gem_object_types.h  |  20 +-
 drivers/gpu/drm/i915/gem/i915_gem_pages.c     |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_phys.c      |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c     |  10 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c       | 194 +++++++++++++-----
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c   |   4 +-
 .../drm/i915/gem/selftests/huge_gem_object.c  |   4 +-
 .../gpu/drm/i915/gem/selftests/huge_pages.c   |   5 +-
 .../drm/i915/gem/selftests/i915_gem_mman.c    |   4 +-
 .../drm/i915/gem/selftests/i915_gem_phys.c    |   3 +-
 drivers/gpu/drm/i915/i915_drv.h               |   3 -
 drivers/gpu/drm/i915/i915_gpu_error.c         |   2 +-
 drivers/gpu/drm/i915/intel_memory_region.c    |   7 +-
 drivers/gpu/drm/i915/intel_memory_region.h    |   8 +
 20 files changed, 265 insertions(+), 95 deletions(-)

-- 
2.31.1

