Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB454AD5A7
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 11:45:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DEF710E6D8;
	Tue,  8 Feb 2022 10:45:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA93A10E658;
 Tue,  8 Feb 2022 10:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644317113; x=1675853113;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M5N8gtTqmPXNDDpvOfgTUH/GCgWsYSboGf/wU+gua40=;
 b=auBPBeOOfSCAWmgwzjO94UMYIoMrPmbdja2KmH1WVv8qlfi/V7MOqu30
 7054rpvWh+QGp8PCvVTmqOzMHUbxEDXnJ/yNQYxHtcjAvKdBUloXfZ6Ht
 2mK2xrLQwYiD40o1hGmrUXwgXm6gJKGYq8Q0ylSM6tj3syn0LDc4zGByT
 vuLQdgD97gCbMCuRxtQagxwIBy/7zPwwvxPCUzBzUJU0mDUSEopgAevvJ
 FL44giA0N2JZeY34yfmVTpYZcho/q1/e0l6t8z1Zb23oJd1dAYPkGSGgI
 cKcpDue3WI1/VY5k9/HAgUV3hn7fY1rUbZEY888qzDAX0Ugd1uIBdKOC+ w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10251"; a="246511551"
X-IronPort-AV: E=Sophos;i="5.88,352,1635231600"; d="scan'208";a="246511551"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 02:45:11 -0800
X-IronPort-AV: E=Sophos;i="5.88,352,1635231600"; d="scan'208";a="700804126"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 02:45:09 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 07/18] drm/i915/guc: Convert policies update to iosys_map
Date: Tue,  8 Feb 2022 02:45:13 -0800
Message-Id: <20220208104524.2516209-8-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220208104524.2516209-1-lucas.demarchi@intel.com>
References: <20220208104524.2516209-1-lucas.demarchi@intel.com>
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
index b5b3a39f0c28..6a34ab38b45f 100644
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
@@ -554,7 +559,7 @@ static void __guc_ads_init(struct intel_guc *guc)
 	u32 base;
 
 	/* GuC scheduling policies */
-	guc_policies_init(guc, &blob->policies);
+	guc_policies_init(guc);
 
 	/* System info */
 	fill_engine_enable_masks(gt, &blob->system_info);
-- 
2.35.1

