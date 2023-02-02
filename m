Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C5A6878A5
	for <lists+dri-devel@lfdr.de>; Thu,  2 Feb 2023 10:21:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA9A110E1D8;
	Thu,  2 Feb 2023 09:21:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4A4210E13E
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Feb 2023 09:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675329700; x=1706865700;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fdkmNITYpjOEgbANJGmXEI77B+IrubbCWlmr77KaeGQ=;
 b=M4cYOeSd6jNn7/GoDaWBAfKLufQUTTVzsjEk0oQZiIvpkHYDUd4ev9vC
 EoOjONykpIO1Bktbsrlrm0bgPeIdWZr1NtiCXFaogTJhLpApQEBN01w9U
 gMqV9LOqw19zfVxWRWyeEwvUvUkdu4ZoKKzCQiQkrlfI1+GBvwOYtWPkb
 Q82hYE4cm5bz8Gjp+fUs22YGkHyO+LK571MuWje7pwK26ZUGPKGeBBseJ
 1eCqZLHd9zbeRbJleBoxJNggpyZiuWHMTwzwWT0sae8AnC4AALngFaVKi
 6r/6JheNHsc3EA0qfSs1LJqxYsObSVTsQaTQQV4b+CfbaNrdE8YS6uLao w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="390791419"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; d="scan'208";a="390791419"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 01:21:40 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="665216044"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; d="scan'208";a="665216044"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 01:21:38 -0800
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/4] accel/ivpu: Fix FW API data alignment issues
Date: Thu,  2 Feb 2023 10:21:11 +0100
Message-Id: <20230202092114.2637452-2-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230202092114.2637452-1-stanislaw.gruszka@linux.intel.com>
References: <20230202092114.2637452-1-stanislaw.gruszka@linux.intel.com>
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
Cc: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>

FW API structures have been updated to fix misaligned
structure members.

Also changed JSM message header format to account for
future improvements.

Added explicit check for minimum supported JSM API version.

Signed-off-by: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_fw.c     | 37 +++++++++++-------
 drivers/accel/ivpu/ivpu_job.c    |  5 ++-
 drivers/accel/ivpu/vpu_jsm_api.h | 67 ++++++++++++++++++--------------
 3 files changed, 65 insertions(+), 44 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_fw.c b/drivers/accel/ivpu/ivpu_fw.c
index b463c24adb70..f58951a0d81b 100644
--- a/drivers/accel/ivpu/ivpu_fw.c
+++ b/drivers/accel/ivpu/ivpu_fw.c
@@ -32,10 +32,11 @@
 
 #define ADDR_TO_L2_CACHE_CFG(addr) ((addr) >> 31)
 
-#define IVPU_FW_CHECK_API(vdev, fw_hdr, name) ivpu_fw_check_api(vdev, fw_hdr, #name, \
-								  VPU_##name##_API_VER_INDEX, \
-								  VPU_##name##_API_VER_MAJOR, \
-								  VPU_##name##_API_VER_MINOR)
+#define IVPU_FW_CHECK_API(vdev, fw_hdr, name, min_major) \
+	ivpu_fw_check_api(vdev, fw_hdr, #name, \
+			  VPU_##name##_API_VER_INDEX, \
+			  VPU_##name##_API_VER_MAJOR, \
+			  VPU_##name##_API_VER_MINOR, min_major)
 
 static char *ivpu_firmware;
 module_param_named_unsafe(firmware, ivpu_firmware, charp, 0644);
@@ -63,19 +64,27 @@ static int ivpu_fw_request(struct ivpu_device *vdev)
 	return ret;
 }
 
-static void
+static int
 ivpu_fw_check_api(struct ivpu_device *vdev, const struct vpu_firmware_header *fw_hdr,
-		  const char *str, int index, u16 expected_major, u16 expected_minor)
+		  const char *str, int index, u16 expected_major, u16 expected_minor,
+		  u16 min_major)
 {
 	u16 major = (u16)(fw_hdr->api_version[index] >> 16);
 	u16 minor = (u16)(fw_hdr->api_version[index]);
 
+	if (major < min_major) {
+		ivpu_err(vdev, "Incompatible FW %s API version: %d.%d, required %d.0 or later\n",
+			 str, major, minor, min_major);
+		return -EINVAL;
+	}
 	if (major != expected_major) {
-		ivpu_warn(vdev, "Incompatible FW %s API version: %d.%d (expected %d.%d)\n",
+		ivpu_warn(vdev, "Major FW %s API version different: %d.%d (expected %d.%d)\n",
 			  str, major, minor, expected_major, expected_minor);
 	}
 	ivpu_dbg(vdev, FW_BOOT, "FW %s API version: %d.%d (expected %d.%d)\n",
 		 str, major, minor, expected_major, expected_minor);
+
+	return 0;
 }
 
 static int ivpu_fw_parse(struct ivpu_device *vdev)
@@ -131,6 +140,14 @@ static int ivpu_fw_parse(struct ivpu_device *vdev)
 		ivpu_err(vdev, "Invalid entry point: 0x%llx\n", fw_hdr->entry_point);
 		return -EINVAL;
 	}
