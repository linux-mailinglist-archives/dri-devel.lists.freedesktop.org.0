Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C97B62C3789
	for <lists+dri-devel@lfdr.de>; Wed, 25 Nov 2020 04:17:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 310226E7F1;
	Wed, 25 Nov 2020 03:17:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2075.outbound.protection.outlook.com [40.107.236.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 094D66E819;
 Wed, 25 Nov 2020 03:17:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AoA7DAa0p1SjvjW7tojNHmlV7mnecSNI1G/RW3N1lNI75A8uJvV8jP1Ucq+orNMXFswKkgBDmSlSxkNHac3Yw5yepRBYr1G1WW0WV3Y/nqgXm9iWg7wQAtVMnFOZRslkTl84tQ5+AhLOJ0H58Til79URcV1q9M0VeDwQjFMrtrbHjPdNhU/fr47beDtposEfGlpqQ6YSSCzhtpAtbHETTB3X9EPM6lGs+nk/gsDkBRroYgSShLxNn7Xx5gyTLg/w470N3XG0kLKF+mIxCc3TNQxpJU5NGsthRkxT2/fUafCtQkkRHKGzmf0S2T85t+7oh6ekD9ZijzZo7bh8dOn5fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FJZVaJvCAeO9P2IRRtQEfR9kE80YiiNZekWRrrpqqY4=;
 b=i5fjaU+17CFLJmMDPDXK51uGvjnYDRjzlL/GZOaPdHrzrc1OWBR2pDvIU0jXLAUPfk5lgD/vqiBVXk406U6VMgvV7RP+EY7+lSXcXsl37ryVJJz6WmH/FTipNBQD/ntdHq2KeUox9EyhdM/Kpnvbv3kY4XcX4zerE4tnizrcEFMg+YKh/v5Nr2aoh3udBF7jaB6GpcbGukeoV0s3rG3QWpu9nQhsJ1oQSnTiQdlLy0w6K1ZnCt2NUWX/mAmduwitMqmEnrKcJvsdWgsjuEWjlOELqDyjEYlbRSFWBfpN+YsH42Yab6fhR4y1SwqUqhn/PKu9zNtYnJ6yi8fbghnMZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FJZVaJvCAeO9P2IRRtQEfR9kE80YiiNZekWRrrpqqY4=;
 b=Yr/+4APx5eIsAfm0j0W2F9dQlJR1XfLtEnYDISCbcrgG0aVIiVwAnr95GtUTBWNuT/0+T1IFCz46+5NbNbrn6z/+1tPjZ+HKBVbNQGIkAuumjleV2Lyk1TwC++zKifuc7tf+H+8EDxnpV8Zpm0G4n7Cdri53rnFCx8ytIXo27QU=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3962.namprd12.prod.outlook.com (2603:10b6:5:1ce::21)
 by DM5PR1201MB2507.namprd12.prod.outlook.com (2603:10b6:3:e9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.30; Wed, 25 Nov
 2020 03:17:26 +0000
Received: from DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::d055:19dc:5b0f:ed56]) by DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::d055:19dc:5b0f:ed56%6]) with mapi id 15.20.3589.031; Wed, 25 Nov 2020
 03:17:26 +0000
From: Luben Tuikov <luben.tuikov@amd.com>
To: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Alexander Deucher <Alexander.Deucher@amd.com>
Subject: [PATCH 6/6] drm/sched: Make use of a "done" thread
Date: Tue, 24 Nov 2020 22:17:08 -0500
Message-Id: <20201125031708.6433-7-luben.tuikov@amd.com>
X-Mailer: git-send-email 2.29.2.154.g7f7ebe054a
In-Reply-To: <20201125031708.6433-1-luben.tuikov@amd.com>
References: <769e72ee-b2d0-d75f-cc83-a85be08e231b@amd.com>
 <20201125031708.6433-1-luben.tuikov@amd.com>
