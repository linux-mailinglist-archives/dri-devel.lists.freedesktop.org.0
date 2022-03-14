Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1599C4D8A6A
	for <lists+dri-devel@lfdr.de>; Mon, 14 Mar 2022 18:07:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FA0210E670;
	Mon, 14 Mar 2022 17:07:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A7DB10E346;
 Mon, 14 Mar 2022 17:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647277648; x=1678813648;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uM8DEwD+N/6uz9SN1pEC1kv0IlEixv130YK3065ay6Y=;
 b=LRXUjwH5nfYliTjvP0RwT9PPBcnzRRzgc/IvHwTtxVxypU8C9Qjyx5Qj
 qHeMqWU0Uek76MFb9Ms5ZgdEFa4ISu2/Vymw8QTZUo3qnBb53VbiadAet
 6rNfHmSAgYi/XVAXI8C91p/YZTeDThOkrOgo02Q3v0URpAIh8VvsITiS8
 r3TFu97sUQYvvjPLFhcBvlGPU+EuLK+CNvnVwCz+qUl7XQ2KOSn7LLEl4
 C4XBB5O2hQNHr3wWiJRUkmZlmgCnxtWwqv3EbDgw/e9YAvX9Rvq1nOnZN
 gMIlbCHxXeH/bs0EDjEqUYrRN2Vx2EVO3fjvLBViRKBDQNSvgF+AfZDEV A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10285"; a="243536030"
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; d="scan'208";a="243536030"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2022 10:07:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; d="scan'208";a="597977038"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by fmsmga008.fm.intel.com with ESMTP; 14 Mar 2022 10:07:26 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v9 00/13] Add GuC Error Capture Support
Date: Mon, 14 Mar 2022 10:09:41 -0700
Message-Id: <20220314170954.1537154-1-alan.previn.teres.alexis@intel.com>
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
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 John Harrison <john.c.harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series:
  1. Enables support of GuC to report error-state-capture
     using a list of MMIO registers the driver registers
     and GuC will dump, log and notify right before a GuC
     triggered engine-reset event.
  2. Updates the ADS blob creation to register said lists
     of global, engine class and engine instance registers
     with GuC.
  3. Defines tables of register lists that are global or
     engine class or engine instance in scope.
  4. Updates usage and buffer-state data for the regions
     of the shared GuC log-buffer to accomdate both
     the existing relay logging of general debug logs
     along with the new error state capture usage.
  5. Using a pool of preallocated memory, provide ability
     to extract and format the GuC reported register-capture
     data into chunks consistent with existing i915 error-
     state collection flows and structures.
  6. Connects the i915_gpu_coredump reporting function
     to the GuC error capture module to print all GuC
     error state capture dumps that is reported.

This is the 8th rev of this series with the first 3 revs
labelled as RFC.

Prior receipts of rvb's:
  - Patch #2, #3, #4, #5, #10, #11, #12, #13 have received
    R-v-b's from Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
  - Patch #6, #7, #8, #9 has received an R-v-b from Matthew Brost
    <matthew.brost@intel.com>. NOTE: some of these came in on the
    trybot series. https://patchwork.freedesktop.org/series/100831/

Changes from prior revs:
  v9: - Rebase on latest drm-tip to solve CI merge-build error.
  v8: - Fix a bug found by CI in rev7: Create a cached ADS
        capture list for null-header like the other lists.
      - Fixed a bug on the ggtt offset calculation in the
        ADS population loop. Thanks to Matt Brost.
      - Change the storage uses for initial allocation and
        caching of the ADS register lists so we only store
        a regular pointer instead of file handle.
      - Multiple improvements on code styling, variable names,
        comments and code reduction from Umesh suggestions
        across multiple patches.

  v7: - Rebased on lastest drm_tip that has the ADS now using
        shmem based ads_blob_write utilities. Stress test
        was performed with this patch included to fix a
        legacy bug:
        https://patchwork.freedesktop.org/series/100768/

  v6: - In patch #1, ADS reg-list population, we now alloc
        regular memory to create the lists and cache them for
        simpler and faster use by GuC ADS module at init, 
        suspend-resume and reset cycles. This was in response
        to review comments from Lucas De Marchi that also
        wanted to ensure the GuC ADS module owns the final
        copying into the ADS phyical memory.
      - Thanks to Jani Nikula for pointing out that patch #2
        and #3 should ensure static tables as constant and
        dynamic lists should be allocated and cached but
        attached to the GT level for the case of multiple
        cards with different fusings for steered registers.
        These are addressed now along with multiple code
        style fixups (thanks to review comment from Umesh)
        and splitting the steered register list generation
        as a seperate patch.
      - The extraction functionality, Patch #10 and #11 (was
        patch #7), has fixed all of Umesh's review comments
        related to the code styling. Additionally, it was
        discovered during stress tests that the extraction
        function could be called by the ct processing thread
        at the same time as the start of a GT reset event.
        Thus, a redesign was done whereby the linked list of
        processed capture-output-nodes are allocated up
        front and reused throughout the driver's life to
        ensure no memory locks are taken during extraction.
      - For patch #6 (now 7, 8 and 9), updates to
        intel_guc_log was split into smaller chunks and the
        log_state structure was returned back to inside of
        the intel_guc_log struct as opposed to the
        intel_guc struct in prior rev. This is in response
        to review comments by Matt Brost.
      - #Patch 13 (previously #10) is mostly identical but
        addresses all of the code styling comments reviews
        from Umesh.
        
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

Alan Previn (13):
  drm/i915/guc: Update GuC ADS size for error capture lists
  drm/i915/guc: Add XE_LP static registers for GuC error capture.
  drm/i915/guc: Add XE_LP steered register lists support
  drm/i915/guc: Add DG2 registers for GuC error state capture.
  drm/i915/guc: Add Gen9 registers for GuC error state capture.
  drm/i915/guc: Add GuC's error state capture output structures.
  drm/i915/guc: Update GuC-log relay function names
  drm/i915/guc: Add capture region into intel_guc_log
  drm/i915/guc: Check sizing of guc_capture output
  drm/i915/guc: Extract GuC error capture lists on G2H notification.
  drm/i915/guc: Pre-allocate output nodes for extraction
  drm/i915/guc: Plumb GuC-capture into gpu_coredump
  drm/i915/guc: Print the GuC error capture output register list.

 drivers/gpu/drm/i915/Makefile                 |    1 +
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |    4 +-
 .../drm/i915/gt/intel_execlists_submission.c  |    4 +-
 drivers/gpu/drm/i915/gt/intel_reset.c         |    2 +-
 .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  |    7 +
 drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h |  218 +++
 drivers/gpu/drm/i915/gt/uc/intel_guc.c        |   13 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |   12 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    |  125 +-
 .../gpu/drm/i915/gt/uc/intel_guc_capture.c    | 1655 +++++++++++++++++
 .../gpu/drm/i915/gt/uc/intel_guc_capture.h    |   33 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |   12 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c    |  126 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.h    |    7 +-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |   18 +-
 drivers/gpu/drm/i915/i915_debugfs.c           |    3 +-
 drivers/gpu/drm/i915/i915_gpu_error.c         |  282 ++-
 drivers/gpu/drm/i915/i915_gpu_error.h         |   35 +-
 18 files changed, 2376 insertions(+), 181 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_capture.h

-- 
2.25.1

