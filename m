Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 704695EFD5A
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 20:46:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96EE210EC28;
	Thu, 29 Sep 2022 18:46:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2054.outbound.protection.outlook.com [40.107.244.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC9D010EC28;
 Thu, 29 Sep 2022 18:46:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VBZ46bbPan8qLZooTFynI24JlQwni0css+Fd24pTR4So2no+NeHIsyQh7lB6eQaRlt9NVhmLpAn5LVpYC+GA60fzfzwD1lyEmYHit0IR1J24rLWdb628UXoK+4dHE75qONPgZ8tTKB98W+mQTNX01qSUcTJrHVlp9RtOSSo4+NaW9bgUwwbgCFwKYLfoOQyeGrzP5d+adIVw1H3g10x6HNWDVeqc9HACG+yJ03rLtl6aPqqPz0ENgkc7HSGSctCXZB/JkawsKoDtzbu2LeA+ADbzl0M45Q+gljQWvFIPqhLubs0PzRpzOEjnm0XN4TJb7V2sLgVkw94Feiiqb6EnaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jOaKMWR4w1T7S7N/9jmB+5wZFQmgVUD9SJOlBY/M8Ec=;
 b=V16do3YTwMiHrkhZ0O2hzA+c9Pv6TAt6zZln9/JL21VDbkTf6EyFsFAlD2DjmpclAH6Ph5XHI3ZuPMqns1MRrdgRT8RIa1S8s44upg3TP3E0SGvPMOQddEufRcdCAagkxsjMFlrG0eRdU1Yy/Iu7OIVVWeHUhzlFQm67CoqfA2+Or9DnyVbdh6uixpDGfBs5rXq27JCA4EPAgEWPKWAbDFXDnLRnVPntYOZ0p0bWOvNrUzSTDcb6/qT9FBsN+um4Mtq6S/LGk7Awk8MUsjLBJl3YZYFwRTSJ65yaGISxITn//9mD9wq8TnhCEoiDULYeCcrncwVwmVv4A/1J0EnAYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jOaKMWR4w1T7S7N/9jmB+5wZFQmgVUD9SJOlBY/M8Ec=;
 b=quHDncL0WMfWB4mlAw6xbNl3wi0/KgrcCsz7h8ERsvTETQJUpKt8qbpj90OZNq+gM36/dmVBAuj/qn9p+IUGxIbd89HqFBjxmIyix5rfK6vbOuYFXvZuaBSmIhe4+iHYePFlkjLVjpRkidE0GOmhAhVoYd1MfEWrLzlKjKVjnMY=
Received: from DM6PR08CA0001.namprd08.prod.outlook.com (2603:10b6:5:80::14) by
 BY5PR12MB4180.namprd12.prod.outlook.com (2603:10b6:a03:213::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Thu, 29 Sep
 2022 18:46:26 +0000
Received: from DM6NAM11FT080.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:80:cafe::a5) by DM6PR08CA0001.outlook.office365.com
 (2603:10b6:5:80::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25 via Frontend
 Transport; Thu, 29 Sep 2022 18:46:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT080.mail.protection.outlook.com (10.13.173.105) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5676.17 via Frontend Transport; Thu, 29 Sep 2022 18:46:26 +0000
Received: from fedora.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 29 Sep
 2022 13:46:24 -0500
From: Luben Tuikov <luben.tuikov@amd.com>
To: Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/sched: Add FIFO sched policy to run queue
Date: Thu, 29 Sep 2022 14:46:05 -0400
Message-ID: <20220929184605.890379-1-luben.tuikov@amd.com>
X-Mailer: git-send-email 2.36.1.74.g277cf0bc36
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-check-string-leak: v1.0
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT080:EE_|BY5PR12MB4180:EE_
X-MS-Office365-Filtering-Correlation-Id: e7ea0d16-8fd0-41cd-7c6f-08daa24ae9f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +0k7q6Snx+rzcDZwxJtqMO/xW3PTHfDt797ba5PDYrjDTh2IN5pJfYPcdbBXuHkDEtbqXE05cPM21Xidg12w2rC5UJ+9roJHC3bd3EwEsQXOHK56OTdOGsf5DrLtVvefNtQMZhmMR0ENMXVaCUnjTvFYBWoFHGUwDP2itrJHriHutuPCRSkMydfNdKFBl0v4tkV7RzaqlyUvyanxmJS9c6tjqjjD9K6udAE86UP5mD+c3h9Mw/g6nIKTeVf2bEnH+sZVvrE8AB7vkFX1yziKAPtUPYWMr2aapl60yciNAjFcDER90zGyRnb/nb6FPtwiQgH5LSieCq1L1otrxXA5TOt/WkAXVJD/fsmjPpQmQfe5C89MoXiYMMQxIFfDb0Te6hK5zmchJlIRVx2hsE5fCtUvalCiHAmzksPM1iVI4/qIZki/9errDD3XIu8+VXU5h6Ey8UT/adItiHM3LVYluOXFKPsIrSOEV4MsGV/ePLw/PFQ9dwCiOlK9W40InS+SeIq8etkskg3yoSkeSVCpZcT8OB/bY1zxRRBANBADDIUs14SnHvvCTycN5Qo9Mxj2Cv46cx4Mrg4uBCBvQLaQJXfU2JiKPQmVVUyzOW4HN+QPi0JRLug1Bb1gIefBQGH60HaMkS5/DEpP2vYeTqowMIDFrByb/Cm3s61UtKCiLY9yTWJvEI428EVnX8o9/wJTVq5YHfMW6Ojo0AAUUMOuzAnDW8+tZaUl7Gg47bNGou0Wi88pvykfiMHffD/0J2WlB0jXyDquCY1zKh6WelkxddXX/uArE6YMYWm7TF8LqzI=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(396003)(346002)(39860400002)(451199015)(36840700001)(40470700004)(46966006)(6916009)(82740400003)(54906003)(81166007)(356005)(316002)(2906002)(8936002)(36756003)(44832011)(40460700003)(70586007)(70206006)(4326008)(8676002)(450100002)(30864003)(5660300002)(41300700001)(26005)(36860700001)(16526019)(2616005)(336012)(478600001)(426003)(66574015)(6666004)(7696005)(83380400001)(186003)(40480700001)(82310400005)(47076005)(1076003)(86362001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 18:46:26.1671 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7ea0d16-8fd0-41cd-7c6f-08daa24ae9f2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT080.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4180
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
Cc: Yunxiang Li <Yunxiang.Li@amd.com>, Luben Tuikov <luben.tuikov@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 AMD Graphics <amd-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>

When many entities are competing for the same run queue
on the same scheduler, we observe an unusually long wait
times and some jobs get starved. This has been observed on GPUVis.

The issue is due to the Round Robin policy used by schedulers
to pick up the next entity's job queue for execution. Under stress
of many entities and long job queues within entity some
jobs could be stuck for very long time in it's entity's
queue before being popped from the queue and executed
while for other entities with smaller job queues a job
might execute earlier even though that job arrived later
then the job in the long queue.
   
Fix:
Add FIFO selection policy to entities in run queue, chose next entity
on run queue in such order that if job on one entity arrived
earlier then job on another entity the first job will start
executing earlier regardless of the length of the entity's job
queue.

v2:
Switch to rb tree structure for entities based on TS of
oldest job waiting in the job queue of an entity. Improves next
entity extraction to O(1). Entity TS update
O(log N) where N is the number of entities in the run-queue

Drop default option in module control parameter.

v3:
Various cosmetical fixes and minor refactoring of fifo update function. (Luben)

v4:
Switch drm_sched_rq_select_entity_fifo to in order search (Luben)

v5: Fix up drm_sched_rq_select_entity_fifo loop (Luben)

v6: Add missing drm_sched_rq_remove_fifo_locked

Cc: Luben Tuikov <luben.tuikov@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Direct Rendering Infrastructure - Development <dri-devel@lists.freedesktop.org>
Cc: AMD Graphics <amd-gfx@lists.freedesktop.org>
Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Tested-by: Yunxiang Li (Teddy) <Yunxiang.Li@amd.com>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 26 ++++++-
 drivers/gpu/drm/scheduler/sched_main.c   | 97 +++++++++++++++++++++++-
 include/drm/gpu_scheduler.h              | 32 ++++++++
 3 files changed, 149 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 6b25b2f4f5a308..f3ffce3c9304d5 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -73,6 +73,7 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
 	entity->priority = priority;
 	entity->sched_list = num_sched_list > 1 ? sched_list : NULL;
 	entity->last_scheduled = NULL;
+	RB_CLEAR_NODE(&entity->rb_tree_node);
 
 	if(num_sched_list)
 		entity->rq = &sched_list[0]->sched_rq[entity->priority];
@@ -417,14 +418,16 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
 
 	sched_job = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
 	if (!sched_job)
-		return NULL;
+		goto skip;
 
 	while ((entity->dependency =
 			drm_sched_job_dependency(sched_job, entity))) {
 		trace_drm_sched_job_wait_dep(sched_job, entity->dependency);
 
-		if (drm_sched_entity_add_dependency_cb(entity))
-			return NULL;
+		if (drm_sched_entity_add_dependency_cb(entity)) {
+			sched_job = NULL;
+			goto skip;
+		}
 	}
 
 	/* skip jobs from entity that marked guilty */
@@ -443,6 +446,16 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
 	smp_wmb();
 
 	spsc_queue_pop(&entity->job_queue);
+
+	/*
+	 * It's when head job is extracted we can access the next job (or empty)
+	 * queue and update the entity location in the min heap accordingly.
+	 */
+skip:
+	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
+		drm_sched_rq_update_fifo(entity,
+					 (sched_job ? sched_job->submit_ts : ktime_get()));
+
 	return sched_job;
 }
 
@@ -502,11 +515,13 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 {
 	struct drm_sched_entity *entity = sched_job->entity;
 	bool first;
+	ktime_t ts =  ktime_get();
 
 	trace_drm_sched_job(sched_job, entity);
 	atomic_inc(entity->rq->sched->score);
 	WRITE_ONCE(entity->last_user, current->group_leader);
 	first = spsc_queue_push(&entity->job_queue, &sched_job->queue_node);
+	sched_job->submit_ts = ts;
 
 	/* first job wakes up scheduler */
 	if (first) {
@@ -518,8 +533,13 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 			DRM_ERROR("Trying to push to a killed entity\n");
 			return;
 		}
+
 		drm_sched_rq_add_entity(entity->rq, entity);
 		spin_unlock(&entity->rq_lock);
+
+		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
+			drm_sched_rq_update_fifo(entity, ts);
+
 		drm_sched_wakeup(entity->rq->sched);
 	}
 }
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 4f2395d1a79182..a16495f4997410 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -62,6 +62,56 @@
 #define to_drm_sched_job(sched_job)		\
 		container_of((sched_job), struct drm_sched_job, queue_node)
 
+int drm_sched_policy = DRM_SCHED_POLICY_RR;
+
+/**
+ * DOC: sched_policy (int)
+ * Used to override default entities scheduling policy in a run queue.
+ */
+MODULE_PARM_DESC(sched_policy,
+		 "specify schedule policy for entities on a runqueue (DRM_SCHED_POLICY_RR = Round Robin (default), DRM_SCHED_POLICY_FIFO  = use FIFO");
+module_param_named(sched_policy, drm_sched_policy, int, 0444);
+
+static __always_inline bool drm_sched_entity_compare_before(struct rb_node *a,
+							    const struct rb_node *b)
+{
+	struct drm_sched_entity *ent_a =  rb_entry((a), struct drm_sched_entity, rb_tree_node);
+	struct drm_sched_entity *ent_b =  rb_entry((b), struct drm_sched_entity, rb_tree_node);
+
+	return ktime_before(ent_a->oldest_job_waiting, ent_b->oldest_job_waiting);
+}
+
+static inline void drm_sched_rq_remove_fifo_locked(struct drm_sched_entity *entity)
+{
+	struct drm_sched_rq *rq = entity->rq;
+
+	if (!RB_EMPTY_NODE(&entity->rb_tree_node)) {
+		rb_erase_cached(&entity->rb_tree_node, &rq->rb_tree_root);
+		RB_CLEAR_NODE(&entity->rb_tree_node);
+	}
+}
+
+void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, ktime_t ts)
+{
+	/*
+	 * Both locks need to be grabbed, one to protect from entity->rq change
+	 * for entity from within concurrent drm_sched_entity_select_rq and the
+	 * other to update the rb tree structure.
+	 */
+	spin_lock(&entity->rq_lock);
+	spin_lock(&entity->rq->lock);
+
+	drm_sched_rq_remove_fifo_locked(entity);
+
+	entity->oldest_job_waiting = ts;
+
+	rb_add_cached(&entity->rb_tree_node, &entity->rq->rb_tree_root,
+		      drm_sched_entity_compare_before);
+
+	spin_unlock(&entity->rq->lock);
+	spin_unlock(&entity->rq_lock);
+}
+
 /**
  * drm_sched_rq_init - initialize a given run queue struct
  *
@@ -75,6 +125,7 @@ static void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
 {
 	spin_lock_init(&rq->lock);
 	INIT_LIST_HEAD(&rq->entities);
+	rq->rb_tree_root = RB_ROOT_CACHED;
 	rq->current_entity = NULL;
 	rq->sched = sched;
 }
@@ -92,9 +143,12 @@ void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
 {
 	if (!list_empty(&entity->list))
 		return;
+
 	spin_lock(&rq->lock);
+
 	atomic_inc(rq->sched->score);
 	list_add_tail(&entity->list, &rq->entities);
+
 	spin_unlock(&rq->lock);
 }
 
@@ -111,23 +165,30 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
 {
 	if (list_empty(&entity->list))
 		return;
+
 	spin_lock(&rq->lock);
+
 	atomic_dec(rq->sched->score);
 	list_del_init(&entity->list);
+
 	if (rq->current_entity == entity)
 		rq->current_entity = NULL;
+
+	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
+		drm_sched_rq_remove_fifo_locked(entity);
+
 	spin_unlock(&rq->lock);
 }
 
 /**
- * drm_sched_rq_select_entity - Select an entity which could provide a job to run
+ * drm_sched_rq_select_entity_rr - Select an entity which could provide a job to run
  *
  * @rq: scheduler run queue to check.
  *
  * Try to find a ready entity, returns NULL if none found.
  */
 static struct drm_sched_entity *
