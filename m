Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D792A9DB62D
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2024 12:03:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE7F210E330;
	Thu, 28 Nov 2024 11:03:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="DjxWLZ1E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DD4910E324
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2024 11:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1732791779;
 bh=bBAhQtDoLi8hQ/At6Oml6NZkOXig43lfQGNWZiZav3o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DjxWLZ1Eloa5ITWcw7I8RWVrFmeG871ayDZ3gAFiOvxlz8RuJiEnX5SLiMoHANtAG
 teLMXck314rzIEGmSLfdGEkA197QPd/ujO43yA2VIZhwp1XvhgUZCRl9LuSlj4OuPG
 s7FtiLK1OrAXMYQx/7aMohYdQ5hZGfMe6pcMq55f7nMjzmwycEBMEXxYLu11goFXmv
 8irY5Ch9wLwZ5Bm+gFVWnqZ4pYbWsNLJ60TpTmdtLQm4/q3+DUWhVRgBC46kk4MJl8
 SspaiciG3Exrp2fzvSORiYodOzoXj7mrMU9MsRFNOkDrtuLVeF8akmiifqY3U4RGzR
 xKPOVHysNlATQ==
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id E3B8617E3615;
 Thu, 28 Nov 2024 12:02:58 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
	kernel@collabora.com
Subject: [PATCH v2 3/5] drm/panthor: Ignore devfreq_{suspend,
 resume}_device() failures
Date: Thu, 28 Nov 2024 12:02:52 +0100
Message-ID: <20241128110255.3182366-4-boris.brezillon@collabora.com>
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

devfreq_{resume,suspend}_device() don't bother undoing the suspend_count
modifications if something fails, so either it assumes failures are
harmless, or it's super fragile/buggy. In either case it's not something
we can address at the driver level, so let's just assume failures are
harmless for now, like is done in panfrost.

v2:
- Add R-b

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panthor/panthor_devfreq.c | 12 ++++----
 drivers/gpu/drm/panthor/panthor_devfreq.h |  4 +--
 drivers/gpu/drm/panthor/panthor_device.c  | 35 ++---------------------
 3 files changed, 11 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.c b/drivers/gpu/drm/panthor/panthor_devfreq.c
index ecc7a52bd688..3686515d368d 100644
--- a/drivers/gpu/drm/panthor/panthor_devfreq.c
+++ b/drivers/gpu/drm/panthor/panthor_devfreq.c
@@ -243,26 +243,26 @@ int panthor_devfreq_init(struct panthor_device *ptdev)
 	return 0;
 }
 
-int panthor_devfreq_resume(struct panthor_device *ptdev)
+void panthor_devfreq_resume(struct panthor_device *ptdev)
 {
 	struct panthor_devfreq *pdevfreq = ptdev->devfreq;
 
 	if (!pdevfreq->devfreq)
-		return 0;
+		return;
 
 	panthor_devfreq_reset(pdevfreq);
 
-	return devfreq_resume_device(pdevfreq->devfreq);
+	drm_WARN_ON(&ptdev->base, devfreq_resume_device(pdevfreq->devfreq));
 }
 
-int panthor_devfreq_suspend(struct panthor_device *ptdev)
+void panthor_devfreq_suspend(struct panthor_device *ptdev)
 {
 	struct panthor_devfreq *pdevfreq = ptdev->devfreq;
 
 	if (!pdevfreq->devfreq)
-		return 0;
+		return;
 
-	return devfreq_suspend_device(pdevfreq->devfreq);
+	drm_WARN_ON(&ptdev->base, devfreq_suspend_device(pdevfreq->devfreq));
 }
 
 void panthor_devfreq_record_busy(struct panthor_device *ptdev)
diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.h b/drivers/gpu/drm/panthor/panthor_devfreq.h
index 83a5c9522493..b7631de695f7 100644
--- a/drivers/gpu/drm/panthor/panthor_devfreq.h
+++ b/drivers/gpu/drm/panthor/panthor_devfreq.h
@@ -12,8 +12,8 @@ struct panthor_devfreq;
 
 int panthor_devfreq_init(struct panthor_device *ptdev);
 
-int panthor_devfreq_resume(struct panthor_device *ptdev);
-int panthor_devfreq_suspend(struct panthor_device *ptdev);
+void panthor_devfreq_resume(struct panthor_device *ptdev);
+void panthor_devfreq_suspend(struct panthor_device *ptdev);
 
 void panthor_devfreq_record_busy(struct panthor_device *ptdev);
 void panthor_devfreq_record_idle(struct panthor_device *ptdev);
diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index e701e605d013..e3b22107b268 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -453,9 +453,7 @@ int panthor_device_resume(struct device *dev)
 	if (ret)
 		goto err_disable_stacks_clk;
 
-	ret = panthor_devfreq_resume(ptdev);
-	if (ret)
-		goto err_disable_coregroup_clk;
+	panthor_devfreq_resume(ptdev);
 
 	if (panthor_device_is_initialized(ptdev) &&
 	    drm_dev_enter(&ptdev->base, &cookie)) {
@@ -492,8 +490,6 @@ int panthor_device_resume(struct device *dev)
 
 err_suspend_devfreq:
 	panthor_devfreq_suspend(ptdev);
-
-err_disable_coregroup_clk:
 	clk_disable_unprepare(ptdev->clks.coregroup);
 
 err_disable_stacks_clk:
@@ -510,7 +506,7 @@ int panthor_device_resume(struct device *dev)
 int panthor_device_suspend(struct device *dev)
 {
 	struct panthor_device *ptdev = dev_get_drvdata(dev);
-	int ret, cookie;
+	int cookie;
 
 	if (atomic_read(&ptdev->pm.state) != PANTHOR_DEVICE_PM_STATE_ACTIVE)
 		return -EINVAL;
@@ -542,36 +538,11 @@ int panthor_device_suspend(struct device *dev)
 		drm_dev_exit(cookie);
 	}
 
-	ret = panthor_devfreq_suspend(ptdev);
-	if (ret) {
-		if (panthor_device_is_initialized(ptdev) &&
-		    drm_dev_enter(&ptdev->base, &cookie)) {
-			panthor_gpu_resume(ptdev);
-			panthor_mmu_resume(ptdev);
-			drm_WARN_ON(&ptdev->base, panthor_fw_resume(ptdev));
-			panthor_sched_resume(ptdev);
-			drm_dev_exit(cookie);
-		}
-
-		goto err_set_active;
-	}
+	panthor_devfreq_suspend(ptdev);
 
 	clk_disable_unprepare(ptdev->clks.coregroup);
 	clk_disable_unprepare(ptdev->clks.stacks);
 	clk_disable_unprepare(ptdev->clks.core);
 	atomic_set(&ptdev->pm.state, PANTHOR_DEVICE_PM_STATE_SUSPENDED);
 	return 0;
-
-err_set_active:
-	/* If something failed and we have to revert back to an
-	 * active state, we also need to clear the MMIO userspace
-	 * mappings, so any dumb pages that were mapped while we
-	 * were trying to suspend gets invalidated.
-	 */
-	mutex_lock(&ptdev->pm.mmio_lock);
-	atomic_set(&ptdev->pm.state, PANTHOR_DEVICE_PM_STATE_ACTIVE);
-	unmap_mapping_range(ptdev->base.anon_inode->i_mapping,
-			    DRM_PANTHOR_USER_MMIO_OFFSET, 0, 1);
-	mutex_unlock(&ptdev->pm.mmio_lock);
-	return ret;
 }
-- 
2.46.2

