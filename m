Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10AE74C4FD4
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 21:42:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9198C10E94F;
	Fri, 25 Feb 2022 20:41:58 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E57310E938;
 Fri, 25 Feb 2022 20:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645821712; x=1677357712;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oCSlqn/VPwMQkbtAXTh7KuJSjz7KubssZZqW0MHQ4i4=;
 b=inAFYLSOI3OoHZZf11U1iJ+6KqEoMuzIFNcOpfNtjniFI6ckzUXiLx95
 sW5X03Zu0xq9LPDE4Y6U+IdkGTbJG96gt77nOAZwDYyGghYxd/7KPaMib
 pHD2NLKW2YigKT1mQmtHR/cjnb52zAg/3w5ZIgvC5lgYlNb+y3inYbga1
 J2n8dZ9Uj+vVsuhDlhG6ohNB6Tg86LtvrPuzIhhnlYk2MyqC99VgfAyYt
 HJRIECMAHZX427htBVB3oidIFUzVQpv6xIkEfFwecUQRCkRpWY2R25Xuk
 jrj/HIs4x47Vj9JqXGIVaY9NDwlBngoshtAZzP1JQzMtR2Ryk/+caIjpt g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10269"; a="315791548"
X-IronPort-AV: E=Sophos;i="5.90,137,1643702400"; d="scan'208";a="315791548"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 12:41:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,137,1643702400"; d="scan'208";a="549414303"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by orsmga008.jf.intel.com with ESMTP; 25 Feb 2022 12:41:51 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v2 3/3] drm/i915: Improve long running OCL w/a for GuC
 submission
Date: Fri, 25 Feb 2022 12:41:51 -0800
Message-Id: <20220225204151.2248027-4-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220225204151.2248027-1-John.C.Harrison@Intel.com>
References: <20220225204151.2248027-1-John.C.Harrison@Intel.com>
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

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Acked-by: Michal Mrozek <michal.mrozek@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 7ad9e6006656..84db5bf36285 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -395,9 +395,25 @@ static int intel_engine_setup(struct intel_gt *gt, enum intel_engine_id id,
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
 
 	/* Cap properties according to any system limits */
 #define CLAMP_PROP(field) \
-- 
2.25.1