-drm_sched_rq_select_entity(struct drm_sched_rq *rq)
+drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
 {
 	struct drm_sched_entity *entity;
 
@@ -163,6 +224,34 @@ drm_sched_rq_select_entity(struct drm_sched_rq *rq)
 	return NULL;
 }
 
+/**
+ * drm_sched_rq_select_entity_fifo - Select an entity which provides a job to run
+ *
+ * @rq: scheduler run queue to check.
+ *
+ * Find oldest waiting ready entity, returns NULL if none found.
+ */
+static struct drm_sched_entity *
+drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
+{
+	struct rb_node *rb;
+
+	spin_lock(&rq->lock);
+	for (rb = rb_first_cached(&rq->rb_tree_root); rb; rb = rb_next(rb)) {
+		struct drm_sched_entity *entity;
+
+		entity = rb_entry(rb, struct drm_sched_entity, rb_tree_node);
+		if (drm_sched_entity_is_ready(entity)) {
+			rq->current_entity = entity;
+			reinit_completion(&entity->entity_idle);
+			break;
+		}
+	}
+	spin_unlock(&rq->lock);
+
+	return rb ? rb_entry(rb, struct drm_sched_entity, rb_tree_node) : NULL;
+}
+
 /**
  * drm_sched_job_done - complete a job
  * @s_job: pointer to the job which is done
@@ -803,7 +892,9 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
 
 	/* Kernel run queue has higher priority than normal run queue*/
 	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