+	ivpu_dbg(vdev, FW_BOOT, "Header version: 0x%x, format 0x%x\n",
+		 fw_hdr->header_version, fw_hdr->image_format);
+	ivpu_dbg(vdev, FW_BOOT, "FW version: %s\n", (char *)fw_hdr + VPU_FW_HEADER_SIZE);
+
+	if (IVPU_FW_CHECK_API(vdev, fw_hdr, BOOT, 3))
+		return -EINVAL;
+	if (IVPU_FW_CHECK_API(vdev, fw_hdr, JSM, 3))
+		return -EINVAL;
 
 	fw->runtime_addr = runtime_addr;
 	fw->runtime_size = runtime_size;
@@ -141,16 +158,10 @@ static int ivpu_fw_parse(struct ivpu_device *vdev)
 	fw->cold_boot_entry_point = fw_hdr->entry_point;
 	fw->entry_point = fw->cold_boot_entry_point;
 
-	ivpu_dbg(vdev, FW_BOOT, "Header version: 0x%x, format 0x%x\n",
-		 fw_hdr->header_version, fw_hdr->image_format);
 	ivpu_dbg(vdev, FW_BOOT, "Size: file %lu image %u runtime %u shavenn %u\n",
 		 fw->file->size, fw->image_size, fw->runtime_size, fw->shave_nn_size);
 	ivpu_dbg(vdev, FW_BOOT, "Address: runtime 0x%llx, load 0x%llx, entry point 0x%llx\n",
 		 fw->runtime_addr, image_load_addr, fw->entry_point);
-	ivpu_dbg(vdev, FW_BOOT, "FW version: %s\n", (char *)fw_hdr + VPU_FW_HEADER_SIZE);
-
-	IVPU_FW_CHECK_API(vdev, fw_hdr, BOOT);
-	IVPU_FW_CHECK_API(vdev, fw_hdr, JSM);
 
 	return 0;
 }
diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
index 3276bd9107b4..94068aedf97c 100644
--- a/drivers/accel/ivpu/ivpu_job.c
+++ b/drivers/accel/ivpu/ivpu_job.c
@@ -400,8 +400,9 @@ static int ivpu_direct_job_submission(struct ivpu_job *job)
 	if (ret)
 		goto err_xa_erase;
 
-	ivpu_dbg(vdev, JOB, "Job submitted: id %3u ctx %2d engine %d next %d\n",
-		 job->job_id, file_priv->ctx.id, job->engine_idx, cmdq->jobq->header.tail);
+	ivpu_dbg(vdev, JOB, "Job submitted: id %3u addr 0x%llx ctx %2d engine %d next %d\n",
+		 job->job_id, job->cmd_buf_vpu_addr, file_priv->ctx.id,
+		 job->engine_idx, cmdq->jobq->header.tail);
 
 	if (ivpu_test_mode == IVPU_TEST_MODE_NULL_HW) {
 		ivpu_job_done(vdev, job->job_id, VPU_JSM_STATUS_SUCCESS);
diff --git a/drivers/accel/ivpu/vpu_jsm_api.h b/drivers/accel/ivpu/vpu_jsm_api.h
index 1096cab0334e..2949ec8365bd 100644
--- a/drivers/accel/ivpu/vpu_jsm_api.h
+++ b/drivers/accel/ivpu/vpu_jsm_api.h
@@ -17,12 +17,12 @@
 /*
  * Major version changes that break backward compatibility
  */
-#define VPU_JSM_API_VER_MAJOR 2
+#define VPU_JSM_API_VER_MAJOR 3
 
 /*
  * Minor version changes when API backward compatibility is preserved.
  */
-#define VPU_JSM_API_VER_MINOR 10
+#define VPU_JSM_API_VER_MINOR 0
 
 /*
  * API header changed (field names, documentation, formatting) but API itself has not been changed
@@ -103,10 +103,10 @@
 /*
  * Max length (including trailing NULL char) of a dyndbg command.
  *
- * NOTE: 112 is used so that the size of 'struct vpu_ipc_msg' in the JSM API is
+ * NOTE: 96 is used so that the size of 'struct vpu_ipc_msg' in the JSM API is
  * 128 bytes (multiple of 64 bytes, the cache line size).
  */
-#define VPU_DYNDBG_CMD_MAX_LEN 112
+#define VPU_DYNDBG_CMD_MAX_LEN 96
 
 /*
  * Job format.
@@ -119,7 +119,7 @@ struct vpu_job_queue_entry {
 	u64 root_page_table_update_counter; /**< Page tables update events counter */
 	u64 preemption_buffer_address; /**< Address of the preemption buffer to use for this job */
 	u64 preemption_buffer_size; /**< Size of the preemption buffer to use for this job */
-	u8 reserved[VPU_JOB_RESERVED_BYTES];
+	u8 reserved_0[VPU_JOB_RESERVED_BYTES];
 };
 
 /*
@@ -129,7 +129,7 @@ struct vpu_job_queue_header {
 	u32 engine_idx;
 	u32 head;
 	u32 tail;
-	u8 reserved[VPU_JOB_QUEUE_RESERVED_BYTES];
+	u8 reserved_0[VPU_JOB_QUEUE_RESERVED_BYTES];
 };
 
 /*
@@ -319,6 +319,8 @@ enum vpu_ipc_msg_status { VPU_JSM_MSG_FREE, VPU_JSM_MSG_ALLOCATED };
 struct vpu_ipc_msg_payload_engine_reset {
 	/* Engine to be reset. */
 	u32 engine_idx;
