Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39AA598402E
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 10:18:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9613710E65E;
	Tue, 24 Sep 2024 08:18:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bsd1gN6a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BF7E10E65E
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 08:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727165912; x=1758701912;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xiNlq2LtLYe6v7vliwTawBUH2IQOJa3G0LrAQ0q+LY4=;
 b=bsd1gN6aw9Cmzz9tL3WSmPrEhZ4IoZD2+t1FtS3C5lJRa20NR4XozXtb
 TenhvKLr+GsFBHSLSNLOANG38WlBf+rqbNi/YkZ98lRqLU+6x/QxdUIR2
 UtBuOTRBTlQqs8QIIGT2AJH7P7JhNP692GjVgfpCy8eEtlB5dI1G4iNv5
 8Q9lL/UeNZ5UAb45AlUCg6BajdUVLuVaDTZtR5d3wGxuVeUtnm9GiClts
 PBy99eIu1IAc0rRDavUSOJ153NzUWfX1WeNKb2aZtKWUEXaal07lNqg96
 H6+K0rNbwiNaVmdpm6LyqsN9M/ag7Ez5nvq6Fd8NBpMhZuYNGN/owu+vT A==;
X-CSE-ConnectionGUID: yGR30/iiS3mfTKAcI5IdVw==
X-CSE-MsgGUID: U6jVXoT8T6yCXlGlQLEAww==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="37506939"
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; d="scan'208";a="37506939"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 01:18:32 -0700
X-CSE-ConnectionGUID: 0ycdbieTSCakmDx9VkfFPA==
X-CSE-MsgGUID: eXuOx0SoSCaawP3t8oLCoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; d="scan'208";a="102170697"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 01:18:30 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 12/29] accel/ivpu: Allow reading dvfs_mode debugfs file
Date: Tue, 24 Sep 2024 10:17:37 +0200
Message-ID: <20240924081754.209728-13-jacek.lawrynowicz@linux.intel.com>
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

From: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>

Make the dvfs_mode read-write to allow checking current mode.
Simplify the dvfs_mode implementation with the DEFINE_DEBUGFS_ATTRIBUTE.

Signed-off-by: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_debugfs.c | 33 +++++++++++--------------------
 1 file changed, 12 insertions(+), 21 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_debugfs.c b/drivers/accel/ivpu/ivpu_debugfs.c
index 65245f45cc701..f788ace8f318f 100644
--- a/drivers/accel/ivpu/ivpu_debugfs.c
+++ b/drivers/accel/ivpu/ivpu_debugfs.c
@@ -130,32 +130,23 @@ static const struct drm_debugfs_info vdev_debugfs_list[] = {
 	{"reset_pending", reset_pending_show, 0},
 };
 
-static ssize_t
-dvfs_mode_fops_write(struct file *file, const char __user *user_buf, size_t size, loff_t *pos)
+static int dvfs_mode_get(void *data, u64 *dvfs_mode)
 {
-	struct ivpu_device *vdev = file->private_data;
-	struct ivpu_fw_info *fw = vdev->fw;
-	u32 dvfs_mode;
-	int ret;
+	struct ivpu_device *vdev = (struct ivpu_device *)data;
 
-	ret = kstrtou32_from_user(user_buf, size, 0, &dvfs_mode);
-	if (ret < 0)
-		return ret;
-
-	fw->dvfs_mode = dvfs_mode;
+	*dvfs_mode = vdev->fw->dvfs_mode;
+	return 0;
+}
 
-	ret = pci_try_reset_function(to_pci_dev(vdev->drm.dev));
-	if (ret)
-		return ret;
+static int dvfs_mode_set(void *data, u64 dvfs_mode)
+{
+	struct ivpu_device *vdev = (struct ivpu_device *)data;
 
-	return size;
+	vdev->fw->dvfs_mode = (u32)dvfs_mode;
+	return pci_try_reset_function(to_pci_dev(vdev->drm.dev));
 }
 
-static const struct file_operations dvfs_mode_fops = {
-	.owner = THIS_MODULE,
-	.open = simple_open,
-	.write = dvfs_mode_fops_write,
-};
+DEFINE_DEBUGFS_ATTRIBUTE(dvfs_mode_fops, dvfs_mode_get, dvfs_mode_set, "%llu\n");
 
 static ssize_t
 fw_dyndbg_fops_write(struct file *file, const char __user *user_buf, size_t size, loff_t *pos)
@@ -435,7 +426,7 @@ void ivpu_debugfs_init(struct ivpu_device *vdev)
 	debugfs_create_file("force_recovery", 0200, debugfs_root, vdev,
 			    &ivpu_force_recovery_fops);
 
-	debugfs_create_file("dvfs_mode", 0200, debugfs_root, vdev,
+	debugfs_create_file("dvfs_mode", 0644, debugfs_root, vdev,
 			    &dvfs_mode_fops);
 
 	debugfs_create_file("fw_dyndbg", 0200, debugfs_root, vdev,
-- 
2.45.1

