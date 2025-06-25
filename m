Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2BDAE8AD6
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 18:57:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CE0C10E7AE;
	Wed, 25 Jun 2025 16:57:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="foyELBaU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFF9710E7B4;
 Wed, 25 Jun 2025 16:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750870625; x=1782406625;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=a+F4jxb2dusRnbIqNfNGcCnZXqK4rpiF3HdhFrNqR5M=;
 b=foyELBaUDFSA37PKQlbqT0O3ehU989n8He5PkX//Rvp32/8MDuXPwjfm
 g3eTJvKMv1vNEIV5zLzW0YsjYSf5GLpPK6F70JlPrFHDcvVnq9i+vTNeN
 huLU1TgGLPKawB0S50/vMBuviZP7EHXu+BkT1ar3IoCKEpgX1c60mssJe
 gsvJyh2gKGY0TGjmVDZ+/YoT7KaK0oOvPQTUajHHcgemD7nugB+ZHSdzc
 GfHFCQmRAzxMku8LX3IzhsvEiMnhSU30ZoppyWUlnJSaL+Wjr9D/jIPaV
 xEczjQlWMFFc6HsIyJSSHBcWVSr0JeCk4c5doFycwDjBtACXW05OaGG4i A==;
X-CSE-ConnectionGUID: Doctn0YWQ4OF8IW0Tyojfg==
X-CSE-MsgGUID: UZNLM3iyQByahqNIzjIteQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53214466"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="53214466"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 09:57:04 -0700
X-CSE-ConnectionGUID: keNnEAGvSMCURzU4Xg9rrw==
X-CSE-MsgGUID: BgTuWuyRQBSOctvz6EqQVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="151696733"
Received: from unknown (HELO bnilawar-desk2.iind.intel.com) ([10.190.239.41])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 09:57:02 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 alexander.usyskin@intel.com, gregkh@linuxfoundation.org,
 daniele.ceraolospurio@intel.com
Subject: [PATCH v4 09/10] drm/xe/xe_late_bind_fw: Extract and print version
 info
Date: Wed, 25 Jun 2025 22:30:14 +0530
Message-Id: <20250625170015.33912-10-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250625170015.33912-1-badal.nilawar@intel.com>
References: <20250625170015.33912-1-badal.nilawar@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Extract and print version info of the late binding binary.

v2: Some refinements (Daniele)

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_late_bind_fw.c       | 124 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_late_bind_fw_types.h |   3 +
 drivers/gpu/drm/xe/xe_uc_fw_abi.h          |  66 +++++++++++
 3 files changed, 193 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
index 777f66692d7f..253908794d4a 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
@@ -45,6 +45,121 @@ late_bind_to_xe(struct xe_late_bind *late_bind)
 	return container_of(late_bind, struct xe_device, late_bind);
 }
 
