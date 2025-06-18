Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7CEADF67F
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 20:57:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB1B710E91F;
	Wed, 18 Jun 2025 18:56:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bRL9TDrC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AB4810E921;
 Wed, 18 Jun 2025 18:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750273017; x=1781809017;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cqOKYY53B9eHRrXZlOhenLfZBd1gdd6WStIFOilJbjk=;
 b=bRL9TDrCsYsAKdp4gE4OSp8RlYnSMQ78xSZtEK6Q+NJJpxcYxFDRtxb5
 pPkWqblvFHk7MZYk8W4f727KkqNbOARroHya2IG/KV4NUmyEywfTvd4dE
 G5zaSmv27yB61wY55vrXyCc1L9Ql4mQR9niyJiEO1HaEEhmIAlxhvej2I
 SKRv3vvPnCZ9HyhJfrVm0T5s6fS/Ifb+Q4PFfJN7SaUEs1nCiU4ALgl41
 xCskeTjgsY02nYJGoGpbISqIySqMVICZccv1pvEp4OxiznvGt8JFlRyQU
 LQ/UYh/NetHrdV31idbpGJnDNQrAzyFsAaBwIuO+FLR+5ZofpwhStnpk7 Q==;
X-CSE-ConnectionGUID: HnK9WDFqQzyrnH7kSBfEwA==
X-CSE-MsgGUID: POqnz6e2S7OL89D7wteJVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52210226"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="52210226"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 11:56:57 -0700
X-CSE-ConnectionGUID: Ht0xyuPQSLqqiUjhTlYwrA==
X-CSE-MsgGUID: 9bEMaxA1Sq2iE1N27MIjbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="153952086"
Received: from unknown (HELO bnilawar-desk2.iind.intel.com) ([10.190.239.41])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 11:56:54 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 alexander.usyskin@intel.com, gregkh@linuxfoundation.org,
 daniele.ceraolospurio@intel.com, jgg@nvidia.com
Subject: [PATCH v3 09/10] drm/xe/xe_late_bind_fw: Extract and print version
 info
Date: Thu, 19 Jun 2025 00:30:06 +0530
Message-Id: <20250618190007.2932322-10-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250618190007.2932322-1-badal.nilawar@intel.com>
References: <20250618190007.2932322-1-badal.nilawar@intel.com>
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

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_late_bind_fw.c       | 132 ++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_late_bind_fw_types.h |   3 +
 drivers/gpu/drm/xe/xe_uc_fw_abi.h          |  69 +++++++++++
 3 files changed, 203 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
index 001e526e569a..f71d5825ac5b 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
@@ -45,6 +45,129 @@ late_bind_to_xe(struct xe_late_bind *late_bind)
 	return container_of(late_bind, struct xe_device, late_bind);
 }
 
+/* Refer to the "Late Bind based Firmware Layout" documentation entry for details */
+static int parse_cpd_header(struct xe_late_bind *late_bind, u32 fw_id,
+			    const void *data, size_t size, const char *manifest_entry)
+{
+	struct xe_device *xe = late_bind_to_xe(late_bind);
+	const struct gsc_cpd_header_v2 *header = data;
+	const struct gsc_manifest_header *manifest;
+	const struct gsc_cpd_entry *entry;
+	size_t min_size = sizeof(*header);
+	struct xe_late_bind_fw *lb_fw;
+	u32 offset;
+	int i;
+
+	if (fw_id >= MAX_FW_ID)
+		return -EINVAL;
+	lb_fw = &late_bind->late_bind_fw[fw_id];
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
+	lb_fw->version.major = manifest->fw_version.major;
+	lb_fw->version.minor = manifest->fw_version.minor;
+	lb_fw->version.hotfix = manifest->fw_version.hotfix;
+	lb_fw->version.build = manifest->fw_version.build;
+
+	return 0;
+}
+
+/* Refer to the "Late Bind based Firmware Layout" documentation entry for details */
+static int parse_lb_layout(struct xe_late_bind *late_bind, u32 fw_id,
+			   const void *data, size_t size, const char *fpt_entry)
+{
+	struct xe_device *xe = late_bind_to_xe(late_bind);
+	const struct csc_fpt_header *header = data;
+	const struct csc_fpt_entry *entry;
+	size_t min_size = sizeof(*header);
+	struct xe_late_bind_fw *lb_fw;
+	u32 offset;
+	int i;
+
+	if (fw_id >= MAX_FW_ID)
+		return -EINVAL;
+
+	lb_fw = &late_bind->late_bind_fw[fw_id];
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
+	/* Look for the manifest first */
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
+	return parse_cpd_header(late_bind, fw_id, data + offset, size - offset, "LTES.man");
+}
+
 static int xe_late_bind_fw_num_fans(struct xe_late_bind *late_bind)
 {
 	struct xe_device *xe = late_bind_to_xe(late_bind);
@@ -185,8 +308,15 @@ static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, u32 fw_id)
 		return -ENODATA;
 	}
 
-	lb_fw->payload_size = fw->size;
+	ret = parse_lb_layout(late_bind, fw_id, fw->data, fw->size, "LTES");
+	if (ret)
+		return ret;
+
+	drm_info(&xe->drm, "Using %s firmware from %s version %d.%d.%d\n",
+		 fw_id_to_name[lb_fw->id], lb_fw->blob_path,
+		 lb_fw->version.major, lb_fw->version.minor, lb_fw->version.hotfix);
 
+	lb_fw->payload_size = fw->size;
 	memcpy(lb_fw->payload, fw->data, lb_fw->payload_size);
 	release_firmware(fw);
 	INIT_WORK(&lb_fw->work, late_bind_work);
diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
index f79f0c0b2c4a..3fc4f350c81f 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
@@ -10,6 +10,7 @@
 #include <linux/mutex.h>
 #include <linux/types.h>
 #include <linux/workqueue.h>
+#include "xe_uc_fw_abi.h"
 
 #define MAX_PAYLOAD_SIZE (1024 * 4)
 
@@ -41,6 +42,8 @@ struct xe_late_bind_fw {
 	size_t payload_size;
 	/** @late_bind_fw.work: worker to upload latebind blob */
 	struct work_struct work;
+	/** @late_bind_fw.version: late binding blob manifest version */
+	struct gsc_version version;
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_uc_fw_abi.h b/drivers/gpu/drm/xe/xe_uc_fw_abi.h
index 87ade41209d0..13da2ca96817 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw_abi.h
+++ b/drivers/gpu/drm/xe/xe_uc_fw_abi.h
@@ -318,4 +318,73 @@ struct gsc_manifest_header {
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
+	u16 fitc_major;
+	u16 fitc_minor;
+	u16 fitc_hotfix;
+	u16 fitc_build;
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

