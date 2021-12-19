Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7305247A247
	for <lists+dri-devel@lfdr.de>; Sun, 19 Dec 2021 22:25:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24BEE11AC0F;
	Sun, 19 Dec 2021 21:25:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D6CB11AC0C;
 Sun, 19 Dec 2021 21:25:23 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10203"; a="220734736"
X-IronPort-AV: E=Sophos;i="5.88,219,1635231600"; d="scan'208";a="220734736"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 13:25:22 -0800
X-IronPort-AV: E=Sophos;i="5.88,219,1635231600"; d="scan'208";a="520549204"
Received: from stuohenm-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.36.4])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 13:25:18 -0800
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v9 0/6] More preparation for multi gt patches
Date: Sun, 19 Dec 2021 23:24:54 +0200
Message-Id: <20211219212500.61432-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>,
 Andi Shyti <andi@etezian.org>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

thanks Matt for merging the first 10 patches from v8. This series
contains only the last 6 patches from the previous that make use
of the newly inserted to_gt() to reach the ggtt that at the end
moves from the i915 structure to the gt.

I have reshuffled a bit the order of the patche (refer to the
changelog) so that from this series only patch 2 remains
unreviewed.

Thanks Matt and Sujaritha for the reviews.

Andi

Changelog:
==========
Patchwork: https://patchwork.freedesktop.org/series/97020/

v8 -> v9:
 - The patch is down to the last 6 patches.
 - Reshuffled a bit the order, it's more intuitive to apply the
   changes starting from i915/gt/, i915/, i915/gem, i915/display,
   i915/selftests
 - Addressed Matt's comments in v8.
 - Added Matt and Sujaritha's r-b tags

v7 -> v8:
 - Removed patch 11 from v7 that was allocating statically the
   ggtt in the gt structure instead of a dynamic allocation. As
   Matt pointed out, we can have GT's sharing the same GGTT.
 - The whole i915->ggtt to gt->ggtt patch is split in 5 patches
   instead of one single to make it easier to review.
 - The last patch removes i915->ggtt and allocates the gt->ggtt
   with drmm_kzalloc in the early probe and mock device.

v6 -> v7:
 - Patch 1: add a note about the double presence of
   __intel_gt_init_early() and intel_gt_init_early().
 - Added all Matt's r-b's for patches 2-10.
 - Added a patch 12 that moves the i915->ggtt into gt->ggtt.

v5 -> v6:
 - fixed the assignement of i915->gt->ggtt = ggtt in the mock gem
   device that was making use of it before.

v4 -> v5:
 - use to_gt() instead of to_root_gt() and use Michał work done
   previously.
 - split the /i915->gt/to_gt()/ patch in smaller chunks in order
   to make review easier. (Thanks Lucas)

v3 -> v4:
 - the intel_gt_init_early() has been split as it was causing
   some headaches for the order of the early initialization. The
   split has been done keeping in mind the coming next patch in
   the series that wil make this a static function.

v2 -> v3:
 - sed -i ... took too much freedom and changed more than it was
   supposed to.
 - fix a compile error which did not appear in my local build

v1 -> v2:
 - patch 2: do not use anymore the reference i915->gt but use
   to_root_gt(), coming from Matt Roper's patch.
 - fix some comments from Chris.

Andi Shyti (4):
  drm/i915/selftests: Use to_gt() helper
  drm/i915/pxp: Use to_gt() helper
  drm/i915: Rename i915->gt to i915->gt0
  drm/i915: Move the GGTT from i915 private data to the GT

Andi Shyti (1):
  drm/i915: Remove unused i915->ggtt

Michał Winiarski (5):
  drm/i915/gt: Use to_gt() helper for GGTT accesses
  drm/i915: Use to_gt() helper for GGTT accesses
  drm/i915/gem: Use to_gt() helper for GGTT accesses
  drm/i915/display: Use to_gt() helper for GGTT accesses
  drm/i915/selftests: Use to_gt() helper for GGTT accesses

 drivers/gpu/drm/i915/display/intel_fbc.c      |  2 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c    |  2 +-
 .../drm/i915/display/intel_plane_initial.c    |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_context.h   |  2 +-
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_mman.c      | 19 +++++++-------
 drivers/gpu/drm/i915/gem/i915_gem_pm.c        |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c  |  6 ++---
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c    |  8 +++---
 drivers/gpu/drm/i915/gem/i915_gem_tiling.c    | 15 ++++++-----
 .../i915/gem/selftests/i915_gem_client_blt.c  |  2 +-
 .../drm/i915/gem/selftests/i915_gem_context.c |  2 +-
 .../drm/i915/gem/selftests/i915_gem_mman.c    | 19 +++++++-------
 .../drm/i915/gem/selftests/i915_gem_object.c  |  2 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c          | 14 +++++-----
 drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c  |  6 ++---
 drivers/gpu/drm/i915/gt/intel_gt.c            |  7 +++--
 drivers/gpu/drm/i915/gt/intel_gt.h            |  2 +-
 drivers/gpu/drm/i915/gt/intel_region_lmem.c   |  4 +--
 drivers/gpu/drm/i915/gt/selftest_reset.c      |  2 +-
 drivers/gpu/drm/i915/gvt/dmabuf.c             |  2 +-
 drivers/gpu/drm/i915/i915_debugfs.c           |  4 +--
 drivers/gpu/drm/i915/i915_driver.c            | 10 ++++---
 drivers/gpu/drm/i915/i915_drv.h               |  4 +--
 drivers/gpu/drm/i915/i915_gem.c               | 23 ++++++++--------
 drivers/gpu/drm/i915/i915_gem_gtt.c           |  6 ++---
 drivers/gpu/drm/i915/i915_getparam.c          |  2 +-
 drivers/gpu/drm/i915/i915_perf.c              |  4 +--
 drivers/gpu/drm/i915/selftests/i915_gem.c     |  8 +++---
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c | 26 ++++++++++---------
 drivers/gpu/drm/i915/selftests/i915_request.c |  2 +-
 drivers/gpu/drm/i915/selftests/i915_vma.c     | 22 +++++++++-------
 .../gpu/drm/i915/selftests/mock_gem_device.c  | 11 +++++---
 drivers/gpu/drm/i915/selftests/mock_gtt.c     |  9 +++----
 drivers/gpu/drm/i915/selftests/mock_gtt.h     |  3 ++-
 35 files changed, 137 insertions(+), 119 deletions(-)

-- 
2.34.1

