Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEC17FE4BE
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 01:20:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 045E610E6A4;
	Thu, 30 Nov 2023 00:20:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8084010E69B;
 Thu, 30 Nov 2023 00:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701303625; x=1732839625;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=boBeUfVI6vHUqsc+PUzRFA1/WjZoBgeWQi3YhxBQiNU=;
 b=cESvlrja1U27lXBfq199YAEHk7CQjvM7PqAx8uoXNgYVmF4Wr5AJEVXv
 x9P24yHNRgj/WJF/ZnG5POUhrpeegiUFMrAGnkxhfinrNaW98aZS8XFX4
 K7yTL7m730Rq+owCf22fUJtFKayxQtkX9zubVmFx9rdsc/fXM4Hkyu9Zi
 UrSxSa3FzZplGl+clgkVlPhd8moH8v9BPpg4ukvHSObVicfU8QqBMjKw0
 1blLLfpQcvi9DPKtSvw07lNQUVGbe9H1+soCaCBy5XP8XpihnhLK9jWO9
 UayexQUBxdehCI1f8HkW3RLp0+nn25w3xVlGnYC77ZejztgnfvlotrC7E A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="373429289"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="373429289"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 16:20:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="798099354"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="798099354"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by orsmga008.jf.intel.com with ESMTP; 29 Nov 2023 16:20:15 -0800
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v7 0/2] Resolve suspend-resume racing with GuC
 destroy-context-worker
Date: Wed, 29 Nov 2023 16:20:11 -0800
Message-Id: <20231130002013.282804-1-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
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
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>, dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 John Harrison <john.c.harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series is the result of debugging issues root caused to
races between the GuC's destroyed_worker_func being triggered
vs repeating suspend-resume cycles with concurrent delayed
fence signals for engine-freeing.

The reproduction steps require that an app is launched right
before the start of the suspend cycle where it creates a
new gem context and submits a tiny workload that would
complete in the middle of the suspend cycle. However this
app uses dma-buffer sharing or dma-fence with non-GPU
objects or signals that eventually triggers a FENCE_FREE
via__i915_sw_fence_notify that connects to engines_notify ->
free_engines_rcu -> intel_context_put ->
kref_put(&ce->ref..) that queues the worker after the GuCs
CTB has been disabled (i.e. after i915-gem's suspend-late).

This sequence is a corner-case and required repeating this
app->suspend->resume cycle ~1500 times across 4 identical
systems to see it once. That said, based on above callstack,
it is clear that merely flushing the context destruction worker,
which is obviously missing and needed, isn't sufficient.

Because of that, this series adds additional patches besides
the obvious (Patch #1) flushing of the worker during the
suspend flows. It also includes (Patch #2) closing a race
between sending the context-deregistration H2G vs the CTB
getting disabled in the midst of it (by detecing the failure
and unrolling the guc-lrc-unpin flow) and adding an additional
rcu_barrier in the gem-suspend flow to purge outstanding
rcu defered tasks that may include context destruction.

This patch was tested and confirmed to be reliably working
after running ~1500 suspend resume cycles on 4 concurrent
machines.

Changes from prior revs:
   v6: - Dont hold the spinlock while calling deregister_context
         which can take a longer time. (Rodrigo)
       - Fix / improve of comments. (Rodrigo)
       - Release the ce->guc_state.lock before calling
         deregister_context and retake it if we fail. (John/Daniele).
   v5: - Remove Patch #3 which doesnt solve this exact bug
         but can be a separate patch(Tvrtko).
   v4: - In Patch #2, change the position of the calls into
         rcu_barrier based on latest testing data. (Alan/Anshuman).
       - In Patch #3, fix the timeout value selection for the
         final gt-pm idle-wait that was incorrectly using a 'ns'
         #define as a milisec timeout.
   v3: - In Patch #3, when deregister_context fails, instead
         of calling intel_gt_pm_put(that might sleep), call
         __intel_wakeref_put (without ASYNC flag) (Rodrigo/Anshuman).
       - In wait_for_suspend add an rcu_barrier before we
         proceed to wait for idle. (Anshuman)
   v2: - Patch #2 Restructure code in guc_lrc_desc_unpin so
         it's more readible to differentiate (1)direct guc-id
         cleanup ..vs (2) sending the H2G ctx-destroy action ..
         vs (3) the unrolling steps if the H2G fails.
       - Patch #2 Add a check to close the race sooner by checking
         for intel_guc_is_ready from destroyed_worker_func.
       - Patch #2 When guc_submission_send_busy_loop gets a
         failure from intel_guc_send_busy_loop, we need to undo
         i.e. decrement the outstanding_submission_g2h.
       - Patch #3 In wait_for_suspend, fix checking of return from
         intel_gt_pm_wait_timeout_for_idle to now use -ETIMEDOUT
         and add documentation for intel_wakeref_wait_for_idle.
         (Rodrigo).

Alan Previn (2):
  drm/i915/guc: Flush context destruction worker at suspend
  drm/i915/guc: Close deregister-context race against CT-loss

 drivers/gpu/drm/i915/gem/i915_gem_pm.c        | 10 +++
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 78 +++++++++++++++++--
 .../gpu/drm/i915/gt/uc/intel_guc_submission.h |  2 +
 drivers/gpu/drm/i915/gt/uc/intel_uc.c         |  2 +
 4 files changed, 87 insertions(+), 5 deletions(-)


base-commit: 436cb0ff9f20fadc99ec3b70c4d2ac6cb2e4410a
-- 
2.39.0

