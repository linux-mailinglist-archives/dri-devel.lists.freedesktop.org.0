Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC73619E9A
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 18:24:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6621B10E962;
	Fri,  4 Nov 2022 17:23:41 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CE0710E962;
 Fri,  4 Nov 2022 17:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667582617; x=1699118617;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NTAqyHDE7xSBx6K7hj8Hm3IPlLwJDxsNqZWU90YjQ90=;
 b=LvN17Acuys/qkH7hZ7r2JjQj6HJ343o1aa35hLPWR9zoEHYeeVC8TuPW
 tzchR0htb0mhrsiq2NuAnRnAoEoW6qnTY37Um/BxJdGanMojKTziwtPyp
 HsjbQSoFYko4ejv3ooLWa+xwLHwq5+soN0cr56o+Z6xBLG55JvfIIA+IQ
 1plq2S9KAC6uoD+PLzdPbSUWGhAxFsM2hQtUPwh/r0s3zWHcbGLgHIkqT
 nbWcB/HWSMqJ3lcGRs8v2mS+bI/PgmmBMVU6Mjo/BLpczJv5dPJqiV9s3
 10o0v0rkLcSPMMj0quvqQvUK5Sa64Y2vkDzrQwoNXGFqxtTEv/SGdmkOi Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10521"; a="293350204"
X-IronPort-AV: E=Sophos;i="5.96,138,1665471600"; d="scan'208";a="293350204"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2022 10:23:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10521"; a="724422787"
X-IronPort-AV: E=Sophos;i="5.96,138,1665471600"; d="scan'208";a="724422787"
Received: from relo-linux-5.jf.intel.com ([10.165.21.154])
 by FMSMGA003.fm.intel.com with ESMTP; 04 Nov 2022 10:23:35 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 2/2] drm/i915/uc: Update the gt/uc code to use GT_ERR and
 friends
Date: Fri,  4 Nov 2022 10:25:25 -0700
Message-Id: <20221104172525.569913-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221104172525.569913-1-John.C.Harrison@Intel.com>
References: <20221104172525.569913-1-John.C.Harrison@Intel.com>
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

Use the new GT oriented output message helpers where possible.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc.c        | 25 +++--
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    |  9 +-
 .../gpu/drm/i915/gt/uc/intel_guc_capture.c    | 50 ++++------
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     |  9 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c     | 17 ++--
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c    | 49 +++++-----
 drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c     |  3 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c   |  6 +-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 56 ++++++------
 drivers/gpu/drm/i915/gt/uc/intel_huc.c        | 20 ++--
 drivers/gpu/drm/i915/gt/uc/intel_uc.c         | 84 ++++++++---------
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      | 91 +++++++++----------
 drivers/gpu/drm/i915/gt/uc/selftest_guc.c     | 36 ++++----
 .../drm/i915/gt/uc/selftest_guc_hangcheck.c   | 22 ++---
 .../drm/i915/gt/uc/selftest_guc_multi_lrc.c   | 10 +-
 15 files changed, 228 insertions(+), 259 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
index 27b09ba1d295f..36983a2cc20e8 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
@@ -330,7 +330,7 @@ static void guc_init_params(struct intel_guc *guc)
 	params[GUC_CTL_DEVID] = guc_ctl_devid(guc);
 
 	for (i = 0; i < GUC_CTL_MAX_DWORDS; i++)
-		DRM_DEBUG_DRIVER("param[%2d] = %#x\n", i, params[i]);
+		GT_DBG(guc_to_gt(guc), "param[%2d] = %#x\n", i, params[i]);
 }
 
 /*
@@ -475,8 +475,8 @@ void intel_guc_fini(struct intel_guc *guc)
 int intel_guc_send_mmio(struct intel_guc *guc, const u32 *request, u32 len,
 			u32 *response_buf, u32 response_buf_size)
 {
-	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
-	struct intel_uncore *uncore = guc_to_gt(guc)->uncore;
+	struct intel_gt *gt = guc_to_gt(guc);
+	struct intel_uncore *uncore = gt->uncore;
 	u32 header;
 	int i;
 	int ret;
@@ -510,8 +510,7 @@ int intel_guc_send_mmio(struct intel_guc *guc, const u32 *request, u32 len,
 					   10, 10, &header);
 	if (unlikely(ret)) {
 timeout:
-		drm_err(&i915->drm, "mmio request %#x: no reply %x\n",
-			request[0], header);
+		GT_ERR(gt, "mmio request %#x: no reply %x\n", request[0], header);
 		goto out;
 	}
 
@@ -532,8 +531,7 @@ int intel_guc_send_mmio(struct intel_guc *guc, const u32 *request, u32 len,
 	if (FIELD_GET(GUC_HXG_MSG_0_TYPE, header) == GUC_HXG_TYPE_NO_RESPONSE_RETRY) {
 		u32 reason = FIELD_GET(GUC_HXG_RETRY_MSG_0_REASON, header);
 
-		drm_dbg(&i915->drm, "mmio request %#x: retrying, reason %u\n",
-			request[0], reason);
+		GT_DBG(gt, "mmio request %#x: retrying, reason %u\n", request[0], reason);
 		goto retry;
 	}
 
@@ -541,16 +539,14 @@ int intel_guc_send_mmio(struct intel_guc *guc, const u32 *request, u32 len,
 		u32 hint = FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, header);
 		u32 error = FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, header);
 
-		drm_err(&i915->drm, "mmio request %#x: failure %x/%u\n",
-			request[0], error, hint);
+		GT_ERR(gt, "mmio request %#x: failure %x/%u\n", request[0], error, hint);
 		ret = -ENXIO;
 		goto out;
 	}
 
 	if (FIELD_GET(GUC_HXG_MSG_0_TYPE, header) != GUC_HXG_TYPE_RESPONSE_SUCCESS) {
 proto:
-		drm_err(&i915->drm, "mmio request %#x: unexpected reply %#x\n",
-			request[0], header);
+		GT_ERR(gt, "mmio request %#x: unexpected reply %#x\n", request[0], header);
 		ret = -EPROTO;
 		goto out;
 	}
@@ -592,9 +588,9 @@ int intel_guc_to_host_process_recv_msg(struct intel_guc *guc,
 	msg = payload[0] & guc->msg_enabled_mask;
 
 	if (msg & INTEL_GUC_RECV_MSG_CRASH_DUMP_POSTED)
-		drm_err(&guc_to_gt(guc)->i915->drm, "Received early GuC crash dump notification!\n");
+		GT_ERR(guc_to_gt(guc), "Received early GuC crash dump notification!\n");
 	if (msg & INTEL_GUC_RECV_MSG_EXCEPTION)
-		drm_err(&guc_to_gt(guc)->i915->drm, "Received early GuC exception notification!\n");
+		GT_ERR(guc_to_gt(guc), "Received early GuC exception notification!\n");
 
 	return 0;
 }
@@ -648,7 +644,8 @@ int intel_guc_suspend(struct intel_guc *guc)
 		 */
 		ret = intel_guc_send_mmio(guc, action, ARRAY_SIZE(action), NULL, 0);
 		if (ret)
-			DRM_ERROR("GuC suspend: RESET_CLIENT action failed with error %d!\n", ret);
+			GT_ERR(guc_to_gt(guc),
+			       "GuC suspend: RESET_CLIENT action failed with error %d!\n", ret);
 	}
 
 	/* Signal that the GuC isn't running. */
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
index a419d60166c87..6d07628e0eaf0 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
@@ -427,8 +427,8 @@ static long guc_mmio_reg_state_create(struct intel_guc *guc)
 
 	guc->ads_regset = temp_set.storage;
 
-	drm_dbg(&guc_to_gt(guc)->i915->drm, "Used %zu KB for temporary ADS regset\n",
-		(temp_set.storage_max * sizeof(struct guc_mmio_reg)) >> 10);
+	GT_DBG(gt, "Used %zu KB for temporary ADS regset\n",
+	       (temp_set.storage_max * sizeof(struct guc_mmio_reg)) >> 10);
 
 	return total * sizeof(struct guc_mmio_reg);
 
@@ -647,7 +647,6 @@ static int
 guc_capture_prep_lists(struct intel_guc *guc)
 {
 	struct intel_gt *gt = guc_to_gt(guc);
-	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
 	u32 ads_ggtt, capture_offset, null_ggtt, total_size = 0;
 	struct guc_gt_system_info local_info;
 	struct iosys_map info_map;
@@ -752,8 +751,8 @@ guc_capture_prep_lists(struct intel_guc *guc)
 	}
 
 	if (guc->ads_capture_size && guc->ads_capture_size != PAGE_ALIGN(total_size))
-		drm_warn(&i915->drm, "GuC->ADS->Capture alloc size changed from %d to %d\n",
-			 guc->ads_capture_size, PAGE_ALIGN(total_size));
+		GT_WARN(gt, "GuC->ADS->Capture alloc size changed from %d to %d\n",
+			guc->ads_capture_size, PAGE_ALIGN(total_size));
 
 	return PAGE_ALIGN(total_size);
 }
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
index 4e6dca707d941..51b2df2d52d43 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
@@ -344,7 +344,6 @@ guc_capture_alloc_steered_lists_xe_hpg(struct intel_guc *guc,
 				       u32 ipver)
 {
 	struct intel_gt *gt = guc_to_gt(guc);
-	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
 	struct sseu_dev_info *sseu;
 	int slice, subslice, i, iter, num_steer_regs, num_tot_regs = 0;
 	const struct __guc_mmio_reg_descr_group *list;
@@ -393,7 +392,7 @@ guc_capture_alloc_steered_lists_xe_hpg(struct intel_guc *guc,
 		}
 	}
 
