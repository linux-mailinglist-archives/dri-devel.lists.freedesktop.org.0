Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 269ED77C4E6
	for <lists+dri-devel@lfdr.de>; Tue, 15 Aug 2023 03:12:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A6AF10E236;
	Tue, 15 Aug 2023 01:12:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 602E910E139;
 Tue, 15 Aug 2023 01:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692061933; x=1723597933;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=j6uuGHlI4ijK2pNMUJK08m80n4JqCODQMjNJluXpIbQ=;
 b=Fg69Yba9bgk2uv4gn3tYgjBVi6GTVLILlvAKqQvSZFVsuZMAMFKG1mOe
 NQSdQ7S0qopZLOlIAK96VAnCA4K8M3jlaaJ/fVtR05+gGogScRk+9LFBg
 RDpjzJVFxeoRXQKLXmTZRr5MhHxmesuabDf14EuvkMsT/K2PTIQz9SJFI
 Vx7Z9e4reCE/d61wEec25Xj3kDYZyK018BA+iZBWA+RfUE64VU7IFET7r
 bGv9EwxTq1dQ2t9kcHo542jvnHKVw0T34C/FgO7iGYJfd21N4cOA/BbLW
 OBN0dqRRCwGvx1A56zmrSrjpALf3Xtvya3VMhehWj4ydXsWf8VOX1v4Ds A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="403155167"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; d="scan'208";a="403155167"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2023 18:12:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="803637039"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; d="scan'208";a="803637039"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by fmsmga004.fm.intel.com with ESMTP; 14 Aug 2023 18:12:12 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 0/3] Resolve suspend-resume racing with GuC
 destroy-context-worker
Date: Mon, 14 Aug 2023 18:12:07 -0700
Message-Id: <20230815011210.1188379-1-alan.previn.teres.alexis@intel.com>
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
Cc: John Harrison <john.c.harrison@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
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
and unrolling the guc-lrc-unpin flow) and (Patch #32) not
infinitely waiting in intel_gt_pm_wait_timeout_for_idle
when in the suspend-flow.

Alan Previn (3):
  drm/i915/guc: Flush context destruction worker at suspend
  drm/i915/guc: Close deregister-context race against CT-loss
  drm/i915/gt: Timeout when waiting for idle in suspending

 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  2 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm.c         |  7 ++-
 drivers/gpu/drm/i915/gt/intel_gt_pm.h         |  7 ++-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 45 +++++++++++++++++--
 .../gpu/drm/i915/gt/uc/intel_guc_submission.h |  2 +
 drivers/gpu/drm/i915/gt/uc/intel_uc.c         |  2 +
 drivers/gpu/drm/i915/intel_wakeref.c          | 14 ++++--
 drivers/gpu/drm/i915/intel_wakeref.h          |  5 ++-
 8 files changed, 71 insertions(+), 13 deletions(-)


base-commit: 85f20fb339f05ec4221bb295c13e46061c5c566f
-- 
2.39.0

