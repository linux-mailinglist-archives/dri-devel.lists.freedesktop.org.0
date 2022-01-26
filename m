Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5665449C7D2
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 11:46:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79FD110E81C;
	Wed, 26 Jan 2022 10:46:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7006D10E722;
 Wed, 26 Jan 2022 10:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643193982; x=1674729982;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Pj+Aci+kSp+zyKnuIzT7A407HOVFi3la+ielGUUDyAU=;
 b=SPRlN2qz9cOtTotAcFrnwzUeXGPczksgGIA28PE/MEgbZVDsmP+HrRRS
 M5hKpeBB3ocKn72/Pt7GHl6SvN2kOmtwff/0fX+u/DsFbx53vwYCHrikN
 pQNLD34Xt0cFyqu4mqUZj3JzCH0zva3qPWlDI4W2NH1eaR2QnjIIVUjtJ
 YASNEX+xvbxsDzposgrrCLlPIjRn+tr/cYgAi2kptsSKy2afI5O7fPsza
 HUu5jOQTV2+YF+Pny7jA+Ru3DqklvSp8BQe1CAnR5lmiTlGJutLqL7u+S
 p+DAPwcA/3INHk1urxboDsnKFPPiZlciW2JUf2nP3WTDUfzy1RzZSMO8e Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="246301869"
X-IronPort-AV: E=Sophos;i="5.88,317,1635231600"; d="scan'208";a="246301869"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 02:46:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,317,1635231600"; d="scan'208";a="477445957"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by orsmga003.jf.intel.com with ESMTP; 26 Jan 2022 02:46:21 -0800
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 00/10] Add GuC Error Capture Support
Date: Wed, 26 Jan 2022 02:48:12 -0800
Message-Id: <20220126104822.3653079-1-alan.previn.teres.alexis@intel.com>
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

This is the 5th rev of this series with the first 3 revs
labelled as RFC.

Prior receipts of rvb's:
  - Patch #5 has received R-v-b from Matthew Brost
    <matthew.brost@intel.com>

Changes from prior revs:
  v5: - Added Gen9->Gen11 register list for CI coverage that
        included Gen9 with GuC submission.
      - Redesigned the extraction of the GuC error-capture
        dumps by grouping them into complete per-engine-reset
        nodes. Complete here means each node includes the
        global, engine-class and engine-instance register
        lists in a single structure.
      - Extraction is decoupled from the print-out. We now
        do the extraction immediately when receiving the
        G2H for error-capture notification. A link list of
        nodes is maintained with a FIFO based threshold
        while awaiting retrieval from i915_gpu_coredump's
        capture_engine function.
      - Added new plumbing through the i915_gpu_coredump
        allocation and capture functions to include a flag
        that is used indicate that GuC had triggered the
        reset. This new plumbing guarantees an exact match
        from i915_gpu_coredump's per-engine vma recording
        and node-retrieval from the guc-error-capture.
      - Broke the coredump gt_global capture and recording
        functions into smaller subsets so we can reuse as
        much of the existing legacy register reading + printing
        functions and only rely on GuC error-capture for
        the smaller subset of registers that are tied to
        engine workload execution.
      - Updated the register list to follow the legacy execlist
        format of printout.
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


Alan Previn (10):
  drm/i915/guc: Update GuC ADS size for error capture lists
  drm/i915/guc: Add XE_LP registers for GuC error state capture.
  drm/i915/guc: Add DG2 registers for GuC error state capture.
  drm/i915/guc: Add Gen9 registers for GuC error state capture.
  drm/i915/guc: Add GuC's error state capture output structures.
  drm/i915/guc: Update GuC's log-buffer-state access for error capture.
  drm/i915/guc: Extract GuC error capture lists on G2H notification.
  drm/i915/guc: Plumb GuC-capture into gpu_coredump
  drm/i915/guc: Follow legacy register names
  drm/i915/guc: Print the GuC error capture output register list.

 drivers/gpu/drm/i915/Makefile                 |    1 +
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |    4 +-
 .../drm/i915/gt/intel_execlists_submission.c  |    4 +-
 drivers/gpu/drm/i915/gt/intel_reset.c         |    2 +-
 .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  |    7 +
 drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h |  121 ++
 drivers/gpu/drm/i915/gt/uc/intel_guc.c        |   13 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |   13 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    |   36 +-
 .../gpu/drm/i915/gt/uc/intel_guc_capture.c    | 1478 +++++++++++++++++
 .../gpu/drm/i915/gt/uc/intel_guc_capture.h    |   31 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |   21 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c    |  155 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.h    |   20 +-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |   16 +-
 drivers/gpu/drm/i915/i915_debugfs.c           |    3 +-
 drivers/gpu/drm/i915/i915_gpu_error.c         |  279 +++-
 drivers/gpu/drm/i915/i915_gpu_error.h         |   36 +-
 18 files changed, 2035 insertions(+), 205 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_capture.h

-- 
2.25.1