+static struct xe_device *
+late_bind_fw_to_xe(struct xe_late_bind_fw *lb_fw)
+{
+	return container_of(lb_fw, struct xe_device, late_bind.late_bind_fw[lb_fw->id]);
+}
+
+/* Refer to the "Late Bind based Firmware Layout" documentation entry for details */
+static int parse_cpd_header(struct xe_late_bind_fw *lb_fw,
+			    const void *data, size_t size, const char *manifest_entry)
+{
+	struct xe_device *xe = late_bind_fw_to_xe(lb_fw);
+	const struct gsc_cpd_header_v2 *header = data;
+	const struct gsc_manifest_header *manifest;
+	const struct gsc_cpd_entry *entry;
+	size_t min_size = sizeof(*header);
+	u32 offset;
+	int i;
+
+	/* manifest_entry is mandatory */
+	xe_assert(xe, manifest_entry);
+
+	if (size < min_size || header->header_marker != GSC_CPD_HEADER_MARKER)
+		return -ENOENT;
+
+	if (header->header_length < sizeof(struct gsc_cpd_header_v2)) {
+		drm_err(&xe->drm, "%s late binding fw: Invalid CPD header length %u!\n",
+			fw_id_to_name[lb_fw->id], header->header_length);
+		return -EINVAL;
+	}
+
+	min_size = header->header_length + sizeof(struct gsc_cpd_entry) * header->num_of_entries;
+	if (size < min_size) {
+		drm_err(&xe->drm, "%s late binding fw: too small! %zu < %zu\n",
+			fw_id_to_name[lb_fw->id], size, min_size);
+		return -ENODATA;
+	}
+
+	/* Look for the manifest first */
+	entry = (void *)header + header->header_length;
+	for (i = 0; i < header->num_of_entries; i++, entry++)
+		if (strcmp(entry->name, manifest_entry) == 0)
+			offset = entry->offset & GSC_CPD_ENTRY_OFFSET_MASK;
+
+	if (!offset) {
+		drm_err(&xe->drm, "%s late binding fw: Failed to find manifest_entry\n",
+			fw_id_to_name[lb_fw->id]);
+		return -ENODATA;
+	}
+
+	min_size = offset + sizeof(struct gsc_manifest_header);
+	if (size < min_size) {
+		drm_err(&xe->drm, "%s late binding fw: too small! %zu < %zu\n",
+			fw_id_to_name[lb_fw->id], size, min_size);
+		return -ENODATA;
+	}
+
+	manifest = data + offset;
+
+	lb_fw->version = manifest->fw_version;
+
+	return 0;
+}
+
+/* Refer to the "Late Bind based Firmware Layout" documentation entry for details */
+static int parse_lb_layout(struct xe_late_bind_fw *lb_fw,
+			   const void *data, size_t size, const char *fpt_entry)
+{
+	struct xe_device *xe = late_bind_fw_to_xe(lb_fw);
+	const struct csc_fpt_header *header = data;
+	const struct csc_fpt_entry *entry;
+	size_t min_size = sizeof(*header);
+	u32 offset;
+	int i;
+
+	/* fpt_entry is mandatory */
+	xe_assert(xe, fpt_entry);
+
+	if (size < min_size || header->header_marker != CSC_FPT_HEADER_MARKER)
+		return -ENOENT;
+
+	if (header->header_length < sizeof(struct csc_fpt_header)) {
+		drm_err(&xe->drm, "%s late binding fw: Invalid FPT header length %u!\n",
+			fw_id_to_name[lb_fw->id], header->header_length);
+		return -EINVAL;
+	}
+
+	min_size = header->header_length + sizeof(struct csc_fpt_entry) * header->num_of_entries;
+	if (size < min_size) {
+		drm_err(&xe->drm, "%s late binding fw: too small! %zu < %zu\n",
+			fw_id_to_name[lb_fw->id], size, min_size);
+		return -ENODATA;
+	}
+
+	/* Look for the cpd header first */
+	entry = (void *)header + header->header_length;
+	for (i = 0; i < header->num_of_entries; i++, entry++)
+		if (strcmp(entry->name, fpt_entry) == 0)
+			offset = entry->offset;
+
+	if (!offset) {
+		drm_err(&xe->drm, "%s late binding fw: Failed to find fpt_entry\n",
+			fw_id_to_name[lb_fw->id]);
+		return -ENODATA;
+	}
+
+	min_size = offset + sizeof(struct gsc_cpd_header_v2);
+	if (size < min_size) {
+		drm_err(&xe->drm, "%s late binding fw: too small! %zu < %zu\n",
+			fw_id_to_name[lb_fw->id], size, min_size);
+		return -ENODATA;
+	}
+
+	return parse_cpd_header(lb_fw, data + offset, size - offset, "LTES.man");
+}
+
 static const char *xe_late_bind_parse_status(uint32_t status)
 {
 	switch (status) {
@@ -217,6 +332,10 @@ static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, u32 fw_id)
 		return -ENODATA;
 	}
 
