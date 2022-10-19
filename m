Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABAD605408
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 01:37:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6581110E162;
	Wed, 19 Oct 2022 23:37:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80CC410E154;
 Wed, 19 Oct 2022 23:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666222646; x=1697758646;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Dbgck/b4+/HH/j1dXJipV8o5G+tJcDgD2a4Pr7+x+Uo=;
 b=bVYPOaq/PT5w3uPhWX3eR009bQxhYmNjIVlmQkZSn/58Rlt1gEgo3qcf
 3dj+WGSck2eI1g6ws1YehEi1p+1CwGhf7AOmHMeH0G8BtZXVXIdmtSoY+
 uz3fruy6cocnlcIs1G7E28taH15vl1kzxNhqzi8lu1Zk0EbDJMir7GRol
 uAKJBx3KwJtnShI2S19dw6s6zRtw7yLzen7BE/kXp+I2Y3aoJNydLbhSK
 remgcdhPdicFq0+vbdRjuW7yifFeEzAboILY+1OVXFknbcsPaNhA37h83
 Y2QW+Ml/4if1B6iADI5mriq/dlJoPnVuRSKJtDtIxJajtdRPj7+2LnUUE A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="392860766"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="392860766"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 16:37:25 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="718723313"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="718723313"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 16:37:25 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/5] i915: CAGF and RC6 changes for MTL
Date: Wed, 19 Oct 2022 16:37:16 -0700
Message-Id: <20221019233721.3270601-1-ashutosh.dixit@intel.com>
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
Cc: Anshuman Gupta <anshuman.gupta@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>, dri-devel@lists.freedesktop.org,
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

Ashutosh Dixit (2):
  drm/i915/rps: Prefer REG_FIELD_GET in intel_rps_get_cagf
  drm/i915/gt: Use RC6 residency types as arguments to residency
    functions

Badal Nilawar (2):
  drm/i915/mtl: Modify CAGF functions for MTL
  drm/i915/mtl: C6 residency and C state type for MTL SAMedia

Don Hiatt (1):
  drm/i915: Use GEN12_RPSTAT register for GT freq

 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c | 87 ++++++++++++++-----
 drivers/gpu/drm/i915/gt/intel_gt_regs.h       | 22 +++--
 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c   | 12 +--
 drivers/gpu/drm/i915/gt/intel_rc6.c           | 64 +++++++++-----
 drivers/gpu/drm/i915/gt/intel_rc6.h           | 11 ++-
 drivers/gpu/drm/i915/gt/intel_rc6_types.h     | 15 +++-
 drivers/gpu/drm/i915/gt/intel_rps.c           | 51 ++++++++---
 drivers/gpu/drm/i915/gt/intel_rps.h           |  2 +
 drivers/gpu/drm/i915/gt/selftest_rc6.c        |  6 +-
 drivers/gpu/drm/i915/i915_pmu.c               |  9 +-
 10 files changed, 197 insertions(+), 82 deletions(-)

-- 
2.38.0

