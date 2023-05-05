Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C156F8663
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 18:08:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A659610E637;
	Fri,  5 May 2023 16:08:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BB8D10E637;
 Fri,  5 May 2023 16:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683302909; x=1714838909;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+SYQZd1pIidpOj2gNyOFfvZSXBXIspdl7UmrpS2UbBY=;
 b=kyQQtW3ulTSFDrn3aNQfAMOG0JqrP0b/g3LDiAccqzd001DKhw6mQfaC
 HGh14zwg0KtMCe7qWIkTiKYr4TkoXB7GO1qR8NFzHMhtHZ9UCyqEShcAq
 7gXGUwlcCikHTDzeiaemsqqf/nYLbvKJKxrQuT0kegPla9rluhSGxJHvY
 06wnqH7FmXdQNgeAqjyQzZw+8u0xK8l+Ls7V6Opt7D4CbBeCAhxhtrCHP
 Ik6HxBxuQME3PbT+xgDtwm23TK7Zbq0IIViasNJ1J3cBNMc9eQSXOSHsB
 4VDk1grg3Dd6y1agMTP7NOOUEUulM1pHC7rEupUwb1G0GMLS5HIb4WOS7 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="349276968"
X-IronPort-AV: E=Sophos;i="5.99,252,1677571200"; d="scan'208";a="349276968"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 09:04:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="871911267"
X-IronPort-AV: E=Sophos;i="5.99,252,1677571200"; d="scan'208";a="871911267"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 09:04:28 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/6] DO NOT REVIEW: drm/i915: HuC loading and authentication
 for MTL
Date: Fri,  5 May 2023 09:04:10 -0700
Message-Id: <20230505160415.889525-2-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505160415.889525-1-daniele.ceraolospurio@intel.com>
References: <20230505160415.889525-1-daniele.ceraolospurio@intel.com>
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a of the HuC support for MTL series [1]. It's been included
because one of the new patches in this series depend on it, but it
should be reviewd separately in its own thread.

[1] https://patchwork.freedesktop.org/series/117080/
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_ggtt.c          |   3 +
 .../drm/i915/gt/uc/intel_gsc_meu_headers.h    |  74 ++++++
 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c     |  31 ++-
 .../i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c |   2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.c        |   2 +-
 drivers/gpu/drm/i915/gt/uc/intel_huc.c        | 182 ++++++++++----
 drivers/gpu/drm/i915/gt/uc/intel_huc.h        |  26 +-
 drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c     | 233 +++++++++++++++++-
 drivers/gpu/drm/i915/gt/uc/intel_huc_fw.h     |   6 +-
 drivers/gpu/drm/i915/gt/uc/intel_huc_print.h  |  21 ++
 drivers/gpu/drm/i915/gt/uc/intel_uc.c         |  10 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.h         |   2 +
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      | 120 +++++----
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h      |   9 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h  |   6 -
 drivers/gpu/drm/i915/i915_getparam.c          |   6 +-
 drivers/gpu/drm/i915/i915_reg.h               |   3 +
 .../drm/i915/pxp/intel_pxp_cmd_interface_43.h |  14 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_huc.c      |   2 +-
 include/uapi/drm/i915_drm.h                   |   3 +-
 20 files changed, 621 insertions(+), 134 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_meu_headers.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_huc_print.h

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
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_meu_headers.h b/drivers/gpu/drm/i915/gt/uc/intel_gsc_meu_headers.h
new file mode 100644
index 000000000000..d55a66202576
--- /dev/null
+++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_meu_headers.h
@@ -0,0 +1,74 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _INTEL_GSC_MEU_H_
+#define _INTEL_GSC_MEU_H_
+
+#include <linux/types.h>
+
+/* Code partition directory (CPD) structures */
+struct intel_gsc_cpd_header_v2 {
+	u32 header_marker;
+#define INTEL_GSC_CPD_HEADER_MARKER 0x44504324
+
+	u32 num_of_entries;
+	u8 header_version;
+	u8 entry_version;
+	u8 header_length; /* in bytes */
+	u8 flags;
+	u32 partition_name;
+	u32 crc32;
+} __packed;
+
+struct intel_gsc_cpd_entry {
+	u8 name[12];
+
+	/*
+	 * Bits 0-24: offset from the beginning of the code partition
+	 * Bit 25: huffman compressed
+	 * Bits 26-31: reserved
+	 */
+	u32 offset;
+#define INTEL_GSC_CPD_ENTRY_OFFSET_MASK GENMASK(24, 0)
+#define INTEL_GSC_CPD_ENTRY_HUFFMAN_COMP BIT(25)
+
+	/*
+	 * Module/Item length, in bytes. For Huffman-compressed modules, this
+	 * refers to the uncompressed size. For software-compressed modules,
+	 * this refers to the compressed size.
+	 */
+	u32 length;
+
+	u8 reserved[4];
+} __packed;
+
+struct intel_gsc_meu_version {
+	u16 major;
+	u16 minor;
+	u16 hotfix;
+	u16 build;
+} __packed;
+
+struct intel_gsc_manifest_header {
+	u32 header_type; /* 0x4 for manifest type */
+	u32 header_length; /* in dwords */
+	u32 header_version;
+	u32 flags;
+	u32 vendor;
+	u32 date;
+	u32 size; /* In dwords, size of entire manifest (header + extensions) */
+	u32 header_id;
+	u32 internal_data;
+	struct intel_gsc_meu_version fw_version;
+	u32 security_version;
+	struct intel_gsc_meu_version meu_kit_version;
+	u32 meu_manifest_version;
+	u8 general_data[4];
+	u8 reserved3[56];
+	u32 modulus_size; /* in dwords */
+	u32 exponent_size; /* in dwords */
+} __packed;
+
+#endif
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
index fb0984f875f9..bbf21b93fc8d 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
@@ -29,13 +29,29 @@ static void gsc_work(struct work_struct *work)
 
 	if (actions & GSC_ACTION_FW_LOAD) {
 		ret = intel_gsc_uc_fw_upload(gsc);
-		if (ret == -EEXIST) /* skip proxy if not a new load */
-			actions &= ~GSC_ACTION_FW_LOAD;
-		else if (ret)
+		if (!ret)
+			/* setup proxy on a new load */
+			actions |= GSC_ACTION_SW_PROXY;
+		else if (ret != -EEXIST)
 			goto out_put;
+
+		/*
+		 * The HuC auth can be done both before or after the proxy init;
+		 * if done after, a proxy request will be issued and must be
+		 * serviced before the authentication can complete.
+		 * Since this worker also handles proxy requests, we can't
+		 * perform an action that requires the proxy from within it and
+		 * then stall waiting for it, because we'd be blocking the
+		 * service path. Therefore, it is easier for us to load HuC
+		 * first and do proxy later. The GSC will ack the HuC auth and
+		 * then send the HuC proxy request as part of the proxy init
+		 * flow.
+		 */
+		if (intel_uc_uses_huc(&gt->uc))
+			intel_huc_auth(&gt->uc.huc, INTEL_HUC_AUTH_BY_GSC);
 	}
 
