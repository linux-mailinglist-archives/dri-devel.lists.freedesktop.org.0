Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E9F8C4066
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 14:04:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1941110E713;
	Mon, 13 May 2024 12:04:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RXDCCqb6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DDF910E713
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 12:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715601886; x=1747137886;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=p6X4nMqf0zsdwNVfZWwmhpKTrsn7CeVqpAEj+AF33jo=;
 b=RXDCCqb6YhqzRiC6oKy3QUP0h1hD8Fv+//YbhooW+Hm9bQkmovWTRyka
 WzPi6aDOBt9XMm+gvpB/H2R5yDi6MrSbMGIz4FR1hQi2Jx0KOH2JqciBw
 fkeaZ3uXgZRGAqUOaqcbHlgxifintX934uSkeuQNrwUtQ22HO3dT3/YGy
 DViS45tQqS1uKlFwSKlh4jnAdSgWD0O0EMwyUkYua/E1yK+eTp7z9DWSy
 gGfNdF39rxoBHZSWPJjovNlr29EYIoGU+gWYTGvcd9kogjaV/XcCfFgV1
 fDe87eVwkjGt6GPEnNuW1z+98bltXheBplFbwAip5fthlPk6YIfUxIFGZ A==;
X-CSE-ConnectionGUID: qcFmFuJ1Qa+JX3Jzmn6BHg==
X-CSE-MsgGUID: A4M+2UhHRDOxgR7NwiPKHw==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="22131746"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="22131746"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 05:04:46 -0700
X-CSE-ConnectionGUID: 3M6vXRpMTOq7aHaDYiTMyQ==
X-CSE-MsgGUID: CBG6eyZXRR6iODBkmcS3Lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="30341079"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 05:04:44 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 "Wachowski, Karol" <karol.wachowski@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH v2 07/12] accel/ivpu: Add resume engine support
Date: Mon, 13 May 2024 14:04:26 +0200
Message-ID: <20240513120431.3187212-8-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240513120431.3187212-1-jacek.lawrynowicz@linux.intel.com>
References: <20240513120431.3187212-1-jacek.lawrynowicz@linux.intel.com>
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
command to VPU. It is used to test engine resume functionality in
driver user space tests.

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

