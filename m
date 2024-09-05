Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C9A96DEE6
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 17:52:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87AB010E83E;
	Thu,  5 Sep 2024 15:51:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2E6AC10E83E
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2024 15:51:59 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4AA15FEC;
 Thu,  5 Sep 2024 08:52:25 -0700 (PDT)
Received: from e112269-lin.cambridge.arm.com (e112269-lin.cambridge.arm.com
 [10.1.194.64])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CE5823F73B;
 Thu,  5 Sep 2024 08:51:57 -0700 (PDT)
From: Steven Price <steven.price@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>
Cc: Steven Price <steven.price@arm.com>, dri-devel@lists.freedesktop.org,
 Christopher Healy <healych@amazon.com>
Subject: [PATCH] drm/panthor: Display FW version information
Date: Thu,  5 Sep 2024 16:51:44 +0100
Message-Id: <20240905155144.75416-1-steven.price@arm.com>
X-Mailer: git-send-email 2.39.2
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

The firmware binary has a git SHA embedded into it which can be used to
identify which firmware binary is being loaded. Output this as a
drm_info() so that it's obvious from a dmesg log which firmware binary
is being used.

Signed-off-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panthor/panthor_fw.c | 55 ++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index 857f3f11258a..ef007287575c 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -78,6 +78,12 @@ enum panthor_fw_binary_entry_type {
 
 	/** @CSF_FW_BINARY_ENTRY_TYPE_TIMELINE_METADATA: Timeline metadata interface. */
 	CSF_FW_BINARY_ENTRY_TYPE_TIMELINE_METADATA = 4,
+
+	/**
+	 * @CSF_FW_BINARY_ENTRY_TYPE_BUILD_INFO_METADATA: Metadata about how
+	 * the FW binary was built.
+	 */
+	CSF_FW_BINARY_ENTRY_TYPE_BUILD_INFO_METADATA = 6
 };
 
 #define CSF_FW_BINARY_ENTRY_TYPE(ehdr)					((ehdr) & 0xff)
@@ -132,6 +138,13 @@ struct panthor_fw_binary_section_entry_hdr {
 	} data;
 };
 
+struct panthor_fw_build_info_hdr {
+	/** @meta_start: Offset of the build info data in the FW binary */
+	u32 meta_start;
+	/** @meta_size: Size of the build info data in the FW binary */
+	u32 meta_size;
+};
+
 /**
  * struct panthor_fw_binary_iter - Firmware binary iterator
  *
@@ -628,6 +641,46 @@ static int panthor_fw_load_section_entry(struct panthor_device *ptdev,
 	return 0;
 }
 
+static int panthor_fw_read_build_info(struct panthor_device *ptdev,
+				      const struct firmware *fw,
+				      struct panthor_fw_binary_iter *iter,
+				      u32 ehdr)
+{
+	struct panthor_fw_build_info_hdr hdr;
+	char header[9];
+	const char git_sha_header[sizeof(header)] = "git_sha: ";
+	int ret;
+
+	ret = panthor_fw_binary_iter_read(ptdev, iter, &hdr, sizeof(hdr));
+	if (ret)
+		return ret;
+
+	if (hdr.meta_start > fw->size ||
+	    hdr.meta_start + hdr.meta_size > fw->size) {
+		drm_err(&ptdev->base, "Firmware build info corrupt\n");
+		/* We don't need the build info, so continue */
+		return 0;
+	}
+
+	if (memcmp(git_sha_header, fw->data + hdr.meta_start,
+	    sizeof(git_sha_header))) {
+		/* Not the expected header, this isn't metadata we understand */
+		return 0;
+	}
+
+	/* Check that the git SHA is NULL terminated as expected */
+	if (fw->data[hdr.meta_start + hdr.meta_size - 1] != '\0') {
+		drm_warn(&ptdev->base, "Firmware's git sha is not NULL terminated\n");
+		/* Don't treat as fatal */
+		return 0;
+	}
+
+	drm_info(&ptdev->base, "Firmware git sha: %s\n",
+		 fw->data + hdr.meta_start + sizeof(git_sha_header));
+
+	return 0;
+}
+
 static void
 panthor_reload_fw_sections(struct panthor_device *ptdev, bool full_reload)
 {
@@ -672,6 +725,8 @@ static int panthor_fw_load_entry(struct panthor_device *ptdev,
 	switch (CSF_FW_BINARY_ENTRY_TYPE(ehdr)) {
 	case CSF_FW_BINARY_ENTRY_TYPE_IFACE:
 		return panthor_fw_load_section_entry(ptdev, fw, &eiter, ehdr);
+	case CSF_FW_BINARY_ENTRY_TYPE_BUILD_INFO_METADATA:
+		return panthor_fw_read_build_info(ptdev, fw, &eiter, ehdr);
 
 	/* FIXME: handle those entry types? */
 	case CSF_FW_BINARY_ENTRY_TYPE_CONFIG:
-- 
2.39.2

