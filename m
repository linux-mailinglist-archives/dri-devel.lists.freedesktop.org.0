Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 939DA6F1068
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 04:34:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6130F10EC37;
	Fri, 28 Apr 2023 02:34:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A590C10EC27;
 Fri, 28 Apr 2023 02:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682649272; x=1714185272;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0i6zCiwV7gYRElflDJRaQetBfaJujnQwz8vXtOQP3/g=;
 b=Yc8zUzSbwIq8dTcGDnrU3LEoMDlRfMkHF39vGVf6fLLTbYp00Mp4szyK
 1u7tL3S0l78UT2Ve+1oucKK2mpHyBkLuci+9hishXxSkmJyQ1kpiEpkML
 H9HTiL0eAvvvZF4UwFomH30BUGHiobRKKmovIoMMqOraqG+UZbjLL/Y63
 rJCsS3KqMIdU5YFkzwVeFADfYRKp5+72na69GLX3cTeRHwGrre+xG5aNx
 C23N9jlw1yBuN5sFXc2boReajRtsgCHzOeg16TQSRtYq4bgD6pha/ESG0
 iDoMoYG27AX62+MNBR4dWmf5l8udVvKdG0Auw0gAJJn4VsOMfSUESi8WT A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="346386494"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; d="scan'208";a="346386494"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2023 19:34:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="644937200"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; d="scan'208";a="644937200"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2023 19:34:32 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/8] drm/i915/uc: perma-pin firmwares
Date: Thu, 27 Apr 2023 19:34:10 -0700
Message-Id: <20230428023416.4051910-3-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230428023416.4051910-1-daniele.ceraolospurio@intel.com>
References: <20230428023416.4051910-1-daniele.ceraolospurio@intel.com>
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that each FW has its own reserved area, we can keep them always
pinned and skip the pin/unpin dance on reset. This will make things
easier for the 2-step HuC authentication, which requires the FW to be
pinned in GGTT after the xfer is completed.
Given that we use dummy vmas for the pinning, we do need to explicitly
re-pin on resume because the automated helper won't cover us.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_ggtt.c      |  3 ++
 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c |  7 ++++-
 drivers/gpu/drm/i915/gt/uc/intel_guc.c    |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_huc.c    |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c     |  8 +++++
 drivers/gpu/drm/i915/gt/uc/intel_uc.h     |  2 ++
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c  | 36 ++++++++++++++++++-----
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h  |  5 +++-
 8 files changed, 53 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
index 20915edc8bd9..ab71ed11de79 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
@@ -1322,6 +1322,9 @@ void i915_ggtt_resume(struct i915_ggtt *ggtt)
 		ggtt->vm.scratch_range(&ggtt->vm, ggtt->error_capture.start,
 				       ggtt->error_capture.size);
 
