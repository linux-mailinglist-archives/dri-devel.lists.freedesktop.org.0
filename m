Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 672E160392C
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 07:21:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D07C510F12B;
	Wed, 19 Oct 2022 05:20:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62EE410EA68;
 Wed, 19 Oct 2022 05:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666156848; x=1697692848;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ifB9NBfZjwGic5nYTTsEIQC/SPG6cj113cefPjFlGGI=;
 b=dx3n/wx1cOE1WIYDdD5jCR/eha7EFeFmYpzgb3e9U+RlHJ27jnKRXSEZ
 mWvxdWhMPZxgLamwyDxsLvuDJhpj26Z2rz3tyS46MWt/TZItvxo61jOLC
 X3zFwJYC62vtIYbZjcDAM+LRWLRPwdImR9dCpKfVgkGD+tMoeDelfSzKX
 YFNJLEoKjMFH3xeNTsBflQoT11tuZK/w0wdT7HdAOJDZHFzWMg3VKWcdz
 se+aSU2BccrZO+eFmGkAerkfHLVi96oTZutKeNvqw6xB0KljIP8ZkI1X4
 mreJ7+itve5U4OKPDoiF33Qz89amJ5ok+e7SD9wPdTpG4JiEqKZL+ggdd w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="392610805"
X-IronPort-AV: E=Sophos;i="5.95,195,1661842800"; d="scan'208";a="392610805"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 22:20:47 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="874254606"
X-IronPort-AV: E=Sophos;i="5.95,195,1661842800"; d="scan'208";a="874254606"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 22:20:47 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/4] i915: CAGF and RC6 changes for MTL
Date: Tue, 18 Oct 2022 22:20:39 -0700
Message-Id: <20221019052043.3193842-1-ashutosh.dixit@intel.com>
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
- Minor changes to other patches, please see individual patches for changelogs

Ashutosh Dixit (1):
  drm/i915/gt: Use RC6 residency types as arguments to residency
    functions

Badal Nilawar (2):
  drm/i915/mtl: Modify CAGF functions for MTL
  drm/i915/mtl: C6 residency and C state type for MTL SAMedia

Don Hiatt (1):
  drm/i915: Use GEN12_RPSTAT register for GT freq

 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c | 87 ++++++++++++++-----
 drivers/gpu/drm/i915/gt/intel_gt_regs.h       | 11 +++
 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c   | 12 +--
 drivers/gpu/drm/i915/gt/intel_rc6.c           | 64 +++++++++-----
 drivers/gpu/drm/i915/gt/intel_rc6.h           |  8 +-
 drivers/gpu/drm/i915/gt/intel_rc6_types.h     | 15 +++-
 drivers/gpu/drm/i915/gt/intel_rps.c           | 40 ++++++++-
 drivers/gpu/drm/i915/gt/intel_rps.h           |  2 +
 drivers/gpu/drm/i915/gt/selftest_rc6.c        |  6 +-
 drivers/gpu/drm/i915/i915_pmu.c               |  9 +-
 10 files changed, 188 insertions(+), 66 deletions(-)

-- 
2.38.0