-	drm_dbg(&i915->drm, "GuC-capture found %d-ext-regs.\n", num_tot_regs);
+	GT_DBG(gt, "GuC-capture found %d-ext-regs.\n", num_tot_regs);
 	guc->capture->extlists = extlists;
 }
 
@@ -466,7 +465,6 @@ guc_capture_list_init(struct intel_guc *guc, u32 owner, u32 type, u32 classid,
 		      struct guc_mmio_reg *ptr, u16 num_entries)
 {
 	u32 i = 0, j = 0;
-	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
 	const struct __guc_mmio_reg_descr_group *reglists = guc->capture->reglists;
 	struct __guc_mmio_reg_descr_group *extlists = guc->capture->extlists;
 	const struct __guc_mmio_reg_descr_group *match;
@@ -498,8 +496,8 @@ guc_capture_list_init(struct intel_guc *guc, u32 owner, u32 type, u32 classid,
 		}
 	}
 	if (i < num_entries)
-		drm_dbg(&i915->drm, "GuC-capture: Init reglist short %d out %d.\n",
-			(int)i, (int)num_entries);
+		GT_DBG(guc_to_gt(guc), "GuC-capture: Init reglist short %d out %d.\n",
+		       (int)i, (int)num_entries);
 
 	return 0;
 }
