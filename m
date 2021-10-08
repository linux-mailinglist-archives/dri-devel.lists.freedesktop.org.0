Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4A4426BBD
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 15:36:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B87C46F500;
	Fri,  8 Oct 2021 13:35:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 517AD6E069;
 Fri,  8 Oct 2021 13:35:44 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10130"; a="287388438"
X-IronPort-AV: E=Sophos;i="5.85,357,1624345200"; d="scan'208";a="287388438"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2021 06:35:43 -0700
X-IronPort-AV: E=Sophos;i="5.85,357,1624345200"; d="scan'208";a="522983697"
Received: from lenovo-x280.ger.corp.intel.com (HELO thellstr-mobl1.intel.com)
 ([10.249.254.98])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2021 06:35:42 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com, matthew.auld@intel.com,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 0/6] drm/i915: Failsafe migration blits
Date: Fri,  8 Oct 2021 15:35:24 +0200
Message-Id: <20211008133530.664509-1-thomas.hellstrom@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series introduces failsafe migration blits.
The reason for this seemingly strange concept is that if the initial
clearing or readback of LMEM fails for some reason, and we then set up
either GPU- or CPU ptes to the allocated LMEM, we can expose old
contents from other clients.

So after each migration blit we attach a struct dma-fence-work that checks
the error value and if it's an error, perform a memcpy blit, instead.

This comes with some needed infrastructure updates:

Patch 1, updates dma_fence_work to do the work even if there is an error.
The work callback needs to check for error and take action accordingly.
Patch 2, Introduces refcounted sg-tables. The sg-tables are needed async for
the memcpy.
Patch 3, Introduces the failsafe migration blits and selftests.
Patch 4, Adds the possibility to attach the struct dma_fence_work to a timeline.
Patch 5, Attached the migration fence to a timeline since TTM requires that
for upcoming async eviction.
Patch 6 Adds an optimization for coalescing-only struct dma_fence_work.

Worth to consider during review: Patch 4-6 are probably better done in the
context of struct dma_fence_array. Both since we perhaps shouldn't add
irq work to yet another fence data structure and also because the
i915 command submission can individualize struct dma_fence_arrays.

Also the memcpy solution here isn't a final one as it only works if the
aperture covers all of lmem. We probably need to work on a solution where
we intercept move_fence errors and refuse GPU- and CPU mappings.

Thomas Hellström (6):
  drm/i915: Update dma_fence_work
  drm/i915: Introduce refcounted sg-tables
  drm/i915/ttm: Failsafe migration blits
  drm/i915: Add a struct dma_fence_work timeline
  drm/i915/ttm: Attach the migration fence to a region timeline on
    eviction
  drm/i915: Use irq work for coalescing-only dma-fence-work

 drivers/gpu/drm/i915/gem/i915_gem_clflush.c   |   5 +
 .../gpu/drm/i915/gem/i915_gem_object_types.h  |   3 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c       | 467 ++++++++++++++----
 drivers/gpu/drm/i915/gem/i915_gem_ttm.h       |   4 +
 .../drm/i915/gem/selftests/i915_gem_migrate.c |  24 +-
 drivers/gpu/drm/i915/i915_scatterlist.c       |  62 ++-
 drivers/gpu/drm/i915/i915_scatterlist.h       |  76 ++-
 drivers/gpu/drm/i915/i915_sw_fence_work.c     | 145 +++++-
 drivers/gpu/drm/i915/i915_sw_fence_work.h     |  61 +++
 drivers/gpu/drm/i915/i915_vma.c               |  12 +-
 drivers/gpu/drm/i915/intel_memory_region.c    |  43 ++
 drivers/gpu/drm/i915/intel_memory_region.h    |   7 +
 drivers/gpu/drm/i915/intel_region_ttm.c       |  15 +-
 drivers/gpu/drm/i915/intel_region_ttm.h       |   5 +-
 drivers/gpu/drm/i915/selftests/mock_region.c  |  12 +-
 15 files changed, 776 insertions(+), 165 deletions(-)

-- 
2.31.1

