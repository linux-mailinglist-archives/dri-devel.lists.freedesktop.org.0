Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F832718F39
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 01:54:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D507D10E1FC;
	Wed, 31 May 2023 23:54:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7250310E0DB;
 Wed, 31 May 2023 23:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685577266; x=1717113266;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iegpz9UWNbmWbJXamW9iQ0IoB0xfyd2aYsfjooy0kxA=;
 b=PamBsnjanRIn40S5VuWBIAzXUJZBTbTGgK6J7wDHoSZuILkvXvBaYJ09
 rht6Jsn17xVBqrhjzj5xrdojpwrkA1RcCB3NoKFakqccHYebE/deagsNg
 w4fR3Wzrmf1pSSPT+OwstvqyZkbab93XeiIl/g+XYWF9wCXlrRtSCknUp
 5zMQAUvEU2OFLKNx1mbnCv+W51sOkeXIqclEY9XrdBQgtwrBM/Oa1bNhA
 4XKD1QJIvhNdfs+mDn1zx92bVefRYmIUqL0O1pxkVeAnOG096Gl7BVuHv
 qDM18Fm0lC4oO57R8A77XFDii/eKXvxmHQO3j8V6YC5KcvDTK7NEB0RcC w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="335747025"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="335747025"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 16:54:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="707109923"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="707109923"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 16:54:25 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 2/7] drm/i915/huc: Parse the GSC-enabled HuC binary
Date: Wed, 31 May 2023 16:54:10 -0700
Message-Id: <20230531235415.1467475-3-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230531235415.1467475-1-daniele.ceraolospurio@intel.com>
References: <20230531235415.1467475-1-daniele.ceraolospurio@intel.com>
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
Cc: John Harrison <John.C.Harrison@Intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The new binaries that support the 2-step authentication contain the
legacy-style binary, which we can use for loading the HuC via DMA. To
find out where this is located in the image, we need to parse the
manifest of the GSC-enabled HuC binary. The manifest consist of a
partition header followed by entries, one of which contains the offset
we're looking for.
Note that the DG2 GSC binary contains entries with the same names, but
it doesn't contain a full legacy binary, so we need to skip assigning
the dma offset in that case (which we can do by checking the ccs).
Also, since we're now parsing the entries, we can extract the HuC
version that way instead of using hardcoded offsets.

Note that the GSC binary uses the same structures in its binary header,
so they've been added in their own header file.

v2: fix structure names to match meu defines (s/CPT/CPD/), update commit
    message, check ccs validity, drop old version location defines.

v3: drop references to the MEU tool to reduce confusion, fix log (John)

v4: fix log for real (John)

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com> #v2
---
 .../drm/i915/gt/uc/intel_gsc_binary_headers.h |  74 ++++++++++
 drivers/gpu/drm/i915/gt/uc/intel_huc.c        |  11 +-
 drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c     | 136 ++++++++++++++++++
 drivers/gpu/drm/i915/gt/uc/intel_huc_fw.h     |   5 +-
 drivers/gpu/drm/i915/gt/uc/intel_huc_print.h  |  21 +++
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      |  72 +++++-----
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h      |   2 +
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h  |   6 -
 8 files changed, 274 insertions(+), 53 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_binary_headers.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_huc_print.h

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_binary_headers.h b/drivers/gpu/drm/i915/gt/uc/intel_gsc_binary_headers.h
new file mode 100644
index 000000000000..714f0c256118
--- /dev/null
+++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_binary_headers.h
@@ -0,0 +1,74 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _INTEL_GSC_BINARY_HEADERS_H_
+#define _INTEL_GSC_BINARY_HEADERS_H_
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
+struct intel_gsc_version {
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
+	struct intel_gsc_version fw_version;
+	u32 security_version;
+	struct intel_gsc_version meu_kit_version;
+	u32 meu_manifest_version;
+	u8 general_data[4];
+	u8 reserved3[56];
+	u32 modulus_size; /* in dwords */
+	u32 exponent_size; /* in dwords */
+} __packed;
+
+#endif
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
index 268e036f8f28..6d795438b3e4 100644
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
index 534b0aa43316..3a9d81899a78 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
@@ -5,11 +5,147 @@
 
 #include "gt/intel_gsc.h"
 #include "gt/intel_gt.h"
