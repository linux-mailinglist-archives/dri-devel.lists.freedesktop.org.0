Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C176F866B
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 18:08:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21D3010E646;
	Fri,  5 May 2023 16:08:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97C5810E638;
 Fri,  5 May 2023 16:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683302911; x=1714838911;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6Pbm0NKJ8+Fgj1DfU6P64xavUq7b+mawEOZv/GmRVTc=;
 b=NUMFyRyHmour+qPVwJG2DJzihvj4v5ctAC2ZLaQFhbSyiEeHb4Eaw7KJ
 ui93zEM5l67fJ1LV+N4pfpWP+YRSh26a2S+BjHur+K65aB0D4b4hCconB
 /QGuaozOEvBViDj9KeRbs+xXFWqSkhKhFg2XFiDRiKAsr5lf/eqFs2Ljj
 IVj4hxeWuNsC77/bAei4xz4heHmj1pDlEcEKJdLF7rbRpQM5DZovLvf6o
 UhEpDl8cxGtTZISD43E5WnrzYOWNxjKHr+/OTDHyzxdeXYpSjRyugUB1e
 wrAsG75rJzXcCtMxUlUq5feN1W3LAOMPJYfKAOAAV2vLlfX/6pbqQ8sXy A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="349276981"
X-IronPort-AV: E=Sophos;i="5.99,252,1677571200"; d="scan'208";a="349276981"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 09:04:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="871911288"
X-IronPort-AV: E=Sophos;i="5.99,252,1677571200"; d="scan'208";a="871911288"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 09:04:32 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 4/6] drm/i915/uc/gsc: query the GSC FW for its compatibility
 version
Date: Fri,  5 May 2023 09:04:13 -0700
Message-Id: <20230505160415.889525-5-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505160415.889525-1-daniele.ceraolospurio@intel.com>
References: <20230505160415.889525-1-daniele.ceraolospurio@intel.com>
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

The compatibility version is queried via an MKHI command. Right now, the
only existing interface is 1.0
This is basically the interface version for the GSC FW, so the plan is
to use it as the main tracked version, including for the binary naming
in the fetch code.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c     | 91 ++++++++++++++++++-
 .../i915/gt/uc/intel_gsc_uc_heci_cmd_submit.h |  1 +
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      | 44 +++++----
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h      |  1 +
 4 files changed, 120 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
index df53c13e99a3..0b6dcd982b14 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
@@ -11,6 +11,7 @@
 #include "gt/intel_ring.h"
 #include "intel_gsc_fw.h"
 #include "intel_gsc_meu_headers.h"
+#include "intel_gsc_uc_heci_cmd_submit.h"
 
 #define GSC_FW_STATUS_REG			_MMIO(0x116C40)
 #define GSC_FW_CURRENT_STATE			REG_GENMASK(3, 0)
@@ -270,6 +271,84 @@ static int gsc_fw_wait(struct intel_gt *gt)
 				       500);
 }
 
