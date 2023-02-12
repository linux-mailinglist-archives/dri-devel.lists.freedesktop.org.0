Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A56E6939E9
	for <lists+dri-devel@lfdr.de>; Sun, 12 Feb 2023 21:45:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F11510E472;
	Sun, 12 Feb 2023 20:45:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F58F10E468
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Feb 2023 20:45:22 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D17A6B80D3A;
 Sun, 12 Feb 2023 20:45:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5F6CC433D2;
 Sun, 12 Feb 2023 20:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676234719;
 bh=5OMjdKCrdemUPkKlaeCD5wwGHLcgYZw0tIVqOYatR9c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sfQeg0tBGIIoYbd6rVQ10fMnPpcft2m+jIPqTdrIVfIvSXvZR3cljcgeijc6rmPr6
 MYljcd5JvTMlgb55bN/2vkgbV/zpFZUZUyrjv32PCwxNWg3vENZbHZFNpGPPCf80LB
 8eC2G4yTeDB/4yQLoewHprYkNwu6idbjoaw/x76K8UiCMgw1BTW3XVeiKHcakq2zhL
 xjbC8totMAjYBlcY9LyLO8p2EECZeJOWTd4pwrO2yJ0JNANYeyD76CGRCwBOyMm9oO
 A8B7nmj0GN9Wmh5SwHwzpl1lDJGLwRXqX6F8evvNwREcRsMo3WX5yiDpWeAP2xtcuB
 t/bgclCkvpfDQ==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 10/27] habanalabs: add critical-event bit in notifier
Date: Sun, 12 Feb 2023 22:44:37 +0200
Message-Id: <20230212204454.2938561-10-ogabbay@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230212204454.2938561-1-ogabbay@kernel.org>
References: <20230212204454.2938561-1-ogabbay@kernel.org>
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
Cc: Moti Haimovski <mhaimovski@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Moti Haimovski <mhaimovski@habana.ai>

Enhance the existing user notifications by adding a HW and FW critical
event bits to be used when a HW or FW event occur that requires
both SW abort and hard-resetting the chip.

Signed-off-by: Moti Haimovski <mhaimovski@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/device.c      | 53 +++++++++++++++++-
 drivers/accel/habanalabs/common/habanalabs.h  | 54 +++++++++++++++++++
 .../accel/habanalabs/common/habanalabs_drv.c  |  5 +-
 .../habanalabs/common/habanalabs_ioctl.c      | 50 +++++++++++++++++
 drivers/accel/habanalabs/gaudi/gaudi.c        | 10 +++-
 drivers/accel/habanalabs/gaudi2/gaudi2.c      |  4 ++
 include/uapi/drm/habanalabs_accel.h           | 43 +++++++++++++++
 7 files changed, 213 insertions(+), 6 deletions(-)

diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
index b8c74185eabd..f91f3509336f 100644
--- a/drivers/accel/habanalabs/common/device.c
+++ b/drivers/accel/habanalabs/common/device.c
@@ -998,6 +998,8 @@ static void hl_device_heartbeat(struct work_struct *work)
 {
 	struct hl_device *hdev = container_of(work, struct hl_device,
 						work_heartbeat.work);
+	struct hl_info_fw_err_info info = {0};
+	u64 event_mask = HL_NOTIFIER_EVENT_DEVICE_RESET | HL_NOTIFIER_EVENT_DEVICE_UNAVAILABLE;
 
 	if (!hl_device_operational(hdev, NULL))
 		goto reschedule;
@@ -1008,7 +1010,10 @@ static void hl_device_heartbeat(struct work_struct *work)
 	if (hl_device_operational(hdev, NULL))
 		dev_err(hdev->dev, "Device heartbeat failed!\n");
 
-	hl_device_reset(hdev, HL_DRV_RESET_HARD | HL_DRV_RESET_HEARTBEAT);
+	info.err_type = HL_INFO_FW_HEARTBEAT_ERR;
+	info.event_mask = &event_mask;
+	hl_handle_fw_err(hdev, &info);
+	hl_device_cond_reset(hdev, HL_DRV_RESET_HARD | HL_DRV_RESET_HEARTBEAT, event_mask);
 
 	return;
 
@@ -2626,3 +2631,49 @@ void hl_handle_page_fault(struct hl_device *hdev, u64 addr, u16 eng_id, bool is_
 	if (event_mask)
 		*event_mask |=  HL_NOTIFIER_EVENT_PAGE_FAULT;
 }
+
+void hl_capture_hw_err(struct hl_device *hdev, u16 event_id)
+{
+	struct hw_err_info *info = &hdev->captured_err_info.hw_err;
+
+	/* Capture only the first HW err */
+	if (atomic_cmpxchg(&info->event_detected, 0, 1))
+		return;
+
+	info->event.timestamp = ktime_to_ns(ktime_get());
+	info->event.event_id = event_id;
+
+	info->event_info_available = true;
+}
+
+void hl_handle_critical_hw_err(struct hl_device *hdev, u16 event_id, u64 *event_mask)
+{
+	hl_capture_hw_err(hdev, event_id);
+
+	if (event_mask)
+		*event_mask |= HL_NOTIFIER_EVENT_CRITICL_HW_ERR;
+}
+
+void hl_capture_fw_err(struct hl_device *hdev, struct hl_info_fw_err_info *fw_info)
+{
+	struct fw_err_info *info = &hdev->captured_err_info.fw_err;
+
+	/* Capture only the first FW error */
+	if (atomic_cmpxchg(&info->event_detected, 0, 1))
+		return;
+
+	info->event.timestamp = ktime_to_ns(ktime_get());
+	info->event.err_type = fw_info->err_type;
+	if (fw_info->err_type == HL_INFO_FW_REPORTED_ERR)
+		info->event.event_id = fw_info->event_id;
+
+	info->event_info_available = true;
+}
+
+void hl_handle_fw_err(struct hl_device *hdev, struct hl_info_fw_err_info *info)
+{
+	hl_capture_fw_err(hdev, info);
+
+	if (info->event_mask)
+		*info->event_mask |= HL_NOTIFIER_EVENT_CRITICL_FW_ERR;
+}
diff --git a/drivers/accel/habanalabs/common/habanalabs.h b/drivers/accel/habanalabs/common/habanalabs.h
index afdae5775eaa..176a2e2c050d 100644
--- a/drivers/accel/habanalabs/common/habanalabs.h
+++ b/drivers/accel/habanalabs/common/habanalabs.h
@@ -3031,18 +3031,56 @@ struct razwi_info {
 	bool				razwi_info_available;
 };
 
+/**
+ * struct hw_err_info - HW error information.
+ * @event: holds information on the event.
+ * @event_detected: if set as 1, then a HW event was discovered for the
+ *                  first time after the driver has finished booting-up.
+ *                  currently we assume that only fatal events (that require hard-reset) are
+ *                  reported so we don't care of the others that might follow it.
+ *                  so once changed to 1, it will remain that way.
+ *                  TODO: support multiple events.
+ * @event_info_available: indicates that a HW event info is now available.
+ */
+struct hw_err_info {
+	struct hl_info_hw_err_event	event;
+	atomic_t			event_detected;
+	bool				event_info_available;
+};
+
+/**
+ * struct fw_err_info - FW error information.
+ * @event: holds information on the event.
+ * @event_detected: if set as 1, then a FW event was discovered for the
+ *                  first time after the driver has finished booting-up.
+ *                  currently we assume that only fatal events (that require hard-reset) are
+ *                  reported so we don't care of the others that might follow it.
+ *                  so once changed to 1, it will remain that way.
+ *                  TODO: support multiple events.
+ * @event_info_available: indicates that a HW event info is now available.
+ */
+struct fw_err_info {
+	struct hl_info_fw_err_event	event;
+	atomic_t			event_detected;
+	bool				event_info_available;
+};
+
 /**
  * struct hl_error_info - holds information collected during an error.
  * @cs_timeout: CS timeout error information.
  * @razwi_info: RAZWI information.
  * @undef_opcode: undefined opcode information.
  * @page_fault_info: page fault information.
+ * @hw_err: (fatal) hardware error information.
+ * @fw_err: firmware error information.
  */
 struct hl_error_info {
 	struct cs_timeout_info		cs_timeout;
 	struct razwi_info		razwi_info;
 	struct undefined_opcode_info	undef_opcode;
 	struct page_fault_info		page_fault_info;
+	struct hw_err_info		hw_err;
+	struct fw_err_info		fw_err;
 };
 
 /**
@@ -3453,6 +3491,20 @@ struct hl_cs_encaps_sig_handle {
 	u32  count;
 };
 
+/**
+ * struct hl_info_fw_err_info - firmware error information structure
+ * @err_type: The type of error detected (or reported).
+ * @event_mask: Pointer to the event mask to be modified with the detected error flag
+ *              (can be NULL)
+ * @event_id: The id of the event that reported the error
+ *            (applicable when err_type is HL_INFO_FW_REPORTED_ERR).
+ */
+struct hl_info_fw_err_info {
+	enum hl_info_fw_err_type err_type;
+	u64 *event_mask;
+	u16 event_id;
+};
+
 /*
  * IOCTLs
  */
@@ -3883,6 +3935,8 @@ void hl_handle_razwi(struct hl_device *hdev, u64 addr, u16 *engine_id, u16 num_o
 void hl_capture_page_fault(struct hl_device *hdev, u64 addr, u16 eng_id, bool is_pmmu);
 void hl_handle_page_fault(struct hl_device *hdev, u64 addr, u16 eng_id, bool is_pmmu,
 				u64 *event_mask);
+void hl_handle_critical_hw_err(struct hl_device *hdev, u16 event_id, u64 *event_mask);
+void hl_handle_fw_err(struct hl_device *hdev, struct hl_info_fw_err_info *info);
 
 #ifdef CONFIG_DEBUG_FS
 
diff --git a/drivers/accel/habanalabs/common/habanalabs_drv.c b/drivers/accel/habanalabs/common/habanalabs_drv.c
index 8ccc3d6519b5..0cb6e52a1192 100644
--- a/drivers/accel/habanalabs/common/habanalabs_drv.c
+++ b/drivers/accel/habanalabs/common/habanalabs_drv.c
@@ -221,12 +221,9 @@ int hl_device_open(struct inode *inode, struct file *filp)
 
 	hl_debugfs_add_file(hpriv);
 
+	memset(&hdev->captured_err_info, 0, sizeof(hdev->captured_err_info));
 	atomic_set(&hdev->captured_err_info.cs_timeout.write_enable, 1);
-	atomic_set(&hdev->captured_err_info.razwi_info.razwi_detected, 0);
-	atomic_set(&hdev->captured_err_info.page_fault_info.page_fault_detected, 0);
 	hdev->captured_err_info.undef_opcode.write_enable = true;
-	hdev->captured_err_info.razwi_info.razwi_info_available = false;
-	hdev->captured_err_info.page_fault_info.page_fault_info_available = false;
 
 	hdev->open_counter++;
 	hdev->last_successful_open_jif = jiffies;
diff --git a/drivers/accel/habanalabs/common/habanalabs_ioctl.c b/drivers/accel/habanalabs/common/habanalabs_ioctl.c
index 5005e6fca691..13cd5013c72a 100644
--- a/drivers/accel/habanalabs/common/habanalabs_ioctl.c
+++ b/drivers/accel/habanalabs/common/habanalabs_ioctl.c
@@ -830,6 +830,50 @@ static int user_mappings_info(struct hl_fpriv *hpriv, struct hl_info_args *args)
 	return copy_to_user(out, pgf_info->user_mappings, actual_size) ? -EFAULT : 0;
 }
 
+static int hw_err_info(struct hl_fpriv *hpriv, struct hl_info_args *args)
+{
+	void __user *user_buf = (void __user *) (uintptr_t) args->return_pointer;
+	struct hl_device *hdev = hpriv->hdev;
+	u32 user_buf_size = args->return_size;
+	struct hw_err_info *info;
+	int rc;
+
+	if ((!user_buf_size) || (!user_buf))
+		return -EINVAL;
+
+	if (user_buf_size < sizeof(struct hl_info_hw_err_event))
+		return -ENOMEM;
+
+	info = &hdev->captured_err_info.hw_err;
+	if (!info->event_info_available)
+		return -ENOENT;
+
+	rc = copy_to_user(user_buf, &info->event, sizeof(struct hl_info_hw_err_event));
+	return rc ? -EFAULT : 0;
+}
+
+static int fw_err_info(struct hl_fpriv *hpriv, struct hl_info_args *args)
+{
+	void __user *user_buf = (void __user *) (uintptr_t) args->return_pointer;
+	struct hl_device *hdev = hpriv->hdev;
+	u32 user_buf_size = args->return_size;
+	struct fw_err_info *info;
+	int rc;
+
+	if ((!user_buf_size) || (!user_buf))
+		return -EINVAL;
+
+	if (user_buf_size < sizeof(struct hl_info_fw_err_event))
+		return -ENOMEM;
+
+	info = &hdev->captured_err_info.fw_err;
+	if (!info->event_info_available)
+		return -ENOENT;
+
+	rc = copy_to_user(user_buf, &info->event, sizeof(struct hl_info_fw_err_event));
+	return rc ? -EFAULT : 0;
+}
+
 static int send_fw_generic_request(struct hl_device *hdev, struct hl_info_args *info_args)
 {
 	void __user *buff = (void __user *) (uintptr_t) info_args->return_pointer;
@@ -950,6 +994,12 @@ static int _hl_info_ioctl(struct hl_fpriv *hpriv, void *data,
 	case HL_INFO_UNREGISTER_EVENTFD:
 		return eventfd_unregister(hpriv, args);
 
+	case HL_INFO_HW_ERR_EVENT:
+		return hw_err_info(hpriv, args);
+
+	case HL_INFO_FW_ERR_EVENT:
+		return fw_err_info(hpriv, args);
+
 	default:
 		break;
 	}
diff --git a/drivers/accel/habanalabs/gaudi/gaudi.c b/drivers/accel/habanalabs/gaudi/gaudi.c
index 7475f33734d7..e097641db1d2 100644
--- a/drivers/accel/habanalabs/gaudi/gaudi.c
+++ b/drivers/accel/habanalabs/gaudi/gaudi.c
@@ -7634,6 +7634,7 @@ static void gaudi_print_clk_change_info(struct hl_device *hdev, u16 event_type,
 static void gaudi_handle_eqe(struct hl_device *hdev, struct hl_eq_entry *eq_entry)
 {
 	struct gaudi_device *gaudi = hdev->asic_specific;
+	struct hl_info_fw_err_info fw_err_info;
 	u64 data = le64_to_cpu(eq_entry->data[0]), event_mask = 0;
 	u32 ctl = le32_to_cpu(eq_entry->hdr.ctl);
 	u32 fw_fatal_err_flag = 0, flags = 0;
@@ -7912,7 +7913,10 @@ static void gaudi_handle_eqe(struct hl_device *hdev, struct hl_eq_entry *eq_entr
 	case GAUDI_EVENT_FW_ALIVE_S:
 		gaudi_print_irq_info(hdev, event_type, false, &event_mask);
 		gaudi_print_fw_alive_info(hdev, &eq_entry->fw_alive);
-		event_mask |= HL_NOTIFIER_EVENT_GENERAL_HW_ERR;
+		fw_err_info.err_type = HL_INFO_FW_REPORTED_ERR;
+		fw_err_info.event_id = event_type;
+		fw_err_info.event_mask = &event_mask;
+		hl_handle_fw_err(hdev, &fw_err_info);
 		goto reset_device;
 
 	default:
@@ -7943,6 +7947,10 @@ static void gaudi_handle_eqe(struct hl_device *hdev, struct hl_eq_entry *eq_entr
 	}
 
 	if (reset_required) {
+		/* escalate general hw errors to critical/fatal error */
+		if (event_mask & HL_NOTIFIER_EVENT_GENERAL_HW_ERR)
+			hl_handle_critical_hw_err(hdev, event_type, &event_mask);
+
 		hl_device_cond_reset(hdev, flags, event_mask);
 	} else {
 		hl_fw_unmask_irq(hdev, event_type);
diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index af8fe3575aa9..9b41eb3f1380 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -9444,6 +9444,10 @@ static void gaudi2_handle_eqe(struct hl_device *hdev, struct hl_eq_entry *eq_ent
 	} else {
 		reset_flags |= HL_DRV_RESET_DELAY;
 	}
+	/* escalate general hw errors to critical/fatal error */
+	if (event_mask & HL_NOTIFIER_EVENT_GENERAL_HW_ERR)
+		hl_handle_critical_hw_err(hdev, event_type, &event_mask);
+
 	event_mask |= HL_NOTIFIER_EVENT_DEVICE_RESET;
 	hl_device_cond_reset(hdev, reset_flags, event_mask);
 }
diff --git a/include/uapi/drm/habanalabs_accel.h b/include/uapi/drm/habanalabs_accel.h
index 331567ec9e79..3a62652a6452 100644
--- a/include/uapi/drm/habanalabs_accel.h
+++ b/include/uapi/drm/habanalabs_accel.h
@@ -723,6 +723,10 @@ enum hl_server_type {
  * HL_NOTIFIER_EVENT_GENERAL_HW_ERR     - Indicates device HW error
  * HL_NOTIFIER_EVENT_RAZWI              - Indicates razwi happened
  * HL_NOTIFIER_EVENT_PAGE_FAULT         - Indicates page fault happened
+ * HL_NOTIFIER_EVENT_CRITICAL_HW_ERR    - Indicates a HW error that requires SW abort and
+ *                                        HW reset
+ * HL_NOTIFIER_EVENT_CRITICAL_FW_ERR    - Indicates a FW error that requires SW abort and
+ *                                        HW reset
  */
 #define HL_NOTIFIER_EVENT_TPC_ASSERT		(1ULL << 0)
 #define HL_NOTIFIER_EVENT_UNDEFINED_OPCODE	(1ULL << 1)
@@ -733,6 +737,8 @@ enum hl_server_type {
 #define HL_NOTIFIER_EVENT_GENERAL_HW_ERR	(1ULL << 6)
 #define HL_NOTIFIER_EVENT_RAZWI			(1ULL << 7)
 #define HL_NOTIFIER_EVENT_PAGE_FAULT		(1ULL << 8)
+#define HL_NOTIFIER_EVENT_CRITICL_HW_ERR	(1ULL << 9)
+#define HL_NOTIFIER_EVENT_CRITICL_FW_ERR	(1ULL << 10)
 
 /* Opcode for management ioctl
  *
@@ -790,6 +796,8 @@ enum hl_server_type {
  * HL_INFO_PAGE_FAULT_EVENT - Retrieve parameters of captured page fault.
  * HL_INFO_USER_MAPPINGS - Retrieve user mappings, captured after page fault event.
  * HL_INFO_FW_GENERIC_REQ - Send generic request to FW.
+ * HL_INFO_HW_ERR_EVENT   - Retrieve information on the reported HW error.
+ * HL_INFO_FW_ERR_EVENT   - Retrieve information on the reported FW error.
  */
 #define HL_INFO_HW_IP_INFO			0
 #define HL_INFO_HW_EVENTS			1
@@ -824,6 +832,8 @@ enum hl_server_type {
 #define HL_INFO_PAGE_FAULT_EVENT		33
 #define HL_INFO_USER_MAPPINGS			34
 #define HL_INFO_FW_GENERIC_REQ			35
+#define HL_INFO_HW_ERR_EVENT			36
+#define HL_INFO_FW_ERR_EVENT			37
 
 #define HL_INFO_VERSION_MAX_LEN			128
 #define HL_INFO_CARD_NAME_MAX_LEN		16
@@ -1161,6 +1171,39 @@ struct hl_info_undefined_opcode_event {
 	__u32 stream_id;
 };
 
+/**
+ * struct hl_info_hw_err_event - info about HW error
+ * @timestamp: timestamp of error occurrence
+ * @event_id: The async event ID (specific to each device type).
+ * @pad: size padding for u64 granularity.
+ */
+struct hl_info_hw_err_event {
+	__s64 timestamp;
+	__u16 event_id;
+	__u16 pad[3];
+};
+
+/* FW error definition for event_type in struct hl_info_fw_err_event */
+enum hl_info_fw_err_type {
+	HL_INFO_FW_HEARTBEAT_ERR,
+	HL_INFO_FW_REPORTED_ERR,
+};
+
+/**
+ * struct hl_info_fw_err_event - info about FW error
+ * @timestamp: time-stamp of error occurrence
+ * @err_type: The type of event as defined in hl_info_fw_err_type.
+ * @event_id: The async event ID (specific to each device type, applicable only when event type is
+ *             HL_INFO_FW_REPORTED_ERR).
+ * @pad: size padding for u64 granularity.
+ */
+struct hl_info_fw_err_event {
+	__s64 timestamp;
+	__u16 err_type;
+	__u16 event_id;
+	__u32 pad;
+};
+
 /**
  * struct hl_info_dev_memalloc_page_sizes - valid page sizes in device mem alloc information.
  * @page_order_bitmask: bitmap in which a set bit represents the order of the supported page size
-- 
2.25.1

