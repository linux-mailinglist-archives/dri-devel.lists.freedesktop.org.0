Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7875A5BAFF9
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 17:12:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1610610E48A;
	Fri, 16 Sep 2022 15:12:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CD1D10ED60
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Sep 2022 15:12:07 +0000 (UTC)
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1oZD0f-0003aI-Qm; Fri, 16 Sep 2022 17:12:05 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: etnaviv@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/3] drm/scheduler: track GPU active time per entity
Date: Fri, 16 Sep 2022 17:12:03 +0200
Message-Id: <20220916151205.165687-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: patchwork-lst@pengutronix.de, kernel@pengutronix.de,
 Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Track the accumulated time that jobs from this entity were active
on the GPU. This allows drivers using the scheduler to trivially
implement the DRM fdinfo when the hardware doesn't provide more
specific information than signalling job completion anyways.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
Reviewed-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 6 ++++++
 include/drm/gpu_scheduler.h            | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 68317d3a7a27..5dbe826d498d 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -852,6 +852,12 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
 
 	spin_unlock(&sched->job_list_lock);
 
+	if (job) {
+		job->entity->elapsed_ns += ktime_to_ns(
+			ktime_sub(job->s_fence->finished.timestamp,
+				  job->s_fence->scheduled.timestamp));
+	}
+
 	return job;
 }
 
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index addb135eeea6..573bef640664 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -196,6 +196,13 @@ struct drm_sched_entity {
 	 * drm_sched_entity_fini().
 	 */
 	struct completion		entity_idle;
+	/**
+	 * @elapsed_ns
+	 *
+	 * Records the amount of time where jobs from this entity were active
+	 * on the GPU.
+	 */
+	uint64_t elapsed_ns;
 };
 
 /**
-- 
2.30.2

