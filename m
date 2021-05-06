Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94810375A8B
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 20:57:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 720FD6E50C;
	Thu,  6 May 2021 18:57:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30AFB6E50C;
 Thu,  6 May 2021 18:57:09 +0000 (UTC)
IronPort-SDR: i4NiH/9Z1GUcT/06yERvdkw2LXkCKLbtPSZHTu+XKGFs/Clua1TR4//iXLJIC7YFDPLMeNA+2M
 Hc3XtFlWtvug==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="196530977"
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="196530977"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:08 -0700
IronPort-SDR: pkcXm5woMO++mTaogyzQ81mfTSpcilC8M5LoN/+2lkN+8zLrMZZkHedmv1rro/y3Wssmlfe0nE
 StfjkffQCe4Q==
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="469583352"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:08 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 00/97] Basic GuC submission support in the i915
Date: Thu,  6 May 2021 12:13:14 -0700
Message-Id: <20210506191451.77768-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: matthew.brost@intel.com, tvrtko.ursulin@intel.com,
 daniele.ceraolospurio@intel.com, jason.ekstrand@intel.com,
 jon.bloomfield@intel.com, daniel.vetter@intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Basic GuC submission support. This is the first bullet point in the
upstreaming plan covered in the following RFC [1].

At a very high level the GuC is a piece of firmware which sits between
the i915 and the GPU. It offloads some of the scheduling of contexts
from the i915 and programs the GPU to submit contexts. The i915
communicates with the GuC and the GuC communicates with the GPU.

GuC submission will be disabled by default on all current upstream
platforms behind a module parameter - enable_guc. A value of 3 will
enable submission and HuC loading via the GuC. GuC submission should
work on all gen11+ platforms assuming the GuC firmware is present.

This is a huge series and it is completely unrealistic to merge all of
these patches at once. Fortunately I believe we can break down the
series into different merges:

1. Merge Chris Wilson's patches. These have already been reviewed
upstream and I fully agree with these patches as a precursor to GuC
submission.

2. Update to GuC 60.1.2. These are largely Michal's patches.

3. Turn on GuC/HuC auto mode by default.

4. Additional patches needed to support GuC submission. This is any
patch not covered by 1-3 in the first 34 patches. e.g. 'Engine relative
MMIO'

5. GuC submission support. Patches number 35+. These all don't have to
merge at once though as we don't actually allow GuC submission until the
last patch of this series.

[1] https://patchwork.freedesktop.org/patch/432206/?series=89840&rev=1

Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Chris Wilson (3):
  drm/i915/gt: Move engine setup out of set_default_submission
  drm/i915/gt: Move submission_method into intel_gt
  drm/i915/gt: Move CS interrupt handler to the backend

Daniele Ceraolo Spurio (6):
  drm/i915/guc: skip disabling CTBs before sanitizing the GuC
  drm/i915/guc: use probe_error log for CT enablement failure
  drm/i915/guc: enable only the user interrupt when using GuC submission
  drm/i915/uc: turn on GuC/HuC auto mode by default
  drm/i915/guc: Use guc_class instead of engine_class in fw interface
  drm/i915/guc: Unblock GuC submission on Gen11+

John Harrison (13):
  drm/i915/guc: Support per context scheduling policies
  drm/i915/guc: Update firmware to v60.1.2
  drm/i915: Engine relative MMIO
  drm/i915/guc: Module load failure test for CT buffer creation
  drm/i915: Track 'serial' counts for virtual engines
  drm/i915/guc: Provide mmio list to be saved/restored on engine reset
  drm/i915/guc: Don't complain about reset races
  drm/i915/guc: Enable GuC engine reset
  drm/i915/guc: Fix for error capture after full GPU reset with GuC
  drm/i915/guc: Hook GuC scheduling policies up
  drm/i915/guc: Connect reset modparam updates to GuC policy flags
  drm/i915/guc: Include scheduling policies in the debugfs state dump
  drm/i915/guc: Add golden context to GuC ADS