-	if (actions & (GSC_ACTION_FW_LOAD | GSC_ACTION_SW_PROXY)) {
+	if (actions & GSC_ACTION_SW_PROXY) {
 		if (!intel_gsc_uc_fw_init_done(gsc)) {
 			gt_err(gt, "Proxy request received with GSC not loaded!\n");
 			goto out_put;
@@ -90,7 +106,12 @@ void intel_gsc_uc_init_early(struct intel_gsc_uc *gsc)
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
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c
index ea0da06e2f39..edcfa990239d 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c
@@ -98,7 +98,7 @@ void intel_gsc_uc_heci_cmd_emit_mtl_header(struct intel_gsc_mtl_header *header,
 					   u64 host_session_id)
 {
 	host_session_id &= ~HOST_SESSION_MASK;
-	if (heci_client_id == HECI_MEADDRESS_PXP)
+	if (host_session_id && heci_client_id == HECI_MEADDRESS_PXP)
 		host_session_id |= HOST_SESSION_PXP_SINGLE;
 
 	header->validity_marker = GSC_HECI_VALIDITY_MARKER;
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
index aefdaa62da99..54411ac33f35 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
@@ -6,23 +6,15 @@
 #include <linux/types.h>
 
 #include "gt/intel_gt.h"
-#include "gt/intel_gt_print.h"
 #include "intel_guc_reg.h"
 #include "intel_huc.h"
+#include "intel_huc_print.h"
 #include "i915_drv.h"
+#include "i915_reg.h"
 
 #include <linux/device/bus.h>
 #include <linux/mei_aux.h>
 
-#define huc_printk(_huc, _level, _fmt, ...) \
-	gt_##_level(huc_to_gt(_huc), "HuC: " _fmt, ##__VA_ARGS__)
-#define huc_err(_huc, _fmt, ...)	huc_printk((_huc), err, _fmt, ##__VA_ARGS__)
-#define huc_warn(_huc, _fmt, ...)	huc_printk((_huc), warn, _fmt, ##__VA_ARGS__)
-#define huc_notice(_huc, _fmt, ...)	huc_printk((_huc), notice, _fmt, ##__VA_ARGS__)
-#define huc_info(_huc, _fmt, ...)	huc_printk((_huc), info, _fmt, ##__VA_ARGS__)
-#define huc_dbg(_huc, _fmt, ...)	huc_printk((_huc), dbg, _fmt, ##__VA_ARGS__)
-#define huc_probe_error(_huc, _fmt, ...) huc_printk((_huc), probe_error, _fmt, ##__VA_ARGS__)
-
 /**
  * DOC: HuC
  *
@@ -115,7 +107,7 @@ static enum hrtimer_restart huc_delayed_load_timer_callback(struct hrtimer *hrti
 {
 	struct intel_huc *huc = container_of(hrtimer, struct intel_huc, delayed_load.timer);
 
-	if (!intel_huc_is_authenticated(huc)) {
+	if (!intel_huc_is_authenticated(huc, INTEL_HUC_AUTH_BY_GSC)) {
 		if (huc->delayed_load.status == INTEL_HUC_WAITING_ON_GSC)
 			huc_notice(huc, "timed out waiting for MEI GSC\n");
 		else if (huc->delayed_load.status == INTEL_HUC_WAITING_ON_PXP)
@@ -133,7 +125,7 @@ static void huc_delayed_load_start(struct intel_huc *huc)
 {
 	ktime_t delay;
 
-	GEM_BUG_ON(intel_huc_is_authenticated(huc));
+	GEM_BUG_ON(intel_huc_is_authenticated(huc, INTEL_HUC_AUTH_BY_GSC));
 
 	/*
 	 * On resume we don't have to wait for MEI-GSC to be re-probed, but we
@@ -276,7 +268,7 @@ void intel_huc_init_early(struct intel_huc *huc)
 	struct drm_i915_private *i915 = huc_to_gt(huc)->i915;
 	struct intel_gt *gt = huc_to_gt(huc);
 
-	intel_uc_fw_init_early(&huc->fw, INTEL_UC_FW_TYPE_HUC);
+	intel_uc_fw_init_early(&huc->fw, INTEL_UC_FW_TYPE_HUC, true);
 
 	/*
 	 * we always init the fence as already completed, even if HuC is not
@@ -293,13 +285,23 @@ void intel_huc_init_early(struct intel_huc *huc)
 	}
 
 	if (GRAPHICS_VER(i915) >= 11) {
-		huc->status.reg = GEN11_HUC_KERNEL_LOAD_INFO;
-		huc->status.mask = HUC_LOAD_SUCCESSFUL;
-		huc->status.value = HUC_LOAD_SUCCESSFUL;
+		huc->status[INTEL_HUC_AUTH_BY_GUC].reg = GEN11_HUC_KERNEL_LOAD_INFO;
+		huc->status[INTEL_HUC_AUTH_BY_GUC].mask = HUC_LOAD_SUCCESSFUL;
+		huc->status[INTEL_HUC_AUTH_BY_GUC].value = HUC_LOAD_SUCCESSFUL;
 	} else {
-		huc->status.reg = HUC_STATUS2;
-		huc->status.mask = HUC_FW_VERIFIED;
-		huc->status.value = HUC_FW_VERIFIED;
+		huc->status[INTEL_HUC_AUTH_BY_GUC].reg = HUC_STATUS2;
+		huc->status[INTEL_HUC_AUTH_BY_GUC].mask = HUC_FW_VERIFIED;
+		huc->status[INTEL_HUC_AUTH_BY_GUC].value = HUC_FW_VERIFIED;
+	}
+
+	if (IS_DG2(i915)) {
+		huc->status[INTEL_HUC_AUTH_BY_GSC].reg = GEN11_HUC_KERNEL_LOAD_INFO;
+		huc->status[INTEL_HUC_AUTH_BY_GSC].mask = HUC_LOAD_SUCCESSFUL;
+		huc->status[INTEL_HUC_AUTH_BY_GSC].value = HUC_LOAD_SUCCESSFUL;
+	} else {
+		huc->status[INTEL_HUC_AUTH_BY_GSC].reg = HECI_FWSTS5(MTL_GSC_HECI1_BASE);
+		huc->status[INTEL_HUC_AUTH_BY_GSC].mask = HECI_FWSTS5_HUC_AUTH_DONE;
+		huc->status[INTEL_HUC_AUTH_BY_GSC].value = HECI_FWSTS5_HUC_AUTH_DONE;
 	}
 }
 
@@ -307,51 +309,72 @@ void intel_huc_init_early(struct intel_huc *huc)
 static int check_huc_loading_mode(struct intel_huc *huc)
 {
 	struct intel_gt *gt = huc_to_gt(huc);
-	bool fw_needs_gsc = intel_huc_is_loaded_by_gsc(huc);
-	bool hw_uses_gsc = false;
+	bool fw_is_meu = huc->fw.is_meu_binary;
 
 	/*
 	 * The fuse for HuC load via GSC is only valid on platforms that have
 	 * GuC deprivilege.
 	 */
 	if (HAS_GUC_DEPRIVILEGE(gt->i915))
-		hw_uses_gsc = intel_uncore_read(gt->uncore, GUC_SHIM_CONTROL2) &
-			      GSC_LOADS_HUC;
+		huc->loaded_via_gsc = intel_uncore_read(gt->uncore, GUC_SHIM_CONTROL2) &
+				      GSC_LOADS_HUC;
+
+	if (huc->loaded_via_gsc && !fw_is_meu) {
+		huc_err(huc, "HW requires a MEU blob, but we found a legacy one\n");
+		return -ENOEXEC;
+	}
 
-	if (fw_needs_gsc != hw_uses_gsc) {
-		huc_err(huc, "mismatch between FW (%s) and HW (%s) load modes\n",
-			HUC_LOAD_MODE_STRING(fw_needs_gsc), HUC_LOAD_MODE_STRING(hw_uses_gsc));
+	/*
+	 * Newer meu blobs contain the old FW structure inside. If we found
+	 * that, we can use it to load the legacy way.
+	 */
+	if (!huc->loaded_via_gsc && fw_is_meu && !huc->fw.dma_start_offset) {
+		huc_err(huc," HW in legacy mode, but we have an incompatible meu blob\n");
 		return -ENOEXEC;
 	}
 
-	/* make sure we can access the GSC via the mei driver if we need it */
+	/* make sure we can access the GSC if we need it */
 	if (!(IS_ENABLED(CONFIG_INTEL_MEI_PXP) && IS_ENABLED(CONFIG_INTEL_MEI_GSC)) &&
-	    fw_needs_gsc) {
+	    !HAS_ENGINE(gt, GSC0) && huc->loaded_via_gsc) {
 		huc_info(huc, "can't load due to missing MEI modules\n");
 		return -EIO;
 	}
 
-	huc_dbg(huc, "loaded by GSC = %s\n", str_yes_no(fw_needs_gsc));
+	huc_dbg(huc, "loaded by GSC = %s\n", str_yes_no(huc->loaded_via_gsc));
 
 	return 0;
 }
 
 int intel_huc_init(struct intel_huc *huc)
 {
+	struct intel_gt *gt = huc_to_gt(huc);
 	int err;
 
 	err = check_huc_loading_mode(huc);
 	if (err)
 		goto out;
 
+	if (HAS_ENGINE(gt, GSC0)) {
+		struct i915_vma *vma = intel_guc_allocate_vma(&gt->uc.guc, SZ_8K);
+		if (IS_ERR(vma)) {
+			huc_info(huc, "Failed to allocate heci pkt\n");
+			goto out;
+		}
+
+		huc->heci_pkt = vma;
+	}
+
 	err = intel_uc_fw_init(&huc->fw);
 	if (err)
-		goto out;
+		goto out_pkt;
 
 	intel_uc_fw_change_status(&huc->fw, INTEL_UC_FIRMWARE_LOADABLE);
 
 	return 0;
 
+out_pkt:
+	if (huc->heci_pkt)
+		i915_vma_unpin_and_release(&huc->heci_pkt, 0);
 out:
 	intel_uc_fw_change_status(&huc->fw, INTEL_UC_FIRMWARE_INIT_FAIL);
 	huc_info(huc, "initialization failed %pe\n", ERR_PTR(err));
@@ -366,6 +389,9 @@ void intel_huc_fini(struct intel_huc *huc)
 	 */
 	delayed_huc_load_fini(huc);
 
+	if (huc->heci_pkt)
+		i915_vma_unpin_and_release(&huc->heci_pkt, 0);
+
 	if (intel_uc_fw_is_loadable(&huc->fw))
 		intel_uc_fw_fini(&huc->fw);
 }
@@ -383,34 +409,46 @@ void intel_huc_suspend(struct intel_huc *huc)
 	delayed_huc_load_complete(huc);
 }
 
-int intel_huc_wait_for_auth_complete(struct intel_huc *huc)
+static const char *auth_mode_string(struct intel_huc *huc,
+				    enum intel_huc_authentication_type type)
+{
+	bool partial = !huc->loaded_via_gsc && huc->fw.is_meu_binary &&
+		       type == INTEL_HUC_AUTH_BY_GUC;
+
+	return partial ? "clear media" : "all workloads";
+}
+
+int intel_huc_wait_for_auth_complete(struct intel_huc *huc,
+				     enum intel_huc_authentication_type type)
 {
 	struct intel_gt *gt = huc_to_gt(huc);
 	int ret;
 
 	ret = __intel_wait_for_register(gt->uncore,
-					huc->status.reg,
-					huc->status.mask,
-					huc->status.value,
+					huc->status[type].reg,
+					huc->status[type].mask,
+					huc->status[type].value,
 					2, 50, NULL);
 
 	/* mark the load process as complete even if the wait failed */
 	delayed_huc_load_complete(huc);
 
 	if (ret) {
-		huc_err(huc, "firmware not verified %pe\n", ERR_PTR(ret));
+		huc_err(huc, "firmware not verified for %s: %pe\n",
+			auth_mode_string(huc, type), ERR_PTR(ret));
 		intel_uc_fw_change_status(&huc->fw, INTEL_UC_FIRMWARE_LOAD_FAIL);
 		return ret;
 	}
 
 	intel_uc_fw_change_status(&huc->fw, INTEL_UC_FIRMWARE_RUNNING);
-	huc_info(huc, "authenticated!\n");
+	huc_info(huc, "authenticated for %s!\n", auth_mode_string(huc, type));
 	return 0;
 }
 
 /**
  * intel_huc_auth() - Authenticate HuC uCode
  * @huc: intel_huc structure
+ * @type: authentication type (via GuC or via GSC)
  *
  * Called after HuC and GuC firmware loading during intel_uc_init_hw().
  *
@@ -418,7 +456,7 @@ int intel_huc_wait_for_auth_complete(struct intel_huc *huc)
  * passing the offset of the RSA signature to intel_guc_auth_huc(). It then
  * waits for up to 50ms for firmware verification ACK.
  */
-int intel_huc_auth(struct intel_huc *huc)
+int intel_huc_auth(struct intel_huc *huc, enum intel_huc_authentication_type type)
 {
 	struct intel_gt *gt = huc_to_gt(huc);
 	struct intel_guc *guc = &gt->uc.guc;
@@ -427,44 +465,67 @@ int intel_huc_auth(struct intel_huc *huc)
 	if (!intel_uc_fw_is_loaded(&huc->fw))
 		return -ENOEXEC;
 
-	/* GSC will do the auth */
+	/* GSC will do the auth with the load */
 	if (intel_huc_is_loaded_by_gsc(huc))
 		return -ENODEV;
 
+	if (intel_huc_is_authenticated(huc, type))
+		return -EEXIST;
+
 	ret = i915_inject_probe_error(gt->i915, -ENXIO);
 	if (ret)
 		goto fail;
 
-	GEM_BUG_ON(intel_uc_fw_is_running(&huc->fw));
-
-	ret = intel_guc_auth_huc(guc, intel_guc_ggtt_offset(guc, huc->fw.rsa_data));
-	if (ret) {
-		huc_err(huc, "authentication by GuC failed %pe\n", ERR_PTR(ret));
-		goto fail;
+	switch(type) {
+	case INTEL_HUC_AUTH_BY_GUC:
+		ret = intel_guc_auth_huc(guc, intel_guc_ggtt_offset(guc, huc->fw.rsa_data));
+		break;
+	case INTEL_HUC_AUTH_BY_GSC:
+		ret = intel_huc_fw_auth_via_gsccs(huc);
+		break;
+	default:
+		MISSING_CASE(type);
+		ret = -EINVAL;
 	}
+	if (ret)
+		goto fail;
 
 	/* Check authentication status, it should be done by now */
-	ret = intel_huc_wait_for_auth_complete(huc);
+	ret = intel_huc_wait_for_auth_complete(huc, type);
 	if (ret)
 		goto fail;
 
 	return 0;
 
 fail:
-	huc_probe_error(huc, "authentication failed %pe\n", ERR_PTR(ret));
+	huc_probe_error(huc, "%s authentication failed %pe\n",
+			auth_mode_string(huc, type), ERR_PTR(ret));
 	return ret;
 }
 
-bool intel_huc_is_authenticated(struct intel_huc *huc)
+bool intel_huc_is_authenticated(struct intel_huc *huc,
+				enum intel_huc_authentication_type type)
 {
 	struct intel_gt *gt = huc_to_gt(huc);
 	intel_wakeref_t wakeref;
 	u32 status = 0;
 
 	with_intel_runtime_pm(gt->uncore->rpm, wakeref)
-		status = intel_uncore_read(gt->uncore, huc->status.reg);
+		status = intel_uncore_read(gt->uncore, huc->status[type].reg);
+
+	return (status & huc->status[type].mask) == huc->status[type].value;
+}
 
-	return (status & huc->status.mask) == huc->status.value;
+static bool huc_is_fully_authenticated(struct intel_huc *huc)
+{
+	struct intel_uc_fw *huc_fw = &huc->fw;
+
+	if (!huc_fw->is_meu_binary)
+		return intel_huc_is_authenticated(huc, INTEL_HUC_AUTH_BY_GUC);
+	else if (intel_huc_is_loaded_by_gsc(huc) || HAS_ENGINE(huc_to_gt(huc), GSC0))
+		return intel_huc_is_authenticated(huc, INTEL_HUC_AUTH_BY_GSC);
+	else
+		return false;
 }
 
 /**
@@ -479,7 +540,9 @@ bool intel_huc_is_authenticated(struct intel_huc *huc)
  */
 int intel_huc_check_status(struct intel_huc *huc)
 {
-	switch (__intel_uc_fw_status(&huc->fw)) {
+	struct intel_uc_fw *huc_fw = &huc->fw;
+
+	switch (__intel_uc_fw_status(huc_fw)) {
 	case INTEL_UC_FIRMWARE_NOT_SUPPORTED:
 		return -ENODEV;
 	case INTEL_UC_FIRMWARE_DISABLED:
@@ -496,7 +559,17 @@ int intel_huc_check_status(struct intel_huc *huc)
 		break;
 	}
 
-	return intel_huc_is_authenticated(huc);
+	/*
+	 * meu binaries loaded by GuC are first partially authenticated by GuC
+	 * and then fully authenticated by GSC
+	 */
+	if (huc_is_fully_authenticated(huc))
+		return 1; /* full auth */
+	else if (huc_fw->is_meu_binary && !huc->loaded_via_gsc &&
+		 intel_huc_is_authenticated(huc, INTEL_HUC_AUTH_BY_GUC))
+		return 2; /* clear media only */
+	else
+		return 0;
 }
 
 static bool huc_has_delayed_load(struct intel_huc *huc)
@@ -510,7 +583,10 @@ void intel_huc_update_auth_status(struct intel_huc *huc)
 	if (!intel_uc_fw_is_loadable(&huc->fw))
 		return;
 
-	if (intel_huc_is_authenticated(huc))
+	if (!huc->fw.is_meu_binary)
+		return;
+
+	if (huc_is_fully_authenticated(huc))
 		intel_uc_fw_change_status(&huc->fw,
 					  INTEL_UC_FIRMWARE_RUNNING);
 	else if (huc_has_delayed_load(huc))
@@ -543,5 +619,5 @@ void intel_huc_load_status(struct intel_huc *huc, struct drm_printer *p)
 
 	with_intel_runtime_pm(gt->uncore->rpm, wakeref)
 		drm_printf(p, "HuC status: 0x%08x\n",
-			   intel_uncore_read(gt->uncore, huc->status.reg));
+			   intel_uncore_read(gt->uncore, huc->status[INTEL_HUC_AUTH_BY_GUC].reg));
 }
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.h b/drivers/gpu/drm/i915/gt/uc/intel_huc.h
index db555b3c1f56..319d38c4ab51 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_huc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.h
@@ -15,6 +15,7 @@
 #include <linux/hrtimer.h>
 
 struct bus_type;
+struct i915_vma;
 
 enum intel_huc_delayed_load_status {
 	INTEL_HUC_WAITING_ON_GSC = 0,
@@ -22,6 +23,12 @@ enum intel_huc_delayed_load_status {
 	INTEL_HUC_DELAYED_LOAD_ERROR,
 };
 
+enum intel_huc_authentication_type {
+	INTEL_HUC_AUTH_BY_GUC = 0,
+	INTEL_HUC_AUTH_BY_GSC,
+	INTEL_HUC_AUTH_MAX_MODES
+};
+
 struct intel_huc {
 	/* Generic uC firmware management */
 	struct intel_uc_fw fw;
@@ -31,7 +38,7 @@ struct intel_huc {
 		i915_reg_t reg;
 		u32 mask;
 		u32 value;
-	} status;
+	} status[INTEL_HUC_AUTH_MAX_MODES];
 
 	struct {
 		struct i915_sw_fence fence;
@@ -39,6 +46,11 @@ struct intel_huc {
 		struct notifier_block nb;
 		enum intel_huc_delayed_load_status status;
 	} delayed_load;
+
+	/* for load via GSCCS */
+	struct i915_vma *heci_pkt;
+
+	bool loaded_via_gsc;
 };
 
 int intel_huc_sanitize(struct intel_huc *huc);
@@ -46,11 +58,13 @@ void intel_huc_init_early(struct intel_huc *huc);
 int intel_huc_init(struct intel_huc *huc);
 void intel_huc_fini(struct intel_huc *huc);
 void intel_huc_suspend(struct intel_huc *huc);
-int intel_huc_auth(struct intel_huc *huc);
-int intel_huc_wait_for_auth_complete(struct intel_huc *huc);
+int intel_huc_auth(struct intel_huc *huc, enum intel_huc_authentication_type type);
+int intel_huc_wait_for_auth_complete(struct intel_huc *huc,
+				     enum intel_huc_authentication_type type);
+bool intel_huc_is_authenticated(struct intel_huc *huc,
+				enum intel_huc_authentication_type type);
 int intel_huc_check_status(struct intel_huc *huc);
 void intel_huc_update_auth_status(struct intel_huc *huc);
-bool intel_huc_is_authenticated(struct intel_huc *huc);
 
 void intel_huc_register_gsc_notifier(struct intel_huc *huc, struct bus_type *bus);
 void intel_huc_unregister_gsc_notifier(struct intel_huc *huc, struct bus_type *bus);
@@ -73,13 +87,13 @@ static inline bool intel_huc_is_used(struct intel_huc *huc)
 
 static inline bool intel_huc_is_loaded_by_gsc(const struct intel_huc *huc)
 {
-	return huc->fw.loaded_via_gsc;
+	return huc->loaded_via_gsc;
 }
 
 static inline bool intel_huc_wait_required(struct intel_huc *huc)
 {
 	return intel_huc_is_used(huc) && intel_huc_is_loaded_by_gsc(huc) &&
-	       !intel_huc_is_authenticated(huc);
+	       !intel_huc_is_authenticated(huc, INTEL_HUC_AUTH_BY_GSC);
 }
 
 void intel_huc_load_status(struct intel_huc *huc, struct drm_printer *p);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
index 534b0aa43316..0a0bd5504057 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
@@ -5,10 +5,239 @@
 
 #include "gt/intel_gsc.h"
 #include "gt/intel_gt.h"
+#include "intel_gsc_meu_headers.h"
+#include "intel_gsc_uc_heci_cmd_submit.h"
 #include "intel_huc.h"
 #include "intel_huc_fw.h"
+#include "intel_huc_print.h"
 #include "i915_drv.h"
 #include "pxp/intel_pxp_huc.h"
+#include "pxp/intel_pxp_cmd_interface_43.h"
+
+struct mtl_huc_auth_msg_in {
+	struct intel_gsc_mtl_header header;
+	struct pxp43_new_huc_auth_in huc_in;
+} __packed;
+
+struct mtl_huc_auth_msg_out {
+	struct intel_gsc_mtl_header header;
+	struct pxp43_huc_auth_out huc_out;
+} __packed;
+
+int intel_huc_fw_auth_via_gsccs(struct intel_huc *huc)
+{
+	struct intel_gt *gt = huc_to_gt(huc);
+	struct drm_i915_private *i915 = gt->i915;
+	struct drm_i915_gem_object *obj;
+	struct mtl_huc_auth_msg_in *msg_in;
+	struct mtl_huc_auth_msg_out *msg_out;
+	void *pkt_vaddr;
+	u64 pkt_offset;
+	int retry = 5;
+	int err = 0;
+
+	if (!huc->heci_pkt)
+		return -ENODEV;
+
+	obj = huc->heci_pkt->obj;
+	pkt_offset = i915_ggtt_offset(huc->heci_pkt);
+
+	pkt_vaddr = i915_gem_object_pin_map_unlocked(obj,
+						     i915_coherent_map_type(i915, obj, true));
+	if (IS_ERR(pkt_vaddr))
+		return PTR_ERR(pkt_vaddr);
+
+	msg_in = pkt_vaddr;
+	msg_out = pkt_vaddr + SZ_4K;
+
+	intel_gsc_uc_heci_cmd_emit_mtl_header(&msg_in->header,
+					      HECI_MEADDRESS_PXP,
+					      sizeof(*msg_in), 0);
+
+	msg_in->huc_in.header.api_version = PXP_APIVER(4, 3);
+	msg_in->huc_in.header.command_id = PXP43_CMDID_NEW_HUC_AUTH;
+	msg_in->huc_in.header.status = 0;
+	msg_in->huc_in.header.buffer_len = sizeof(msg_in->huc_in) -
+					   sizeof(msg_in->huc_in.header);
+	msg_in->huc_in.huc_base_address = huc->fw.dummy.start;
+	msg_in->huc_in.huc_size = huc->fw.obj->base.size;
+
+	do {
+		err = intel_gsc_uc_heci_cmd_submit_packet(&gt->uc.gsc,
+							  pkt_offset, sizeof(*msg_in),
+							  pkt_offset + SZ_4K, SZ_4K);
+		if (err) {
+			huc_err(huc, "failed to submit GSC request to auth: %d\n", err);
+			goto out_unpin;
+		}
+
+		if (msg_out->header.flags & GSC_OUTFLAG_MSG_PENDING) {
+			msg_in->header.gsc_message_handle = msg_out->header.gsc_message_handle;
+			err = -EBUSY;
+			msleep(50);
+		}
+	} while (--retry && err == -EBUSY);
+
+	if (err)
+		goto out_unpin;
+
+	if (msg_out->header.message_size != sizeof(*msg_out)) {
+		huc_err(huc, "invalid GSC reply length %u [expected %zu]\n",
+			msg_out->header.message_size, sizeof(*msg_out));
+		err = -EPROTO;
+		goto out_unpin;
+	}
+
+	/*
+	 * The GSC will return PXP_STATUS_OP_NOT_PERMITTED if the HuC is already
+	 * loaded. If the same error is ever returned with HuC not loaded we'll
+	 * still catch it when we check the authentication bit later.
+	 */
+	if (msg_out->huc_out.header.status != PXP_STATUS_SUCCESS &&
+	    msg_out->huc_out.header.status != PXP_STATUS_OP_NOT_PERMITTED) {
+		huc_err(huc, "auth failed with GSC error = 0x%x\n",
+			msg_out->huc_out.header.status);
+		err = -EIO;
+		goto out_unpin;
+	}
+
+out_unpin:
+	i915_gem_object_unpin_map(obj);
+	return err;
+}
+
+static void get_version_from_meu_manifest(struct intel_uc_fw_ver *ver, const void *data)
+{
+	const struct intel_gsc_manifest_header *manifest = data;
+
+	ver->major = manifest->fw_version.major;
+	ver->minor = manifest->fw_version.minor;
+	ver->patch = manifest->fw_version.hotfix;
+}
+
+static bool css_valid(const void *data, size_t size)
+{
+	const struct uc_css_header *css = data;
+
+	if (unlikely(size < sizeof(struct uc_css_header)))
+		return false;
+
+	if (css->module_type != 0x6)
+		return false;
+
+	if (css->module_vendor != PCI_VENDOR_ID_INTEL)
+		return false;
+
+	return true;
+}
+
+static inline u32 entry_offset(const struct intel_gsc_cpd_entry *entry)
+{
+	return entry->offset & INTEL_GSC_CPD_ENTRY_OFFSET_MASK;
+}
+
+int intel_huc_fw_get_binary_info(struct intel_uc_fw *huc_fw, const void *data, size_t size)
+{
+	struct intel_huc *huc = container_of(huc_fw, struct intel_huc, fw);
+	const struct intel_gsc_cpd_header_v2 *header = data;
+	const struct intel_gsc_cpd_entry *entry;
+	size_t min_size = sizeof(*header);
+	int i;
+
+	if (!huc_fw->is_meu_binary) {
+		huc_err(huc, "Invalid FW type MEU parsing!\n");
+		return -EINVAL;
+	}
+
+	if (size < sizeof(*header)) {
+		huc_err(huc, "MEU FW too small! %zu < %zu\n", size, min_size);
+		return -ENODATA;
+	}
+
+	/*
+	 * The meu HuC binary starts with a directory header, followed by a
+	 * series of entries. Each entry is identified by a name and points to
+	 * a specific section of the binary containing the relevant data.
+	 * The entries we're interested in are
+	 * - "HUCP.man": points to the GSC manifest header for the HuC, which
+	 *               contains the version info.
+	 * - "huc_fw": points to the legacy-style binary that can be used for
+	 *             load via the DMA. This entry only contains a valid CSS
+	 *             on binaries for platforms that support 2-step HuC load
+	 *             via dma and auth via GSC (like MTL).
+	 *
+	 * --------------------------------------------------
+	 * [  intel_gsc_cpd_header_v2                       ]
+	 * --------------------------------------------------
+	 * [  intel_gsc_cpd_entry[]                         ]
+	 * [      entry1                                    ]
+	 * [      ...                                       ]
+	 * [      entryX                                    ]
+	 * [          "HUCP.man"                            ]
+	 * [           ...                                  ]
+	 * [           offset  >----------------------------]------o
+	 * [      ...                                       ]      |
+	 * [      entryY                                    ]      |
+	 * [          "huc_fw"                              ]      |
+	 * [           ...                                  ]      |
+	 * [           offset  >----------------------------]----------o
+	 * --------------------------------------------------      |   |
+	 *                                                         |   |
+	 * --------------------------------------------------      |   |
+	 * [ intel_gsc_manifest_header                      ]<-----o   |
+	 * [  ...                                           ]          |
+	 * [  intel_gsc_meu_version fw_version              ]          |
+	 * [  ...                                           ]          |
+	 * --------------------------------------------------          |
+	 *                                                             |
+	 * --------------------------------------------------          |
+	 * [ data[]                                         ]<---------o
+	 * [  ...                                           ]
+	 * [  ...                                           ]
+	 * --------------------------------------------------
+	 */
+
+	if (header->header_marker != INTEL_GSC_CPD_HEADER_MARKER) {
+		huc_err(huc, "invalid marker for meu CPD header: 0x%08x!\n",
+			header->header_marker);
+		return -EINVAL;
+	}
+
+	/* we only have binaries with header v2 and entry v1 for now */
+	if (header->header_version != 2 || header->entry_version != 1) {
+		huc_err(huc, "invalid meu CPD header/entry version %u:%u!\n",
+			header->header_version, header->entry_version);
+		return -EINVAL;
+	}
+
+	if (header->header_length < sizeof(struct intel_gsc_cpd_header_v2)) {
+		huc_err(huc, "invalid meu CPD header length %u!\n",
+			header->header_length);
+		return -EINVAL;
+	}
+
+	min_size = header->header_length + sizeof(*entry) * header->num_of_entries;
+	if (size < min_size) {
+		huc_err(huc, "MEU FW too small! %zu < %zu\n", size, min_size);
+		return -ENODATA;
+	}
+
+	entry = data + header->header_length;
+
+	for (i = 0; i < header->num_of_entries; i++, entry++) {
+		if (strcmp(entry->name, "HUCP.man") == 0)
+			get_version_from_meu_manifest(&huc_fw->file_selected.ver,
+						      data + entry_offset(entry));
+
+		if (strcmp(entry->name, "huc_fw") == 0) {
+			u32 offset = entry_offset(entry);
+			if (offset < size && css_valid(data + offset, size - offset))
+				huc_fw->dma_start_offset = offset;
+		}
+	}
+
+	return 0;
+}
 
 int intel_huc_fw_load_and_auth_via_gsc(struct intel_huc *huc)
 {
@@ -25,7 +254,7 @@ int intel_huc_fw_load_and_auth_via_gsc(struct intel_huc *huc)
 	 * component gets re-bound and this function called again. If so, just
 	 * mark the HuC as loaded.
 	 */
-	if (intel_huc_is_authenticated(huc)) {
+	if (intel_huc_is_authenticated(huc, INTEL_HUC_AUTH_BY_GSC)) {
 		intel_uc_fw_change_status(&huc->fw, INTEL_UC_FIRMWARE_RUNNING);
 		return 0;
 	}
@@ -38,7 +267,7 @@ int intel_huc_fw_load_and_auth_via_gsc(struct intel_huc *huc)
 
 	intel_uc_fw_change_status(&huc->fw, INTEL_UC_FIRMWARE_TRANSFERRED);
 
-	return intel_huc_wait_for_auth_complete(huc);
+	return intel_huc_wait_for_auth_complete(huc, INTEL_HUC_AUTH_BY_GSC);
 }
 
 /**
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.h b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.h
index db42e238b45f..307ab45e6b09 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.h
@@ -7,8 +7,12 @@
 #define _INTEL_HUC_FW_H_
 
 struct intel_huc;
+struct intel_uc_fw;
+
+#include <linux/types.h>
 
 int intel_huc_fw_load_and_auth_via_gsc(struct intel_huc *huc);
+int intel_huc_fw_auth_via_gsccs(struct intel_huc *huc);
 int intel_huc_fw_upload(struct intel_huc *huc);
-
+int intel_huc_fw_get_binary_info(struct intel_uc_fw *huc_fw, const void *data, size_t size);
 #endif
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc_print.h b/drivers/gpu/drm/i915/gt/uc/intel_huc_print.h
new file mode 100644
index 000000000000..915d310ee1df
--- /dev/null
+++ b/drivers/gpu/drm/i915/gt/uc/intel_huc_print.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef __INTEL_HUC_PRINT__
+#define __INTEL_HUC_PRINT__
+
+#include "gt/intel_gt.h"
+#include "gt/intel_gt_print.h"
+
+#define huc_printk(_huc, _level, _fmt, ...) \
+	gt_##_level(huc_to_gt(_huc), "HuC: " _fmt, ##__VA_ARGS__)
+#define huc_err(_huc, _fmt, ...)	huc_printk((_huc), err, _fmt, ##__VA_ARGS__)
+#define huc_warn(_huc, _fmt, ...)	huc_printk((_huc), warn, _fmt, ##__VA_ARGS__)
+#define huc_notice(_huc, _fmt, ...)	huc_printk((_huc), notice, _fmt, ##__VA_ARGS__)
+#define huc_info(_huc, _fmt, ...)	huc_printk((_huc), info, _fmt, ##__VA_ARGS__)
+#define huc_dbg(_huc, _fmt, ...)	huc_printk((_huc), dbg, _fmt, ##__VA_ARGS__)
+#define huc_probe_error(_huc, _fmt, ...) huc_printk((_huc), probe_error, _fmt, ##__VA_ARGS__)
+
+#endif /* __INTEL_HUC_PRINT__ */
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
index 996168312340..05ad56274007 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
@@ -535,7 +535,7 @@ static int __uc_init_hw(struct intel_uc *uc)
 	if (intel_huc_is_loaded_by_gsc(huc))
 		intel_huc_update_auth_status(huc);
 	else
-		intel_huc_auth(huc);
+		intel_huc_auth(huc, INTEL_HUC_AUTH_BY_GUC);
 
 	if (intel_uc_uses_guc_submission(uc)) {
 		ret = intel_guc_submission_enable(guc);
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
index 6b71b9febd74..796f54a62eef 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
@@ -102,6 +102,7 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
 	fw_def(SKYLAKE,      0, guc_mmp(skl,  70, 1, 1))
 
 #define INTEL_HUC_FIRMWARE_DEFS(fw_def, huc_raw, huc_mmp, huc_gsc) \
+	fw_def(METEORLAKE,   0, huc_gsc(mtl)) \
 	fw_def(DG2,          0, huc_gsc(dg2)) \
 	fw_def(ALDERLAKE_P,  0, huc_raw(tgl)) \
 	fw_def(ALDERLAKE_P,  0, huc_mmp(tgl,  7, 9, 3)) \
@@ -180,7 +181,7 @@ struct __packed uc_fw_blob {
 	u8 major;
 	u8 minor;
 	u8 patch;
-	bool loaded_via_gsc;
+	bool is_meu_binary;
 };
 
 #define UC_FW_BLOB_BASE(major_, minor_, patch_, path_) \
@@ -189,9 +190,9 @@ struct __packed uc_fw_blob {
 	.patch = patch_, \
 	.path = path_,
 
-#define UC_FW_BLOB_NEW(major_, minor_, patch_, gsc_, path_) \
+#define UC_FW_BLOB_NEW(major_, minor_, patch_, meu_, path_) \
 	{ UC_FW_BLOB_BASE(major_, minor_, patch_, path_) \
-	  .legacy = false, .loaded_via_gsc = gsc_ }
+	  .legacy = false, .is_meu_binary = meu_ }
 
 #define UC_FW_BLOB_OLD(major_, minor_, patch_, path_) \
 	{ UC_FW_BLOB_BASE(major_, minor_, patch_, path_) \
@@ -296,7 +297,7 @@ __uc_fw_auto_select(struct drm_i915_private *i915, struct intel_uc_fw *uc_fw)
 		uc_fw->file_wanted.path = blob->path;
 		uc_fw->file_wanted.ver.major = blob->major;
 		uc_fw->file_wanted.ver.minor = blob->minor;
-		uc_fw->loaded_via_gsc = blob->loaded_via_gsc;
+		uc_fw->is_meu_binary = blob->is_meu_binary;
 		found = true;
 		break;
 	}
@@ -422,12 +423,14 @@ static void __uc_fw_user_override(struct drm_i915_private *i915, struct intel_uc
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
 
@@ -440,6 +443,7 @@ void intel_uc_fw_init_early(struct intel_uc_fw *uc_fw,
 	GEM_BUG_ON(uc_fw->file_selected.path);
 
 	uc_fw->type = type;
+	uc_fw->needs_ggtt_mapping = needs_ggtt_mapping;
 
 	if (HAS_GT_UC(i915)) {
 		__uc_fw_auto_select(i915, uc_fw);
@@ -489,33 +493,6 @@ static void __force_fw_fetch_failures(struct intel_uc_fw *uc_fw, int e)
 	}
 }
 
-static int check_gsc_manifest(struct intel_gt *gt,
-			      const struct firmware *fw,
-			      struct intel_uc_fw *uc_fw)
-{
-	u32 *dw = (u32 *)fw->data;
-	u32 version_hi, version_lo;
-	size_t min_size;
-
-	/* Check the size of the blob before examining buffer contents */
-	min_size = sizeof(u32) * (HUC_GSC_VERSION_LO_DW + 1);
-	if (unlikely(fw->size < min_size)) {
-		gt_warn(gt, "%s firmware %s: invalid size: %zu < %zu\n",
-			intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path,
-			fw->size, min_size);
-		return -ENODATA;
-	}
-
-	version_hi = dw[HUC_GSC_VERSION_HI_DW];
-	version_lo = dw[HUC_GSC_VERSION_LO_DW];
-
-	uc_fw->file_selected.ver.major = FIELD_GET(HUC_GSC_MAJOR_VER_HI_MASK, version_hi);
-	uc_fw->file_selected.ver.minor = FIELD_GET(HUC_GSC_MINOR_VER_HI_MASK, version_hi);
-	uc_fw->file_selected.ver.patch = FIELD_GET(HUC_GSC_PATCH_VER_LO_MASK, version_lo);
-
-	return 0;
-}
-
 static void uc_unpack_css_version(struct intel_uc_fw_ver *ver, u32 css_value)
 {
 	/* Get version numbers from the CSS header */
@@ -572,22 +549,22 @@ static void guc_read_css_info(struct intel_uc_fw *uc_fw, struct uc_css_header *c
 	uc_fw->private_data_size = css->private_data_size;
 }
 
-static int check_ccs_header(struct intel_gt *gt,
-			    const struct firmware *fw,
-			    struct intel_uc_fw *uc_fw)
+static int __check_ccs_header(struct intel_gt *gt,
+			      const void *fw_data, size_t fw_size,
+			      struct intel_uc_fw *uc_fw)
 {
 	struct uc_css_header *css;
 	size_t size;
 
 	/* Check the size of the blob before examining buffer contents */
-	if (unlikely(fw->size < sizeof(struct uc_css_header))) {
+	if (unlikely(fw_size < sizeof(struct uc_css_header))) {
 		gt_warn(gt, "%s firmware %s: invalid size: %zu < %zu\n",
 			intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path,
-			fw->size, sizeof(struct uc_css_header));
+			fw_size, sizeof(struct uc_css_header));
 		return -ENODATA;
 	}
 
-	css = (struct uc_css_header *)fw->data;
+	css = (struct uc_css_header *)fw_data;
 
 	/* Check integrity of size values inside CSS header */
 	size = (css->header_size_dw - css->key_size_dw - css->modulus_size_dw -
@@ -595,7 +572,7 @@ static int check_ccs_header(struct intel_gt *gt,
 	if (unlikely(size != sizeof(struct uc_css_header))) {
 		gt_warn(gt, "%s firmware %s: unexpected header size: %zu != %zu\n",
 			intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path,
-			fw->size, sizeof(struct uc_css_header));
+			fw_size, sizeof(struct uc_css_header));
 		return -EPROTO;
 	}
 
@@ -607,10 +584,10 @@ static int check_ccs_header(struct intel_gt *gt,
 
 	/* At least, it should have header, uCode and RSA. Size of all three. */
 	size = sizeof(struct uc_css_header) + uc_fw->ucode_size + uc_fw->rsa_size;
-	if (unlikely(fw->size < size)) {
+	if (unlikely(fw_size < size)) {
 		gt_warn(gt, "%s firmware %s: invalid size: %zu < %zu\n",
 			intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path,
-			fw->size, size);
+			fw_size, size);
 		return -ENOEXEC;
 	}
 
@@ -631,6 +608,32 @@ static int check_ccs_header(struct intel_gt *gt,
 	return 0;
 }
 
+static int check_gsc_manifest(struct intel_gt *gt,
+			      const struct firmware *fw,
+			      struct intel_uc_fw *uc_fw)
+{
+	if (uc_fw->type != INTEL_UC_FW_TYPE_HUC) {
+		gt_err(gt, "trying to MEU-parse a non-HuC binary");
+		return -EINVAL;
+	}
+
+	intel_huc_fw_get_binary_info(uc_fw, fw->data, fw->size);
+
+	if (uc_fw->dma_start_offset) {
+		u32 delta = uc_fw->dma_start_offset;
+		__check_ccs_header(gt, fw->data + delta, fw->size - delta, uc_fw);
+	}
+
+	return 0;
+}
+
+static int check_ccs_header(struct intel_gt *gt,
+			    const struct firmware *fw,
+			    struct intel_uc_fw *uc_fw)
+{
+	return __check_ccs_header(gt, fw->data, fw->size, uc_fw);
+}
+
 static bool is_ver_8bit(struct intel_uc_fw_ver *ver)
 {
 	return ver->major < 0xFF && ver->minor < 0xFF && ver->patch < 0xFF;
@@ -678,7 +681,7 @@ static int check_fw_header(struct intel_gt *gt,
 	if (uc_fw->type == INTEL_UC_FW_TYPE_GSC)
 		return 0;
 
-	if (uc_fw->loaded_via_gsc)
+	if (uc_fw->is_meu_binary)
 		err = check_gsc_manifest(gt, fw, uc_fw);
 	else
 		err = check_ccs_header(gt, fw, uc_fw);
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
+	offset = uc_fw->dummy.start + uc_fw->dma_start_offset;
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
@@ -1149,7 +1169,7 @@ size_t intel_uc_fw_copy_rsa(struct intel_uc_fw *uc_fw, void *dst, u32 max_len)
 {
 	struct intel_memory_region *mr = uc_fw->obj->mm.region;
 	u32 size = min_t(u32, uc_fw->rsa_size, max_len);
-	u32 offset = sizeof(struct uc_css_header) + uc_fw->ucode_size;
+	u32 offset = uc_fw->dma_start_offset + sizeof(struct uc_css_header) + uc_fw->ucode_size;
 	struct sgt_iter iter;
 	size_t count = 0;
 	int idx;
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
index 6ba00e6b3975..8f2306627332 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
@@ -105,6 +105,7 @@ struct intel_uc_fw {
 	 * threaded as it done during driver load (inherently single threaded)
 	 * or during a GT reset (mutex guarantees single threaded).
 	 */
+	bool needs_ggtt_mapping;
 	struct i915_vma_resource dummy;
 	struct i915_vma *rsa_data;
 
@@ -112,7 +113,9 @@ struct intel_uc_fw {
 	u32 ucode_size;
 	u32 private_data_size;
 
-	bool loaded_via_gsc;
+	u32 dma_start_offset;
+
+	bool is_meu_binary;
 };
 
 /*
@@ -282,12 +285,14 @@ static inline u32 intel_uc_fw_get_upload_size(struct intel_uc_fw *uc_fw)
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
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h
index 646fa8aa6cf1..7fe405126249 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h
@@ -84,10 +84,4 @@ struct uc_css_header {
 } __packed;
 static_assert(sizeof(struct uc_css_header) == 128);
 
-#define HUC_GSC_VERSION_HI_DW		44
-#define   HUC_GSC_MAJOR_VER_HI_MASK	(0xFF << 0)
-#define   HUC_GSC_MINOR_VER_HI_MASK	(0xFF << 16)
-#define HUC_GSC_VERSION_LO_DW		45
-#define   HUC_GSC_PATCH_VER_LO_MASK	(0xFF << 0)
-
 #endif /* _INTEL_UC_FW_ABI_H */
diff --git a/drivers/gpu/drm/i915/i915_getparam.c b/drivers/gpu/drm/i915/i915_getparam.c
index 2238e096c957..7aa47550e4f2 100644
--- a/drivers/gpu/drm/i915/i915_getparam.c
+++ b/drivers/gpu/drm/i915/i915_getparam.c
@@ -98,7 +98,11 @@ int i915_getparam_ioctl(struct drm_device *dev, void *data,
 		value = sseu->min_eu_in_pool;
 		break;
 	case I915_PARAM_HUC_STATUS:
-		value = intel_huc_check_status(&to_gt(i915)->uc.huc);
+		/* On platform with a media GT, the HuC is on that GT */
+		if (i915->media_gt)
+			value = intel_huc_check_status(&i915->media_gt->uc.huc);
+		else
+			value = intel_huc_check_status(&to_gt(i915)->uc.huc);
 		if (value < 0)
 			return value;
 		break;
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index f82b2b245b0a..94baadce29f6 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -941,6 +941,9 @@
 #define HECI_H_GS1(base)	_MMIO((base) + 0xc4c)
 #define   HECI_H_GS1_ER_PREP	REG_BIT(0)
 
+#define HECI_FWSTS5(base)		_MMIO(base + 0xc68)
+#define   HECI_FWSTS5_HUC_AUTH_DONE	(1 << 19)
+
 #define HSW_GTT_CACHE_EN	_MMIO(0x4024)
 #define   GTT_CACHE_EN_ALL	0xF0007FFF
 #define GEN7_WR_WATERMARK	_MMIO(0x4028)
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h b/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h
index ad67e3f49c20..ac7a3829dda6 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h
@@ -11,15 +11,23 @@
 
 /* PXP-Cmd-Op definitions */
 #define PXP43_CMDID_START_HUC_AUTH 0x0000003A
+#define PXP43_CMDID_NEW_HUC_AUTH 0x0000003F /* MTL+ */
 
-/* PXP-Input-Packet: HUC-Authentication */
+/* PXP-Input-Packet: HUC Load and Authentication */
 struct pxp43_start_huc_auth_in {
 	struct pxp_cmd_header header;
 	__le64 huc_base_address;
 } __packed;
 
-/* PXP-Output-Packet: HUC-Authentication */
-struct pxp43_start_huc_auth_out {
+/* PXP-Input-Packet: HUC Auth-only */
+struct pxp43_new_huc_auth_in {
+	struct pxp_cmd_header header;
+	u64 huc_base_address;
+	u32 huc_size;
+} __packed;
+
+/* PXP-Output-Packet: HUC Load and Authentication or Auth-only */
+struct pxp43_huc_auth_out {
 	struct pxp_cmd_header header;
 } __packed;
 
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_huc.c b/drivers/gpu/drm/i915/pxp/intel_pxp_huc.c
index 23431c36b60b..5eedce916942 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_huc.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_huc.c
@@ -19,7 +19,7 @@ int intel_pxp_huc_load_and_auth(struct intel_pxp *pxp)
 	struct intel_gt *gt;
 	struct intel_huc *huc;
 	struct pxp43_start_huc_auth_in huc_in = {0};
-	struct pxp43_start_huc_auth_out huc_out = {0};
+	struct pxp43_huc_auth_out huc_out = {0};
 	dma_addr_t huc_phys_addr;
 	u8 client_id = 0;
 	u8 fence_id = 0;
diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index dba7c5a5b25e..43b8de42a94e 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -659,7 +659,8 @@ typedef struct drm_i915_irq_wait {
  * If the IOCTL is successful, the returned parameter will be set to one of the
  * following values:
  *  * 0 if HuC firmware load is not complete,
- *  * 1 if HuC firmware is authenticated and running.
+ *  * 1 if HuC firmware is loaded and fully authenticated,
+ *  * 2 if HuC firmware is loaded and authenticated for clear media only
  */
 #define I915_PARAM_HUC_STATUS		 42
 
-- 
2.40.0

