Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC27E471253
	for <lists+dri-devel@lfdr.de>; Sat, 11 Dec 2021 07:59:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B333410E603;
	Sat, 11 Dec 2021 06:59:07 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 621B910E3A3;
 Sat, 11 Dec 2021 06:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639205941; x=1670741941;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rIJnYoAjhrOOkWPNRWUi/BrcwvPrM/K4Ak699pCY9Dk=;
 b=TK12NSGDh+sdm3Qrbi7a/jDAfeHYPRTyNKx9pIErqXlfNDvp1ZRE57Uz
 g1AsPNAM8yvLMrwG/uoUWUZv+MyvN4eBi79jA9y64ywex2igdcUfFbI/x
 7v8afk9BYM6tOENgBqK0fUI1j/gAsCqn+JUDPDX9FIUvJFopW1kBHTo1E
 t5XnCk9v5a58TD9ubAKuFpFRFhWX68c/rHSXTiQUHTFNji4YkraE76qgD
 mfYjRIXQWQ+BlHq3dqH/xddxI3mOH9MIzEnwyjerzsnpFCS4mbzREuKKp
 VJSVXenslN31zlrbL4ulK7IsteVcOlMIpopDCwZ6TndrsDJc/7ojAjjuB A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10194"; a="237249049"
X-IronPort-AV: E=Sophos;i="5.88,197,1635231600"; d="scan'208";a="237249049"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2021 22:59:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,197,1635231600"; d="scan'208";a="463979859"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by orsmga006.jf.intel.com with ESMTP; 10 Dec 2021 22:58:59 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 4/4] drm/i915: Improve long running OCL w/a for GuC submission
Date: Fri, 10 Dec 2021 22:58:59 -0800
Message-Id: <20211211065859.2248188-5-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211211065859.2248188-1-John.C.Harrison@Intel.com>
References: <20211211065859.2248188-1-John.C.Harrison@Intel.com>
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
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
'long' value. Likewise, bump the heartbeat interval. That gives the
OpenCL thread sufficient time to reach a pre-emption point without
being killed off either by the GuC or by the heartbeat.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c | 42 +++++++++++++++++++++--
 1 file changed, 39 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 352254e001b4..26af8d60fe2b 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -382,9 +382,45 @@ static int intel_engine_setup(struct intel_gt *gt, enum intel_engine_id id,
 	engine->props.timeslice_duration_ms =
 		CONFIG_DRM_I915_TIMESLICE_DURATION;
 
-	/* Override to uninterruptible for OpenCL workloads. */
-	if (GRAPHICS_VER(i915) == 12 && engine->class == RENDER_CLASS)
-		engine->props.preempt_timeout_ms = 0;
+	/*
+	 * Mid-thread pre-emption is not available in Gen12. Unfortunately,
+	 * some OpenCL workloads run quite long threads. That means they get
+	 * reset due to not pre-empting in a timely manner.
+	 * The execlist solution was to disable pre-emption completely.
+	 * However, pre-emption timeouts are the way GuC detects hung contexts
+	 * and triggers engine resets. Thus, without pre-emption, there is no
+	 * per engine reset. And full GT reset is much more intrusive. So keep
+	 * the timeout for GuC submission platforms and just bump it to be
+	 * much larger. Also bump the heartbeat timeout to match, otherwise
+	 * the heartbeat can expire before the pre-emption can timeout and
+	 * thus trigger a full GT reset anyway.
+	 */
+	if (GRAPHICS_VER(i915) == 12 && engine->class == RENDER_CLASS) {
+		if (intel_uc_wants_guc_submission(&gt->uc)) {
+			const unsigned long min_preempt = 7500;
+			const unsigned long min_beat = 5000;
+
+			if (engine->props.preempt_timeout_ms &&
+			    engine->props.preempt_timeout_ms < min_preempt) {
+				drm_info(&gt->i915->drm, "Bumping pre-emption timeout from %ld to %ld on %s to allow slow compute pre-emption\n",
+					 engine->props.preempt_timeout_ms,
+					 min_preempt, engine->name);
+
+				engine->props.preempt_timeout_ms = min_preempt;
+			}
+
+			if (engine->props.heartbeat_interval_ms &&
+			    engine->props.heartbeat_interval_ms < min_beat) {
+				drm_info(&gt->i915->drm, "Bumping heartbeat interval from %ld to %ld on %s to allow slow compute pre-emption\n",
+					 engine->props.heartbeat_interval_ms,
+					 min_beat, engine->name);
+
+				engine->props.heartbeat_interval_ms = min_beat;
+			}
+		} else {
+			engine->props.preempt_timeout_ms = 0;
+		}
+	}
 
 	engine->defaults = engine->props; /* never to change again */
 
-- 
2.25.1