+struct intel_gsc_mkhi_header {
+	u8  group_id;
+#define MKHI_GROUP_ID_GFX_SRV 0x30
+
+	u8  command;
+#define MKHI_GFX_SRV_GET_HOST_COMPATIBILITY_VERSION (0x42)
+
+	u8  reserved;
+	u8  result;
+} __packed;
+
+struct mtl_gsc_ver_msg_in {
+	struct intel_gsc_mtl_header header;
+	struct intel_gsc_mkhi_header mkhi;
+} __packed;
+
+struct mtl_gsc_ver_msg_out {
+	struct intel_gsc_mtl_header header;
+	struct intel_gsc_mkhi_header mkhi;
+	u16 proj_major;
+	u16 compat_major;
+	u16 compat_minor;
+	u16 reserved[5];
+} __packed;
+
+static int gsc_fw_query_compatibility_version(struct intel_gsc_uc *gsc)
+{
+	struct intel_gt *gt = gsc_uc_to_gt(gsc);
+	struct mtl_gsc_ver_msg_in *msg_in;
+	struct mtl_gsc_ver_msg_out *msg_out;
+	struct i915_vma *vma;
+	u64 offset;
+	void *vaddr;
+	int err;
+
+	err = intel_guc_allocate_and_map_vma(&gt->uc.guc, PAGE_SIZE * 2,
+					     &vma, &vaddr);
+	if (err) {
+		gt_err(gt, "failed to allocate vma for GSC version query\n");
+		return err;
+	}
+
+	offset = i915_ggtt_offset(vma);
+	msg_in = vaddr;
+	msg_out = vaddr + SZ_4K;
+
+	intel_gsc_uc_heci_cmd_emit_mtl_header(&msg_in->header,
+					      HECI_MEADDRESS_MKHI,
+					      sizeof(*msg_in), 0);
+	msg_in->mkhi.group_id = MKHI_GROUP_ID_GFX_SRV;
+	msg_in->mkhi.command = MKHI_GFX_SRV_GET_HOST_COMPATIBILITY_VERSION;
+
+	err = intel_gsc_uc_heci_cmd_submit_packet(&gt->uc.gsc,
+						  offset, sizeof(*msg_in),
+						  offset + SZ_4K, SZ_4K);
+	if (err) {
+		gt_err(gt,
+		       "failed to submit GSC request for compatibility version: %d\n",
+		       err);
+		goto out_vma;
+	}
+
+	if (msg_out->header.message_size != sizeof(*msg_out)) {
+		gt_err(gt, "invalid GSC reply length %u [expected %zu], s=0x%x, f=0x%x, r=0x%x\n",
+			msg_out->header.message_size, sizeof(*msg_out),
+			msg_out->header.status, msg_out->header.flags, msg_out->mkhi.result);
+		err = -EPROTO;
+		goto out_vma;
+	}
+
+	gsc->fw.file_selected.ver.major = msg_out->compat_major;
+	gsc->fw.file_selected.ver.minor = msg_out->compat_minor;
+
+out_vma:
+	i915_vma_unpin_and_release(&vma, I915_VMA_RELEASE_MAP);
+	return err;
+}
+
 int intel_gsc_uc_fw_upload(struct intel_gsc_uc *gsc)
 {
 	struct intel_gt *gt = gsc_uc_to_gt(gsc);
@@ -327,11 +406,21 @@ int intel_gsc_uc_fw_upload(struct intel_gsc_uc *gsc)
 	if (err)
 		goto fail;
 
+	err = gsc_fw_query_compatibility_version(gsc);
+	if (err)
+		goto fail;
+
+	/* we only support compatibility version 1.0 at the moment */
+	err = intel_uc_check_file_version(gsc_fw, NULL);
+	if (err)
+		goto fail;
+
 	/* FW is not fully operational until we enable SW proxy */
 	intel_uc_fw_change_status(gsc_fw, INTEL_UC_FIRMWARE_TRANSFERRED);
 
-	gt_info(gt, "Loaded GSC firmware %s (r%u.%u.%u.%u, svn%u)\n",
+	gt_info(gt, "Loaded GSC firmware %s (cv%u.%u, r%u.%u.%u.%u, svn %u)\n",
 		gsc_fw->file_selected.path,
+		gsc_fw->file_selected.ver.major, gsc_fw->file_selected.ver.minor,
 		gsc->release.major, gsc->release.minor,
 		gsc->release.patch, gsc->release.build,
 		gsc->security_version);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.h b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.h
index 8f199d5f963e..fb1453ed4ecf 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.h
@@ -14,6 +14,7 @@ struct intel_gsc_mtl_header {
 #define GSC_HECI_VALIDITY_MARKER 0xA578875A
 
 	u8 heci_client_id;
+#define HECI_MEADDRESS_MKHI 7
 #define HECI_MEADDRESS_PROXY 10
 #define HECI_MEADDRESS_PXP 17
 #define HECI_MEADDRESS_HDCP 18
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
index cd8fc194f7fa..36ee96c02d74 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
@@ -730,6 +730,31 @@ static int try_firmware_load(struct intel_uc_fw *uc_fw, const struct firmware **
 	return 0;
 }
 
+int intel_uc_check_file_version(struct intel_uc_fw *uc_fw, bool *old_ver)
+{
+	struct intel_gt *gt = __uc_fw_to_gt(uc_fw);
+	struct intel_uc_fw_file *wanted = &uc_fw->file_wanted;
+	struct intel_uc_fw_file *selected = &uc_fw->file_selected;
+
+	if (!wanted->ver.major || !selected->ver.major)
+		return 0;
+
+	/* Check the file's major version was as it claimed */
+	if (selected->ver.major != wanted->ver.major) {
+		gt_notice(gt, "%s firmware %s: unexpected version: %u.%u != %u.%u\n",
+			  intel_uc_fw_type_repr(uc_fw->type), selected->path,
+			  selected->ver.major, selected->ver.minor,
+			  wanted->ver.major, wanted->ver.minor);
+		if (!intel_uc_fw_is_overridden(uc_fw))
+			return -ENOEXEC;
+	} else {
+		if (old_ver && selected->ver.minor < wanted->ver.minor)
+			*old_ver = true;
+	}
+
+	return 0;
+}
+
 /**
  * intel_uc_fw_fetch - fetch uC firmware
  * @uc_fw: uC firmware
@@ -797,22 +822,9 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
 			goto fail;
 	}
 
-	if (uc_fw->file_wanted.ver.major && uc_fw->file_selected.ver.major) {
-		/* Check the file's major version was as it claimed */
-		if (uc_fw->file_selected.ver.major != uc_fw->file_wanted.ver.major) {
-			gt_notice(gt, "%s firmware %s: unexpected version: %u.%u != %u.%u\n",
-				  intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path,
-				  uc_fw->file_selected.ver.major, uc_fw->file_selected.ver.minor,
-				  uc_fw->file_wanted.ver.major, uc_fw->file_wanted.ver.minor);
-			if (!intel_uc_fw_is_overridden(uc_fw)) {
-				err = -ENOEXEC;
-				goto fail;
-			}
-		} else {
-			if (uc_fw->file_selected.ver.minor < uc_fw->file_wanted.ver.minor)
-				old_ver = true;
-		}
-	}
+	err = intel_uc_check_file_version(uc_fw, &old_ver);
+	if (err)
+		goto fail;
 
 	if (old_ver && uc_fw->file_selected.ver.major) {
 		/* Preserve the version that was really wanted */
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
index 279244744d43..4406e7b48b27 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
@@ -287,6 +287,7 @@ static inline u32 intel_uc_fw_get_upload_size(struct intel_uc_fw *uc_fw)
 
 void intel_uc_fw_version_from_meu_manifest(struct intel_uc_fw_ver *ver,
 					   const void *data);
+int intel_uc_check_file_version(struct intel_uc_fw *uc_fw, bool *old_ver);
 void intel_uc_fw_init_early(struct intel_uc_fw *uc_fw,
 			    enum intel_uc_fw_type type,
 			    bool needs_ggtt_mapping);
-- 
2.40.0