Matthew Brost (53):
  drm/i915: Introduce i915_sched_engine object
  drm/i915/guc: Improve error message for unsolicited CT response
  drm/i915/guc: Add non blocking CTB send function
  drm/i915/guc: Add stall timer to non blocking CTB send function
  drm/i915/guc: Optimize CTB writes and reads
  drm/i915/guc: Increase size of CTB buffers
  drm/i915/guc: Add new GuC interface defines and structures
  drm/i915/guc: Remove GuC stage descriptor, add lrc descriptor
  drm/i915/guc: Add lrc descriptor context lookup array
  drm/i915/guc: Implement GuC submission tasklet
  drm/i915/guc: Add bypass tasklet submission path to GuC
  drm/i915/guc: Implement GuC context operations for new inteface
  drm/i915/guc: Insert fence on context when deregistering
  drm/i915/guc: Defer context unpin until scheduling is disabled
  drm/i915/guc: Disable engine barriers with GuC during unpin
  drm/i915/guc: Extend deregistration fence to schedule disable
  drm/i915: Disable preempt busywait when using GuC scheduling
  drm/i915/guc: Ensure request ordering via completion fences
  drm/i915/guc: Disable semaphores when using GuC scheduling
  drm/i915/guc: Ensure G2H response has space in buffer
  drm/i915/guc: Update intel_gt_wait_for_idle to work with GuC
  drm/i915/guc: Update GuC debugfs to support new GuC
  drm/i915/guc: Add several request trace points
  drm/i915: Add intel_context tracing
  drm/i915/guc: GuC virtual engines
  drm/i915: Hold reference to intel_context over life of i915_request
  drm/i915/guc: Disable bonding extension with GuC submission
  drm/i915/guc: Direct all breadcrumbs for a class to single breadcrumbs
  drm/i915/guc: Reset implementation for new GuC interface
  drm/i915: Reset GPU immediately if submission is disabled
  drm/i915/guc: Add disable interrupts to guc sanitize
  drm/i915/guc: Suspend/resume implementation for new interface
  drm/i915/guc: Handle context reset notification
  drm/i915/guc: Handle engine reset failure notification
  drm/i915/guc: Enable the timer expired interrupt for GuC
  drm/i915/guc: Capture error state on context reset
  drm/i915/guc: Don't call ring_is_idle in GuC submission
  drm/i915/guc: Implement banned contexts for GuC submission
  drm/i915/guc: Allow flexible number of context ids
  drm/i915/guc: Connect the number of guc_ids to debugfs
  drm/i915/guc: Don't return -EAGAIN to user when guc_ids exhausted
  drm/i915/guc: Don't allow requests not ready to consume all guc_ids
  drm/i915/guc: Introduce guc_submit_engine object
  drm/i915/guc: Implement GuC priority management
  drm/i915/guc: Support request cancellation
  drm/i915/guc: Check return of __xa_store when registering a context
  drm/i915/guc: Non-static lrc descriptor registration buffer
  drm/i915/guc: Take GT PM ref when deregistering context
  drm/i915: Add GT PM delayed worker
  drm/i915/guc: Take engine PM when a context is pinned with GuC
    submission
  drm/i915/guc: Don't call switch_to_kernel_context with GuC submission
  drm/i915/guc: Selftest for GuC flow control
  drm/i915/guc: Update GuC documentation

