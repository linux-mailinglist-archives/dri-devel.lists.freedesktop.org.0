Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFEB798AD6F
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 21:53:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FD5410E587;
	Mon, 30 Sep 2024 19:53:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lB3h6wy/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9103E10E57D
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 19:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727726028; x=1759262028;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tA83NSEukwzz/wuE2VjKEDeuH9z8MXgS4eOuplDA7iE=;
 b=lB3h6wy/J8oEbxtzUXDJx0EYokc1LXREUiDugyqCbdqmeityZy6E8UzG
 4bVTRVq+z570WXu3LpB6eTlE8rw3LlgKR3ucVmaPDjZXemjwOtr4u3kev
 fRCQBIh7qxojC0h6iPhLU8ZMsVp2EfnarS9rUE8BzrEEkf2aJkKWT5GpF
 bfu8z4XbgGF0Io589Y6lgvj7DRpetav2rK8cW32EZigbjb0uIo78/uFTh
 w5UgOU0p97htXLAqlFsTNf0r4LTkHo6jqu8425b9ohwaTWU1DWrLa1ypq
 CBsfY6nDpkpsoS9E4ZULqKwh/JQeO1cNo+QbqD4Jtd4EYtnVqELyDyg5k A==;
X-CSE-ConnectionGUID: iI+NP6iCScamaY/mD1rYhQ==
X-CSE-MsgGUID: 54e1qLbZQZCvKAmXWYuQqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="26962329"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="26962329"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 12:53:48 -0700
X-CSE-ConnectionGUID: THwHKsY+TGaGJRN3ygGbHA==
X-CSE-MsgGUID: SiWnWuMNR5CmW0cOJtfSZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="73370069"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 12:53:46 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH v2 14/31] accel/ivpu: Allow reading dvfs_mode debugfs file
Date: Mon, 30 Sep 2024 21:53:05 +0200
Message-ID: <20240930195322.461209-15-jacek.lawrynowicz@linux.intel.com>
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

From: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>

Make the dvfs_mode read-write to allow checking current mode.
Simplify the dvfs_mode implementation with the DEFINE_DEBUGFS_ATTRIBUTE.

Signed-off-by: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_debugfs.c | 33 +++++++++++--------------------
 1 file changed, 12 insertions(+), 21 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_debugfs.c b/drivers/accel/ivpu/ivpu_debugfs.c
index 55dc2d883b444..f873119e56fe2 100644
--- a/drivers/accel/ivpu/ivpu_debugfs.c
+++ b/drivers/accel/ivpu/ivpu_debugfs.c
@@ -127,32 +127,23 @@ static const struct drm_debugfs_info vdev_debugfs_list[] = {
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
@@ -432,7 +423,7 @@ void ivpu_debugfs_init(struct ivpu_device *vdev)
 	debugfs_create_file("force_recovery", 0200, debugfs_root, vdev,
 			    &ivpu_force_recovery_fops);
 
-	debugfs_create_file("dvfs_mode", 0200, debugfs_root, vdev,
+	debugfs_create_file("dvfs_mode", 0644, debugfs_root, vdev,
 			    &dvfs_mode_fops);
 
 	debugfs_create_file("fw_dyndbg", 0200, debugfs_root, vdev,
-- 
2.45.1

