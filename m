Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5886C51744F
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 18:34:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10B5610F049;
	Mon,  2 May 2022 16:34:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CFE610F025;
 Mon,  2 May 2022 16:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651509262; x=1683045262;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M4gryaaRAJ5psw2TDdD/t46rlZedrW2iQIdMK+LjNuo=;
 b=jFzadZGG8BdAE6MicvR6lGRwu7dAksghtG3In1Day0jbBpoB8i9z+Eod
 Op2LpjWzg0Q8ncIcoTcML3/BR0ZF/fUynnqahOgrgKaibya+L6Hk+kTl8
 Qt87SETTSh6g0vKFbBYTj9FsoKL/yPd3xDOzj3lH/7X8+feWdWf6Rrdfu
 ltkedinuDeXbiRl/EhO7i7NSL/IvxUy3WahoVt1G3mo3873pQt0Nik+xa
 4lmOJFaJkeIdrkiRUYIK4KM/2HyLC3rl2rhBywYVJ+elP++LzgogbQCxc
 MwOQWTsYhFbaWSN6+Z3hbfapWZq1eCw0DhSFDzYiSJ51SZ7AwtWpVszwJ g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="266105001"
X-IronPort-AV: E=Sophos;i="5.91,192,1647327600"; d="scan'208";a="266105001"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 09:34:21 -0700
X-IronPort-AV: E=Sophos;i="5.91,192,1647327600"; d="scan'208";a="583781841"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 09:34:21 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 06/11] drm/i915/pvc: Reduce stack usage in reset selftest with
 extra blitter engine
Date: Mon,  2 May 2022 09:34:12 -0700
Message-Id: <20220502163417.2635462-7-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220502163417.2635462-1-matthew.d.roper@intel.com>
References: <20220502163417.2635462-1-matthew.d.roper@intel.com>
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
Cc: John Harrison <John.C.Harrison@Intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

PVC adds extra blitter engines (in the following patch). The reset
selftest has a local array on the stack which is sized by the number
of engines. The increase pushes the size of this array to the point
where it trips the 'stack too large' compile warning. This patch takes
the allocation of the stack and makes it dynamic instead.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
index 83ff4c2e57c5..3b9d82276db2 100644
--- a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
+++ b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
@@ -979,6 +979,7 @@ static int __igt_reset_engines(struct intel_gt *gt,
 	enum intel_engine_id id, tmp;
 	struct hang h;
 	int err = 0;
+	struct active_engine *threads;
 
 	/* Check that issuing a reset on one engine does not interfere
 	 * with any other engine.
@@ -996,8 +997,11 @@ static int __igt_reset_engines(struct intel_gt *gt,
 			h.ctx->sched.priority = 1024;
 	}
 
+	threads = kzalloc(sizeof(*threads) * I915_NUM_ENGINES, GFP_KERNEL);
+	if (!threads)
+		return -ENOMEM;
+
 	for_each_engine(engine, gt, id) {
-		struct active_engine threads[I915_NUM_ENGINES] = {};
 		unsigned long device = i915_reset_count(global);
 		unsigned long count = 0, reported;
 		bool using_guc = intel_engine_uses_guc(engine);
@@ -1016,7 +1020,7 @@ static int __igt_reset_engines(struct intel_gt *gt,
 			break;
 		}
 
-		memset(threads, 0, sizeof(threads));
+		memset(threads, 0, sizeof(*threads) * I915_NUM_ENGINES);
 		for_each_engine(other, gt, tmp) {
 			struct task_struct *tsk;
 
@@ -1236,6 +1240,7 @@ static int __igt_reset_engines(struct intel_gt *gt,
 			break;
 		}
 	}
+	kfree(threads);
 
 	if (intel_gt_is_wedged(gt))
 		err = -EIO;
-- 
2.35.1

