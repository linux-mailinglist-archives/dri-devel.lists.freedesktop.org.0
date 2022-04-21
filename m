Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0110350A862
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 20:50:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4A2010E972;
	Thu, 21 Apr 2022 18:49:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61D2910E970;
 Thu, 21 Apr 2022 18:49:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: bbeckett) with ESMTPSA id 99D491F45B77
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1650566997;
 bh=RFBMis4iaDWEtc8GsoN93sZhvN+KIDTqcV5ONCczHwU=;
 h=From:To:Cc:Subject:Date:From;
 b=Cs+Mz/NP2jQOZzbpm9LjT8YpUb9HLfpbhQfF9LCS5MK/IhsDzZR+AGnQCRirpKIn9
 u+0ISiLHb8uVGUGfV0/sQMez2TzXzFSTquOEjQAaUDhqdBFAHTziHB5FCCvUjob2lG
 ZGl3HTtTWVlY+YkB6s1ERxh0PMRy4CtPheo7PyPAOX4YhYVZBw4a7ASmZYOsoxqP3H
 EbBUlyI1wkP0/iQRlNWLYQf+SX9GRmMftLyKeheJtCARzwbAmLnCKXir4PG1QNQvoE
 /rHtctVkxdF5+bWjUUX8gDMErShrHf+O5+YNJqwnu/rdHMPKS/HptmoJixw2VDKt96
 zXSZHW47OwLkg==
From: Robert Beckett <bob.beckett@collabora.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 0/6] drm/i915: ttm for stolen region
Date: Thu, 21 Apr 2022 18:49:35 +0000
Message-Id: <20220421184941.428639-1-bob.beckett@collabora.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
 Matthew Auld <matthew.auld@intel.com>
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

Robert Beckett (6):
  drm/i915: instantiate ttm ranger manager for stolen memory
  drm/i915: sanitize mem_flags for stolen buffers
  drm/i915: ttm move/clear logic fix
  drm/i915: ttm backend dont provide mmap_offset for kernel buffers
  drm/i915: allow memory region creators to alloc and free the region
  drm/i915: stolen memory use ttm backend

 drivers/gpu/drm/i915/display/intel_fbc.c      |  78 +--
 .../gpu/drm/i915/gem/i915_gem_object_types.h  |   2 -
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c    | 451 ++++++++----------
 drivers/gpu/drm/i915/gem/i915_gem_stolen.h    |  21 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c       |  32 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.h       |   7 +
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c  |  33 +-
 drivers/gpu/drm/i915/gt/intel_rc6.c           |   4 +-
 drivers/gpu/drm/i915/gt/selftest_reset.c      |  16 +-
 drivers/gpu/drm/i915/i915_debugfs.c           |   7 +-
 drivers/gpu/drm/i915/i915_drv.h               |   5 -
 drivers/gpu/drm/i915/intel_memory_region.c    |  16 +-
 drivers/gpu/drm/i915/intel_memory_region.h    |   2 +
 drivers/gpu/drm/i915/intel_region_ttm.c       |  67 ++-
 drivers/gpu/drm/i915/intel_region_ttm.h       |   8 +-
 drivers/gpu/drm/i915/selftests/mock_region.c  |   3 +-
 16 files changed, 395 insertions(+), 357 deletions(-)

-- 
2.25.1

