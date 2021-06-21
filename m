Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A593AEA37
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 15:39:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B8EA6E151;
	Mon, 21 Jun 2021 13:39:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEF4F6E12E
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 13:39:34 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 692DA1F422C2;
 Mon, 21 Jun 2021 14:39:32 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Rob Herring <robh+dt@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Steven Price <steven.price@arm.com>, Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v2 12/12] drm/panfrost: Shorten the fence signalling section
Date: Mon, 21 Jun 2021 15:39:07 +0200
Message-Id: <20210621133907.1683899-13-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210621133907.1683899-1-boris.brezillon@collabora.com>
References: <20210621133907.1683899-1-boris.brezillon@collabora.com>
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

panfrost_reset() does not directly signal fences, but
panfrost_scheduler_start() does, when calling drm_sched_start().

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_job.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 74b63e1ee6d9..cf6abe0fdf47 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -414,6 +414,7 @@ static bool panfrost_scheduler_stop(struct panfrost_queue_state *queue,
 static void panfrost_scheduler_start(struct panfrost_queue_state *queue)
 {
 	enum panfrost_queue_status old_status;
+	bool cookie;
 
 	mutex_lock(&queue->lock);
 	old_status = atomic_xchg(&queue->status,
@@ -423,7 +424,9 @@ static void panfrost_scheduler_start(struct panfrost_queue_state *queue)
 	/* Restore the original timeout before starting the scheduler. */
 	queue->sched.timeout = msecs_to_jiffies(JOB_TIMEOUT_MS);
 	drm_sched_resubmit_jobs(&queue->sched);
+	cookie = dma_fence_begin_signalling();
 	drm_sched_start(&queue->sched, true);
+	dma_fence_end_signalling(cookie);
 	old_status = atomic_xchg(&queue->status,
 				 PANFROST_QUEUE_STATUS_ACTIVE);
 	if (old_status == PANFROST_QUEUE_STATUS_FAULT_PENDING)
@@ -566,9 +569,7 @@ static void panfrost_reset(struct work_struct *work)
 						     reset.work);
 	unsigned long flags;
 	unsigned int i;
-	bool cookie;
 
-	cookie = dma_fence_begin_signalling();
 	for (i = 0; i < NUM_JOB_SLOTS; i++) {
 		/*
 		 * We want pending timeouts to be handled before we attempt
@@ -608,8 +609,6 @@ static void panfrost_reset(struct work_struct *work)
 
 	for (i = 0; i < NUM_JOB_SLOTS; i++)
 		panfrost_scheduler_start(&pfdev->js->queue[i]);
-
-	dma_fence_end_signalling(cookie);
 }
 
 int panfrost_job_init(struct panfrost_device *pfdev)
-- 
2.31.1

