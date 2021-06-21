Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 122C93AF63B
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 21:37:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 238296E3F9;
	Mon, 21 Jun 2021 19:37:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BCFC6E3F9;
 Mon, 21 Jun 2021 19:37:01 +0000 (UTC)
IronPort-SDR: 8SrZfsjAGx0QU+2PtFD7MwJpqrDF+l9sR3hsQyhYDGTQ0fYDXGkeHfTl5iUQAv+I/wjLknlvQ4
 f06OE5RgrmeA==
X-IronPort-AV: E=McAfee;i="6200,9189,10022"; a="292548367"
X-IronPort-AV: E=Sophos;i="5.83,289,1616482800"; d="scan'208";a="292548367"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2021 12:37:00 -0700
IronPort-SDR: YZzy1rBylVz0mvgSMLv6qQDxe6JVwbABPVYQCm+q8uogsE+U629luKJQX0x9VmktjwRmtgc9gJ
 SL8BTq6F7+Gw==
X-IronPort-AV: E=Sophos;i="5.83,289,1616482800"; d="scan'208";a="489989521"
Received: from gperry-mobl.ger.corp.intel.com (HELO thellst-mobl1.intel.com)
 ([10.249.254.94])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2021 12:36:59 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v6 0/3] drm/i915: Move system memory to TTM for discrete
Date: Mon, 21 Jun 2021 21:36:41 +0200
Message-Id: <20210621193644.105627-1-thomas.hellstrom@linux.intel.com>
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