-		entity = drm_sched_rq_select_entity(&sched->sched_rq[i]);
+		entity = drm_sched_policy != DRM_SCHED_POLICY_FIFO ?
+				drm_sched_rq_select_entity_rr(&sched->sched_rq[i]) :
+				drm_sched_rq_select_entity_fifo(&sched->sched_rq[i]);
 		if (entity)
 			break;
 	}
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 599855c6a6727b..1f7d9dd1a44484 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -50,6 +50,12 @@ enum drm_sched_priority {
 	DRM_SCHED_PRIORITY_UNSET = -2
 };
 
+/* Used to chose between FIFO and RR jobs scheduling */
+extern int drm_sched_policy;
+
+#define DRM_SCHED_POLICY_RR    0
+#define DRM_SCHED_POLICY_FIFO  1
+
 /**
  * struct drm_sched_entity - A wrapper around a job queue (typically
  * attached to the DRM file_priv).
@@ -196,6 +202,21 @@ struct drm_sched_entity {
 	 * drm_sched_entity_fini().
 	 */
 	struct completion		entity_idle;
+
+	/**
+	 * @oldest_job_waiting:
+	 *
+	 * Marks earliest job waiting in SW queue
+	 */
+	ktime_t				oldest_job_waiting;
+
+	/**
+	 * @rb_tree_node:
+	 *
+	 * The node used to insert this entity into time based priority queue
+	 */
+	struct rb_node			rb_tree_node;
+
 };
 
 /**
@@ -205,6 +226,7 @@ struct drm_sched_entity {
  * @sched: the scheduler to which this rq belongs to.
  * @entities: list of the entities to be scheduled.
  * @current_entity: the entity which is to be scheduled.
+ * @rb_tree_root: root of time based priory queue of entities for FIFO scheduling
  *
  * Run queue is a set of entities scheduling command submissions for
  * one specific ring. It implements the scheduling policy that selects
@@ -215,6 +237,7 @@ struct drm_sched_rq {
 	struct drm_gpu_scheduler	*sched;
 	struct list_head		entities;
 	struct drm_sched_entity		*current_entity;
+	struct rb_root_cached		rb_tree_root;
 };
 
 /**
@@ -314,6 +337,13 @@ struct drm_sched_job {
 
 	/** @last_dependency: tracks @dependencies as they signal */
 	unsigned long			last_dependency;
+
+	/**
+	 * @submit_ts:
+	 *
+	 * When the job was pushed into the entity queue.
+	 */
+	ktime_t                         submit_ts;
 };
 
 static inline bool drm_sched_invalidate_job(struct drm_sched_job *s_job,
@@ -503,6 +533,8 @@ void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
 void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
 				struct drm_sched_entity *entity);
 
+void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, ktime_t ts);
+
 int drm_sched_entity_init(struct drm_sched_entity *entity,
 			  enum drm_sched_priority priority,
 			  struct drm_gpu_scheduler **sched_list,

base-commit: 2ab69739209c843a47af82c0620036b233c83688
-- 
2.36.1.74.g277cf0bc36

