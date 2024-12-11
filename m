Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCB29EC60B
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 08:54:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45A1710EA7A;
	Wed, 11 Dec 2024 07:54:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="YVPTdAVc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD6D010E576
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 07:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1733903664;
 bh=3hOOmx5wAFN5IvspLRDRZNSS0DiYJ3/2S0dn334VoYQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YVPTdAVcyE9+MXsi84s7PBIv+bHoupsADSjfO2/sSHfsZCt+hGsY5IdFP108v6eOu
 zryFrS2el+wtoqZHViGXOyMBnmHURYF4eol5jlHSfR71Wz/fPIJp6/euQpy8m4VoFx
 PZ5KqaFbBLVeKfhAxEvHsxO88quRmKUYDjzguigbYLMEsTyF6d6D+WXc92HgDZU6OG
 BEUBG/z6gYsP0NjgyNJdqmffYSln3vV9bQqmimzo2nuDXaCCIGbiU6WBvmKyLGOXf1
 UbMofSQjSDOGMTxm9/1CPp/TAcXqpAhVBvq5oSFTAYsINK/t7ChDyhyV3RQ5clBxSH
 lYZLthKI/HLPw==
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:d3ea:1c7:41fd:3038])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 3E9FE17E14EA;
 Wed, 11 Dec 2024 08:54:24 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
	kernel@collabora.com
Subject: [PATCH v3 4/5] drm/panthor: Be robust against resume failures
Date: Wed, 11 Dec 2024 08:54:18 +0100
Message-ID: <20241211075419.2333731-5-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241211075419.2333731-1-boris.brezillon@collabora.com>
References: <20241211075419.2333731-1-boris.brezillon@collabora.com>
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

When the runtime PM resume callback returns an error, it puts the device
in a state where it can't be resumed anymore. Make sure we can recover
from such transient failures by calling pm_runtime_set_suspended()
explicitly after a pm_runtime_resume_and_get() failure.

v3:
- Add R-b/A-b

v2:
- Add a comment explaining potential races in
  panthor_device_resume_and_get()

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Adrian Larumbe <adrian.larumbe@collabora.com>
Acked-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panthor/panthor_device.c |  1 +
 drivers/gpu/drm/panthor/panthor_device.h | 26 ++++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_drv.c    |  2 +-
 drivers/gpu/drm/panthor/panthor_sched.c  |  4 ++--
 4 files changed, 30 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index e3b22107b268..0362101ea896 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -500,6 +500,7 @@ int panthor_device_resume(struct device *dev)
 
 err_set_suspended:
 	atomic_set(&ptdev->pm.state, PANTHOR_DEVICE_PM_STATE_SUSPENDED);
+	atomic_set(&ptdev->pm.recovery_needed, 1);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index 0e68f5a70d20..b6c4f25a5d6e 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -9,6 +9,7 @@
 #include <linux/atomic.h>
 #include <linux/io-pgtable.h>
 #include <linux/regulator/consumer.h>
+#include <linux/pm_runtime.h>
 #include <linux/sched.h>
 #include <linux/spinlock.h>
 
@@ -180,6 +181,9 @@ struct panthor_device {
 		 * is suspended.
 		 */
 		struct page *dummy_latest_flush;
+
+		/** @recovery_needed: True when a resume attempt failed. */
+		atomic_t recovery_needed;
 	} pm;
 
 	/** @profile_mask: User-set profiling flags for job accounting. */
@@ -243,6 +247,28 @@ int panthor_device_mmap_io(struct panthor_device *ptdev,
 int panthor_device_resume(struct device *dev);
 int panthor_device_suspend(struct device *dev);
 
+static inline int panthor_device_resume_and_get(struct panthor_device *ptdev)
+{
+	int ret = pm_runtime_resume_and_get(ptdev->base.dev);
+
+	/* If the resume failed, we need to clear the runtime_error, which
+	 * can done by forcing the RPM state to suspended. If multiple
+	 * threads called panthor_device_resume_and_get(), we only want
+	 * one of them to update the state, hence the cmpxchg. Note that a
+	 * thread might enter panthor_device_resume_and_get() and call
+	 * pm_runtime_resume_and_get() after another thread had attempted
+	 * to resume and failed. This means we will end up with an error
+	 * without even attempting a resume ourselves. The only risk here
+	 * is to report an error when the second resume attempt might have
+	 * succeeded. Given resume errors are not expected, this is probably
+	 * something we can live with.
+	 */
+	if (ret && atomic_cmpxchg(&ptdev->pm.recovery_needed, 1, 0) == 1)
+		pm_runtime_set_suspended(ptdev->base.dev);
+
+	return ret;
+}
+
 enum drm_panthor_exception_type {
 	DRM_PANTHOR_EXCEPTION_OK = 0x00,
 	DRM_PANTHOR_EXCEPTION_TERMINATED = 0x04,
diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index 1498c97b4b85..b7a9adc918e3 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -763,7 +763,7 @@ static int panthor_query_timestamp_info(struct panthor_device *ptdev,
 {
 	int ret;
 
-	ret = pm_runtime_resume_and_get(ptdev->base.dev);
+	ret = panthor_device_resume_and_get(ptdev);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 97ed5fe5a191..77b184c3fb0c 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -2364,7 +2364,7 @@ static void tick_work(struct work_struct *work)
 	if (!drm_dev_enter(&ptdev->base, &cookie))
 		return;
 
-	ret = pm_runtime_resume_and_get(ptdev->base.dev);
+	ret = panthor_device_resume_and_get(ptdev);
 	if (drm_WARN_ON(&ptdev->base, ret))
 		goto out_dev_exit;
 
@@ -3131,7 +3131,7 @@ queue_run_job(struct drm_sched_job *sched_job)
 		return dma_fence_get(job->done_fence);
 	}
 
-	ret = pm_runtime_resume_and_get(ptdev->base.dev);
+	ret = panthor_device_resume_and_get(ptdev);
 	if (drm_WARN_ON(&ptdev->base, ret))
 		return ERR_PTR(ret);
 
-- 
2.47.0

