Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA6A39E5CE
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 19:46:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F8D36E9A0;
	Mon,  7 Jun 2021 17:46:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 212D66E98A;
 Mon,  7 Jun 2021 17:46:07 +0000 (UTC)
IronPort-SDR: MrdlJmaQFdPdAqWId6j0SeM95lGRQzCbhUv7w1mqzuX9ukuGkZ+mhFjmC7xTE/LNcUhKgnA4km
 Q/cR9CHuK8oQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="265824464"
X-IronPort-AV: E=Sophos;i="5.83,255,1616482800"; d="scan'208";a="265824464"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 10:46:06 -0700
IronPort-SDR: wQYG+gyx7YkgV+c8Md8Im14nwtROGAXpwJSNrQDU5h8p1Cxy52xRyTCKafinkj9+IIGyDMNGao
 S3hlSamU67Bw==
X-IronPort-AV: E=Sophos;i="5.83,255,1616482800"; d="scan'208";a="551970185"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 10:46:05 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 11/13] drm/i915/guc: Kill ads.client_info
Date: Mon,  7 Jun 2021 11:03:53 -0700
Message-Id: <20210607180356.165785-12-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210607180356.165785-1-matthew.brost@intel.com>
References: <20210607180356.165785-1-matthew.brost@intel.com>
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
Cc: daniele.ceraolospurio@intel.com, john.c.harrison@intel.com,
 Michal.Wajdeczko@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Michal Wajdeczko <michal.wajdeczko@intel.com>

New GuC does not require it any more.

Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c  | 7 -------
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h | 8 +-------
 2 files changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
index 6e26fe04ce92..b82145652d57 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
@@ -24,8 +24,6 @@
  *      +---------------------------------------+
  *      | guc_gt_system_info                    |
  *      +---------------------------------------+
- *      | guc_clients_info                      |
- *      +---------------------------------------+
  *      | padding                               |
  *      +---------------------------------------+ <== 4K aligned
  *      | private data                          |
@@ -37,7 +35,6 @@ struct __guc_ads_blob {
 	struct guc_ads ads;
 	struct guc_policies policies;
 	struct guc_gt_system_info system_info;
-	struct guc_clients_info clients_info;
 } __packed;
 
 static u32 guc_ads_private_data_size(struct intel_guc *guc)
@@ -152,13 +149,9 @@ static void __guc_ads_init(struct intel_guc *guc)
 
 	base = intel_guc_ggtt_offset(guc, guc->ads_vma);
 
-	/* Clients info  */
-	blob->clients_info.clients_num = 1;
-
 	/* ADS */
 	blob->ads.scheduler_policies = base + ptr_offset(blob, policies);
 	blob->ads.gt_system_info = base + ptr_offset(blob, system_info);
-	blob->ads.clients_info = base + ptr_offset(blob, clients_info);
 
 	/* Private Data */
 	blob->ads.private_data = base + guc_ads_private_data_offset(guc);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
index 2266444d074f..f2df5c11c11d 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
@@ -294,19 +294,13 @@ struct guc_gt_system_info {
 	u32 generic_gt_sysinfo[GUC_GENERIC_GT_SYSINFO_MAX];
 } __packed;
 
-/* Clients info */
-struct guc_clients_info {
-	u32 clients_num;
-	u32 reserved[19];
-} __packed;
-
 /* GuC Additional Data Struct */
 struct guc_ads {
 	struct guc_mmio_reg_set reg_state_list[GUC_MAX_ENGINE_CLASSES][GUC_MAX_INSTANCES_PER_CLASS];
 	u32 reserved0;
 	u32 scheduler_policies;
 	u32 gt_system_info;
-	u32 clients_info;
+	u32 reserved1;
 	u32 control_data;
 	u32 golden_context_lrca[GUC_MAX_ENGINE_CLASSES];
 	u32 eng_state_size[GUC_MAX_ENGINE_CLASSES];
-- 
2.28.0

