Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1775D8BA0A4
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2024 20:38:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD81611264A;
	Thu,  2 May 2024 18:38:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="CsMlODdo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E94E510E4AA
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2024 18:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1714675097;
 bh=sGq86Z4cvZoFrppSbDn0yJqVzrXl1ZvAmMsBHw4vLzY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CsMlODdoLq4+AH8NUZPUrFXbxZrZeLxRdTygBqC0EN9fVHMKxZAXpQriYiMm/fAO4
 kKuuPmSjFNC07Yk8PtKJNsGb2KJEcA5tRvfiAqCJiis6unPLmXxMg2CN/sGelU9zpw
 UEAqPehZDroWplFeW4HXJaQrhQRbSfZ/J4Zv7K37IVOtI9xTAH7aNge8MnxpN364ko
 08RrpS6ggzM/46MxAs1fvItmWmc9fDMe+0cYEsrqwtTqxkDQosiIaiU7u/FHa9I++F
 6kAQYZrx9DAAXIbDtc2+XvwLwWPMhK6NBO4TWepu9snrHOOOnbRSHyAf5ddc6R0LsC
 1ZBnoiN4o+7hw==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5BFC0378214D;
 Thu,  2 May 2024 18:38:17 +0000 (UTC)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: Christopher Healy <healych@amazon.com>, dri-devel@lists.freedesktop.org,
 kernel@collabora.com
Subject: [PATCH 4/4] drm/panthor: Call panthor_sched_post_reset() even if the
 reset failed
Date: Thu,  2 May 2024 20:38:12 +0200
Message-ID: <20240502183813.1612017-5-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240502183813.1612017-1-boris.brezillon@collabora.com>
References: <20240502183813.1612017-1-boris.brezillon@collabora.com>
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

We need to undo what was done in panthor_sched_pre_reset() even if the
reset failed. We just flag all previously running groups as terminated
when that happens to unblock things.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_device.c |  7 +------
 drivers/gpu/drm/panthor/panthor_sched.c  | 19 ++++++++++++++-----
 drivers/gpu/drm/panthor/panthor_sched.h  |  2 +-
 3 files changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index 4c5b54e7abb7..4082c8f2951d 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -129,13 +129,8 @@ static void panthor_device_reset_work(struct work_struct *work)
 	panthor_gpu_l2_power_on(ptdev);
 	panthor_mmu_post_reset(ptdev);
 	ret = panthor_fw_post_reset(ptdev);
-	if (ret)
-		goto out_dev_exit;
-
 	atomic_set(&ptdev->reset.pending, 0);
-	panthor_sched_post_reset(ptdev);
-
-out_dev_exit:
+	panthor_sched_post_reset(ptdev, ret != 0);
 	drm_dev_exit(cookie);
 
 	if (ret) {
diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 6ea094b00cf9..fc43ff62c77d 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -2728,15 +2728,22 @@ void panthor_sched_pre_reset(struct panthor_device *ptdev)
 	mutex_unlock(&sched->reset.lock);
 }
 
-void panthor_sched_post_reset(struct panthor_device *ptdev)
+void panthor_sched_post_reset(struct panthor_device *ptdev, bool reset_failed)
 {
 	struct panthor_scheduler *sched = ptdev->scheduler;
 	struct panthor_group *group, *group_tmp;
 
 	mutex_lock(&sched->reset.lock);
 
-	list_for_each_entry_safe(group, group_tmp, &sched->reset.stopped_groups, run_node)
+	list_for_each_entry_safe(group, group_tmp, &sched->reset.stopped_groups, run_node) {
+		/* Consider all previously running group as terminated if the
+		 * reset failed.
+		 */
+		if (reset_failed)
+			group->state = PANTHOR_CS_GROUP_TERMINATED;
+
 		panthor_group_start(group);
+	}
 
 	/* We're done resetting the GPU, clear the reset.in_progress bit so we can
 	 * kick the scheduler.
@@ -2744,9 +2751,11 @@ void panthor_sched_post_reset(struct panthor_device *ptdev)
 	atomic_set(&sched->reset.in_progress, false);
 	mutex_unlock(&sched->reset.lock);
 
-	sched_queue_delayed_work(sched, tick, 0);
-
-	sched_queue_work(sched, sync_upd);
+	/* No need to queue a tick and update syncs if the reset failed. */
+	if (!reset_failed) {
+		sched_queue_delayed_work(sched, tick, 0);
+		sched_queue_work(sched, sync_upd);
+	}
 }
 
 static void group_sync_upd_work(struct work_struct *work)
diff --git a/drivers/gpu/drm/panthor/panthor_sched.h b/drivers/gpu/drm/panthor/panthor_sched.h
index 66438b1f331f..3a30d2328b30 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.h
+++ b/drivers/gpu/drm/panthor/panthor_sched.h
@@ -40,7 +40,7 @@ void panthor_group_pool_destroy(struct panthor_file *pfile);
 int panthor_sched_init(struct panthor_device *ptdev);
 void panthor_sched_unplug(struct panthor_device *ptdev);
 void panthor_sched_pre_reset(struct panthor_device *ptdev);
-void panthor_sched_post_reset(struct panthor_device *ptdev);
+void panthor_sched_post_reset(struct panthor_device *ptdev, bool reset_failed);
 void panthor_sched_suspend(struct panthor_device *ptdev);
 void panthor_sched_resume(struct panthor_device *ptdev);
 
-- 
2.44.0

