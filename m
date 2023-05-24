Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B0170EFDB
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 09:49:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9741910E5A9;
	Wed, 24 May 2023 07:49:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B14EE10E58C
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 07:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684914589; x=1716450589;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SWba2PmSfk3d66H9+cwWgr8whBtffjrnF1Sz4N9Sts8=;
 b=UF9/5zdi+cWmzbf1q35pphbqA4HayLxsepuVRjgW0HiQJa+Qxkcqw9AL
 Fw/RuanJ8q/vmr3DduAGiIVatHIY1KjGEW4m7LXnVpQ56d4hWrsiMIOxd
 LylovDQz1DctPZBA6ZRQslpCMs4fCtWuGmnrC89R2A70ENu4HLJGToupb
 1hhsgSKrLYTf835yG0n3y9OdIOBKtHAzOpIjq7GP/B7flLN78hqprVPh+
 LIAnanmyldxQT5HK/Za/96Wqlfpc7rWSUnSe2ID9N/WpmXdcMGMBYIvcr
 fSNH6um11XhNWKyamfT5tNOfuet3gySW0B8VbTWzrQk5N79XVM206aQ9J A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="419200815"
X-IronPort-AV: E=Sophos;i="6.00,188,1681196400"; d="scan'208";a="419200815"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 00:49:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="681767753"
X-IronPort-AV: E=Sophos;i="6.00,188,1681196400"; d="scan'208";a="681767753"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 00:49:48 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/5] accel/ivpu: Add debugfs files for testing device reset
Date: Wed, 24 May 2023 09:48:45 +0200
Message-Id: <20230524074847.866711-4-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230524074847.866711-1-stanislaw.gruszka@linux.intel.com>
References: <20230524074847.866711-1-stanislaw.gruszka@linux.intel.com>
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
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add new debugfs files to validate device recovery functionality.

Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_debugfs.c | 41 +++++++++++++++++++++++++++++++
 drivers/accel/ivpu/ivpu_pm.c      |  1 +
 drivers/accel/ivpu/ivpu_pm.h      |  1 +
 3 files changed, 43 insertions(+)

diff --git a/drivers/accel/ivpu/ivpu_debugfs.c b/drivers/accel/ivpu/ivpu_debugfs.c
index a9180fae43b6..e2502d2b53c0 100644
--- a/drivers/accel/ivpu/ivpu_debugfs.c
+++ b/drivers/accel/ivpu/ivpu_debugfs.c
@@ -77,11 +77,31 @@ static int last_bootmode_show(struct seq_file *s, void *v)
 	return 0;
 }
 
+static int reset_counter_show(struct seq_file *s, void *v)
+{
+	struct drm_info_node *node = (struct drm_info_node *)s->private;
+	struct ivpu_device *vdev = to_ivpu_device(node->minor->dev);
+
+	seq_printf(s, "%d\n", atomic_read(&vdev->pm->reset_counter));
+	return 0;
+}
+
+static int reset_pending_show(struct seq_file *s, void *v)
+{
+	struct drm_info_node *node = (struct drm_info_node *)s->private;
+	struct ivpu_device *vdev = to_ivpu_device(node->minor->dev);
+
+	seq_printf(s, "%d\n", atomic_read(&vdev->pm->in_reset));
+	return 0;
+}
+
 static const struct drm_info_list vdev_debugfs_list[] = {
 	{"bo_list", bo_list_show, 0},
 	{"fw_trace_capability", fw_trace_capability_show, 0},
 	{"fw_trace_config", fw_trace_config_show, 0},
 	{"last_bootmode", last_bootmode_show, 0},
+	{"reset_counter", reset_counter_show, 0},
+	{"reset_pending", reset_pending_show, 0},
 };
 
 static int fw_log_show(struct seq_file *s, void *v)
@@ -216,6 +236,24 @@ ivpu_reset_engine_fn(struct file *file, const char __user *user_buf, size_t size
 	return size;
 }
 
+static ssize_t
+ivpu_force_recovery_fn(struct file *file, const char __user *user_buf, size_t size, loff_t *pos)
+{
+	struct ivpu_device *vdev = file->private_data;
+
+	if (!size)
+		return -EINVAL;
+
+	ivpu_pm_schedule_recovery(vdev);
+	return size;
+}
+
+static const struct file_operations ivpu_force_recovery_fops = {
+	.owner = THIS_MODULE,
+	.open = simple_open,
+	.write = ivpu_force_recovery_fn,
+};
+
 static const struct file_operations ivpu_reset_engine_fops = {
 	.owner = THIS_MODULE,
 	.open = simple_open,
@@ -229,6 +267,9 @@ void ivpu_debugfs_init(struct drm_minor *minor)
 	drm_debugfs_create_files(vdev_debugfs_list, ARRAY_SIZE(vdev_debugfs_list),
 				 minor->debugfs_root, minor);
 
+	debugfs_create_file("force_recovery", 0200, minor->debugfs_root, vdev,
+			    &ivpu_force_recovery_fops);
+
 	debugfs_create_file("fw_log", 0644, minor->debugfs_root, vdev,
 			    &fw_log_fops);
 	debugfs_create_file("fw_trace_destination_mask", 0200, minor->debugfs_root, vdev,
diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
index aa4d56dc52b3..e6f27daf5560 100644
--- a/drivers/accel/ivpu/ivpu_pm.c
+++ b/drivers/accel/ivpu/ivpu_pm.c
@@ -259,6 +259,7 @@ void ivpu_pm_reset_prepare_cb(struct pci_dev *pdev)
 	pm_runtime_get_sync(vdev->drm.dev);
 
 	ivpu_dbg(vdev, PM, "Pre-reset..\n");
+	atomic_inc(&vdev->pm->reset_counter);
 	atomic_set(&vdev->pm->in_reset, 1);
 	ivpu_shutdown(vdev);
 	ivpu_pm_prepare_cold_boot(vdev);
diff --git a/drivers/accel/ivpu/ivpu_pm.h b/drivers/accel/ivpu/ivpu_pm.h
index baca98187255..fd4eada1290f 100644
--- a/drivers/accel/ivpu/ivpu_pm.h
+++ b/drivers/accel/ivpu/ivpu_pm.h
@@ -14,6 +14,7 @@ struct ivpu_pm_info {
 	struct ivpu_device *vdev;
 	struct work_struct recovery_work;
 	atomic_t in_reset;
+	atomic_t reset_counter;
 	bool is_warmboot;
 	u32 suspend_reschedule_counter;
 };
-- 
2.25.1

