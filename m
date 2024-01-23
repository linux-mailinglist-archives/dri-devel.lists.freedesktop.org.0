Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 454D2838748
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 07:21:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 869C110E04B;
	Tue, 23 Jan 2024 06:21:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2052.outbound.protection.outlook.com [40.107.243.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2204210E07D
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 06:21:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g6nr5vejCdBTukg4UzUeolt7Pk+UTkh00S43yA2KKJkhBFs0Lh8vmPe6grMIH7GMf/ngtU+WDtOj96oQ/kIHTJugmMUS1e/j4biI/bZddiFVZCNPitLO8Tdx99ulK6z49h/YoOQiYbrsdcX/rma9RyzKG+VXNkbKo5evvtnXMfX+G0gTpA17e57rImm57rLXlzjxaRV5nAcMr8ntm2PovrMo9ZPjRlpZxtVwAFhBAASxPAQDbDPWfDl7rMVzbdjjbKBNBqIYPon+i7f1B3FkzDP87z5aGNF5r+YrV0w/Sy+on8MqkcW3IOI1I064H5EVNJqlv+tsAZtQPjM4q+AE1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rjFswQG0ZbCJcgcLTnwRmzfcpEEjNYvVo8zZrn7wQw8=;
 b=F8UZ2MJS400iXu77I1x7LygAA4U5u8srLNYON6VBZTQVe7mX0KV0zWUZrvmxPEK2MeGT5QL6mKWP3yzybbKmotKcuZGxs9OS2wzu59LpWfUhdzxmtyDaU/0MFouRTZpPQJyTAVyrpwgXDE+EgcFFHNppMTe3/s6m9U9wTQVBgeODuuQUjSZ/3I17Bb2K8YE7wqlwMqmNbdY/lz2odvZmMJoJDxx7JcLyTCDr2bmqcQ8ko1zzmgtMdXZrf3uX9ny4RgYt+TKzI8ADCyr0jeZGBcT17REyPkmIdZcrVi+D5HbQlOuy/6exVhBag3uKTq+Yc+46VPeh+JSrB9dbVBld0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rjFswQG0ZbCJcgcLTnwRmzfcpEEjNYvVo8zZrn7wQw8=;
 b=RwTI3DwdTCgMsOVFHZx6tkgRMZoxHPo4yQaRcCwMl3xYc7xYDEYOflNUMnCrla38L2WFt5BzJ7WjhOyzp8eDEAbdA1v4GS7Ec82e3TGVY/UnvDDVah0VdTqWxC70xS+h/hHDUe6g1GLWWv4RAqfDCbFroitomlZHbOM8yW5Weeo=
Received: from DS7PR05CA0043.namprd05.prod.outlook.com (2603:10b6:8:2f::22) by
 DM4PR12MB6230.namprd12.prod.outlook.com (2603:10b6:8:a7::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7202.34; Tue, 23 Jan 2024 06:21:09 +0000
Received: from DS1PEPF0001709D.namprd05.prod.outlook.com
 (2603:10b6:8:2f:cafe::8b) by DS7PR05CA0043.outlook.office365.com
 (2603:10b6:8:2f::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.21 via Frontend
 Transport; Tue, 23 Jan 2024 06:21:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001709D.mail.protection.outlook.com (10.167.18.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7202.16 via Frontend Transport; Tue, 23 Jan 2024 06:21:09 +0000
Received: from AUS-P9-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 23 Jan
 2024 00:21:08 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Luben Tuikov <ltuikov89@gmail.com>, Matthew Brost <matthew.brost@intel.com>
Subject: [RFC] Revert "drm/sched: Split free_job into own work item"
Date: Mon, 22 Jan 2024 20:11:55 -0600
Message-ID: <20240123021155.2775-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709D:EE_|DM4PR12MB6230:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f4e3d00-6120-4d6e-7ef9-08dc1bdb7d7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JsOAB185jLA/1cy4e60DhsisWJ5pE9D2A0fF4GbaJTzLPQLowwjNtT5U9kvnWKjxtO+iJhNrjrBVirO7RiRaPtmFCA5It8qb4O0WbT+/UAsYhYbqWMWqabpo7x7isPfnbrMUWpR/txB0ZoFgnLunIOOR1i4yVt/MX5IO1KncNtK55+zXWjQt4a6GM+7+G8eTwnHjR7OcV7FVBDp99Hf7AP0H9SWPyH6inX/XBZC8s547aexEa0WS4xNzo9tztIB8ynUFt4qjcBp2XK399essHixkqVzdrqYvvMC9VEtMI2nZgJbtR4S1X9WG4VaPhL8u8GvhuPr0IMpIwbBnSKrSVcaBkggsYF4JdLvgScMfHgW4ZEFaOH/Sis6SMm9/Tf4WVLrm68zeqP1X9jGHWjiEo69FP/ITCKGxc2fnPc0vLjMEukC47FmxY4Jqqiddxj0YHbp/T3jbCAkh+lt+ehIXK/qtGilxfDxXI7eWkoATVkwTCXgfz/4sbROF/6uLhU1HwSZzDZf7+dyt4a3V0+LRi5Da/VfLvlCoAEwnUOpIHJ/glrRiGovU8itYVpoKAKTQuiKG4CljM44XK48g6wrfvp1tv2OBap8Ya5nsbtvgtWk3ec/vo6bUrZxvTcN6cGg2LPzXlpSlF0Sg1QOaD77YetWH8tDN9WxpE0gQyxh91s6prnTvuE22ygIo3vcNKF2GAgZVbqqtWe4wxjGm1L8efoxPjaRGl9N7zhB05OBaP/Uy6Prd2yONZCrCosco1YANMPmVY/8JZVgzq/+vxQzSUQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(39860400002)(136003)(396003)(376002)(230922051799003)(1800799012)(64100799003)(186009)(82310400011)(451199024)(36840700001)(46966006)(40470700004)(47076005)(41300700001)(40460700003)(40480700001)(356005)(82740400003)(81166007)(8936002)(2616005)(4326008)(44832011)(36756003)(7696005)(26005)(5660300002)(16526019)(336012)(426003)(2906002)(110136005)(70206006)(54906003)(478600001)(316002)(6666004)(70586007)(1076003)(8676002)(86362001)(36860700001)(83380400001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 06:21:09.6216 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f4e3d00-6120-4d6e-7ef9-08dc1bdb7d7e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001709D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6230
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 open list <linux-kernel@vger.kernel.org>, Maxime Ripard <mripard@kernel.org>,
 "open list:DRM GPU SCHEDULER" <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

commit f7fe64ad0f22 ("drm/sched: Split free_job into own work item")
causes graphics hangs at GDM or right after logging in on a
Framework 13 AMD laptop (containing a Phoenix APU).

This reverts commit f7fe64ad0f22ff034f8ebcfbd7299ee9cc9b57d7.

Fixes: f7fe64ad0f22 ("drm/sched: Split free_job into own work item")
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
This is a regression introduced in 6.8-rc1, bisected from 6.7.
This revert done on top of 6.8-rc1 fixes the issue.

I'm happy to gather any data to use to properly debug if that is
preferable to a revert.
---
 drivers/gpu/drm/scheduler/sched_main.c | 133 +++++++++----------------
 include/drm/gpu_scheduler.h            |   4 +-
 2 files changed, 48 insertions(+), 89 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 550492a7a031..91c96ab53fb5 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -369,32 +369,6 @@ static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
 		queue_work(sched->submit_wq, &sched->work_run_job);
 }
 
-/**
- * __drm_sched_run_free_queue - enqueue free-job work
- * @sched: scheduler instance
- */
-static void __drm_sched_run_free_queue(struct drm_gpu_scheduler *sched)
-{
-	if (!READ_ONCE(sched->pause_submit))
-		queue_work(sched->submit_wq, &sched->work_free_job);
-}
-
-/**
- * drm_sched_run_free_queue - enqueue free-job work if ready
- * @sched: scheduler instance
- */
-static void drm_sched_run_free_queue(struct drm_gpu_scheduler *sched)
-{
-	struct drm_sched_job *job;
-
-	spin_lock(&sched->job_list_lock);
-	job = list_first_entry_or_null(&sched->pending_list,
-				       struct drm_sched_job, list);
-	if (job && dma_fence_is_signaled(&job->s_fence->finished))
-		__drm_sched_run_free_queue(sched);
-	spin_unlock(&sched->job_list_lock);
-}
-
 /**
  * drm_sched_job_done - complete a job
  * @s_job: pointer to the job which is done
@@ -414,7 +388,7 @@ static void drm_sched_job_done(struct drm_sched_job *s_job, int result)
 	dma_fence_get(&s_fence->finished);
 	drm_sched_fence_finished(s_fence, result);
 	dma_fence_put(&s_fence->finished);
-	__drm_sched_run_free_queue(sched);
+	drm_sched_run_job_queue(sched);
 }
 
 /**
@@ -1092,10 +1066,8 @@ drm_sched_get_finished_job(struct drm_gpu_scheduler *sched)
 						typeof(*next), list);
 
 		if (next) {
-			if (test_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT,
-				     &next->s_fence->scheduled.flags))
-				next->s_fence->scheduled.timestamp =
-					dma_fence_timestamp(&job->s_fence->finished);
+			next->s_fence->scheduled.timestamp =
+				dma_fence_timestamp(&job->s_fence->finished);
 			/* start TO timer for next job */
 			drm_sched_start_timeout(sched);
 		}
@@ -1145,29 +1117,7 @@ drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
 EXPORT_SYMBOL(drm_sched_pick_best);
 
 /**
- * drm_sched_free_job_work - worker to call free_job
- *
- * @w: free job work
- */
-static void drm_sched_free_job_work(struct work_struct *w)
-{
-	struct drm_gpu_scheduler *sched =
-		container_of(w, struct drm_gpu_scheduler, work_free_job);
-	struct drm_sched_job *job;
-
-	if (READ_ONCE(sched->pause_submit))
-		return;
-
-	job = drm_sched_get_finished_job(sched);
-	if (job)
-		sched->ops->free_job(job);
-
-	drm_sched_run_free_queue(sched);
-	drm_sched_run_job_queue(sched);
-}
-
-/**
- * drm_sched_run_job_work - worker to call run_job
+ * drm_sched_run_job_work - main scheduler thread
  *
  * @w: run job work
  */
@@ -1176,50 +1126,64 @@ static void drm_sched_run_job_work(struct work_struct *w)
 	struct drm_gpu_scheduler *sched =
 		container_of(w, struct drm_gpu_scheduler, work_run_job);
 	struct drm_sched_entity *entity;
-	struct dma_fence *fence;
-	struct drm_sched_fence *s_fence;
-	struct drm_sched_job *sched_job;
+	struct drm_sched_job *cleanup_job;
 	int r;
 
 	if (READ_ONCE(sched->pause_submit))
 		return;
 
+	cleanup_job = drm_sched_get_finished_job(sched);
 	entity = drm_sched_select_entity(sched);
-	if (!entity)
-		return;
 
-	sched_job = drm_sched_entity_pop_job(entity);
-	if (!sched_job) {
-		complete_all(&entity->entity_idle);
+	if (!entity && !cleanup_job)
 		return;	/* No more work */
-	}
 
-	s_fence = sched_job->s_fence;
+	if (cleanup_job)
+		sched->ops->free_job(cleanup_job);
 
-	atomic_add(sched_job->credits, &sched->credit_count);
-	drm_sched_job_begin(sched_job);
+	if (entity) {
+		struct dma_fence *fence;
+		struct drm_sched_fence *s_fence;
+		struct drm_sched_job *sched_job;
+
+		sched_job = drm_sched_entity_pop_job(entity);
+		if (!sched_job) {
+			complete_all(&entity->entity_idle);
+			if (!cleanup_job)
+				return;	/* No more work */
+			goto again;
+		}
 
-	trace_drm_run_job(sched_job, entity);
-	fence = sched->ops->run_job(sched_job);
-	complete_all(&entity->entity_idle);
-	drm_sched_fence_scheduled(s_fence, fence);
+		s_fence = sched_job->s_fence;
 
-	if (!IS_ERR_OR_NULL(fence)) {
-		/* Drop for original kref_init of the fence */
-		dma_fence_put(fence);
+		atomic_inc(&sched->credit_count);
+		drm_sched_job_begin(sched_job);
 
-		r = dma_fence_add_callback(fence, &sched_job->cb,
-					   drm_sched_job_done_cb);
-		if (r == -ENOENT)
-			drm_sched_job_done(sched_job, fence->error);
-		else if (r)
-			DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n", r);
-	} else {
-		drm_sched_job_done(sched_job, IS_ERR(fence) ?
-				   PTR_ERR(fence) : 0);
+		trace_drm_run_job(sched_job, entity);
+		fence = sched->ops->run_job(sched_job);
+		complete_all(&entity->entity_idle);
+		drm_sched_fence_scheduled(s_fence, fence);
+
+		if (!IS_ERR_OR_NULL(fence)) {
+			/* Drop for original kref_init of the fence */
+			dma_fence_put(fence);
+
+			r = dma_fence_add_callback(fence, &sched_job->cb,
+						   drm_sched_job_done_cb);
+			if (r == -ENOENT)
+				drm_sched_job_done(sched_job, fence->error);
+			else if (r)
+				DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n",
+					  r);
+		} else {
+			drm_sched_job_done(sched_job, IS_ERR(fence) ?
+					   PTR_ERR(fence) : 0);
+		}
+
+		wake_up(&sched->job_scheduled);
 	}
 
-	wake_up(&sched->job_scheduled);
+again:
 	drm_sched_run_job_queue(sched);
 }
 
@@ -1304,7 +1268,6 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 	atomic_set(&sched->credit_count, 0);
 	INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
 	INIT_WORK(&sched->work_run_job, drm_sched_run_job_work);
-	INIT_WORK(&sched->work_free_job, drm_sched_free_job_work);
 	atomic_set(&sched->_score, 0);
 	atomic64_set(&sched->job_id_count, 0);
 	sched->pause_submit = false;
@@ -1432,7 +1395,6 @@ void drm_sched_wqueue_stop(struct drm_gpu_scheduler *sched)
 {
 	WRITE_ONCE(sched->pause_submit, true);
 	cancel_work_sync(&sched->work_run_job);
-	cancel_work_sync(&sched->work_free_job);
 }
 EXPORT_SYMBOL(drm_sched_wqueue_stop);
 
@@ -1445,6 +1407,5 @@ void drm_sched_wqueue_start(struct drm_gpu_scheduler *sched)
 {
 	WRITE_ONCE(sched->pause_submit, false);
 	queue_work(sched->submit_wq, &sched->work_run_job);
-	queue_work(sched->submit_wq, &sched->work_free_job);
 }
 EXPORT_SYMBOL(drm_sched_wqueue_start);
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 5acc64954a88..72f64bd0a6eb 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -495,10 +495,9 @@ struct drm_sched_backend_ops {
  *                 waits on this wait queue until all the scheduled jobs are
  *                 finished.
  * @job_id_count: used to assign unique id to the each job.
- * @submit_wq: workqueue used to queue @work_run_job and @work_free_job
+ * @submit_wq: workqueue used to queue @work_run_job
  * @timeout_wq: workqueue used to queue @work_tdr
  * @work_run_job: work which calls run_job op of each scheduler.
- * @work_free_job: work which calls free_job op of each scheduler.
  * @work_tdr: schedules a delayed call to @drm_sched_job_timedout after the
  *            timeout interval is over.
  * @pending_list: the list of jobs which are currently in the job queue.
@@ -528,7 +527,6 @@ struct drm_gpu_scheduler {
 	struct workqueue_struct		*submit_wq;
 	struct workqueue_struct		*timeout_wq;
 	struct work_struct		work_run_job;
-	struct work_struct		work_free_job;
 	struct delayed_work		work_tdr;
 	struct list_head		pending_list;
 	spinlock_t			job_list_lock;
-- 
2.34.1

