Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 353DF6C68EC
	for <lists+dri-devel@lfdr.de>; Thu, 23 Mar 2023 13:55:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9512910E529;
	Thu, 23 Mar 2023 12:55:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F93210E529
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 12:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679576116; x=1711112116;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hy9NCC1S4q9DWXISso1p30ZXUezfRLuJQpNWdcF5Jh0=;
 b=G/n3y8aQTKVRfHX5hBJw8kUpi9dPhHXacSOkmHFHGrU0zDeXM3iBjI0n
 JCw48SMCINIK4UykwOydDl5+47+YWBodpjNW6Pah0x9AojagtFGuDHbbq
 nuO0cxVu+A94Zsp1nTXLwxMUnkMQunZ3lgLd+p4vZp9jR4qqvKN21G6fi
 Se+tjhTzxjPEtq3Hb9dKNzkVGCQZXE7wJF+XVuYM/s1cuNGXdoJi9pzdI
 dbXOrciXwdmwzN+uvE8f9l33uw97TlUVjk7dedJ8f4GKgQtk4dqt2Qv2m
 VqjQJrbDIGr0HLYSOwVQVVooQvxeD1kHhEs/Qgez5ELh3c+jWz4hofIb6 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="404362708"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="404362708"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 05:55:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="682294648"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="682294648"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 05:55:14 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/8] accel/ivpu: Do not access HW registers after unbind
Date: Thu, 23 Mar 2023 13:54:57 +0100
Message-Id: <20230323125504.2586442-2-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230323125504.2586442-1-stanislaw.gruszka@linux.intel.com>
References: <20230323125504.2586442-1-stanislaw.gruszka@linux.intel.com>
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

We should not access hardware after we unbind from the bus.

Use drm_dev_enter() / drm_dev_exit() to mark code sections where
hardware is accessed (and not already protected by other locks)
and drm_dev_unplug() to mark device is gone.

Fixes: 35b137630f08 ("accel/ivpu: Introduce a new DRM driver for Intel VPU")
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
---
 drivers/accel/ivpu/ivpu_drv.c |  8 ++++++--
 drivers/accel/ivpu/ivpu_drv.h |  1 +
 drivers/accel/ivpu/ivpu_job.c | 11 +++++++++--
 3 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index 231f29bb5025..ac06bbfca920 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -8,7 +8,6 @@
 #include <linux/pci.h>
 
 #include <drm/drm_accel.h>
-#include <drm/drm_drv.h>
 #include <drm/drm_file.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_ioctl.h>
@@ -118,6 +117,10 @@ static int ivpu_get_param_ioctl(struct drm_device *dev, void *data, struct drm_f
 	struct pci_dev *pdev = to_pci_dev(vdev->drm.dev);
 	struct drm_ivpu_param *args = data;
 	int ret = 0;
+	int idx;
+
+	if (!drm_dev_enter(dev, &idx))
+		return -ENODEV;
 
 	switch (args->param) {
 	case DRM_IVPU_PARAM_DEVICE_ID:
@@ -171,6 +174,7 @@ static int ivpu_get_param_ioctl(struct drm_device *dev, void *data, struct drm_f
 		break;
 	}
 
+	drm_dev_exit(idx);
 	return ret;
 }
 
@@ -622,7 +626,7 @@ static void ivpu_remove(struct pci_dev *pdev)
 {
 	struct ivpu_device *vdev = pci_get_drvdata(pdev);
 
-	drm_dev_unregister(&vdev->drm);
+	drm_dev_unplug(&vdev->drm);
 	ivpu_dev_fini(vdev);
 }
 
diff --git a/drivers/accel/ivpu/ivpu_drv.h b/drivers/accel/ivpu/ivpu_drv.h
index f47b4965db2e..1b2aa05840ad 100644
--- a/drivers/accel/ivpu/ivpu_drv.h
+++ b/drivers/accel/ivpu/ivpu_drv.h
@@ -7,6 +7,7 @@
 #define __IVPU_DRV_H__
 
 #include <drm/drm_device.h>
+#include <drm/drm_drv.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_mm.h>
 #include <drm/drm_print.h>
diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
index 94068aedf97c..910301fae435 100644
--- a/drivers/accel/ivpu/ivpu_job.c
+++ b/drivers/accel/ivpu/ivpu_job.c
@@ -489,12 +489,12 @@ ivpu_job_prepare_bos_for_submit(struct drm_file *file, struct ivpu_job *job, u32
 
 int ivpu_submit_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 {
-	int ret = 0;
 	struct ivpu_file_priv *file_priv = file->driver_priv;
 	struct ivpu_device *vdev = file_priv->vdev;
 	struct drm_ivpu_submit *params = data;
 	struct ivpu_job *job;
 	u32 *buf_handles;
+	int idx, ret;
 
 	if (params->engine > DRM_IVPU_ENGINE_COPY)
 		return -EINVAL;
@@ -523,6 +523,11 @@ int ivpu_submit_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		goto free_handles;
 	}
 
+	if (!drm_dev_enter(&vdev->drm, &idx)) {
+		ret = -ENODEV;
+		goto free_handles;
+	}
+
 	ivpu_dbg(vdev, JOB, "Submit ioctl: ctx %u buf_count %u\n",
 		 file_priv->ctx.id, params->buffer_count);
 
@@ -530,7 +535,7 @@ int ivpu_submit_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	if (!job) {
 		ivpu_err(vdev, "Failed to create job\n");
 		ret = -ENOMEM;
-		goto free_handles;
+		goto dev_exit;
 	}
 
 	ret = ivpu_job_prepare_bos_for_submit(file, job, buf_handles, params->buffer_count,
@@ -548,6 +553,8 @@ int ivpu_submit_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 
 job_put:
 	job_put(job);
+dev_exit:
+	drm_dev_exit(idx);
 free_handles:
 	kfree(buf_handles);
 
-- 
2.25.1

