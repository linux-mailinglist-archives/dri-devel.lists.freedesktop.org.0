Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B0149236C
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 11:02:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F91F10E253;
	Tue, 18 Jan 2022 10:02:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A05C010E253;
 Tue, 18 Jan 2022 10:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642500127; x=1674036127;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zUorI11pcCMoul9W2tYQelicK+pEekdX9lbFF0atcUs=;
 b=JVtOtT+VdW+Oty7xExtKEo3wdp28GgNiJS3s8XXKdb5DF73+sY7Lo5CR
 teUeYf3YxOUKuy8/8UvYthM357jMfWdI5N34LrU54/NZdxO4BAmA46DhH
 9e+Utc4yzOy5ogyfKA6ltot4lw7ugmhONcHDKHPfOeBPFqOogFreH3p+y
 Bd4mLCItIOdE7Hld1x96xyZPw6oylcaViawMzlm0uYD9nhjaM9tEwc6uL
 SH69ImUsH3h/j5ONRblZ0cuYCUxyCetr9/EYs4rjH7qOlH8AwXWS4yG+L
 ANUUnlVZLhdDsd2iPqu5ApL6UDuaYncYhddh6vF4l7ZCyZB363mLq5ONu w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10230"; a="244576579"
X-IronPort-AV: E=Sophos;i="5.88,297,1635231600"; d="scan'208";a="244576579"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2022 02:02:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,297,1635231600"; d="scan'208";a="615306429"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by FMSMGA003.fm.intel.com with ESMTP; 18 Jan 2022 02:02:06 -0800
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/7] Add GuC Error Capture Support
Date: Tue, 18 Jan 2022 02:03:51 -0800
Message-Id: <20220118100358.1329655-1-alan.previn.teres.alexis@intel.com>
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
  1. Enables support of GuC to execute error-
     state-capture based on a list of MMIO
     registers the driver registers and GuC will
     dump and report back right before a GuC
     triggered engine-reset event.
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

This is the 4th rev of this series with the first 3 revs
labelled as RFC.

Prior receipts of rvb's:
  - Patch #4 has received R-v-b from Matthew Brost
    <matthew.brost@intel.com>

Changes from prior revs:
  v4:
      - Rebased on latest drm-tip that has been merged with the
        support of GuC firmware version 69.0.3 that is required
        for GuC error-state-catpure to work.
      - Added register list for DG2 which is the same as XE_LP
        except an additional steering register set.
      - Fixed a bug in the end of capture parsing loop in
        intel_guc_capture_out_print_next_group that was not
        properly comparing the engine-instance and engine-
        class being parsed against the one that triggered
        the i915_gpu_coredump.
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

Alan Previn (7):
  drm/i915/guc: Update GuC ADS size for error capture lists
  drm/i915/guc: Add XE_LP registers for GuC error state capture.
  drm/i915/guc: Add DG2 registers for GuC error state capture.
  drm/i915/guc: Add GuC's error state capture output structures.
  drm/i915/guc: Update GuC's log-buffer-state access for error capture.
  drm/i915/guc: Copy new GuC error capture logs upon G2H notification.
  drm/i915/guc: Print the GuC error capture output register list.

 drivers/gpu/drm/i915/Makefile                 |    1 +
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |    4 +-
 .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  |    7 +
 drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h |   85 ++
 drivers/gpu/drm/i915/gt/uc/intel_guc.c        |   13 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |   13 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    |   36 +-
 .../gpu/drm/i915/gt/uc/intel_guc_capture.c    | 1310 +++++++++++++++++
 .../gpu/drm/i915/gt/uc/intel_guc_capture.h    |   30 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |   21 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c    |  155 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.h    |   20 +-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |   14 +-
 drivers/gpu/drm/i915/i915_gpu_error.c         |   65 +-
 drivers/gpu/drm/i915/i915_gpu_error.h         |   14 +
 15 files changed, 1669 insertions(+), 119 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_capture.h

-- 
2.25.1

