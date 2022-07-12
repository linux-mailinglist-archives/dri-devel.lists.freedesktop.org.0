Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E05A5729FB
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 01:32:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E1D3976BB;
	Tue, 12 Jul 2022 23:31:43 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35620976BF;
 Tue, 12 Jul 2022 23:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657668698; x=1689204698;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QAhi7M4Z/IjmQDzgNmMupr2I8G5TxqWPD/tZZMc0WgY=;
 b=D9OedH/OcmsRk2qc+Q5bsuOLZzJRw6NjbZG0LBfn1G7AodSiulXtJ8jD
 IlB2J8UUw3IebpFMBsJi7CTwQxcJQLLrpMiY/I/vkccBotN9h4t8xy+Z+
 IKisNLo4tBWFwhxiwZFAN7ezQLN37TFmBqTFUtUdD36Oks0R32HLLmSGV
 NrRSWEgR/rOVboWbRjmUoo3vav6eRnBpN4H4r3StcgCnlXrxv20nxVEUw
 SivVbp+osimMba91K0Praszf5DoZLwHEgxE3tZMLV2LbcAkZlIAdxymls
 kk4FzPpvUUtIySy7SdISW5+XCiJC0hBhmXTneMEwc3D+ZxuypDiDxM3fJ Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10406"; a="285812565"
X-IronPort-AV: E=Sophos;i="5.92,266,1650956400"; d="scan'208";a="285812565"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2022 16:31:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,266,1650956400"; d="scan'208";a="722137769"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by orsmga004.jf.intel.com with ESMTP; 12 Jul 2022 16:31:36 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 05/12] drm/i915/guc: Record CTB info in error logs
Date: Tue, 12 Jul 2022 16:31:29 -0700
Message-Id: <20220712233136.1044951-6-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220712233136.1044951-1-John.C.Harrison@Intel.com>
References: <20220712233136.1044951-1-John.C.Harrison@Intel.com>
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

When debugging GuC communication issues, it is useful to have the CTB
info available. So add the state and buffer contents to the error
capture log.

Also, add a sub-structure for the GuC specific error capture info as
it is now becoming numerous.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/i915_gpu_error.c | 59 +++++++++++++++++++++++----
 drivers/gpu/drm/i915/i915_gpu_error.h | 20 +++++++--
 2 files changed, 67 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index 5bcf36c292ebd..0e43b8dd22cf7 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -683,6 +683,18 @@ static void err_print_pciid(struct drm_i915_error_state_buf *m,
 		   pdev->subsystem_device);
 }
 
