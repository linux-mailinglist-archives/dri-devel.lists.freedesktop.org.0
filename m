Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6AC5375B4B
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 21:01:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0036D6EE23;
	Thu,  6 May 2021 18:57:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E8216ED8A;
 Thu,  6 May 2021 18:57:14 +0000 (UTC)
IronPort-SDR: /yy34NOIS45Wes7qJOxCU+nATviW860iJrtT9SDIDGibVHs7Iy2Ke4pAiX0xis261dqFNb7Hp9
 gSvOCV62XFgA==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="196531030"
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="196531030"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:13 -0700
IronPort-SDR: 9l7m4xPQY2ZWlEPHyZpC98kyR5eDbldb+71/qduvDuSdDqUmMU5nxAbWB1sS66ogaib5aAFM6A
 myCxx23M61Jw==
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="469583593"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:12 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 72/97] drm/i915/guc: Don't complain about reset races
Date: Thu,  6 May 2021 12:14:26 -0700
Message-Id: <20210506191451.77768-73-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210506191451.77768-1-matthew.brost@intel.com>
References: <20210506191451.77768-1-matthew.brost@intel.com>
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
Cc: matthew.brost@intel.com, tvrtko.ursulin@intel.com,
 daniele.ceraolospurio@intel.com, jason.ekstrand@intel.com,
 jon.bloomfield@intel.com, daniel.vetter@intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

It is impossible to seal all race conditions of resets occurring
concurrent to other operations. At least, not without introducing
excesive mutex locking. Instead, don't complain if it occurs. In
particular, don't complain if trying to send a H2G during a reset.
Whatever the H2G was about should get redone once the reset is over.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 5 ++++-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c     | 4 ++++
 drivers/gpu/drm/i915/gt/uc/intel_uc.h     | 2 ++
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index d5b326d4e250..1c240ff8dec9 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -718,7 +718,10 @@ int intel_guc_ct_send(struct intel_guc_ct *ct, const u32 *action, u32 len,
 	int ret;
 
 	if (unlikely(!ct->enabled)) {
-		WARN(1, "Unexpected send: action=%#x\n", *action);
+		struct intel_guc *guc = ct_to_guc(ct);
+		struct intel_uc *uc = container_of(guc, struct intel_uc, guc);
+
+		WARN(!uc->reset_in_progress, "Unexpected send: action=%#x\n", *action);
 		return -ENODEV;
 	}
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
index 7035aa727e04..8c681fc49638 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
@@ -550,6 +550,8 @@ void intel_uc_reset_prepare(struct intel_uc *uc)
 {
 	struct intel_guc *guc = &uc->guc;
 
+	uc->reset_in_progress = true;
+
 	/* Firmware expected to be running when this function is called */
 	if (!intel_guc_is_ready(guc))
 		goto sanitize;
@@ -574,6 +576,8 @@ void intel_uc_reset_finish(struct intel_uc *uc)
 {
 	struct intel_guc *guc = &uc->guc;
 
+	uc->reset_in_progress = false;
+
 	/* Firmware expected to be running when this function is called */
 	if (intel_guc_is_fw_running(guc) && intel_uc_uses_guc_submission(uc))
 		intel_guc_submission_reset_finish(guc);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.h b/drivers/gpu/drm/i915/gt/uc/intel_uc.h
index eaa3202192ac..91315e3f1c58 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.h
@@ -30,6 +30,8 @@ struct intel_uc {
 
 	/* Snapshot of GuC log from last failed load */
 	struct drm_i915_gem_object *load_err_log;
+
+	bool reset_in_progress;
 };
 
 void intel_uc_init_early(struct intel_uc *uc);
-- 
2.28.0

