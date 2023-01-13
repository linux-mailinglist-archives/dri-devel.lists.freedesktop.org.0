Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C43FB668901
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 02:19:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 318FB10E1C7;
	Fri, 13 Jan 2023 01:18:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 690AE10E1C4;
 Fri, 13 Jan 2023 01:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673572731; x=1705108731;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6Pkl0cpvz5S9qgQnl+nqoerpjrcu8LGM3J6G9kbs5aE=;
 b=cSlGiGzuqXNnaGCwE0KIetUAFzfZ27nJ0GQ88nc3Bh6Vex3rLOT2KXOt
 Hu7+XWOmX8NYB993yVVMFvwmRHj3KNyFyG+cWBjS28iunfTN8xsF9x1Kh
 K9jiDBEuzJrb/N0ZqerQsfxPbhIC7PTInFGzMol69MmxToSFKV0tht4dM
 effnAfihurzLppL+/NOIVAXB2DoKORBHUg2Kn7Ojod6THLn6hE85nm+01
 PDFqOpfGapHrQxnm2Wto3F0JMMu2SWufKXZY6vgGYrTtH5PMGj9rwfogd
 yb0s+71AkQWWSNe48mtcD96spKYhpKGwJNWLWC/yiTlUgS6NBH6qHOXip A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="323941561"
X-IronPort-AV: E=Sophos;i="5.97,212,1669104000"; d="scan'208";a="323941561"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2023 17:18:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="746761008"
X-IronPort-AV: E=Sophos;i="5.97,212,1669104000"; d="scan'208";a="746761008"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by FMSMGA003.fm.intel.com with ESMTP; 12 Jan 2023 17:18:50 -0800
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 0/6] drm/i915/pxp: Add missing cleanup steps for PXP
 global-teardown
Date: Thu, 12 Jan 2023 17:18:44 -0800
Message-Id: <20230113011850.1463965-1-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
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
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
	Vivi@freedesktop.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rodrigo <rodrigo.vivi@intel.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	dri-devel@lists.freedesktop.org,
	Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
	Juston Li <justonli@chromium.org>,
	Tomas Winkler <tomas.winkler@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A customer issue was recently discovered and in the process a
gap in i915's PXP interaction with HW+FW architecure was also
realized. This series adds those missing pieces.

This fix includes changes where i915 calls into the mei
component interface in order to submit requests to the security
firmware during the i915's suspend_prepare flow. This change did
expose a blocking issue in the mei component side that was
discovered while testing in rev1. The issue being the mei-pxp
component driver not being able to runtime-resume while being
within the suspend_prepare callstack.


Thus, we have now included the mei patches (from Alexander) that
fixes that issue by adding a device-link based on the interface
type to ensure mei side runtime resume during the i915's
suspend_prepare call.

That said, as per request from Alexander, we seek Greg's and Tomas'
review for the mei patches (Patch 1, 2 and 3). Patch 2, although is
a change in the i915 code, is the mei component device link change.

The individual patches explain more details. Patch 7 can be ignored
as it won't be merged and is only meant to ensure the CI run's
the PXP subtests with PXP support enabled in KConfig.

Changes from prior revs:
   v1: - Dont need to teardown non-arbitration sessions (Juston).
       - Fix builds when PXP is enabled in config (Alan/CI-build).
       - Fix the broken pm-suspend-resume symmetry when we do this
         pxp-session-teardown during i915s pm_suspend_prepare by
         ensuring the init is done during i915s pm_resume_complete.
   v2: - Rebase on latest drm-tip after PXP subsytem was promoted
         to global.
       - Remove "INTEL_PXP_MAX_HWDRM_SESSIONS" unneeded (Juston Li).
       - Added mei patches that are dependencies for this series
         to successfully pass testing when PXP config is enabled.
   v3: - Added fix for mei patch when CONFIG_PM_SLEEP is off (reported
         by kernel test robot <lkp@intel.com>).
   v4: - Added "DRM_SWITCH_POWER_OFF" check and removed bail-out if
         '!i915' that wont happen in i915_pm_complete (Daniele).
       - move i915_pm_complete to appear in i915_pm_resume.
       - One more fix for mei patch when CONFIG_PM_SLEEP is off
         (reported by kernel test robot <lkp@intel.com>).

Alan Previn (3):
  drm/i915/pxp: Invalidate all PXP fw sessions during teardown
  drm/i915/pxp: Trigger the global teardown for before suspending
  drm/i915/pxp: Pxp hw init should be in resume_complete

Alexander Usyskin (3):
  mei: mei-me: resume device in prepare
  drm/i915/pxp: add device link between i915 and mei_pxp
  mei: clean pending read with vtag on bus

 drivers/gpu/drm/i915/gt/intel_gt_pm.h         |  1 +
 drivers/gpu/drm/i915/i915_driver.c            | 20 ++++++-
 drivers/gpu/drm/i915/pxp/intel_pxp.c          | 60 ++++++++++++++++---
 drivers/gpu/drm/i915/pxp/intel_pxp.h          |  2 +
 .../drm/i915/pxp/intel_pxp_cmd_interface_42.h | 15 +++++
 .../i915/pxp/intel_pxp_cmd_interface_cmn.h    |  3 +
 drivers/gpu/drm/i915/pxp/intel_pxp_pm.c       |  4 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_pm.h       |  6 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_session.c  | 11 +++-
 drivers/gpu/drm/i915/pxp/intel_pxp_session.h  |  5 ++
 drivers/gpu/drm/i915/pxp/intel_pxp_tee.c      | 42 +++++++++++++
 drivers/misc/mei/client.c                     |  4 +-
 drivers/misc/mei/pci-me.c                     | 20 ++++++-
 13 files changed, 172 insertions(+), 21 deletions(-)


base-commit: c0ba6b6312e9139ce4b89da2904b329c13b5e94d
-- 
2.39.0