+#include "intel_gsc_binary_headers.h"
 #include "intel_huc.h"
 #include "intel_huc_fw.h"
+#include "intel_huc_print.h"
 #include "i915_drv.h"
 #include "pxp/intel_pxp_huc.h"
 
+static void get_version_from_gsc_manifest(struct intel_uc_fw_ver *ver, const void *data)
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
+		huc_err(huc, "Invalid FW type for GSC header parsing!\n");
+		return -EINVAL;
+	}
+
+	if (size < sizeof(*header)) {
+		huc_err(huc, "FW too small! %zu < %zu\n", size, min_size);
+		return -ENODATA;
+	}
+
+	/*
+	 * The GSC-enabled HuC binary starts with a directory header, followed
+	 * by a series of entries. Each entry is identified by a name and
+	 * points to a specific section of the binary containing the relevant
+	 * data. The entries we're interested in are:
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
+	 * [  intel_gsc_version fw_version                  ]          |
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
+		huc_err(huc, "invalid marker for CPD header: 0x%08x!\n",
+			header->header_marker);
+		return -EINVAL;
+	}
+
+	/* we only have binaries with header v2 and entry v1 for now */
+	if (header->header_version != 2 || header->entry_version != 1) {
+		huc_err(huc, "invalid CPD header/entry version %u:%u!\n",
+			header->header_version, header->entry_version);
+		return -EINVAL;
+	}
+
+	if (header->header_length < sizeof(struct intel_gsc_cpd_header_v2)) {
+		huc_err(huc, "invalid CPD header length %u!\n",
+			header->header_length);
+		return -EINVAL;
+	}
+
+	min_size = header->header_length + sizeof(*entry) * header->num_of_entries;
+	if (size < min_size) {
+		huc_err(huc, "FW too small! %zu < %zu\n", size, min_size);
+		return -ENODATA;
+	}
+
+	entry = data + header->header_length;
+
+	for (i = 0; i < header->num_of_entries; i++, entry++) {
+		if (strcmp(entry->name, "HUCP.man") == 0)
+			get_version_from_gsc_manifest(&huc_fw->file_selected.ver,
+						      data + entry_offset(entry));
+
+		if (strcmp(entry->name, "huc_fw") == 0) {
+			u32 offset = entry_offset(entry);
+
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
index 31776c279f32..ec0b3d214af1 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
@@ -548,33 +548,6 @@ static void __force_fw_fetch_failures(struct intel_uc_fw *uc_fw, int e)
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
@@ -631,22 +604,22 @@ static void guc_read_css_info(struct intel_uc_fw *uc_fw, struct uc_css_header *c
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
@@ -654,7 +627,7 @@ static int check_ccs_header(struct intel_gt *gt,
 	if (unlikely(size != sizeof(struct uc_css_header))) {
 		gt_warn(gt, "%s firmware %s: unexpected header size: %zu != %zu\n",
 			intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path,
-			fw->size, sizeof(struct uc_css_header));
+			fw_size, sizeof(struct uc_css_header));
 		return -EPROTO;
 	}
 
@@ -666,10 +639,10 @@ static int check_ccs_header(struct intel_gt *gt,
 
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
 
@@ -690,6 +663,33 @@ static int check_ccs_header(struct intel_gt *gt,
 	return 0;
 }
 
+static int check_gsc_manifest(struct intel_gt *gt,
+			      const struct firmware *fw,
+			      struct intel_uc_fw *uc_fw)
+{
+	if (uc_fw->type != INTEL_UC_FW_TYPE_HUC) {
+		gt_err(gt, "trying to GSC-parse a non-HuC binary");
+		return -EINVAL;
+	}
+
+	intel_huc_fw_get_binary_info(uc_fw, fw->data, fw->size);
+
+	if (uc_fw->dma_start_offset) {
+		u32 delta = uc_fw->dma_start_offset;
+
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
index 2be9470eb712..b3daba9526eb 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
@@ -118,6 +118,8 @@ struct intel_uc_fw {
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

