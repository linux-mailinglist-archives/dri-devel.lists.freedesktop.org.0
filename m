Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 339389C7786
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2024 16:43:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAB9410E726;
	Wed, 13 Nov 2024 15:43:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="owhMj6BM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1FC210E727
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2024 15:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1731512583;
 bh=krv1S2T7XvQ3nCmg/XsfHh075hjflK05dGfLZMIFtws=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=owhMj6BMsm5S1Z5dqVVGrShZJSLWs6tR2bmaLD+6O9BxfXnzP7rvB4Iu18n8C7n8o
 D+56J8p5EVpDyof8Fe7C0N1mp32aEosFRkuoay/Mohtb9CGpMOVZyXvFqNe405Ye+h
 DtZOH9w+2mGaMPL/7pIG3KDuhhKdEZBGd5qhQHX9h9eAuqyq+p9PKTl87GG5oUtQfd
 VQIpRRqWkaxDWA97TJmRQPINaeAxbiq6m1WvKUCxNYqr1rUeOyklmMFag+D5JxeJtH
 YHqqBRqoKZ1bZLfuJOQlDsd3nQj6y4was1tkOf1nFAus91BVrA9sPz1w1RSFKR9dQX
 wGRwIhcDKzUIw==
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 355C517E36F3;
 Wed, 13 Nov 2024 16:43:03 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
	kernel@collabora.com
Subject: [PATCH 3/5] drm/panthor: Ignore devfreq_{suspend,
 resume}_device() failures
Date: Wed, 13 Nov 2024 16:42:55 +0100
Message-ID: <20241113154257.1971284-4-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241113154257.1971284-1-boris.brezillon@collabora.com>
References: <20241113154257.1971284-1-boris.brezillon@collabora.com>
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

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_devfreq.c | 12 ++++++------
 drivers/gpu/drm/panthor/panthor_devfreq.h |  4 ++--
 drivers/gpu/drm/panthor/panthor_device.c  | 22 +++-------------------
 3 files changed, 11 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.c b/drivers/gpu/drm/panthor/panthor_devfreq.c
index 9d0f891b9b53..fadc2edb26fe 100644
--- a/drivers/gpu/drm/panthor/panthor_devfreq.c
+++ b/drivers/gpu/drm/panthor/panthor_devfreq.c
@@ -244,26 +244,26 @@ int panthor_devfreq_init(struct panthor_device *ptdev)
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
index 8b5d54b2bbb4..353f3aabef42 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -439,9 +439,7 @@ int panthor_device_resume(struct device *dev)
 	if (ret)
 		goto err_disable_stacks_clk;
 
-	ret = panthor_devfreq_resume(ptdev);
-	if (ret)
-		goto err_disable_coregroup_clk;
+	panthor_devfreq_resume(ptdev);
 
 	if (panthor_device_is_initialized(ptdev) &&
 	    drm_dev_enter(&ptdev->base, &cookie)) {
@@ -478,8 +476,6 @@ int panthor_device_resume(struct device *dev)
 
 err_suspend_devfreq:
 	panthor_devfreq_suspend(ptdev);
-
-err_disable_coregroup_clk:
 	clk_disable_unprepare(ptdev->clks.coregroup);
 
 err_disable_stacks_clk:
@@ -496,7 +492,7 @@ int panthor_device_resume(struct device *dev)
 int panthor_device_suspend(struct device *dev)
 {
 	struct panthor_device *ptdev = dev_get_drvdata(dev);
-	int ret, cookie;
+	int cookie;
 
 	if (atomic_read(&ptdev->pm.state) != PANTHOR_DEVICE_PM_STATE_ACTIVE)
 		return -EINVAL;
@@ -528,19 +524,7 @@ int panthor_device_suspend(struct device *dev)
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
-- 
2.46.2

