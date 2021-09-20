Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB2E4118B6
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 17:59:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 072A46E53E;
	Mon, 20 Sep 2021 15:59:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0934C6E53E;
 Mon, 20 Sep 2021 15:59:26 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10113"; a="203318371"
X-IronPort-AV: E=Sophos;i="5.85,308,1624345200"; d="scan'208";a="203318371"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 08:59:24 -0700
X-IronPort-AV: E=Sophos;i="5.85,308,1624345200"; d="scan'208";a="701106618"
Received: from kjeldbeg-mobl2.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.165])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 08:59:22 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com, matthew.auld@intel.com,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v4 0/6] drm/i915: Suspend / resume backup- and restore of LMEM.
Date: Mon, 20 Sep 2021 17:59:08 +0200
Message-Id: <20210920155914.707984-1-thomas.hellstrom@linux.intel.com>
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

Implement backup and restore of LMEM during suspend / resume.
What complicates things a bit is handling of pinned LMEM memory during
suspend and the fact that we might be dealing with unmappable LMEM in
the future, which makes us want to restrict the number of pinned objects that
need memcpy resume.

The first two patches are prereq patches implementing object content copy
and a generic means of iterating through all objects in a region.
The third patch adds the backup / recover / restore functions and the
two last patches deal with restricting the number of objects we need to
use memcpy for.

v2:
- Some polishing of patch 4/6, see patch commit message for details (Chris
  Wilson)
- Rework of patch 3/6.

v3:
- Comment changes in patch 2/6 (Matthew Auld)
- A number of changes to patch 3/6, see commit message.
- Slightly reword comment in patch 5/6. (Matthew Auld).

v4:
- Various cleanups, among other things reworking the ttm / lmem backup-
  and resume interfaces somewhat.

Thomas Hellström (6):
  drm/i915/ttm: Implement a function to copy the contents of two
    TTM-based objects
  drm/i915/gem: Implement a function to process all gem objects of a
    region
  drm/i915 Implement LMEM backup and restore for suspend / resume
  drm/i915/gt: Register the migrate contexts with their engines
  drm/i915: Don't back up pinned LMEM context images and rings during
    suspend
  drm/i915: Reduce the number of objects subject to memcpy recover

 drivers/gpu/drm/i915/Makefile                 |   1 +
 drivers/gpu/drm/i915/gem/i915_gem_context.c   |   4 +-
 .../gpu/drm/i915/gem/i915_gem_object_types.h  |  21 +-
 drivers/gpu/drm/i915/gem/i915_gem_pm.c        |  91 ++++++++
 drivers/gpu/drm/i915/gem/i915_gem_pm.h        |   1 +
 drivers/gpu/drm/i915/gem/i915_gem_region.c    |  70 ++++++
 drivers/gpu/drm/i915/gem/i915_gem_region.h    |  37 ++++
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c       |  99 +++++++--
 drivers/gpu/drm/i915/gem/i915_gem_ttm.h       |  14 ++
 drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c    | 206 ++++++++++++++++++
 drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.h    |  26 +++
 .../gpu/drm/i915/gem/selftests/huge_pages.c   |   2 +-
 drivers/gpu/drm/i915/gt/gen6_ppgtt.c          |   2 +-
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c          |   5 +-
 drivers/gpu/drm/i915/gt/gen8_ppgtt.h          |   4 +-
 drivers/gpu/drm/i915/gt/intel_context_types.h |   8 +
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |   4 +
 drivers/gpu/drm/i915/gt/intel_engine_pm.c     |  23 ++
 drivers/gpu/drm/i915/gt/intel_engine_pm.h     |   2 +
 drivers/gpu/drm/i915/gt/intel_engine_types.h  |   7 +
 .../drm/i915/gt/intel_execlists_submission.c  |   2 +
 drivers/gpu/drm/i915/gt/intel_ggtt.c          |   3 +-
 drivers/gpu/drm/i915/gt/intel_gt.c            |   2 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm.c         |   4 +-
 drivers/gpu/drm/i915/gt/intel_gtt.c           |   3 +-
 drivers/gpu/drm/i915/gt/intel_gtt.h           |   9 +-
 drivers/gpu/drm/i915/gt/intel_lrc.c           |   3 +-
 drivers/gpu/drm/i915/gt/intel_migrate.c       |   2 +-
 drivers/gpu/drm/i915/gt/intel_ppgtt.c         |  13 +-
 drivers/gpu/drm/i915/gt/intel_ring.c          |   3 +-
 .../gpu/drm/i915/gt/intel_ring_submission.c   |   3 +
 drivers/gpu/drm/i915/gt/mock_engine.c         |   2 +
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c  |   2 +-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  12 +-
 drivers/gpu/drm/i915/gvt/scheduler.c          |   2 +-
 drivers/gpu/drm/i915/i915_drv.c               |   4 +-
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c |   4 +-
 37 files changed, 644 insertions(+), 56 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
 create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.h

-- 
2.31.1

