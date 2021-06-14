Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B849D3A5F77
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jun 2021 11:53:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80A3789C55;
	Mon, 14 Jun 2021 09:53:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D902389C55;
 Mon, 14 Jun 2021 09:53:04 +0000 (UTC)
IronPort-SDR: IS+TiL3hjBjBLFCg2wWkqee9a2Ti5llkcSpWZ5vA6kU5UXsxzM1eDchLV7PLtQk911EMk0ANVc
 HSVfgsMIaDlw==
X-IronPort-AV: E=McAfee;i="6200,9189,10014"; a="269634161"
X-IronPort-AV: E=Sophos;i="5.83,273,1616482800"; d="scan'208";a="269634161"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2021 02:53:03 -0700
IronPort-SDR: cMTcrJ7PhDQoqL9s69yTagqVe+S21RTeS2N/D1v9BlM6vzrYd+TcvgjpEImt2BjNGWYllolgC0
 TgCH7gC8go8A==
X-IronPort-AV: E=Sophos;i="5.83,273,1616482800"; d="scan'208";a="449838968"
Received: from janlundk-mobl1.ger.corp.intel.com (HELO
 thellst-mobl1.intel.com) ([10.249.254.32])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2021 02:53:02 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 0/4] drm/i915: Move system memory to TTM for discrete
Date: Mon, 14 Jun 2021 11:52:26 +0200
Message-Id: <20210614095230.126284-1-thomas.hellstrom@linux.intel.com>
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

Patch 2 and 3 deals with updating the i915 gem bookkeeping after a TTM move,
Patch 4 moves system over from shmem to TTM for discrete

Note that the mock device doesn't consider itself discrete so the TTM
system path is not checked by the mock selftests.

v2:
- Style fixes (reported by Matthew Auld)
- Drop the last patch (migration) It needs selftests and some additional work.
- Unconditionally add VM_IO at mmap time.

v3:
- More style fixes (reported by Matthew Auld)
- Don't overfill the busy placement vector (reported by Mattew Auld)

Thomas Hellström (4):
  drm/i915: Update object placement flags to be mutable
  drm/i915/ttm: Adjust gem flags and caching settings after a move
  drm/i915/ttm: Calculate the object placement at get_pages time
  drm/i915/ttm: Use TTM for system memory

 drivers/gpu/drm/i915/gem/i915_gem_internal.c  |   4 +-
 drivers/gpu/drm/i915/gem/i915_gem_mman.c      |  12 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c    |  38 +++
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |  14 +-
 .../gpu/drm/i915/gem/i915_gem_object_types.h  |  20 +-
 drivers/gpu/drm/i915/gem/i915_gem_pages.c     |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_phys.c      |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c     |  10 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c       | 225 ++++++++++++++----
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c   |   4 +-
 .../drm/i915/gem/selftests/huge_gem_object.c  |   4 +-
 .../gpu/drm/i915/gem/selftests/huge_pages.c   |   5 +-
 .../drm/i915/gem/selftests/i915_gem_mman.c    |   4 +-
 .../drm/i915/gem/selftests/i915_gem_phys.c    |   3 +-
 drivers/gpu/drm/i915/i915_drv.h               |   3 -
 drivers/gpu/drm/i915/intel_memory_region.c    |   7 +-
 drivers/gpu/drm/i915/intel_memory_region.h    |   8 +
 drivers/gpu/drm/i915/intel_region_ttm.c       |   8 +-
 drivers/gpu/drm/i915/intel_region_ttm.h       |   2 +
 19 files changed, 279 insertions(+), 96 deletions(-)

-- 
2.31.1

