Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0397A98AD78
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 21:54:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A44B10E58B;
	Mon, 30 Sep 2024 19:54:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bgc+CFbh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D92110E590
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 19:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727726039; x=1759262039;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=t1P0r865FB5aaNn87u6B7veSyH/VbG2iTyARwCk3cN4=;
 b=bgc+CFbhJYJNZAYylnQYlsuVlfb7GnrNfbTx9KhmvJWNWYYbIfvbbpWO
 b0sUHYaZqIvVKnWNQqYLwjE0NMfcoRwWp+DoXtmwfF4cv6Jp62cLnrdto
 pWBuGWhGoTd/0gdyuRKjqlNvAlu2NxcvoPtZIjAAP6ulZO08K5wNS85x5
 Ryp/3J46LcOXpAf6pZKN/OG+xSHAAxWuNAnJUtHPxegI1xNDAsTuev/9+
 bkKDR9VEtUETU+jmSddWqy68fT2V2RtNKEF2OC85h+ZgBxrmBal1NcQC9
 uv92oaj9wXuCasmRdf1lqvqWVcF386CVj/c0CI6IgJopIYhGkSvo7yiYM g==;
X-CSE-ConnectionGUID: nr9lRTS4Qx2yFIaKh0TnXA==
X-CSE-MsgGUID: fnMzA30rTBulPLRE9RriRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="26962356"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="26962356"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 12:53:58 -0700
X-CSE-ConnectionGUID: bda3eswvTKGVTWuX74uceg==
X-CSE-MsgGUID: dqS6WyUMS6q+G/Yxl9r0YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="73370167"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 12:53:56 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH v2 21/31] accel/ivpu: Fix reset_engine debugfs file logic
Date: Mon, 30 Sep 2024 21:53:12 +0200
Message-ID: <20240930195322.461209-22-jacek.lawrynowicz@linux.intel.com>
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

The current reset_engine implementation unconditionally resets
all engines. Improve implementation to reset only the engine
requested by the user space to allow more granular testing.
Also use DEFINE_DEBUGFS_ATTRIBUTE() to simplify implementation.

Same changes applied to resume_engine debugfs file for consistency.

Signed-off-by: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_debugfs.c | 42 ++++++-------------------------
 1 file changed, 8 insertions(+), 34 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_debugfs.c b/drivers/accel/ivpu/ivpu_debugfs.c
index f873119e56fe2..8958145c49adb 100644
--- a/drivers/accel/ivpu/ivpu_debugfs.c
+++ b/drivers/accel/ivpu/ivpu_debugfs.c
@@ -337,49 +337,23 @@ static const struct file_operations ivpu_force_recovery_fops = {
 	.write = ivpu_force_recovery_fn,
 };
 
-static ssize_t
-ivpu_reset_engine_fn(struct file *file, const char __user *user_buf, size_t size, loff_t *pos)
+static int ivpu_reset_engine_fn(void *data, u64 val)
 {
-	struct ivpu_device *vdev = file->private_data;
-
-	if (!size)
-		return -EINVAL;
-
-	if (ivpu_jsm_reset_engine(vdev, DRM_IVPU_ENGINE_COMPUTE))
-		return -ENODEV;
-	if (ivpu_jsm_reset_engine(vdev, DRM_IVPU_ENGINE_COPY))
-		return -ENODEV;
+	struct ivpu_device *vdev = (struct ivpu_device *)data;
 
-	return size;
+	return ivpu_jsm_reset_engine(vdev, (u32)val);
 }
 
-static const struct file_operations ivpu_reset_engine_fops = {
-	.owner = THIS_MODULE,
-	.open = simple_open,
-	.write = ivpu_reset_engine_fn,
-};
+DEFINE_DEBUGFS_ATTRIBUTE(ivpu_reset_engine_fops, NULL, ivpu_reset_engine_fn, "0x%02llx\n");
 
-static ssize_t
-ivpu_resume_engine_fn(struct file *file, const char __user *user_buf, size_t size, loff_t *pos)
+static int ivpu_resume_engine_fn(void *data, u64 val)
 {
-	struct ivpu_device *vdev = file->private_data;
-
-	if (!size)
-		return -EINVAL;
-
-	if (ivpu_jsm_hws_resume_engine(vdev, DRM_IVPU_ENGINE_COMPUTE))
-		return -ENODEV;
-	if (ivpu_jsm_hws_resume_engine(vdev, DRM_IVPU_ENGINE_COPY))
-		return -ENODEV;
+	struct ivpu_device *vdev = (struct ivpu_device *)data;
 
-	return size;
+	return ivpu_jsm_hws_resume_engine(vdev, (u32)val);
 }
 
-static const struct file_operations ivpu_resume_engine_fops = {
-	.owner = THIS_MODULE,
-	.open = simple_open,
-	.write = ivpu_resume_engine_fn,
-};
+DEFINE_DEBUGFS_ATTRIBUTE(ivpu_resume_engine_fops, NULL, ivpu_resume_engine_fn, "0x%02llx\n");
 
 static int dct_active_get(void *data, u64 *active_percent)
 {
-- 
2.45.1

