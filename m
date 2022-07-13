Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3135737E0
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 15:50:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2D619AC61;
	Wed, 13 Jul 2022 13:50:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C35E59AC66;
 Wed, 13 Jul 2022 13:50:40 +0000 (UTC)
Received: from hermes-devbox.fritz.box (82-71-8-225.dsl.in-addr.zen.co.uk
 [82.71.8.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbeckett)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 6C52A66019B6;
 Wed, 13 Jul 2022 14:50:39 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1657720239;
 bh=EL/cu3J/Ei8Q3eXsLGUIu1iVgiURPcQavL5XaWceFTM=;
 h=From:To:Cc:Subject:Date:From;
 b=SORNP6H5s8sbidX7broL6xuiNPiAiiNNT7m0YnPuC98VIBg192PK2KdQghPKH3RQt
 0zKw/+ppw6FLY1S6lndIzVs9V3oAfM46uCI9LohCrmeRx7MIRaFr4nlGEl7rVsyAcD
 U0aTqkZ6t5/R2w5NFrlddZXaONSuC14vStW5qhyazH/xIl3Q5i4Z51O4uPVkwQfA2C
 yButxcrEbGtijMPegLGg1cQ2kytndHMKQgp/IsvQ2dMsr12zBV9QmGtRia4j/9vfBh
 aKVv1Ju6aXBbTR/r8FenaPDHKMwyrB3mSWa4m3O4DrKGXqvPGaLWeAH/aZYLPz1COi
 eY5v/WcbJK3vg==
From: Robert Beckett <bob.beckett@collabora.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v11 00/10] drm/i915: ttm for stolen
Date: Wed, 13 Jul 2022 14:50:12 +0100
Message-Id: <20220713135022.3710682-1-bob.beckett@collabora.com>
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

v9:	- drop patch 8 "drm/i915: allow memory region creators to alloc and free the region"
	  store bias reservation in drm_i915_private instead.
	- Restrict reset selftest to only test !GuC engines.
	  Resetting individual GuC engines from host is not supported
	- Wait for outstanding requests in reset selftest
	  This prevents previous engine test context cleanup appearing
	  as false positive stolen corruption check

v10:	- Fix wiating on requests early error path during reset selftest
	  If a single request fails to complete, the others would not be
	  put, resulting in leaks. Make sure all requests are put before
	  test exit.

v11:	- rebased to latest drm-tip
	- commit "bcb9aa45d5a0 Revert "drm/i915: Hold reference to intel_context over life of i915_request""
	  broke the selftest@live@reset test, causing the context ringbuffer to
	  be freed during testing. Fixed via maintinaing context ref
	  during testing.
	- drop patch 4 "drm/i915/gem: selftest should not attempt mmap of private regions"
	  it is no longer needed.

Robert Beckett (10):
  drm/i915/ttm: dont trample cache_level overrides during ttm move
  drm/i915: limit ttm to dma32 for i965G[M]
  drm/i915/ttm: only trust snooping for dgfx when deciding default
    cache_level
  drm/i915: instantiate ttm ranger manager for stolen memory
  drm/i915: sanitize mem_flags for stolen buffers
  drm/i915: ttm move/clear logic fix
  drm/i915/ttm: add buffer pin on alloc flag
  drm/i915/selftest: don't attempt engine reset of guc submission
    engines
  drm/i915/selftest: maintain context ref during reset test
  drm/i915: stolen memory use ttm backend

 drivers/gpu/drm/i915/display/intel_fbc.c      |  78 ++--
 drivers/gpu/drm/i915/gem/i915_gem_object.c    |   1 +
 .../gpu/drm/i915/gem/i915_gem_object_types.h  |  16 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c    | 425 ++++++------------
 drivers/gpu/drm/i915/gem/i915_gem_stolen.h    |  21 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c       |  29 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.h       |   7 +
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c  |  47 +-
 drivers/gpu/drm/i915/gt/intel_rc6.c           |   4 +-
 drivers/gpu/drm/i915/gt/selftest_reset.c      |  35 +-
 drivers/gpu/drm/i915/i915_debugfs.c           |   7 +-
 drivers/gpu/drm/i915/i915_drv.h               |   6 +-
 drivers/gpu/drm/i915/intel_region_ttm.c       |  80 +++-
 drivers/gpu/drm/i915/intel_region_ttm.h       |   8 +-
 drivers/gpu/drm/i915/selftests/mock_region.c  |  12 +-
 15 files changed, 400 insertions(+), 376 deletions(-)

-- 
2.25.1

