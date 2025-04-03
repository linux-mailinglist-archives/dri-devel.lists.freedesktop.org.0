Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5584CA7A8D8
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 19:49:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C31010EA4C;
	Thu,  3 Apr 2025 17:48:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MiwyLODk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D53810EA4C;
 Thu,  3 Apr 2025 17:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743702537; x=1775238537;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PZeBAhvFbGzC/ucKCVJJPsG4eJ8ayzzu2piI8QkaiBw=;
 b=MiwyLODk4aUGjJz9fD1tEURi06xecLQ8dD1tIt0NvNELSqAhma3jbr3F
 4azwfEEUGolkTk012CvjOlfxgvdv7S5T8FhdckShJK79G0i5cE2lIx3LJ
 FI+QLE4niuzzXHN0h7Ad7NzyMgviKC/SIx7hmVFxteEfY70Zwn7N7urPV
 eC01mD6wwp2XzoSk9RLiNC+uScCfXc8OdO0ouYf6+74uCV0S6n+u+MTkh
 TUBWGZBUPxE3CU/tTAunr3u/Sz/AsEHX/cQhKE7awQcd06sCjW1O7cG2f
 Na4mITbk/nFxXjzs47STch9bOrwxLVzEuHnvpjiJXfN6Zg7Knox0Mchpr g==;
X-CSE-ConnectionGUID: F77KzEUPSvG20KWYhE59Mw==
X-CSE-MsgGUID: q45tPXZyTIiVLbdB3qUHcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="55758509"
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="55758509"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 10:48:57 -0700
X-CSE-ConnectionGUID: CTLvKKZMRPG1n8VMAo1SZw==
X-CSE-MsgGUID: AMPVGZVCTxGngsBgrsTlIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="158057919"
Received: from dut138lnl.fm.intel.com ([10.105.23.23])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 10:48:57 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, shuicheng.lin@intel.com,
 dri-devel@lists.freedesktop.org, stuart.summers@intel.com,
 ivan.briano@intel.com
Subject: [PATCH v3 0/4] tests/intel/xe_vm: Add drm_xe_vm_get_property tests
Date: Thu,  3 Apr 2025 17:48:52 +0000
Message-ID: <20250403174856.75458-1-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add tests that exercise the new drm_xe_vm_get_property uapi,
specifically for ioctl input validation and for determining that
pagefaults are correctly tracked and returned by the reporter.

drm_xe_vm_get_property ioctl to be added by
https://patchwork.freedesktop.org/series/145529/

v2:
- Remove engine class and instance (Ivan)

v3:
- Add declares for fault type, access type, and fault level (Matt Brost,
  Ivan)
- Add reference to KMD change (Kamil)

References: 
Signed-off-by: Jonathan Cavitt <joanthan.cavitt@intel.com>
Suggested-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Suggested-by: Matthew Brost <matthew.brost@intel.com>
Suggested-by: Zhang Jianxun <jianxun.zhang@intel.com>
Suggested-by: Stuart Summers <stuart.summers@intel.com>
CC: Shuicheng Lin <shuicheng.lin@intel.com>
Cc: Ivan Briano <ivan.briano@intel.com>

Jonathan Cavitt (4):
  drm-uapi/xe: Declare xe_vm_get_property_ioctl
  lib/xe/xe_ioctl: Add xe_vm_get_property helper function
  tests/intel/xe_vm: Add DRM_IOCTL_XE_VM_GET_PROPERTY validation tests
  tests/intel/xe_vm: Test DRM_IOCTL_XE_VM_GET_PROPERTY fault reporting

 include/drm-uapi/xe_drm.h |  85 ++++++++++++++
 lib/xe/xe_ioctl.c         |   5 +
 lib/xe/xe_ioctl.h         |   1 +
 tests/intel/xe_vm.c       | 237 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 328 insertions(+)

-- 
2.43.0

