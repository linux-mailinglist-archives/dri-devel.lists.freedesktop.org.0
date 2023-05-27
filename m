Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 321417130FE
	for <lists+dri-devel@lfdr.de>; Sat, 27 May 2023 02:53:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2286810E216;
	Sat, 27 May 2023 00:53:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C1C910E202;
 Sat, 27 May 2023 00:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685148780; x=1716684780;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B59Cd5CaAjmnctW1c5dOLnTG9Bf2pXwDEBdylBra/lo=;
 b=nfFHCP2oD5GbNkK34gmpC/u+OJRg1oCLvs07xMRseAqzWQdaQnbTNGsc
 ohnkCBVNAUe5yZOIc3aQ0B7VOtPLB+Zluv9b5h5Ja9SGQdClByAGZPwt3
 TXDBiAZ64/z958U27zHb08wUsk/K/UayFAdHEkVlT3uvR6u+WslMbnUPJ
 ch+caFzTQv8JNpO824apTVytksxpIbpttI/vtS60psYIPXJEQdtdRg612
 x5mhKAgDS9/9tFgIdJ2RpyuP1lOQItR5kceGmMvSLxMmDQR7Fu9Lo7bgA
 nJj74jqyZpHwdK+vTk9dKnLCAoxC1BIBKGWz9/8kk0S4P5OBEBRy188Pl Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="440698939"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; d="scan'208";a="440698939"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 17:53:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="736191845"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; d="scan'208";a="736191845"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 17:52:59 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 3/7] drm/i915/huc: Load GSC-enabled HuC via DMA xfer if the
 fuse says so
Date: Fri, 26 May 2023 17:52:38 -0700
Message-Id: <20230527005242.1346093-4-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230527005242.1346093-1-daniele.ceraolospurio@intel.com>
References: <20230527005242.1346093-1-daniele.ceraolospurio@intel.com>
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
Cc: John Harrison <John.C.Harrison@Intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In the previous patch we extracted the offset of the legacy-style HuC
binary located within the GSC-enabled blob, so now we can use that to
load the HuC via DMA if the fuse is set that way.
Note that we now need to differentiate between "GSC-enabled binary" and
"loaded by GSC", so the former case has been renamed to "has GSC headers"
for clarity, while the latter is now based on the fuse instead of the
binary format. This way, all the legacy load paths are automatically
taken (including the auth by GuC) without having to implement further
code changes.

v2: s/is_meu_binary/has_gsc_headers/, clearer logs (John)

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_huc.c    | 29 ++++++++++++++---------
 drivers/gpu/drm/i915/gt/uc/intel_huc.h    |  4 +++-
 drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c  | 12 +++++-----
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h  |  2 +-
 5 files changed, 29 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
