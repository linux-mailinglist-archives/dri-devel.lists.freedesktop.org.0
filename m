Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED95C39AC46
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 23:09:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66C146EE92;
	Thu,  3 Jun 2021 21:09:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7BA26EADD;
 Thu,  3 Jun 2021 21:09:36 +0000 (UTC)
IronPort-SDR: hLuvdEZ3SoXci6HFwpZj1vReoWv+/5xSCtn52SGTLEStoVuphKl8lFzRVpzwZyf6BxsajIVqLq
 7XZzLzBS2KGQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10004"; a="203966007"
X-IronPort-AV: E=Sophos;i="5.83,246,1616482800"; d="scan'208";a="203966007"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2021 14:09:34 -0700
IronPort-SDR: HWBfmJvYNBx/modDTQ4pjPLgVb9NrIOIkNnOMP+38UjnKPvzB40XuV0MZ2Y0JubWOAao7fzLUo
 T0XE4CMG7gog==
X-IronPort-AV: E=Sophos;i="5.83,246,1616482800"; d="scan'208";a="448015256"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2021 14:09:34 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/9] Introduce i915_sched_engine object
Date: Thu,  3 Jun 2021 14:27:13 -0700
Message-Id: <20210603212722.59719-1-matthew.brost@intel.com>
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
Cc: daniel.vetter@intel.com, daniele.ceraolospurio@intel.com
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

Signed-off-by: Matthew Brost <matthew.brost@intel.com>

[1] https://patchwork.freedesktop.org/series/89844/

Matthew Brost (9):
  drm/i915: Move priolist to new i915_sched_engine object
  drm/i915: Add i915_sched_engine_is_empty function
  drm/i915: Add i915_sched_engine_reset_on_empty function
  drm/i915: Move active tracking to i915_sched_engine
  drm/i915: Move engine->schedule to i915_sched_engine
  drm/i915: Add kick_backend function to i915_sched_engine
  drm/i915: Update i915_scheduler to operate on i915_sched_engine
  drm/i915: Move submission tasklet to i915_sched_engine
  drm/i915/doc: Add kernel doc for i915_sched_engine

 Documentation/gpu/i915.rst                    |   6 +
 drivers/gpu/drm/i915/gem/i915_gem_wait.c      |   4 +-
 drivers/gpu/drm/i915/gt/intel_engine.h        |  16 -
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  72 ++--
 .../gpu/drm/i915/gt/intel_engine_heartbeat.c  |   4 +-
 drivers/gpu/drm/i915/gt/intel_engine_pm.c     |   4 +-
 drivers/gpu/drm/i915/gt/intel_engine_types.h  |  47 +--
 drivers/gpu/drm/i915/gt/intel_engine_user.c   |   2 +-
 .../drm/i915/gt/intel_execlists_submission.c  | 323 +++++++++++-------
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
 22 files changed, 554 insertions(+), 425 deletions(-)

-- 
2.28.0

