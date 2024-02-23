Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B697861E3F
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 21:58:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D296D10E050;
	Fri, 23 Feb 2024 20:58:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jpyCQY+v";
	dkim-atps=neutral
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFFEE10E050;
 Fri, 23 Feb 2024 20:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708721922; x=1740257922;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2YBVp8rg5cd5IolaAK9ONZKn1jJ6ym6n05FByndDasA=;
 b=jpyCQY+vaLs7HDwBEfoxpWkK8mnXAI7ct0cp7Kej207UZjeSzyUZf/gv
 YbCc3pTOmhbq4xhtd7gGdoGpVXmryIbOap25HOZ8FQSVPnb4GXyP6hV62
 ZqYAPlopn4ivS6pltyA5YdjT4sP01q1OLuLyScBa/kNEznLB5zuHU4ZkE
 ygHFedEgL3UdOZdfShg4WgFtTKrJzRnWCp+1+NnpyqRfpVp1msYn0lPiY
 d4We7T6T1hdYNtZsf4YXdywdpMr+vBvp82I6q1qevHfwxd7iojo0Elfg4
 u2/Cd5MQ6AZxvzgYRo0M/GyuBh59fwv+ohWIzpg/A0DKepswbMbetXvVN Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="20604773"
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; d="scan'208";a="20604773"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2024 12:58:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="5908502"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa007.fm.intel.com with ESMTP; 23 Feb 2024 12:58:41 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Cc: DRI-Devel@Lists.FreeDesktop.Org, John Harrison <John.C.Harrison@Intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH v3 2/3] drm/i915/guc: Add support for w/a KLVs
Date: Fri, 23 Feb 2024 12:56:31 -0800
Message-ID: <20240223205632.1621019-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240223205632.1621019-1-John.C.Harrison@Intel.com>
References: <20240223205632.1621019-1-John.C.Harrison@Intel.com>
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

To prevent running out of bits, new w/a enable flags are being added
via a KLV system instead of a 32 bit flags word.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 .../gpu/drm/i915/gt/uc/abi/guc_errors_abi.h   |  1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  2 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    | 73 ++++++++++++++++++-
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c     |  6 ++
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |  5 +-
 5 files changed, 85 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h
