Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCE37D672B
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 11:44:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CEB010E62B;
	Wed, 25 Oct 2023 09:44:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A82D10E627
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 09:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698227043; x=1729763043;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oNNBNJtFAV4Tg0fK8FIQ0YUhusn7pnRGbx6sDZBiccA=;
 b=L6HUR2VY5WOsZygicqwYpSfjCcdoh6u0yCIMY3Wba9KOSSJi6NkgALdr
 qOo1KGlNoB5GJ0NO1vy4rxo1KSgzxoTLuS801MYkhGTH3rSmt7Jlm8SjY
 adpIpTlVeBlr9G53WkKLRZ14V2FMQWn9gmh0wUsECFkI81Ezt/JK1VrIr
 PfluAea3hEL1SAptb8doBErwXfclF1x/4VRC1Brs52kxUXgNlWtXor6VO
 QUb83HDnB+esPYJcCCKn/rRyc1DzIR0cWIZfO5/r5XgpjQyU21q2WP8My
 yUzVBlGncpnYeQ3XYupJZ5xVSP62YNXH8TJcFt7AM0vS0ZGs8mnNjuZZS w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="387090764"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="387090764"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 02:43:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="932308232"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="932308232"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 02:43:38 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 03/11] accel/ivpu: Add dvfs_mode file to debugfs
Date: Wed, 25 Oct 2023 11:43:15 +0200
Message-Id: <20231025094323.989987-4-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231025094323.989987-1-stanislaw.gruszka@linux.intel.com>
References: <20231025094323.989987-1-stanislaw.gruszka@linux.intel.com>
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
Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>

Add new debugfs file to set dvfs_mode FW boot parameter and restart
the FW to allow experimenting with DVFS (dynamic voltage & frequency
scaling).

Signed-off-by: Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_debugfs.c | 28 ++++++++++++++++++++++++++++
 drivers/accel/ivpu/ivpu_fw.c      |  5 +++++
 drivers/accel/ivpu/ivpu_fw.h      |  1 +
 3 files changed, 34 insertions(+)

diff --git a/drivers/accel/ivpu/ivpu_debugfs.c b/drivers/accel/ivpu/ivpu_debugfs.c
index ea453b985b49..6e0d56823024 100644
--- a/drivers/accel/ivpu/ivpu_debugfs.c
+++ b/drivers/accel/ivpu/ivpu_debugfs.c
@@ -115,6 +115,31 @@ static const struct drm_debugfs_info vdev_debugfs_list[] = {
 	{"reset_pending", reset_pending_show, 0},
 };
 
+static ssize_t
+dvfs_mode_fops_write(struct file *file, const char __user *user_buf, size_t size, loff_t *pos)
+{
+	struct ivpu_device *vdev = file->private_data;
+	struct ivpu_fw_info *fw = vdev->fw;
+	u32 dvfs_mode;
+	int ret;
+
+	ret = kstrtou32_from_user(user_buf, size, 0, &dvfs_mode);
+	if (ret < 0)
+		return ret;
+
+	fw->dvfs_mode = dvfs_mode;
+
+	ivpu_pm_schedule_recovery(vdev);
+
+	return size;
+}
+
+static const struct file_operations dvfs_mode_fops = {
+	.owner = THIS_MODULE,
+	.open = simple_open,
+	.write = dvfs_mode_fops_write,
+};
+
 static int fw_log_show(struct seq_file *s, void *v)
 {
 	struct ivpu_device *vdev = s->private;
@@ -280,6 +305,9 @@ void ivpu_debugfs_init(struct ivpu_device *vdev)
 	debugfs_create_file("force_recovery", 0200, debugfs_root, vdev,
 			    &ivpu_force_recovery_fops);
 
+	debugfs_create_file("dvfs_mode", 0200, debugfs_root, vdev,
+			    &dvfs_mode_fops);
+
 	debugfs_create_file("fw_log", 0644, debugfs_root, vdev,
 			    &fw_log_fops);
 	debugfs_create_file("fw_trace_destination_mask", 0200, debugfs_root, vdev,
diff --git a/drivers/accel/ivpu/ivpu_fw.c b/drivers/accel/ivpu/ivpu_fw.c
index 691da521dde5..a4149fc8a1d7 100644
--- a/drivers/accel/ivpu/ivpu_fw.c
+++ b/drivers/accel/ivpu/ivpu_fw.c
@@ -182,6 +182,8 @@ static int ivpu_fw_parse(struct ivpu_device *vdev)
 	fw->trace_destination_mask = VPU_TRACE_DESTINATION_VERBOSE_TRACING;
 	fw->trace_hw_component_mask = -1;
 
+	fw->dvfs_mode = 0;
+
 	ivpu_dbg(vdev, FW_BOOT, "Size: file %lu image %u runtime %u shavenn %u\n",
 		 fw->file->size, fw->image_size, fw->runtime_size, fw->shave_nn_size);
 	ivpu_dbg(vdev, FW_BOOT, "Address: runtime 0x%llx, load 0x%llx, entry point 0x%llx\n",
@@ -422,6 +424,8 @@ static void ivpu_fw_boot_params_print(struct ivpu_device *vdev, struct vpu_boot_
 		 boot_params->punit_telemetry_sram_size);
 	ivpu_dbg(vdev, FW_BOOT, "boot_params.vpu_telemetry_enable = 0x%x\n",
 		 boot_params->vpu_telemetry_enable);
+	ivpu_dbg(vdev, FW_BOOT, "boot_params.dvfs_mode = %u\n",
+		 boot_params->dvfs_mode);
 }
 
 void ivpu_fw_boot_params_setup(struct ivpu_device *vdev, struct vpu_boot_params *boot_params)
@@ -493,6 +497,7 @@ void ivpu_fw_boot_params_setup(struct ivpu_device *vdev, struct vpu_boot_params
 	boot_params->punit_telemetry_sram_base = ivpu_hw_reg_telemetry_offset_get(vdev);
 	boot_params->punit_telemetry_sram_size = ivpu_hw_reg_telemetry_size_get(vdev);
 	boot_params->vpu_telemetry_enable = ivpu_hw_reg_telemetry_enable_get(vdev);
+	boot_params->dvfs_mode = vdev->fw->dvfs_mode;
 
 	wmb(); /* Flush WC buffers after writing bootparams */
 
diff --git a/drivers/accel/ivpu/ivpu_fw.h b/drivers/accel/ivpu/ivpu_fw.h
index 10ae2847f0ef..66b60fa161b5 100644
--- a/drivers/accel/ivpu/ivpu_fw.h
+++ b/drivers/accel/ivpu/ivpu_fw.h
@@ -27,6 +27,7 @@ struct ivpu_fw_info {
 	u32 trace_level;
 	u32 trace_destination_mask;
 	u64 trace_hw_component_mask;
+	u32 dvfs_mode;
 };
 
 int ivpu_fw_init(struct ivpu_device *vdev);
-- 
2.25.1

