Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF5487407C
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 20:36:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C200112763;
	Wed,  6 Mar 2024 19:36:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dfZj+N6f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F84711245D;
 Wed,  6 Mar 2024 19:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709753782; x=1741289782;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2/cE0heINl0JPKHm9ChE5r+ugL6pYyc/KpPYWS8G2h0=;
 b=dfZj+N6fT4xqHMnx+V6lVPrN9acxFj5oJUFt28b4msc1a5PIlDyD716s
 O6QI4nDO+BtCGk3bN7tG3T3poTUCRTEpHdFTVIsYU00C/kNM5CYfDja+i
 HYD8V0UWpiNZrFLmfiK21HCZ9NwrzH/WvDsTUV9ExT/E9bA5S6AC2dBkd
 Lgx+5SkJPt7E7FDw55snkyoqh5UsDLw64zWDkoDsVqmyhMNhc8Yp5qmiV
 uzYCbxZI6NZPVm+Ck7BCTO9ISuSrxZXcBD4JJSeM0XQkgMiVfonAYlsvZ
 8sUj4H2CfAMrMRMu6rJzQebrKyDboZJx8cbhHIHVm+NHmuXOq/cT3hyo+ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="4246870"
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="4246870"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 11:36:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="9841798"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 11:36:22 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 0/5] drm/i915: cleanup dead code
Date: Wed,  6 Mar 2024 11:36:38 -0800
Message-ID: <20240306193643.1897026-1-lucas.demarchi@intel.com>
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

Remove platforms that never had their PCI IDs added to the driver and
are of course marked with requiring force_probe. Note that most of the
code for those platforms is actually used by subsequent ones, so it's
not a huge amount of code being removed.

drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h is also changed on the
xe side, but that should be ok: the defines are there only for compat
reasons while building the display side (and none of these platforms
have display, so it's build-issue only).

First patch is what motivated the others and was submitted alone
@ 20240306144723.1826977-1-lucas.demarchi@intel.com .
While loooking at this WA I was wondering why we still had some of that
code around.

Build-tested only for now.

Lucas De Marchi (5):
  drm/i915: Drop WA 16015675438
  drm/i915: Drop dead code for xehpsdv
  drm/i915: Update IP_VER(12, 50)
  drm/i915: Drop dead code for pvc
  drm/i915: Remove special handling for !RCS_MASK()

 Documentation/gpu/rfc/i915_vm_bind.h          |  11 +-
 .../gpu/drm/i915/gem/i915_gem_object_types.h  |   2 +-
 .../gpu/drm/i915/gem/selftests/huge_pages.c   |   4 +-
 .../i915/gem/selftests/i915_gem_client_blt.c  |   8 +-
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c      |   5 +-
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c          |  40 ++--
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  43 +---
 .../drm/i915/gt/intel_execlists_submission.c  |  10 +-
 drivers/gpu/drm/i915/gt/intel_gsc.c           |  15 --
 drivers/gpu/drm/i915/gt/intel_gt.c            |   4 +-
 drivers/gpu/drm/i915/gt/intel_gt_mcr.c        |  52 +----
 drivers/gpu/drm/i915/gt/intel_gt_mcr.h        |   2 +-
 drivers/gpu/drm/i915/gt/intel_gt_regs.h       |  59 ------
 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c   |  21 +-
 drivers/gpu/drm/i915/gt/intel_gtt.c           |   2 +-
 drivers/gpu/drm/i915/gt/intel_lrc.c           |  51 +----
 drivers/gpu/drm/i915/gt/intel_migrate.c       |  22 +-
 drivers/gpu/drm/i915/gt/intel_mocs.c          |  52 +----
 drivers/gpu/drm/i915/gt/intel_rps.c           |   6 +-
 drivers/gpu/drm/i915/gt/intel_sseu.c          |  13 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c   | 193 +-----------------
 drivers/gpu/drm/i915/gt/uc/intel_guc.c        |   6 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    |   4 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c     |   2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |   1 -
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |   2 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c         |   4 -
 drivers/gpu/drm/i915/i915_debugfs.c           |  12 --
 drivers/gpu/drm/i915/i915_drv.h               |  13 --
 drivers/gpu/drm/i915/i915_getparam.c          |   4 +-
 drivers/gpu/drm/i915/i915_gpu_error.c         |   5 +-
 drivers/gpu/drm/i915/i915_hwmon.c             |   6 -
 drivers/gpu/drm/i915/i915_pci.c               |  61 +-----
 drivers/gpu/drm/i915/i915_perf.c              |  19 +-
 drivers/gpu/drm/i915/i915_query.c             |   2 +-
 drivers/gpu/drm/i915/i915_reg.h               |   4 +-
 drivers/gpu/drm/i915/intel_clock_gating.c     |  26 +--
 drivers/gpu/drm/i915/intel_device_info.c      |   2 -
 drivers/gpu/drm/i915/intel_device_info.h      |   2 -
 drivers/gpu/drm/i915/intel_step.c             |  80 +-------
 drivers/gpu/drm/i915/intel_uncore.c           | 159 +--------------
 drivers/gpu/drm/i915/selftests/intel_uncore.c |   3 -
 .../gpu/drm/xe/compat-i915-headers/i915_drv.h |   6 -
 43 files changed, 110 insertions(+), 928 deletions(-)

-- 
2.43.0