@@ -581,7 +579,6 @@ intel_guc_capture_getlist(struct intel_guc *guc, u32 owner, u32 type, u32 classi
 {
 	struct intel_guc_state_capture *gc = guc->capture;
 	struct __guc_capture_ads_cache *cache = &gc->ads_cache[owner][type][classid];
-	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
 	struct guc_debug_capture_list *listnode;
 	int ret, num_regs;
 	u8 *caplist, *tmp;
@@ -612,7 +609,7 @@ intel_guc_capture_getlist(struct intel_guc *guc, u32 owner, u32 type, u32 classi
 
 	caplist = kzalloc(size, GFP_KERNEL);
 	if (!caplist) {
-		drm_dbg(&i915->drm, "GuC-capture: failed to alloc cached caplist");
+		GT_DBG(guc_to_gt(guc), "GuC-capture: failed to alloc cached caplist");
 		return -ENOMEM;
 	}
 
@@ -642,7 +639,6 @@ intel_guc_capture_getnullheader(struct intel_guc *guc,
 				void **outptr, size_t *size)
 {
 	struct intel_guc_state_capture *gc = guc->capture;
-	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
 	int tmp = sizeof(u32) * 4;
 	void *null_header;
 
@@ -654,7 +650,7 @@ intel_guc_capture_getnullheader(struct intel_guc *guc,
 
 	null_header = kzalloc(tmp, GFP_KERNEL);
 	if (!null_header) {
-		drm_dbg(&i915->drm, "GuC-capture: failed to alloc cached nulllist");
+		GT_DBG(guc_to_gt(guc), "GuC-capture: failed to alloc cached nulllist");
 		return -ENOMEM;
 	}
 
@@ -716,7 +712,7 @@ guc_capture_output_min_size_est(struct intel_guc *guc)
 
 static void check_guc_capture_size(struct intel_guc *guc)
 {
-	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
+	struct intel_gt *gt = guc_to_gt(guc);
 	int min_size = guc_capture_output_min_size_est(guc);
 	int spare_size = min_size * GUC_CAPTURE_OVERBUFFER_MULTIPLIER;
 	u32 buffer_size = intel_guc_log_section_size_capture(&guc->log);
@@ -730,14 +726,14 @@ static void check_guc_capture_size(struct intel_guc *guc)
 	 * INTEL_GUC_STATE_CAPTURE_EVENT_STATUS_NOSPACE.
 	 */
 	if (min_size < 0)
-		drm_warn(&i915->drm, "Failed to calculate GuC error state capture buffer minimum size: %d!\n",
-			 min_size);
+		GT_WARN(gt, "Failed to calculate GuC error state capture buffer minimum size: %d!\n",
+			min_size);
 	else if (min_size > buffer_size)
-		drm_warn(&i915->drm, "GuC error state capture buffer maybe small: %d < %d\n",
-			 buffer_size, min_size);
+		GT_WARN(gt, "GuC error state capture buffer maybe small: %d < %d\n",
+			buffer_size, min_size);
 	else if (spare_size > buffer_size)
-		drm_dbg(&i915->drm, "GuC error state capture buffer lacks spare size: %d < %d (min = %d)\n",
-			buffer_size, spare_size, min_size);
+		GT_DBG(gt, "GuC error state capture buffer lacks spare size: %d < %d (min = %d)\n",
+		       buffer_size, spare_size, min_size);
 }
 
 /*
@@ -837,7 +833,6 @@ static int
 guc_capture_log_remove_dw(struct intel_guc *guc, struct __guc_capture_bufstate *buf,
 			  u32 *dw)
 {
-	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
 	int tries = 2;
 	int avail = 0;
 	u32 *src_data;
@@ -854,7 +849,7 @@ guc_capture_log_remove_dw(struct intel_guc *guc, struct __guc_capture_bufstate *
 			return 4;
 		}
 		if (avail)
-			drm_dbg(&i915->drm, "GuC-Cap-Logs not dword aligned, skipping.\n");
+			GT_DBG(guc_to_gt(guc), "GuC-Cap-Logs not dword aligned, skipping.\n");
 		buf->rd = 0;
 	}
 
@@ -1107,13 +1102,12 @@ static void
 __guc_capture_create_prealloc_nodes(struct intel_guc *guc)
 {
 	struct __guc_capture_parsed_output *node = NULL;
-	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
 	int i;
 
 	for (i = 0; i < PREALLOC_NODES_MAX_COUNT; ++i) {
 		node = guc_capture_alloc_one_node(guc);
 		if (!node) {
-			drm_warn(&i915->drm, "GuC Capture pre-alloc-cache failure\n");
+			GT_WARN(guc_to_gt(guc), "GuC Capture pre-alloc-cache failure\n");
 			/* dont free the priors, use what we got and cleanup at shutdown */
 			return;
 		}
@@ -1158,7 +1152,7 @@ guc_capture_create_prealloc_nodes(struct intel_guc *guc)
 static int
 guc_capture_extract_reglists(struct intel_guc *guc, struct __guc_capture_bufstate *buf)
 {
-	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
+	struct intel_gt *gt = guc_to_gt(guc);
 	struct guc_state_capture_group_header_t ghdr = {0};
 	struct guc_state_capture_header_t hdr = {0};
 	struct __guc_capture_parsed_output *node = NULL;
@@ -1172,7 +1166,7 @@ guc_capture_extract_reglists(struct intel_guc *guc, struct __guc_capture_bufstat
 	if (!i)
 		return -ENODATA;
 	if (i % sizeof(u32)) {
-		drm_warn(&i915->drm, "GuC Capture new entries unaligned\n");
+		GT_WARN(gt, "GuC Capture new entries unaligned\n");
 		ret = -EIO;
 		goto bailout;
 	}
@@ -1290,8 +1284,7 @@ guc_capture_extract_reglists(struct intel_guc *guc, struct __guc_capture_bufstat
 				break;
 			}
 			if (datatype != GUC_CAPTURE_LIST_TYPE_GLOBAL)
-				drm_dbg(&i915->drm, "GuC Capture missing global dump: %08x!\n",
-					datatype);
+				GT_DBG(gt, "GuC Capture missing global dump: %08x!\n", datatype);
 		}
 		node->is_partial = is_partial;
 		node->reginfo[datatype].vfid = FIELD_GET(CAP_HDR_CAPTURE_VFID, hdr.owner);
@@ -1311,7 +1304,7 @@ guc_capture_extract_reglists(struct intel_guc *guc, struct __guc_capture_bufstat
 
 		numregs = FIELD_GET(CAP_HDR_NUM_MMIOS, hdr.num_mmios);
 		if (numregs > guc->capture->max_mmio_per_node) {
-			drm_dbg(&i915->drm, "GuC Capture list extraction clipped by prealloc!\n");
+			GT_DBG(gt, "GuC Capture list extraction clipped by prealloc!\n");
 			numregs = guc->capture->max_mmio_per_node;
 		}
 		node->reginfo[datatype].num_regs = numregs;
@@ -1356,7 +1349,6 @@ static void __guc_capture_process_output(struct intel_guc *guc)
 {
 	unsigned int buffer_size, read_offset, write_offset, full_count;
 	struct intel_uc *uc = container_of(guc, typeof(*uc), guc);
-	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
 	struct guc_log_buffer_state log_buf_state_local;
 	struct guc_log_buffer_state *log_buf_state;
 	struct __guc_capture_bufstate buf;
@@ -1392,7 +1384,7 @@ static void __guc_capture_process_output(struct intel_guc *guc)
 		write_offset = buffer_size;
 	} else if (unlikely((read_offset > buffer_size) ||
 			(write_offset > buffer_size))) {
-		drm_err(&i915->drm, "invalid GuC log capture buffer state!\n");
+		GT_ERR(guc_to_gt(guc), "invalid GuC log capture buffer state!\n");
 		/* copy whole buffer as offsets are unreliable */
 		read_offset = 0;
 		write_offset = buffer_size;
@@ -1575,13 +1567,11 @@ void intel_guc_capture_get_matching_node(struct intel_gt *gt,
 					 struct intel_context *ce)
 {
 	struct __guc_capture_parsed_output *n, *ntmp;
-	struct drm_i915_private *i915;
 	struct intel_guc *guc;
 
 	if (!gt || !ee || !ce)
 		return;
 
-	i915 = gt->i915;
 	guc = &gt->uc.guc;
 	if (!guc->capture)
 		return;
@@ -1604,7 +1594,7 @@ void intel_guc_capture_get_matching_node(struct intel_gt *gt,
 			return;
 		}
 	}
-	drm_dbg(&i915->drm, "GuC capture can't match ee to node\n");
+	GT_DBG(gt, "GuC capture can't match ee to node\n");
 }
 
 void intel_guc_capture_process(struct intel_guc *guc)
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index 2b22065e87bf9..699290b10a3c3 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -28,16 +28,11 @@ static inline struct drm_i915_private *ct_to_i915(struct intel_guc_ct *ct)
 	return ct_to_gt(ct)->i915;
 }
 
-static inline struct drm_device *ct_to_drm(struct intel_guc_ct *ct)
-{
-	return &ct_to_i915(ct)->drm;
-}
-
 #define CT_ERROR(_ct, _fmt, ...) \
-	drm_err(ct_to_drm(_ct), "CT: " _fmt, ##__VA_ARGS__)
+	GT_ERR(ct_to_gt(_ct), _fmt, ##__VA_ARGS__)
 #ifdef CONFIG_DRM_I915_DEBUG_GUC
 #define CT_DEBUG(_ct, _fmt, ...) \
-	drm_dbg(ct_to_drm(_ct), "CT: " _fmt, ##__VA_ARGS__)
+	GT_DBG(ct_to_gt(_ct), _fmt, ##__VA_ARGS__)
 #else
 #define CT_DEBUG(...)	do { } while (0)
 #endif
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
index 5b86b2e286e07..83cb4868ae3b9 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
@@ -103,8 +103,9 @@ static inline bool guc_ready(struct intel_uncore *uncore, u32 *status)
 	return uk_val == INTEL_GUC_LOAD_STATUS_READY;
 }
 
-static int guc_wait_ucode(struct intel_uncore *uncore)
+static int guc_wait_ucode(struct intel_gt *gt)
 {
+	struct intel_uncore *uncore = gt->uncore;
 	u32 status;
 	int ret;
 
@@ -127,10 +128,8 @@ static int guc_wait_ucode(struct intel_uncore *uncore)
 	 */
 	ret = wait_for(guc_ready(uncore, &status), 200);
 	if (ret) {
-		struct drm_device *drm = &uncore->i915->drm;
-
-		drm_info(drm, "GuC load failed: status = 0x%08X\n", status);
-		drm_info(drm, "GuC load failed: status: Reset = %d, "
+		GT_INFO(gt, "GuC load failed: status = 0x%08X\n", status);
+		GT_INFO(gt, "GuC load failed: status: Reset = %d, "
 			"BootROM = 0x%02X, UKernel = 0x%02X, "
 			"MIA = 0x%02X, Auth = 0x%02X\n",
 			REG_FIELD_GET(GS_MIA_IN_RESET, status),
@@ -140,13 +139,13 @@ static int guc_wait_ucode(struct intel_uncore *uncore)
 			REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
 
 		if ((status & GS_BOOTROM_MASK) == GS_BOOTROM_RSA_FAILED) {
-			drm_info(drm, "GuC firmware signature verification failed\n");
+			GT_INFO(gt, "GuC firmware signature verification failed\n");
 			ret = -ENOEXEC;
 		}
 
 		if (REG_FIELD_GET(GS_UKERNEL_MASK, status) == INTEL_GUC_LOAD_STATUS_EXCEPTION) {
-			drm_info(drm, "GuC firmware exception. EIP: %#x\n",
-				 intel_uncore_read(uncore, SOFT_SCRATCH(13)));
+			GT_INFO(gt, "GuC firmware exception. EIP: %#x\n",
+				intel_uncore_read(uncore, SOFT_SCRATCH(13)));
 			ret = -ENXIO;
 		}
 	}
@@ -194,7 +193,7 @@ int intel_guc_fw_upload(struct intel_guc *guc)
 	if (ret)
 		goto out;
 
-	ret = guc_wait_ucode(uncore);
+	ret = guc_wait_ucode(gt);
 	if (ret)
 		goto out;
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
index 68331c538b0a7..0181e3e4f17ed 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
@@ -39,7 +39,7 @@ struct guc_log_section {
 static void _guc_log_init_sizes(struct intel_guc_log *log)
 {
 	struct intel_guc *guc = log_to_guc(log);
-	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
+	struct intel_gt *gt = guc_to_gt(guc);
 	static const struct guc_log_section sections[GUC_LOG_SECTIONS_LIMIT] = {
 		{
 			GUC_LOG_CRASH_MASK >> GUC_LOG_CRASH_SHIFT,
@@ -82,12 +82,12 @@ static void _guc_log_init_sizes(struct intel_guc_log *log)
 		}
 
 		if (!IS_ALIGNED(log->sizes[i].bytes, log->sizes[i].units))
-			drm_err(&i915->drm, "Mis-aligned GuC log %s size: 0x%X vs 0x%X!",
-				sections[i].name, log->sizes[i].bytes, log->sizes[i].units);
+			GT_ERR(gt, "Mis-aligned GuC log %s size: 0x%X vs 0x%X!",
+			       sections[i].name, log->sizes[i].bytes, log->sizes[i].units);
 		log->sizes[i].count = log->sizes[i].bytes / log->sizes[i].units;
 
 		if (!log->sizes[i].count) {
-			drm_err(&i915->drm, "Zero GuC log %s size!", sections[i].name);
+			GT_ERR(gt, "Zero GuC log %s size!", sections[i].name);
 		} else {
 			/* Size is +1 unit */
 			log->sizes[i].count--;
@@ -95,16 +95,16 @@ static void _guc_log_init_sizes(struct intel_guc_log *log)
 
 		/* Clip to field size */
 		if (log->sizes[i].count > sections[i].max) {
-			drm_err(&i915->drm, "GuC log %s size too large: %d vs %d!",
-				sections[i].name, log->sizes[i].count + 1, sections[i].max + 1);
+			GT_ERR(gt, "GuC log %s size too large: %d vs %d!",
+			       sections[i].name, log->sizes[i].count + 1, sections[i].max + 1);
 			log->sizes[i].count = sections[i].max;
 		}
 	}
 
 	if (log->sizes[GUC_LOG_SECTIONS_CRASH].units != log->sizes[GUC_LOG_SECTIONS_DEBUG].units) {
-		drm_err(&i915->drm, "Unit mis-match for GuC log crash and debug sections: %d vs %d!",
-			log->sizes[GUC_LOG_SECTIONS_CRASH].units,
-			log->sizes[GUC_LOG_SECTIONS_DEBUG].units);
+		GT_ERR(gt, "Unit mis-match for GuC log crash and debug sections: %d vs %d!",
+		       log->sizes[GUC_LOG_SECTIONS_CRASH].units,
+		       log->sizes[GUC_LOG_SECTIONS_DEBUG].units);
 		log->sizes[GUC_LOG_SECTIONS_CRASH].units = log->sizes[GUC_LOG_SECTIONS_DEBUG].units;
 		log->sizes[GUC_LOG_SECTIONS_CRASH].count = 0;
 	}
@@ -451,7 +451,8 @@ static void _guc_log_copy_debuglogs_for_relay(struct intel_guc_log *log)
 			write_offset = buffer_size;
 		} else if (unlikely((read_offset > buffer_size) ||
 				    (write_offset > buffer_size))) {
-			DRM_ERROR("invalid log buffer state\n");
+			GT_ERR(guc_to_gt(log_to_guc(log)),
+			       "invalid log buffer state\n");
 			/* copy whole buffer as offsets are unreliable */
 			read_offset = 0;
 			write_offset = buffer_size;
@@ -520,7 +521,7 @@ void intel_guc_log_init_early(struct intel_guc_log *log)
 static int guc_log_relay_create(struct intel_guc_log *log)
 {
 	struct intel_guc *guc = log_to_guc(log);
-	struct drm_i915_private *dev_priv = guc_to_gt(guc)->i915;
+	struct intel_gt *gt = guc_to_gt(guc);
 	struct rchan *guc_log_relay_chan;
 	size_t n_subbufs, subbuf_size;
 	int ret;
@@ -543,11 +544,11 @@ static int guc_log_relay_create(struct intel_guc_log *log)
 	n_subbufs = 8;
 
 	guc_log_relay_chan = relay_open("guc_log",
-					dev_priv->drm.primary->debugfs_root,
+					gt->i915->drm.primary->debugfs_root,
 					subbuf_size, n_subbufs,
-					&relay_callbacks, dev_priv);
+					&relay_callbacks, gt->i915);
 	if (!guc_log_relay_chan) {
-		DRM_ERROR("Couldn't create relay chan for GuC logging\n");
+		GT_ERR(gt, "Couldn't create relay chan for GuC logging\n");
 
 		ret = -ENOMEM;
 		return ret;
@@ -596,9 +597,9 @@ static u32 __get_default_log_level(struct intel_guc_log *log)
 	}
 
 	if (i915->params.guc_log_level > GUC_LOG_LEVEL_MAX) {
-		DRM_WARN("Incompatible option detected: %s=%d, %s!\n",
-			 "guc_log_level", i915->params.guc_log_level,
-			 "verbosity too high");
+		GT_WARN(guc_to_gt(guc), "Incompatible option detected: %s=%d, %s!\n",
+			"guc_log_level", i915->params.guc_log_level,
+			"verbosity too high");
 		return (IS_ENABLED(CONFIG_DRM_I915_DEBUG) ||
 			IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM)) ?
 			GUC_LOG_LEVEL_MAX : GUC_LOG_LEVEL_DISABLED;
@@ -641,15 +642,15 @@ int intel_guc_log_create(struct intel_guc_log *log)
 	log->buf_addr = vaddr;
 
 	log->level = __get_default_log_level(log);
-	DRM_DEBUG_DRIVER("guc_log_level=%d (%s, verbose:%s, verbosity:%d)\n",
-			 log->level, str_enabled_disabled(log->level),
-			 str_yes_no(GUC_LOG_LEVEL_IS_VERBOSE(log->level)),
-			 GUC_LOG_LEVEL_TO_VERBOSITY(log->level));
+	GT_DBG(guc_to_gt(guc), "guc_log_level=%d (%s, verbose:%s, verbosity:%d)\n",
+	       log->level, str_enabled_disabled(log->level),
+	       str_yes_no(GUC_LOG_LEVEL_IS_VERBOSE(log->level)),
+	       GUC_LOG_LEVEL_TO_VERBOSITY(log->level));
 
 	return 0;
 
 err:
-	DRM_ERROR("Failed to allocate or map GuC log buffer. %d\n", ret);
+	GT_ERR(guc_to_gt(guc), "Failed to allocate or map GuC log buffer. %d\n", ret);
 	return ret;
 }
 
@@ -687,7 +688,7 @@ int intel_guc_log_set_level(struct intel_guc_log *log, u32 level)
 					     GUC_LOG_LEVEL_IS_ENABLED(level),
 					     GUC_LOG_LEVEL_TO_VERBOSITY(level));
 	if (ret) {
-		DRM_DEBUG_DRIVER("guc_log_control action failed %d\n", ret);
+		GT_DBG(guc_to_gt(guc), "guc_log_control action failed %d\n", ret);
 		goto out_unlock;
 	}
 
@@ -905,7 +906,7 @@ int intel_guc_log_dump(struct intel_guc_log *log, struct drm_printer *p,
 
 	map = i915_gem_object_pin_map_unlocked(obj, I915_MAP_WC);
 	if (IS_ERR(map)) {
-		DRM_DEBUG("Failed to pin object\n");
+		GT_DBG(guc_to_gt(guc), "Failed to pin object\n");
 		drm_puts(p, "(log data unaccessible)\n");
 		free_page((unsigned long)page);
 		return PTR_ERR(map);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
index 8f8dd05835c5a..6a507c2409ecf 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
@@ -64,8 +64,7 @@ static int __guc_rc_control(struct intel_guc *guc, bool enable)
 		return ret;
 	}
 
-	drm_info(&gt->i915->drm, "GuC RC: %s\n",
-		 str_enabled_disabled(enable));
+	GT_INFO(gt, "GuC RC: %s\n", str_enabled_disabled(enable));
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
index 63464933cbceb..6f1a56c85a651 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
@@ -236,9 +236,9 @@ static int slpc_force_min_freq(struct intel_guc_slpc *slpc, u32 freq)
 					SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
 					freq);
 		if (ret)
-			drm_notice(&i915->drm,
-				   "Failed to send set_param for min freq(%d): (%d)\n",
-				   freq, ret);
+			GT_NOTICE(guc_to_gt(guc),
+				  "Failed to send set_param for min freq(%d): (%d)\n",
+				  freq, ret);
 	}
 
 	return ret;
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 4ccb29f9ac55c..ab34ff5289f0a 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -4344,8 +4344,8 @@ static int __guc_action_set_scheduling_policies(struct intel_guc *guc,
 		return ret;
 
 	if (ret != policy->count) {
-		drm_warn(&guc_to_gt(guc)->i915->drm, "GuC global scheduler policy processed %d of %d KLVs!",
-			 ret, policy->count);
+		GT_WARN(guc_to_gt(guc), "GuC global scheduler policy processed %d of %d KLVs!",
+			ret, policy->count);
 		if (ret > policy->count)
 			return -EPROTO;
 	}
@@ -4478,21 +4478,18 @@ g2h_context_lookup(struct intel_guc *guc, u32 ctx_id)
 	struct intel_context *ce;
 
 	if (unlikely(ctx_id >= GUC_MAX_CONTEXT_ID)) {
-		drm_err(&guc_to_gt(guc)->i915->drm,
-			"Invalid ctx_id %u\n", ctx_id);
+		GT_ERR(guc_to_gt(guc), "Invalid ctx_id %u\n", ctx_id);
 		return NULL;
 	}
 
 	ce = __get_context(guc, ctx_id);
 	if (unlikely(!ce)) {
-		drm_err(&guc_to_gt(guc)->i915->drm,
-			"Context is NULL, ctx_id %u\n", ctx_id);
+		GT_ERR(guc_to_gt(guc), "Context is NULL, ctx_id %u\n", ctx_id);
 		return NULL;
 	}
 
 	if (unlikely(intel_context_is_child(ce))) {
-		drm_err(&guc_to_gt(guc)->i915->drm,
-			"Context is child, ctx_id %u\n", ctx_id);
+		GT_ERR(guc_to_gt(guc), "Context is child, ctx_id %u\n", ctx_id);
 		return NULL;
 	}
 
@@ -4507,7 +4504,7 @@ int intel_guc_deregister_done_process_msg(struct intel_guc *guc,
 	u32 ctx_id;
 
 	if (unlikely(len < 1)) {
-		drm_err(&guc_to_gt(guc)->i915->drm, "Invalid length %u\n", len);
+		GT_ERR(guc_to_gt(guc), "Invalid length %u\n", len);
 		return -EPROTO;
 	}
 	ctx_id = msg[0];
@@ -4559,7 +4556,7 @@ int intel_guc_sched_done_process_msg(struct intel_guc *guc,
 	u32 ctx_id;
 
 	if (unlikely(len < 2)) {
-		drm_err(&guc_to_gt(guc)->i915->drm, "Invalid length %u\n", len);
+		GT_ERR(guc_to_gt(guc), "Invalid length %u\n", len);
 		return -EPROTO;
 	}
 	ctx_id = msg[0];
@@ -4571,9 +4568,8 @@ int intel_guc_sched_done_process_msg(struct intel_guc *guc,
 	if (unlikely(context_destroyed(ce) ||
 		     (!context_pending_enable(ce) &&
 		     !context_pending_disable(ce)))) {
-		drm_err(&guc_to_gt(guc)->i915->drm,
-			"Bad context sched_state 0x%x, ctx_id %u\n",
-			ce->guc_state.sched_state, ctx_id);
+		GT_ERR(guc_to_gt(guc), "Bad context sched_state 0x%x, ctx_id %u\n",
+		       ce->guc_state.sched_state, ctx_id);
 		return -EPROTO;
 	}
 
@@ -4660,9 +4656,9 @@ static void guc_handle_context_reset(struct intel_guc *guc,
 		capture_error_state(guc, ce);
 		guc_context_replay(ce);
 	} else {
-		drm_info(&guc_to_gt(guc)->i915->drm,
-			 "Ignoring context reset notification of exiting context 0x%04X on %s",
-			 ce->guc_id.id, ce->engine->name);
+		GT_INFO(guc_to_gt(guc),
+			"Ignoring context reset notification of exiting context 0x%04X on %s",
+			ce->guc_id.id, ce->engine->name);
 	}
 }
 
@@ -4674,7 +4670,7 @@ int intel_guc_context_reset_process_msg(struct intel_guc *guc,
 	int ctx_id;
 
 	if (unlikely(len != 1)) {
-		drm_err(&guc_to_gt(guc)->i915->drm, "Invalid length %u", len);
+		GT_ERR(guc_to_gt(guc), "Invalid length %u", len);
 		return -EPROTO;
 	}
 
@@ -4707,13 +4703,13 @@ int intel_guc_error_capture_process_msg(struct intel_guc *guc,
 	u32 status;
 
 	if (unlikely(len != 1)) {
-		drm_dbg(&guc_to_gt(guc)->i915->drm, "Invalid length %u", len);
+		GT_DBG(guc_to_gt(guc), "Invalid length %u", len);
 		return -EPROTO;
 	}
 
 	status = msg[0] & INTEL_GUC_STATE_CAPTURE_EVENT_STATUS_MASK;
 	if (status == INTEL_GUC_STATE_CAPTURE_EVENT_STATUS_NOSPACE)
-		drm_warn(&guc_to_gt(guc)->i915->drm, "G2H-Error capture no space");
+		GT_WARN(guc_to_gt(guc), "G2H-Error capture no space");
 
 	intel_guc_capture_process(guc);
 
@@ -4762,7 +4758,7 @@ int intel_guc_engine_failure_process_msg(struct intel_guc *guc,
 	unsigned long flags;
 
 	if (unlikely(len != 3)) {
-		drm_err(&gt->i915->drm, "Invalid length %u", len);
+		GT_ERR(gt, "Invalid length %u", len);
 		return -EPROTO;
 	}
 
@@ -4772,8 +4768,7 @@ int intel_guc_engine_failure_process_msg(struct intel_guc *guc,
 
 	engine = intel_guc_lookup_engine(guc, guc_class, instance);
 	if (unlikely(!engine)) {
-		drm_err(&gt->i915->drm,
-			"Invalid engine %d:%d", guc_class, instance);
+		GT_ERR(gt, "Invalid engine %d:%d", guc_class, instance);
 		return -EPROTO;
 	}
 
@@ -4781,8 +4776,8 @@ int intel_guc_engine_failure_process_msg(struct intel_guc *guc,
 	 * This is an unexpected failure of a hardware feature. So, log a real
 	 * error message not just the informational that comes with the reset.
 	 */
-	drm_err(&gt->i915->drm, "GuC engine reset request failed on %d:%d (%s) because 0x%08X",
-		guc_class, instance, engine->name, reason);
+	GT_ERR(gt, "GuC engine reset request failed on %d:%d (%s) because 0x%08X",
+	       guc_class, instance, engine->name, reason);
 
 	spin_lock_irqsave(&guc->submission_state.lock, flags);
 	guc->submission_state.reset_fail_mask |= engine->mask;
@@ -5291,6 +5286,7 @@ guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count,
 		   unsigned long flags)
 {
 	struct guc_virtual_engine *ve;
+	struct intel_gt *gt;
 	struct intel_guc *guc;
 	unsigned int n;
 	int err;
@@ -5299,10 +5295,11 @@ guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count,
 	if (!ve)
 		return ERR_PTR(-ENOMEM);
 
-	guc = &siblings[0]->gt->uc.guc;
+	gt = siblings[0]->gt;
+	guc = &gt->uc.guc;
 
 	ve->base.i915 = siblings[0]->i915;
-	ve->base.gt = siblings[0]->gt;
+	ve->base.gt = gt;
 	ve->base.uncore = siblings[0]->uncore;
 	ve->base.id = -1;
 
@@ -5330,8 +5327,7 @@ guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count,
 
 		GEM_BUG_ON(!is_power_of_2(sibling->mask));
 		if (sibling->mask & ve->base.mask) {
-			DRM_DEBUG("duplicate %s entry in load balancer\n",
-				  sibling->name);
+			GT_DBG(gt, "duplicate %s entry in load balancer\n", sibling->name);
 			err = -EINVAL;
 			goto err_put;
 		}
@@ -5340,8 +5336,8 @@ guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count,
 		ve->base.logical_mask |= sibling->logical_mask;
 
 		if (n != 0 && ve->base.class != sibling->class) {
-			DRM_DEBUG("invalid mixing of engine class, sibling %d, already %d\n",
-				  sibling->class, ve->base.class);
+			GT_DBG(gt, "invalid mixing of engine class, sibling %d, already %d\n",
+			       sibling->class, ve->base.class);
 			err = -EINVAL;
 			goto err_put;
 		} else if (n == 0) {
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
index fbc8bae14f76a..c31ef49ad7fd0 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
@@ -255,29 +255,27 @@ static int check_huc_loading_mode(struct intel_huc *huc)
 			      GSC_LOADS_HUC;
 
 	if (fw_needs_gsc != hw_uses_gsc) {
-		drm_err(&gt->i915->drm,
-			"mismatch between HuC FW (%s) and HW (%s) load modes\n",
-			HUC_LOAD_MODE_STRING(fw_needs_gsc),
-			HUC_LOAD_MODE_STRING(hw_uses_gsc));
+		GT_ERR(gt, "mismatch between HuC FW (%s) and HW (%s) load modes\n",
+		       HUC_LOAD_MODE_STRING(fw_needs_gsc),
+		       HUC_LOAD_MODE_STRING(hw_uses_gsc));
 		return -ENOEXEC;
 	}
 
 	/* make sure we can access the GSC via the mei driver if we need it */
 	if (!(IS_ENABLED(CONFIG_INTEL_MEI_PXP) && IS_ENABLED(CONFIG_INTEL_MEI_GSC)) &&
 	    fw_needs_gsc) {
-		drm_info(&gt->i915->drm,
-			 "Can't load HuC due to missing MEI modules\n");
+		GT_INFO(gt, "Can't load HuC due to missing MEI modules\n");
 		return -EIO;
 	}
 
-	drm_dbg(&gt->i915->drm, "GSC loads huc=%s\n", str_yes_no(fw_needs_gsc));
+	GT_DBG(gt, "GSC loads huc=%s\n", str_yes_no(fw_needs_gsc));
 
 	return 0;
 }
 
 int intel_huc_init(struct intel_huc *huc)
 {
-	struct drm_i915_private *i915 = huc_to_gt(huc)->i915;
+	struct intel_gt *gt = huc_to_gt(huc);
 	int err;
 
 	err = check_huc_loading_mode(huc);
@@ -294,7 +292,7 @@ int intel_huc_init(struct intel_huc *huc)
 
 out:
 	intel_uc_fw_change_status(&huc->fw, INTEL_UC_FIRMWARE_INIT_FAIL);
-	drm_info(&i915->drm, "HuC init failed with %d\n", err);
+	GT_INFO(gt, "HuC init failed with %d\n", err);
 	return err;
 }
 
@@ -337,13 +335,13 @@ int intel_huc_wait_for_auth_complete(struct intel_huc *huc)
 	delayed_huc_load_complete(huc);
 
 	if (ret) {
-		drm_err(&gt->i915->drm, "HuC: Firmware not verified %d\n", ret);
+		GT_ERR(gt, "HuC: Firmware not verified %d\n", ret);
 		intel_uc_fw_change_status(&huc->fw, INTEL_UC_FIRMWARE_LOAD_FAIL);
 		return ret;
 	}
 
 	intel_uc_fw_change_status(&huc->fw, INTEL_UC_FIRMWARE_RUNNING);
-	drm_info(&gt->i915->drm, "HuC authenticated\n");
+	GT_INFO(gt, "HuC authenticated\n");
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
index dbd048b77e193..a30dfbe655024 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
@@ -65,7 +65,7 @@ static int __intel_uc_reset_hw(struct intel_uc *uc)
 
 	ret = intel_reset_guc(gt);
 	if (ret) {
-		DRM_ERROR("Failed to reset GuC, ret = %d\n", ret);
+		GT_ERR(gt, "Failed to reset GuC, ret = %d\n", ret);
 		return ret;
 	}
 
@@ -79,15 +79,15 @@ static int __intel_uc_reset_hw(struct intel_uc *uc)
 
 static void __confirm_options(struct intel_uc *uc)
 {
-	struct drm_i915_private *i915 = uc_to_gt(uc)->i915;
+	struct intel_gt *gt = uc_to_gt(uc);
+	struct drm_i915_private *i915 = gt->i915;
 
-	drm_dbg(&i915->drm,
-		"enable_guc=%d (guc:%s submission:%s huc:%s slpc:%s)\n",
-		i915->params.enable_guc,
-		str_yes_no(intel_uc_wants_guc(uc)),
-		str_yes_no(intel_uc_wants_guc_submission(uc)),
-		str_yes_no(intel_uc_wants_huc(uc)),
-		str_yes_no(intel_uc_wants_guc_slpc(uc)));
+	GT_DBG(gt, "enable_guc=%d (guc:%s submission:%s huc:%s slpc:%s)\n",
+	       i915->params.enable_guc,
+	       str_yes_no(intel_uc_wants_guc(uc)),
+	       str_yes_no(intel_uc_wants_guc_submission(uc)),
+	       str_yes_no(intel_uc_wants_huc(uc)),
+	       str_yes_no(intel_uc_wants_guc_slpc(uc)));
 
 	if (i915->params.enable_guc == 0) {
 		GEM_BUG_ON(intel_uc_wants_guc(uc));
@@ -98,26 +98,22 @@ static void __confirm_options(struct intel_uc *uc)
 	}
 
 	if (!intel_uc_supports_guc(uc))
-		drm_info(&i915->drm,
-			 "Incompatible option enable_guc=%d - %s\n",
-			 i915->params.enable_guc, "GuC is not supported!");
+		GT_INFO(gt, "Incompatible option enable_guc=%d - %s\n",
+			i915->params.enable_guc, "GuC is not supported!");
 
 	if (i915->params.enable_guc & ENABLE_GUC_LOAD_HUC &&
 	    !intel_uc_supports_huc(uc))
-		drm_info(&i915->drm,
-			 "Incompatible option enable_guc=%d - %s\n",
-			 i915->params.enable_guc, "HuC is not supported!");
+		GT_INFO(gt, "Incompatible option enable_guc=%d - %s\n",
+			i915->params.enable_guc, "HuC is not supported!");
 
 	if (i915->params.enable_guc & ENABLE_GUC_SUBMISSION &&
 	    !intel_uc_supports_guc_submission(uc))
-		drm_info(&i915->drm,
-			 "Incompatible option enable_guc=%d - %s\n",
-			 i915->params.enable_guc, "GuC submission is N/A");
+		GT_INFO(gt, "Incompatible option enable_guc=%d - %s\n",
+			i915->params.enable_guc, "GuC submission is N/A");
 
 	if (i915->params.enable_guc & ~ENABLE_GUC_MASK)
-		drm_info(&i915->drm,
-			 "Incompatible option enable_guc=%d - %s\n",
-			 i915->params.enable_guc, "undocumented flag");
+		GT_INFO(gt, "Incompatible option enable_guc=%d - %s\n",
+			i915->params.enable_guc, "undocumented flag");
 }
 
 void intel_uc_init_early(struct intel_uc *uc)
@@ -249,15 +245,13 @@ static int guc_enable_communication(struct intel_guc *guc)
 	intel_guc_ct_event_handler(&guc->ct);
 	spin_unlock_irq(gt->irq_lock);
 
-	drm_dbg(&i915->drm, "GuC communication enabled\n");
+	GT_DBG(gt, "GuC communication enabled\n");
 
 	return 0;
 }
 
 static void guc_disable_communication(struct intel_guc *guc)
 {
-	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
-
 	/*
 	 * Events generated during or after CT disable are logged by guc in
 	 * via mmio. Make sure the register is clear before disabling CT since
@@ -277,7 +271,7 @@ static void guc_disable_communication(struct intel_guc *guc)
 	 */
 	guc_get_mmio_msg(guc);
 
-	drm_dbg(&i915->drm, "GuC communication disabled\n");
+	GT_DBG(guc_to_gt(guc), "GuC communication disabled\n");
 }
 
 static void __uc_fetch_firmwares(struct intel_uc *uc)
@@ -290,8 +284,8 @@ static void __uc_fetch_firmwares(struct intel_uc *uc)
 	if (err) {
 		/* Make sure we transition out of transient "SELECTED" state */
 		if (intel_uc_wants_huc(uc)) {
-			drm_dbg(&uc_to_gt(uc)->i915->drm,
-				"Failed to fetch GuC: %d disabling HuC\n", err);
+			GT_DBG(uc_to_gt(uc),
+			       "Failed to fetch GuC: %d disabling HuC\n", err);
 			intel_uc_fw_change_status(&uc->huc.fw,
 						  INTEL_UC_FIRMWARE_ERROR);
 		}
@@ -433,18 +427,19 @@ static int __uc_check_hw(struct intel_uc *uc)
 
 static void print_fw_ver(struct intel_uc *uc, struct intel_uc_fw *fw)
 {
-	struct drm_i915_private *i915 = uc_to_gt(uc)->i915;
+	struct intel_gt *gt = uc_to_gt(uc);
 
-	drm_info(&i915->drm, "%s firmware %s version %u.%u.%u\n",
-		 intel_uc_fw_type_repr(fw->type), fw->file_selected.path,
-		 fw->file_selected.major_ver,
-		 fw->file_selected.minor_ver,
-		 fw->file_selected.patch_ver);
+	GT_INFO(gt, "%s firmware %s version %u.%u.%u\n",
+		intel_uc_fw_type_repr(fw->type), fw->file_selected.path,
+		fw->file_selected.major_ver,
+		fw->file_selected.minor_ver,
+		fw->file_selected.patch_ver);
 }
 
 static int __uc_init_hw(struct intel_uc *uc)
 {
-	struct drm_i915_private *i915 = uc_to_gt(uc)->i915;
+	struct intel_gt *gt = uc_to_gt(uc);
+	struct drm_i915_private *i915 = gt->i915;
 	struct intel_guc *guc = &uc->guc;
 	struct intel_huc *huc = &uc->huc;
 	int ret, attempts;
@@ -496,8 +491,8 @@ static int __uc_init_hw(struct intel_uc *uc)
 		if (ret == 0)
 			break;
 
-		DRM_DEBUG_DRIVER("GuC fw load failed: %d; will reset and "
-				 "retry %d more time(s)\n", ret, attempts);
+		GT_DBG(gt, "GuC fw load failed: %d; will reset and retry %d more time(s)\n",
+		       ret, attempts);
 	}
 
 	/* Did we succeded or run out of retries? */
@@ -531,10 +526,10 @@ static int __uc_init_hw(struct intel_uc *uc)
 		intel_rps_lower_unslice(&uc_to_gt(uc)->rps);
 	}
 
-	drm_info(&i915->drm, "GuC submission %s\n",
-		 str_enabled_disabled(intel_uc_uses_guc_submission(uc)));
-	drm_info(&i915->drm, "GuC SLPC %s\n",
-		 str_enabled_disabled(intel_uc_uses_guc_slpc(uc)));
+	GT_INFO(gt, "GuC submission %s\n",
+		str_enabled_disabled(intel_uc_uses_guc_submission(uc)));
+	GT_INFO(gt, "GuC SLPC %s\n",
+		str_enabled_disabled(intel_uc_uses_guc_slpc(uc)));
 
 	return 0;
 
@@ -552,7 +547,7 @@ static int __uc_init_hw(struct intel_uc *uc)
 	__uc_sanitize(uc);
 
 	if (!ret) {
-		drm_notice(&i915->drm, "GuC is uninitialized\n");
+		GT_NOTICE(gt, "GuC is uninitialized\n");
 		/* We want to run without GuC submission */
 		return 0;
 	}
@@ -654,16 +649,17 @@ void intel_uc_runtime_suspend(struct intel_uc *uc)
 void intel_uc_suspend(struct intel_uc *uc)
 {
 	struct intel_guc *guc = &uc->guc;
+	struct intel_gt *gt = uc_to_gt(uc);
 	intel_wakeref_t wakeref;
 	int err;
 
 	if (!intel_guc_is_ready(guc))
 		return;
 
-	with_intel_runtime_pm(&uc_to_gt(uc)->i915->runtime_pm, wakeref) {
+	with_intel_runtime_pm(&gt->i915->runtime_pm, wakeref) {
 		err = intel_guc_suspend(guc);
 		if (err)
-			DRM_DEBUG_DRIVER("Failed to suspend GuC, err=%d", err);
+			GT_DBG(gt, "Failed to suspend GuC, err=%d", err);
 	}
 }
 
@@ -691,7 +687,7 @@ static int __uc_resume(struct intel_uc *uc, bool enable_communication)
 
 	err = intel_guc_resume(guc);
 	if (err) {
-		DRM_DEBUG_DRIVER("Failed to resume GuC, err=%d", err);
+		GT_DBG(gt, "Failed to resume GuC, err=%d", err);
 		return err;
 	}
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
index de2843dc1307e..d397affbde841 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
@@ -11,6 +11,7 @@
 #include <drm/drm_print.h>
 
 #include "gem/i915_gem_lmem.h"
+#include "gt/intel_gt.h"
 #include "intel_uc_fw.h"
 #include "intel_uc_fw_abi.h"
 #include "i915_drv.h"
@@ -37,11 +38,10 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
 			       enum intel_uc_fw_status status)
 {
 	uc_fw->__status =  status;
-	drm_dbg(&__uc_fw_to_gt(uc_fw)->i915->drm,
-		"%s firmware -> %s\n",
-		intel_uc_fw_type_repr(uc_fw->type),
-		status == INTEL_UC_FIRMWARE_SELECTED ?
-		uc_fw->file_selected.path : intel_uc_fw_status_repr(status));
+	GT_DBG(__uc_fw_to_gt(uc_fw), "%s firmware -> %s\n",
+	       intel_uc_fw_type_repr(uc_fw->type),
+	       status == INTEL_UC_FIRMWARE_SELECTED ?
+	       uc_fw->file_selected.path : intel_uc_fw_status_repr(status));
 }
 #endif
 
@@ -478,18 +478,18 @@ static int check_gsc_manifest(const struct firmware *fw,
 	return 0;
 }
 
-static int check_ccs_header(struct drm_i915_private *i915,
-			    const struct firmware *fw,
+static int check_ccs_header(const struct firmware *fw,
 			    struct intel_uc_fw *uc_fw)
 {
+	struct intel_gt *gt = __uc_fw_to_gt(uc_fw);
 	struct uc_css_header *css;
 	size_t size;
 
 	/* Check the size of the blob before examining buffer contents */
 	if (unlikely(fw->size < sizeof(struct uc_css_header))) {
-		drm_warn(&i915->drm, "%s firmware %s: invalid size: %zu < %zu\n",
-			 intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path,
-			 fw->size, sizeof(struct uc_css_header));
+		GT_WARN(gt, "%s firmware %s: invalid size: %zu < %zu\n",
+			intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path,
+			fw->size, sizeof(struct uc_css_header));
 		return -ENODATA;
 	}
 
@@ -499,10 +499,9 @@ static int check_ccs_header(struct drm_i915_private *i915,
 	size = (css->header_size_dw - css->key_size_dw - css->modulus_size_dw -
 		css->exponent_size_dw) * sizeof(u32);
 	if (unlikely(size != sizeof(struct uc_css_header))) {
-		drm_warn(&i915->drm,
-			 "%s firmware %s: unexpected header size: %zu != %zu\n",
-			 intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path,
-			 fw->size, sizeof(struct uc_css_header));
+		GT_WARN(gt, "%s firmware %s: unexpected header size: %zu != %zu\n",
+			intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path,
+			fw->size, sizeof(struct uc_css_header));
 		return -EPROTO;
 	}
 
@@ -515,18 +514,18 @@ static int check_ccs_header(struct drm_i915_private *i915,
 	/* At least, it should have header, uCode and RSA. Size of all three. */
 	size = sizeof(struct uc_css_header) + uc_fw->ucode_size + uc_fw->rsa_size;
 	if (unlikely(fw->size < size)) {
-		drm_warn(&i915->drm, "%s firmware %s: invalid size: %zu < %zu\n",
-			 intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path,
-			 fw->size, size);
+		GT_WARN(gt, "%s firmware %s: invalid size: %zu < %zu\n",
+			intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path,
+			fw->size, size);
 		return -ENOEXEC;
 	}
 
 	/* Sanity check whether this fw is not larger than whole WOPCM memory */
 	size = __intel_uc_fw_get_upload_size(uc_fw);
-	if (unlikely(size >= i915->wopcm.size)) {
-		drm_warn(&i915->drm, "%s firmware %s: invalid size: %zu > %zu\n",
-			 intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path,
-			 size, (size_t)i915->wopcm.size);
+	if (unlikely(size >= gt->i915->wopcm.size)) {
+		GT_WARN(gt, "%s firmware %s: invalid size: %zu > %zu\n",
+			intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path,
+			size, (size_t)gt->i915->wopcm.size);
 		return -E2BIG;
 	}
 
@@ -554,7 +553,8 @@ static int check_ccs_header(struct drm_i915_private *i915,
  */
 int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
 {
-	struct drm_i915_private *i915 = __uc_fw_to_gt(uc_fw)->i915;
+	struct intel_gt *gt = __uc_fw_to_gt(uc_fw);
+	struct drm_i915_private *i915 = gt->i915;
 	struct intel_uc_fw_file file_ideal;
 	struct device *dev = i915->drm.dev;
 	struct drm_i915_gem_object *obj;
@@ -604,17 +604,17 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
 	if (uc_fw->loaded_via_gsc)
 		err = check_gsc_manifest(fw, uc_fw);
 	else
-		err = check_ccs_header(i915, fw, uc_fw);
+		err = check_ccs_header(fw, uc_fw);
 	if (err)
 		goto fail;
 
 	if (uc_fw->file_wanted.major_ver) {
 		/* Check the file's major version was as it claimed */
 		if (uc_fw->file_selected.major_ver != uc_fw->file_wanted.major_ver) {
-			drm_notice(&i915->drm, "%s firmware %s: unexpected version: %u.%u != %u.%u\n",
-				   intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path,
-				   uc_fw->file_selected.major_ver, uc_fw->file_selected.minor_ver,
-				   uc_fw->file_wanted.major_ver, uc_fw->file_wanted.minor_ver);
+			GT_NOTICE(gt, "%s firmware %s: unexpected version: %u.%u != %u.%u\n",
+				  intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path,
+				  uc_fw->file_selected.major_ver, uc_fw->file_selected.minor_ver,
+				  uc_fw->file_wanted.major_ver, uc_fw->file_wanted.minor_ver);
 			if (!intel_uc_fw_is_overridden(uc_fw)) {
 				err = -ENOEXEC;
 				goto fail;
@@ -629,16 +629,14 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
 		/* Preserve the version that was really wanted */
 		memcpy(&uc_fw->file_wanted, &file_ideal, sizeof(uc_fw->file_wanted));
 
-		drm_notice(&i915->drm,
-			   "%s firmware %s (%d.%d) is recommended, but only %s (%d.%d) was found\n",
-			   intel_uc_fw_type_repr(uc_fw->type),
-			   uc_fw->file_wanted.path,
-			   uc_fw->file_wanted.major_ver, uc_fw->file_wanted.minor_ver,
-			   uc_fw->file_selected.path,
-			   uc_fw->file_selected.major_ver, uc_fw->file_selected.minor_ver);
-		drm_info(&i915->drm,
-			 "Consider updating your linux-firmware pkg or downloading from %s\n",
-			 INTEL_UC_FIRMWARE_URL);
+		GT_NOTICE(gt, "%s firmware %s (%d.%d) is recommended, but only %s (%d.%d) was found\n",
+			  intel_uc_fw_type_repr(uc_fw->type),
+			  uc_fw->file_wanted.path,
+			  uc_fw->file_wanted.major_ver, uc_fw->file_wanted.minor_ver,
+			  uc_fw->file_selected.path,
+			  uc_fw->file_selected.major_ver, uc_fw->file_selected.minor_ver);
+		GT_INFO(gt, "Consider updating your linux-firmware pkg or downloading from %s\n",
+			INTEL_UC_FIRMWARE_URL);
 	}
 
 	if (HAS_LMEM(i915)) {
@@ -668,8 +666,8 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
 
 	i915_probe_error(i915, "%s firmware %s: fetch failed with error %d\n",
 			 intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path, err);
-	drm_info(&i915->drm, "%s firmware(s) can be downloaded from %s\n",
-		 intel_uc_fw_type_repr(uc_fw->type), INTEL_UC_FIRMWARE_URL);
+	GT_INFO(gt, "%s firmware(s) can be downloaded from %s\n",
+		intel_uc_fw_type_repr(uc_fw->type), INTEL_UC_FIRMWARE_URL);
 
 	release_firmware(fw);		/* OK even if fw is NULL */
 	return err;
@@ -760,9 +758,9 @@ static int uc_fw_xfer(struct intel_uc_fw *uc_fw, u32 dst_offset, u32 dma_flags)
 	/* Wait for DMA to finish */
 	ret = intel_wait_for_register_fw(uncore, DMA_CTRL, START_DMA, 0, 100);
 	if (ret)
-		drm_err(&gt->i915->drm, "DMA for %s fw failed, DMA_CTRL=%u\n",
-			intel_uc_fw_type_repr(uc_fw->type),
-			intel_uncore_read_fw(uncore, DMA_CTRL));
+		GT_ERR(gt, "DMA for %s fw failed, DMA_CTRL=%u\n",
+		       intel_uc_fw_type_repr(uc_fw->type),
+		       intel_uncore_read_fw(uncore, DMA_CTRL));
 
 	/* Disable the bits once DMA is over */
 	intel_uncore_write_fw(uncore, DMA_CTRL, _MASKED_BIT_DISABLE(dma_flags));
@@ -886,6 +884,7 @@ static void uc_fw_rsa_data_destroy(struct intel_uc_fw *uc_fw)
 
 int intel_uc_fw_init(struct intel_uc_fw *uc_fw)
 {
+	struct intel_gt *gt = __uc_fw_to_gt(uc_fw);
 	int err;
 
 	/* this should happen before the load! */
@@ -896,15 +895,15 @@ int intel_uc_fw_init(struct intel_uc_fw *uc_fw)
 
 	err = i915_gem_object_pin_pages_unlocked(uc_fw->obj);
 	if (err) {
-		DRM_DEBUG_DRIVER("%s fw pin-pages err=%d\n",
-				 intel_uc_fw_type_repr(uc_fw->type), err);
+		GT_DBG(gt, "%s fw pin-pages err=%d\n",
+		       intel_uc_fw_type_repr(uc_fw->type), err);
 		goto out;
 	}
 
 	err = uc_fw_rsa_data_create(uc_fw);
 	if (err) {
-		DRM_DEBUG_DRIVER("%s fw rsa data creation failed, err=%d\n",
-				 intel_uc_fw_type_repr(uc_fw->type), err);
+		GT_DBG(gt, "%s fw rsa data creation failed, err=%d\n",
+		       intel_uc_fw_type_repr(uc_fw->type), err);
 		goto out_unpin;
 	}
 
diff --git a/drivers/gpu/drm/i915/gt/uc/selftest_guc.c b/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
index e28518fe8b908..dfaf8ce7d60cf 100644
--- a/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
+++ b/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
@@ -65,7 +65,7 @@ static int intel_guc_scrub_ctbs(void *arg)
 		ce = intel_context_create(engine);
 		if (IS_ERR(ce)) {
 			ret = PTR_ERR(ce);
-			drm_err(&gt->i915->drm, "Failed to create context, %d: %d\n", i, ret);
+			GT_ERR(gt, "Failed to create context, %d: %d\n", i, ret);
 			goto err;
 		}
 
@@ -86,7 +86,7 @@ static int intel_guc_scrub_ctbs(void *arg)
 
 		if (IS_ERR(rq)) {
 			ret = PTR_ERR(rq);
-			drm_err(&gt->i915->drm, "Failed to create request, %d: %d\n", i, ret);
+			GT_ERR(gt, "Failed to create request, %d: %d\n", i, ret);
 			goto err;
 		}
 
@@ -96,7 +96,7 @@ static int intel_guc_scrub_ctbs(void *arg)
 	for (i = 0; i < 3; ++i) {
 		ret = i915_request_wait(last[i], 0, HZ);
 		if (ret < 0) {
-			drm_err(&gt->i915->drm, "Last request failed to complete: %d\n", ret);
+			GT_ERR(gt, "Last request failed to complete: %d\n", ret);
 			goto err;
 		}
 		i915_request_put(last[i]);
@@ -113,7 +113,7 @@ static int intel_guc_scrub_ctbs(void *arg)
 	/* GT will not idle if G2H are lost */
 	ret = intel_gt_wait_for_idle(gt, HZ);
 	if (ret < 0) {
-		drm_err(&gt->i915->drm, "GT failed to idle: %d\n", ret);
+		GT_ERR(gt, "GT failed to idle: %d\n", ret);
 		goto err;
 	}
 
@@ -153,7 +153,7 @@ static int intel_guc_steal_guc_ids(void *arg)
 
 	ce = kcalloc(GUC_MAX_CONTEXT_ID, sizeof(*ce), GFP_KERNEL);
 	if (!ce) {
-		drm_err(&gt->i915->drm, "Context array allocation failed\n");
+		GT_ERR(gt, "Context array allocation failed\n");
 		return -ENOMEM;
 	}
 
@@ -167,24 +167,24 @@ static int intel_guc_steal_guc_ids(void *arg)
 	if (IS_ERR(ce[context_index])) {
 		ret = PTR_ERR(ce[context_index]);
 		ce[context_index] = NULL;
-		drm_err(&gt->i915->drm, "Failed to create context: %d\n", ret);
+		GT_ERR(gt, "Failed to create context: %d\n", ret);
 		goto err_wakeref;
 	}
 	ret = igt_spinner_init(&spin, engine->gt);
 	if (ret) {
-		drm_err(&gt->i915->drm, "Failed to create spinner: %d\n", ret);
+		GT_ERR(gt, "Failed to create spinner: %d\n", ret);
 		goto err_contexts;
 	}
 	spin_rq = igt_spinner_create_request(&spin, ce[context_index],
 					     MI_ARB_CHECK);
 	if (IS_ERR(spin_rq)) {
 		ret = PTR_ERR(spin_rq);
-		drm_err(&gt->i915->drm, "Failed to create spinner request: %d\n", ret);
+		GT_ERR(gt, "Failed to create spinner request: %d\n", ret);
 		goto err_contexts;
 	}
 	ret = request_add_spin(spin_rq, &spin);
 	if (ret) {
-		drm_err(&gt->i915->drm, "Failed to add Spinner request: %d\n", ret);
+		GT_ERR(gt, "Failed to add Spinner request: %d\n", ret);
 		goto err_spin_rq;
 	}
 
@@ -194,7 +194,7 @@ static int intel_guc_steal_guc_ids(void *arg)
 		if (IS_ERR(ce[context_index])) {
 			ret = PTR_ERR(ce[context_index--]);
 			ce[context_index] = NULL;
-			drm_err(&gt->i915->drm, "Failed to create context: %d\n", ret);
+			GT_ERR(gt, "Failed to create context: %d\n", ret);
 			goto err_spin_rq;
 		}
 
@@ -203,8 +203,8 @@ static int intel_guc_steal_guc_ids(void *arg)
 			ret = PTR_ERR(rq);
 			rq = NULL;
 			if (ret != -EAGAIN) {
-				drm_err(&gt->i915->drm, "Failed to create request, %d: %d\n",
-					context_index, ret);
+				GT_ERR(gt, "Failed to create request, %d: %d\n",
+				       context_index, ret);
 				goto err_spin_rq;
 			}
 		} else {
@@ -218,7 +218,7 @@ static int intel_guc_steal_guc_ids(void *arg)
 	igt_spinner_end(&spin);
 	ret = intel_selftest_wait_for_rq(spin_rq);
 	if (ret) {
-		drm_err(&gt->i915->drm, "Spin request failed to complete: %d\n", ret);
+		GT_ERR(gt, "Spin request failed to complete: %d\n", ret);
 		i915_request_put(last);
 		goto err_spin_rq;
 	}
@@ -230,7 +230,7 @@ static int intel_guc_steal_guc_ids(void *arg)
 	ret = i915_request_wait(last, 0, HZ * 30);
 	i915_request_put(last);
 	if (ret < 0) {
-		drm_err(&gt->i915->drm, "Last request failed to complete: %d\n", ret);
+		GT_ERR(gt, "Last request failed to complete: %d\n", ret);
 		goto err_spin_rq;
 	}
 
@@ -238,7 +238,7 @@ static int intel_guc_steal_guc_ids(void *arg)
 	rq = nop_user_request(ce[context_index], NULL);
 	if (IS_ERR(rq)) {
 		ret = PTR_ERR(rq);
-		drm_err(&gt->i915->drm, "Failed to steal guc_id, %d: %d\n", context_index, ret);
+		GT_ERR(gt, "Failed to steal guc_id, %d: %d\n", context_index, ret);
 		goto err_spin_rq;
 	}
 
@@ -246,20 +246,20 @@ static int intel_guc_steal_guc_ids(void *arg)
 	ret = i915_request_wait(rq, 0, HZ);
 	i915_request_put(rq);
 	if (ret < 0) {
-		drm_err(&gt->i915->drm, "Request with stolen guc_id failed to complete: %d\n", ret);
+		GT_ERR(gt, "Request with stolen guc_id failed to complete: %d\n", ret);
 		goto err_spin_rq;
 	}
 
 	/* Wait for idle */
 	ret = intel_gt_wait_for_idle(gt, HZ * 30);
 	if (ret < 0) {
-		drm_err(&gt->i915->drm, "GT failed to idle: %d\n", ret);
+		GT_ERR(gt, "GT failed to idle: %d\n", ret);
 		goto err_spin_rq;
 	}
 
 	/* Verify a guc_id was stolen */
 	if (guc->number_guc_id_stolen == number_guc_id_stolen) {
-		drm_err(&gt->i915->drm, "No guc_id was stolen");
+		GT_ERR(gt, "No guc_id was stolen");
 		ret = -EINVAL;
 	} else {
 		ret = 0;
diff --git a/drivers/gpu/drm/i915/gt/uc/selftest_guc_hangcheck.c b/drivers/gpu/drm/i915/gt/uc/selftest_guc_hangcheck.c
index 01f8cd3c31340..a3699c14f6148 100644
--- a/drivers/gpu/drm/i915/gt/uc/selftest_guc_hangcheck.c
+++ b/drivers/gpu/drm/i915/gt/uc/selftest_guc_hangcheck.c
@@ -42,7 +42,7 @@ static int intel_hang_guc(void *arg)
 
 	ctx = kernel_context(gt->i915, NULL);
 	if (IS_ERR(ctx)) {
-		drm_err(&gt->i915->drm, "Failed get kernel context: %ld\n", PTR_ERR(ctx));
+		GT_ERR(gt, "Failed get kernel context: %ld\n", PTR_ERR(ctx));
 		return PTR_ERR(ctx);
 	}
 
@@ -51,7 +51,7 @@ static int intel_hang_guc(void *arg)
 	ce = intel_context_create(gt->engine[BCS0]);
 	if (IS_ERR(ce)) {
 		ret = PTR_ERR(ce);
-		drm_err(&gt->i915->drm, "Failed to create spinner request: %d\n", ret);
+		GT_ERR(gt, "Failed to create spinner request: %d\n", ret);
 		goto err;
 	}
 
@@ -61,13 +61,13 @@ static int intel_hang_guc(void *arg)
 	old_beat = engine->props.heartbeat_interval_ms;
 	ret = intel_engine_set_heartbeat(engine, BEAT_INTERVAL);
 	if (ret) {
-		drm_err(&gt->i915->drm, "Failed to boost heatbeat interval: %d\n", ret);
+		GT_ERR(gt, "Failed to boost heatbeat interval: %d\n", ret);
 		goto err;
 	}
 
 	ret = igt_spinner_init(&spin, engine->gt);
 	if (ret) {
-		drm_err(&gt->i915->drm, "Failed to create spinner: %d\n", ret);
+		GT_ERR(gt, "Failed to create spinner: %d\n", ret);
 		goto err;
 	}
 
@@ -75,28 +75,28 @@ static int intel_hang_guc(void *arg)
 	intel_context_put(ce);
 	if (IS_ERR(rq)) {
 		ret = PTR_ERR(rq);
-		drm_err(&gt->i915->drm, "Failed to create spinner request: %d\n", ret);
+		GT_ERR(gt, "Failed to create spinner request: %d\n", ret);
 		goto err_spin;
 	}
 
 	ret = request_add_spin(rq, &spin);
 	if (ret) {
 		i915_request_put(rq);
-		drm_err(&gt->i915->drm, "Failed to add Spinner request: %d\n", ret);
+		GT_ERR(gt, "Failed to add Spinner request: %d\n", ret);
 		goto err_spin;
 	}
 
 	ret = intel_reset_guc(gt);
 	if (ret) {
 		i915_request_put(rq);
-		drm_err(&gt->i915->drm, "Failed to reset GuC, ret = %d\n", ret);
+		GT_ERR(gt, "Failed to reset GuC, ret = %d\n", ret);
 		goto err_spin;
 	}
 
 	guc_status = intel_uncore_read(gt->uncore, GUC_STATUS);
 	if (!(guc_status & GS_MIA_IN_RESET)) {
 		i915_request_put(rq);
-		drm_err(&gt->i915->drm, "GuC failed to reset: status = 0x%08X\n", guc_status);
+		GT_ERR(gt, "GuC failed to reset: status = 0x%08X\n", guc_status);
 		ret = -EIO;
 		goto err_spin;
 	}
@@ -105,12 +105,12 @@ static int intel_hang_guc(void *arg)
 	ret = intel_selftest_wait_for_rq(rq);
 	i915_request_put(rq);
 	if (ret) {
-		drm_err(&gt->i915->drm, "Request failed to complete: %d\n", ret);
+		GT_ERR(gt, "Request failed to complete: %d\n", ret);
 		goto err_spin;
 	}
 
 	if (i915_reset_count(global) == reset_count) {
-		drm_err(&gt->i915->drm, "Failed to record a GPU reset\n");
+		GT_ERR(gt, "Failed to record a GPU reset\n");
 		ret = -EINVAL;
 		goto err_spin;
 	}
@@ -130,7 +130,7 @@ static int intel_hang_guc(void *arg)
 		ret = intel_selftest_wait_for_rq(rq);
 		i915_request_put(rq);
 		if (ret) {
-			drm_err(&gt->i915->drm, "No-op failed to complete: %d\n", ret);
+			GT_ERR(gt, "No-op failed to complete: %d\n", ret);
 			goto err;
 		}
 	}
diff --git a/drivers/gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c b/drivers/gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c
index d17982c36d256..d045984488fa8 100644
--- a/drivers/gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c
+++ b/drivers/gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c
@@ -115,30 +115,30 @@ static int __intel_guc_multi_lrc_basic(struct intel_gt *gt, unsigned int class)
 
 	parent = multi_lrc_create_parent(gt, class, 0);
 	if (IS_ERR(parent)) {
-		drm_err(&gt->i915->drm, "Failed creating contexts: %ld", PTR_ERR(parent));
+		GT_ERR(gt, "Failed creating contexts: %ld", PTR_ERR(parent));
 		return PTR_ERR(parent);
 	} else if (!parent) {
-		drm_dbg(&gt->i915->drm, "Not enough engines in class: %d", class);
+		GT_DBG(gt, "Not enough engines in class: %d", class);
 		return 0;
 	}
 
 	rq = multi_lrc_nop_request(parent);
 	if (IS_ERR(rq)) {
 		ret = PTR_ERR(rq);
-		drm_err(&gt->i915->drm, "Failed creating requests: %d", ret);
+		GT_ERR(gt, "Failed creating requests: %d", ret);
 		goto out;
 	}
 
 	ret = intel_selftest_wait_for_rq(rq);
 	if (ret)
-		drm_err(&gt->i915->drm, "Failed waiting on request: %d", ret);
+		GT_ERR(gt, "Failed waiting on request: %d", ret);
 
 	i915_request_put(rq);
 
 	if (ret >= 0) {
 		ret = intel_gt_wait_for_idle(gt, HZ * 5);
 		if (ret < 0)
-			drm_err(&gt->i915->drm, "GT failed to idle: %d\n", ret);
+			GT_ERR(gt, "GT failed to idle: %d\n", ret);
 	}
 
 out:
-- 
2.37.3

