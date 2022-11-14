Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0680627DC1
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 13:30:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 431C210E095;
	Mon, 14 Nov 2022 12:30:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B68C10E095;
 Mon, 14 Nov 2022 12:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668429004; x=1699965004;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1is2tJ0MTFYXoBldpJ/6ZUeOChJfL0yCGXBJv9eNjTs=;
 b=T9bBE0UHHlEVNEtBz8/E4AnsEHRM0PqaWFT9Eti3zipJsLlFtLjQrwaE
 ypdLo1w/TfjpgfUYlVICGEgHePRXLWHxKSFGrXCyZDkxX7ggwOwxEMnse
 btwMotxWeV6A3Lw00+PbnQqJr839JKB9+rl51vOg0XWOWS8PaMrJZ9QMX
 6cWtdmg4XpMsjv3mbFEdpdK81+tMtiZxTboL9xy64vrp8pp8FBPmi21Hu
 tXSENohhAVi6YRiwSKp4RkyrbwWBd5CyQYfM1yID/um6sd+2LGCc/IIlT
 Qu7rcgjQHaK4Tv+z8ETGIDVQEimOAqMladx5WHH93x9qyvVMedc0vFBG2 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="311960546"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; d="scan'208";a="311960546"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2022 04:30:03 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="727509000"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; d="scan'208";a="727509000"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2022 04:30:02 -0800
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/5] i915: CAGF and RC6 changes for MTL
Date: Mon, 14 Nov 2022 18:03:43 +0530
Message-Id: <20221114123348.3474216-1-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: ashutosh.dixit@intel.com, dri-devel@lists.freedesktop.org,
 rodrigo.vivi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series includes the code changes to get CAGF, RC State and C6
Residency of MTL.

v3: Included "Use GEN12 RPSTAT register" patch

v4:
  - Rebased
  - Dropped "Use GEN12 RPSTAT register" patch from this series
    going to send separate series for it

v5:
  - Included "drm/i915/gt: Change RC6 residency functions to accept register
    ID's" based on code review feedback

v6:
  - Addressed Jani N's review comments on "drm/i915/gt: Change RC6 residency
    functions to accept register ID's"
  - Re-add "drm/i915: Use GEN12_RPSTAT register for GT freq" to this series

v7: Rebuild, identical to v6

v8:
  - Add "drm/i915/rps: Prefer REG_FIELD_GET in intel_rps_get_cagf" to the series
    (based on Rodrigo's review) to consistently use REG_FIELD_GET
  - Minor changes to other patches, please see individual patches for changelogs

v9: Rebuild, identical to v8

v10: Address review comments from Rodrigo on Patch 5

v11: Change state name for MTL_CC0 to RC0 in Patch 5

v12: Rebased to latest upstream. Identical to v11.

Ashutosh Dixit (2):
  drm/i915/rps: Prefer REG_FIELD_GET in intel_rps_get_cagf
  drm/i915/gt: Use RC6 residency types as arguments to residency
    functions

Badal Nilawar (2):
  drm/i915/mtl: Modify CAGF functions for MTL
  drm/i915/mtl: C6 residency and C state type for MTL SAMedia

Don Hiatt (1):
  drm/i915: Use GEN12_RPSTAT register for GT freq

 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c | 88 ++++++++++++++-----
 drivers/gpu/drm/i915/gt/intel_gt_regs.h       | 22 +++--
 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c   | 12 +--
 drivers/gpu/drm/i915/gt/intel_rc6.c           | 64 +++++++++-----
 drivers/gpu/drm/i915/gt/intel_rc6.h           | 11 ++-
 drivers/gpu/drm/i915/gt/intel_rc6_types.h     | 15 +++-
 drivers/gpu/drm/i915/gt/intel_rps.c           | 51 ++++++++---
 drivers/gpu/drm/i915/gt/intel_rps.h           |  2 +
 drivers/gpu/drm/i915/gt/selftest_rc6.c        |  6 +-
 drivers/gpu/drm/i915/i915_pmu.c               |  9 +-
 10 files changed, 198 insertions(+), 82 deletions(-)

-- 
2.25.1

