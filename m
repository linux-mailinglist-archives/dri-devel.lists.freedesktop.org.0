Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A342D7A29E0
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 23:57:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E0F210E6A6;
	Fri, 15 Sep 2023 21:56:56 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B77610E69B;
 Fri, 15 Sep 2023 21:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694815009; x=1726351009;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ovVAm/7yvTDM1EVr217phYryBoonlsfi0RwtMf+fR2s=;
 b=Nwl6TL4vsb6t4eQ0MlzGGQ9ZP+G8y6gBHwxT1TRURAFmbj5tT0uC2yVF
 Wl4u1eiyIWhOied29IxyyrFwyRmslKJyMfFTvjswiVEW4EvkLP1HGxvEQ
 mN5KV//Cz3bSDq0/khnK+E/FdLUKub9ugiE92BlvOtLJn84WtaqzwtP3c
 nAjea7OhY1Ns4HtX+Px3Zej/R9sZ1HWIcLnjsPwACfcMq+wyyZyPlCtdB
 kJQUwe/1ZHtPDjnm6NGKCPKIm58FcLTui4CaKK+21Xb9po/oDGUgxdXCQ
 V6G7itx8F/sWNjeveobEVufuWiXqekjLx76ChdWs8P+994Qe1K0UxM6ZX w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="410297709"
X-IronPort-AV: E=Sophos;i="6.02,150,1688454000"; d="scan'208";a="410297709"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 14:56:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="918792872"
X-IronPort-AV: E=Sophos;i="6.02,150,1688454000"; d="scan'208";a="918792872"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga005.jf.intel.com with ESMTP; 15 Sep 2023 14:56:34 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 3/4] drm/i915/guc: Add support for w/a KLVs
Date: Fri, 15 Sep 2023 14:55:36 -0700
Message-ID: <20230915215537.220331-4-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230915215537.220331-1-John.C.Harrison@Intel.com>
References: <20230915215537.220331-1-John.C.Harrison@Intel.com>
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

To prevent running out of bits, new w/a enable flags are being added
via a KLV system instead of a 32 bit flags word.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 .../gpu/drm/i915/gt/uc/abi/guc_errors_abi.h   |  1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  3 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    | 64 ++++++++++++++++++-
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c     |  6 ++
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |  5 +-
 5 files changed, 77 insertions(+), 2 deletions(-)

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
index 6c392bad29c19..3b1fc5f96306b 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -186,6 +186,8 @@ struct intel_guc {
 	struct guc_mmio_reg *ads_regset;
 	/** @ads_golden_ctxt_size: size of the golden contexts in the ADS */
 	u32 ads_golden_ctxt_size;
+	/** @ads_waklv_size: size of workaround KLVs */
+	u32 ads_waklv_size;
 	/** @ads_capture_size: size of register lists in the ADS used for error capture */
 	u32 ads_capture_size;
 	/** @ads_engine_usage_size: size of engine usage in the ADS */
@@ -295,6 +297,7 @@ struct intel_guc {
 #define MAKE_GUC_VER(maj, min, pat)	(((maj) << 16) | ((min) << 8) | (pat))
 #define MAKE_GUC_VER_STRUCT(ver)	MAKE_GUC_VER((ver).major, (ver).minor, (ver).patch)
 #define GUC_SUBMIT_VER(guc)		MAKE_GUC_VER_STRUCT((guc)->submission_version)
+#define GUC_FIRMWARE_VER(guc)		MAKE_GUC_VER_STRUCT((guc)->fw.file_selected.ver)
 
 static inline struct intel_guc *log_to_guc(struct intel_guc_log *log)
 {
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
index 63724e17829a7..792910af3a481 100644
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
@@ -791,6 +810,40 @@ guc_capture_prep_lists(struct intel_guc *guc)
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
+	/* Add workarounds here */
+
+	size = guc_ads_waklv_size(guc) - remain;
+	if (!size)
+		return;
+
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
@@ -838,6 +891,9 @@ static void __guc_ads_init(struct intel_guc *guc)
 	/* MMIO save/restore list */
 	guc_mmio_reg_state_init(guc);
 
+	/* Workaround KLV list */
+	guc_waklv_init(guc);
+
 	/* Private Data */
 	ads_blob_write(guc, ads.private_data, base +
 		       guc_ads_private_data_offset(guc));
@@ -881,6 +937,12 @@ int intel_guc_ads_create(struct intel_guc *guc)
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
index 0f79cb6585182..a54d58b9243b0 100644
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
index f97af0168a66b..3266842d925e6 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
@@ -429,7 +429,10 @@ struct guc_ads {
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
2.41.0

