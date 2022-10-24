Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F3060B9FF
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 22:24:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E89A10E7AD;
	Mon, 24 Oct 2022 20:24:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C28F210E06B;
 Mon, 24 Oct 2022 20:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666643066; x=1698179066;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JUrVmxHogwwq27qzsV3+et1sLbp4PKGirb17DlFbrig=;
 b=NKO/YQ1Ss05nKwvs4Xo4DMSWMMIZBZWJNLu9xO1/VEIM0239rmOoEFJA
 W1iIVbsRkKLsGTscEcOXnAG+lkDE0ToilMl5sDLFWJf6bXzw4fGDjrKiB
 fdZ8MOXPYbnCeMuPDqUwkHpCgFl89nviEAIM6CKwQZJdCQor5hweKuZXx
 hbZ+hQ1Yq31ixdz3L0rKhn4NWnlu+ex2EBZdwdH8rC+e2DiIqo1hG0qZY
 EvXMxjTTEnIHcEbTWCFIKr9CgMflIJANuz88qsXiplzIQwTG0aISlPHwp
 pIpyB3BbJxNsTjFSWMCwkw/d8I48nPvgF7DeiZtI9zTQ8xDB/NKDvqHBb A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="309201997"
X-IronPort-AV: E=Sophos;i="5.95,210,1661842800"; d="scan'208";a="309201997"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 13:24:26 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="806426155"
X-IronPort-AV: E=Sophos;i="5.95,210,1661842800"; d="scan'208";a="806426155"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 13:24:26 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/5] i915: CAGF and RC6 changes for MTL
Date: Mon, 24 Oct 2022 13:24:17 -0700
Message-Id: <20221024202422.3924298-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.38.0
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
Cc: Badal Nilawar <badal.nilawar@intel.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
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
2.38.0

