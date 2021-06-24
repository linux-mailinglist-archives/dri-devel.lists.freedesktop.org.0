Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9933B279A
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 08:47:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B79206EA03;
	Thu, 24 Jun 2021 06:47:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAA886E9F4;
 Thu, 24 Jun 2021 06:47:28 +0000 (UTC)
IronPort-SDR: vvn9VsBFCBtiuYmGLBQlTiWl9dac88zgJSADRT8i/64ZBnfhL96hoW4CftTfsiGogxmqhyxP7y
 g1GBX8/Wcs2g==
X-IronPort-AV: E=McAfee;i="6200,9189,10024"; a="207346739"
X-IronPort-AV: E=Sophos;i="5.83,295,1616482800"; d="scan'208";a="207346739"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 23:47:25 -0700
IronPort-SDR: 8KcXu10PR6X3ouJrOfw/c0LFL+xL19f5hlOtiBWSCE+2yfnw5uuJbvJK+oRuTtf7rPGj6NP8FE
 dfXZMXmgyK9g==
X-IronPort-AV: E=Sophos;i="5.83,295,1616482800"; d="scan'208";a="556390866"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 23:47:24 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 00/47] GuC submission support
Date: Thu, 24 Jun 2021 00:04:29 -0700
Message-Id: <20210624070516.21893-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
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
Cc: daniele.ceraolospurio@intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As discussed in [1], [2] we are enabling GuC submission support in the
i915. This is a subset of the patches in step 5 described in [1],
basically it is absolute to enable CI with GuC submission on gen11+
platforms.

This series itself will likely be broken down into smaller patch sets to
merge. Likely into CTBs changes, basic submission, virtual engines, and
resets.

A following series will address the missing patches remaining from [1].

Locally tested on TGL machine and basic tests seem to be passing.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>

[1] https://patchwork.freedesktop.org/series/89844/
[2] https://patchwork.freedesktop.org/series/91417/

Daniele Ceraolo Spurio (1):
  drm/i915/guc: Unblock GuC submission on Gen11+

John Harrison (10):
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

Matthew Brost (36):
  drm/i915/guc: Relax CTB response timeout
  drm/i915/guc: Improve error message for unsolicited CT response
  drm/i915/guc: Increase size of CTB buffers
  drm/i915/guc: Add non blocking CTB send function
  drm/i915/guc: Add stall timer to non blocking CTB send function
  drm/i915/guc: Optimize CTB writes and reads
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

 drivers/gpu/drm/i915/gem/i915_gem_context.c   |   30 +-
 drivers/gpu/drm/i915/gem/i915_gem_context.h   |    1 +
 drivers/gpu/drm/i915/gem/i915_gem_mman.c      |    3 +-
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c      |    6 +-
 drivers/gpu/drm/i915/gt/intel_breadcrumbs.c   |   41 +-
 drivers/gpu/drm/i915/gt/intel_breadcrumbs.h   |   14 +-
 .../gpu/drm/i915/gt/intel_breadcrumbs_types.h |    7 +
 drivers/gpu/drm/i915/gt/intel_context.c       |   41 +-
 drivers/gpu/drm/i915/gt/intel_context.h       |   31 +-
 drivers/gpu/drm/i915/gt/intel_context_types.h |   49 +
 drivers/gpu/drm/i915/gt/intel_engine.h        |   72 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  182 +-
 .../gpu/drm/i915/gt/intel_engine_heartbeat.c  |   71 +-
 .../gpu/drm/i915/gt/intel_engine_heartbeat.h  |    4 +
 drivers/gpu/drm/i915/gt/intel_engine_types.h  |   12 +-
 .../drm/i915/gt/intel_execlists_submission.c  |  234 +-
 .../drm/i915/gt/intel_execlists_submission.h  |   11 -
 drivers/gpu/drm/i915/gt/intel_gt.c            |   21 +
 drivers/gpu/drm/i915/gt/intel_gt.h            |    2 +
 drivers/gpu/drm/i915/gt/intel_gt_pm.c         |    6 +-
 drivers/gpu/drm/i915/gt/intel_gt_requests.c   |   22 +-
 drivers/gpu/drm/i915/gt/intel_gt_requests.h   |    9 +-
 drivers/gpu/drm/i915/gt/intel_lrc_reg.h       |    1 -
 drivers/gpu/drm/i915/gt/intel_reset.c         |   20 +-
 .../gpu/drm/i915/gt/intel_ring_submission.c   |   28 +
 drivers/gpu/drm/i915/gt/intel_rps.c           |    4 +
 drivers/gpu/drm/i915/gt/intel_workarounds.c   |   46 +-
 .../gpu/drm/i915/gt/intel_workarounds_types.h |    1 +
 drivers/gpu/drm/i915/gt/mock_engine.c         |   41 +-
 drivers/gpu/drm/i915/gt/selftest_context.c    |   10 +
 drivers/gpu/drm/i915/gt/selftest_execlists.c  |   20 +-
 .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  |   15 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.c        |   82 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  106 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    |  460 +++-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.h    |    3 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     |  318 ++-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h     |   22 +-
 .../gpu/drm/i915/gt/uc/intel_guc_debugfs.c    |   25 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |   88 +-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 2197 +++++++++++++++--
 .../gpu/drm/i915/gt/uc/intel_guc_submission.h |   17 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c         |  102 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.h         |   11 +
 drivers/gpu/drm/i915/i915_debugfs.c           |    2 +
 drivers/gpu/drm/i915/i915_debugfs_params.c    |   31 +
 drivers/gpu/drm/i915/i915_gem_evict.c         |    1 +
 drivers/gpu/drm/i915/i915_gpu_error.c         |   25 +-
 drivers/gpu/drm/i915/i915_reg.h               |    2 +
 drivers/gpu/drm/i915/i915_request.c           |  159 +-
 drivers/gpu/drm/i915/i915_request.h           |   21 +
 drivers/gpu/drm/i915/i915_scheduler.c         |    6 +
 drivers/gpu/drm/i915/i915_scheduler.h         |    6 +
 drivers/gpu/drm/i915/i915_scheduler_types.h   |    5 +
 drivers/gpu/drm/i915/i915_trace.h             |  197 +-
 .../gpu/drm/i915/selftests/igt_live_test.c    |    2 +-
 .../gpu/drm/i915/selftests/mock_gem_device.c  |    3 +-
 57 files changed, 4159 insertions(+), 787 deletions(-)

-- 
2.28.0

