Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 960C03B13EF
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 08:28:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2564089AEA;
	Wed, 23 Jun 2021 06:28:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FA8A89A62;
 Wed, 23 Jun 2021 06:28:43 +0000 (UTC)
IronPort-SDR: I9f7pmS2fOhLVIovNMkZbf7cJTTqFD8I3jevukwUrJ85RSsIKh/Ng93XxbtIrhRelQD4TNncGn
 +XfH56AO0ZhQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10023"; a="268342177"
X-IronPort-AV: E=Sophos;i="5.83,293,1616482800"; d="scan'208";a="268342177"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2021 23:28:42 -0700
IronPort-SDR: e+qNcmw4KdhOItgDcU+EY11XysQAxQsbthmVLfP1dg2S6WPoCq+eNbp5E3/Ne4ZcSqdCYTWZDu
 HqKuUbcgxBgA==
X-IronPort-AV: E=Sophos;i="5.83,293,1616482800"; d="scan'208";a="639346847"
Received: from ibanaga-mobl.ger.corp.intel.com (HELO thellst-mobl1.intel.com)
 ([10.249.254.100])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2021 23:28:40 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v8 0/3] drm/i915: Move system memory to TTM for discrete
Date: Wed, 23 Jun 2021 08:28:22 +0200
Message-Id: <20210623062825.417187-1-thomas.hellstrom@linux.intel.com>
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

v8:
- Reinstate alignment at ttm_bo_init_reserved() time. (Reported by
  Matthew Auld).
- When changing regions, also move the object to the new region list
  and break early. (Reported by Matthew Auld).
- Don't flag the object as contiguous based on the current region min
  pages size.

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
 drivers/gpu/drm/i915/gem/i915_gem_region.c    |   4 -
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c     |  10 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c       | 196 ++++++++++++++----
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c   |   4 +-
 .../drm/i915/gem/selftests/huge_gem_object.c  |   4 +-
 .../gpu/drm/i915/gem/selftests/huge_pages.c   |   5 +-
 .../drm/i915/gem/selftests/i915_gem_mman.c    |   4 +-
 .../drm/i915/gem/selftests/i915_gem_phys.c    |   3 +-
 drivers/gpu/drm/i915/i915_drv.h               |   3 -
 drivers/gpu/drm/i915/i915_gpu_error.c         |   2 +-
 drivers/gpu/drm/i915/intel_memory_region.c    |   7 +-
 drivers/gpu/drm/i915/intel_memory_region.h    |   8 +
 21 files changed, 267 insertions(+), 99 deletions(-)

-- 
2.31.1