index 6d795438b3e4..37c6a8ca5c71 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
@@ -298,31 +298,38 @@ void intel_huc_init_early(struct intel_huc *huc)
 static int check_huc_loading_mode(struct intel_huc *huc)
 {
 	struct intel_gt *gt = huc_to_gt(huc);
-	bool fw_needs_gsc = intel_huc_is_loaded_by_gsc(huc);
-	bool hw_uses_gsc = false;
+	bool gsc_enabled = huc->fw.has_gsc_headers;
 
 	/*
 	 * The fuse for HuC load via GSC is only valid on platforms that have
 	 * GuC deprivilege.
 	 */
 	if (HAS_GUC_DEPRIVILEGE(gt->i915))
-		hw_uses_gsc = intel_uncore_read(gt->uncore, GUC_SHIM_CONTROL2) &
-			      GSC_LOADS_HUC;
+		huc->loaded_via_gsc = intel_uncore_read(gt->uncore, GUC_SHIM_CONTROL2) &
+				      GSC_LOADS_HUC;
 
-	if (fw_needs_gsc != hw_uses_gsc) {
-		huc_err(huc, "mismatch between FW (%s) and HW (%s) load modes\n",
-			HUC_LOAD_MODE_STRING(fw_needs_gsc), HUC_LOAD_MODE_STRING(hw_uses_gsc));
+	if (huc->loaded_via_gsc && !gsc_enabled) {
+		huc_err(huc, "HW requires a GSC-enabled blob, but we found a legacy one\n");
 		return -ENOEXEC;
 	}
 
-	/* make sure we can access the GSC via the mei driver if we need it */
+	/*
+	 * Newer GSC_enabled blobs contain the old FW structure inside. If we
+	 * found that, we can use it to load the legacy way.
+	 */
+	if (!huc->loaded_via_gsc && gsc_enabled && !huc->fw.dma_start_offset) {
+		huc_err(huc,"HW in DMA mode, but we have an incompatible GSC-enabled blob\n");
+		return -ENOEXEC;
+	}
+
+	/* make sure we can access the GSC if we need it */
 	if (!(IS_ENABLED(CONFIG_INTEL_MEI_PXP) && IS_ENABLED(CONFIG_INTEL_MEI_GSC)) &&
-	    fw_needs_gsc) {
-		huc_info(huc, "can't load due to missing MEI modules\n");
+	    !HAS_ENGINE(gt, GSC0) && huc->loaded_via_gsc) {
+		huc_info(huc, "can't load due to missing mei modules or GSCCS\n");
 		return -EIO;
 	}
 
-	huc_dbg(huc, "loaded by GSC = %s\n", str_yes_no(fw_needs_gsc));
+	huc_dbg(huc, "loaded by GSC = %s\n", str_yes_no(huc->loaded_via_gsc));
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.h b/drivers/gpu/drm/i915/gt/uc/intel_huc.h
index 0789184d81a2..112f0dce4702 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_huc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.h
@@ -39,6 +39,8 @@ struct intel_huc {
 		struct notifier_block nb;
 		enum intel_huc_delayed_load_status status;
 	} delayed_load;
+
+	bool loaded_via_gsc;
 };
 
 int intel_huc_sanitize(struct intel_huc *huc);
@@ -73,7 +75,7 @@ static inline bool intel_huc_is_used(struct intel_huc *huc)
 
 static inline bool intel_huc_is_loaded_by_gsc(const struct intel_huc *huc)
 {
-	return huc->fw.loaded_via_gsc;
+	return huc->loaded_via_gsc;
 }
 
 static inline bool intel_huc_wait_required(struct intel_huc *huc)
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
index 037d2ad4879d..3355dc1e2bc6 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
@@ -50,7 +50,7 @@ int intel_huc_fw_get_binary_info(struct intel_uc_fw *huc_fw, const void *data, s
 	size_t min_size = sizeof(*header);
 	int i;
 
-	if (!huc_fw->loaded_via_gsc) {
+	if (!huc_fw->has_gsc_headers) {
 		huc_err(huc, "Invalid FW type GSC header parsing!\n");
 		return -EINVAL;
 	}
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
index 9ced8dbf1253..b752a7f1ed99 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
@@ -186,7 +186,7 @@ struct __packed uc_fw_blob {
 	u8 major;
 	u8 minor;
 	u8 patch;
-	bool loaded_via_gsc;
+	bool has_gsc_headers;
 };
 
 #define UC_FW_BLOB_BASE(major_, minor_, patch_, path_) \
@@ -197,7 +197,7 @@ struct __packed uc_fw_blob {
 
 #define UC_FW_BLOB_NEW(major_, minor_, patch_, gsc_, path_) \
 	{ UC_FW_BLOB_BASE(major_, minor_, patch_, path_) \
-	  .legacy = false, .loaded_via_gsc = gsc_ }
+	  .legacy = false, .has_gsc_headers = gsc_ }
 
 #define UC_FW_BLOB_OLD(major_, minor_, patch_, path_) \
 	{ UC_FW_BLOB_BASE(major_, minor_, patch_, path_) \
@@ -310,7 +310,7 @@ __uc_fw_auto_select(struct drm_i915_private *i915, struct intel_uc_fw *uc_fw)
 		uc_fw->file_wanted.ver.major = blob->major;
 		uc_fw->file_wanted.ver.minor = blob->minor;
 		uc_fw->file_wanted.ver.patch = blob->patch;
-		uc_fw->loaded_via_gsc = blob->loaded_via_gsc;
+		uc_fw->has_gsc_headers = blob->has_gsc_headers;
 		found = true;
 		break;
 	}
@@ -736,7 +736,7 @@ static int check_fw_header(struct intel_gt *gt,
 	if (uc_fw->type == INTEL_UC_FW_TYPE_GSC)
 		return 0;
 
-	if (uc_fw->loaded_via_gsc)
+	if (uc_fw->has_gsc_headers)
 		err = check_gsc_manifest(gt, fw, uc_fw);
 	else
 		err = check_ccs_header(gt, fw, uc_fw);
@@ -998,7 +998,7 @@ static int uc_fw_xfer(struct intel_uc_fw *uc_fw, u32 dst_offset, u32 dma_flags)
 	intel_uncore_forcewake_get(uncore, FORCEWAKE_ALL);
 
 	/* Set the source address for the uCode */
-	offset = uc_fw->vma_res.start;
+	offset = uc_fw->vma_res.start + uc_fw->dma_start_offset;
 	GEM_BUG_ON(upper_32_bits(offset) & 0xFFFF0000);
 	intel_uncore_write_fw(uncore, DMA_ADDR_0_LOW, lower_32_bits(offset));
 	intel_uncore_write_fw(uncore, DMA_ADDR_0_HIGH, upper_32_bits(offset));
@@ -1237,7 +1237,7 @@ size_t intel_uc_fw_copy_rsa(struct intel_uc_fw *uc_fw, void *dst, u32 max_len)
 {
 	struct intel_memory_region *mr = uc_fw->obj->mm.region;
 	u32 size = min_t(u32, uc_fw->rsa_size, max_len);
-	u32 offset = sizeof(struct uc_css_header) + uc_fw->ucode_size;
+	u32 offset = uc_fw->dma_start_offset + sizeof(struct uc_css_header) + uc_fw->ucode_size;
 	struct sgt_iter iter;
 	size_t count = 0;
 	int idx;
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
index b3daba9526eb..054f02811971 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
@@ -120,7 +120,7 @@ struct intel_uc_fw {
 
 	u32 dma_start_offset;
 
-	bool loaded_via_gsc;
+	bool has_gsc_headers;
 };
 
 /*
-- 
2.40.0

