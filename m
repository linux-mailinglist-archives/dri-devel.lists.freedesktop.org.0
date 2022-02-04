Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B449A4A9E00
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 18:45:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 362B110EEF9;
	Fri,  4 Feb 2022 17:45:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC0D210EB29;
 Fri,  4 Feb 2022 17:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643996710; x=1675532710;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4S2sr+pNSe6vJUzgJpZQL05bGJYHruMpz+Scmzf9MlM=;
 b=i/swmU59Jb/UKxX3+HIvQO1EDxJJQMHyK/fTK+LsMzuUC91FDY5Ealp3
 JEfOMpmxgFSTiyCFY6NrYNHOy/Nqe8eq0yohnKJk14l9r/vp38Wf4p3jO
 JkoZ7SJaiG+4lA96umSIXUD63xRRABH6/0SNIW/LKvNcebujeOFcStHdz
 5e1XcZZoGnc48tr8NKC2UFJme16LEwUJmavS6hxGd10jfLVjbdhn/9B7n
 Edq9rxIPqTmX7q0/YEdEJMskiuRshg3tWnVQ64HVRJqXO/zCzmnrahg+7
 T0Ivx9P2nTNgFuFrmSZB4ioHzb3aEgjeu3HOLLdhehZ0W9BJBTTdlD7fa g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10248"; a="247242176"
X-IronPort-AV: E=Sophos;i="5.88,343,1635231600"; d="scan'208";a="247242176"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 09:45:09 -0800
X-IronPort-AV: E=Sophos;i="5.88,343,1635231600"; d="scan'208";a="539240808"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 09:45:08 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 08/19] drm/i915/guc: Convert policies update to iosys_map
Date: Fri,  4 Feb 2022 09:44:25 -0800
Message-Id: <20220204174436.830121-9-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220204174436.830121-1-lucas.demarchi@intel.com>
References: <20220204174436.830121-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use iosys_map to write the policies update so access to IO and system
memory is abstracted away.

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c | 41 ++++++++++++----------
 1 file changed, 23 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
index d32b407a2d25..6311b9da87e4 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
@@ -130,33 +130,37 @@ static u32 guc_ads_blob_size(struct intel_guc *guc)
 	       guc_ads_private_data_size(guc);
 }
 
-static void guc_policies_init(struct intel_guc *guc, struct guc_policies *policies)
+static void guc_policies_init(struct intel_guc *guc)
 {
 	struct intel_gt *gt = guc_to_gt(guc);
 	struct drm_i915_private *i915 = gt->i915;
+	u32 global_flags = 0;
 
-	policies->dpc_promote_time = GLOBAL_POLICY_DEFAULT_DPC_PROMOTE_TIME_US;
-	policies->max_num_work_items = GLOBAL_POLICY_MAX_NUM_WI;
+	ads_blob_write(guc, policies.dpc_promote_time,
+		       GLOBAL_POLICY_DEFAULT_DPC_PROMOTE_TIME_US);
+	ads_blob_write(guc, policies.max_num_work_items,
+		       GLOBAL_POLICY_MAX_NUM_WI);
 
-	policies->global_flags = 0;
 	if (i915->params.reset < 2)
-		policies->global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
+		global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
 
-	policies->is_valid = 1;
+	ads_blob_write(guc, policies.global_flags, global_flags);
+	ads_blob_write(guc, policies.is_valid, 1);
 }
 
 void intel_guc_ads_print_policy_info(struct intel_guc *guc,
 				     struct drm_printer *dp)
 {
-	struct __guc_ads_blob *blob = guc->ads_blob;
-
-	if (unlikely(!blob))
+	if (unlikely(iosys_map_is_null(&guc->ads_map)))
 		return;
 
 	drm_printf(dp, "Global scheduling policies:\n");
-	drm_printf(dp, "  DPC promote time   = %u\n", blob->policies.dpc_promote_time);
-	drm_printf(dp, "  Max num work items = %u\n", blob->policies.max_num_work_items);
-	drm_printf(dp, "  Flags              = %u\n", blob->policies.global_flags);
+	drm_printf(dp, "  DPC promote time   = %u\n",
+		   ads_blob_read(guc, policies.dpc_promote_time));
+	drm_printf(dp, "  Max num work items = %u\n",
+		   ads_blob_read(guc, policies.max_num_work_items));
+	drm_printf(dp, "  Flags              = %u\n",
+		   ads_blob_read(guc, policies.global_flags));
 }
 
 static int guc_action_policies_update(struct intel_guc *guc, u32 policy_offset)
@@ -171,23 +175,24 @@ static int guc_action_policies_update(struct intel_guc *guc, u32 policy_offset)
 
 int intel_guc_global_policies_update(struct intel_guc *guc)
 {
-	struct __guc_ads_blob *blob = guc->ads_blob;
 	struct intel_gt *gt = guc_to_gt(guc);
+	u32 scheduler_policies;
 	intel_wakeref_t wakeref;
 	int ret;
 
-	if (!blob)
+	if (iosys_map_is_null(&guc->ads_map))
 		return -EOPNOTSUPP;
 
-	GEM_BUG_ON(!blob->ads.scheduler_policies);
+	scheduler_policies = ads_blob_read(guc, ads.scheduler_policies);
+	GEM_BUG_ON(!scheduler_policies);
 
-	guc_policies_init(guc, &blob->policies);
+	guc_policies_init(guc);
 
 	if (!intel_guc_is_ready(guc))
 		return 0;
 
 	with_intel_runtime_pm(&gt->i915->runtime_pm, wakeref)
-		ret = guc_action_policies_update(guc, blob->ads.scheduler_policies);
+		ret = guc_action_policies_update(guc, scheduler_policies);
 
 	return ret;
 }
@@ -557,7 +562,7 @@ static void __guc_ads_init(struct intel_guc *guc)
 	u32 base;
 
 	/* GuC scheduling policies */
-	guc_policies_init(guc, &blob->policies);
+	guc_policies_init(guc);
 
 	/* System info */
 	fill_engine_enable_masks(gt, &blob->system_info);
-- 
2.35.1

