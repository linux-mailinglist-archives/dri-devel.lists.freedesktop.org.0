Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4892184434
	for <lists+dri-devel@lfdr.de>; Fri, 13 Mar 2020 10:56:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 471B76EBA9;
	Fri, 13 Mar 2020 09:56:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FA906EBA9
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Mar 2020 09:56:42 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.pengutronix.de.)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1jCh3Y-0002l9-Fg; Fri, 13 Mar 2020 10:56:40 +0100
From: Lucas Stach <l.stach@pengutronix.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/sched: add run job trace
Date: Fri, 13 Mar 2020 10:56:39 +0100
Message-Id: <20200313095640.17967-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
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
Cc: Robert Beckett <bob.beckett@collabora.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 kernel@pengutronix.de, patchwork-lst@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Robert Beckett <bob.beckett@collabora.com>

Add a new trace event to show when jobs are run on the HW.

Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 .../gpu/drm/scheduler/gpu_scheduler_trace.h   | 27 +++++++++++++++++++
 drivers/gpu/drm/scheduler/sched_main.c        |  1 +
 2 files changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
index d79086498aff..877ce9b127f1 100644
--- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
+++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
@@ -59,6 +59,33 @@ TRACE_EVENT(drm_sched_job,
 		      __entry->job_count, __entry->hw_job_count)
 );
 
+TRACE_EVENT(drm_run_job,
+	    TP_PROTO(struct drm_sched_job *sched_job, struct drm_sched_entity *entity),
+	    TP_ARGS(sched_job, entity),
+	    TP_STRUCT__entry(
+			     __field(struct drm_sched_entity *, entity)
+			     __field(struct dma_fence *, fence)
+			     __field(const char *, name)
+			     __field(uint64_t, id)
+			     __field(u32, job_count)
+			     __field(int, hw_job_count)
+			     ),
+
+	    TP_fast_assign(
+			   __entry->entity = entity;
+			   __entry->id = sched_job->id;
+			   __entry->fence = &sched_job->s_fence->finished;
+			   __entry->name = sched_job->sched->name;
+			   __entry->job_count = spsc_queue_count(&entity->job_queue);
+			   __entry->hw_job_count = atomic_read(
+				   &sched_job->sched->hw_rq_count);
+			   ),
+	    TP_printk("entity=%p, id=%llu, fence=%p, ring=%s, job count:%u, hw job count:%d",
+		      __entry->entity, __entry->id,
+		      __entry->fence, __entry->name,
+		      __entry->job_count, __entry->hw_job_count)
+);
+
 TRACE_EVENT(drm_sched_process_job,
 	    TP_PROTO(struct drm_sched_fence *fence),
 	    TP_ARGS(fence),
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 71ce6215956f..34231b7163cc 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -773,6 +773,7 @@ static int drm_sched_main(void *param)
 		atomic_inc(&sched->hw_rq_count);
 		drm_sched_job_begin(sched_job);
 
+		trace_drm_run_job(sched_job, entity);
 		fence = sched->ops->run_job(sched_job);
 		drm_sched_fence_scheduled(s_fence);
 
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