Michal Wajdeczko (21):
  drm/i915/guc: Keep strict GuC ABI definitions
  drm/i915/guc: Stop using fence/status from CTB descriptor
  drm/i915: Promote ptrdiff() to i915_utils.h
  drm/i915/guc: Only rely on own CTB size
  drm/i915/guc: Don't repeat CTB layout calculations
  drm/i915/guc: Replace CTB array with explicit members
  drm/i915/guc: Update sizes of CTB buffers
  drm/i915/guc: Relax CTB response timeout
  drm/i915/guc: Start protecting access to CTB descriptors
  drm/i915/guc: Stop using mutex while sending CTB messages
  drm/i915/guc: Don't receive all G2H messages in irq handler
  drm/i915/guc: Always copy CT message to new allocation
  drm/i915/guc: Introduce unified HXG messages
  drm/i915/guc: Update MMIO based communication
  drm/i915/guc: Update CTB response status
  drm/i915/guc: Add flag for mark broken CTB
  drm/i915/guc: New definition of the CTB descriptor
  drm/i915/guc: New definition of the CTB registration action
  drm/i915/guc: New CTB based communication
  drm/i915/guc: Kill guc_clients.ct_pool
  drm/i915/guc: Early initialization of GuC send registers

Rodrigo Vivi (1):
  drm/i915/guc: Remove sample_forcewake h2g action

 drivers/gpu/drm/i915/Makefile                 |    2 +
 drivers/gpu/drm/i915/gem/i915_gem_context.c   |   39 +-
 drivers/gpu/drm/i915/gem/i915_gem_context.h   |    1 +
 drivers/gpu/drm/i915/gem/i915_gem_mman.c      |    3 +-
 drivers/gpu/drm/i915/gem/i915_gem_wait.c      |    4 +-
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c      |    6 +-
 drivers/gpu/drm/i915/gt/intel_breadcrumbs.c   |   44 +-
 drivers/gpu/drm/i915/gt/intel_breadcrumbs.h   |   14 +-
 .../gpu/drm/i915/gt/intel_breadcrumbs_types.h |    7 +
 drivers/gpu/drm/i915/gt/intel_context.c       |   50 +-
 drivers/gpu/drm/i915/gt/intel_context.h       |   45 +-
 drivers/gpu/drm/i915/gt/intel_context_types.h |   76 +-
 drivers/gpu/drm/i915/gt/intel_engine.h        |   96 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  320 +-
 .../gpu/drm/i915/gt/intel_engine_heartbeat.c  |   75 +-
 .../gpu/drm/i915/gt/intel_engine_heartbeat.h  |    4 +
 drivers/gpu/drm/i915/gt/intel_engine_pm.c     |   14 +-
 drivers/gpu/drm/i915/gt/intel_engine_pm.h     |    5 +
 drivers/gpu/drm/i915/gt/intel_engine_types.h  |   71 +-
 drivers/gpu/drm/i915/gt/intel_engine_user.c   |    6 +-
 .../drm/i915/gt/intel_execlists_submission.c  |  693 +--
 .../drm/i915/gt/intel_execlists_submission.h  |   14 -
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h  |    5 +
 drivers/gpu/drm/i915/gt/intel_gt.c            |   23 +
 drivers/gpu/drm/i915/gt/intel_gt.h            |    2 +
 drivers/gpu/drm/i915/gt/intel_gt_irq.c        |  100 +-
 drivers/gpu/drm/i915/gt/intel_gt_irq.h        |   23 +
 drivers/gpu/drm/i915/gt/intel_gt_pm.c         |   14 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm.h         |   13 +
 .../drm/i915/gt/intel_gt_pm_delayed_work.c    |   35 +
 .../drm/i915/gt/intel_gt_pm_delayed_work.h    |   24 +
 drivers/gpu/drm/i915/gt/intel_gt_requests.c   |   23 +-
 drivers/gpu/drm/i915/gt/intel_gt_requests.h   |    7 +-
 drivers/gpu/drm/i915/gt/intel_gt_types.h      |   10 +
 drivers/gpu/drm/i915/gt/intel_lrc_reg.h       |    1 -
 drivers/gpu/drm/i915/gt/intel_reset.c         |   58 +-
 .../gpu/drm/i915/gt/intel_ring_submission.c   |   73 +-
 drivers/gpu/drm/i915/gt/intel_rps.c           |    6 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c   |   46 +-
 .../gpu/drm/i915/gt/intel_workarounds_types.h |    1 +
 drivers/gpu/drm/i915/gt/mock_engine.c         |   58 +-
 drivers/gpu/drm/i915/gt/selftest_context.c    |   10 +
 drivers/gpu/drm/i915/gt/selftest_execlists.c  |   58 +-
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c  |    6 +-
 drivers/gpu/drm/i915/gt/selftest_lrc.c        |    6 +-
 drivers/gpu/drm/i915/gt/selftest_reset.c      |    2 +-
 .../drm/i915/gt/selftest_ring_submission.c    |    2 +-
 .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  |  177 +
 .../gt/uc/abi/guc_communication_ctb_abi.h     |  192 +
 .../gt/uc/abi/guc_communication_mmio_abi.h    |   35 +
 .../gpu/drm/i915/gt/uc/abi/guc_errors_abi.h   |   13 +
 .../gpu/drm/i915/gt/uc/abi/guc_messages_abi.h |  247 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.c        |  194 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  131 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    |  484 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.h    |    3 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     | 1088 +++--
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h     |   49 +-
 .../gpu/drm/i915/gt/uc/intel_guc_debugfs.c    |   56 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |  377 +-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 4037 +++++++++++++++--
 .../gpu/drm/i915/gt/uc/intel_guc_submission.h |   20 +-
 .../i915/gt/uc/intel_guc_submission_types.h   |   55 +
 drivers/gpu/drm/i915/gt/uc/intel_uc.c         |  116 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.h         |   11 +
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      |   25 +-
 .../i915/gt/uc/selftest_guc_flow_control.c    |  589 +++
 drivers/gpu/drm/i915/i915_active.c            |    3 +
 drivers/gpu/drm/i915/i915_debugfs.c           |    8 +-
 drivers/gpu/drm/i915/i915_debugfs_params.c    |   31 +
 drivers/gpu/drm/i915/i915_drv.h               |    2 +-
 drivers/gpu/drm/i915/i915_gem_evict.c         |    1 +
 drivers/gpu/drm/i915/i915_gpu_error.c         |   28 +-
 drivers/gpu/drm/i915/i915_irq.c               |   10 +-
 drivers/gpu/drm/i915/i915_params.h            |    2 +-
 drivers/gpu/drm/i915/i915_perf.c              |   16 +-
 drivers/gpu/drm/i915/i915_reg.h               |    2 +
 drivers/gpu/drm/i915/i915_request.c           |  218 +-
 drivers/gpu/drm/i915/i915_request.h           |   37 +-
 drivers/gpu/drm/i915/i915_scheduler.c         |  188 +-
 drivers/gpu/drm/i915/i915_scheduler.h         |   74 +-
 drivers/gpu/drm/i915/i915_scheduler_types.h   |   74 +
 drivers/gpu/drm/i915/i915_trace.h             |  219 +-
 drivers/gpu/drm/i915/i915_utils.h             |    5 +
 drivers/gpu/drm/i915/i915_vma.h               |    5 -
 drivers/gpu/drm/i915/intel_wakeref.c          |    5 +
 drivers/gpu/drm/i915/intel_wakeref.h          |    1 +
 .../drm/i915/selftests/i915_live_selftests.h  |    1 +
 .../gpu/drm/i915/selftests/igt_live_test.c    |    2 +-
 .../i915/selftests/intel_scheduler_helpers.c  |  101 +
 .../i915/selftests/intel_scheduler_helpers.h  |   37 +
 .../gpu/drm/i915/selftests/mock_gem_device.c  |    3 +-
 include/uapi/drm/i915_drm.h                   |    9 +
 93 files changed, 8954 insertions(+), 2222 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_pm_delayed_work.c
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_pm_delayed_work.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/abi/guc_communication_mmio_abi.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/abi/guc_messages_abi.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_submission_types.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/selftest_guc_flow_control.c
 create mode 100644 drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c
 create mode 100644 drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.h

-- 
2.28.0

