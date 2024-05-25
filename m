Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF518CED70
	for <lists+dri-devel@lfdr.de>; Sat, 25 May 2024 03:41:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBCEB10E07F;
	Sat, 25 May 2024 01:41:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LT0AXzib";
	dkim-atps=neutral
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9585210E06F;
 Sat, 25 May 2024 01:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716601283; x=1748137283;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=22sYjeCPBLcaynIr8avI6SzCkaIP62q9DCQYQSn/QCU=;
 b=LT0AXzib3wIRzf2FgcsiSJ4fo/cFsKgxveq4qxKHcbxnUXGOhkj9AmIl
 waxB1MQ8ZjrHe9YeZixYJZugV7podbS7fpxvsoseNM3/m2wfVVVH6m0AG
 2Aqr81/6/KQsg6YUv3uN27UDbtTynOvadql/WQLvZoORJjg/9N98Lun4x
 8ZODEVyy/gF23b0DmTaROMwXhXnbVUfQb/LAROmFOnUhtr5cNruGlF4yc
 Nir2CtWvL7zmQqftcQ49gN4J+o83grYjwg9KCnx6li7YymP1VKXvHE8g9
 WOgq2rh2vAvO6tgdpk1JPjTxPvMVREXaF5+E8kioS3XJQByhn1y9HqRJb g==;
X-CSE-ConnectionGUID: LPsyvM7oRJSHqNalqCceYQ==
X-CSE-MsgGUID: zkQkvuggT8uDOIcJeD+bXA==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="12865928"
X-IronPort-AV: E=Sophos;i="6.08,187,1712646000"; d="scan'208";a="12865928"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 18:41:22 -0700
X-CSE-ConnectionGUID: h6xBPJ2XSBiLqtvOTT5yQQ==
X-CSE-MsgGUID: YByuyC/nTFy2+KaxICfjCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,187,1712646000"; d="scan'208";a="34200357"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa006.fm.intel.com with ESMTP; 24 May 2024 18:41:21 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Cc: DRI-Devel@Lists.FreeDesktop.Org, John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH] drm/i915/guc: Enable w/a 14019882105 for DG2 and MTL
Date: Fri, 24 May 2024 18:41:20 -0700
Message-ID: <20240525014121.4157254-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.43.2
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

Enable another workaround that is implemented inside the GuC.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h |  1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    | 32 ++++++++++++-------
 2 files changed, 21 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h
index 525587cfe1af9..37ff539a6963d 100644
--- a/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h
+++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h
@@ -106,6 +106,7 @@ enum {
  */
 enum {
 	GUC_WORKAROUND_KLV_SERIALIZED_RA_MODE				= 0x9001,
+	GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED		= 0x9002,
 };
 
 #endif /* _ABI_GUC_KLVS_ABI_H */
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
index c606bb5e3b7b0..6c382785bc60b 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
@@ -815,23 +815,23 @@ guc_capture_prep_lists(struct intel_guc *guc)
 	return PAGE_ALIGN(total_size);
 }
 
-/* Wa_14019159160 */
-static u32 guc_waklv_ra_mode(struct intel_guc *guc, u32 offset, u32 remain)
+static void guc_waklv_enable_simple(struct intel_guc *guc,
+				    u32 klv_id, u32 *offset, u32 *remain)
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
-
-	return size;
+	iosys_map_memcpy_to(&guc->ads_map, *offset, klv_entry, size);
+	*offset += size;
+	*remain -= size;
 }
 
 static void guc_waklv_init(struct intel_guc *guc)
@@ -850,11 +850,19 @@ static void guc_waklv_init(struct intel_guc *guc)
 	remain = guc_ads_waklv_size(guc);
 
 	/* Wa_14019159160 */
-	if (IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 71))) {
-		size = guc_waklv_ra_mode(guc, offset, remain);
-		offset += size;
-		remain -= size;
-	}
+	if (IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 71)))
+		guc_waklv_enable_simple(guc,
+					GUC_WORKAROUND_KLV_SERIALIZED_RA_MODE,
+					&offset, &remain);
+
+	/* Wa_14019882105 */
+	if ((GUC_FIRMWARE_VER(guc) >= MAKE_GUC_VER(70, 21, 1)) &&
+	    (IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 71)) ||
+	     IS_MEDIA_GT_IP_RANGE(gt, IP_VER(13, 0), IP_VER(13, 0)) ||
+	     IS_DG2(gt->i915)))
+		guc_waklv_enable_simple(guc,
+					GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED,
+					&offset, &remain);
 
 	size = guc_ads_waklv_size(guc) - remain;
 	if (!size)
-- 
2.43.2

