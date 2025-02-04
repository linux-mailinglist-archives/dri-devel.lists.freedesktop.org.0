Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 880E3A26D85
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 09:46:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F40E810E5B6;
	Tue,  4 Feb 2025 08:46:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YYhyP+4/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AD7C10E5B6
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 08:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738658792; x=1770194792;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=W8/sI8reHVawDk4u0+SY1UE8e7FNja2P83NuijFQHGI=;
 b=YYhyP+4/L56aWDPWIUqZ7InM3OH05QXT8GBnCs6Wa3lzUsw9FCUY0USZ
 TXzYuWrRKM/xss/cYlz2K/Vd3dwRaMKEsZOUoSOtQDrnDGuU+m+EfxMpA
 +mU93+bKVLNfrIAokqKY9WH3emlA03mDXRvXHTy2wGCBz9vJykzf2A5bl
 tb6+oYlK4e8/l15XHTXEQy7rye0MVbeVgnR9j5t9qxXPEHKhrvo7DDCNF
 SDMAjI5LmcPcdWFrwCytii3+iPe58WKBnW+5gqDR8qzM21IFqgJmLMRkW
 u8oI/ITuBV52eSrjsUb46MqMt34ilF27TpJJ5SDZL5QD5WjRhQL+3iyE0 g==;
X-CSE-ConnectionGUID: YS5urm4MTvGulqf8c1iwNg==
X-CSE-MsgGUID: s4ySFMnZQY6fX+jw2Tg+Ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="39434726"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; d="scan'208";a="39434726"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 00:46:32 -0800
X-CSE-ConnectionGUID: AYD8m2nEQvyTAnyarf36VQ==
X-CSE-MsgGUID: OQS9rSl5QU+3tUPjFTADYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; d="scan'208";a="115531591"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 00:46:30 -0800
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 maciej.falkowski@linux.intel.com,
 Karol Wachowski <karol.wachowski@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 3/6] accel/ivpu: Add debugfs interface for setting HWS
 priority bands
Date: Tue,  4 Feb 2025 09:46:19 +0100
Message-ID: <20250204084622.2422544-4-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20250204084622.2422544-1-jacek.lawrynowicz@linux.intel.com>
References: <20250204084622.2422544-1-jacek.lawrynowicz@linux.intel.com>
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

From: Karol Wachowski <karol.wachowski@intel.com>

Add debugfs interface to modify following priority bands properties:
 * grace period
 * process grace period
 * process quantum

This allows for the adjustment of hardware scheduling algorithm parameters
for each existing priority band, facilitating validation and fine-tuning.

Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_debugfs.c | 84 +++++++++++++++++++++++++++++++
 drivers/accel/ivpu/ivpu_hw.c      | 21 ++++++++
 drivers/accel/ivpu/ivpu_hw.h      |  5 ++
 drivers/accel/ivpu/ivpu_jsm_msg.c | 29 ++++-------
 4 files changed, 121 insertions(+), 18 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_debugfs.c b/drivers/accel/ivpu/ivpu_debugfs.c
index e79715c53f2a0..0825851656a27 100644
--- a/drivers/accel/ivpu/ivpu_debugfs.c
+++ b/drivers/accel/ivpu/ivpu_debugfs.c
@@ -398,6 +398,88 @@ static int dct_active_set(void *data, u64 active_percent)
 
 DEFINE_DEBUGFS_ATTRIBUTE(ivpu_dct_fops, dct_active_get, dct_active_set, "%llu\n");
 
