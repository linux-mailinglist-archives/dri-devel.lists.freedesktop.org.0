Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2524B98AD61
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 21:53:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A925210E57F;
	Mon, 30 Sep 2024 19:53:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lDK6o8xG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6435010E2FC
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 19:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727726013; x=1759262013;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=43My5GdB1N3fzsX2G7T0zdDtQ+1ig0CY6yeL6UKaGnQ=;
 b=lDK6o8xGzmFcljAGfb8ffHeJlG7VJetPdtOKdVeWtU/klw2sXy7ZfhFw
 2XoGEBrrDRamhThDLl2upAwB/imht40DNeyQkYi6q3h39QmWgwv7Kszs3
 INFPh7EBpTgIjkWPlBVW2ZR3kUZUSSXsUR9nqNqplolCEdC3Tjwpis77x
 AFzglYkkO5MuHlypT3vk80IHbBlNMQm4qgykL2zXnn63ghFlDetr1WtHb
 U8c4AkAk77neqzs2YSnpJD2jpLo7CuH/Tu0CTZRUITdBojvdstt8I/Q3j
 Qg4aWIoVAthiluKxP1w7A25CyHqQopBTwkbNHINVHct00NoD/hK1PZNWe A==;
X-CSE-ConnectionGUID: fhkqNcWCRxq0W2VwFRmwbg==
X-CSE-MsgGUID: T6nnUpvcTXy247v8fYBANw==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="26962296"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="26962296"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 12:53:33 -0700
X-CSE-ConnectionGUID: Ivqbl6ofSx+qCjUjKPGr5w==
X-CSE-MsgGUID: aZhBrQKjTVC/KkrN83N46g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="73369990"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 12:53:31 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>
Subject: [PATCH v2 04/31] accel/ivpu: Refactor functions in ivpu_fw_log.c
Date: Mon, 30 Sep 2024 21:52:55 +0200
Message-ID: <20240930195322.461209-5-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240930195322.461209-1-jacek.lawrynowicz@linux.intel.com>
References: <20240930195322.461209-1-jacek.lawrynowicz@linux.intel.com>
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

Make function names more consistent and (arguably) readable in
fw log code. Add fw_log_print_all_in_bo() that remove duplicated code in
ivpu_fw_log_print().

Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Reviewed-by: Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>
---
 drivers/accel/ivpu/ivpu_debugfs.c |  2 +-
 drivers/accel/ivpu/ivpu_fw_log.c  | 62 ++++++++++++++++---------------
 drivers/accel/ivpu/ivpu_fw_log.h  |  2 +-
 3 files changed, 35 insertions(+), 31 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_debugfs.c b/drivers/accel/ivpu/ivpu_debugfs.c
index 6f86f8df30db0..cd3ac08f0409a 100644
--- a/drivers/accel/ivpu/ivpu_debugfs.c
+++ b/drivers/accel/ivpu/ivpu_debugfs.c
@@ -192,7 +192,7 @@ fw_log_fops_write(struct file *file, const char __user *user_buf, size_t size, l
 	if (!size)
 		return -EINVAL;
 
-	ivpu_fw_log_clear(vdev);
+	ivpu_fw_log_mark_read(vdev);
 	return size;
 }
 
diff --git a/drivers/accel/ivpu/ivpu_fw_log.c b/drivers/accel/ivpu/ivpu_fw_log.c
index 817210e35f70e..343ebfd30d280 100644
--- a/drivers/accel/ivpu/ivpu_fw_log.c
+++ b/drivers/accel/ivpu/ivpu_fw_log.c
@@ -26,8 +26,8 @@ MODULE_PARM_DESC(fw_log_level,
 		 " error=" __stringify(IVPU_FW_LOG_ERROR)
 		 " fatal=" __stringify(IVPU_FW_LOG_FATAL));
 
