Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F4065398E
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 00:04:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A099E10E075;
	Wed, 21 Dec 2022 23:03:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B04E10E04A;
 Wed, 21 Dec 2022 23:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671663819; x=1703199819;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4Z/WRtbjnOiJ0uHIyXAFMqHotG7OwAYBY2csoq/NDXs=;
 b=A7vwkriPxMTLsCPbgmoahtTxXh137KZNXVB3DfTS+lmj/AGm19CboCvI
 /f2ctHGSLktNmr6JGF8uC8gjxt83FjNpsAi/hYk/CZcT2vdJ5CP7DknGO
 PER60GePPtnFhAR2vO5uBIB1tPktDwnahCJx1Us2Ns6kYoI6U8gKDXm6q
 elK5y47b5Wa61stQ9oLJlWoDp6oGiG16vvA9Qxj0zdFNAu7VE3XyU1hoQ
 8XO2HBlTmPQYV7DevZzTZHqdUUFy3VRpmXUT6QfTa/AoquWj1m2IUgU7p
 GGkW2vwD+q16lUbgfS0rrSv0PBy95CxFj2be7k6Wt+AJ2+a+M74dJfL/o g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="321905516"
X-IronPort-AV: E=Sophos;i="5.96,263,1665471600"; d="scan'208";a="321905516"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2022 15:03:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="793864410"
X-IronPort-AV: E=Sophos;i="5.96,263,1665471600"; d="scan'208";a="793864410"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by fmsmga001.fm.intel.com with ESMTP; 21 Dec 2022 15:03:38 -0800
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 0/7] drm/i915/pxp: Add missing cleanup steps for PXP
 global-teardown
Date: Wed, 21 Dec 2022 15:06:21 -0800
Message-Id: <20221221230628.2715916-1-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.34.1
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

Alan Previn (3):
  drm/i915/pxp: Invalidate all PXP fw sessions during teardown
  drm/i915/pxp: Trigger the global teardown for before suspending
  drm/i915/pxp: Pxp hw init should be in resume_complete
  HAX: force enable PXP Kconfig

Alexander Usyskin (3):
  mei: mei-me: resume device in prepare
  drm/i915/pxp: add device link between i915 and mei_pxp
  mei: clean pending read with vtag on bus

 drivers/gpu/drm/i915/Kconfig                  |  2 +-
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
 drivers/misc/mei/pci-me.c                     | 13 ++++
 drivers/misc/mei/pxp/Kconfig                  |  1 +
 15 files changed, 168 insertions(+), 21 deletions(-)


base-commit: cc44a1e87ea6b788868878295119398966f98a81
-- 
2.34.1