+	ret = parse_lb_layout(lb_fw, fw->data, fw->size, "LTES");
+	if (ret)
+		return ret;
+
 	lb_fw->payload = drmm_kzalloc(&xe->drm, lb_fw->payload_size, GFP_KERNEL);
 	if (!lb_fw->payload) {
 		release_firmware(fw);
@@ -225,6 +344,11 @@ static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, u32 fw_id)
 
 	lb_fw->payload_size = fw->size;
 
+	drm_info(&xe->drm, "Using %s firmware from %s version %u.%u.%u.%u\n",
+		 fw_id_to_name[lb_fw->id], lb_fw->blob_path,
+		 lb_fw->version.major, lb_fw->version.minor,
+		 lb_fw->version.hotfix, lb_fw->version.build);
+
 	memcpy(lb_fw->payload, fw->data, lb_fw->payload_size);
 	release_firmware(fw);
 	INIT_WORK(&lb_fw->work, xe_late_bind_work);
diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
index 16f2bd6bbdf1..7f98a1380844 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
@@ -10,6 +10,7 @@
 #include <linux/mutex.h>
 #include <linux/types.h>
 #include <linux/workqueue.h>
+#include "xe_uc_fw_abi.h"
 
 #define MAX_PAYLOAD_SIZE SZ_4K
 
@@ -41,6 +42,8 @@ struct xe_late_bind_fw {
 	size_t payload_size;
 	/** @late_bind_fw.work: worker to upload latebind blob */
 	struct work_struct work;
+	/** @late_bind_fw.version: late binding blob manifest version */
+	struct gsc_version version;
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_uc_fw_abi.h b/drivers/gpu/drm/xe/xe_uc_fw_abi.h
index 87ade41209d0..78782d105fa9 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw_abi.h
+++ b/drivers/gpu/drm/xe/xe_uc_fw_abi.h
@@ -318,4 +318,70 @@ struct gsc_manifest_header {
 	u32 exponent_size; /* in dwords */
 } __packed;
 
+/**
+ * DOC: Late binding Firmware Layout
+ *
+ * The Late binding binary starts with FPT header, which contains locations
+ * of various partitions of the binary. Here we're interested in finding out
+ * manifest version. To the manifest version, we need to locate CPD header
+ * one of the entry in CPD header points to manifest header. Manifest header
+ * contains the version.
+ *
+ *      +================================================+
+ *      |  FPT Header                                    |
+ *      +================================================+
+ *      |  FPT entries[]                                 |
+ *      |      entry1                                    |
+ *      |      ...                                       |
+ *      |      entryX                                    |
+ *      |          "LTES"                                |
+ *      |          ...                                   |
+ *      |          offset  >-----------------------------|------o
+ *      +================================================+      |
+ *                                                              |
+ *      +================================================+      |
+ *      |  CPD Header                                    |<-----o
+ *      +================================================+
+ *      |  CPD entries[]                                 |
+ *      |      entry1                                    |
+ *      |      ...                                       |
+ *      |      entryX                                    |
+ *      |          "LTES.man"                            |
+ *      |           ...                                  |
+ *      |           offset  >----------------------------|------o
+ *      +================================================+      |
+ *                                                              |
+ *      +================================================+      |
+ *      |  Manifest Header                               |<-----o
+ *      |      ...                                       |
+ *      |      FW version                                |
+ *      |      ...                                       |
+ *      +================================================+
+ */
+
+/* FPT Headers */
+struct csc_fpt_header {
+	u32 header_marker;
+#define CSC_FPT_HEADER_MARKER 0x54504624
+	u32 num_of_entries;
+	u8 header_version;
+	u8 entry_version;
+	u8 header_length; /* in bytes */
+	u8 flags;
+	u16 ticks_to_add;
+	u16 tokens_to_add;
+	u32 uma_size;
+	u32 crc32;
+	struct gsc_version fitc_version;
+} __packed;
+
+struct csc_fpt_entry {
+	u8 name[4]; /* partition name */
+	u32 reserved1;
+	u32 offset; /* offset from beginning of CSE region */
+	u32 length; /* partition length in bytes */
+	u32 reserved2[3];
+	u32 partition_flags;
+} __packed;
+
 #endif
-- 
2.34.1

