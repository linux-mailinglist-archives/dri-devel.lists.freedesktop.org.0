Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE953AEA02
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 15:26:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F5D96E125;
	Mon, 21 Jun 2021 13:26:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE4CB6E0FC
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 13:25:50 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 569561F42717;
 Mon, 21 Jun 2021 14:25:49 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Rob Herring <robh+dt@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Steven Price <steven.price@arm.com>, Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH 10/10] drm/panfrost: Kill in-flight jobs on FD close
Date: Mon, 21 Jun 2021 15:25:39 +0200
Message-Id: <20210621132539.1683000-11-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210621132539.1683000-1-boris.brezillon@collabora.com>
References: <20210621132539.1683000-1-boris.brezillon@collabora.com>
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

If the process who submitted these jobs decided to close the FD before
the jobs are done it probably means it doesn't care about the result.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_job.c | 33 +++++++++++++++++++++----
 1 file changed, 28 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index aedc604d331c..a51fa0a81367 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -494,14 +494,22 @@ static irqreturn_t panfrost_job_irq_handler(int irq, void *data)
 		if (status & JOB_INT_MASK_ERR(j)) {
 			enum panfrost_queue_status old_status;
 			u32 js_status = job_read(pfdev, JS_STATUS(j));
+			int error = panfrost_exception_to_error(js_status);
+			const char *exception_name = panfrost_exception_name(js_status);
 
 			job_write(pfdev, JS_COMMAND_NEXT(j), JS_COMMAND_NOP);
 
-			dev_err(pfdev->dev, "js fault, js=%d, status=%s, head=0x%x, tail=0x%x",
-				j,
-				panfrost_exception_name(js_status),
-				job_read(pfdev, JS_HEAD_LO(j)),
-				job_read(pfdev, JS_TAIL_LO(j)));
+			if (!error) {
+				dev_dbg(pfdev->dev, "js interrupt, js=%d, status=%s, head=0x%x, tail=0x%x",
+					j, exception_name,
+					job_read(pfdev, JS_HEAD_LO(j)),
+					job_read(pfdev, JS_TAIL_LO(j)));
+			} else {
+				dev_err(pfdev->dev, "js fault, js=%d, status=%s, head=0x%x, tail=0x%x",
+					j, exception_name,
+					job_read(pfdev, JS_HEAD_LO(j)),
+					job_read(pfdev, JS_TAIL_LO(j)));
+			}
 
 			/* If we need a reset, signal it to the reset handler,
 			 * otherwise, update the fence error field and signal
@@ -688,10 +696,25 @@ int panfrost_job_open(struct panfrost_file_priv *panfrost_priv)
 
 void panfrost_job_close(struct panfrost_file_priv *panfrost_priv)
 {
+	struct panfrost_device *pfdev = panfrost_priv->pfdev;
+	unsigned long flags;
 	int i;
 
 	for (i = 0; i < NUM_JOB_SLOTS; i++)
 		drm_sched_entity_destroy(&panfrost_priv->sched_entity[i]);
+
+	/* Kill in-flight jobs */
+	spin_lock_irqsave(&pfdev->js->job_lock, flags);
+	for (i = 0; i < NUM_JOB_SLOTS; i++) {
+		struct drm_sched_entity *entity = &panfrost_priv->sched_entity[i];
+		struct panfrost_job *job = pfdev->jobs[i];
+
+		if (!job || job->base.entity != entity)
+			continue;
+
+		job_write(pfdev, JS_COMMAND(i), JS_COMMAND_HARD_STOP);
+	}
+	spin_unlock_irqrestore(&pfdev->js->job_lock, flags);
 }
 
 int panfrost_job_is_idle(struct panfrost_device *pfdev)
-- 
2.31.1

