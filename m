Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B23D03A233D
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 06:19:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEA816E82F;
	Thu, 10 Jun 2021 04:19:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CF906E817;
 Thu, 10 Jun 2021 04:19:02 +0000 (UTC)
IronPort-SDR: MucaUfkukTguCk6vfaHFe0SaFvCbVk75DjFzWjPtLT33OAwPJrqoERXQPQck5W53NGPU7G2ygZ
 H2EWEMSA2THA==
X-IronPort-AV: E=McAfee;i="6200,9189,10010"; a="203373015"
X-IronPort-AV: E=Sophos;i="5.83,262,1616482800"; d="scan'208";a="203373015"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2021 21:19:02 -0700
IronPort-SDR: gxlCmnhfgtLfJ1RkqFKGMBbOYnvIM7799gl1Phu7Pv8n6QLTiw3JIJGz78k6oaXOcGpPWKQcCA
 p0Wuy5Z00HiA==
X-IronPort-AV: E=Sophos;i="5.83,262,1616482800"; d="scan'208";a="485997286"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2021 21:19:01 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 10/13] drm/i915/guc: Kill guc_clients.ct_pool
Date: Wed,  9 Jun 2021 21:36:46 -0700
Message-Id: <20210610043649.144416-11-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210610043649.144416-1-matthew.brost@intel.com>
References: <20210610043649.144416-1-matthew.brost@intel.com>
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
Cc: daniele.ceraolospurio@intel.com, john.c.harrison@intel.com,
 Michal.Wajdeczko@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Michal Wajdeczko <michal.wajdeczko@intel.com>

CTB pool is now maintained internally by the GuC as part of its
"private data". No need to allocate separate buffer and pass it
to GuC as yet another ADS.

Signed-off-by: Matthew Brost <matthew.brost@intel.com> #v4
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c  | 12 ------------
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h | 12 +-----------
 2 files changed, 1 insertion(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
index 4fcbe4b921f9..6e26fe04ce92 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
@@ -26,8 +26,6 @@
  *      +---------------------------------------+
  *      | guc_clients_info                      |
  *      +---------------------------------------+
- *      | guc_ct_pool_entry[size]               |
- *      +---------------------------------------+
  *      | padding                               |
  *      +---------------------------------------+ <== 4K aligned
  *      | private data                          |
@@ -40,7 +38,6 @@ struct __guc_ads_blob {
 	struct guc_policies policies;
 	struct guc_gt_system_info system_info;
 	struct guc_clients_info clients_info;
-	struct guc_ct_pool_entry ct_pool[GUC_CT_POOL_SIZE];
 } __packed;
 
 static u32 guc_ads_private_data_size(struct intel_guc *guc)
@@ -68,11 +65,6 @@ static void guc_policies_init(struct guc_policies *policies)
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
@@ -161,11 +153,7 @@ static void __guc_ads_init(struct intel_guc *guc)
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
index 251c3836bd2c..2266444d074f 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
@@ -295,19 +295,9 @@ struct guc_gt_system_info {
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