-static int fw_log_ptr(struct ivpu_device *vdev, struct ivpu_bo *bo, u32 *offset,
-		      struct vpu_tracing_buffer_header **log_header)
+static int fw_log_from_bo(struct ivpu_device *vdev, struct ivpu_bo *bo, u32 *offset,
+			  struct vpu_tracing_buffer_header **out_log)
 {
 	struct vpu_tracing_buffer_header *log;
 
@@ -48,7 +48,7 @@ static int fw_log_ptr(struct ivpu_device *vdev, struct ivpu_bo *bo, u32 *offset,
 		return -EINVAL;
 	}
 
-	*log_header = log;
+	*out_log = log;
 	*offset += log->size;
 
 	ivpu_dbg(vdev, FW_BOOT,
@@ -59,7 +59,7 @@ static int fw_log_ptr(struct ivpu_device *vdev, struct ivpu_bo *bo, u32 *offset,
 	return 0;
 }
 
-static void buffer_print(char *buffer, u32 size, struct drm_printer *p)
+static void fw_log_print_lines(char *buffer, u32 size, struct drm_printer *p)
 {
 	char line[IVPU_FW_LOG_LINE_LENGTH];
 	u32 index = 0;
@@ -90,11 +90,11 @@ static void buffer_print(char *buffer, u32 size, struct drm_printer *p)
 		drm_printf(p, "%s\n", line);
 }
 
-static void fw_log_print_buffer(struct ivpu_device *vdev, struct vpu_tracing_buffer_header *log,
-				const char *prefix, bool only_new_msgs, struct drm_printer *p)
+static void fw_log_print_buffer(struct vpu_tracing_buffer_header *log, const char *prefix,
+				bool only_new_msgs, struct drm_printer *p)
 {
-	char *log_buffer = (void *)log + log->header_size;
-	u32 log_size = log->size - log->header_size;
+	char *log_data = (void *)log + log->header_size;
+	u32 data_size = log->size - log->header_size;
 	u32 log_start = log->read_index;
 	u32 log_end = log->write_index;
 
@@ -106,51 +106,55 @@ static void fw_log_print_buffer(struct ivpu_device *vdev, struct vpu_tracing_buf
 
 	drm_printf(p, "==== %s \"%s\" log start ====\n", prefix, log->name);
 	if (log->write_index > log->read_index) {
-		buffer_print(log_buffer + log_start, log_end - log_start, p);
+		fw_log_print_lines(log_data + log_start, log_end - log_start, p);
 	} else {
-		buffer_print(log_buffer + log_end, log_size - log_end, p);
-		buffer_print(log_buffer, log_end, p);
+		fw_log_print_lines(log_data + log_end, data_size - log_end, p);
+		fw_log_print_lines(log_data, log_end, p);
 	}
 	drm_printf(p, "\x1b[0m");
 	drm_printf(p, "==== %s \"%s\" log end   ====\n", prefix, log->name);
 }
 
-void ivpu_fw_log_print(struct ivpu_device *vdev, bool only_new_msgs, struct drm_printer *p)
+static void
+fw_log_print_all_in_bo(struct ivpu_device *vdev, const char *name,
+		       struct ivpu_bo *bo, bool only_new_msgs, struct drm_printer *p)
 {
-	struct vpu_tracing_buffer_header *log_header;
+	struct vpu_tracing_buffer_header *log;
 	u32 next = 0;
 
-	while (fw_log_ptr(vdev, vdev->fw->mem_log_crit, &next, &log_header) == 0)
-		fw_log_print_buffer(vdev, log_header, "NPU critical", only_new_msgs, p);
+	while (fw_log_from_bo(vdev, bo, &next, &log) == 0)
+		fw_log_print_buffer(log, name, only_new_msgs, p);
+}
 
-	next = 0;
-	while (fw_log_ptr(vdev, vdev->fw->mem_log_verb, &next, &log_header) == 0)
-		fw_log_print_buffer(vdev, log_header, "NPU verbose", only_new_msgs, p);
+void ivpu_fw_log_print(struct ivpu_device *vdev, bool only_new_msgs, struct drm_printer *p)
+{
+	fw_log_print_all_in_bo(vdev, "NPU critical", vdev->fw->mem_log_crit, only_new_msgs, p);
+	fw_log_print_all_in_bo(vdev, "NPU verbose", vdev->fw->mem_log_verb, only_new_msgs, p);
 }
 
-void ivpu_fw_log_clear(struct ivpu_device *vdev)
+void ivpu_fw_log_mark_read(struct ivpu_device *vdev)
 {
-	struct vpu_tracing_buffer_header *log_header;
+	struct vpu_tracing_buffer_header *log;
 	u32 next = 0;
 
-	while (fw_log_ptr(vdev, vdev->fw->mem_log_crit, &next, &log_header) == 0)
-		log_header->read_index = log_header->write_index;
+	while (fw_log_from_bo(vdev, vdev->fw->mem_log_crit, &next, &log) == 0)
+		log->read_index = log->write_index;
 
 	next = 0;
-	while (fw_log_ptr(vdev, vdev->fw->mem_log_verb, &next, &log_header) == 0)
-		log_header->read_index = log_header->write_index;
+	while (fw_log_from_bo(vdev, vdev->fw->mem_log_verb, &next, &log) == 0)
+		log->read_index = log->write_index;
 }
 
 void ivpu_fw_log_reset(struct ivpu_device *vdev)
 {
-	struct vpu_tracing_buffer_header *log_header;
+	struct vpu_tracing_buffer_header *log;
 	u32 next;
 
 	next = 0;
-	while (fw_log_ptr(vdev, vdev->fw->mem_log_crit, &next, &log_header) == 0)
-		log_header->read_index = 0;
+	while (fw_log_from_bo(vdev, vdev->fw->mem_log_crit, &next, &log) == 0)
+		log->read_index = 0;
 
 	next = 0;
-	while (fw_log_ptr(vdev, vdev->fw->mem_log_verb, &next, &log_header) == 0)
-		log_header->read_index = 0;
+	while (fw_log_from_bo(vdev, vdev->fw->mem_log_verb, &next, &log) == 0)
+		log->read_index = 0;
 }
diff --git a/drivers/accel/ivpu/ivpu_fw_log.h b/drivers/accel/ivpu/ivpu_fw_log.h
index a033ce2d642f6..41c85b74cc7fd 100644
--- a/drivers/accel/ivpu/ivpu_fw_log.h
+++ b/drivers/accel/ivpu/ivpu_fw_log.h
@@ -26,7 +26,7 @@
 extern unsigned int ivpu_fw_log_level;
 
 void ivpu_fw_log_print(struct ivpu_device *vdev, bool only_new_msgs, struct drm_printer *p);
-void ivpu_fw_log_clear(struct ivpu_device *vdev);
+void ivpu_fw_log_mark_read(struct ivpu_device *vdev);
 void ivpu_fw_log_reset(struct ivpu_device *vdev);
 
 static inline void ivpu_fw_log_dump(struct ivpu_device *vdev)
-- 
2.45.1

