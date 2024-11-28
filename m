Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF3F9DB62C
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2024 12:03:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A4D210E324;
	Thu, 28 Nov 2024 11:03:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="RGSqDBSJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5046810E324
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2024 11:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1732791780;
 bh=QGvMlYlii5qdICw4gPjwk4B9z8yOL+5LgIDXDRdcUYA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RGSqDBSJ7HmyM1ATcpVJKPMJbAlzy74Yrt+BWDJdwVjF6p0/zYOa4rvED48QX+f8O
 GaSTVkocJYbj5zLVZE0Y4rolG9wNHwPYzSoLac1lAx19KR2NJ2OedW6w6VjiwPDQF9
 cYte7qD5tfP7WW413SC/HfiAGbk1YzYRQb78JHSRRmdHkIf2YdYy+mxKaynUzI1T37
 FaqRkQ5ZI1wmao/g28ZG8jVFSrRy2UmjjLvQdn6mCz0n023bplxzeCC+Ckl3UcWPNd
 wNolntpWdzCBU4D42t0mK1JDgh5+4YiwlatVWsRWqyV4rdi1N+tncDF7FhK+oiXnk6
 3Lh6ZuBcNvKUw==
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id B3B5F17E3624;
 Thu, 28 Nov 2024 12:02:59 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
	kernel@collabora.com
Subject: [PATCH v2 5/5] drm/panthor: Fix the fast-reset logic
Date: Thu, 28 Nov 2024 12:02:54 +0100
Message-ID: <20241128110255.3182366-6-boris.brezillon@collabora.com>
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

If we do a GPU soft-reset, that's no longer fast reset. This also means
the slow reset fallback doesn't work because the MCU state is only reset
after a GPU soft-reset.

Let's move the retry logic to panthor_device_resume() to issue a
soft-reset between the fast and slow attempts, and patch
panthor_gpu_suspend() to only power-off the L2 when a fast reset is
requested.

v2:
- Add R-b

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panthor/panthor_device.c | 32 ++++++++++----
 drivers/gpu/drm/panthor/panthor_device.h | 11 +++++
 drivers/gpu/drm/panthor/panthor_fw.c     | 54 ++++++------------------
 drivers/gpu/drm/panthor/panthor_gpu.c    | 11 ++---
 4 files changed, 53 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index 0362101ea896..2c817e65e6be 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -431,6 +431,22 @@ int panthor_device_mmap_io(struct panthor_device *ptdev, struct vm_area_struct *
 	return 0;
 }
 
