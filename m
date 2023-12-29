Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7AD81FEDF
	for <lists+dri-devel@lfdr.de>; Fri, 29 Dec 2023 11:27:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACC9B10E0A8;
	Fri, 29 Dec 2023 10:27:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC34710E00E;
 Fri, 29 Dec 2023 10:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703845668; x=1735381668;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=44vgCtyD59dehyHacLYNX1eeul6GV764P8/2QEts/Po=;
 b=c6xREOch75+TeT/EwUT/2M0J1sPGxegqlnTYI4acI9hQtM7Y9hkedfX8
 0bRVL8b2WndQgeEJXUEDnBuGaC6nkTBRGTOWs1VuwsnpKflWizgPtTOTn
 m7J+gkZ8xxYLtGLZQN99jqA1tOoZY4e52QEdO2OL8YdRI+9o1V9B4Um+E
 dU7NwXrwbO4+qeULt3MiX0l788lTGgv0KL8zt9fyNVtaTtVrx5cRF8pv4
 bSc6otlOSI4qN/t2eWVfPctl2s+dRSxTfuDVECadFCz1yccvMHtXzPc5y
 FzbLgfNSivsO2HaYTEAeHh/atn6CYalySS63gWvjxYDSqdKuoYVTt53Z6 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10937"; a="393780545"
X-IronPort-AV: E=Sophos;i="6.04,314,1695711600"; d="scan'208";a="393780545"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Dec 2023 02:27:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10937"; a="897462791"
X-IronPort-AV: E=Sophos;i="6.04,314,1695711600"; d="scan'208";a="897462791"
Received: from jquigley-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.51.13])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Dec 2023 02:27:45 -0800
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4 0/4] Add gt_to_guc() helper
Date: Fri, 29 Dec 2023 11:27:30 +0100
Message-ID: <20231229102734.674362-1-andi.shyti@linux.intel.com>
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
Cc: Andi Shyti <andi.shyti@linux.intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

respinning this series as there was a rebase conflict in its
latest version.

Andi

Changelog:
==========
v3 -> v4:
 - Rebase on top of the latest drm-tip
v2 -> v3:
 - Remove patch 1 that contained guc_to_i915()
v1 -> v2:
 - add the gt_to_guc() helper and change files in:
    - i915/gt/
    - i915/gt/uc
    - i915/

Andi Shyti (4):
  drm/i915/gt: Create the gt_to_guc() wrapper
  drm/i915/guc: Use the new gt_to_guc() wrapper
  drm/i915: Use the new gt_to_guc() wrapper
  drm/i915/guc: Use the ce_to_guc() wrapper whenever possible

 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  4 +--
 drivers/gpu/drm/i915/gt/intel_ggtt.c          |  9 ++----
 drivers/gpu/drm/i915/gt/intel_gt.h            |  5 ++++
 drivers/gpu/drm/i915/gt/intel_gt_irq.c        |  6 ++--
 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c |  2 +-
 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c   |  8 ++---
 drivers/gpu/drm/i915/gt/intel_rc6.c           |  4 +--
 drivers/gpu/drm/i915/gt/intel_rps.c           |  2 +-
 drivers/gpu/drm/i915/gt/intel_tlb.c           |  2 +-
 drivers/gpu/drm/i915/gt/selftest_slpc.c       |  6 ++--
 drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c     |  4 +--
 drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c  |  3 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    |  2 +-
 .../gpu/drm/i915/gt/uc/intel_guc_capture.c    |  6 ++--
 .../gpu/drm/i915/gt/uc/intel_guc_hwconfig.c   |  2 +-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 30 +++++++++----------
 drivers/gpu/drm/i915/gt/uc/intel_huc.c        |  4 +--
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      |  4 +--
 drivers/gpu/drm/i915/gt/uc/selftest_guc.c     |  2 +-
 drivers/gpu/drm/i915/i915_debugfs_params.c    |  2 +-
 .../i915/selftests/intel_scheduler_helpers.c  |  4 +--
 21 files changed, 57 insertions(+), 54 deletions(-)

-- 
2.43.0

