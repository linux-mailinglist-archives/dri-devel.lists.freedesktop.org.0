Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5901D98AD63
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 21:53:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE9BE10E2FB;
	Mon, 30 Sep 2024 19:53:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VqmKcsnz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1C5210E2FC
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 19:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727726014; x=1759262014;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CzeGdp5YaBFKteo87hnvwL209X+7PhbViGxTThbWnNA=;
 b=VqmKcsnznl8ivAaSgCB5Qjc8v4R7IOVEW55Ca5+3w0SYB/P7u4tNRzU0
 0ldhfij6uJvNVWWwNJgXwNBN53vtwd4axrIbNT8H/GuIN1MKRSeMUH013
 JyDcCbr7UnS9xlEezC3chFXRzCBzRg226FZH9KI700lM14maU9cX/40zP
 r/3zaq1zRKYzemGG24Pe0e0RdenSAbAEQmsrsBpxv/5NgQ2qDfO8oqVR1
 NV0Oj5spGYiSX1WMSJ9Tc+JpbQ6fo8fClOfCrJ+knyF4AeRLkQUfwKv8O
 A+ydngg2V+GDjNVID8fpPuUcGo7rEhY1AX6Kpj77MJFcHEVI2knEk/SCo g==;
X-CSE-ConnectionGUID: S1F1HxU6Tku8nDW8bCvTBA==
X-CSE-MsgGUID: 2O+Npef7T/adaxXiIB9Zsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="26962299"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="26962299"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 12:53:34 -0700
X-CSE-ConnectionGUID: z16PP+ZZRkeztetYyDLKSA==
X-CSE-MsgGUID: TsbSKUgqRXaUe7t6LqFxpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="73369991"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 12:53:32 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH v2 05/31] accel/ivpu: Fix fw log printing
Date: Mon, 30 Sep 2024 21:52:56 +0200
Message-ID: <20240930195322.461209-6-jacek.lawrynowicz@linux.intel.com>
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

  - Fix empty log detection that couldn't work without read_wrap_count
  - Start printing wrapped log from correct position (log_start)
  - Properly handle logs that are wrapped multiple times in reference
    to reader position
  - Don't add a newline when log buffer is wrapped
  - Always add a newline after printing a log buffer in case log does
    not end with one

Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_fw_log.c | 49 +++++++++++++++++++++-----------
 1 file changed, 32 insertions(+), 17 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_fw_log.c b/drivers/accel/ivpu/ivpu_fw_log.c
index 343ebfd30d280..337c906b02107 100644
--- a/drivers/accel/ivpu/ivpu_fw_log.c
+++ b/drivers/accel/ivpu/ivpu_fw_log.c
@@ -87,7 +87,7 @@ static void fw_log_print_lines(char *buffer, u32 size, struct drm_printer *p)
 	}
 	line[index] = 0;
 	if (index != 0)
-		drm_printf(p, "%s\n", line);
+		drm_printf(p, "%s", line);
 }
 
 static void fw_log_print_buffer(struct vpu_tracing_buffer_header *log, const char *prefix,
@@ -95,23 +95,29 @@ static void fw_log_print_buffer(struct vpu_tracing_buffer_header *log, const cha
 {
 	char *log_data = (void *)log + log->header_size;
 	u32 data_size = log->size - log->header_size;
-	u32 log_start = log->read_index;
-	u32 log_end = log->write_index;
+	u32 log_start = only_new_msgs ? READ_ONCE(log->read_index) : 0;
+	u32 log_end = READ_ONCE(log->write_index);
 
-	if (!(log->write_index || log->wrap_count) ||
-	    (log->write_index == log->read_index && only_new_msgs)) {
-		drm_printf(p, "==== %s \"%s\" log empty ====\n", prefix, log->name);
-		return;
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
+	if (log_end > log_start) {
 		fw_log_print_lines(log_data + log_start, log_end - log_start, p);
 	} else {
-		fw_log_print_lines(log_data + log_end, data_size - log_end, p);
+		fw_log_print_lines(log_data + log_start, data_size - log_start, p);
 		fw_log_print_lines(log_data, log_end, p);
 	}
-	drm_printf(p, "\x1b[0m");
+	drm_printf(p, "\n\x1b[0m"); /* add new line and clear formatting */
 	drm_printf(p, "==== %s \"%s\" log end   ====\n", prefix, log->name);
 }
 
@@ -135,14 +141,19 @@ void ivpu_fw_log_print(struct ivpu_device *vdev, bool only_new_msgs, struct drm_
 void ivpu_fw_log_mark_read(struct ivpu_device *vdev)
 {
 	struct vpu_tracing_buffer_header *log;
-	u32 next = 0;
+	u32 next;
 
-	while (fw_log_from_bo(vdev, vdev->fw->mem_log_crit, &next, &log) == 0)
-		log->read_index = log->write_index;
+	next = 0;
+	while (fw_log_from_bo(vdev, vdev->fw->mem_log_crit, &next, &log) == 0) {
+		log->read_index = READ_ONCE(log->write_index);
+		log->read_wrap_count = READ_ONCE(log->wrap_count);
+	}
 
 	next = 0;
-	while (fw_log_from_bo(vdev, vdev->fw->mem_log_verb, &next, &log) == 0)
-		log->read_index = log->write_index;
+	while (fw_log_from_bo(vdev, vdev->fw->mem_log_verb, &next, &log) == 0) {
+		log->read_index = READ_ONCE(log->write_index);
+		log->read_wrap_count = READ_ONCE(log->wrap_count);
+	}
 }
 
 void ivpu_fw_log_reset(struct ivpu_device *vdev)
@@ -151,10 +162,14 @@ void ivpu_fw_log_reset(struct ivpu_device *vdev)
 	u32 next;
 
 	next = 0;
-	while (fw_log_from_bo(vdev, vdev->fw->mem_log_crit, &next, &log) == 0)
+	while (fw_log_from_bo(vdev, vdev->fw->mem_log_crit, &next, &log) == 0) {
 		log->read_index = 0;
+		log->read_wrap_count = 0;
+	}
 
 	next = 0;
-	while (fw_log_from_bo(vdev, vdev->fw->mem_log_verb, &next, &log) == 0)
+	while (fw_log_from_bo(vdev, vdev->fw->mem_log_verb, &next, &log) == 0) {
 		log->read_index = 0;
+		log->read_wrap_count = 0;
+	}
 }
-- 
2.45.1

