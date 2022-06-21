Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81447553AF8
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 22:01:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91FC010F5C6;
	Tue, 21 Jun 2022 20:01:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7201710F5C6;
 Tue, 21 Jun 2022 20:01:13 +0000 (UTC)
Received: from hermes-devbox.fritz.box (82-71-8-225.dsl.in-addr.zen.co.uk
 [82.71.8.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbeckett)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id CE89C6601795;
 Tue, 21 Jun 2022 21:01:11 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1655841672;
 bh=rWrjIyH1UrU5AZl0oNIAkNGBizb/FRgfR8mFNXvXnpg=;
 h=From:To:Cc:Subject:Date:From;
 b=HwA+7ra9y1nyEE2SGI7WFDO9jermLEg+2eN7brQeUHUG2IfIoJ8QB9PPzNregm43W
 e/0JW7PvMfr+7jYNXI6b6RVSAWU49Q9R/HnzWXWRq0QwhZTL7IvHg5I0xa1EceKmiR
 OCGyZ7R1//ied3sCvpX3aPp/vexWyrRV1KB2Pz4xF33wh6/Al8rvh/07uWjAKjTU36
 2HAEsG2zKZH/4gaqa8L8rbvxXe50Rk1n5+BFjxZmJhUmAznoBZt/OZGwPhg9rfHnHe
 MG0qiYz7aULJlhTn1aw0nT5e2j9VnXVJ6hD14euMP/LQqzNtXh/b9YJM+zzWbuTQ6I
 NiQxJ4nhpbXwA==
From: Robert Beckett <bob.beckett@collabora.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v8 00/10] drm/i915: ttm for stolen
Date: Tue, 21 Jun 2022 20:00:48 +0000
Message-Id: <20220621200058.3536182-1-bob.beckett@collabora.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Robert Beckett <bob.beckett@collabora.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 kernel@collabora.com, Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series refactors i915's stolen memory region to use ttm.

v2:	handle disabled stolen similar to legacy version.
	relying on ttm to fail allocs works fine, but is dmesg noisy and causes testing
	dmesg warning regressions.

v3:	rebase to latest drm-tip.
	fix v2 code refactor which could leave a buffer pinned.
	locally passes fftl again now.

v4:	- Allow memory regions creators to do allocation. Allows stolen region to track
	  it's own reservations.
	- Pre-reserve first page of stolen mem (add back WaSkipStolenMemoryFirstPage:bdw+)
	- Improve commit descritpion for "drm/i915: sanitize mem_flags for stolen buffers"
	- replace i915_gem_object_pin_pages_unlocked() call with manual locking and pinning.
	  this avoids ww ctx class reuse during context creation -> ring vma obj alloc.

v5:	- detect both types of stolen as stolen buffers in
	  "drm/i915: sanitize mem_flags for stolen buffers"
	- in stolen_object_init limit page size to mem region minimum.
	  The range allocator expects the page_size to define the
	  alignment

v6:	- Share first 4 patches from ttm for internal series as generic
	  i915 ttm fixes
	- Drop patch 4 from v5. We don't need separate object ops just
	  to satisfy test interfaces. The tests have now been fixed via
	  checking whether the memory region is private to decide
	  whether to mmap
	- Add new buffer pin alloc flag to allow creation of buffers in
	  their final ttm placement instead of deferring until
	  get_pages. This fixes legacy fallback paths for buffer
	  allocations during stolen memory pressure.

v7: 	- fix mock_region_get_pages() to correctly handle I915_BO_INVALID_OFFSET

v8:	- Reserve I915_GEM_STOLEN_BIAS area from stolen

Robert Beckett (10):
  drm/i915/ttm: dont trample cache_level overrides during ttm move
  drm/i915: limit ttm to dma32 for i965G[M]
  drm/i915/ttm: only trust snooping for dgfx when deciding default
    cache_level
  drm/i915/gem: selftest should not attempt mmap of private regions
  drm/i915: instantiate ttm ranger manager for stolen memory
  drm/i915: sanitize mem_flags for stolen buffers
  drm/i915: ttm move/clear logic fix
  drm/i915: allow memory region creators to alloc and free the region
  drm/i915/ttm: add buffer pin on alloc flag
  drm/i915: stolen memory use ttm backend

 drivers/gpu/drm/i915/display/intel_fbc.c      |  78 ++--
 drivers/gpu/drm/i915/gem/i915_gem_object.c    |   1 +
 .../gpu/drm/i915/gem/i915_gem_object_types.h  |  16 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c    | 441 +++++++-----------
 drivers/gpu/drm/i915/gem/i915_gem_stolen.h    |  21 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c       |  29 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.h       |   7 +
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c  |  47 +-
 .../drm/i915/gem/selftests/i915_gem_mman.c    |   3 +
 drivers/gpu/drm/i915/gt/intel_rc6.c           |   4 +-
 drivers/gpu/drm/i915/gt/selftest_reset.c      |  16 +-
 drivers/gpu/drm/i915/i915_debugfs.c           |   7 +-
 drivers/gpu/drm/i915/i915_drv.h               |   5 -
 drivers/gpu/drm/i915/intel_memory_region.c    |  16 +-
 drivers/gpu/drm/i915/intel_memory_region.h    |   2 +
 drivers/gpu/drm/i915/intel_region_ttm.c       |  80 +++-
 drivers/gpu/drm/i915/intel_region_ttm.h       |   8 +-
 drivers/gpu/drm/i915/selftests/mock_region.c  |  12 +-
 18 files changed, 424 insertions(+), 369 deletions(-)

-- 
2.25.1

