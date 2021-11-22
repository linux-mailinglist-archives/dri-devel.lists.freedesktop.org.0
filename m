Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFC34596F7
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 22:51:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CBF88991D;
	Mon, 22 Nov 2021 21:51:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 056EC8991D;
 Mon, 22 Nov 2021 21:51:22 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10176"; a="221770810"
X-IronPort-AV: E=Sophos;i="5.87,255,1631602800"; d="scan'208";a="221770810"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2021 13:51:22 -0800
X-IronPort-AV: E=Sophos;i="5.87,255,1631602800"; d="scan'208";a="509137784"
Received: from jbouche-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.33.199])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2021 13:51:18 -0800
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 0/2] More preparation for multi gt patches
Date: Mon, 22 Nov 2021 23:51:12 +0200
Message-Id: <20211122215114.1812-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.33.1
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
Cc: =?UTF-8?q?Michal=C5=82Winiarski?= <michal.winiarski@intel.com>,
 Andi Shyti <andi@etezian.org>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Andi Shyti <andi.shyti@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

the first of the two patches concludes the first stage of
refactoring which makes the use of intel_gt on the different
subsystem. It's taken from Matt's series and it has alread been
reviewed. The patch has just been replaced before any multitile
patches and I think it can be already pushed.

The second patch is on more step to prepare for the coming multi
tile. It's very invasive but it's an effort that can be paid once
and for all in order to have a cleaner way to refer to GTs.

Andi

Changelog:
==========
v2 -> v3: https://patchwork.freedesktop.org/series/97020/
 - sed -i ... took too much freedom and changed more than it was
   supposed to.
 - fix a compile error which did not appear in my local build

v1 -> v2: https://patchwork.freedesktop.org/series/97020/
 - patch 2: do not use anymore the reference i915->gt but use
   to_root_gt(), coming from Matt Roper's patch.
 - fix some comments from Chris.


Andi Shyti (1):
  drm/i915: Use to_root_gt() to refer to the root tile

