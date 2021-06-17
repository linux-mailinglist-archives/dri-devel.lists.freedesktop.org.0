Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA43D3AAC43
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 08:30:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6B896E87E;
	Thu, 17 Jun 2021 06:30:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD1CC6E08E;
 Thu, 17 Jun 2021 06:30:32 +0000 (UTC)
IronPort-SDR: xWmVcCXmTkXYZXaNYe+OQcMG1D66H8254JydAVOobxaap+ePBweqB7kQL7pCJeOQZv2rvhvhOy
 eVcGTWzIlJ+w==
X-IronPort-AV: E=McAfee;i="6200,9189,10017"; a="203287810"
X-IronPort-AV: E=Sophos;i="5.83,278,1616482800"; d="scan'208";a="203287810"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2021 23:30:32 -0700
IronPort-SDR: fzLpPSpQzsg92gDULo8Uc8Gh/HBvS1F16uGn52GQbHXvyhhwxDbHDKGjzFsCWp1Z7kGpFJkHGU
 sSpqIxDx1SOg==
X-IronPort-AV: E=Sophos;i="5.83,278,1616482800"; d="scan'208";a="554302632"
Received: from vanderss-mobl.ger.corp.intel.com (HELO thellst-mobl1.intel.com)
 ([10.249.254.193])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2021 23:30:28 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v5 00/12] i915 TTM sync accelerated migration and clear
Date: Thu, 17 Jun 2021 08:30:06 +0200
Message-Id: <20210617063018.92802-1-thomas.hellstrom@linux.intel.com>
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

This patchset implements synchronous accelerated migration and clearing
for i915 on TTM. We plan to follow up with these operations made
asynchronous to the extent of TTM support for that:

A couple of patches from Chris which implement pipelined migration and
clears by atomically writing the PTEs in place before performing the
actual blit.

Some ww utilities mainly for the accompanying selftests added by Thomas,
as well as modified the above patches for ww locking- and lmem support.

Hooked up to our TTM backend by Ramalingam

Finally, on request from Daniel, we ditch old blit code which is now obsolete.

v2:
- A couple of minor style fixes pointed out by Matthew Auld
- Export and use intel_engine_destroy_pinned_context() to address a
  CI warning / failure.
v3:
- Acceleration hooked up to TTM
- Minor fixes to review comments (Pointed out by Matthew Auld)
- Fix pipelined blit handling of engine instances (Pointed out by Matthew Auld)
- Ditch old blit code, (Pointed out by Daniel)
v4:
- Rescue a selftest that was removed with the old blit code
  (Pointed out by Matthew Auld)
- Extended gpu waits in the TTM accel move function
  (Pointed out by Thomas Hellström)
v5:
- Minor rebase on buddy series.
- Added R-Bs for the last patches.

Chris Wilson (6):
  drm/i915/gt: Add an insert_entry for gen8_ppgtt
  drm/i915/gt: Add a routine to iterate over the pagetables of a GTT
  drm/i915/gt: Export the pinned context constructor and destructor
  drm/i915/gt: Pipelined page migration
  drm/i915/gt: Pipelined clear
  drm/i915/gt: Setup a default migration context on the GT

Ramalingam C (1):
  drm/i915/ttm: accelerated move implementation

Thomas Hellström (5):
  drm/i915: Reference objects on the ww object list
  drm/i915: Break out dma_resv ww locking utilities to separate files
  drm/i915: Introduce a ww transaction helper
  drm/i915/gem: Zap the client blt code
  drm/i915/gem: Zap the i915_gem_object_blt code

 drivers/gpu/drm/i915/Makefile                 |   5 +-
 .../gpu/drm/i915/gem/i915_gem_client_blt.c    | 355 ---------
 .../gpu/drm/i915/gem/i915_gem_client_blt.h    |  21 -
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |   9 +-
 .../gpu/drm/i915/gem/i915_gem_object_blt.c    | 461 ------------
 .../gpu/drm/i915/gem/i915_gem_object_blt.h    |  39 -
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c       |  88 ++-
 .../i915/gem/selftests/i915_gem_client_blt.c  | 114 +--
 .../i915/gem/selftests/i915_gem_object_blt.c  | 597 ---------------
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c          |  68 ++
 drivers/gpu/drm/i915/gt/intel_engine.h        |  12 +
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  27 +-
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h  |   2 +
 drivers/gpu/drm/i915/gt/intel_gt.c            |   4 +
 drivers/gpu/drm/i915/gt/intel_gt_types.h      |   3 +
 drivers/gpu/drm/i915/gt/intel_gtt.h           |   7 +
 drivers/gpu/drm/i915/gt/intel_migrate.c       | 687 ++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_migrate.h       |  65 ++
 drivers/gpu/drm/i915/gt/intel_migrate_types.h |  15 +
 drivers/gpu/drm/i915/gt/intel_renderstate.h   |   1 +
 drivers/gpu/drm/i915/gt/intel_ring.h          |   1 +
 drivers/gpu/drm/i915/gt/selftest_migrate.c    | 669 +++++++++++++++++
 drivers/gpu/drm/i915/i915_gem.c               |  52 --
 drivers/gpu/drm/i915/i915_gem.h               |  12 -
 drivers/gpu/drm/i915/i915_gem_ww.c            |  63 ++
 drivers/gpu/drm/i915/i915_gem_ww.h            |  50 ++
 .../drm/i915/selftests/i915_live_selftests.h  |   2 +-
 .../drm/i915/selftests/i915_perf_selftests.h  |   2 +-
 .../drm/i915/selftests/intel_memory_region.c  |  21 +-
 29 files changed, 1766 insertions(+), 1686 deletions(-)
 delete mode 100644 drivers/gpu/drm/i915/gem/i915_gem_client_blt.c
 delete mode 100644 drivers/gpu/drm/i915/gem/i915_gem_client_blt.h
 delete mode 100644 drivers/gpu/drm/i915/gem/i915_gem_object_blt.c
 delete mode 100644 drivers/gpu/drm/i915/gem/i915_gem_object_blt.h
 delete mode 100644 drivers/gpu/drm/i915/gem/selftests/i915_gem_object_blt.c
 create mode 100644 drivers/gpu/drm/i915/gt/intel_migrate.c
 create mode 100644 drivers/gpu/drm/i915/gt/intel_migrate.h
 create mode 100644 drivers/gpu/drm/i915/gt/intel_migrate_types.h
 create mode 100644 drivers/gpu/drm/i915/gt/selftest_migrate.c
 create mode 100644 drivers/gpu/drm/i915/i915_gem_ww.c
 create mode 100644 drivers/gpu/drm/i915/i915_gem_ww.h

-- 
2.31.1

