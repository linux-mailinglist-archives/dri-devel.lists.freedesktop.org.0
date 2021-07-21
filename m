Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC533D191E
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 23:33:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62E746E99D;
	Wed, 21 Jul 2021 21:33:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21CBF6E2D1;
 Wed, 21 Jul 2021 21:33:12 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10052"; a="198724327"
X-IronPort-AV: E=Sophos;i="5.84,258,1620716400"; d="scan'208";a="198724327"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2021 14:33:11 -0700
X-IronPort-AV: E=Sophos;i="5.84,258,1620716400"; d="scan'208";a="470296661"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2021 14:33:11 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 00/18] Series to merge a subset of GuC submission
Date: Wed, 21 Jul 2021 14:50:43 -0700
Message-Id: <20210721215101.139794-1-matthew.brost@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The first 18 patches [1] are basically ready to merge.

v2: Address NITs, add missing RBs, fix checkpatch warnings

Signed-off-by: Matthew Brost <matthew.brost@intel.com>

[1] https://patchwork.freedesktop.org/series/91840/


Matthew Brost (18):
  drm/i915/guc: Add new GuC interface defines and structures
  drm/i915/guc: Remove GuC stage descriptor, add LRC descriptor
  drm/i915/guc: Add LRC descriptor context lookup array
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
  drm/i915/guc: Add trace point for GuC submit
  drm/i915: Add intel_context tracing

 drivers/gpu/drm/i915/gem/i915_gem_context.c   |    6 +-
 drivers/gpu/drm/i915/gem/i915_gem_mman.c      |    3 +-
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c      |    6 +-
 drivers/gpu/drm/i915/gt/intel_context.c       |   18 +-
 drivers/gpu/drm/i915/gt/intel_context.h       |   27 +-
 drivers/gpu/drm/i915/gt/intel_context_types.h |   32 +
 drivers/gpu/drm/i915/gt/intel_gt.c            |   19 +
 drivers/gpu/drm/i915/gt/intel_gt.h            |    2 +
 drivers/gpu/drm/i915/gt/intel_gt_requests.c   |   21 +-
 drivers/gpu/drm/i915/gt/intel_gt_requests.h   |    9 +-
 drivers/gpu/drm/i915/gt/intel_lrc_reg.h       |    1 -
 drivers/gpu/drm/i915/gt/selftest_context.c    |   10 +
 .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  |   14 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |   72 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     |  124 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h     |   18 +-
 .../gpu/drm/i915/gt/uc/intel_guc_debugfs.c    |   23 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |   89 +-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 1290 ++++++++++++++---
 .../gpu/drm/i915/gt/uc/intel_guc_submission.h |    5 +
 drivers/gpu/drm/i915/gt/uc/intel_uc.h         |    5 +
 drivers/gpu/drm/i915/i915_gem_evict.c         |    1 +
 drivers/gpu/drm/i915/i915_reg.h               |    1 +
 drivers/gpu/drm/i915/i915_request.c           |   11 +-
 drivers/gpu/drm/i915/i915_request.h           |    8 +
 drivers/gpu/drm/i915/i915_trace.h             |  168 ++-
 .../gpu/drm/i915/selftests/igt_live_test.c    |    2 +-
 .../gpu/drm/i915/selftests/mock_gem_device.c  |    3 +-
 28 files changed, 1707 insertions(+), 281 deletions(-)

-- 
2.28.0

