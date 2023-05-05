Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7756F866A
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 18:08:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DD5F10E644;
	Fri,  5 May 2023 16:08:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3777810E637;
 Fri,  5 May 2023 16:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683302911; x=1714838911;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VHG4ZJciJto7JzIrcUTkcF0RTM/gDPewxeMrqzr8AFA=;
 b=cpyPhg41sb8Isxchq8mrUXJKJV3tuLP+ooprblST3VUdp3sDvPA1n0Sc
 dh7Qd8LQaHnFBaOTCXW2lIIEZo4Wc4ybdpI1vnT85yK6ZjKHD4l3Z8i6K
 Ceml7fZYfEo3XKBz2ScWjnmHTnhGUEfE3YlLAdsSYLO141EyRIb+9OyN8
 +edlUbC2avLhNciu1pREzTvVBwgUypcaKPO9j4u7SifHAMCEoJWz+gwgo
 dafWgZ7/xOcavDFCYRp75758/sb/FB62FfvWTIkPtzDh2HL0j6+RzG7rk
 KF5ffnIPA06eFx9HyCxJrsNOmQhuL4p0cD74TD72bxpHAszNJ+G/XWiya g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="349276978"
X-IronPort-AV: E=Sophos;i="5.99,252,1677571200"; d="scan'208";a="349276978"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 09:04:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="871911279"
X-IronPort-AV: E=Sophos;i="5.99,252,1677571200"; d="scan'208";a="871911279"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 09:04:30 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/6] drm/i915/uc/gsc: extract release and security versions
 from the gsc binary
Date: Fri,  5 May 2023 09:04:12 -0700
Message-Id: <20230505160415.889525-4-daniele.ceraolospurio@intel.com>
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The release and security versions of the GSC binary are not used at
runtime to decide interface compatibility (there is a separate version
for that), but they're still useful for debug, so it is still worth
extracting them and printing them out in dmesg.

To get to these version, we need to navigate through various headers in
the binary. See in-code comment for details.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c     | 130 +++++++++++++++++-
 drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h     |   2 +
 .../drm/i915/gt/uc/intel_gsc_meu_headers.h    |  83 ++++++++++-
 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h     |   3 +
 drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c     |  13 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      |  30 ++--
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h      |   3 +
 7 files changed, 237 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
index 4814901fac9e..df53c13e99a3 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
@@ -10,6 +10,7 @@
 #include "gt/intel_gt_print.h"
 #include "gt/intel_ring.h"
 #include "intel_gsc_fw.h"
+#include "intel_gsc_meu_headers.h"
 
 #define GSC_FW_STATUS_REG			_MMIO(0x116C40)
 #define GSC_FW_CURRENT_STATE			REG_GENMASK(3, 0)
@@ -42,6 +43,129 @@ bool intel_gsc_uc_fw_init_done(struct intel_gsc_uc *gsc)
 	return fw_status & GSC_FW_INIT_COMPLETE_BIT;
 }
 