+static int priority_bands_show(struct seq_file *s, void *v)
+{
+	struct ivpu_device *vdev = s->private;
+	struct ivpu_hw_info *hw = vdev->hw;
+
+	for (int band = VPU_JOB_SCHEDULING_PRIORITY_BAND_IDLE;
+	     band < VPU_JOB_SCHEDULING_PRIORITY_BAND_COUNT; band++) {
+		switch (band) {
+		case VPU_JOB_SCHEDULING_PRIORITY_BAND_IDLE:
+			seq_puts(s, "Idle:     ");
+			break;
+
+		case VPU_JOB_SCHEDULING_PRIORITY_BAND_NORMAL:
+			seq_puts(s, "Normal:   ");
+			break;
+
+		case VPU_JOB_SCHEDULING_PRIORITY_BAND_FOCUS:
+			seq_puts(s, "Focus:    ");
+			break;
+
+		case VPU_JOB_SCHEDULING_PRIORITY_BAND_REALTIME:
+			seq_puts(s, "Realtime: ");
+			break;
+		}
+
+		seq_printf(s, "grace_period %9u process_grace_period %9u process_quantum %9u\n",
+			   hw->hws.grace_period[band], hw->hws.process_grace_period[band],
+			   hw->hws.process_quantum[band]);
+	}
+
+	return 0;
+}
+
+static int priority_bands_fops_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, priority_bands_show, inode->i_private);
+}
+
+static ssize_t
+priority_bands_fops_write(struct file *file, const char __user *user_buf, size_t size, loff_t *pos)
+{
+	struct seq_file *s = file->private_data;
+	struct ivpu_device *vdev = s->private;
+	char buf[64];
+	u32 grace_period;
+	u32 process_grace_period;
+	u32 process_quantum;
+	u32 band;
+	int ret;
+
+	if (size >= sizeof(buf))
+		return -EINVAL;
+
+	ret = simple_write_to_buffer(buf, sizeof(buf) - 1, pos, user_buf, size);
+	if (ret < 0)
+		return ret;
+
+	buf[size] = '\0';
+	ret = sscanf(buf, "%u %u %u %u", &band, &grace_period, &process_grace_period,
+		     &process_quantum);
+	if (ret != 4)
+		return -EINVAL;
+
+	if (band >= VPU_JOB_SCHEDULING_PRIORITY_BAND_COUNT)
+		return -EINVAL;
+
+	vdev->hw->hws.grace_period[band] = grace_period;
+	vdev->hw->hws.process_grace_period[band] = process_grace_period;
+	vdev->hw->hws.process_quantum[band] = process_quantum;
+
+	return size;
+}
+
+static const struct file_operations ivpu_hws_priority_bands_fops = {
+	.owner = THIS_MODULE,
+	.open = priority_bands_fops_open,
+	.write = priority_bands_fops_write,
+	.read = seq_read,
+	.llseek = seq_lseek,
+	.release = single_release,
+};
+
 void ivpu_debugfs_init(struct ivpu_device *vdev)
 {
 	struct dentry *debugfs_root = vdev->drm.debugfs_root;
@@ -420,6 +502,8 @@ void ivpu_debugfs_init(struct ivpu_device *vdev)
 			    &fw_trace_hw_comp_mask_fops);
 	debugfs_create_file("fw_trace_level", 0200, debugfs_root, vdev,
 			    &fw_trace_level_fops);
+	debugfs_create_file("hws_priority_bands", 0200, debugfs_root, vdev,
+			    &ivpu_hws_priority_bands_fops);
 
 	debugfs_create_file("reset_engine", 0200, debugfs_root, vdev,
 			    &ivpu_reset_engine_fops);
diff --git a/drivers/accel/ivpu/ivpu_hw.c b/drivers/accel/ivpu/ivpu_hw.c
index 2057907c5aa6a..f31702b3ecbdc 100644
--- a/drivers/accel/ivpu/ivpu_hw.c
+++ b/drivers/accel/ivpu/ivpu_hw.c
@@ -113,6 +113,26 @@ static void timeouts_init(struct ivpu_device *vdev)
 	}
 }
 
