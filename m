Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7973C2C5E
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jul 2021 03:21:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A5366EAB4;
	Sat, 10 Jul 2021 01:21:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F5B16EAB4;
 Sat, 10 Jul 2021 01:21:45 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10040"; a="231575075"
X-IronPort-AV: E=Sophos;i="5.84,228,1620716400"; d="scan'208";a="231575075"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2021 18:21:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,228,1620716400"; d="scan'208";a="411439599"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by orsmga006.jf.intel.com with ESMTP; 09 Jul 2021 18:21:42 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 02/16] drm/i915/guc/slpc: Initial definitions for slpc
Date: Fri,  9 Jul 2021 18:20:12 -0700
Message-Id: <20210710012026.19705-3-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20210710012026.19705-1-vinay.belgaumkar@intel.com>
References: <20210710012026.19705-1-vinay.belgaumkar@intel.com>
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
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Sundaresan Sujaritha <sujaritha.sundaresan@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add macros to check for slpc support. This feature is currently supported
for gen12+ and enabled whenever guc submission is enabled/selected.

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Signed-off-by: Sundaresan Sujaritha <sujaritha.sundaresan@intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc.c        |  1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  2 ++
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 21 +++++++++++++++++++
 .../gpu/drm/i915/gt/uc/intel_guc_submission.h | 16 ++++++++++++++
 drivers/gpu/drm/i915/gt/uc/intel_uc.c         |  6 ++++--
 drivers/gpu/drm/i915/gt/uc/intel_uc.h         |  1 +
 6 files changed, 45 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
index 979128e28372..b9a809f2d221 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
@@ -157,6 +157,7 @@ void intel_guc_init_early(struct intel_guc *guc)
 	intel_guc_ct_init_early(&guc->ct);
 	intel_guc_log_init_early(&guc->log);
 	intel_guc_submission_init_early(guc);
+	intel_guc_slpc_init_early(guc);
 
 	mutex_init(&guc->send_mutex);
 	spin_lock_init(&guc->irq_lock);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
index 5d94cf482516..e5a456918b88 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -57,6 +57,8 @@ struct intel_guc {
 
 	bool submission_supported;
 	bool submission_selected;
+	bool slpc_supported;
+	bool slpc_selected;
 
 	struct i915_vma *ads_vma;
 	struct __guc_ads_blob *ads_blob;
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 9c102bf0c8e3..e2644a05f298 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -2351,6 +2351,27 @@ void intel_guc_submission_init_early(struct intel_guc *guc)
 	guc->submission_selected = __guc_submission_selected(guc);
 }
 
+static bool __guc_slpc_supported(struct intel_guc *guc)
+{
+	/* GuC slpc is unavailable for pre-Gen12 */
+	return guc->submission_supported &&
+		GRAPHICS_VER(guc_to_gt(guc)->i915) >= 12;
+}
+
+static bool __guc_slpc_selected(struct intel_guc *guc)
+{
+	if (!intel_guc_slpc_is_supported(guc))
+		return false;
+
+	return guc->submission_selected;
+}
+
+void intel_guc_slpc_init_early(struct intel_guc *guc)
+{
+	guc->slpc_supported = __guc_slpc_supported(guc);
+	guc->slpc_selected = __guc_slpc_selected(guc);
+}
+
 static inline struct intel_context *
 g2h_context_lookup(struct intel_guc *guc, u32 desc_idx)
 {
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
index be767eb6ff71..7ae5fd052faf 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
@@ -13,6 +13,7 @@
 struct drm_printer;
 struct intel_engine_cs;
 
+void intel_guc_slpc_init_early(struct intel_guc *guc);
 void intel_guc_submission_init_early(struct intel_guc *guc);
 int intel_guc_submission_init(struct intel_guc *guc);
 void intel_guc_submission_enable(struct intel_guc *guc);
@@ -50,4 +51,19 @@ static inline bool intel_guc_submission_is_used(struct intel_guc *guc)
 	return intel_guc_is_used(guc) && intel_guc_submission_is_wanted(guc);
 }
 
+static inline bool intel_guc_slpc_is_supported(struct intel_guc *guc)
+{
+	return guc->slpc_supported;
+}
+
+static inline bool intel_guc_slpc_is_wanted(struct intel_guc *guc)
+{
+	return guc->slpc_selected;
+}
+
+static inline bool intel_guc_slpc_is_used(struct intel_guc *guc)
+{
+	return intel_guc_submission_is_used(guc) && intel_guc_slpc_is_wanted(guc);
+}
+
 #endif
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
index 61be0aa81492..dca5f6d0641b 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
@@ -76,16 +76,18 @@ static void __confirm_options(struct intel_uc *uc)
 	struct drm_i915_private *i915 = uc_to_gt(uc)->i915;
 
 	drm_dbg(&i915->drm,
-		"enable_guc=%d (guc:%s submission:%s huc:%s)\n",
+		"enable_guc=%d (guc:%s submission:%s huc:%s slpc:%s)\n",
 		i915->params.enable_guc,
 		yesno(intel_uc_wants_guc(uc)),
 		yesno(intel_uc_wants_guc_submission(uc)),
-		yesno(intel_uc_wants_huc(uc)));
+		yesno(intel_uc_wants_huc(uc)),
+		yesno(intel_uc_wants_guc_slpc(uc)));
 
 	if (i915->params.enable_guc == 0) {
 		GEM_BUG_ON(intel_uc_wants_guc(uc));
 		GEM_BUG_ON(intel_uc_wants_guc_submission(uc));
 		GEM_BUG_ON(intel_uc_wants_huc(uc));
+		GEM_BUG_ON(intel_uc_wants_guc_slpc(uc));
 		return;
 	}
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.h b/drivers/gpu/drm/i915/gt/uc/intel_uc.h
index e2da2b6e76e1..38e465fd8a0c 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.h
@@ -83,6 +83,7 @@ __uc_state_checker(x, func, uses, used)
 uc_state_checkers(guc, guc);
 uc_state_checkers(huc, huc);
 uc_state_checkers(guc, guc_submission);
+uc_state_checkers(guc, guc_slpc);
 
 #undef uc_state_checkers
 #undef __uc_state_checker
-- 
2.25.0