+static inline u32 cpd_entry_offset(const struct intel_gsc_cpd_entry *entry)
+{
+	return entry->offset & INTEL_GSC_CPD_ENTRY_OFFSET_MASK;
+}
+
+int intel_gsc_fw_get_binary_info(struct intel_uc_fw *gsc_fw, const void *data, size_t size)
+{
+	struct intel_gsc_uc *gsc = container_of(gsc_fw, struct intel_gsc_uc, fw);
+	struct intel_gt *gt = gsc_uc_to_gt(gsc);
+	const struct intel_gsc_layout_pointers *layout = data;
+	const struct intel_gsc_bpdt_header *bpdt_header = NULL;
+	const struct intel_gsc_bpdt_entry *bpdt_entry = NULL;
+	const struct intel_gsc_cpd_header_v2 *cpd_header = NULL;
+	const struct intel_gsc_cpd_entry *cpd_entry = NULL;
+	const struct intel_gsc_manifest_header *manifest;
+	size_t min_size = sizeof(*layout);
+	int i;
+
+	if (size < min_size) {
+		gt_err(gt, "GSC FW too small! %zu < %zu\n", size, min_size);
+		return -ENODATA;
+	}
+
+	/*
+	 * The GSC binary starts with the pointer layout, which contains the
+	 * locations of the various partitions of the binary. The one we're
+	 * interested in to get the version is the boot1 partition, where we can
+	 * find a BPDT header followed by entries, one of which points to the
+	 * RBE sub-section of the partition. From here, we can parse the CPD
+	 * header and the following entries to find the manifest location
+	 * (entry identified by the "RBEP.man" name), from which we can finally
+	 * extract the version.
+	 *
+	 * --------------------------------------------------
+	 * [  intel_gsc_layout_pointers                     ]
+	 * [      ...                                       ]
+	 * [      boot1_offset  >---------------------------]------o
+	 * [      ...                                       ]      |
+	 * --------------------------------------------------      |
+	 *                                                         |
+	 * --------------------------------------------------      |
+	 * [  intel_gsc_bpdt_header                         ]<-----o
+	 * --------------------------------------------------
+	 * [  intel_gsc_bpdt_entry[]                        ]
+	 * [      entry1                                    ]
+	 * [      ...                                       ]
+	 * [      entryX                                    ]
+	 * [          type == GSC_RBE                       ]
+	 * [          offset  >-----------------------------]------o
+	 * [      ...                                       ]      |
+	 * --------------------------------------------------      |
+	 *                                                         |
+	 * --------------------------------------------------      |
+	 * [  intel_gsc_cpd_header_v2                       ]<-----o
+	 * --------------------------------------------------
+	 * [  intel_gsc_cpd_entry[]                         ]
+	 * [      entry1                                    ]
+	 * [      ...                                       ]
+	 * [      entryX                                    ]
+	 * [          "RBEP.man"                            ]
+	 * [           ...                                  ]
+	 * [           offset  >----------------------------]------o
+	 * [      ...                                       ]      |
+	 * --------------------------------------------------      |
+	 *                                                         |
+	 * --------------------------------------------------      |
+	 * [ intel_gsc_manifest_header                      ]<-----o
+	 * [  ...                                           ]
+	 * [  intel_gsc_meu_version fw_version              ]
+	 * [  ...                                           ]
+	 * --------------------------------------------------
+	 */
+
+	min_size = layout->boot1_offset + layout->boot1_offset > size;
+	if (size < min_size) {
+		gt_err(gt, "GSC FW too small for boot section! %zu < %zu\n",
+		       size, min_size);
+		return -ENODATA;
+	}
+
+	bpdt_header = data + layout->boot1_offset;
+	if (bpdt_header->signature != INTEL_GSC_BPDT_HEADER_SIGNATURE) {
+		gt_err(gt, "invalid signature for meu BPDT header: 0x%08x!\n",
+		       bpdt_header->signature);
+		return -EINVAL;
+	}
+
+	bpdt_entry = (void *)bpdt_header + sizeof(*bpdt_header);
+	for (i = 0; i < bpdt_header->descriptor_count; i++, bpdt_entry++) {
+		if ((bpdt_entry->type & INTEL_GSC_BPDT_ENTRY_TYPE_MASK) !=
+		    INTEL_GSC_BPDT_ENTRY_TYPE_GSC_RBE)
+			continue;
+
+		cpd_header = (void *)bpdt_header + bpdt_entry->sub_partition_offset;
+		break;
+	}
+
+	if (!cpd_header) {
+		gt_err(gt, "couldn't find CPD header in GSC binary!\n");
+		return -ENODATA;
+	}
+
+	if (cpd_header->header_marker != INTEL_GSC_CPD_HEADER_MARKER) {
+		gt_err(gt, "invalid marker for meu CPD header in GSC bin: 0x%08x!\n",
+		       cpd_header->header_marker);
+		return -EINVAL;
+	}
+
+	cpd_entry = (void *)cpd_header + cpd_header->header_length;
+	for (i = 0; i < cpd_header->num_of_entries; i++, cpd_entry++) {
+		if (strcmp(cpd_entry->name, "RBEP.man") == 0) {
+			manifest = (void *)cpd_header + cpd_entry_offset(cpd_entry);
+			intel_uc_fw_version_from_meu_manifest(&gsc->release,
+							      manifest);
+			gsc->security_version = manifest->security_version;
+			break;
+		}
+	}
+
+	return 0;
+}
+
+
 static int emit_gsc_fw_load(struct i915_request *rq, struct intel_gsc_uc *gsc)
 {
 	u32 offset = i915_ggtt_offset(gsc->local);
@@ -206,7 +330,11 @@ int intel_gsc_uc_fw_upload(struct intel_gsc_uc *gsc)
 	/* FW is not fully operational until we enable SW proxy */
 	intel_uc_fw_change_status(gsc_fw, INTEL_UC_FIRMWARE_TRANSFERRED);
 
-	gt_info(gt, "Loaded GSC firmware %s\n", gsc_fw->file_selected.path);
+	gt_info(gt, "Loaded GSC firmware %s (r%u.%u.%u.%u, svn%u)\n",
+		gsc_fw->file_selected.path,
+		gsc->release.major, gsc->release.minor,
+		gsc->release.patch, gsc->release.build,
+		gsc->security_version);
 
 	return 0;
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h
index fff8928218df..8d7b9e4f1ffc 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h
@@ -9,8 +9,10 @@
 #include <linux/types.h>
 
 struct intel_gsc_uc;
+struct intel_uc_fw;
 struct intel_uncore;
 
+int intel_gsc_fw_get_binary_info(struct intel_uc_fw *gsc_fw, const void *data, size_t size);
 int intel_gsc_uc_fw_upload(struct intel_gsc_uc *gsc);
 bool intel_gsc_uc_fw_init_done(struct intel_gsc_uc *gsc);
 bool intel_gsc_uc_fw_proxy_init_done(struct intel_gsc_uc *gsc);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_meu_headers.h b/drivers/gpu/drm/i915/gt/uc/intel_gsc_meu_headers.h
index d55a66202576..8bce2b8aed84 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_meu_headers.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_meu_headers.h
@@ -8,6 +8,82 @@
 
 #include <linux/types.h>
 
+struct intel_gsc_meu_version {
+	u16 major;
+	u16 minor;
+	u16 hotfix;
+	u16 build;
+} __packed;
+
+struct intel_gsc_layout_pointers {
+	u8 rom_bypass_vector[16];
+
+	/* size of pointers layout not including ROM bypass vector */
+	u16 size;
+
+	/*
+	 * bit0: Backup copy of layout pointers exist
+	 * bits1-15: reserved
+	 */
+	u8 flags;
+
+	u8 reserved;
+
+	u32 crc32;
+
+	u32 datap_offset;
+	u32 datap_size;
+
+	u32 boot1_offset;
+	u32 boot1_size;
+
+	u32 boot2_offset;
+	u32 boot2_size;
+
+	u32 boot3_offset;
+	u32 boot3_size;
+
+	u32 boot4_offset;
+	u32 boot4_size;
+
+	u32 boot5_offset;
+	u32 boot5_size;
+
+	u32 temp_pages_offset;
+	u32 temp_pages_size;
+} __packed;
+
+struct intel_gsc_bpdt_header {
+	u32 signature;
+#define INTEL_GSC_BPDT_HEADER_SIGNATURE 0x000055AA
+
+	u16 descriptor_count; /* bum of entries after the header */
+
+	u8 version;
+	u8 configuration;
+
+	u32 crc32;
+
+	u32 build_version;
+	struct intel_gsc_meu_version tool_version;
+} __packed;
+
+
+struct intel_gsc_bpdt_entry {
+	/*
+	 * Bits 0-15: BPDT entry type
+	 * Bits 16-17: reserved
+	 * Bit 18: code sub-partition
+	 * Bits 19-31: reserved
+	 */
+	u32 type;
+#define INTEL_GSC_BPDT_ENTRY_TYPE_MASK GENMASK(15,0)
+#define INTEL_GSC_BPDT_ENTRY_TYPE_GSC_RBE 0x1
+
+	u32 sub_partition_offset; /* from the base of the BPDT header */
+	u32 sub_partition_size;
+} __packed;
+
 /* Code partition directory (CPD) structures */
 struct intel_gsc_cpd_header_v2 {
 	u32 header_marker;
@@ -44,13 +120,6 @@ struct intel_gsc_cpd_entry {
 	u8 reserved[4];
 } __packed;
 
-struct intel_gsc_meu_version {
-	u16 major;
-	u16 minor;
-	u16 hotfix;
-	u16 build;
-} __packed;
-
 struct intel_gsc_manifest_header {
 	u32 header_type; /* 0x4 for manifest type */
 	u32 header_length; /* in dwords */
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h
index c01286dddbdb..d778a01f8c05 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h
@@ -17,6 +17,9 @@ struct intel_gsc_uc {
 	struct intel_uc_fw fw;
 
 	/* GSC-specific additions */
+	struct intel_uc_fw_ver release;
+	u32 security_version;
+
 	struct i915_vma *local; /* private memory for GSC usage */
 	void __iomem *local_vaddr; /* pointer to access the private memory */
 	struct intel_context *ce; /* for submission to GSC FW via GSC engine */
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
index 0a0bd5504057..0c01d48b1dd9 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
@@ -106,15 +106,6 @@ int intel_huc_fw_auth_via_gsccs(struct intel_huc *huc)
 	return err;
 }
 
-static void get_version_from_meu_manifest(struct intel_uc_fw_ver *ver, const void *data)
-{
-	const struct intel_gsc_manifest_header *manifest = data;
-
-	ver->major = manifest->fw_version.major;
-	ver->minor = manifest->fw_version.minor;
-	ver->patch = manifest->fw_version.hotfix;
-}
-
 static bool css_valid(const void *data, size_t size)
 {
 	const struct uc_css_header *css = data;
@@ -226,8 +217,8 @@ int intel_huc_fw_get_binary_info(struct intel_uc_fw *huc_fw, const void *data, s
 
 	for (i = 0; i < header->num_of_entries; i++, entry++) {
 		if (strcmp(entry->name, "HUCP.man") == 0)
-			get_version_from_meu_manifest(&huc_fw->file_selected.ver,
-						      data + entry_offset(entry));
+			intel_uc_fw_version_from_meu_manifest(&huc_fw->file_selected.ver,
+							      data + entry_offset(entry));
 
 		if (strcmp(entry->name, "huc_fw") == 0) {
 			u32 offset = entry_offset(entry);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
index 796f54a62eef..cd8fc194f7fa 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
@@ -12,6 +12,8 @@
 
 #include "gem/i915_gem_lmem.h"
 #include "gt/intel_gt_print.h"
+#include "intel_gsc_fw.h"
+#include "intel_gsc_meu_headers.h"
 #include "intel_uc_fw.h"
 #include "intel_uc_fw_abi.h"
 #include "i915_drv.h"
@@ -419,6 +421,17 @@ static void __uc_fw_user_override(struct drm_i915_private *i915, struct intel_uc
 	}
 }
 
+void intel_uc_fw_version_from_meu_manifest(struct intel_uc_fw_ver *ver,
+					   const void *data)
+{
+	const struct intel_gsc_manifest_header *manifest = data;
+
+	ver->major = manifest->fw_version.major;
+	ver->minor = manifest->fw_version.minor;
+	ver->patch = manifest->fw_version.hotfix;
+	ver->build = manifest->fw_version.build;
+}
+
 /**
  * intel_uc_fw_init_early - initialize the uC object and select the firmware
  * @uc_fw: uC firmware
@@ -612,13 +625,18 @@ static int check_gsc_manifest(struct intel_gt *gt,
 			      const struct firmware *fw,
 			      struct intel_uc_fw *uc_fw)
 {
-	if (uc_fw->type != INTEL_UC_FW_TYPE_HUC) {
-		gt_err(gt, "trying to MEU-parse a non-HuC binary");
+	switch (uc_fw->type) {
+	case INTEL_UC_FW_TYPE_HUC:
+		intel_huc_fw_get_binary_info(uc_fw, fw->data, fw->size);
+		break;
+	case INTEL_UC_FW_TYPE_GSC:
+		intel_gsc_fw_get_binary_info(uc_fw, fw->data, fw->size);
+		break;
+	default:
+		MISSING_CASE(uc_fw->type);
 		return -EINVAL;
 	}
 
-	intel_huc_fw_get_binary_info(uc_fw, fw->data, fw->size);
-
 	if (uc_fw->dma_start_offset) {
 		u32 delta = uc_fw->dma_start_offset;
 		__check_ccs_header(gt, fw->data + delta, fw->size - delta, uc_fw);
@@ -677,10 +695,6 @@ static int check_fw_header(struct intel_gt *gt,
 {
 	int err = 0;
 
-	/* GSC FW version is queried after the FW is loaded */
-	if (uc_fw->type == INTEL_UC_FW_TYPE_GSC)
-		return 0;
-
 	if (uc_fw->is_meu_binary)
 		err = check_gsc_manifest(gt, fw, uc_fw);
 	else
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
index 8f2306627332..279244744d43 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
@@ -70,6 +70,7 @@ struct intel_uc_fw_ver {
 	u32 major;
 	u32 minor;
 	u32 patch;
+	u32 build;
 };
 
 /*
@@ -284,6 +285,8 @@ static inline u32 intel_uc_fw_get_upload_size(struct intel_uc_fw *uc_fw)
 	return __intel_uc_fw_get_upload_size(uc_fw);
 }
 
+void intel_uc_fw_version_from_meu_manifest(struct intel_uc_fw_ver *ver,
+					   const void *data);
 void intel_uc_fw_init_early(struct intel_uc_fw *uc_fw,
 			    enum intel_uc_fw_type type,
 			    bool needs_ggtt_mapping);
-- 
2.40.0