index dabeaf4f245f3..00d6402333f8e 100644
--- a/drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h
+++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h
@@ -36,6 +36,7 @@ enum intel_guc_load_status {
 	INTEL_GUC_LOAD_STATUS_INVALID_INIT_DATA_RANGE_START,
 	INTEL_GUC_LOAD_STATUS_MPU_DATA_INVALID                 = 0x73,
 	INTEL_GUC_LOAD_STATUS_INIT_MMIO_SAVE_RESTORE_INVALID   = 0x74,
+	INTEL_GUC_LOAD_STATUS_KLV_WORKAROUND_INIT_ERROR        = 0x75,
 	INTEL_GUC_LOAD_STATUS_INVALID_INIT_DATA_RANGE_END,
 
 	INTEL_GUC_LOAD_STATUS_READY                            = 0xF0,
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
index be70c46604b49..57b9031327767 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -204,6 +204,8 @@ struct intel_guc {
 	struct guc_mmio_reg *ads_regset;
 	/** @ads_golden_ctxt_size: size of the golden contexts in the ADS */
 	u32 ads_golden_ctxt_size;
+	/** @ads_waklv_size: size of workaround KLVs */
+	u32 ads_waklv_size;
 	/** @ads_capture_size: size of register lists in the ADS used for error capture */
 	u32 ads_capture_size;
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
index f7372f736a776..6af3fa8b92e34 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
@@ -46,6 +46,10 @@
  *      +---------------------------------------+
  *      | padding                               |
  *      +---------------------------------------+ <== 4K aligned
+ *      | w/a KLVs                              |
+ *      +---------------------------------------+
+ *      | padding                               |
+ *      +---------------------------------------+ <== 4K aligned
  *      | capture lists                         |
  *      +---------------------------------------+
  *      | padding                               |
@@ -88,6 +92,11 @@ static u32 guc_ads_golden_ctxt_size(struct intel_guc *guc)
 	return PAGE_ALIGN(guc->ads_golden_ctxt_size);
 }
 
+static u32 guc_ads_waklv_size(struct intel_guc *guc)
+{
+	return PAGE_ALIGN(guc->ads_waklv_size);
+}
+
 static u32 guc_ads_capture_size(struct intel_guc *guc)
 {
 	return PAGE_ALIGN(guc->ads_capture_size);
@@ -113,7 +122,7 @@ static u32 guc_ads_golden_ctxt_offset(struct intel_guc *guc)
 	return PAGE_ALIGN(offset);
 }
 
-static u32 guc_ads_capture_offset(struct intel_guc *guc)
+static u32 guc_ads_waklv_offset(struct intel_guc *guc)
 {
 	u32 offset;
 
@@ -123,6 +132,16 @@ static u32 guc_ads_capture_offset(struct intel_guc *guc)
 	return PAGE_ALIGN(offset);
 }
 
+static u32 guc_ads_capture_offset(struct intel_guc *guc)
+{
+	u32 offset;
+
+	offset = guc_ads_waklv_offset(guc) +
+		 guc_ads_waklv_size(guc);
+
+	return PAGE_ALIGN(offset);
+}
+
 static u32 guc_ads_private_data_offset(struct intel_guc *guc)
 {
 	u32 offset;
@@ -796,6 +815,49 @@ guc_capture_prep_lists(struct intel_guc *guc)
 	return PAGE_ALIGN(total_size);
 }
 
+static void guc_waklv_init(struct intel_guc *guc)
+{
+	struct intel_gt *gt = guc_to_gt(guc);
+	u32 offset, addr_ggtt, remain, size;
+
+	if (!intel_uc_uses_guc_submission(&gt->uc))
+		return;
+
+	if (GUC_FIRMWARE_VER(guc) < MAKE_GUC_VER(70, 10, 0))
+		return;
+
+	GEM_BUG_ON(iosys_map_is_null(&guc->ads_map));
+	offset = guc_ads_waklv_offset(guc);
+	remain = guc_ads_waklv_size(guc);
+
+	/*
+	 * Add workarounds here:
+	 *
+	 * if (want_wa_<name>) {
+	 *	size = guc_waklv_<name>(guc, offset, remain);
+	 *	offset += size;
+	 *	remain -= size;
+	 * }
+	 */
+
+	size = guc_ads_waklv_size(guc) - remain;
+	if (!size)
+		return;
+
+	offset = guc_ads_waklv_offset(guc);
+	addr_ggtt = intel_guc_ggtt_offset(guc, guc->ads_vma) + offset;
+
+	ads_blob_write(guc, ads.wa_klv_addr_lo, addr_ggtt);
+	ads_blob_write(guc, ads.wa_klv_addr_hi, 0);
+	ads_blob_write(guc, ads.wa_klv_size, size);
+}
+
+static int guc_prep_waklv(struct intel_guc *guc)
+{
+	/* Fudge something chunky for now: */
+	return PAGE_SIZE;
+}
+
 static void __guc_ads_init(struct intel_guc *guc)
 {
 	struct intel_gt *gt = guc_to_gt(guc);
@@ -843,6 +905,9 @@ static void __guc_ads_init(struct intel_guc *guc)
 	/* MMIO save/restore list */
 	guc_mmio_reg_state_init(guc);
 
+	/* Workaround KLV list */
+	guc_waklv_init(guc);
+
 	/* Private Data */
 	ads_blob_write(guc, ads.private_data, base +
 		       guc_ads_private_data_offset(guc));
@@ -886,6 +951,12 @@ int intel_guc_ads_create(struct intel_guc *guc)
 		return ret;
 	guc->ads_capture_size = ret;
 
+	/* And don't forget the workaround KLVs: */
+	ret = guc_prep_waklv(guc);
+	if (ret < 0)
+		return ret;
+	guc->ads_waklv_size = ret;
+
 	/* Now the total size can be determined: */
 	size = guc_ads_blob_size(guc);
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
index 52332bb143395..0a37c426cde4d 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
@@ -115,6 +115,7 @@ static inline bool guc_load_done(struct intel_uncore *uncore, u32 *status, bool
 	case INTEL_GUC_LOAD_STATUS_INIT_DATA_INVALID:
 	case INTEL_GUC_LOAD_STATUS_MPU_DATA_INVALID:
 	case INTEL_GUC_LOAD_STATUS_INIT_MMIO_SAVE_RESTORE_INVALID:
+	case INTEL_GUC_LOAD_STATUS_KLV_WORKAROUND_INIT_ERROR:
 		*success = false;
 		return true;
 	}
@@ -241,6 +242,11 @@ static int guc_wait_ucode(struct intel_guc *guc)
 			ret = -EPERM;
 			break;
 
+		case INTEL_GUC_LOAD_STATUS_KLV_WORKAROUND_INIT_ERROR:
+			guc_info(guc, "invalid w/a KLV entry\n");
+			ret = -EINVAL;
+			break;
+
 		case INTEL_GUC_LOAD_STATUS_HWCONFIG_START:
 			guc_info(guc, "still extracting hwconfig table.\n");
 			ret = -ETIMEDOUT;
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
index 48863188a130e..14797e80bc92c 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
@@ -431,7 +431,10 @@ struct guc_ads {
 	u32 capture_instance[GUC_CAPTURE_LIST_INDEX_MAX][GUC_MAX_ENGINE_CLASSES];
 	u32 capture_class[GUC_CAPTURE_LIST_INDEX_MAX][GUC_MAX_ENGINE_CLASSES];
 	u32 capture_global[GUC_CAPTURE_LIST_INDEX_MAX];
-	u32 reserved[14];
+	u32 wa_klv_addr_lo;
+	u32 wa_klv_addr_hi;
+	u32 wa_klv_size;
+	u32 reserved[11];
 } __packed;
 
 /* Engine usage stats */
-- 
2.43.0

