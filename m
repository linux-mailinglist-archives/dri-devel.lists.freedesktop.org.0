Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC7229F276
	for <lists+dri-devel@lfdr.de>; Thu, 29 Oct 2020 18:01:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D37806E8DB;
	Thu, 29 Oct 2020 17:01:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id B78CB6E8DB
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 17:01:09 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 97634139F;
 Thu, 29 Oct 2020 10:01:08 -0700 (PDT)
Received: from e112269-lin.arm.com (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 499E63F66E;
 Thu, 29 Oct 2020 10:01:07 -0700 (PDT)
From: Steven Price <steven.price@arm.com>
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: [PATCH] drm/panfrost: Don't corrupt the queue mutex on open/close
Date: Thu, 29 Oct 2020 17:00:47 +0000
Message-Id: <20201029170047.30564-1-steven.price@arm.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
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
Cc: Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The mutex within the panfrost_queue_state should have the lifetime of
the queue, however it was erroneously initialised/destroyed during
panfrost_job_{open,close} which is called every time a client
opens/closes the drm node.

Move the initialisation/destruction to panfrost_job_{init,fini} where it
belongs.

Fixes: 1a11a88cfd9a ("drm/panfrost: Fix job timeout handling")
Signed-off-by: Steven Price <steven.price@arm.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_job.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index cfb431624eea..145ad37eda6a 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -595,6 +595,8 @@ int panfrost_job_init(struct panfrost_device *pfdev)
 	}
 
 	for (j = 0; j < NUM_JOB_SLOTS; j++) {
+		mutex_init(&js->queue[j].lock);
+
 		js->queue[j].fence_context = dma_fence_context_alloc(1);
 
 		ret = drm_sched_init(&js->queue[j].sched,
@@ -625,8 +627,10 @@ void panfrost_job_fini(struct panfrost_device *pfdev)
 
 	job_write(pfdev, JOB_INT_MASK, 0);
 
-	for (j = 0; j < NUM_JOB_SLOTS; j++)
+	for (j = 0; j < NUM_JOB_SLOTS; j++) {
 		drm_sched_fini(&js->queue[j].sched);
+		mutex_destroy(&js->queue[j].lock);
+	}
 
 }
 
@@ -638,7 +642,6 @@ int panfrost_job_open(struct panfrost_file_priv *panfrost_priv)
 	int ret, i;
 
 	for (i = 0; i < NUM_JOB_SLOTS; i++) {
-		mutex_init(&js->queue[i].lock);
 		sched = &js->queue[i].sched;
 		ret = drm_sched_entity_init(&panfrost_priv->sched_entity[i],
 					    DRM_SCHED_PRIORITY_NORMAL, &sched,
@@ -657,7 +660,6 @@ void panfrost_job_close(struct panfrost_file_priv *panfrost_priv)
 
 	for (i = 0; i < NUM_JOB_SLOTS; i++) {
 		drm_sched_entity_destroy(&panfrost_priv->sched_entity[i]);
-		mutex_destroy(&js->queue[i].lock);
 		/* Ensure any timeouts relating to this client have completed */
 		flush_delayed_work(&js->queue[i].sched.work_tdr);
 	}
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