+	/* Reserved */
+	u32 reserved_0;
 };
 
 struct vpu_ipc_msg_payload_engine_preempt {
@@ -336,6 +338,8 @@ struct vpu_ipc_msg_payload_engine_preempt {
 struct vpu_ipc_msg_payload_register_db {
 	/* Index of the doorbell to register. */
 	u32 db_idx;
+	/* Reserved */
+	u32 reserved_0;
 	/* Virtual address in Global GTT pointing to the start of job queue. */
 	u64 jobq_base;
 	/* Size of the job queue in bytes. */
@@ -352,11 +356,15 @@ struct vpu_ipc_msg_payload_register_db {
 struct vpu_ipc_msg_payload_unregister_db {
 	/* Index of the doorbell to unregister. */
 	u32 db_idx;
+	/* Reserved */
+	u32 reserved_0;
 };
 
 struct vpu_ipc_msg_payload_query_engine_hb {
 	/* Engine to return heartbeat value. */
 	u32 engine_idx;
+	/* Reserved */
+	u32 reserved_0;
 };
 
 struct vpu_ipc_msg_payload_power_level {
@@ -371,11 +379,15 @@ struct vpu_ipc_msg_payload_power_level {
 	 * considered to be valid.
 	 */
 	u32 power_level;
+	/* Reserved */
+	u32 reserved_0;
 };
 
 struct vpu_ipc_msg_payload_ssid_release {
 	/* Host sub-stream ID for the context to be released. */
 	u32 host_ssid;
+	/* Reserved */
+	u32 reserved_0;
 };
 
 /**
@@ -425,9 +437,6 @@ struct vpu_jsm_metric_streamer_start {
 	u64 next_buffer_size;
 };
 
-static_assert(sizeof(struct vpu_jsm_metric_streamer_start) % 8 == 0,
-	      "vpu_jsm_metric_streamer_start is misaligned");
-
 /**
  * @brief Metric streamer stop command structure.
  * @see VPU_JSM_MSG_METRIC_STREAMER_STOP
@@ -437,9 +446,6 @@ struct vpu_jsm_metric_streamer_stop {
 	u64 metric_group_mask;
 };
 
-static_assert(sizeof(struct vpu_jsm_metric_streamer_stop) % 8 == 0,
-	      "vpu_jsm_metric_streamer_stop is misaligned");
-
 /**
  * Provide VPU FW with buffers to write metric data.
  * @see VPU_JSM_MSG_METRIC_STREAMER_UPDATE
@@ -471,9 +477,6 @@ struct vpu_jsm_metric_streamer_update {
 	u64 next_buffer_size;
 };
 
-static_assert(sizeof(struct vpu_jsm_metric_streamer_update) % 8 == 0,
-	      "vpu_jsm_metric_streamer_update is misaligned");
-
 struct vpu_ipc_msg_payload_blob_deinit {
 	/* 64-bit unique ID for the blob to be de-initialized. */
 	u64 blob_id;
@@ -491,7 +494,7 @@ struct vpu_ipc_msg_payload_job_done {
 	/* Host SSID */
 	u32 host_ssid;
 	/* Zero Padding */
-	u32 reserved;
+	u32 reserved_0;
 	/* Command queue id */
 	u64 cmdq_id;
 };
@@ -500,7 +503,7 @@ struct vpu_jsm_engine_reset_context {
 	/* Host SSID */
 	u32 host_ssid;
 	/* Zero Padding */
-	u32 reserved;
+	u32 reserved_0;
 	/* Command queue id */
 	u64 cmdq_id;
 	/* Flags: 0: cause of hang; 1: collateral damage of reset */
@@ -533,6 +536,8 @@ struct vpu_ipc_msg_payload_engine_preempt_done {
 struct vpu_ipc_msg_payload_register_db_done {
 	/* Index of the registered doorbell. */
 	u32 db_idx;
+	/* Reserved */
+	u32 reserved_0;
 };
 
 /**
@@ -543,11 +548,15 @@ struct vpu_ipc_msg_payload_register_db_done {
 struct vpu_ipc_msg_payload_unregister_db_done {
 	/* Index of the unregistered doorbell. */
 	u32 db_idx;
+	/* Reserved */
+	u32 reserved_0;
 };
 
 struct vpu_ipc_msg_payload_query_engine_hb_done {
 	/* Engine returning heartbeat value. */
 	u32 engine_idx;
+	/* Reserved */
+	u32 reserved_0;
 	/* Heartbeat value. */
 	u64 heartbeat;
 };
@@ -559,6 +568,8 @@ struct vpu_ipc_msg_payload_get_power_level_count_done {
 	 * implementations.
 	 */
 	u32 power_level_count;
+	/* Reserved */
+	u32 reserved_0;
 	/**
 	 * Power consumption limit for each supported power level in
 	 * [0-100%] range relative to power level 0.
@@ -577,7 +588,7 @@ struct vpu_ipc_msg_payload_hws_priority_band_setup {
 	 * Grace period in 100ns units when preempting another priority band for
 	 * this priority band
 	 */
-	u64 grace_period[VPU_HWS_NUM_PRIORITY_BANDS];
+	u32 grace_period[VPU_HWS_NUM_PRIORITY_BANDS];
 	/*
 	 * Default quantum in 100ns units for scheduling across processes
 	 * within a priority band
@@ -593,6 +604,8 @@ struct vpu_ipc_msg_payload_hws_priority_band_setup {
 	 * in situations when it's starved by the focus band.
 	 */
 	u32 normal_band_percentage;
+	/* Reserved */
+	u32 reserved_0;
 };
 
 /* HWS create command queue request */
@@ -609,6 +622,8 @@ struct vpu_ipc_msg_payload_hws_create_cmdq {
 	u64 cmdq_base;
 	/* Command queue size */
 	u32 cmdq_size;
+	/* Reserved */
+	u32 reserved_0;
 };
 
 /* HWS create command queue response */
@@ -806,9 +821,6 @@ struct vpu_jsm_metric_streamer_done {
 	u64 bytes_written;
 };
 
-static_assert(sizeof(struct vpu_jsm_metric_streamer_done) % 8 == 0,
-	      "vpu_jsm_metric_streamer_done is misaligned");
-
 /**
  * Metric group description placed in the metric buffer after successful completion
  * of the VPU_JSM_MSG_METRIC_STREAMER_INFO command. This is followed by one or more
@@ -848,16 +860,13 @@ struct vpu_jsm_metric_group_descriptor {
 	u32 name_string_size;
 	/** Counter description string size, @see name_string_size */
 	u32 description_string_size;
-	u32 reserved_0[2];
+	u64 reserved_0;
 	/**
 	 * Right after this structure, the VPU writes name and description of
 	 * the metric group.
 	 */
 };
 
-static_assert(sizeof(struct vpu_jsm_metric_group_descriptor) % 8 == 0,
-	      "vpu_jsm_metric_group_descriptor is misaligned");
-
 /**
  * Metric counter description, placed in the buffer after vpu_jsm_metric_group_descriptor.
  * @see VPU_JSM_MSG_METRIC_STREAMER_INFO
@@ -894,16 +903,13 @@ struct vpu_jsm_metric_counter_descriptor {
 	u32 component_string_size;
 	/** Counter string size, @see name_string_size */
 	u32 units_string_size;
-	u32 reserved_0[2];
+	u64 reserved_0;
 	/**
 	 * Right after this structure, the VPU writes name, description
 	 * component and unit strings.
 	 */
 };
 
-static_assert(sizeof(struct vpu_jsm_metric_counter_descriptor) % 8 == 0,
-	      "vpu_jsm_metric_counter_descriptor is misaligned");
-
 /**
  * Payload for VPU_JSM_MSG_DYNDBG_CONTROL requests.
  *
@@ -977,6 +983,8 @@ union vpu_ipc_msg_payload {
  * to allow proper handling of VPU cache operations.
  */
 struct vpu_jsm_msg {
+	/* Reserved */
+	u64 reserved_0;
 	/* Message type, see vpu_ipc_msg_type enum. */
 	u32 type;
 	/* Buffer status, see vpu_ipc_msg_status enum. */
@@ -988,6 +996,7 @@ struct vpu_jsm_msg {
 	u32 request_id;
 	/* Request return code set by the VPU, see VPU_JSM_STATUS_* defines. */
 	u32 result;
+	u64 reserved_1;
 	/* Message payload depending on message type, see vpu_ipc_msg_payload union. */
 	union vpu_ipc_msg_payload payload;
 };
-- 
2.25.1

