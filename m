Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 776653B27E6
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 08:49:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEAD86EA5B;
	Thu, 24 Jun 2021 06:47:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE4D66EA15;
 Thu, 24 Jun 2021 06:47:31 +0000 (UTC)
IronPort-SDR: WMXGhkqlYW3zVZGUBeZo8775dYpgbeZMQIlY8+zPu/2KXghlntDpqvevRszKpG0//VWa0zXssF
 qQHBS5+GPuOw==
X-IronPort-AV: E=McAfee;i="6200,9189,10024"; a="207346785"
X-IronPort-AV: E=Sophos;i="5.83,295,1616482800"; d="scan'208";a="207346785"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 23:47:26 -0700
IronPort-SDR: JFZsl6U2jDVYdFHBInzU9Csg6lyCx1vsfxRCrnKh1KsRaX50yqqiCiFmi6I0Y5hczEWEhCpEr6
 45RnXtv3qugw==
X-IronPort-AV: E=Sophos;i="5.83,295,1616482800"; d="scan'208";a="556391004"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 23:47:26 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 47/47] drm/i915/guc: Unblock GuC submission on Gen11+
Date: Thu, 24 Jun 2021 00:05:16 -0700
Message-Id: <20210624070516.21893-48-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210624070516.21893-1-matthew.brost@intel.com>
References: <20210624070516.21893-1-matthew.brost@intel.com>
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
Cc: daniele.ceraolospurio@intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Unblock GuC submission on Gen11+ platforms.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc.h            |  1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c |  8 ++++++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h |  3 +--
 drivers/gpu/drm/i915/gt/uc/intel_uc.c             | 14 +++++++++-----
 4 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
index fae01dc8e1b9..77981788204f 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -54,6 +54,7 @@ struct intel_guc {
 	struct ida guc_ids;
 	struct list_head guc_id_list;
 
+	bool submission_supported;
 	bool submission_selected;
 
 	struct i915_vma *ads_vma;
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index a427336ce916..405339202280 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -2042,6 +2042,13 @@ void intel_guc_submission_disable(struct intel_guc *guc)
 	/* Note: By the time we're here, GuC may have already been reset */
 }
 
+static bool __guc_submission_supported(struct intel_guc *guc)
+{
+	/* GuC submission is unavailable for pre-Gen11 */
+	return intel_guc_is_supported(guc) &&
+	       INTEL_GEN(guc_to_gt(guc)->i915) >= 11;
+}
+
 static bool __guc_submission_selected(struct intel_guc *guc)
 {
 	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
@@ -2054,6 +2061,7 @@ static bool __guc_submission_selected(struct intel_guc *guc)
 
 void intel_guc_submission_init_early(struct intel_guc *guc)
 {
+	guc->submission_supported = __guc_submission_supported(guc);
 	guc->submission_selected = __guc_submission_selected(guc);
 }
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
index a2a3fad72be1..be767eb6ff71 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
@@ -37,8 +37,7 @@ int intel_guc_wait_for_pending_msg(struct intel_guc *guc,
 
 static inline bool intel_guc_submission_is_supported(struct intel_guc *guc)
 {
-	/* XXX: GuC submission is unavailable for now */
-	return false;
+	return guc->submission_supported;
 }
 
 static inline bool intel_guc_submission_is_wanted(struct intel_guc *guc)
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
index 7a69c3c027e9..61be0aa81492 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
@@ -34,8 +34,15 @@ static void uc_expand_default_options(struct intel_uc *uc)
 		return;
 	}
 
-	/* Default: enable HuC authentication only */
-	i915->params.enable_guc = ENABLE_GUC_LOAD_HUC;
+	/* Intermediate platforms are HuC authentication only */
+	if (IS_DG1(i915) || IS_ALDERLAKE_S(i915)) {
+		drm_dbg(&i915->drm, "Disabling GuC only due to old platform\n");
+		i915->params.enable_guc = ENABLE_GUC_LOAD_HUC;
+		return;
+	}
+
+	/* Default: enable HuC authentication and GuC submission */
+	i915->params.enable_guc = ENABLE_GUC_LOAD_HUC | ENABLE_GUC_SUBMISSION;
 }
 
 /* Reset GuC providing us with fresh state for both GuC and HuC.
@@ -313,9 +320,6 @@ static int __uc_init(struct intel_uc *uc)
 	if (i915_inject_probe_failure(uc_to_gt(uc)->i915))
 		return -ENOMEM;
 
-	/* XXX: GuC submission is unavailable for now */
-	GEM_BUG_ON(intel_uc_uses_guc_submission(uc));
-
 	ret = intel_guc_init(guc);
 	if (ret)
 		return ret;
-- 
2.28.0

