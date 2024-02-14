Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD508543DB
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 09:13:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E2C010E4AC;
	Wed, 14 Feb 2024 08:13:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VdKkfQlx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF26810E45C
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Feb 2024 08:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707898397; x=1739434397;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sAERx7qFMgV2r9jxHDzBEVSre2+FypJSXdNHojZEHo4=;
 b=VdKkfQlxdcLfoLzVmPR05wW15w1DZuBYVyQw6NFPwh1wKmzwWWxoDwgq
 yRGv1/fpaj85GYBRFFbrawbDPKHX5gdi8HNet45tzWw3RrXfkJGntBZXC
 0hBTnzkSbJ6P9bNmG8NXS817WK8I4/wYltZYtXw64Eqkn7adNuKh5U7fz
 9HvfaM6SzRdbLRZ5OyWdfWjeEVFqJSzSbOFHi31N7AhIeFhzJxbbHTDqF
 gZYJlPQYCfNIn0iyaevJ4kwgXZHzD1dxSdeW6ulSzcwUAa5vVQU4tGOD4
 nFFx8SjjZ1KuNPYi+/FrZUXfd2gEBoMGwoUOGS9/KEKtw0RXcdVsNkwWy A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="12651670"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; d="scan'208";a="12651670"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 00:13:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="3407418"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 00:13:16 -0800
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 6/8] accel/ivpu: Fix ivpu_reset_engine_fn merge issue
Date: Wed, 14 Feb 2024 09:13:03 +0100
Message-ID: <20240214081305.290108-7-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240214081305.290108-1-jacek.lawrynowicz@linux.intel.com>
References: <20240214081305.290108-1-jacek.lawrynowicz@linux.intel.com>
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

ivpu_reset_engine_fn and ivpu_reset_engine_fops were separated during
merge so move them back together to keep the file consistent.

Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_debugfs.c | 32 +++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_debugfs.c b/drivers/accel/ivpu/ivpu_debugfs.c
index 7cb962e21453..d09d29775b3f 100644
--- a/drivers/accel/ivpu/ivpu_debugfs.c
+++ b/drivers/accel/ivpu/ivpu_debugfs.c
@@ -286,22 +286,6 @@ static const struct file_operations fw_trace_level_fops = {
 	.write = fw_trace_level_fops_write,
 };
 
-static ssize_t
-ivpu_reset_engine_fn(struct file *file, const char __user *user_buf, size_t size, loff_t *pos)
-{
-	struct ivpu_device *vdev = file->private_data;
-
-	if (!size)
-		return -EINVAL;
-
-	if (ivpu_jsm_reset_engine(vdev, DRM_IVPU_ENGINE_COMPUTE))
-		return -ENODEV;
-	if (ivpu_jsm_reset_engine(vdev, DRM_IVPU_ENGINE_COPY))
-		return -ENODEV;
-
-	return size;
-}
-
 static ssize_t
 ivpu_force_recovery_fn(struct file *file, const char __user *user_buf, size_t size, loff_t *pos)
 {
@@ -327,6 +311,22 @@ static const struct file_operations ivpu_force_recovery_fops = {
 	.write = ivpu_force_recovery_fn,
 };
 
+static ssize_t
+ivpu_reset_engine_fn(struct file *file, const char __user *user_buf, size_t size, loff_t *pos)
+{
+	struct ivpu_device *vdev = file->private_data;
+
+	if (!size)
+		return -EINVAL;
+
+	if (ivpu_jsm_reset_engine(vdev, DRM_IVPU_ENGINE_COMPUTE))
+		return -ENODEV;
+	if (ivpu_jsm_reset_engine(vdev, DRM_IVPU_ENGINE_COPY))
+		return -ENODEV;
+
+	return size;
+}
+
 static const struct file_operations ivpu_reset_engine_fops = {
 	.owner = THIS_MODULE,
 	.open = simple_open,
-- 
2.43.0

