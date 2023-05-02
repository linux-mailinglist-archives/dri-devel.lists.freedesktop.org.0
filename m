Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4E16F4727
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 17:28:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 834BF10E311;
	Tue,  2 May 2023 15:27:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 533D510E311;
 Tue,  2 May 2023 15:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683041275; x=1714577275;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Y72A41SmPO19BVZLLzCrcLJuAKe37WfFlOj0uTdwd48=;
 b=K6WYh9RAhMehep4f74xNRY/wqR3RLpa/XwFNZze/gRk48VCS+tOtkrq6
 /88XbDXbAQIQO2+r4vJ9C2eiP1kvTxrn+Eq9U7klM5o9uVJFSLRtTCcwy
 YEsMg5bHo9xW6McSevMo2oUiOknDo5X8p5TLQzpTuJBEXOJ6zFiuD637O
 CT+85BGTMn0bbGqEN+aig1mLH2novrNWub1WIIEygIHBOmgnBJMwy20Q0
 GhRegYp9ZC/rvPHN2+249cU4PYtjRlw/esRXM6mklwO+/IE7e+U4Zqj7M
 1eAiioMJ1YNMgqG4KCjURMuGEdtGOqW0RtdiJ/vFvKZGW2YEpI8UwFXvr Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="411574973"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; d="scan'208";a="411574973"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2023 08:27:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="870601744"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; d="scan'208";a="870601744"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2023 08:27:53 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2] drm/i915/huc: Parse the GSC-enabled HuC binary
Date: Tue,  2 May 2023 08:27:43 -0700
Message-Id: <20230502152743.304579-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230428185810.4127234-4-daniele.ceraolospurio@intel.com>
References: <20230428185810.4127234-4-daniele.ceraolospurio@intel.com>
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
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The new binaries that support the 2-step authentication have contain the
legacy-style binary, which we can use for loading the HuC via DMA. To
find out where this is located in the image, we need to parse the meu
manifest of the GSC binary. The manifest consist of a partition header
followed by entries, one of which contains the offset we're looking for.
Note that the DG2 GSC binary contains entries with the same names, but
it doesn't contain a full legacy binary, so we need to skip assigning
the dma offset in that case (which we can do by checking the ccs).
Also, since we're now parsing the entries, we can extract the HuC
version that way instead of using hardcoded offsets.

Note that the meu structure will be re-used for parsing the GSC binary,
so they've been added in their own header.

v2: fix structure names to match meu defines (s/CPT/CPD/), update commit
    message, check ccs validity, drop old version location defines.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 .../drm/i915/gt/uc/intel_gsc_meu_headers.h    |  74 ++++++++++
 drivers/gpu/drm/i915/gt/uc/intel_huc.c        |  11 +-
 drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c     | 135 ++++++++++++++++++
 drivers/gpu/drm/i915/gt/uc/intel_huc_fw.h     |   5 +-
 drivers/gpu/drm/i915/gt/uc/intel_huc_print.h  |  21 +++
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      |  71 +++++----
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h      |   2 +
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h  |   6 -
 8 files changed, 272 insertions(+), 53 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_meu_headers.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_huc_print.h

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
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
index 9721761373fb..062ff914b274 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
@@ -6,23 +6,14 @@
 #include <linux/types.h>
 
 #include "gt/intel_gt.h"
-#include "gt/intel_gt_print.h"
 #include "intel_guc_reg.h"
 #include "intel_huc.h"
+#include "intel_huc_print.h"
 #include "i915_drv.h"
 
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
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
index 534b0aa43316..0ec48c2cd749 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
@@ -5,11 +5,146 @@
 
 #include "gt/intel_gsc.h"
 #include "gt/intel_gt.h"
+#include "intel_gsc_meu_headers.h"
 #include "intel_huc.h"
 #include "intel_huc_fw.h"
+#include "intel_huc_print.h"
 #include "i915_drv.h"
 #include "pxp/intel_pxp_huc.h"
 
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
+	if (!huc_fw->loaded_via_gsc) {
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
+
 int intel_huc_fw_load_and_auth_via_gsc(struct intel_huc *huc)
 {
 	int ret;
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.h b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.h
index db42e238b45f..0999ffe6f962 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.h
@@ -7,8 +7,11 @@
 #define _INTEL_HUC_FW_H_
 
 struct intel_huc;
+struct intel_uc_fw;
+
+#include <linux/types.h>
 
 int intel_huc_fw_load_and_auth_via_gsc(struct intel_huc *huc);
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
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
index 03f0b258aea7..da6fcfe1d80a 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
@@ -492,33 +492,6 @@ static void __force_fw_fetch_failures(struct intel_uc_fw *uc_fw, int e)
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
@@ -575,22 +548,22 @@ static void guc_read_css_info(struct intel_uc_fw *uc_fw, struct uc_css_header *c
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
@@ -598,7 +571,7 @@ static int check_ccs_header(struct intel_gt *gt,
 	if (unlikely(size != sizeof(struct uc_css_header))) {
 		gt_warn(gt, "%s firmware %s: unexpected header size: %zu != %zu\n",
 			intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path,
-			fw->size, sizeof(struct uc_css_header));
+			fw_size, sizeof(struct uc_css_header));
 		return -EPROTO;
 	}
 
@@ -610,10 +583,10 @@ static int check_ccs_header(struct intel_gt *gt,
 
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
 
@@ -634,6 +607,32 @@ static int check_ccs_header(struct intel_gt *gt,
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
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
index 26a9d6e0dc00..2691bb6bde48 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
@@ -113,6 +113,8 @@ struct intel_uc_fw {
 	u32 ucode_size;
 	u32 private_data_size;
 
+	u32 dma_start_offset;
+
 	bool loaded_via_gsc;
 };
 
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
-- 
2.40.0