X-Originating-IP: [165.204.55.250]
X-ClientProxiedBy: CH2PR03CA0026.namprd03.prod.outlook.com
 (2603:10b6:610:59::36) To DM6PR12MB3962.namprd12.prod.outlook.com
 (2603:10b6:5:1ce::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain.amd.com (165.204.55.250) by
 CH2PR03CA0026.namprd03.prod.outlook.com (2603:10b6:610:59::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.20 via Frontend Transport; Wed, 25 Nov 2020 03:17:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3a6d6e37-2e45-4421-8f2b-08d890f0a22d
X-MS-TrafficTypeDiagnostic: DM5PR1201MB2507:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR1201MB2507AE250496EE5D91CAD4B499FA0@DM5PR1201MB2507.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:159;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RbVKRFuTYQRcYSlFNRmobB0LP6OP+GErEvKwsLAOz7zgKNSg5ciKUbIVj6ZtRyXZt0LKo+lWwOa1fQAmezqjWqS0CJzkTTOs++ftUCGVGcXAe8VdJQvyHfpQ50niCQJprtBEf73MNJXPRCzL8x0qxcBLevFlxCTUcl8Py5gVLgIuxGp0AhN4Jt+D/+tiaaQAEAZ13xbmpmQdxd99Eo2X3Y+LVcFhtmFJ6FuxehrKO6T8tWSjLZjeShnk7WsQWjU9fEyDt2N60OdX9hI6jOQj8E2F7zpghGCsLnNlgyyj6ZG/V8RpcAK7lvFC9AcgCdsv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3962.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(136003)(346002)(39860400002)(396003)(7696005)(6486002)(54906003)(478600001)(26005)(52116002)(8936002)(30864003)(83380400001)(8676002)(86362001)(2616005)(6636002)(5660300002)(956004)(1076003)(4326008)(2906002)(44832011)(186003)(66946007)(110136005)(316002)(36756003)(66476007)(16526019)(6666004)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: KxjW11ys45qQ0gwJK/ISFbvheFIVMIxJklVHg3VC5x0wwCgZyDb0uwbOyub2AinGeULmVROv8HoyV+IKm6An3uD23m8N+LXaj1uHAoebTEeLhyjn/RvBz0GESBzfITOgh+RO1+RM9kt7c4AWtUVibUwHlIMXbApl8dZsJ4otouTUSZo1SfmUY3xK+vZCSyz6A8YBo63qVCWsG8tNBGscDqUNW3dIRWcbIOo2kthZ9BY4rvl5sjrYBt3xJ0cHjrtKwdZjE4aWD6pOEbQ08NRMgj8IlxLLS2q3RvnhotUfOQEqXEkINy6+kHPXKIe/vm8mRI/cBHZAEw1hhJ7MnefYCamejWSs+osvagKCHflYBPRefZ8O+UPZ5ofXT5SlN1k4BFgoqlAGHWXW754NuI0KjE5/hxOXT8E1qqRpaQvnTYzj8ftTenEbJuYWXqdzESHqPFrMVTsUgag/pk7X7i19/5O+q5isTLvL6hgncYuLqrs7C2q7P3sMRWY4c5Fnt/MRp5eJdH6uOL/yF/y9RO9/EdDP6EIs5TNK4RVapGwQxrc30Ha++yP88BExIRe/qlARwXeHccbZ/X3VTiscjVfrLeUZnkGk8Mzb2v+K+r4mL/bVeG6wys6aWGXa6OaY8WTWupJu15VsSUP0jHbE4wZsdKsN53lPUow0q/4WmqB1Wab614fvrrwasK6gAI0GuBP7irC3wMSE+MEsHxAQQpgHkrUomd+/Ed3+H9nQg7yifTDMLz37D2Er4b9hnOb4S8Q0336Vyn+lpP/h33e/Ru7ncNm+7uN4CPTWBwNNufyupMX9aePqYzGvCEW4eMWXCrbnWlTmur+v4AYO0832e+r2mQ2o5D7aTWh5jTt/6RGjp/0lJ3ftu6r4g4GHH2ob1PlFvJdOwY/5SihytisSB4noqA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a6d6e37-2e45-4421-8f2b-08d890f0a22d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3962.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2020 03:17:26.2479 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p19oLu7LHrEanmssGl8/2iVae7zYSz7mpZQht/z+pOyxTtC9hrXMyv1wTiXAe+ac
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB2507
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
Cc: Emily Deng <Emily.Deng@amd.com>, Luben Tuikov <luben.tuikov@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 steven.price@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a "done" list to which all completed jobs are added
to be freed. The drm_sched_job_done() callback is the
producer of jobs to this list.

Add a "done" thread which consumes from the done list
and frees up jobs. Now, the main scheduler thread only
pushes jobs to the GPU and the "done" thread frees them
up, on the way out of the GPU when they've completed
execution.

Make use of the status returned by the GPU driver
timeout handler to decide whether to leave the job in
the pending list, or to send it off to the done list.
If a job is done, it is added to the done list and the
done thread woken up. If a job needs more time, it is
left on the pending list and the timeout timer
restarted.

Eliminate the polling mechanism of picking out done
jobs from the pending list, i.e. eliminate
drm_sched_get_cleanup_job(). Now the main scheduler
thread only pushes jobs down to the GPU.

Various other optimizations to the GPU scheduler
and job recovery are possible with this format.

Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 173 +++++++++++++------------
 include/drm/gpu_scheduler.h            |  14 ++
 2 files changed, 101 insertions(+), 86 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 3eb7618a627d..289ae68cd97f 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -164,7 +164,8 @@ drm_sched_rq_select_entity(struct drm_sched_rq *rq)
  * drm_sched_job_done - complete a job
  * @s_job: pointer to the job which is done
  *
- * Finish the job's fence and wake up the worker thread.
+ * Finish the job's fence, move it to the done list,
+ * and wake up the done thread.
  */
 static void drm_sched_job_done(struct drm_sched_job *s_job)
 {
@@ -179,7 +180,12 @@ static void drm_sched_job_done(struct drm_sched_job *s_job)
 	dma_fence_get(&s_fence->finished);
 	drm_sched_fence_finished(s_fence);
 	dma_fence_put(&s_fence->finished);
-	wake_up_interruptible(&sched->wake_up_worker);
+
+	spin_lock(&sched->job_list_lock);
+	list_move(&s_job->list, &sched->done_list);
+	spin_unlock(&sched->job_list_lock);
+
+	wake_up_interruptible(&sched->done_wait_q);
 }
 
 /**
@@ -221,11 +227,10 @@ bool drm_sched_dependency_optimized(struct dma_fence* fence,
 EXPORT_SYMBOL(drm_sched_dependency_optimized);
 
 /**
- * drm_sched_start_timeout - start timeout for reset worker
- *
- * @sched: scheduler instance to start the worker for
+ * drm_sched_start_timeout - start a timeout timer
+ * @sched: scheduler instance whose job we're timing
  *
- * Start the timeout for the given scheduler.
+ * Start a timeout timer for the given scheduler.
  */
 static void drm_sched_start_timeout(struct drm_gpu_scheduler *sched)
 {
@@ -305,8 +310,8 @@ static void drm_sched_job_begin(struct drm_sched_job *s_job)
 
 	spin_lock(&sched->job_list_lock);
 	list_add_tail(&s_job->list, &sched->pending_list);
-	drm_sched_start_timeout(sched);
 	spin_unlock(&sched->job_list_lock);
+	drm_sched_start_timeout(sched);
 }
 
 static void drm_sched_job_timedout(struct work_struct *work)
@@ -316,37 +321,30 @@ static void drm_sched_job_timedout(struct work_struct *work)
 
 	sched = container_of(work, struct drm_gpu_scheduler, work_tdr.work);
 
-	/* Protects against concurrent deletion in drm_sched_get_cleanup_job */
 	spin_lock(&sched->job_list_lock);
 	job = list_first_entry_or_null(&sched->pending_list,
 				       struct drm_sched_job, list);
+	spin_unlock(&sched->job_list_lock);
 
 	if (job) {
-		/*
-		 * Remove the bad job so it cannot be freed by concurrent
-		 * drm_sched_cleanup_jobs. It will be reinserted back after sched->thread
-		 * is parked at which point it's safe.
-		 */
-		list_del_init(&job->list);
-		spin_unlock(&sched->job_list_lock);
+		int res;
 
-		job->sched->ops->timedout_job(job);
+		job->job_status |= DRM_JOB_STATUS_TIMEOUT;
+		res = job->sched->ops->timedout_job(job);
+		if (res == 0) {
+			/* The job is out of the device.
+			 */
+			spin_lock(&sched->job_list_lock);
+			list_move(&job->list, &sched->done_list);
+			spin_unlock(&sched->job_list_lock);
 
-		/*
-		 * Guilty job did complete and hence needs to be manually removed
-		 * See drm_sched_stop doc.
-		 */
-		if (sched->free_guilty) {
-			job->sched->ops->free_job(job);
-			sched->free_guilty = false;
+			wake_up_interruptible(&sched->done_wait_q);
+		} else {
+			/* The job needs more time.
+			 */
+			drm_sched_start_timeout(sched);
 		}
-	} else {
-		spin_unlock(&sched->job_list_lock);
 	}
-
-	spin_lock(&sched->job_list_lock);
-	drm_sched_start_timeout(sched);
-	spin_unlock(&sched->job_list_lock);
 }
 
  /**
@@ -511,15 +509,13 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
 			else if (r)
 				DRM_ERROR("fence add callback failed (%d)\n",
 					  r);
-		} else
+		} else {
 			drm_sched_job_done(s_job);
+		}
 	}
 
-	if (full_recovery) {
-		spin_lock(&sched->job_list_lock);
+	if (full_recovery)
 		drm_sched_start_timeout(sched);
-		spin_unlock(&sched->job_list_lock);
-	}
 
 	kthread_unpark(sched->thread);
 }
@@ -667,47 +663,6 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
 	return entity;
 }
 
-/**
- * drm_sched_get_cleanup_job - fetch the next finished job to be destroyed
- *
- * @sched: scheduler instance
- *
- * Returns the next finished job from the pending list (if there is one)
- * ready for it to be destroyed.
- */
-static struct drm_sched_job *
-drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
-{
-	struct drm_sched_job *job;
-
-	/*
-	 * Don't destroy jobs while the timeout worker is running  OR thread
-	 * is being parked and hence assumed to not touch pending_list
-	 */
-	if ((sched->timeout != MAX_SCHEDULE_TIMEOUT &&
-	    !cancel_delayed_work(&sched->work_tdr)) ||
-	    kthread_should_park())
-		return NULL;
-
-	spin_lock(&sched->job_list_lock);
-
-	job = list_first_entry_or_null(&sched->pending_list,
-				       struct drm_sched_job, list);
-
-	if (job && dma_fence_is_signaled(&job->s_fence->finished)) {
-		/* remove job from pending_list */
-		list_del_init(&job->list);
-	} else {
-		job = NULL;
-		/* queue timeout for next job */
-		drm_sched_start_timeout(sched);
-	}
-
-	spin_unlock(&sched->job_list_lock);
-
-	return job;
-}
-
 /**
  * drm_sched_pick_best - Get a drm sched from a sched_list with the least load
  * @sched_list: list of drm_gpu_schedulers
@@ -761,6 +716,44 @@ static bool drm_sched_blocked(struct drm_gpu_scheduler *sched)
 	return false;
 }
 
+/**
+ * drm_sched_done - free done tasks
+ * @param: pointer to a scheduler instance
+ *
+ * Returns 0.
+ */
+static int drm_sched_done(void *param)
+{
+	struct drm_gpu_scheduler *sched = param;
+
+	do {
+		LIST_HEAD(done_q);
+
+		wait_event_interruptible(sched->done_wait_q,
+					 kthread_should_stop() ||
+					 !list_empty(&sched->done_list));
+
+		spin_lock(&sched->job_list_lock);
+		list_splice_init(&sched->done_list, &done_q);
+		spin_unlock(&sched->job_list_lock);
+
+		if (list_empty(&done_q))
+			continue;
+
+		while (!list_empty(&done_q)) {
+			struct drm_sched_job *job;
+
+			job = list_first_entry(&done_q,
+					       struct drm_sched_job,
+					       list);
+			list_del_init(&job->list);
+			sched->ops->free_job(job);
+		}
+	} while (!kthread_should_stop());
+
+	return 0;
+}
+
 /**
  * drm_sched_main - main scheduler thread
  *
@@ -770,7 +763,7 @@ static bool drm_sched_blocked(struct drm_gpu_scheduler *sched)
  */
 static int drm_sched_main(void *param)
 {
-	struct drm_gpu_scheduler *sched = (struct drm_gpu_scheduler *)param;
+	struct drm_gpu_scheduler *sched = param;
 	int r;
 
 	sched_set_fifo_low(current);
@@ -780,20 +773,12 @@ static int drm_sched_main(void *param)
 		struct drm_sched_fence *s_fence;
 		struct drm_sched_job *sched_job;
 		struct dma_fence *fence;
-		struct drm_sched_job *cleanup_job = NULL;
 
 		wait_event_interruptible(sched->wake_up_worker,
-					 (cleanup_job = drm_sched_get_cleanup_job(sched)) ||
 					 (!drm_sched_blocked(sched) &&
 					  (entity = drm_sched_select_entity(sched))) ||
 					 kthread_should_stop());
 
-		if (cleanup_job) {
-			sched->ops->free_job(cleanup_job);
-			/* queue timeout for next job */
-			drm_sched_start_timeout(sched);
-		}
-
 		if (!entity)
 			continue;
 
@@ -820,8 +805,7 @@ static int drm_sched_main(void *param)
 			if (r == -ENOENT)
 				drm_sched_job_done(sched_job);
 			else if (r)
-				DRM_ERROR("fence add callback failed (%d)\n",
-					  r);
+				DRM_ERROR("fence add callback failed (%d)\n", r);
 			dma_fence_put(fence);
 		} else {
 			if (IS_ERR(fence))
@@ -865,7 +849,9 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 
 	init_waitqueue_head(&sched->wake_up_worker);
 	init_waitqueue_head(&sched->job_scheduled);
+	init_waitqueue_head(&sched->done_wait_q);
 	INIT_LIST_HEAD(&sched->pending_list);
+	INIT_LIST_HEAD(&sched->done_list);
 	spin_lock_init(&sched->job_list_lock);
 	atomic_set(&sched->hw_rq_count, 0);
 	INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
@@ -881,6 +867,21 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 		return ret;
 	}
 
+	snprintf(sched->thread_done_name, DRM_THREAD_NAME_LEN, "%s%s",
+		 sched->name, "-done");
+	sched->thread_done_name[DRM_THREAD_NAME_LEN - 1] = '\0';
+	sched->thread_done = kthread_run(drm_sched_done, sched,
+					 sched->thread_done_name);
+	if (IS_ERR(sched->thread_done)) {
+		ret = kthread_stop(sched->thread);
+		if (!ret) {
+			/* free_kthread_struct(sched->thread); */
+			sched->thread = NULL;
+		}
+		DRM_ERROR("Failed to start thread %s", sched->thread_done_name);
+		return ret;
+	}
+
 	sched->ready = true;
 	return 0;
 }
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 3a5686c3b5e9..b282d6158b50 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -169,6 +169,12 @@ struct drm_sched_fence {
 
 struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f);
 
+enum drm_job_status {
+	DRM_JOB_STATUS_NONE    = 0 << 0,
+	DRM_JOB_STATUS_DONE    = 1 << 0,
+	DRM_JOB_STATUS_TIMEOUT = 1 << 1,
+};
+
 /**
  * struct drm_sched_job - A job to be run by an entity.
  *
@@ -198,6 +204,7 @@ struct drm_sched_job {
 	uint64_t			id;
 	atomic_t			karma;
 	enum drm_sched_priority		s_priority;
+	enum drm_job_status             job_status;
 	struct drm_sched_entity         *entity;
 	struct dma_fence_cb		cb;
 };
@@ -284,15 +291,22 @@ struct drm_gpu_scheduler {
 	uint32_t			hw_submission_limit;
 	long				timeout;
 	const char			*name;
+	char                            thread_done_name[DRM_THREAD_NAME_LEN];
+
 	struct drm_sched_rq		sched_rq[DRM_SCHED_PRIORITY_COUNT];
 	wait_queue_head_t		wake_up_worker;
 	wait_queue_head_t		job_scheduled;
+	wait_queue_head_t               done_wait_q;
 	atomic_t			hw_rq_count;
 	atomic64_t			job_id_count;
 	struct delayed_work		work_tdr;
 	struct task_struct		*thread;
+	struct task_struct		*thread_done;
+
 	struct list_head		pending_list;
+	struct list_head                done_list;
 	spinlock_t			job_list_lock;
+
 	int				hang_limit;
 	atomic_t                        score;
 	bool				ready;
-- 
2.29.2.154.g7f7ebe054a

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