Michał Winiarski (1):
  drm/i915: Store backpointer to GT in uncore

 .../gpu/drm/i915/display/intel_atomic_plane.c |  4 +-
 drivers/gpu/drm/i915/display/intel_display.c  | 23 +++++---
 drivers/gpu/drm/i915/display/intel_dpt.c      |  2 +-
 drivers/gpu/drm/i915/display/intel_overlay.c  |  2 +-
 .../drm/i915/display/skl_universal_plane.c    |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_context.c   | 22 ++++----
 drivers/gpu/drm/i915/gem/i915_gem_create.c    |  2 +-
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  4 +-
 drivers/gpu/drm/i915/gem/i915_gem_mman.c      |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_phys.c      |  6 +-
 drivers/gpu/drm/i915/gem/i915_gem_pm.c        |  6 +-
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c  |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_throttle.c  |  3 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c  | 12 ++--
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c   |  2 +-
 .../gpu/drm/i915/gem/selftests/huge_pages.c   |  4 +-
 .../i915/gem/selftests/i915_gem_client_blt.c  |  2 +-
 .../drm/i915/gem/selftests/i915_gem_context.c | 10 ++--
 .../drm/i915/gem/selftests/i915_gem_migrate.c |  2 +-
 .../drm/i915/gem/selftests/i915_gem_mman.c    | 28 +++++-----
 drivers/gpu/drm/i915/gt/intel_engine_user.c   |  2 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c          |  2 +-
 drivers/gpu/drm/i915/gt/intel_rps.c           | 12 ++--
 drivers/gpu/drm/i915/gt/intel_workarounds.c   |  3 +-
 drivers/gpu/drm/i915/gt/mock_engine.c         | 10 ++--
 drivers/gpu/drm/i915/gt/selftest_context.c    |  2 +-
 drivers/gpu/drm/i915/gt/selftest_engine.c     |  2 +-
 drivers/gpu/drm/i915/gt/selftest_engine_cs.c  |  4 +-
 .../drm/i915/gt/selftest_engine_heartbeat.c   |  4 +-
 drivers/gpu/drm/i915/gt/selftest_execlists.c  |  6 +-
 drivers/gpu/drm/i915/gt/selftest_gt_pm.c      |  8 +--
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c  |  2 +-
 drivers/gpu/drm/i915/gt/selftest_lrc.c        |  2 +-
 drivers/gpu/drm/i915/gt/selftest_migrate.c    |  4 +-
 drivers/gpu/drm/i915/gt/selftest_mocs.c       |  2 +-
 drivers/gpu/drm/i915/gt/selftest_reset.c      |  2 +-
 .../drm/i915/gt/selftest_ring_submission.c    |  4 +-
 drivers/gpu/drm/i915/gt/selftest_slpc.c       |  6 +-
 drivers/gpu/drm/i915/gt/selftest_timeline.c   |  6 +-
 .../gpu/drm/i915/gt/selftest_workarounds.c    |  4 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c   |  2 +-
 drivers/gpu/drm/i915/gt/uc/selftest_guc.c     |  2 +-
 .../drm/i915/gt/uc/selftest_guc_multi_lrc.c   |  2 +-
 drivers/gpu/drm/i915/gvt/gvt.c                |  2 +-
 drivers/gpu/drm/i915/gvt/scheduler.c          |  2 +-
 drivers/gpu/drm/i915/i915_debugfs.c           | 38 ++++++-------
 drivers/gpu/drm/i915/i915_debugfs_params.c    |  4 +-
 drivers/gpu/drm/i915/i915_driver.c            | 30 +++++-----
 drivers/gpu/drm/i915/i915_drv.h               |  9 ++-
 drivers/gpu/drm/i915/i915_gem.c               | 16 +++---
 drivers/gpu/drm/i915/i915_getparam.c          | 10 ++--
 drivers/gpu/drm/i915/i915_gpu_error.c         |  4 +-
 drivers/gpu/drm/i915/i915_irq.c               | 56 +++++++++----------
 drivers/gpu/drm/i915/i915_perf.c              |  2 +-
 drivers/gpu/drm/i915/i915_pmu.c               | 14 ++---
 drivers/gpu/drm/i915/i915_query.c             |  2 +-
 drivers/gpu/drm/i915/i915_sysfs.c             | 22 ++++----
 drivers/gpu/drm/i915/intel_gvt.c              |  2 +-
 drivers/gpu/drm/i915/intel_uncore.c           |  9 +--
 drivers/gpu/drm/i915/intel_uncore.h           |  3 +-
 drivers/gpu/drm/i915/intel_wopcm.c            |  2 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_tee.c      |  6 +-
 drivers/gpu/drm/i915/selftests/i915_active.c  |  2 +-
 drivers/gpu/drm/i915/selftests/i915_gem.c     |  2 +-
 .../gpu/drm/i915/selftests/i915_gem_evict.c   |  6 +-
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c |  4 +-
 drivers/gpu/drm/i915/selftests/i915_perf.c    |  2 +-
 drivers/gpu/drm/i915/selftests/i915_request.c | 10 ++--
 .../gpu/drm/i915/selftests/i915_selftest.c    |  4 +-
 .../gpu/drm/i915/selftests/igt_flush_test.c   |  2 +-
 .../gpu/drm/i915/selftests/igt_live_test.c    |  4 +-
 .../drm/i915/selftests/intel_memory_region.c  |  4 +-
 drivers/gpu/drm/i915/selftests/intel_uncore.c |  2 +-
 .../gpu/drm/i915/selftests/mock_gem_device.c  | 31 +++++-----
 drivers/gpu/drm/i915/selftests/mock_gtt.c     |  6 +-
 drivers/gpu/drm/i915/selftests/mock_uncore.c  |  2 +-
 76 files changed, 283 insertions(+), 264 deletions(-)

-- 
2.33.1

