Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F896797080
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 09:26:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D3C110E042;
	Thu,  7 Sep 2023 07:26:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF0C310E042
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Sep 2023 07:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694071597; x=1725607597;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FLMAicLfW53sORQW4+hobReH+ID3jrSTHo0d4ETP/Fo=;
 b=aCKGpbom0F5dYmi327hQ9pADt2sROkFq57ojB1AofWEmCrL2A39XmEwZ
 VcFQjAPuy6YTAkgSQ50g1SrwVTasWbxsn5y5duIlK6BKpM1stB8+k+R6H
 8AZmvWJAZw+jxdcHpZcjiDFxo5wlvQ9Utz2nZo7sYHntihRlxxGl0fR4X
 wByN7BPlmuYAeSh+fh6kzwq5LRDo9zR1ItBWS4NXm0QD8fa9HNsP5J5mM
 9mcVFV/bSlZXDuRo+F0hNb5cK8GBw2/pHVFiXZsL4d+eVD7pvWOK3w11c
 v+ubAAQ3i0vrcsnr2TRXQFLTYaEdlGu15ETr2XkqyME3BdxQGFpyExCGI A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="379994001"
X-IronPort-AV: E=Sophos;i="6.02,234,1688454000"; d="scan'208";a="379994001"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 00:26:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="865528384"
X-IronPort-AV: E=Sophos;i="6.02,234,1688454000"; d="scan'208";a="865528384"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 00:26:12 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] accel/ivpu: Update debugfs to latest changes in DRM
Date: Thu,  7 Sep 2023 09:26:09 +0200
Message-Id: <20230907072610.433497-1-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
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

