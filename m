Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B384402DA1
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 19:19:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8F406E09E;
	Tue,  7 Sep 2021 17:19:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 663B86E08A;
 Tue,  7 Sep 2021 17:19:28 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10100"; a="220322739"
X-IronPort-AV: E=Sophos;i="5.85,274,1624345200"; d="scan'208";a="220322739"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2021 10:19:27 -0700
X-IronPort-AV: E=Sophos;i="5.85,274,1624345200"; d="scan'208";a="605352266"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2021 10:19:26 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, John Harrison <John.C.Harrison@Intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 8/8] drm/i915/xehp: Extend uninterruptible OpenCL workloads to
 CCS
Date: Tue,  7 Sep 2021 10:19:16 -0700
Message-Id: <20210907171916.2548047-9-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20210907171916.2548047-1-matthew.d.roper@intel.com>
References: <20210907171916.2548047-1-matthew.d.roper@intel.com>
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

From: John Harrison <John.C.Harrison@Intel.com>

Now that OpenCL workloads can run on the compute engine, we need to set
preempt_timeout_ms = 0 on the CCS engines too.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 2f719f0ecac3..7e6ac0ae1f07 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -377,16 +377,17 @@ static int intel_engine_setup(struct intel_gt *gt, enum intel_engine_id id)
 	engine->props.timeslice_duration_ms =
 		CONFIG_DRM_I915_TIMESLICE_DURATION;
 
-	/* Override to uninterruptible for OpenCL workloads. */
-	if (GRAPHICS_VER(i915) == 12 && engine->class == RENDER_CLASS)
-		engine->props.preempt_timeout_ms = 0;
-
 	/* features common between engines sharing EUs */
 	if (engine->class == RENDER_CLASS || engine->class == COMPUTE_CLASS) {
 		engine->flags |= I915_ENGINE_HAS_RCS_REG_STATE;
 		engine->flags |= I915_ENGINE_HAS_EU_PRIORITY;
 	}
 
+	/* Override to uninterruptible for OpenCL workloads. */
+	if (GRAPHICS_VER(i915) == 12 &&
+	    engine->flags & I915_ENGINE_HAS_RCS_REG_STATE)
+		engine->props.preempt_timeout_ms = 0;
+
 	engine->defaults = engine->props; /* never to change again */
 
 	engine->context_size = intel_engine_context_size(gt, engine->class);
-- 
2.25.4

