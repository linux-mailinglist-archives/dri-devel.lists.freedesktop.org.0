Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 072D34C99F4
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 01:34:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95E398933D;
	Wed,  2 Mar 2022 00:34:06 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B61B910E549;
 Wed,  2 Mar 2022 00:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646181238; x=1677717238;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iSepYJAFCdMzvh1cXZAIiBiKDOW0bLqK06gNgnrGgLA=;
 b=NZlyvcngr4T/3J7Fma+YYXwX52arHbINaHUuAZHaaOIicP2rHKTdxpD2
 9ySka4xYxBWEi4qj0F17zsg3csBO/8SXkkzIDOBi/SXy5gx7jKdVsPplK
 1u2AlZJQb44JMn4kyHjXWTiebExJWICgO5hcW4v9ZPVU2HNb/ryh5Ktc8
 ygBDCs9KXL3OLeJxutLHloNhDgqRLOHZZaZsrnu0thzftO3ECJOwa/Z7F
 PiNLgga4u18MOqxPX85oXV0p11Q8nIhrXVDHuHeyGvDx+o2LUjqazm62o
 xS2JVEUT7QDbsl+96jHdAsg1sgXf4ET9U/S3Wbaqf9HePLYMVCI68J8uB Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10273"; a="233243139"
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="233243139"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 16:33:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="639577374"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by fmsmga002.fm.intel.com with ESMTP; 01 Mar 2022 16:33:57 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v3 3/8] drm/i915/guc: Better name for context id limit
Date: Tue,  1 Mar 2022 16:33:52 -0800
Message-Id: <20220302003357.4188363-4-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220302003357.4188363-1-John.C.Harrison@Intel.com>
References: <20220302003357.4188363-1-John.C.Harrison@Intel.com>
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

The LRC descriptor pool is going away. So, stop using it as the limit
for how many context ids are available. Instead, size the pool
according to the number of contexts allowed. Note that this is just a
naming change, the actual limit is identical in value.

While at it, also update a kzalloc(sizeof()*count) to be a
kcalloc(count,size).

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_context.c          |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h      |  4 ++--
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c    | 16 ++++++++--------
 drivers/gpu/drm/i915/gt/uc/selftest_guc.c        |  2 +-
 4 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
index 5d0ec7c49b6a..d87145b8fca0 100644
--- a/drivers/gpu/drm/i915/gt/intel_context.c
+++ b/drivers/gpu/drm/i915/gt/intel_context.c
@@ -400,7 +400,7 @@ intel_context_init(struct intel_context *ce, struct intel_engine_cs *engine)
 	INIT_LIST_HEAD(&ce->guc_state.fences);
 	INIT_LIST_HEAD(&ce->guc_state.requests);
 
-	ce->guc_id.id = GUC_INVALID_LRC_ID;
+	ce->guc_id.id = GUC_INVALID_CONTEXT_ID;
 	INIT_LIST_HEAD(&ce->guc_id.link);
 
 	INIT_LIST_HEAD(&ce->destroyed_link);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
index 6a4612a852e2..11099f0320ce 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
@@ -32,8 +32,8 @@
 #define GUC_CLIENT_PRIORITY_NORMAL	3
 #define GUC_CLIENT_PRIORITY_NUM		4
 
-#define GUC_MAX_LRC_DESCRIPTORS		65535
-#define	GUC_INVALID_LRC_ID		GUC_MAX_LRC_DESCRIPTORS
+#define GUC_MAX_CONTEXT_ID		65535
+#define	GUC_INVALID_CONTEXT_ID		GUC_MAX_CONTEXT_ID
 
 #define GUC_RENDER_ENGINE		0
 #define GUC_VIDEO_ENGINE		1
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index f2251ce8776e..833e57e67f2f 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -351,12 +351,12 @@ request_to_scheduling_context(struct i915_request *rq)
 
 static inline bool context_guc_id_invalid(struct intel_context *ce)
 {
-	return ce->guc_id.id == GUC_INVALID_LRC_ID;
+	return ce->guc_id.id == GUC_INVALID_CONTEXT_ID;
 }
 
 static inline void set_context_guc_id_invalid(struct intel_context *ce)
 {
-	ce->guc_id.id = GUC_INVALID_LRC_ID;
+	ce->guc_id.id = GUC_INVALID_CONTEXT_ID;
 }
 
 static inline struct intel_guc *ce_to_guc(struct intel_context *ce)
