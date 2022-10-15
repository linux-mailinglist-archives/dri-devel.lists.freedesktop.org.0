Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5765FF839
	for <lists+dri-devel@lfdr.de>; Sat, 15 Oct 2022 05:27:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A595110E335;
	Sat, 15 Oct 2022 03:26:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6032910E2FB;
 Sat, 15 Oct 2022 03:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665804385; x=1697340385;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nQaKiVXKYV7YQqDtMsPIhTEaQXdIrw/4sbAzvHtq37Y=;
 b=TYn+w6p2ZPmwEZRtT9BgNQywO534xrqzpV4mpnsIfe0YcV1vM10OTtEz
 fASUBlHF8QpApjHHue7FB6+KbeteCNyOR41aHiPUVY3E4SEhAXP5Jtp0J
 KWp7h3rb72182I54rFY3g06Snvhj1SvPTaqI6u3ZMk5N/LPkidLVLyTPe
 lwfR2I0D9QSaODzuu0Z61zks+5ERpTBh53iUIdVMh0uRM9xfz2UJ7J64n
 QqMURtejB8Gp4Q08bA1fSnKOq4LuGXfaHnl2JXSN+6B/JUOsmnFD/Wt/Y
 1eeEEJQ+/CSUJ73MN1t1h5qBx5Qe1CQx/raWx+gB6aAP6HQuoETx+gU/H Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10500"; a="332035139"
X-IronPort-AV: E=Sophos;i="5.95,186,1661842800"; d="scan'208";a="332035139"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2022 20:26:24 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10500"; a="660937793"
X-IronPort-AV: E=Sophos;i="5.95,186,1661842800"; d="scan'208";a="660937793"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2022 20:26:24 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/3] i915: CAGF and RC6 changes for MTL
Date: Fri, 14 Oct 2022 20:26:15 -0700
Message-Id: <20221015032618.2458429-1-ashutosh.dixit@intel.com>
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

v2: Included "Use GEN12 RPSTAT register" patch

v3:
  - Rebased
  - Dropped "Use GEN12 RPSTAT register" patch from this series
    going to send separate series for it

v4:
- Included "drm/i915/gt: Change RC6 residency functions to accept register
  ID's" based on code review feedback
- Addressed review comments, please see individual patches for changelogs

Ashutosh Dixit (1):
  drm/i915/gt: Change RC6 residency functions to accept register ID's

Badal Nilawar (2):
  drm/i915/mtl: Modify CAGF functions for MTL
  drm/i915/mtl: C6 residency and C state type for MTL SAMedia

 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c | 84 ++++++++++++++-----
 drivers/gpu/drm/i915/gt/intel_gt_regs.h       |  9 ++
 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c   | 12 +--
 drivers/gpu/drm/i915/gt/intel_rc6.c           | 65 +++++++++-----
 drivers/gpu/drm/i915/gt/intel_rc6.h           |  9 +-
 drivers/gpu/drm/i915/gt/intel_rc6_types.h     | 10 +++
 drivers/gpu/drm/i915/gt/intel_rps.c           |  8 +-
 drivers/gpu/drm/i915/gt/selftest_rc6.c        |  6 +-
 drivers/gpu/drm/i915/i915_pmu.c               |  6 +-
 9 files changed, 150 insertions(+), 59 deletions(-)

-- 
2.38.0