+static void err_print_guc_ctb(struct drm_i915_error_state_buf *m,
+			      const char *name,
+			      const struct intel_ctb_coredump *ctb)
+{
+	if (!ctb->size)
+		return;
+
+	err_printf(m, "GuC %s CTB: raw: 0x%08X, 0x%08X/%08X, cached: 0x%08X/%08X, desc = 0x%08X, buf = 0x%08X x 0x%08X\n",
+		   name, ctb->raw_status, ctb->raw_head, ctb->raw_tail,
+		   ctb->head, ctb->tail, ctb->desc_offset, ctb->cmds_offset, ctb->size);
+}
+
 static void err_print_uc(struct drm_i915_error_state_buf *m,
 			 const struct intel_uc_coredump *error_uc)
 {
@@ -690,8 +702,12 @@ static void err_print_uc(struct drm_i915_error_state_buf *m,
 
 	intel_uc_fw_dump(&error_uc->guc_fw, &p);
 	intel_uc_fw_dump(&error_uc->huc_fw, &p);
-	err_printf(m, "GuC timestamp: 0x%08x\n", error_uc->timestamp);
-	intel_gpu_error_print_vma(m, NULL, error_uc->guc_log);
+	err_printf(m, "GuC timestamp: 0x%08x\n", error_uc->guc.timestamp);
+	intel_gpu_error_print_vma(m, NULL, error_uc->guc.vma_log);
+	err_printf(m, "GuC CTB fence: %d\n", error_uc->guc.last_fence);
+	err_print_guc_ctb(m, "Send", error_uc->guc.ctb + 0);
+	err_print_guc_ctb(m, "Recv", error_uc->guc.ctb + 1);
+	intel_gpu_error_print_vma(m, NULL, error_uc->guc.vma_ctb);
 }
 
 static void err_free_sgl(struct scatterlist *sgl)
@@ -866,7 +882,7 @@ static void __err_print_to_sgl(struct drm_i915_error_state_buf *m,
 	if (error->gt) {
 		bool print_guc_capture = false;
 
-		if (error->gt->uc && error->gt->uc->is_guc_capture)
+		if (error->gt->uc && error->gt->uc->guc.is_guc_capture)
 			print_guc_capture = true;
 
 		err_print_gt_display(m, error->gt);
@@ -1021,7 +1037,8 @@ static void cleanup_uc(struct intel_uc_coredump *uc)
 {
 	kfree(uc->guc_fw.path);
 	kfree(uc->huc_fw.path);
-	i915_vma_coredump_free(uc->guc_log);
+	i915_vma_coredump_free(uc->guc.vma_log);
+	i915_vma_coredump_free(uc->guc.vma_ctb);
 
 	kfree(uc);
 }
@@ -1670,6 +1687,23 @@ gt_record_engines(struct intel_gt_coredump *gt,
 	}
 }
 
+static void gt_record_guc_ctb(struct intel_ctb_coredump *saved,
+			      const struct intel_guc_ct_buffer *ctb,
+			      const void *blob_ptr, struct intel_guc *guc)
+{
+	if (!ctb || !ctb->desc)
+		return;
+
+	saved->raw_status = ctb->desc->status;
+	saved->raw_head = ctb->desc->head;
+	saved->raw_tail = ctb->desc->tail;
+	saved->head = ctb->head;
+	saved->tail = ctb->tail;
+	saved->size = ctb->size;
+	saved->desc_offset = ((void *)ctb->desc) - blob_ptr;
+	saved->cmds_offset = ((void *)ctb->cmds) - blob_ptr;
+}
+
 static struct intel_uc_coredump *
 gt_record_uc(struct intel_gt_coredump *gt,
 	     struct i915_vma_compress *compress)
@@ -1696,9 +1730,16 @@ gt_record_uc(struct intel_gt_coredump *gt,
 	 * log times to system times (in conjunction with the error->boottime and
 	 * gt->clock_frequency fields saved elsewhere).
 	 */
-	error_uc->timestamp = intel_uncore_read(gt->_gt->uncore, GUCPMTIMESTAMP);
-	error_uc->guc_log = create_vma_coredump(gt->_gt, uc->guc.log.vma,
-						"GuC log buffer", compress);
+	error_uc->guc.timestamp = intel_uncore_read(gt->_gt->uncore, GUCPMTIMESTAMP);
+	error_uc->guc.vma_log = create_vma_coredump(gt->_gt, uc->guc.log.vma,
+						    "GuC log buffer", compress);
+	error_uc->guc.vma_ctb = create_vma_coredump(gt->_gt, uc->guc.ct.vma,
+						    "GuC CT buffer", compress);
+	error_uc->guc.last_fence = uc->guc.ct.requests.last_fence;
+	gt_record_guc_ctb(error_uc->guc.ctb + 0, &uc->guc.ct.ctbs.send,
+			  uc->guc.ct.ctbs.send.desc, (struct intel_guc *)&uc->guc);
+	gt_record_guc_ctb(error_uc->guc.ctb + 1, &uc->guc.ct.ctbs.recv,
+			  uc->guc.ct.ctbs.send.desc, (struct intel_guc *)&uc->guc);
 
 	return error_uc;
 }
@@ -2051,9 +2092,9 @@ __i915_gpu_coredump(struct intel_gt *gt, intel_engine_mask_t engine_mask, u32 du
 			error->gt->uc = gt_record_uc(error->gt, compress);
 			if (error->gt->uc) {
 				if (dump_flags & CORE_DUMP_FLAG_IS_GUC_CAPTURE)
-					error->gt->uc->is_guc_capture = true;
+					error->gt->uc->guc.is_guc_capture = true;
 				else
-					GEM_BUG_ON(error->gt->uc->is_guc_capture);
+					GEM_BUG_ON(error->gt->uc->guc.is_guc_capture);
 			}
 		}
 
diff --git a/drivers/gpu/drm/i915/i915_gpu_error.h b/drivers/gpu/drm/i915/i915_gpu_error.h
index d8a8b3d529e09..efc75cc2ffdb9 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.h
+++ b/drivers/gpu/drm/i915/i915_gpu_error.h
@@ -125,6 +125,15 @@ struct intel_engine_coredump {
 	struct intel_engine_coredump *next;
 };
 
+struct intel_ctb_coredump {
+	u32 raw_head, head;
+	u32 raw_tail, tail;
+	u32 raw_status;
+	u32 desc_offset;
+	u32 cmds_offset;
+	u32 size;
+};
+
 struct intel_gt_coredump {
 	const struct intel_gt *_gt;
 	bool awake;
@@ -165,9 +174,14 @@ struct intel_gt_coredump {
 	struct intel_uc_coredump {
 		struct intel_uc_fw guc_fw;
 		struct intel_uc_fw huc_fw;
-		struct i915_vma_coredump *guc_log;
-		u32 timestamp;
-		bool is_guc_capture;
+		struct guc_info {
+			struct intel_ctb_coredump ctb[2];
+			struct i915_vma_coredump *vma_ctb;
+			struct i915_vma_coredump *vma_log;
+			u32 timestamp;
+			u16 last_fence;
+			bool is_guc_capture;
+		} guc;
 	} *uc;
 
 	struct intel_gt_coredump *next;
-- 
2.36.0

