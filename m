Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6619960B6E7
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 21:13:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2357F10E768;
	Mon, 24 Oct 2022 19:13:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14A0E10E742;
 Mon, 24 Oct 2022 19:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666638798; x=1698174798;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uLgxiOFdrXMh2yhFiXkAvI3q8PPpzAiiA2Vj5qUDk4o=;
 b=eTyv1119ymngkDwhH7mvo32a5U92suMtTFnyZ1Y+gFHzR17tX/Jlienr
 jJboEitQtqxxE1B4l6QNkvgb2QZHoGtk2MBsUnQMqfR6QZLSRxNuXLg1N
 uJgZt1DWt4fPj6zfVH8GXHAqzhSakRu17TEejflQghyw/630Ed5orTBj3
 n42cpkUwRcPGbyBg6gEH0ze3IqMxuM3hWtP0ltw/N3ZJJpGKKX+mw8yES
 Au9/Y7e8PuHg26c+6JSyP0GFwj1Vzyzp93QnmAH1kfukelKyveg3Dw+uo
 UGQ3D5ODjjriEiLkIiKuVz2P/vVETTyy1Hc4CKOYkmK2Oys/g0/1eMgyH g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="305113232"
X-IronPort-AV: E=Sophos;i="5.95,210,1661842800"; d="scan'208";a="305113232"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 12:13:17 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="582514345"
X-IronPort-AV: E=Sophos;i="5.95,210,1661842800"; d="scan'208";a="582514345"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 12:13:16 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/5] i915: CAGF and RC6 changes for MTL
Date: Mon, 24 Oct 2022 12:13:08 -0700
Message-Id: <20221024191313.3840311-1-ashutosh.dixit@intel.com>
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

v9: Rebuild, identical to v8

v10: Address review comments from Rodrigo on Patch 5

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

