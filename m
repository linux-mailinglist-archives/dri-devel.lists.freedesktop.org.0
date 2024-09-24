Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C777984023
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 10:18:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 058B610E658;
	Tue, 24 Sep 2024 08:18:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BL9KDc9z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6733510E650
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 08:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727165892; x=1758701892;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YdjCfM66Byqg/mm0u5THF7Wj0IG5+Ti0LyIfItO05/o=;
 b=BL9KDc9zAfFg+lB4nuQ4h8SDazG69oBn/Tn0ac3aoRJOpTKDxOWqA5Bv
 6dVB3ocUT5BWLwHoanEilLpKj/JS81NqDO0leLIVO7S9FoMAxHHkcIQiy
 2kRv6/4Pm8IfeTtDZJR59RfugXssRntLj+s4Kt7cygFyVcCo+YTxWXX46
 u7qA5nIh1U5Fx6FThNYDn76+f1+Ri15GJj9IJzp9CWPKKrTz0SubX1/0h
 x9mWpOIGVByUxhyqJFnz0wILNhhWs0Y9VAbE2Q3TyS9p4f4tcfyNEFr7a
 HN7gJzXIFXLBZXEjjriwZPJGwrMmT1Xi+M+Luew9JXkUN0A342aYNj7rY g==;
X-CSE-ConnectionGUID: 0kUJPYs1SmO0LfReC5KZEg==
X-CSE-MsgGUID: 9z4XgmBxSqG02q8NrQja7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="37506893"
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; d="scan'208";a="37506893"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 01:18:12 -0700
X-CSE-ConnectionGUID: tZitezLTSrG5TImsxma1xA==
X-CSE-MsgGUID: Z0eEDWMcT26ZoZ/lsvqQXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; d="scan'208";a="102170608"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 01:18:11 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>
Subject: [PATCH 04/29] accel/ivpu: Refactor FW log
Date: Tue, 24 Sep 2024 10:17:29 +0200
Message-ID: <20240924081754.209728-5-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240924081754.209728-1-jacek.lawrynowicz@linux.intel.com>
References: <20240924081754.209728-1-jacek.lawrynowicz@linux.intel.com>
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

  - use read_wrap_count from new FW Boot API
  - fix logic issues in fw_log_print_buffer
  - remove unused functions/structures
  - rename some of the functions for better readability

Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Reviewed-by: Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>
---
 drivers/accel/ivpu/ivpu_debugfs.c |   2 +-
 drivers/accel/ivpu/ivpu_fw_log.c  | 100 ++++++++++++++++++------------
 drivers/accel/ivpu/ivpu_fw_log.h  |   2 +-
 3 files changed, 62 insertions(+), 42 deletions(-)

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
index 817210e35f70e..dd1d39469fd09 100644
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
@@ -87,70 +87,90 @@ static void buffer_print(char *buffer, u32 size, struct drm_printer *p)
 	}
 	line[index] = 0;
 	if (index != 0)
-		drm_printf(p, "%s\n", line);
+		drm_printf(p, "%s", line);
 }
 
-static void fw_log_print_buffer(struct ivpu_device *vdev, struct vpu_tracing_buffer_header *log,
-				const char *prefix, bool only_new_msgs, struct drm_printer *p)
+static void fw_log_print_buffer(struct vpu_tracing_buffer_header *log, const char *prefix,
+				bool only_new_msgs, struct drm_printer *p)
 {
-	char *log_buffer = (void *)log + log->header_size;
-	u32 log_size = log->size - log->header_size;
-	u32 log_start = log->read_index;
-	u32 log_end = log->write_index;
-
-	if (!(log->write_index || log->wrap_count) ||
-	    (log->write_index == log->read_index && only_new_msgs)) {
-		drm_printf(p, "==== %s \"%s\" log empty ====\n", prefix, log->name);
-		return;
+	char *log_data = (void *)log + log->header_size;
+	u32 data_size = log->size - log->header_size;
+	u32 log_end = READ_ONCE(log->write_index);
+	u32 log_start = only_new_msgs ? READ_ONCE(log->read_index) : 0;
+
+	if (log->wrap_count == log->read_wrap_count) {
+		if (log_end <= log_start) {
+			drm_printf(p, "==== %s \"%s\" log empty ====\n", prefix, log->name);
+			return;
+		}
+	} else if (log->wrap_count == log->read_wrap_count + 1) {
+		if (log_end > log_start)
+			log_start = log_end;
+	} else {
+		log_start = log_end;
 	}
 
 	drm_printf(p, "==== %s \"%s\" log start ====\n", prefix, log->name);
-	if (log->write_index > log->read_index) {
-		buffer_print(log_buffer + log_start, log_end - log_start, p);
+	if (log_end > log_start) {
+		fw_log_print_lines(log_data + log_start, log_end - log_start, p);
 	} else {
-		buffer_print(log_buffer + log_end, log_size - log_end, p);
-		buffer_print(log_buffer, log_end, p);
+		fw_log_print_lines(log_data + log_start, data_size - log_start, p);
+		fw_log_print_lines(log_data, log_end, p);
 	}
-	drm_printf(p, "\x1b[0m");
+	drm_printf(p, "\n\x1b[0m"); /* add new line and clear formatting */
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
-	u32 next = 0;
+	struct vpu_tracing_buffer_header *log;
+	u32 next;
 
-	while (fw_log_ptr(vdev, vdev->fw->mem_log_crit, &next, &log_header) == 0)
-		log_header->read_index = log_header->write_index;
+	next = 0;
+	while (fw_log_from_bo(vdev, vdev->fw->mem_log_crit, &next, &log) == 0) {
+		log->read_index = READ_ONCE(log->write_index);
+		log->read_wrap_count = READ_ONCE(log->wrap_count);
+	}
 
 	next = 0;
-	while (fw_log_ptr(vdev, vdev->fw->mem_log_verb, &next, &log_header) == 0)
-		log_header->read_index = log_header->write_index;
+	while (fw_log_from_bo(vdev, vdev->fw->mem_log_verb, &next, &log) == 0) {
+		log->read_index = READ_ONCE(log->write_index);
+		log->read_wrap_count = READ_ONCE(log->wrap_count);
+	}
 }
 
 void ivpu_fw_log_reset(struct ivpu_device *vdev)
 {
-	struct vpu_tracing_buffer_header *log_header;
+	struct vpu_tracing_buffer_header *log;
 	u32 next;
 
 	next = 0;
-	while (fw_log_ptr(vdev, vdev->fw->mem_log_crit, &next, &log_header) == 0)
-		log_header->read_index = 0;
+	while (fw_log_from_bo(vdev, vdev->fw->mem_log_crit, &next, &log) == 0) {
+		log->read_index = 0;
+		log->read_wrap_count = 0;
+	}
 
 	next = 0;
-	while (fw_log_ptr(vdev, vdev->fw->mem_log_verb, &next, &log_header) == 0)
-		log_header->read_index = 0;
+	while (fw_log_from_bo(vdev, vdev->fw->mem_log_verb, &next, &log) == 0) {
+		log->read_index = 0;
+		log->read_wrap_count = 0;
+	}
 }
+
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

