Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4CF79707F
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 09:26:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69BFD10E779;
	Thu,  7 Sep 2023 07:26:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D74A810E779
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Sep 2023 07:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694071597; x=1725607597;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X3NG2zeR5tcpXop2Sny6Nm+bAj3pzYIHN6WVG/q84dI=;
 b=fUNOkSwvUbXDHPFATbh08wwtuQPIrh/dSC+DzABtGx8Zr0svK64sx0VZ
 uUDckN2azR5VbLyw/pHHzu9tKp0Y0gZnLhDXA79Q7BkIZ5oUe12zbzpIq
 ae9u19V1+8UP5nsbph4cjG8N613tb6urddGkZ5rRFJMVo4hQfCoUfDMg5
 LICmlTDtHWYhnpI8S+YW1t1Y62ydXef0C2+tdEgvVxACIVwTkXeciVkoQ
 QOkoezqjYrrJ2sTZ0yNBXsBRXWlShCSFJsotRcFh5fcdu+siOefCY6TSm
 cfq6UqFE1kZXIqNkNSQIjurhs9jXcALEhfuc7f4vKQo46pqYbxG9UODbu A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="379994007"
X-IronPort-AV: E=Sophos;i="6.02,234,1688454000"; d="scan'208";a="379994007"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 00:26:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="865528389"
X-IronPort-AV: E=Sophos;i="6.02,234,1688454000"; d="scan'208";a="865528389"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 00:26:16 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] accel/ivpu: Compile ivpu_debugfs.c conditionally
Date: Thu,  7 Sep 2023 09:26:10 +0200
Message-Id: <20230907072610.433497-2-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230907072610.433497-1-stanislaw.gruszka@linux.intel.com>
References: <20230907072610.433497-1-stanislaw.gruszka@linux.intel.com>
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

Only compile ivpu_debugfs.c file with CONFIG_DEBUG_FS.

Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/Makefile       | 3 ++-
 drivers/accel/ivpu/ivpu_debugfs.h | 4 ++++
 drivers/accel/ivpu/ivpu_drv.c     | 2 --
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/ivpu/Makefile b/drivers/accel/ivpu/Makefile
index e4328b430564..95ff7ad16338 100644
--- a/drivers/accel/ivpu/Makefile
+++ b/drivers/accel/ivpu/Makefile
@@ -2,7 +2,6 @@
 # Copyright (C) 2023 Intel Corporation
 
 intel_vpu-y := \
-	ivpu_debugfs.o \
 	ivpu_drv.o \
 	ivpu_fw.o \
 	ivpu_fw_log.o \
@@ -16,4 +15,6 @@ intel_vpu-y := \
 	ivpu_mmu_context.o \
 	ivpu_pm.o
 
+intel_vpu-$(CONFIG_DEBUG_FS) += ivpu_debugfs.o
+
 obj-$(CONFIG_DRM_ACCEL_IVPU) += intel_vpu.o
diff --git a/drivers/accel/ivpu/ivpu_debugfs.h b/drivers/accel/ivpu/ivpu_debugfs.h
index 76dbce139772..49ae9ea78287 100644
--- a/drivers/accel/ivpu/ivpu_debugfs.h
+++ b/drivers/accel/ivpu/ivpu_debugfs.h
@@ -8,6 +8,10 @@
 
 struct ivpu_device;
 
+#if defined(CONFIG_DEBUG_FS)
 void ivpu_debugfs_init(struct ivpu_device *vdev);
+#else
+static inline void ivpu_debugfs_init(struct ivpu_device *vdev) { }
+#endif
 
 #endif /* __IVPU_DEBUGFS_H__ */
diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index b6aaf9811355..7851ff7773ca 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -627,9 +627,7 @@ static int ivpu_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	if (ret)
 		return ret;
 
-#if defined(CONFIG_DEBUG_FS)
 	ivpu_debugfs_init(vdev);
-#endif
 
 	ret = drm_dev_register(&vdev->drm, 0);
 	if (ret) {
-- 
2.25.1