+static void priority_bands_init(struct ivpu_device *vdev)
+{
+	/* Idle */
+	vdev->hw->hws.grace_period[VPU_JOB_SCHEDULING_PRIORITY_BAND_IDLE] = 0;
+	vdev->hw->hws.process_grace_period[VPU_JOB_SCHEDULING_PRIORITY_BAND_IDLE] = 50000;
+	vdev->hw->hws.process_quantum[VPU_JOB_SCHEDULING_PRIORITY_BAND_IDLE] = 160000;
+	/* Normal */
+	vdev->hw->hws.grace_period[VPU_JOB_SCHEDULING_PRIORITY_BAND_NORMAL] = 50000;
+	vdev->hw->hws.process_grace_period[VPU_JOB_SCHEDULING_PRIORITY_BAND_NORMAL] = 50000;
+	vdev->hw->hws.process_quantum[VPU_JOB_SCHEDULING_PRIORITY_BAND_NORMAL] = 300000;
+	/* Focus */
+	vdev->hw->hws.grace_period[VPU_JOB_SCHEDULING_PRIORITY_BAND_FOCUS] = 50000;
+	vdev->hw->hws.process_grace_period[VPU_JOB_SCHEDULING_PRIORITY_BAND_FOCUS] = 50000;
+	vdev->hw->hws.process_quantum[VPU_JOB_SCHEDULING_PRIORITY_BAND_FOCUS] = 200000;
+	/* Realtime */
+	vdev->hw->hws.grace_period[VPU_JOB_SCHEDULING_PRIORITY_BAND_REALTIME] = 0;
+	vdev->hw->hws.process_grace_period[VPU_JOB_SCHEDULING_PRIORITY_BAND_REALTIME] = 50000;
+	vdev->hw->hws.process_quantum[VPU_JOB_SCHEDULING_PRIORITY_BAND_REALTIME] = 200000;
+}
+
 static void memory_ranges_init(struct ivpu_device *vdev)
 {
 	if (ivpu_hw_ip_gen(vdev) == IVPU_HW_IP_37XX) {
@@ -251,6 +271,7 @@ int ivpu_hw_init(struct ivpu_device *vdev)
 {
 	ivpu_hw_btrs_info_init(vdev);
 	ivpu_hw_btrs_freq_ratios_init(vdev);
+	priority_bands_init(vdev);
 	memory_ranges_init(vdev);
 	platform_init(vdev);
 	wa_init(vdev);
diff --git a/drivers/accel/ivpu/ivpu_hw.h b/drivers/accel/ivpu/ivpu_hw.h
index fbef9816b9d0c..16435f2756d02 100644
--- a/drivers/accel/ivpu/ivpu_hw.h
+++ b/drivers/accel/ivpu/ivpu_hw.h
@@ -36,6 +36,11 @@ struct ivpu_hw_info {
 		u8 pn_ratio;
 		u32 profiling_freq;
 	} pll;
+	struct {
+		u32 grace_period[VPU_HWS_NUM_PRIORITY_BANDS];
+		u32 process_quantum[VPU_HWS_NUM_PRIORITY_BANDS];
+		u32 process_grace_period[VPU_HWS_NUM_PRIORITY_BANDS];
+	} hws;
 	u32 tile_fuse;
 	u32 sku;
 	u16 config;
diff --git a/drivers/accel/ivpu/ivpu_jsm_msg.c b/drivers/accel/ivpu/ivpu_jsm_msg.c
index 30a40be769301..219ab8afefabd 100644
--- a/drivers/accel/ivpu/ivpu_jsm_msg.c
+++ b/drivers/accel/ivpu/ivpu_jsm_msg.c
@@ -7,6 +7,7 @@
 #include "ivpu_hw.h"
 #include "ivpu_ipc.h"
 #include "ivpu_jsm_msg.h"
+#include "vpu_jsm_api.h"
 
 const char *ivpu_jsm_msg_type_to_str(enum vpu_ipc_msg_type type)
 {
@@ -407,26 +408,18 @@ int ivpu_jsm_hws_setup_priority_bands(struct ivpu_device *vdev)
 {
 	struct vpu_jsm_msg req = { .type = VPU_JSM_MSG_SET_PRIORITY_BAND_SETUP };
 	struct vpu_jsm_msg resp;
+	struct ivpu_hw_info *hw = vdev->hw;
+	struct vpu_ipc_msg_payload_hws_priority_band_setup *setup =
+		&req.payload.hws_priority_band_setup;
 	int ret;
 
-	/* Idle */
-	req.payload.hws_priority_band_setup.grace_period[0] = 0;
-	req.payload.hws_priority_band_setup.process_grace_period[0] = 50000;
-	req.payload.hws_priority_band_setup.process_quantum[0] = 160000;
-	/* Normal */
-	req.payload.hws_priority_band_setup.grace_period[1] = 50000;
-	req.payload.hws_priority_band_setup.process_grace_period[1] = 50000;
-	req.payload.hws_priority_band_setup.process_quantum[1] = 300000;
-	/* Focus */
-	req.payload.hws_priority_band_setup.grace_period[2] = 50000;
-	req.payload.hws_priority_band_setup.process_grace_period[2] = 50000;
-	req.payload.hws_priority_band_setup.process_quantum[2] = 200000;
-	/* Realtime */
-	req.payload.hws_priority_band_setup.grace_period[3] = 0;
-	req.payload.hws_priority_band_setup.process_grace_period[3] = 50000;
-	req.payload.hws_priority_band_setup.process_quantum[3] = 200000;
-
-	req.payload.hws_priority_band_setup.normal_band_percentage = 10;
+	for (int band = VPU_JOB_SCHEDULING_PRIORITY_BAND_IDLE;
+	     band < VPU_JOB_SCHEDULING_PRIORITY_BAND_COUNT; band++) {
+		setup->grace_period[band] = hw->hws.grace_period[band];
+		setup->process_grace_period[band] = hw->hws.process_grace_period[band];
+		setup->process_quantum[band] = hw->hws.process_quantum[band];
+	}
+	setup->normal_band_percentage = 10;
 
 	ret = ivpu_ipc_send_receive_internal(vdev, &req, VPU_JSM_MSG_SET_PRIORITY_BAND_SETUP_RSP,
 					     &resp, VPU_IPC_CHAN_ASYNC_CMD, vdev->timeout.jsm);
-- 
2.45.1

