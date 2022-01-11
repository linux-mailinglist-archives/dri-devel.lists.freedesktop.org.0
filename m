Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C330448AA7E
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 10:28:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDFC214A233;
	Tue, 11 Jan 2022 09:28:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63B0E14A233;
 Tue, 11 Jan 2022 09:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641893312; x=1673429312;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=onE5YgZRVNaMqa66zxUsKhzqfu3ABTrDrHCYUGai8oA=;
 b=kp+gaNDLlJpZYhamsuqZpMkjEvHFlte5Co+cBOdur7dmUiSrOtqOoJto
 aAqYH6gt/fitWh+/otxrbqiAYloUUMehbM/LH/XVtavHDPyTn/8yrbb0e
 IHoCQYC2X9DUXx+z+E340P1BtKpbdLmSAqL/6cMHrf2b4t7LmHvYUE8tN
 EDTS5YqcLOq4hqeStYmGc2lES41CUqv9hp7YGF3gTg4gDRx1FkldmX3G6
 GyRhagU0yTBTaa79jPw0vCr0yhilVlT3MPxBtxpabdpwxYX7nAAjzkSdd
 7MRBpQ0jDH66UgO6ckjJlGmeaj0FBDIN03jpwPyz/81FGSdE2f118SEZ6 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10223"; a="240996987"
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; d="scan'208";a="240996987"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2022 01:28:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; d="scan'208";a="558305516"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by orsmga001.jf.intel.com with ESMTP; 11 Jan 2022 01:28:31 -0800
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC v3 0/7] Add GuC Error Capture Support
Date: Tue, 11 Jan 2022 01:30:10 -0800
Message-Id: <20220111093018.610582-1-alan.previn.teres.alexis@intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 John Harrison <john.c.harrison@intel.com>, dri-devel@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series:
  1. Supports the roll out of an upcoming GuC feature to
     enable error-state-capture that allows the driver to
     register lists of MMIO registers that GuC will report
     during a GuC triggered engine-reset event.
  2. Updates the ADS blob creation to register lists
     of global and engine registers with GuC.
  3. Defines tables of register lists that are global or
     engine class or engine instance in scope.
  4. Separates GuC log-buffer access locks for relay logging
     vs the new region for the error state capture data.
  5. Allocates an additional interim circular buffer store
     to copy snapshots of new GuC reported error-state-capture
     dumps in response to the G2H notification.
  6. Connects the i915_gpu_coredump reporting function
     to the GuC error capture module to print all GuC
     error state capture dumps that is reported.

This is the 3rd rev of this series. However, take note
that this series will not pass CI until the following series
is merged to upgrade the GuC firmware to a newer version
which requires Patch #1 of this series is dropped:
https://patchwork.kernel.org/project/intel-gfx/list/?series=599007

Prior receipts of rvb's:
  - Patch #4 has received R-v-b from Matthew Brost
    <matthew.brost@intel.com>

Changes from prior revs:
   v3:
      - Fixed all review comments from rev2 except the following:
          - Michal Wajdeczko proposed adding a seperate function
            to lookup register string nameslookup (based on offset)
            but decided against it because of offset conflicts
            and the current table layout is easier to maintain.
          - Last set of checkpatch errors pertaining to "COMPLEX
            MACROS" should be fixed on next rev.
      - Abstracted internal-to-guc-capture information into a new
        __guc_state_capture_priv structure that allows the exclusion
        of intel_guc.h and intel_guc_fwif.h from intel_guc_capture.h.
        Now, only the first 2 patches have a wider build time
        impact because of the changes to intel_guc_fwif.h but
        subsequent changes to guc-capture internal structures
        or firmware interfaces used solely by guc-capture module
        shoudn't impact the rest of the driver build.
      - Added missing Gen12LP registers and added slice+subslice
        indices when reporting extended steered registers.
      - Add additional checks to ensure that the GuC reported
        error capture information matches the i915_gpu_coredump
        that is being printed before we print out the corresponding
        VMA dumps such as the batch buffer.
   v2:
      - Ignore - failed CI retest.

Alan Previn (6):
  drm/i915/guc: Update GuC ADS size for error capture lists
  drm/i915/guc: Populate XE_LP register lists for GuC error state
    capture.
  drm/i915/guc: Add GuC's error state capture output structures.
  drm/i915/guc: Update GuC's log-buffer-state access for error capture.
  drm/i915/guc: Copy new GuC error capture logs upon G2H notification.
  drm/i915/guc: Print the GuC error capture output register list.

John Harrison (1):
  drm/i915/guc: Add basic support for error capture lists

 drivers/gpu/drm/i915/Makefile                 |    1 +
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |    4 +-
 .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  |    8 +
 drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h |   85 ++
 drivers/gpu/drm/i915/gt/uc/intel_guc.c        |   55 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |   15 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    |   32 +-
 .../gpu/drm/i915/gt/uc/intel_guc_capture.c    | 1274 +++++++++++++++++
 .../gpu/drm/i915/gt/uc/intel_guc_capture.h    |   30 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     |    3 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |   43 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c    |  162 ++-
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.h    |   23 +-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |   22 +
 drivers/gpu/drm/i915/i915_gpu_error.c         |   65 +-
 drivers/gpu/drm/i915/i915_gpu_error.h         |   14 +
 16 files changed, 1731 insertions(+), 105 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_capture.h

-- 
2.25.1

