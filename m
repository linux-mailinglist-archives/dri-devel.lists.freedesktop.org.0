Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CB26F106B
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 04:34:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8333610EC35;
	Fri, 28 Apr 2023 02:34:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F8AD10EC27;
 Fri, 28 Apr 2023 02:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682649278; x=1714185278;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KiKfl0IXABBb0lNJgonrG1nTSgw1I8RX0L3pmIjGVMU=;
 b=knT6fNrx9bRcqwfuhh+ia43UQLp1D/spnHEdA0fZbeH6RtF0W/ApqZu6
 +G0bJzn62qPw5dn7E8gy0TELSfPhxE0zBO9C3kBCztqopl9V+IFfpjQjw
 sbVQXdEt8w3106DrLLtuq4FifeUJn+XIkfSKz3BlOSMdxm5oryuGsnTko
 fUyd02Gryzdn3OA+QGDlHAq2qhNdQnwIdX1WYkox+S6E41UYIQvaG3/l9
 JQkJbPFwpD8wMPF2ySILhkN1Gt6VP26A/FbskzAhpQBcc0bRVqD78jEMX
 ifgejIVswVy+oeLKkUVjkEMnarYfTV8L46l+a2AA9GsfzhaBqRgzMONLO g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="346386513"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; d="scan'208";a="346386513"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2023 19:34:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="644937245"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; d="scan'208";a="644937245"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2023 19:34:36 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 6/8] drm/i915/mtl/huc: auth HuC via GSC
Date: Thu, 27 Apr 2023 19:34:14 -0700
Message-Id: <20230428023416.4051910-7-daniele.ceraolospurio@intel.com>
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

The full authentication via the GSC requires an heci packet submission
to the GSC FW via the GSC CS. The GSC has new PXP command for this
(literally called NEW_HUC_AUTH).
The intel_huc_auth fuction is also updated to handle both authentication
types.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c     | 24 ++++-
 .../i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_huc.c        | 50 +++++++---
 drivers/gpu/drm/i915/gt/uc/intel_huc.h        |  6 +-
 drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c     | 94 +++++++++++++++++++
 drivers/gpu/drm/i915/gt/uc/intel_huc_fw.h     |  1 +
 drivers/gpu/drm/i915/gt/uc/intel_uc.c         |  2 +-
 .../drm/i915/pxp/intel_pxp_cmd_interface_43.h | 14 ++-
 drivers/gpu/drm/i915/pxp/intel_pxp_huc.c      |  2 +-
 9 files changed, 173 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
index af542e3cb3e9..b6d0ee1660b2 100644
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
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
index cc3c9cb2319c..21621d7439ba 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
@@ -347,20 +347,34 @@ static int check_huc_loading_mode(struct intel_huc *huc)
 
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
@@ -375,6 +389,9 @@ void intel_huc_fini(struct intel_huc *huc)
 	 */
 	delayed_huc_load_fini(huc);
 
+	if (huc->heci_pkt)
+		i915_vma_unpin_and_release(&huc->heci_pkt, 0);
+
 	if (intel_uc_fw_is_loadable(&huc->fw))
 		intel_uc_fw_fini(&huc->fw);
 }
@@ -431,6 +448,7 @@ int intel_huc_wait_for_auth_complete(struct intel_huc *huc,
 /**
  * intel_huc_auth() - Authenticate HuC uCode
  * @huc: intel_huc structure
+ * @type: authentication type (via GuC or via GSC)
  *
  * Called after HuC and GuC firmware loading during intel_uc_init_hw().
  *
@@ -438,7 +456,7 @@ int intel_huc_wait_for_auth_complete(struct intel_huc *huc,
  * passing the offset of the RSA signature to intel_guc_auth_huc(). It then
  * waits for up to 50ms for firmware verification ACK.
  */
-int intel_huc_auth(struct intel_huc *huc)
+int intel_huc_auth(struct intel_huc *huc, enum intel_huc_authentication_type type)
 {
 	struct intel_gt *gt = huc_to_gt(huc);
 	struct intel_guc *guc = &gt->uc.guc;
@@ -447,31 +465,41 @@ int intel_huc_auth(struct intel_huc *huc)
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
-	ret = intel_huc_wait_for_auth_complete(huc, INTEL_HUC_AUTH_BY_GUC);
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
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.h b/drivers/gpu/drm/i915/gt/uc/intel_huc.h
index adb063cd27a0..319d38c4ab51 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_huc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.h
@@ -15,6 +15,7 @@
 #include <linux/hrtimer.h>
 
 struct bus_type;
+struct i915_vma;
 
 enum intel_huc_delayed_load_status {
 	INTEL_HUC_WAITING_ON_GSC = 0,
@@ -46,6 +47,9 @@ struct intel_huc {
 		enum intel_huc_delayed_load_status status;
 	} delayed_load;
 
+	/* for load via GSCCS */
+	struct i915_vma *heci_pkt;
+
 	bool loaded_via_gsc;
 };
 
@@ -54,7 +58,7 @@ void intel_huc_init_early(struct intel_huc *huc);
 int intel_huc_init(struct intel_huc *huc);
 void intel_huc_fini(struct intel_huc *huc);
 void intel_huc_suspend(struct intel_huc *huc);
-int intel_huc_auth(struct intel_huc *huc);
+int intel_huc_auth(struct intel_huc *huc, enum intel_huc_authentication_type type);
 int intel_huc_wait_for_auth_complete(struct intel_huc *huc,
 				     enum intel_huc_authentication_type type);
 bool intel_huc_is_authenticated(struct intel_huc *huc,
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
index 3b8edaba97d2..feb951a793ea 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
@@ -6,11 +6,105 @@
 #include "gt/intel_gsc.h"
 #include "gt/intel_gt.h"
 #include "intel_gsc_meu_headers.h"
+#include "intel_gsc_uc_heci_cmd_submit.h"
 #include "intel_huc.h"
 #include "intel_huc_fw.h"
 #include "intel_huc_print.h"
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
 
 static void get_version_from_meu_manifest(struct intel_uc_fw_ver *ver, const void *data)
 {
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.h b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.h
index 0999ffe6f962..307ab45e6b09 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.h
@@ -12,6 +12,7 @@ struct intel_uc_fw;
 #include <linux/types.h>
 
 int intel_huc_fw_load_and_auth_via_gsc(struct intel_huc *huc);
+int intel_huc_fw_auth_via_gsccs(struct intel_huc *huc);
 int intel_huc_fw_upload(struct intel_huc *huc);
 int intel_huc_fw_get_binary_info(struct intel_uc_fw *huc_fw, const void *data, size_t size);
 #endif
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
index b6adfda3761e..05ad56274007 100644
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
-- 
2.40.0

