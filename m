Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8A39DB630
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2024 12:03:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48B7110E333;
	Thu, 28 Nov 2024 11:03:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="FfJXlVxH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A16D10E324
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2024 11:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1732791778;
 bh=ZT87oCtHqSN+H/miUypKOHhbFtIg+p+f8bPhluyOgVA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FfJXlVxHOxewDFZ5hzam35BGF7BoDSX0GmaBwT/oeDfulSeFS6hKRfHFN2+uQs3Fa
 8lkgVNGa9J8zBBpgBlK7X4W4dMXWQ4vVjWeUAW4O/lcnktmaDNt9BvRDQGRu6jY54r
 Z2U3wcIhVrw9fh2yJbx8KQxEYsxgb/rggYhvxUgpoGEPzCevGqH76HVwNNw780T010
 oKZK0SrV/SM4mCY/xaDt6WUoOylkU10lRGX9XlZ8c8x31GGbsGRLFX1EHxcds6gTA1
 9FOUGwZ5RV1CcLYVPehGT3IC0zE6G3mGUEqMNADN/cyHJsmJhtxIj4rBTv0FrcnVgx
 rprATRtTzGZvw==
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 7F02A17E3612;
 Thu, 28 Nov 2024 12:02:58 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
	kernel@collabora.com
Subject: [PATCH v2 2/5] drm/panthor: Be robust against runtime PM resume
 failures in the suspend path
Date: Thu, 28 Nov 2024 12:02:51 +0100
Message-ID: <20241128110255.3182366-3-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241128110255.3182366-1-boris.brezillon@collabora.com>
References: <20241128110255.3182366-1-boris.brezillon@collabora.com>
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

The runtime PM resume operation is not guaranteed to succeed, but if it
fails, the device should be in a suspended state. Make sure we're robust
to resume failures in the unplug path.

v2:
- Move the bit that belonged in the next commit
- Drop the panthor_device_unplug() changes

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_fw.c  | 14 +++++++++-----
 drivers/gpu/drm/panthor/panthor_gpu.c |  3 ++-
 drivers/gpu/drm/panthor/panthor_mmu.c |  3 ++-
 3 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index ebf8980ca9a3..f3d3d8fbe13d 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -12,6 +12,7 @@
 #include <linux/iosys-map.h>
 #include <linux/mutex.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 
 #include <drm/drm_drv.h>
 #include <drm/drm_managed.h>
@@ -1190,11 +1191,13 @@ void panthor_fw_unplug(struct panthor_device *ptdev)
 
 	cancel_delayed_work_sync(&ptdev->fw->watchdog.ping_work);
 
-	/* Make sure the IRQ handler can be called after that point. */
-	if (ptdev->fw->irq.irq)
-		panthor_job_irq_suspend(&ptdev->fw->irq);
+	if (!IS_ENABLED(CONFIG_PM) || pm_runtime_active(ptdev->base.dev)) {
+		/* Make sure the IRQ handler can be called after that point. */
+		if (ptdev->fw->irq.irq)
+			panthor_job_irq_suspend(&ptdev->fw->irq);
 
-	panthor_fw_stop(ptdev);
+		panthor_fw_stop(ptdev);
+	}
 
 	list_for_each_entry(section, &ptdev->fw->sections, node)
 		panthor_kernel_bo_destroy(section->mem);
@@ -1207,7 +1210,8 @@ void panthor_fw_unplug(struct panthor_device *ptdev)
 	panthor_vm_put(ptdev->fw->vm);
 	ptdev->fw->vm = NULL;
 
-	panthor_gpu_power_off(ptdev, L2, ptdev->gpu_info.l2_present, 20000);
+	if (!IS_ENABLED(CONFIG_PM) || pm_runtime_active(ptdev->base.dev))
+		panthor_gpu_power_off(ptdev, L2, ptdev->gpu_info.l2_present, 20000);
 }
 
 /**
diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
index 0f3cac6ec88e..ee85a371bc38 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu.c
+++ b/drivers/gpu/drm/panthor/panthor_gpu.c
@@ -180,7 +180,8 @@ void panthor_gpu_unplug(struct panthor_device *ptdev)
 	unsigned long flags;
 
 	/* Make sure the IRQ handler is not running after that point. */
-	panthor_gpu_irq_suspend(&ptdev->gpu->irq);
+	if (!IS_ENABLED(CONFIG_PM) || pm_runtime_active(ptdev->base.dev))
+		panthor_gpu_irq_suspend(&ptdev->gpu->irq);
 
 	/* Wake-up all waiters. */
 	spin_lock_irqsave(&ptdev->gpu->reqs_lock, flags);
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index 9478ee2093d1..6716463903bc 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -2681,7 +2681,8 @@ int panthor_vm_prepare_mapped_bos_resvs(struct drm_exec *exec, struct panthor_vm
  */
 void panthor_mmu_unplug(struct panthor_device *ptdev)
 {
-	panthor_mmu_irq_suspend(&ptdev->mmu->irq);
+	if (!IS_ENABLED(CONFIG_PM) || pm_runtime_active(ptdev->base.dev))
+		panthor_mmu_irq_suspend(&ptdev->mmu->irq);
 
 	mutex_lock(&ptdev->mmu->as.slots_lock);
 	for (u32 i = 0; i < ARRAY_SIZE(ptdev->mmu->as.slots); i++) {
-- 
2.46.2

