Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB774B8F66
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 18:41:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D2E110E87D;
	Wed, 16 Feb 2022 17:40:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D512010E859;
 Wed, 16 Feb 2022 17:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645033256; x=1676569256;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M0ZMnLDzXExASVU3kcyEzNdpBPqgDPXxAy9QpkOLPiA=;
 b=lvEFLLqGtn80DlkXu9mOuVdUiWSS3MiFv4NtYWUqaW75KVrY4PvYMcZO
 z+QZ8+DJk94tG9MIvLKy1hzi1Rs6fLYv2sHRjLV6ogczEswWaP1qJ4aT9
 2FT3cTgpFWPhFUfdF8a63buMZ/9U/TveAvpQzhW0H+YwDVcUg4wtW8zGD
 oWik6mTy1UXxT5KnuLPe94FjJ2tSq/yEY8KMg7fuPur7P4q7+npseQz9E
 yFagUeL7WIvKfkE6yoAVDw4/pxxZRmiHmxywKNCW8eL9bwNYSbKXzuT/1
 Tnnw89STms4M+E+HAQLovvV6IzpUKmRsDIju21Wf984C3O4neXztKpuF5 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="230641952"
X-IronPort-AV: E=Sophos;i="5.88,374,1635231600"; d="scan'208";a="230641952"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 09:40:56 -0800
X-IronPort-AV: E=Sophos;i="5.88,374,1635231600"; d="scan'208";a="540226677"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 09:40:55 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 08/16] drm/i915/guc: Convert engine record to iosys_map
Date: Wed, 16 Feb 2022 09:41:39 -0800
Message-Id: <20220216174147.3073235-9-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220216174147.3073235-1-lucas.demarchi@intel.com>
References: <20220216174147.3073235-1-lucas.demarchi@intel.com>
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
 Matt Atwood <matthew.s.atwood@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use iosys_map to read fields from the dma_blob so access to IO and
system memory is abstracted away.

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matt Atwood<matthew.s.atwood@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c      | 14 ++++++--------
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.h      |  3 ++-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c   | 17 ++++++++++-------
 3 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
index 7906a4df5a53..c61648ef3920 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
@@ -738,18 +738,16 @@ void intel_guc_ads_reset(struct intel_guc *guc)
 
 u32 intel_guc_engine_usage_offset(struct intel_guc *guc)
 {
-	struct __guc_ads_blob *blob = guc->ads_blob;
-	u32 base = intel_guc_ggtt_offset(guc, guc->ads_vma);
-	u32 offset = base + ptr_offset(blob, engine_usage);
-
-	return offset;
+	return intel_guc_ggtt_offset(guc, guc->ads_vma) +
+		offsetof(struct __guc_ads_blob, engine_usage);
 }
 
-struct guc_engine_usage_record *intel_guc_engine_usage(struct intel_engine_cs *engine)
+struct iosys_map intel_guc_engine_usage_record_map(struct intel_engine_cs *engine)
 {
 	struct intel_guc *guc = &engine->gt->uc.guc;
-	struct __guc_ads_blob *blob = guc->ads_blob;
 	u8 guc_class = engine_class_to_guc_class(engine->class);
+	size_t offset = offsetof(struct __guc_ads_blob,
+				 engine_usage.engines[guc_class][ilog2(engine->logical_mask)]);
 
-	return &blob->engine_usage.engines[guc_class][ilog2(engine->logical_mask)];
+	return IOSYS_MAP_INIT_OFFSET(&guc->ads_map, offset);
 }
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.h
index e74c110facff..1c64f4d6ea21 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.h
@@ -7,6 +7,7 @@
 #define _INTEL_GUC_ADS_H_
 
 #include <linux/types.h>
+#include <linux/iosys-map.h>
 
 struct intel_guc;
 struct drm_printer;
@@ -18,7 +19,7 @@ void intel_guc_ads_init_late(struct intel_guc *guc);
 void intel_guc_ads_reset(struct intel_guc *guc);
 void intel_guc_ads_print_policy_info(struct intel_guc *guc,
 				     struct drm_printer *p);
-struct guc_engine_usage_record *intel_guc_engine_usage(struct intel_engine_cs *engine);
+struct iosys_map intel_guc_engine_usage_record_map(struct intel_engine_cs *engine);
 u32 intel_guc_engine_usage_offset(struct intel_guc *guc);
 
 #endif
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index b3a429a92c0d..ab3cea352fb3 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -1139,6 +1139,9 @@ __extend_last_switch(struct intel_guc *guc, u64 *prev_start, u32 new_start)
 	*prev_start = ((u64)gt_stamp_hi << 32) | new_start;
 }
 
+#define record_read(map_, field_) \
+	iosys_map_rd_field(map_, 0, struct guc_engine_usage_record, field_)
+
 /*
  * GuC updates shared memory and KMD reads it. Since this is not synchronized,
  * we run into a race where the value read is inconsistent. Sometimes the
@@ -1153,17 +1156,17 @@ __extend_last_switch(struct intel_guc *guc, u64 *prev_start, u32 new_start)
 static void __get_engine_usage_record(struct intel_engine_cs *engine,
 				      u32 *last_in, u32 *id, u32 *total)
 {
-	struct guc_engine_usage_record *rec = intel_guc_engine_usage(engine);
+	struct iosys_map rec_map = intel_guc_engine_usage_record_map(engine);
 	int i = 0;
 
 	do {
-		*last_in = READ_ONCE(rec->last_switch_in_stamp);
-		*id = READ_ONCE(rec->current_context_index);
-		*total = READ_ONCE(rec->total_runtime);
+		*last_in = record_read(&rec_map, last_switch_in_stamp);
+		*id = record_read(&rec_map, current_context_index);
+		*total = record_read(&rec_map, total_runtime);
 
-		if (READ_ONCE(rec->last_switch_in_stamp) == *last_in &&
-		    READ_ONCE(rec->current_context_index) == *id &&
-		    READ_ONCE(rec->total_runtime) == *total)
+		if (record_read(&rec_map, last_switch_in_stamp) == *last_in &&
+		    record_read(&rec_map, current_context_index) == *id &&
+		    record_read(&rec_map, total_runtime) == *total)
 			break;
 	} while (++i < 6);
 }
-- 
2.35.1