@@ -471,7 +471,7 @@ static struct guc_lrc_desc *__get_lrc_desc(struct intel_guc *guc, u32 index)
 {
 	struct guc_lrc_desc *base = guc->lrc_desc_pool_vaddr;
 
-	GEM_BUG_ON(index >= GUC_MAX_LRC_DESCRIPTORS);
+	GEM_BUG_ON(index >= GUC_MAX_CONTEXT_ID);
 
 	return &base[index];
 }
@@ -480,7 +480,7 @@ static inline struct intel_context *__get_context(struct intel_guc *guc, u32 id)
 {
 	struct intel_context *ce = xa_load(&guc->context_lookup, id);
 
-	GEM_BUG_ON(id >= GUC_MAX_LRC_DESCRIPTORS);
+	GEM_BUG_ON(id >= GUC_MAX_CONTEXT_ID);
 
 	return ce;
 }
@@ -491,7 +491,7 @@ static int guc_lrc_desc_pool_create(struct intel_guc *guc)
 	int ret;
 
 	size = PAGE_ALIGN(sizeof(struct guc_lrc_desc) *
-			  GUC_MAX_LRC_DESCRIPTORS);
+			  GUC_MAX_CONTEXT_ID);
 	ret = intel_guc_allocate_and_map_vma(guc, size, &guc->lrc_desc_pool,
 					     (void **)&guc->lrc_desc_pool_vaddr);
 	if (ret)
@@ -2428,7 +2428,7 @@ static void __guc_context_sched_disable(struct intel_guc *guc,
 		GUC_CONTEXT_DISABLE
 	};
 
-	GEM_BUG_ON(guc_id == GUC_INVALID_LRC_ID);
+	GEM_BUG_ON(guc_id == GUC_INVALID_CONTEXT_ID);
 
 	GEM_BUG_ON(intel_context_is_child(ce));
 	trace_intel_context_sched_disable(ce);
@@ -3841,7 +3841,7 @@ void intel_guc_submission_init_early(struct intel_guc *guc)
 	spin_lock_init(&guc->timestamp.lock);
 	INIT_DELAYED_WORK(&guc->timestamp.work, guc_timestamp_ping);
 
-	guc->submission_state.num_guc_ids = GUC_MAX_LRC_DESCRIPTORS;
+	guc->submission_state.num_guc_ids = GUC_MAX_CONTEXT_ID;
 	guc->submission_supported = __guc_submission_supported(guc);
 	guc->submission_selected = __guc_submission_selected(guc);
 }
@@ -3851,7 +3851,7 @@ g2h_context_lookup(struct intel_guc *guc, u32 desc_idx)
 {
 	struct intel_context *ce;
 
-	if (unlikely(desc_idx >= GUC_MAX_LRC_DESCRIPTORS)) {
+	if (unlikely(desc_idx >= GUC_MAX_CONTEXT_ID)) {
 		drm_err(&guc_to_gt(guc)->i915->drm,
 			"Invalid desc_idx %u", desc_idx);
 		return NULL;
diff --git a/drivers/gpu/drm/i915/gt/uc/selftest_guc.c b/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
index a115894d5896..1df71d0796ae 100644
--- a/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
+++ b/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
@@ -148,7 +148,7 @@ static int intel_guc_steal_guc_ids(void *arg)
 	struct i915_request *spin_rq = NULL, *rq, *last = NULL;
 	int number_guc_id_stolen = guc->number_guc_id_stolen;
 
-	ce = kzalloc(sizeof(*ce) * GUC_MAX_LRC_DESCRIPTORS, GFP_KERNEL);
+	ce = kcalloc(GUC_MAX_CONTEXT_ID, sizeof(*ce), GFP_KERNEL);
 	if (!ce) {
 		pr_err("Context array allocation failed\n");
 		return -ENOMEM;
-- 
2.25.1

