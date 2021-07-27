Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD8D3D6ABA
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 02:07:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2C3F73338;
	Tue, 27 Jul 2021 00:07:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9A37731CA;
 Tue, 27 Jul 2021 00:06:06 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10057"; a="273418405"
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; d="scan'208";a="273418405"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 17:06:05 -0700
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; d="scan'208";a="662339253"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 17:06:04 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 33/33] drm/i915/guc: Unblock GuC submission on Gen11+
Date: Mon, 26 Jul 2021 17:23:48 -0700
Message-Id: <20210727002348.97202-34-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210727002348.97202-1-matthew.brost@intel.com>
References: <20210727002348.97202-1-matthew.brost@intel.com>
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

v2:
 (Martin Peres / John H)
  - Delete debug message when GuC is disabled by default on certain
    platforms

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc.h            |  1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c |  8 ++++++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h |  3 +--
 drivers/gpu/drm/i915/gt/uc/intel_uc.c             | 13 ++++++++-----
 4 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
index 8ab70a2223b0..a9547069ee7e 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -55,6 +55,7 @@ struct intel_guc {
 	struct ida guc_ids;
 	struct list_head guc_id_list;
 
+	bool submission_supported;
 	bool submission_selected;
 
 	struct i915_vma *ads_vma;
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index b760cbf6ca0e..89ff0e4b4bc7 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -2543,6 +2543,13 @@ void intel_guc_submission_disable(struct intel_guc *guc)
 	/* Note: By the time we're here, GuC may have already been reset */
 }
 
+static bool __guc_submission_supported(struct intel_guc *guc)
+{
+	/* GuC submission is unavailable for pre-Gen11 */
+	return intel_guc_is_supported(guc) &&
+	       GRAPHICS_VER(guc_to_gt(guc)->i915) >= 11;
+}
+
 static bool __guc_submission_selected(struct intel_guc *guc)
 {
 	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
@@ -2555,6 +2562,7 @@ static bool __guc_submission_selected(struct intel_guc *guc)
 
 void intel_guc_submission_init_early(struct intel_guc *guc)
 {
+	guc->submission_supported = __guc_submission_supported(guc);
 	guc->submission_selected = __guc_submission_selected(guc);
 }
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
index 03bc1c83a4d2..c7ef44fa0c36 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
@@ -38,8 +38,7 @@ int intel_guc_wait_for_pending_msg(struct intel_guc *guc,
 
 static inline bool intel_guc_submission_is_supported(struct intel_guc *guc)
 {
-	/* XXX: GuC submission is unavailable for now */
-	return false;
+	return guc->submission_supported;
 }
 
 static inline bool intel_guc_submission_is_wanted(struct intel_guc *guc)
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
index 7a69c3c027e9..da57d18d9f6b 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
@@ -34,8 +34,14 @@ static void uc_expand_default_options(struct intel_uc *uc)
 		return;
 	}
 
-	/* Default: enable HuC authentication only */
-	i915->params.enable_guc = ENABLE_GUC_LOAD_HUC;
+	/* Intermediate platforms are HuC authentication only */
+	if (IS_DG1(i915) || IS_ALDERLAKE_S(i915)) {
+		i915->params.enable_guc = ENABLE_GUC_LOAD_HUC;
+		return;
+	}
+
+	/* Default: enable HuC authentication and GuC submission */
+	i915->params.enable_guc = ENABLE_GUC_LOAD_HUC | ENABLE_GUC_SUBMISSION;
 }
 
 /* Reset GuC providing us with fresh state for both GuC and HuC.
@@ -313,9 +319,6 @@ static int __uc_init(struct intel_uc *uc)
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

