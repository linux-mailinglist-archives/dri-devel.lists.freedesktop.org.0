Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B5B4BC226
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 22:33:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0476E10EA4A;
	Fri, 18 Feb 2022 21:33:10 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05EF110EA3C;
 Fri, 18 Feb 2022 21:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645219989; x=1676755989;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ncVfe66uzdNKMKj7i/OYYYxUGUlYy74ul0X4fkC9lMo=;
 b=nidMRqwWhBKKx0i6o18cg6orGz7TAFAEuo+o75IMoavqouK06ProMyA9
 QVredHN668r/dBPcWaprPyNfjDGoGb023NgNcfzPIoEzQp/RmJbGx0lcn
 ZgEFqwA2PN4Gl1RTGOebUmilagGledI2+uwLfba2gcP3hSinx30SrJXui
 PiPXbOpz5C2Wb1n6e8sRWta7Xo68XhBzKYfFHykUVKxpTcfh6Jl+yyrT2
 ZUEwF8sI113eSizYynFREk+EOberAjbCXS3gtw4xW9hqsv3bg9nojB0Qt
 t7DZtp47Kw0A/zSesvYc58XUd9QRyxqP1NZbupMxXW5iBt4zLXfi+R6U8 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10262"; a="238638713"
X-IronPort-AV: E=Sophos;i="5.88,379,1635231600"; d="scan'208";a="238638713"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 13:33:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,379,1635231600"; d="scan'208";a="546499011"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by orsmga008.jf.intel.com with ESMTP; 18 Feb 2022 13:33:07 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 3/3] drm/i915: Improve long running OCL w/a for GuC submission
Date: Fri, 18 Feb 2022 13:33:07 -0800
Message-Id: <20220218213307.1338478-4-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220218213307.1338478-1-John.C.Harrison@Intel.com>
References: <20220218213307.1338478-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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
Cc: Michal Mrozek <michal.mrozek@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

A workaround was added to the driver to allow OpenCL workloads to run
'forever' by disabling pre-emption on the RCS engine for Gen12.
It is not totally unbound as the heartbeat will kick in eventually
and cause a reset of the hung engine.

However, this does not work well in GuC submission mode. In GuC mode,
the pre-emption timeout is how GuC detects hung contexts and triggers
a per engine reset. Thus, disabling the timeout means also losing all
per engine reset ability. A full GT reset will still occur when the
heartbeat finally expires, but that is a much more destructive and
undesirable mechanism.

The purpose of the workaround is actually to give OpenCL tasks longer
to reach a pre-emption point after a pre-emption request has been
issued. This is necessary because Gen12 does not support mid-thread
pre-emption and OpenCL can have long running threads.

So, rather than disabling the timeout completely, just set it to a
'long' value.

CC: Michal Mrozek <michal.mrozek@intel.com>
Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 2a1e9f36e6f5..64249301a227 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -385,9 +385,25 @@ static int intel_engine_setup(struct intel_gt *gt, enum intel_engine_id id,
 	engine->props.timeslice_duration_ms =
 		CONFIG_DRM_I915_TIMESLICE_DURATION;
 
-	/* Override to uninterruptible for OpenCL workloads. */
-	if (GRAPHICS_VER(i915) == 12 && engine->class == RENDER_CLASS)
-		engine->props.preempt_timeout_ms = 0;
+	/*
+	 * Mid-thread pre-emption is not available in Gen12. Unfortunately,
+	 * some OpenCL workloads run quite long threads. That means they get
+	 * reset due to not pre-empting in a timely manner. So, bump the
+	 * pre-emption timeout value to be much higher for compute engines.
+	 * Using three times the heartbeat period seems long enough for a
+	 * reasonable task to reach a pre-emption point but not so long as to
+	 * allow genuine hangs to go unresolved.
+	 */
+	if (GRAPHICS_VER(i915) == 12 && engine->class == RENDER_CLASS) {
+		unsigned long triple_beat = engine->props.heartbeat_interval_ms * 3;
+
+		if (triple_beat > engine->props.preempt_timeout_ms) {
+			drm_info(&gt->i915->drm, "Bumping pre-emption timeout from %ld to %ld on %s to allow slow compute pre-emption\n",
+				 engine->props.preempt_timeout_ms, triple_beat, engine->name);
+
+			engine->props.preempt_timeout_ms = triple_beat;
+		}
+	}
 
 	/* Cap timeouts to prevent overflow inside GuC */
 	if (intel_guc_submission_is_wanted(&gt->uc.guc)) {
-- 
2.25.1

