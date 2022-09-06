Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F235AF886
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 01:50:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AEC710E0C0;
	Tue,  6 Sep 2022 23:49:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CC1E10E086;
 Tue,  6 Sep 2022 23:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662508184; x=1694044184;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KchjCZoB7gEVcOmEh7hN1S7gKl8sQ3ujiI9t3/fIeAQ=;
 b=J7tmeW4Et1m/uqyLYBlK94ADZ3/nIKACiFwTMWAIgODSjz2v1ymfyebS
 3etmEW652qIPK5xnqVCM9rN/ZD24ewSrb6h4RyAEyhdxlHsiXozVPKdM6
 0ItAs4XkhypOTitlILj4CN/14BpDd7F2LXgyzUNBWGgLwoKeC9DajHKnW
 DW9IDDjtXlfFMu5HlH6GVxj41CotcStwv3fCpE3kWuSyO4zDUgBHDma5I
 Fw1nBe+4yP0tpLhuboEfwfgRul0+tpCtzIYxTpro/DvdpMmgvWmDyGv4d
 z+kVVrPMTbs30R/RTiJnHWpFavHLQ4y9j1SIXOBcG+NViNLzS/EpQa68B Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10462"; a="298053125"
X-IronPort-AV: E=Sophos;i="5.93,295,1654585200"; d="scan'208";a="298053125"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2022 16:49:43 -0700
X-IronPort-AV: E=Sophos;i="5.93,295,1654585200"; d="scan'208";a="675920299"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2022 16:49:43 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 00/14] i915: Add "standalone media" support for MTL
Date: Tue,  6 Sep 2022 16:49:20 -0700
Message-Id: <20220906234934.3655440-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.37.2
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
Cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Starting with MTL, media functionality has moved into a new, second GT
at the hardware level.  This new GT, referred to as "standalone media"
in the spec, has its own GuC, power management/forcewake, etc.  The
general non-engine GT registers for standalone media start at 0x380000,
but otherwise use the same MMIO offsets as the primary GT.

Standalone media has a lot of similarity to the remote tiles
present on platforms like xehpsdv and pvc, and our i915 implementation
can share much of the general "multi GT" infrastructure between the two
types of platforms.  However there are a few notable differences
we must deal with:
 - The 0x380000 offset only applies to the non-engine GT registers
   (which the specs refer to as "GSI" registers).  The engine registers
   remain at their usual locations (e.g., 0x1C0000 for VCS0).
 - Unlike platforms with remote tiles, all interrupt handling for
   standalone media still happens via the primary GT.


v2:
 - Added new patches to ensure each GT, not just the primary, is
   handled properly during various init/suspend/resume/teardown flows.
   (Daniele)
 - Simplified GSI offset handling and split it into its own patch.
 - Correct gt->irq_lock assignment for media GT.  (Daniele)
 - Fix jump target for intel_root_gt_init_early() errors.  (Daniele)

v3:
 - Move intel_gt_definition struct to intel_gt_types.h.  (Jani)
 - Drop gtdef->setup() and just switch() on type.  (Jani)
 - Honor GSI offset during AUX table invalidation.  (Aravind)
 - Drop intel_gt_tile_cleanup() through more intelligent use
   of DRM-managed actions.  This also fixes the fault-injection
   failures reported by CI.

Cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>

Matt Roper (12):
  drm/i915: Move locking and unclaimed check into
    mmio_debug_{suspend,resume}
  drm/i915: Only hook up uncore->debug for primary uncore
  drm/i915: Use managed allocations for extra uncore objects
  drm/i915: Drop intel_gt_tile_cleanup()
  drm/i915: Prepare more multi-GT initialization
  drm/i915: Rename and expose common GT early init routine
  drm/i915: Use a DRM-managed action to release the PCI bridge device
  drm/i915: Initialize MMIO access for each GT
  drm/i915: Handle each GT on init/release and suspend/resume
  drm/i915/uncore: Add GSI offset to uncore
  drm/i915/mtl: Add gsi_offset when emitting aux table invalidation
  drm/i915/xelpmp: Expose media as another GT
  drm/i915/mtl: Use primary GT's irq lock for media GT
  drm/i915/mtl: Hook up interrupts for standalone media

 drivers/gpu/drm/i915/Makefile                 |   1 +
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c      |  15 ++-
 drivers/gpu/drm/i915/gt/gen8_engine_cs.h      |   3 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  10 +-
 drivers/gpu/drm/i915/gt/intel_gt.c            | 108 +++++++++++++-----
 drivers/gpu/drm/i915/gt/intel_gt.h            |   4 +-
 drivers/gpu/drm/i915/gt/intel_gt_irq.c        |  35 ++++--
 drivers/gpu/drm/i915/gt/intel_gt_pm_irq.c     |   8 +-
 drivers/gpu/drm/i915/gt/intel_gt_regs.h       |  10 ++
 drivers/gpu/drm/i915/gt/intel_gt_types.h      |  19 ++-
 drivers/gpu/drm/i915/gt/intel_lrc.c           |   9 +-
 drivers/gpu/drm/i915/gt/intel_rps.c           |  26 ++---
 drivers/gpu/drm/i915/gt/intel_sa_media.c      |  47 ++++++++
 drivers/gpu/drm/i915/gt/intel_sa_media.h      |  15 +++
 drivers/gpu/drm/i915/gt/uc/intel_guc.c        |  24 ++--
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |   4 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c         |   4 +-
 drivers/gpu/drm/i915/i915_driver.c            | 105 ++++++++++++-----
 drivers/gpu/drm/i915/i915_drv.h               |   5 +
 drivers/gpu/drm/i915/i915_irq.c               |   4 +-
 drivers/gpu/drm/i915/i915_pci.c               |  14 +++
 drivers/gpu/drm/i915/intel_device_info.h      |   3 +
 drivers/gpu/drm/i915/intel_uncore.c           |  92 +++++++++------
 drivers/gpu/drm/i915/intel_uncore.h           |  28 ++++-
 drivers/gpu/drm/i915/pxp/intel_pxp.c          |   4 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c  |   4 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_irq.c      |  14 +--
 drivers/gpu/drm/i915/pxp/intel_pxp_session.c  |   4 +-
 .../gpu/drm/i915/selftests/mock_gem_device.c  |   1 +
 29 files changed, 449 insertions(+), 171 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/intel_sa_media.c
 create mode 100644 drivers/gpu/drm/i915/gt/intel_sa_media.h

-- 
2.37.2

