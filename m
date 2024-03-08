Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A98E875C33
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 03:03:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4206210F765;
	Fri,  8 Mar 2024 02:03:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lDcjsq5n";
	dkim-atps=neutral
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 279F810F765;
 Fri,  8 Mar 2024 02:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709863398; x=1741399398;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=N/ReINGNe1GlfcxvWO3VnOGkB1IBjcLiduhhLtEsG5o=;
 b=lDcjsq5ngoWS92mxSyaZZBAM/lMXDW0J8oo8USknx/IK69HeVbJoI2XW
 HlQuXAo1ouexMGVLuAwp6Cv6oMqEMe2d2GwFJWm1eNfkUubxYskGb7dBY
 20nJmjyGdpWl1EJ83LO5U0s75SJdBpqwp+T19NKcFNjj2kIRsYkeQa94S
 rWOtQDLnV3HePuk8+VTPxnlcfSmm2qxMIXBWCKIxHXS07VO5MEr79F0Y5
 2YPkYv0KyvKJar3+ARVYgIyeXV2lTcig1Oy5s6s/GbsGt26JxJFnuRZJV
 YTiJIGtug+ROMCiZtjZg5B6YZMZLAPZA9hQjVyKaAsKaZF3Ij9n6zU76f A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="7516225"
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; 
   d="scan'208";a="7516225"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 18:03:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; d="scan'208";a="10864818"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa008.jf.intel.com with ESMTP; 07 Mar 2024 18:03:17 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Cc: DRI-Devel@Lists.FreeDesktop.Org, John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH] drm/i915/guc: Update w/a 14019159160
Date: Thu,  7 Mar 2024 18:01:29 -0800
Message-ID: <20240308020129.728799-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.43.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

An existing workaround has been extended in both platforms affected
and implementation complexity.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h |  3 ++-
 drivers/gpu/drm/i915/gt/uc/intel_guc.c        |  3 ++-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    | 21 ++++++++++---------
 3 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h
index bebf28e3c4794..3e7060e859794 100644
--- a/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h
+++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h
@@ -105,7 +105,8 @@ enum {
  * Workaround keys:
  */
 enum {
-	GUC_WORKAROUND_KLV_SERIALIZED_RA_MODE				= 0x9001,
+	GUC_WORKAROUND_KLV_SERIALIZED_RA_MODE				= 0x9001,	/* Wa_14019159160 */
+	GUC_WORKAROUND_KLV_AVOID_GFX_CLEAR_WHILE_ACTIVE			= 0x9006,	/* Wa_14019159160 */
 };
 
 #endif /* _ABI_GUC_KLVS_ABI_H */
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
index 0c67d674c94de..4c3dae98656af 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
@@ -296,7 +296,8 @@ static u32 guc_ctl_wa_flags(struct intel_guc *guc)
 
 	/* Wa_16019325821 */
 	/* Wa_14019159160 */
-	if (IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 71)))
+	if (IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 71)) ||
+	    IS_DG2(gt->i915))
 		flags |= GUC_WA_RCS_CCS_SWITCHOUT;
 
 	/*
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
index 5c9908b56616e..00fe3c21a9b1c 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
@@ -815,23 +815,23 @@ guc_capture_prep_lists(struct intel_guc *guc)
 	return PAGE_ALIGN(total_size);
 }
 
-/* Wa_14019159160 */
-static u32 guc_waklv_ra_mode(struct intel_guc *guc, u32 offset, u32 remain)
+static void guc_waklv_enable_simple(struct intel_guc *guc, u32 *offset, u32 *remain, u32 klv_id)
 {
 	u32 size;
 	u32 klv_entry[] = {
 		/* 16:16 key/length */
-		FIELD_PREP(GUC_KLV_0_KEY, GUC_WORKAROUND_KLV_SERIALIZED_RA_MODE) |
+		FIELD_PREP(GUC_KLV_0_KEY, klv_id) |
 		FIELD_PREP(GUC_KLV_0_LEN, 0),
 		/* 0 dwords data */
 	};
 
 	size = sizeof(klv_entry);
-	GEM_BUG_ON(remain < size);
+	GEM_BUG_ON(*remain < size);
 
-	iosys_map_memcpy_to(&guc->ads_map, offset, klv_entry, size);
+	iosys_map_memcpy_to(&guc->ads_map, *offset, klv_entry, size);
 
-	return size;
+	*offset += size;
+	*remain -= size;
 }
 
 static void guc_waklv_init(struct intel_guc *guc)
@@ -850,10 +850,11 @@ static void guc_waklv_init(struct intel_guc *guc)
 	remain = guc_ads_waklv_size(guc);
 
 	/* Wa_14019159160 */
-	if (IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 71))) {
-		size = guc_waklv_ra_mode(guc, offset, remain);
-		offset += size;
-		remain -= size;
+	if (IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 71)) || IS_DG2(gt->i915)) {
+		guc_waklv_enable_simple(guc, &offset, &remain,
+					GUC_WORKAROUND_KLV_SERIALIZED_RA_MODE);
+		guc_waklv_enable_simple(guc, &offset, &remain,
+					GUC_WORKAROUND_KLV_AVOID_GFX_CLEAR_WHILE_ACTIVE);
 	}
 
 	size = guc_ads_waklv_size(guc) - remain;
-- 
2.43.0

