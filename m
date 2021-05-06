Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB039375AB1
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 20:58:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 470326EDC5;
	Thu,  6 May 2021 18:57:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 904BC6ECF5;
 Thu,  6 May 2021 18:57:12 +0000 (UTC)
IronPort-SDR: 52KBJFWAHDGqGUqcOgkH/eaG1NjcPhne7J2U1R07ev7XcQ6eaznNJyZHJprue+KMeGwo10g5CJ
 LMm0NO2M5d5Q==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="196530999"
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="196530999"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:11 -0700
IronPort-SDR: wCFBQNPXXKj0ZFasEB0ZDQqPuqyZGPpVig/VCQusoyMqYbz4IozhGeOrYa9SYSuD0qOJOFJ0LD
 +CEUewVU9Q3A==
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="469583445"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:09 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 28/97] drm/i915/guc: Kill guc_clients.ct_pool
Date: Thu,  6 May 2021 12:13:42 -0700
Message-Id: <20210506191451.77768-29-matthew.brost@intel.com>
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

From: Michal Wajdeczko <michal.wajdeczko@intel.com>

CTB pool is now maintained internally by the GuC as part of its
"private data". No need to allocate separate buffer and pass it
to GuC as yet another ADS.

GuC: 57.0.0
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c  | 12 ------------
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h | 12 +-----------
 2 files changed, 1 insertion(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
index 648e1767b17a..775f00d706fa 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
@@ -25,8 +25,6 @@
  *      +---------------------------------------+
  *      | guc_clients_info                      |
  *      +---------------------------------------+
- *      | guc_ct_pool_entry[size]               |
- *      +---------------------------------------+
  *      | padding                               |
  *      +---------------------------------------+ <== 4K aligned
  *      | private data                          |
@@ -39,7 +37,6 @@ struct __guc_ads_blob {
 	struct guc_policies policies;
 	struct guc_gt_system_info system_info;
 	struct guc_clients_info clients_info;
-	struct guc_ct_pool_entry ct_pool[GUC_CT_POOL_SIZE];
 } __packed;
 
 static u32 guc_ads_private_data_size(struct intel_guc *guc)
@@ -67,11 +64,6 @@ static void guc_policies_init(struct guc_policies *policies)
 	policies->is_valid = 1;
 }
 
-static void guc_ct_pool_entries_init(struct guc_ct_pool_entry *pool, u32 num)
-{
-	memset(pool, 0, num * sizeof(*pool));
-}
-
 static void guc_mapping_table_init(struct intel_gt *gt,
 				   struct guc_gt_system_info *system_info)
 {
@@ -157,11 +149,7 @@ static void __guc_ads_init(struct intel_guc *guc)
 	base = intel_guc_ggtt_offset(guc, guc->ads_vma);
 
 	/* Clients info  */
-	guc_ct_pool_entries_init(blob->ct_pool, ARRAY_SIZE(blob->ct_pool));
-
 	blob->clients_info.clients_num = 1;
-	blob->clients_info.ct_pool_addr = base + ptr_offset(blob, ct_pool);
-	blob->clients_info.ct_pool_count = ARRAY_SIZE(blob->ct_pool);
 
 	/* ADS */
 	blob->ads.scheduler_policies = base + ptr_offset(blob, policies);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
index 95db4a7d3f4d..301b173a26bc 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
@@ -269,19 +269,9 @@ struct guc_gt_system_info {
 } __packed;
 
 /* Clients info */
-struct guc_ct_pool_entry {
-	struct guc_ct_buffer_desc desc;
-	u32 reserved[7];
-} __packed;
-
-#define GUC_CT_POOL_SIZE	2
-
 struct guc_clients_info {
 	u32 clients_num;
-	u32 reserved0[13];
-	u32 ct_pool_addr;
-	u32 ct_pool_count;
-	u32 reserved[4];
+	u32 reserved[19];
 } __packed;
 
 /* GuC Additional Data Struct */
-- 
2.28.0

