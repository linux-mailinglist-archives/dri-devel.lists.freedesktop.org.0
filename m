Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3652B5ABB2C
	for <lists+dri-devel@lfdr.de>; Sat,  3 Sep 2022 01:33:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D00510E93D;
	Fri,  2 Sep 2022 23:33:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D617B10E93A;
 Fri,  2 Sep 2022 23:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662161592; x=1693697592;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/4pzuRReCi7fWAeJwlHI1gfgLMtSQMQWjvVrp5XdBeA=;
 b=WuzLvq+w/CXQnw6XyP4jBV1DSkvIg9hTJz8EaZVHqYUrt8uwbGOziN5n
 zidFIiVKj8yEb0B5mHvnug7SpihREq3lwYA8iP+OjshmW7nxK+1iSz87w
 IG4pslHHJOYLnz/fYZZLdrS8MJrbZGXo0NAuTdTWIX206hT+YjqWt/2Qa
 XrTZtRyFX3A4me+uQz7+S270MYqsiKZNTc65KfbTS9w7Et+fWO7RHAV3i
 hE6z6uxz2fopqTMvrg6COXnBoapewKbcN28jrUOLvvLI9BUIiCcKcv5IH
 Igh3W5s0paS+Y7mxZRNNb5K5Q+Ia6SYQKk24TDP781bceDoL9P2s//6bu A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10458"; a="360064657"
X-IronPort-AV: E=Sophos;i="5.93,285,1654585200"; d="scan'208";a="360064657"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2022 16:33:11 -0700
X-IronPort-AV: E=Sophos;i="5.93,285,1654585200"; d="scan'208";a="941464181"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2022 16:33:11 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 00/12] i915: Add "standalone media" support for MTL
Date: Fri,  2 Sep 2022 16:32:45 -0700
Message-Id: <20220902233257.3088492-1-matthew.d.roper@intel.com>
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 dri-devel@lists.freedesktop.org,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>
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
 - Simplified GSI offset handling and split it into its own patch.
 - Correct gt->irq_lock assignment for media GT.
 - Fix jump target for intel_root_gt_init_early() errors.

Cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>

Matt Roper (12):
  drm/i915: Move locking and unclaimed check into
    mmio_debug_{suspend,resume}
  drm/i915: Only hook up uncore->debug for primary uncore
  drm/i915: Use managed allocations for extra uncore objects
  drm/i915: Prepare more multi-GT initialization
  drm/i915: Rename and expose common GT early init routine
  drm/i915: Use a DRM-managed action to release the PCI bridge device
  drm/i915: Initialize MMIO access for each GT
  drm/i915: Handle each GT on init/release and suspend/resume
  drm/i915/uncore: Add GSI offset to uncore
  drm/i915/xelpmp: Expose media as another GT
  drm/i915/mtl: Use primary GT's irq lock for media GT
  drm/i915/mtl: Hook up interrupts for standalone media

 drivers/gpu/drm/i915/Makefile                 |   1 +
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  10 +-
 drivers/gpu/drm/i915/gt/intel_gt.c            |  96 ++++++++++++----
 drivers/gpu/drm/i915/gt/intel_gt.h            |   4 +-
 drivers/gpu/drm/i915/gt/intel_gt_irq.c        |  35 ++++--
 drivers/gpu/drm/i915/gt/intel_gt_pm_irq.c     |   8 +-
 drivers/gpu/drm/i915/gt/intel_gt_regs.h       |  10 ++
 drivers/gpu/drm/i915/gt/intel_gt_types.h      |   5 +-
 drivers/gpu/drm/i915/gt/intel_rps.c           |  26 ++---
 drivers/gpu/drm/i915/gt/intel_sa_media.c      |  47 ++++++++
 drivers/gpu/drm/i915/gt/intel_sa_media.h      |  15 +++
 drivers/gpu/drm/i915/gt/uc/intel_guc.c        |  24 ++--
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |   4 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c         |   4 +-
 drivers/gpu/drm/i915/i915_driver.c            | 105 ++++++++++++------
 drivers/gpu/drm/i915/i915_drv.h               |   5 +
 drivers/gpu/drm/i915/i915_irq.c               |   4 +-
 drivers/gpu/drm/i915/i915_pci.c               |  15 +++
 drivers/gpu/drm/i915/intel_device_info.h      |  19 ++++
 drivers/gpu/drm/i915/intel_uncore.c           |  83 +++++++++-----
 drivers/gpu/drm/i915/intel_uncore.h           |  28 ++++-
 drivers/gpu/drm/i915/pxp/intel_pxp.c          |   4 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_irq.c      |  14 +--
 drivers/gpu/drm/i915/pxp/intel_pxp_session.c  |   4 +-
 .../gpu/drm/i915/selftests/mock_gem_device.c  |   1 +
 25 files changed, 424 insertions(+), 147 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/intel_sa_media.c
 create mode 100644 drivers/gpu/drm/i915/gt/intel_sa_media.h

-- 
2.37.2

