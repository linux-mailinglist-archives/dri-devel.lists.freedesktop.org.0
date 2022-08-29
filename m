Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0F85A538B
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 19:55:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCF3010EAB7;
	Mon, 29 Aug 2022 17:54:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4170310EAB7;
 Mon, 29 Aug 2022 17:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661795690; x=1693331690;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HCiHs8vLMyexpVKSId1zABKKFE4uWnv5fRximSaW/fM=;
 b=GDXLNZX3L77tWg9KN6/pA+0j8tEx0o8C/XCvXhFSlmz7i9FdhF70MMQB
 frpvB+WUoxGPumfWtLVkSKwW4XBXKFqZ9yXQbSHMf4ywEV5Zn+b+ZEWJq
 ek1ppdbgFNlIYoLxHeJ6harxAlleyodIyTxrITyxALOcgndBIRuDeMbVm
 Lku9BxBevEFbdz4F3q6mIWpNjtLi4x0OCvLsQiWE/dXwPttJg8RSrvw4M
 q7yIjmnBsDv4H9nsC+fqVFLA4IBhXxCX6fC4RrF5a584wj2fUGWH4GqGj
 aUAKZnqyzFzFWSM4zVlsbs1nT+AK23qv8fXToVTD7vtvm6Wds1Bc10RYm Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10454"; a="381246657"
X-IronPort-AV: E=Sophos;i="5.93,273,1654585200"; d="scan'208";a="381246657"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2022 10:02:43 -0700
X-IronPort-AV: E=Sophos;i="5.93,272,1654585200"; d="scan'208";a="562297203"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2022 10:02:43 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/8] i915: Add "standalone media" support for MTL
Date: Mon, 29 Aug 2022 10:02:30 -0700
Message-Id: <20220829170238.969875-1-matthew.d.roper@intel.com>
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
Cc: dri-devel@lists.freedesktop.org, radhakrishna.sripada@intel.com
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


Matt Roper (8):
  drm/i915: Move locking and unclaimed check into
    mmio_debug_{suspend,resume}
  drm/i915: Only hook up uncore->debug for primary uncore
  drm/i915: Use managed allocations for extra uncore objects
  drm/i915: Prepare more multi-GT initialization
  drm/i915: Rename and expose common GT early init routine
  drm/i915/xelpmp: Expose media as another GT
  drm/i915/mtl: Use primary GT's irq lock for media GT
  drm/i915/mtl: Hook up interrupts for standalone media

 drivers/gpu/drm/i915/Makefile                 |  1 +
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     | 10 +--
 drivers/gpu/drm/i915/gt/intel_gt.c            | 88 ++++++++++++++-----
 drivers/gpu/drm/i915/gt/intel_gt.h            |  4 +-
 drivers/gpu/drm/i915/gt/intel_gt_irq.c        | 35 ++++++--
 drivers/gpu/drm/i915/gt/intel_gt_pm_irq.c     |  8 +-
 drivers/gpu/drm/i915/gt/intel_gt_regs.h       | 10 +++
 drivers/gpu/drm/i915/gt/intel_gt_types.h      |  5 +-
 drivers/gpu/drm/i915/gt/intel_rps.c           | 26 +++---
 drivers/gpu/drm/i915/gt/intel_sa_media.c      | 47 ++++++++++
 drivers/gpu/drm/i915/gt/intel_sa_media.h      | 15 ++++
 drivers/gpu/drm/i915/gt/uc/intel_guc.c        | 24 ++---
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  4 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c         |  4 +-
 drivers/gpu/drm/i915/i915_driver.c            |  6 +-
 drivers/gpu/drm/i915/i915_drv.h               |  5 ++
 drivers/gpu/drm/i915/i915_irq.c               |  4 +-
 drivers/gpu/drm/i915/i915_pci.c               | 15 ++++
 drivers/gpu/drm/i915/intel_device_info.h      | 19 ++++
 drivers/gpu/drm/i915/intel_uncore.c           | 80 +++++++++++------
 drivers/gpu/drm/i915/intel_uncore.h           | 23 ++++-
 drivers/gpu/drm/i915/pxp/intel_pxp.c          |  4 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_irq.c      | 14 +--
 drivers/gpu/drm/i915/pxp/intel_pxp_session.c  |  4 +-
 .../gpu/drm/i915/selftests/mock_gem_device.c  |  1 +
 25 files changed, 340 insertions(+), 116 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/intel_sa_media.c
 create mode 100644 drivers/gpu/drm/i915/gt/intel_sa_media.h

-- 
2.37.2

