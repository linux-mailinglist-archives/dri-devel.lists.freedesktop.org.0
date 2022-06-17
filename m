Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 431CA54FD1D
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 21:05:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6853F10F2D4;
	Fri, 17 Jun 2022 19:05:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE74C10F1F8;
 Fri, 17 Jun 2022 19:05:41 +0000 (UTC)
Received: from hermes-devbox.fritz.box (82-71-8-225.dsl.in-addr.zen.co.uk
 [82.71.8.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbeckett)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 4F62C660179B;
 Fri, 17 Jun 2022 20:05:40 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1655492740;
 bh=cyuCpnpzS7LkGhyVuAqHgXynofuJGq976Y2QpmLBtAE=;
 h=From:To:Cc:Subject:Date:From;
 b=nlicIlL3TwwtQZL9zk/jJ4ll6cuM3VnWVgFo4RM3zr47y7u9BmhKu2OXYO3qAisBW
 LmAPGTaMsPI62daulbDJtVEi/Sa+ID4JNTt5yDBe4K2JhXkU9sqFjSbS/oLldY764H
 uHAHJwC5uJIxkIuJLOMpKHYe1Y/P4PaVQa7PPeOQOh0Esayx/UcEJdu60WgfQV/m/F
 xnf3JwgnW2kQmgJtBMLNloJygBNWd9tsYpBxyj2vlNtubUiP3TB8zWMADOVNYF6KEt
 NoX7O4QylLLpMaMhX89S5sMWQR8avee4HEY2j/YI4EOQnBbeN79mLwiVIGP5LHfiVs
 H7+V+7lqyDazw==
From: Robert Beckett <bob.beckett@collabora.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v6 00/10] drm/i915: ttm for stolen
Date: Fri, 17 Jun 2022 19:05:06 +0000
Message-Id: <20220617190516.2805572-1-bob.beckett@collabora.com>
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
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c    | 440 +++++++-----------
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
 drivers/gpu/drm/i915/selftests/mock_region.c  |   3 +-
 18 files changed, 414 insertions(+), 369 deletions(-)

-- 
2.25.1

