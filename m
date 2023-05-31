Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8923718F37
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 01:54:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45C9210E1ED;
	Wed, 31 May 2023 23:54:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54BD110E0DB;
 Wed, 31 May 2023 23:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685577267; x=1717113267;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CKuxOGZeoy9ZNIohsbp4ppff45FQJIhNbrTc82ki1fM=;
 b=l1QqtpG7DT9RkOYB+7BKDPiizcvNe64ss8b+bkd5d+9W4Tk3B3n1UUmj
 hy44HYrOAqA5X9jv1L8mfghxfwttST142JQU7HWMlITVNloc/QkgAgAe0
 CKQt/966eSV5Fqvf1zCjP/AAFytEqi8Ly+bZz0ewbWxHljVhynNIMhZ1j
 afXkTejJhewwBsi/ydyFB2kfeVIctN39LeSnhQ9ha59p/bbpz97d0YTQa
 w/zC7RXvKjtC8rJGEbA1Wy/xYQT990o/xQBwsTiyt5LGKf70JsZb1aByG
 RKpwwWdFNT8T1CexHGWAD0/a5SYRkLfRCt4mH0P9tuqlFs+gWuLrMhIBY w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="335747033"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="335747033"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 16:54:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="707109938"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="707109938"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 16:54:26 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 3/7] drm/i915/huc: Load GSC-enabled HuC via DMA xfer if the
 fuse says so
Date: Wed, 31 May 2023 16:54:11 -0700
Message-Id: <20230531235415.1467475-4-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230531235415.1467475-1-daniele.ceraolospurio@intel.com>
References: <20230531235415.1467475-1-daniele.ceraolospurio@intel.com>
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

v3: split check for GSC access, better comments (John)

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_huc.c    | 49 +++++++++++++++++------
 drivers/gpu/drm/i915/gt/uc/intel_huc.h    |  4 +-
 drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c  | 12 +++---
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h  |  2 +-
 5 files changed, 47 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
index 6d795438b3e4..27c5e41fa84c 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
@@ -298,31 +298,54 @@ void intel_huc_init_early(struct intel_huc *huc)
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
-	if (!(IS_ENABLED(CONFIG_INTEL_MEI_PXP) && IS_ENABLED(CONFIG_INTEL_MEI_GSC)) &&
-	    fw_needs_gsc) {
-		huc_info(huc, "can't load due to missing MEI modules\n");
-		return -EIO;
+	/*
+	 * On newer platforms we have GSC-enabled binaries but we load the HuC
+	 * via DMA. To do so we need to find the location of the legacy-style
+	 * binary inside the GSC-enabled one, which we do at fetch time. Make
+	 * sure that we were able to do so if the fuse says we need to load via
+	 * DMA and the binary is GSC-enabled.
+	 */
+	if (!huc->loaded_via_gsc && gsc_enabled && !huc->fw.dma_start_offset) {
+		huc_err(huc, "HW in DMA mode, but we have an incompatible GSC-enabled blob\n");
+		return -ENOEXEC;
+	}
+
+	/*
+	 * If the HuC is loaded via GSC, we need to be able to access the GSC.
+	 * On DG2 this is done via the mei components, while on newer platforms
+	 * it is done via the GSCCS,
+	 */
+	if (huc->loaded_via_gsc) {
+		if (IS_DG2(gt->i915)) {
+			if (!IS_ENABLED(CONFIG_INTEL_MEI_PXP) ||
+			    !IS_ENABLED(CONFIG_INTEL_MEI_GSC)) {
+				huc_info(huc, "can't load due to missing mei modules\n");
+				return -EIO;
+			}
+		} else {
+			if (!HAS_ENGINE(gt, GSC0)){
+				huc_info(huc, "can't load due to missing GSCCS\n");
+				return -EIO;
+			}
+		}
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
index 3a9d81899a78..89a887d33b77 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
@@ -50,7 +50,7 @@ int intel_huc_fw_get_binary_info(struct intel_uc_fw *huc_fw, const void *data, s
 	size_t min_size = sizeof(*header);
 	int i;
 
-	if (!huc_fw->loaded_via_gsc) {
+	if (!huc_fw->has_gsc_headers) {
 		huc_err(huc, "Invalid FW type for GSC header parsing!\n");
 		return -EINVAL;
 	}
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
index ec0b3d214af1..a1c8a982479f 100644
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
@@ -737,7 +737,7 @@ static int check_fw_header(struct intel_gt *gt,
 	if (uc_fw->type == INTEL_UC_FW_TYPE_GSC)
 		return 0;
 
-	if (uc_fw->loaded_via_gsc)
+	if (uc_fw->has_gsc_headers)
 		err = check_gsc_manifest(gt, fw, uc_fw);
 	else
 		err = check_ccs_header(gt, fw, uc_fw);
@@ -999,7 +999,7 @@ static int uc_fw_xfer(struct intel_uc_fw *uc_fw, u32 dst_offset, u32 dma_flags)
 	intel_uncore_forcewake_get(uncore, FORCEWAKE_ALL);
 
 	/* Set the source address for the uCode */
-	offset = uc_fw->vma_res.start;
+	offset = uc_fw->vma_res.start + uc_fw->dma_start_offset;
 	GEM_BUG_ON(upper_32_bits(offset) & 0xFFFF0000);
 	intel_uncore_write_fw(uncore, DMA_ADDR_0_LOW, lower_32_bits(offset));
 	intel_uncore_write_fw(uncore, DMA_ADDR_0_HIGH, upper_32_bits(offset));
@@ -1238,7 +1238,7 @@ size_t intel_uc_fw_copy_rsa(struct intel_uc_fw *uc_fw, void *dst, u32 max_len)
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

