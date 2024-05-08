Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FF28BFE99
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 15:21:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39A5F1129CD;
	Wed,  8 May 2024 13:21:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LZ/jJVAp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12A8C112950
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2024 13:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715174483; x=1746710483;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qOfPDfXkCJcrDS1At/VASms4LXIgcX7tF5nmL0tzW60=;
 b=LZ/jJVApGBMID5wCJhf8l3SXxQeIY5vp6MwFnEWUv44ShEj+HqHmKSOd
 5ObD9WW3eBnAe9R9EzFUB/0vd29lV53SvoXutddk6SffuGIqpPiU7/tLv
 fn9CPAW+T9kcLo+lZTzCjlLXrmlHTEScUN2z34jkVCFvWnurPUmq2EwJ5
 KYbYRVFdW+nxkfw+oTSo6JxTfHaEUrW+Yl90+wPPERJTXIg4VeeFx2WZM
 8Jt7JzADe/22rSH3jBRGMcf6u8libpRngs/9QiX7goEMRwKE3tUMSLxoJ
 GRWXnbmxXEXQll4nmJ1H0zWgqvILBdbkViNM63QT0L48t89n+e5lUnIzv A==;
X-CSE-ConnectionGUID: U+A9q5pYRJeYLj9TKqMXrw==
X-CSE-MsgGUID: vJqLbyDnScyRD4VXiqUM4g==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="33540067"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="33540067"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 06:21:23 -0700
X-CSE-ConnectionGUID: PwfzFoFhTki38AubCaXT4g==
X-CSE-MsgGUID: UtZabEuKR+Cv3ekPZlNM6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="29289382"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 06:21:21 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 "Wachowski, Karol" <karol.wachowski@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 07/12] accel/ivpu: Add resume engine support
Date: Wed,  8 May 2024 15:21:04 +0200
Message-ID: <20240508132106.2387464-8-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240508132106.2387464-1-jacek.lawrynowicz@linux.intel.com>
References: <20240508132106.2387464-1-jacek.lawrynowicz@linux.intel.com>
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

From: "Wachowski, Karol" <karol.wachowski@intel.com>

Create debugfs interface that triggers sending resume engine IPC
command to VPU.

Signed-off-by: Wachowski, Karol <karol.wachowski@intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_debugfs.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/accel/ivpu/ivpu_debugfs.c b/drivers/accel/ivpu/ivpu_debugfs.c
index e07e447d08d1..6ff967e595cf 100644
--- a/drivers/accel/ivpu/ivpu_debugfs.c
+++ b/drivers/accel/ivpu/ivpu_debugfs.c
@@ -335,6 +335,28 @@ static const struct file_operations ivpu_reset_engine_fops = {
 	.write = ivpu_reset_engine_fn,
 };
 
+static ssize_t
+ivpu_resume_engine_fn(struct file *file, const char __user *user_buf, size_t size, loff_t *pos)
+{
+	struct ivpu_device *vdev = file->private_data;
+
+	if (!size)
+		return -EINVAL;
+
+	if (ivpu_jsm_hws_resume_engine(vdev, DRM_IVPU_ENGINE_COMPUTE))
+		return -ENODEV;
+	if (ivpu_jsm_hws_resume_engine(vdev, DRM_IVPU_ENGINE_COPY))
+		return -ENODEV;
+
+	return size;
+}
+
+static const struct file_operations ivpu_resume_engine_fops = {
+	.owner = THIS_MODULE,
+	.open = simple_open,
+	.write = ivpu_resume_engine_fn,
+};
+
 void ivpu_debugfs_init(struct ivpu_device *vdev)
 {
 	struct dentry *debugfs_root = vdev->drm.debugfs_root;
@@ -358,6 +380,8 @@ void ivpu_debugfs_init(struct ivpu_device *vdev)
 
 	debugfs_create_file("reset_engine", 0200, debugfs_root, vdev,
 			    &ivpu_reset_engine_fops);
+	debugfs_create_file("resume_engine", 0200, debugfs_root, vdev,
+			    &ivpu_resume_engine_fops);
 
 	if (ivpu_hw_gen(vdev) >= IVPU_HW_40XX)
 		debugfs_create_file("fw_profiling_freq_drive", 0200,
-- 
2.43.2