+	list_for_each_entry(gt, &ggtt->gt_list, ggtt_link)
+		intel_uc_resume_mappings(&gt->uc);
+
 	ggtt->invalidate(ggtt);
 
 	if (flush)
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
index 64bff01026e8..af542e3cb3e9 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
@@ -80,7 +80,12 @@ void intel_gsc_uc_init_early(struct intel_gsc_uc *gsc)
 {
 	struct intel_gt *gt = gsc_uc_to_gt(gsc);
 
-	intel_uc_fw_init_early(&gsc->fw, INTEL_UC_FW_TYPE_GSC);
+	/*
+	 * GSC FW needs to be copied to a dedicated memory allocations for
+	 * loading (see gsc->local), so we don't need to GGTT map the FW image
+	 * itself into GGTT.
+	 */
+	intel_uc_fw_init_early(&gsc->fw, INTEL_UC_FW_TYPE_GSC, false);
 	INIT_WORK(&gsc->work, gsc_work);
 
 	/* we can arrive here from i915_driver_early_probe for primary
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
index c9f20385f6a0..2eb891b270ae 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
@@ -164,7 +164,7 @@ void intel_guc_init_early(struct intel_guc *guc)
 	struct intel_gt *gt = guc_to_gt(guc);
 	struct drm_i915_private *i915 = gt->i915;
 
-	intel_uc_fw_init_early(&guc->fw, INTEL_UC_FW_TYPE_GUC);
+	intel_uc_fw_init_early(&guc->fw, INTEL_UC_FW_TYPE_GUC, true);
 	intel_guc_ct_init_early(&guc->ct);
 	intel_guc_log_init_early(&guc->log);
 	intel_guc_submission_init_early(guc);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
index aefdaa62da99..9721761373fb 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
@@ -276,7 +276,7 @@ void intel_huc_init_early(struct intel_huc *huc)
 	struct drm_i915_private *i915 = huc_to_gt(huc)->i915;
 	struct intel_gt *gt = huc_to_gt(huc);
 
-	intel_uc_fw_init_early(&huc->fw, INTEL_UC_FW_TYPE_HUC);
+	intel_uc_fw_init_early(&huc->fw, INTEL_UC_FW_TYPE_HUC, true);
 
 	/*
 	 * we always init the fence as already completed, even if HuC is not
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
index 996168312340..b6adfda3761e 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
@@ -697,6 +697,12 @@ void intel_uc_suspend(struct intel_uc *uc)
 	}
 }
 
+static void __uc_resume_mappings(struct intel_uc *uc)
+{
+	intel_uc_fw_resume_mapping(&uc->guc.fw);
+	intel_uc_fw_resume_mapping(&uc->huc.fw);
+}
+
 static int __uc_resume(struct intel_uc *uc, bool enable_communication)
 {
 	struct intel_guc *guc = &uc->guc;
@@ -764,4 +770,6 @@ static const struct intel_uc_ops uc_ops_on = {
 
 	.init_hw = __uc_init_hw,
 	.fini_hw = __uc_fini_hw,
+
+	.resume_mappings = __uc_resume_mappings,
 };
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.h b/drivers/gpu/drm/i915/gt/uc/intel_uc.h
index 5d0f1bcc381e..c2783e6e752b 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.h
@@ -24,6 +24,7 @@ struct intel_uc_ops {
 	void (*fini)(struct intel_uc *uc);
 	int (*init_hw)(struct intel_uc *uc);
 	void (*fini_hw)(struct intel_uc *uc);
+	void (*resume_mappings)(struct intel_uc *uc);
 };
 
 struct intel_uc {
@@ -113,6 +114,7 @@ intel_uc_ops_function(init, init, int, 0);
 intel_uc_ops_function(fini, fini, void, );
 intel_uc_ops_function(init_hw, init_hw, int, 0);
 intel_uc_ops_function(fini_hw, fini_hw, void, );
+intel_uc_ops_function(resume_mappings, resume_mappings, void, );
 #undef intel_uc_ops_function
 
 #endif
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
index 6b71b9febd74..03f0b258aea7 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
@@ -422,12 +422,14 @@ static void __uc_fw_user_override(struct drm_i915_private *i915, struct intel_uc
  * intel_uc_fw_init_early - initialize the uC object and select the firmware
  * @uc_fw: uC firmware
  * @type: type of uC
+ * @needs_ggtt_mapping: whether the FW needs to be GGTT mapped for loading
  *
  * Initialize the state of our uC object and relevant tracking and select the
  * firmware to fetch and load.
  */
 void intel_uc_fw_init_early(struct intel_uc_fw *uc_fw,
-			    enum intel_uc_fw_type type)
+			    enum intel_uc_fw_type type,
+			    bool needs_ggtt_mapping)
 {
 	struct drm_i915_private *i915 = ____uc_fw_to_gt(uc_fw, type)->i915;
 
@@ -440,6 +442,7 @@ void intel_uc_fw_init_early(struct intel_uc_fw *uc_fw,
 	GEM_BUG_ON(uc_fw->file_selected.path);
 
 	uc_fw->type = type;
+	uc_fw->needs_ggtt_mapping = needs_ggtt_mapping;
 
 	if (HAS_GT_UC(i915)) {
 		__uc_fw_auto_select(i915, uc_fw);
@@ -699,7 +702,7 @@ static int try_firmware_load(struct intel_uc_fw *uc_fw, const struct firmware **
 	if (err)
 		return err;
 
-	if ((*fw)->size > INTEL_UC_RSVD_GGTT_PER_FW) {
+	if (uc_fw->needs_ggtt_mapping && (*fw)->size > INTEL_UC_RSVD_GGTT_PER_FW) {
 		gt_err(gt, "%s firmware %s: size (%zuKB) exceeds max supported size (%uKB)\n",
 		       intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path,
 		       (*fw)->size / SZ_1K, INTEL_UC_RSVD_GGTT_PER_FW / SZ_1K);
@@ -880,6 +883,9 @@ static void uc_fw_bind_ggtt(struct intel_uc_fw *uc_fw)
 	struct i915_vma_resource *dummy = &uc_fw->dummy;
 	u32 pte_flags = 0;
 
+	if (!uc_fw->needs_ggtt_mapping)
+		return;
+
 	dummy->start = uc_fw_ggtt_offset(uc_fw);
 	dummy->node_size = obj->base.size;
 	dummy->bi.pages = obj->mm.pages;
@@ -901,11 +907,13 @@ static void uc_fw_bind_ggtt(struct intel_uc_fw *uc_fw)
 
 static void uc_fw_unbind_ggtt(struct intel_uc_fw *uc_fw)
 {
-	struct drm_i915_gem_object *obj = uc_fw->obj;
 	struct i915_ggtt *ggtt = __uc_fw_to_gt(uc_fw)->ggtt;
-	u64 start = uc_fw_ggtt_offset(uc_fw);
+	struct i915_vma_resource *dummy = &uc_fw->dummy;
+
+	if (!dummy->node_size)
+		return;
 
-	ggtt->vm.clear_range(&ggtt->vm, start, obj->base.size);
+	ggtt->vm.clear_range(&ggtt->vm, dummy->start, dummy->node_size);
 }
 
 static int uc_fw_xfer(struct intel_uc_fw *uc_fw, u32 dst_offset, u32 dma_flags)
@@ -922,7 +930,7 @@ static int uc_fw_xfer(struct intel_uc_fw *uc_fw, u32 dst_offset, u32 dma_flags)
 	intel_uncore_forcewake_get(uncore, FORCEWAKE_ALL);
 
 	/* Set the source address for the uCode */
-	offset = uc_fw_ggtt_offset(uc_fw);
+	offset = uc_fw->dummy.start;
 	GEM_BUG_ON(upper_32_bits(offset) & 0xFFFF0000);
 	intel_uncore_write_fw(uncore, DMA_ADDR_0_LOW, lower_32_bits(offset));
 	intel_uncore_write_fw(uncore, DMA_ADDR_0_HIGH, upper_32_bits(offset));
@@ -996,9 +1004,7 @@ int intel_uc_fw_upload(struct intel_uc_fw *uc_fw, u32 dst_offset, u32 dma_flags)
 		return -ENOEXEC;
 
 	/* Call custom loader */
-	uc_fw_bind_ggtt(uc_fw);
 	err = uc_fw_xfer(uc_fw, dst_offset, dma_flags);
-	uc_fw_unbind_ggtt(uc_fw);
 	if (err)
 		goto fail;
 
@@ -1102,6 +1108,8 @@ int intel_uc_fw_init(struct intel_uc_fw *uc_fw)
 		goto out_unpin;
 	}
 
+	uc_fw_bind_ggtt(uc_fw);
+
 	return 0;
 
 out_unpin:
@@ -1112,6 +1120,7 @@ int intel_uc_fw_init(struct intel_uc_fw *uc_fw)
 
 void intel_uc_fw_fini(struct intel_uc_fw *uc_fw)
 {
+	uc_fw_unbind_ggtt(uc_fw);
 	uc_fw_rsa_data_destroy(uc_fw);
 
 	if (i915_gem_object_has_pinned_pages(uc_fw->obj))
@@ -1120,6 +1129,17 @@ void intel_uc_fw_fini(struct intel_uc_fw *uc_fw)
 	intel_uc_fw_change_status(uc_fw, INTEL_UC_FIRMWARE_AVAILABLE);
 }
 
+void intel_uc_fw_resume_mapping(struct intel_uc_fw *uc_fw)
+{
+	if (!intel_uc_fw_is_available(uc_fw))
+		return;
+
+	if (!i915_gem_object_has_pinned_pages(uc_fw->obj))
+		return;
+
+	uc_fw_bind_ggtt(uc_fw);
+}
+
 /**
  * intel_uc_fw_cleanup_fetch - cleanup uC firmware
  * @uc_fw: uC firmware
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
index 6ba00e6b3975..26a9d6e0dc00 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
@@ -105,6 +105,7 @@ struct intel_uc_fw {
 	 * threaded as it done during driver load (inherently single threaded)
 	 * or during a GT reset (mutex guarantees single threaded).
 	 */
+	bool needs_ggtt_mapping;
 	struct i915_vma_resource dummy;
 	struct i915_vma *rsa_data;
 
@@ -282,12 +283,14 @@ static inline u32 intel_uc_fw_get_upload_size(struct intel_uc_fw *uc_fw)
 }
 
 void intel_uc_fw_init_early(struct intel_uc_fw *uc_fw,
-			    enum intel_uc_fw_type type);
+			    enum intel_uc_fw_type type,
+			    bool needs_ggtt_mapping);
 int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw);
 void intel_uc_fw_cleanup_fetch(struct intel_uc_fw *uc_fw);
 int intel_uc_fw_upload(struct intel_uc_fw *uc_fw, u32 offset, u32 dma_flags);
 int intel_uc_fw_init(struct intel_uc_fw *uc_fw);
 void intel_uc_fw_fini(struct intel_uc_fw *uc_fw);
+void intel_uc_fw_resume_mapping(struct intel_uc_fw *uc_fw);
 size_t intel_uc_fw_copy_rsa(struct intel_uc_fw *uc_fw, void *dst, u32 max_len);
 int intel_uc_fw_mark_load_failed(struct intel_uc_fw *uc_fw, int err);
 void intel_uc_fw_dump(const struct intel_uc_fw *uc_fw, struct drm_printer *p);
-- 
2.40.0

