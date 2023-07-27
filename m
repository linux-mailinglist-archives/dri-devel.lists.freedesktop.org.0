Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CD8765677
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 16:55:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5016A10E08C;
	Thu, 27 Jul 2023 14:55:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B546010E08C;
 Thu, 27 Jul 2023 14:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690469717; x=1722005717;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lM3FFqlEqekOZi6J4Vm9vD7E/ud2DElHOgeWKeYGC8s=;
 b=VgJKLDb/D74BGT2ZScl+PGD0m0vFUamld5Zr5KWqoAjqW56UVJWgpp9O
 2zoinLtCQ0SwvWGxXpozIkhiUmcfGJKEulM+0KANq7uRojNKfRAku77u3
 F9oVj39K+j6sK520mWxVB2kasmwW+ft/j5NYrXe4OIhp5O0RQ8l0T7NFa
 Fxvrl1EJjKJI9lkEKRN8+KIRY+ItyVakzau7wrVhL3RTmFusq7IyZLT8i
 mK71MNnbHghUNEKRZYs5LK9mPoSku0Ga2cvBSl8TQGppZu8tSy4oJ58M7
 PAEvyUrR0nqkVERbvotHn32U7bXdCx0kaGjTEuUA7w3PtMVTxz4+FayRD A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="399268365"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; d="scan'208";a="399268365"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 07:55:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="870433704"
Received: from jlenehan-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.228.208])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 07:55:16 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 0/8] Another take on PAT/object cache mode refactoring
Date: Thu, 27 Jul 2023 15:54:56 +0100
Message-Id: <20230727145504.1919316-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.39.2
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
Cc: Matt Roper <matthew.d.roper@intel.com>, Fei Yang <fei.yang@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Good news is that I realized series can be split after all. Bad news is that it
is still a lot to go through.

  drm/i915: Skip clflush after GPU writes on Meteorlake

This is based on what Fei found out from hardware architects. If we agree the
the function this helper should achieve follow up is checking if other snoopable
platforms are the same.

  drm/i915: Split PTE encode between Gen12 and Meteorlake

Not that much related but I feel we don't need to run impossible code on
platforms before Meteorlake. Shouldn't be controversial.

  drm/i915: Cache PAT index used by the driver

This one shouldn't be controversial either. Just eliminates a pile of calls to
i915_gem_get_pat_index().

  drm/i915: Refactor PAT/object cache handling

This is most code and the "table reversal" logic which makes i915 understands
caching modes behind PAT indices.

Review for taste and general "does it make sense" is needed here. Oh and extra
care about boolean logic conversion as I was pulling out obj->user_pat_set from
inside i915_gem_object_has_cache_level to the call sites.

All magic "if user PAT is set assume the worst" are still left in with this
patch.

  drm/i915: Improve the vm_fault_gtt user PAT index restriction
  drm/i915: Lift the user PAT restriction from gpu_write_needs_clflush
  drm/i915: Lift the user PAT restriction from use_cpu_reloc
  drm/i915: Refine the caching check in i915_gem_object_can_bypass_llc

This bunch is what removes the "user PAT set special casing".

Each of them probably have different reasons why the original cache level check
was in them so as many extra pair of eyes as possible are needed to verify both
that I have correctly understood what the underlying reasons why each were
there, and that I haven't fumbled the logic on the rudimentary level. Or perhaps
that it is possible to simplify this further. By maybe using more of
I915_BO_CACHE_COHERENT_FOR_... flags, or something.

Overall, a lot of scrutiny is needed for most of the series since it is
complicated and I am juggling multiple things.

Cc: Fei Yang <fei.yang@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>

Tvrtko Ursulin (8):
  drm/i915: Skip clflush after GPU writes on Meteorlake
  drm/i915: Split PTE encode between Gen12 and Meteorlake
  drm/i915: Cache PAT index used by the driver
  drm/i915: Refactor PAT/object cache handling
  drm/i915: Improve the vm_fault_gtt user PAT index restriction
  drm/i915: Lift the user PAT restriction from gpu_write_needs_clflush
  drm/i915: Lift the user PAT restriction from use_cpu_reloc
  drm/i915: Refine the caching check in i915_gem_object_can_bypass_llc

 drivers/gpu/drm/i915/Makefile                 |   1 +
 drivers/gpu/drm/i915/gem/i915_gem_domain.c    |  67 ++++++---
 drivers/gpu/drm/i915/gem/i915_gem_domain.h    |   5 +-
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  11 +-
 drivers/gpu/drm/i915/gem/i915_gem_internal.c  |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_mman.c      |  12 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c    | 135 ++++++++++--------
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |  11 +-
 .../gpu/drm/i915/gem/i915_gem_object_types.h  | 116 +--------------
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c     |   8 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c    |   9 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c  |  46 +++---
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c   |   2 +-
 .../drm/i915/gem/selftests/huge_gem_object.c  |   2 +-
 .../gpu/drm/i915/gem/selftests/huge_pages.c   |   5 +-
 drivers/gpu/drm/i915/gt/gen6_ppgtt.c          |   4 +-
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c          |  40 ++++--
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |   2 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c          |  33 ++---
 drivers/gpu/drm/i915/gt/intel_ggtt_gmch.c     |   4 +-
 drivers/gpu/drm/i915/gt/intel_gtt.c           |   2 +-
 drivers/gpu/drm/i915/gt/intel_gtt.h           |   3 +-
 drivers/gpu/drm/i915/gt/intel_migrate.c       |  11 +-
 drivers/gpu/drm/i915/gt/intel_ppgtt.c         |   6 +-
 .../gpu/drm/i915/gt/intel_ring_submission.c   |   4 +-
 drivers/gpu/drm/i915/gt/intel_timeline.c      |   2 +-
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c  |   2 +-
 drivers/gpu/drm/i915/gt/selftest_migrate.c    |   9 +-
 drivers/gpu/drm/i915/gt/selftest_reset.c      |  14 +-
 drivers/gpu/drm/i915/gt/selftest_tlb.c        |   5 +-
 .../gpu/drm/i915/gt/selftest_workarounds.c    |   2 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      |   8 +-
 drivers/gpu/drm/i915/i915_cache.c             |  93 ++++++++++++
 drivers/gpu/drm/i915/i915_cache.h             |  81 +++++++++++
 drivers/gpu/drm/i915/i915_debugfs.c           |  53 +------
 drivers/gpu/drm/i915/i915_driver.c            |   5 +
 drivers/gpu/drm/i915/i915_drv.h               |   2 +
 drivers/gpu/drm/i915/i915_gem.c               |  21 +--
 drivers/gpu/drm/i915/i915_gpu_error.c         |   8 +-
 drivers/gpu/drm/i915/i915_pci.c               |  84 ++++++-----
 drivers/gpu/drm/i915/i915_perf.c              |   2 +-
 drivers/gpu/drm/i915/intel_device_info.h      |   6 +-
 drivers/gpu/drm/i915/selftests/i915_gem.c     |   5 +-
 .../gpu/drm/i915/selftests/i915_gem_evict.c   |   8 +-
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c |  11 +-
 drivers/gpu/drm/i915/selftests/igt_spinner.c  |   2 +-
 .../drm/i915/selftests/intel_memory_region.c  |   4 +-
 .../gpu/drm/i915/selftests/mock_gem_device.c  |  14 +-
 48 files changed, 513 insertions(+), 469 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/i915_cache.c
 create mode 100644 drivers/gpu/drm/i915/i915_cache.h

-- 
2.39.2

