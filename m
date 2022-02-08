Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C48984AD5AE
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 11:46:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C92B10E65A;
	Tue,  8 Feb 2022 10:45:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1985710E5F4;
 Tue,  8 Feb 2022 10:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644317113; x=1675853113;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Oh5hTrf8eL7/q01QyI0Z1bHEv4VouO2dvuguKWUXndc=;
 b=MfSgylSB8/364Iyvd/CDFFBks4ADwZ/csSW59Ht5paW0L03rwAEs9HDk
 k/44u2/f2IipXyQTuWp9Gh5blTMAVcIevIoo06dLb/brFEEftu+b5S61b
 3PTNIgNiVJUM5DO3tY0DLMnHYywd8LNCW+fOK8VYwEZPNMyi5RjublmmN
 IjrKmS29KflucMqRrtXhnHqDaNt9qXChIqk2U6nc3yXq5gGLMylIfQggo
 Dy3tCkwpOOz8u92brAdvYah8rC7gJw0m1hC9jQfjRZ8HqDgZ45JPWdOiN
 XGwTwtd4vGUBRUOQToGxhpQKSa0HSDe+TDksuMJYXe0beLymjTaCX35P/ w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10251"; a="249130481"
X-IronPort-AV: E=Sophos;i="5.88,352,1635231600"; d="scan'208";a="249130481"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 02:45:11 -0800
X-IronPort-AV: E=Sophos;i="5.88,352,1635231600"; d="scan'208";a="700804123"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 02:45:09 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 06/18] drm/i915/guc: Convert golden context init to
 iosys_map
Date: Tue,  8 Feb 2022 02:45:12 -0800
Message-Id: <20220208104524.2516209-7-lucas.demarchi@intel.com>
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

Now the map is saved during creation, so use it to initialize the
golden context, reading from shmem and writing to either system or IO
memory.

v2: Do not use a map iterator: add an offset to keep track of
destination

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c | 26 ++++++++++------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
index 9bf9096b8337..b5b3a39f0c28 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
@@ -473,18 +473,16 @@ static struct intel_engine_cs *find_engine_state(struct intel_gt *gt, u8 engine_
 
 static void guc_init_golden_context(struct intel_guc *guc)
 {
-	struct __guc_ads_blob *blob = guc->ads_blob;
 	struct intel_engine_cs *engine;
 	struct intel_gt *gt = guc_to_gt(guc);
-	u32 addr_ggtt, offset;
-	u32 total_size = 0, alloc_size, real_size;
+	unsigned long offset;
+	u32 addr_ggtt, total_size = 0, alloc_size, real_size;
 	u8 engine_class, guc_class;
-	u8 *ptr;
 
 	if (!intel_uc_uses_guc_submission(&gt->uc))
 		return;
 
-	GEM_BUG_ON(!blob);
+	GEM_BUG_ON(iosys_map_is_null(&guc->ads_map));
 
 	/*
 	 * Go back and fill in the golden context data now that it is
@@ -492,15 +490,13 @@ static void guc_init_golden_context(struct intel_guc *guc)
 	 */
 	offset = guc_ads_golden_ctxt_offset(guc);
 	addr_ggtt = intel_guc_ggtt_offset(guc, guc->ads_vma) + offset;
-	ptr = ((u8 *)blob) + offset;
 
 	for (engine_class = 0; engine_class <= MAX_ENGINE_CLASS; ++engine_class) {
 		if (engine_class == OTHER_CLASS)
 			continue;
 
 		guc_class = engine_class_to_guc_class(engine_class);
-
-		if (!blob->system_info.engine_enabled_masks[guc_class])
+		if (!ads_blob_read(guc, system_info.engine_enabled_masks[guc_class]))
 			continue;
 
 		real_size = intel_engine_context_size(gt, engine_class);
@@ -511,18 +507,20 @@ static void guc_init_golden_context(struct intel_guc *guc)
 		if (!engine) {
 			drm_err(&gt->i915->drm, "No engine state recorded for class %d!\n",
 				engine_class);
-			blob->ads.eng_state_size[guc_class] = 0;
-			blob->ads.golden_context_lrca[guc_class] = 0;
+			ads_blob_write(guc, ads.eng_state_size[guc_class], 0);
+			ads_blob_write(guc, ads.golden_context_lrca[guc_class], 0);
 			continue;
 		}
 
-		GEM_BUG_ON(blob->ads.eng_state_size[guc_class] !=
+		GEM_BUG_ON(ads_blob_read(guc, ads.eng_state_size[guc_class]) !=
 			   real_size - LRC_SKIP_SIZE);
-		GEM_BUG_ON(blob->ads.golden_context_lrca[guc_class] != addr_ggtt);
+		GEM_BUG_ON(ads_blob_read(guc, ads.golden_context_lrca[guc_class]) != addr_ggtt);
+
 		addr_ggtt += alloc_size;
 
-		shmem_read(engine->default_state, 0, ptr, real_size);
-		ptr += alloc_size;
+		shmem_read_to_iosys_map(engine->default_state, 0, &guc->ads_map,
+					offset, real_size);
+		offset += alloc_size;
 	}
 
 	GEM_BUG_ON(guc->ads_golden_ctxt_size != total_size);
-- 
2.35.1