+static int panthor_device_resume_hw_components(struct panthor_device *ptdev)
+{
+	int ret;
+
+	panthor_gpu_resume(ptdev);
+	panthor_mmu_resume(ptdev);
+
+	ret = panthor_fw_resume(ptdev);
+	if (!ret)
+		return 0;
+
+	panthor_mmu_suspend(ptdev);
+	panthor_gpu_suspend(ptdev);
+	return ret;
+}
+
 int panthor_device_resume(struct device *dev)
 {
 	struct panthor_device *ptdev = dev_get_drvdata(dev);
@@ -457,16 +473,16 @@ int panthor_device_resume(struct device *dev)
 
 	if (panthor_device_is_initialized(ptdev) &&
 	    drm_dev_enter(&ptdev->base, &cookie)) {
-		panthor_gpu_resume(ptdev);
-		panthor_mmu_resume(ptdev);
-		ret = panthor_fw_resume(ptdev);
-		if (!drm_WARN_ON(&ptdev->base, ret)) {
-			panthor_sched_resume(ptdev);
-		} else {
-			panthor_mmu_suspend(ptdev);
-			panthor_gpu_suspend(ptdev);
+		ret = panthor_device_resume_hw_components(ptdev);
+		if (ret && ptdev->reset.fast) {
+			drm_err(&ptdev->base, "Fast reset failed, trying a slow reset");
+			ptdev->reset.fast = false;
+			ret = panthor_device_resume_hw_components(ptdev);
 		}
 
+		if (!ret)
+			panthor_sched_resume(ptdev);
+
 		drm_dev_exit(cookie);
 
 		if (ret)
diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index b6c4f25a5d6e..da6574021664 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -157,6 +157,17 @@ struct panthor_device {
 
 		/** @pending: Set to true if a reset is pending. */
 		atomic_t pending;
+
+		/**
+		 * @fast: True if the post_reset logic can proceed with a fast reset.
+		 *
+		 * A fast reset is just a reset where the driver doesn't reload the FW sections.
+		 *
+		 * Any time the firmware is properly suspended, a fast reset can take place.
+		 * On the other hand, if the halt operation failed, the driver will reload
+		 * all FW sections to make sure we start from a fresh state.
+		 */
+		bool fast;
 	} reset;
 
 	/** @pm: Power management related data. */
diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index f3d3d8fbe13d..a3d11d32b71c 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -263,17 +263,6 @@ struct panthor_fw {
 	/** @booted: True is the FW is booted */
 	bool booted;
 
-	/**
-	 * @fast_reset: True if the post_reset logic can proceed with a fast reset.
-	 *
-	 * A fast reset is just a reset where the driver doesn't reload the FW sections.
-	 *
-	 * Any time the firmware is properly suspended, a fast reset can take place.
-	 * On the other hand, if the halt operation failed, the driver will reload
-	 * all sections to make sure we start from a fresh state.
-	 */
-	bool fast_reset;
-
 	/** @irq: Job irq data. */
 	struct panthor_irq irq;
 };
@@ -1090,7 +1079,7 @@ void panthor_fw_pre_reset(struct panthor_device *ptdev, bool on_hang)
 	/* Make sure we won't be woken up by a ping. */
 	cancel_delayed_work_sync(&ptdev->fw->watchdog.ping_work);
 
-	ptdev->fw->fast_reset = false;
+	ptdev->reset.fast = false;
 
 	if (!on_hang) {
 		struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
@@ -1100,7 +1089,7 @@ void panthor_fw_pre_reset(struct panthor_device *ptdev, bool on_hang)
 		gpu_write(ptdev, CSF_DOORBELL(CSF_GLB_DOORBELL_ID), 1);
 		if (!readl_poll_timeout(ptdev->iomem + MCU_STATUS, status,
 					status == MCU_STATUS_HALT, 10, 100000)) {
-			ptdev->fw->fast_reset = true;
+			ptdev->reset.fast = true;
 		} else {
 			drm_warn(&ptdev->base, "Failed to cleanly suspend MCU");
 		}
@@ -1125,49 +1114,30 @@ int panthor_fw_post_reset(struct panthor_device *ptdev)
 	if (ret)
 		return ret;
 
-	/* If this is a fast reset, try to start the MCU without reloading
-	 * the FW sections. If it fails, go for a full reset.
-	 */
-	if (ptdev->fw->fast_reset) {
+	if (!ptdev->reset.fast) {
+		/* On a slow reset, reload all sections, including RO ones.
+		 * We're not supposed to end up here anyway, let's just assume
+		 * the overhead of reloading everything is acceptable.
+		 */
+		panthor_reload_fw_sections(ptdev, true);
+	} else {
 		/* The FW detects 0 -> 1 transitions. Make sure we reset
 		 * the HALT bit before the FW is rebooted.
 		 * This is not needed on a slow reset because FW sections are
 		 * re-initialized.
 		 */
 		struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
+
 		panthor_fw_update_reqs(glb_iface, req, 0, GLB_HALT);
-
-		ret = panthor_fw_start(ptdev);
-		if (!ret)
-			goto out;
-
-		/* Forcibly reset the MCU and force a slow reset, so we get a
-		 * fresh boot on the next panthor_fw_start() call.
-		 */
-		panthor_fw_stop(ptdev);
-		ptdev->fw->fast_reset = false;
-		drm_err(&ptdev->base, "FW fast reset failed, trying a slow reset");
-
-		ret = panthor_vm_flush_all(ptdev->fw->vm);
-		if (ret) {
-			drm_err(&ptdev->base, "FW slow reset failed (couldn't flush FW's AS l2cache)");
-			return ret;
-		}
 	}
 
-	/* Reload all sections, including RO ones. We're not supposed
-	 * to end up here anyway, let's just assume the overhead of
-	 * reloading everything is acceptable.
-	 */
-	panthor_reload_fw_sections(ptdev, true);
-
 	ret = panthor_fw_start(ptdev);
 	if (ret) {
-		drm_err(&ptdev->base, "FW slow reset failed (couldn't start the FW )");
+		drm_err(&ptdev->base, "FW %s reset failed",
+			ptdev->reset.fast ?  "fast" : "slow");
 		return ret;
 	}
 
-out:
 	/* We must re-initialize the global interface even on fast-reset. */
 	panthor_fw_init_global_iface(ptdev);
 	return 0;
diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
index ee85a371bc38..671049020afa 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu.c
+++ b/drivers/gpu/drm/panthor/panthor_gpu.c
@@ -470,11 +470,12 @@ int panthor_gpu_soft_reset(struct panthor_device *ptdev)
  */
 void panthor_gpu_suspend(struct panthor_device *ptdev)
 {
-	/*
-	 * It may be preferable to simply power down the L2, but for now just
-	 * soft-reset which will leave the L2 powered down.
-	 */
-	panthor_gpu_soft_reset(ptdev);
+	/* On a fast reset, simply power down the L2. */
+	if (!ptdev->reset.fast)
+		panthor_gpu_soft_reset(ptdev);
+	else
+		panthor_gpu_power_off(ptdev, L2, 1, 20000);
+
 	panthor_gpu_irq_suspend(&ptdev->gpu->irq);
 }
 
-- 
2.46.2

