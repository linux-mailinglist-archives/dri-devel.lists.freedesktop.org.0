Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80ABF3B6ED3
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jun 2021 09:35:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEB3A6E811;
	Tue, 29 Jun 2021 07:35:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D9A86E7EF
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jun 2021 07:35:20 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 86EFA1F42EB4;
 Tue, 29 Jun 2021 08:35:18 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 07/16] drm/panfrost: Expose a helper to trigger a GPU reset
Date: Tue, 29 Jun 2021 09:35:01 +0200
Message-Id: <20210629073510.2764391-8-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210629073510.2764391-1-boris.brezillon@collabora.com>
References: <20210629073510.2764391-1-boris.brezillon@collabora.com>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Expose a helper to trigger a GPU reset so we can easily trigger reset
operations outside the job timeout handler.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
Reviewed-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_device.h | 8 ++++++++
 drivers/gpu/drm/panfrost/panfrost_job.c    | 4 +---
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
index 4c876476268f..f2190f90be75 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.h
+++ b/drivers/gpu/drm/panfrost/panfrost_device.h
@@ -243,4 +243,12 @@ enum drm_panfrost_exception_type {
 
 const char *panfrost_exception_name(u32 exception_code);
 
+static inline void
+panfrost_device_schedule_reset(struct panfrost_device *pfdev)
+{
+	/* Schedule a reset if there's no reset in progress. */
+	if (!atomic_xchg(&pfdev->reset.pending, 1))
+		schedule_work(&pfdev->reset.work);
+}
+
 #endif
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 3cd1aec6c261..be8f68f63974 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -458,9 +458,7 @@ static enum drm_gpu_sched_stat panfrost_job_timedout(struct drm_sched_job
 	if (!panfrost_scheduler_stop(&pfdev->js->queue[js], sched_job))
 		return DRM_GPU_SCHED_STAT_NOMINAL;
 
-	/* Schedule a reset if there's no reset in progress. */
-	if (!atomic_xchg(&pfdev->reset.pending, 1))
-		schedule_work(&pfdev->reset.work);
+	panfrost_device_schedule_reset(pfdev);
 
 	return DRM_GPU_SCHED_STAT_NOMINAL;
 }
-- 
2.31.1

