Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F213A8A50
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jun 2021 22:41:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D60C76E491;
	Tue, 15 Jun 2021 20:41:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB69189DC9;
 Tue, 15 Jun 2021 20:41:13 +0000 (UTC)
IronPort-SDR: d7wbL2Ra2lzB8DaQll4/4i7xpntLEVfG5kb9bZpvLl8Ptx0CVOwwvIz4SOVWSw0424MqIpKtPC
 Fbf9GSy8AL2A==
X-IronPort-AV: E=McAfee;i="6200,9189,10016"; a="291697016"
X-IronPort-AV: E=Sophos;i="5.83,276,1616482800"; d="scan'208";a="291697016"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2021 13:41:13 -0700
IronPort-SDR: 5ehwYa7Dr7RGsWVW1mBVJqBkHsLL9LW91WI37G7S3ymc1Aughj7Yu986Nxb33s69u0mnSp7uSk
 9bdu1UKnrhlQ==
X-IronPort-AV: E=Sophos;i="5.83,276,1616482800"; d="scan'208";a="484603192"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2021 13:41:11 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/8] Introduce i915_sched_engine object
Date: Tue, 15 Jun 2021 13:58:52 -0700
Message-Id: <20210615205900.26578-1-matthew.brost@intel.com>
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
Cc: daniele.ceraolospurio@intel.com, john.c.harrison@intel.com,
 Michal.Wajdeczko@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As discussed in [1] we are breaking that large series into a several
smaller ones. This series is stand alone patch part of step #4 which has
no other dependencies or patches relevant to it.

v2:
 (Daniel Vetter):
  - Split into several smaller patches
  - Add kernel doc for i915_sched_engine
 (Matthew Brost):
  - Drop wrapper functions for tasklet as eventually tasklet will be
    dropped 

v3:
 (Jason Ekstrand)
  - Address his comments, change logs in individual patches
  - Squash documentation patch into previous patches as needed
 (Checkpatch)
  - Fix warnings
 (Docs)
  - Fix warnings

v4:
 (Daniele)
  - Update a comments / commit messages
  - Set queue_priority_hint

Signed-off-by: Matthew Brost <matthew.brost@intel.com>

[1] https://patchwork.freedesktop.org/series/89844/

Matthew Brost (8):
  drm/i915: Move priolist to new i915_sched_engine object
  drm/i915: Add i915_sched_engine_is_empty function
  drm/i915: Reset sched_engine.no_priolist immediately after dequeue
  drm/i915: Move active tracking to i915_sched_engine
  drm/i915: Move engine->schedule to i915_sched_engine
  drm/i915: Add kick_backend function to i915_sched_engine
  drm/i915: Update i915_scheduler to operate on i915_sched_engine
  drm/i915: Move submission tasklet to i915_sched_engine

 Documentation/gpu/i915.rst                    |   5 +
 drivers/gpu/drm/i915/gem/i915_gem_wait.c      |   4 +-
 drivers/gpu/drm/i915/gt/intel_engine.h        |  16 -
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  72 ++--
 .../gpu/drm/i915/gt/intel_engine_heartbeat.c  |   4 +-
 drivers/gpu/drm/i915/gt/intel_engine_pm.c     |   4 +-
 drivers/gpu/drm/i915/gt/intel_engine_types.h  |  49 +--
 drivers/gpu/drm/i915/gt/intel_engine_user.c   |   2 +-
 .../drm/i915/gt/intel_execlists_submission.c  | 325 +++++++++++-------
 .../gpu/drm/i915/gt/intel_ring_submission.c   |  12 +-
 drivers/gpu/drm/i915/gt/mock_engine.c         |  17 +-
 drivers/gpu/drm/i915/gt/selftest_execlists.c  |  36 +-
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c  |   6 +-
 drivers/gpu/drm/i915/gt/selftest_lrc.c        |   6 +-
 drivers/gpu/drm/i915/gt/selftest_reset.c      |   2 +-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  70 ++--
 drivers/gpu/drm/i915/i915_gpu_error.c         |   4 +-
 drivers/gpu/drm/i915/i915_request.c           |  42 +--
 drivers/gpu/drm/i915/i915_request.h           |   2 +-
 drivers/gpu/drm/i915/i915_scheduler.c         | 168 +++++----
 drivers/gpu/drm/i915/i915_scheduler.h         |  47 ++-
 drivers/gpu/drm/i915/i915_scheduler_types.h   |  89 +++++
 22 files changed, 557 insertions(+), 425 deletions(-)

-- 
2.28.0