Use new drm debugfs helpers. This is needed after changes from
commit 78346ebf9f94 ("drm/debugfs: drop debugfs_init() for the render
and accel node v2").

Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_debugfs.c | 50 +++++++++++++++----------------
 drivers/accel/ivpu/ivpu_debugfs.h |  4 +--
 drivers/accel/ivpu/ivpu_drv.c     |  8 ++---
 3 files changed, 30 insertions(+), 32 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_debugfs.c b/drivers/accel/ivpu/ivpu_debugfs.c
index 5e5996fd4f9f..9163bc6bd3ef 100644
--- a/drivers/accel/ivpu/ivpu_debugfs.c
+++ b/drivers/accel/ivpu/ivpu_debugfs.c
@@ -17,20 +17,26 @@
 #include "ivpu_jsm_msg.h"
 #include "ivpu_pm.h"
 
+static inline struct ivpu_device *seq_to_ivpu(struct seq_file *s)
+{
+	struct drm_debugfs_entry *entry = s->private;
+
+	return to_ivpu_device(entry->dev);
+}
+
 static int bo_list_show(struct seq_file *s, void *v)
 {
-	struct drm_info_node *node = (struct drm_info_node *)s->private;
 	struct drm_printer p = drm_seq_file_printer(s);
+	struct ivpu_device *vdev = seq_to_ivpu(s);
 
-	ivpu_bo_list(node->minor->dev, &p);
+	ivpu_bo_list(&vdev->drm, &p);
 
 	return 0;
 }
 
 static int fw_name_show(struct seq_file *s, void *v)
 {
-	struct drm_info_node *node = (struct drm_info_node *)s->private;
-	struct ivpu_device *vdev = to_ivpu_device(node->minor->dev);
+	struct ivpu_device *vdev = seq_to_ivpu(s);
 
 	seq_printf(s, "%s\n", vdev->fw->name);
 	return 0;
@@ -38,8 +44,7 @@ static int fw_name_show(struct seq_file *s, void *v)
 
 static int fw_trace_capability_show(struct seq_file *s, void *v)
 {
-	struct drm_info_node *node = (struct drm_info_node *)s->private;
-	struct ivpu_device *vdev = to_ivpu_device(node->minor->dev);
+	struct ivpu_device *vdev = seq_to_ivpu(s);
 	u64 trace_hw_component_mask;
 	u32 trace_destination_mask;
 	int ret;
@@ -57,8 +62,7 @@ static int fw_trace_capability_show(struct seq_file *s, void *v)
 
 static int fw_trace_config_show(struct seq_file *s, void *v)
 {
-	struct drm_info_node *node = (struct drm_info_node *)s->private;
-	struct ivpu_device *vdev = to_ivpu_device(node->minor->dev);
+	struct ivpu_device *vdev = seq_to_ivpu(s);
 	/**
 	 * WA: VPU_JSM_MSG_TRACE_GET_CONFIG command is not working yet,
 	 * so we use values from vdev->fw instead of calling ivpu_jsm_trace_get_config()
@@ -78,8 +82,7 @@ static int fw_trace_config_show(struct seq_file *s, void *v)
 
 static int last_bootmode_show(struct seq_file *s, void *v)
 {
-	struct drm_info_node *node = (struct drm_info_node *)s->private;
-	struct ivpu_device *vdev = to_ivpu_device(node->minor->dev);
+	struct ivpu_device *vdev = seq_to_ivpu(s);
 
 	seq_printf(s, "%s\n", (vdev->pm->is_warmboot) ? "warmboot" : "coldboot");
 
@@ -88,8 +91,7 @@ static int last_bootmode_show(struct seq_file *s, void *v)
 
 static int reset_counter_show(struct seq_file *s, void *v)
 {
-	struct drm_info_node *node = (struct drm_info_node *)s->private;
-	struct ivpu_device *vdev = to_ivpu_device(node->minor->dev);
+	struct ivpu_device *vdev = seq_to_ivpu(s);
 
 	seq_printf(s, "%d\n", atomic_read(&vdev->pm->reset_counter));
 	return 0;
@@ -97,14 +99,13 @@ static int reset_counter_show(struct seq_file *s, void *v)
 
 static int reset_pending_show(struct seq_file *s, void *v)
 {
-	struct drm_info_node *node = (struct drm_info_node *)s->private;
-	struct ivpu_device *vdev = to_ivpu_device(node->minor->dev);
+	struct ivpu_device *vdev = seq_to_ivpu(s);
 
 	seq_printf(s, "%d\n", atomic_read(&vdev->pm->in_reset));
 	return 0;
 }
 
-static const struct drm_info_list vdev_debugfs_list[] = {
+static const struct drm_debugfs_info vdev_debugfs_list[] = {
 	{"bo_list", bo_list_show, 0},
 	{"fw_name", fw_name_show, 0},
 	{"fw_trace_capability", fw_trace_capability_show, 0},
@@ -270,25 +271,22 @@ static const struct file_operations ivpu_reset_engine_fops = {
 	.write = ivpu_reset_engine_fn,
 };
 
-void ivpu_debugfs_init(struct drm_minor *minor)
+void ivpu_debugfs_init(struct ivpu_device *vdev)
 {
-	struct ivpu_device *vdev = to_ivpu_device(minor->dev);
-
-	drm_debugfs_create_files(vdev_debugfs_list, ARRAY_SIZE(vdev_debugfs_list),
-				 minor->debugfs_root, minor);
+	drm_debugfs_add_files(&vdev->drm, vdev_debugfs_list, ARRAY_SIZE(vdev_debugfs_list));
 
-	debugfs_create_file("force_recovery", 0200, minor->debugfs_root, vdev,
+	debugfs_create_file("force_recovery", 0200, vdev->drm.debugfs_root, vdev,
 			    &ivpu_force_recovery_fops);
 
-	debugfs_create_file("fw_log", 0644, minor->debugfs_root, vdev,
+	debugfs_create_file("fw_log", 0644, vdev->drm.debugfs_root, vdev,
 			    &fw_log_fops);
-	debugfs_create_file("fw_trace_destination_mask", 0200, minor->debugfs_root, vdev,
+	debugfs_create_file("fw_trace_destination_mask", 0200, vdev->drm.debugfs_root, vdev,
 			    &fw_trace_destination_mask_fops);
-	debugfs_create_file("fw_trace_hw_comp_mask", 0200, minor->debugfs_root, vdev,
+	debugfs_create_file("fw_trace_hw_comp_mask", 0200, vdev->drm.debugfs_root, vdev,
 			    &fw_trace_hw_comp_mask_fops);
-	debugfs_create_file("fw_trace_level", 0200, minor->debugfs_root, vdev,
+	debugfs_create_file("fw_trace_level", 0200, vdev->drm.debugfs_root, vdev,
 			    &fw_trace_level_fops);
 
-	debugfs_create_file("reset_engine", 0200, minor->debugfs_root, vdev,
+	debugfs_create_file("reset_engine", 0200, vdev->drm.debugfs_root, vdev,
 			    &ivpu_reset_engine_fops);
 }
diff --git a/drivers/accel/ivpu/ivpu_debugfs.h b/drivers/accel/ivpu/ivpu_debugfs.h
index 78f80c1e00e4..76dbce139772 100644
--- a/drivers/accel/ivpu/ivpu_debugfs.h
+++ b/drivers/accel/ivpu/ivpu_debugfs.h
@@ -6,8 +6,8 @@
 #ifndef __IVPU_DEBUGFS_H__
 #define __IVPU_DEBUGFS_H__
 
-struct drm_minor;
+struct ivpu_device;
 
-void ivpu_debugfs_init(struct drm_minor *minor);
+void ivpu_debugfs_init(struct ivpu_device *vdev);
 
 #endif /* __IVPU_DEBUGFS_H__ */
diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index fa0680ba9340..b6aaf9811355 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -395,10 +395,6 @@ static const struct drm_driver driver = {
 	.postclose = ivpu_postclose,
 	.gem_prime_import = ivpu_gem_prime_import,
 
-#if defined(CONFIG_DEBUG_FS)
-	.debugfs_init = ivpu_debugfs_init,
-#endif
-
 	.ioctls = ivpu_drm_ioctls,
 	.num_ioctls = ARRAY_SIZE(ivpu_drm_ioctls),
 	.fops = &ivpu_fops,
@@ -631,6 +627,10 @@ static int ivpu_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	if (ret)
 		return ret;
 
+#if defined(CONFIG_DEBUG_FS)
+	ivpu_debugfs_init(vdev);
+#endif
+
 	ret = drm_dev_register(&vdev->drm, 0);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to register DRM device: %d\n", ret);
-- 
2.25.1

